Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 957964A4C9F
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 17:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B44110E346;
	Mon, 31 Jan 2022 16:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856A210E325;
 Mon, 31 Jan 2022 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643648339; x=1675184339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ksryV8vqmKsvmvwPFlGDNbbcQZp4VVx7HpRxYTI5tKA=;
 b=BGIj3QpegtFqKok2I/7ZNzf/yFHWu9SlHydxBtjfQB2G2ZiwV09uXrPp
 qTJPGDeaBZs6tjwIUHdw7fXj8ks7OvHvcLJfKiFT9IHTQMuhAk8AKr4t3
 +onAGH9ELVlZwudRnYjIXIt0YhAUY+4RTeMDjkFDo5KScgu7UEqWks0mC
 3B/bNCIRN/kYFkgrqM7rrmxjDWAYpi3i+l3wgQ+LcQTiZfghXLEbxCmen
 fSyoSCuZu+TrqW0jbXGC6pCty35z3lQUvk8vV3+CWS985gbNgZyFNMGrZ
 r/Di2yge5IRy1oPzjke0y0WR6F1YNuNIi/KFKevV2lquoZaOCtBqAwG6m g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247275432"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; d="scan'208";a="247275432"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 08:58:58 -0800
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; d="scan'208";a="496986481"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2022 08:58:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/3] drm: Stop spamming log with drm_cache message
Date: Mon, 31 Jan 2022 08:59:24 -0800
Message-Id: <20220131165926.3230642-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131165926.3230642-1-lucas.demarchi@intel.com>
References: <20220131165926.3230642-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Only x86 and in some cases PPC have support added in drm_cache.c for the
clflush class of functions. However warning once is sufficient to taint
the log instead of spamming it with "Architecture has no drm_cache.c
support" every few millisecond. Switch to WARN_ONCE() so we still get
the log message, but only once, together with the warning. E.g:

	------------[ cut here ]------------
	Architecture has no drm_cache.c support
	WARNING: CPU: 80 PID: 888 at drivers/gpu/drm/drm_cache.c:139 drm_clflush_sg+0x40/0x50 [drm]
	...

v2 (Jani): use WARN_ONCE() and keep the message previously on pr_err()

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

v3: No changes from previous version, just submitting to the right
mailing list

 drivers/gpu/drm/drm_cache.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index f19d9acbe959..2c3fa5677f7e 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -112,8 +112,7 @@ drm_clflush_pages(struct page *pages[], unsigned long num_pages)
 		kunmap_atomic(page_virtual);
 	}
 #else
-	pr_err("Architecture has no drm_cache.c support\n");
-	WARN_ON_ONCE(1);
+	WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
 #endif
 }
 EXPORT_SYMBOL(drm_clflush_pages);
@@ -143,8 +142,7 @@ drm_clflush_sg(struct sg_table *st)
 	if (wbinvd_on_all_cpus())
 		pr_err("Timed out waiting for cache flush\n");
 #else
-	pr_err("Architecture has no drm_cache.c support\n");
-	WARN_ON_ONCE(1);
+	WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
 #endif
 }
 EXPORT_SYMBOL(drm_clflush_sg);
@@ -177,8 +175,7 @@ drm_clflush_virt_range(void *addr, unsigned long length)
 	if (wbinvd_on_all_cpus())
 		pr_err("Timed out waiting for cache flush\n");
 #else
-	pr_err("Architecture has no drm_cache.c support\n");
-	WARN_ON_ONCE(1);
+	WARN_ONCE(1, "Architecture has no drm_cache.c support\n");
 #endif
 }
 EXPORT_SYMBOL(drm_clflush_virt_range);
-- 
2.35.0


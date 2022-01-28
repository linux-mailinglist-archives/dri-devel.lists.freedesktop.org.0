Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA6F4A0027
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 19:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7891310EB05;
	Fri, 28 Jan 2022 18:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FD710EB05
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 18:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643394740; x=1674930740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EyUshJ7N9AmNjju/AthEoz9EsBeM3A7baLYVxSWJtd4=;
 b=L2I3UcQf0J5tQCpAY9wgIeIOpET3nnT6jKKxInl2Oz6S7tV3dXsjyXBX
 N1NAXK4Ug3VkOexWCYEiujl9GMhsQ1XsFjfncPy1dCyAaRh2R8cFhTINo
 1UU/iD4gbv+bnf7VBaiW7/tZStJ/8X1iqiQpB49jvhtUKqglZmBlGpeN9
 rz1rksgJ/T8CPbc2UNh3sWEc6juor1cmhdXjIx5pzVI4XpZAC95K9nc0m
 owRx+8CrXK8fkvmhJFe3Xtfvv5jojeChnGM/6eO61hgClhUn/OiQJ7Ma5
 5qIylhol67KElcfKqTxfQxcFEGHiT8yMdHRaCc//T2riohpklk7NW9ZFK A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="244774579"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="244774579"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:32:20 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="480828089"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 10:32:19 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: gfx-internal-devel@eclists.intel.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm: Stop spamming log with drm_cache message
Date: Fri, 28 Jan 2022 10:33:03 -0800
Message-Id: <20220128183305.3072999-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128183305.3072999-1-lucas.demarchi@intel.com>
References: <20220128183305.3072999-1-lucas.demarchi@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BA249C045
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 01:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4C110E450;
	Wed, 26 Jan 2022 00:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7A710E4AF;
 Wed, 26 Jan 2022 00:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643157792; x=1674693792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EHOHL0sNV81GcpZWCdyg2WCB8vwJlV8eoLIh8/yQ920=;
 b=ftQ7NpfnbSV9mEUIn111FzyBPfXgBnMutFp0GVXdh6EMR/o2MrskYNMt
 kUXNTdoywgo1oAWnbbd1NyhyRt304C7ABf1GOqXDdAjAhshD7dq1qY77o
 6zihZAQax4na+0z0KeSKx9FMN5ni6NIWaxqea3lbb5W8Qj5bTFAfy95h3
 nrhoFZ5oXmPnHgyZNTiwRa5iAU0caJjHpAXA6UYWAXIIWEncKE3Z7th9v
 jqUmLdsW5NSEq6Pm2j3f1IGzFudtw+hFgta0XiW1XJ1IDAmirNA9HRr1j
 zxDdIabi/PhaR0RflW2EvAMWqIepNIETnz71rhkHSAgn1hP19vD2CxZDR g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="309766310"
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="309766310"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 16:43:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,316,1635231600"; d="scan'208";a="563241478"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 16:43:11 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/3] drm: Stop spamming log with drm_cache message
Date: Tue, 25 Jan 2022 16:43:43 -0800
Message-Id: <20220126004345.1137674-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126004345.1137674-1-lucas.demarchi@intel.com>
References: <20220126004345.1137674-1-lucas.demarchi@intel.com>
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
support" every few millisecond.

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/drm_cache.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index f19d9acbe959..2d5a4c463a4f 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -112,7 +112,6 @@ drm_clflush_pages(struct page *pages[], unsigned long num_pages)
 		kunmap_atomic(page_virtual);
 	}
 #else
-	pr_err("Architecture has no drm_cache.c support\n");
 	WARN_ON_ONCE(1);
 #endif
 }
@@ -143,7 +142,6 @@ drm_clflush_sg(struct sg_table *st)
 	if (wbinvd_on_all_cpus())
 		pr_err("Timed out waiting for cache flush\n");
 #else
-	pr_err("Architecture has no drm_cache.c support\n");
 	WARN_ON_ONCE(1);
 #endif
 }
@@ -177,7 +175,6 @@ drm_clflush_virt_range(void *addr, unsigned long length)
 	if (wbinvd_on_all_cpus())
 		pr_err("Timed out waiting for cache flush\n");
 #else
-	pr_err("Architecture has no drm_cache.c support\n");
 	WARN_ON_ONCE(1);
 #endif
 }
-- 
2.34.1


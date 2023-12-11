Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5007780C2E4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 09:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A2ED10E34F;
	Mon, 11 Dec 2023 08:16:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC18610E34E;
 Mon, 11 Dec 2023 08:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702282592; x=1733818592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Xg+HVN3fSrRheCt23nGT/P5SDYSEh+IgdP59kfa3FkM=;
 b=aw8JYBrjHYVyNtPk0vEpa93f/tVuW1+LOF8LRu6QRwnhY9jbbDFtub7q
 DxRVEj1xPCos5HSJLeyfcimaf9v41NDtrA9u3eGk264w/KAF0VZ5Mx5al
 XsLDb8f3Bj12mtHgqxVV4YhPEigVeytBtQ6dEXWRpwlWs1rFZIXPaGiYK
 OIIwLc6h2GM7Xz7MgIuRRPoyDdtfKeEtNCUDKVD68u3eJRUPeI5dGWLGt
 YfMirSHNFs3obU8cIKO7tJkSKPTcglmr2WyKzcDylDZtgMJLzXJ0ztSJz
 SNRF686r5MaberFa6BOLSEEbP2YmtdHZMcD3TL3P6c2QW+ullX/SEvDAc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="461088726"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="461088726"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 00:16:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="766285634"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="766285634"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 11 Dec 2023 00:16:30 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 11 Dec 2023 10:16:29 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm: Warn when freeing a framebuffer that's still on a
 list
Date: Mon, 11 Dec 2023 10:16:25 +0200
Message-ID: <20231211081625.25704-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211081625.25704-1-ville.syrjala@linux.intel.com>
References: <20231211081625.25704-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Sprinkle some extra WARNs around so that we might catch
premature framebuffer destruction more readily.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_framebuffer.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 3cc0ffc28e86..888aadb6a4ac 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -461,6 +461,7 @@ int drm_mode_rmfb(struct drm_device *dev, u32 fb_id,
 
 		INIT_WORK_ONSTACK(&arg.work, drm_mode_rmfb_work_fn);
 		INIT_LIST_HEAD(&arg.fbs);
+		drm_WARN_ON(dev, !list_empty(&fb->filp_head));
 		list_add_tail(&fb->filp_head, &arg.fbs);
 
 		schedule_work(&arg.work);
@@ -827,6 +828,8 @@ void drm_framebuffer_free(struct kref *kref)
 			container_of(kref, struct drm_framebuffer, base.refcount);
 	struct drm_device *dev = fb->dev;
 
+	drm_WARN_ON(dev, !list_empty(&fb->filp_head));
+
 	/*
 	 * The lookup idr holds a weak reference, which has not necessarily been
 	 * removed at this point. Check for that.
@@ -1119,7 +1122,7 @@ void drm_framebuffer_remove(struct drm_framebuffer *fb)
 
 	dev = fb->dev;
 
-	WARN_ON(!list_empty(&fb->filp_head));
+	drm_WARN_ON(dev, !list_empty(&fb->filp_head));
 
 	/*
 	 * drm ABI mandates that we remove any deleted framebuffers from active
-- 
2.41.0


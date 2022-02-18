Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB884BB623
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0236F10EB4B;
	Fri, 18 Feb 2022 10:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3CA10EB0B;
 Fri, 18 Feb 2022 10:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178657; x=1676714657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JGYIKbU/OAX773ZXRK0IaOKOuKMSse00CjQHhpofPKM=;
 b=fY+Gbp2Zys7JoIr58LZwcgcijot0zYJzlawxJoyHqls+bXYD+iUOeKGV
 u/7OxNbQ1LEYivM3PyrxY8g2Fu7w/zIUpR0co3oNcRJzLNGdRDW3J9APz
 fayam8SR09BPlbtcnReJjy4UrI+ke07PYNhUdeub0WMc1NCNkMcS4uEyo
 W28erpTlP6xNFhhBriIDdVGQ3iTQgz3hgNwKbifXGFdjC2KHByQ1tWVfc
 xx7/4hrMQrsLxiRnvvxx+Qx+jz5+qjAbzaQkz5EihjrEpn6nywg/4Jia+
 06krpuNIG+B2YG4cE1eKOh0HI+sGigi835rA9WSnfW/kj9wukaxk25rMm Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="249931125"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="249931125"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:04:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="546219329"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga008.jf.intel.com with SMTP; 18 Feb 2022 02:04:15 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:04:14 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/22] drm: Add drm_mode_init()
Date: Fri, 18 Feb 2022 12:03:42 +0200
Message-Id: <20220218100403.7028-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
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

Add a variant of drm_mode_copy() that explicitly clears out
the list head of the destination mode. Helpful to guarantee
we don't have stack garbage left in there for on-stack modes.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_modes.c | 17 +++++++++++++++++
 include/drm/drm_modes.h     |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 96b13e36293c..40d4ce4a1da4 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -892,6 +892,23 @@ void drm_mode_copy(struct drm_display_mode *dst, const struct drm_display_mode *
 }
 EXPORT_SYMBOL(drm_mode_copy);
 
+/**
+ * drm_mode_init - initialize the mode from another mode
+ * @dst: mode to overwrite
+ * @src: mode to copy
+ *
+ * Copy an existing mode into another mode, zeroing the
+ * list head of the destination mode. Typically used
+ * to guarantee the list head is not left with stack
+ * garbage in on-stack modes.
+ */
+void drm_mode_init(struct drm_display_mode *dst, const struct drm_display_mode *src)
+{
+	memset(dst, 0, sizeof(*dst));
+	drm_mode_copy(dst, src);
+}
+EXPORT_SYMBOL(drm_mode_init);
+
 /**
  * drm_mode_duplicate - allocate and duplicate an existing mode
  * @dev: drm_device to allocate the duplicated mode for
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index 29ba4adf0c53..e6e5a588fab1 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -484,6 +484,8 @@ void drm_mode_set_crtcinfo(struct drm_display_mode *p,
 			   int adjust_flags);
 void drm_mode_copy(struct drm_display_mode *dst,
 		   const struct drm_display_mode *src);
+void drm_mode_init(struct drm_display_mode *dst,
+		   const struct drm_display_mode *src);
 struct drm_display_mode *drm_mode_duplicate(struct drm_device *dev,
 					    const struct drm_display_mode *mode);
 bool drm_mode_match(const struct drm_display_mode *mode1,
-- 
2.34.1


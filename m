Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9D8A849D6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7702F10EA19;
	Thu, 10 Apr 2025 16:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e514Fa+/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D737A10EA12;
 Thu, 10 Apr 2025 16:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744302762; x=1775838762;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mniRmGF4ml5WPF2uItkgITjWtyKRdbgpHtoE/x5/w8w=;
 b=e514Fa+/w+EvZwfDk1K/eWK3KGcpfwe3455+41nkBBibUxGt1igcjJSA
 pKZhDitswn4Pe/VrDpRrj8moTBMYfhmxIkBnDlz5NG6qXOV9qYHf9Rd5g
 ItpnDCGZfRdIhYKBB5Ga8s4MjYy+bacy44Zvh7xGFFI/14VRdfREZ/8G2
 RiXeJeIWMd2E5k+FzLkxAtLuhI128Q5LO6GbpuhpNh66fMlrPiCmK6vAY
 53+UalcSpgDGVqPBCzHXtdUW6QiUh7QlmKyl8P9zViLtAUA7e3WcDY1ts
 pjBC/+z8I2h5tlfYDBjTM67PwuFQqCJljqamtsr3lDMVvV0KtTdwQWdF5 w==;
X-CSE-ConnectionGUID: LtdRZEYNQGCNqdLQBRIh+g==
X-CSE-MsgGUID: U/Dgx3w4RvGugIk1nfAnAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57219999"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="57219999"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:32:41 -0700
X-CSE-ConnectionGUID: CofmAZIQQgOCl7tDzJ7wFw==
X-CSE-MsgGUID: qt7ZRiuTRxCckF+3tvzXCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134128936"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 09:32:40 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 19:32:38 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 03/19] drm: Look up the format info earlier
Date: Thu, 10 Apr 2025 19:32:02 +0300
Message-ID: <20250410163218.15130-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Looks up the format info in already drm_internal_framebuffer_create()
so that we can later pass it along to .fb_create(). Currently various
drivers are doing additional lookups in their .fb_create()
implementations, and these lookups are rather expensive now (given
how many different pixel formats we have).

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_framebuffer.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 18a0267e374e..ae09ef6977b2 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -153,18 +153,11 @@ int drm_mode_addfb_ioctl(struct drm_device *dev,
 }
 
 static int framebuffer_check(struct drm_device *dev,
+			     const struct drm_format_info *info,
 			     const struct drm_mode_fb_cmd2 *r)
 {
-	const struct drm_format_info *info;
 	int i;
 
-	/* check if the format is supported at all */
-	if (!__drm_format_info(r->pixel_format)) {
-		drm_dbg_kms(dev, "bad framebuffer format %p4cc\n",
-			    &r->pixel_format);
-		return -EINVAL;
-	}
-
 	if (r->width == 0) {
 		drm_dbg_kms(dev, "bad framebuffer width %u\n", r->width);
 		return -EINVAL;
@@ -175,9 +168,6 @@ static int framebuffer_check(struct drm_device *dev,
 		return -EINVAL;
 	}
 
-	/* now let the driver pick its own format info */
-	info = drm_get_format_info(dev, r->pixel_format, r->modifier[0]);
-
 	for (i = 0; i < info->num_planes; i++) {
 		unsigned int width = drm_format_info_plane_width(info, r->width, i);
 		unsigned int height = drm_format_info_plane_height(info, r->height, i);
@@ -272,6 +262,7 @@ drm_internal_framebuffer_create(struct drm_device *dev,
 				struct drm_file *file_priv)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	const struct drm_format_info *info;
 	struct drm_framebuffer *fb;
 	int ret;
 
@@ -297,7 +288,17 @@ drm_internal_framebuffer_create(struct drm_device *dev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	ret = framebuffer_check(dev, r);
+	/* check if the format is supported at all */
+	if (!__drm_format_info(r->pixel_format)) {
+		drm_dbg_kms(dev, "bad framebuffer format %p4cc\n",
+			    &r->pixel_format);
+		return ERR_PTR(-EINVAL);
+	}
+
+	/* now let the driver pick its own format info */
+	info = drm_get_format_info(dev, r->pixel_format, r->modifier[0]);
+
+	ret = framebuffer_check(dev, info, r);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.49.0


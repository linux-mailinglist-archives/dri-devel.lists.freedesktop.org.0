Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D315DAEF288
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0388B10E550;
	Tue,  1 Jul 2025 09:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2d0iX1a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D309D10E555;
 Tue,  1 Jul 2025 09:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751360865; x=1782896865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vfwcRQmmdWUWNO5SNe2/0puVWLmEPLcAC5ChY0ovSgg=;
 b=L2d0iX1a7pu9AWrvmyamJSMRU5RxpmuwTZ24wLM+q680LHyzCHmN7Ecs
 pRXBI/bPgm+UGWHglQpNLD9kuWUUYNh4BG93px/bqqKCW1ob0bhWmaD4P
 UDp4ks5gBmD1r4kDPFR6KEGrH8JMShWX2tnUhoF+DlFQJdsn3DG3xb50a
 Z2PZGhemmALnlKzypF6UhuTW4N2iE80ohdbedy/HkEnu0V6No6O27Ktq3
 hmAuqtbCWh8AFcO5hFWK2ZwqMqV+4+XTsX7M3nTMsC20G+m/JCcep2dyx
 7fAiQ0I3BHN74QxR+Nu4A1KkFFgMADOf4bEwNZtnkcjdpiDAqM8bAkDMX w==;
X-CSE-ConnectionGUID: 3tDJXhzaRrG+CNbuNPSJ/g==
X-CSE-MsgGUID: 5zdb2r1ZRjuYJmN0Kmkudg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64218325"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="64218325"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 02:07:45 -0700
X-CSE-ConnectionGUID: knmeRekbRACdIhiL1eS5KQ==
X-CSE-MsgGUID: 8+HsptMrTYOHh2TXqEfjNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="159426895"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.11])
 by orviesa005.jf.intel.com with SMTP; 01 Jul 2025 02:07:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 12:07:41 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 03/19] drm: Look up the format info earlier
Date: Tue,  1 Jul 2025 12:07:06 +0300
Message-ID: <20250701090722.13645-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
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

Look up the format info already in drm_internal_framebuffer_create()
so that we can later pass it along to .fb_create(). Currently various
drivers are doing additional lookups in their .fb_create()
implementations, and these lookups are rather expensive now (given
how many different pixel formats we have).

v2: Fix commit msg (Thomas)

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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


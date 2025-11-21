Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85073C7A665
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 16:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E451010E8AF;
	Fri, 21 Nov 2025 15:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="lFi4+n5S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1031210E8AF
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 15:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1763737618; x=1795273618;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=H4lz9IzPucH+8/psNxpuZMlk/rvyrt76Wj+dwW/qyMk=;
 b=lFi4+n5Snn9SHeMMwJc19GKxXzUdcnHQd/kU09D4znCnGeKxKi+yR13g
 IhWtObXHC+xXH8q5QJ/T66hx4YLeSxGOvqKN+xYMT5SHmX9csPOpBAUrc
 tBmWjM/ueLfPfNKZtadjU8wa5siVwFEndgF8NtILBhFtBw3TkiaxaJ8hY
 XmpGI+oFCVzfvq7lcGqksH1xlZdRg8As+KUxPYDi8XjMDPWUmAnUYY85O
 SrYm+lLkbp0EPSOn9gvmA/WvmkeLKedyFDpfAkM2r863lGWiD7YyviCWv
 WlUTyp2tX75HwmyDBEGqhZLGaWSYsiy75plVbgGsu8z2g9xDzM9WOPiiG w==;
X-CSE-ConnectionGUID: ZsY1rJHWSEWAtJuR27K+Sw==
X-CSE-MsgGUID: FAbZxFmwRbawMQ6bpWHzsA==
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; d="scan'208";a="280874265"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 08:06:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 21 Nov 2025 08:06:36 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Nov 2025 08:06:33 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Date: Fri, 21 Nov 2025 16:04:38 +0100
Subject: [PATCH 6/8] drm/atmel-hlcdc: use drmm_crtc_alloc_with_planes()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251121-lcd_cleanup_mainline-v1-6-2587e6fe4d67@microchip.com>
References: <20251121-lcd_cleanup_mainline-v1-0-2587e6fe4d67@microchip.com>
In-Reply-To: <20251121-lcd_cleanup_mainline-v1-0-2587e6fe4d67@microchip.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Ludovic Desroches
 <ludovic.desroches@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2868;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=H4lz9IzPucH+8/psNxpuZMlk/rvyrt76Wj+dwW/qyMk=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBpIH/WvQ+yKU/V0bCvhBe3QkiKGab/zxKSO67yQ
 V2J4Nrv9HSJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaSB/1gAKCRA+OeYT93tk
 LXvLEACMR3bqdjvPH6YVQa6f9eIZI3LVryIGJh4oyiS12BRH7kz0saV4kiMJnupWYgf3nTomHrh
 HAcjC4DVLNpxXVbcAIWzA3NkzyF+/csAMT80dDc9dW62SXTzS5leuZuxVQlR+zUNqEpHJstSDkO
 Fnn4uNR6CkW0DFa015qMR9S5VyOqF2iY8oMYpNgl/H+vxeG1v0oS/5ERHR6IHnZPsvLCQNOfpUF
 JzmtVDqbpevkm/+trp+c6MTxEz0jzIObXPVyZB4M1Yz99Bi3TEhgC63hdnwB7/EmASzoOsFyMU9
 9h4F8qQDIHgYGkQVFJMGfcgvByTW8Wgo50pXQIMEB8BXnfd54NnZXee6iKnPPvTBsIZckeYLPhs
 YEuP/tvVmHDaTRdBZib6l6rr/RTNvMZi495cAvLfe7n0bDgpetCq46mfrhjEFUoRACmXvlRh0hk
 QKOOzK8EohrpJpiJpBsOsemQdlcXLb/H4rmKzMFRGQnlQkF/sZm0XijEbXaO8AlQUBfWBnh0CMh
 2MJYUVfsQ4safYE3saagxy1ppn7864Zsg/9F3p2ovYXeraEC7+ZNNBqpB2GlPlGw6Gx/+QkG1Nd
 k/t8yizkSZp376OmP3HGuxNNFrrc1HWzVFEPN+f5iDYjunPMTtpD+TCfz2OdYW2tET4n32viH+C
 VFbZTapwgb4FlEw==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
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

Use drmm_crtc_alloc_with_planes() to simplify the code. As we no longer
have to take care about cleanup, we can get rid of
atmel_hlcdc_crtc_destroy().

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
Reviewed-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c | 32 +++++---------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
index e0efc7309b1b256520eff29462431476f8589255..b075f291847f9eb91e07b7844382871f38ed5f81 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_crtc.c
@@ -509,14 +509,6 @@ static const struct drm_crtc_helper_funcs lcdc_crtc_helper_funcs = {
 	.atomic_disable = atmel_hlcdc_crtc_atomic_disable,
 };
 
-static void atmel_hlcdc_crtc_destroy(struct drm_crtc *c)
-{
-	struct atmel_hlcdc_crtc *crtc = drm_crtc_to_atmel_hlcdc_crtc(c);
-
-	drm_crtc_cleanup(c);
-	kfree(crtc);
-}
-
 static void atmel_hlcdc_crtc_finish_page_flip(struct atmel_hlcdc_crtc *crtc)
 {
 	struct drm_device *dev = crtc->base.dev;
@@ -607,7 +599,6 @@ static void atmel_hlcdc_crtc_disable_vblank(struct drm_crtc *c)
 static const struct drm_crtc_funcs atmel_hlcdc_crtc_funcs = {
 	.page_flip = drm_atomic_helper_page_flip,
 	.set_config = drm_atomic_helper_set_config,
-	.destroy = atmel_hlcdc_crtc_destroy,
 	.reset = atmel_hlcdc_crtc_reset,
 	.atomic_duplicate_state =  atmel_hlcdc_crtc_duplicate_state,
 	.atomic_destroy_state = atmel_hlcdc_crtc_destroy_state,
@@ -620,15 +611,8 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
 	struct atmel_hlcdc_plane *primary = NULL, *cursor = NULL;
 	struct atmel_hlcdc_dc *dc = dev->dev_private;
 	struct atmel_hlcdc_crtc *crtc;
-	int ret;
 	int i;
 
-	crtc = kzalloc(sizeof(*crtc), GFP_KERNEL);
-	if (!crtc)
-		return -ENOMEM;
-
-	crtc->dc = dc;
-
 	for (i = 0; i < ATMEL_HLCDC_MAX_LAYERS; i++) {
 		if (!dc->layers[i])
 			continue;
@@ -646,13 +630,13 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
 			break;
 		}
 	}
+	crtc = drmm_crtc_alloc_with_planes(dev, struct atmel_hlcdc_crtc, base,
+					   &primary->base, &cursor->base, &atmel_hlcdc_crtc_funcs,
+					   NULL);
+	if (IS_ERR(crtc))
+		return PTR_ERR(crtc);
 
-	ret = drm_crtc_init_with_planes(dev, &crtc->base, &primary->base,
-					&cursor->base, &atmel_hlcdc_crtc_funcs,
-					NULL);
-	if (ret < 0)
-		goto fail;
-
+	crtc->dc = dc;
 	crtc->id = drm_crtc_index(&crtc->base);
 
 	for (i = 0; i < ATMEL_HLCDC_MAX_LAYERS; i++) {
@@ -674,8 +658,4 @@ int atmel_hlcdc_crtc_create(struct drm_device *dev)
 	dc->crtc = &crtc->base;
 
 	return 0;
-
-fail:
-	atmel_hlcdc_crtc_destroy(&crtc->base);
-	return ret;
 }

-- 
2.51.0


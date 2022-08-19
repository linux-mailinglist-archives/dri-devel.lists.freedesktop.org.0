Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8125991BE
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 02:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24C910E5CC;
	Fri, 19 Aug 2022 00:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB8010E4DE
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 00:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660868956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nZkz/OabS5gsWkkQKjM89j1/6sZadLuGX+5mWMwAoOc=;
 b=J9+jhZ4INDcnj5LrttbG/pDZpedWMxFLflwku91oIF8MTtK0Ir4iT1uiziY4PeQprZR/0f
 9G+zvFYIxEuS2LjKCMh0YcVFzmGcQqqeVfMPx066qo0HGMXkdDiFikj5fVjJx9g4I0B2wc
 yFGS48y6qnVp5GKS8zLfLgPRlw90J4Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-597-Xk10_jNWOa2IfGPXa-0SKQ-1; Thu, 18 Aug 2022 20:29:15 -0400
X-MC-Unique: Xk10_jNWOa2IfGPXa-0SKQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 ga16-20020a1709070c1000b007331af32d3aso1072800ejc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 17:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=nZkz/OabS5gsWkkQKjM89j1/6sZadLuGX+5mWMwAoOc=;
 b=2B7ixVNYNSm1/yl8p+vUa7YqUTbWn13ihgY7kDn0qy+DLbTU4r7kcsoWfSx4MElx9d
 1M1VdORgtHp/gi1/wXW0NaEIAK4zF4AkUFyswt+2z57t/EQ346fqDmBEEYRzr2oMe9le
 2E3p5wpnnEY+PLvhaT53OAH5HRrflo8qtBVqlzOrSxnJyl8u3gi7A3+ZrqNIujRu3Y8W
 bIJsWU+pJ513ZaVB6JyswOo+jrCW7hSRGY0MkXa+gskQSe3rPP/aDJ5YoS/ovYBOlUKh
 Rz4ODNJNKMViGdYO+tYGFtMPBKv8IqA4PffqjFMPNPCnDQQctjMoPHYM+Q08l2tyjCTl
 JoVA==
X-Gm-Message-State: ACgBeo3VZepDoLchZId6gpInvJWhLvwdYgqw/5R3VcDXMGa+35Q5pXWK
 DBpHVKCKYGzf4GxiWePdGpWJPUjYuOzjELydKWBmhstoPwiIY/GrfW/fSv7zCACzyMhxXe0Sj31
 qzw7pJUxKYiOKi5nnhUwngk/m0wot
X-Received: by 2002:a17:907:69b0:b0:730:a1f0:63e7 with SMTP id
 ra48-20020a17090769b000b00730a1f063e7mr3230743ejc.364.1660868954669; 
 Thu, 18 Aug 2022 17:29:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR69VOlMq30KnwZaAQTSrGpxNLSfPxSOQvLe3+fq+Fwv51y4m04N1qfRfTUdN5d2gTKsUNEPdQ==
X-Received: by 2002:a17:907:69b0:b0:730:a1f0:63e7 with SMTP id
 ra48-20020a17090769b000b00730a1f063e7mr3230736ejc.364.1660868954509; 
 Thu, 18 Aug 2022 17:29:14 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 b26-20020aa7cd1a000000b004460b020ffdsm2027913edw.83.2022.08.18.17.29.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 17:29:14 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org
Subject: [PATCH drm-misc-next 3/3] drm/vc4: crtc: protect device resources
 after removal
Date: Fri, 19 Aug 2022 02:29:05 +0200
Message-Id: <20220819002905.82095-4-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819002905.82095-1-dakr@redhat.com>
References: <20220819002905.82095-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(Hardware) resources which are bound to the driver and device lifecycle
must not be accessed after the device and driver are unbound.

However, the DRM device isn't freed as long as the last user closed it,
hence userspace can still call into the driver.

Therefore protect the critical sections which are accessing those
resources with drm_dev_enter() and drm_dev_exit().

Fixes: 7cc4214c27cf ("drm/vc4: crtc: Switch to drmm_kzalloc")
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 41 +++++++++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 2def6e2ad6f0..51daf190196e 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -39,6 +39,7 @@
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -295,10 +296,17 @@ struct drm_encoder *vc4_get_crtc_encoder(struct drm_crtc *crtc,
 static void vc4_crtc_pixelvalve_reset(struct drm_crtc *crtc)
 {
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	struct drm_device *dev = crtc->dev;
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
 
 	/* The PV needs to be disabled before it can be flushed */
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) & ~PV_CONTROL_EN);
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_FIFO_CLR);
+
+	drm_dev_exit(idx);
 }
 
 static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encoder,
@@ -321,6 +329,10 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 	u32 format = is_dsi1 ? PV_CONTROL_FORMAT_DSIV_24 : PV_CONTROL_FORMAT_24;
 	u8 ppc = pv_data->pixels_per_clock;
 	bool debug_dump_regs = false;
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
 
 	if (debug_dump_regs) {
 		struct drm_printer p = drm_info_printer(&vc4_crtc->pdev->dev);
@@ -410,6 +422,8 @@ static void vc4_crtc_config_pv(struct drm_crtc *crtc, struct drm_encoder *encode
 			 drm_crtc_index(crtc));
 		drm_print_regset32(&p, &vc4_crtc->regset);
 	}
+
+	drm_dev_exit(idx);
 }
 
 static void require_hvs_enabled(struct drm_device *dev)
@@ -430,13 +444,18 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	int ret;
+	int idx, ret;
+
+	if (!drm_dev_enter(dev, &idx))
+		return -ENODEV;
 
 	CRTC_WRITE(PV_V_CONTROL,
 		   CRTC_READ(PV_V_CONTROL) & ~PV_VCONTROL_VIDEN);
 	ret = wait_for(!(CRTC_READ(PV_V_CONTROL) & PV_VCONTROL_VIDEN), 1);
 	WARN_ONCE(ret, "Timeout waiting for !PV_VCONTROL_VIDEN\n");
 
+	drm_dev_exit(idx);
+
 	/*
 	 * This delay is needed to avoid to get a pixel stuck in an
 	 * unflushable FIFO between the pixelvalve and the HDMI
@@ -588,6 +607,7 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, new_state);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
+	int idx;
 
 	drm_dbg(dev, "Enabling CRTC %s (%u) connected to Encoder %s (%u)",
 		crtc->name, crtc->base.id, encoder->name, encoder->base.id);
@@ -606,6 +626,9 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	vc4_crtc_config_pv(crtc, encoder, state);
 
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
 	CRTC_WRITE(PV_CONTROL, CRTC_READ(PV_CONTROL) | PV_CONTROL_EN);
 
 	if (vc4_encoder->pre_crtc_enable)
@@ -617,6 +640,8 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	CRTC_WRITE(PV_V_CONTROL,
 		   CRTC_READ(PV_V_CONTROL) | PV_VCONTROL_VIDEN);
 
+	drm_dev_exit(idx);
+
 	if (vc4_encoder->post_crtc_enable)
 		vc4_encoder->post_crtc_enable(encoder, state);
 }
@@ -711,17 +736,31 @@ static int vc4_crtc_atomic_check(struct drm_crtc *crtc,
 static int vc4_enable_vblank(struct drm_crtc *crtc)
 {
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	struct drm_device *dev = crtc->dev;
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return -ENODEV;
 
 	CRTC_WRITE(PV_INTEN, PV_INT_VFP_START);
 
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
 static void vc4_disable_vblank(struct drm_crtc *crtc)
 {
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
+	struct drm_device *dev = crtc->dev;
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
 
 	CRTC_WRITE(PV_INTEN, 0);
+
+	drm_dev_exit(idx);
 }
 
 static void vc4_crtc_handle_page_flip(struct vc4_crtc *vc4_crtc)
-- 
2.37.2


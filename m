Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA09A59FF3C
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 18:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C510BA0C0;
	Wed, 24 Aug 2022 16:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C8BBA00D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 16:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661357622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jFR3xFdwN9i2Cd3/9jTqWPHspBtbjbbUfilDsWbGEig=;
 b=LLUUBllnibnXKdaRbdPKynsArHP+Y/mfl1NImn3bv4ZKFZ8OhsJx5mayLcD2R7KIVAwSWW
 oU7t8L6pLDARL5EExOVx99QX1kgT7r32ROIm2iIlRN/l31ZrGnc1DBIdOpf9mptvLyu1KE
 1llBogJz/Wno2++1cQ7PclFppU5Fh9Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-483-oxf9Ti4hPUOXgY_5_WJd4A-1; Wed, 24 Aug 2022 12:13:41 -0400
X-MC-Unique: oxf9Ti4hPUOXgY_5_WJd4A-1
Received: by mail-ej1-f71.google.com with SMTP id
 hq37-20020a1709073f2500b0073d8e17f434so3057732ejc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 09:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=jFR3xFdwN9i2Cd3/9jTqWPHspBtbjbbUfilDsWbGEig=;
 b=1UEQNWI7DfphgOzYvekCLMR8rgvQ8DynwAp6n/SLWG1ACPp3c8cPABq38fL/8ISZQu
 LcQWb/83hQ3kJruqj9aAIG0s4zPUQQoE2UF9FPrea33ugCZNag62QFZz3+Wc1x8aoDjK
 KULsPgGXFoMRZUkoPiZumq8/BkEXx1XCbKksx6yhmwlOwiAdpPbfa+XJ0IF/oWcHa0Za
 oyj3dy8WUJc1qGJ0/+2iipclQHCbr91LbZ5Fmn10yCFfbaxvlbGzwf1uZfbzK+KdBoJS
 bEHSqMYvzzhotOv3iBYF6Dcy3LJnA74GUYlAGiAffCBrw+KES1ry/ouP2LhjjdX41hDM
 oTzg==
X-Gm-Message-State: ACgBeo156ioOG85n7C6L4N6KVgJ7MZMzrHlGkgsgDMDxS6QmABdqh4up
 MKLcjNu+BI1AeRpkgVbvFs6I06OqFDejeU88RItDSAErhPL80tvzYnyX6vZufiUscvjH6RMgyVV
 +BhXog0O9uAjkPNhzHUUJmeIXr6ee
X-Received: by 2002:a17:906:dc90:b0:73d:670d:5975 with SMTP id
 cs16-20020a170906dc9000b0073d670d5975mr3262118ejc.515.1661357620167; 
 Wed, 24 Aug 2022 09:13:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4uS8NKqFvOYpGt5/IICUeLEiPTWIJ6o1anfDey5Pn39rH290LhaS+49A2XCUc3biABKcqT4A==
X-Received: by 2002:a17:906:dc90:b0:73d:670d:5975 with SMTP id
 cs16-20020a170906dc9000b0073d670d5975mr3262109ejc.515.1661357620000; 
 Wed, 24 Aug 2022 09:13:40 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a170906410200b007308bdef04bsm1359102ejk.103.2022.08.24.09.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 09:13:39 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org
Subject: [PATCH drm-misc-next v3 3/4] drm/vc4: crtc: protect device resources
 after removal
Date: Wed, 24 Aug 2022 18:13:26 +0200
Message-Id: <20220824161327.330627-4-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220824161327.330627-1-dakr@redhat.com>
References: <20220824161327.330627-1-dakr@redhat.com>
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
index 2def6e2ad6f0..0108613e79d5 100644
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
@@ -430,7 +444,10 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
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
@@ -464,6 +481,8 @@ static int vc4_crtc_disable(struct drm_crtc *crtc,
 	if (vc4_encoder && vc4_encoder->post_crtc_powerdown)
 		vc4_encoder->post_crtc_powerdown(encoder, state);
 
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
@@ -588,10 +607,14 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct vc4_crtc *vc4_crtc = to_vc4_crtc(crtc);
 	struct drm_encoder *encoder = vc4_get_crtc_encoder(crtc, new_state);
 	struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
+	int idx;
 
 	drm_dbg(dev, "Enabling CRTC %s (%u) connected to Encoder %s (%u)",
 		crtc->name, crtc->base.id, encoder->name, encoder->base.id);
 
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
 	require_hvs_enabled(dev);
 
 	/* Enable vblank irq handling before crtc is started otherwise
@@ -619,6 +642,8 @@ static void vc4_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	if (vc4_encoder->post_crtc_enable)
 		vc4_encoder->post_crtc_enable(encoder, state);
+
+	drm_dev_exit(idx);
 }
 
 static enum drm_mode_status vc4_crtc_mode_valid(struct drm_crtc *crtc,
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


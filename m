Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A44D5B91BA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 02:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C773510E1F6;
	Thu, 15 Sep 2022 00:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF2310E1DA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 00:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663201999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqWM55e5x02znRK55veSvbQ977VUM5OMWrptzYqj4WI=;
 b=NtktI002Nl+r2dBUggvD9uJmVJDh6s8KWNlKrsQU5lSZSQ9RMs7mHOxn/RO6K/sB7iL/Ng
 5hEiKZMb+9rpMMIREu/CWcxUZCcC1vNpknXPs8RrqN9itPt1eah6t35bVzGFtCtL+aV9ZO
 1tCwZtS3jnYVpL6leXmRZMsQmEvzEr0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-453-9z6cB3AqOFqY1LCyLAtR9g-1; Wed, 14 Sep 2022 20:33:07 -0400
X-MC-Unique: 9z6cB3AqOFqY1LCyLAtR9g-1
Received: by mail-ed1-f70.google.com with SMTP id
 v11-20020a056402348b00b004516e0b7eedso9092190edc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 17:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IqWM55e5x02znRK55veSvbQ977VUM5OMWrptzYqj4WI=;
 b=cF+axPueS8szVqCAwJO+tUVX04ZeOYJa8CfXJzZ3OZL+dssi1u74vM4pGOmdUSMY9S
 zN3hXHuueJ0oXhOauO8OwyYQaf8PQruPuo0gfmC6aIBItUg5q60066XUZQLeSYclcyMv
 +My9bbCnA0P0R6p7p1zxoweW+fq8Ym6qBGYJpEbSkHjA072XnkO0S7PySuUlVuU4VlgE
 Aj6u+TSk8SUOb0cla5s9vhLOqZO40ykOJNcQ2sKv/aIaiNmMYUrHi1Io9ApvB3w3tnj+
 lYhXd5RMmwmVtgfsnxME88hTnjj08msS6ViAPeST7oPDmZtQPwFkxwFnyfnwa6pwLxtS
 n/Cg==
X-Gm-Message-State: ACgBeo32CotGa66ZVl0NKyZDR4DiTuZqmot6Z2uE/hOqm++mDpX3EEdB
 qmv4g7z3LeHPF+gtrK0Gweq710JRIYGKASUIhmeRHae0t575TIfa0+lo+a1U2CzEAIlME0Wlr/F
 cSt8DmpdxwlQKRbfXFeelAuTjPYyN
X-Received: by 2002:a17:907:94d4:b0:77f:d0c9:573f with SMTP id
 dn20-20020a17090794d400b0077fd0c9573fmr8146052ejc.98.1663201986322; 
 Wed, 14 Sep 2022 17:33:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6iVRAQ1Z8stFf5ouzhJoapY1r+dUfoumzBdmir+QwjM/bFap5BDDwaSqryltzmVKD37aquAA==
X-Received: by 2002:a17:907:94d4:b0:77f:d0c9:573f with SMTP id
 dn20-20020a17090794d400b0077fd0c9573fmr8146041ejc.98.1663201986181; 
 Wed, 14 Sep 2022 17:33:06 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a056402155400b004479cec6496sm10715506edx.75.2022.09.14.17.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 17:33:05 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH drm-misc-next 7/8] drm/fsl-dcu: crtc: protect device resources
 after removal
Date: Thu, 15 Sep 2022 02:32:30 +0200
Message-Id: <20220915003231.363447-8-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915003231.363447-1-dakr@redhat.com>
References: <20220915003231.363447-1-dakr@redhat.com>
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

However, the DRM device isn't freed as long as the last user didn't
close it, hence userspace can still call into the driver.

Therefore protect the critical sections which are accessing those
resources with drm_dev_enter() and drm_dev_exit().

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
index 1dad90f701c8..c77df9b7893f 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_crtc.c
@@ -13,6 +13,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
@@ -26,6 +27,10 @@ static void fsl_dcu_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 	struct drm_device *dev = crtc->dev;
 	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(dev);
 	struct drm_pending_vblank_event *event = crtc->state->event;
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
 
 	regmap_write(fsl_dev->regmap,
 		     DCU_UPDATE_MODE, DCU_UPDATE_MODE_READREG);
@@ -40,6 +45,8 @@ static void fsl_dcu_drm_crtc_atomic_flush(struct drm_crtc *crtc,
 			drm_crtc_send_vblank_event(crtc, event);
 		spin_unlock_irq(&crtc->dev->event_lock);
 	}
+
+	drm_dev_exit(idx);
 }
 
 static void fsl_dcu_drm_crtc_atomic_disable(struct drm_crtc *crtc,
@@ -49,6 +56,10 @@ static void fsl_dcu_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 									      crtc);
 	struct drm_device *dev = crtc->dev;
 	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(dev);
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
 
 	/* always disable planes on the CRTC */
 	drm_atomic_helper_disable_planes_on_crtc(old_crtc_state, true);
@@ -61,6 +72,8 @@ static void fsl_dcu_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 	regmap_write(fsl_dev->regmap, DCU_UPDATE_MODE,
 		     DCU_UPDATE_MODE_READREG);
 	clk_disable_unprepare(fsl_dev->pix_clk);
+
+	drm_dev_exit(idx);
 }
 
 static void fsl_dcu_drm_crtc_atomic_enable(struct drm_crtc *crtc,
@@ -68,6 +81,10 @@ static void fsl_dcu_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(dev);
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
 
 	clk_prepare_enable(fsl_dev->pix_clk);
 	regmap_update_bits(fsl_dev->regmap, DCU_DCU_MODE,
@@ -77,6 +94,8 @@ static void fsl_dcu_drm_crtc_atomic_enable(struct drm_crtc *crtc,
 		     DCU_UPDATE_MODE_READREG);
 
 	drm_crtc_vblank_on(crtc);
+
+	drm_dev_exit(idx);
 }
 
 static void fsl_dcu_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
@@ -87,6 +106,10 @@ static void fsl_dcu_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	struct drm_display_mode *mode = &crtc->state->mode;
 	unsigned int pol = 0;
 	struct videomode vm;
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
 
 	clk_set_rate(fsl_dev->pix_clk, mode->clock * 1000);
 
@@ -122,6 +145,8 @@ static void fsl_dcu_drm_crtc_mode_set_nofb(struct drm_crtc *crtc)
 		     DCU_THRESHOLD_LS_BF_VS(BF_VS_VAL) |
 		     DCU_THRESHOLD_OUT_BUF_HIGH(BUF_MAX_VAL) |
 		     DCU_THRESHOLD_OUT_BUF_LOW(BUF_MIN_VAL));
+
+	drm_dev_exit(idx);
 	return;
 }
 
@@ -137,11 +162,17 @@ static int fsl_dcu_drm_crtc_enable_vblank(struct drm_crtc *crtc)
 	struct drm_device *dev = crtc->dev;
 	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(dev);
 	unsigned int value;
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return -ENODEV;
 
 	regmap_read(fsl_dev->regmap, DCU_INT_MASK, &value);
 	value &= ~DCU_INT_MASK_VBLANK;
 	regmap_write(fsl_dev->regmap, DCU_INT_MASK, value);
 
+	drm_dev_exit(idx);
+
 	return 0;
 }
 
@@ -150,10 +181,16 @@ static void fsl_dcu_drm_crtc_disable_vblank(struct drm_crtc *crtc)
 	struct drm_device *dev = crtc->dev;
 	struct fsl_dcu_drm_device *fsl_dev = drm_to_fsl_dcu_drm_dev(dev);
 	unsigned int value;
+	int idx;
+
+	if (!drm_dev_enter(dev, &idx))
+		return;
 
 	regmap_read(fsl_dev->regmap, DCU_INT_MASK, &value);
 	value |= DCU_INT_MASK_VBLANK;
 	regmap_write(fsl_dev->regmap, DCU_INT_MASK, value);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_crtc_funcs fsl_dcu_drm_crtc_funcs = {
-- 
2.37.3


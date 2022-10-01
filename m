Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 283F75F1D11
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 16:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D10210E63F;
	Sat,  1 Oct 2022 14:58:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EDA510E64C
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 14:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664636321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IqWM55e5x02znRK55veSvbQ977VUM5OMWrptzYqj4WI=;
 b=fiUHS3VdoDphSYkM1e94qIKF3Ouu4LE3bv9W+OrwfXw0BXw07gpyKSy0ys9aKoGO05At7X
 XZwkmgk6vJeNPtVtk/fwY33cLA/13L6cBuPyV/HolusLlUsfX5lUrZAVxc4ha0wxRhf33b
 8Mpa1cSRG9HCWqCtHVWfHJd79gWEsWA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-212-yoEUomsqPDq7ixSuGW3i9w-1; Sat, 01 Oct 2022 10:58:34 -0400
X-MC-Unique: yoEUomsqPDq7ixSuGW3i9w-1
Received: by mail-ed1-f69.google.com with SMTP id
 b17-20020a056402351100b00453b19d9bd0so5567031edd.4
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 07:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=IqWM55e5x02znRK55veSvbQ977VUM5OMWrptzYqj4WI=;
 b=QkglaLwWO56I1dY0y8keGLeb0hBHeZDIJ9o3GaQ5KypW/x0Q9tsnbiIP0GvMIcEvpc
 jFOSuHu1d1T1vOMo9/sFFG/1uNcwcUXO7JFppCtL3m7hwNoqid2/+Vq3NoN1FvTT5ls8
 eay69EMNP4xYtureuB7uV18vXSxK2dY1xL3AER0LyY0fFlLY7d6br56hUVI+2+uCGpmc
 TrDBVDpnQbuX6anmxJEz9Tp/nbV+zWges8+Mb2/3g/jhjWCZ4N3SSONzdFNwjFig6RSC
 137EYDM3N0oEazoYj5N0H5lXQBw9GVDj91TS47pvYR/c2+vcXu5HKqd2Sr0ShEpisimh
 5tJw==
X-Gm-Message-State: ACrzQf39W/rDgd7ZUvoJldqal1EoO+ASvN2dyY2wNQPiGLAy3sReMiFM
 eCIkiozHi0AgkU92XnrTUyoRr2UXBou7I12jkZpKvIM0uM2Af469HGrmLW4DkzTK/O/kCl7QdM3
 /LXsOJsXNT65Hxld+eF8r4dVTholO
X-Received: by 2002:a17:907:6ea4:b0:782:6b82:a2cb with SMTP id
 sh36-20020a1709076ea400b007826b82a2cbmr10122998ejc.408.1664636313413; 
 Sat, 01 Oct 2022 07:58:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7yvsyArbVNFdDnwv/ocXdiRliElOJYmVUR11MG6/x3BFrrdNeYB3g5s60MP+XkB94O71odTg==
X-Received: by 2002:a17:907:6ea4:b0:782:6b82:a2cb with SMTP id
 sh36-20020a1709076ea400b007826b82a2cbmr10122982ejc.408.1664636313177; 
 Sat, 01 Oct 2022 07:58:33 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 i26-20020a50fc1a000000b00457c9b7ac07sm3649245edr.84.2022.10.01.07.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:58:32 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH drm-misc-next v2 7/9] drm/fsl-dcu: crtc: protect device
 resources after removal
Date: Sat,  1 Oct 2022 16:58:00 +0200
Message-Id: <20221001145802.515916-8-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001145802.515916-1-dakr@redhat.com>
References: <20221001145802.515916-1-dakr@redhat.com>
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


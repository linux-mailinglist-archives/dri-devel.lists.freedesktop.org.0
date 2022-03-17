Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DA14DC29A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 10:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153D910E2B8;
	Thu, 17 Mar 2022 09:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449A710E139
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 09:26:05 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id p6so775537lfh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EXXE6ORAX46rJnCU92TRJpLJ6qo7Lo3sQFqMNqYA0L8=;
 b=MYcGLo3MBQhqJPtkREOU9Z7X5rgBbDguHwzxHYsD9rHrc7YphJA683EU7iA84YCkJy
 aYglqAgslUKFtwu+qDaaqZ/iPaM9sSaGGTdYtclTnqs+t88m79f485IE5FUpggNFBKh/
 ST5wmXloQhRD9ApYzv+1yXDVVEsnpIJeErAr2A1MCH2/xJiJ/PzsjOpH7Vj/gxe7M7hb
 nLtZrqRxYVa26UfxQhTpCTSvZMj7oCswCdDokzzk4+VGoLUvYa6x245SXlloOwx407Ki
 QNW7UIB27jsnLwUF8U/ML7j7eRxS0Mk5+A8s5t3jUHkpSxv29uR2aLu6Ew49nJfJfeB6
 pnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EXXE6ORAX46rJnCU92TRJpLJ6qo7Lo3sQFqMNqYA0L8=;
 b=7ae9tQGaCEEjVLECwpaQcMzIR+Cj1tOqh3EfbxmA1WGSUqj8zitKL/kYYPuFahr88W
 hMFE261NZQbO1wB2ISsYMGbLHef2a/ejjUH0OA9/XkTNquryAxYvVy/ce5qlOpl57JU0
 95Cy+FwwXDCEqzXZrgwGoRlT0LnUS1m5H+MzSltdPRNP3fDjDsTwcKWFv8rPEs3ZZkrl
 k5p3wGctJo1oyXxofYItEIRmRi04tdFbvauAZELFgmbjA6/kvfLz3NF4wl6zkUOsVz1Q
 6G0z9tSgOPiZNq3c2VsHueL9B/+LT5LH/rKEK9kvvxXXKK90e6fEMguAB3S0rtvkCvc4
 7QpQ==
X-Gm-Message-State: AOAM533XmEN8fMb5VmREm8vSp35/GBLWKSyYVzrM8pV09+Lp97xBKPm0
 kbQtJTGvMYuPenTO4bGhU5DzrdH0fWU=
X-Google-Smtp-Source: ABdhPJyFT3/NaXZOPwaensUwQ1z2vpbmaZigbOEKk/9sWcLFfX+FsCld1x/Jxsqxj4l4/LPQAM1ucg==
X-Received: by 2002:a05:6512:1281:b0:448:7ec1:133b with SMTP id
 u1-20020a056512128100b004487ec1133bmr2491349lfs.239.1647509163036; 
 Thu, 17 Mar 2022 02:26:03 -0700 (PDT)
Received: from localhost.localdomain (81-226-149-122-no518.tbcn.telia.com.
 [81.226.149.122]) by smtp.gmail.com with ESMTPSA id
 h3-20020a2e9003000000b00249278d3bd7sm391050ljg.77.2022.03.17.02.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 02:26:02 -0700 (PDT)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/gma500: Don't store crtc_funcs in psb_ops
Date: Thu, 17 Mar 2022 10:25:54 +0100
Message-Id: <20220317092555.17882-3-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_crtc_funcs are all generic and no chip specific functions are
necessary. We can therefore directly put gma_crtc_funcs into the
drm_crtc.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_device.c        | 1 -
 drivers/gpu/drm/gma500/oaktrail_device.c   | 1 -
 drivers/gpu/drm/gma500/psb_device.c        | 1 -
 drivers/gpu/drm/gma500/psb_drv.h           | 1 -
 drivers/gpu/drm/gma500/psb_intel_display.c | 3 +--
 5 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_device.c b/drivers/gpu/drm/gma500/cdv_device.c
index 887c157d75f4..f854f58bcbb3 100644
--- a/drivers/gpu/drm/gma500/cdv_device.c
+++ b/drivers/gpu/drm/gma500/cdv_device.c
@@ -603,7 +603,6 @@ const struct psb_ops cdv_chip_ops = {
 	.errata = cdv_errata,
 
 	.crtc_helper = &cdv_intel_helper_funcs,
-	.crtc_funcs = &gma_crtc_funcs,
 	.clock_funcs = &cdv_clock_funcs,
 
 	.output_init = cdv_output_init,
diff --git a/drivers/gpu/drm/gma500/oaktrail_device.c b/drivers/gpu/drm/gma500/oaktrail_device.c
index 40f1bc736125..5923a9c89312 100644
--- a/drivers/gpu/drm/gma500/oaktrail_device.c
+++ b/drivers/gpu/drm/gma500/oaktrail_device.c
@@ -545,7 +545,6 @@ const struct psb_ops oaktrail_chip_ops = {
 	.chip_setup = oaktrail_chip_setup,
 	.chip_teardown = oaktrail_teardown,
 	.crtc_helper = &oaktrail_helper_funcs,
-	.crtc_funcs = &gma_crtc_funcs,
 
 	.output_init = oaktrail_output_init,
 
diff --git a/drivers/gpu/drm/gma500/psb_device.c b/drivers/gpu/drm/gma500/psb_device.c
index e93e4191c0ca..59f325165667 100644
--- a/drivers/gpu/drm/gma500/psb_device.c
+++ b/drivers/gpu/drm/gma500/psb_device.c
@@ -329,7 +329,6 @@ const struct psb_ops psb_chip_ops = {
 	.chip_teardown = psb_chip_teardown,
 
 	.crtc_helper = &psb_intel_helper_funcs,
-	.crtc_funcs = &gma_crtc_funcs,
 	.clock_funcs = &psb_clock_funcs,
 
 	.output_init = psb_output_init,
diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index 88f44dbbc4eb..aed167af13c5 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -578,7 +578,6 @@ struct psb_ops {
 
 	/* Sub functions */
 	struct drm_crtc_helper_funcs const *crtc_helper;
-	struct drm_crtc_funcs const *crtc_funcs;
 	const struct gma_clock_funcs *clock_funcs;
 
 	/* Setup hooks */
diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index 6df62fe7c1e0..a99859b5b13a 100644
--- a/drivers/gpu/drm/gma500/psb_intel_display.c
+++ b/drivers/gpu/drm/gma500/psb_intel_display.c
@@ -488,8 +488,7 @@ void psb_intel_crtc_init(struct drm_device *dev, int pipe,
 		return;
 	}
 
-	/* Set the CRTC operations from the chip specific data */
-	drm_crtc_init(dev, &gma_crtc->base, dev_priv->ops->crtc_funcs);
+	drm_crtc_init(dev, &gma_crtc->base, &gma_crtc_funcs);
 
 	/* Set the CRTC clock functions from chip specific data */
 	gma_crtc->clock_funcs = dev_priv->ops->clock_funcs;
-- 
2.35.1


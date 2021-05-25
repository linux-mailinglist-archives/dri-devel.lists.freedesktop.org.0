Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B481838F8B1
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 05:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B906E5CE;
	Tue, 25 May 2021 03:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 473206E7D0;
 Tue, 25 May 2021 03:20:48 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 t10-20020a05683022eab0290304ed8bc759so27261616otc.12; 
 Mon, 24 May 2021 20:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sed5JvRLMiaF+0cJiDPgQf1+4i4xNSCm3dc8S6Z16pQ=;
 b=jkwFbwTn/CLxuDbawKx+Ai7I2fdbLrqNe0hagrkWg8vHDxYqqBb+dOy51ktDABiZZf
 1gm+owY9hu4NO8qC7NRXEcmGhU3Op6ND2J5cyc1mcDfpi4DBLcF59KZ5KQt9X5bkXMHR
 40dQLvIVTmBQyrobhyZsnR6O3yj7LUoayZIfH0pSueke9vAjJ555E2ET6+qcqJPmRJH6
 Rguhm8Xqje3K9Hoj+xa2ggJ1pBUKqiykXe3xokDsR85owUyxLFPiSJ8RLnGemfeaLRn0
 LdRE7A0ZbQ4nGnViDPuXSHofG2MPMzm/KKIGdR2fYD/Q2rDz+9fJvEH0TA3HxOwYuUtz
 HivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Sed5JvRLMiaF+0cJiDPgQf1+4i4xNSCm3dc8S6Z16pQ=;
 b=qRBnn8j13CSw+O+XKwjW1waKJZktoswHXuP30VKOZglOtkPb3i/z4FeIgCor2jSfDt
 qkYWyAcVCyr7VK8ke82MfMVBX/PvKCaGk/ZpDqxj2jL7NbQ14ZMG/UGT8gpHa0YN67U1
 QUvGr4Ct9qZkKTeEpoa4XtjSlTVBOna6kjR6bBgLahPhOFhFS7eERfUzkMNPFeiFpiTb
 3DUCT1eMwZCFSTvbzQkQymFMLXNNvHo0E1GtEq3Xjl8TWIYRRVspuZCODw4lTaZgEGl+
 zhWO+28tpksTIeocmnQ5/Pbq3TIov4PxEqtoE4F2C0SdCU8A4eTE3rj1wAU4M1Y1C9pF
 0w3g==
X-Gm-Message-State: AOAM532njY/6uu5eKFbXRWgm1wy0/xJCYs3/Y++jcTlRcE7SmDki4KyK
 itUhKM1ypkCLfQj+aHDFqMc=
X-Google-Smtp-Source: ABdhPJxKOQeYkDInkuL2V3aQoUYr+kbPVlPeMP9q3jy3Uz4aFJzK9uqk6bnPvR4B9/MbmKkZf/JsPw==
X-Received: by 2002:a9d:60ca:: with SMTP id b10mr20574176otk.242.1621912847670; 
 Mon, 24 May 2021 20:20:47 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 88sm3481873otb.7.2021.05.24.20.20.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 20:20:46 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH] drm/msm/dp: Drop unnecessary NULL checks after container_of
Date: Mon, 24 May 2021 20:20:33 -0700
Message-Id: <20210525032033.453143-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.25.1
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The result of container_of() operations is never NULL unless the embedded
element is the first element of the structure. This is not the case here.
The NULL check on the result of container_of() is therefore unnecessary
and misleading. Remove it.

This change was made automatically with the following Coccinelle script.

@@
type t;
identifier v;
statement s;
@@

<+...
(
  t v = container_of(...);
|
  v = container_of(...);
)
  ...
  when != v
- if (\( !v \| v == NULL \) ) s
...+>

While at it, remove unused but assigned variable hpd in
dp_display_usbpd_attention_cb().

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1784e119269b..a74e7ef96fcf 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -208,10 +208,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
 
 	dp = container_of(g_dp_display,
 			struct dp_display_private, dp_display);
-	if (!dp) {
-		DRM_ERROR("DP driver bind failed. Invalid driver data\n");
-		return -EINVAL;
-	}
 
 	dp->dp_display.drm_dev = drm;
 	priv = drm->dev_private;
@@ -252,10 +248,6 @@ static void dp_display_unbind(struct device *dev, struct device *master,
 
 	dp = container_of(g_dp_display,
 			struct dp_display_private, dp_display);
-	if (!dp) {
-		DRM_ERROR("Invalid DP driver data\n");
-		return;
-	}
 
 	dp_power_client_deinit(dp->power);
 	dp_aux_unregister(dp->aux);
@@ -406,11 +398,6 @@ static int dp_display_usbpd_configure_cb(struct device *dev)
 
 	dp = container_of(g_dp_display,
 			struct dp_display_private, dp_display);
-	if (!dp) {
-		DRM_ERROR("no driver data found\n");
-		rc = -ENODEV;
-		goto end;
-	}
 
 	dp_display_host_init(dp, false);
 
@@ -437,11 +424,6 @@ static int dp_display_usbpd_disconnect_cb(struct device *dev)
 
 	dp = container_of(g_dp_display,
 			struct dp_display_private, dp_display);
-	if (!dp) {
-		DRM_ERROR("no driver data found\n");
-		rc = -ENODEV;
-		return rc;
-	}
 
 	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 
@@ -502,7 +484,6 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 	int rc = 0;
 	u32 sink_request;
 	struct dp_display_private *dp;
-	struct dp_usbpd *hpd;
 
 	if (!dev) {
 		DRM_ERROR("invalid dev\n");
@@ -511,12 +492,6 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
 
 	dp = container_of(g_dp_display,
 			struct dp_display_private, dp_display);
-	if (!dp) {
-		DRM_ERROR("no driver data found\n");
-		return -ENODEV;
-	}
-
-	hpd = dp->usbpd;
 
 	/* check for any test request issued by sink */
 	rc = dp_link_process_request(dp->link);
-- 
2.25.1


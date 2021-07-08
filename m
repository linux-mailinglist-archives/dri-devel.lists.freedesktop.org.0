Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693753C1BA4
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 01:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA9956E92F;
	Thu,  8 Jul 2021 23:03:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A986E92F
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 23:03:31 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id u25so4934694ljj.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 16:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MmU1HG2iYGV6JEeDyyVDdrnq6JazLk/+ZHGeiYN3Id8=;
 b=Anr3Kvt0K7SA7IBK762lHz46n210rw7QKiWEqBL3utOUUXN4bUlk/wrVNTDcS+e0Uy
 kWOy1wIk/ekdX1gJbFoj1QhPwYDZL/+oZeNr+QqBXUefls4FPielGMNM4iLV+rqf1nBI
 6kLR/I7+iqde0yGrlScHVI7b2WBc+regzdzNrYbDkFWsuqBQx8A60A/cj+b5y3KZhDd1
 WggDi9JACFZNXFWgnylkmI21oPmR8dLpA8T/Nl+mDV0vdQedavfZumtqhSJvOnsiWL0+
 +Em3z5k/gjcO0MImgiXu9NREMxW4saXQdC9cY/grmR4mJD484K3kGzVT9JSCOBvkH6uJ
 KFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MmU1HG2iYGV6JEeDyyVDdrnq6JazLk/+ZHGeiYN3Id8=;
 b=OvWl92EWfORGtGZ/jNFI1EppMiq3SNL2MPfigjSWZB/+XNbXti6RDdx5AFzrPhRqh9
 jbzmqL7l2+nSyzmFVQ0geB+g6AK5BqTH81E8qGfe7Js9J3Va5S+oSihoArrx8MioAwNd
 LUOJpuzygB0iJ2RZTodK+fyb0FY4Jqlu3oZTKlSSYhc1mKAkpKWg4vVK+gVG2vkm/2Bx
 J9T1/Z1N6X0+Bqb5vl/vU1Zo3ulcR3ruEZG3jnPW3V1vPBtEtojOdzD20xtdbtwIUGNe
 H5/l9c8sm4qfc0LVAETkPrDLoTeaK4MtYmDY5Xf4oKvMQ+4F6aQ9ReA+7MPaLKzFLPmO
 mcOA==
X-Gm-Message-State: AOAM530xUlQXaJFnVxw3YLKg3HZtFIvWDS6f4GxqKK4uMo2HD1cERwdx
 J0stF93jijhB2LmUCaFAREuBLQ==
X-Google-Smtp-Source: ABdhPJzxIl8223mKfhnS0pkogb8o9xDXmjoMOzVaETRZ1t5uJa7cBM3z/jThF4QkjwA16wLzYvitag==
X-Received: by 2002:a05:651c:211d:: with SMTP id
 a29mr26605525ljq.115.1625785410259; 
 Thu, 08 Jul 2021 16:03:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p8sm309904lfc.185.2021.07.08.16.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 16:03:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH] drm/bridge/lontium-lt9611uxc: fix provided connector suport
Date: Fri,  9 Jul 2021 02:03:29 +0300
Message-Id: <20210708230329.395976-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- set DRM_CONNECTOR_POLL_HPD as the connector will generate hotplug
  events on its own

- do not call drm_kms_helper_hotplug_event() unless mode_config.funcs
  pointer is not NULL to remove possible kernel oops.

Fixes: bc6fa8676ebb ("drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 3cac16db970f..010657ea7af7 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -167,9 +167,10 @@ static void lt9611uxc_hpd_work(struct work_struct *work)
 	struct lt9611uxc *lt9611uxc = container_of(work, struct lt9611uxc, work);
 	bool connected;
 
-	if (lt9611uxc->connector.dev)
-		drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
-	else {
+	if (lt9611uxc->connector.dev) {
+		if (lt9611uxc->connector.dev->mode_config.funcs)
+			drm_kms_helper_hotplug_event(lt9611uxc->connector.dev);
+	} else {
 
 		mutex_lock(&lt9611uxc->ocm_lock);
 		connected = lt9611uxc->hdmi_connected;
@@ -339,6 +340,8 @@ static int lt9611uxc_connector_init(struct drm_bridge *bridge, struct lt9611uxc
 		return -ENODEV;
 	}
 
+	lt9611uxc->connector.polled = DRM_CONNECTOR_POLL_HPD;
+
 	drm_connector_helper_add(&lt9611uxc->connector,
 				 &lt9611uxc_bridge_connector_helper_funcs);
 	ret = drm_connector_init(bridge->dev, &lt9611uxc->connector,
-- 
2.30.2


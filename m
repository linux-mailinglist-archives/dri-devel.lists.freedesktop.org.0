Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6066274C0B2
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jul 2023 05:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DE510E1AE;
	Sun,  9 Jul 2023 03:42:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4044110E1AB
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Jul 2023 03:42:17 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b701e41cd3so53124821fa.3
 for <dri-devel@lists.freedesktop.org>; Sat, 08 Jul 2023 20:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688874134; x=1691466134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TJYjNiYNzWjxH+XhoyNFMKctuYtv2+kbNIyIzjM3yLU=;
 b=j98con11pP7sdzRlNNWpVvpwOmK6q98t4lmleVYXmYLIcnuYXj36vwUVH6gRPSuNXH
 hvk6McZqYZMu+O7/bKYauksX3s2YRPgvw779Ae3M2ukE1zcR5uXK1WG6/N1s1tg5d8kI
 B3G0eZE0zrMbI3PWnb+xgmSJCvdRRkKbIIoYpm+GHSQmFCtXZL7JCJpNL8FUdq5vvgPV
 C0KctOtqx/fKRwI3Ysr7fsjNJoJPitmf2IAmtS+Hj/XF7k3lawv0jASnUQNGMfUwtzYx
 /TfZRMyH1hSyuwi/UAjvp+NfWNVzjn7BHwE6iOqHjYJdTbG+IsNd8JInQQnt78XqDGmH
 cHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688874134; x=1691466134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TJYjNiYNzWjxH+XhoyNFMKctuYtv2+kbNIyIzjM3yLU=;
 b=ZiYoKqPJiAro4+OOye/1xlMpashb2wDyQi/mqigju9wudi/iRrnbuyJXTdQUfNrAZO
 sqDBYzOSvsI+VVKJLVbJ9Uc5TDBGQ6dU1bzfUYp+GI3EGDp+UZDWY3bYQ9TP9wSZzw+F
 d2BEhRyNJvshKAb93t6UDRpiGeLsjYYHJKgPdOiNurTfV9pS9ZB9o2uFCZKUc5pG9y69
 XY4wNfLnhBacc1Gsg+4Pok8ZgRQ4dy/lC8fNvVTja/Ef2rgK/HUsH6SN1depkEVPAlpw
 YR6QLqpeUNcvZLYAreCgzLBbb57TDEEFHUVf0ewmsl1IhA/4boNnf4dqOxDus0Gyvikf
 JTnw==
X-Gm-Message-State: ABy/qLYPNRKkHuf1wbZMO1idI1fd4luKw+9CrpbmxbsRQWgL+pu7YhRJ
 eAYzZO5TZY0v2onsQQbiYH2cDQ==
X-Google-Smtp-Source: APBJJlEFwjopZbeqkrh82suxe7jo8qJQ0dOe7Qudk5a/sj1MHOxSDaQ5FPYIa7FHlbwt+yhdoHwlpQ==
X-Received: by 2002:a2e:9902:0:b0:2b6:cfec:69f7 with SMTP id
 v2-20020a2e9902000000b002b6cfec69f7mr6739101lji.1.1688874134116; 
 Sat, 08 Jul 2023 20:42:14 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 y13-20020a2e9d4d000000b002b6d7682050sm1390289ljj.89.2023.07.08.20.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jul 2023 20:42:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v5 2/3] drm/bridge_connector: stop filtering events in
 drm_bridge_connector_hpd_cb()
Date: Sun,  9 Jul 2023 06:42:10 +0300
Message-Id: <20230709034211.4045004-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230709034211.4045004-1-dmitry.baryshkov@linaro.org>
References: <20230709034211.4045004-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In some cases the bridge drivers would like to receive hotplug events
even in the case new status is equal to the old status. In the DP case
this is used to deliver "attention" messages to the DP host. Stop
filtering the events in the drm_bridge_connector_hpd_cb() and let
drivers decide whether they would like to receive the event or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_bridge_connector.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
index 19ae4a177ac3..84d8d310ef04 100644
--- a/drivers/gpu/drm/drm_bridge_connector.c
+++ b/drivers/gpu/drm/drm_bridge_connector.c
@@ -113,16 +113,11 @@ static void drm_bridge_connector_hpd_cb(void *cb_data,
 	struct drm_bridge_connector *drm_bridge_connector = cb_data;
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
-	enum drm_connector_status old_status;
 
 	mutex_lock(&dev->mode_config.mutex);
-	old_status = connector->status;
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	if (old_status == status)
-		return;
-
 	drm_bridge_connector_hpd_notify(connector, status);
 
 	drm_kms_helper_hotplug_event(dev);
-- 
2.39.2


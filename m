Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AFD7CB073
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 18:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B5410E246;
	Mon, 16 Oct 2023 16:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D76AC10E245
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 16:54:17 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40572aeb6d0so46864735e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697475256; x=1698080056; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z2KAQh5biIaDjy3JspEokfbAFpOptd05O572lVX96aY=;
 b=JCA1H5nK7P6zLn4K7423BQHTvKmhlvzfOaEc2dfellFapmz4r4djZ1ufvMAsSoAbCX
 qj7HJ3Hrhnv80B98zy25xKThMpu9Xktq5T8f8EVKj2q/byuREp6hbuL5Tw7GykHxX2c5
 ynyRRiIudu9trNZ9ObJMqgJYigGcTwdoLWo6i9bJkHsTvZ4IkxhdMJftwPFbXju+MD4K
 NDiZ8dVDMIvCjphG2dIo8DmFPoIkSZ2SY4XRuwlw6G8cKUHdxEtNvex8Y+0RNCexGMVO
 3d29x2EjCnPp3GMLVpJEIhqAfEe1zohcVacYX7K46zYM2J7znFTtH/HXKiIV52NG5KCP
 QkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697475256; x=1698080056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z2KAQh5biIaDjy3JspEokfbAFpOptd05O572lVX96aY=;
 b=pds3Ss2bomZQvns2m9HaU78eNvsjzybS/d5WEA9j3YM+Als1Xg1gj7eltl3KdmUsLg
 dlQS9LS8tphbf0/KvyDOubTWVqfmUuAM3oQgq0Yex6QFluQqcvykb7NHIOM/Te2VzfSp
 kYJ62UBMBOBC9hZdVrSs7rC+U7FKB7zCdQ3RWGWKaN/lOa74Ai3bF0Yrwwvc1JiM+bXQ
 xm3tUn/udz0rOcWSd8eKVJm7fL4Zmqlf3mXv4W4zC5m+mlQPZK6UHQxSsQAIwUXiRZsF
 UpRSHG00bneby5g/96oCZvdFN5kZ80z64NGsliiFCMMy954iBPfsMM6FtYuoBXh1MDaV
 uwXQ==
X-Gm-Message-State: AOJu0Yyx2FF5QPGVIc95jodofKbWhW4thr4cZiP5sLtgf6STFWDE8VAI
 SFGfG1+NnZVw4U06nALb+FLArg==
X-Google-Smtp-Source: AGHT+IEqmnobiCsIMYAdCDeaCtj3AGb0jtlboDlqcQ+Atx1a8i0m4PfESVkAoxvu6F9wIJAh3Bb39A==
X-Received: by 2002:a1c:7711:0:b0:405:959e:dc7c with SMTP id
 t17-20020a1c7711000000b00405959edc7cmr29757671wmi.30.1697475256293; 
 Mon, 16 Oct 2023 09:54:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([45.84.211.189])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a05600c45d300b0040648217f4fsm7638996wmo.39.2023.10.16.09.54.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 09:54:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [RFC PATCH 10/10] drm/msm/dsi: drop (again) the ps8640 workaround
Date: Mon, 16 Oct 2023 19:53:55 +0300
Message-ID: <20231016165355.1327217-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org>
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
Cc: Marek Vasut <marex@denx.de>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now as the Parade PS8640 driver sets the MIPI_DSI_MANUAL_POWERUP flag,
drop the workaround enforcing the late DSI link powerup in the case the
next bridge is ps8640.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 2d7040d21239..b6b8171cf382 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -198,29 +198,12 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
 	return dsi_bridge->id;
 }
 
-/*
- * If the next bridge in the chain is the Parade ps8640 bridge chip then don't
- * power on early since it seems to violate the expectations of the firmware
- * that the bridge chip is running.
- */
-static bool dsi_mgr_next_is_ps8640(struct drm_bridge *bridge)
-{
-	struct drm_bridge *next_bridge = drm_bridge_get_next_bridge(bridge);
-
-	return next_bridge &&
-		next_bridge->of_node &&
-		of_device_is_compatible(next_bridge->of_node, "parade,ps8640");
-}
-
 static bool dsi_mgr_auto_powerup(struct drm_bridge *bridge)
 {
 	int id = dsi_mgr_bridge_get_id(bridge);
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct mipi_dsi_host *host = msm_dsi->host;
 
-	if (dsi_mgr_next_is_ps8640(bridge))
-		return true;
-
 	return msm_dsi_host_auto_powerup(host);
 }
 
@@ -230,9 +213,6 @@ static bool dsi_mgr_early_powerup(struct drm_bridge *bridge)
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct mipi_dsi_host *host = msm_dsi->host;
 
-	if (dsi_mgr_next_is_ps8640(bridge))
-		return false;
-
 	return msm_dsi_host_early_powerup(host);
 }
 
-- 
2.42.0


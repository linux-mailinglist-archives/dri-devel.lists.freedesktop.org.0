Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4117CB077
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 18:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AED610E24A;
	Mon, 16 Oct 2023 16:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A103710E23A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 16:54:13 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40651a72807so45712975e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697475252; x=1698080052; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7atWdHX87tg37dPcf4FsazD++qIF8t5k5lbbaEv6EjQ=;
 b=k9mLRd3Z23te3YWC0fxIVPXa4wsX08nK2GWLRIdFZ0kK4vaK6imiQGh/mwLcnTxYgr
 6etD+KjoZUCqaICvw4/C54o9Xx/Lpra/9YhlKC4anjMABT8cacv928y/xW/pcbylRsHX
 3JCtqlnFIHh7ZK8I7RHIw1LRQXQk8+Suj+nlbWVL73Ph+9ZA2KFSTNuC+pA7+G/AzR9R
 3TLIzzTH9S9ENgalDhMg50MZiZob/4EblagnU/U4cEGqiJBMJxY5cak8dJ4PXRJItBPw
 p860IMS/iv47oc49v8p126ShD4N/7WlyMbsezuOns+gm74CPJSu9ri+kcMJQxlV0QETy
 7biQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697475252; x=1698080052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7atWdHX87tg37dPcf4FsazD++qIF8t5k5lbbaEv6EjQ=;
 b=v7E99WR9MkEvXKUoscV3YBrJrloKpoQpzjK8uQDx3hf7Gs86sEwvcLhETV0tWyMayR
 K1YIWlYxHjNO1cF+WbgRnjvBBCdYjRWXDIjekZDgOkQbNXYsGHrDwPAYYfB4i2sxtsXi
 mkKa0zO/IptuNPHNkaJkK3buQWtNHWdE/sjnjLxbSH8iCH+RFqlbEGpy2tN3r8+3NAGE
 sOb2VDdZH2Odra/5VP1GIAezbe83GFhRxwE6YaU3QxtJw3oIA9rXt6zswa/AXsLhoWHf
 Wpcvd1vQdayNcFru2eMX8yn8ySH0DHFatgszLU+nK/7V8MzYqpuwmxAy81gindDXauD4
 wxeA==
X-Gm-Message-State: AOJu0YzcYczNYd3c3kL4nu6O0ef26enp194l0fIHIbcguZUePMptAfXj
 lWyCNn+9+uMLrK3JS/aFyD4sVQ==
X-Google-Smtp-Source: AGHT+IFkELKtKgynuffB+oWpclXHrxccbH7YSTd/rxvV58WereDXS35Dcn2oCjeZlgI0vrzf+kaXkQ==
X-Received: by 2002:a7b:c5c9:0:b0:403:272:4414 with SMTP id
 n9-20020a7bc5c9000000b0040302724414mr29903330wmk.0.1697475252155; 
 Mon, 16 Oct 2023 09:54:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([45.84.211.189])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a05600c45d300b0040648217f4fsm7638996wmo.39.2023.10.16.09.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 09:54:11 -0700 (PDT)
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
Subject: [RFC PATCH 08/10] drm/bridge: lt9611: mark for automatic DSI power
 control
Date: Mon, 16 Oct 2023 19:53:53 +0300
Message-ID: <20231016165355.1327217-9-dmitry.baryshkov@linaro.org>
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

The Lontium LT9611 driver doesn't need to control DSI power
lines manually. Mark it for automatic power control.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 9663601ce098..10b7093bd5c5 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -774,7 +774,7 @@ static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
-			  MIPI_DSI_MODE_VIDEO_HSE;
+			  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_AUTO_POWERUP;
 
 	ret = devm_mipi_dsi_attach(dev, dsi);
 	if (ret < 0) {
-- 
2.42.0


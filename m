Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F291661404
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 08:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC2310E238;
	Sun,  8 Jan 2023 07:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC9710E1E6
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 07:26:01 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id m6so8286210lfj.11
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 23:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C5ihh3g6iNgJiC7zRiEmt/AFsjwhqCmHhXCZopRf9qg=;
 b=ZQe4KJDz4ptondq++o4ifOMaqWPCx8dqCv/EBBlz1pUl/CXtvA4TVX8b58inFkMQiV
 xEZ9J7W59nw4Bu2UyLe2zLEi2I4z9P8ZPbDPxZRkK2GYhlvAHEyMN3Pu5KQzvVU3BPij
 uEj0Ly0EsuBhuZTNgn3t4mpN0wjiOF7FFXcSPIWYCZg/7ulPBpURZQ3E9yeI3VCl00mN
 c9gXxbbphvs1VvE5wKr9/I5/4EAsXNN/jOCphCbCz7LMk2Lsje2QV3J90eYRoalzIiYZ
 m/O2Ep73ZXqCpT8hpsHniyWPnxydCYam29Oaptph5/qHOAyovtY6VZv4ErIFIuy73qWI
 Kibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C5ihh3g6iNgJiC7zRiEmt/AFsjwhqCmHhXCZopRf9qg=;
 b=kwU9mppQBdQ2cZY4hXmdzS8P0YQJxPPRzb0IdQRaXlGZZBcqMpzabN289gebfcxIdI
 2tShjpziP81GsK1563lH+PxCUsNWIebAIIukQBXzEDNwmXGw0acP5YGiCQt9mB65WowA
 hCFrj/OAuYWxI8FznEFNWFHauKMg5b+1RPE5xhIMjzaW12MGWM6gUr1LySAN9jBV4USz
 MHX/QYAKF65bCLhlkVv8O3eCLD2yx987zgAvkQOQ6+ymve5FFJCQYK9cFrCeiFfN2vai
 l+hGsOrFCCCR2DDGV6lSf/VbhpDNf+Esmsl0nOmUsUgSO2ibxP3jRDNHsFPraEtBgkjm
 8u8g==
X-Gm-Message-State: AFqh2kq4E195isIElFiF9fw4a/K+mFBV3nCZ8kHrFoDTg9/xKAK4EmTF
 qWA1NTLOCo51JzKl4sWMVJgT7g==
X-Google-Smtp-Source: AMrXdXvFBev112O5sYS91DrRbcayDdq+LFoKfun7pxSfD9QGpC6eQaXo2u/E+mSxzuZpeSXR1YNORg==
X-Received: by 2002:ac2:446b:0:b0:4a4:68b9:66cf with SMTP id
 y11-20020ac2446b000000b004a468b966cfmr15491687lfl.26.1673162760795; 
 Sat, 07 Jan 2023 23:26:00 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 23:26:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 06/12] drm/bridge: lt9611: pass a pointer to the of node
Date: Sun,  8 Jan 2023 09:25:49 +0200
Message-Id: <20230108072555.2905260-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
References: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pass a pointer to the OF node while registering lt9611 MIPI device.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index e2799a0df8f8..3b77238ca4af 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -769,7 +769,7 @@ static const struct drm_connector_funcs lt9611_bridge_connector_funcs = {
 static struct mipi_dsi_device *lt9611_attach_dsi(struct lt9611 *lt9611,
 						 struct device_node *dsi_node)
 {
-	const struct mipi_dsi_device_info info = { "lt9611", 0, NULL };
+	const struct mipi_dsi_device_info info = { "lt9611", 0, lt9611->dev->of_node};
 	struct mipi_dsi_device *dsi;
 	struct mipi_dsi_host *host;
 	struct device *dev = lt9611->dev;
-- 
2.39.0


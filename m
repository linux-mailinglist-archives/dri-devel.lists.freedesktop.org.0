Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5251C683947
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 23:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8938A10E2DD;
	Tue, 31 Jan 2023 22:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F019610E2BA
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 22:22:18 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id 5so16592477plo.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 14:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nDJfgGY2Uq4pkbdaiIQ1ONvu1Aumpm8UVU5btqep3hU=;
 b=C//XxpbCdZukvZqKglW8c6wuEVing1SDTbUUogS/ymch/qoW0vbXqPjsij+7C39bKM
 cz2v/jqa/PU4i47Iz53rPk2Vw3mNsCvZevPClswFn03twuQH9OPEeoCTzI0WxPUHRVN+
 yilQTQAnqMoG4QmPIPzwSaV9MSqokzOW+hEIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nDJfgGY2Uq4pkbdaiIQ1ONvu1Aumpm8UVU5btqep3hU=;
 b=VorOCnfZWvhUp4ESZRafVrsPc4WIofaaTN+mynuohsk6sgYMWEmpoPIaNc0ltdxIt0
 4oWMoog+te0hYi7RLMg6Ha1yUA3I2aVGjjdT63TdMK1pAm+yYOl2CxVpV0jTe7cuWjXw
 h/dYC7ym4tL/HZnStcrjy+pISTKqZ2ApPCzrNziXBXD/ElrnWk2zoR7Y2cx4HSo5i/DM
 MO7z0fbVudMN1smFI231wwb5PPABruTK7Fy90QoYS4GNNTlt1nj7LBwW0HGQrvOuncnA
 G3Tok19NiMKSiMN/IsuqQ1QYsSrehVwNpemRtTCmAb+e6UaqI50+smwkJ3dUDUcu0X9x
 S5cg==
X-Gm-Message-State: AO0yUKUj8sSLiF3iFs/zUEJiEw3G5Q3lSNcCrHkC0yxMdfkQpM9s7LmA
 Jy5jAtcMUb0cwYjiyJbPnf1yP2vjZvAN7JloCsM=
X-Google-Smtp-Source: AK7set9E0fDgYOMAjwM1gzKlM6zWrGLc2FbOBfwbJBwFkBrg9zJem7/LBAqKEjhYlOZ3sKIlqEM0TA==
X-Received: by 2002:a17:903:138c:b0:192:d625:ecc4 with SMTP id
 jx12-20020a170903138c00b00192d625ecc4mr495493plb.18.1675203738010; 
 Tue, 31 Jan 2023 14:22:18 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:138e:73d3:502:64f])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a170903231200b0019339f3368asm10377471plh.3.2023.01.31.14.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 14:22:17 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [RFT PATCH v2 1/3] drm/bridge: tc358762: Set pre_enable_prev_first
Date: Tue, 31 Jan 2023 14:18:24 -0800
Message-Id: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
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
Cc: freedreno@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the "pre_enable_prev_first" as provided by commit 4fb912e5e190
("drm/bridge: Introduce pre_enable_prev_first to alter bridge init
order"). This should allow us to revert commit ec7981e6c614
("drm/msm/dsi: don't powerup at modeset time for parade-ps8640") and
commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
time").

Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/tc358762.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 0b6a28436885..77f7f7f54757 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -229,6 +229,7 @@ static int tc358762_probe(struct mipi_dsi_device *dsi)
 	ctx->bridge.funcs = &tc358762_bridge_funcs;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_DPI;
 	ctx->bridge.of_node = dev->of_node;
+	ctx->bridge.pre_enable_prev_first = true;
 
 	drm_bridge_add(&ctx->bridge);
 
-- 
2.39.1.456.gfc5497dd1b-goog


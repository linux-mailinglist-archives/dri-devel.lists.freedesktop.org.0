Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E70437CB06E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 18:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B8210E23C;
	Mon, 16 Oct 2023 16:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BB710E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 16:54:07 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-405361bba99so43771335e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 09:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697475245; x=1698080045; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gh1i1qC5dBtLH8fnR85p04AUelnLL/86pQbMA34ZucQ=;
 b=CZ6QNic3Sam151TdnjinoyKpzFv+5w13r7nDCr+2sjGYhYJDFoYPU6YBhoYwgFG2Xr
 6E1nisLiouD1EN9PpaMOQc3tpusVESQSR+4fFPWpHrYT6NXfiyaVSpIXF9ZmKbmVcdH0
 3HB+fi3JG055I04xygfo24fCFcBlaUTAc365poegcTxz3PlQ3zV5g1cIHYxm6BPVLJe9
 HRDGDokPRaWHK5w1bqqT6GvUhMbE1kLdgZPu6qxkQiY6Can9325qMEScIj3lJlpdYaGB
 qbkjv4Ww4jVtpb6wXkZnlMh+aSI92vamnVuY6QbC6zHvcojEXammM5HqmWszTDpRdhe9
 SiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697475245; x=1698080045;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gh1i1qC5dBtLH8fnR85p04AUelnLL/86pQbMA34ZucQ=;
 b=eFxtHxmEixqov4fX00O5wYD8uPADTGjqYZ4Ec5cEoz4xcStpG8MQjeUP1Uc0YOGTgU
 X+XKX0XQA+DEqKYBQ363HcIdH5qCq8ra0U+VQpkvb1xfJfAmvcFLRJQQZ1O9lLxAdja5
 7aUuoPBRBg3qDG72y9eImmmLm7D5zjCCOgrAZ/KscMj1NVw+R2kGHM0kv+Pf5dKtOmzB
 iUKBCEHNSijPTggM0Gu8q/Nl3W1pRKkH8Y/g47vCD+S/s1uWphDBCmeRISIQagMb9NnC
 kbaPcw8bNx5Zktw6qmiteAkFGwwwkmZIAqeO+aaz8si4bcBI0jyZcUq5zzqvLx9r/pQN
 3i+Q==
X-Gm-Message-State: AOJu0Yykq9piyrFc5uZv8hcOqzgy3kuI+R32WjYADsrHDPAxDz1GQU5n
 5uznALfk4SORKdS86b4YKjl9/A==
X-Google-Smtp-Source: AGHT+IE0ZfNIwOf9qoBMcCLzP2Zitib4HQoRxmYe1CQIkuDQPdAYbM6sYWt+8StvzHVCWDqd+MMgNA==
X-Received: by 2002:a7b:c419:0:b0:3fe:d630:f568 with SMTP id
 k25-20020a7bc419000000b003fed630f568mr29322698wmi.39.1697475245495; 
 Mon, 16 Oct 2023 09:54:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([45.84.211.189])
 by smtp.gmail.com with ESMTPSA id
 s19-20020a05600c45d300b0040648217f4fsm7638996wmo.39.2023.10.16.09.54.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Oct 2023 09:54:05 -0700 (PDT)
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
Subject: [RFC PATCH 04/10] drm/msm/dsi: use dsi_mgr_bridge_power_off in
 dsi_mgr_bridge_post_disable
Date: Mon, 16 Oct 2023 19:53:49 +0300
Message-ID: <20231016165355.1327217-5-dmitry.baryshkov@linaro.org>
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

Simplify dsi_mgr_bridge_post_disable() by using
dsi_mgr_bridge_power_off() instead of hand-coding the same call
sequence.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 896f369fdd53..9fa1f29ec11a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -372,8 +372,10 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 	 * It is safe to call dsi_mgr_phy_disable() here because a single PHY
 	 * won't be diabled until both PHYs request disable.
 	 */
-	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
-		goto disable_phy;
+	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id)) {
+		dsi_mgr_phy_disable(id);
+		return;
+	}
 
 	ret = msm_dsi_host_disable(host);
 	if (ret)
@@ -385,26 +387,10 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 			pr_err("%s: host1 disable failed, %d\n", __func__, ret);
 	}
 
-	msm_dsi_host_disable_irq(host);
-	if (is_bonded_dsi && msm_dsi1)
-		msm_dsi_host_disable_irq(msm_dsi1->host);
-
 	/* Save PHY status if it is a clock source */
 	msm_dsi_phy_pll_save_state(msm_dsi->phy);
 
-	ret = msm_dsi_host_power_off(host);
-	if (ret)
-		pr_err("%s: host %d power off failed,%d\n", __func__, id, ret);
-
-	if (is_bonded_dsi && msm_dsi1) {
-		ret = msm_dsi_host_power_off(msm_dsi1->host);
-		if (ret)
-			pr_err("%s: host1 power off failed, %d\n",
-								__func__, ret);
-	}
-
-disable_phy:
-	dsi_mgr_phy_disable(id);
+	dsi_mgr_bridge_power_off(bridge);
 }
 
 static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
-- 
2.42.0


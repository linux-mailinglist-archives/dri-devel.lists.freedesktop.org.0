Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D88A456D0D3
	for <lists+dri-devel@lfdr.de>; Sun, 10 Jul 2022 20:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5778A18A8E8;
	Sun, 10 Jul 2022 18:45:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297E818A8DF
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 18:45:42 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id bn33so3932593ljb.13
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 11:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uWwdgVhw97ycQZv8C/Sh0UEbnMAmSyLV+RkBre0LXe8=;
 b=VM59dWdakzh5XQwNICK6kXEEo+YWwiCVy9JGbP2JY5W6Y0kvU1OHuBZJBMFg2Hvce5
 c7FxYxH1HATW4UfDyk5KLRqgWx94ckF7ge1rihrl/atMrsUo2R4q8tEwC2JgOXgiGw2Z
 cuOTpgg1JRo8fStkzOMwcl1mLNHkR2YFO/yhiD0ZsyVxv/xeWD3bcge4mpFZ91SLib2V
 5tDd8W6ESihmQKkDYyxw4GERoPV4u5L+0njRB0htab1ioKOLxk8SsvwhACYGXyA8vBFs
 WqS+PcxOp2Z4LMD4tY4a7vqlMcHwa28YyNeLPuJsHuxPrqPjj9unesNAyZQrWJjG+y4S
 OXcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uWwdgVhw97ycQZv8C/Sh0UEbnMAmSyLV+RkBre0LXe8=;
 b=KjIUUZw87zY5u4QVwYeGeBaR90O4D0lToOD2qY0Zs7VigW9AC/mmzXeoH8EzyKUGT3
 J2W4+0oIp9wU59+lpFIjDIfd//Zd2NBExYONHw6rMMfV5DVHQwQc0OKMCPLA8DNvtz+f
 s1uMjp2XnZuRLkEpexyeeVk8V/68+py5JMiGv37z6XEaz7GxXSqpP3Di9yIDvs1EOe6v
 Ucedntds7guQhh0jT5VX8HZeKKUk5pXBnpN6kGxoFTy+vPrbSZX0eXWmbFh1ELT8LZ2c
 t8rxRhUb7erGA+12cd6AlZXeyO4hUaLRoRGMrsNzHrYSnVNeg0eSSPs38sxD8TV7tDT1
 9chQ==
X-Gm-Message-State: AJIora9Hd1KM4cywervXuSrYLjfkZ3HgzPeyLLrDnBo6JGN3zaPAqWoU
 YhE3VQuTXh9Fii9BZzjxHnGsCA==
X-Google-Smtp-Source: AGRyM1vc2XvQcEV3NW4pR+bqJctZPGBZRBAOO5hfwQBC6CMtGP22NXTaB+XZ0SdndD67zQAcAfdasw==
X-Received: by 2002:a05:651c:508:b0:25b:b0e4:8a0f with SMTP id
 o8-20020a05651c050800b0025bb0e48a0fmr8063260ljp.72.1657478740219; 
 Sun, 10 Jul 2022 11:45:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c21-20020a056512325500b0047255d21132sm1051562lfr.97.2022.07.10.11.45.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 11:45:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>
Subject: [RFC PATCH 1/3] drm/bridge: ti-sn65dsi86: switch to atomic ops
Date: Sun, 10 Jul 2022 21:45:34 +0300
Message-Id: <20220710184536.172705-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
References: <20220710184536.172705-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make ti-sn65dsi86 use atomic_enable / atomic_disable / atomic_pre_enable
/ atomic_post_disable rather than their non-atomic versions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 8cad662de9bb..01171547f638 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -752,7 +752,8 @@ ti_sn_bridge_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-static void ti_sn_bridge_disable(struct drm_bridge *bridge)
+static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
+					struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
@@ -1011,7 +1012,8 @@ static int ti_sn_link_training(struct ti_sn65dsi86 *pdata, int dp_rate_idx,
 	return ret;
 }
 
-static void ti_sn_bridge_enable(struct drm_bridge *bridge)
+static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
+				       struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 	const char *last_err_str = "No supported DP rate";
@@ -1080,7 +1082,8 @@ static void ti_sn_bridge_enable(struct drm_bridge *bridge)
 			   VSTREAM_ENABLE);
 }
 
-static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
+static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
+					   struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
@@ -1093,7 +1096,8 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
 	usleep_range(100, 110);
 }
 
-static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
+static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
+					     struct drm_bridge_state *old_bridge_state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
@@ -1114,10 +1118,10 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
 	.mode_valid = ti_sn_bridge_mode_valid,
-	.pre_enable = ti_sn_bridge_pre_enable,
-	.enable = ti_sn_bridge_enable,
-	.disable = ti_sn_bridge_disable,
-	.post_disable = ti_sn_bridge_post_disable,
+	.atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
+	.atomic_enable = ti_sn_bridge_atomic_enable,
+	.atomic_disable = ti_sn_bridge_atomic_disable,
+	.atomic_post_disable = ti_sn_bridge_atomic_post_disable,
 };
 
 static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
-- 
2.35.1


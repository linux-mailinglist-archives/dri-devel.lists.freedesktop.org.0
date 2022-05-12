Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D24525699
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 22:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2021210F464;
	Thu, 12 May 2022 20:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C1810F464
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 20:52:26 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id l11so5618294pgt.13
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 13:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Ies45XQh7ymdD5acJILStC2yG/IlgiJIKbLY52H88Q=;
 b=Zc+8sBWS1pojS7k/yPaJKk9BjzB/ATYdrEE1H/xsCuyenIYW19LxvPheqCeXWPmZrD
 OOdoPh+6HS1wB5oA53VwSqlqDOQqR1G1jmoJCMF8PDHBQPQX4IM6t2ImiFcbjqaLE5Nt
 EERMlp16x35JlLgCeCl/sSNUXfn8TWUZfRE+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Ies45XQh7ymdD5acJILStC2yG/IlgiJIKbLY52H88Q=;
 b=vV3/p/wQlzsYe75qNEmGP+hrQfjtHGU1zIhGN89vlgIss/AL2Mw/BAPSwKGTMo6sjb
 GErhxOM08pWAe673OOkjiGXCOtjc763qiJRt5LaM9BaasRoDM33CAB0se9ldARW3c7rp
 hMoSZ8E/ZROogqmZ7LWgyEw5RFj4Tq749fBwlWCeCsrVaC6RjNmnn//YhwdU8kMpGpVg
 4sDp1zTviNnu18Vv5qnp7hzsxre7oK1WNGbX1KMZPnx4A6poDF8mA/S4dUBq7hwcvukR
 hpYHdxcFcSBLm7zBWbrYB0mkXc6+/33Dfxjdi0B/lP2n9RbKTBqdh19nFu9gugLV3nja
 bcaw==
X-Gm-Message-State: AOAM5324ODf0eKD2QL6VaNH71jsVUZ8zbqTjB698fGf1lyX2G97j+mAT
 dzTeOwyQwm9YbiXpNzeMS285pA==
X-Google-Smtp-Source: ABdhPJxegJvQdMeDYnLXr1pjy2t9mHEjDACmKnVCoEdKhoZ9MnnfrVqDUATBEGvOT8sgCIE9Jo6b7Q==
X-Received: by 2002:a63:1d5f:0:b0:3c6:e822:2eb1 with SMTP id
 d31-20020a631d5f000000b003c6e8222eb1mr1122541pgm.99.1652388746275; 
 Thu, 12 May 2022 13:52:26 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:1ee3:ea22:908:c2b5])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a170902a3cf00b0015eddb8e450sm370681plb.25.2022.05.12.13.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 13:52:25 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3] drm/msm/dsi: only powerup at modeset time if
 "early_poweron" modparam
Date: Thu, 12 May 2022 13:52:18 -0700
Message-Id: <20220512135134.v3.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
time") caused sc7180 Chromebooks that use the parade-ps8640 bridge
chip to fail to turn the display back on after it turns off.

Unfortunately, it doesn't look easy to fix the parade-ps8640 driver to
handle the new power sequence. The Linux driver has almost nothing in
it and most of the logic for this bridge chip is in black-box firmware
that the bridge chip uses.

Also unfortunately, reverting the patch will break "tc358762".

The long term solution here is probably Dave Stevenson's series [1]
that would give more flexibility. However, that is likely not a quick
fix.

For the short term, let's introduce a module parameter that selects
between the two behaviors. This is a short term hack but at least can
keep both users working. We'll default the value of the module
parameter to the old behavior. Given that the old behavior has existed
for longer it's probably a safer default.

[1] https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com

Fixes: 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset time")
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- No longer a revert; now a module parameter.

Changes in v2:
- Remove the mud from my face.

 drivers/gpu/drm/msm/dsi/dsi_manager.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 50b987658b1f..2bf4123ef5df 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -34,6 +34,10 @@ static struct msm_dsi_manager msm_dsim_glb;
 #define IS_SYNC_NEEDED()	(msm_dsim_glb.is_sync_needed)
 #define IS_MASTER_DSI_LINK(id)	(msm_dsim_glb.master_dsi_link_id == id)
 
+bool early_poweron;
+MODULE_PARM_DESC(early_poweron, "Power DSI controller early");
+module_param(early_poweron, bool, 0600);
+
 static inline struct msm_dsi *dsi_mgr_get_dsi(int id)
 {
 	return msm_dsim_glb.dsi[id];
@@ -389,6 +393,9 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
 		return;
 
+	if (!early_poweron)
+		dsi_mgr_bridge_power_on(bridge);
+
 	/* Always call panel functions once, because even for dual panels,
 	 * there is only one drm_panel instance.
 	 */
@@ -570,7 +577,8 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
 	if (is_bonded_dsi && other_dsi)
 		msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
 
-	dsi_mgr_bridge_power_on(bridge);
+	if (early_poweron)
+		dsi_mgr_bridge_power_on(bridge);
 }
 
 static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
-- 
2.36.0.550.gb090851708-goog


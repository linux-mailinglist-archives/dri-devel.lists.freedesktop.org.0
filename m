Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA3652577E
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 00:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3046A10E1F1;
	Thu, 12 May 2022 22:00:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC2A10E1F1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 22:00:22 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id l11so5744133pgt.13
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 15:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iikW8QS8TpzbUeweqVeTDabVov5E8PqyReNc2ipRCRc=;
 b=lxXEYTpUlVbp7/gWafx4J0U6nERWMognhGgUBrfhDOydyfR0ZQcfzRgWIgXu1UAGhw
 paqt9jdPdnZ2N2MyaAs8u0k1PvI8hsFDiOvNmaAap9i91fz3eNYIlDek68hU3ePGoGvP
 uim39BuC4jITGq5QKZLX1jBt4rQywAvsj5YMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iikW8QS8TpzbUeweqVeTDabVov5E8PqyReNc2ipRCRc=;
 b=rwx+UOakUZdO/w5cCF3xi62QDqpsD3D55igeJp3HxIGp7ed62sPL+B4X2mgTtGAEmk
 ytcPfSwwojbUBnJaFpgeqxokH7d8MB2N7sDh1qXHFghasZQnfWCulMa3DXpxSE6KEOJJ
 O5itfsXEgbe+NiVP6KerNyms61dN1KW0HBHdNKQ484GfVARCaiENUbLzxZT7Ht+VnTw5
 bmd3khdQ8B7wq+/Q3sCAFHf/06YaCe5TknNou0VgdiDNVf5da+6Qz+ZNZsrfUwwS9uZB
 IwiZU0TL6DXYC68EMxeThPIMk6y0SSDHr5FQAPX5e1X+7VtHyGaOmmYEYVRPZ2jzMG++
 42fw==
X-Gm-Message-State: AOAM530qkXRxBFsjQjLjjjnog5d9Vc/kF4Og8RdpkqrmAI3GED1fzIxn
 Km9BJw/SFFGngE9aOUzXa6wf51qBNom/AdVnMOg=
X-Google-Smtp-Source: ABdhPJw9aRmDxVL7y0M188RGO+VFsV1/Qwg8lEzhMJ5GicGC9AFBWblGxMqq8rvCWfqktrSpCiP2gA==
X-Received: by 2002:a63:e5d:0:b0:3aa:3c53:537e with SMTP id
 29-20020a630e5d000000b003aa3c53537emr1316997pgo.622.1652392821629; 
 Thu, 12 May 2022 15:00:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:1ee3:ea22:908:c2b5])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a170903234300b0015e8d4eb1f6sm406847plh.64.2022.05.12.15.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 15:00:21 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4] drm/msm/dsi: don't powerup at modeset time for
 parade-ps8640
Date: Thu, 12 May 2022 15:00:16 -0700
Message-Id: <20220512145954.v4.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
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

For the short term, we'll look at the compatible of the next bridge in
the chain and go back to the old way for the Parade PS8640 bridge
chip. If it's found that other bridge chips also need this workaround
then we can add them to the list or consider inverting the condition.

[1] https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com

Fixes: 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset time")
Suggested-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Note that, unlike `struct device`, `struct drm_bridge` still has a
`#ifdef` around the `of_node`. The extra stub function in this patch
is to make sure that we can pass COMPILE_TEST, not because I expect
that we'll actually run into real users who are running this driver
without device tree.

Changes in v4:
- Use the compatible string of the next bridge as per Rob.

Changes in v3:
- No longer a revert; now a module parameter.

Changes in v2:
- Remove the mud from my face.

 drivers/gpu/drm/msm/dsi/dsi_manager.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 50b987658b1f..2cabba65a8f1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -34,6 +34,26 @@ static struct msm_dsi_manager msm_dsim_glb;
 #define IS_SYNC_NEEDED()	(msm_dsim_glb.is_sync_needed)
 #define IS_MASTER_DSI_LINK(id)	(msm_dsim_glb.master_dsi_link_id == id)
 
+#ifdef CONFIG_OF
+static bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
+{
+	struct drm_bridge *next_bridge = drm_bridge_get_next_bridge(bridge);
+
+	/*
+	 * If the next bridge in the chain is the Parade ps8640 bridge chip
+	 * then don't power on early since it seems to violate the expectations
+	 * of the firmware that the bridge chip is running.
+	 */
+	return !(next_bridge && next_bridge->of_node &&
+		 of_device_is_compatible(next_bridge->of_node, "parade,ps8640"));
+}
+#else
+static inline bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
+{
+	return true;
+}
+#endif
+
 static inline struct msm_dsi *dsi_mgr_get_dsi(int id)
 {
 	return msm_dsim_glb.dsi[id];
@@ -389,6 +409,9 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
 		return;
 
+	if (!dsi_mgr_power_on_early(bridge))
+		dsi_mgr_bridge_power_on(bridge);
+
 	/* Always call panel functions once, because even for dual panels,
 	 * there is only one drm_panel instance.
 	 */
@@ -570,7 +593,8 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
 	if (is_bonded_dsi && other_dsi)
 		msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
 
-	dsi_mgr_bridge_power_on(bridge);
+	if (dsi_mgr_power_on_early(bridge))
+		dsi_mgr_bridge_power_on(bridge);
 }
 
 static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
-- 
2.36.0.550.gb090851708-goog


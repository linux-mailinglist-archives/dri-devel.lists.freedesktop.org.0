Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1F768394A
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 23:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D8E10E39C;
	Tue, 31 Jan 2023 22:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D81BF10E331
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 22:22:20 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id o13so15562369pjg.2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 14:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j5glDXJkyFINglXsI3CpTvLcxwtU2p5GQD+LTvj3ho8=;
 b=MGYqySJ7a5kOGrLxSVQTPuNDc/2i1t8bijwCZ2YqVvkywI/2SY7K2dp5DEpanE58ou
 5CI8vflM9byl63JTOFbRovm/6YmyFXqPx9tiYqmFZa711b972HDbYoaOpZi+myKKl/ih
 PI4VRMMdTjfoaCIDpIh1gU69YoQ7G4ejpB6rU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j5glDXJkyFINglXsI3CpTvLcxwtU2p5GQD+LTvj3ho8=;
 b=tXiXwiFSrN4AuzszZwbaCjgColDRtr5nR+vtRY8VzaNG79tAzfLMcXgLlILiwDlqbt
 sI6ccQxTJ7R7p0cVwbPJln9psKk+pnz0sI4Eb9h8tQdnXVnu4v5wtSr7+lJIc0D2V2BI
 H1GqYph2pNL3aZmfIU1R8Dn9RJX1jrTfoHoBXV/2xeuvSAOrsW+UTSBYnJx04NPUNw5V
 pGRzQibkLU5wH9YsDt9+Te7JnZlHHzp+33LJyyof6SkmAUtEiBj+1iyghLLNkfKz6m6x
 csIyjwSwuf41Hflx2RYlHmzQ3TMdAgg6lof0t/xlChIEvndaKOIOAuGWu+Q6AbL8722G
 xbUA==
X-Gm-Message-State: AO0yUKXpvpxFtuATaIttzZ2+GCJJr3AG9+t+Wnu9MNCNcYopDyuCn24i
 ldnjrn5ZzDOqt7Jr9OQ9UoIjKMJSyTtbnUJYxD8=
X-Google-Smtp-Source: AK7set/vdtVQvcQCXnftetWCbiq+pqLmSdMtnxFVEzrxkzoFDK72yZdFiwd4rzHSNyHuN5/l24rnFw==
X-Received: by 2002:a17:902:f68b:b0:196:8158:fa8c with SMTP id
 l11-20020a170902f68b00b001968158fa8cmr765818plg.11.1675203739996; 
 Tue, 31 Jan 2023 14:22:19 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:138e:73d3:502:64f])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a170903231200b0019339f3368asm10377471plh.3.2023.01.31.14.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 14:22:19 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [RFT PATCH v2 2/3] drm/msm/dsi: Stop unconditionally powering up DSI
 hosts at modeset
Date: Tue, 31 Jan 2023 14:18:25 -0800
Message-Id: <20230131141756.RFT.v2.2.I4cfeab9d0e07e98ead23dd0736ab4461e6c69002@changeid>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
In-Reply-To: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
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

In commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
time"), we moved powering up DSI hosts to modeset time. This wasn't
because it was an elegant design, but there were no better options.

That commit actually ended up breaking ps8640, and thus was born
commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time for
parade-ps8640") as a temporary hack to un-break ps8640 by moving it to
the old way of doing things. It turns out that ps8640 _really_ doesn't
like its pre_enable() function to be called after
dsi_mgr_bridge_power_on(). Specifically (from experimentation, not
because I have any inside knowledge), it looks like the assertion of
"RST#" in the ps8640 runtime resume handler seems like it's not
allowed to happen after dsi_mgr_bridge_power_on()

Recently, Dave Stevenson's series landed allowing bridges some control
over pre_enable ordering. The meaty commit for our purposes is commit
4fb912e5e190 ("drm/bridge: Introduce pre_enable_prev_first to alter
bridge init order"). As documented by that series, if a bridge doesn't
set "pre_enable_prev_first" then we should use the old ordering.

Now that we have the commit ("drm/bridge: tc358762: Set
pre_enable_prev_first") we can go back to the old ordering, which also
allows us to remove the ps8640 special case.

One last note is that even without reverting commit 7d8e9a90509f
("drm/msm/dsi: move DSI host powerup to modeset time"), if you _just_
revert the ps8640 special case and try it out then it doesn't seem to
fail anymore. I spent time bisecting / debugging this and it turns out
to be mostly luck, so we still want this patch to make sure it's
solid. Specifically the reason it sorta works these days is because
we implemented wait_hpd_asserted() in ps8640 now, plus the magic of
"pm_runtime" autosuspend. The fact that we have wait_hpd_asserted()
implemented means that we actually power the bridge chip up just a wee
bit earlier and then the bridge happens to stay on because of
autosuspend and thus ends up powered before dsi_mgr_bridge_power_on().

Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Don't fold dsi_mgr_bridge_power_on() back into dsi_mgr_bridge_pre_enable()

 drivers/gpu/drm/msm/dsi/dsi_manager.c | 38 +--------------------------
 1 file changed, 1 insertion(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 1bbac72dad35..2197a54b9b96 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -34,32 +34,6 @@ static struct msm_dsi_manager msm_dsim_glb;
 #define IS_SYNC_NEEDED()	(msm_dsim_glb.is_sync_needed)
 #define IS_MASTER_DSI_LINK(id)	(msm_dsim_glb.master_dsi_link_id == id)
 
-#ifdef CONFIG_OF
-static bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
-{
-	struct drm_bridge *next_bridge = drm_bridge_get_next_bridge(bridge);
-
-	/*
-	 * If the next bridge in the chain is the Parade ps8640 bridge chip
-	 * then don't power on early since it seems to violate the expectations
-	 * of the firmware that the bridge chip is running.
-	 *
-	 * NOTE: this is expected to be a temporary special case. It's expected
-	 * that we'll eventually have a framework that allows the next level
-	 * bridge to indicate whether it needs us to power on before it or
-	 * after it. When that framework is in place then we'll use it and
-	 * remove this special case.
-	 */
-	return !(next_bridge && next_bridge->of_node &&
-		 of_device_is_compatible(next_bridge->of_node, "parade,ps8640"));
-}
-#else
-static inline bool dsi_mgr_power_on_early(struct drm_bridge *bridge)
-{
-	return true;
-}
-#endif
-
 static inline struct msm_dsi *dsi_mgr_get_dsi(int id)
 {
 	return msm_dsim_glb.dsi[id];
@@ -265,12 +239,6 @@ static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
 	int ret;
 
 	DBG("id=%d", id);
-	if (!msm_dsi_device_connected(msm_dsi))
-		return;
-
-	/* Do nothing with the host if it is slave-DSI in case of bonded DSI */
-	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
-		return;
 
 	ret = dsi_mgr_phy_enable(id, phy_shared_timings);
 	if (ret)
@@ -327,8 +295,7 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
 		return;
 
-	if (!dsi_mgr_power_on_early(bridge))
-		dsi_mgr_bridge_power_on(bridge);
+	dsi_mgr_bridge_power_on(bridge);
 
 	ret = msm_dsi_host_enable(host);
 	if (ret) {
@@ -438,9 +405,6 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
 	msm_dsi_host_set_display_mode(host, adjusted_mode);
 	if (is_bonded_dsi && other_dsi)
 		msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
-
-	if (dsi_mgr_power_on_early(bridge))
-		dsi_mgr_bridge_power_on(bridge);
 }
 
 static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
-- 
2.39.1.456.gfc5497dd1b-goog


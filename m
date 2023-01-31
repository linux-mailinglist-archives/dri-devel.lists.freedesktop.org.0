Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D34683949
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 23:22:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10F7010E39A;
	Tue, 31 Jan 2023 22:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DCE810E39A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 22:22:23 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so137522pjq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 14:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rXDYbKDbTfFR4g/Nh4bZjHD3KmThZ7Sh2niPtOlScU0=;
 b=CbHl3tEqDWlEJUBNu9QPcromD2gQpIqbwlCkQjXXAScaqPJL/MvAW1LggsaGBn4gNL
 b5n3pTdKMYTrJUhufb291yU3gE0pxFAKrD2N+pY6CCVlDjVyr7AKStrg8h+xoBHaKfVf
 VpgpdnzQkmCa+/5FPFl2/EymlbNT7QZ0AVRtc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rXDYbKDbTfFR4g/Nh4bZjHD3KmThZ7Sh2niPtOlScU0=;
 b=6LlnSf0O98LXc8CZxCgsU0Q8zLLurdhdXTWqeam9QrKbYzavTFPlmtmxQphod7xhGV
 An/QvzB3OfztAR5ikpyv2JUIEq5dV62m7YtzT0GJTHkReaJl4IGQb16wNEwvVzZbeych
 2gLO+OH8y7Oz/T7/ngfFhYujQFV2gjfh+Eh/YqpxX8LxCrNiS5OsJnTzW89YeYylX0+h
 gV2BhmfHtsQNIt36RPEtep+W+MAE+1gzT9Qre2NSqq70NwFcMYFAxJwDrVpLOKhRDDUE
 2nQJgHBtuiS3HaCesdPQ8MTBt6QxVhGyTG5m31cZUdIT5jcFv2JYunuQVTxv/dhGz4wQ
 5ABQ==
X-Gm-Message-State: AO0yUKUzE0+yVMIQBXKfmWex60wFZxvfRH0zeMd2SoXCxeDeq37V8flg
 3+pW8Zq5Rkl3sPDh5cUswrYhSRDomtaH8BNPSag=
X-Google-Smtp-Source: AK7set9KafniYlXlikUNcVsRH/xqACci19OB3GKcIucm86pRwywvb5ce+kHpCziKTrpY5ykvp6RiFw==
X-Received: by 2002:a17:903:2312:b0:196:8cf4:9ca7 with SMTP id
 d18-20020a170903231200b001968cf49ca7mr684707plh.19.1675203741972; 
 Tue, 31 Jan 2023 14:22:21 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:138e:73d3:502:64f])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a170903231200b0019339f3368asm10377471plh.3.2023.01.31.14.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 14:22:21 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [RFT PATCH v2 3/3] drm/msm/dsi: More properly handle errors in
 regards to dsi_mgr_bridge_power_on()
Date: Tue, 31 Jan 2023 14:18:26 -0800
Message-Id: <20230131141756.RFT.v2.3.I3c87b53c4ab61a7d5e05f601a4eb44c7e3809a01@changeid>
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
time") the error handling with regards to dsi_mgr_bridge_power_on()
got a bit worse. Specifically if we failed to power the bridge on then
nothing would really notice. The modeset function couldn't return an
error and thus we'd blindly go forward and try to do the pre-enable.

In commit ec7981e6c614 ("drm/msm/dsi: don't powerup at modeset time
for parade-ps8640") we added a special case to move the powerup back
to pre-enable time for ps8640. When we did that, we didn't try to
recover the old/better error handling just for ps8640.

In the patch ("drm/msm/dsi: Stop unconditionally powering up DSI hosts
at modeset") we've now moved the powering up back to exclusively being
during pre-enable. That means we can add the better error handling
back in, so let's do it. To do so we'll add a new function
dsi_mgr_bridge_power_off() that's matches how errors were handled
prior to commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to
modeset time").

NOTE: Now that we have dsi_mgr_bridge_power_off(), it feels as if we
should be calling it in dsi_mgr_bridge_post_disable(). That would make
some sense, but doing so would change the current behavior and thus
should be a separate patch. Specifically:
* dsi_mgr_bridge_post_disable() always calls dsi_mgr_phy_disable()
  even in the slave-DSI case of bonded DSI. We'd need to add special
  handling for this if it's truly needed.
* dsi_mgr_bridge_post_disable() calls msm_dsi_phy_pll_save_state()
  midway through the poweroff.
* dsi_mgr_bridge_post_disable() has a different order of some of the
  poweroffs / IRQ disables.
For now we'll leave dsi_mgr_bridge_post_disable() alone.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("More properly handle errors...") new for v2.

 drivers/gpu/drm/msm/dsi/dsi_manager.c | 32 ++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 2197a54b9b96..28b8012a21f2 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -228,7 +228,7 @@ static void msm_dsi_manager_set_split_display(u8 id)
 	}
 }
 
-static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
+static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
 {
 	int id = dsi_mgr_bridge_get_id(bridge);
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
@@ -268,14 +268,31 @@ static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
 	if (is_bonded_dsi && msm_dsi1)
 		msm_dsi_host_enable_irq(msm_dsi1->host);
 
-	return;
+	return 0;
 
 host1_on_fail:
 	msm_dsi_host_power_off(host);
 host_on_fail:
 	dsi_mgr_phy_disable(id);
 phy_en_fail:
-	return;
+	return ret;
+}
+
+static void dsi_mgr_bridge_power_off(struct drm_bridge *bridge)
+{
+	int id = dsi_mgr_bridge_get_id(bridge);
+	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
+	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
+	struct mipi_dsi_host *host = msm_dsi->host;
+	bool is_bonded_dsi = IS_BONDED_DSI();
+
+	msm_dsi_host_disable_irq(host);
+	if (is_bonded_dsi && msm_dsi1) {
+		msm_dsi_host_disable_irq(msm_dsi1->host);
+		msm_dsi_host_power_off(msm_dsi1->host);
+	}
+	msm_dsi_host_power_off(host);
+	dsi_mgr_phy_disable(id);
 }
 
 static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
@@ -295,7 +312,11 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
 		return;
 
-	dsi_mgr_bridge_power_on(bridge);
+	ret = dsi_mgr_bridge_power_on(bridge);
+	if (ret) {
+		dev_err(&msm_dsi->pdev->dev, "Power on failed: %d\n", ret);
+		return;
+	}
 
 	ret = msm_dsi_host_enable(host);
 	if (ret) {
@@ -316,8 +337,7 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 host1_en_fail:
 	msm_dsi_host_disable(host);
 host_en_fail:
-
-	return;
+	dsi_mgr_bridge_power_off(bridge);
 }
 
 void msm_dsi_manager_tpg_enable(void)
-- 
2.39.1.456.gfc5497dd1b-goog


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462F88901F4
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 15:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CE5112469;
	Thu, 28 Mar 2024 14:35:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s6mXgQ3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD07B112468;
 Thu, 28 Mar 2024 14:35:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3A52561798;
 Thu, 28 Mar 2024 14:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D270C4166B;
 Thu, 28 Mar 2024 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711636529;
 bh=Kr9lQ3sO2i8J+JqxBgX/JkrQt58EHLLHgmBCd+Xz7iY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=s6mXgQ3VfJMRXPIHeqp54ulRg1m7Q8tLnbwpIR1GiaLXoMvoJLtEybBSe8lHYHb0o
 7k7rikFnytieQPO0JXQkRSY9HgsKoH5CMPfpdKFAQNSpqqVMm/QWOMK+/K9aOqZihD
 SqYWJ6pg1s+pj0n1E9CVVwUrvFMJtFpr2IqfUnlyICq98oQ4xgMdjDWr6vsXnAVb6u
 fGPsyPEgkcmM9Jb/jsivc9J3zpjumLKxVV9jWqgCJJO3zteRg03vrpZ2lT86qczji3
 zERN52E2SKLqk9qh1wzr8XWlFFbpwrlhb32WHaREUcXx6ZKOeARQZggCLOmiZmEAAo
 7jnieO1JfadhQ==
From: Bjorn Andersson <andersson@kernel.org>
Date: Thu, 28 Mar 2024 07:40:05 -0700
Subject: [PATCH v2 6/6] drm/msm/dp: Use function arguments for audio operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240328-msm-dp-cleanup-v2-6-a5aed9798d32@quicinc.com>
References: <20240328-msm-dp-cleanup-v2-0-a5aed9798d32@quicinc.com>
In-Reply-To: <20240328-msm-dp-cleanup-v2-0-a5aed9798d32@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=8343;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=LkCwztOrVV+hfqYB41Cl8YqF/cppd90OpyDB9gSFXnA=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmBYFIC0R8+CRkJwGR7ZPxfU8HQh/c3dF+taX28
 mTd0sRZ4DeJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZgWBSBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWRuA/5AUu0jBvNPPxQCAtzZNSeEQwpKTLJlBBzNy9rpvf
 KB3kZwAQ/ZtMX7SsvbMdZxuWeKDkenrsQ7ay3kC+xGSzln86OsRJzNgJY3TWkP++flaw9xRErVX
 5LPykqHf1VEYahW+fiiURKOFhIbuZ/kMEZ/a072GSR1JA+D5AQaj83pyaiQMz5HAoSUsP3dVkzv
 8/4tLnISk/qyM30K54DSKwzxm+uY8dvShrp5gNQa5yLv1q9rm335NrzDKlRKCa7S52ZTerVI57C
 2Tnr3hjBIHpfECwOAvZmuLZ0ZLNxwOf8NtF34Rlsz84wsHfGZ3CFG4W+ENPQuY/vPima/UG6Mbw
 RUr4luJ9GJf+8g3HTdbH8sKtkb8MJSPcxwiYnCXSUqg1lh16dZf/u0TQ/WMd/YaqG76Tc2ikZWB
 XGjT7D03SabYVv/WHDYqNZ5FSzm1UzobPnVySd2/dgfwrDbfJs5vMGux/s1QuZgtaJ3kBYo09JH
 LC8BcfCMPVPq4diYYmGkbjJoYOPQrClEm0Cu5BdxwqX2w1vuNVm0+nh4NljeGQrzFlQME3EAmxW
 pA0fzyW9+gT0zI7iYozxGKiuO9lRmmgnaBtQZXhb9MyuRWO/4vYidLBjO+Yz7FEnL05Gr9K6f6s
 M+7JXR60U6nbN5/W4hEEe0j9GktxdRh2iirFjKyMmEjs=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The dp_audio read and write operations uses members in struct dp_catalog
for passing arguments and return values. This adds unnecessary
complexity to the implementation, as it turns out after detangling the
logic that no state is actually held in these variables.

Clean this up by using function arguments and return values for passing
the data.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 20 +++++--------------
 drivers/gpu/drm/msm/dp/dp_catalog.c | 39 +++++++++++++------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 18 +++++++++--------
 3 files changed, 28 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 7fd0c1793ba3..a599fc5d63c5 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -32,11 +32,7 @@ static u32 dp_audio_get_header(struct dp_catalog *catalog,
 		enum dp_catalog_audio_sdp_type sdp,
 		enum dp_catalog_audio_header_type header)
 {
-	catalog->sdp_type = sdp;
-	catalog->sdp_header = header;
-	dp_catalog_audio_get_header(catalog);
-
-	return catalog->audio_data;
+	return dp_catalog_audio_get_header(catalog, sdp, header);
 }
 
 static void dp_audio_set_header(struct dp_catalog *catalog,
@@ -44,10 +40,7 @@ static void dp_audio_set_header(struct dp_catalog *catalog,
 		enum dp_catalog_audio_sdp_type sdp,
 		enum dp_catalog_audio_header_type header)
 {
-	catalog->sdp_type = sdp;
-	catalog->sdp_header = header;
-	catalog->audio_data = data;
-	dp_catalog_audio_set_header(catalog);
+	dp_catalog_audio_set_header(catalog, sdp, header, data);
 }
 
 static void dp_audio_stream_sdp(struct dp_audio_private *audio)
@@ -317,8 +310,7 @@ static void dp_audio_setup_acr(struct dp_audio_private *audio)
 		break;
 	}
 
-	catalog->audio_data = select;
-	dp_catalog_audio_config_acr(catalog);
+	dp_catalog_audio_config_acr(catalog, select);
 }
 
 static void dp_audio_safe_to_exit_level(struct dp_audio_private *audio)
@@ -344,16 +336,14 @@ static void dp_audio_safe_to_exit_level(struct dp_audio_private *audio)
 		break;
 	}
 
-	catalog->audio_data = safe_to_exit_level;
-	dp_catalog_audio_sfe_level(catalog);
+	dp_catalog_audio_sfe_level(catalog, safe_to_exit_level);
 }
 
 static void dp_audio_enable(struct dp_audio_private *audio, bool enable)
 {
 	struct dp_catalog *catalog = audio->catalog;
 
-	catalog->audio_data = enable;
-	dp_catalog_audio_enable(catalog);
+	dp_catalog_audio_enable(catalog, enable);
 }
 
 static struct dp_audio_private *dp_audio_get_data(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 00ad3ebaa5a1..970d62e1610c 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -1159,34 +1159,28 @@ struct dp_catalog *dp_catalog_get(struct device *dev)
 	return &catalog->dp_catalog;
 }
 
-void dp_catalog_audio_get_header(struct dp_catalog *dp_catalog)
+u32 dp_catalog_audio_get_header(struct dp_catalog *dp_catalog,
+				enum dp_catalog_audio_sdp_type sdp,
+				enum dp_catalog_audio_header_type header)
 {
 	struct dp_catalog_private *catalog;
 	u32 (*sdp_map)[DP_AUDIO_SDP_HEADER_MAX];
-	enum dp_catalog_audio_sdp_type sdp;
-	enum dp_catalog_audio_header_type header;
-
-	if (!dp_catalog)
-		return;
 
 	catalog = container_of(dp_catalog,
 		struct dp_catalog_private, dp_catalog);
 
 	sdp_map = catalog->audio_map;
-	sdp     = dp_catalog->sdp_type;
-	header  = dp_catalog->sdp_header;
 
-	dp_catalog->audio_data = dp_read_link(catalog,
-			sdp_map[sdp][header]);
+	return dp_read_link(catalog, sdp_map[sdp][header]);
 }
 
-void dp_catalog_audio_set_header(struct dp_catalog *dp_catalog)
+void dp_catalog_audio_set_header(struct dp_catalog *dp_catalog,
+				 enum dp_catalog_audio_sdp_type sdp,
+				 enum dp_catalog_audio_header_type header,
+				 u32 data)
 {
 	struct dp_catalog_private *catalog;
 	u32 (*sdp_map)[DP_AUDIO_SDP_HEADER_MAX];
-	enum dp_catalog_audio_sdp_type sdp;
-	enum dp_catalog_audio_header_type header;
-	u32 data;
 
 	if (!dp_catalog)
 		return;
@@ -1195,17 +1189,14 @@ void dp_catalog_audio_set_header(struct dp_catalog *dp_catalog)
 		struct dp_catalog_private, dp_catalog);
 
 	sdp_map = catalog->audio_map;
-	sdp     = dp_catalog->sdp_type;
-	header  = dp_catalog->sdp_header;
-	data    = dp_catalog->audio_data;
 
 	dp_write_link(catalog, sdp_map[sdp][header], data);
 }
 
-void dp_catalog_audio_config_acr(struct dp_catalog *dp_catalog)
+void dp_catalog_audio_config_acr(struct dp_catalog *dp_catalog, u32 select)
 {
 	struct dp_catalog_private *catalog;
-	u32 acr_ctrl, select;
+	u32 acr_ctrl;
 
 	if (!dp_catalog)
 		return;
@@ -1213,7 +1204,6 @@ void dp_catalog_audio_config_acr(struct dp_catalog *dp_catalog)
 	catalog = container_of(dp_catalog,
 		struct dp_catalog_private, dp_catalog);
 
-	select = dp_catalog->audio_data;
 	acr_ctrl = select << 4 | BIT(31) | BIT(8) | BIT(14);
 
 	drm_dbg_dp(catalog->drm_dev, "select: %#x, acr_ctrl: %#x\n",
@@ -1222,10 +1212,9 @@ void dp_catalog_audio_config_acr(struct dp_catalog *dp_catalog)
 	dp_write_link(catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
 }
 
-void dp_catalog_audio_enable(struct dp_catalog *dp_catalog)
+void dp_catalog_audio_enable(struct dp_catalog *dp_catalog, bool enable)
 {
 	struct dp_catalog_private *catalog;
-	bool enable;
 	u32 audio_ctrl;
 
 	if (!dp_catalog)
@@ -1234,7 +1223,6 @@ void dp_catalog_audio_enable(struct dp_catalog *dp_catalog)
 	catalog = container_of(dp_catalog,
 		struct dp_catalog_private, dp_catalog);
 
-	enable = !!dp_catalog->audio_data;
 	audio_ctrl = dp_read_link(catalog, MMSS_DP_AUDIO_CFG);
 
 	if (enable)
@@ -1329,10 +1317,10 @@ void dp_catalog_audio_init(struct dp_catalog *dp_catalog)
 	catalog->audio_map = sdp_map;
 }
 
-void dp_catalog_audio_sfe_level(struct dp_catalog *dp_catalog)
+void dp_catalog_audio_sfe_level(struct dp_catalog *dp_catalog, u32 safe_to_exit_level)
 {
 	struct dp_catalog_private *catalog;
-	u32 mainlink_levels, safe_to_exit_level;
+	u32 mainlink_levels;
 
 	if (!dp_catalog)
 		return;
@@ -1340,7 +1328,6 @@ void dp_catalog_audio_sfe_level(struct dp_catalog *dp_catalog)
 	catalog = container_of(dp_catalog,
 		struct dp_catalog_private, dp_catalog);
 
-	safe_to_exit_level = dp_catalog->audio_data;
 	mainlink_levels = dp_read_link(catalog, REG_DP_MAINLINK_LEVELS);
 	mainlink_levels &= 0xFE0;
 	mainlink_levels |= safe_to_exit_level;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index a82ab4856b50..cd1ad046a953 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -48,9 +48,6 @@ enum dp_catalog_audio_header_type {
 };
 
 struct dp_catalog {
-	enum dp_catalog_audio_sdp_type sdp_type;
-	enum dp_catalog_audio_header_type sdp_header;
-	u32 audio_data;
 	bool wide_bus_en;
 };
 
@@ -114,12 +111,17 @@ void dp_catalog_panel_tpg_disable(struct dp_catalog *dp_catalog);
 struct dp_catalog *dp_catalog_get(struct device *dev);
 
 /* DP Audio APIs */
-void dp_catalog_audio_get_header(struct dp_catalog *catalog);
-void dp_catalog_audio_set_header(struct dp_catalog *catalog);
-void dp_catalog_audio_config_acr(struct dp_catalog *catalog);
-void dp_catalog_audio_enable(struct dp_catalog *catalog);
+u32 dp_catalog_audio_get_header(struct dp_catalog *dp_catalog,
+				enum dp_catalog_audio_sdp_type sdp,
+				enum dp_catalog_audio_header_type header);
+void dp_catalog_audio_set_header(struct dp_catalog *dp_catalog,
+				 enum dp_catalog_audio_sdp_type sdp,
+				 enum dp_catalog_audio_header_type header,
+				 u32 data);
+void dp_catalog_audio_config_acr(struct dp_catalog *catalog, u32 select);
+void dp_catalog_audio_enable(struct dp_catalog *catalog, bool enable);
 void dp_catalog_audio_config_sdp(struct dp_catalog *catalog);
 void dp_catalog_audio_init(struct dp_catalog *catalog);
-void dp_catalog_audio_sfe_level(struct dp_catalog *catalog);
+void dp_catalog_audio_sfe_level(struct dp_catalog *catalog, u32 safe_to_exit_level);
 
 #endif /* _DP_CATALOG_H_ */

-- 
2.43.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B158537CA9
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9554F10E833;
	Mon, 30 May 2022 13:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C69410E833;
 Mon, 30 May 2022 13:37:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E8F8DB80D89;
 Mon, 30 May 2022 13:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A630AC3411A;
 Mon, 30 May 2022 13:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917822;
 bh=hk/LZA8R2rcBod9i/CJn+hXleVVKtoDUUNZhS9Bq5Y4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dy08GXpPpnIbBReEY092/KAwW5zMKssTAILYvxe/CwLPK3zMi4aaUJgSojg/nejne
 BGucSqnISZQo0Z6PGnkNPdl/3vIK2B3G9gXPT6UjL13BWnUW/Io2Wf7aNUJRpDVvDJ
 ApnISiRN9DlINy3oG45q8ny/rPRVRh0OQF9ME82jO0Kw70Azyjbs1JC7R4J82IcAvf
 haFcaFfqhf3N1qBjn4qaDrKpXkUZntarzs4KaK3QkJHCnCKw6nMiPFFHtnhFbkfYmO
 XhgCjkUjb2yaTdULl2aCHqKPd13thm+Ab9jmOUGUwQ2OlGvz64RiE2MsDCx7V+wSOg
 cmYIuzDC1gS0A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 108/135] drm/amd/pm: update smartshift powerboost
 calc for smu12
Date: Mon, 30 May 2022 09:31:06 -0400
Message-Id: <20220530133133.1931716-108-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530133133.1931716-1-sashal@kernel.org>
References: <20220530133133.1931716-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>, Xinhui.Pan@amd.com,
 guchun.chen@amd.com, airlied@linux.ie, Lijo Lazar <lijo.lazar@amd.com>,
 amd-gfx@lists.freedesktop.org, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, darren.powell@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com, lang.yu@amd.com,
 christian.koenig@amd.com, Graham.Sider@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sathishkumar S <sathishkumar.sundararaju@amd.com>

[ Upstream commit 138292f1dc00e7e0724f44769f9da39cf2f3bf0b ]

smartshift apu and dgpu power boost are reported as percentage with
respect to their power limits. This value[0-100] reflects the boost
for the respective device.

Signed-off-by: Sathishkumar S <sathishkumar.sundararaju@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c   | 60 ++++++++++++++-----
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
index 25c4b135f830..5e7c9e6d8125 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu12/renoir_ppt.c
@@ -1119,6 +1119,39 @@ static int renoir_get_power_profile_mode(struct smu_context *smu,
 	return size;
 }
 
+static void renoir_get_ss_power_percent(SmuMetrics_t *metrics,
+					uint32_t *apu_percent, uint32_t *dgpu_percent)
+{
+	uint32_t apu_boost = 0;
+	uint32_t dgpu_boost = 0;
+	uint16_t apu_limit = 0;
+	uint16_t dgpu_limit = 0;
+	uint16_t apu_power = 0;
+	uint16_t dgpu_power = 0;
+
+	apu_power = metrics->ApuPower;
+	apu_limit = metrics->StapmOriginalLimit;
+	if (apu_power > apu_limit && apu_limit != 0)
+		apu_boost =  ((apu_power - apu_limit) * 100) / apu_limit;
+	apu_boost = (apu_boost > 100) ? 100 : apu_boost;
+
+	dgpu_power = metrics->dGpuPower;
+	if (metrics->StapmCurrentLimit > metrics->StapmOriginalLimit)
+		dgpu_limit = metrics->StapmCurrentLimit - metrics->StapmOriginalLimit;
+	if (dgpu_power > dgpu_limit && dgpu_limit != 0)
+		dgpu_boost = ((dgpu_power - dgpu_limit) * 100) / dgpu_limit;
+	dgpu_boost = (dgpu_boost > 100) ? 100 : dgpu_boost;
+
+	if (dgpu_boost >= apu_boost)
+		apu_boost = 0;
+	else
+		dgpu_boost = 0;
+
+	*apu_percent = apu_boost;
+	*dgpu_percent = dgpu_boost;
+}
+
+
 static int renoir_get_smu_metrics_data(struct smu_context *smu,
 				       MetricsMember_t member,
 				       uint32_t *value)
@@ -1127,6 +1160,9 @@ static int renoir_get_smu_metrics_data(struct smu_context *smu,
 
 	SmuMetrics_t *metrics = (SmuMetrics_t *)smu_table->metrics_table;
 	int ret = 0;
+	uint32_t apu_percent = 0;
+	uint32_t dgpu_percent = 0;
+
 
 	mutex_lock(&smu->metrics_lock);
 
@@ -1175,26 +1211,18 @@ static int renoir_get_smu_metrics_data(struct smu_context *smu,
 		*value = metrics->Voltage[1];
 		break;
 	case METRICS_SS_APU_SHARE:
-		/* return the percentage of APU power with respect to APU's power limit.
-		 * percentage is reported, this isn't boost value. Smartshift power
-		 * boost/shift is only when the percentage is more than 100.
+		/* return the percentage of APU power boost
+		 * with respect to APU's power limit.
 		 */
-		if (metrics->StapmOriginalLimit > 0)
-			*value =  (metrics->ApuPower * 100) / metrics->StapmOriginalLimit;
-		else
-			*value = 0;
+		renoir_get_ss_power_percent(metrics, &apu_percent, &dgpu_percent);
+		*value = apu_percent;
 		break;
 	case METRICS_SS_DGPU_SHARE:
-		/* return the percentage of dGPU power with respect to dGPU's power limit.
-		 * percentage is reported, this isn't boost value. Smartshift power
-		 * boost/shift is only when the percentage is more than 100.
+		/* return the percentage of dGPU power boost
+		 * with respect to dGPU's power limit.
 		 */
-		if ((metrics->dGpuPower > 0) &&
-		    (metrics->StapmCurrentLimit > metrics->StapmOriginalLimit))
-			*value = (metrics->dGpuPower * 100) /
-				  (metrics->StapmCurrentLimit - metrics->StapmOriginalLimit);
-		else
-			*value = 0;
+		renoir_get_ss_power_percent(metrics, &apu_percent, &dgpu_percent);
+		*value = dgpu_percent;
 		break;
 	default:
 		*value = UINT_MAX;
-- 
2.35.1


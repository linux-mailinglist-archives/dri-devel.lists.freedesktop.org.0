Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB94537CAB
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFE610E94F;
	Mon, 30 May 2022 13:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604B310E92F;
 Mon, 30 May 2022 13:37:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D8A6260F9C;
 Mon, 30 May 2022 13:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EC0C3411A;
 Mon, 30 May 2022 13:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917832;
 bh=1SgiK37DEyvhrj6XEktO4Xg9hiQ9neVLoDKVwZ0AdRk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f0BoaAp2ckLN92PEjLFJN00ANGaMcpNOX1hHSQRiwv2VAXg4/ALC3TmuKKJIeovtZ
 iFRsYfITcu5e2zjIiQBKqHtY7zHXunPsdxrNdnRFnfbAUFOCciC9pSPIOH5m5W6A6Y
 O+k3161yQPkywEhCBNqS/CUeN5BKHsXzx+/T5t1YrZBwHVzx42GdF5fucZgJcrGjVY
 g/tImYxwfXS2kTLUXy4z7WhMcMyrjq5VhFZJFX9xdWNOzBmkudKBNZSepBA7IKIZy1
 6XI+w70kd8Uw6Gh7Rn8LD55H4kIrH4mcBxC6RY05eXk+WWRXKwpZLLe0w16Wx+NpEE
 6WS4ZeP7h2Zdw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 109/135] drm/amd/pm: update smartshift powerboost
 calc for smu13
Date: Mon, 30 May 2022 09:31:07 -0400
Message-Id: <20220530133133.1931716-109-sashal@kernel.org>
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
 Xiaomeng.Hou@amd.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Lijo Lazar <lijo.lazar@amd.com>, aaron.liu@amd.com,
 amd-gfx@lists.freedesktop.org, ray.huang@amd.com, mario.limonciello@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sathishkumar S <sathishkumar.sundararaju@amd.com>

[ Upstream commit cdf4c8ec39872a61a58d62f19b4db80f0f7bc586 ]

smartshift apu and dgpu power boost are reported as percentage
with respect to their power limits. adjust the units of power before
calculating the percentage of boost.

Signed-off-by: Sathishkumar S <sathishkumar.sundararaju@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c  | 62 ++++++++++++++-----
 1 file changed, 46 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
index 0bc84b709a93..d0715927b07f 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/yellow_carp_ppt.c
@@ -296,6 +296,42 @@ static int yellow_carp_mode2_reset(struct smu_context *smu)
 	return yellow_carp_mode_reset(smu, SMU_RESET_MODE_2);
 }
 
+
+static void yellow_carp_get_ss_power_percent(SmuMetrics_t *metrics,
+					uint32_t *apu_percent, uint32_t *dgpu_percent)
+{
+	uint32_t apu_boost = 0;
+	uint32_t dgpu_boost = 0;
+	uint16_t apu_limit = 0;
+	uint16_t dgpu_limit = 0;
+	uint16_t apu_power = 0;
+	uint16_t dgpu_power = 0;
+
+	/* APU and dGPU power values are reported in milli Watts
+	 * and STAPM power limits are in Watts */
+	apu_power = metrics->ApuPower/1000;
+	apu_limit = metrics->StapmOpnLimit;
+	if (apu_power > apu_limit && apu_limit != 0)
+		apu_boost =  ((apu_power - apu_limit) * 100) / apu_limit;
+	apu_boost = (apu_boost > 100) ? 100 : apu_boost;
+
+	dgpu_power = metrics->dGpuPower/1000;
+	if (metrics->StapmCurrentLimit > metrics->StapmOpnLimit)
+		dgpu_limit = metrics->StapmCurrentLimit - metrics->StapmOpnLimit;
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
+
+}
+
 static int yellow_carp_get_smu_metrics_data(struct smu_context *smu,
 							MetricsMember_t member,
 							uint32_t *value)
@@ -304,6 +340,8 @@ static int yellow_carp_get_smu_metrics_data(struct smu_context *smu,
 
 	SmuMetrics_t *metrics = (SmuMetrics_t *)smu_table->metrics_table;
 	int ret = 0;
+	uint32_t apu_percent = 0;
+	uint32_t dgpu_percent = 0;
 
 	mutex_lock(&smu->metrics_lock);
 
@@ -356,26 +394,18 @@ static int yellow_carp_get_smu_metrics_data(struct smu_context *smu,
 		*value = metrics->Voltage[1];
 		break;
 	case METRICS_SS_APU_SHARE:
-		/* return the percentage of APU power with respect to APU's power limit.
-		 * percentage is reported, this isn't boost value. Smartshift power
-		 * boost/shift is only when the percentage is more than 100.
+		/* return the percentage of APU power boost
+		 * with respect to APU's power limit.
 		 */
-		if (metrics->StapmOpnLimit > 0)
-			*value =  (metrics->ApuPower * 100) / metrics->StapmOpnLimit;
-		else
-			*value = 0;
+		yellow_carp_get_ss_power_percent(metrics, &apu_percent, &dgpu_percent);
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
-		    (metrics->StapmCurrentLimit > metrics->StapmOpnLimit))
-			*value = (metrics->dGpuPower * 100) /
-				  (metrics->StapmCurrentLimit - metrics->StapmOpnLimit);
-		else
-			*value = 0;
+		yellow_carp_get_ss_power_percent(metrics, &apu_percent, &dgpu_percent);
+		*value = dgpu_percent;
 		break;
 	default:
 		*value = UINT_MAX;
-- 
2.35.1


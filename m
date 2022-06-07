Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F268540795
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 19:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AE010F290;
	Tue,  7 Jun 2022 17:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCFB110F21C;
 Tue,  7 Jun 2022 17:52:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6281DB82370;
 Tue,  7 Jun 2022 17:52:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632D6C385A5;
 Tue,  7 Jun 2022 17:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654624325;
 bh=gXYvlZnPFUNaM7G9ja0Y0pLazVMlcUftyKWO1ibNkxM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HNzoz0NKuUwVkcr4002XwwyJNPQS1c9/ZsQlYU3bbxdOPsjbOpWuooGCMXU3wzVwa
 AWLSRLuKVpFjfbNHweI0GnluxE+sBF9nvSzUeHuaWnDn+oPQUxrHNmhpx7NikG5CVM
 Sdc2Fx1FopCaRKMAkunhA79DkXrbQ58YeVZGWcOVxNMGSs/lbinSX3/oBjpLY6Bu1G
 hfvM1DEvdq1YzjIW2gLO2V1X2k3zWFeeEw+S0PsdxQ2ck71DMxqWpHi4dR6PQ2x59l
 hHe/N/THGrPI45AO9DYPhQALmhe4Oly3OF8JYcKs8RykSN2JzCIpjX10FrY6ifayV4
 oSfc2Gq1HgycA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 50/68] drm/amd/pm: correct the metrics version
 for SMU 11.0.11/12/13
Date: Tue,  7 Jun 2022 13:48:16 -0400
Message-Id: <20220607174846.477972-50-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607174846.477972-1-sashal@kernel.org>
References: <20220607174846.477972-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, lijo.lazar@amd.com,
 sathishkumar.sundararaju@amd.com, airlied@linux.ie, danijel.slivka@amd.com,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Evan Quan <evan.quan@amd.com>

[ Upstream commit 396beb91a9eb86cbfa404e4220cca8f3ada70777 ]

Correct the metrics version used for SMU 11.0.11/12/13.
Fixes misreported GPU metrics (e.g., fan speed, etc.) depending
on which version of SMU firmware is loaded.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1925
Signed-off-by: Evan Quan <evan.quan@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../amd/pm/swsmu/smu11/sienna_cichlid_ppt.c   | 57 ++++++++++++++-----
 1 file changed, 44 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 38f04836c82f..7a1e225fb823 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -586,12 +586,28 @@ static int sienna_cichlid_get_smu_metrics_data(struct smu_context *smu,
 	uint16_t average_gfx_activity;
 	int ret = 0;
 
-	if ((smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) &&
-		(smu->smc_fw_version >= 0x3A4900))
-		use_metrics_v3 = true;
-	else if ((smu->adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) &&
-		(smu->smc_fw_version >= 0x3A4300))
-		use_metrics_v2 =  true;
+	switch (smu->adev->ip_versions[MP1_HWIP][0]) {
+	case IP_VERSION(11, 0, 7):
+		if (smu->smc_fw_version >= 0x3A4900)
+			use_metrics_v3 = true;
+		else if (smu->smc_fw_version >= 0x3A4300)
+			use_metrics_v2 = true;
+		break;
+	case IP_VERSION(11, 0, 11):
+		if (smu->smc_fw_version >= 0x412D00)
+			use_metrics_v2 = true;
+		break;
+	case IP_VERSION(11, 0, 12):
+		if (smu->smc_fw_version >= 0x3B2300)
+			use_metrics_v2 = true;
+		break;
+	case IP_VERSION(11, 0, 13):
+		if (smu->smc_fw_version >= 0x491100)
+			use_metrics_v2 = true;
+		break;
+	default:
+		break;
+	}
 
 	ret = smu_cmn_get_metrics_table(smu,
 					NULL,
@@ -3701,13 +3717,28 @@ static ssize_t sienna_cichlid_get_gpu_metrics(struct smu_context *smu,
 	uint16_t average_gfx_activity;
 	int ret = 0;
 
-	if ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) &&
-		(smu->smc_fw_version >= 0x3A4900))
-		use_metrics_v3 = true;
-	else if ((adev->ip_versions[MP1_HWIP][0] == IP_VERSION(11, 0, 7)) &&
-		(smu->smc_fw_version >= 0x3A4300))
-		use_metrics_v2 = true;
-
+	switch (smu->adev->ip_versions[MP1_HWIP][0]) {
+	case IP_VERSION(11, 0, 7):
+		if (smu->smc_fw_version >= 0x3A4900)
+			use_metrics_v3 = true;
+		else if (smu->smc_fw_version >= 0x3A4300)
+			use_metrics_v2 = true;
+		break;
+	case IP_VERSION(11, 0, 11):
+		if (smu->smc_fw_version >= 0x412D00)
+			use_metrics_v2 = true;
+		break;
+	case IP_VERSION(11, 0, 12):
+		if (smu->smc_fw_version >= 0x3B2300)
+			use_metrics_v2 = true;
+		break;
+	case IP_VERSION(11, 0, 13):
+		if (smu->smc_fw_version >= 0x491100)
+			use_metrics_v2 = true;
+		break;
+	default:
+		break;
+	}
 
 	ret = smu_cmn_get_metrics_table(smu,
 					&metrics_external,
-- 
2.35.1


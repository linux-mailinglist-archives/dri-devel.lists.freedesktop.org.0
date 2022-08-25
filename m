Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 727935A05E0
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 03:36:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A7BAD081D;
	Thu, 25 Aug 2022 01:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0486ED07BB;
 Thu, 25 Aug 2022 01:35:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3CE9DB826E2;
 Thu, 25 Aug 2022 01:35:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2281EC433D7;
 Thu, 25 Aug 2022 01:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661391313;
 bh=zApxLZkGQgIiEAl0cKBA5wYfrmSWkqkobdRgh6WknAU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ENkruvkYKuYRcNAvn2BDAIooTPZNil1Y13HAbmqXtnw9Bo+3fVZMOABEXjxeLRECq
 Mdh2XbT8C3wvU2/6f5cWpWDYHirRQkFkK9slEHuQC7o6FxpwSKjw+KAy1Gol2L0YYg
 9IcBMcpx0O9t1ornS3AxfIkqHVsm5KrM00OMZXlK/0eMuPN+gVzuBhs7Nj8L6FKIpG
 hs6uVyAI1lSHTRPUe2fVn9WHrsftylz1o7iq+Rn9hVpO0SZWw5UMZh1g/WVDRJjClp
 /RlYbTNhd0EuIklDJhGfoavHbTL2BPMpBrKFyDIHo3GMDCJryfTl83R6Iu3wlyf5e5
 N9yW+o9Owf8EA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 12/38] drm/amd/pm: skip pptable override for
 smu_v13_0_7
Date: Wed, 24 Aug 2022 21:33:35 -0400
Message-Id: <20220825013401.22096-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825013401.22096-1-sashal@kernel.org>
References: <20220825013401.22096-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, tim.huang@amd.com, lijo.lazar@amd.com,
 airlied@linux.ie, Feifei Xu <Feifei.Xu@amd.com>,
 dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com, tao.zhou1@amd.com,
 amd-gfx@lists.freedesktop.org, mario.limonciello@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, evan.quan@amd.com,
 Kenneth Feng <kenneth.feng@amd.com>, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kenneth Feng <kenneth.feng@amd.com>

[ Upstream commit 4e64b529c5b04e7944b41de554ee686ecab00744 ]

skip pptable override for smu_v13_0_7 secure boards only.

Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
Reviewed-by: Feifei Xu <Feifei.Xu@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
index 5aa08c031f72..1d8a9e5b3cc0 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
@@ -203,6 +203,9 @@ int smu_v13_0_init_pptable_microcode(struct smu_context *smu)
 	if (!adev->scpm_enabled)
 		return 0;
 
+	if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 7))
+		return 0;
+
 	/* override pptable_id from driver parameter */
 	if (amdgpu_smu_pptable_id >= 0) {
 		pptable_id = amdgpu_smu_pptable_id;
@@ -210,13 +213,6 @@ int smu_v13_0_init_pptable_microcode(struct smu_context *smu)
 	} else {
 		pptable_id = smu->smu_table.boot_values.pp_table_id;
 
-		if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 7) &&
-			pptable_id == 3667)
-			pptable_id = 36671;
-
-		if (adev->ip_versions[MP1_HWIP][0] == IP_VERSION(13, 0, 7) &&
-			pptable_id == 3688)
-			pptable_id = 36881;
 		/*
 		 * Temporary solution for SMU V13.0.0 with SCPM enabled:
 		 *   - use 36831 signed pptable when pp_table_id is 3683
-- 
2.35.1


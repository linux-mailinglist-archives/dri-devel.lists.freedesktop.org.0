Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30539590155
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 17:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130FCA6FE6;
	Thu, 11 Aug 2022 15:53:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90EAB4936;
 Thu, 11 Aug 2022 15:53:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C0199B82123;
 Thu, 11 Aug 2022 15:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06948C433D6;
 Thu, 11 Aug 2022 15:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660233209;
 bh=4FXxmeamZE/+Ek8SymR31JLl1PEr4R8InY2NDrVuePw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rS7Ea1eDOyg5Bt8svTq/kkofZdAIa6syM7FbiD93IytzU/j23nXmq9MkB24m0jTp7
 aqSiyV5GRIQkUdGl0XfFJRiwmF8AEJgOTPEaJO8I1avIabsdsMGiMoLETiCAZmPHgf
 88w3AeZ4ehci30B6pmfp5q3Garg1ATst0UncmQqtx8VBdiZB5X44/jEsT9rIRMm+rR
 bNHvUaHGbG/ty4e8IT28ii1IAH3xeJgETtsaZfL5JCG+t5B4XE+6Ztvr2cEpMHJmoj
 xjnAKe1B5WrJqXz79IPUgUMs6XvRB4JWIMGbbNsuyBFXabXE2AofXmGKNTNDfllgMn
 B1AqvsrUC4hEA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 67/93] drm/amdgpu: Call trace info was found in
 dmesg when loading amdgpu
Date: Thu, 11 Aug 2022 11:42:01 -0400
Message-Id: <20220811154237.1531313-67-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811154237.1531313-1-sashal@kernel.org>
References: <20220811154237.1531313-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, sathishkumar.sundararaju@amd.com,
 lijo.lazar@amd.com, dri-devel@lists.freedesktop.org, guchun.chen@amd.com,
 airlied@linux.ie, Jingwen Chen <Jingwen.Chen2@amd.com>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, luben.tuikov@amd.com, lin cao <lin.cao@amd.com>,
 danijel.slivka@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 Mohammadzafar.ziya@amd.com, evan.quan@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: lin cao <lin.cao@amd.com>

[ Upstream commit 748262eb400e809aa13e3485f4983c3db3d0ebb3 ]

In the case of SRIOV, the register smnMp1_PMI_3_FIFO will get an invalid
value which will cause the "shift out of bound". In Ubuntu22.04, this
issue will be checked an related call trace will be reported in dmesg.

Signed-off-by: lin cao <lin.cao@amd.com>
Reviewed-by: Jingwen Chen <Jingwen.Chen2@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
index 7a1e225fb823..971a9712fa63 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/sienna_cichlid_ppt.c
@@ -758,6 +758,7 @@ static void sienna_cichlid_stb_init(struct smu_context *smu);
 
 static int sienna_cichlid_init_smc_tables(struct smu_context *smu)
 {
+	struct amdgpu_device *adev = smu->adev;
 	int ret = 0;
 
 	ret = sienna_cichlid_tables_init(smu);
@@ -768,7 +769,8 @@ static int sienna_cichlid_init_smc_tables(struct smu_context *smu)
 	if (ret)
 		return ret;
 
-	sienna_cichlid_stb_init(smu);
+	if (!amdgpu_sriov_vf(adev))
+		sienna_cichlid_stb_init(smu);
 
 	return smu_v11_0_init_smc_tables(smu);
 }
-- 
2.35.1


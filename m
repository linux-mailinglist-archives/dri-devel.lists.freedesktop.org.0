Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BF5783F44
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 13:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560C410E309;
	Tue, 22 Aug 2023 11:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EE3210E30A;
 Tue, 22 Aug 2023 11:36:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 799B164506;
 Tue, 22 Aug 2023 11:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06514C433C8;
 Tue, 22 Aug 2023 11:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692704181;
 bh=mWSMZxxPFeZtx5ZSwOL70WwFeclugfVCWSNWY3eQCt8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ij9SRDhUMtuEGusKdFCse5pUIjP/e1kHyC/EogKfAFe89muz3GupDqA5xM6ZynKoZ
 7D2ZvGUEcQVIOPBoTJy9MctvwhZu0QnoNOcoXtK4qnngStJn837iFFQ2kpTMJUnfh4
 +4KtmYTuktpqUwk3c6uPh/kPAuASIwA7aAruu3IN7FrLMZJPoGzkVNS5X6r9phFtyV
 8uhed3bu+yD+njedkm2S4f2zbKn8Q/TOe/uznM2Hl/u1lJDFk3HsntVrCYTn74dfpj
 aYxiMYLdBYxZ6+qvGijcwP61B6YhK20HIPXdV8iH23dBn9rbkyEltdC/ZYGOn+z6v3
 UpmRSP7Gw4w8g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 08/11] drm/amdgpu: Match against exact bootloader
 status
Date: Tue, 22 Aug 2023 07:35:50 -0400
Message-Id: <20230822113553.3551206-8-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230822113553.3551206-1-sashal@kernel.org>
References: <20230822113553.3551206-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.11
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
Cc: Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com, john.clements@amd.com,
 dri-devel@lists.freedesktop.org, Lijo Lazar <lijo.lazar@amd.com>,
 amd-gfx@lists.freedesktop.org, mario.limonciello@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, Likun.Gao@amd.com,
 candice.li@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Lijo Lazar <lijo.lazar@amd.com>

[ Upstream commit d3de41ee5febe5c2d9989fe9810bce2bb54a3a8e ]

On PSP v13.x ASICs, boot loader will set only the MSB to 1 and clear the
least significant bits for any command submission. Hence match against
the exact register value, otherwise a register value of all 0xFFs also
could falsely indicate that boot loader is ready. Also, from PSP v13.0.6
and newer, bits[7:0] will be used to indicate command error status.

Signed-off-by: Lijo Lazar <lijo.lazar@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
index caee76ab71105..92f2ee412908d 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
@@ -136,14 +136,15 @@ static int psp_v13_0_wait_for_bootloader(struct psp_context *psp)
 	int ret;
 	int retry_loop;
 
+	/* Wait for bootloader to signify that it is ready having bit 31 of
+	 * C2PMSG_35 set to 1. All other bits are expected to be cleared.
+	 * If there is an error in processing command, bits[7:0] will be set.
+	 * This is applicable for PSP v13.0.6 and newer.
+	 */
 	for (retry_loop = 0; retry_loop < 10; retry_loop++) {
-		/* Wait for bootloader to signify that is
-		    ready having bit 31 of C2PMSG_35 set to 1 */
-		ret = psp_wait_for(psp,
-				   SOC15_REG_OFFSET(MP0, 0, regMP0_SMN_C2PMSG_35),
-				   0x80000000,
-				   0x80000000,
-				   false);
+		ret = psp_wait_for(
+			psp, SOC15_REG_OFFSET(MP0, 0, regMP0_SMN_C2PMSG_35),
+			0x80000000, 0xffffffff, false);
 
 		if (ret == 0)
 			return 0;
-- 
2.40.1


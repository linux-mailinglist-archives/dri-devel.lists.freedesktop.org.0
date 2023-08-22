Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0426E783F50
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 13:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DCC210E30F;
	Tue, 22 Aug 2023 11:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E66610E30F;
 Tue, 22 Aug 2023 11:36:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB17965389;
 Tue, 22 Aug 2023 11:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB4CC433C9;
 Tue, 22 Aug 2023 11:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692704208;
 bh=FPb85KBsLtIuV93aWYRoqyPZudRHIE7GTm0niEodijU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mgY9XXlPwfB1oHLxsEcOHSjkNNYtz2KTMAv6efMfawx4HcZvuUZIVvLcYGjIzbOkw
 H7uJCZnZ8HUHRQuQDBKQFb9uptplp19JYPtwAapKAxmytBOtoxLbOxvUOxM3sNmAJT
 vN2cE/pHw/RcRuXOlD2RrxHF6NzZx/kU6Q0HPser+YjoUnI1izkGBdzQHP9AyftNbp
 ntVuPMZI41J2sjb5YTFjpKuRg89awP55Zu/kwOAoeGcNOVpwst+hVrcsZdDFbHzbuU
 bo/GM/L1uHJsl1OmO9LO/9A3el8/MNOb988P54fpWMXaL1pmmMR7wBLBuUbhkTvWZ5
 /YUik8WVjWRyg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 06/10] drm/amd/pm: skip the RLC stop when S0i3
 suspend for SMU v13.0.4/11
Date: Tue, 22 Aug 2023 07:36:24 -0400
Message-Id: <20230822113628.3551393-6-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230822113628.3551393-1-sashal@kernel.org>
References: <20230822113628.3551393-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.46
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
Cc: Sasha Levin <sashal@kernel.org>, Tim Huang <Tim.Huang@amd.com>,
 lijo.lazar@amd.com, kenneth.feng@amd.com, dri-devel@lists.freedesktop.org,
 Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>, trix@redhat.com,
 Alex Deucher <alexander.deucher@amd.com>, Kun.Liu2@amd.com, evan.quan@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tim Huang <Tim.Huang@amd.com>

[ Upstream commit 730d44e1fa306a20746ad4a85da550662aed9daa ]

For SMU v13.0.4/11, driver does not need to stop RLC for S0i3,
the firmwares will handle that properly.

Signed-off-by: Tim Huang <Tim.Huang@amd.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
index d191ff52d4f06..a664a0a284784 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
@@ -1562,9 +1562,9 @@ static int smu_disable_dpms(struct smu_context *smu)
 
 	/*
 	 * For SMU 13.0.4/11, PMFW will handle the features disablement properly
-	 * for gpu reset case. Driver involvement is unnecessary.
+	 * for gpu reset and S0i3 cases. Driver involvement is unnecessary.
 	 */
-	if (amdgpu_in_reset(adev)) {
+	if (amdgpu_in_reset(adev) || adev->in_s0ix) {
 		switch (adev->ip_versions[MP1_HWIP][0]) {
 		case IP_VERSION(13, 0, 4):
 		case IP_VERSION(13, 0, 11):
-- 
2.40.1


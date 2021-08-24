Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E353F5469
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 02:55:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C6989DA2;
	Tue, 24 Aug 2021 00:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E9A89D57;
 Tue, 24 Aug 2021 00:54:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC8D861411;
 Tue, 24 Aug 2021 00:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629766488;
 bh=hGpB3OYXSQsJAMtupy5tEoYQ9i3zYDhIn0ciJMdKmAw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qtpyr7KDiPj7zsKSkQJ9cayLd/buIICqpLopW4/zwgsZnTEYJGfafLhbVlEeHCWPP
 Lxic/GSoy/Y7r5XPmAVpBu0WVFksjDSWX44a4E1VY0xJNlSt7oytwn3dzWJC1M6xfA
 2CqDTSOWrmOtCuzD5rcdFBcsu9qqGmuxba0kFOellmSFi8L3HXlWwqAMDR/jrTyqyN
 rB/U978Kwc6xlh8jzcMUFLI6KeLXLjTnRCbi7jn0H52BmgTso8NdXKhs3Y3RC+i6RL
 2pwssWKGUKEhRlp/u+VqadL7CXLYgvMxHf3H5qUe/QdtSD8uDSuuSsApNtvWXZhcER
 FPcKJLJHsbPfA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kenneth Feng <kenneth.feng@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.10 12/18] drm/amd/pm: change the workload type for
 some cards
Date: Mon, 23 Aug 2021 20:54:26 -0400
Message-Id: <20210824005432.631154-12-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210824005432.631154-1-sashal@kernel.org>
References: <20210824005432.631154-1-sashal@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kenneth Feng <kenneth.feng@amd.com>

[ Upstream commit 93c5701b00d50d192ce2247cb10d6c0b3fe25cd8 ]

change the workload type for some cards as it is needed.

Signed-off-by: Kenneth Feng <kenneth.feng@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
index ed4eafc744d3..4dc27ec4d012 100644
--- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
+++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega10_hwmgr.c
@@ -5122,6 +5122,13 @@ static int vega10_get_power_profile_mode(struct pp_hwmgr *hwmgr, char *buf)
 	return size;
 }
 
+static bool vega10_get_power_profile_mode_quirks(struct pp_hwmgr *hwmgr)
+{
+	struct amdgpu_device *adev = hwmgr->adev;
+
+	return (adev->pdev->device == 0x6860);
+}
+
 static int vega10_set_power_profile_mode(struct pp_hwmgr *hwmgr, long *input, uint32_t size)
 {
 	struct vega10_hwmgr *data = hwmgr->backend;
@@ -5158,9 +5165,15 @@ static int vega10_set_power_profile_mode(struct pp_hwmgr *hwmgr, long *input, ui
 	}
 
 out:
-	smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_SetWorkloadMask,
+	if (vega10_get_power_profile_mode_quirks(hwmgr))
+		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_SetWorkloadMask,
 						1 << power_profile_mode,
 						NULL);
+	else
+		smum_send_msg_to_smc_with_parameter(hwmgr, PPSMC_MSG_SetWorkloadMask,
+						(!power_profile_mode) ? 0 : 1 << (power_profile_mode - 1),
+						NULL);
+
 	hwmgr->power_profile_mode = power_profile_mode;
 
 	return 0;
-- 
2.30.2


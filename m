Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C964C6A36F3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062C489561;
	Mon, 27 Feb 2023 02:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FE410E2DD;
 Mon, 27 Feb 2023 02:05:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 103A360CFB;
 Mon, 27 Feb 2023 02:05:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A98C43443;
 Mon, 27 Feb 2023 02:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463547;
 bh=0VCysylFJaJFT41C5zz6K7CDeXge3t0X62kW0QHBkQQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qQC99UjChpPhgcYkmFoKxPaBXxvf7NduKsqVT75r8F8tkk9QUXRifvciKvxbZJG33
 WijWDKg76PZ8I6t3UGOpugqOvDmn96jh7G7apWoY/Shw5Ls8fVoo1O3B0tlV9GSoly
 Ek2jaES/QfAuDzocpzgqDU1xliRcoTC5idKlBL355Hcx5trL1wR2T47Z7BPHiPKy9u
 NjqTJ6BJKvn558Kh1xjG0wtaof+o46aRkpYpTggIqZNmqxw4g0iFK7VES5TyK4Yg+2
 rkHs2kDxmD3mZ6g/0pispm8t7PW/eGcycfRQ1G1gRaAUJCj5cxW09q9+/ju7z18Wsj
 Yk5EouJjDiHTQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 11/58] drm/amd: Avoid BUG() for case of SRIOV
 missing IP version
Date: Sun, 26 Feb 2023 21:04:09 -0500
Message-Id: <20230227020457.1048737-11-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020457.1048737-1-sashal@kernel.org>
References: <20230227020457.1048737-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Xinhui.Pan@amd.com, guchun.chen@amd.com,
 dri-devel@lists.freedesktop.org, Lijo Lazar <lijo.lazar@amd.com>,
 amd-gfx@lists.freedesktop.org, Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Likun.Gao@amd.com,
 candice.li@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mario Limonciello <mario.limonciello@amd.com>

[ Upstream commit 93fec4f8c158584065134b4d45e875499bf517c8 ]

No need to crash the kernel.  AMDGPU will now fail to probe.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index 712dd72f3ccf2..087147f09933a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -354,7 +354,7 @@ static int psp_init_sriov_microcode(struct psp_context *psp)
 		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MES1_DATA;
 		break;
 	default:
-		BUG();
+		ret = -EINVAL;
 		break;
 	}
 	return ret;
-- 
2.39.0


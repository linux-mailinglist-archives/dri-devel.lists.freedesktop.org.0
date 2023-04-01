Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B266D2CCA
	for <lists+dri-devel@lfdr.de>; Sat,  1 Apr 2023 03:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F0BB10F36C;
	Sat,  1 Apr 2023 01:43:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C9410F36C;
 Sat,  1 Apr 2023 01:43:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B161462D0E;
 Sat,  1 Apr 2023 01:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D11CCC433D2;
 Sat,  1 Apr 2023 01:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680313427;
 bh=DRNAUhd7xodd9PlPJsbvFfafmxww8S+HTLuBkpEHq8g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kVWqf0i92IcBTgDzcM/wqDUQ7zm+i+MkwN7oJgXIQE6sWLizxpLugHS3DjVjCZ73K
 pPqsDkpuGLgTVBVytbFchS4jAmPn3ZPDHHW34Gglcj+vql76NaWfoHriqJjWJFPvq/
 /R7jwgv4tkXHWlkzfB/1KAuDVm/95B9aHgY1GKd7s1CgOmvN1OQ5Ej2jZ+P4dyMSFd
 5uRC1QC3u3nmSnL+ABgfJFO1jFCCxL+dPW9UMiscUV+Btxdq+/M7DsTvNknDbpXf5W
 tayMgSq/uiV3G+s6Up7FgjlPnT+QY7YZRXl5scR5GnWlZNmmoIe/JITe86ZLPXKQ3w
 y5+oDhuYvk73g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 23/24] drm/amdgpu/gfx: set cg flags to enter/exit
 safe mode
Date: Fri, 31 Mar 2023 21:42:39 -0400
Message-Id: <20230401014242.3356780-23-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401014242.3356780-1-sashal@kernel.org>
References: <20230401014242.3356780-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, tim.huang@amd.com, Xinhui.Pan@amd.com,
 Jane Jian <Jane.Jian@amd.com>, yifan1.zhang@amd.com, kenneth.feng@amd.com,
 dri-devel@lists.freedesktop.org, Lijo Lazar <lijo.lazar@amd.com>,
 amd-gfx@lists.freedesktop.org, mario.limonciello@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, Likun.Gao@amd.com, evan.quan@amd.com,
 christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jane Jian <Jane.Jian@amd.com>

[ Upstream commit e06bfcc1a1c41bcb8c31470d437e147ce9f0acfd ]

sriov needs to enter/exit safe mode in update umd p state
add the cg flag to let it enter or exit while needed

Signed-off-by: Jane Jian <Jane.Jian@amd.com>
Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index 7a13129842602..0dd2fe4f071e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -1316,6 +1316,11 @@ static int gfx_v11_0_sw_init(void *handle)
 		break;
 	}
 
+	/* Enable CG flag in one VF mode for enabling RLC safe mode enter/exit */
+	if (adev->ip_versions[GC_HWIP][0] == IP_VERSION(11, 0, 3) &&
+		amdgpu_sriov_is_pp_one_vf(adev))
+		adev->cg_flags = AMD_CG_SUPPORT_GFX_CGCG;
+
 	/* EOP Event */
 	r = amdgpu_irq_add_id(adev, SOC21_IH_CLIENTID_GRBM_CP,
 			      GFX_11_0_0__SRCID__CP_EOP_INTERRUPT,
-- 
2.39.2


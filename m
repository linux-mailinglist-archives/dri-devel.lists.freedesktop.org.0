Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 228F0943A56
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 02:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BCB10E729;
	Thu,  1 Aug 2024 00:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fx396toj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EA910E729;
 Thu,  1 Aug 2024 00:13:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 97584CE1811;
 Thu,  1 Aug 2024 00:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3067C116B1;
 Thu,  1 Aug 2024 00:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722471215;
 bh=7cDXmX14A2iHqD9MJ8FWQmZOM4Bw6lWEeJbAe1jomfA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fx396tojjA9vlvr0IJHQzpLt/F2VmQuLlg8IQgwdaPZy9/RihET1q+1CTX0nbtbKL
 RxXXOtNEveTPTgO4dlued+mzfcC2XnT6w/N+NonOJW5BWwoOW5CWQeo9rbq1PAWbjF
 KdmFdeL1+ktv9OibXTjiq8PtVKAJ5ANKoZ+pGmk2DcH8f6zh6ZpliReb1omNSWeZPb
 cbCiP9x14y5J8SBP2hHuzKjCPMecKjc1KwkXtRV+YKvrP9rIffJK4RzK22pBopfyK4
 4Hvm8iLLvAQf2CYAmrEd9Wx8S5WSpj2AojTP40lVnRh4XKTmaeLPJtiWvNogdC74Sp
 vhKS0o4o8h5Lg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: "David (Ming Qiang) Wu" <David.Wu3@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, saleemkhan.jamadar@amd.com, leo.liu@amd.com,
 Veerabadhran.Gopalakrishnan@amd.com, yifan1.zhang@amd.com,
 sonny.jiang@amd.com, sunil.khatri@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 043/121] drm/amdgpu/vcn: remove irq disabling in
 vcn 5 suspend
Date: Wed, 31 Jul 2024 19:59:41 -0400
Message-ID: <20240801000834.3930818-43-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240801000834.3930818-1-sashal@kernel.org>
References: <20240801000834.3930818-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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

From: "David (Ming Qiang) Wu" <David.Wu3@amd.com>

[ Upstream commit 10fe1a79cd1bff3048e13120e93c02f8ecd05e9d ]

We do not directly enable/disable VCN IRQ in vcn 5.0.0.
And we do not handle the IRQ state as well. So the calls to
disable IRQ and set state are removed. This effectively gets
rid of the warining of
      "WARN_ON(!amdgpu_irq_enabled(adev, src, type))"
in amdgpu_irq_put().

Signed-off-by: David (Ming Qiang) Wu <David.Wu3@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
index 851975b5ce298..9b87d6a49b398 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v5_0_0.c
@@ -229,8 +229,6 @@ static int vcn_v5_0_0_hw_fini(void *handle)
 	for (i = 0; i < adev->vcn.num_vcn_inst; ++i) {
 		if (adev->vcn.harvest_config & (1 << i))
 			continue;
-
-		amdgpu_irq_put(adev, &adev->vcn.inst[i].irq, 0);
 	}
 
 	return 0;
@@ -1226,22 +1224,6 @@ static int vcn_v5_0_0_set_powergating_state(void *handle, enum amd_powergating_s
 	return ret;
 }
 
-/**
- * vcn_v5_0_0_set_interrupt_state - set VCN block interrupt state
- *
- * @adev: amdgpu_device pointer
- * @source: interrupt sources
- * @type: interrupt types
- * @state: interrupt states
- *
- * Set VCN block interrupt state
- */
-static int vcn_v5_0_0_set_interrupt_state(struct amdgpu_device *adev, struct amdgpu_irq_src *source,
-	unsigned type, enum amdgpu_interrupt_state state)
-{
-	return 0;
-}
-
 /**
  * vcn_v5_0_0_process_interrupt - process VCN block interrupt
  *
@@ -1287,7 +1269,6 @@ static int vcn_v5_0_0_process_interrupt(struct amdgpu_device *adev, struct amdgp
 }
 
 static const struct amdgpu_irq_src_funcs vcn_v5_0_0_irq_funcs = {
-	.set = vcn_v5_0_0_set_interrupt_state,
 	.process = vcn_v5_0_0_process_interrupt,
 };
 
-- 
2.43.0


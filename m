Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 196E0985B2C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 14:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CA910EA16;
	Wed, 25 Sep 2024 12:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="equsjt1R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E98110EA14;
 Wed, 25 Sep 2024 12:17:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AB341A441D8;
 Wed, 25 Sep 2024 12:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67956C4CEC3;
 Wed, 25 Sep 2024 12:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727266666;
 bh=OFYyYeZikU7Ju0NLcy2mgTpIR3Amgsd5Ywv3s3wh6CU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=equsjt1RHqDgJUake0v6T8BZoMCymiD5lWFBBNkiBE00ay95TLpe1CYRjbqMWY8bQ
 uP7+IkvKoCStfWOfziB2N4NeaWUT2//ijoGjszmSAwoRHxaTDWxoea6JcgeuDsgOmv
 iUP6KlVdq0YnUlz9mDQBf3fJxAz/uajsW+YhBL1VSLq4JBdM+99eYLm3e2oLMtG+zO
 1gcs6cjXzijz5x4Hcq0XxM9XwLD6AZbcVVkVv2v2ziIOapwhZU1aCI2z+qKiKzDfyP
 YA2TlJjg/Q0EoGfORIkMAgeFmhYpA5uaTh6qV7K8Kn/423mKDUsQTTyFBjhuX180nL
 57Ln9MbQrFUpA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, sunil.khatri@amd.com, yifan1.zhang@amd.com,
 Tim.Huang@amd.com, zhenguo.yin@amd.com, Jack.Xiao@amd.com,
 kevinyang.wang@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 127/139] drm/amdgpu/gfx11: use rlc safe mode for
 soft recovery
Date: Wed, 25 Sep 2024 08:09:07 -0400
Message-ID: <20240925121137.1307574-127-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925121137.1307574-1-sashal@kernel.org>
References: <20240925121137.1307574-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.52
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

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 3f2d35c325534c1b7ac5072173f0dc7ca969dec2 ]

Protect the MMIO access with safe mode.

Acked-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
index c813cd7b015e1..54ec9b32562c2 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v11_0.c
@@ -5701,7 +5701,9 @@ static void gfx_v11_0_ring_soft_recovery(struct amdgpu_ring *ring,
 	value = REG_SET_FIELD(value, SQ_CMD, MODE, 0x01);
 	value = REG_SET_FIELD(value, SQ_CMD, CHECK_VMID, 1);
 	value = REG_SET_FIELD(value, SQ_CMD, VM_ID, vmid);
+	amdgpu_gfx_rlc_enter_safe_mode(adev, 0);
 	WREG32_SOC15(GC, 0, regSQ_CMD, value);
+	amdgpu_gfx_rlc_exit_safe_mode(adev, 0);
 }
 
 static void
-- 
2.43.0


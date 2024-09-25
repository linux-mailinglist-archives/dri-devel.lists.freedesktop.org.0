Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0F9985B24
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 14:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0E410EA11;
	Wed, 25 Sep 2024 12:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fqQRwdta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51D9210EA10;
 Wed, 25 Sep 2024 12:17:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C78BF5C5A0B;
 Wed, 25 Sep 2024 12:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC02C4CEC3;
 Wed, 25 Sep 2024 12:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727266651;
 bh=3uworH+Fy5wViEyD2XoSjiO38p5Ba0tD//i0S3nbEAA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fqQRwdtaYYs0Qy08hrGpBadZFvhITFUy/S9nX8sXqbsrm1B8anUQFwyGSfnjMXmqB
 Cl6P2ZbKhRPIkjIJnwC3PuJx+rUF5Lx4s9cfWEgWAx4sbj3X5AqzIimIZYSc+KAIKz
 RKmY3lwPhimYkwpJLw4t9mmcL7aVh4bA7ugB0n7SV/otJHL32wSOaz164/8bbsLHZw
 U+lh6b3P8eEV0BplloFT4r6soe96vLa2Tiy4XtCcOx6q+enYTN5mdrbakYw3HP/jcv
 bo2PByz7MV4laUgKo3h2uaayTYeovhab/52KNLn8XTVHBkQYWrmnuTdAxdLUcVvd/f
 pS/89QgihvVoQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>, Sasha Levin <sashal@kernel.org>,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, sunil.khatri@amd.com, Prike.Liang@amd.com,
 liupeng01@kylinos.cn, Tim.Huang@amd.com, kevinyang.wang@amd.com,
 pierre-eric.pelloux-prayer@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 123/139] drm/amdgpu/gfx9: use rlc safe mode for
 soft recovery
Date: Wed, 25 Sep 2024 08:09:03 -0400
Message-ID: <20240925121137.1307574-123-sashal@kernel.org>
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

[ Upstream commit 3ec2ad7c34c412bd9264cd1ff235d0812be90e82 ]

Protect the MMIO access with safe mode.

Acked-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
index 00e693c47f3cc..895060f6948f3 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
@@ -5709,7 +5709,9 @@ static void gfx_v9_0_ring_soft_recovery(struct amdgpu_ring *ring, unsigned vmid)
 	value = REG_SET_FIELD(value, SQ_CMD, MODE, 0x01);
 	value = REG_SET_FIELD(value, SQ_CMD, CHECK_VMID, 1);
 	value = REG_SET_FIELD(value, SQ_CMD, VM_ID, vmid);
+	amdgpu_gfx_rlc_enter_safe_mode(adev, 0);
 	WREG32_SOC15(GC, 0, mmSQ_CMD, value);
+	amdgpu_gfx_rlc_exit_safe_mode(adev, 0);
 }
 
 static void gfx_v9_0_set_gfx_eop_interrupt_state(struct amdgpu_device *adev,
-- 
2.43.0


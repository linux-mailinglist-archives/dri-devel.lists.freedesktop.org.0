Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136E52E11B7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:17:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C486E89B;
	Wed, 23 Dec 2020 02:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6D206E89B;
 Wed, 23 Dec 2020 02:17:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A3232332A;
 Wed, 23 Dec 2020 02:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689820;
 bh=A8jWh6VXs3eNoGFczwY5tHyt/pPzLelK9IqcsggWE0g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gShbQzsEF9zRoHkYA+QPPQyCZyyH/ZFZw6VNYb6okF6MT/K0xMgXac52Q8pLR2cKs
 0FKyKLrgnJiljnmV0N0D/qw12XXS82CxWiNzSitK0m3uo/GZC03+NlJRuXorEaJraT
 F48I2Vr6C9BhR1xNrQZjfOolmKxgavmOKT6h0/ki3cTNB1Qn17EvfFpZaBYoGG/Swx
 nA2NPPlrFP4h66ed545USNeCqGkgBSRLjgA9G3Ig0LrUGLSdOSHMUMG8u3Bel1I/KT
 0noYoh+s4v9D/2KhHXW9Dkr3xgTKUCX1zmlZvwKfzh6DqHkbGQr/J+L1mzq0HmvYcE
 z3Uv4Vb/N9MRA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 025/217] drm/amdgpu: disable gfxoff if VCN is busy
Date: Tue, 22 Dec 2020 21:13:14 -0500
Message-Id: <20201223021626.2790791-25-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Jiansong Chen <Jiansong.Chen@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, James Zhu <James.Zhu@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jiansong Chen <Jiansong.Chen@amd.com>

[ Upstream commit ef3b2987254035f9b869f70151b4220c34f2f133 ]

Toggle on/off gfxoff during video playback to fix gpu hang.

v2: change sequence to be more compatible with original code.

Signed-off-by: Jiansong Chen <Jiansong.Chen@amd.com>
Reviewed-by: James Zhu <James.Zhu@amd.com>
Reviewed-by: Hawking Zhang <Hawking.Zhang@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
index a563328e3daea..ee6a42c81bd99 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vcn.c
@@ -345,6 +345,7 @@ static void amdgpu_vcn_idle_work_handler(struct work_struct *work)
 	}
 
 	if (!fences && !atomic_read(&adev->vcn.total_submission_cnt)) {
+		amdgpu_gfx_off_ctrl(adev, true);
 		amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_VCN,
 		       AMD_PG_STATE_GATE);
 	} else {
@@ -357,7 +358,9 @@ void amdgpu_vcn_ring_begin_use(struct amdgpu_ring *ring)
 	struct amdgpu_device *adev = ring->adev;
 
 	atomic_inc(&adev->vcn.total_submission_cnt);
-	cancel_delayed_work_sync(&adev->vcn.idle_work);
+
+	if (!cancel_delayed_work_sync(&adev->vcn.idle_work))
+		amdgpu_gfx_off_ctrl(adev, false);
 
 	mutex_lock(&adev->vcn.vcn_pg_lock);
 	amdgpu_device_ip_set_powergating_state(adev, AMD_IP_BLOCK_TYPE_VCN,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

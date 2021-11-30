Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 458EA463864
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 15:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD226EA3C;
	Tue, 30 Nov 2021 14:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBDD66EA0B;
 Tue, 30 Nov 2021 14:57:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C3445B81A20;
 Tue, 30 Nov 2021 14:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19525C53FD1;
 Tue, 30 Nov 2021 14:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283806;
 bh=OIkdmRSsVUKR8QOVFJnATvdtYexQpe8SKvvWQq2QRgA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zgomx9Z3j2I1edYU5xWFghu7Spxjnts02eZLf4Y8Z8yRll9P3opbXwYL3Ypqo0zTq
 /vbDI6PnMHmrGy/+qgJT2rSRsMnUKaeY9/BBKmua4QsZaTZwCrBki1UbrbzoK4rFi7
 /nTYSecrKQREORp9anyjwFmKVHp0nF5436X+9owYFn+c6VaFKdntxAer7Lig3/Ptu3
 L6Q0l/H1jMCuZDSI9eEvRT7VjlcagFA4ieBp22UhWoC0YTe+J7FuHca0oJ7uXqG5KN
 JJgdCEg8/dJgRNzFsQAHDdWlMZoxP3C3AVJuzvOFOQnJ1oh1+Dhd1CpOUjGNd99Cw9
 p5MOnwsgUKiOQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 60/68] drm/amd/display: update bios scratch when
 setting backlight
Date: Tue, 30 Nov 2021 09:46:56 -0500
Message-Id: <20211130144707.944580-60-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130144707.944580-1-sashal@kernel.org>
References: <20211130144707.944580-1-sashal@kernel.org>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, shenshih@amd.com,
 Sasha Levin <sashal@kernel.org>, Rodrigo.Siqueira@amd.com,
 amd-gfx@lists.freedesktop.org, sunpeng.li@amd.com, aurabindo.pillai@amd.com,
 Anson.Jacob@amd.com, nikola.cornij@amd.com, qingqing.zhuo@amd.com,
 Xinhui.Pan@amd.com, Roman.Li@amd.com, christian.koenig@amd.com,
 Wayne.Lin@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 tiantao6@hisilicon.com, nicholas.kazlauskas@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Deucher <alexander.deucher@amd.com>

[ Upstream commit 692cd92e66ee10597676530573a495dc1d3bec6a ]

Update the bios scratch register when updating the backlight
level.  Some platforms apparently read this scratch register
and do additional operations in their hotkey handlers.

Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1518
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c      | 12 ++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h      |  2 ++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  4 ++++
 3 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 96b7bb13a2dd9..12a6b1c99c93e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -1569,6 +1569,18 @@ void amdgpu_atombios_scratch_regs_engine_hung(struct amdgpu_device *adev,
 	WREG32(adev->bios_scratch_reg_offset + 3, tmp);
 }
 
+void amdgpu_atombios_scratch_regs_set_backlight_level(struct amdgpu_device *adev,
+						      u32 backlight_level)
+{
+	u32 tmp = RREG32(adev->bios_scratch_reg_offset + 2);
+
+	tmp &= ~ATOM_S2_CURRENT_BL_LEVEL_MASK;
+	tmp |= (backlight_level << ATOM_S2_CURRENT_BL_LEVEL_SHIFT) &
+		ATOM_S2_CURRENT_BL_LEVEL_MASK;
+
+	WREG32(adev->bios_scratch_reg_offset + 2, tmp);
+}
+
 bool amdgpu_atombios_scratch_need_asic_init(struct amdgpu_device *adev)
 {
 	u32 tmp = RREG32(adev->bios_scratch_reg_offset + 7);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h
index 8cc0222dba191..27e74b1fc260a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.h
@@ -185,6 +185,8 @@ bool amdgpu_atombios_has_gpu_virtualization_table(struct amdgpu_device *adev);
 void amdgpu_atombios_scratch_regs_lock(struct amdgpu_device *adev, bool lock);
 void amdgpu_atombios_scratch_regs_engine_hung(struct amdgpu_device *adev,
 					      bool hung);
+void amdgpu_atombios_scratch_regs_set_backlight_level(struct amdgpu_device *adev,
+						      u32 backlight_level);
 bool amdgpu_atombios_scratch_need_asic_init(struct amdgpu_device *adev);
 
 void amdgpu_atombios_copy_swap(u8 *dst, u8 *src, u8 num_bytes, bool to_le);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 084491afe5405..ea36f0fa59a9e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -50,6 +50,7 @@
 #include <drm/drm_hdcp.h>
 #endif
 #include "amdgpu_pm.h"
+#include "amdgpu_atombios.h"
 
 #include "amd_shared.h"
 #include "amdgpu_dm_irq.h"
@@ -3528,6 +3529,9 @@ static int amdgpu_dm_backlight_set_level(struct amdgpu_display_manager *dm,
 	caps = dm->backlight_caps[bl_idx];
 
 	dm->brightness[bl_idx] = user_brightness;
+	/* update scratch register */
+	if (bl_idx == 0)
+		amdgpu_atombios_scratch_regs_set_backlight_level(dm->adev, dm->brightness[bl_idx]);
 	brightness = convert_brightness_from_user(&caps, dm->brightness[bl_idx]);
 	link = (struct dc_link *)dm->backlight_link[bl_idx];
 
-- 
2.33.0


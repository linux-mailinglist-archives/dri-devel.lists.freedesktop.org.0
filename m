Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 926C8680039
	for <lists+dri-devel@lfdr.de>; Sun, 29 Jan 2023 17:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C03710E206;
	Sun, 29 Jan 2023 16:22:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr
 [80.12.242.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 033CE10E206
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jan 2023 16:22:54 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id MAS9pUMGLgf2oMAS9pRlGD; Sun, 29 Jan 2023 17:22:51 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 29 Jan 2023 17:22:51 +0100
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd: Optimize some memory initializations
Date: Sun, 29 Jan 2023 17:22:43 +0100
Message-Id: <1051df439dc7b7f382d27306820340ff4d470f98.1675009339.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of zeroing some memory and then copying data in part or all of it,
use memcpy_and_pad().
This avoids writing some memory twice and should save a few cycles.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c  | 11 ++++-------
 drivers/gpu/drm/amd/amdgpu/psp_v13_0.c   |  8 ++------
 drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c |  8 ++------
 3 files changed, 8 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index a8391f269cd0..5e69693a5cc4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -613,9 +613,8 @@ psp_cmd_submit_buf(struct psp_context *psp,
 	if (!drm_dev_enter(adev_to_drm(psp->adev), &idx))
 		return 0;
 
-	memset(psp->cmd_buf_mem, 0, PSP_CMD_BUFFER_SIZE);
-
-	memcpy(psp->cmd_buf_mem, cmd, sizeof(struct psp_gfx_cmd_resp));
+	memcpy_and_pad(psp->cmd_buf_mem, PSP_CMD_BUFFER_SIZE, cmd,
+		       sizeof(struct psp_gfx_cmd_resp), 0);
 
 	index = atomic_inc_return(&psp->fence_value);
 	ret = psp_ring_cmd_submit(psp, psp->cmd_buf_mc_addr, fence_mc_addr, index);
@@ -947,8 +946,7 @@ static int psp_rl_load(struct amdgpu_device *adev)
 
 	cmd = acquire_psp_cmd_buf(psp);
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-	memcpy(psp->fw_pri_buf, psp->rl.start_addr, psp->rl.size_bytes);
+	memcpy_and_pad(psp->fw_pri_buf, PSP_1_MEG, psp->rl.start_addr, psp->rl.size_bytes, 0);
 
 	cmd->cmd_id = GFX_CMD_ID_LOAD_IP_FW;
 	cmd->cmd.cmd_load_ip_fw.fw_phy_addr_lo = lower_32_bits(psp->fw_pri_mc_addr);
@@ -3479,8 +3477,7 @@ void psp_copy_fw(struct psp_context *psp, uint8_t *start_addr, uint32_t bin_size
 	if (!drm_dev_enter(adev_to_drm(psp->adev), &idx))
 		return;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-	memcpy(psp->fw_pri_buf, start_addr, bin_size);
+	memcpy_and_pad(psp->fw_pri_buf, PSP_1_MEG, start_addr, bin_size, 0);
 
 	drm_dev_exit(idx);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
index d62fcc77af95..79733ec4ffab 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v13_0.c
@@ -168,10 +168,8 @@ static int psp_v13_0_bootloader_load_component(struct psp_context  	*psp,
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy PSP KDB binary to memory */
-	memcpy(psp->fw_pri_buf, bin_desc->start_addr, bin_desc->size_bytes);
+	memcpy_and_pad(psp->fw_pri_buf, PSP_1_MEG, bin_desc->start_addr, bin_desc->size_bytes, 0);
 
 	/* Provide the PSP KDB to bootloader */
 	WREG32_SOC15(MP0, 0, regMP0_SMN_C2PMSG_36,
@@ -237,10 +235,8 @@ static int psp_v13_0_bootloader_load_sos(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy Secure OS binary to PSP memory */
-	memcpy(psp->fw_pri_buf, psp->sos.start_addr, psp->sos.size_bytes);
+	memcpy_and_pad(psp->fw_pri_buf, PSP_1_MEG, psp->sos.start_addr, psp->sos.size_bytes, 0);
 
 	/* Provide the PSP secure OS to bootloader */
 	WREG32_SOC15(MP0, 0, regMP0_SMN_C2PMSG_36,
diff --git a/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c b/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c
index d5ba58eba3e2..c73415b09e85 100644
--- a/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/psp_v13_0_4.c
@@ -107,10 +107,8 @@ static int psp_v13_0_4_bootloader_load_component(struct psp_context  	*psp,
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy PSP KDB binary to memory */
-	memcpy(psp->fw_pri_buf, bin_desc->start_addr, bin_desc->size_bytes);
+	memcpy_and_pad(psp->fw_pri_buf, PSP_1_MEG, bin_desc->start_addr, bin_desc->size_bytes, 0);
 
 	/* Provide the PSP KDB to bootloader */
 	WREG32_SOC15(MP0, 0, regMP0_SMN_C2PMSG_36,
@@ -170,10 +168,8 @@ static int psp_v13_0_4_bootloader_load_sos(struct psp_context *psp)
 	if (ret)
 		return ret;
 
-	memset(psp->fw_pri_buf, 0, PSP_1_MEG);
-
 	/* Copy Secure OS binary to PSP memory */
-	memcpy(psp->fw_pri_buf, psp->sos.start_addr, psp->sos.size_bytes);
+	memcpy_and_pad(psp->fw_pri_buf, PSP_1_MEG, psp->sos.start_addr, psp->sos.size_bytes, 0);
 
 	/* Provide the PSP secure OS to bootloader */
 	WREG32_SOC15(MP0, 0, regMP0_SMN_C2PMSG_36,
-- 
2.34.1


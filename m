Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4135EA3CB57
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 22:23:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BA010E037;
	Wed, 19 Feb 2025 21:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="hQ1gWCZI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E199710E037;
 Wed, 19 Feb 2025 21:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=1JGf/Y/oyw4zN0SBBADTkP28paEMPAF1wrU205emGFQ=; b=hQ1gWCZIBEFKpjVP
 JIDpOaUEX2Pe+tyZ7oYxEWfSytBv6CE3fBHcmt6zKFA9spJDAgjwRhK3B/BmEhaGhhNUTOUc9CZLn
 C5uoXMUCLuXBakHzWd8g52id4t+rZuW/JlkoClStPahsYgCCmqs+mGEk1hTLeCd4EXRFZKcrSNk+E
 kQkGU09+edqLM72A5Q5De+WffMar8MMX3k090UxFdf5IBIpyuSb+lfNBkn3RTEHeLOgoAq1svPtew
 ++NL3DG8MQxP6n5wIl3wnXpq9yzO+UN3NUzYDAiiKUga1T4CIXyX2+eD/MCE+t9wDo6gpx6lRkrxG
 z9RmkZj+CGnSe9CbeQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tkrXL-00H0cS-1n;
 Wed, 19 Feb 2025 21:23:19 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/amdgpu: Remove unused nbif_v6_3_1_sriov_funcs
Date: Wed, 19 Feb 2025 21:23:18 +0000
Message-ID: <20250219212318.46036-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The nbif_v6_3_1_sriov_funcs instance of amdgpu_nbio_funcs was added in
commit 894c6d3522d1 ("drm/amdgpu: Add nbif v6_3_1 ip block support")
but has remained unused.

Alex has confirmed it wasn't needed.

Remove it, together with the four unused stub functions:
  nbif_v6_3_1_sriov_ih_doorbell_range
  nbif_v6_3_1_sriov_gc_doorbell_init
  nbif_v6_3_1_sriov_vcn_doorbell_range
  nbif_v6_3_1_sriov_sdma_doorbell_range

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c | 46 ------------------------
 drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.h |  1 -
 2 files changed, 47 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c b/drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c
index c92875ceb31f..9efe74148867 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.c
@@ -474,52 +474,6 @@ const struct amdgpu_nbio_funcs nbif_v6_3_1_funcs = {
 };
 
 
-static void nbif_v6_3_1_sriov_ih_doorbell_range(struct amdgpu_device *adev,
-						bool use_doorbell, int doorbell_index)
-{
-}
-
-static void nbif_v6_3_1_sriov_sdma_doorbell_range(struct amdgpu_device *adev,
-						  int instance, bool use_doorbell,
-						  int doorbell_index,
-						  int doorbell_size)
-{
-}
-
-static void nbif_v6_3_1_sriov_vcn_doorbell_range(struct amdgpu_device *adev,
-						 bool use_doorbell,
-						 int doorbell_index, int instance)
-{
-}
-
-static void nbif_v6_3_1_sriov_gc_doorbell_init(struct amdgpu_device *adev)
-{
-}
-
-const struct amdgpu_nbio_funcs nbif_v6_3_1_sriov_funcs = {
-	.get_hdp_flush_req_offset = nbif_v6_3_1_get_hdp_flush_req_offset,
-	.get_hdp_flush_done_offset = nbif_v6_3_1_get_hdp_flush_done_offset,
-	.get_pcie_index_offset = nbif_v6_3_1_get_pcie_index_offset,
-	.get_pcie_data_offset = nbif_v6_3_1_get_pcie_data_offset,
-	.get_rev_id = nbif_v6_3_1_get_rev_id,
-	.mc_access_enable = nbif_v6_3_1_mc_access_enable,
-	.get_memsize = nbif_v6_3_1_get_memsize,
-	.sdma_doorbell_range = nbif_v6_3_1_sriov_sdma_doorbell_range,
-	.vcn_doorbell_range = nbif_v6_3_1_sriov_vcn_doorbell_range,
-	.gc_doorbell_init = nbif_v6_3_1_sriov_gc_doorbell_init,
-	.enable_doorbell_aperture = nbif_v6_3_1_enable_doorbell_aperture,
-	.enable_doorbell_selfring_aperture = nbif_v6_3_1_enable_doorbell_selfring_aperture,
-	.ih_doorbell_range = nbif_v6_3_1_sriov_ih_doorbell_range,
-	.update_medium_grain_clock_gating = nbif_v6_3_1_update_medium_grain_clock_gating,
-	.update_medium_grain_light_sleep = nbif_v6_3_1_update_medium_grain_light_sleep,
-	.get_clockgating_state = nbif_v6_3_1_get_clockgating_state,
-	.ih_control = nbif_v6_3_1_ih_control,
-	.init_registers = nbif_v6_3_1_init_registers,
-	.remap_hdp_registers = nbif_v6_3_1_remap_hdp_registers,
-	.get_rom_offset = nbif_v6_3_1_get_rom_offset,
-	.set_reg_remap = nbif_v6_3_1_set_reg_remap,
-};
-
 static int nbif_v6_3_1_set_ras_err_event_athub_irq_state(struct amdgpu_device *adev,
 						       struct amdgpu_irq_src *src,
 						       unsigned type,
diff --git a/drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.h b/drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.h
index 9ac4831d39e1..3afec715a9fe 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.h
+++ b/drivers/gpu/drm/amd/amdgpu/nbif_v6_3_1.h
@@ -28,7 +28,6 @@
 
 extern const struct nbio_hdp_flush_reg nbif_v6_3_1_hdp_flush_reg;
 extern const struct amdgpu_nbio_funcs nbif_v6_3_1_funcs;
-extern const struct amdgpu_nbio_funcs nbif_v6_3_1_sriov_funcs;
 extern struct amdgpu_nbio_ras nbif_v6_3_1_ras;
 
 #endif
-- 
2.48.1


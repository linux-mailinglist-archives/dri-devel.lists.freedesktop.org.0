Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064E998595A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 13:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8F710E98A;
	Wed, 25 Sep 2024 11:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QsS4aJUF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DA110E989;
 Wed, 25 Sep 2024 11:52:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DCBBD5C5C0C;
 Wed, 25 Sep 2024 11:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 940D5C4CEC3;
 Wed, 25 Sep 2024 11:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727265146;
 bh=2jYlFN/yQCokCArcZudZrPZowu9Ry5iEhLyKPup/8v0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QsS4aJUF8faoUHAreM7ZAioyoWll6eEGpLIh9A8Lrtc+Cq1kqBFMYylwJwzPNxkM+
 PssWp4am4QdSJ+uT8364YZH06dUaAuqetPvkEPjPHQSQzNIwTu8+Njump/V/Q4Xby3
 x0cZnb/KI9/nyJdcR5iaj4i+bpiRrBoRe3FbCHTIB8QTfgUTolj6Li7VsFsVnJxYdk
 h4BN/tLNez7uCo1pBWVMKpNCF/Dy04GlldGlccI+qQTEGmn5/SOLOmvt5865jRRIy8
 OMaHbN3ehldhqoZEDtFtZO9/3SoMub12qFN889KrUm/jiPy7qRvca9fVQUU9cIOyMP
 7IOB2ioxr7Fpg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Felix.Kuehling@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.11 217/244] drm/amdkfd: Check int source id for
 utcl2 poison event
Date: Wed, 25 Sep 2024 07:27:18 -0400
Message-ID: <20240925113641.1297102-217-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
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

From: Hawking Zhang <Hawking.Zhang@amd.com>

[ Upstream commit db6341a9168d2a24ded526277eeab29724d76e9d ]

Traditional utcl2 fault_status polling does not
work in SRIOV environment. The polling of fault
status register from guest side will be dropped
by hardware.

Driver should switch to check utcl2 interrupt
source id to identify utcl2 poison event. It is
set to 1 when poisoned data interrupts are
signaled.

v2: drop the unused local variable (Tao)

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Reviewed-by: Tao Zhou <tao.zhou1@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../gpu/drm/amd/amdkfd/kfd_int_process_v9.c    | 18 +-----------------
 drivers/gpu/drm/amd/amdkfd/soc15_int.h         |  1 +
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
index a9c3580be8c9b..fecdbbab98949 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v9.c
@@ -431,25 +431,9 @@ static void event_interrupt_wq_v9(struct kfd_node *dev,
 		   client_id == SOC15_IH_CLIENTID_UTCL2) {
 		struct kfd_vm_fault_info info = {0};
 		uint16_t ring_id = SOC15_RING_ID_FROM_IH_ENTRY(ih_ring_entry);
-		uint32_t node_id = SOC15_NODEID_FROM_IH_ENTRY(ih_ring_entry);
-		uint32_t vmid_type = SOC15_VMID_TYPE_FROM_IH_ENTRY(ih_ring_entry);
-		int hub_inst = 0;
 		struct kfd_hsa_memory_exception_data exception_data;
 
-		/* gfxhub */
-		if (!vmid_type && dev->adev->gfx.funcs->ih_node_to_logical_xcc) {
-			hub_inst = dev->adev->gfx.funcs->ih_node_to_logical_xcc(dev->adev,
-				node_id);
-			if (hub_inst < 0)
-				hub_inst = 0;
-		}
-
-		/* mmhub */
-		if (vmid_type && client_id == SOC15_IH_CLIENTID_VMC)
-			hub_inst = node_id / 4;
-
-		if (amdgpu_amdkfd_ras_query_utcl2_poison_status(dev->adev,
-					hub_inst, vmid_type)) {
+		if (source_id == SOC15_INTSRC_VMC_UTCL2_POISON) {
 			event_interrupt_poison_consumption_v9(dev, pasid, client_id);
 			return;
 		}
diff --git a/drivers/gpu/drm/amd/amdkfd/soc15_int.h b/drivers/gpu/drm/amd/amdkfd/soc15_int.h
index 10138676f27fd..e5c0205f26181 100644
--- a/drivers/gpu/drm/amd/amdkfd/soc15_int.h
+++ b/drivers/gpu/drm/amd/amdkfd/soc15_int.h
@@ -29,6 +29,7 @@
 #define SOC15_INTSRC_CP_BAD_OPCODE	183
 #define SOC15_INTSRC_SQ_INTERRUPT_MSG	239
 #define SOC15_INTSRC_VMC_FAULT		0
+#define SOC15_INTSRC_VMC_UTCL2_POISON	1
 #define SOC15_INTSRC_SDMA_TRAP		224
 #define SOC15_INTSRC_SDMA_ECC		220
 #define SOC21_INTSRC_SDMA_TRAP		49
-- 
2.43.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F06177C860
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 09:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BED10E14D;
	Tue, 15 Aug 2023 07:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 508 seconds by postgrey-1.36 at gabe;
 Tue, 15 Aug 2023 07:13:49 UTC
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.155.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB2210E0C6;
 Tue, 15 Aug 2023 07:13:49 +0000 (UTC)
X-QQ-mid: bizesmtp62t1692083088t8k0r85y
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 15 Aug 2023 15:04:46 +0800 (CST)
X-QQ-SSF: 01400000000000G0Z000000A0000000
X-QQ-FEAT: wIl24N/TCD4/tPhPuj+YKhYjoZITwiM2MkS4tlY/grP96nhSNsgYzgnJPQh4K
 zjUwfzcHAo5Q/o5sPzPtgPPU546CRj25sXogatgG/JC68+K8mQR0I0H2hPCGUrXfVh5Lw3H
 QoNifDZMv8P4BX5EpWh/cFAZzDTt75vXgWpgRC0+YKzxgz5Cle8duNf5lRbPFrFywU5FsSt
 +GFtb6FPEL0fs9kgfk2iF/1HuMERaeEF6rd6BhYTqxztII9ZnGySHM7XevWm8zWwkKPhxuT
 bUZ8V8TjAB8P6BdbR0TpwkfBlBx7c+zSfMrArv8ytoFA0uo0Vmf7Ww6A14QC2d+U1YPnRLF
 3uBr6DBN/Rj/vT1XnWI03L8qEbK+VyfR5QsD3+ERKJMuVoL7eZm2M8M3ajpxBFeDyeN7qPb
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4099447814679117161
From: hongao <hongao@uniontech.com>
To: alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, lijo.lazar@amd.com, mario.limonciello@amd.com
Subject: [PATCH] drm/amdgpu/gmc6: fix in case the PCI BAR is larger than the
 actual amount of vram
Date: Tue, 15 Aug 2023 14:54:45 +0800
Message-Id: <20230815065445.25576-1-hongao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz7a-1
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
Cc: hongao <hongao@uniontech.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[why]
limit visible_vram_size to real_vram_size in case
the PCI BAR is larger than the actual amount of vram.

Signed-off-by: hongao <hongao@uniontech.com>
---
 drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
index b7dad4e67813..c0de7496bfd1 100644
--- a/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gmc_v6_0.c
@@ -320,6 +320,8 @@ static int gmc_v6_0_mc_init(struct amdgpu_device *adev)
 	adev->gmc.aper_base = pci_resource_start(adev->pdev, 0);
 	adev->gmc.aper_size = pci_resource_len(adev->pdev, 0);
 	adev->gmc.visible_vram_size = adev->gmc.aper_size;
+	if (adev->gmc.visible_vram_size > adev->gmc.real_vram_size)
+		adev->gmc.visible_vram_size = adev->gmc.real_vram_size;
 
 	/* set the gart size */
 	if (amdgpu_gart_size == -1) {
-- 
2.20.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF73821E4C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jan 2024 16:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D014010E1D0;
	Tue,  2 Jan 2024 15:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4010F10E1D0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jan 2024 15:07:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B80E161179;
 Tue,  2 Jan 2024 15:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70731C433CC;
 Tue,  2 Jan 2024 15:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704208025;
 bh=UlaJEziqzdhCw7f0wAaTCtw2xwU8224gk817BjROfoQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mOSLFDWQ2FEnN28+kaDYYNEa95I80yaYBaFJiI4uHrywdVmuO+em4uFdcUUHeZ9z0
 TT7aU9FslIDvH/zEUoymI/PcpbA4p21OAYk6vRoclbzfxxThwylc3Gob6qPSl6K8iu
 ejoERQ8Qtp3Xe4XLvunc3XmYf30Vll4/Xn4K5xB4UMU40Emxk3dxgdoYtm3cpfU/jg
 Ks0QUwECbyR5+jUmdUAnWmHtcdFpL02tSFCzhWmD/NtqC5XT5SEFicA/fIVRuww0vr
 h2F0+XVi4LOnkQ94rE34LeemaGajAlMLbd0vnSjTScO8oVifTkH+L3I6s52xIBsvZl
 9/Zr7pWy9nI+w==
From: Oded Gabbay <ogabbay@kernel.org>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] accel/habanalabs: fix DRAM BAR base address calculation
Date: Tue,  2 Jan 2024 17:06:52 +0200
Message-Id: <20240102150654.522555-4-ogabbay@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240102150654.522555-1-ogabbay@kernel.org>
References: <20240102150654.522555-1-ogabbay@kernel.org>
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
Cc: Tomer Tayar <ttayar@habana.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomer Tayar <ttayar@habana.ai>

When the DRAM region size in the BAR is not a power of 2, calculating
the corresponding BAR base address should be done using the offset from
the DRAM start address, and not using directly the DRAM address.

Signed-off-by: Tomer Tayar <ttayar@habana.ai>
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
---
 drivers/accel/habanalabs/common/device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/device.c b/drivers/accel/habanalabs/common/device.c
index 514459396818..15891de6cf39 100644
--- a/drivers/accel/habanalabs/common/device.c
+++ b/drivers/accel/habanalabs/common/device.c
@@ -55,7 +55,8 @@ static u64 hl_set_dram_bar(struct hl_device *hdev, u64 addr, struct pci_mem_regi
 	if (is_power_of_2(prop->dram_pci_bar_size))
 		bar_base_addr = addr & ~(prop->dram_pci_bar_size - 0x1ull);
 	else
-		bar_base_addr = DIV_ROUND_DOWN_ULL(addr, prop->dram_pci_bar_size) *
+		bar_base_addr = region->region_base +
+				div64_u64((addr - region->region_base), prop->dram_pci_bar_size) *
 				prop->dram_pci_bar_size;
 
 	old_base = hdev->asic_funcs->set_dram_bar_base(hdev, bar_base_addr);
-- 
2.34.1


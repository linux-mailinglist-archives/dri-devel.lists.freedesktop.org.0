Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 445BC18A47C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 21:54:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148D76E968;
	Wed, 18 Mar 2020 20:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142316E966;
 Wed, 18 Mar 2020 20:54:31 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2274620BED;
 Wed, 18 Mar 2020 20:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584564871;
 bh=+qQRse8RqlkU/6s73AD5+3QBNHW78pnuLWsIUtuDqKs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QzpM78h12L81FtcHKNFruY4yfbG4cZ5fI3o2Ebl8wy83/gShAEn1KXXv4bmI306s2
 EpiDap3aQq72E3exf6DdMFJt0cuwm53GdARyloa00BiteP26+zQYXaFEBAVTzYRm7z
 OlwrRtrGaRPeeHcQCIfuZpgNHt78NK3h4NFmUYa0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 42/73] drm/amdgpu: correct ROM_INDEX/DATA offset
 for VEGA20
Date: Wed, 18 Mar 2020 16:53:06 -0400
Message-Id: <20200318205337.16279-42-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200318205337.16279-1-sashal@kernel.org>
References: <20200318205337.16279-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Candice Li <Candice.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hawking Zhang <Hawking.Zhang@amd.com>

[ Upstream commit f1c2cd3f8fb959123a9beba18c0e8112dcb2e137 ]

The ROMC_INDEX/DATA offset was changed to e4/e5 since
from smuio_v11 (vega20/arcturus).

Signed-off-by: Hawking Zhang <Hawking.Zhang@amd.com>
Tested-by: Candice Li <Candice.Li@amd.com>
Reviewed-by: Candice Li <Candice.Li@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/soc15.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/soc15.c b/drivers/gpu/drm/amd/amdgpu/soc15.c
index 80934ca172607..c086262cc181d 100644
--- a/drivers/gpu/drm/amd/amdgpu/soc15.c
+++ b/drivers/gpu/drm/amd/amdgpu/soc15.c
@@ -84,6 +84,13 @@
 #define HDP_MEM_POWER_CTRL__RC_MEM_POWER_CTRL_EN_MASK	0x00010000L
 #define HDP_MEM_POWER_CTRL__RC_MEM_POWER_LS_EN_MASK		0x00020000L
 #define mmHDP_MEM_POWER_CTRL_BASE_IDX	0
+
+/* for Vega20/arcturus regiter offset change */
+#define	mmROM_INDEX_VG20				0x00e4
+#define	mmROM_INDEX_VG20_BASE_IDX			0
+#define	mmROM_DATA_VG20					0x00e5
+#define	mmROM_DATA_VG20_BASE_IDX			0
+
 /*
  * Indirect registers accessor
  */
@@ -304,6 +311,8 @@ static bool soc15_read_bios_from_rom(struct amdgpu_device *adev,
 {
 	u32 *dw_ptr;
 	u32 i, length_dw;
+	uint32_t rom_index_offset;
+	uint32_t rom_data_offset;
 
 	if (bios == NULL)
 		return false;
@@ -316,11 +325,23 @@ static bool soc15_read_bios_from_rom(struct amdgpu_device *adev,
 	dw_ptr = (u32 *)bios;
 	length_dw = ALIGN(length_bytes, 4) / 4;
 
+	switch (adev->asic_type) {
+	case CHIP_VEGA20:
+	case CHIP_ARCTURUS:
+		rom_index_offset = SOC15_REG_OFFSET(SMUIO, 0, mmROM_INDEX_VG20);
+		rom_data_offset = SOC15_REG_OFFSET(SMUIO, 0, mmROM_DATA_VG20);
+		break;
+	default:
+		rom_index_offset = SOC15_REG_OFFSET(SMUIO, 0, mmROM_INDEX);
+		rom_data_offset = SOC15_REG_OFFSET(SMUIO, 0, mmROM_DATA);
+		break;
+	}
+
 	/* set rom index to 0 */
-	WREG32(SOC15_REG_OFFSET(SMUIO, 0, mmROM_INDEX), 0);
+	WREG32(rom_index_offset, 0);
 	/* read out the rom data */
 	for (i = 0; i < length_dw; i++)
-		dw_ptr[i] = RREG32(SOC15_REG_OFFSET(SMUIO, 0, mmROM_DATA));
+		dw_ptr[i] = RREG32(rom_data_offset);
 
 	return true;
 }
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

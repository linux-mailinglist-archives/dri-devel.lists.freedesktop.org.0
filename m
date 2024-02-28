Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B8086A504
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 02:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7110210E9AC;
	Wed, 28 Feb 2024 01:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A46210E9BE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 01:28:36 +0000 (UTC)
X-UUID: dcfdaf20806d478f87296c71c8e60693-20240228
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:175b7b38-df8f-4664-8453-a39aa8b672c6, IP:20,
 URL:0,TC:0,Content:-25,EDM:-30,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,
 ACTION:release,TS:-50
X-CID-INFO: VERSION:1.1.37, REQID:175b7b38-df8f-4664-8453-a39aa8b672c6, IP:20,
 UR
 L:0,TC:0,Content:-25,EDM:-30,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,AC
 TION:release,TS:-50
X-CID-META: VersionHash:6f543d0, CLOUDID:4e456484-8d4f-477b-89d2-1e3bdbef96d1,
 B
 ulkID:2402280923195D8PB1H9,BulkQuantity:0,Recheck:0,SF:19|44|66|38|24|17|1
 02,TC:nil,Content:0,EDM:2,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:
 nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: dcfdaf20806d478f87296c71c8e60693-20240228
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <yaolu@kylinos.cn>) (Generic MTA)
 with ESMTP id 816934123; Wed, 28 Feb 2024 09:23:16 +0800
From: Lu Yao <yaolu@kylinos.cn>
To: frank.binns@imgtec.com, donald.robson@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lu Yao <yaolu@kylinos.cn>
Subject: [PATCH] drm/imagination: Kconfig: add 'PAGE_SIZE=4K' dependency
Date: Wed, 28 Feb 2024 09:23:13 +0800
Message-Id: <20240228012313.5934-1-yaolu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

When 'PAGE_SIZE=64K',the following compilation error occurs:
"
  ../drivers/gpu/drm/imagination/pvr_fw_mips.c: In function
‘pvr_mips_fw_process’:
  ../drivers/gpu/drm/imagination/pvr_fw_mips.c:140:60: error: array
subscript 0 is outside the bounds of an interior zero-length array
‘dma_addr_t[0]’ {aka ‘long long unsigned int[]’}
[-Werror=zero-length-bounds]
  140 |   boot_data->pt_phys_addr[page_nr] =
mips_data->pt_dma_addr[src_page_nr] +
~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
  In file included from ../drivers/gpu/drm/imagination/pvr_fw_mips.c:6:
  ../drivers/gpu/drm/imagination/pvr_fw_mips.h:30:13: note: while
referencing ‘pt_dma_addr’
   30 |  dma_addr_t pt_dma_addr[PVR_MIPS_PT_PAGE_COUNT];
"

This is because 'PVR_MIPS_PT_PAGE_COUNT' is defined as
'(ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES * ROGUE_MIPSFW_PAGE_SIZE_4K) \
>> PAGE_SHIFT', and under the above conditions, 'PAGE_SHIFT' is '16',
'ROGUE_MIPSFW_MAX_NUM_PAGETABLE_PAGES' is '4','ROGUE_MIPSFW_PAGE_SIZE_4K'
is '4096',so 'PVR_MIPS_PT_PAGE_COUNT' is '0' causing the member
'pt_dma_addr' to be incorrectly defined.

Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
 drivers/gpu/drm/imagination/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 3bfa2ac212dc..e585922f634d 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -3,7 +3,7 @@
 
 config DRM_POWERVR
 	tristate "Imagination Technologies PowerVR (Series 6 and later) & IMG Graphics"
-	depends on ARM64
+	depends on (ARM64 && ARM64_PAGE_SHIFT=12)
 	depends on DRM
 	depends on PM
 	select DRM_EXEC
-- 
2.25.1


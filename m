Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13579C39F36
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 10:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6769C10E86B;
	Thu,  6 Nov 2025 09:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C00E610E86B
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 09:57:45 +0000 (UTC)
X-UUID: 07da8b5cbaf711f0a38c85956e01ac42-20251106
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6, REQID:1399e330-be90-4c86-ad1b-97d8be391368, IP:0,
 UR
 L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:-5
X-CID-META: VersionHash:a9d874c, CLOUDID:04985c978a3ff4cec5b5ce6400c6fd80,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102|850,TC:nil,Content:0|15|50,EDM:-3,IP
 :nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
 LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 07da8b5cbaf711f0a38c85956e01ac42-20251106
X-User: liqiang01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
 (envelope-from <liqiang01@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 759082566; Thu, 06 Nov 2025 17:57:39 +0800
From: Li Qiang <liqiang01@kylinos.cn>
To: lyude@redhat.com, dakr@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Li Qiang <liqiang01@kylinos.cn>
Subject: [PATCH] drm/nouveau: Add __GFP_NOFAIL for DSM buffer allocation in
 r535_disp_oneinit()
Date: Thu,  6 Nov 2025 17:57:35 +0800
Message-Id: <20251106095735.788100-1-liqiang01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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

acpi_evaluate_dsm() expects a valid buffer pointer for the DSM argument.
The current code uses kmalloc() without checking its return value, which
may lead to a NULL pointer dereference under memory pressure.

Since this buffer is small and there is no recovery path available here,
use __GFP_NOFAIL to guarantee allocation success and avoid potential
kernel crashes.

Fixes: 9e99444490238 ("drm/nouveau/disp/r535: initial support")
Signed-off-by: Li Qiang <liqiang01@kylinos.cn>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 6e63df816d85..f55ff5dea1c5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -1585,7 +1585,8 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 					union acpi_object argv4 = {
 						.buffer.type    = ACPI_TYPE_BUFFER,
 						.buffer.length  = sizeof(ctrl->backLightData),
-						.buffer.pointer = kmalloc(argv4.buffer.length, GFP_KERNEL),
+						.buffer.pointer = kmalloc(argv4.buffer.length,
+								GFP_KERNEL | __GFP_NOFAIL),
 					}, *obj;
 
 					obj = acpi_evaluate_dsm(handle, nbci ? &NBCI_DSM_GUID : &NVHG_DSM_GUID,
-- 
2.25.1


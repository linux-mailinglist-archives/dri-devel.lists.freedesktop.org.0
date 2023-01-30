Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B95C681E37
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 23:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E3510E2F8;
	Mon, 30 Jan 2023 22:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE2A10E2F8
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jan 2023 22:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675118345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5HWz5p93ArQJ6C4yFpp1c9VXp/d4vFNh/rVHun8UY8w=;
 b=MYPsqZjVHzEtSPUwZ02xbKddeAnXQC2jQU3pugv5NErccCyuOg6xLiw9jiZxeYOLUjR+z3
 ouLF1xhKgCP30w2JbYhrMIOy0OceltEhPNbR/4DL1FXCaefuFu1qXdslvcyyoBq3pTfspQ
 14dsUIWb5KtvCNyD4VYKcqCxKfg/GX8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-HnI_0zRGPVuikelfu2NFMQ-1; Mon, 30 Jan 2023 17:37:34 -0500
X-MC-Unique: HnI_0zRGPVuikelfu2NFMQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3042101A55E;
 Mon, 30 Jan 2023 22:37:33 +0000 (UTC)
Received: from localhost.localdomain (vpn2-52-18.bne.redhat.com [10.64.52.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9607492B0A;
 Mon, 30 Jan 2023 22:37:31 +0000 (UTC)
From: Ben Skeggs <bskeggs@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/nouveau/acr/gm20b: regression fixes
Date: Tue, 31 Jan 2023 08:37:15 +1000
Message-Id: <20230130223715.1831509-3-bskeggs@redhat.com>
In-Reply-To: <20230130223715.1831509-1-bskeggs@redhat.com>
References: <20230130223715.1831509-1-bskeggs@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Nicolas Chauvet <kwizart@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Missed some Tegra-specific quirks when reworking ACR to support Ampere.

Fixes: 2541626cfb79 ("drm/nouveau/acr: use common falcon HS FW code for	ACR FWs")
Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Tested-By: Nicolas Chauvet <kwizart@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c    |  3 +++
 drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c     | 14 +++++++++++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c |  2 +-
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
index fcf2a002f6cb..91fb494d4009 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
@@ -151,6 +151,9 @@ nvkm_firmware_mem_page(struct nvkm_memory *memory)
 static enum nvkm_memory_target
 nvkm_firmware_mem_target(struct nvkm_memory *memory)
 {
+	if (nvkm_firmware_mem(memory)->device->func->tegra)
+		return NVKM_MEM_TARGET_NCOH;
+
 	return NVKM_MEM_TARGET_HOST;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
index 393ade9f7e6c..b7da3ab44c27 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
@@ -48,6 +48,16 @@ gm200_flcn_pio_dmem_rd(struct nvkm_falcon *falcon, u8 port, const u8 *img, int l
 		img += 4;
 		len -= 4;
 	}
+
+	/* Sigh.  Tegra PMU FW's init message... */
+	if (len) {
+		u32 data = nvkm_falcon_rd32(falcon, 0x1c4 + (port * 8));
+
+		while (len--) {
+			*(u8 *)img++ = data & 0xff;
+			data >>= 8;
+		}
+	}
 }
 
 static void
@@ -64,6 +74,8 @@ gm200_flcn_pio_dmem_wr(struct nvkm_falcon *falcon, u8 port, const u8 *img, int l
 		img += 4;
 		len -= 4;
 	}
+
+	WARN_ON(len);
 }
 
 static void
@@ -74,7 +86,7 @@ gm200_flcn_pio_dmem_wr_init(struct nvkm_falcon *falcon, u8 port, bool sec, u32 d
 
 const struct nvkm_falcon_func_pio
 gm200_flcn_dmem_pio = {
-	.min = 4,
+	.min = 1,
 	.max = 0x100,
 	.wr_init = gm200_flcn_pio_dmem_wr_init,
 	.wr = gm200_flcn_pio_dmem_wr,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
index a72403777329..2ed04da3621d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gm20b.c
@@ -225,7 +225,7 @@ gm20b_pmu_init(struct nvkm_pmu *pmu)
 
 	pmu->initmsg_received = false;
 
-	nvkm_falcon_load_dmem(falcon, &args, addr_args, sizeof(args), 0);
+	nvkm_falcon_pio_wr(falcon, (u8 *)&args, 0, 0, DMEM, addr_args, sizeof(args), 0, false);
 	nvkm_falcon_start(falcon);
 	return 0;
 }
-- 
2.35.1


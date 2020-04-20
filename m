Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A8E1B1F2E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DCA6E8B6;
	Tue, 21 Apr 2020 06:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCD36E843
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 18:36:37 +0000 (UTC)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 495b4z3MXVz9v1w9;
 Mon, 20 Apr 2020 20:36:35 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=E+DWEZwJ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id L4mwlUXAK_-i; Mon, 20 Apr 2020 20:36:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 495b4z2JLhz9v95f;
 Mon, 20 Apr 2020 20:36:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587407795; bh=0fa57ddsyHEgiUKKkj3rA4MemZZkyaFbgYjKejGShaM=;
 h=From:Subject:To:Cc:Date:From;
 b=E+DWEZwJhz6Y/xgde33hxmuD3rGUtiRxeI/8EM0ccVSx3KfiQ4f7G5tlyiclyZlTv
 G3EZfX0BGGT6pW9WIfnMkWEKqCSDbnWxGkJCDbptk9jvRRwxinuBROxEoLLsiTAxU+
 2fc5X+q61AH6lsZ6C9gAPrkXh1oIdYDt+A1N76WQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F6AA8B78A;
 Mon, 20 Apr 2020 20:36:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7Voh0XE4aIU2; Mon, 20 Apr 2020 20:36:35 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EFABD8B77E;
 Mon, 20 Apr 2020 20:36:34 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B0D97657AE; Mon, 20 Apr 2020 18:36:34 +0000 (UTC)
Message-Id: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 1/5] drivers/powerpc: Replace _ALIGN_UP() by ALIGN()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 20 Apr 2020 18:36:34 +0000 (UTC)
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

_ALIGN_UP() is specific to powerpc
ALIGN() is generic and does the same

Replace _ALIGN_UP() by ALIGN()

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/ps3/ps3-lpm.c               | 6 +++---
 drivers/vfio/pci/vfio_pci_nvlink2.c | 2 +-
 drivers/video/fbdev/ps3fb.c         | 4 ++--
 sound/ppc/snd_ps3.c                 | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/ps3/ps3-lpm.c b/drivers/ps3/ps3-lpm.c
index 83c45659bc9d..064b5884ba13 100644
--- a/drivers/ps3/ps3-lpm.c
+++ b/drivers/ps3/ps3-lpm.c
@@ -1096,8 +1096,8 @@ int ps3_lpm_open(enum ps3_lpm_tb_type tb_type, void *tb_cache,
 		lpm_priv->tb_cache_internal = NULL;
 		lpm_priv->tb_cache = NULL;
 	} else if (tb_cache) {
-		if (tb_cache != (void *)_ALIGN_UP((unsigned long)tb_cache, 128)
-			|| tb_cache_size != _ALIGN_UP(tb_cache_size, 128)) {
+		if (tb_cache != (void *)ALIGN((unsigned long)tb_cache, 128)
+			|| tb_cache_size != ALIGN(tb_cache_size, 128)) {
 			dev_err(sbd_core(), "%s:%u: unaligned tb_cache\n",
 				__func__, __LINE__);
 			result = -EINVAL;
@@ -1116,7 +1116,7 @@ int ps3_lpm_open(enum ps3_lpm_tb_type tb_type, void *tb_cache,
 			result = -ENOMEM;
 			goto fail_malloc;
 		}
-		lpm_priv->tb_cache = (void *)_ALIGN_UP(
+		lpm_priv->tb_cache = (void *)ALIGN(
 			(unsigned long)lpm_priv->tb_cache_internal, 128);
 	}
 
diff --git a/drivers/vfio/pci/vfio_pci_nvlink2.c b/drivers/vfio/pci/vfio_pci_nvlink2.c
index ed20d73cc27c..65c61710c0e9 100644
--- a/drivers/vfio/pci/vfio_pci_nvlink2.c
+++ b/drivers/vfio/pci/vfio_pci_nvlink2.c
@@ -67,7 +67,7 @@ static size_t vfio_pci_nvgpu_rw(struct vfio_pci_device *vdev,
 	 *
 	 * This is not fast path anyway.
 	 */
-	sizealigned = _ALIGN_UP(posoff + count, PAGE_SIZE);
+	sizealigned = ALIGN(posoff + count, PAGE_SIZE);
 	ptr = ioremap_cache(data->gpu_hpa + posaligned, sizealigned);
 	if (!ptr)
 		return -EFAULT;
diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
index 834f63edf700..9df78fb77267 100644
--- a/drivers/video/fbdev/ps3fb.c
+++ b/drivers/video/fbdev/ps3fb.c
@@ -44,7 +44,7 @@
 #define GPU_CMD_BUF_SIZE			(2 * 1024 * 1024)
 #define GPU_FB_START				(64 * 1024)
 #define GPU_IOIF				(0x0d000000UL)
-#define GPU_ALIGN_UP(x)				_ALIGN_UP((x), 64)
+#define GPU_ALIGN_UP(x)				ALIGN((x), 64)
 #define GPU_MAX_LINE_LENGTH			(65536 - 64)
 
 #define GPU_INTR_STATUS_VSYNC_0			0	/* vsync on head A */
@@ -1015,7 +1015,7 @@ static int ps3fb_probe(struct ps3_system_bus_device *dev)
 	}
 #endif
 
-	max_ps3fb_size = _ALIGN_UP(GPU_IOIF, 256*1024*1024) - GPU_IOIF;
+	max_ps3fb_size = ALIGN(GPU_IOIF, 256*1024*1024) - GPU_IOIF;
 	if (ps3fb_videomemory.size > max_ps3fb_size) {
 		dev_info(&dev->core, "Limiting ps3fb mem size to %lu bytes\n",
 			 max_ps3fb_size);
diff --git a/sound/ppc/snd_ps3.c b/sound/ppc/snd_ps3.c
index 6d2a33b8faa0..b8161a08f2ca 100644
--- a/sound/ppc/snd_ps3.c
+++ b/sound/ppc/snd_ps3.c
@@ -926,7 +926,7 @@ static int snd_ps3_driver_probe(struct ps3_system_bus_device *dev)
 			    PAGE_SHIFT, /* use system page size */
 			    0, /* dma type; not used */
 			    NULL,
-			    _ALIGN_UP(SND_PS3_DMA_REGION_SIZE, PAGE_SIZE));
+			    ALIGN(SND_PS3_DMA_REGION_SIZE, PAGE_SIZE));
 	dev->d_region->ioid = PS3_AUDIO_IOID;
 
 	ret = ps3_dma_region_create(dev->d_region);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 969DA2D0C5B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E306E823;
	Mon,  7 Dec 2020 08:57:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 540 seconds by postgrey-1.36 at gabe;
 Fri, 04 Dec 2020 13:21:28 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D006E17B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 13:21:28 +0000 (UTC)
Received: from orion.localdomain ([95.114.158.118]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MYcy3-1kgWBh3Gol-00Veyn; Fri, 04 Dec 2020 14:12:22 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: gpu: drm: virtio: fix dependency of DRM_VIRTIO_GPU
 on VIRTIO
Date: Fri,  4 Dec 2020 14:12:21 +0100
Message-Id: <20201204131221.2827-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:3Im9AR8enAhEZ521drYds2y30UO6XrMQxF7XSNeRaHzWJtu0806
 nomRdpnhyqV9yq3cBgTAy9GY7ZuqnPpXvXM4RYvkgZ6VZwhypBYgx9OZ6LbDbl+uL1ivihl
 c3jNOwd4B09o3DTB1Je5/4NeVyCGFGPxXeU2Lio/C8KpRElAOpzJTx8oDvGpOKEOwx3JZS+
 zRV38mFeCRPfFCwMuz+jw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8UJG8JyP2co=:H6gfRpp0gBQiq8eHCJKPS3
 +K+kT0fYezS+dcwg7B4Nun2dkvHFKAgG9sL1vdCJYABPsxbw82IuDdkm/fDBJNpcR2CFnHmC0
 dSkOXeDy2MFMsYizVnVJhvkAtGPqA1vjqy0JiZ6vXflo6z/hf+8OwTBlfZ5p4NK27R6FHYSPH
 +7y5C6YYUf/HYqtIQchF/lwwM2rpsMmXCVnE2v8coKvyJvgFn2qNmk+J3+gIYiMHz9jqfcric
 /MxSW6RuVaqHYsNX2I/vUSA3qLT/hBIhCRNU0NvW96oMcLorOKDtNGtuQa6X7vRzHOlbNlyGH
 eNuythkRNLgd5Wdp9E+L7pRYLhtQMscVcPwvgnvKCu5Z0vAu0/2hTaDDkshNnCV4e/YA6xYLB
 lBDmQOdr6yNsvQwz7GNo3OxPTVEChpVsd1HHMTrKw3LdFBwZR4xVyJrDjd/Sn
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 virtualization@lists.linux-foundation.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VIRTIO itself has no dependencies and therefore can easily be just
select'ed, instead of depending on it. The current depends on causes
any others trying to select VIRTIO to fail like this:

   drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
   drivers/gpu/drm/Kconfig:74:	symbol DRM_KMS_HELPER is selected by DRM_VIRTIO_GPU
   drivers/gpu/drm/virtio/Kconfig:2:	symbol DRM_VIRTIO_GPU depends on VIRTIO
   drivers/virtio/Kconfig:2:	symbol VIRTIO is selected by GPIO_VIRTIO
   drivers/gpio/Kconfig:1618:	symbol GPIO_VIRTIO depends on GPIOLIB
   drivers/gpio/Kconfig:14:	symbol GPIOLIB is selected by I2C_MUX_LTC4306
   drivers/i2c/muxes/Kconfig:47:	symbol I2C_MUX_LTC4306 depends on I2C
   drivers/i2c/Kconfig:8:	symbol I2C is selected by FB_DDC
   drivers/video/fbdev/Kconfig:63:	symbol FB_DDC depends on FB
   drivers/video/fbdev/Kconfig:12:	symbol FB is selected by DRM_KMS_FB_HELPER
   drivers/gpu/drm/Kconfig:80:	symbol DRM_KMS_FB_HELPER depends on DRM_KMS_HELPER

It seems that having both 'depends on' as well as 'select' on the same symbol
sends us into big trouble, and Kconfig can't break up the circular dependency
(note that in the tested configuration, neither I2C, FB or DRM are enabled at
all). Perhaps we could consider this a bug in Kconfig, but the trouble can
easily be circumvented by changing 'depends on' into 'select'.

DRM_VIRTIO_GPU also depends on VIRTIO_MENU, so even after this change, that
option will only show up if the user already enabled virtio in the config.

This change didn't cause any changes in the .config after menuconfig run,
so we should be completely safe here.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/gpu/drm/virtio/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/Kconfig b/drivers/gpu/drm/virtio/Kconfig
index b925b8b1da16..51ec7c3240c9 100644
--- a/drivers/gpu/drm/virtio/Kconfig
+++ b/drivers/gpu/drm/virtio/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_VIRTIO_GPU
 	tristate "Virtio GPU driver"
-	depends on DRM && VIRTIO && VIRTIO_MENU && MMU
+	depends on DRM && VIRTIO_MENU && MMU
+	select VIRTIO
 	select DRM_KMS_HELPER
 	select DRM_GEM_SHMEM_HELPER
 	select VIRTIO_DMA_SHARED_BUFFER
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E06C41CDBA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 23:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18276E237;
	Wed, 29 Sep 2021 21:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 555 seconds by postgrey-1.36 at gabe;
 Wed, 29 Sep 2021 19:45:29 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A436E217;
 Wed, 29 Sep 2021 19:45:29 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1632944170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=sSLuRBFlzDo1MDk8K9oDSXuyG2gJ98toV3YqmhcDhug=;
 b=Stg8WZylVaEbGM1n3UX2/Wx5LUrePV+Zkf6u1keyJeA8BLPB8pWH6Y0uvUcaSgsQ4hPglS
 DzI/RVE5EDD7ZvCcVLgX8T7jvc9faHaWZERzTaeT2dgYh24vycCZgk2AnyCfI2PPGrTZIv
 BgdqXU0b+8xbJQiqR1gpXQffabvj1qrlECqduS/CXvp5LW8qYa36VqdX5e1J7DTOPrc11c
 sBsn74qDPUsM4WLNeqW4d/k9o/Gq6AxN3gEuCLMxRcxub5z27qY3s4h4YXWCc8KBd8W++Z
 2aCQ2+7Lj3b0x1lCV9s3lfwHGIko4eW1DWCf3I6i9edd3e94aH5P+HbZnktqgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1632944170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=sSLuRBFlzDo1MDk8K9oDSXuyG2gJ98toV3YqmhcDhug=;
 b=4ZX0DFGEEYRuiDSu9y47IbTvaUUghuyhq8jdw7mO9zzQessRdosX1P/T3O490NMd7IBaTI
 HYV5aSo70LK97bBg==
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: kmemleak report: 5.15.0-rc3: nouveau_fence_new
Date: Wed, 29 Sep 2021 21:42:09 +0206
Message-ID: <87v92j18eu.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 29 Sep 2021 21:04:25 +0000
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

Hello,

With 5.15.0-rc3 on my ppc64 (PowerMac G5) I am seeing kmemleak
reports. They are always 96 bytes and with the same stacktrace.

unreferenced object 0xc000000011d2a7e0 (size 96):
  comm "X", pid 1743, jiffies 4295010075 (age 5457.040s)
  hex dump (first 32 bytes):
    c0 00 00 00 0b 9f f0 00 c0 00 3d 00 00 b0 85 90  ..........=.....
    00 00 00 a9 77 41 30 23 c0 00 00 00 08 db b7 c8  ....wA0#........
  backtrace:
    [<000000006f102108>] .nouveau_fence_new+0x4c/0x120 [nouveau]
    [<00000000395e0a83>] .nouveau_bo_move+0x4f0/0x870 [nouveau]
    [<00000000f17bc6da>] .ttm_bo_handle_move_mem+0xb4/0x1e0 [ttm]
    [<00000000fb36762f>] .ttm_bo_validate+0x144/0x230 [ttm]
    [<00000000a84dc7b3>] .nouveau_bo_validate+0x70/0xc0 [nouveau]
    [<00000000b4e870a2>] .nouveau_gem_ioctl_pushbuf+0x6e0/0x1a90 [nouveau]
    [<000000007b7c5c38>] .drm_ioctl_kernel+0x104/0x180 [drm]
    [<000000000af76e30>] .drm_ioctl+0x244/0x490 [drm]
    [<00000000ebb759e8>] .nouveau_drm_ioctl+0x78/0x140 [nouveau]
    [<00000000263274a7>] .__se_sys_ioctl+0xfc/0x160
    [<0000000088c39f3d>] .system_call_exception+0x178/0x2a0
    [<000000000cfdf34f>] system_call_common+0xec/0x250

If I decode this stacktrace using decode_stacktrace.sh so that the line
numbers can be seen, I get the following:

.nouveau_fence_new+0x4c/0x120 [nouveau]
linux-5.15-rc3/include/linux/slab.h:591
linux-5.15-rc3/include/linux/slab.h:721
linux-5.15-rc3/drivers/gpu/drm/nouveau/nouveau_fence.c:424

.nouveau_bo_move+0x4f0/0x870 [nouveau]
linux-5.15-rc3/drivers/gpu/drm/nouveau/nouveau_bo.c:821
linux-5.15-rc3/drivers/gpu/drm/nouveau/nouveau_bo.c:1032

.ttm_bo_handle_move_mem+0xb4/0x1e0 [ttm]
linux-5.15-rc3/drivers/gpu/drm/ttm/ttm_bo.c:197

.ttm_bo_validate+0x144/0x230 [ttm]
linux-5.15-rc3/drivers/gpu/drm/ttm/ttm_bo.c:904
linux-5.15-rc3/drivers/gpu/drm/ttm/ttm_bo.c:981

.nouveau_bo_validate+0x70/0xc0 [nouveau]
linux-5.15-rc3/drivers/gpu/drm/nouveau/nouveau_bo.c:647

.nouveau_gem_ioctl_pushbuf+0x6e0/0x1a90 [nouveau]
linux-5.15-rc3/drivers/gpu/drm/nouveau/nouveau_gem.c:548
linux-5.15-rc3/drivers/gpu/drm/nouveau/nouveau_gem.c:605
linux-5.15-rc3/drivers/gpu/drm/nouveau/nouveau_gem.c:799

.drm_ioctl_kernel+0x104/0x180 [drm]
linux-5.15-rc3/drivers/gpu/drm/drm_ioctl.c:795

.drm_ioctl+0x244/0x490 [drm]
linux-5.15-rc3/include/linux/thread_info.h:185
linux-5.15-rc3/include/linux/thread_info.h:218
linux-5.15-rc3/include/linux/uaccess.h:199
linux-5.15-rc3/drivers/gpu/drm/drm_ioctl.c:899

.nouveau_drm_ioctl+0x78/0x140 [nouveau]
linux-5.15-rc3/drivers/gpu/drm/nouveau/nouveau_drm.c:1163

.__se_sys_ioctl+0xfc/0x160
linux-5.15-rc3/fs/ioctl.c:51
linux-5.15-rc3/fs/ioctl.c:874
linux-5.15-rc3/fs/ioctl.c:860

.system_call_exception+0x178/0x2a0
.system_call_exception
linux-5.15-rc3/arch/powerpc/kernel/interrupt.c:233

system_call_common+0xec/0x250
linux-5.15-rc3/arch/powerpc/kernel/interrupt_64.S:314

Here are all enabled DRM and NOUVEAU configs in my kernel:

CONFIG_DRM=m
CONFIG_DRM_KMS_HELPER=m
CONFIG_DRM_FBDEV_EMULATION=y
CONFIG_DRM_FBDEV_OVERALLOC=100
CONFIG_DRM_TTM=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_NOUVEAU=m
CONFIG_NOUVEAU_DEBUG=5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3
CONFIG_DRM_NOUVEAU_BACKLIGHT=y
CONFIG_DRM_PANEL=y
CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=m

And lspci output:

0000:f0:10.0 VGA compatible controller: NVIDIA Corporation NV34 [GeForce FX 5200 Ultra] (rev a1)

I have been running 5.12 on my machine without these reports. So it
might be something that showed up in 5.13 or 5.14 as well.

I do not know if this is a good channel for reporting this, so please
let me know if I should report it somewhere else. Also let me know if
you need any additional information from me.

John Ogness

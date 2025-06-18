Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B0AADF231
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 18:11:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 974E810E8D8;
	Wed, 18 Jun 2025 16:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="M/AfatNx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 482 seconds by postgrey-1.36 at gabe;
 Wed, 18 Jun 2025 16:11:38 UTC
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com
 [95.215.58.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65FDA10E113
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 16:11:32 +0000 (UTC)
Message-ID: <6d22bce3-4533-4cfa-96ba-64352b715741@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1750262614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=N+As7v86FfW5dyH0yTHR/0jy/hl5exca0Y0pIraN7Ds=;
 b=M/AfatNxtuJweITMRdOfooVNBh2U2kJV41MtXTqOoQWc7MyY8lkldZ6vUQ633BaRdJ1LB3
 Pwhpt0UKzDHJIynRUDSCatjNhzT+tO1CjYUdwzyJjjD1I7Ag9TIIFFs4uykcB/kod+uRK8
 ipWfX9amimmUnQDa0Q+jULG7MNr3B4E=
Date: Thu, 19 Jun 2025 00:03:11 +0800
MIME-Version: 1.0
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
Subject: [report] DMA-API: platform vgem: mapping sg segment longer than
 device claims to support [len=1048576] [max=65536]
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi all,

Running the dmabuf-heap test [*] on mainline kernel triggers the
following splat:

 ------------[ cut here ]------------
 DMA-API: platform vgem: mapping sg segment longer than device claims to
support [len=1048576] [max=65536]
 WARNING: CPU: 7 PID: 1126 at kernel/dma/debug.c:1174
debug_dma_map_sg+0x348/0x3e4
 Modules linked in: vgem drm_shmem_helper drm_kms_helper rfkill drm fuse
backlight sha3_ce sha512_ce ipv6
 CPU: 7 UID: 0 PID: 1126 Comm: dmabuf-heap Kdump: loaded Not tainted
6.16.0-rc2-00024-g9afe652958c3-dirty PREEMPT
 Hardware name: QEMU QEMU Virtual Machine, BIOS
edk2-stable202408-prebuilt.qemu.org 08/13/2024
 pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
 pc : debug_dma_map_sg+0x348/0x3e4
 lr : debug_dma_map_sg+0x348/0x3e4
 sp : ffff800084313a50
 x29: ffff800084313a50 x28: ffff0000c0a62480 x27: 0000000000000001
 x26: ffffffffffffffff x25: 0000000000000000 x24: ffff0000c0985f20
 x23: ffff8000815ab058 x22: 0000000000000001 x21: 0000000000000001
 x20: 0000000000000000 x19: ffff0000c2797010 x18: 0000000000000020
 x17: 0000000000000000 x16: 0000000000000000 x15: 00000000ffffffff
 x14: ffff8000815c6390 x13: 00000000000005bb x12: 00000000000001e9
 x11: fffffffffffe8360 x10: ffff80008161e390 x9 : 00000000fffff000
 x8 : ffff8000815c6390 x7 : ffff80008161e390 x6 : 0000000000000000
 x5 : ffff0001fee21308 x4 : 0000000000000001 x3 : 0000000000000000
 x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000c5ea4600
 Call trace:
  debug_dma_map_sg+0x348/0x3e4 (P)
  __dma_map_sg_attrs+0xbc/0x118
  dma_map_sgtable+0x28/0x44
  system_heap_map_dma_buf+0x2c/0x64
  dma_buf_map_attachment+0x60/0x184
  dma_buf_map_attachment_unlocked+0x3c/0x7c
  drm_gem_prime_import_dev.part.0+0x58/0x130 [drm]
  drm_gem_prime_import+0x48/0xc4 [drm]
  drm_gem_prime_fd_to_handle+0x180/0x220 [drm]
  drm_prime_fd_to_handle_ioctl+0x38/0x44 [drm]
  drm_ioctl_kernel+0xb8/0x12c [drm]
  drm_ioctl+0x204/0x4ec [drm]
  __arm64_sys_ioctl+0xac/0x104
  invoke_syscall+0x48/0x110
  el0_svc_common.constprop.0+0x40/0xe0
  do_el0_svc+0x1c/0x28
  el0_svc+0x34/0x108
  el0t_64_sync_handler+0xc8/0xcc
  el0t_64_sync+0x198/0x19c
 ---[ end trace 0000000000000000 ]---

The kernel is built with arm64's virtconfig and

+CONFIG_DMABUF_HEAPS=y
+CONFIG_DMABUF_HEAPS_SYSTEM=y
+CONFIG_DRM_VGEM=m
+CONFIG_DMA_API_DEBUG=y

[*] linux/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c

Thanks,
Zenghui

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B63C9B1039
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 22:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CC2110E103;
	Fri, 25 Oct 2024 20:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="MNInL612";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [95.215.58.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4119A10EB7F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 20:44:20 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1729889058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ztrVlzbJYDXKngabmXQa19bNYJjSoNew/4bl4Bb5+R4=;
 b=MNInL612oKc4OjrZvlDlt47LPzsAp9VZMufaTdMf4GUv0eEAjhte5Az3BebVpBDigmqlvt
 Q0se7Ax16Y0qb4YCPXoMxmsdquYWGtjtV8U5keaBcg70ZoE5S8ZqGjGj60Y34BPOoHaex9
 snZEoSHthP+31dr9WEsYgEmLlOhsBeM=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v2 0/2] drm/etnaviv: Fix GPUVA range collision when CPU page
 size is not equal to GPU page size
Date: Sat, 26 Oct 2024 04:43:53 +0800
Message-Id: <20241025204355.595805-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Etnaviv assumes that GPU page size is 4KiB, however, when using
softpin capable GPUs on a different CPU page size configuration.
The userspace allocated GPUVA ranges collision, unable to be
inserted to the specified address hole exactly.


For example, when running glmark2-drm:

[kernel space debug log]

 etnaviv 0000:03:00.0: Insert bo failed, va: 0xfd38b000, size: 0x4000
 etnaviv 0000:03:00.0: Insert bo failed, va: 0xfd38a000, size: 0x4000

[user space debug log]

bo->va = 0xfd38c000, bo->size=0x100000
bo->va = 0xfd38b000, bo->size=0x1000  <-- Insert IOVA fails here.
bo->va = 0xfd38a000, bo->size=0x1000
bo->va = 0xfd389000, bo->size=0x1000


The root cause is that kernel side BO takes up bigger address space
than userspace assumes.

To solve this problem, we first track the GPU visible size of GEM buffer
object, then map and unmap the GEM BOs exactly with respect to its GPUVA
size. Ensure that GPU VA is fully mapped/unmapped, not more and not less.

v2:
- Aligned to the GPU page size (Lucas)

v1:
- No GPUVA range wasting (Lucas)
Link: https://lore.kernel.org/dri-devel/20241004194207.1013744-1-sui.jingfeng@linux.dev/

v0:
Link: https://lore.kernel.org/dri-devel/20240930221706.399139-1-sui.jingfeng@linux.dev/

Sui Jingfeng (2):
  drm/etnaviv: Record GPU visible size of GEM BO separately
  drm/etnaviv: Map and unmap GPUVA range with respect to the GPUVA size

 drivers/gpu/drm/etnaviv/etnaviv_gem.c | 11 ++++----
 drivers/gpu/drm/etnaviv/etnaviv_gem.h |  5 ++++
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 36 +++++++++------------------
 3 files changed, 22 insertions(+), 30 deletions(-)

-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2919D9CDE47
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 13:33:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE6E10E3D0;
	Fri, 15 Nov 2024 12:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="oPtQRaP1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com
 [91.218.175.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4FE510E858
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 12:33:39 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1731674018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=aWRaGv2mUFRTnGJy+AZNP75OOPCHZDmd98dp1bDXSU4=;
 b=oPtQRaP15bI36dIMRzYi74JF9vKHs8mHaUNEsObPSIBjF2/Wn/rEXh79r5+tr0orrqwgvz
 lrmB8N0KDRk/fsrkIXCYBbAF0NAVWHGSLoX+KxxVJ4eo+Jn4ABh/Ehef4d/CtCg4Q8Lj8K
 +QUvuPytQ6pDY5b028CgR2ltcqG5z1Y=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: [PATCH v3 0/3] drm/etnaviv: Trivial mmu map and ummap cleanups
Date: Fri, 15 Nov 2024 20:32:43 +0800
Message-Id: <20241115123246.111346-1-sui.jingfeng@linux.dev>
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

The 'sg->offset' denotes the offset into a page in bytes, but under drm
subsystem, there has NO drivers that etnaviv can contact that actually
touch the 'offset' data member of SG anymore. This means that all DMA
addresses that sg_dma_address() gives us will be PAGE_SIZE aligned, in
other words, sg->offset will always equal to 0.

But if 'sg->offset != 0' really could happens, then the current implement
might be not correct. Previous commits[1] fix the 'sg->offset == 0' cases
effectively, below is a simple illustration.

       One CPU page       Another one CPU page
  +----+----+----+----+   +----+----+----+----+
  ||||||              |   ||||||              |
  +----+----+----+----+   +----+----+----+----+
  ^    ^                  ^    ^
  |    |                  |    |
  |    | .----------------'    |
  |    | |    .----------------'
  |    | |    |
  +----+ +----+ +----+
  |||||| |||||| |    |  GPU pages, each one is SZ_4K
  +----+ +----+ +----+
            Correct implementation.

--------------------------------------------------------------

       One CPU page       Another one CPU page
  +----+----+----+----+   +----+----+----+----+
  |///////////////////|   ||||||              |
  +----+----+----+----+   +----+----+----+----+
  ^                   ^   ^    ^
  |                   |   |    |
  |      .------------|---'    |
  |      |    .-------|--------'
  |      |    |       |
  |      +----+       |
  |      ||||||       |
  |      +----+       |
  |       IOVA        |  GPUVA range collision if use 'sg_dma_len(sg)'
  +----+ +----+-------+  directly to map. Because 'sg_dma_len(sg)' is
  |////|/|////////////|  frequently larger than SZ_4K.
  +----+ +----+-------+
            Wrong implementation.

If we map the address range with respect to the size of the backing memory,
it will occupy GPUVA ranges that doesn't belong to. Which results in GPUVA
range collision for different buffers.

Patch 0001 of this series give a fix, patch 0002 and 0003
do trivial cleanup which eliminates unnecessary overheads.

v2 -> v3
	* Reword and improve commit message
v1 -> v2
	* Reword and fix typos and mistakes

v1 Link: https://patchwork.freedesktop.org/series/140589/

Sui Jingfeng (3):
  drm/etnaviv: Drop the offset in page manipulation
  drm/etnaviv: Fix the debug log  of the etnaviv_iommu_map()
  drm/etnaviv: Improve VA, PA, SIZE alignment checking

 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 26 +++++++++++---------------
 1 file changed, 11 insertions(+), 15 deletions(-)

-- 
2.34.1


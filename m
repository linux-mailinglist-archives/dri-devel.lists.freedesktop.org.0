Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDDD6CF4C2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 22:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD7B10EC6A;
	Wed, 29 Mar 2023 20:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
 by gabe.freedesktop.org (Postfix) with ESMTP id 202E510EC6A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 20:51:45 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:36106.2084148567
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 0E05D1002AA;
 Thu, 30 Mar 2023 04:51:41 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 f17e6a1ddc374f8faad910570955c89e for l.stach@pengutronix.de; 
 Thu, 30 Mar 2023 04:51:42 CST
X-Transaction-ID: f17e6a1ddc374f8faad910570955c89e
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Li Yi <liyi@loongson.cn>
Subject: [PATCH v3 0/6] drm/etnaviv: add pci device driver support
Date: Thu, 30 Mar 2023 04:51:23 +0800
Message-Id: <20230329205129.1513734-1-15330273260@189.cn>
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

  There is a Vivante GC1000(v5037) in LS2K1000 and LS7A1000, the gpu is a
  PCI device and it has 2D and 3D core in the same gpu device. Therefore,
  this patch trying to add PCI device driver support on the great works
  already done by etnaviv folks.

  LS7A1000 is a bridge chip for LS3A5000(4 core 2.5Ghz loongarch cpu) and
  LS3A4000(4 core 1.8gHz Mips64r5 cpu), While LS2K1000 is just a slow SoC
  (2 core 1.0Ghz mips64r2). Loongson CPU support cached coherent caching
  mode, both the GPU and DC device snoop CPU cache by default firmware
  configuration.

Sui Jingfeng (6):
  drm/etnaviv: add a dedicate function to register irq handler for the
    gpu
  drm/etnaviv: add a dedicate function to get clock
  drm/etnaviv: add dedicate functions to create and destroy platform
    device
  drm/etnaviv: add helpers for private data construction and destruction
  drm/etnaviv: expand driver support for the pci devices
  drm/etnaviv: allow usperspace create cached coherent bo

 drivers/gpu/drm/etnaviv/Makefile            |   1 +
 drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 183 +++++++++++++------
 drivers/gpu/drm/etnaviv/etnaviv_drv.h       |   7 +
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       |  22 ++-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |   9 +-
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c       | 185 ++++++++++++++------
 drivers/gpu/drm/etnaviv/etnaviv_gpu.h       |  13 ++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c   |  88 ++++++++++
 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h   |  10 ++
 include/uapi/drm/etnaviv_drm.h              |  11 +-
 10 files changed, 415 insertions(+), 114 deletions(-)
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
 create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h

-- 
2.25.1


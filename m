Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E50A94BB889
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 12:44:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 335E989C98;
	Fri, 18 Feb 2022 11:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6BAD10ED77
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 11:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gFf5jfKrkPZO7pBJTx+x51tYvfxtkyD2Tt7FbOYTxSM=; b=ne3pKNvph23SdiOId6gZjhosGZ
 0/Y330PGQTWsNgZph8JRPvujHW8Q7yKi9RQEgI8sxuwa2hTYF1G3+u4oQbOVU3E/PpQedbAEsecpY
 GB/eNaRWvsSnwp7xFs7UD57eeoSb7bgvY5aVZXPlhLXS3vFFiscH0vkrzkRecru/9bTh+zaiKsKRR
 9G0bujjWMv3oiBpmAlrCLQlvdZ9rr4G6A1/9444UmUXEqkVY/r9YMST3MN5eVMm/2iPyHlAZLbxdJ
 rmvXg8Rn5+I8rTguH5iOrNTLqeNT5TgHldS7x9iJj/X/MNKmlX+irsCyJS4Xuo/QAmF7mPTf02za3
 O4j4fI0w==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1nL1fp-0006eP-OW; Fri, 18 Feb 2022 13:43:41 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robh+dt@kernel.org, robin.murphy@arm.com
Subject: [PATCH v3 0/9] Host1x context isolation support
Date: Fri, 18 Feb 2022 13:39:43 +0200
Message-Id: <20220218113952.3077606-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

***
New in v3:

Added device tree bindings for new property.
Rebased.
***

***
New in v2:

Added support for Tegra194
Use standard iommu-map property instead of custom mechanism
***

This series adds support for Host1x 'context isolation'. Since
when programming engines through Host1x, userspace can program in
any addresses it wants, we need some way to isolate the engines'
memory spaces. Traditionally this has either been done imperfectly
with a single shared IOMMU domain, or by copying and verifying the
programming command stream at submit time (Host1x firewall).

Since Tegra186 there is a privileged (only usable by kernel)
Host1x opcode that allows setting the stream ID sent by the engine
to the SMMU. So, by allocating a number of context banks and stream
IDs for this purpose, and using this opcode at the beginning of
each job, we can implement isolation. Due to the limited number of
context banks only each process gets its own context, and not
each channel.

This feature also allows sharing engines among multiple VMs when
used with Host1x's hardware virtualization support - up to 8 VMs
can be configured with a subset of allowed stream IDs, enforced
at hardware level.

To implement this, this series adds a new host1x context bus, which
will contain the 'struct device's corresponding to each context
bank / stream ID, changes to device tree and SMMU code to allow
registering the devices and using the bus, as well as the Host1x
stream ID programming code and support in TegraDRM.

Thanks,
Mikko

Mikko Perttunen (9):
  dt-bindings: host1x: Add memory-contexts property
  gpu: host1x: Add context bus
  gpu: host1x: Add context device management code
  gpu: host1x: Program context stream ID on submission
  iommu/arm-smmu: Attach to host1x context device bus
  arm64: tegra: Add Host1x context stream IDs on Tegra186+
  drm/tegra: falcon: Set DMACTX field on DMA transactions
  drm/tegra: vic: Implement get_streamid_offset
  drm/tegra: Support context isolation

 .../display/tegra/nvidia,tegra20-host1x.yaml  |  10 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  12 ++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  12 ++
 drivers/gpu/Makefile                          |   3 +-
 drivers/gpu/drm/tegra/drm.h                   |   2 +
 drivers/gpu/drm/tegra/falcon.c                |   8 +
 drivers/gpu/drm/tegra/falcon.h                |   1 +
 drivers/gpu/drm/tegra/submit.c                |  13 ++
 drivers/gpu/drm/tegra/uapi.c                  |  36 +++-
 drivers/gpu/drm/tegra/vic.c                   |  38 ++++
 drivers/gpu/host1x/Kconfig                    |   5 +
 drivers/gpu/host1x/Makefile                   |   2 +
 drivers/gpu/host1x/context.c                  | 174 ++++++++++++++++++
 drivers/gpu/host1x/context.h                  |  27 +++
 drivers/gpu/host1x/context_bus.c              |  31 ++++
 drivers/gpu/host1x/dev.c                      |  12 +-
 drivers/gpu/host1x/dev.h                      |   2 +
 drivers/gpu/host1x/hw/channel_hw.c            |  52 +++++-
 drivers/gpu/host1x/hw/host1x06_hardware.h     |  10 +
 drivers/gpu/host1x/hw/host1x07_hardware.h     |  10 +
 drivers/iommu/arm/arm-smmu/arm-smmu.c         |  13 ++
 include/linux/host1x.h                        |  21 +++
 include/linux/host1x_context_bus.h            |  15 ++
 23 files changed, 500 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/host1x/context.c
 create mode 100644 drivers/gpu/host1x/context.h
 create mode 100644 drivers/gpu/host1x/context_bus.c
 create mode 100644 include/linux/host1x_context_bus.h

-- 
2.35.0


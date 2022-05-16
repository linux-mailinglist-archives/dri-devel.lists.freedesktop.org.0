Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A919352801E
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 10:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605E410F91B;
	Mon, 16 May 2022 08:53:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F2E10E25A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 08:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qKpPhT1htxysCkfhUBMj0egXSA7Qs36rOou4SsdTvzc=; b=ucBrZJUJvlRXO4xI6OWeHwflSr
 mydycarxlKbIlFjzY7g54S9/Fjx69PYzx7dAFmDfumzHjRMDHV7sy23ARjYz48sGywEs3AWq/R0fr
 Xz4iAfx3VQ4ySf8X11UqaN0IBXSoym6lsUs70OzZmMZoUtHnHYG7pCIRBkD1JtR6Pu97TLnpxGKk2
 cSVo1F3AXoJHJofM4zOZRSZJFceZ8nbfj/FdhXo97N4A+836KtyhWx7wfKBUB/8A372Py2fpy8vy2
 fmlKWYTo8gOYECI63IW28yCIO7st++BqZO3Jg5iIMv9LZZnUVfadwDHQOETViZu7yqFg6A59uwHVA
 qkHD5Glw==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <cyndis@kapsi.fi>)
 id 1nqWTe-0005fd-Ba; Mon, 16 May 2022 11:53:18 +0300
From: cyndis@kapsi.fi
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, robh+dt@kernel.org,
 krzysztof.kozlowski@canonical.com
Subject: [PATCH v5 0/9] Host1x context isolation support
Date: Mon, 16 May 2022 11:52:49 +0300
Message-Id: <20220516085258.1227691-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
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

From: Mikko Perttunen <mperttunen@nvidia.com>

***
New in v5:

Rebased
Renamed host1x_context to host1x_memory_context
Small change in DRM side client driver ops to reduce churn with some
  upcoming changes
Add NVDEC support

***

***
New in v4:

Addressed review comments. See individual patches.
***

***
New in v3:

Added device tree bindings for new property.
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

-------------
Merging notes
-------------

The changes to DT bindings should be applied on top of Thierry's patch
'dt-bindings: display: tegra: Convert to json-schema'.

Thanks,
Mikko

Mikko Perttunen (9):
  dt-bindings: host1x: Add iommu-map property
  gpu: host1x: Add context bus
  gpu: host1x: Add context device management code
  gpu: host1x: Program context stream ID on submission
  iommu/arm-smmu: Attach to host1x context device bus
  arm64: tegra: Add Host1x context stream IDs on Tegra186+
  drm/tegra: falcon: Set DMACTX field on DMA transactions
  drm/tegra: Support context isolation
  drm/tegra: Implement stream ID related callbacks on engines

 .../display/tegra/nvidia,tegra20-host1x.yaml  |   5 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi      |  11 ++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  11 ++
 drivers/gpu/Makefile                          |   3 +-
 drivers/gpu/drm/tegra/drm.h                   |  11 ++
 drivers/gpu/drm/tegra/falcon.c                |   8 +
 drivers/gpu/drm/tegra/falcon.h                |   1 +
 drivers/gpu/drm/tegra/nvdec.c                 |   9 +
 drivers/gpu/drm/tegra/submit.c                |  48 +++++-
 drivers/gpu/drm/tegra/uapi.c                  |  43 ++++-
 drivers/gpu/drm/tegra/vic.c                   |  67 +++++++-
 drivers/gpu/host1x/Kconfig                    |   5 +
 drivers/gpu/host1x/Makefile                   |   2 +
 drivers/gpu/host1x/context.c                  | 160 ++++++++++++++++++
 drivers/gpu/host1x/context.h                  |  27 +++
 drivers/gpu/host1x/context_bus.c              |  31 ++++
 drivers/gpu/host1x/dev.c                      |  12 +-
 drivers/gpu/host1x/dev.h                      |   2 +
 drivers/gpu/host1x/hw/channel_hw.c            |  52 +++++-
 drivers/gpu/host1x/hw/host1x06_hardware.h     |  10 ++
 drivers/gpu/host1x/hw/host1x07_hardware.h     |  10 ++
 drivers/iommu/arm/arm-smmu/arm-smmu.c         |  13 ++
 include/linux/host1x.h                        |  26 +++
 include/linux/host1x_context_bus.h            |  15 ++
 24 files changed, 564 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/host1x/context.c
 create mode 100644 drivers/gpu/host1x/context.h
 create mode 100644 drivers/gpu/host1x/context_bus.c
 create mode 100644 include/linux/host1x_context_bus.h

-- 
2.36.1


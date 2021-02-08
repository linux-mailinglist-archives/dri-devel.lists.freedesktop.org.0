Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A523139AE
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 17:41:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AA36E939;
	Mon,  8 Feb 2021 16:41:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412F16E951
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 16:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
 :Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zsMyB8iB5UFqB7I23yLfnPURCPkNxas5AAE7y5zKVNk=; b=0KBKndFzSldu2iADE2qOcDWoAu
 fI//NkZoWtROK5JPXUNq1Hrz73Ua6/4jCPrvxg5ZN/DgAfcxuEY5bSjcmscNbY3J76I3vYQaKnBi4
 vYvCv3mMoQeIqJClK6IYUmCRbtxSdNpVz8LBIsrNeN0TBi/oqZ79zQpzRV2549g2zC2RmNK5cXBvb
 AG3wqRxCgvCHq26ugQI8HxKKF4PV48dJwEiyx7fWF6vr6rngXmlt/PI1jNztMDJsj0v5oasRwFmY1
 PPModuGvc/3gxr7RPlJ/IyRk/NZY8+4AR5dzrTV96MsiNjCMgn64YCk1Ec57UaOXyEHcxKOwNiXw2
 XoCsD83w==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=toshino.localdomain)
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <mperttunen@nvidia.com>)
 id 1l99as-0000Cr-G2; Mon, 08 Feb 2021 18:40:58 +0200
From: Mikko Perttunen <mperttunen@nvidia.com>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, joro@8bytes.org,
 will@kernel.org, robh+dt@kernel.org, frowand.list@gmail.com,
 robin.murphy@arm.com
Subject: [RFC PATCH 0/8] Host1x context isolation support
Date: Mon,  8 Feb 2021 18:38:40 +0200
Message-Id: <20210208163848.2504291-1-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 84.249.134.236
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

this series adds support for Host1x 'context isolation'. Since
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

The series is based on v5 of the "Host1x/TegraDRM UAPI" series,
which still hasn't quite settled. Also, I haven't updated the
device tree bindings (or converted them to YAML) yet, so this
is RFC for now.

Thanks!

Mikko

Mikko Perttunen (8):
  of/device: Allow specifying a custom iommu_spec to of_dma_configure
  gpu: host1x: Add context bus
  gpu: host1x: Add context device management code
  gpu: host1x: Program context stream ID on submission
  iommu/arm-smmu: Attach to host1x context device bus
  arm64: tegra: Add Host1x context stream IDs on Tegra186+
  drm/tegra: Support context isolation
  drm/tegra: vic: Implement get_streamid_offset

 arch/arm64/boot/dts/nvidia/tegra186.dtsi  |   9 ++
 drivers/gpu/Makefile                      |   3 +-
 drivers/gpu/drm/tegra/drm.h               |   1 +
 drivers/gpu/drm/tegra/uapi.h              |   1 +
 drivers/gpu/drm/tegra/uapi/submit.c       |  13 ++
 drivers/gpu/drm/tegra/uapi/uapi.c         |  34 ++++-
 drivers/gpu/drm/tegra/vic.c               |  38 +++++
 drivers/gpu/host1x/Kconfig                |   5 +
 drivers/gpu/host1x/Makefile               |   2 +
 drivers/gpu/host1x/context.c              | 161 ++++++++++++++++++++++
 drivers/gpu/host1x/context.h              |  27 ++++
 drivers/gpu/host1x/context_bus.c          |  31 +++++
 drivers/gpu/host1x/dev.c                  |  12 +-
 drivers/gpu/host1x/dev.h                  |   2 +
 drivers/gpu/host1x/hw/channel_hw.c        |  52 ++++++-
 drivers/gpu/host1x/hw/host1x06_hardware.h |  10 ++
 drivers/gpu/host1x/hw/host1x07_hardware.h |  10 ++
 drivers/iommu/arm/arm-smmu/arm-smmu.c     |  13 ++
 drivers/iommu/of_iommu.c                  |  12 +-
 drivers/of/device.c                       |   9 +-
 include/linux/host1x.h                    |  21 +++
 include/linux/host1x_context_bus.h        |  15 ++
 include/linux/of_device.h                 |  34 ++++-
 include/linux/of_iommu.h                  |   6 +-
 24 files changed, 495 insertions(+), 26 deletions(-)
 create mode 100644 drivers/gpu/host1x/context.c
 create mode 100644 drivers/gpu/host1x/context.h
 create mode 100644 drivers/gpu/host1x/context_bus.c
 create mode 100644 include/linux/host1x_context_bus.h

-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AADC8447E12
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 11:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC3C6EB0D;
	Mon,  8 Nov 2021 10:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93326EB17
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 10:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i/cmFLJWXjRGackmQbyW+VCsyR/4I0WIJ6EqrdSA6JY=; b=TgVDqLVO+s5RobZKj0e0tc5fNy
 sQ7s4SFC8WtG6elM+NAEv4mjxfpoy7JVFvonGPrL7zQr/ez3Zy+k/cZUaqJiRecRCcNi2P7VbkE8F
 ka3tcQvpeAovYzNEd+HkVHsCfpaMi0A8MmEWp93+1bfLdOoI1b6w4GoA214JujO2mNRUBzstQdeGa
 bLpBKQN1PyJKDS+X8rDt5TmKrMO9LNSjG+242s85JwTjTX7Vrv0uE+3eFdT/Lgf1H4RdXtzWOLNPt
 n83LDUWPlVc+rTMI2qPSbTvt1fc9jEFAk7Sd+yh6crFCPnwJUgWt/1tb+cKxoGcaWvVttLk2IRflv
 xP/M3HYw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1mk21D-0008PS-Od; Mon, 08 Nov 2021 12:36:51 +0200
Subject: Re: [PATCH v2 0/8] Host1x context isolation support
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 robin.murphy@arm.com
References: <20210916143302.2024933-1-mperttunen@nvidia.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <10de82cf-27a5-8890-93a5-0e58c74e5bcc@kapsi.fi>
Date: Mon, 8 Nov 2021 12:36:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210916143302.2024933-1-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
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
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/16/21 5:32 PM, Mikko Perttunen wrote:
> Hi all,
> 
> ***
> New in v2:
> 
> Added support for Tegra194
> Use standard iommu-map property instead of custom mechanism
> ***
> 
> this series adds support for Host1x 'context isolation'. Since
> when programming engines through Host1x, userspace can program in
> any addresses it wants, we need some way to isolate the engines'
> memory spaces. Traditionally this has either been done imperfectly
> with a single shared IOMMU domain, or by copying and verifying the
> programming command stream at submit time (Host1x firewall).
> 
> Since Tegra186 there is a privileged (only usable by kernel)
> Host1x opcode that allows setting the stream ID sent by the engine
> to the SMMU. So, by allocating a number of context banks and stream
> IDs for this purpose, and using this opcode at the beginning of
> each job, we can implement isolation. Due to the limited number of
> context banks only each process gets its own context, and not
> each channel.
> 
> This feature also allows sharing engines among multiple VMs when
> used with Host1x's hardware virtualization support - up to 8 VMs
> can be configured with a subset of allowed stream IDs, enforced
> at hardware level.
> 
> To implement this, this series adds a new host1x context bus, which
> will contain the 'struct device's corresponding to each context
> bank / stream ID, changes to device tree and SMMU code to allow
> registering the devices and using the bus, as well as the Host1x
> stream ID programming code and support in TegraDRM.
> 
> Device tree bindings are not updated yet pending consensus that the
> proposed changes make sense.
> 
> Thanks,
> Mikko
> 
> Mikko Perttunen (8):
>    gpu: host1x: Add context bus
>    gpu: host1x: Add context device management code
>    gpu: host1x: Program context stream ID on submission
>    iommu/arm-smmu: Attach to host1x context device bus
>    arm64: tegra: Add Host1x context stream IDs on Tegra186+
>    drm/tegra: falcon: Set DMACTX field on DMA transactions
>    drm/tegra: vic: Implement get_streamid_offset
>    drm/tegra: Support context isolation
> 
>   arch/arm64/boot/dts/nvidia/tegra186.dtsi  |  12 ++
>   arch/arm64/boot/dts/nvidia/tegra194.dtsi  |  12 ++
>   drivers/gpu/Makefile                      |   3 +-
>   drivers/gpu/drm/tegra/drm.h               |   2 +
>   drivers/gpu/drm/tegra/falcon.c            |   8 +
>   drivers/gpu/drm/tegra/falcon.h            |   1 +
>   drivers/gpu/drm/tegra/submit.c            |  13 ++
>   drivers/gpu/drm/tegra/uapi.c              |  34 ++++-
>   drivers/gpu/drm/tegra/vic.c               |  38 +++++
>   drivers/gpu/host1x/Kconfig                |   5 +
>   drivers/gpu/host1x/Makefile               |   2 +
>   drivers/gpu/host1x/context.c              | 174 ++++++++++++++++++++++
>   drivers/gpu/host1x/context.h              |  27 ++++
>   drivers/gpu/host1x/context_bus.c          |  31 ++++
>   drivers/gpu/host1x/dev.c                  |  12 +-
>   drivers/gpu/host1x/dev.h                  |   2 +
>   drivers/gpu/host1x/hw/channel_hw.c        |  52 ++++++-
>   drivers/gpu/host1x/hw/host1x06_hardware.h |  10 ++
>   drivers/gpu/host1x/hw/host1x07_hardware.h |  10 ++
>   drivers/iommu/arm/arm-smmu/arm-smmu.c     |  13 ++
>   include/linux/host1x.h                    |  21 +++
>   include/linux/host1x_context_bus.h        |  15 ++
>   22 files changed, 488 insertions(+), 9 deletions(-)
>   create mode 100644 drivers/gpu/host1x/context.c
>   create mode 100644 drivers/gpu/host1x/context.h
>   create mode 100644 drivers/gpu/host1x/context_bus.c
>   create mode 100644 include/linux/host1x_context_bus.h
> 

IOMMU/DT folks, any thoughts about this approach? The patches that are 
of interest outside of Host1x/TegraDRM specifics are patches 1, 2, 4, and 5.

Thanks,
Mikko

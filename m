Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A15AB9079C9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F43110E234;
	Thu, 13 Jun 2024 17:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y+Bsy4LV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E95510E22C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 17:27:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A1BEF61C0A;
 Thu, 13 Jun 2024 17:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2747AC2BBFC;
 Thu, 13 Jun 2024 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718299637;
 bh=opDT7KR3b/7zSgo/k+eb6uhV3+Agy5mHhqWVAV0NPaE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Y+Bsy4LVeheYOVXZrOYJG5COt6xXLdymsCT0DX3EfwzBbiMh5HmUPu6UEHQQ/d9cb
 HWzh7yHQZBMwuOm6r0eYA7B/EpAwZkePtqoqInyKSHyoQzpGElhBZFQHBaGXK6UxXO
 auYJL3sL6o5d+cyPhTHz77sVqZjWl/LDbb7fPurAjAqOC07EdG5PrhjuTh47GUtDD8
 Gi1RhWgovtVdG39zJZX1X5KY3fGAjwb5ybaCQjNMHWSDswavq56ETkw2msQsItJI3K
 jaUiRIPeo8L1jONLDopd5pT0Gtg7CmvvDmQq6oSJIurYIUIb5JsWNn39LgDnneESAH
 6yfZypumrPUFQ==
Date: Thu, 13 Jun 2024 11:27:15 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>, iommu@lists.linux.dev, 
 David Airlie <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Conor Dooley <conor+dt@kernel.org>, 
 Oded Gabbay <ogabbay@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, 
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <mripard@kernel.org>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, 
 linux-media@vger.kernel.org, Joerg Roedel <joro@8bytes.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org, 
 Will Deacon <will@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
References: <20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net>
Message-Id: <171829929988.2050064.4076911589675234408.robh@kernel.org>
Subject: Re: [PATCH 0/9] New DRM accel driver for Rockchip's RKNN NPU
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


On Wed, 12 Jun 2024 15:52:53 +0200, Tomeu Vizoso wrote:
> This series adds a new driver for the NPU that Rockchip includes in its
> newer SoCs, developed by them on the NVDLA base.
> 
> In its current form, it supports the specific NPU in the RK3588 SoC.
> 
> The userspace driver is part of Mesa and an initial draft can be found at:
> 
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29698
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
> Tomeu Vizoso (9):
>       iommu/rockchip: Add compatible for rockchip,rk3588-iommu
>       iommu/rockchip: Attach multiple power domains
>       dt-bindings: mailbox: rockchip,rknn: Add bindings
>       arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588s
>       arm64: dts: rockchip: Enable the NPU on quartzpro64
>       accel/rocket: Add a new driver for Rockchip's NPU
>       accel/rocket: Add IOCTL for BO creation
>       accel/rocket: Add job submission IOCTL
>       accel/rocket: Add IOCTLs for synchronizing memory accesses
> 
>  .../devicetree/bindings/npu/rockchip,rknn.yaml     |  123 +
>  MAINTAINERS                                        |    8 +
>  .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |    8 +
>  arch/arm64/boot/dts/rockchip/rk3588s.dtsi          |   53 +
>  drivers/accel/Kconfig                              |    1 +
>  drivers/accel/Makefile                             |    1 +
>  drivers/accel/rocket/Kconfig                       |   13 +
>  drivers/accel/rocket/Makefile                      |   10 +
>  drivers/accel/rocket/rocket_core.c                 |  155 +
>  drivers/accel/rocket/rocket_core.h                 |   48 +
>  drivers/accel/rocket/rocket_device.c               |   39 +
>  drivers/accel/rocket/rocket_device.h               |   40 +
>  drivers/accel/rocket/rocket_drv.c                  |  243 ++
>  drivers/accel/rocket/rocket_drv.h                  |   16 +
>  drivers/accel/rocket/rocket_gem.c                  |  136 +
>  drivers/accel/rocket/rocket_gem.h                  |   33 +
>  drivers/accel/rocket/rocket_job.c                  |  708 ++++
>  drivers/accel/rocket/rocket_job.h                  |   49 +
>  drivers/accel/rocket/rocket_registers.h            | 4449 ++++++++++++++++++++
>  drivers/iommu/rockchip-iommu.c                     |   39 +
>  include/uapi/drm/rocket_accel.h                    |  116 +
>  21 files changed, 6288 insertions(+)
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240612-6-10-rocket-9316defc14c7
> 
> Best regards,
> --
> Tomeu Vizoso <tomeu@tomeuvizoso.net>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y rockchip/rk3588-quartzpro64.dtb' for 20240612-6-10-rocket-v1-0-060e48eea250@tomeuvizoso.net:

arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: compatible: 'oneOf' conditional failed, one must be fixed:
	['rockchip,rk3588-iommu'] is too short
	'rockchip,rk3588-iommu' is not one of ['rockchip,iommu', 'rockchip,rk3568-iommu']
	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: reg: [[0, 4255879168, 0, 256], [0, 4255883264, 0, 256], [0, 4255948800, 0, 256], [0, 4256014336, 0, 256]] is too long
	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: interrupts: [[0, 110, 4, 0], [0, 111, 4, 0], [0, 112, 4, 0]] is too long
	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: clocks: [[28, 287], [28, 276], [28, 278], [28, 288], [28, 277], [28, 279]] is too long
	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: clock-names:0: 'aclk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: clock-names:1: 'iface' was expected
	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: clock-names: ['aclk0', 'aclk1', 'aclk2', 'iface0', 'iface1', 'iface2'] is too long
	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: power-domains: [[30, 9], [30, 10], [30, 11]] is too long
	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#
arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: iommu@fdab9000: 'interrupt-names', 'power-domain-names' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/iommu/rockchip,iommu.yaml#






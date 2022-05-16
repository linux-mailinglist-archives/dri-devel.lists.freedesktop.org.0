Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAA1528176
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 12:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6366010EB18;
	Mon, 16 May 2022 10:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8DF10EB2A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 10:07:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA6026006F;
 Mon, 16 May 2022 10:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99A17C385AA;
 Mon, 16 May 2022 10:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652695648;
 bh=mJA6rH2uOwpy6kEmoE1DbK00kFgB/tAwaaqw91pYlkA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eE4yaugpdDHU0zxrfSNyKk/ili8tz80jdULz7A/ZOJ9UI0NGfn7Uwt5KhEo/K/oDy
 xg5dGH/ys6lWSfczp9YDF8FhYD5gUaluWSDAuem1uyzEHQ6Dn3smDXQlC7Jgu7Ex9+
 7cm3P3psGx34ta0T4ZlLQQzUncEVj7p8JmGOhwsM1yH668wjXxI4V/WvJUpeA/WceH
 VLYp26GHftdCVu7epf9xBTf/VMqtVkMwexcS0cGDqCCsKg/y514NowmtBdr2L5+5mG
 8lvqDLI4+bjaXObb1A2eR9fDtMATQrMAZAfxpQB6ELCSRpRpm0d/dPtq6bSUl8pErq
 nkhwFrw4D/TJw==
Date: Mon, 16 May 2022 11:07:21 +0100
From: Will Deacon <will@kernel.org>
To: cyndis@kapsi.fi
Subject: Re: [PATCH v5 5/9] iommu/arm-smmu: Attach to host1x context device bus
Message-ID: <20220516100721.GA1927@willie-the-truck>
References: <20220516085258.1227691-1-cyndis@kapsi.fi>
 <20220516085258.1227691-6-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516085258.1227691-6-cyndis@kapsi.fi>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 joro@8bytes.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 jonathanh@nvidia.com, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 16, 2022 at 11:52:54AM +0300, cyndis@kapsi.fi wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
> 
> Set itself as the IOMMU for the host1x context device bus, containing
> "dummy" devices used for Host1x context isolation.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 568cce590ccc..9ff54eaecf81 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -39,6 +39,7 @@
>  
>  #include <linux/amba/bus.h>
>  #include <linux/fsl/mc.h>
> +#include <linux/host1x_context_bus.h>
>  
>  #include "arm-smmu.h"
>  
> @@ -2053,8 +2054,20 @@ static int arm_smmu_bus_init(struct iommu_ops *ops)
>  			goto err_reset_pci_ops;
>  	}
>  #endif
> +#ifdef CONFIG_TEGRA_HOST1X_CONTEXT_BUS
> +	if (!iommu_present(&host1x_context_device_bus_type)) {
> +		err = bus_set_iommu(&host1x_context_device_bus_type, ops);
> +		if (err)
> +			goto err_reset_fsl_mc_ops;
> +	}
> +#endif
> +
>  	return 0;
>  
> +err_reset_fsl_mc_ops: __maybe_unused;
> +#ifdef CONFIG_FSL_MC_BUS
> +	bus_set_iommu(&fsl_mc_bus_type, NULL);
> +#endif

bus_set_iommu() is going away:

https://lore.kernel.org/r/cover.1650890638.git.robin.murphy@arm.com

Will
> 

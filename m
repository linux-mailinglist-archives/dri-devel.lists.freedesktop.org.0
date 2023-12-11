Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E312D80C4E5
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 10:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6933110E381;
	Mon, 11 Dec 2023 09:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8428A10E0F1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702287630; x=1733823630;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Te6jGlu43N/MKbemlwvIQR84EQ2K+qHreVL4UIX+pG4=;
 b=dnEUZDbwCexL2sRvbXKdn86DBai9xstUfqtdwlbQHnhf0rE+md1IVNrO
 ZYH/eaBTYx5FVzoVlyVJGhSjgFwWzSmPm908re3XeHwkgr5M5Erwp2TCx
 oGhKFIS5jYA+W8WbA0vUF9zhFIgYJ+sOP7Sem6EsfrxMT7YXrswppjVQ4
 KRhRQmnolzEs+ZX8fXr7JI++vc6HUwuUToEBh0FMJ5nKkuZHDFCONj4nx
 jjroVO2sRLHb/481nEgSl+GLjhWzhz1HlTFNJByMGCtPuzJtQsH7iXFMa
 Zxpj5YdZkkqyo3qkRhGJDLJuEc1maeEUsZvqrlUL19rju2+T5BsmaPI4/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1432150"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="1432150"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 01:40:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="801935989"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="801935989"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.128.23])
 ([10.249.128.23])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 01:40:28 -0800
Message-ID: <36095d90-d797-401f-a917-b9fb203f21a9@linux.intel.com>
Date: Mon, 11 Dec 2023 10:40:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/ivpu/37xx: Fix interrupt_clear_with_0 WA
 initialization
To: dri-devel@lists.freedesktop.org
References: <20231204122331.40560-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231204122331.40560-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Applied to drm-misc-fixes

On 04.12.2023 13:23, Jacek Lawrynowicz wrote:
> From: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> 
> Using PCI Device ID/Revision to initialize the interrupt_clear_with_0
> workaround is problematic - there are many pre-production
> steppings with different behavior, even with the same PCI ID/Revision
> 
> Instead of checking for PCI Device ID/Revision, check the VPU
> buttress interrupt status register behavior - if this register
> is not zero after writing 1s it means there register is RW
> instead of RW1C and we need to enable the interrupt_clear_with_0
> workaround.
> 
> Fixes: 7f34e01f77f8 ("accel/ivpu: Clear specific interrupt status bits on C0")
> Signed-off-by: Andrzej Kacprowski <Andrzej.Kacprowski@intel.com>
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>  drivers/accel/ivpu/ivpu_hw_37xx.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/accel/ivpu/ivpu_hw_37xx.c b/drivers/accel/ivpu/ivpu_hw_37xx.c
> index 4ccf1994b97a..d530384f8d60 100644
> --- a/drivers/accel/ivpu/ivpu_hw_37xx.c
> +++ b/drivers/accel/ivpu/ivpu_hw_37xx.c
> @@ -53,10 +53,12 @@
>  
>  #define ICB_0_1_IRQ_MASK ((((u64)ICB_1_IRQ_MASK) << 32) | ICB_0_IRQ_MASK)
>  
> -#define BUTTRESS_IRQ_MASK ((REG_FLD(VPU_37XX_BUTTRESS_INTERRUPT_STAT, FREQ_CHANGE)) | \
> -			   (REG_FLD(VPU_37XX_BUTTRESS_INTERRUPT_STAT, ATS_ERR)) | \
> +#define BUTTRESS_IRQ_MASK ((REG_FLD(VPU_37XX_BUTTRESS_INTERRUPT_STAT, ATS_ERR)) | \
>  			   (REG_FLD(VPU_37XX_BUTTRESS_INTERRUPT_STAT, UFI_ERR)))
>  
> +#define BUTTRESS_ALL_IRQ_MASK (BUTTRESS_IRQ_MASK | \
> +			       (REG_FLD(VPU_37XX_BUTTRESS_INTERRUPT_STAT, FREQ_CHANGE)))
> +
>  #define BUTTRESS_IRQ_ENABLE_MASK ((u32)~BUTTRESS_IRQ_MASK)
>  #define BUTTRESS_IRQ_DISABLE_MASK ((u32)-1)
>  
> @@ -74,8 +76,12 @@ static void ivpu_hw_wa_init(struct ivpu_device *vdev)
>  	vdev->wa.clear_runtime_mem = false;
>  	vdev->wa.d3hot_after_power_off = true;
>  
> -	if (ivpu_device_id(vdev) == PCI_DEVICE_ID_MTL && ivpu_revision(vdev) < 4)
> +	REGB_WR32(VPU_37XX_BUTTRESS_INTERRUPT_STAT, BUTTRESS_ALL_IRQ_MASK);
> +	if (REGB_RD32(VPU_37XX_BUTTRESS_INTERRUPT_STAT) == BUTTRESS_ALL_IRQ_MASK) {
> +		/* Writing 1s does not clear the interrupt status register */
>  		vdev->wa.interrupt_clear_with_0 = true;
> +		REGB_WR32(VPU_37XX_BUTTRESS_INTERRUPT_STAT, 0x0);
> +	}
>  
>  	IVPU_PRINT_WA(punit_disabled);
>  	IVPU_PRINT_WA(clear_runtime_mem);

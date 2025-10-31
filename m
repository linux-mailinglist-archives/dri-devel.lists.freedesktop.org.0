Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC64C252A0
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 14:05:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3D210EB4B;
	Fri, 31 Oct 2025 13:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OuWmANOx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20C510EB32;
 Fri, 31 Oct 2025 13:05:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A4787440E4;
 Fri, 31 Oct 2025 13:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5338C4CEE7;
 Fri, 31 Oct 2025 13:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761915927;
 bh=d2k8BDYCwAf8v+dGV9tcaTrmfQ4UjRPuay0/M32F87w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OuWmANOxQyavr2OndYJ4s3kbVDHfKfszLhmIgVZKhHzwjBDqzGTubQ2YBAqu1rGxT
 urxkoJBdqH1PYxSlKvzMPdcgEtBKR5biV0TAQIWLQKobGNrpYa/Dv1F14VthpK/dlJ
 eObnmE2o8jK0A6/AHnHwrLoI1CzA1Qo1NnO4e2Vu43c0wNGKDUK5wmEDalNoWlv94l
 mhcbnmHRPH44Us/d4K2hu6TErPnmo17QZLj2rzxcpcgPL4GTRlPSJOPq7kT9LO4GiP
 CnzKCaxWN71vt8Z6SZtqm8kkeV0N72WKRzfjCih97B2qpiYqvZTsgLeSIncB+GsXFA
 ZVa5oSOiGoo5w==
Message-ID: <a10c7757-567d-4312-b72d-159ab0c41ece@kernel.org>
Date: Fri, 31 Oct 2025 08:05:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] platform/x86/amd/pmc: Add support for Van Gogh SoC
To: Antheas Kapenekakis <lkml@antheas.dev>,
 Alex Deucher <alexander.deucher@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Perry Yuan <perry.yuan@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-2-lkml@antheas.dev>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251024152152.3981721-2-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
> The ROG Xbox Ally (non-X) SoC features a similar architecture to the
> Steam Deck. While the Steam Deck supports S3 (s2idle causes a crash),
> this support was dropped by the Xbox Ally which only S0ix suspend.
> 
> Since the handler is missing here, this causes the device to not suspend
> and the AMD GPU driver to crash while trying to resume afterwards due to
> a power hang.
> 
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>

Having seen that a few things were tried for the idle mask which don't 
work I think this patch makes sense as is.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>

> ---
>   drivers/platform/x86/amd/pmc/pmc.c | 3 +++
>   drivers/platform/x86/amd/pmc/pmc.h | 1 +
>   2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index bd318fd02ccf..cae3fcafd4d7 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -106,6 +106,7 @@ static void amd_pmc_get_ip_info(struct amd_pmc_dev *dev)
>   	switch (dev->cpu_id) {
>   	case AMD_CPU_ID_PCO:
>   	case AMD_CPU_ID_RN:
> +	case AMD_CPU_ID_VG:
>   	case AMD_CPU_ID_YC:
>   	case AMD_CPU_ID_CB:
>   		dev->num_ips = 12;
> @@ -517,6 +518,7 @@ static int amd_pmc_get_os_hint(struct amd_pmc_dev *dev)
>   	case AMD_CPU_ID_PCO:
>   		return MSG_OS_HINT_PCO;
>   	case AMD_CPU_ID_RN:
> +	case AMD_CPU_ID_VG:
>   	case AMD_CPU_ID_YC:
>   	case AMD_CPU_ID_CB:
>   	case AMD_CPU_ID_PS:
> @@ -717,6 +719,7 @@ static const struct pci_device_id pmc_pci_ids[] = {
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SP) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_SHP) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_VG) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M20H_ROOT) },
>   	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_1AH_M60H_ROOT) },
>   	{ }
> diff --git a/drivers/platform/x86/amd/pmc/pmc.h b/drivers/platform/x86/amd/pmc/pmc.h
> index 62f3e51020fd..fe3f53eb5955 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.h
> +++ b/drivers/platform/x86/amd/pmc/pmc.h
> @@ -156,6 +156,7 @@ void amd_mp2_stb_deinit(struct amd_pmc_dev *dev);
>   #define AMD_CPU_ID_RN			0x1630
>   #define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
>   #define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
> +#define AMD_CPU_ID_VG			0x1645
>   #define AMD_CPU_ID_YC			0x14B5
>   #define AMD_CPU_ID_CB			0x14D8
>   #define AMD_CPU_ID_PS			0x14E8


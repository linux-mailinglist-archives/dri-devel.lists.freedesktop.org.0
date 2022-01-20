Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8149B49528C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 17:43:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D9D10E7CA;
	Thu, 20 Jan 2022 16:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CEED10E7B5;
 Thu, 20 Jan 2022 16:42:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbeckett) with ESMTPSA id 244841F40E99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642696975;
 bh=jxo+ewiCEy4ReDaTEgQhUe2cug8eKAXFbRgskqYW+yg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kL0Hw2+1SR/pAL2PAB9/8ZYAG6P4krUffjERk/ZH7lCerADcZtzqPchOy4ZgmKdy9
 cYNC73TBfTyAdTFsYwnL+56VcpQRtuRrGavwrQ8FD9bfUMT4aJ0vJE/hfDKSpQukbt
 GnIsqcK1VvCBeTIAr8tx7J/kxm2qivNPhbDDT/R3kDNp0oY6NWbxaCDHmApuLT6Z3e
 uQGsqcY8ku2X/NKSXSxyWhrLWgy4lUHFTlDZ+Ux64Ux6wnDFlmBTUwdDlq0XmhzuU5
 Ae1HLSn6BDQFwgrFJsU/dGPOXWQKVW0H8rA5qiKGO8rME4Pf0ZI5+mG/9gIuJzLAr9
 5Z7AAPo7W01oA==
Message-ID: <f54309e3-3b82-5a64-0e5a-46981c4b63aa@collabora.com>
Date: Thu, 20 Jan 2022 16:42:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] drm/i915: Add needs_compact_pt flag
Content-Language: en-US
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220120162102.10652-1-ramalingam.c@intel.com>
From: Robert Beckett <bob.beckett@collabora.com>
In-Reply-To: <20220120162102.10652-1-ramalingam.c@intel.com>
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 20/01/2022 16:21, Ramalingam C wrote:
> Add a new platform flag, needs_compact_pt, to mark the requirement of
> compact pt layout support for the ppGTT when using 64K GTT pages.
> 
> With this flag has_64k_pages will only indicate requirement of 64K
> GTT page sizes or larger for device local memory access.
> 
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> cc: Robert Beckett <bob.beckett@collabora.com>
> ---
>   drivers/gpu/drm/i915/i915_drv.h          | 10 +++++++---
>   drivers/gpu/drm/i915/i915_pci.c          |  2 ++
>   drivers/gpu/drm/i915/intel_device_info.h |  1 +
>   3 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 890f1f6fbc49..23f4713005bb 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1512,12 +1512,16 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>   
>   /*
>    * Set this flag, when platform requires 64K GTT page sizes or larger for
> - * device local memory access. Also this flag implies that we require or
> - * at least support the compact PT layout for the ppGTT when using the 64K
> - * GTT pages.
> + * device local memory access.
>    */
>   #define HAS_64K_PAGES(dev_priv) (INTEL_INFO(dev_priv)->has_64k_pages)
>   
> +/* Set this flag when platform doesn't allow both 64k pages and 4k pages in
> + * the same PT. this flag means we need to support compact PT layout for the
> + * ppGTT when using the 64K GTT pages.
> + */
> +#define NEEDS_COMPACT_PT(dev_priv) (INTEL_INFO(dev_priv)->needs_compact_pt)
> +
>   #define HAS_IPC(dev_priv)		 (INTEL_INFO(dev_priv)->display.has_ipc)
>   
>   #define HAS_REGION(i915, i) (INTEL_INFO(i915)->memory_regions & (i))
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index 8261b6455747..3e7555ce6894 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -1028,6 +1028,7 @@ static const struct intel_device_info xehpsdv_info = {
>   	PLATFORM(INTEL_XEHPSDV),
>   	.display = { },
>   	.has_64k_pages = 1,
> +	.needs_compact_pt = 1,
>   	.platform_engine_mask =
>   		BIT(RCS0) | BIT(BCS0) |
>   		BIT(VECS0) | BIT(VECS1) | BIT(VECS2) | BIT(VECS3) |
> @@ -1046,6 +1047,7 @@ static const struct intel_device_info dg2_info = {
>   	.media.rel = 55,
>   	PLATFORM(INTEL_DG2),
>   	.has_64k_pages = 1,
> +	.needs_compact_pt = 1,
>   	.platform_engine_mask =
>   		BIT(RCS0) | BIT(BCS0) |
>   		BIT(VECS0) | BIT(VECS1) |
> diff --git a/drivers/gpu/drm/i915/intel_device_info.h b/drivers/gpu/drm/i915/intel_device_info.h
> index 3699b1c539ea..8ff676f49471 100644
> --- a/drivers/gpu/drm/i915/intel_device_info.h
> +++ b/drivers/gpu/drm/i915/intel_device_info.h
> @@ -130,6 +130,7 @@ enum intel_ppgtt_type {
>   	/* Keep has_* in alphabetical order */ \
>   	func(has_64bit_reloc); \
>   	func(has_64k_pages); \
> +	func(needs_compact_pt; \

missing `)`
instead of chucking untested patches on ml, I'll add a fixed version to 
the in review series and include it in v3 after testing

>   	func(gpu_reset_clobbers_display); \
>   	func(has_reset_engine); \
>   	func(has_global_mocs); \
> 

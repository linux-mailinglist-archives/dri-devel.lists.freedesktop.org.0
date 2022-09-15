Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB3D5B96CB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 10:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A890D10E15D;
	Thu, 15 Sep 2022 08:59:38 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D59410E15B;
 Thu, 15 Sep 2022 08:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663232373; x=1694768373;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=u29BZBVx9CyR3AnvmwBg//07kpiOiEGDo4JovFcekcs=;
 b=jJRByTXyfGAJUMfX/6Gd2syxvJ/OwLHIJ3CzBuqB7DwlycGkTjTLjy9/
 wkITotHcHx3P3UzpYqzi3v0O0Qo0QY0YqhYIAGePJfKXsTklgKdTJ2dVU
 xqgETGn9F9p+jTr43NmJpLTEOQeH7rX0ww8hfPfqBzaGEwjplZSZ273RI
 2UG8puIhzcborQXWNABpwrjMdzqijzzsxKtpvcZoRXoVUzKUlIsEHLn4J
 08dGsL9yWn3msxuJwFZxjoWrldj95ysqzxABc4QIqvNQB78rvlSG3MAZT
 5CKnKOvmND8NSlHKgjc2D+5sbqtr5yxBTdxdBmwJXUnvGQrDbfnIOiNxt Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="285699121"
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; d="scan'208";a="285699121"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 01:59:32 -0700
X-IronPort-AV: E=Sophos;i="5.93,317,1654585200"; d="scan'208";a="650404865"
Received: from alishana-mobl1.ger.corp.intel.com (HELO [10.213.218.26])
 ([10.213.218.26])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 01:59:31 -0700
Message-ID: <2bf26f8f-7f5f-4cfb-5117-a9119bf708fe@linux.intel.com>
Date: Thu, 15 Sep 2022 09:59:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/uc: Update to latest GuC and use
 new-format GuC/HuC names
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20220914234605.622342-1-John.C.Harrison@Intel.com>
 <20220914234605.622342-2-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220914234605.622342-2-John.C.Harrison@Intel.com>
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
Cc: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 15/09/2022 00:46, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Going forwards, the intention is for GuC firmware files to be named
> for their major version only and HuC firmware files to have no version
> number in the name at all. This patch adds those entries for all
> platforms that are officially GuC/HuC enabled.
> 
> Also, update the expected GuC version numbers to the latest firmware
> release for those platforms.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 1169e2a09da24..b91ad4aede1f7 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -72,12 +72,14 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>    * security fixes, etc. to be enabled.
>    */
>   #define INTEL_GUC_FIRMWARE_DEFS(fw_def, guc_maj, guc_mmp) \
> -	fw_def(DG2,          0, guc_mmp(dg2,  70, 4, 1)) \
> +	fw_def(DG2,          0, guc_maj(dg2,  70, 5)) \

Just glancing over out of curiosity. Part which confused me is that if 
only major is supposed to be used then what is the '5' in guc_maj(dg2, 
70, 5) ?

I also couldn't find guc_maj with grep so I guess it's some sort of a 
magic concatenation macro or what?

Regards,

Tvrtko

> +	fw_def(ALDERLAKE_P,  0, guc_maj(adlp, 70, 5)) \
>   	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 70, 1, 1)) \
>   	fw_def(ALDERLAKE_P,  0, guc_mmp(adlp, 69, 0, 3)) \
> +	fw_def(ALDERLAKE_S,  0, guc_maj(tgl,  70, 5)) \
>   	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  70, 1, 1)) \
>   	fw_def(ALDERLAKE_S,  0, guc_mmp(tgl,  69, 0, 3)) \
> -	fw_def(DG1,          0, guc_mmp(dg1,  70, 1, 1)) \
> +	fw_def(DG1,          0, guc_maj(dg1,  70, 5)) \
>   	fw_def(ROCKETLAKE,   0, guc_mmp(tgl,  70, 1, 1)) \
>   	fw_def(TIGERLAKE,    0, guc_mmp(tgl,  70, 1, 1)) \
>   	fw_def(JASPERLAKE,   0, guc_mmp(ehl,  70, 1, 1)) \
> @@ -92,9 +94,11 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   	fw_def(SKYLAKE,      0, guc_mmp(skl,  70, 1, 1))
>   
>   #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_raw, huc_mmp) \
> +	fw_def(ALDERLAKE_P,  0, huc_raw(tgl)) \
>   	fw_def(ALDERLAKE_P,  0, huc_mmp(tgl,  7, 9, 3)) \
> +	fw_def(ALDERLAKE_S,  0, huc_raw(tgl)) \
>   	fw_def(ALDERLAKE_S,  0, huc_mmp(tgl,  7, 9, 3)) \
> -	fw_def(DG1,          0, huc_mmp(dg1,  7, 9, 3)) \
> +	fw_def(DG1,          0, huc_raw(dg1)) \
>   	fw_def(ROCKETLAKE,   0, huc_mmp(tgl,  7, 9, 3)) \
>   	fw_def(TIGERLAKE,    0, huc_mmp(tgl,  7, 9, 3)) \
>   	fw_def(JASPERLAKE,   0, huc_mmp(ehl,  9, 0, 0)) \

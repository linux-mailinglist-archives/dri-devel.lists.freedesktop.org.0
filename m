Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB6C55BFD1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 11:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F261B12B0EE;
	Tue, 28 Jun 2022 09:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6A412B0EE;
 Tue, 28 Jun 2022 09:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656409263; x=1687945263;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=E1shaTiRi2MGix+vGmQFahHOJVh393tMghirsTFvSWs=;
 b=Y5xKzfEJ91qaw7bzgc/7AsooEOXpqm4FkdUsIksyM3wI5cmOL4aCHtr7
 Z/u4FRYZ5sxH76HPbYyDK7/cHkG4LtvPBGD8IwDR/Gz23WuUtY3oTsGJD
 brhUwOnpUXjHlzYIazy/qPtw53sE1JLFBBLAiZ69RrNk6zXtbSvLRnd0D
 vaHglrbm4LAwZzy46NRETnx1jGQHrBL/i5oNCjWmC5QkHM6mko3dwpCY5
 lNWGPkuQm73fL4ow4Ab5PzOBEQxzvANbUuI7VzaZS1ISCNAK28l2OKqfX
 n5R+9CgimiKXyIfxLY+M/jAvpBN+mMM3tzgR+G+zerc5/cJnqmpNpL9H0 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10391"; a="262103721"
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="262103721"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 02:41:02 -0700
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; d="scan'208";a="693036661"
Received: from dlee-mobl1.gar.corp.intel.com (HELO [10.214.144.75])
 ([10.214.144.75])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2022 02:41:00 -0700
Message-ID: <61281f78-407f-8953-acd3-2de1b306e741@intel.com>
Date: Tue, 28 Jun 2022 10:40:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/i915/gt: handle null ptr at sg traversing
Content-Language: en-GB
To: Ramalingam C <ramalingam.c@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20220627173539.29094-1-ramalingam.c@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220627173539.29094-1-ramalingam.c@intel.com>
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

On 27/06/2022 18:35, Ramalingam C wrote:
> When calculating the starting address for ccs data in smem scatterlist,
> handle the NULL pointer returned from sg_next, incase of scatterlist
> less than required size..

Do we have some more information on how we can hit this? Is this a 
programmer error? Do we have a testcase?

> 
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_migrate.c | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 2c35324b5f68..c206fb4f4186 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -669,7 +669,7 @@ calculate_chunk_sz(struct drm_i915_private *i915, bool src_is_lmem,
>   	}
>   }
>   
> -static void get_ccs_sg_sgt(struct sgt_dma *it, u32 bytes_to_cpy)
> +static int get_ccs_sg_sgt(struct sgt_dma *it, u32 bytes_to_cpy)
>   {
>   	u32 len;
>   
> @@ -684,9 +684,13 @@ static void get_ccs_sg_sgt(struct sgt_dma *it, u32 bytes_to_cpy)
>   		bytes_to_cpy -= len;
>   
>   		it->sg = __sg_next(it->sg);
> +		if (!it->sg)
> +			return -EINVAL;
>   		it->dma = sg_dma_address(it->sg);
>   		it->max = it->dma + sg_dma_len(it->sg);
>   	} while (bytes_to_cpy);
> +
> +	return 0;
>   }
>   
>   int
> @@ -745,8 +749,11 @@ intel_context_migrate_copy(struct intel_context *ce,
>   		 * Need to fix it.
>   		 */
>   		ccs_bytes_to_cpy = src_sz != dst_sz ? GET_CCS_BYTES(i915, bytes_to_cpy) : 0;
> -		if (ccs_bytes_to_cpy)
> -			get_ccs_sg_sgt(&it_ccs, bytes_to_cpy);
> +		if (ccs_bytes_to_cpy) {
> +			err = get_ccs_sg_sgt(&it_ccs, bytes_to_cpy);
> +			if (err)
> +				return err;
> +		}
>   	}
>   
>   	src_offset = 0;

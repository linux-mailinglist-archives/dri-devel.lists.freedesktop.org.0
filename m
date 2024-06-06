Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B398FF4C0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 20:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A7010EA5E;
	Thu,  6 Jun 2024 18:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dAhBegN2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECCB10E0CD;
 Thu,  6 Jun 2024 18:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717698808; x=1749234808;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+2ucsMGGe0SbtCqQj5FtFPB05uivPcWSxkgvJuswIJc=;
 b=dAhBegN2AvrP8bHu6jDzKSR/q77DAGN++1X6Mem443ViYrjTxIgV2hw5
 MoiXWqSrgAjK+qXvSZByQttCzsYGq5NxlgVOg2mZwQu6WB9qCjHCF04uM
 rYPfEtnczW35Ssfkd+ndNbqNJN4PbyQFCrMqmBC+70Gj7powAS1vyVL8f
 55PNJKr3i6L9iCAxiZIH0FIkD+IPN5X7g023bmtgrNwo4h0cTqAaG/TEn
 N26IeGX9V1eiE4ixU8ZFZOM27y7wMEp10HdBwiZ5d+5c3DbFYAZUJtXQz
 FOJXz8TIRpupys4GRLpwA8/UymeM6d3pEQyLq+QMt8Qp2qZC2PG2WH/5C g==;
X-CSE-ConnectionGUID: bQ73DcZNQWiDJS1jf3t79Q==
X-CSE-MsgGUID: tzNio7KfQZSy2fvxD7Zv0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14347412"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="14347412"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 11:33:27 -0700
X-CSE-ConnectionGUID: WwaENxExTBKvRMtnESH7sw==
X-CSE-MsgGUID: Ycln1fTPSTuCZjzID8e67w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="42639634"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 06 Jun 2024 11:33:25 -0700
Received: from [10.245.96.165] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.165])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id E00D233BFA;
 Thu,  6 Jun 2024 19:33:23 +0100 (IST)
Message-ID: <476b5068-16de-4cf8-8f2d-47ee0e9986db@intel.com>
Date: Thu, 6 Jun 2024 20:33:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Use drm_device managed mutex/mm init helpers
 in GGTT
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
References: <20240524133518.976-1-michal.wajdeczko@intel.com>
 <20240524133518.976-3-michal.wajdeczko@intel.com>
 <ZmHxBSZBi2vwQr1L@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ZmHxBSZBi2vwQr1L@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 06.06.2024 19:25, Rodrigo Vivi wrote:
> On Fri, May 24, 2024 at 03:35:18PM +0200, Michal Wajdeczko wrote:
>> There is not need for private release action as there are existing
>> drmm_mm_init() and drmm_mutex_init() helpers that can be used.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_ggtt.c | 23 +++++++++++------------
>>  1 file changed, 11 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 17e5066763db..7c91fe212dcb 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -96,14 +96,6 @@ static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>>  	}
>>  }
>>  
>> -static void ggtt_fini_early(struct drm_device *drm, void *arg)
>> -{
>> -	struct xe_ggtt *ggtt = arg;
>> -
>> -	mutex_destroy(&ggtt->lock);
>> -	drm_mm_takedown(&ggtt->mm);
>> -}
>> -
>>  static void ggtt_fini(struct drm_device *drm, void *arg)
>>  {
>>  	struct xe_ggtt *ggtt = arg;
>> @@ -141,6 +133,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
>>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>  	unsigned int gsm_size;
>> +	int err;
>>  
>>  	if (IS_SRIOV_VF(xe))
>>  		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
>> @@ -189,12 +182,18 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>>  	else
>>  		ggtt->pt_ops = &xelp_pt_ops;
>>  
>> -	drm_mm_init(&ggtt->mm, xe_wopcm_size(xe),
>> -		    ggtt->size - xe_wopcm_size(xe));
>> -	mutex_init(&ggtt->lock);
>> +	err = drmm_mm_init(&xe->drm, &ggtt->mm, xe_wopcm_size(xe),
>> +			   ggtt->size - xe_wopcm_size(xe));
>> +	if (err)
>> +		return err;
>> +
>> +	err = drmm_mutex_init(&xe->drm, &ggtt->lock);
>> +	if (err)
>> +		return err;
> 
> My first impression here is that we would have a bug here if drmm_mm_init
> works, but drmm_mutex_init fails, but we are likely safe because the
> probe will also entirely fail if this mutex init fails.
> 
>> +
>>  	primelockdep(ggtt);
>>  
>> -	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
> 
> But my question here is, why drmm and not devm for this ggtt case that
> only makes sense if the hardware/device is up and not about the module
> or no reason to keep it alive after the probe failure or device removal.
> 
> I know that the question is orthogonal to your patch. But if we decide to
> change the course later and move this towards devm, then we need to
> get back to the exit function and perhaps regular mutex.

but note that drm_mm alone does not interact with the hw, it's what we
eventually build on top of it (like here ggtt manager) may touch the hw

> 
> I mean, really nothing against this patch itself, specially if we are
> confident that drmm is the way to go with this ggtt. So, I'm not blocking
> here:
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
>> +	return 0;
>>  }
>>  
>>  static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
>> -- 
>> 2.43.0
>>

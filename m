Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDCA41C73E
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 16:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7F16EA97;
	Wed, 29 Sep 2021 14:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DD86EAAE;
 Wed, 29 Sep 2021 14:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id C0C9A3F36D;
 Wed, 29 Sep 2021 16:51:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: pio-pvt-msa3.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D70mD4csObw8; Wed, 29 Sep 2021 16:50:59 +0200 (CEST)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 40BA83F32D;
 Wed, 29 Sep 2021 16:50:57 +0200 (CEST)
Received: from [192.168.0.209] (unknown [192.198.151.53])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 0474F36011B;
 Wed, 29 Sep 2021 16:50:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1632927057; bh=hVc1+hKMg11SzO2edsE5UMTFcbwpZX2YiDZoYUUWjho=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cq0mrBg3jxesvGvYLPDCG34O0FcbDCrReWZYIIK6TvwFFXFT4OToXmc7G1eltR1Ca
 Z6bw9PoImZ02ggSh16O7vOTeYq2tc5R0nf8V99exMLI2wGNG/nRgo8QBcQjq0Zcr1S
 wewgy6zruzUjOXZhY/9PjZX/VPls8dylcEB309UA=
Message-ID: <07332ad2-5a4d-90bc-47b0-069d292ccdad@shipmail.org>
Date: Wed, 29 Sep 2021 16:50:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add ww context to intel_dpt_pin, v2.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@lip6.fr>
References: <20210929085950.3063191-1-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20210929085950.3063191-1-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 9/29/21 10:59, Maarten Lankhorst wrote:
> Ensure i915_vma_pin_iomap and vma_unpin are done with dpt->obj lock held.
>
> I don't think there's much of a point in merging intel_dpt_pin() with
> intel_pin_fb_obj_dpt(), they touch different objects.
>
> Changes since v1:
> - Fix using the wrong pointer to retrieve error code (Julia)
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@lip6.fr>

LGTM.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

> ---
>   drivers/gpu/drm/i915/display/intel_dpt.c | 40 +++++++++++++++---------
>   1 file changed, 25 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
> index de62bd77b15e..8f7b1f7534a4 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpt.c
> @@ -121,32 +121,42 @@ struct i915_vma *intel_dpt_pin(struct i915_address_space *vm)
>   	intel_wakeref_t wakeref;
>   	struct i915_vma *vma;
>   	void __iomem *iomem;
> +	struct i915_gem_ww_ctx ww;
> +	int err;
>   
>   	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
>   	atomic_inc(&i915->gpu_error.pending_fb_pin);
>   
> -	vma = i915_gem_object_ggtt_pin(dpt->obj, NULL, 0, 4096,
> -				       HAS_LMEM(i915) ? 0 : PIN_MAPPABLE);
> -	if (IS_ERR(vma))
> -		goto err;
> +	for_i915_gem_ww(&ww, err, true) {
> +		err = i915_gem_object_lock(dpt->obj, &ww);
> +		if (err)
> +			continue;
>   
> -	iomem = i915_vma_pin_iomap(vma);
> -	i915_vma_unpin(vma);
> -	if (IS_ERR(iomem)) {
> -		vma = ERR_CAST(iomem);
> -		goto err;
> -	}
> +		vma = i915_gem_object_ggtt_pin_ww(dpt->obj, &ww, NULL, 0, 4096,
> +						  HAS_LMEM(i915) ? 0 : PIN_MAPPABLE);
> +		if (IS_ERR(vma)) {
> +			err = PTR_ERR(vma);
> +			continue;
> +		}
> +
> +		iomem = i915_vma_pin_iomap(vma);
> +		i915_vma_unpin(vma);
>   
> -	dpt->vma = vma;
> -	dpt->iomem = iomem;
> +		if (IS_ERR(iomem)) {
> +			err = PTR_ERR(iomem);
> +			continue;
> +		}
>   
> -	i915_vma_get(vma);
> +		dpt->vma = vma;
> +		dpt->iomem = iomem;
> +
> +		i915_vma_get(vma);
> +	}
>   
> -err:
>   	atomic_dec(&i915->gpu_error.pending_fb_pin);
>   	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
>   
> -	return vma;
> +	return err ? ERR_PTR(err) : vma;
>   }
>   
>   void intel_dpt_unpin(struct i915_address_space *vm)

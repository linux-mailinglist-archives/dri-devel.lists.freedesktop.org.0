Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BEE552BDD
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4AD10FDD7;
	Tue, 21 Jun 2022 07:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E37610FDD7;
 Tue, 21 Jun 2022 07:25:16 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id c13so13636280eds.10;
 Tue, 21 Jun 2022 00:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2S7w5ZPCedGE766t3ia7UJGUwyc737bpIP2qRPiGFBI=;
 b=S+99Sfx2YnIZtF1gzAF1s/j3LkHJtQOV6XKDxfMmghUYGMygD+g9Cx3w/mzrgHu35y
 76YQbbVHddVBN2F4RXL8TJWBZUPPh1OvYyT2vBREARU9KmnlBcvZG0Hez89GTM0mB6UG
 Pye2Ou3XUcu6G2uD+gtuMt6LSDudFXDOEWEZlOROkgjR2PENC3Eoo/NVY8lKD/am68BZ
 tSCHlqufz/20NVZur9Xv+Ls0rmkYz5VXIdSPhM8Ta/rJGP22+o4/O0SK5kEF0L5Ft0LD
 wRmG8Lq8lOkTtzLvjZ20AltUrBxpPaMOAylugVEORI2tzK03cmEwvAelZObgg7EYeUNA
 Z57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2S7w5ZPCedGE766t3ia7UJGUwyc737bpIP2qRPiGFBI=;
 b=l7lhAeRaE0965Yl0JD2PRloBU1/oYSUT6pmi16UE5vWs/ityNWmlT1JnW2Nc4IQ9qN
 lIsgowIQCbhIJ9rEN0kLWq9G7QLOS5Dnxj3k6aLcZAi/OxIIYXDAvHAl4K2uxm/ZjGMy
 t9BIlxnKFt6G5y50X26JH0aJu2V1uBUyicW4H8eAAXJ09Z4UWOAB5X2Nxq95ZZDW1AH8
 hdjaVHtGcAh0liN+HFzgyyQrLEV3TmWyFPn8Zr2efj1Sg02Z3prGK/BzJppiup+Nu+dD
 5DmvQf95dPTCWbMyC2qv7cFMSyr/UXdAha4qkJmzVyAsgxOTdu5dOXCshyJpX6GIBg72
 NDHA==
X-Gm-Message-State: AJIora/AAzC7aSXA1yNDxHlq4z+2GOt8B71GUPdyZPtg/NOvgRMHDPo7
 Ma7TaKZiEGCx2TxCW2cyD6w=
X-Google-Smtp-Source: AGRyM1tGn8ZAzOylB9bMWKZUS9BylRNu16ewDugb3aPlEWBMWOqtYyR1CHpEDbl9o4msjugs4JE9yg==
X-Received: by 2002:a05:6402:3886:b0:435:643a:b7ae with SMTP id
 fd6-20020a056402388600b00435643ab7aemr23611360edb.4.1655796314737; 
 Tue, 21 Jun 2022 00:25:14 -0700 (PDT)
Received: from [192.168.178.21] (p57b0bd9f.dip0.t-ipconnect.de.
 [87.176.189.159]) by smtp.gmail.com with ESMTPSA id
 d4-20020a170906304400b00711eea3fa9bsm6971564ejd.42.2022.06.21.00.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 00:25:14 -0700 (PDT)
Message-ID: <5b6b623b-9a6b-a615-d7ea-af436f1b4d92@gmail.com>
Date: Tue, 21 Jun 2022 09:25:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/5] drm/amdgpu: Prevent race between late signaled fences
 and GPU reset.
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220620220302.86389-1-andrey.grodzovsky@amd.com>
 <20220620220302.86389-4-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220620220302.86389-4-andrey.grodzovsky@amd.com>
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
Cc: jingwen.chen2@amd.com, Christian.Koenig@amd.com, monk.liu@amd.com,
 yiqing.yao@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.06.22 um 00:03 schrieb Andrey Grodzovsky:
> Problem:
> After we start handling timed out jobs we assume there fences won't be
> signaled but we cannot be sure and sometimes they fire late. We need
> to prevent concurrent accesses to fence array from
> amdgpu_fence_driver_clear_job_fences during GPU reset and amdgpu_fence_process
> from a late EOP interrupt.
>
> Fix:
> Before accessing fence array in GPU disable EOP interrupt and flush
> all pending interrupt handlers for amdgpu device's interrupt line.

>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  4 ++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  | 26 ++++++++++++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |  1 +
>   3 files changed, 31 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 2b92281dd0c1..c99541685804 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -4605,6 +4605,8 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
>   		amdgpu_virt_fini_data_exchange(adev);
>   	}
>   
> +	amdgpu_fence_driver_isr_toggle(adev, true);
> +
>   	/* block all schedulers and reset given job's ring */
>   	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>   		struct amdgpu_ring *ring = adev->rings[i];
> @@ -4620,6 +4622,8 @@ int amdgpu_device_pre_asic_reset(struct amdgpu_device *adev,
>   		amdgpu_fence_driver_force_completion(ring);
>   	}
>   
> +	amdgpu_fence_driver_isr_toggle(adev, false);
> +
>   	if (job && job->vm)
>   		drm_sched_increase_karma(&job->base);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index a9ae3beaa1d3..d6d54ba4c185 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -532,6 +532,32 @@ void amdgpu_fence_driver_hw_fini(struct amdgpu_device *adev)
>   	}
>   }
>   
> +void amdgpu_fence_driver_isr_toggle(struct amdgpu_device *adev, bool stop)
> +{
> +	int i;
> +
> +	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
> +		struct amdgpu_ring *ring = adev->rings[i];
> +
> +		if (!ring || !ring->fence_drv.initialized || !ring->fence_drv.irq_src)
> +			continue;
> +
> +		if (stop)
> +			amdgpu_irq_put(adev, ring->fence_drv.irq_src,
> +					       ring->fence_drv.irq_type);
> +		else
> +			amdgpu_irq_get(adev, ring->fence_drv.irq_src,
> +					ring->fence_drv.irq_type);

That won't work like this. This increments/decrements the reference 
count for the IRQ, but doesn't guarantee in any way that they are 
stopped/started.

> +	}
> +
> +	/* TODO Only waits for irq handlers on other CPUs, maybe local_irq_save
> +	 * local_irq_local_irq_restore are needed here for local interrupts ?
> +	 *
> +	 */

Well that comment made me smile. Think for a moment what the local CPU 
would be doing if an interrupt would run :)

Cheers,
Christian.

> +	if (stop)
> +		synchronize_irq(adev->irq.irq);
> +}
> +
>   void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
>   {
>   	unsigned int i, j;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> index 7d89a52091c0..82c178a9033a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h
> @@ -143,6 +143,7 @@ signed long amdgpu_fence_wait_polling(struct amdgpu_ring *ring,
>   				      uint32_t wait_seq,
>   				      signed long timeout);
>   unsigned amdgpu_fence_count_emitted(struct amdgpu_ring *ring);
> +void amdgpu_fence_driver_isr_toggle(struct amdgpu_device *adev, bool stop);
>   
>   /*
>    * Rings.


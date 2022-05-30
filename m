Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8695377CF
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 11:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FAF710E4CD;
	Mon, 30 May 2022 09:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD1010E4CD;
 Mon, 30 May 2022 09:52:32 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id jx22so19664148ejb.12;
 Mon, 30 May 2022 02:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cbTwddcOfDiR4XUOUI294FWLpDzMKvS5yNL2snjSgQw=;
 b=MPY/SpPpVMn9tMh5hca6OkN9jGvz1Po3qV+37hLFoh31lPVSdCU6Mol5RMn7NMuhk4
 X+Z94dpcMO0JrV5LKNd8HDXcUooWxbivWlaG4O18fUD0zn9P8IJKUbNlCycIO/tNldxA
 1QWh1RRvt2CX+Qej3IrGm8+Gg5+NOK5jUeloW1nn3czIwSIFmb2LbOHLNgaGWBLRWS3Q
 Fb2giNXfRotlpmASHFpITO0i1a4FNVCU4dGS1VJgGYzZ85RVLo2cK5ZHusSHfonWv7bi
 VBSPe2P+ZlFoduCC+gOMViNNeDEOZwp4O2cT/vZ/ZXiy0MzzCjjcRUzcR3HuiqDYSiQM
 QB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cbTwddcOfDiR4XUOUI294FWLpDzMKvS5yNL2snjSgQw=;
 b=taqcDXwkGQjPiTlP8wIWFM2JCI47/uqJ+rpHRMZLqowJiSbj7mlOgEzrvsZ6SMmL3q
 tyDl2eMKhpWemJynMeKguuy/foBZAkTBJAYsTXKKKOx1Ap9m/cMJp8e7EkUA+jpm/2Os
 8BoEWao36HRacGfctIWuOtv8stv7VOY/rIK/p4/pO1tntpWpjBQsdFjWk48SvYFeNLEn
 V9pfHYQUhMABePq85BdP2aT1amskPae/31zKRG56fug2Zc1aCO/fwCHtrVUftaB1ILMS
 xT7r6rp5X02N8dbnJYin+Ar9O6x0KF51TRsEcDXrfobqS84D1DDdAh+y/f7dLxR+ddED
 AFBg==
X-Gm-Message-State: AOAM530RcBTS6FuBJDxbcD/80RQ+txCgv6Bk4PYafJxToKI2JoYVnGxi
 CgzF0auND1HTcQpzTJbmaWQ=
X-Google-Smtp-Source: ABdhPJzwQTsngHo4KGNUDDzpJwcUhZN6X21fg4MnJyFTn+TiuWDmMqQIa/xrsgIJ5WOSpa959Jgkuw==
X-Received: by 2002:a17:907:c290:b0:6fe:c2b8:bb6b with SMTP id
 tk16-20020a170907c29000b006fec2b8bb6bmr37453054ejc.222.1653904350832; 
 Mon, 30 May 2022 02:52:30 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea17a.dip0.t-ipconnect.de.
 [91.14.161.122]) by smtp.gmail.com with ESMTPSA id
 mc22-20020a170906eb5600b006feb002a620sm3838182ejb.1.2022.05.30.02.52.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 02:52:30 -0700 (PDT)
Message-ID: <b54b2cc7-f511-e6ce-72fa-da5c8cd5e7b4@gmail.com>
Date: Mon, 30 May 2022 11:52:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Intel-gfx] [PATCH] drm/syncobj: flatten dma_fence_chains on
 transfer
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20220209182600.434803-1-christian.koenig@amd.com>
 <2bf6b110-cd85-e17f-e9c5-69e5e7eedd0d@intel.com>
 <dbdb02cb-26fa-4f08-b125-c4a850e73780@gmail.com>
 <d97d1700-4f05-a78c-aa3c-d4c52226d0ca@intel.com>
 <996331e1-4442-7b43-b3f4-24bd6861eacd@intel.com>
 <419c9bff-4292-3062-b7f2-efeb64b9e79f@gmail.com>
 <20220525215933.m4yhm3b653gt4knp@ldmartin-desk2>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220525215933.m4yhm3b653gt4knp@ldmartin-desk2>
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
Cc: thomas.hellstrom@linux.intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>, daniel.vetter@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.05.22 um 23:59 schrieb Lucas De Marchi:
> On Wed, May 25, 2022 at 12:38:51PM +0200, Christian König wrote:
>> Am 25.05.22 um 11:35 schrieb Lionel Landwerlin:
>>> [SNIP]
>>>
>>> Err... Let's double check with my colleagues.
>>>
>>> It seems we're running into a test failure in IGT with this patch, 
>>> but now I have doubts that it's where the problem lies.
>>
>> Yeah, exactly that's what I couldn't understand as well.
>>
>> What you describe above should still work fine.
>>
>> Thanks for taking a look into this,
>> Christian.
>
> With some additional prints:
>
> [  210.742634] Console: switching to colour dummy device 80x25
> [  210.742686] [IGT] syncobj_timeline: executing
> [  210.756988] [IGT] syncobj_timeline: starting subtest 
> transfer-timeline-point
> [  210.757364] [drm:drm_syncobj_transfer_ioctl] *ERROR* adding fence0 
> signaled=1
> [  210.764543] [drm:drm_syncobj_transfer_ioctl] *ERROR* resulting 
> array fence signaled=0
> [  210.800469] [IGT] syncobj_timeline: exiting, ret=98
> [  210.825426] Console: switching to colour frame buffer device 240x67
>
>
> still learning this part of the code but AFAICS the problem is because
> when we are creating the array, the 'signaled' doesn't propagate to the
> array.

Yeah, but that is intentionally. The array should only signal when 
requested.

I still don't get what the test case here is checking.

Regards,
Christian.

>
> dma_fence_array_create() {
>     ...
>     atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
>     ...
> }
>
> This is not considering the fact that some of the fences could already
> have been signaled as is the case in the 
> igt@syncobj_timeline@transfer-timeline-point
> test. See 
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11693/shard-dg1-12/igt@syncobj_timeline@transfer-timeline-point.html
>
> Quick patch on this function fixes it for me:
>
> ---------8<----------------
> Subject: [PATCH] dma-buf: Honor already signaled fences on array creation
>
> When creating an array, array->num_pending is marked with the number of
> fences. However the fences could alredy have been signaled. Propagate
> num_pending to the array by looking at each individual fence the array
> contains.
>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/dma-buf/dma-fence-array.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/dma-buf/dma-fence-array.c 
> b/drivers/dma-buf/dma-fence-array.c
> index 5c8a7084577b..32f491c32fa0 100644
> --- a/drivers/dma-buf/dma-fence-array.c
> +++ b/drivers/dma-buf/dma-fence-array.c
> @@ -158,6 +158,8 @@ struct dma_fence_array *dma_fence_array_create(int 
> num_fences,
>  {
>      struct dma_fence_array *array;
>      size_t size = sizeof(*array);
> +    unsigned num_pending = 0;
> +    struct dma_fence **f;
>
>      WARN_ON(!num_fences || !fences);
>
> @@ -173,7 +175,14 @@ struct dma_fence_array 
> *dma_fence_array_create(int num_fences,
>      init_irq_work(&array->work, irq_dma_fence_array_work);
>
>      array->num_fences = num_fences;
> -    atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
> +
> +    for (f = fences; f < fences + num_fences; f++)
> +        num_pending += !dma_fence_is_signaled(*f);
> +
> +    if (signal_on_any)
> +        num_pending = !!num_pending;
> +
> +    atomic_set(&array->num_pending, num_pending);
>      array->fences = fences;
>
>      array->base.error = PENDING_ERROR;


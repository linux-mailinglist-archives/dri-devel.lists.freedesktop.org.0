Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B936554729B
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 09:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECFAE112934;
	Sat, 11 Jun 2022 07:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5E710F750;
 Sat, 11 Jun 2022 07:19:23 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u8so1092390wrm.13;
 Sat, 11 Jun 2022 00:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7bnwrqE4CJ7P3KxgNeGT8eICxR3BN5bU5B1VLZu7Hpc=;
 b=GSfefEJJgtGoioOx6dyh3oXblZvnxnvDoCV2fk9gWFh97gQZQKVQtm3HNsPv/UiEAC
 nJvOLeZpHVr/aGjVUG4oVGtLvQGJ88Y9iA4fQGusxWq0ikv77AygC9sx1KQlq2hPrB2p
 HUS0xbD3TnLTLWZal+W2zs2Oi/G72mZ8RaU+i6AgY7L9ij7Kk4Qt1WoV5jN15nWJIhAH
 HJ1z29EdH6PB0RdlYRs7ior9qkes/T5TTLQMIUWzbl1Dx8//2gPoPVq8PByV0fxxL2xV
 PYg6WzGAAmDRHNRt0y6/pJ/CrCc88tRZDjWcJYcpNfRLbXOC9VCEiRIghDuk+oSBBiay
 HwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7bnwrqE4CJ7P3KxgNeGT8eICxR3BN5bU5B1VLZu7Hpc=;
 b=PCgYF3CA3J5rpXB6J2KRU2pf2qLUSJR2Jiz8W4Aqgvx1U06TfkqbIj47ck+6zm9aDt
 lidAERRib7HRb/kl3+Yq+9psBo7U9ZkhYje52uQx/w0sg+XCyrrfxmibQj2o1HJzWh7Y
 Ni3uQ1as26ju70I2BT5CHSysERVqiuyejWOSO/Qh5lo7VKZC7M7kGKnjkGTmi5m+rPPe
 1HOgiD6egUzoGJNWBWrJqV+EBhLJewh7n/JQ00ckHqf1lBuVLJAy/w1MtoggcRTi904u
 WTP0+LgMaKC90ug2+LTBpfuZ2zu5vJs3Gwm4rLwiATDpOzOBcdv1pJN2lE0GqcerScEE
 e88g==
X-Gm-Message-State: AOAM532lG+GVq3X4wo0GXLUpDjAsFcQpcqhi/9P2M0kSLhZHPnTcGnmn
 li56nccxdqY7yuF26IBg8Ao=
X-Google-Smtp-Source: ABdhPJymEx9IsFGzqBYjjqJPqsK9sVB5CXdUcB1kiAyAX3oO2eEKYxzNCHp5hOZy0ciO1+wVelFKwg==
X-Received: by 2002:a5d:4532:0:b0:210:2c52:bac2 with SMTP id
 j18-20020a5d4532000000b002102c52bac2mr45639489wra.711.1654931961964; 
 Sat, 11 Jun 2022 00:19:21 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:285a:43cd:3b2c:3f3c?
 ([2a02:908:1256:79a0:285a:43cd:3b2c:3f3c])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a05600c204100b0039aef592ca0sm1201501wmg.35.2022.06.11.00.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jun 2022 00:19:21 -0700 (PDT)
Message-ID: <2260b6a6-153c-6c12-212c-2b3f5199e6dc@gmail.com>
Date: Sat, 11 Jun 2022 09:19:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/amdgpu: Fix GTT size reporting in amdgpu_ioctl
Content-Language: en-US
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>
References: <20220610135426.670120-1-michel@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220610135426.670120-1-michel@daenzer.net>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.06.22 um 15:54 schrieb Michel Dänzer:
> From: Michel Dänzer <mdaenzer@redhat.com>
>
> The commit below changed the TTM manager size unit from pages to
> bytes, but failed to adjust the corresponding calculations in
> amdgpu_ioctl.
>
> Fixes: dfa714b88eb0 ("drm/amdgpu: remove GTT accounting v2")
> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1930
> Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/6642
> Signed-off-by: Michel Dänzer <mdaenzer@redhat.com>

Ah, WTF! You won't believe how long I have been searching for this one.

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 801f6fa692e9..6de63ea6687e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -642,7 +642,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>   			    atomic64_read(&adev->visible_pin_size),
>   			    vram_gtt.vram_size);
>   		vram_gtt.gtt_size = ttm_manager_type(&adev->mman.bdev, TTM_PL_TT)->size;
> -		vram_gtt.gtt_size *= PAGE_SIZE;
>   		vram_gtt.gtt_size -= atomic64_read(&adev->gart_pin_size);
>   		return copy_to_user(out, &vram_gtt,
>   				    min((size_t)size, sizeof(vram_gtt))) ? -EFAULT : 0;
> @@ -675,7 +674,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
>   			mem.cpu_accessible_vram.usable_heap_size * 3 / 4;
>   
>   		mem.gtt.total_heap_size = gtt_man->size;
> -		mem.gtt.total_heap_size *= PAGE_SIZE;
>   		mem.gtt.usable_heap_size = mem.gtt.total_heap_size -
>   			atomic64_read(&adev->gart_pin_size);
>   		mem.gtt.heap_usage = ttm_resource_manager_usage(gtt_man);


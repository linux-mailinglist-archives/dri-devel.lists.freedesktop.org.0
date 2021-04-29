Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A131E36E5BA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 09:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1596ED27;
	Thu, 29 Apr 2021 07:15:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9616ED26;
 Thu, 29 Apr 2021 07:15:35 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id r12so98325690ejr.5;
 Thu, 29 Apr 2021 00:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0Vhaiy7KCk4dhjU0COHqgaZ+NZlSEN30UxiwPliDRtM=;
 b=ED1SqQfZQc6dnAUKQNu7JxD5YmxjJj4VXgnAZgJg0IgHmue4DzMf55YPFELnv4ruZJ
 PYZIrGME+hiLPkamcuCFKbZ1EuOBPp6tA1A606NYfPAsu5/p9Wvh8NvMLb7vpGagi8Ev
 mfjtqEFnP4fgCZ1TmZsxR2oeRQr65QX3lnLqyuZ/GDY6L0qZ8IdTAiu1Gi5e9PBQpi16
 kCP2dHp3WSx8PzGT7zU7tJDWIE409tOGW4LOmNnt+Yhz7vW4BaR9gloOrjxftJDWVAgP
 fUVwwWfL/AQQNFYpfqh5qIysoeaUy/kNM3P+Y7nVxneBwY2OjFIGCgRyeUkMiGuE3Fht
 Dsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0Vhaiy7KCk4dhjU0COHqgaZ+NZlSEN30UxiwPliDRtM=;
 b=B91IpNRc9o9/V/XTmVwvnXsdB56nJoUlFJuPu/Q2aEk8fU6lY7KUbhtYyoxKSj+65h
 YzkrQnIJzJZav+QcUQ3fe+j8PDzoKmjMoFwAw7AzeQnD/ukrdvvKfpeZQ8vEYqu2MO1P
 CAZyxJHyvIuVgemR6WEJU8YRcACjyBn+Vrfv3APz9R5mug+/O4rqMrB2CJLxWAkJIXG5
 +Fn8fW7mzvKs95akXO3V2mEBnwd10ORkrN5AeN1i2e5c/i/yttfZS8W+OoTULFcm/Nj8
 Uwi08NekvXps2PIjVV+CQzSUzK4idIpShNLFrweCsN+eqpmaL48SmTpGQI9G7au+X+ec
 GGXw==
X-Gm-Message-State: AOAM532DZHCWWde33JK4LrALBZ8XjgpsSLzK64uA+gn9hxpv9tR2SxMo
 YFUhTEZ6PXxDBl0LjtH+1+Y=
X-Google-Smtp-Source: ABdhPJyWkpxf2itDYnMgYqeb1O/hEOB6obny5mrQqWh3lb5YA4ecvpsCg0JWreVNFmINA/ObBFa1EA==
X-Received: by 2002:a17:907:174a:: with SMTP id
 lf10mr11077236ejc.433.1619680534092; 
 Thu, 29 Apr 2021 00:15:34 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:49f7:8b5a:d7ab:5e3e?
 ([2a02:908:1252:fb60:49f7:8b5a:d7ab:5e3e])
 by smtp.gmail.com with ESMTPSA id n10sm1264425ejg.124.2021.04.29.00.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 00:15:33 -0700 (PDT)
Subject: Re: [PATCH v5 13/27] drm/amdgpu: When filizing the fence driver. stop
 scheduler first.
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
 <20210428151207.1212258-14-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <f6bbd803-202c-7514-082b-18efa5296520@gmail.com>
Date: Thu, 29 Apr 2021 09:15:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428151207.1212258-14-andrey.grodzovsky@amd.com>
Content-Language: en-US
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Filizing the fences? You mean finishing the fences, don't you? :)

Am 28.04.21 um 17:11 schrieb Andrey Grodzovsky:
> No point calling amdgpu_fence_wait_empty before stopping the
> SW scheduler otherwise there is always a chance another job sneaked
> in after the wait.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 34d51e962799..fd9282637549 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -533,6 +533,12 @@ void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
>   
>   		if (!ring || !ring->fence_drv.initialized)
>   			continue;
> +
> +		/* Stop any new job submissions from sched before flushing the ring */
> +		/* TODO Handle amdgpu_job_submit_direct and amdgpu_amdkfd_submit_ib */
> +		if (!ring->no_scheduler)
> +			drm_sched_fini(&ring->sched);
> +
>   		r = amdgpu_fence_wait_empty(ring);
>   		if (r) {
>   			/* no need to trigger GPU reset as we are unloading */
> @@ -541,8 +547,7 @@ void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
>   		if (ring->fence_drv.irq_src)
>   			amdgpu_irq_put(adev, ring->fence_drv.irq_src,
>   				       ring->fence_drv.irq_type);
> -		if (!ring->no_scheduler)
> -			drm_sched_fini(&ring->sched);
> +
>   		del_timer_sync(&ring->fence_drv.fallback_timer);
>   	}
>   }

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

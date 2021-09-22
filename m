Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D509D414905
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 14:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600EF6EB8E;
	Wed, 22 Sep 2021 12:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20546EB89;
 Wed, 22 Sep 2021 12:35:40 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id t8so6368796wrq.4;
 Wed, 22 Sep 2021 05:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=f87sW0ORPwcXjpk8u6aqYGpuqJFFb9sc0pMAQxCwZpU=;
 b=ZInwV/R9DQyTIxDMqWBFMlZwQEE5ga/ldKeMSv5XuOp4WBSSGaCjBf7yDc79mT+KLq
 zeajb8rvMgP99Wnvf44hOWlXD9lS8UzNJK6brw1VCggdEGvlVF5sx810TQWHt2IhMJ+Z
 ywDvvJoExjR8TJDd8W92756qgxsAFdvWX95bW0Z916yYUsUzdWDbSxR8Kb24C0X+zSke
 ASaM1JXZ/rIh85VeaYObAlYWDXpVAJ0AdGwf96scovkNSVWhBo/de422K+e6QItNf9jm
 wRM9O6VJNVBqO6A3blVUOgQG6eciIGg2zSmXcngNzzx+WWf7ObihHqp786O5hX1hIoF/
 aAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=f87sW0ORPwcXjpk8u6aqYGpuqJFFb9sc0pMAQxCwZpU=;
 b=au+kqhontb/bY66/qgpdwfwU5I5nuCkGhdkiHGqdb0YB4f0+5TyZXEpwPoPS8yHfqO
 Sdzflx+1OMkGzwZogfPxwdmGj+TCB0UFjm6jiVD/JKLbIgqK88UjxOloPSWWRsFk5PlF
 ArbMKm8sJcRLdVtyo8P6GpIjldLuym46m/rN0Qy0pT4mURVwg1K77jIKICnlBFCPv3xv
 OG84heiTgTr2R7Qsr4jFpRXujHhXhMSGh0uZBrXzgsppDN2FdYPUOit4hU3Enc9qt46Q
 6iBo2RULB878Wb4djPDFXOCVYFPXtFbOa8c4fdOfksWnaItbajDTH1qkxNYG6YDYiiAN
 DMjw==
X-Gm-Message-State: AOAM532bYhcMdjGZzxT/3g+NYK66t3HcnrmOluDnsDKe07LZAdkiFNss
 aovkXwiW6DTcpO6JS86+GGaXlkJfKYQ=
X-Google-Smtp-Source: ABdhPJyAJbHrDcP9vPgpHESqapiZyovUGwjrwnUYG9pvHwvYLIqHQSj3bXm1eJ30JaSCv6An9MvV/w==
X-Received: by 2002:a7b:c947:: with SMTP id i7mr10212667wml.179.1632314139156; 
 Wed, 22 Sep 2021 05:35:39 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea1b5.dip0.t-ipconnect.de.
 [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id j21sm2028606wmj.40.2021.09.22.05.35.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 05:35:38 -0700 (PDT)
Subject: Re: [PATCH] drm/etnaviv: fix another potential dma_resv DAG violation
To: Lucas Stach <l.stach@pengutronix.de>, daniel@ffwll.ch,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210922114148.107356-1-christian.koenig@amd.com>
 <099b027c8a3562c2ebe9c6b4e5cabb4db55b6983.camel@pengutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4fc1ce58-8cc1-85a5-127f-69d0d3f9d8e8@gmail.com>
Date: Wed, 22 Sep 2021 14:35:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <099b027c8a3562c2ebe9c6b4e5cabb4db55b6983.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.09.21 um 14:28 schrieb Lucas Stach:
> Am Mittwoch, dem 22.09.2021 um 13:41 +0200 schrieb Christian König:
>> Setting the exclusive fence without waiting for the shared
>> fences violates the DAG and is illegal.
>>
>> We really need to get away from this ASAP and make the
>> driver interface more bullet prove.
> Uh, what happened to Daniels patch "drm/etnaviv: Don't break exclusive
> fence ordering", which fixed this without totally doing away with the
> no-implicit handling?

I was wondering the same thing. My memory was that Daniel has already 
fixed this, but that still looks totally broken to me.

> I have to admit that I haven't followed up with
> that patch series due to ETOOMUCHOTHERSTUFF, but from a quick glance
> this patch looked better than what you propose here.

This patch here should have the same result as Daniels version, just 
with CC: stable on it, fewer changes lines and not depending on the 
drm_sched_job_await_implicit() change.

Regards,
Christian.

>
> Regards,
> Lucas
>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Cc: <stable@vger.kernel.org>
>> ---
>>   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c | 6 +-----
>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> index 7e17bc2b5df1..4db40e88f67f 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> @@ -185,19 +185,15 @@ static int submit_fence_sync(struct etnaviv_gem_submit *submit)
>>   				return ret;
>>   		}
>>   
>> -		if (submit->flags & ETNA_SUBMIT_NO_IMPLICIT)
>> -			continue;
>> -
>>   		if (bo->flags & ETNA_SUBMIT_BO_WRITE) {
>>   			ret = dma_resv_get_fences(robj, &bo->excl,
>>   						  &bo->nr_shared,
>>   						  &bo->shared);
>>   			if (ret)
>>   				return ret;
>> -		} else {
>> +		} else if (!(submit->flags & ETNA_SUBMIT_NO_IMPLICIT)) {
>>   			bo->excl = dma_fence_get(dma_resv_excl_fence(robj));
>>   		}
>> -
>>   	}
>>   
>>   	return ret;
>


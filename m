Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135D5A20C0C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 15:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79BF510E650;
	Tue, 28 Jan 2025 14:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lc2S7akS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B372310E650
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 14:28:10 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso65316945e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 06:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738074489; x=1738679289; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ahk62Ar8Pu/DVCpXbGNGRvzN3jwVrKohGxX3J3gkK5A=;
 b=lc2S7akSQqYix5eIpeCkJ4tu6Dv0vSUlkOOw9XsQoIbVDyOwj9/CkJYuREzbEZ/fUn
 Njp6ns7YzfzjkOyFBt1XenBO9yqVlfLdl+a7E3nA5o/52KDRrPxMWWF5QVVsxxQ6dLop
 G9/vlKOXtzNjtUGrm8nA7gT/aLIZHwbGrfI2dnabIvl+iVg1PpqJCHv/xCwcfwKKATfN
 ttwuMNNuIhTIDxcNmCWLvpz0kKSzU/O1qb2dzhaEAtdclAmKiXRkJeTs1Bb9mazTNZWh
 aV/5fVHKCQKEQeiF38Sp91M5YWL+JOc5sWFWf4LpY+YFPIsUp/kRHEkx08JA7amnFJNV
 qiTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738074489; x=1738679289;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ahk62Ar8Pu/DVCpXbGNGRvzN3jwVrKohGxX3J3gkK5A=;
 b=NCrC3eeky8DX8XqBBYS2YVjtKVO//ADbUuCAN4oqD2bu6iMXmtWCn+t/RIJxtNnE0x
 N4/krjgz+EHYyyFWraY69GCS0GT3lerbJXjbXRMo26r4RzS3TlSRvyGGM+IM107VwyyV
 w+Mge8xb50mi/N/bU2mZAITnHGSQkJIZB3Iye4jT0RLonPMxeJ9ZPDRCxyvtk6pq28zc
 AuN323aWlqVVoZuI5odgc/CvR6+wXOjfsQnFCCWvrhwmKJ63xjJ2Mx/QEs+tJQS/R4Z/
 9thH0SPZ+62Hjf46PSpqQvbWu5Qp3Ccz0ayplzQ788oRmSAd03yjvsutclc7ZLMpSMYP
 8S0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeAXAfwsYACyDIqn6scf7+4CWMt02jueaVa2C3fBrd7Y4OvYtaoU/Xc4ASYquX7ha4EOuMuZI0KZc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOLl07yGCJiWFgcyjJpmcX3WX6c0DNqr+oNl8RmDXw+wgyQpH/
 Ts415J/ULCVLWigbEcQKJfk/IM+lRpnSW9Uq4rzB3bVnAsmD/4s5
X-Gm-Gg: ASbGnctDJiQuaKhjYJJTu/TdWywBOx4+YryPPx67FA1IbeKwkAGDzcYIE+4Jk/90nDD
 M0Q+Nabpr79xjF+hFuG0eq92Qm4gaNqsaC9NWnQiZV8TGAAVBllbIj5gNj1ijfj+IxAi1UBNsNp
 5ZnFicDvKyFNxwMNCoJzIBuMd0wgJCT3YGQugYZNqH4N/2jymoCB3yI49fMP6v0uceiodlqm7AE
 9l2jHQWUqT1PvqmFmZONTqdEXqJNw5GSe0pOWMTLRypJBt5XwCQoKrYH1x5+A8DNTJMmf2ErMFG
 1L2lx5QmsCvaQWzHmlc0QvifKaWaRiIVmTXzVFaQs9/7YEl1u+Fh9SY=
X-Google-Smtp-Source: AGHT+IGe4Gq0fWnPhR3Cs+lOYdtUwcTbBTKsiXhgWED++HD+8j7b1fZPRSoYalZO9TSPtYmFAQ2nWg==
X-Received: by 2002:a5d:5887:0:b0:38b:da31:3e3c with SMTP id
 ffacd0b85a97d-38bf56635c9mr38247686f8f.20.1738074488757; 
 Tue, 28 Jan 2025 06:28:08 -0800 (PST)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bbd93sm14320932f8f.76.2025.01.28.06.28.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 06:28:08 -0800 (PST)
Message-ID: <af78559c-057a-4d70-ab05-fcc943dce2e6@gmail.com>
Date: Tue, 28 Jan 2025 15:28:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix timeout handling in dma_resv_wait_timeout
To: Lucas Stach <l.stach@pengutronix.de>, marek.olsak@amd.com,
 sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20250128100833.8973-1-christian.koenig@amd.com>
 <6681c5a71cadaee237dc4bf47e12ffd0bfdd89b0.camel@pengutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <6681c5a71cadaee237dc4bf47e12ffd0bfdd89b0.camel@pengutronix.de>
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

Am 28.01.25 um 11:48 schrieb Lucas Stach:
> Hi Christian,
>
> Am Dienstag, dem 28.01.2025 um 11:08 +0100 schrieb Christian König:
>> Even the kerneldoc says that with a zero timeout the function should not
>> wait for anything, but still return 1 to indicate that the fences are
>> signaled now.
>>
>> Unfortunately that isn't what was implemented, instead of only returning
>> 1 we also waited for at least one jiffies.
>>
>> Fix that by adjusting the handling to what the function is actually
>> documented to do.
>>
>> Reported-by: Marek Olšák <marek.olsak@amd.com>
>> Reported-by: Lucas Stach <l.stach@pengutronix.de>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Cc: <stable@vger.kernel.org>
>> ---
>>   drivers/dma-buf/dma-resv.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index 5f8d010516f0..ae92d9d2394d 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -684,11 +684,12 @@ long dma_resv_wait_timeout(struct dma_resv *obj, enum dma_resv_usage usage,
>>   	dma_resv_iter_begin(&cursor, obj, usage);
>>   	dma_resv_for_each_fence_unlocked(&cursor, fence) {
>>   
>> -		ret = dma_fence_wait_timeout(fence, intr, ret);
>> -		if (ret <= 0) {
>> -			dma_resv_iter_end(&cursor);
>> -			return ret;
>> -		}
>> +		ret = dma_fence_wait_timeout(fence, intr, timeout);
>> +		if (ret <= 0)
>> +			break;
>> +
>> +		/* Even for zero timeout the return value is 1 */
>> +		timeout = min(timeout, ret);
> This min construct and the comment confused me a bit at first. I think
> it would be easier to read as
>
> /* With a zero timeout dma_fence_wait_timeout makes up a
>   * positive return value for already signaled fences.
>   */
> if (timeout)
> 	timeout = ret;

Good point, going to change that.

>
> Also please change the initialization of ret on top of the function to
> ret = 1 so it has the right value when no fences are present. Now that
> you use the timeout variable for the fence wait, there is no point in
> initializing ret to the timeout.

When no fences are present returning 1 would be incorrect if the timeout 
value was non zero.

Only when the timeout value is zero we should return 1 to indicate that 
there is nothing to wait for.

Regards,
Christian.

>
> Regards,
> Lucas
>
>>   	}
>>   	dma_resv_iter_end(&cursor);
>>   


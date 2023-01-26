Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E5467D850
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 23:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CB810E05D;
	Thu, 26 Jan 2023 22:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA1210E05D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 22:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674771953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HklvufQZfBWJQ24G/LaO8a1AhEjWrY545//BpSv4N9I=;
 b=Cyqd9fCuvFGCX6Mk9LoNaOuPioBK5Ryqpvy1oxxPJGSC/a6UjSRJf2Z1kiNk+tKGpjVjKb
 ej9TQPX4r0RJq1858mUyEuKvaftX+bK0fUVHBDJI9Y2NffHFjimWWvWwOU0f5YwFveX34d
 pPF4k8kiw6FdUtH5pCmfWqUVbh5L+Ik=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-_VGzU7HQMl638hOUhDgJfQ-1; Thu, 26 Jan 2023 17:25:53 -0500
X-MC-Unique: _VGzU7HQMl638hOUhDgJfQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 ds1-20020a170907724100b008775bfcef62so2100594ejc.9
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 14:25:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HklvufQZfBWJQ24G/LaO8a1AhEjWrY545//BpSv4N9I=;
 b=2nudEurmnJc9G9jWFYF+Fn8Pr6VS2CRtf1ouxDZRy8Q1WVXqmw0+sO9aEP85sEaoFA
 LqCmdbtN4jwXTE8dvrDrPI8chhv/eNhdspgW42UtMF5Je3GVTS8Yv7xT4ey/VN12rAsu
 Izwj/PhrBjNaUuO3L0sRxIc3A40cRi9HDZpkGHxz4YFTpKr4UNxmsns+TB3waqIPOTjn
 luzD56paiJFFH0evv05TtiEHv7DroP+PeiFjkJTAZGcAAVjtsgtWzCAfRtXvyigZdDsS
 VYnXKovmIwNltPx5MS+QIJ3HjB4ovUM3yGTg9Tk87XjyEfe4MZqDqP+gd/UBiyEMPllG
 uznw==
X-Gm-Message-State: AFqh2kqq7poy6nFFk4OuIxCLwsV3ADTWFEBvr2iSmIGT2rac+r5DchbH
 2UGbE6ves4GSwyTD969fXNDFV0wulpiMoglEx/UbXW3SRFaOQ2KarVDWzQIBjMRZvpqWf/wFjBF
 eoRbFrXULVXaVK08vzQTF0bttNIez
X-Received: by 2002:a17:907:8999:b0:877:83ea:2bfc with SMTP id
 rr25-20020a170907899900b0087783ea2bfcmr29298597ejc.39.1674771951250; 
 Thu, 26 Jan 2023 14:25:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu8weu5499CBW7EQXZLSCEzQQ9uDVPguSl7RkTew9/qlc9qQ7QRBuzQoH7Teg0s42R+asqjQg==
X-Received: by 2002:a17:907:8999:b0:877:83ea:2bfc with SMTP id
 rr25-20020a170907899900b0087783ea2bfcmr29298582ejc.39.1674771951068; 
 Thu, 26 Jan 2023 14:25:51 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:de78:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de78:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a1709062c0e00b007c0a7286ac8sm1193875ejh.69.2023.01.26.14.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 14:25:50 -0800 (PST)
Message-ID: <5caf64b6-0e3c-4c24-4fe8-9ed2caf43822@redhat.com>
Date: Thu, 26 Jan 2023 23:25:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] dma-buf: actually set signaling bit for private sub fences
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Arvind.Yadav@amd.com, sumit.semwal@linaro.org, gustavo@padovan.org
References: <20230126002844.339593-1-dakr@redhat.com>
 <4b13c48e-1677-3947-42e5-5ba241bcb96a@amd.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <4b13c48e-1677-3947-42e5-5ba241bcb96a@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/26/23 07:58, Christian König wrote:
> Am 26.01.23 um 01:28 schrieb Danilo Krummrich:
>> In dma_fence_allocate_private_stub() set the signaling bit of the newly
>> allocated private stub fence rather than the signaling bit of the
>> shared dma_fence_stub.
>>
>> Fixes: c85d00d4fd8b ("dma-buf: set signaling bit for the stub fence")
>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> 
> Good catch, Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Should I push it upstream as well or do you have commit access?

Thanks, I can push it to drm-misc-next.

> 
>> ---
>>   drivers/dma-buf/dma-fence.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index 406b4e26f538..0de0482cd36e 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -167,7 +167,7 @@ struct dma_fence 
>> *dma_fence_allocate_private_stub(void)
>>                  0, 0);
>>       set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>> -        &dma_fence_stub.flags);
>> +        &fence->flags);
>>       dma_fence_signal(fence);
> 


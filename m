Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3914F2647
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 09:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91FB10EBE9;
	Tue,  5 Apr 2022 07:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0B210EB45
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 07:58:28 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id h4so17942978wrc.13
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 00:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1qcusiUbA7ds1kG6DmipQDwo6YSSKYlips+z+uvLrbs=;
 b=MDD7LvSrtHpLmZI0kgcqt/eRAPXuNrKGgYuO7bI0RxavL4uRoJcYnIPNmfGzS+6orh
 eQA6Yb27phoHW6VjgKS9yY0CrFhtPhofp+JO8UMYtVAJaHDk/MRYsTe6H46reYMIKTrm
 QR++GuMQQhcW2r08+M5mYoP2/hmg0okYPiJlIhAavAhwaidnjmlZp+ukrPUzEAuRMrvq
 NaevLb3OeN2IzrMerZOllhISZF/HpTHpvIMNrXpeR0YmdDBxEeJeNJP+eFYFWbeSNrEG
 zDST3IXJa1qNa6SS0Z2FL0dRVG/YleKaP97xhuREm6gOaomFnhy9V8E5H9t10ea24tRQ
 Zw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1qcusiUbA7ds1kG6DmipQDwo6YSSKYlips+z+uvLrbs=;
 b=SEVPVc9DmTF7HPXpiGUotjMvK2bpgQ32X/+q8sQSKM0Um9iZCkgCj5idRRiaCMdkOW
 8y709oVI8AydZdmiE9hwIrI5V0NFfc+zoAMlwx0iC21jqC/wamjn4y4Z6sFEwUOsfasg
 CZKSbKlHzzcCIC3F8grABkSEmRVASjM1y9b8scozZqM+PH6FW5VXSepsjGUJT9Hfawb1
 uWyQOyJMo+w890qN+acwymTqpVeJFg6fHbOvwi7a4BRz8UDuFavyj6ET0zg6XEQHHgFv
 qCY7CmH3xZlCvt2RVZfM5Ch3r+64vrNK7rmBwVbf7NfjZ9wAm6N9hxWYA0RFlU6aeqaf
 rPGA==
X-Gm-Message-State: AOAM5300WM7T5/jU6uUwg5EFrZMDD+RumbvgO172N2ZoCN1K0igxUeks
 t5urc/l78gWEqEKix4M7Mas=
X-Google-Smtp-Source: ABdhPJwe4pbmZ1ucVcUaeCBWA/XAifQs/wqM9mifRV+swS5VtgU06wpNpiooc68Bta6+1rLAjXtGkw==
X-Received: by 2002:adf:8b1c:0:b0:206:d11:7b77 with SMTP id
 n28-20020adf8b1c000000b002060d117b77mr1654531wra.326.1649145507043; 
 Tue, 05 Apr 2022 00:58:27 -0700 (PDT)
Received: from [192.168.178.21] (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 s17-20020adfdb11000000b001f02d5fea43sm11628780wri.98.2022.04.05.00.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Apr 2022 00:58:26 -0700 (PDT)
Message-ID: <aad4064e-bedf-b738-4a36-485d217c5b2c@gmail.com>
Date: Tue, 5 Apr 2022 09:58:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 10/23] dma-buf: finally make dma_resv_excl_fence private v2
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-10-christian.koenig@amd.com>
 <YjsidyNMKqhsNY0j@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <YjsidyNMKqhsNY0j@phenom.ffwll.local>
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
Cc: daniel.vetter@ffwll.ch,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.03.22 um 14:36 schrieb Daniel Vetter:
> On Mon, Mar 21, 2022 at 02:58:43PM +0100, Christian König wrote:
>> Drivers should never touch this directly.
>>
>> v2: fix rebase clash
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> I guess as soon as we have the rdma ack you can land up to this patch?

It also needed the nouveau and vmwgfx acks, but I just pushed it. Finally :)

Christian.

> -Daniel
>
>> ---
>>   drivers/dma-buf/dma-resv.c |  6 ++++++
>>   include/linux/dma-resv.h   | 17 -----------------
>>   2 files changed, 6 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
>> index c09fd8da0c85..1c9af97fe904 100644
>> --- a/drivers/dma-buf/dma-resv.c
>> +++ b/drivers/dma-buf/dma-resv.c
>> @@ -140,6 +140,12 @@ void dma_resv_fini(struct dma_resv *obj)
>>   }
>>   EXPORT_SYMBOL(dma_resv_fini);
>>   
>> +static inline struct dma_fence *
>> +dma_resv_excl_fence(struct dma_resv *obj)
>> +{
>> +       return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
>> +}
>> +
>>   static inline struct dma_resv_list *dma_resv_shared_list(struct dma_resv *obj)
>>   {
>>   	return rcu_dereference_check(obj->fence, dma_resv_held(obj));
>> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
>> index 08512c1e215d..20e13f36710a 100644
>> --- a/include/linux/dma-resv.h
>> +++ b/include/linux/dma-resv.h
>> @@ -423,23 +423,6 @@ static inline void dma_resv_unlock(struct dma_resv *obj)
>>   	ww_mutex_unlock(&obj->lock);
>>   }
>>   
>> -/**
>> - * dma_resv_excl_fence - return the object's exclusive fence
>> - * @obj: the reservation object
>> - *
>> - * Returns the exclusive fence (if any). Caller must either hold the objects
>> - * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
>> - * or one of the variants of each
>> - *
>> - * RETURNS
>> - * The exclusive fence or NULL
>> - */
>> -static inline struct dma_fence *
>> -dma_resv_excl_fence(struct dma_resv *obj)
>> -{
>> -	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
>> -}
>> -
>>   void dma_resv_init(struct dma_resv *obj);
>>   void dma_resv_fini(struct dma_resv *obj);
>>   int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
>> -- 
>> 2.25.1
>>


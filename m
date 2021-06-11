Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A6A3A3FC5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 12:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338206EE5E;
	Fri, 11 Jun 2021 10:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57DCC6E02B;
 Fri, 11 Jun 2021 10:05:01 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id d184so7797007wmd.0;
 Fri, 11 Jun 2021 03:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=5xVxhVrGpeYgPINr7CYadkVeo4fwTn98UNDLrVw0lLA=;
 b=Y6YVR596mrBeh0jqyZNxmBsD3ZRzCOpAeNsWY8Ywo8p6Q8d78laE5dMl8idiebpli3
 omITRKl4PuOkBOuqLeMLLfW5iEWE9QEV4l+zYnYA19nwq2dz5svJ7BE5ulfzqP+5J+0x
 byaR0LAlN/ZXzbxmbQ11TXQ5Cfx3H7WWOcf5w1/xZrcAxCgT7Kj6scAt/oooof8/U1bR
 OCaW0+D0SZ58eQj6Q6oVGHqA1Oyg+c965ZmQz9NIETv1uKSkhdxx9ajK50X+4wmWp0EQ
 kfk6/1LBKzmh7Z6lwsVRzVfg+h2BsfaG/U7crYOYIEzPVmmB+sPGTLz7AcqTmDtjnysl
 FeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5xVxhVrGpeYgPINr7CYadkVeo4fwTn98UNDLrVw0lLA=;
 b=aFpU0UrKE8Ck7QtsScQOs/9Zro3agDCiAB7a5L2JIDKZQol7EXw5ODBzFtLL14wyGL
 ITVRp5b5iWi2BbXehbc67ujBp/u4OEF6d9Io5W6DxWmCppWtguj7MYobKF/0B6OqOCnl
 zwwCcUpo7rhQPdwS6EOQxtyZkRmIhj9YwKv1EA8X+KW4+YLUFLHuxOiF5wWiTSz8YGZl
 hNZksUc8CDkn3s1qtNTfCtiizZ1QwxGMPHf0uT+Za7LXf9tV9h+nFYNH8WfeARnv4wMV
 DTQa1fM/RIafa+7wxikirxHI3R3fTx/xGkzPMI6AdkeQJOrGHGpNuCC/sariXlKagCSu
 pRdw==
X-Gm-Message-State: AOAM531UTJFOLZZ7rbSuT35szuxxF4p0DSLeNWhWOyTRsPC1dwzZnWuW
 rSlUsVSqaPB+34GbDQ9m9MAjzTh5/Oc=
X-Google-Smtp-Source: ABdhPJzJc5/S5B1hzsNZ2W9NdfCfL7C75qTUMj95HYrgYWvQFdeAPHUJFvkU4HADRHHnU0CZ7LTd6Q==
X-Received: by 2002:a05:600c:1c28:: with SMTP id
 j40mr19509365wms.102.1623405900066; 
 Fri, 11 Jun 2021 03:05:00 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:108e:ba37:cb49:9c3?
 ([2a02:908:1252:fb60:108e:ba37:cb49:9c3])
 by smtp.gmail.com with ESMTPSA id 2sm6345120wrz.87.2021.06.11.03.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 03:04:59 -0700 (PDT)
Subject: Re: [PATCH 3/7] dma-buf: add dma_fence_chain_alloc/free self tests
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210610091800.1833-1-christian.koenig@amd.com>
 <20210610091800.1833-4-christian.koenig@amd.com>
 <YMMXlF5A7uB0sORs@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e1f4954e-2c7b-49ab-5782-f06d81a6304a@gmail.com>
Date: Fri, 11 Jun 2021 12:04:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMMXlF5A7uB0sORs@phenom.ffwll.local>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.06.21 um 09:58 schrieb Daniel Vetter:
> On Thu, Jun 10, 2021 at 11:17:56AM +0200, Christian König wrote:
>> Exercise the newly added functions.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
> I have honestly no idea what this checks. Spawning a few threads to
> validate kmalloc/kfree feels a bit silly. Now testing whether we correctly
> rcu-delay the freeing here would make some sense, but even that feels a
> bit silly.
>
> I guess if you want this explain with comments what it does and why?

This was soley to figure out if the garbage collection is working 
properly and how much overhead it generates.

No actual need to commit it.

Christian.

> -Daniel
>
>
>> ---
>>   drivers/dma-buf/st-dma-fence-chain.c | 48 ++++++++++++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>
>> diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
>> index 8ce1ea59d31b..855c129c6093 100644
>> --- a/drivers/dma-buf/st-dma-fence-chain.c
>> +++ b/drivers/dma-buf/st-dma-fence-chain.c
>> @@ -95,6 +95,53 @@ static int sanitycheck(void *arg)
>>   	return err;
>>   }
>>   
>> +static int __alloc_free(void *arg)
>> +{
>> +	atomic_t *counter = arg;
>> +	int i, j;
>> +
>> +	for (i = 0; i < 1024; ++i) {
>> +		struct dma_fence_chain *chains[64];
>> +
>> +		for (j = 0; j < ARRAY_SIZE(chains); ++j)
>> +			chains[j] = dma_fence_chain_alloc();
>> +
>> +		for (j = 0; j < ARRAY_SIZE(chains); ++j)
>> +			dma_fence_chain_free(chains[j]);
>> +
>> +		atomic_add(ARRAY_SIZE(chains), counter);
>> +	}
>> +	return 0;
>> +}
>> +
>> +static int alloc_free(void *arg)
>> +{
>> +	struct task_struct *threads[8];
>> +	atomic_t counter = ATOMIC_INIT(0);
>> +	int i, err = 0;
>> +
>> +	for (i = 0; i < ARRAY_SIZE(threads); i++) {
>> +		threads[i] = kthread_run(__alloc_free, &counter, "dmabuf/%d",
>> +					 i);
>> +		if (IS_ERR(threads[i])) {
>> +			err = PTR_ERR(threads[i]);
>> +			break;
>> +		}
>> +	}
>> +
>> +	while (i--) {
>> +		int ret;
>> +
>> +		ret = kthread_stop(threads[i]);
>> +		if (ret && !err)
>> +			err = ret;
>> +	}
>> +
>> +	pr_info("Completed %u cycles\n", atomic_read(&counter));
>> +
>> +	return err;
>> +}
>> +
>>   struct fence_chains {
>>   	unsigned int chain_length;
>>   	struct dma_fence **fences;
>> @@ -677,6 +724,7 @@ int dma_fence_chain(void)
>>   {
>>   	static const struct subtest tests[] = {
>>   		SUBTEST(sanitycheck),
>> +		SUBTEST(alloc_free),
>>   		SUBTEST(find_seqno),
>>   		SUBTEST(find_signaled),
>>   		SUBTEST(find_out_of_order),
>> -- 
>> 2.25.1
>>


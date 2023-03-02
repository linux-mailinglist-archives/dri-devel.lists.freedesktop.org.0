Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 755656A7C0C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 08:49:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1C110E38C;
	Thu,  2 Mar 2023 07:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F8110E387;
 Thu,  2 Mar 2023 07:49:43 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id f13so64047576edz.6;
 Wed, 01 Mar 2023 23:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7QBsnfhXDnf5DwaADeRQiObAhC0bZzC8CDE/JxEC7hI=;
 b=kbanyc8H/TMsPfIk0hvY4HI+w29HltA8kRTqA7E5kmHmHDW9wfsV8xW6K4NiUV3AMh
 ner2r+nzKqp07T2SZlWoWfm/OpGhS2DoqoxOSHURIGkwwDSv5lG6JpSIYlDALwwfE12G
 o07CGNHD65eM+WBet6Mjcc+IxbIcLHibtNSNDFNZ0Q9e3JHyB0E3Ww3hBK2TQBI7PrXc
 YlfrJadO4dXaGs786jnpG3NjGmf6W2A4mdZE53EutOSR3f5lF7iGxSEaK0EEqd0rp1BQ
 rd7teM47f/JmUqElGahvAvtYGmxZdwaU7kqGgQRWBZANQDAuPOXgkjSxfrpqp0e/iUPg
 8NaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7QBsnfhXDnf5DwaADeRQiObAhC0bZzC8CDE/JxEC7hI=;
 b=S4vaBH9w9LVFHfgOEZjpYwXajwbbj9YL0ut9PfCT35L9nx6gya4CqgmhP67ID7708J
 FKqBvzS1HnmxyGHwBkKix8mPh7xrzhD5rb5R+MfVYG3qao/VtooFz+f5oX/GSu2hBSAm
 MGw6ixFkzW5+C2rnZOcR67DdhbbmWJ/6v1QGOTdk1X4wh94NcfMAZ6cnEX23jWQtIfOr
 pleI5hlO8pAO5glPaNliJZDQMyuOdOORQS0SviXbHvfcJYEjIbUXpIQDv28AuzRK5Ytr
 cAR0vpwmbxIYhe4uB2rHHM+CXcLDcCgw5i1BbeiRQNLSooQtupQ6AzMPLv7lhHXvqse5
 Gd2w==
X-Gm-Message-State: AO0yUKWqw9f8ygOlYIIqK6ZTdas+gzM4y5BBREsPiREnLmq6kjSHYG1F
 9O0igJbVURvb04ZEcduWKB0=
X-Google-Smtp-Source: AK7set+M9hIWfEZeov2dBlDpxyS+DV1YF5DEa2FFWWZpU0/0LuyG/Lp+Or/v+56Ha2VG4e6fe6gFvQ==
X-Received: by 2002:a17:906:9b2:b0:8b1:3a18:9daf with SMTP id
 q18-20020a17090609b200b008b13a189dafmr9337318eje.74.1677743381674; 
 Wed, 01 Mar 2023 23:49:41 -0800 (PST)
Received: from [192.168.178.21] (p5b0ea2e7.dip0.t-ipconnect.de.
 [91.14.162.231]) by smtp.gmail.com with ESMTPSA id
 v8-20020a50c408000000b004bd1fe2cc02sm75416edf.16.2023.03.01.23.49.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Mar 2023 23:49:41 -0800 (PST)
Message-ID: <656afdb6-8326-0fea-e965-39c8051eff50@gmail.com>
Date: Thu, 2 Mar 2023 08:49:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/9] drm: execution context for GEM buffers v3
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>
References: <20230228083406.1720795-1-christian.koenig@amd.com>
 <20230228083406.1720795-2-christian.koenig@amd.com>
 <873a0702-56be-6277-c86f-8bb73a4805fd@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <873a0702-56be-6277-c86f-8bb73a4805fd@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 arunpravin.paneerselvam@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.02.23 um 20:13 schrieb Danilo Krummrich:
> [SNIP]
>> +    if (exec->prelocked) {
>> +        dma_resv_unlock(exec->prelocked->resv);
>> +        drm_gem_object_put(exec->prelocked);
>> +        exec->prelocked = NULL;
>> +    }
>
> Let's say we try to lock 3 objects A, B and C in chronological order 
> and in the first "drm_exec_cleanup() iteration" C is contended. 
> Firstly, we lock C in the next iteration. If now A or B is contended, 
> we never set exec->prelocked to NULL in drm_exec_prepare_obj(), since 
> we did not yet reach C.
>
> Hence, this causes a double unlock, since the prelocked object is also 
> unlocked in the above loop.
>
> Maybe I miss a detail, but to me it looks like setting exec->prelocked 
> to NULL and dropping the reference should be enough.

Ah, yes of course. That wasn't correct and my test cases didn't covered it.

Going to fix this and all the comments you pointed out and update the 
test cases, should be done by next week.

Thanks,
Christian.


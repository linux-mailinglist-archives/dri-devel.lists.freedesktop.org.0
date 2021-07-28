Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9273D8CC0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 13:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB406E98F;
	Wed, 28 Jul 2021 11:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7593A6E98F;
 Wed, 28 Jul 2021 11:29:03 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id c16so2047217wrp.13;
 Wed, 28 Jul 2021 04:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=VI1b/7Zio0QbTHVDmC7OIx9Iv7sUZ3kXOO83Nnb1/lI=;
 b=MOA/VOEXpidjw9AYaF3IXPbM6aik0n/2pDu3qGV734GI/MKZej41DpACQshSitpBHp
 LQ3YHoaO3xcBZzpcsNjShILGXUpmKS5ZgVAmgwqvbopYjCV6Oe7kqDCKvQGMz1GhH8FV
 iSxZcRNrR7p1TZ5rVO3i3rez8Tf1bgPKxGIL7d8oWchGGL320KpKfOsAda6x+TjTz5O4
 4bCPnPYjchzaaC50jNDk1qaP8p8alaDlxruTYCJqyH5+MzTNO6GiD6mTiiIIejBu2nm4
 +Vr4pubkhVWp5DZvj/DSgx8P3RUgT6oeNuzxq4zWxIwzW6zjdND1aBxfxo7GqdOlIOLr
 7nyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=VI1b/7Zio0QbTHVDmC7OIx9Iv7sUZ3kXOO83Nnb1/lI=;
 b=WsTRh+zsSrWEaye7sRJ8ij4HB83bEzmA0n/+t1R5mg5m6An4hIWlrizzgd2XBgcimp
 6A6GHErQVzDAgD9xpdCdjlX0K4a7gwqpD1lyBo+uLTYnclcjFMnSyRgl+HzqWZ/UosYu
 SgqoEacQAFFI6fKeWcGnznR6pH+MIp0W6Lltlk7Cgd4n0MnMTuILECG0Y/wi/uKl6QeF
 q0EPTNDAntU6rjAqVqKkcoHZ615u6AYoGJ5C9XQu7NZm9FgWU/Tyzs2UYl81DUnPm30D
 +pYsVzjKMQqRbY7cleq/rtuVQzToU14avK8MKZEnozfPcn+aZWx32GONTBvVK6Ma51rk
 ZGgg==
X-Gm-Message-State: AOAM530oOqpYwWCc8FpL1ShyMAH5NWAfH5Lz9ygAtiPWkK9CpBUIf6v/
 bEFovncUGutYs/roqAqk1C8=
X-Google-Smtp-Source: ABdhPJwO3jBbz+R3AJiHF0WQfeY+oF3uwMVgNB4ghF4GPoF75Jaw2yWir3ze6NE+b9AvVpMjJ+cXcg==
X-Received: by 2002:a5d:61c8:: with SMTP id q8mr18198915wrv.151.1627471741909; 
 Wed, 28 Jul 2021 04:29:01 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:6a5d:b580:2891:cbac?
 ([2a02:908:1252:fb60:6a5d:b580:2891:cbac])
 by smtp.gmail.com with ESMTPSA id l2sm4888332wru.67.2021.07.28.04.29.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 04:29:01 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH v4 03/18] drm/sched: Add dependency
 tracking
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Lucas Stach <l.stach@pengutronix.de>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
 <20210712175352.802687-4-daniel.vetter@ffwll.ch>
 <CAKMK7uG8bMuDP=7-z9nZ38WgMdbeUk96eNx3buTCiaKatYOJxw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <2bcfba05-b7d5-1bd9-d74a-b9aac1147e20@gmail.com>
Date: Wed, 28 Jul 2021 13:28:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uG8bMuDP=7-z9nZ38WgMdbeUk96eNx3buTCiaKatYOJxw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Jack Zhang <Jack.Zhang1@amd.com>, David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Nirmoy Das <nirmoy.aiemd@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.07.21 um 13:09 schrieb Daniel Vetter:
> Adding a few more people to this bikeshed.
>
> On Mon, Jul 12, 2021 at 10:02 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
>> @@ -349,6 +367,13 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>                         struct drm_sched_entity *entity,
>>                         void *owner);
>>   void drm_sched_job_arm(struct drm_sched_job *job);
>> +int drm_sched_job_await_fence(struct drm_sched_job *job,
>> +                             struct dma_fence *fence);
>> +int drm_sched_job_await_implicit(struct drm_sched_job *job,
>> +                                struct drm_gem_object *obj,
>> +                                bool write);
>> +
>> +
> I'm still waiting on the paint delivery for these two functions so I
> can finish this shed.

Well I wouldn't call that bike shedding, good names are important.

Just imaging we would have called the exclusive-fence write-fence instead.

What speaks against calling them add_dependency() and 
_add_implicit_depencencies() ?

Regards,
Christian.

>
> Thanks, Daniel
>
>>   void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>>                                      struct drm_gpu_scheduler **sched_list,
>>                                      unsigned int num_sched_list);
>> --
>> 2.32.0
>>
>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CA3388D53
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 13:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22816ED87;
	Wed, 19 May 2021 11:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B966ED85;
 Wed, 19 May 2021 11:56:23 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g7so2850460edm.4;
 Wed, 19 May 2021 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=kMwtQn6dV3yt3Ot507gI7+kLTeD78TGfI26lLWSJ/c4=;
 b=OPRSudK29E1xqPKA4nzwRHZmiy8tPSCdaTH2oQIa4jgyGW7GROLeGAWFha4fTXBRQv
 f12rebmAxnRqfoav2+mPoI2oJfxwPqOtlvuaSm/wYvzWe30STVRwMb0/8Hl34cv8QlLl
 svuSp4yMqsuAUL1g/eYEe0QbKNERq5P4Sw8r1PNSB0Iu2y/Cc5aeEIKZd/YmPr8xXd7Z
 U2t9GiiVk2Fj5wQYMygbAlw4V7qp+pCShHnx1E52JLoJI+z9I/eVwvXFzwMfbutGOAUV
 HiUjDEaa61Yx+s2T/hcg1qWK0QOFbkMSbC068iPmFLJ7gG+BndP1OU42pGBILTTxe2QN
 jvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=kMwtQn6dV3yt3Ot507gI7+kLTeD78TGfI26lLWSJ/c4=;
 b=IVfgdkIQDAX6Sqp50byyVfT81I8Zz6G9lsvIHT7nkqq53a/Qd/manGu4cIu3xACzbc
 WFf+IyreCYMeXgSrqFFfTj+7J4WJSOOuS7Op2nhlOWQeWorha7dKNw0QMzkWqegLtCh/
 LaCm1fQpuIiylMx65vV2WroJDBVfmr1/OY4+tN2nB5SfLlQJL8MNXKZCVpfktHTQr4tW
 3DjkWuOTyhWc3OyQU2VcXxkx23XTgIRI1Zmvk780dZtWHWpz+C66cxF+zwFVqj+bOePE
 D00YMk6Y9Y19N+SurD5/ZSdIw2CYIxPooP2F4WVN0gCop6XQe3mNXGaa1+rFmi+m7Gx3
 29Mw==
X-Gm-Message-State: AOAM533wlA3jyhkq7O11Ugp8mRC7dUBZN74Nm6aPtjPepm8mHlBLdclU
 F6/Fq3mkhUSEoDFbpaD/VjI=
X-Google-Smtp-Source: ABdhPJwtcTnsX9qzeGwPKZ/RMedIxGukbaLl5MGcU5rIZW83uBy37Pu5ENlyzkncBPUylzWbAksKhg==
X-Received: by 2002:aa7:de8b:: with SMTP id j11mr14010358edv.363.1621425382249; 
 Wed, 19 May 2021 04:56:22 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8e28:1d3:41f3:e15a?
 ([2a02:908:1252:fb60:8e28:1d3:41f3:e15a])
 by smtp.gmail.com with ESMTPSA id u11sm15608540edr.13.2021.05.19.04.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 04:56:21 -0700 (PDT)
Subject: Re: [PATCH v7 13/16] drm/scheduler: Fix hang when sched_entity
 released
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
 <20210512142648.666476-14-andrey.grodzovsky@amd.com>
 <9e1270bf-ab62-5d76-b1de-e6cd49dc4841@amd.com>
 <f0c5dea7-af35-9ea5-028e-6286e57a469a@amd.com>
 <34d4e4a8-c577-dfe6-3190-28a5c63a2d23@amd.com>
 <da1f9706-d918-cff8-2807-25da0c01fcde@amd.com>
 <8228ea6b-4faf-bb7e-aaf4-8949932e869a@amd.com>
 <ec157a35-85fb-11e5-226a-c25d699102c6@amd.com>
 <53f281cc-e4c0-ea5d-9415-4413c85a6a16@amd.com>
 <0b49fc7b-ca0b-58c4-3f76-c4a5fab97bdc@amd.com>
 <31febf08-e9c9-77fa-932d-a50505866ec4@amd.com>
 <cd6bbe33-cbc5-43cb-80f7-1cb82a81e65d@amd.com>
 <77efa177-f313-5f1e-e273-6672ed46a90a@gmail.com>
 <4a9af53a-564d-62ae-25e1-06ca4129857f@amd.com>
 <1622338a-d95a-fe13-e4a4-c99cb4a31f6c@amd.com>
 <bc94fbc3-8e02-c860-fc58-6301219b84e5@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <fa81de6a-e272-66cf-61d8-5bb2d0ebcb03@gmail.com>
Date: Wed, 19 May 2021 13:56:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bc94fbc3-8e02-c860-fc58-6301219b84e5@amd.com>
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.05.21 um 13:51 schrieb Andrey Grodzovsky:
>
>
> On 2021-05-19 7:46 a.m., Christian König wrote:
>> Am 19.05.21 um 13:03 schrieb Andrey Grodzovsky:
>>>
>>>
>>> On 2021-05-19 6:57 a.m., Christian König wrote:
>>>> Am 18.05.21 um 20:48 schrieb Andrey Grodzovsky:
>>>>> [SNIP]
>>>>>>>
>>>>>>> Would this be the right way to do it ?
>>>>>>
>>>>>> Yes, it is at least a start. Question is if we can wait blocking 
>>>>>> here or not.
>>>>>>
>>>>>> We install a callback a bit lower to avoid blocking, so I'm 
>>>>>> pretty sure that won't work as expected.
>>>>>>
>>>>>> Christian.
>>>>>
>>>>> I can't see why this would create problems, as long as the 
>>>>> dependencies
>>>>> complete or force competed if they are from same device 
>>>>> (extracted) but
>>>>> on a different ring then looks to me it should work. I will give it
>>>>> a try.
>>>>
>>>> Ok, but please also test the case for a killed process.
>>>>
>>>> Christian.
>>>
>>> You mean something like run glxgears and then simply
>>> terminate it ? Because I done that. Or something more ?
>>
>> Well glxgears is a bit to lightweight for that.
>>
>> You need at least some test which is limited by the rendering pipeline.
>>
>> Christian.
>
> You mean something that fill the entity queue faster then sched thread
> empties it so when we kill the process we actually need to explicitly go
> through remaining jobs termination ? I done that too by inserting
> artificial delay in drm_sched_main.

Yeah, something like that.

Ok in that case I would say that this should work then.

Christian.

>
> Andrey
>
>>
>>>
>>> Andrey
>>>
>>>
>>>>
>>>>>
>>>>> Andrey
>>>>
>>>> _______________________________________________
>>>> amd-gfx mailing list
>>>> amd-gfx@lists.freedesktop.org
>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Candrey.grodzovsky%40amd.com%7Cce1252e55fae4338710d08d91ab4de01%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637570186393107071%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=vGqxY5sxpEIiQGFBNn2PWkKqVjviM29r34Yjv0wujf4%3D&amp;reserved=0 
>>>>
>>


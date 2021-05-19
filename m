Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F15388C2F
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 12:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448FC6ED0F;
	Wed, 19 May 2021 10:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A726ED0B;
 Wed, 19 May 2021 10:57:14 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id n2so19311268ejy.7;
 Wed, 19 May 2021 03:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=eIfk0EYHcUWSLcvMPAirbEiPk6baNKVTiRgoiVmFRVQ=;
 b=sEREbwW6YA7K89gV4VdyhKBYItBL1dOXIUIpz6vkHYFaX579lrecFp4BlVvi4bLDV2
 7mmDvwGebhf89186JpwcGkqyXiAJ2M211zM5uwf0YaTBnLC/+Z/MOfODzLC+wwE8zC/N
 Bh7jLqfIMWLuYvonHfsRPYtJby1hoc3APTq6BrjlcEMikEaueNp8RW+xHAleSETAJTSV
 o2PRo/svgwJZzHBC9/TCiBk/GON7VcGpAPMlpf7YvHb9OsD2R9HIqiXuZh6jMa5JcYe2
 ZESHC6zwqPHrU1JqqaIzvM5gXN7rt7ActRQ82pfTrEcgwmk/QsAtBlcai9GPXZB8MC3H
 HY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=eIfk0EYHcUWSLcvMPAirbEiPk6baNKVTiRgoiVmFRVQ=;
 b=Z5cmJWLMR6CK0qW2sQeBhzIz3TtEqu+e7DKMzOE7hE5en4wY/Sq4CoDntSiOGm7zwA
 0GbT1gDhrWxmY7u1IntXxYFwAzVNO2GHqQWT5T+Wxrne75CftlF+c8G2l7s7PCePqh7s
 thMpL0tFzzG7OLESWC+6UVbNmxMoD6C1wfY5oZ8lY24/iDP6QSJIVGL9EHRMBJUN0HF7
 Fnp3kwIQ7LYDzD+pr5sCrSp6/N11TpZpfAwTNTjjUoNIrVXD5pUBNVn8e/CbHi3gdiab
 cY7+vpK/9ZaTM8Hism1DeB0o0cTOFumXLZWBEck0eW5jBOTlUUrRMDzZJcxLr0seN0mt
 MwSA==
X-Gm-Message-State: AOAM532XLj49e8HPoe3cynvrljO6SsnGgKPNcCiFMKsICpSN7palAI25
 cPy6S0yItnJS9441laEFzdE=
X-Google-Smtp-Source: ABdhPJz4gO4nMeqvJ32qure4n+cnMraucNdsIEccSVII0cCqiNIIAIHE/k+gVZhf+Wfa/zWhifB1JA==
X-Received: by 2002:a17:906:f84:: with SMTP id
 q4mr12165250ejj.442.1621421833266; 
 Wed, 19 May 2021 03:57:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8e28:1d3:41f3:e15a?
 ([2a02:908:1252:fb60:8e28:1d3:41f3:e15a])
 by smtp.gmail.com with ESMTPSA id g4sm5902727edm.83.2021.05.19.03.57.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 03:57:12 -0700 (PDT)
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <77efa177-f313-5f1e-e273-6672ed46a90a@gmail.com>
Date: Wed, 19 May 2021 12:57:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cd6bbe33-cbc5-43cb-80f7-1cb82a81e65d@amd.com>
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org,
 Felix.Kuehling@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.05.21 um 20:48 schrieb Andrey Grodzovsky:
> [SNIP]
>>>
>>> Would this be the right way to do it ?
>>
>> Yes, it is at least a start. Question is if we can wait blocking here 
>> or not.
>>
>> We install a callback a bit lower to avoid blocking, so I'm pretty 
>> sure that won't work as expected.
>>
>> Christian.
>
> I can't see why this would create problems, as long as the dependencies
> complete or force competed if they are from same device (extracted) but
> on a different ring then looks to me it should work. I will give it
> a try.

Ok, but please also test the case for a killed process.

Christian.

>
> Andrey


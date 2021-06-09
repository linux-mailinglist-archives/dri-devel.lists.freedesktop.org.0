Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E14B3A16A3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 16:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E236E3B7;
	Wed,  9 Jun 2021 14:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5C96E3B7
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 14:07:27 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id y7so21004319wrh.7
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 07:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Dttg18jWlLDGyW5mgquF2WNgPKSaQZvCAi3xzXTWXB0=;
 b=gCSCq5EhjZNectdbnkRkL4vQ+45sXzpPLtWS5qvSCQOTrKmnBpFgofyhs9v+JX0NNF
 H8O6sAnPK20ZkcfHS1lGqd4tNvoLUnr3581UAXBl4RgFsZ2FMkiFT5Cx4s8WW4R7KjVZ
 cwxOHZEERAl7IMQMu99A+OQOGSWYi6kv/jCOH5Tuc3g3GJRvoQIlBzXtvO95YZ/bnbHP
 n+ElKvPMg+W8lItc+QQ4rHehEmmHc3RC2knlP4GiFkelFrKrGgHoMMT/cm326o0lIu42
 uy5Oz/94cscCen1d2Dsix2FaJ0C+hXdpmCOgsJK1x6r5xnnLrpVAcTK/zhAfIlcVgVhu
 cQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Dttg18jWlLDGyW5mgquF2WNgPKSaQZvCAi3xzXTWXB0=;
 b=tao8RRKaNsFt+sQdwlYGh5awErl6IoR1BQOyaa96r5SQ2J3H9htFmVcSuVynBbAYuC
 PUWPC4Ohe1BoZmO4RRtPZncFiLoIgQ9dxqNbM6+SuMvImHnNp3GVQ1OP0jUQW65+O4BF
 DgaONw3c+RxygF6IJbp7Rt810KkNfo9I15H5nTZLn9mQqTVRK34sZWNwjmETifiWF+nn
 U6aK7ehikuVg8X60jX3Wt12cT6ba6YxVEqLnNqAel8xtAjkiPRHCCA0s/SjLQd4fx7JY
 IzPFywMU9ukZFJkCWZMvHZbrmvzPNAhIE17QQ14v0skPxXBfjZoayXiu8RUXzBv+jYIe
 hhUA==
X-Gm-Message-State: AOAM532wx1GyCk1As6yq8+olAnUtWgk0eCk7DR7eMpdxfHpt4jVMguY0
 b1s+bPgMFc4mnON+vdJ8JVJ1Edz3MVU=
X-Google-Smtp-Source: ABdhPJzroECnalDuIqBvYwQ58MFcgUOcQnphyhwT73NtbRyVk6b/ZenGnsHQJ6AVEmP6UBQ/g6CK+w==
X-Received: by 2002:adf:8b9a:: with SMTP id o26mr8508wra.96.1623247646068;
 Wed, 09 Jun 2021 07:07:26 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:3e79:91ff:ea38:2624?
 ([2a02:908:1252:fb60:3e79:91ff:ea38:2624])
 by smtp.gmail.com with ESMTPSA id i16sm20707922wmm.9.2021.06.09.07.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 07:07:25 -0700 (PDT)
Subject: Re: handle exclusive fence similar to shared ones
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210606100312.119176-1-christian.koenig@amd.com>
 <CAKMK7uGX7z2KdymWus2fk9VR57wU+Rj4jcS0j=j_sYwaH8zrLg@mail.gmail.com>
 <3fdb2dbe-748b-5297-277f-6a8394100725@gmail.com>
 <YL42scoTq8RUuEkD@phenom.ffwll.local>
 <78ab1102-0b59-36ba-b5ef-526356ffe630@gmail.com>
 <YMDFNyqzCfgsJnn2@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c164ea49-2ce2-8b40-1cdf-cd4cf93612e7@gmail.com>
Date: Wed, 9 Jun 2021 16:07:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMDFNyqzCfgsJnn2@phenom.ffwll.local>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.06.21 um 15:42 schrieb Daniel Vetter:
> [SNIP]
>> That won't work. The problem is that you have only one exclusive slot, but
>> multiple submissions which execute out of order and compose the buffer
>> object together.
>>
>> That's why I suggested to use the dma_fence_chain to circumvent this.
>>
>> But if you are ok that amdgpu sets the exclusive fence without changing the
>> shared ones than the solution I've outlined should already work as well.
> Uh that's indeed nasty. Can you give me the details of the exact use-case
> so I can read the userspace code and come up with an idea? I was assuming
> that even with parallel processing there's at least one step at the end
> that unifies it for the next process.

Unfortunately not, with Vulkan that is really in the hand of the 
application.

But the example we have in the test cases is using 3D+DMA to compose a 
buffer IIRC.

> If we can't detect this somehow then it means we do indeed have to create
> a fence_chain for the exclusive slot for everything, which would be nasty.

I've already created a prototype of that and it is not that bad. It does 
have some noticeable overhead, but I think that's ok.

> Or a large-scale redo across all drivers, which is probaly even more
> nasty.

Yeah, that is indeed harder to get right.

Christian.

> -Daniel
>
>


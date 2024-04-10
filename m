Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B006689F120
	for <lists+dri-devel@lfdr.de>; Wed, 10 Apr 2024 13:47:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652591132ED;
	Wed, 10 Apr 2024 11:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="re6SrSrq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C812A1132EE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 11:47:01 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d8b2389e73so17095721fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Apr 2024 04:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712749620; x=1713354420; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oZ6YNeiNukRuh6MMTnZ6ixiPqjgd5+C31ndu168QCzk=;
 b=re6SrSrqq4whacYQScAnUBGOhczRW1bCTQKMvEkIvrSVBeYmAs9VK7niGWg72zy62n
 Uu/M8bO0lZNB16sWvY27dO6xMymGZMQSSJGvAXaqY0wO1e/WhcQIbKD4t9FxQm1YFDtT
 4a6ycukBHaydsgTQjUpmCWA6vavh7yWwJGdXtf3IHdFhckDpMQTmMd7zCI+XDid9+TGe
 0Wa/cX4TeYsBgMD1zggMUXDo5CDWk9NCpSBjspkqhCvJ/00tHDXcb+NvHn1MTFT/QIXB
 +k4rp10I9jEqGZ/x1fhyh7XdqRXdJnaVIeub5L/NYPVZHK8g/CHtjxhr+Ld10qNY/q9K
 8wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712749620; x=1713354420;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oZ6YNeiNukRuh6MMTnZ6ixiPqjgd5+C31ndu168QCzk=;
 b=gImcnH1nRs3YhQ8C9NWmixrYZxEmcbx+wo3n2aB8fdX8/8Rfni8q093tmq7O8bXj6s
 McctmUlHpSykQotlo9hSHTJFO9spsp8curwsKGUqVwfGfNSv/l77pM0VZY0XFTjvp2yu
 BLcOL46NMC6kyHrYxcquuzOKw4iLoJsERh8B0IvqN9ijPTZmIXmHmlGDgAnN/h1cRK4Q
 Vwd+/adBevT9gVDc8TXCJzn6I/8WHqLvpCcLomvpivumqUWnBVSgs1fzjv8DNQXsy273
 or1qbq8h3J68q6+mn2O4PaIQBJMFXo5z0tyM7U1meOYnRQ1yHDO10flduubhBcL9gb+a
 zPBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu8SjA16RtB8f41I3WqWYd6dImEDtMblQXG6axeHFpGMydsiFP0aMEVyfSwYc3VNKBB+vGllLGnX5BKrEOtw2zgJEQ9xdaUuXprjLNR7uU
X-Gm-Message-State: AOJu0Yxrvdy84oVcKpOuXhycGSfKhBueCLnn1DmgEvGL0hXi2V4aLBqn
 ZBuXNx3lOtRDy7vDa6W9VX+HYwZ8bHRpZoBTv142B71uxtkiZquZ4wnQ6Q51D94=
X-Google-Smtp-Source: AGHT+IGnm7b8Cinq20QKqQAozywBKC44Y66uug2JGp4mxZff/pCzj2zNm4gy03Ua488m3Kggfu/ZvQ==
X-Received: by 2002:a05:651c:1037:b0:2d8:71d4:4c62 with SMTP id
 w23-20020a05651c103700b002d871d44c62mr1461674ljm.49.1712749619821; 
 Wed, 10 Apr 2024 04:46:59 -0700 (PDT)
Received: from [172.30.204.89] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 r21-20020a2e9955000000b002d85452f55csm1781619ljj.47.2024.04.10.04.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 04:46:59 -0700 (PDT)
Message-ID: <c547e19c-158a-4512-b2d9-01668b7ac2f0@linaro.org>
Date: Wed, 10 Apr 2024 13:47:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/msm/adreno: Allow specifying default speedbin
 value
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-3-ce2b864251b1@linaro.org>
 <pncr7ecf4eir36skul3iwt2nf5bpuwd5zjfzzfwwnxjwe4hoes@6z2xe54crijp>
 <d8a2ef87-f29e-4bdb-a9b8-591b8bd5d2b2@linaro.org>
 <tkcbl2iwcy3feoggbk737gx32qsxe5p4ad6lfrujy2pazccrhm@kif3guuzay6h>
 <CAF6AEGsg2xCCC27t_Gqu=MMQ6tckVw=Zj90p4x7EuOm+VKA=ig@mail.gmail.com>
 <quil2y6tbilihgont2xekay4joxgnsanu3khgo77omtwkolslp@ozuaajpv5uon>
 <b77a3161-9a18-4523-8528-31c2f2f4f476@linaro.org>
 <x4sgmdodoacsu6culbjjsw52ucaylpqj2ll6tkeppllzhfqiqn@lysclxogvcfq>
 <74ebd488-15c1-47a5-86f4-14263e3a914e@linaro.org>
 <CAA8EJprAcBDEwYeGJZ=JX2qkS4wQEraXsgCiCyZU3z1ksuxivw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJprAcBDEwYeGJZ=JX2qkS4wQEraXsgCiCyZU3z1ksuxivw@mail.gmail.com>
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



On 4/9/24 20:31, Dmitry Baryshkov wrote:
> On Tue, 9 Apr 2024 at 21:27, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 4/9/24 20:15, Dmitry Baryshkov wrote:
>>> On Tue, Apr 09, 2024 at 08:07:56PM +0200, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 4/9/24 20:04, Dmitry Baryshkov wrote:
>>>>> On Tue, Apr 09, 2024 at 10:12:00AM -0700, Rob Clark wrote:
>>>>>> On Tue, Apr 9, 2024 at 8:23 AM Dmitry Baryshkov
>>>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>>>>
>>>>>>> On Tue, Apr 09, 2024 at 05:12:46PM +0200, Konrad Dybcio wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 4/6/24 04:56, Dmitry Baryshkov wrote:
>>>>>>>>> On Fri, Apr 05, 2024 at 10:41:31AM +0200, Konrad Dybcio wrote:
>>>>>>>>>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>>>>
>>>>>>>>>> Usually, speedbin 0 is the "super SKU", a.k.a the one which can clock
>>>>>>>>>> the highest. Falling back to it when things go wrong is largely
>>>>>>>>>> suboptimal, as more often than not, the top frequencies are not
>>>>>>>>>> supposed to work on other bins.
>>>>>>>>>
>>>>>>>>> Isn't it better to just return an error here instead of trying to guess
>>>>>>>>> which speedbin to use?
>>>>>>>>
>>>>>>>> Not sure. I'd rather better compatibility for e.g. booting up a new
>>>>>>>> laptop with just dt.
>>>>>>>
>>>>>>> New speedbin can have lower max speed, so by attempting to run it at
>>>>>>> higher freq you might be breaking it.
>>>>>>
>>>>>> Usually there are some OPPs in common to all speedbins, so picking a
>>>>>> freq from that set would seem like the safe thing to do
>>>>>
>>>>> Well, the issue is about an uknown speed bin. So in theory we know
>>>>> nothing about the set of speeds itsupports. My point is that we should
>>>>> simplfy fail in such case.
>>>>
>>>> Or we could allow e.g. the lowest frequency (or 2) which if often shared
>>>> across the board to work, giving a compromise between OOBE and sanity
>>>
>>> That's also an option. But we should not be using existing speed table for
>>> the unknown bin.
>>
>> I derived this logic from msm-5.15 where it's "intended behavior".. I
>> suppose we can do better as you said though
>>
>> There have been cases in the past where the default speed bin ended up
>> having a higher max freq than subsequent ones, and I don't think I can
>> trust this product/feature code approach to guarantee this never
>> happening again.
>>
>> So. I think sticking to a single lowest freq and printing a big red line
>> in dmesg makes sense here
> 
> Make 0x80 the default supported-hw, make sure that the lowest freq has
> 0xff. Plus big-red-line.
> And hope that we'll never see 16 speed bins for the hardware.

opp-supported-hw is a u32 bitmask fwiw

I was thinking, either 0xffffffff or some driver-side hackery
(dev_pm_opp_enable).

Perhaps I'd be more in favor of the latter, as putting meaningless gobblygoo
in dt is not good

Konrad

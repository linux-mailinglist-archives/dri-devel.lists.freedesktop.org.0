Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B89389E226
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 20:08:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A5F10E429;
	Tue,  9 Apr 2024 18:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vWKHTOq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A978510E93E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 18:08:00 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-51381021af1so9614279e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 11:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712686079; x=1713290879; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VrZ8RYQWmS/u2XwLs8TYJcX0Juh8Ia0TqmDetkGlloc=;
 b=vWKHTOq7ib1fgyaIU99w9cvve6EW5/qmQrnCNG6ESi0xQ2RU1bu7JMnFaLElBcu+Dd
 5XGag0Y8ETsT0RmC+mUXlhtSK8bD5szrA3VVBMPIJPXUjgSdBeadTjjBySQQno88hzLV
 gtXvAR5tIQSlEmvzP2++hnxkDQOMFbGisqMlwBP1JuyoOJ3YcaWor0kjZsBLI6XJ3DrR
 ZWrzm3mrZw5X84l1H5ydCmnmGtMpOYEk1PLFChBPFctTsQXwy1HY4Uo8OJClo9DsdJWp
 lonAxeLVp1uUKOwFhqFzdHm1ukvI9plcKXmi2j4h2Ab1aGXqvanBgbJgfInTgpmxP7iy
 eglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712686079; x=1713290879;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VrZ8RYQWmS/u2XwLs8TYJcX0Juh8Ia0TqmDetkGlloc=;
 b=stL7wS4VjhWtb22U190FPiEQVw2x+nmG6AC8w1Jgq2OK5aFaiFTUlX8aRte0gkk8BI
 FzvOZcG5VAl4ZYcejPISQFEwMPQyFNfA7ngoefg7P4PesQ/9NnA8a9aJYcAUB6NfLT8l
 3Ou3MHojqpIZjEouqfV2W3i7lV6BmxIjuA+9ME7KWys5p6tIUZzLJyCFAX4rURvsgiDL
 28teSS9gZ4CfuSeB8t5LTqK7LTsyCvMfOAsp4QwHaJ7u1VtivqWv7DovD+kK4JeDHPuC
 wvohc4G0UNRtZRYGVPs4uZfZpFdG4UCdbedLFHisJQ6KEHSBT/3JlHhG3i9pWNQoL5rl
 9BWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfEfGTRC4mwgxd3okheKWVbpSp96RsusYheOBV7YsnxoPZgljDD+IZ9uVmetIvnEGYAtTE/9yh1osXrZFs/uSI6xz5eBxr/oqlwxwJzd3E
X-Gm-Message-State: AOJu0Yy/jZm1qX68UymoLP4TBG6uyTM3EdzCvLm2uByGxFdpmnaLf2pF
 TzcuzYp05IAs1smwuWDBIRwXnsZ5iboQ2G1nxiqJiFFGQyVJ/Y5Q8PlSnWM09Wg=
X-Google-Smtp-Source: AGHT+IG3MqgBS+mPe51VGcruWuPwb8VmWczbzg+K2q9SMydDRG5mtJeurSgvPU0XHt+YSYXpUbL4rg==
X-Received: by 2002:a05:6512:2313:b0:513:7e83:b3f2 with SMTP id
 o19-20020a056512231300b005137e83b3f2mr178345lfu.45.1712686078563; 
 Tue, 09 Apr 2024 11:07:58 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 i10-20020a0565123e0a00b0051723af85casm629871lfv.238.2024.04.09.11.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 11:07:58 -0700 (PDT)
Message-ID: <b77a3161-9a18-4523-8528-31c2f2f4f476@linaro.org>
Date: Tue, 9 Apr 2024 20:07:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/msm/adreno: Allow specifying default speedbin
 value
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <quil2y6tbilihgont2xekay4joxgnsanu3khgo77omtwkolslp@ozuaajpv5uon>
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



On 4/9/24 20:04, Dmitry Baryshkov wrote:
> On Tue, Apr 09, 2024 at 10:12:00AM -0700, Rob Clark wrote:
>> On Tue, Apr 9, 2024 at 8:23 AM Dmitry Baryshkov
>> <dmitry.baryshkov@linaro.org> wrote:
>>>
>>> On Tue, Apr 09, 2024 at 05:12:46PM +0200, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 4/6/24 04:56, Dmitry Baryshkov wrote:
>>>>> On Fri, Apr 05, 2024 at 10:41:31AM +0200, Konrad Dybcio wrote:
>>>>>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>
>>>>>> Usually, speedbin 0 is the "super SKU", a.k.a the one which can clock
>>>>>> the highest. Falling back to it when things go wrong is largely
>>>>>> suboptimal, as more often than not, the top frequencies are not
>>>>>> supposed to work on other bins.
>>>>>
>>>>> Isn't it better to just return an error here instead of trying to guess
>>>>> which speedbin to use?
>>>>
>>>> Not sure. I'd rather better compatibility for e.g. booting up a new
>>>> laptop with just dt.
>>>
>>> New speedbin can have lower max speed, so by attempting to run it at
>>> higher freq you might be breaking it.
>>
>> Usually there are some OPPs in common to all speedbins, so picking a
>> freq from that set would seem like the safe thing to do
> 
> Well, the issue is about an uknown speed bin. So in theory we know
> nothing about the set of speeds itsupports. My point is that we should
> simplfy fail in such case.

Or we could allow e.g. the lowest frequency (or 2) which if often shared
across the board to work, giving a compromise between OOBE and sanity

Konrad

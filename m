Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CB689E281
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 20:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B26112C4A;
	Tue,  9 Apr 2024 18:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jDRn4pHa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CD6112C4A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 18:27:27 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-516c403c2e4so5145545e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 11:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712687245; x=1713292045; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WDNDpKN5v2yIo8s3DyudTdW+0pg87u/NiQ3pUkTGC6c=;
 b=jDRn4pHaACPHXwvhdHGYn5+QLRgQk8IebjFvsu2M37WrJ4HsAfrOX7L23Mg/6EXFj0
 DHXLGoMuMtpRanEpZ2oUvMA033cQKWybxvh+4vlBU6R1QAzKPy/4q39vFZbqTvMXXeIf
 fgXohxuSOxqVh/PFqKyyLt1sCqA62nC7yR4msdEyD9iNqn362DKOBNSRmUoFEOe+qXHo
 D5tlGgAespqKlHjr/2zeEIm5cIYtt1G7XcNj95iCn6gV08JzZJVMqd/6+Kj7ars3GCuW
 0tX03Y8w3ku372kpdi2O1NiWnT8RQ06oQ5YU1YQqGfysWoDVgQNtWsegw3o+qTEU7UnZ
 IJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712687245; x=1713292045;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WDNDpKN5v2yIo8s3DyudTdW+0pg87u/NiQ3pUkTGC6c=;
 b=vYNBajVG3RVLVIXaJe1aWgOqNEZc+CvvuGQcbEk26D0jMMSUlYhKH4g7QFC26aCnSh
 QGfAOfy1l+3iQV/+ra5Ys/v/2Xd6ddxDizT+ZHQU2OLBT6axsfX0MHEdqYw7OFKhk7S6
 DkXeRiPzuP1S9WA64VZo0zPBzKPxECR/GfDvFQjXBeAcp5MTTEAh74S0P7Cy+IoofgsW
 hCRFMa3KVM419eZjtz5SuHEFPCKHzCy87YsVqbHdKcPNlGMYyM+MejxgfmT99LQvbsSf
 eP5xqOEkNDy9+dka0oe/4+xD0ShCg/uqrmzcS3zHyyLgY7eIKAq0KlEutSqVcF+4OtZ5
 PeAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeTksfN0NzCBy4L+Db5+0BhwnOt/buwJQkUu5NUSmUPpdPfFC8j9UJPqpQZ1+EvHxjO0l8V22DGfb1puGPpkFXWjXrEkAQMpk0R2MB9wjP
X-Gm-Message-State: AOJu0YxluM+IFO2uVqocZ6byOA7pC54iatQIGanXjH2jofxyQ2GcSdl6
 ob/rc6lyfc+BMLks2S1C/5Jlx2+JDu/2q2jHSapHume2czllkysYuJFGTteempo=
X-Google-Smtp-Source: AGHT+IGRKkADZsJNiIkww/uuH4jc36SsQcakLssDRn6++Y7zOSTbpO9G9O8NJi1Dv7B/S7r6n5ZnZg==
X-Received: by 2002:a05:6512:548:b0:517:30a3:d000 with SMTP id
 h8-20020a056512054800b0051730a3d000mr129934lfl.28.1712687245126; 
 Tue, 09 Apr 2024 11:27:25 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 c5-20020ac24145000000b00516c8826719sm1607013lfi.197.2024.04.09.11.27.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 11:27:24 -0700 (PDT)
Message-ID: <74ebd488-15c1-47a5-86f4-14263e3a914e@linaro.org>
Date: Tue, 9 Apr 2024 20:27:22 +0200
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <x4sgmdodoacsu6culbjjsw52ucaylpqj2ll6tkeppllzhfqiqn@lysclxogvcfq>
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



On 4/9/24 20:15, Dmitry Baryshkov wrote:
> On Tue, Apr 09, 2024 at 08:07:56PM +0200, Konrad Dybcio wrote:
>>
>>
>> On 4/9/24 20:04, Dmitry Baryshkov wrote:
>>> On Tue, Apr 09, 2024 at 10:12:00AM -0700, Rob Clark wrote:
>>>> On Tue, Apr 9, 2024 at 8:23 AM Dmitry Baryshkov
>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>>
>>>>> On Tue, Apr 09, 2024 at 05:12:46PM +0200, Konrad Dybcio wrote:
>>>>>>
>>>>>>
>>>>>> On 4/6/24 04:56, Dmitry Baryshkov wrote:
>>>>>>> On Fri, Apr 05, 2024 at 10:41:31AM +0200, Konrad Dybcio wrote:
>>>>>>>> From: Neil Armstrong <neil.armstrong@linaro.org>
>>>>>>>>
>>>>>>>> Usually, speedbin 0 is the "super SKU", a.k.a the one which can clock
>>>>>>>> the highest. Falling back to it when things go wrong is largely
>>>>>>>> suboptimal, as more often than not, the top frequencies are not
>>>>>>>> supposed to work on other bins.
>>>>>>>
>>>>>>> Isn't it better to just return an error here instead of trying to guess
>>>>>>> which speedbin to use?
>>>>>>
>>>>>> Not sure. I'd rather better compatibility for e.g. booting up a new
>>>>>> laptop with just dt.
>>>>>
>>>>> New speedbin can have lower max speed, so by attempting to run it at
>>>>> higher freq you might be breaking it.
>>>>
>>>> Usually there are some OPPs in common to all speedbins, so picking a
>>>> freq from that set would seem like the safe thing to do
>>>
>>> Well, the issue is about an uknown speed bin. So in theory we know
>>> nothing about the set of speeds itsupports. My point is that we should
>>> simplfy fail in such case.
>>
>> Or we could allow e.g. the lowest frequency (or 2) which if often shared
>> across the board to work, giving a compromise between OOBE and sanity
> 
> That's also an option. But we should not be using existing speed table for
> the unknown bin.

I derived this logic from msm-5.15 where it's "intended behavior".. I
suppose we can do better as you said though

There have been cases in the past where the default speed bin ended up
having a higher max freq than subsequent ones, and I don't think I can
trust this product/feature code approach to guarantee this never
happening again.

So. I think sticking to a single lowest freq and printing a big red line
in dmesg makes sense here

Konrad

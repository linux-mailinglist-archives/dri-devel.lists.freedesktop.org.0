Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 160ED93A1C9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 15:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C112510E5D4;
	Tue, 23 Jul 2024 13:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NcjlVA2b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C6A110E5D4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 13:43:19 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a7a9cf7d3f3so74456866b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 06:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721742198; x=1722346998; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mVMG/uTEUf1KhxbYqzxZppjAwG6qO+7aRJSTph3UtBs=;
 b=NcjlVA2btSk0SLu0K7mX+sUtTB8RLAOBIkP9PRtGGm66cEnPbN/5pIIptlGQMOb4wR
 3nf/Ihxqkiv6iWlR2h5+hctD43IviY2OzUjf8x/faFl59AvNQP9zvG8dXYaL73RhE9wQ
 w8EEsYAVfExZ55QFicpfuYJppY+4ZVpqUSKwAFmu+gwmvUOaoZgLoi7aiTB5eVuGqvF7
 bmxHCRvwWxkjX0gtlpmk/r1aOikbrz6AsOhLxOLmjWnInGCvDqhfIOkR513dol3pemuc
 k34lXfcxs5KMvmLFNFbquDyjJ8ZP3KFmgIartQe9u6xCDgWYZAC8KdVpv36g8je3K31N
 EY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721742198; x=1722346998;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mVMG/uTEUf1KhxbYqzxZppjAwG6qO+7aRJSTph3UtBs=;
 b=oM8GItqJCg3n4L0AMxiwS4/jbvjLiex1eJaxEJUCaY40tIyjuXPmV6Uzs8+K1wRsmo
 6RuTnVAmL/6HAcurCQEfmHoAopD1AnQa+bItW77YbiHDNai9jJK+1Tg4Zdh9j9Mfo8/c
 Khl2sYq+4GEzutdUMrlPttRDSw/L3BkWK9fMYc7z3dNkfOZp8s97ciRBUMpnE8TFgeiH
 Q81EjeqzF/CmtPBlLesOC3lfz1GfXllnXOG3cLTzzS33qAnGqDIRedmqxuZk+gvoONn0
 BDQ2/rC3fV9qRHdqD5XOw0Y8315qX9QezehrbBjjMNOO4S4acJoCgMZdt6HmxBXd+daA
 aC3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjrwMpSIqkiOn4AImpr/wmtK0m6oTu09/IpWH0mT2eQLVq8cFzGF7sViQ+XARaaMdhi+WvoUJ/DNalqJuZPWjqOOwu3XHu8/UtIh0+eCGp
X-Gm-Message-State: AOJu0YxqJQ+x4MHsWLmKzq78DsJivVpiD6Qx+9kXmyut5u/IS6fZys7T
 S2wy8S1+lnT+EmUDRvtIZEDF9OSpvUq7h1LphmOaMysHIze/ID8RI2lIEaucXK0=
X-Google-Smtp-Source: AGHT+IE+cxtq1rBP5ZCwyM/iBhNOsoKaiSM8RddFYe5ZZJ+3U4Nkd5DFypVcLuQUbpf2C4hYjOkbug==
X-Received: by 2002:a17:907:2da8:b0:a7a:a2b7:93fe with SMTP id
 a640c23a62f3a-a7aa2b7943bmr85721466b.47.1721742197360; 
 Tue, 23 Jul 2024 06:43:17 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a8d9b2d1dsm96699866b.63.2024.07.23.06.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 06:43:16 -0700 (PDT)
Message-ID: <57c165e6-d942-4a17-a26b-7e4a0422127c@linaro.org>
Date: Tue, 23 Jul 2024 15:43:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: add HDMI nodes for msm8998
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>
References: <20240627-hdmi-tx-v5-0-355d5c1fbc3c@freebox.fr>
 <20240627-hdmi-tx-v5-4-355d5c1fbc3c@freebox.fr>
 <d9898342-2439-4d3d-8e3d-5bf0a7a40245@linaro.org>
 <b6f6c845-6094-44ce-8ad0-ed4f6d353cec@freebox.fr>
 <CAA8EJpqrAFKCr63JHEpZ3b3zdRfoNXoJP6SqKDOO4sqc=c6YdQ@mail.gmail.com>
 <44101ecd-61f4-4609-bb22-12b40b692552@freebox.fr>
 <CAA8EJpprtmefNM_CJFRbYVNxOWUVVWbedBq44r7GXOdDrQ2WjA@mail.gmail.com>
 <04ef978f-2bfd-46cc-a9f7-40a6f1c507f8@linaro.org>
 <7d34a857-6495-482b-9070-1817c88c9913@freebox.fr>
 <45f5dae6-c606-4612-900a-b719f58d92ce@linaro.org>
 <a8c7db04-7212-4bf0-b8b1-d371ee33478b@freebox.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <a8c7db04-7212-4bf0-b8b1-d371ee33478b@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 23.07.2024 3:38 PM, Marc Gonzalez wrote:
> On 23/07/2024 15:08, Konrad Dybcio wrote:
> 
>> On 23.07.2024 2:57 PM, Marc Gonzalez wrote:
>>
>>> On 23/07/2024 13:45, Konrad Dybcio wrote:
>>>
>>>> On 23.07.2024 11:59 AM, Dmitry Baryshkov wrote:
>>>>
>>>>> On Tue, 23 Jul 2024 at 12:48, Marc Gonzalez wrote:
>>>>>
>>>>>> On 16/07/2024 18:37, Dmitry Baryshkov wrote:
>>>>>>
>>>>>>> No, that's fine. It is the SMMU issue that Konrad has been asking you
>>>>>>> to take a look at.
>>>>>>
>>>>>> Context:
>>>>>>
>>>>>> [    4.911422] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>>> [    4.923353] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>>> [    4.927893] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>>> [    4.941928] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>>> [    4.944438] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>>> [    4.956013] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>>> [    4.961055] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>>> [    4.974565] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>>> [    4.977628] arm-smmu cd00000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x0
>>>>>> [    4.989670] arm-smmu cd00000.iommu: FSYNR0 = 00000021 [S1CBNDX=0 PNU PLVL=1]
>>>>>>
>>>>>>
>>>>>> As I mentioned, I don't think I've ever seen issues from cd00000.iommu
>>>>>> on my board.
>>>>>
>>>>> Interestingly enough, I can also see iommu errors during WiFi startup
>>>>> / shutdown on msm8998 / miix630. This leads me to thinking that it
>>>>> well might be that there is a missing quirk in the iommu driver.
>>>>>
>>>>>> I can test a reboot loop for a few hours, to see if anything shows up.
>>>>>
>>>>> Yes, please.
>>>>
>>>> Yeah I do trust you Marc that it actually works for you and I'm not
>>>> gonna delay this series because of that, but please go ahead and
>>>> reboot-loop your board
>>>>
>>>> 8998/660 is """famous""" for it's iommu problems
>>>
>>> [   20.501062] arm-smmu 16c0000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x1, cbfrsynra=0x1900, cb=0
>>>
>>> I get the above warning pretty reliably.
>>> I don't think it's related to the issue(s) you mentioned.
>>> System just keeps plodding along.
>>
>> Yeah that one's "fine"
> 
> I booted 40 times in a loop.
> 
> `grep -a -i FSYNR console.logs` just returns the same 16c0000.iommu
> "Unhandled context fault" message 76 times (as above).
> 
> NB: I have maxcpus=1 set in bootargs.
> 
> Could the iommu issue be a race condition, NOT triggered when code
> runs with less parallelism?

No clue, can you try without maxcpus=1?

The thing will likely run slower (because reasons), but shouldn't
explode

Konrad

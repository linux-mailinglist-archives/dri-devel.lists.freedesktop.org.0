Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EAAA604DD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 23:59:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B349110E284;
	Thu, 13 Mar 2025 22:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TZfvY3tK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B0310E203;
 Thu, 13 Mar 2025 22:59:11 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3912c09be7dso1000798f8f.1; 
 Thu, 13 Mar 2025 15:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741906750; x=1742511550; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yO5kyBpcT0BbdxDO5L56bH6b4vFcrtwYw7f0yDEAAbM=;
 b=TZfvY3tKd1pgyfXc6BD9Z64kctTw69aJWNnSBW9vDFU7UG5sagIat4yOnM9RYDv8eG
 9d9DWC1prprEThIR9ns7XV7pqgpplC9v4OV+b2VKXbYDhGMJ05Ke8bkrxgPYuBJ5QHeD
 uK3RzSRuCOWXxNYsC/YxpCI97WCqyftM39RwS+uQsk8BCfOzFzuCaTTl65WAnGr1q4j6
 we52ITlPmdabZS7jWny5Tw+n4TEsDwfEy7CnO/4drWk3J1M4uMoko0EqxTJx073HjYBE
 43IKE/b5M7db/M6IJKk48cymejEqAoK1K0JGBLdfBZRR8xzyH2luiFHe+I5Fle8wVvFN
 BPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741906750; x=1742511550;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yO5kyBpcT0BbdxDO5L56bH6b4vFcrtwYw7f0yDEAAbM=;
 b=j4eQAxs576IPYQSzVAx25KAIlpNmMyHSZq29MkwGmcu0qCEowSsZi13QYtNXtBFf3t
 RAbip63f8lfFX+EsGRIKUTG06FCeM/FoBohh6xAbqvH2tvbazRqMUtSastYYNwgudwBq
 r0mmQRokEUysiqgvwbLL+JJD8hlwiY715TmIq9rcIa9AKl17bbzxrFDOn1ZUTNQvY7Ah
 vkk3jJdhb25huAZ4M8YyRVcXlIznS7omLWGe6/pm3V7wUaq1ceZxZWNPza/PFNRAFuhX
 K0zlB8K7PdMV8nTg8DWE+ua440Ai4GopNDWGlLcja4MRYaF2yVqnWdVuQJ0pNyMoL8DZ
 2iog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjg71z+BTkslb34ORX6dCP1hbhZawUYXMPucfUp/pyQz6pLbK3Jb8/dRNY4LKSrlRR3Vr5P8cLQS5O@lists.freedesktop.org,
 AJvYcCWbZUx16JlotVH+XAWq3c5nZhzuojuz21uCDoWIrk1boF6YuWBxsSkEw/49WHuhRovd9fORHNqSv7E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1OX08hMdQI4CCJ42ByQgPsDHkuLEyX98jUSqcMgqKd/vTaECd
 KJOEC2ddx1crIdGIkaXfK5Pu/HJXd3ERd9IOP527oCjGMDF9n2M=
X-Gm-Gg: ASbGncvzi6worKDXTCGr1z03S3eUYd0CuPL+UwPsZTaFxZ9v5qATKJ0k9KipYdMdnh3
 eECRVtujrmqRWcUnEDjXXZRXyZu8ov0JV9LcSK6YMTKVP5USqC06+i6CKGAgfF6NTMDNeHb6CRQ
 U6PlwXeDz/Nku8gMhDuEh18pwwsDol2vHrnCumgjc4jrxOlWsW5GzWPVlqjH0te9Yb8+M7oN1Sr
 qn1NFd53RLrt5nkYV2XMNAhg/fqjH4ivhREHjSM7ZEA09XVrSzirx5WqiXBM0Bjh8X9S23iql7V
 MBauDI63dvmn1JCra1iQ4ejl4/3zrxLqsisrh/q/9omzjMZqAkRMzQyqsh4Z2L72BdyAUfl6daU
 P2Fx5BCZAvDs=
X-Google-Smtp-Source: AGHT+IEEcr5tLlHRCwRgIm81YAO79o0KXmqFBuZsB1QvlKMuOiqa3CoD7fSJfWVzyXEVc8D0DoWmIQ==
X-Received: by 2002:a05:6000:1865:b0:391:275a:273f with SMTP id
 ffacd0b85a97d-3971d1349a3mr141997f8f.4.1741906750151; 
 Thu, 13 Mar 2025 15:59:10 -0700 (PDT)
Received: from [192.168.20.171] (adsl-178-39-53-103.adslplus.ch.
 [178.39.53.103]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb318a3dsm3503210f8f.74.2025.03.13.15.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 15:59:09 -0700 (PDT)
Message-ID: <990c38f8-0e7a-4e06-afa7-41d7c63bbc1e@gmail.com>
Date: Thu, 13 Mar 2025 23:59:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] drm/msm/dp: Introduce link training per-segment
 for LTTPRs
To: Stefan Schmidt <stefan.schmidt@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com, abel.vesa@linaro.org, johan@kernel.org
References: <20250311234109.136510-1-alex.vinarskis@gmail.com>
 <CAEvtbusre2PUwNiD42d-xTCVf4dV0npN-5UxxwrjriVOsbj0Fg@mail.gmail.com>
Content-Language: en-US
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <CAEvtbusre2PUwNiD42d-xTCVf4dV0npN-5UxxwrjriVOsbj0Fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 3/12/25 22:16, Stefan Schmidt wrote:
> Hello Aleksandrs,
> 
> On Wed, 12 Mar 2025 at 00:41, Aleksandrs Vinarskis
> <alex.vinarskis@gmail.com> wrote:
>>
>> Recently added Initial LTTPR support in msm/dp has configured LTTPR(s)
>> to non-transparent mode to enable video output on X1E-based devices
>> that come with LTTPR on the motherboards. However, video would not work
>> if additional LTTPR(s) are present between sink and source, which is
>> the case for USB Type-C docks (eg. Dell WD19TB/WD22TB4), and at least
>> some universal Thunderbolt/USB Type-C monitors (eg. Dell U2725QE).
>>
>> First, take into account LTTPR capabilities when computing max link
>> rate, number of lanes. Take into account previous discussion on the
>> lists - exit early if reading DPCD caps failed. This also fixes
>> "*ERROR* panel edid read failed" on some monitors which seems to be
>> caused by msm_dp_panel_read_sink_caps running before LTTPR(s) are
>> initialized.
>>
>> Finally, implement link training per-segment. Pass lttpr_count to all
>> required helpers.
>> This seems to also partially improve UI (Wayland) hanging when
>> changing external display's link parameters (resolution, framerate):
>> * Prior to this series, via direct USB Type-C to display connection,
>>    attempt to change resolution or framerate hangs the UI, setting does
>>    not stick. Some back and forth replugging finally sets desired
>>    parameters.
>> * With this series, via direct USB Type-C to display connection,
>>    changing parameters works most of the time, without UI freezing. Via
>>    docking station/multiple LTTPRs the setting again does not stick.
>> * On Xorg changing link paramaters works in all combinations.
>>
>> These appear to be mainlink initialization related, as in all cases LT
>> passes successfully.
>>
>> Test matrix:
>> * Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland
>>          * Left USB Type-C, Right USB Type-C
>>          * Direct monitor connection, Dell WD19TB, Dell WD22TB4, USB
>>            Type-C to HDMI dongle, USB Type-C to DP dongle
>>          * Dell AW3423DWF, Samsung LS24A600, dual Samsung LS24A600 (one
>>            monitor per USB Type-C connector)
>> * Dell XPS 9345, Ubuntu 24.10, Gnome 47, Wayland
>>          * Left USB Type-C, Right USB Type-C
>>          * Direct monitor connection
>>          * Samsung S34BG85 (USB Type-C), Dell U2725QE (universal
>>            Thunderbolt/USB Type-C, probes with an LTTPR when in USB
>>            Type-C/DP Alt mode)
> 
> You can  add the following:
> * Dell XPS 9345, Debian trixie/sid, Gnome 48, Wayland
>          * Left USB Type-C, Right USB Type-C
>          * Dell WD15 Dock with DisplayPort connected
>          * Dell HD22Q dock with HDMI connected
>          * USB Type-C to HDMI dongle
>          * Dell U3417W

Hi,

Thanks for testing, will add on next re-spin.

> 
>> In both cases, "Thunderbot Support"/"USB4 PCIE Tunneling" was disabled
>> in UEFI to force universal Thunderbolt/USB Type-C devices to work in
>> DP Alt mode.
>> In both cases laptops had HBR3 patches applied [1], resulting in
>> maximum successful link at 3440x1440@100hz and 4k@60hz respectively.
>> When using Dell WD22TB4/U2725QE, USB Type-C pin assigment D got enabled
>> and USB3.0 devices were working in parallel to video ouput.
>>
>> Known issues:
>> * As mentioned above, it appears that on Gnome+Wayland framerate and
>>    resolution parameter adjustment is not stable.
> 
> I can confirm this on Gnome 48 + Wayland as well. Sometimes the resolution
> change from gnome settings gets stuck and does not apply. It normally works
> here around every third try or so when using a dock.

Good to know that it isn't issue only on my side :)

Alex

> 
>> Due to lack of access to the official DisplayPort specfication, changes
>> were primarily inspired by/reverse engineered from Intel's i915 driver.
>>
>> [1] https://lore.kernel.org/all/20250226231436.16138-2-alex.vinarskis@gmail.com/
>>
>> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> 
> Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org>
> 
> regards
> Stefan Schmidt


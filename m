Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F9BCC9C84
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 00:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB9D10E2B4;
	Wed, 17 Dec 2025 23:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gCweH3kT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E327010E2B4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 23:18:18 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-6419aaced59so16411a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 15:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766013497; x=1766618297; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UN96YHFRB/4inIMgi3dbMvEusx9VWtrV50KsEfyV8ik=;
 b=gCweH3kTcLqMwkwDveZgf8YVcOBNsqw8oqa1moWvtxj3r8EFVsWXqZEhMj43Q/2nhu
 L0M27SZxFj1aT6dqUM8c17PLJPGM3B4E1oZZ0wFEF/Nfv89e8Ok/S7QuMeI71KLbiIXF
 By/vpB1h6CbYueFgof3LlWui5CPof/hqr/wyKytIAsb6MtlBZcGRYrSNrbMqG8bUqLqp
 NeFKu66UyZ6CWavsrJ73gb8KzXObj19uZdzNuZxhtFcpiqxi5fFWMAz7ub4ghkrWpXmj
 FJ4dGHrzC+ftGZuMEbRiQWhgxQvzY75yluE8kYgC8ebztQ0V8ZHU59QBUUR0vSMkxvkw
 4pZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766013497; x=1766618297;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UN96YHFRB/4inIMgi3dbMvEusx9VWtrV50KsEfyV8ik=;
 b=icT9RDTWAG99LwBVfur/LaVJUfoqVG/Rbj3fX8xx+VgrvwMlfcf2Ya7Ks6raPkqUZ6
 jAYQSaB8xzNjEWIp15DMfySalt9fkJXzNIIGNG4s7SpUADlt27wglB4qkHWfL+WAlYeE
 ZqZBKko3JZoKO1fRtRg2zOtANnQVP5pzMKHGLjYzveeI6GmmtcfVzfmDPgHbt9urh/5M
 l0zK+jYR23IKCXRflqpLIiJN4Wg3SpYDuPG7hahdjUJgNcmSxwNIIOCV75lFI/f0+oCx
 fQ6JvDj7LqPX4ua6guHTe/JFWP1ikcxvKAERTJFocq/lHisUuTRHBrUtf2EHztMmyfue
 iQBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFPNq/ltaaA3rzM4C1cSGMoRmAQ48wzDdWlu7Gb7+Ao58dPmJKaYxlvNUSs0tCEEFLYv/kt/ktdYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ661o8CW/bcsPBFUtMLgVLfc9F7DRBI39b7X1FAKQOG6fS+5+
 yFg/8w/6/45V3weXA+eePn4MgOyiRI3GbfCLjYzeVnJUNfYdSjwv6bjI
X-Gm-Gg: AY/fxX6PAcU32AcZ0T3MBqh78vRB64f3hP503kI06wcsbjdAu6wGTIxM/TaUHHI+5tW
 X5HkAwRWzRH/puEBeSlb02vM76RRhLbUT471pO2xfJzBsaD/eSYRNnM2l1WxyTwIYNWyPA6bTpp
 2LsAcbVXsFI3rRh2P0dFB0eClR+CRIRtMD2lPRPrtWJE+kdE17Jm7OryAXSZ+wGw7b+EoI3y7JC
 lVIwJAs7ziOPuhB5VZG8At8XPTDqleDjH1K8xpPnWtSbzjG826K9r/2Fs8e/zeaT343GBSP2xb4
 d/IyW9rfGGqvm44s6ylWgHRSxMsZ7g+rE9dMdXeDzznNgKR1SGGOko3xKq3eJLlz3J8WOkvgRwp
 okQ1LvBTB0ObzA3aSvaCeDFXXBBdb/KIdT/+TDCU+eIIS8x1xYRB8h43Aez/WUhzYuJWXPGv5dl
 By3cQ30wiSpd6YMgNPfk7/9W7y3v9akrGfBXBEnrFRlyhWOzguu1tb
X-Google-Smtp-Source: AGHT+IH72LAfNzyy+q1FdHHf4lMhn1wfNHRULTFndvPYWMDbTNlqP41izrh+Mgb7nu96smLmXrV0VQ==
X-Received: by 2002:a05:6402:2681:b0:63c:4da1:9a10 with SMTP id
 4fb4d7f45d1cf-6499b331141mr17431482a12.31.1766013497198; 
 Wed, 17 Dec 2025 15:18:17 -0800 (PST)
Received: from [192.168.0.130] (84-148-177-143.ftth.glasoperator.nl.
 [143.177.148.84]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b5886d434sm760731a12.21.2025.12.17.15.18.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 15:18:16 -0800 (PST)
Message-ID: <6dc26bf0-6e28-4478-9ec4-20622cc8a19e@gmail.com>
Date: Thu, 18 Dec 2025 00:18:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
 <pedxgtvzfrfzihoshhfvntin3hwwi3znleilbz4abjad74nowb@un33lgiaa26z>
 <CALHNRZ9-XrMUkQE0cwjq-HUYsy5uerhOQ9sNpirp23kKoaPuYw@mail.gmail.com>
 <72llskwvuwyllvz24zoex4ad6v6t5skiehmwylj7exoh7bmzjo@xq3v7vja5w62>
 <CALHNRZ_k6e9ZRmpK6Pzpet=RzUQ0fRYmfnea6U+9E2oZc8=z7w@mail.gmail.com>
 <eac10a43-5164-4ecf-8b56-6099e69001bc@gmail.com>
 <CALHNRZ9b98Su9qAqXRSTCStoUPtC_u3+MG0cr4SQ-g3aVJD7LQ@mail.gmail.com>
Content-Language: en-US
From: Jasper Korten <jja2000@gmail.com>
In-Reply-To: <CALHNRZ9b98Su9qAqXRSTCStoUPtC_u3+MG0cr4SQ-g3aVJD7LQ@mail.gmail.com>
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

On 09/12/2025 05:23, Aaron Kling wrote:

> On Wed, Nov 5, 2025 at 3:28 PM Jasper Korten <jja2000@gmail.com> wrote:
>> Hi all,
>>
>> On 11/4/25 19:12, Aaron Kling wrote:
>>> On Tue, Nov 4, 2025 at 3:14 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>>>> On Mon, Nov 03, 2025 at 12:39:57PM -0600, Aaron Kling wrote:
>>>>> On Mon, Nov 3, 2025 at 5:54 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>>>>>> On Sat, Nov 01, 2025 at 06:15:17PM -0500, Aaron Kling via B4 Relay wrote:
>>>>>>> From: Aaron Kling <webgeek1234@gmail.com>
>>>>>>>
>>>>>>> Without the cmu, nvdisplay will display colors that are notably darker
>>>>>>> than intended. The vendor bootloader and the downstream display driver
>>>>>>> enable the cmu and sets a sRGB table. Loading that table here results in
>>>>>>> the intended colors.
>>>>>>>
>>>>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/tegra/dc.h  |  13 +++
>>>>>>>    drivers/gpu/drm/tegra/sor.c | 206 ++++++++++++++++++++++++++++++++++++++++++++
>>>>>>>    2 files changed, 219 insertions(+)
>>>>>> What does "darker than intended" mean? Who defines the intention? How do
>>>>>> we know what the intention is? What this patch ultimately seems to be
>>>>>> doing is define sRGB to be the default colorspace. Is that always the
>>>>>> right default choice? What if people want to specify a different
>>>>>> colorspace?
>>>>> I reported this issue almost a month ago. See kernel lore [0] and
>>>>> freedesktop issue [1]. The pictures in the latter show what nvdisplay
>>>>> looks like right now. It's nigh unusably dark. When booted into
>>>>> Android with a tv launcher that has a black background, as is default
>>>>> for LineageOS, it is really hard to read anything. Is it correct as a
>>>>> default? Well, cboot hardcodes this, so... presumably? It would be
>>>>> more ideal to expose this and csc to userspace, but I'm not sure if
>>>>> drm has a standardized interface for that or if tegra would have to
>>>>> make something vendor specific. I think that would be a separate
>>>>> change concept compared to setting this default, though.
>>>> The reason I'm asking is because I don't recall ever seeing "broken"
>>>> colors like you do. So I suspect that this may also be related to what
>>>> display is connected, or the mode that we're setting.
>> I have tried it on both a MacroSilicon HDMI capture card and an Arzopa
>> Z1FC 1080p portable monitor and run into the same darker colors. Both
>> have in common that they use HDMI which seems to line up with what Aaron
>> is reporting. I do not have an eDP display to test or another carrier
>> board with a different display out to test.
>>>> It could perhaps
>>>> also be related to what infoframes we're sending and how these are
>>>> supported/interpreted by the attached display.
>>>>
>>>> All of that is to say that maybe this looks broken on the particular
>>>> setup that you have but may works fine on other setups. Changing the
>>>> default may fix your setup and break others.
>>> Do you have a device set up so you can check? Or does the regression
>>> test bench have a display that can be forwarded?
>>>
>>> My current setup is a rack of units plugged via hdmi to a kvm which is
>>> then plugged to a pikvm. I also observed this issue before I had this
>>> setup, plugged directly to a 1080p monitor. I have not checked
>>> displayport. I can cycle through a couple other displays without this
>>> patch to see if I get any other result. I am fairly certain I have
>>> consistently seen this issue since I started trying to work with
>>> tegra-drm on kernel 6.1 or maybe even 5.15. I've never seen it work to
>>> allow for a bisect.
>>>
>>> I am in contact with one other person with a tx2 devkit, who
>>> replicated the issue when I asked. Who plans to reply to this thread
>>> with setup info later.
>> For reference, I am said person. I have a Jetson TX2 Devkit that uses
>> the P2771 Device Tree. I'm running a Fedora distrokernel with no
>> additional patches applied by myself. I have personally noticed the
>> issue to at least be present on 6.14.5 and 6.17.4.
>>
>>
>> I'm currently not at home to take screenshots with and without the
>> submitted patch, but will be able to do it tomorrownight or friday.
> Any further thoughts from the maintainers on this patch? As far as I
> know, this is an issue for all users, at the very least on hdmi.
>
> Aaron

I've finally captured some footage of the colors of my TX2 within tty.
I've also added a reference in the form of my X13s doing the same thing.[1]

I will at a later date try the patch and update the MR comment,
but at least this shows the difference while recording using the same setup.

Kindest regards,

Jasper

[1]: https://gitlab.freedesktop.org/drm/tegra/-/issues/8#note_3242611


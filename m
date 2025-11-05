Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6E4C381F6
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 22:56:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8D610E30B;
	Wed,  5 Nov 2025 21:56:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="F1dJDc1b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7984F10E0A4
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 21:28:58 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-b7200568b13so50579866b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Nov 2025 13:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762378137; x=1762982937; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mKVAByp1/+LkpfKD4KN0974hBK7mn9fIh1iZgNrqkQU=;
 b=F1dJDc1bdp8BYtWZIUtEUvnR80CtWqaEfvldz9+vKn5eywZtNN9yEspR/0VKnaxAkO
 lnKcRo1oAZcKJxATyhyCQafQp0x83GIB7lKrkWpRo0Dl42/1f06ZrZ7LUAqWbSWWjzcF
 zMc08D27g/dxhxm8QNCLe9cjkVNkpa7dKVKIPzh6MfzSx6saEKwjAw37aQPuDAfuubuu
 1LVgGc9WtDEjv62fBetLTklOWhuIZGLZXaXIl3bwY+25O/TjLzE7fLtK4qH4uWY1Mmwe
 F0gvUOBqjhJ+jImHKH9x38xViVMv2p+ZHbjsB3Ji/m4irKyF2pDdgoSZOlhYBMvrrC+8
 ibbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762378137; x=1762982937;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mKVAByp1/+LkpfKD4KN0974hBK7mn9fIh1iZgNrqkQU=;
 b=XlG59SlNRTmsZ5vabfzujipy2MyyXQLXdNs59/3r9/h8qvQjs5Pqx83qqKhQIhbqpE
 UKTUOqe3BmMq8rdXVR2Miq1TQGGg0PYq63ll2qCGwSx6xUOPhsr5M5st/qx0CrRjdIOG
 +EEFGK3flXwDccsOqMHN1sLP6hbc777MDcWfOoiBotLTme3vltY1AbRIUnR/U0kyBLtM
 mRqRYUqptyuBv0IsrTSFYEJGBcrDHtNuqj37aMdQMd6USNP6tp/6cs2VhP/xialji+/9
 OCf0RQg+J5+51DD009CJ0/UMZUt+l5QVQmBKkf7gTSR0M1fkiZVvUHUl8iahFjhOY1/I
 1xUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUyROMly7VO5fg/b2EeE2AvA5mkFOaTzlKroNpPKJYMhXbO5rXuWCvnfIbSAa1jKkG/y6jJ8O6fGc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwADhcmxaKE53o5bcH9wIoqKoGJUR77qtyTrD8Grg23hPC7elrB
 8IJa2KUNbO5SSTVmM1yEW+vO43oMV7Wc2DcTbViuSkXiy+Q7VnBK9azo
X-Gm-Gg: ASbGnctRrhqjnwnL3whUjh3eIywOqQSb5IKWu0ZISlLIicroDj988iHZxZbvwoHAveU
 IoXVSBUvoKnNhaQX8EsTrDlsMdYJA9nIDSV9L69yyGnHrXjgNAO5t3zqXcOdlQ7EOBI+qRKeJZO
 9bYB+JOuuiSwQ1wdrUt4sIxHewoDqXvoFW7RoYVasuAgtVo2n83lw3/rRjKKlzd6l3gz9f4wsTG
 6Mwon+paOQVLMJ7mZoqKyxh6f/IXWwy6Z4+U4ppeK+uvjCei2oKwxm9Bu8xv3R5A3eTXczuLPOE
 6hrx6hYIAyPqVV1Fl9dWp6aWD/pVpE0K510S4PZymaz6iRRoJMNyDP0WbPKQK7Wx7veK/HeFHtC
 eP7+hPqHXva0+MXf0IOuG0k9abMXu99lVQM2MA3cCju4Rc7iLTJwdF3P7qAt+smKWF0D9+7GRue
 8h2B/i1hKexgLFjm5HAxySj3H+P/KOG5baCqc407ZcnZY=
X-Google-Smtp-Source: AGHT+IEUf4Irfo3WXUTbyMeP33gFkpX21nJc4K2bsAo4h2zMwVIw3b+fLJ4IkerZJz46FY1W6XtlWQ==
X-Received: by 2002:a17:907:6d27:b0:b6d:7e01:cbc5 with SMTP id
 a640c23a62f3a-b726567f8c8mr491291866b.53.1762378136693; 
 Wed, 05 Nov 2025 13:28:56 -0800 (PST)
Received: from [192.168.4.198] (92-110-11-83.cable.dynamic.v4.ziggo.nl.
 [92.110.11.83]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b728937d2fasm58104466b.19.2025.11.05.13.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Nov 2025 13:28:56 -0800 (PST)
Message-ID: <eac10a43-5164-4ecf-8b56-6099e69001bc@gmail.com>
Date: Wed, 5 Nov 2025 22:28:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tegra: Enable cmu for Tegra186 and Tegra194
To: Aaron Kling <webgeek1234@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251101-tegra-drm-cmu-v1-1-211799755ab8@gmail.com>
 <pedxgtvzfrfzihoshhfvntin3hwwi3znleilbz4abjad74nowb@un33lgiaa26z>
 <CALHNRZ9-XrMUkQE0cwjq-HUYsy5uerhOQ9sNpirp23kKoaPuYw@mail.gmail.com>
 <72llskwvuwyllvz24zoex4ad6v6t5skiehmwylj7exoh7bmzjo@xq3v7vja5w62>
 <CALHNRZ_k6e9ZRmpK6Pzpet=RzUQ0fRYmfnea6U+9E2oZc8=z7w@mail.gmail.com>
Content-Language: en-US
From: Jasper Korten <jja2000@gmail.com>
In-Reply-To: <CALHNRZ_k6e9ZRmpK6Pzpet=RzUQ0fRYmfnea6U+9E2oZc8=z7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 05 Nov 2025 21:56:24 +0000
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

Hi all,

On 11/4/25 19:12, Aaron Kling wrote:
> On Tue, Nov 4, 2025 at 3:14 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>> On Mon, Nov 03, 2025 at 12:39:57PM -0600, Aaron Kling wrote:
>>> On Mon, Nov 3, 2025 at 5:54 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>>>> On Sat, Nov 01, 2025 at 06:15:17PM -0500, Aaron Kling via B4 Relay wrote:
>>>>> From: Aaron Kling <webgeek1234@gmail.com>
>>>>>
>>>>> Without the cmu, nvdisplay will display colors that are notably darker
>>>>> than intended. The vendor bootloader and the downstream display driver
>>>>> enable the cmu and sets a sRGB table. Loading that table here results in
>>>>> the intended colors.
>>>>>
>>>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>>>> ---
>>>>>   drivers/gpu/drm/tegra/dc.h  |  13 +++
>>>>>   drivers/gpu/drm/tegra/sor.c | 206 ++++++++++++++++++++++++++++++++++++++++++++
>>>>>   2 files changed, 219 insertions(+)
>>>> What does "darker than intended" mean? Who defines the intention? How do
>>>> we know what the intention is? What this patch ultimately seems to be
>>>> doing is define sRGB to be the default colorspace. Is that always the
>>>> right default choice? What if people want to specify a different
>>>> colorspace?
>>> I reported this issue almost a month ago. See kernel lore [0] and
>>> freedesktop issue [1]. The pictures in the latter show what nvdisplay
>>> looks like right now. It's nigh unusably dark. When booted into
>>> Android with a tv launcher that has a black background, as is default
>>> for LineageOS, it is really hard to read anything. Is it correct as a
>>> default? Well, cboot hardcodes this, so... presumably? It would be
>>> more ideal to expose this and csc to userspace, but I'm not sure if
>>> drm has a standardized interface for that or if tegra would have to
>>> make something vendor specific. I think that would be a separate
>>> change concept compared to setting this default, though.
>> The reason I'm asking is because I don't recall ever seeing "broken"
>> colors like you do. So I suspect that this may also be related to what
>> display is connected, or the mode that we're setting.
I have tried it on both a MacroSilicon HDMI capture card and an Arzopa 
Z1FC 1080p portable monitor and run into the same darker colors. Both 
have in common that they use HDMI which seems to line up with what Aaron 
is reporting. I do not have an eDP display to test or another carrier 
board with a different display out to test.
>> It could perhaps
>> also be related to what infoframes we're sending and how these are
>> supported/interpreted by the attached display.
>>
>> All of that is to say that maybe this looks broken on the particular
>> setup that you have but may works fine on other setups. Changing the
>> default may fix your setup and break others.
> Do you have a device set up so you can check? Or does the regression
> test bench have a display that can be forwarded?
>
> My current setup is a rack of units plugged via hdmi to a kvm which is
> then plugged to a pikvm. I also observed this issue before I had this
> setup, plugged directly to a 1080p monitor. I have not checked
> displayport. I can cycle through a couple other displays without this
> patch to see if I get any other result. I am fairly certain I have
> consistently seen this issue since I started trying to work with
> tegra-drm on kernel 6.1 or maybe even 5.15. I've never seen it work to
> allow for a bisect.
>
> I am in contact with one other person with a tx2 devkit, who
> replicated the issue when I asked. Who plans to reply to this thread
> with setup info later.

For reference, I am said person. I have a Jetson TX2 Devkit that uses 
the P2771 Device Tree. I'm running a Fedora distrokernel with no 
additional patches applied by myself. I have personally noticed the 
issue to at least be present on 6.14.5 and 6.17.4.


I'm currently not at home to take screenshots with and without the 
submitted patch, but will be able to do it tomorrownight or friday.


Kindest regards,


Jasper

>
> Aaron
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A453C2449
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 15:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2F76EA2A;
	Fri,  9 Jul 2021 13:19:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F566EA2A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 13:19:51 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 90FB68326D;
 Fri,  9 Jul 2021 15:19:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1625836789;
 bh=/1tTQdqGBl6k/yOxU8Glqo/bpxh20lrV8ke+N08B9QU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Ii2gRSNSf6DcNI2g4/V0SkcPmA3oFXsNZ3DKm0bHtjfzZywiqB37uBP8RS5C17DUX
 i/9GtIGwfaFCW7XDQ7SvshHqEwwG3DD74uF7hSf77DlOv2N0b8T2mid68P0s61XfNu
 +WrXlUBOHMx0yRNuPMGJKRVPPdg55fLCzV584OU5Yhv6ESNG69l6o6j4KXIK6Td2sg
 yFnDtIMYS+m4Kz+MbWrUrJcclYrnDo2gIITIXAyj8jiyjiEZgfs+qiQQoEnszs3pbf
 FR153wXqFbeqgqrIYjXN4pX+V0O/l63LZlemir1u/j/zU41dwddneC7jh8bQ8+5bD0
 1Wpn6URHgvG1w==
Subject: Re: [PATCH] video: backlight: Only set maximum brightness for
 gpio-backlight
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20210708091058.56317-1-marex@denx.de>
 <20210709110315.vv5hbngg26o4vj63@maple.lan>
From: Marek Vasut <marex@denx.de>
Message-ID: <6330fc87-333e-f507-0a39-3ca1bfa6b39f@denx.de>
Date: Fri, 9 Jul 2021 15:19:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210709110315.vv5hbngg26o4vj63@maple.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Sean Paul <seanpaul@chromium.org>,
 Meghana Madhyastha <meghana.madhyastha@gmail.com>,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/9/21 1:03 PM, Daniel Thompson wrote:
> On Thu, Jul 08, 2021 at 11:10:58AM +0200, Marek Vasut wrote:
>> The note in c2adda27d202f ("video: backlight: Add of_find_backlight helper
>> in backlight.c") says that gpio-backlight uses brightness as power state.
>> Other backlight drivers do not, so limit this workaround to gpio-backlight.
>>
>> This fixes the case where e.g. pwm-backlight can perfectly well be set to
>> brightness 0 on boot in DT, which without this patch leads to the display
>> brightness to be max instead of off.
>>
>> Fixes: c2adda27d202f ("video: backlight: Add of_find_backlight helper in backlight.c")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Daniel Thompson <daniel.thompson@linaro.org>
>> Cc: Meghana Madhyastha <meghana.madhyastha@gmail.com>
>> Cc: Noralf Trønnes <noralf@tronnes.org>
>> Cc: Sean Paul <seanpaul@chromium.org>
>> Cc: Thierry Reding <treding@nvidia.com>
> 
> I have to admit that this patch really does makes it clear just how
> nasty the hack in of_find_backlight() currently is.
> 
> Moreover I think it is also be obsolete. gpio-backlight power mode
> handling was pretty broken when this code was introduced. It was fixed
> in 2019 by ec665b756e6f ("backlight: gpio backlight: Correct initial
> power state handling") by trying to match the behaviour of PWM
> backlight.  The new code always sets the brightness to 1 so I think we
> can just remove the hack from of_find_backlight() since I think it is
> unreachable.

I assume by "new code" you mean the fixed gpio-backlight driver ?

Dropping the whole code after the Note: is fine by me.

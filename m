Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 097FFD05B6F
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 20:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1F510E384;
	Thu,  8 Jan 2026 19:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RTqkK0ww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A6110E384
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 19:03:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5BFFE60130;
 Thu,  8 Jan 2026 19:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813FDC116C6;
 Thu,  8 Jan 2026 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767899009;
 bh=EshLODRY/dMwTs1Aorg+jUiM2EDzqs+CcePETEAt+ic=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RTqkK0wwaNCmV2+Bt9l+DRj7ZBtcHHuNln/Dp0Y+KKhYSeecMLE0HKaw3Va93hNCE
 IDCFprFV4/bjvkOGbFy54/fi7Chg+JKV9FGRYOV6ds0bFxFYJKSKQOfqc8LhYcFBUU
 9AXbSCWF6y3WyY6iE8U5m+afG/oO4ZPQs7ANNVAfDLnblr7s7KUAGrWX87fdpJfvbF
 eRO5Sg/5DB6PoqAIYc3zHEXjoEIYmuObhkK2FlhXv38/9l/rV+dWDWC6er6tCFub6i
 Z/EJCh1aGHSyYSjCwT5l7hyWHA4WfCRlygh8pGhIGiYkVbPSg8GTRNd8MRsQfrmK2W
 lh09rSoRoNS/g==
Message-ID: <f450c22f-a967-4c83-a7c0-f461fd5f1039@kernel.org>
Date: Thu, 8 Jan 2026 20:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] video/logo: move logo selection logic to Kconfig
To: Geert Uytterhoeven <geert@linux-m68k.org>, Helge Deller <deller@gmx.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>
References: <20260101-custom-logo-v2-0-8eec06dfbf85@kernel.org>
 <20260101-custom-logo-v2-6-8eec06dfbf85@kernel.org>
 <CAMuHMdVy48F5HAfqfJgbY83KDAztb9YWTqm8mT1ntTfj0311oA@mail.gmail.com>
 <dda4052e-b843-43fa-850c-a1bb20e4a8e3@kernel.org>
 <CAMuHMdXz9uKxQ0dH68a+xt4FHqVgdskvO3QRvev1_Wq8h-a1Qg@mail.gmail.com>
 <487ac672-3a2e-4897-aaba-7ae44bcf341a@gmx.de>
 <CAMuHMdUqHUrg6XwqXCSwv-3TwiYUOfbBMpMiuS89d1uwChBYaQ@mail.gmail.com>
From: Vincent Mailhol <mailhol@kernel.org>
Content-Language: en-US
Autocrypt: addr=mailhol@kernel.org; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 JFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbEBrZXJuZWwub3JnPsKZBBMWCgBBFiEE7Y9wBXTm
 fyDldOjiq1/riG27mcIFAmdfB/kCGwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcC
 F4AACgkQq1/riG27mcKBHgEAygbvORJOfMHGlq5lQhZkDnaUXbpZhxirxkAHwTypHr4A/joI
 2wLjgTCm5I2Z3zB8hqJu+OeFPXZFWGTuk0e2wT4JzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrb
 YZzu0JG5w8gxE6EtQe6LmxKMqP6EyR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDl
 dOjiq1/riG27mcIFAmceMvMCGwwFCQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8V
 zsZwr/S44HCzcz5+jkxnVVQ5LZ4BANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <CAMuHMdUqHUrg6XwqXCSwv-3TwiYUOfbBMpMiuS89d1uwChBYaQ@mail.gmail.com>
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

On 07/01/2026 at 14:53, Geert Uytterhoeven wrote:
> Hi Helge,
> 
> On Wed, 7 Jan 2026 at 13:21, Helge Deller <deller@gmx.de> wrote:
>> On 1/7/26 11:36, Geert Uytterhoeven wrote:
>>> On Tue, 6 Jan 2026 at 21:10, Vincent Mailhol <mailhol@kernel.org> wrote:
>>>> On 06/01/2026 at 12:48, Geert Uytterhoeven wrote:
>>>>> Thanks for your patch, which is now commit bd710b3da7308cb1
>>>>> ("video/logo: move logo selection logic to Kconfig") in fbdev/for-next.
>>>>>
>>>>> On Thu, 1 Jan 2026 at 16:26, Vincent Mailhol <mailhol@kernel.org> wrote:
>>>>>> Now that the path to the logo file can be directly entered in Kbuild,
>>>>>> there is no more need to handle all the logo file selection in the
>>>>>> Makefile and the C files.
>>>>>
>>>>> This may do the wrong thing when booting a multi-platform kernel.
>>>>>
>>>>>>
>>>>>> The only exception is the logo_spe_clut224 which is only used by the
>>>>>> Cell processor (found for example in the Playstation 3) [1]. This
>>>>>> extra logo uses its own different image which shows up on a separate
>>>>>> line just below the normal logo. Because the extra logo uses a
>>>>>> different image, it can not be factorized under the custom logo logic.
>>>>>>
>>>>>> Move all the logo file selection logic to Kbuild (except from the
>>>>>> logo_spe_clut224.ppm), this done, clean-up the C code to only leave
>>>>>> one entry for each logo type (monochrome, 16-colors and 224-colors).
>>>>>>
>>>>>> [1] Cell SPE logos
>>>>>> Link: https://lore.kernel.org/all/20070710122702.765654000@pademelon.sonytel.be/
>>>>>>
>>>>>> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
>>>>>
>>>>>> --- a/drivers/video/logo/Kconfig
>>>>>> +++ b/drivers/video/logo/Kconfig
>>>>>
>>>>>> @@ -61,6 +63,12 @@ config LOGO_LINUX_CLUT224
>>>>>>   config LOGO_LINUX_CLUT224_FILE
>>>>>>          string "224-color logo .ppm file"
>>>>>>          depends on LOGO_LINUX_CLUT224
>>>>>> +       default "drivers/video/logo/logo_dec_clut224.ppm" if MACH_DECSTATION || ALPHA
>>>>>> +       default "drivers/video/logo/logo_mac_clut224.ppm" if MAC
>>>>>
>>>>> E.g. an m68k multi-platform kernel including Mac support will scare
>>>>> non-Mac users into thinking their machine was assimilated by the
>>>>> Apple Empire...
> 
>>>>>> --- a/drivers/video/logo/logo.c
>>>>>> +++ b/drivers/video/logo/logo.c
> 
>>>>>> -#ifdef CONFIG_LOGO_MAC_CLUT224
>>>>>> -               /* Macintosh Linux logo on m68k */
>>>>>> -               if (MACH_IS_MAC)
>>>>>
>>>>> MACH_IS_MAC can be a runtime check.
>>>>
>>>> OK. I missed this.
>>>>
>>>> I think there are two options to fix this:
>>>>
>>>>    1. Keep CONFIG_LOGO_MAC_CLUT224 untouched
>>>>    2. Remove logo_mac_clut224.ppm
>>>>
>>>> The first option is less controversial but I would like to ask you what
>>>> you think about removing the logo_mac_clut224 file.
>>>>
>>>> Here, we are speaking of the Macintosh 68k which ended sales in 1995,
>>>> right? So the user base should be rather small, I guess.
>>>
>>> Yes, the user base is small.
>>>
>>> BTW, the only reason you don't have this issue with MACH_DECSTATION and
>>> the various SGI_IP* options is that MIPS does not support multi-platform
>>> kernels.
>>>
>>>> And people who still want the custom MAC logo would still be able to add
>>>>
>>>>    CONFIG_LOGO_MAC_CLUT224="path/to/logo_mac_clut224.ppm"
>>>
>>> LOGO_LINUX_CLUT224_FILE ;-)

D'oh!

>>>> to their config to restore the old behaviour anyway.
>>>>
>>>> My choice would go more toward the removal option but what do you think?
>>>
>>> I am not too attached to keeping the dynamic behavior for the Mac logo,
>>> I just wanted to point out the impact.
>>> I expect most people who care about logos (in products) just have their
>>> own custom out-of-tree code.  As fb_find_logo() and the underlying
>>> infrastructure still exists, I don't expect them to have too much
>>> trouble forward porting that to newer kernels.
>>>
>>> What do other people think?
>>
>> This is about a small visible icon. It's not some relevant feature.
>> So, I think it's unfortunate that the patch then drops the specific mac logo.
>> But adding additional coding and complexity to simply make this logo
>> visible for such a small user base IMHO does not justify the effort.
> 
> This patch does not drop the specific Mac logo.
> Instead, it prioritizes the Mac logo over the generic logo when Mac
> support is enabled in a multi-platform kernel.

It seems that there is a consensus between the three of us that we can
drop the MAC logo.

I will send right away a v3 with will contain one extra patch to drop
the Macintosh logo with a note in the patch of how to restore it using
LOGO_LINUX_CLUT224_FILE.


Yours sincerely,
Vincent Mailhol


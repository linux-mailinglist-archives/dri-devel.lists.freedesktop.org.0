Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 106E54693AE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6BE7AA58;
	Mon,  6 Dec 2021 10:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB10C6EB59
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Dec 2021 06:56:14 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1mtlRU-0007SW-AZ; Sun, 05 Dec 2021 07:56:12 +0100
Message-ID: <d4a5c811-5874-8889-e503-925a9bb5b225@leemhuis.info>
Date: Sun, 5 Dec 2021 07:56:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: 5.15 regression: CONFIG_SYSFB_SIMPLEFB breaks console scrolling
Content-Language: en-BW
To: Javier Martinez Canillas <javierm@redhat.com>,
 Harald Dunkel <harri@afaics.de>
References: <e50d5ad5-19fd-07ae-41e4-5a2d26a98bcf@afaics.de>
 <4bf94684-6410-db9f-5bec-ea0540a2ea76@leemhuis.info>
 <5de368f7-91cd-5998-9fe4-1bf448e32742@redhat.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <5de368f7-91cd-5998-9fe4-1bf448e32742@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1638687374;
 692f0e74; 
X-HE-SMSGID: 1mtlRU-0007SW-AZ
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, this is your Linux kernel regression tracker speaking.

On 03.12.21 12:20, Javier Martinez Canillas wrote:
> Sorry for the late reply.
> 
> On 11/21/21 12:47, Thorsten Leemhuis wrote:
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> On 16.11.21 05:52, Harald Dunkel wrote:
>>>
>>> if I enable CONFIG_SYSFB_SIMPLEFB in 5.15.2 and use grub's default
>>> configuration
>>> (Debian sid amd64), then a few lines at the bottom of /dev/tty1 including
>>> login prompt are off-screen. Scrolling is broken. I can login, though.
>>>
>>> Enabling GRUB_TERMINAL=console in grub doesn't make a difference. Using
>>> the same kernel except for CONFIG_SYSFB_SIMPLEFB the problem is gone.
>>>
>>> Graphics card is a GeForce GTX 1650. I tried with both CONFIG_DRM_NOUVEAU
>>> and proprietary graphics drivers disabled.
>>>
>>> Attached you can find the config file. Please mail if I can help to track
>>> this problem down.
>>
>> Thx for the report. I'm not totally sure if this is a regression, as
>> that's a new config option. But it might be one considered a successor
>> to an older one, hence it might count as regression. Adding two
>> developers and a mailing list to the CC, hopefully someone can clarify.
> 
> I don't think this is a regression since enabling CONFIG_SYSFB_SIMPLEFB will
> make the simpledrm driver to be bound while disabling the option makes the
> efifb driver to be bound instead.
>  Yes, it seems to be a bug in the simpledrm driver but the solution if you
> have issues with the simpledrm is to not enable CONFIG_SYSFB_SIMPLEFB and
> keep using the old fbdev driver.

Mandy thx for the answer, Javier. Harald is quiet for some time already
and didn't object so far, hence I'll remove this from regzbot:

#regzbot invalid: problem caused by a new CONFIG option

Ciao, Thorsten

P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
on my table. I can only look briefly into most of them. Unfortunately
therefore I sometimes will get things wrong or miss something important.
I hope that's not the case here; if you think it is, don't hesitate to
tell me about it in a public reply. That's in everyone's interest, as
what I wrote above might be misleading to everyone reading this; any
suggestion I gave they thus might sent someone reading this down the
wrong rabbit hole, which none of us wants.

BTW, I have no personal interest in this issue, which is tracked using
regzbot, my Linux kernel regression tracking bot
(https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
this mail to get things rolling again and hence don't need to be CC on
all further activities wrt to this regression.

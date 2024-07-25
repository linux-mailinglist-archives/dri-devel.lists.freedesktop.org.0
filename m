Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7AA93C0FF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 13:40:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AE810E123;
	Thu, 25 Jul 2024 11:40:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="iwmmXcM0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C0B10E123
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 11:40:07 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1721907605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MKkwczeb2Wdcu0GU+l0zWcYRLI5FKPw8pU+pCi+Cqrw=;
 b=iwmmXcM0LsY1zREoBfPNApQ6r4uYOh8RWwwp90sHG0VZkq9+xeiaXJfGXQ+ENYaMGp6vsR
 p2KUrRoH2liOnZqFwuG7Ou8l9h1CPkZMXmny1KxOYMk0JsrWVVr7E5+UtpdTXDmZ5FdZsP
 hXoK96OBoYMPC3/aP2oN9SiItXtoHsfM9Ona3Cqk6jfsjS3cfCzbYWQFqDvPu9/uwAaWiv
 T5bd4Et8osUejwVE1pjv1phmp15g6RbQoXrlkJRuobaErv+lY1lf2TDQMDKJA/WzLuehCc
 PY5qN/2U1IBCvC3GjzhE5KD1NecT4eiSyIVFeb2mzOwd53cfg3yym2+9gJMebA==
Date: Thu, 25 Jul 2024 13:40:04 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 robh@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 linux-kernel@vger.kernel.org, Diederik de Haas <didi.debian@cknow.org>,
 Furkan Kardame <f.kardame@manjaro.org>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/panfrost: Mark simple_ondemand governor as softdep
In-Reply-To: <ae62139f-3655-44d0-aeb7-15c6b67eb97c@arm.com>
References: <4e1e00422a14db4e2a80870afb704405da16fd1b.1718655077.git.dsimic@manjaro.org>
 <f672e7460c92bc9e0c195804f7e99d0b@manjaro.org>
 <e42a55ba-cbb5-47a4-bec6-9c3067040970@arm.com>
 <192dbcd968dfebf825a3a759701bf381@manjaro.org>
 <d20667e76aa56fb69c91ef327d467d4a@manjaro.org>
 <ae62139f-3655-44d0-aeb7-15c6b67eb97c@arm.com>
Message-ID: <c2b1016fb633f89cfeb96da2b761e494@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
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

Hello Steven,

On 2024-07-25 11:20, Steven Price wrote:
> On 25/07/2024 09:24, Dragan Simic wrote:
>> Hello Steven and Boris,
> 
> <snip>
> 
>> Another option has become available for expressing additional module
>> dependencies, weakdeps. [1][2]  Long story short, weakdeps are similar
>> to softdeps, in the sense of telling the initial ramdisk utilities to
>> include additional kernel modules, but weakdeps result in no module
>> loading being performed by userspace.
>> 
>> Maybe "weak" isn't the best possible word choice (arguably, "soft" 
>> also
>> wasn't the best word choice), but weakdeps should be a better choice 
>> for
>> use with Panfrost and governor_simpleondemand, because weakdeps 
>> provide
>> the required information to the utilities used to generate initial
>> ramdisks,
>> while the actual module loading is left to the kernel.
>> 
>> The recent addition of weakdeps renders the previously mentioned 
>> harddeps
>> obsolete, because weakdeps actually do what we need.  Obviously, 
>> "weak"
>> doesn't go along very well with the actual nature of the dependency 
>> between
>> Panfrost and governor_simpleondemand, but it's pretty much just the
>> somewhat
>> unfortunate word choice.
>> 
>> The support for weakdeps has been already added to the kmod [3][4] and
>> Dracut [5] userspace utilities.  I'll hopefully add support for 
>> weakdeps
>> to mkinitcpio [6] rather soon.
> 
> That sounds much closer to the dependency we want to advertise for
> Panfrost so that's great.
> 
>> Maybe we could actually add MODULE_HARDDEP() as some kind of syntactic
>> sugar, which would currently be an alias for MODULE_WEAKDEP(), so the
>> actual hard module dependencies could be expressed properly, and 
>> possibly
>> handled differently in the future, with no need to go back and track 
>> all
>> such instances of hard module dependencies.
> 
> Please do! While "weak" dependencies tell the initramfs tools what to
> put in, it would be good to be able to actually express that this 
> module
> actually requires the governor.

Great, I'm glad that you agree.  Here's the MODULE_HARDDEP() patch on
the linux-modules mailing list, and we'll see will it be accepted:

https://lore.kernel.org/linux-modules/04e0676b0e77c5eb69df6972f41d77cdf061265a.1721906745.git.dsimic@manjaro.org/T/#u

> I can see the potential utility in
> initramfs tools wanting to put a module in without "weak" dependencies
> if initramfs size was limited[1] and "limited support" was appropriate,
> and that's not what Panfrost gives. So having a way of fixing this in
> the future without churn in driver would be good.

Sure, that's a good example, but unfortunately, omitting weakdep modules
that way from the initial ramdisk, and keeping only the harddep modules,
wouldn't be that simple. :(  In fact, it's unknown which one(s) of the
weakdep modules is/are actually needed on some platform or device, so
pruning the weakdep modules would require some additional information,
to end up with a fully functional device after booting it up.

Of course, the distinction between the harddeps and the weakdeps opens
up a path towards using such additional "pruning information" in a safe
and robust way, by ensuring that the absolutely required harddep modules
aren't pruned away.

This is just another example of how "weak" was a somewhat
unfortunate word choice, but we've got to live with it. :)

>> With all this in mind, here's what I'm going to do:
>> 
>> 1) Submit a patch that adds MODULE_HARDDEP() as syntactic sugar
>> 2) Implement support for weakdeps in Arch Linux's mkinitcpio [6]
>> 3) Depending on what kind of feedback the MODULE_HARDDEP() patch 
>> receives,
>>    I'll submit follow-up patches for Lima and Panfrost, which will 
>> swap
>>    uses of MODULE_SOFTDEP() with MODULE_HARDDEP() or MODULE_WEAKDEP()
> 
> It sounds good from my perspective. It will be interesting to see what
> feedback comes from people more familiar with initramfs tools.

Great, thanks once again!

> [1] Although from my understanding it's firmware which is the real 
> cause
> of bloat in initramfs size. I guess I need to start paying attention to
> this for panthor which adds GPU firmware - although currently tiny in
> comparison to others.

We might have a solution for the initramfs bloat induced by the firmware
blobs, which I'm going to fight for, one way or another. :)  Though, 
only
time will tell will the related patches be accepted. [7]

[7] 
https://lore.kernel.org/linux-rockchip/9b7a9e9b88ad8c7489ee1b4c70b8751eeb5cf6f9.1720049413.git.dsimic@manjaro.org/T/#u

>> Looking forward to your thoughts.
>> 
>> [1] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/linux/module.h?id=61842868de13aa7fd7391c626e889f4d6f1450bf
>> [2] 
>> https://lore.kernel.org/linux-kernel/20240724102349.430078-1-jtornosm@redhat.com/T/#u
>> [3] 
>> https://github.com/kmod-project/kmod/commit/05828b4a6e9327a63ef94df544a042b5e9ce4fe7
>> [4] 
>> https://github.com/kmod-project/kmod/commit/d06712b51404061eef92cb275b8303814fca86ec
>> [5] 
>> https://github.com/dracut-ng/dracut-ng/commit/8517a6be5e20f4a6d87e55fce35ee3e29e2a1150
>> [6] https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio
>> 
>>>>> If a filesystem driver can rely on the (ab)use of softdeps, which
>>>>> may be
>>>>> fragile or seen as a bit wrong, I think we can follow the same
>>>>> approach,
>>>>> at least until a better solution is available.
>>>>> 
>>>>> [6]
>>>>> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0c94f58cef319ad054fd909b3bf4b7d09c03e11c
>>>>> [7]
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d5178578bcd4
>>>>> [8]
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/btrfs/super.c#n2593
>>>>> 
>>>>>> ---
>>>>>>  drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
>>>>>>  1 file changed, 1 insertion(+)
>>>>>> 
>>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>>>> b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>>>> index ef9f6c0716d5..149737d7a07e 100644
>>>>>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>>>> @@ -828,3 +828,4 @@ module_platform_driver(panfrost_driver);
>>>>>>  MODULE_AUTHOR("Panfrost Project Developers");
>>>>>>  MODULE_DESCRIPTION("Panfrost DRM Driver");
>>>>>>  MODULE_LICENSE("GPL v2");
>>>>>> +MODULE_SOFTDEP("pre: governor_simpleondemand");

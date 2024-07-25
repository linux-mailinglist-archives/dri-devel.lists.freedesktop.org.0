Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 516C593BEEB
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 11:20:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A55E10E03F;
	Thu, 25 Jul 2024 09:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 066A910E03F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 09:20:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBEF81007;
 Thu, 25 Jul 2024 02:20:51 -0700 (PDT)
Received: from [10.1.29.30] (e122027.cambridge.arm.com [10.1.29.30])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00ED93F5A1;
 Thu, 25 Jul 2024 02:20:23 -0700 (PDT)
Message-ID: <ae62139f-3655-44d0-aeb7-15c6b67eb97c@arm.com>
Date: Thu, 25 Jul 2024 10:20:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Mark simple_ondemand governor as softdep
To: Dragan Simic <dsimic@manjaro.org>
Cc: dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 robh@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 linux-kernel@vger.kernel.org, Diederik de Haas <didi.debian@cknow.org>,
 Furkan Kardame <f.kardame@manjaro.org>, stable@vger.kernel.org
References: <4e1e00422a14db4e2a80870afb704405da16fd1b.1718655077.git.dsimic@manjaro.org>
 <f672e7460c92bc9e0c195804f7e99d0b@manjaro.org>
 <e42a55ba-cbb5-47a4-bec6-9c3067040970@arm.com>
 <192dbcd968dfebf825a3a759701bf381@manjaro.org>
 <d20667e76aa56fb69c91ef327d467d4a@manjaro.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <d20667e76aa56fb69c91ef327d467d4a@manjaro.org>
Content-Type: text/plain; charset=UTF-8
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

Hi Dragan,

On 25/07/2024 09:24, Dragan Simic wrote:
> Hello Steven and Boris,

<snip>

> Another option has become available for expressing additional module
> dependencies, weakdeps. [1][2]  Long story short, weakdeps are similar
> to softdeps, in the sense of telling the initial ramdisk utilities to
> include additional kernel modules, but weakdeps result in no module
> loading being performed by userspace.
> 
> Maybe "weak" isn't the best possible word choice (arguably, "soft" also
> wasn't the best word choice), but weakdeps should be a better choice for
> use with Panfrost and governor_simpleondemand, because weakdeps provide
> the required information to the utilities used to generate initial
> ramdisks,
> while the actual module loading is left to the kernel.
> 
> The recent addition of weakdeps renders the previously mentioned harddeps
> obsolete, because weakdeps actually do what we need.  Obviously, "weak"
> doesn't go along very well with the actual nature of the dependency between
> Panfrost and governor_simpleondemand, but it's pretty much just the
> somewhat
> unfortunate word choice.
> 
> The support for weakdeps has been already added to the kmod [3][4] and
> Dracut [5] userspace utilities.  I'll hopefully add support for weakdeps
> to mkinitcpio [6] rather soon.

That sounds much closer to the dependency we want to advertise for
Panfrost so that's great.

> Maybe we could actually add MODULE_HARDDEP() as some kind of syntactic
> sugar, which would currently be an alias for MODULE_WEAKDEP(), so the
> actual hard module dependencies could be expressed properly, and possibly
> handled differently in the future, with no need to go back and track all
> such instances of hard module dependencies.

Please do! While "weak" dependencies tell the initramfs tools what to
put in, it would be good to be able to actually express that this module
actually requires the governor. I can see the potential utility in
initramfs tools wanting to put a module in without "weak" dependencies
if initramfs size was limited[1] and "limited support" was appropriate,
and that's not what Panfrost gives. So having a way of fixing this in
the future without churn in driver would be good.

> With all this in mind, here's what I'm going to do:
> 
> 1) Submit a patch that adds MODULE_HARDDEP() as syntactic sugar
> 2) Implement support for weakdeps in Arch Linux's mkinitcpio [6]
> 3) Depending on what kind of feedback the MODULE_HARDDEP() patch receives,
>    I'll submit follow-up patches for Lima and Panfrost, which will swap
>    uses of MODULE_SOFTDEP() with MODULE_HARDDEP() or MODULE_WEAKDEP()

It sounds good from my perspective. It will be interesting to see what
feedback comes from people more familiar with initramfs tools.

Thanks,

Steve

[1] Although from my understanding it's firmware which is the real cause
of bloat in initramfs size. I guess I need to start paying attention to
this for panthor which adds GPU firmware - although currently tiny in
comparison to others.

> Looking forward to your thoughts.
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/linux/module.h?id=61842868de13aa7fd7391c626e889f4d6f1450bf
> [2]
> https://lore.kernel.org/linux-kernel/20240724102349.430078-1-jtornosm@redhat.com/T/#u
> [3]
> https://github.com/kmod-project/kmod/commit/05828b4a6e9327a63ef94df544a042b5e9ce4fe7
> [4]
> https://github.com/kmod-project/kmod/commit/d06712b51404061eef92cb275b8303814fca86ec
> [5]
> https://github.com/dracut-ng/dracut-ng/commit/8517a6be5e20f4a6d87e55fce35ee3e29e2a1150
> [6] https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio
> 
>>>> If a filesystem driver can rely on the (ab)use of softdeps, which
>>>> may be
>>>> fragile or seen as a bit wrong, I think we can follow the same
>>>> approach,
>>>> at least until a better solution is available.
>>>>
>>>> [6]
>>>> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0c94f58cef319ad054fd909b3bf4b7d09c03e11c
>>>> [7]
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d5178578bcd4
>>>> [8]
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/btrfs/super.c#n2593
>>>>
>>>>> ---
>>>>>  drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>>> b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>>> index ef9f6c0716d5..149737d7a07e 100644
>>>>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>>> @@ -828,3 +828,4 @@ module_platform_driver(panfrost_driver);
>>>>>  MODULE_AUTHOR("Panfrost Project Developers");
>>>>>  MODULE_DESCRIPTION("Panfrost DRM Driver");
>>>>>  MODULE_LICENSE("GPL v2");
>>>>> +MODULE_SOFTDEP("pre: governor_simpleondemand");


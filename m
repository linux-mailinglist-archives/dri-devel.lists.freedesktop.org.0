Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6270793BDE4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 10:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D5510E269;
	Thu, 25 Jul 2024 08:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="tbn/p/R8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6443C10E269
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 08:24:09 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1721895847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7HYnW+Nl3MdFFOY14aJKMCJCcy27SKGZVNUgmyKfR2g=;
 b=tbn/p/R8JTZFUnBu1wXhDtIlzH5W150mmBC4FE3EjcRhwKYB+4Si8Lua2Kv3d+r/cNDYzJ
 7ry8f/lIty0BTc6GuOH88/5y1e6GI/txt6HkjKvoDYnbNM/PUIighd5lTHI1N7AXA3KeL1
 mvgULOdczJREgDujGZFEpYSCkfXlk0i0JXTiM70jgL1bTxT3W5uCY2+PIysqC7opAjINT0
 U72CMW0r+WVJmTJKAkGdJY1tMqes3yBl//SUqVv6JZawPp2bxjyk704L9WniSCuB9Jd7oS
 mOJgfEzQCic6MhMmaOrp8izt0DQ43BgjTEpDDPyyUu91+fN0MB8WovUayTZafw==
Date: Thu, 25 Jul 2024 10:24:07 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 robh@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 linux-kernel@vger.kernel.org, Diederik de Haas <didi.debian@cknow.org>,
 Furkan Kardame <f.kardame@manjaro.org>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/panfrost: Mark simple_ondemand governor as softdep
In-Reply-To: <192dbcd968dfebf825a3a759701bf381@manjaro.org>
References: <4e1e00422a14db4e2a80870afb704405da16fd1b.1718655077.git.dsimic@manjaro.org>
 <f672e7460c92bc9e0c195804f7e99d0b@manjaro.org>
 <e42a55ba-cbb5-47a4-bec6-9c3067040970@arm.com>
 <192dbcd968dfebf825a3a759701bf381@manjaro.org>
Message-ID: <d20667e76aa56fb69c91ef327d467d4a@manjaro.org>
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

Hello Steven and Boris,

On 2024-07-03 16:52, Dragan Simic wrote:
> On 2024-07-03 15:20, Steven Price wrote:
>> On 03/07/2024 13:42, Dragan Simic wrote:
>>> On 2024-06-17 22:17, Dragan Simic wrote:
>>>> Panfrost DRM driver uses devfreq to perform DVFS, while using
>>>> simple_ondemand
>>>> devfreq governor by default.  This causes driver initialization to
>>>> fail on
>>>> boot when simple_ondemand governor isn't built into the kernel
>>>> statically,
>>>> as a result of the missing module dependency and, consequently, the
>>>> required
>>>> governor module not being included in the initial ramdisk.  Thus,
>>>> let's mark
>>>> simple_ondemand governor as a softdep for Panfrost, to have its 
>>>> kernel
>>>> module
>>>> included in the initial ramdisk.
>>>> 
>>>> This is a rather longstanding issue that has forced distributions to
>>>> build
>>>> devfreq governors statically into their kernels, [1][2] or has 
>>>> forced
>>>> users
>>>> to introduce some unnecessary workarounds. [3]
>>>> 
>>>> For future reference, not having support for the simple_ondemand
>>>> governor in
>>>> the initial ramdisk produces errors in the kernel log similar to 
>>>> these
>>>> below,
>>>> which were taken from a Pine64 RockPro64:
>>>> 
>>>>   panfrost ff9a0000.gpu: [drm:panfrost_devfreq_init [panfrost]]
>>>> *ERROR* Couldn't initialize GPU devfreq
>>>>   panfrost ff9a0000.gpu: Fatal error during GPU init
>>>>   panfrost: probe of ff9a0000.gpu failed with error -22
>>>> 
>>>> Having simple_ondemand marked as a softdep for Panfrost may not
>>>> resolve this
>>>> issue for all Linux distributions.  In particular, it will remain
>>>> unresolved
>>>> for the distributions whose utilities for the initial ramdisk
>>>> generation do
>>>> not handle the available softdep information [4] properly yet. 
>>>> However, some
>>>> Linux distributions already handle softdeps properly while 
>>>> generating
>>>> their
>>>> initial ramdisks, [5] and this is a prerequisite step in the right
>>>> direction
>>>> for the distributions that don't handle them properly yet.
>>>> 
>>>> [1] 
>>>> https://gitlab.manjaro.org/manjaro-arm/packages/core/linux/-/blob/linux61/config?ref_type=heads#L8180
>>>> [2] https://salsa.debian.org/kernel-team/linux/-/merge_requests/1066
>>>> [3] https://forum.pine64.org/showthread.php?tid=15458
>>>> [4] 
>>>> https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/commit/?id=49d8e0b59052999de577ab732b719cfbeb89504d
>>>> [5] 
>>>> https://github.com/archlinux/mkinitcpio/commit/97ac4d37aae084a050be512f6d8f4489054668ad
>>>> 
>>>> Cc: Diederik de Haas <didi.debian@cknow.org>
>>>> Cc: Furkan Kardame <f.kardame@manjaro.org>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
>>>> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> 
>> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> Thanks!
> 
>>> Just checking, could this patch be accepted, please?  The Lima 
>>> counterpart
>>> has already been accepted. [6]
>> 
>> Thanks for the prod - I have to admit I saw there was discussion about
>> the Lima patch and so just put this on my list to look again later 
>> after
>> the discussion had reached a conclusion.
>> 
>>> The approach in this patch is far from perfect, but it's still fine 
>>> until
>>> there's a better solution, such as harddeps.  I'll continue my 
>>> research
>>> about the possibility for introducing harddeps, which would hopefully
>>> replace quite a few instances of the softdep (ab)use that already 
>>> extend
>>> rather far.  For example, have a look at the commit d5178578bcd4 
>>> (btrfs:
>>> directly call into crypto framework for checksumming) [7] and the 
>>> lines
>>> containing MODULE_SOFTDEP() at the very end of fs/btrfs/super.c. [8]
>> 
>> I agree - it's not perfect, but it's the best we have for now. I hope
>> sometime we'll have a cleaner solution to express dependencies like 
>> this
>> (good luck! ;) ).
> 
> Thanks. :)  Implementing harddeps is _relatively_ straightforward, but
> getting full support for harddeps reach various Linux distributions is
> going to be an uphill battle without doubt. :)

Another option has become available for expressing additional module
dependencies, weakdeps. [1][2]  Long story short, weakdeps are similar
to softdeps, in the sense of telling the initial ramdisk utilities to
include additional kernel modules, but weakdeps result in no module
loading being performed by userspace.

Maybe "weak" isn't the best possible word choice (arguably, "soft" also
wasn't the best word choice), but weakdeps should be a better choice for
use with Panfrost and governor_simpleondemand, because weakdeps provide
the required information to the utilities used to generate initial 
ramdisks,
while the actual module loading is left to the kernel.

The recent addition of weakdeps renders the previously mentioned 
harddeps
obsolete, because weakdeps actually do what we need.  Obviously, "weak"
doesn't go along very well with the actual nature of the dependency 
between
Panfrost and governor_simpleondemand, but it's pretty much just the 
somewhat
unfortunate word choice.

The support for weakdeps has been already added to the kmod [3][4] and
Dracut [5] userspace utilities.  I'll hopefully add support for weakdeps
to mkinitcpio [6] rather soon.

Maybe we could actually add MODULE_HARDDEP() as some kind of syntactic
sugar, which would currently be an alias for MODULE_WEAKDEP(), so the
actual hard module dependencies could be expressed properly, and 
possibly
handled differently in the future, with no need to go back and track all
such instances of hard module dependencies.

With all this in mind, here's what I'm going to do:

1) Submit a patch that adds MODULE_HARDDEP() as syntactic sugar
2) Implement support for weakdeps in Arch Linux's mkinitcpio [6]
3) Depending on what kind of feedback the MODULE_HARDDEP() patch 
receives,
    I'll submit follow-up patches for Lima and Panfrost, which will swap
    uses of MODULE_SOFTDEP() with MODULE_HARDDEP() or MODULE_WEAKDEP()

Looking forward to your thoughts.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/linux/module.h?id=61842868de13aa7fd7391c626e889f4d6f1450bf
[2] 
https://lore.kernel.org/linux-kernel/20240724102349.430078-1-jtornosm@redhat.com/T/#u
[3] 
https://github.com/kmod-project/kmod/commit/05828b4a6e9327a63ef94df544a042b5e9ce4fe7
[4] 
https://github.com/kmod-project/kmod/commit/d06712b51404061eef92cb275b8303814fca86ec
[5] 
https://github.com/dracut-ng/dracut-ng/commit/8517a6be5e20f4a6d87e55fce35ee3e29e2a1150
[6] https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio

>>> If a filesystem driver can rely on the (ab)use of softdeps, which may 
>>> be
>>> fragile or seen as a bit wrong, I think we can follow the same 
>>> approach,
>>> at least until a better solution is available.
>>> 
>>> [6] 
>>> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0c94f58cef319ad054fd909b3bf4b7d09c03e11c
>>> [7] 
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d5178578bcd4
>>> [8] 
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/btrfs/super.c#n2593
>>> 
>>>> ---
>>>>  drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>> 
>>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>> b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>> index ef9f6c0716d5..149737d7a07e 100644
>>>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>>> @@ -828,3 +828,4 @@ module_platform_driver(panfrost_driver);
>>>>  MODULE_AUTHOR("Panfrost Project Developers");
>>>>  MODULE_DESCRIPTION("Panfrost DRM Driver");
>>>>  MODULE_LICENSE("GPL v2");
>>>> +MODULE_SOFTDEP("pre: governor_simpleondemand");

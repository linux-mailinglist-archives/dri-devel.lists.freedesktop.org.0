Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AC09263CA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 16:49:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8195510E5E8;
	Wed,  3 Jul 2024 14:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="WAxaq9Dx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E306E10E21D
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 14:49:20 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1720018159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FaazyLlKdXW4WXKyio+6fXxuwVKriyYkk8vxd9038zc=;
 b=WAxaq9Dx1J3KB4oM3qkAtns5CdR3S6umwWTWFKb6qutsLduuLI2KJ3bQhkh/USVYfo2aXG
 KHly7Ng5gUokugZic7KvYrZEC7J6tAGSnFYqrCF3l1AQeKvLwvVP40oylr4lGmpkuwaCeC
 7oiTJuKitaj2+b56jw8wSjsOi2+2NSqigAQe0T6GnUr3YGKD1ZSmwpdvLa6Pwgwz2K/Q+B
 ygfG0+tVrP3Yw826Y8zdN5Gg2WNW74XNlo+8vHtpZw6CLKrdXsnfxmm6rg8wvJPZbB7TBm
 IzBjXij/HtdSlG1F/3IOXR06kH/4laX+3apwaXMXi/6dcmWxHBBB7tOMAttaTg==
Date: Wed, 03 Jul 2024 16:49:18 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, steven.price@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, linux-kernel@vger.kernel.org, Diederik
 de Haas <didi.debian@cknow.org>, Furkan Kardame <f.kardame@manjaro.org>,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm/panfrost: Mark simple_ondemand governor as softdep
In-Reply-To: <20240703152018.02e4e461@collabora.com>
References: <4e1e00422a14db4e2a80870afb704405da16fd1b.1718655077.git.dsimic@manjaro.org>
 <f672e7460c92bc9e0c195804f7e99d0b@manjaro.org>
 <20240703152018.02e4e461@collabora.com>
Message-ID: <98eb956fa8379d8e7b4b6f1ba4fbc81d@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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

On 2024-07-03 15:20, Boris Brezillon wrote:
> On Wed, 03 Jul 2024 14:42:37 +0200
> Dragan Simic <dsimic@manjaro.org> wrote:
>> On 2024-06-17 22:17, Dragan Simic wrote:
>> > Panfrost DRM driver uses devfreq to perform DVFS, while using
>> > simple_ondemand
>> > devfreq governor by default.  This causes driver initialization to fail
>> > on
>> > boot when simple_ondemand governor isn't built into the kernel
>> > statically,
>> > as a result of the missing module dependency and, consequently, the
>> > required
>> > governor module not being included in the initial ramdisk.  Thus, let's
>> > mark
>> > simple_ondemand governor as a softdep for Panfrost, to have its kernel
>> > module
>> > included in the initial ramdisk.
>> >
>> > This is a rather longstanding issue that has forced distributions to
>> > build
>> > devfreq governors statically into their kernels, [1][2] or has forced
>> > users
>> > to introduce some unnecessary workarounds. [3]
>> >
>> > For future reference, not having support for the simple_ondemand
>> > governor in
>> > the initial ramdisk produces errors in the kernel log similar to these
>> > below,
>> > which were taken from a Pine64 RockPro64:
>> >
>> >   panfrost ff9a0000.gpu: [drm:panfrost_devfreq_init [panfrost]]
>> > *ERROR* Couldn't initialize GPU devfreq
>> >   panfrost ff9a0000.gpu: Fatal error during GPU init
>> >   panfrost: probe of ff9a0000.gpu failed with error -22
>> >
>> > Having simple_ondemand marked as a softdep for Panfrost may not resolve
>> > this
>> > issue for all Linux distributions.  In particular, it will remain
>> > unresolved
>> > for the distributions whose utilities for the initial ramdisk
>> > generation do
>> > not handle the available softdep information [4] properly yet.
>> > However, some
>> > Linux distributions already handle softdeps properly while generating
>> > their
>> > initial ramdisks, [5] and this is a prerequisite step in the right
>> > direction
>> > for the distributions that don't handle them properly yet.
>> >
>> > [1]
>> > https://gitlab.manjaro.org/manjaro-arm/packages/core/linux/-/blob/linux61/config?ref_type=heads#L8180
>> > [2] https://salsa.debian.org/kernel-team/linux/-/merge_requests/1066
>> > [3] https://forum.pine64.org/showthread.php?tid=15458
>> > [4]
>> > https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/commit/?id=49d8e0b59052999de577ab732b719cfbeb89504d
>> > [5]
>> > https://github.com/archlinux/mkinitcpio/commit/97ac4d37aae084a050be512f6d8f4489054668ad
>> >
>> > Cc: Diederik de Haas <didi.debian@cknow.org>
>> > Cc: Furkan Kardame <f.kardame@manjaro.org>
>> > Cc: stable@vger.kernel.org
>> > Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
>> > Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> 
>> Just checking, could this patch be accepted, please?
> 
> Yes, sorry for the delay. Here's my
> 
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

No worries, and thanks!

> Steve, any objection?
> 
>> The Lima
>> counterpart
>> has already been accepted. [6]
>> 
>> The approach in this patch is far from perfect, but it's still fine
>> until
>> there's a better solution, such as harddeps.  I'll continue my 
>> research
>> about the possibility for introducing harddeps, which would hopefully
>> replace quite a few instances of the softdep (ab)use that already 
>> extend
>> rather far.  For example, have a look at the commit d5178578bcd4 
>> (btrfs:
>> directly call into crypto framework for checksumming) [7] and the 
>> lines
>> containing MODULE_SOFTDEP() at the very end of fs/btrfs/super.c. [8]
>> 
>> If a filesystem driver can rely on the (ab)use of softdeps, which may 
>> be
>> fragile or seen as a bit wrong, I think we can follow the same 
>> approach,
>> at least until a better solution is available.
>> 
>> [6]
>> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=0c94f58cef319ad054fd909b3bf4b7d09c03e11c
>> [7]
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d5178578bcd4
>> [8]
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/btrfs/super.c#n2593
>> 
>> > ---
>> >  drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c
>> > b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> > index ef9f6c0716d5..149737d7a07e 100644
>> > --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>> > +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> > @@ -828,3 +828,4 @@ module_platform_driver(panfrost_driver);
>> >  MODULE_AUTHOR("Panfrost Project Developers");
>> >  MODULE_DESCRIPTION("Panfrost DRM Driver");
>> >  MODULE_LICENSE("GPL v2");
>> > +MODULE_SOFTDEP("pre: governor_simpleondemand");

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A3A92C06A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 18:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C1D10E606;
	Tue,  9 Jul 2024 16:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="rMxkriDa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDEA10E607
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 16:36:57 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1720543011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qb4jsYTIQzitlWMV3L8IKAQqxT2vxmP2fmC44qXIKog=;
 b=rMxkriDamSGiRoMubJ+OPvOCJy32kDnf0T4D7nNs6RWEub+6GnN3/pLIhEzQki3IbyZkPe
 XLrpTUWPjcJH07oYxVhmZcaOlrwabSoFRly/Kxnxp9YKinHoy8f5+Qma+8fCRuOpK16NlG
 goGqtuxbimiKzWa5Yml+VK6CmM8el4k0YGHYTwXcmye/BzXUGzgDgf3rkLEyWi1X6dZf/D
 cFduWZy3kPDGRXI813Vp4EciWmCojBkP+p93O5cUsHLGImeHE4Zq8cHhpQK6iaQ60JXLVH
 7rRkAjj/kYj8JAEq9d6xuK1uTAmm+uWr6Thsq2IgLzPCSACyM3X7W2uFprU5Qg==
Date: Tue, 09 Jul 2024 18:36:08 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andy Yan <andyshrk@163.com>, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, heiko@sntech.de, hjc@rock-chips.com,
 andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 javierm@redhat.com
Subject: Re: [PATCH] drm/rockchip: cdn-dp: Remove redundant workarounds for
 firmware loading
In-Reply-To: <20240709-exuberant-tentacled-oxpecker-bd1ea0@houat>
References: <9b7a9e9b88ad8c7489ee1b4c70b8751eeb5cf6f9.1720049413.git.dsimic@manjaro.org>
 <109c6f19.2559.1907b817a99.Coremail.andyshrk@163.com>
 <0bf4701d98833609b917983718c610aa@manjaro.org>
 <2fd3aabd.785b.190914ec1a6.Coremail.andyshrk@163.com>
 <f0fb9feed2d9262bb4d7c8ade836af62@manjaro.org>
 <909d072.9028.19096c2429a.Coremail.andyshrk@163.com>
 <31062b80d3f9e11c339c400a70464f43@manjaro.org>
 <20240709-exuberant-tentacled-oxpecker-bd1ea0@houat>
Message-ID: <b6d630447e6c69e913b76650d910f895@manjaro.org>
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

Hello Maxime,

On 2024-07-09 13:09, Maxime Ripard wrote:
> On Tue, Jul 09, 2024 at 12:10:51PM GMT, Dragan Simic wrote:
>> On 2024-07-09 11:10, Andy Yan wrote:
>> > At 2024-07-09 16:17:06, "Dragan Simic" <dsimic@manjaro.org> wrote:
>> > > On 2024-07-08 09:46, Andy Yan wrote:
>> > > > At 2024-07-04 18:35:42, "Dragan Simic" <dsimic@manjaro.org> wrote:
>> > > > > On 2024-07-04 04:10, Andy Yan wrote:
>> > > > > > At 2024-07-04 07:32:02, "Dragan Simic" <dsimic@manjaro.org> wrote:
>> > > > > > > After the additional firmware-related module information was
>> > > > > > > introduced by
>> > > > > > > the commit c0677e41a47f ("drm/rockchip: cdn-dp-core: add
>> > > > > > > MODULE_FIRMWARE
>> > > > > > > macro"), there's no longer need for the
>> > > > > > > firmware-loading workarounds
>> > > > > > > whose
>> > > > > > > sole purpose was to prevent the missing firmware
>> > > > > > > blob in an initial
>> > > > > > > ramdisk
>> > > > > > > from causing driver initialization to fail.  Thus, delete the
>> > > > > > > workarounds,
>> > > > > > > which removes a sizable chunk of redundant code.
>> > > > > >
>> > > > > > What would happen if there was no ramdisk? And the firmware is in
>> > > > > > rootfs ？
>> > > > > >
>> > > > > > For example： A buildroot based tiny embedded system。
>> > > > >
>> > > > > Good point, let me explain, please.
>> > > > >
>> > > > > In general, if a driver is built into the kernel, there
>> > > > > should also be
>> > > > > an initial ramdisk that contains the related firmware blobs, because
>> > > > > it's
>> > > > > unknown is the root filesystem available when the driver is probed.
>> > > > > If
>> > > > > a driver is built as a module and there's no initial ramdisk, having
>> > > > > the related firmware blobs on the root filesystem should be fine,
>> > > > > because
>> > > > > the firmware blobs and the kernel module become available at
>> > > > > the same
>> > > > > time, through the root filesystem. [1]
>> > > > >
>> > > > > Another option for a driver built statically into the kernel, when
>> > > > > there's
>> > > > > no initial ramdisk, is to build the required firmware blobs into the
>> > > > > kernel
>> > > > > image. [2]  Of course, that's feasible only when a kernel image is
>> > > > > built
>> > > > > specificially for some device, because otherwise it would become too
>> > > > > large
>> > > > > because of too many drivers and their firmware blobs becoming
>> > > > > included,
>> > > > > but that seems to fit the Buildroot-based example.
>> > > > >
>> > > > > To sum it up, mechanisms already exist in the kernel for various
>> > > > > scenarios
>> > > > > when it comes to loading firmware blobs.  Even if the deleted
>> > > > > workaround
>> > > > > attempts to solve some issue specific to some environment,
>> > > > > that isn't
>> > > > > the
>> > > > > right place or the right way for solving any issues of that kind.
>> > > > >
>> > > > > While preparing this patch, I even tried to find another
>> > > > > kernel driver
>> > > > > that
>> > > > > also implements some similar workarounds for firmware loading, to
>> > > > > justify
>> > > > > the existence of such workarounds and to possibly move them into the
>> > > > > kernel's
>> > > > > firmware-loading interface.  Alas, I was unable to find such
>> > > > > workarounds
>> > > > > in
>> > > > > other drivers, which solidified my reasoning behind classifying the
>> > > > > removed
>> > > > > code as out-of-place and redundant.
>> > > >
>> > > > For some tiny embedded system，there is no such ramdisk，for example：
>> > > > a buildroot based rootfs，the buildroot only generate rootfs。
>> > > >
>> > > > And FYI， there are mainline drivers try to fix such issue by
>> > > > defer_probe，for example：
>> > > > smc_abc[0]
>> > > > There are also some other similar scenario in gpu driver{1}[2]
>> > > >
>> > > > [0]https://elixir.bootlin.com/linux/latest/source/drivers/tee/optee/smc_abi.c#L1518
>> > > > [1]https://patchwork.kernel.org/project/dri-devel/patch/20240109120604.603700-1-javierm@redhat.com/
>> > > > [2]https://lore.kernel.org/dri-devel/87y1918psd.fsf@minerva.mail-host-address-is-not-set/T/
>> > >
>> > > Thanks for providing these examples.
>> > >
>> > > Before I continue thinking about the possible systemic solution,
>> > > could you please clarify the way Buildroot builds the kernel and
>> > > prepares the root filesystem?  I'm not familiar with Buildroot,
>> > > but it seems to me that it builds the drivers statically into the
>> > > produced kernel image, while it places the related firmware blobs
>> > > into the produced root filesystem.  Am I right there?
>> >
>> > in practice we can chose build the drivers statically into the kernel，
>> > we can also build it as a module。
>> > And in both case， the firmware blobs are put in rootfs。
>> > If the drivers is built as a module， the module will also put in
>> > rootfs，
>> > so its fine。
>> > But if a drivers is built into the kernel ，it maybe can't access the
>> > firmware blob
>> > before the rootfs is mounted.
>> > So we can see some drivers try to use  DEFER_PROBE to fix this issue.
>> 
>> When Buildroot builds the drivers statically into the kernel image,
>> can it also be told to build the required firmware blobs into the
>> kernel image, for which there's already support in the kernel?
>> 
>> Of course, that would be feasible if only a small number of firmware
>> blobs would end up built into the kernel image, i.e. if the Buildroot
>> build would be tailored for a specific board.
> 
> IIRC, it can, but it's not really convenient from a legal point of 
> view.

Ah, makes sense.  Very different licensing for the same file, etc.

>> Otherwise...
>> 
>> > > As I already wrote earlier, and as the above-linked discussions
>> > > conclude, solving these issues doesn't belong to any specific driver.
>> > > It should be resolved within the kernel's firmware loading mechanism
>> > > instead, and no driver should be specific in that regard.
>> >
>> > IT would be good if it can be resolved within the kernel's  firmware
>> > loading mechanism.
>> 
>> ... we'll need this as a systemic solution.
> 
> The general policy has been to put drivers that need a firmware as a
> module, and just never build them statically.

I totally agree, but if Buildroot builds them statically and provides
no initial ramdisk, we need a better solution than having various 
drivers
attempt to implement their own workarounds.

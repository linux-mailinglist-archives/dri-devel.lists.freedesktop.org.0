Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB27792D423
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 16:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3002B10E7E7;
	Wed, 10 Jul 2024 14:22:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="Pln59aDH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3320010E7E7
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 14:22:15 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1720621333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=27V6jUOaNytzMrX8tcswA+zOR0z0lNMkdk4MlU12XKo=;
 b=Pln59aDHanugpPxhabXhnNgy/f3kk/SoEB6XuIRPRD+u2Iny9Y+3kxYXie6bSsQPbxTVqO
 +SUmN1TgAXAeZ+/jGDSwVcz0nyOzPCDx/CRAbvVY0A1QzLt97MSvw+PBcCPRbHJkAxKER7
 Z1RwnzuVc2SOKxAXTx4PblsbUH++I437k3+bJjw3Q/dlni6TTEzGjGczn62KlDDaZyXkSf
 LSYX0rLM6RHO4fgdUzoHQx0mlhHqpmqZ5v5mE76pxgUneoMxYPiW2l6aSsbTR1w3TnaOVW
 7C0pkf5V2/c+FaHTgiOTo/BOp2DZYdd3cl98sLZJ8+r/WPbQBkCAAmuI0QjyIw==
Date: Wed, 10 Jul 2024 16:22:12 +0200
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
In-Reply-To: <20240710-smooth-hypnotic-raccoon-b91fba@houat>
References: <9b7a9e9b88ad8c7489ee1b4c70b8751eeb5cf6f9.1720049413.git.dsimic@manjaro.org>
 <109c6f19.2559.1907b817a99.Coremail.andyshrk@163.com>
 <0bf4701d98833609b917983718c610aa@manjaro.org>
 <2fd3aabd.785b.190914ec1a6.Coremail.andyshrk@163.com>
 <f0fb9feed2d9262bb4d7c8ade836af62@manjaro.org>
 <909d072.9028.19096c2429a.Coremail.andyshrk@163.com>
 <31062b80d3f9e11c339c400a70464f43@manjaro.org>
 <20240709-exuberant-tentacled-oxpecker-bd1ea0@houat>
 <b6d630447e6c69e913b76650d910f895@manjaro.org>
 <20240710-smooth-hypnotic-raccoon-b91fba@houat>
Message-ID: <a30067db11e586d8eb2c124abe32052a@manjaro.org>
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

Hello Maxime,

On 2024-07-10 09:13, Maxime Ripard wrote:
> On Tue, Jul 09, 2024 at 06:36:08PM GMT, Dragan Simic wrote:
>> > > > > As I already wrote earlier, and as the above-linked discussions
>> > > > > conclude, solving these issues doesn't belong to any specific driver.
>> > > > > It should be resolved within the kernel's firmware loading mechanism
>> > > > > instead, and no driver should be specific in that regard.
>> > > >
>> > > > IT would be good if it can be resolved within the kernel's  firmware
>> > > > loading mechanism.
>> > >
>> > > ... we'll need this as a systemic solution.
>> >
>> > The general policy has been to put drivers that need a firmware as a
>> > module, and just never build them statically.
>> 
>> I totally agree, but if Buildroot builds them statically and provides
>> no initial ramdisk, we need a better solution than having various 
>> drivers
>> attempt to implement their own workarounds.
> 
> Buildroot typically allows custom kernel configurations, so it's not
> really "enforcing" anything like another distro does.
> 
> It is definitely targetted towards very stripped down systems, so I
> guess building the drivers statically is a natural choice, but it works
> fine with modules too.

It all leads to a conclusion that we need better in-kernel support
for delayed firmware loading, instead of drivers implementing various
workarounds, for the layouts in which drivers are built statically
into the kernel image, but the required firmware blobs reside on the
root filesystem.

I'll start working on it, hopefully today. :)

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F229711D0
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 10:25:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C6010E318;
	Mon,  9 Sep 2024 08:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hvJtwu3V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689B410E318
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Sep 2024 08:25:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E0B9BA4287F;
 Mon,  9 Sep 2024 08:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29791C4CEC5;
 Mon,  9 Sep 2024 08:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725870340;
 bh=1szx3rDrihU/g78VbWFWrrfGN2EhKZVvB/Q6ftesECU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hvJtwu3VXxWnfl1uC2CBj5Bc6igmypIPu1NCqq9LGulBMR9/IjNnpO0E6kwOVvNTV
 ZOCLRF7Ntno5j7MTGr5AAfkXnHxd5aEvlZgX0Hjqi15yrO4D2LIi2bnREFlCGB6YQq
 HllUUeID8ecs2cUBpyAeFpz2EYuQgD5woS5rb6ObNwTDYZS6DGaHzQgX+zlxb6glLN
 sSDF4JjRu5OVGF/wViQLbfx0RrbF5qbwM+CV3OcLNkw2zEblDnLvYJF1GeqMziMOMX
 yXUtQr6D60zCck1ljzpNwnpYZ5Rzphe5e26FCin+ircfax0TqMbRSuWEZARJ1yQnh+
 HqILLZIfPCP8Q==
Date: Mon, 9 Sep 2024 09:25:34 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, jingoohan1@gmail.com,
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org,
 bentiss@kernel.org, shc_work@mail.ru, s.hauer@pengutronix.de,
 kernel@pengutronix.de, shawnguo@kernel.org, festevam@gmail.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 00/28] backlight: lcd: Remove fbdev dependencies
Message-ID: <20240909082534.GA24460@google.com>
References: <20240820093452.68270-1-tzimmermann@suse.de>
 <20240903145809.GE12939@aspen.lan>
 <292616c8-2532-43e7-a373-dae34e7b5334@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <292616c8-2532-43e7-a373-dae34e7b5334@suse.de>
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

On Thu, 05 Sep 2024, Thomas Zimmermann wrote:

> Hi
> 
> Am 03.09.24 um 16:58 schrieb Daniel Thompson:
> > On Tue, Aug 20, 2024 at 11:22:38AM +0200, Thomas Zimmermann wrote:
> > > This series removes most dependencies on fbdev from the lcd subsystem
> > > and its drivers.
> > > 
> > > Patches 1 to 3 rework the fbdev notifier, the fbdev's fb_info can
> > > now refer to a dedicated lcd device, and lcd defines constants for
> > > power states. These changes resemble similar changes to the backlight
> > > code.
> > > 
> > > Patches 4 to 19 update lcd drivers to the new interfaces and perform
> > > minor cleanups during the process. Patches 20 to 24 update fbdev
> > > drivers and patch 25 updates the picolcd driver from the hid subsystem.
> > > 
> > > Patches 25 to 28 finally clean up various lcd interfaces and files.
> > > 
> > > This patchset is part of a larger effort to implement the lcd code
> > > without depending on fbdev. Similar patches have been sent out for
> > > the backlight subsystem, such as in [1] and [2].
> > > 
> > > Hopefully this series can be merged at once through the lcd tree.
> > > 
> > > [1] https://patchwork.freedesktop.org/series/129782/
> > > [2] https://patchwork.freedesktop.org/series/134718/
> > I shared a could of nitpicks. You can do what you like with them since
> > none are major enough to stop me also sharing a:
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> Thanks for reviewing. I'll send out an update. Why tree do these patches go
> into? Backlight?

Yes, that's expected.

-- 
Lee Jones [李琼斯]

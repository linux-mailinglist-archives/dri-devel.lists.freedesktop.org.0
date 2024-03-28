Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C51D889063E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 17:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8581124E0;
	Thu, 28 Mar 2024 16:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xxpi53HM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7211124E0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 16:50:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 16252CE293F;
 Thu, 28 Mar 2024 16:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A59F2C433C7;
 Thu, 28 Mar 2024 16:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1711644600;
 bh=xGGADh4akfeiszNVR/Er4vkIxCrGC1E74wXmXfZjO5Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xxpi53HMGuyVF0fPqf1WvDJbGVVLBENGCi1DoAi2DTeqykC1yQDu17lHtasFancPD
 JB2l8EknpAWB08LTRH+jFET6wPq/AmDEe9NjTpUpD1q9KrkEekoRwtjbvzJVBgICKZ
 xWLRyYP50dP7SxuuvGUS2BTBhO2yAGpmXIflloFs=
Date: Thu, 28 Mar 2024 17:49:56 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] video: backlight: constify struct class usage
Message-ID: <2024032817-avatar-agony-c17d@gregkh>
References: <20240305-class_cleanup-backlight-v1-0-c0e15cc25be1@marliere.net>
 <20240328114131.GB13211@google.com>
 <2024032816-tightrope-lushness-00f1@gregkh>
 <anuaxqt2zlravjpepkuhqmii3adjdeh3lzal3wwb7rg7krv6uu@7sbwczq3flot>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anuaxqt2zlravjpepkuhqmii3adjdeh3lzal3wwb7rg7krv6uu@7sbwczq3flot>
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

On Thu, Mar 28, 2024 at 09:46:01AM -0300, Ricardo B. Marliere wrote:
> On 28 Mar 13:01, Greg Kroah-Hartman wrote:
> > On Thu, Mar 28, 2024 at 11:41:31AM +0000, Lee Jones wrote:
> > > On Tue, 05 Mar 2024, Ricardo B. Marliere wrote:
> > > 
> > > > This is a simple and straight forward cleanup series that aims to make the
> > > > class structures in backlight constant. This has been possible since 2023
> > > > [1].
> > > > 
> > > > [1]: https://lore.kernel.org/all/2023040248-customary-release-4aec@gregkh/
> > > > 
> > > > Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> > > > ---
> > > > Ricardo B. Marliere (2):
> > > >       video: backlight: make backlight_class constant
> > > >       video: backlight: lcd: make lcd_class constant
> > > > 
> > > >  drivers/video/backlight/backlight.c | 29 ++++++++++++++++-------------
> > > >  drivers/video/backlight/lcd.c       | 23 +++++++++++++----------
> > > >  2 files changed, 29 insertions(+), 23 deletions(-)
> > > 
> > > No longer apply.
> > > 
> > > Please rebase on top of v6.9-rc1 or for-backlight-next.
> > 
> > As I already had this in my local tree, I've sent out a v2 at:
> > 	https://lore.kernel.org/lkml/2024032805-putdown-mushy-a0f9@gregkh/
> 
> Thank you Greg. I will see what is left to be made const for -next.

Many of your patches were not picked up for -rc1, I'll be taking a bunch
of them into my tree "soon" as that usually means the subsystem isn't as
active.

thanks,

greg k-h

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3D9371A21
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 18:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8986E95B;
	Mon,  3 May 2021 16:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B55C86E95B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 16:38:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE54961421;
 Mon,  3 May 2021 16:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620059882;
 bh=FgwOJtjFCovh2pSSgcn5gjyb2W1gErUYbBBYra6B+qY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E720fjcPW794q/UQnyrNdOshzgpar64+cKHVg4hZqbCw+7bVwwyUkyk1kTU69Ghvu
 Pxf871kQGjthbpinZzqu7kKyA47le3kgit1sFkdhRFnIJqw8Y7PkH6Vc1MXmg+zxiz
 9+mdDO/XtFi4B3JdBqaj7kzKz50y20YVltAH8G0c=
Date: Mon, 3 May 2021 18:38:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 1/4] staging: fbtft: Rectify GPIO handling
Message-ID: <YJAm6D2LUtVz1YNa@kroah.com>
References: <20210428130415.55406-1-andriy.shevchenko@linux.intel.com>
 <20210428130415.55406-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210428130415.55406-2-andriy.shevchenko@linux.intel.com>
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
Cc: Jan Sebastian =?iso-8859-1?Q?G=F6tte?= <linux@jaseg.net>,
 linux-fbdev@vger.kernel.org, Nishad Kamdar <nishadkamdar@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phil Reid <preid@electromag.com.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 04:04:12PM +0300, Andy Shevchenko wrote:
> The infamous commit c440eee1a7a1 ("Staging: staging: fbtft: Switch to
> the GPIO descriptor interface") broke GPIO handling completely.
> It has already four commits to rectify and it seems not enough.
> In order to fix the mess here we:
> 
>   1) Set default to "inactive" for all requested pins
> 
>   2) Fix CS#, RD#, and WR# pins polarity since it's active low
>      and GPIO descriptor interface takes it into consideration
>      from the Device Tree or ACPI
> 
>   3) Consolidate chip activation (CS# assertion) under default
>      ->reset() callback
> 
> To summarize the expectations about polarity for GPIOs:
> 
>    RD#			Low
>    WR#			Low
>    CS#			Low
>    RESET#		Low
>    DC or RS		High
>    RW			High
>    Data	0 .. 15		High
> 
> See also Adafruit learning course [1] for the example of the schematics.
> 
> While at it, drop unneeded NULL checks, since GPIO API is tolerant to that.
> 
> [1]: https://learn.adafruit.com/adafruit-2-8-and-3-2-color-tft-touchscreen-breakout-v2/downloads
> 
> Fixes: 92e3e884887c ("Staging: staging: fbtft: Fix GPIO handling")
> Fixes: b918d1c27066 ("Staging: staging: fbtft: Fix reset assertion when using gpio descriptor")
> Fixes: dbc4f989c878 ("Staging: staging: fbtft: Fix probing of gpio descriptor")
> Fixes: c440eee1a7a1 ("Staging: staging: fbtft: Switch to the gpio descriptor interface")

I get the following error when trying to apply this:

	Fixes tag: Fixes: 92e3e884887c ("Staging: staging: fbtft: Fix GPIO handling")
	Has these problem(s):
	        - Subject does not match target commit subject
	          Just use
		                git log -1 --format='Fixes: %h ("%s")'
	Fixes tag: Fixes: b918d1c27066 ("Staging: staging: fbtft: Fix reset assertion when using gpio descriptor")
	Has these problem(s):
	        - Subject does not match target commit subject
	          Just use
		                git log -1 --format='Fixes: %h ("%s")'
	Fixes tag: Fixes: dbc4f989c878 ("Staging: staging: fbtft: Fix probing of gpio descriptor")
	Has these problem(s):
	        - Subject does not match target commit subject
	          Just use
		                git log -1 --format='Fixes: %h ("%s")'
	Fixes tag: Fixes: c440eee1a7a1 ("Staging: staging: fbtft: Switch to the gpio descriptor interface")
	Has these problem(s):
	        - Subject does not match target commit subject
	          Just use
		                git log -1 --format='Fixes: %h ("%s")'

Please fix up for your next version of this series.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

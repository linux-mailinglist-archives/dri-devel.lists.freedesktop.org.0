Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6E7362042
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 14:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25A76E1EC;
	Fri, 16 Apr 2021 12:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C3476E1EC
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 12:52:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDDFD61107;
 Fri, 16 Apr 2021 12:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1618577523;
 bh=hwJ8s62yDIzmzZA0XYf+y6HvC+HhisQjYC0WgN+PGKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G2m/SWVf8QKqq/Btcd4gPFqAbLsDT34XDLpJddTRhYn/QOuv+nKJIwxo3d7jjSkDU
 1kAc68zdjhib0EwVoAVObGVbxEAG44nHvsCbKiduv7cvk1eaydVObPt+GcJUWUNW1B
 jgyNLtAyDs+vdJYNMEiRjh+obC8KOE9gUdTmYock=
Date: Fri, 16 Apr 2021 14:51:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/2] fbtft: Rectify GPIO handling
Message-ID: <YHmIb2YrwfzZa7Wh@kroah.com>
References: <20210416123117.4993-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210416123117.4993-1-andriy.shevchenko@linux.intel.com>
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

On Fri, Apr 16, 2021 at 03:31:16PM +0300, Andy Shevchenko wrote:
> The infamous commit c440eee1a7a1 ("Staging: fbtft: Switch to
> the GPIO descriptor interface") broke GPIO handling completely.
> It has already four commits to rectify and it seems not enough.
> In order to fix the mess here we:
> 
>   1) Set default to "inactive" for all requested pins
> 
>   2) Fix CS, RD, and WR pins polarity since it's active low and
>      GPIO descriptor interface takes it into consideration from
>      the Device Tree or ACPI
> 
>   3) Fix RESET pin polarity in the places missed by the commit
>      b918d1c27066 ("Staging: fbtft: Fix reset assertion when using gpio descriptor")
> 
>   4) Consolidate chip activation (CS assert) under default
>      ->reset() callback
> 
> To summarize the expectations about polarity for GPIOs:
> 
>    #RD			Low
>    #WR			Low
>    #CS			Low
>    #RESET		Low
>    DC or RS		High
>    RW			High
>    Data	0..15		High
> 
> See also Adafruit learning course [1] for the example of the schematics.
> 
> While at it, drop unneeded NULL checks, since GPIO API is tolerant to that.
> At the end, update TODO to mark this job eventually done.
> 
> [1]: https://learn.adafruit.com/adafruit-2-8-and-3-2-color-tft-touchscreen-breakout-v2/downloads

Shouldn't this be broken up into "one patch per thing" from your list
above?  Feels like you did a lot of different things all in the same
patch :(

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

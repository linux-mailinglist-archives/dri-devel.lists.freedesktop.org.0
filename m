Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4582156C905
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jul 2022 12:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D581610FB07;
	Sat,  9 Jul 2022 10:30:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC5C10FB06
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Jul 2022 10:30:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83ADEB819D5;
 Sat,  9 Jul 2022 10:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E90C3411C;
 Sat,  9 Jul 2022 10:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1657362654;
 bh=+StW1gOLTZgdcvRatpGmh7s1OknwJrHLQ9GRWP9NdC8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pq0+JUbS8bqFQopWY7oG/wgS3nVVemFHzsgErgrU8PhKix5W7hEKYR00OQoTTbLj6
 AyPtvlTxYKaQs2yAtMR4m6WqGOmM5cKLm+jHp4m3Nqdyt47+z7zMDR5IIZqbFNlz1f
 /URWkB56i7OyC8F/r/2ewjWYTVYROKlIwxo/uNLE=
Date: Sat, 9 Jul 2022 12:30:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christos Kollintzas <c.kollintzas.92@gmail.com>
Subject: Re: [PATCH] staging: fbtft: replace udelay with usleep_range
Message-ID: <YslY25NnW6O5Tn+p@kroah.com>
References: <YslTQLhM7GSaGXki@mandalorian.koija>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YslTQLhM7GSaGXki@mandalorian.koija>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 09, 2022 at 01:06:56PM +0300, Christos Kollintzas wrote:
> Adhere to Linux kernel coding style.
> 
> Reported by checkpatch:
> 
> CHECK: usleep_range is preferred over udelay
> 
> Signed-off-by: Christos Kollintzas <c.kollintzas.92@gmail.com>
> ---
>  drivers/staging/fbtft/fb_upd161704.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fb_upd161704.c b/drivers/staging/fbtft/fb_upd161704.c
> index c680160d6380..eeafbab4ace1 100644
> --- a/drivers/staging/fbtft/fb_upd161704.c
> +++ b/drivers/staging/fbtft/fb_upd161704.c
> @@ -32,27 +32,27 @@ static int init_display(struct fbtft_par *par)
>  
>  	/* oscillator start */
>  	write_reg(par, 0x003A, 0x0001);	/*Oscillator 0: stop, 1: operation */
> -	udelay(100);
> +	usleep_range(100, 110);

When doing these types of changes, you really need access to the
hardware involved in order to be able to properly test it.

Especially for this type of function which is trying to do timing
changes which the hardware requires.

Did you test this on the real hardware and did it work properly?

thanks,

greg k-h

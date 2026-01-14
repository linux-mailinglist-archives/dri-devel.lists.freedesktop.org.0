Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D97D1CBF4
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 07:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1DD10E0A1;
	Wed, 14 Jan 2026 06:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wLy0+VHF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DE5810E0A1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 06:55:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7FC2A4011C;
 Wed, 14 Jan 2026 06:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848C2C4CEF7;
 Wed, 14 Jan 2026 06:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1768373723;
 bh=jAU13ANnoHREg4tq8eq6SJekJk5aOvQhMYOQD9AiiyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wLy0+VHFuKyl80wtCYn90C1oJlp4fr0a6PL+eNsBMKBKl5ixsjWyTxn32I7+exbo2
 DsoPvx1leqaitLTQjvm6e1aM3JJh26k2vJgCnOZfrxGNvbQIcJ9tOVzSWneVlDi0Pv
 DQHEuvenFTHPGO+HcPuUPJGS9OCZbUl9jyrBT+xM=
Date: Wed, 14 Jan 2026 07:55:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Gideon Adjei <gideonadjei.dev@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Abdun Nihaal <abdun.nihaal@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Jianglei Nie <niejianglei2021@163.com>,
 Matthew Wilcox <willy@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: fbtft: Change udelay() to fsleep()
Message-ID: <2026011432-disliking-boxlike-fcb3@gregkh>
References: <20260113221722.5157-1-gideonadjei.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113221722.5157-1-gideonadjei.dev@gmail.com>
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

On Tue, Jan 13, 2026 at 02:17:22PM -0800, Gideon Adjei wrote:
> Replace udelay() calls >= 100us with fsleep() to avoid busy-waiting.
> 
> The delays are used in init_display() callbacks. These callbacks are
> invoked by fbtft_probe_common() during the driver's probe path. The
> probe path runs in process context which already uses sleeping APIs.
> This makes fsleep() safe to use in these situations.
> 
> Signed-off-by: Gideon Adjei <gideonadjei.dev@gmail.com>
> ---
>  drivers/staging/fbtft/fb_tinylcd.c   | 2 +-
>  drivers/staging/fbtft/fb_upd161704.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
> index 9469248f2c50..3fb15df31592 100644
> --- a/drivers/staging/fbtft/fb_tinylcd.c
> +++ b/drivers/staging/fbtft/fb_tinylcd.c
> @@ -41,7 +41,7 @@ static int init_display(struct fbtft_par *par)
>  		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
>  	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
>  	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
> -	udelay(250);
> +	fsleep(250);

Without the hardware and specifications to test this with, we can't take
this type of patch.  Please see the mailing list archives for the
multitude of times it has been rejected in the past.

sorry, but checkpatch can be ignored here.

thanks,

greg k-h

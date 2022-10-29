Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D246D61210A
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 09:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF2110E24A;
	Sat, 29 Oct 2022 07:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96E810E24A
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Oct 2022 07:31:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 777B0B82E06;
 Sat, 29 Oct 2022 07:31:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8CAC433D6;
 Sat, 29 Oct 2022 07:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1667028715;
 bh=fekE5mNaYU4tr5MhqcASkIRisSfr+Jn/AaUqP85eL+s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uluSYSgud7ecH98orcfLZR6rZJpz5vUm8xklBEvKmggI+8OHnG4WimG5LQ0GrO/Qb
 txnao02M1F7L8uZKqImEiln9TlcWj7LekeXoC4SvXonhrgsWBiXPWoD/p9DoA+Arki
 /M6YkBm1MbL/Rkl47i40POXLMzQmC/viFg0B6/9Q=
Date: Sat, 29 Oct 2022 09:32:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH] staging: fbtft: Use ARRAY_SIZE() to get argument count
Message-ID: <Y1zXIjCe3LGwApWD@kroah.com>
References: <Y1vZXUi0Bjiub8HZ@ubunlion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1vZXUi0Bjiub8HZ@ubunlion>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 outreachy@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 28, 2022 at 07:00:05PM +0530, Deepak R Varma wrote:
> The ARRAY_SIZE(foo) macro should be preferred over sizeof operator
> based computation such as sizeof(foo)/sizeof(foo[0]) for finding
> number of elements in an array. Issue identified using coccicheck.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/staging/fbtft/fbtft.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
> index 2c2b5f1c1df3..5506a473be91 100644
> --- a/drivers/staging/fbtft/fbtft.h
> +++ b/drivers/staging/fbtft/fbtft.h
> @@ -231,7 +231,7 @@ struct fbtft_par {
>  	bool polarity;
>  };
> 
> -#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__}) / sizeof(int))
> +#define NUMARGS(...)  ARRAY_SIZE(((int[]){ __VA_ARGS__ }))

Please please please test-build your patches before sending them out.
To not do so just wastes reviewer resources :(

thanks,

greg k-h

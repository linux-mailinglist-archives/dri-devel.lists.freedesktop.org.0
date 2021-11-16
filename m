Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5BC453590
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 16:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DAB89C9C;
	Tue, 16 Nov 2021 15:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE34989C9C
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 15:18:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3636761BF9;
 Tue, 16 Nov 2021 15:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637075884;
 bh=u9SX2DemwNFaZqmFy59yqo9oEg0cChgWWEB6OGLB9B8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=suJJZDR37V7bf1Km41/8+po9hiQyBQu6v8pz7aiayZKgaP4YGrH6GwX8QmljT3IJs
 t7zEBsESPRI8iYKvRHbFCAFhBIRcW5UMKRsAgoNGP2DsB9RqYztqx0IMnR5k+1b+C+
 b7lB3HwqJ4CM3vUstnx9ibvx8a7YSloLbtWnAVTsIcQmnMrfdZ5plrzflInS1UmWr4
 yIBBEJwHZBSRrLw4LU6JPpt474HOcwFgtEJnkZjnXclzFXkAsE0z1ZmspLFIRPT36S
 GGJb/sL5J3OZdconz+Y5OZXdbIq8x0p+R/kIZ9SEFdA2AWhIICo0hkP8kBEuLcaTCE
 tzQq2wXYKsUbA==
Date: Tue, 16 Nov 2021 08:17:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] omapfb: add one more "fallthrough" statement
Message-ID: <YZPLpxGXVyaaKZsm@archlinux-ax161>
References: <20211116092204.4116587-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116092204.4116587-1-arnd@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 16, 2021 at 10:21:54AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang warns about one missing fallthrough that gcc ignores:
> 
> drivers/video/fbdev/omap/omapfb_main.c:1558:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
> 
> Add it here as well.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/video/fbdev/omap/omapfb_main.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
> index 3d090d2d9ed9..a6a8404d1462 100644
> --- a/drivers/video/fbdev/omap/omapfb_main.c
> +++ b/drivers/video/fbdev/omap/omapfb_main.c
> @@ -1555,6 +1555,7 @@ static void omapfb_free_resources(struct omapfb_device *fbdev, int state)
>  	case 1:
>  		dev_set_drvdata(fbdev->dev, NULL);
>  		kfree(fbdev);
> +		fallthrough;
>  	case 0:
>  		/* nothing to free */
>  		break;
> -- 
> 2.29.2
> 

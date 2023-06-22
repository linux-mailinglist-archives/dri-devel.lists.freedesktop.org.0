Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DAB73A48F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 17:15:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AC310E591;
	Thu, 22 Jun 2023 15:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983E510E58F
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 15:15:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1025C905;
 Thu, 22 Jun 2023 17:15:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687446916;
 bh=syM2lf6xc0TcjGpjcQcGu7POjghphMWF206glBGE4HU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pdFBVFslugx/27dksYElGUWjRn6H00aKtQdKs87vIYeqSRfRzHxWkU4IX5nnICUho
 4u6pvMREeC45QsobW/X5ZDrSQf0slqkbDxCLDKKlAZuF0NbwXS2tPxy0/p1WaM74Yy
 NCIeNLVZP5myvbSZPEU/goKxFBYCekAfl5PUUWR4=
Date: Thu, 22 Jun 2023 18:15:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] fbdev: sh_mobile_lcdcfb: Fix ARGB32 overlay format typo
Message-ID: <20230622151550.GB950@pendragon.ideasonboard.com>
References: <a48665d08e6d4d2bbbff1d53aab06dfeb19136f4.1687426052.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a48665d08e6d4d2bbbff1d53aab06dfeb19136f4.1687426052.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:28:48AM +0200, Geert Uytterhoeven wrote:
> When configurating a CHn Source Image Format Register (LDBBSIFR), one
> should use the corresponding LDBBSIFR_RPKF_* definition for overlay
> planes, not the DDFR_PKF_* definition for the primary plane.
> 
> Fortunately both definitions resolve to the same value, so this bug did
> not cause any harm.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/video/fbdev/sh_mobile_lcdcfb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> index 093f035d12463a80..0adb2ba965e7120d 100644
> --- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
> +++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
> @@ -824,7 +824,7 @@ static void sh_mobile_lcdc_overlay_setup(struct sh_mobile_lcdc_overlay *ovl)
>  		format |= LDBBSIFR_AL_1 | LDBBSIFR_RY | LDBBSIFR_RPKF_RGB24;
>  		break;
>  	case V4L2_PIX_FMT_BGR32:
> -		format |= LDBBSIFR_AL_PK | LDBBSIFR_RY | LDDFR_PKF_ARGB32;
> +		format |= LDBBSIFR_AL_PK | LDBBSIFR_RY | LDBBSIFR_RPKF_ARGB32;

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  		break;
>  	case V4L2_PIX_FMT_NV12:
>  	case V4L2_PIX_FMT_NV21:

-- 
Regards,

Laurent Pinchart

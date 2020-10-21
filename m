Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 748F629550D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 01:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74976EEB3;
	Wed, 21 Oct 2020 23:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4996EEB2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 23:07:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0238252F;
 Thu, 22 Oct 2020 01:07:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1603321660;
 bh=+WdOvFjpRjvrv6B+F7afibmUjbgU1KtzOI9H01Uwlcw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=acEch0rd/KOHPm5hzTCGdtnqcfSg5H5g0n+0pUmWx9fPM1g8djEdE+T2GBaTT/W+P
 cD4tpGfAvoas/GDRnbZvtEXpi3wKkA1cH68xJxn6pBQBzTJK2o4NPRSY5pVn6nGoY1
 FGo7zsVLpgQCCPW/k9MvvpiZENbB9+Lv0jmekNCI=
Date: Thu, 22 Oct 2020 02:06:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drivers/video: Fix -Wstringop-truncation in hdmi.c
Message-ID: <20201021230654.GS3942@pendragon.ideasonboard.com>
References: <20201021121241.17623-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021121241.17623-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, bernard@vivo.com,
 dri-devel@lists.freedesktop.org, gwan-gyeong.mun@intel.com,
 daniel.vetter@ffwll.ch, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Thank you for the patch.

On Wed, Oct 21, 2020 at 02:12:41PM +0200, Thomas Zimmermann wrote:
> Trying to copy into the string fields with strncpy() gives a warning from
> gcc. Both fields are part of a packed HDMI header and do not require a
> terminating \0 character.
> 
> ../drivers/video/hdmi.c: In function 'hdmi_spd_infoframe_init':
> ../drivers/video/hdmi.c:230:2: warning: 'strncpy' specified bound 8 equals destination size [-Wstringop-truncation]
>   230 |  strncpy(frame->vendor, vendor, sizeof(frame->vendor));
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/video/hdmi.c:231:2: warning: 'strncpy' specified bound 16 equals destination size [-Wstringop-truncation]
>   231 |  strncpy(frame->product, product, sizeof(frame->product));
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Just use memcpy() instead.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/hdmi.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> index b7a1d6fae90d..1e4cb63d0d11 100644
> --- a/drivers/video/hdmi.c
> +++ b/drivers/video/hdmi.c
> @@ -221,14 +221,18 @@ EXPORT_SYMBOL(hdmi_avi_infoframe_pack);
>  int hdmi_spd_infoframe_init(struct hdmi_spd_infoframe *frame,
>  			    const char *vendor, const char *product)
>  {
> +	size_t len;
> +
>  	memset(frame, 0, sizeof(*frame));
>  
>  	frame->type = HDMI_INFOFRAME_TYPE_SPD;
>  	frame->version = 1;
>  	frame->length = HDMI_SPD_INFOFRAME_SIZE;
>  
> -	strncpy(frame->vendor, vendor, sizeof(frame->vendor));
> -	strncpy(frame->product, product, sizeof(frame->product));
> +	len = strlen(vendor);
> +	memcpy(frame->vendor, vendor, min(len, sizeof(frame->vendor)));
> +	len = strlen(product);
> +	memcpy(frame->product, product, min(len, sizeof(frame->product)));

As this seems to be a legitimate use of strncpy(), isn't there a way to
silence the warning without requiring this additional runtime complexity
?

>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

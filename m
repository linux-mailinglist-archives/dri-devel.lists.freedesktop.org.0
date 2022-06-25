Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A40955ACEA
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:28:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D452410E68D;
	Sat, 25 Jun 2022 22:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FBB10E68D
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 22:27:55 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id h23so11554179ejj.12
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 15:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HMEA4S/foPT09jS8kwk/DI5PFsIZiXHCulkpaRC/cMc=;
 b=Rs2PRm2e4bEIRWn7rEMlhXgz5dsI1a9YEf9uQle7MRv1Vum4pehM9b9ASQyVz0lieT
 9JdUxRP6ypFEH2r7I2V/x348gJVbqwEC+HiyZmiqwfT/u4tM+yGqSQVE3Q4tnzNBedyX
 1isN078R4i+bHEBRzNKVFpD5vXvUIS+fcf80k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HMEA4S/foPT09jS8kwk/DI5PFsIZiXHCulkpaRC/cMc=;
 b=zKzl1f+cHoHw4hQREcq859szBt8FcC74U9huhJiSR4Fs1kRxwTumzaTyLWn8z27WPP
 HyNxp6nICL5ao9s8GVZ5lb3Rke88wgindbuIZp+xoqZajbIfCfulEwO+qyIe2MXUyT4f
 b/wbz1mfvyAypgW09v6i25KsI0uAUPioxUqyYFuLalVwRc3ccP38z+gL7VaFh9326evm
 6eSJok2hGdiV4Tg/H2pKMD+8w7NUaZDkrYBmyiU2oH3gWi/vfu/GYUqmGkf1gPh2IOO7
 nEXdwZKniXoufUM3RYLs9I03/zJBZbkTU64tPiiuJpy2q7AZ7rjkQ3hkYNbpPxcl5JN5
 w93g==
X-Gm-Message-State: AJIora8ygo1QFe+eDPYnbI2wu4EbnYkupXokF40JsVShJiLsC1+O/XEL
 vJ4oHfXxeRWP2CcB5OWrm0TL9A==
X-Google-Smtp-Source: AGRyM1uhQtTW+avKSN5jUGIq6mcVEY1qRBqoklhRM83omd0hzACr022PZjwQmuGaEroG4miRaEvDNw==
X-Received: by 2002:a17:907:3f84:b0:724:2ec:b474 with SMTP id
 hr4-20020a1709073f8400b0072402ecb474mr5759117ejc.644.1656196073984; 
 Sat, 25 Jun 2022 15:27:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p5-20020aa7c4c5000000b004376bc57de5sm2083254edr.84.2022.06.25.15.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 15:27:53 -0700 (PDT)
Date: Sun, 26 Jun 2022 00:27:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 1/4] fbcon: Disallow setting font bigger than screen
 size
Message-ID: <YreL5+HQdicqwfcj@phenom.ffwll.local>
References: <20220625122502.68095-1-deller@gmx.de>
 <20220625122502.68095-2-deller@gmx.de>
 <YrcDgjpgeqSZtSOE@phenom.ffwll.local>
 <feee43e4-fad3-b8c8-852b-ab85804416b6@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <feee43e4-fad3-b8c8-852b-ab85804416b6@gmx.de>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: daniel.vetter@ffwll.ch, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 25, 2022 at 04:53:25PM +0200, Helge Deller wrote:
> On 6/25/22 14:45, Daniel Vetter wrote:
> > On Sat, Jun 25, 2022 at 02:24:59PM +0200, Helge Deller wrote:
> >> Prevent that users set a font size which is bigger than the physical screen.
> >> It's unlikely this may happen (because screens are usually much larger than the
> >> fonts and each font char is limited to 32x32 pixels), but it may happen on
> >> smaller screens/LCD displays.
> >>
> >> Signed-off-by: Helge Deller <deller@gmx.de>
> >> Cc: stable@vger.kernel.org # v4.14+
> >> ---
> >>  drivers/video/fbdev/core/fbcon.c | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> >> index c4e91715ef00..e162d5e753e5 100644
> >> --- a/drivers/video/fbdev/core/fbcon.c
> >> +++ b/drivers/video/fbdev/core/fbcon.c
> >> @@ -2469,6 +2469,11 @@ static int fbcon_set_font(struct vc_data *vc, struct console_font *font,
> >>  	if (charcount != 256 && charcount != 512)
> >>  		return -EINVAL;
> >>
> >> +	/* font bigger than screen resolution ? */
> >> +	if (font->width  > FBCON_SWAP(info->var.rotate, info->var.xres, info->var.yres) ||
> >> +	    font->height > FBCON_SWAP(info->var.rotate, info->var.yres, info->var.xres))
> >> +		return -EINVAL;
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> Thanks!
> 
> > Maybe as a safety follow up patch, we have a few copies of the below:
> >
> > 	cols = FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
> > 	rows = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
> > 	cols /= vc->vc_font.width;
> > 	rows /= vc->vc_font.height;
> >
> > Might be good to extract that into a helper and also add
> >
> > 	WARN_ON(!cols);
> > 	WARN_ON(!rows);
> 
> That's not needed then.
> The checks I added above will ensure that cols and rows are both greater than 0.

Yeah I reviewed it too, but I don't trust review all over the place.
Especially with something like fbcon with entry points from everywhere.
-Daniel

> > to make sure we really didn't screw this up and give syzkaller et all an
> > easier time finding bugs - it doesn't need to discover the full exploit,
> > only needs to get to this here.
> >
> > Also maybe even check that cols/rows is within reasons, like smaller than
> > BIT(24) or so (so that we have a bunch of headroom for overflows).
> 
> Not needed either.
> cols and rows is the screen size divided by an value between 1-32 (the max
> font size). So, since screen size is already the higest limit, cols&rows
> will always be smaller than screen size (and > 0).
> 
> Helge

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

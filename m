Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0E451BFF9
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 14:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE78610E4EA;
	Thu,  5 May 2022 12:57:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F1310E4F7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 12:57:21 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id ks9so2146391ejb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 05:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=FM/Z6quK2HFXaGlKN2qHDcgt6AtRbU+Icwi43NmIU6g=;
 b=e7ujymya9ex2b8NDhVyC0LmZepjwDZX1dOJK1JDnnmGuRG6AyTOFnHJ4J2V7rtz1p/
 FBP0QGnQxWCfs+GWzsqJKxqz66EmleSHDZtXvbKHaBCbdrS6bFMgGWAdoBaq5hRTvKk1
 IAbU4QUVUeqgtXnBEA9JGXIncA6nXjki8yuyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=FM/Z6quK2HFXaGlKN2qHDcgt6AtRbU+Icwi43NmIU6g=;
 b=DHVeyxraJ5lmZKSE7nDQHahSFZGSxvZWeAbwtCy/sBwcZBAFsF3kDlABCCOb99tHgX
 6XJcxf2Qwjz89qTMXtd4WjbqB4jowQ+Zdnv5CtMWlkgovMPrx4mh2IMiqx/haWVgfKC0
 ixMPuCHDB8oWO/ufpF0hG7ZlmdQIsgbe9wR5mKTb+2ArSs1IbdlYYi4yfEYZlj3Q9YGt
 EwkjpMUEXGYBhNmRU6/MUE15grT2N57aKhYA+n6AMLzIigriitWqHhYqM9QmnEbiXr3e
 6jBvOjJn1JNCzk0KAkjgO2cNprahsY5yVKyr4mj6Nwc0cDMcwRRGnr7B7bbokew8y9VD
 /tOw==
X-Gm-Message-State: AOAM530YZDfS8ufQt8uflV/MYZM1pIUMaLq/7IkosA4CMnEn89WSYkEO
 pwESUW+d+rvdLODZkbRYNdtDPw==
X-Google-Smtp-Source: ABdhPJydB+X7T3Uinb/cc9VMJSsCVdAEUcKhuzhNyoyqd8YRzscpNiO1NJQT0fjm1pOxqN4/qUBFXA==
X-Received: by 2002:a17:906:58ca:b0:6f4:444f:31ef with SMTP id
 e10-20020a17090658ca00b006f4444f31efmr19843303ejs.135.1651755440390; 
 Thu, 05 May 2022 05:57:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a05640206cf00b0042617ba6386sm823998edy.16.2022.05.05.05.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 05:57:19 -0700 (PDT)
Date: Thu, 5 May 2022 14:57:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/3] fbdev/simplefb: Cleanup fb_info in .fb_destroy
 rather than .remove
Message-ID: <YnPJroqQ+oxqJqIx@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>
References: <20220504215151.55082-1-javierm@redhat.com>
 <20220504215722.56970-1-javierm@redhat.com>
 <974f4d00-89bc-a2da-6d65-ca4207300794@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <974f4d00-89bc-a2da-6d65-ca4207300794@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 05, 2022 at 09:29:40AM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 04.05.22 um 23:57 schrieb Javier Martinez Canillas:
> > The driver is calling framebuffer_release() in its .remove callback, but
> > this will cause the struct fb_info to be freed too early. Since it could
> > be that a reference is still hold to it if user-space opened the fbdev.
> > 
> > This would lead to a use-after-free error if the framebuffer device was
> > unregistered but later a user-space process tries to close the fbdev fd.
> > 
> > The correct thing to do is to only unregister the framebuffer in the
> > driver's .remove callback, but do any cleanup in the fb_ops.fb_destroy.
> > 
> > Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Please see my question below.
> 
> > ---
> > 
> >   drivers/video/fbdev/simplefb.c | 8 +++++++-
> >   1 file changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
> > index 94fc9c6d0411..2c198561c338 100644
> > --- a/drivers/video/fbdev/simplefb.c
> > +++ b/drivers/video/fbdev/simplefb.c
> > @@ -84,6 +84,10 @@ struct simplefb_par {
> >   static void simplefb_clocks_destroy(struct simplefb_par *par);
> >   static void simplefb_regulators_destroy(struct simplefb_par *par);
> > +/*
> > + * fb_ops.fb_destroy is called by the last put_fb_info() call at the end
> > + * of unregister_framebuffer() or fb_release(). Do any cleanup here.
> > + */
> >   static void simplefb_destroy(struct fb_info *info)
> >   {
> >   	struct simplefb_par *par = info->par;
> > @@ -94,6 +98,8 @@ static void simplefb_destroy(struct fb_info *info)
> >   	if (info->screen_base)
> >   		iounmap(info->screen_base);
> > +	framebuffer_release(info);
> > +
> >   	if (mem)
> >   		release_mem_region(mem->start, resource_size(mem));
> 
> The original problem with fbdev hot-unplug was that vmwgfx needed the
> framebuffer region to be released. If we release it only after userspace
> closed it's final file descriptor, vmwgfx could have already failed.
> 
> I still don't fully get why this code apparently works or at least doesn't
> blow up occasionally. Any ideas?

See my other reply, releasing hw stuff should be done from ->remove, not
->fb_destroy.

Also note that none of the patches discussed moved around anything here,
we simply leaked things a bit when only unregistering the fb and not going
through the device->remove callback. I guess in practice it works because
unregistering the device sends out a uevent, and userspace then closes all
it's device fd as a reaction to that, and usually that's fast enough to
not upset anyone?

No idea tbh.
-Daniel

> Best regards
> Thomas
> 
> >   }
> > @@ -545,8 +551,8 @@ static int simplefb_remove(struct platform_device *pdev)
> >   {
> >   	struct fb_info *info = platform_get_drvdata(pdev);
> > +	/* simplefb_destroy takes care of info cleanup */
> >   	unregister_framebuffer(info);
> > -	framebuffer_release(info);
> >   	return 0;
> >   }
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

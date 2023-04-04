Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 910176D650A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 16:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6212D10E052;
	Tue,  4 Apr 2023 14:19:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51EA410E052
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 14:19:43 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id h8so131330399ede.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 07:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680617981; x=1683209981;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=yg0zujWjsopYUHjj/y+1CC+hIjRDJCkaqpnc9IDoyFU=;
 b=OGq4hw/UGyxuTDszYF65QSy806LADhMokUbgWW5lP6nOoKUgekC/Ji2fWE2jqmD850
 Un5XJE7fuFDWtOnoZfr0ieyiKsTFUiPCYn+Ybm9pV7E9a2oJVR+cVFLltxR/dKPYN6Jz
 gZG2xD/zH640DT3yMAelSZ0YUwuad2U7y8L3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680617981; x=1683209981;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yg0zujWjsopYUHjj/y+1CC+hIjRDJCkaqpnc9IDoyFU=;
 b=yH8Mx/ovnUZmfHijLN2Fl3wWWltDtn2AZjLvTEe2Cj88RU54Iz66UZJ0lNCg9qtpBo
 4847p44NideMRRGXf68Rin8en7mGTxlLnPzjWlaajmmAW/JKWCIDMfUTj/ZoCCKz3E1X
 qUIVHAq4Q+OFSHb2448+/ekSUgbUg+J8PlsV3EzkCPJcODX0om3eM6LoPuiFskTAR2eC
 Gcqmgx+lycnabZy0DPFcvLWY9H7FgIVwGaSVaYIwifRR/SgbAZKNbG8C9Ay9DJSVpDdr
 je2YjNg2SN4mb0UetwFX5fT9Y6s4As/BiZBicChe7neKgoJo+RHiaaBGFr9TXt3Od0LG
 X/3A==
X-Gm-Message-State: AAQBX9d8yBcbb7yT0JoEWFER4bO/aDlxopL/UIbMwFYUrlx6+5mTGb+z
 UUUc/xR8n7+uU60Nv0CWnE6caQ==
X-Google-Smtp-Source: AKy350b7a4TD8FYSmHY2Aiy+aQltFcZpP3gwei1H5/KEonXw0dG0bORtZVBS/rfhJUcvbB0RwEuGag==
X-Received: by 2002:a17:906:2d2:b0:93f:e5e4:8c13 with SMTP id
 18-20020a17090602d200b0093fe5e48c13mr2432631ejk.5.1680617981470; 
 Tue, 04 Apr 2023 07:19:41 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 t13-20020a1709067c0d00b009353047c02dsm5995973ejo.167.2023.04.04.07.19.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:19:41 -0700 (PDT)
Date: Tue, 4 Apr 2023 16:19:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] fbdev: Don't spam dmesg on bad userspace ioctl input
Message-ID: <ZCwx+2hAmyDqOfWu@phenom.ffwll.local>
References: <20230404123624.360384-1-daniel.vetter@ffwll.ch>
 <CAMuHMdUR=rx2QPvpzsSCwXTSTsPQOudNMzyL3dtZGQdQfrQGDA@mail.gmail.com>
 <ZCwtMJEAJiId/TJe@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCwtMJEAJiId/TJe@phenom.ffwll.local>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 Melissa Wen <melissa.srw@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 04, 2023 at 03:59:12PM +0200, Daniel Vetter wrote:
> On Tue, Apr 04, 2023 at 03:53:09PM +0200, Geert Uytterhoeven wrote:
> > Hi Daniel,
> > 
> > CC vkmsdrm maintainer
> > 
> > Thanks for your patch!
> > 
> > On Tue, Apr 4, 2023 at 2:36 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > There's a few reasons the kernel should not spam dmesg on bad
> > > userspace ioctl input:
> > > - at warning level it results in CI false positives
> > > - it allows userspace to drown dmesg output, potentially hiding real
> > >   issues.
> > >
> > > None of the other generic EINVAL checks report in the
> > > FBIOPUT_VSCREENINFO ioctl do this, so it's also inconsistent.
> > >
> > > I guess the intent of the patch which introduced this warning was that
> > > the drivers ->fb_check_var routine should fail in that case. Reality
> > > is that there's too many fbdev drivers and not enough people
> > > maintaining them by far, and so over the past few years we've simply
> > > handled all these validation gaps by tighning the checks in the core,
> > > because that's realistically really all that will ever happen.
> > >
> > > Reported-by: syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com
> > > Link: https://syzkaller.appspot.com/bug?id=c5faf983bfa4a607de530cd3bb008888bf06cefc
> > 
> >     WARNING: fbcon: Driver 'vkmsdrmfb' missed to adjust virtual screen
> > size (0x0 vs. 64x768)
> > 
> > This is a bug in the vkmsdrmfb driver and/or DRM helpers.
> > 
> > The message was added to make sure the individual drivers are fixed.
> > Perhaps it should be changed to BUG() instead, so dmesg output
> > cannot be drown?
> 
> So you're solution is to essentially force us to replicate this check over
> all the drivers which cannot change the virtual size?
> 
> Are you volunteering to field that audit and type all the patches?

Note that at least efifb, vesafb and offb seem to get this wrong. I didn't
bother checking any of the non-fw drivers. Iow there is a _lot_ of work in
your nack.
-Daniel

> > > Fixes: 6c11df58fd1a ("fbmem: Check virtual screen sizes in fb_set_var()")
> > > Cc: Helge Deller <deller@gmx.de>
> > > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Cc: stable@vger.kernel.org # v5.4+
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > 
> > NAKed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> Yes I know it's not pretty, but realistically unless someone starts typing
> a _lot_ of patches this is the solution. It's exactly the same solution
> we've implemented for all other gaps syzcaller has find in fbdev input
> validation. Unless you can show that this is papering over a more severe
> bug somewhere, but then I guess it really should be a BUG to prevent worse
> things from happening.
> -Daniel
> 
> > 
> > > --- a/drivers/video/fbdev/core/fbmem.c
> > > +++ b/drivers/video/fbdev/core/fbmem.c
> > > @@ -1021,10 +1021,6 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
> > >         /* verify that virtual resolution >= physical resolution */
> > >         if (var->xres_virtual < var->xres ||
> > >             var->yres_virtual < var->yres) {
> > > -               pr_warn("WARNING: fbcon: Driver '%s' missed to adjust virtual screen size (%ux%u vs. %ux%u)\n",
> > > -                       info->fix.id,
> > > -                       var->xres_virtual, var->yres_virtual,
> > > -                       var->xres, var->yres);
> > >                 return -EINVAL;
> > >         }
> > 
> > Gr{oetje,eeting}s,
> > 
> >                         Geert
> > 
> > 
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> > 
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

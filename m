Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB8565FCA2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 09:23:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE56E10E152;
	Fri,  6 Jan 2023 08:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCFE10E28F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 18:46:43 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id u204so32214804oib.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 10:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N0AB2x4qCilYXNN66qpiEjklcJr+ewmZBA/9Mtvh7+Y=;
 b=I4ymJC1LD9APlEXUMwtIT5TECUDlW7u6vpX4qge/EmRQCdkmAn1/3oUo+qWYty0Jl3
 hpoVUsUfASLZibDOcVc3ATfFV6UXHb4bd8N2mplIrS2KAKUtiM/OHl1TGgaWwVCu7Ewo
 E3thvCUbT5deEYkDzGiwVRnXFcJADeFJ6x6iRlyJ0DWFnjZiTuhOpVqSh3L7CbqeBcc9
 AAP2lOCt2xwkPAa73EC5hAn64oI4y98ZRvAQtOCwUV8iS1wSTbjc5J1bWX3cWk1bWNrb
 hZnrtafaaFAjqk5B+5WK9KePsCJjrB1q8wtPwu6y5U079El0JREX790ToHxPEaQvdLUC
 hZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N0AB2x4qCilYXNN66qpiEjklcJr+ewmZBA/9Mtvh7+Y=;
 b=cOOyLLkF+rRC4kL20MzbazqKFAqQA2nbfb4YNwGSlSZfyhtqkuxXJSJ5VefsWfZde9
 zDNaupz6NGsIBGfofqCCSGH8tW+wfkWlPiCKZsQRBngP/qzwmD1mKF0KxRXHocETVuRp
 jyJ4Q2aK6O5+jsVi2nKB/A4gZ3VMiYO8xj6ZRChowCA1ENndG4PmG53Epf/yd8fRI2+U
 kYHOqqeNfLZjdcXkltI9BBnBLeMfiXWpzvexV9I7HXDYFe/D5vCii84ooTIFtzfaEOfy
 SdD/g/1+sBfgnYyMAJIvFxKOS9uXCLiedmNmAPu5+iHi1n0aYXsea0m4azHIz+3k6nlq
 XAGg==
X-Gm-Message-State: AFqh2kpqeqvVl9E0hMBJpmfb/90NtL5vu0w39+ODjv2heu0GBHFRTW1r
 TINPS2t2YRQgENbDdqGb7q2T6TmigzlBHw+I0ZexJ5C3IGM=
X-Google-Smtp-Source: AMrXdXsdMfEt5J885g1j3Ot5GIl62/nRUiRrClg26yZH58s7d8RhcsuMZq2Q3v4IZVgAMMy7VsYYTksCGBjAyZF+/Gg=
X-Received: by 2002:a05:6870:1706:b0:144:dffd:8302 with SMTP id
 h6-20020a056870170600b00144dffd8302mr4104835oae.146.1672943945260; Thu, 05
 Jan 2023 10:39:05 -0800 (PST)
MIME-Version: 1.0
References: <20221230063528.41037-1-zh.nvgt@gmail.com>
 <2711de96-fcbe-5611-657a-ab29becd2ff6@gmx.de>
 <CAKMK7uEOX5n64cjzMt9GRQaS13HFPFyOeqdrkmzc035U5_T8tg@mail.gmail.com>
 <CAKMK7uE7CAXO50JPQ6ziQGGehqfDK2UanBQbfLdUH2RwrwXUvw@mail.gmail.com>
In-Reply-To: <CAKMK7uE7CAXO50JPQ6ziQGGehqfDK2UanBQbfLdUH2RwrwXUvw@mail.gmail.com>
From: Hang Zhang <zh.nvgt@gmail.com>
Date: Thu, 5 Jan 2023 13:38:54 -0500
Message-ID: <CAO2zrtYDcOfvxpG6wPghPnWZVks+NL6N9VaynsBVoX7nHBcxuw@mail.gmail.com>
Subject: Re: [PATCH] fbmem: prevent potential use-after-free issues with
 console_lock()
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 06 Jan 2023 08:23:21 +0000
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 5, 2023 at 5:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, 5 Jan 2023 at 11:21, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > Hi Helge
> >
> > On Mon, 2 Jan 2023 at 16:28, Helge Deller <deller@gmx.de> wrote:
> > >
> > > On 12/30/22 07:35, Hang Zhang wrote:
> > > > In do_fb_ioctl(), user specified "fb_info" can be freed in the callee
> > > > fbcon_get_con2fb_map_ioctl() -> set_con2fb_map() ->
> > > > con2fb_release_oldinfo(), this free operation is protected by
> > > > console_lock() in fbcon_set_con2fb_map_ioctl(), it also results in
> > > > the change of certain states such as "minfo->dead" in matroxfb_remove(),
> > > > so that it can be checked to avoid use-after-free before the use sites
> > > > (e.g., the check at the beginning of matroxfb_ioctl()). However,
> > > > the problem is that the use site is not protected by the same locks
> > > > as for the free operation, e.g., "default" case in do_fb_ioctl()
> > > > can lead to "matroxfb_ioctl()" but it's not protected by console_lock(),
> > > > which can invalidate the aforementioned state set and check in a
> > > > concurrent setting.
> > > >
> > > > Prevent the potential use-after-free issues by protecting the "default"
> > > > case in do_fb_ioctl() with console_lock(), similarly as for many other
> > > > cases like "case FBIOBLANK" and "case FBIOPAN_DISPLAY".
> > > >
> > > > Signed-off-by: Hang Zhang <zh.nvgt@gmail.com>
> > >
> > > applied to fbdev git tree.
> >
> > The patch above makes no sense at all to me:
> >
> > - fb_info is protected by lock_fb_info and
> > - the lifetime of fb_info is protected by the get/put functions
> > - yes there's the interaction with con2fb, which is protected by
> > console_lock, but the lifetime guarantees are ensured by the device
> > removal
> > - which means any stuff happening in matroxfb_remove is also not a
> > concern here (unless matroxfb completely gets all the device lifetime
> > stuff wrong, but it doesn't look like it's any worse than any of the
> > other fbdev drivers that we haven't recently fixed up due to the
> > takeover issues with firmware drivers
>
> I have also a really hard timing finding the con2fb map use in the
> matroxfb ioctl code, but that just might be that I didn't look
> carefully enough. Maybe that would shed some light on this.
> -Daniel
>
>
> >
> > On the very clear downside this now means we take console_lock for the
> > vblank ioctl (which is a device driver extension for reasons, despite
> > that it's a standard fbdev ioctl), which is no good at all given how
> > console_lock() is a really expensive lock.
> >
> > Unless I'm massively missing something, can you pls push the revert
> > before this lands in Linus' tree?
> >
> > Thanks, Daniel

Hi, Daniel. Thank you for your feedback. We're not developers of the
video subsystem and thus may be short in domain knowledge (e.g., the
performance of console_lock() and the complex lifetime management).
This patch initially intended to bring up the potential use-after-free
issues here to the community - we have performed a best-effort code
review and cannot exclude the possibility based on our understanding.

What we have observed is that the call chain leading to the free site
(do_fb_ioctl()->fbcon_set_con2fb_map_ioctl()->set_con2fb_map()->
con2fb_release_oldinfo()-> ... ->matroxfb_remove()) is only protected
by console_lock() but not lock_fb_info(), while the potential use
site (call chain starts from the default case in do_fb_ioctl()) is
only protected by lock_fb_info() but not console_lock().
We thus propose to add this extra console_lock() to the default case,
which is inspired by the lock protection of many other existing
switch-case terms in the same function.

Since we do not have deep domain knowledge of this subsystem, we will
rely on the developers to make a decision regarding the patch. Thank
you again for your review and help!

Best,
Hang

> >
> > > Thanks,
> > > Helge
> > >
> > > > ---
> > > >   drivers/video/fbdev/core/fbmem.c | 2 ++
> > > >   1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> > > > index 1e70d8c67653..8b1a1527d18a 100644
> > > > --- a/drivers/video/fbdev/core/fbmem.c
> > > > +++ b/drivers/video/fbdev/core/fbmem.c
> > > > @@ -1182,6 +1182,7 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> > > >               console_unlock();
> > > >               break;
> > > >       default:
> > > > +             console_lock();
> > > >               lock_fb_info(info);
> > > >               fb = info->fbops;
> > > >               if (fb->fb_ioctl)
> > > > @@ -1189,6 +1190,7 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> > > >               else
> > > >                       ret = -ENOTTY;
> > > >               unlock_fb_info(info);
> > > > +             console_unlock();
> > > >       }
> > > >       return ret;
> > > >   }
> > >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

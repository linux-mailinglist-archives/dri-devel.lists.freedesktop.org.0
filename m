Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B572F6606D8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 19:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EEBC10E8BD;
	Fri,  6 Jan 2023 18:59:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB9D10E8C5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 18:59:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so4270519wml.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 10:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EB9L09ZT4LgxH7QmAmuL+RfnfEH/uxZ6eOTsoZrqV8o=;
 b=OeMuE64xt4xVWOw9nP1xpX3iLXGeafnyHwy9SaHEmfX9v9V9FiOzmgFq1YmSrJiS9J
 ulyv5ERBj7lmm768N7P+UIpH7xy5DMfotJYCl8TOWdSc+QFwkOSgwrQEQBwDMONac4w7
 01maNjw9RfiQmM1r9Qg6h+qiDNIVIM44XEtNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EB9L09ZT4LgxH7QmAmuL+RfnfEH/uxZ6eOTsoZrqV8o=;
 b=xlXgqs7j3f+YcpKcnKoL9vMq74fTfbidHPazXs6zdJpl4f2tV4gVjVw0b6PG06+TKC
 K2vpclCdvvPkS+BFn7DKmupXzdQQjyMuDU2/0ITMyu4kpErg9PwMHHKDrO5arEuEmeE+
 5d36LeJwG++lQIFl+rmH7yxR90NmX94/yN630ube55zK0c2swnihavEc5ZRW90TzrlZb
 GmygXVENzDBm66pVSN8FqYJxURvexYJ10f3+ZPvDUBO9ruH9Na981Qmy75/bcHeYSFlM
 pRrhH1C91LYltTSus055nC7P9I0mjI/8XLp0izFqkQ7FPSwF4emxSgHop/reN205tjPL
 4nQg==
X-Gm-Message-State: AFqh2kqTxICATcHvVWsI9NBipjpRLo8Ul9uf/Jp8SSqh7P0Lk/yRIW6w
 o7+05LE/RFQC2Xvxfnb8cqGYPw==
X-Google-Smtp-Source: AMrXdXv8npyyRPhLx+WNOJ0Z/Earz2JzCqiyT8P3U7WshmLuQKfa7aDJ4qmoOG93cFMFeWY1CNkOYw==
X-Received: by 2002:a05:600c:3d8a:b0:3d3:4406:8a37 with SMTP id
 bi10-20020a05600c3d8a00b003d344068a37mr40421238wmb.41.1673031561708; 
 Fri, 06 Jan 2023 10:59:21 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c71358a42dsm9665293wmq.18.2023.01.06.10.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 10:59:20 -0800 (PST)
Date: Fri, 6 Jan 2023 19:59:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Hang Zhang <zh.nvgt@gmail.com>
Subject: Re: [PATCH] fbmem: prevent potential use-after-free issues with
 console_lock()
Message-ID: <Y7hvhtHeivfsnBtE@phenom.ffwll.local>
Mail-Followup-To: Hang Zhang <zh.nvgt@gmail.com>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20221230063528.41037-1-zh.nvgt@gmail.com>
 <2711de96-fcbe-5611-657a-ab29becd2ff6@gmx.de>
 <CAKMK7uEOX5n64cjzMt9GRQaS13HFPFyOeqdrkmzc035U5_T8tg@mail.gmail.com>
 <CAKMK7uE7CAXO50JPQ6ziQGGehqfDK2UanBQbfLdUH2RwrwXUvw@mail.gmail.com>
 <CAO2zrtYDcOfvxpG6wPghPnWZVks+NL6N9VaynsBVoX7nHBcxuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO2zrtYDcOfvxpG6wPghPnWZVks+NL6N9VaynsBVoX7nHBcxuw@mail.gmail.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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

On Thu, Jan 05, 2023 at 01:38:54PM -0500, Hang Zhang wrote:
> On Thu, Jan 5, 2023 at 5:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, 5 Jan 2023 at 11:21, Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > Hi Helge
> > >
> > > On Mon, 2 Jan 2023 at 16:28, Helge Deller <deller@gmx.de> wrote:
> > > >
> > > > On 12/30/22 07:35, Hang Zhang wrote:
> > > > > In do_fb_ioctl(), user specified "fb_info" can be freed in the callee
> > > > > fbcon_get_con2fb_map_ioctl() -> set_con2fb_map() ->
> > > > > con2fb_release_oldinfo(), this free operation is protected by
> > > > > console_lock() in fbcon_set_con2fb_map_ioctl(), it also results in
> > > > > the change of certain states such as "minfo->dead" in matroxfb_remove(),
> > > > > so that it can be checked to avoid use-after-free before the use sites
> > > > > (e.g., the check at the beginning of matroxfb_ioctl()). However,
> > > > > the problem is that the use site is not protected by the same locks
> > > > > as for the free operation, e.g., "default" case in do_fb_ioctl()
> > > > > can lead to "matroxfb_ioctl()" but it's not protected by console_lock(),
> > > > > which can invalidate the aforementioned state set and check in a
> > > > > concurrent setting.
> > > > >
> > > > > Prevent the potential use-after-free issues by protecting the "default"
> > > > > case in do_fb_ioctl() with console_lock(), similarly as for many other
> > > > > cases like "case FBIOBLANK" and "case FBIOPAN_DISPLAY".
> > > > >
> > > > > Signed-off-by: Hang Zhang <zh.nvgt@gmail.com>
> > > >
> > > > applied to fbdev git tree.
> > >
> > > The patch above makes no sense at all to me:
> > >
> > > - fb_info is protected by lock_fb_info and
> > > - the lifetime of fb_info is protected by the get/put functions
> > > - yes there's the interaction with con2fb, which is protected by
> > > console_lock, but the lifetime guarantees are ensured by the device
> > > removal
> > > - which means any stuff happening in matroxfb_remove is also not a
> > > concern here (unless matroxfb completely gets all the device lifetime
> > > stuff wrong, but it doesn't look like it's any worse than any of the
> > > other fbdev drivers that we haven't recently fixed up due to the
> > > takeover issues with firmware drivers
> >
> > I have also a really hard timing finding the con2fb map use in the
> > matroxfb ioctl code, but that just might be that I didn't look
> > carefully enough. Maybe that would shed some light on this.
> > -Daniel
> >
> >
> > >
> > > On the very clear downside this now means we take console_lock for the
> > > vblank ioctl (which is a device driver extension for reasons, despite
> > > that it's a standard fbdev ioctl), which is no good at all given how
> > > console_lock() is a really expensive lock.
> > >
> > > Unless I'm massively missing something, can you pls push the revert
> > > before this lands in Linus' tree?
> > >
> > > Thanks, Daniel
> 
> Hi, Daniel. Thank you for your feedback. We're not developers of the
> video subsystem and thus may be short in domain knowledge (e.g., the
> performance of console_lock() and the complex lifetime management).
> This patch initially intended to bring up the potential use-after-free
> issues here to the community - we have performed a best-effort code
> review and cannot exclude the possibility based on our understanding.
> 
> What we have observed is that the call chain leading to the free site
> (do_fb_ioctl()->fbcon_set_con2fb_map_ioctl()->set_con2fb_map()->
> con2fb_release_oldinfo()-> ... ->matroxfb_remove()) is only protected
> by console_lock() but not lock_fb_info(), while the potential use
> site (call chain starts from the default case in do_fb_ioctl()) is
> only protected by lock_fb_info() but not console_lock().
> We thus propose to add this extra console_lock() to the default case,
> which is inspired by the lock protection of many other existing
> switch-case terms in the same function.
> 
> Since we do not have deep domain knowledge of this subsystem, we will
> rely on the developers to make a decision regarding the patch. Thank
> you again for your review and help!

Can you please elaborate where you've found this use-after-free and how?
I'm still not understanding how you even got here - this is orthogonal to
whether the patch is the right fix or not.
-Daniel

> 
> Best,
> Hang
> 
> > >
> > > > Thanks,
> > > > Helge
> > > >
> > > > > ---
> > > > >   drivers/video/fbdev/core/fbmem.c | 2 ++
> > > > >   1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> > > > > index 1e70d8c67653..8b1a1527d18a 100644
> > > > > --- a/drivers/video/fbdev/core/fbmem.c
> > > > > +++ b/drivers/video/fbdev/core/fbmem.c
> > > > > @@ -1182,6 +1182,7 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> > > > >               console_unlock();
> > > > >               break;
> > > > >       default:
> > > > > +             console_lock();
> > > > >               lock_fb_info(info);
> > > > >               fb = info->fbops;
> > > > >               if (fb->fb_ioctl)
> > > > > @@ -1189,6 +1190,7 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> > > > >               else
> > > > >                       ret = -ENOTTY;
> > > > >               unlock_fb_info(info);
> > > > > +             console_unlock();
> > > > >       }
> > > > >       return ret;
> > > > >   }
> > > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

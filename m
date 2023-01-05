Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D161B65E8FB
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 11:25:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17BA310E6E2;
	Thu,  5 Jan 2023 10:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6D210E6E2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 10:25:18 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 h7-20020a17090aa88700b00225f3e4c992so1615715pjq.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 02:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Dt0BUqKwqWWibWQTb1wPCoKjm4VxsUkn0xweZKKMDlI=;
 b=YVRGKFa0easmpbhxNK49mPSwSm4p0yLlLolRTqAAayxsax3xiNb/DSU6taZNhLfwg2
 NwU/6V3PZ+hSXVdRw9G7LGmz5qE5R2f+uFoPn72pC1tJ2p7L4DjEcG1XFmIQqHqu2QH+
 jn+Z3syF3bwWcXBb55yis6EiEW7pTcDYekbDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dt0BUqKwqWWibWQTb1wPCoKjm4VxsUkn0xweZKKMDlI=;
 b=wC4LwemEho6YkjigY/P5wz+FB8d2esyYcl/tEi3I1upWRqd0KWhxgV59qkQm7HAc1G
 trUQy3dj8RitoAgkFCZe1z7CaMY51ZnKX6FgTBypd0U+8Y0HfxWlq9J23TNXNKhp4Iu5
 WxxAgjRet3OKfryWAcZAnWXJ9Yhrk3H3CuG825P/HRAJ9L+crI3r2BU5usQ3gZ1iEMnx
 eaTAeWjzTzarqyQCVVkNNfu/Lt44+6Xz0UnAkc68qAdw97KaV0ap0H6m6xjjT7knJIBD
 kDHV4DRYuI2xRScONzo2/wZM9taKEPGFjGeqK2YBE0n7Q8LIOCzPWLhmyogT0ZGSEXRb
 ++qg==
X-Gm-Message-State: AFqh2kqfn8ZcEn+SsFJHXJyXqSYb/ZFvLquHYR4XKWm5IJKD5R+20TMG
 4XMqc/i9pzCDWHRdjYqNU9ecIPVBPp301kKRc5Gy7jS0OQMvSQ==
X-Google-Smtp-Source: AMrXdXtH8U8MGVN+aDur6Y5usog53kmDoioY+u7d3Z2CRLX/YuYF2BfABux+LurZUiHsDsT7IgRi8tjHf6ScJFu4mbA=
X-Received: by 2002:a17:902:bf45:b0:189:505b:73dd with SMTP id
 u5-20020a170902bf4500b00189505b73ddmr2984463pls.143.1672914317807; Thu, 05
 Jan 2023 02:25:17 -0800 (PST)
MIME-Version: 1.0
References: <20221230063528.41037-1-zh.nvgt@gmail.com>
 <2711de96-fcbe-5611-657a-ab29becd2ff6@gmx.de>
 <CAKMK7uEOX5n64cjzMt9GRQaS13HFPFyOeqdrkmzc035U5_T8tg@mail.gmail.com>
In-Reply-To: <CAKMK7uEOX5n64cjzMt9GRQaS13HFPFyOeqdrkmzc035U5_T8tg@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 5 Jan 2023 11:25:06 +0100
Message-ID: <CAKMK7uE7CAXO50JPQ6ziQGGehqfDK2UanBQbfLdUH2RwrwXUvw@mail.gmail.com>
Subject: Re: [PATCH] fbmem: prevent potential use-after-free issues with
 console_lock()
To: Helge Deller <deller@gmx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-fbdev@vger.kernel.org, Hang Zhang <zh.nvgt@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 5 Jan 2023 at 11:21, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> Hi Helge
>
> On Mon, 2 Jan 2023 at 16:28, Helge Deller <deller@gmx.de> wrote:
> >
> > On 12/30/22 07:35, Hang Zhang wrote:
> > > In do_fb_ioctl(), user specified "fb_info" can be freed in the callee
> > > fbcon_get_con2fb_map_ioctl() -> set_con2fb_map() ->
> > > con2fb_release_oldinfo(), this free operation is protected by
> > > console_lock() in fbcon_set_con2fb_map_ioctl(), it also results in
> > > the change of certain states such as "minfo->dead" in matroxfb_remove(),
> > > so that it can be checked to avoid use-after-free before the use sites
> > > (e.g., the check at the beginning of matroxfb_ioctl()). However,
> > > the problem is that the use site is not protected by the same locks
> > > as for the free operation, e.g., "default" case in do_fb_ioctl()
> > > can lead to "matroxfb_ioctl()" but it's not protected by console_lock(),
> > > which can invalidate the aforementioned state set and check in a
> > > concurrent setting.
> > >
> > > Prevent the potential use-after-free issues by protecting the "default"
> > > case in do_fb_ioctl() with console_lock(), similarly as for many other
> > > cases like "case FBIOBLANK" and "case FBIOPAN_DISPLAY".
> > >
> > > Signed-off-by: Hang Zhang <zh.nvgt@gmail.com>
> >
> > applied to fbdev git tree.
>
> The patch above makes no sense at all to me:
>
> - fb_info is protected by lock_fb_info and
> - the lifetime of fb_info is protected by the get/put functions
> - yes there's the interaction with con2fb, which is protected by
> console_lock, but the lifetime guarantees are ensured by the device
> removal
> - which means any stuff happening in matroxfb_remove is also not a
> concern here (unless matroxfb completely gets all the device lifetime
> stuff wrong, but it doesn't look like it's any worse than any of the
> other fbdev drivers that we haven't recently fixed up due to the
> takeover issues with firmware drivers

I have also a really hard timing finding the con2fb map use in the
matroxfb ioctl code, but that just might be that I didn't look
carefully enough. Maybe that would shed some light on this.
-Daniel


>
> On the very clear downside this now means we take console_lock for the
> vblank ioctl (which is a device driver extension for reasons, despite
> that it's a standard fbdev ioctl), which is no good at all given how
> console_lock() is a really expensive lock.
>
> Unless I'm massively missing something, can you pls push the revert
> before this lands in Linus' tree?
>
> Thanks, Daniel
>
> > Thanks,
> > Helge
> >
> > > ---
> > >   drivers/video/fbdev/core/fbmem.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> > > index 1e70d8c67653..8b1a1527d18a 100644
> > > --- a/drivers/video/fbdev/core/fbmem.c
> > > +++ b/drivers/video/fbdev/core/fbmem.c
> > > @@ -1182,6 +1182,7 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> > >               console_unlock();
> > >               break;
> > >       default:
> > > +             console_lock();
> > >               lock_fb_info(info);
> > >               fb = info->fbops;
> > >               if (fb->fb_ioctl)
> > > @@ -1189,6 +1190,7 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> > >               else
> > >                       ret = -ENOTTY;
> > >               unlock_fb_info(info);
> > > +             console_unlock();
> > >       }
> > >       return ret;
> > >   }
> >
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

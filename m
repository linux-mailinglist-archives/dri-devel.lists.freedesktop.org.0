Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E08C965E8D9
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 11:21:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C1E10E6DC;
	Thu,  5 Jan 2023 10:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07ACD10E6D4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 10:21:18 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id g20so16742697pfb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 02:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6ZK4nzjpwYyPyn93IloxZTntg6CUAnuhsiuX1hJc/KI=;
 b=NuTSU+tAnwC8J4btJEi46FZKTDoZWSpXhsZZzvvEeCRUZI31x8P+7W/qyYZB6cEEZK
 0KfqehuBvr3rjXJk15PxC+x+93bMexZ1PTi8huCZmuuTQwSpPawXccgf2pmEghY9bMvX
 RzGNrLQAa48wSr1uQzuiAGZF/YjK7ZhJfA8YU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6ZK4nzjpwYyPyn93IloxZTntg6CUAnuhsiuX1hJc/KI=;
 b=Pd+PweNlBalQAWwUIdWgVNu6EFJebM5sqWjPoSZ0PK+1dqRfHTVdmb+Dryzop04gmz
 ckskwOUy+x7VrH+4CWLv2+NBpZySqwQ+IzIVMOlbvU8A0Wtw88oz1xmlL8F2pSLdGkQc
 dpMR/E8oqFJ9AKEt0SfL2n2N5x48f3k0FAX6S2rgS1S3MESPBC2W/vHEiEHcNtSg20WE
 c4fEpUnw6bgxkjCbrBFxK4x84t7AtT1U5G+ubQxNE8Z9MLBN28CGYDVY68fSwvnxSmBG
 9GJVZYKlK71GT7Vcnznrmmt9F4Rg7+yZZxCgvbJyJODgug5K3VRpWvZ+IPUZ7eeaM5rf
 GPaw==
X-Gm-Message-State: AFqh2krlj6+Nmqg0PEPWn77BaqjTNmdjoAFv0v1BRK4E4CfjVhdVUlFx
 oIX0nUDOPq1GeEh5Vphme5pcLencrsJyBbpnUd3wrQ==
X-Google-Smtp-Source: AMrXdXssy7ciG/1su3bGuzOuebGGe/Miuoaa+b1nRbxfY/bK92mfuvYqvrAxm2xmyTnyeF75o20imvtTyBVEbJ5RYRs=
X-Received: by 2002:a63:1b59:0:b0:478:b792:dea6 with SMTP id
 b25-20020a631b59000000b00478b792dea6mr3746828pgm.445.1672914077499; Thu, 05
 Jan 2023 02:21:17 -0800 (PST)
MIME-Version: 1.0
References: <20221230063528.41037-1-zh.nvgt@gmail.com>
 <2711de96-fcbe-5611-657a-ab29becd2ff6@gmx.de>
In-Reply-To: <2711de96-fcbe-5611-657a-ab29becd2ff6@gmx.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 5 Jan 2023 11:21:05 +0100
Message-ID: <CAKMK7uEOX5n64cjzMt9GRQaS13HFPFyOeqdrkmzc035U5_T8tg@mail.gmail.com>
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

Hi Helge

On Mon, 2 Jan 2023 at 16:28, Helge Deller <deller@gmx.de> wrote:
>
> On 12/30/22 07:35, Hang Zhang wrote:
> > In do_fb_ioctl(), user specified "fb_info" can be freed in the callee
> > fbcon_get_con2fb_map_ioctl() -> set_con2fb_map() ->
> > con2fb_release_oldinfo(), this free operation is protected by
> > console_lock() in fbcon_set_con2fb_map_ioctl(), it also results in
> > the change of certain states such as "minfo->dead" in matroxfb_remove(),
> > so that it can be checked to avoid use-after-free before the use sites
> > (e.g., the check at the beginning of matroxfb_ioctl()). However,
> > the problem is that the use site is not protected by the same locks
> > as for the free operation, e.g., "default" case in do_fb_ioctl()
> > can lead to "matroxfb_ioctl()" but it's not protected by console_lock(),
> > which can invalidate the aforementioned state set and check in a
> > concurrent setting.
> >
> > Prevent the potential use-after-free issues by protecting the "default"
> > case in do_fb_ioctl() with console_lock(), similarly as for many other
> > cases like "case FBIOBLANK" and "case FBIOPAN_DISPLAY".
> >
> > Signed-off-by: Hang Zhang <zh.nvgt@gmail.com>
>
> applied to fbdev git tree.

The patch above makes no sense at all to me:

- fb_info is protected by lock_fb_info and
- the lifetime of fb_info is protected by the get/put functions
- yes there's the interaction with con2fb, which is protected by
console_lock, but the lifetime guarantees are ensured by the device
removal
- which means any stuff happening in matroxfb_remove is also not a
concern here (unless matroxfb completely gets all the device lifetime
stuff wrong, but it doesn't look like it's any worse than any of the
other fbdev drivers that we haven't recently fixed up due to the
takeover issues with firmware drivers

On the very clear downside this now means we take console_lock for the
vblank ioctl (which is a device driver extension for reasons, despite
that it's a standard fbdev ioctl), which is no good at all given how
console_lock() is a really expensive lock.

Unless I'm massively missing something, can you pls push the revert
before this lands in Linus' tree?

Thanks, Daniel

> Thanks,
> Helge
>
> > ---
> >   drivers/video/fbdev/core/fbmem.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
> > index 1e70d8c67653..8b1a1527d18a 100644
> > --- a/drivers/video/fbdev/core/fbmem.c
> > +++ b/drivers/video/fbdev/core/fbmem.c
> > @@ -1182,6 +1182,7 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> >               console_unlock();
> >               break;
> >       default:
> > +             console_lock();
> >               lock_fb_info(info);
> >               fb = info->fbops;
> >               if (fb->fb_ioctl)
> > @@ -1189,6 +1190,7 @@ static long do_fb_ioctl(struct fb_info *info, unsigned int cmd,
> >               else
> >                       ret = -ENOTTY;
> >               unlock_fb_info(info);
> > +             console_unlock();
> >       }
> >       return ret;
> >   }
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

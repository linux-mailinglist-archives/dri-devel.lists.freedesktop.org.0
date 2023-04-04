Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4913E6D65E0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 16:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D39110E047;
	Tue,  4 Apr 2023 14:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D519010E047
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 14:54:47 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-544f7c176easo618352507b3.9
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 07:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620086;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ik+XVDuVY5uU69jOiX1kKbBmdHoMOQd3oBGc6LuK8RQ=;
 b=ZVJIKNp7PAn9VAvEUbPY3kkrSFNe4k2nvzizXYZN98EmzlZ0O/RkH5Vhkta/KRYRpN
 u1wt65a023Dpgi6S+lODQjVDEKezkdruEk9K5GvlwCfmt0E4twkY2ln2m0ihB6ZBHvOc
 LlcKlJX7Mzqx35pnxh5o+bp2UBTmzQpyKMsJ9z36pxwPGha25SF6IQ14g8jS/rev9Q85
 NWSG2xyowveqm8M5FsePfBw5+1/qrkVJ4T1WlTM1y/tf1TT4KvbcTLjbD56FwFosMVwS
 HpUK4YW0Ai6dWNHZlMb+TtRMCWcokrIpP1wSDdVEvCkiiR3w9+3wjwsDK6jcGBsnonuk
 7OSg==
X-Gm-Message-State: AAQBX9en02OGkjAwlg/Fz4AAKStaOFp2bSLnRQk3UKeM0KQdAMy4aHZ7
 jSh/Cv1QpzUVsJ1ReZnq/C5pu66nNA763BAM
X-Google-Smtp-Source: AKy350b/+0WBLU7VSiwcz9dN1C77cctIxUWsEeB+qDYCV30Yqe8d8kENno2az1E4m3z5gAYodE36kQ==
X-Received: by 2002:a81:4e07:0:b0:540:cd00:b719 with SMTP id
 c7-20020a814e07000000b00540cd00b719mr2401165ywb.45.1680620086007; 
 Tue, 04 Apr 2023 07:54:46 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com.
 [209.85.128.177]) by smtp.gmail.com with ESMTPSA id
 p78-20020a819851000000b00545a08184a8sm3252566ywg.56.2023.04.04.07.54.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 07:54:45 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-536af432ee5so619361607b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Apr 2023 07:54:45 -0700 (PDT)
X-Received: by 2002:a81:4304:0:b0:541:7f69:aa9b with SMTP id
 q4-20020a814304000000b005417f69aa9bmr1667876ywa.4.1680620085205; Tue, 04 Apr
 2023 07:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230404123624.360384-1-daniel.vetter@ffwll.ch>
 <CAMuHMdUR=rx2QPvpzsSCwXTSTsPQOudNMzyL3dtZGQdQfrQGDA@mail.gmail.com>
 <ZCwtMJEAJiId/TJe@phenom.ffwll.local> <ZCwx+2hAmyDqOfWu@phenom.ffwll.local>
 <fab035dd-6276-5343-7422-69969afb8006@suse.de>
In-Reply-To: <fab035dd-6276-5343-7422-69969afb8006@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Apr 2023 16:54:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVkSbYrQesuGyEcdufZ6WH2CFTMEEpCP6atDMq11abn3A@mail.gmail.com>
Message-ID: <CAMuHMdVkSbYrQesuGyEcdufZ6WH2CFTMEEpCP6atDMq11abn3A@mail.gmail.com>
Subject: Re: [PATCH] fbdev: Don't spam dmesg on bad userspace ioctl input
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 Melissa Wen <melissa.srw@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CC linux-fbdev

On Tue, Apr 4, 2023 at 4:41=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Am 04.04.23 um 16:19 schrieb Daniel Vetter:
> > On Tue, Apr 04, 2023 at 03:59:12PM +0200, Daniel Vetter wrote:
> >> On Tue, Apr 04, 2023 at 03:53:09PM +0200, Geert Uytterhoeven wrote:
> >>> CC vkmsdrm maintainer
> >>>
> >>> Thanks for your patch!
> >>>
> >>> On Tue, Apr 4, 2023 at 2:36=E2=80=AFPM Daniel Vetter <daniel.vetter@f=
fwll.ch> wrote:
> >>>> There's a few reasons the kernel should not spam dmesg on bad
> >>>> userspace ioctl input:
> >>>> - at warning level it results in CI false positives
> >>>> - it allows userspace to drown dmesg output, potentially hiding real
> >>>>    issues.
> >>>>
> >>>> None of the other generic EINVAL checks report in the
> >>>> FBIOPUT_VSCREENINFO ioctl do this, so it's also inconsistent.
> >>>>
> >>>> I guess the intent of the patch which introduced this warning was th=
at
> >>>> the drivers ->fb_check_var routine should fail in that case. Reality
> >>>> is that there's too many fbdev drivers and not enough people
> >>>> maintaining them by far, and so over the past few years we've simply
> >>>> handled all these validation gaps by tighning the checks in the core=
,
> >>>> because that's realistically really all that will ever happen.
> >>>>
> >>>> Reported-by: syzbot+20dcf81733d43ddff661@syzkaller.appspotmail.com
> >>>> Link: https://syzkaller.appspot.com/bug?id=3Dc5faf983bfa4a607de530cd=
3bb008888bf06cefc
> >>>
> >>>      WARNING: fbcon: Driver 'vkmsdrmfb' missed to adjust virtual scre=
en
> >>> size (0x0 vs. 64x768)
> >>>
> >>> This is a bug in the vkmsdrmfb driver and/or DRM helpers.
> >>>
> >>> The message was added to make sure the individual drivers are fixed.
> >>> Perhaps it should be changed to BUG() instead, so dmesg output
> >>> cannot be drown?
> >>
> >> So you're solution is to essentially force us to replicate this check =
over
> >> all the drivers which cannot change the virtual size?
> >>
> >> Are you volunteering to field that audit and type all the patches?

The message is there to invite people to look at .fb_check_var()
implementations, and fix the issues.

> As most of us really only care about DRM, we can add this test to
> drm_fb_helper_check_var() [1] and that's it. No need to fix all of the
> fbdev drivers.

Either drm_fb_helper_check_var() (which is the most used buggy
implementation) has to be fixed, or it should be removed, cfr.
https://lore.kernel.org/all/20220629105658.1373770-1-geert@linux-m68k.org

> Having said that, I think the few remaining fbdev devs should decide if
> they want to actually put effort into fbdev, or accept it to bitrot
> away. The current state of 'non-maintenance' is the worst situation.
> I've been working on the console emulation and it is hard to get
> qualified reviews of the related fbdev code. At the same time, it's also
> not possible to get Ack-bys rubber-stamped.
>
> Best regards
> Thomas
>
> [1]
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_fb_hel=
per.c#L1514
>
> > -Daniel
> >
> >>>> Fixes: 6c11df58fd1a ("fbmem: Check virtual screen sizes in fb_set_va=
r()")
> >>>> Cc: Helge Deller <deller@gmx.de>
> >>>> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> >>>> Cc: stable@vger.kernel.org # v5.4+
> >>>> Cc: Daniel Vetter <daniel@ffwll.ch>
> >>>> Cc: Javier Martinez Canillas <javierm@redhat.com>
> >>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>>
> >>> NAKed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >>
> >> Yes I know it's not pretty, but realistically unless someone starts ty=
ping
> >> a _lot_ of patches this is the solution. It's exactly the same solutio=
n
> >> we've implemented for all other gaps syzcaller has find in fbdev input
> >> validation. Unless you can show that this is papering over a more seve=
re
> >> bug somewhere, but then I guess it really should be a BUG to prevent w=
orse
> >> things from happening.
> >> -Daniel
> >>
> >>>
> >>>> --- a/drivers/video/fbdev/core/fbmem.c
> >>>> +++ b/drivers/video/fbdev/core/fbmem.c
> >>>> @@ -1021,10 +1021,6 @@ fb_set_var(struct fb_info *info, struct fb_va=
r_screeninfo *var)
> >>>>          /* verify that virtual resolution >=3D physical resolution =
*/
> >>>>          if (var->xres_virtual < var->xres ||
> >>>>              var->yres_virtual < var->yres) {
> >>>> -               pr_warn("WARNING: fbcon: Driver '%s' missed to adjus=
t virtual screen size (%ux%u vs. %ux%u)\n",
> >>>> -                       info->fix.id,
> >>>> -                       var->xres_virtual, var->yres_virtual,
> >>>> -                       var->xres, var->yres);
> >>>>                  return -EINVAL;
> >>>>          }

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

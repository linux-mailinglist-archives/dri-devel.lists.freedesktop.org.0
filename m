Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AE027D160
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 16:39:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205CA89D44;
	Tue, 29 Sep 2020 14:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2044389D44
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 14:39:02 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id 26so5689120ois.5
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v5Tw3TRzMSnJ+zmzf+k5HrdAxKFGZjBxyksiiDH23tY=;
 b=FO9EmsSUUymvIZirq9hzjdf/gb/yX0Q8fEpPsPcWqh1Ug8eeQ+AC6FMjga1EeczmSD
 MJZP/89dJJJwW0iTCKtKTSyTDMXgqAft+Sxmi2qGrmp8h4nmm4KqpbhXGq7yvGRwHkQy
 /x79YCxHsN1jAb9sIQSav+EvrKBwruGshMbx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v5Tw3TRzMSnJ+zmzf+k5HrdAxKFGZjBxyksiiDH23tY=;
 b=gmz/rTK8s5i6x3Md3PoAHHhirgQ1XANB+6ExJj7bck43b+APMOTtgA+SlkP1FPneIq
 NndLn7UHkP/t0xw8Rdz80puChWUh/7MFPUYVDpuDbwRbqp4yTm7msQNtm05yHbTy32IV
 zECMzkSfBYbH4S/J+4zTAtS/ZPHX8//PfhVqadkdn8fUGjKZx0eKYLsPMYvzkOmaSmBL
 TR+98fsJi8FGIEewlvrwmEpVSuCePA8XMmeFKNRVqSTetGZuUsciVbyDVKdh1KCnwDzn
 0b0dEAxmucfanbYmvEB+ahSNV3CVS1cKc3HxsDAMNDMsAVm2qFVTvDd+fgCCv1QeKD1s
 BQew==
X-Gm-Message-State: AOAM532ytwPcoBk+2SqdbsThFm8ON9mckSEZN5tlVr7Y4lkbx0YyCP+q
 ETaQVZg/cfOBZNEZihdOPEdQNo7SPDyuGLNb7j/ekQ==
X-Google-Smtp-Source: ABdhPJxJZeO2VJPang7HeIHdj+cw78jw996VcPuS4lCoj3gndTIv5EkWZxhm8jT0V+48eSne4jxtZtzgnB99C181NQ0=
X-Received: by 2002:aca:6083:: with SMTP id u125mr2832826oib.14.1601390341265; 
 Tue, 29 Sep 2020 07:39:01 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local> <20200929123420.GA1143575@PWN>
In-Reply-To: <20200929123420.GA1143575@PWN>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 29 Sep 2020 16:38:49 +0200
Message-ID: <CAKMK7uFY2zv0adjKJ_ORVFT7Zzwn075MaU0rEU7_FuqENLR=UA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
To: Peilin Ye <yepeilin.cs@gmail.com>
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 2:34 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> On Fri, Sep 25, 2020 at 03:25:51PM +0200, Daniel Vetter wrote:
> > I think the only way to make this work is that we have one place which
> > takes in the userspace uapi struct, and then converts it once into a
> > kernel_console_font. With all the error checking.
>
> Hi Daniel,
>
> It seems that users don't use `console_font` directly, they use
> `console_font_op`. Then, in TTY:

Wow, this is a maze :-/

> (drivers/tty/vt/vt.c)
> int con_font_op(struct vc_data *vc, struct console_font_op *op)
> {
>         switch (op->op) {
>         case KD_FONT_OP_SET:
>                 return con_font_set(vc, op);
>         case KD_FONT_OP_GET:
>                 return con_font_get(vc, op);
>         case KD_FONT_OP_SET_DEFAULT:
>                 return con_font_default(vc, op);
>         case KD_FONT_OP_COPY:
>                 return con_font_copy(vc, op);
>         }
>         return -ENOSYS;
> }

So my gut feeling is that this is just a bit of overenthusiastic
common code sharing, and all it results is confuse everyone. I think
if we change the conf_font_get/set/default/copy functions to not take
the *op struct (which is take pretty arbitrarily from one of the
ioctl), but the parameters each needs directly, that would clean up
the code a _lot_. Since most callers would then directly call the
right operation, instead of this detour through console_font_op.
struct console_font_op is an uapi struct, so really shouldn't be used
for internal abstractions - we can't change uapi, hence this makes it
impossible to refactor anything from the get-go.

I also think that trying to get rid of con_font_op callers as much as
possible (everywhere where the op struct is constructed in the kernel
and doesn't come from userspace essentially) should be doable as a
stand-alone patch series.

> These 4 functions allocate `console_font`. We can replace them with our
> `kernel_console_font`. So, ...
>
> $ vgrep "\.con_font_set"

An aside: git grep is awesome, and really fast.

> Index File                                    Line Content
>     0 drivers/usb/misc/sisusbvga/sisusb_con.c 1294 .con_font_set =              sisusbcon_font_set,
>     1 drivers/usb/misc/sisusbvga/sisusb_con.c 1378 .con_font_set =              sisusbdummycon_font_set,
>     2 drivers/video/console/dummycon.c         162 .con_font_set =      dummycon_font_set,
>     3 drivers/video/console/newport_con.c      693 .con_font_set          = newport_font_set,
>     4 drivers/video/console/vgacon.c          1226 .con_font_set = vgacon_font_set,
>     5 drivers/video/fbdev/core/fbcon.c        3120 .con_font_set                = fbcon_set_font,
> $
> $ vgrep "\.con_font_get"
> Index File                                    Line Content
>     0 drivers/usb/misc/sisusbvga/sisusb_con.c 1295 .con_font_get =              sisusbcon_font_get,
>     1 drivers/video/console/vgacon.c          1227 .con_font_get = vgacon_font_get,
>     2 drivers/video/fbdev/core/fbcon.c        3121 .con_font_get                = fbcon_get_font,
> $
> $ vgrep "\.con_font_default"
> Index File                                    Line Content
>     0 drivers/usb/misc/sisusbvga/sisusb_con.c 1379 .con_font_default =  sisusbdummycon_font_default,
>     1 drivers/video/console/dummycon.c         163 .con_font_default =  dummycon_font_default,

The above two return 0 but do nothing, which means width/height are
now bogus (or well the same as what userspace set). I don't think that
works correctly ...

>     2 drivers/video/console/newport_con.c      694 .con_font_default = newport_font_default,

This just seems to release the userspace font. This is already done in
other places where it makes a lot more sense to clean up.

>     3 drivers/video/fbdev/core/fbcon.c        3122 .con_font_default    = fbcon_set_def_font,

This actually does something. tbh I would not be surprises if the
fb_set utility is the only thing that uses this - with a bit of code
search we could perhaps confirm this, and delete all the other
implementations.

> $
> $ vgrep "\.con_font_copy"
> Index File                                    Line Content
>     0 drivers/usb/misc/sisusbvga/sisusb_con.c 1380 .con_font_copy =     sisusbdummycon_font_copy,
>     1 drivers/video/console/dummycon.c         164 .con_font_copy =     dummycon_font_copy,

Above two do nothing, but return 0. Again this wont work I think.

>     2 drivers/video/fbdev/core/fbcon.c        3123 .con_font_copy               = fbcon_copy_font,

Smells again like something that's only used by fb_set, and we could
probably delete the other dummy implementations. Also I'm not even
really clear on what this does ...

Removing these dummy functions means that for a dummy console these
ioctls would start failing, but then I don't think anyone boots up
into a dummy console and expects font changes to work. So again I
think we could split this cleanup as prep work.


> $ _
>
> ... are these all the callbacks we need to take care of? What about
> other console drivers that don't register these callbacks? ...
>
> $ vgrep "\.con_init"
> Index File                                    Line Content
> [...]
>     3 drivers/usb/misc/sisusbvga/sisusb_con.c 1285 .con_init =          sisusbcon_init,
>     4 drivers/usb/misc/sisusbvga/sisusb_con.c 1369 .con_init =          sisusbdummycon_init,
>     5 drivers/video/console/dummycon.c         153 .con_init =          dummycon_init,
>     6 drivers/video/console/mdacon.c           544 .con_init =          mdacon_init,
>     7 drivers/video/console/newport_con.c      684 .con_init      = newport_init,
>     8 drivers/video/console/sticon.c           328 .con_init            = sticon_init,
>     9 drivers/video/console/vgacon.c          1217 .con_init = vgacon_init,
>    10 drivers/video/fbdev/core/fbcon.c        3111 .con_init             = fbcon_init,
> [...]
>
> ... for example, mdacon.c? What font does mdacon.c use? I know that
> /lib/fonts/ exports two functions, find_font() and get_default_font(),
> but I don't see them being used in mdacon.c.

I think all other consoles either don't have fonts at all, or only
support built-in fonts.

> Ah, and speaking of built-in fonts, see fbcon_startup():
>
>         /* Setup default font */
>                 [...]
>                 vc->vc_font.charcount = 256; /* FIXME  Need to support more fonts */
>                             ^^^^^^^^^^^^^^^
>
> This is because find_font() and get_default_font() return a `struct
> font_desc *`, but `struct font_desc` doesn't contain `charcount`. I
> think we also need to add a `charcount` field to `struct font_desc`.

Hm yeah ... I guess maybe struct font_desc should be the starting
point for the kernel internal font structure. It's at least there
already ...

> > Then all internal code deals in terms of kernel_console_font, with
> > properly typed and named struct members and helper functions and
> > everything. And we might need a gradual conversion for this, so that first
> > we can convert over invidual console drivers, then subsystems, until at
> > the end we've pushed the conversion from uapi array to kernel_console_font
> > all the way to the ioctl entry points.
>
> Currently `struct vc_data` contains a `struct console_font vc_font`, and
> I think this is making gradual conversion very hard. As an example, in
> fbcon_do_set_font(), we update `vc->vc_font`. We lose all the extra
> information we want in `kernel_console_font`, as long as `struct
> vc_data` still uses `console_font`...
>
> However, if we let `struct vc_data` use `kernel_console_font` instead,
> we'll have to handle a lot of things in one go:
>
> $ vgrep --no-less --no-header ".vc_font" | wc -l
> 296
> $ echo ":("
> :(

Yes :-/

This is essentially why the entire vc/fbcon layer is such a mess. It's
a chaos, it doesn't really have clear abstraction, and very often the
uapi structures (see also conf_font_op) leak deeply into the
implementation, which means changing anything is nearly impossible ...

I think for vc_date->vc_font we might need a multi-step approach:
- first add a new helper function which sets the font for a vc using
an uapi console_font struct (and probably hard-coded assumes cnt ==
256.
- roll that out everwhere
- change the type of vc_font to what we want (which should only need a
change in the helper function, which will also set charcount hopefully
correctly, using the hard-coded assumption
- have another functions which sets the vf_font using a
kernel_console_font for all the cases where it matters
- now you can start using it and assume the charcount is set correctly

It's a journey unfortunately.

> The good news is, I've tried cleaning up all the macros in fbcon.c in my
> playground, and things seem to work. For example, currently we have:
>
>         if (userfont)
>                 cnt = FNTCHARCNT(data);
>         else
>                 cnt = 256;
>
> After introducing `kernel_console_font` (and adding `charcount` to
> `struct font_desc` etc.), this should look like:
>
> #define to_font(_data) container_of(_data, struct kernel_console_font, data)
>         [...]
>         cnt = to_font(data)->charcount;

Hm I guess we can't unify font_desc and the kernel_console_font we're
talking about into one? I think that was brough up already somewhere
else in this thread ...

> No more `if` and `else`, and the framebuffer layer will be able to
> support new bulit-in fonts that have more than 256 characters. This
> seems really nice, so I'd like to spend some time working on it.
>
> However before I start working on real patches, do you have suggestions
> about which console driver I should start with, or how should I split up
> the work in general? I couldn't think of how do we clean up subsystems
> one by one, while keeping a `console_font` in `struct vc_data`.

I think from a "stop security bugs" trying to clean up fbcon is the
important part. That's also the most complex (only one that supports
the default and copy functions it seems, and also one of the few that
supports get). The other ones I think we should just try to not break.
vgacon should still be useable (but I think only on systems where you
can boot into legacy bios, not into uefi, at least on x86). I have no
idea where some of the other consoles are even used.

For first steps I'd start with demidlayering some of the internal
users of uapi structs, like the console_font_op really shouldn't be
used anywhere in any function, except in the ioctl handler that
converts it into the right function call. You'll probably discover a
few other places like this on the go.

Cheers, Daniel
--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

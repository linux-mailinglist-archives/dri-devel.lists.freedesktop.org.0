Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4031427E5AF
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 11:53:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E54C6E5B4;
	Wed, 30 Sep 2020 09:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D160389CB9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 09:53:21 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k18so1030732wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 02:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=WoHKWOlPNfcQ4v8ZyGvzQc5VPIFGwchaueyjYRrjdq8=;
 b=M3QkKZCBZdHK8iI1o3DWhAH1IosFK+2MvS30cifNrui3/w2ksT/zD/icoo6VBjNpGr
 u9pZBx45u++aKmgDLn3zYXMg/ofrFnnm318kYsfCWH5yFMFxanbccO4VvxZOQB2CoqrG
 ewNro3qUNCp6Yyez3HC1gEj9bHkAHag52WpKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=WoHKWOlPNfcQ4v8ZyGvzQc5VPIFGwchaueyjYRrjdq8=;
 b=Bl7cBNz3vTtvyN4af1gfJyZ0xrU7UZM8B2etD/Xy0UORMULvR5R9tvjgB4ZTzwWsrR
 Ri2C/OBu1pPm9ugX06hr0WkwaEV/+oNr76YwB0BRYRDTgbvrZ/r+AS4Mrm5sMUIfLKHt
 +ktTtvI1vWf5SXDfYVSr8pbLhHs71jGI0RGfZ//4FTNK3gG2Heq25UU4o81qmlkSliMP
 dgAbkzBkW9SAf+ajlI4IhoewkL/A/0WYJgSH2cmoNhv3DDL4H8c4maF2mFmgppfP/Spb
 2a/NdARkc7/ysTDJgz1CaZWHoJqoeNmjdurEW8DHRgYo4cFiQfljtW3S/sBU5CILHj4I
 wk/Q==
X-Gm-Message-State: AOAM532dzrHS9wkQ4dJ2J7VoaWhOYKFWLZq34GEjZ/C8ZblFJkw3gyAp
 1NHyTJqM2sDN4wz64Gt/5t2MnQ==
X-Google-Smtp-Source: ABdhPJya9c//LvdCxl+wMQiBvz9Y8lqIVVtXQawnOe20Z2J48Drh16slawD3eQvTae8RgVCPZJEGiA==
X-Received: by 2002:a1c:a949:: with SMTP id s70mr2052585wme.42.1601459600384; 
 Wed, 30 Sep 2020 02:53:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d18sm1960258wrm.10.2020.09.30.02.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 02:53:19 -0700 (PDT)
Date: Wed, 30 Sep 2020 11:53:17 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Message-ID: <20200930095317.GX438822@phenom.ffwll.local>
Mail-Followup-To: Peilin Ye <yepeilin.cs@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
 <20200925132551.GF438822@phenom.ffwll.local>
 <20200929123420.GA1143575@PWN>
 <CAKMK7uFY2zv0adjKJ_ORVFT7Zzwn075MaU0rEU7_FuqENLR=UA@mail.gmail.com>
 <20200930071151.GA1152145@PWN>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930071151.GA1152145@PWN>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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

On Wed, Sep 30, 2020 at 03:11:51AM -0400, Peilin Ye wrote:
> On Tue, Sep 29, 2020 at 04:38:49PM +0200, Daniel Vetter wrote:
> > On Tue, Sep 29, 2020 at 2:34 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> > > It seems that users don't use `console_font` directly, they use
> > > `console_font_op`. Then, in TTY:
> > 
> > Wow, this is a maze :-/
> > 
> > > (drivers/tty/vt/vt.c)
> > > int con_font_op(struct vc_data *vc, struct console_font_op *op)
> > > {
> > >         switch (op->op) {
> > >         case KD_FONT_OP_SET:
> > >                 return con_font_set(vc, op);
> > >         case KD_FONT_OP_GET:
> > >                 return con_font_get(vc, op);
> > >         case KD_FONT_OP_SET_DEFAULT:
> > >                 return con_font_default(vc, op);
> > >         case KD_FONT_OP_COPY:
> > >                 return con_font_copy(vc, op);
> > >         }
> > >         return -ENOSYS;
> > > }
> > 
> > So my gut feeling is that this is just a bit of overenthusiastic
> > common code sharing, and all it results is confuse everyone. I think
> > if we change the conf_font_get/set/default/copy functions to not take
> > the *op struct (which is take pretty arbitrarily from one of the
> > ioctl), but the parameters each needs directly, that would clean up
> > the code a _lot_. Since most callers would then directly call the
> > right operation, instead of this detour through console_font_op.
> > struct console_font_op is an uapi struct, so really shouldn't be used
> > for internal abstractions - we can't change uapi, hence this makes it
> > impossible to refactor anything from the get-go.
> > 
> > I also think that trying to get rid of con_font_op callers as much as
> > possible (everywhere where the op struct is constructed in the kernel
> > and doesn't come from userspace essentially) should be doable as a
> > stand-alone patch series.
> 
> I see, I'll do some code searching and try to clean them up.
> 
> > > These 4 functions allocate `console_font`. We can replace them with our
> > > `kernel_console_font`. So, ...
> > >
> > > $ vgrep "\.con_font_set"
> > 
> > An aside: git grep is awesome, and really fast.
> 
> Ah, yes, by default vgrep uses git-grep. I use vgrep when I need to see
> something colorful :)
> 
> > > $ vgrep "\.con_font_get"
> > > Index File                                    Line Content
> > >     0 drivers/usb/misc/sisusbvga/sisusb_con.c 1295 .con_font_get =              sisusbcon_font_get,
> > >     1 drivers/video/console/vgacon.c          1227 .con_font_get = vgacon_font_get,
> > >     2 drivers/video/fbdev/core/fbcon.c        3121 .con_font_get                = fbcon_get_font,
> > > $
> > > $ vgrep "\.con_font_default"
> > > Index File                                    Line Content
> > >     0 drivers/usb/misc/sisusbvga/sisusb_con.c 1379 .con_font_default =  sisusbdummycon_font_default,
> > >     1 drivers/video/console/dummycon.c         163 .con_font_default =  dummycon_font_default,
> > 
> > The above two return 0 but do nothing, which means width/height are
> > now bogus (or well the same as what userspace set). I don't think that
> > works correctly ...
> > 
> > >     2 drivers/video/console/newport_con.c      694 .con_font_default = newport_font_default,
> > 
> > This just seems to release the userspace font. This is already done in
> > other places where it makes a lot more sense to clean up.
> > 
> > >     3 drivers/video/fbdev/core/fbcon.c        3122 .con_font_default    = fbcon_set_def_font,
> > 
> > This actually does something. tbh I would not be surprises if the
> > fb_set utility is the only thing that uses this - with a bit of code
> > search we could perhaps confirm this, and delete all the other
> > implementations.
> > 
> > > $ vgrep "\.con_font_copy"
> > > Index File                                    Line Content
> > >     0 drivers/usb/misc/sisusbvga/sisusb_con.c 1380 .con_font_copy =     sisusbdummycon_font_copy,
> > >     1 drivers/video/console/dummycon.c         164 .con_font_copy =     dummycon_font_copy,
> > 
> > Above two do nothing, but return 0. Again this wont work I think.
> > 
> > >     2 drivers/video/fbdev/core/fbcon.c        3123 .con_font_copy               = fbcon_copy_font,
> > 
> > Smells again like something that's only used by fb_set, and we could
> > probably delete the other dummy implementations. Also I'm not even
> > really clear on what this does ...
> > 
> > Removing these dummy functions means that for a dummy console these
> > ioctls would start failing, but then I don't think anyone boots up
> > into a dummy console and expects font changes to work. So again I
> > think we could split this cleanup as prep work.
> 
> Sure, for step two, I'll read, confirm and try to remove these dummy
> functions.
> 
> > > ... are these all the callbacks we need to take care of? What about
> > > other console drivers that don't register these callbacks? ...
> > >
> > > ... for example, mdacon.c? What font does mdacon.c use? I know that
> > > /lib/fonts/ exports two functions, find_font() and get_default_font(),
> > > but I don't see them being used in mdacon.c.
> > 
> > I think all other consoles either don't have fonts at all, or only
> > support built-in fonts.
> 
> Ah, I see. I'll search for find_font() and get_default_font() when
> dealing with built-in fonts, then. These files are using them, in
> addition to fbcon.c:
> 
> drivers/firmware/efi/earlycon.c:        font = get_default_font(xres, yres, -1, -1);
> drivers/video/console/sticore.c:                fbfont = get_default_font(1024,768, ~(u32)0, ~(u32)0);
> 
> drivers/media/pci/solo6x10/solo6x10-enc.c:      const struct font_desc *vga = find_font("VGA8x16");
> drivers/media/test-drivers/vimc/vimc-core.c:    const struct font_desc *font = find_font("VGA8x16");
> drivers/media/test-drivers/vivid/vivid-core.c:  const struct font_desc *font = find_font("VGA8x16");
> drivers/usb/misc/sisusbvga/sisusb.c:    myfont = find_font("VGA8x16");
> drivers/video/console/sticore.c:                fbfont = find_font(fbfont_name);
> 
> > > Ah, and speaking of built-in fonts, see fbcon_startup():
> > >
> > >         /* Setup default font */
> > >                 [...]
> > >                 vc->vc_font.charcount = 256; /* FIXME  Need to support more fonts */
> > >                             ^^^^^^^^^^^^^^^
> > >
> > > This is because find_font() and get_default_font() return a `struct
> > > font_desc *`, but `struct font_desc` doesn't contain `charcount`. I
> > > think we also need to add a `charcount` field to `struct font_desc`.
> > 
> > Hm yeah ... I guess maybe struct font_desc should be the starting
> > point for the kernel internal font structure. It's at least there
> > already ...
> 
> I see, that will also make handling built-in fonts much easier!

I think the only downside with starting with font_desc as the internal
font represenation is that there's a few fields we don't need/have for
userspace fonts (like the id/name stuff). So any helpers to e.g. print out
font information need to make sure they don't trip over that

But otherwise I don't see a problem with this, I think.

> > > Currently `struct vc_data` contains a `struct console_font vc_font`, and
> > > I think this is making gradual conversion very hard. As an example, in
> > > fbcon_do_set_font(), we update `vc->vc_font`. We lose all the extra
> > > information we want in `kernel_console_font`, as long as `struct
> > > vc_data` still uses `console_font`...
> > >
> > > However, if we let `struct vc_data` use `kernel_console_font` instead,
> > > we'll have to handle a lot of things in one go:
> > >
> > > $ vgrep --no-less --no-header ".vc_font" | wc -l
> > > 296
> > > $ echo ":("
> > > :(
> > 
> > Yes :-/
> > 
> > This is essentially why the entire vc/fbcon layer is such a mess. It's
> > a chaos, it doesn't really have clear abstraction, and very often the
> > uapi structures (see also conf_font_op) leak deeply into the
> > implementation, which means changing anything is nearly impossible ...
> > 
> > I think for vc_date->vc_font we might need a multi-step approach:
> > - first add a new helper function which sets the font for a vc using
> > an uapi console_font struct (and probably hard-coded assumes cnt ==
> > 256.
> 
> But user fonts may have a charcount different to 256... But yes I'll try
> to figure out how.

Hm yeah, maybe we need a helper to give us the charcount then, which by
default is using the magic negative offset.

Then once we've converted everything over to explicitly passing charcount
around, we can switch that helper. So something like

int kern_font_charcount(struct kern_font *font);

Feel free to bikeshed the struct name however you see fit :-)

> > - roll that out everwhere
> > - change the type of vc_font to what we want (which should only need a
> > change in the helper function, which will also set charcount hopefully
> > correctly, using the hard-coded assumption
> > - have another functions which sets the vf_font using a
> > kernel_console_font for all the cases where it matters
> > - now you can start using it and assume the charcount is set correctly
> > 
> > It's a journey unfortunately.
> 
> But at least it now sounds manageable! :)
> 
> Thank you, I'll look into this (especially the user charcount issue
> mentioned above) after cleaning up the uAPi structs and dummy functions.
> 
> > > The good news is, I've tried cleaning up all the macros in fbcon.c in my
> > > playground, and things seem to work. For example, currently we have:
> > >
> > >         if (userfont)
> > >                 cnt = FNTCHARCNT(data);
> > >         else
> > >                 cnt = 256;
> > >
> > > After introducing `kernel_console_font` (and adding `charcount` to
> > > `struct font_desc` etc.), this should look like:
> > >
> > > #define to_font(_data) container_of(_data, struct kernel_console_font, data)
> > >         [...]
> > >         cnt = to_font(data)->charcount;
> > 
> > Hm I guess we can't unify font_desc and the kernel_console_font we're
> > talking about into one? I think that was brough up already somewhere
> > else in this thread ...
> 
> Sure, let us use `font_desc` from now on.
> 
> > > No more `if` and `else`, and the framebuffer layer will be able to
> > > support new bulit-in fonts that have more than 256 characters. This
> > > seems really nice, so I'd like to spend some time working on it.
> > >
> > > However before I start working on real patches, do you have suggestions
> > > about which console driver I should start with, or how should I split up
> > > the work in general? I couldn't think of how do we clean up subsystems
> > > one by one, while keeping a `console_font` in `struct vc_data`.
> > 
> > I think from a "stop security bugs" trying to clean up fbcon is the
> > important part. That's also the most complex (only one that supports
> > the default and copy functions it seems, and also one of the few that
> > supports get). The other ones I think we should just try to not break.
> > vgacon should still be useable (but I think only on systems where you
> > can boot into legacy bios, not into uefi, at least on x86). I have no
> > idea where some of the other consoles are even used.
> > 
> > For first steps I'd start with demidlayering some of the internal
> > users of uapi structs, like the console_font_op really shouldn't be
> > used anywhere in any function, except in the ioctl handler that
> > converts it into the right function call. You'll probably discover a
> > few other places like this on the go.
> 
> Sure, I'll start from this, then cleaning up these dummy functions, then
> `vc_data`. Thank you for the insights!

Please don't take this rough plan as fixed, it's just where I'd start from
browsing the code and your analysis a bit. We'll probably have to adapt as
we go and more nasty things turn up ...

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11EE2782DF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 10:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFABE6EC54;
	Fri, 25 Sep 2020 08:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CCE56EC54
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 08:38:46 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x14so2594171wrl.12
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 01:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=8bcdSgoAZ73IZy198rnRan6x5PSCC5tXv1r4zPoC4uo=;
 b=CNu5IziHGSAsmKK8nCUKNhXkCUfo9CYqtOAGtgz/t+upSDVlprZtizhSJr4Hd4NWDs
 FLUpnGUHgSV2vQpc9QhRZNe7EKp78O5sOjDU4BDE8eop1xscW0lYdEQB0RmABK5/HF+U
 Vp16JyuGjPPILnnwx1SaEsxE0sNIFsgJYqQN0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=8bcdSgoAZ73IZy198rnRan6x5PSCC5tXv1r4zPoC4uo=;
 b=QuZIgb1403iDHTb850PBmIjXH7d3pQiBw/5+w3wluFIdxvJoWjops/hrpIT6n2LQFm
 T019uzqRSM5/CMtbU5FkYJw++ECyv4a3VYKgj6raQ9b1Fx+VaVWIVC99q1z1V09P8fBi
 PuPMBICBAqx46KPioOJwoUQQ4Q2fD4x6mIsx12/LTmM8d5onSKUFrToIvEMGDhZst06s
 4QpL+kcHHIBwsg8PwLayBPvZIdX4dh7Jd6VAA/9Di6eqP7XLIe2gpGLGcudm/OH0A1zg
 WMaZ8ra61SxyDXsuIHmNdpeIIiw1hgpRO6LbsMZDK13jVhQFBmgGQjsDFaUE0QYGz7z2
 S/bg==
X-Gm-Message-State: AOAM533wKg7wN8RGQT3NSM774CkwiuYdTz2Uq/xrLzJF3jqJ9sglo6/E
 Nxe+po0fkBoixrdxeHrd6mZwPA==
X-Google-Smtp-Source: ABdhPJxjpBiJrrjmGbHLVq9si4d21DejsBC9IYOgST2F24H80iKx7KkiZhOIGDzbXrS0gMn/7HcSdA==
X-Received: by 2002:adf:a3ca:: with SMTP id m10mr3338923wrb.104.1601023125154; 
 Fri, 25 Sep 2020 01:38:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h8sm1967181wrw.68.2020.09.25.01.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 01:38:44 -0700 (PDT)
Date: Fri, 25 Sep 2020 10:38:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Message-ID: <20200925083842.GC438822@phenom.ffwll.local>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jiri Slaby <jirislaby@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <20200924140937.GA749208@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924140937.GA749208@kroah.com>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jiri Slaby <jirislaby@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 24, 2020 at 04:09:37PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Sep 24, 2020 at 09:38:22AM -0400, Peilin Ye wrote:
> > Hi all,
> > 
> > syzbot has reported [1] a global out-of-bounds read issue in
> > fbcon_get_font(). A malicious user may resize `vc_font.height` to a large
> > value in vt_ioctl(), causing fbcon_get_font() to overflow our built-in
> > font data buffers, declared in lib/fonts/font_*.c:
> > 
> > (e.g. lib/fonts/font_8x8.c)
> > #define FONTDATAMAX 2048
> > 
> > static const unsigned char fontdata_8x8[FONTDATAMAX] = {
> > 
> >         /* 0 0x00 '^@' */
> >         0x00, /* 00000000 */
> >         0x00, /* 00000000 */
> >         0x00, /* 00000000 */
> >         0x00, /* 00000000 */
> >         0x00, /* 00000000 */
> >         0x00, /* 00000000 */
> >         0x00, /* 00000000 */
> >         0x00, /* 00000000 */
> >         [...]
> > 
> > In order to perform a reliable range check, fbcon_get_font() needs to know
> > `FONTDATAMAX` for each built-in font under lib/fonts/. Unfortunately, we
> > do not keep that information in our font descriptor,
> > `struct console_font`:
> > 
> > (include/uapi/linux/kd.h)
> > struct console_font {
> > 	unsigned int width, height;	/* font size */
> > 	unsigned int charcount;
> > 	unsigned char *data;	/* font data with height fixed to 32 */
> > };
> > 
> > To make things worse, `struct console_font` is part of the UAPI, so we
> > cannot add a new field to keep track of `FONTDATAMAX`.
> > 
> > Fortunately, the framebuffer layer itself gives us a hint of how to
> > resolve this issue without changing UAPI. When allocating a buffer for a
> > user-provided font, fbcon_set_font() reserves four "extra words" at the
> > beginning of the buffer:
> > 
> > (drivers/video/fbdev/core/fbcon.c)
> > 	new_data = kmalloc(FONT_EXTRA_WORDS * sizeof(int) + size, GFP_USER);
> >         [...]
> > 	new_data += FONT_EXTRA_WORDS * sizeof(int);
> > 	FNTSIZE(new_data) = size;
> > 	FNTCHARCNT(new_data) = charcount;
> > 	REFCOUNT(new_data) = 0;	/* usage counter */
> >         [...]
> > 	FNTSUM(new_data) = csum;
> > 
> > Later, to get the size of a data buffer, the framebuffer layer simply
> > calls FNTSIZE() on it:
> > 
> > (drivers/video/fbdev/core/fbcon.h)
> > 	/* Font */
> > 	#define REFCOUNT(fd)	(((int *)(fd))[-1])
> > 	#define FNTSIZE(fd)	(((int *)(fd))[-2])
> > 	#define FNTCHARCNT(fd)	(((int *)(fd))[-3])
> > 	#define FNTSUM(fd)	(((int *)(fd))[-4])
> > 	#define FONT_EXTRA_WORDS 4
> > 
> > Currently, this is only done for user-provided fonts. Let us do the same
> > thing for built-in fonts, prepend these "extra words" (including
> > `FONTDATAMAX`) to their data buffers, so that other subsystems, like the
> > framebuffer layer, can use these macros on all fonts, no matter built-in
> > or user-provided. As an example, this series fixes the syzbot issue in
> > fbcon_get_font():
> > 
> > (drivers/video/fbdev/core/fbcon.c)
> >  	if (font->width <= 8) {
> >  		j = vc->vc_font.height;
> > +		if (font->charcount * j > FNTSIZE(fontdata))
> > +			return -EINVAL;
> > 	[...]
> > 
> > Similarly, newport_con also use these macros. It only uses three of them:
> > 
> > (drivers/video/console/newport_con.c)
> > 	/* borrowed from fbcon.c */
> > 	#define REFCOUNT(fd)	(((int *)(fd))[-1])
> > 	#define FNTSIZE(fd)	(((int *)(fd))[-2])
> > 	#define FNTCHARCNT(fd)	(((int *)(fd))[-3])
> > 	#define FONT_EXTRA_WORDS 3
> > 
> > To keep things simple, move all these macro definitions to <linux/font.h>,
> > use four words instead of three, and initialize the fourth word in
> > newport_set_font() properly.
> > 
> > Many thanks to Greg Kroah-Hartman <gregkh@linuxfoundation.org>, who
> > reviewed and improved this series!
> > 
> > [1]: KASAN: global-out-of-bounds Read in fbcon_get_font
> >      https://syzkaller.appspot.com/bug?id=08b8be45afea11888776f897895aef9ad1c3ecfd
> > 
> > Peilin Ye (3):
> >   fbdev, newport_con: Move FONT_EXTRA_WORDS macros into linux/font.h
> >   Fonts: Support FONT_EXTRA_WORDS macros for built-in fonts
> >   fbcon: Fix global-out-of-bounds read in fbcon_get_font()
> > 
> >  drivers/video/console/newport_con.c     |  7 +------
> >  drivers/video/fbdev/core/fbcon.c        | 12 ++++++++++++
> >  drivers/video/fbdev/core/fbcon.h        |  7 -------
> >  drivers/video/fbdev/core/fbcon_rotate.c |  1 +
> >  drivers/video/fbdev/core/tileblit.c     |  1 +
> >  include/linux/font.h                    | 13 +++++++++++++
> >  lib/fonts/font_10x18.c                  |  9 ++++-----
> >  lib/fonts/font_6x10.c                   |  9 +++++----
> >  lib/fonts/font_6x11.c                   |  9 ++++-----
> >  lib/fonts/font_7x14.c                   |  9 ++++-----
> >  lib/fonts/font_8x16.c                   |  9 ++++-----
> >  lib/fonts/font_8x8.c                    |  9 ++++-----
> >  lib/fonts/font_acorn_8x8.c              |  9 ++++++---
> >  lib/fonts/font_mini_4x6.c               |  8 ++++----
> >  lib/fonts/font_pearl_8x8.c              |  9 ++++-----
> >  lib/fonts/font_sun12x22.c               |  9 ++++-----
> >  lib/fonts/font_sun8x16.c                |  7 ++++---
> >  lib/fonts/font_ter16x32.c               |  9 ++++-----
> >  18 files changed, 79 insertions(+), 67 deletions(-)
> 
> Gotta love going backwards in arrays :)
> 
> Nice work, whole series is:
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> 
> Daniel, can you take this through your tree?

Applied to drm-misc-fixes, but just missed the pull request train for
-rc7. Should land in Linus' tree next week.

But I did look at the code, and I have regrets. Macros into untyped arrays
and negative indices is very old skool C. It's definitely neater than
before, but also can't deny that we're doing dental surgery on a living
and fire breathing dragon here :-/

I guess I'll just add this to the list of requirements anyone has to
resolve before we're going to resurrect scrollback.

Cheers, Daniel





> 
> thanks,
> 
> greg k-h

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

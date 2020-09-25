Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E70278980
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 15:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFA16EB30;
	Fri, 25 Sep 2020 13:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14A96EB30
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 13:25:55 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id l15so1887559wmh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=yoij1P7j+Xx2RWFa9SVqI2FsfBHkpzDlIUwpiLGvHCs=;
 b=O5Wv1IsSLOcxCzcYzyGteQ12YwvQDDgtGufFm3QgoL3W9ikTTvLPP56IBzaY85PZFs
 p7JxOohdXRnM2KsAxLCSc5felltd/SWWA6JwHieEfFf8z6q8p7bV0yK56vOcTBaEQJZK
 nQZdCFnKQyDz4RX3JYfbOSd9QXr6fN1Z9n6g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=yoij1P7j+Xx2RWFa9SVqI2FsfBHkpzDlIUwpiLGvHCs=;
 b=kG1yRLbdDU6PI4jz7nB3TtfjJNoZr6sFmWWDLrcoSaB3HS0unb83mSHres75aAj8kC
 mCEUUksWOrUVA5uiPIfdpzwBs1rEHpktgWgjwH6BhQyw5NPaEDzLLGcLA4szriatgy86
 ufeqY8Og8CgcflbiHqtNiZI66VLhHLGaPe317xDw+pm+hnf9dJdT2f9LTwtiulZ3R1cq
 qCQsIcctnkFlpEHkS+LqmvSVoyhdRSFlQiA5josm9IaVET79TugzRjhv9lOq0U5drRUk
 CL+Tkkgp0GYjEmByUo0pMZ3k1jwC1mDLS5xvGpFOPKhw/wMroLAHro/jfic6oi13/cHA
 pY1g==
X-Gm-Message-State: AOAM532Uu0JUALCm50GW9ISA6subpogyS61dLNNugOHUOKZeQj7f2tlI
 1Es/0wTTiIpIeEqIW+Lxb/jxow==
X-Google-Smtp-Source: ABdhPJyBZrVOoGGq5hPUstHZ/Y1HyDY0PIguaVz0GuDdkIvNUqMBJyEp1I87FKugY2GqQ8LaJuCahA==
X-Received: by 2002:a7b:c1d3:: with SMTP id a19mr3071230wmj.19.1601040354194; 
 Fri, 25 Sep 2020 06:25:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u2sm3275837wre.7.2020.09.25.06.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 06:25:53 -0700 (PDT)
Date: Fri, 25 Sep 2020 15:25:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Message-ID: <20200925132551.GF438822@phenom.ffwll.local>
Mail-Followup-To: Peilin Ye <yepeilin.cs@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <3f754d60-1d35-899c-4418-147d922e29af@kernel.org>
 <20200925101300.GA890211@PWN>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925101300.GA890211@PWN>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 25, 2020 at 06:13:00AM -0400, Peilin Ye wrote:
> Hi all!
> 
> On Fri, Sep 25, 2020 at 08:46:04AM +0200, Jiri Slaby wrote:
> > > In order to perform a reliable range check, fbcon_get_font() needs to know
> > > `FONTDATAMAX` for each built-in font under lib/fonts/. Unfortunately, we
> > > do not keep that information in our font descriptor,
> > > `struct console_font`:
> > > 
> > > (include/uapi/linux/kd.h)
> > > struct console_font {
> > > 	unsigned int width, height;	/* font size */
> > > 	unsigned int charcount;
> > > 	unsigned char *data;	/* font data with height fixed to 32 */
> > > };
> > > 
> > > To make things worse, `struct console_font` is part of the UAPI, so we
> > > cannot add a new field to keep track of `FONTDATAMAX`.
> > 
> > Hi,
> > 
> > but you still can define struct kernel_console_font containing struct
> > console_font and the 4 more members you need in the kernel. See below.
> > 
> > > Fortunately, the framebuffer layer itself gives us a hint of how to
> > > resolve this issue without changing UAPI. When allocating a buffer for a
> > > user-provided font, fbcon_set_font() reserves four "extra words" at the
> > > beginning of the buffer:
> > > 
> > > (drivers/video/fbdev/core/fbcon.c)
> > > 	new_data = kmalloc(FONT_EXTRA_WORDS * sizeof(int) + size, GFP_USER);
> > 
> > I might be missing something (like coffee in the morning), but why don't
> > you just:
> > 1) declare struct font_data as
> > {
> >   unsigned sum, char_count, size, refcnt;
> >   const unsigned char data[];
> > }
> > 
> > Or maybe "struct console_font font" instead of "const unsigned char
> > data[]", if need be.
> > 
> > 2) allocate by:
> >   kmalloc(struct_size(struct font_data, data, size));
> > 
> > 3) use container_of wherever needed
> > 
> > That is you name the data on negative indexes using struct as you
> > already have to define one.
> > 
> > Then you don't need the ugly macros with negative indexes. And you can
> > pass this structure down e.g. to fbcon_do_set_font, avoiding potential
> > mistakes in accessing data[-1] and similar.
> 
> Sorry that I didn't mention it in the cover letter, but yes, I've tried
> this - a new `kernel_console_font` would be much cleaner than negative
> array indexing.
> 
> The reason I ended up giving it up was, frankly speaking, these macros
> are being used at about 30 places, and I am not familiar enough with the
> framebuffer and newport_con code, so I wasn't confident how to clean
> them up and plug in `kernel_console_font` properly...
> 
> Another reason was that, functions like fbcon_get_font() handle both user
> fonts and built-in fonts, so I wanted a single solution for both of
> them. I think we can't really introduce `kernel_console_font` while
> keeping these macros, that would make the error handling logics etc.
> very messy.
> 
> I'm not very sure what to do now. Should I give it another try cleaning
> up all the macros?
> 
> And thank you for reviewing this!

I think the only way to make this work is that we have one place which
takes in the userspace uapi struct, and then converts it once into a
kernel_console_font. With all the error checking.

Then all internal code deals in terms of kernel_console_font, with
properly typed and named struct members and helper functions and
everything. And we might need a gradual conversion for this, so that first
we can convert over invidual console drivers, then subsystems, until at
the end we've pushed the conversion from uapi array to kernel_console_font
all the way to the ioctl entry points.

But that's indeed a huge pile of work, and fair warning: fbcon is
semi-orphaned, so by doing this you'll pretty much volunteer for
maintainership :-)

But I'd be very happy to help get this done and throw some maintainership
credentials at you in the proces ...

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

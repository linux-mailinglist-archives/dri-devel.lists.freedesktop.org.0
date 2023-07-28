Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06005767755
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 23:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246FC10E155;
	Fri, 28 Jul 2023 21:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3925A10E117
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 21:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=2M7I6GspW66DQLncO4JKL/r3gVWBlh/Z61h7j/4ZXwQ=;
 b=VmorxddsvliAc2zCAOdnHcnfpXk3HL6FA27GlnhkXSDoGE0taO0g/r11MTt0+sI0kBn9KF5g/nrJO
 YBHws5h7tg8z3vU2AXdiQl9zEYuH8U/rlDvV9qOR0LqdOqrOTT8Q280NatZ58QFneNl5qS40d2PF4M
 EUS5sJGrrFwpIycoYicR9+NrqKdO9dYIH7hOkxrBCPEzDbnuW5lyt3OSZ3qejIsC5BlnWolgnIV57W
 oWgE09YqMgvptwaf+e3S6UG3fSVu9ZZWZQL0aj4IVi0oMKAI1oKRsI8Jyw+i3pIMQPCcYbWIvLP5Ea
 2ZNE/tlQONtqNXH1lFqn6N8xJ+w3WZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=2M7I6GspW66DQLncO4JKL/r3gVWBlh/Z61h7j/4ZXwQ=;
 b=dkD1HMHNc3u2lokBeS9EgDAhIVt0/YZ+STE3czXIeWa0urEuoYnPhcLDxQzwHTeu678MjBdhgtiY7
 JMYlTDXDg==
X-HalOne-ID: eaf56fd1-2d89-11ee-8d0f-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id eaf56fd1-2d89-11ee-8d0f-b90637070a9d;
 Fri, 28 Jul 2023 21:01:29 +0000 (UTC)
Date: Fri, 28 Jul 2023 23:01:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 00/47] fbdev: Use I/O helpers
Message-ID: <20230728210127.GA1156027@ravnborg.org>
References: <20230728182234.10680-1-tzimmermann@suse.de>
 <c1a4b7c9-50f2-c43f-277d-c2af9ccc0b50@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1a4b7c9-50f2-c43f-277d-c2af9ccc0b50@gmx.de>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-geode@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Helge,

On Fri, Jul 28, 2023 at 08:46:59PM +0200, Helge Deller wrote:
> On 7/28/23 18:39, Thomas Zimmermann wrote:
> > Most fbdev drivers operate on I/O memory.
> 
> Just nitpicking here:
> What is I/O memory?
> Isn't it either memory, or I/O ?
> I mean, I would never think of the cfb* draw functions under I/O.
> 
> > And most of those use the
> > default implementations for file I/O and console drawing. Convert all
> > these low-hanging fruits to the fb_ops initializer macro and Kconfig
> > token for fbdev I/O helpers.
> 
> I do see the motivation for your patch, but I think the
> macro names are very misleading.
> 
> You have:
> #define __FB_DEFAULT_IO_OPS_RDWR \
>         .fb_read        = fb_io_read, \
>         .fb_write       = fb_io_write
> 
> #define __FB_DEFAULT_IO_OPS_DRAW \
>         .fb_fillrect    = cfb_fillrect, \
>         .fb_copyarea    = cfb_copyarea, \
>         .fb_imageblit   = cfb_imageblit
> 
> #define __FB_DEFAULT_IO_OPS_MMAP \
>         .fb_mmap        = NULL /* default implementation */
> 
> #define FB_DEFAULT_IO_OPS \
>         __FB_DEFAULT_IO_OPS_RDWR, \
>         __FB_DEFAULT_IO_OPS_DRAW, \
>         __FB_DEFAULT_IO_OPS_MMAP
> 
> I think FB_DEFAULT_IO_OPS is OK for read/write/mmap.
> But I would suggest to split out __FB_DEFAULT_IO_OPS_DRAW.
> Something like:
> #define FB_DEFAULT_IO_OPS \
>         __FB_DEFAULT_IO_OPS_RDWR, \
>         __FB_DEFAULT_IO_OPS_MMAP


> #define FB_DEFAULT_CFB_OPS \
>         .fb_fillrect    = cfb_fillrect, \
>         .fb_copyarea    = cfb_copyarea, \
>         .fb_imageblit   = cfb_imageblit

The prefix cfb, I have recently learned, equals color frame buffer.
They are named such for purely historical reasons.

What is important is where the data are copied as we have two
implementations of for example copyarea - one using system memory, the
other using IO memory.

The naming FB_DEFAULT_IO_OPS says this is the defaults to IO memory
operations, which tell what they do and avoid the strange cfb acronym.

Reserve cfb for color frame buffers only - and maybe in the end rename
the three cfbcopyarea, cfbfillrect, cfbimgblt to use the io prefix.
Which is much simpler to do after this series - and nice extra benefit.

I hope this properly explains why I like the current naming and
acked it when the macros were introduced.

	Sam

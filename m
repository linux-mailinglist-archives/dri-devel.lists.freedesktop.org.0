Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2598D2A298E
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 12:31:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757F86E466;
	Mon,  2 Nov 2020 11:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0466B6E466
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 11:31:06 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id n16so3282123ooj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 03:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zAOiszuYUyIyWLQKIJG6bc55M3RXwlsKsxrmhc4uVW8=;
 b=RHq+P4QISBX4bWERbI32Xd6fFCiT1evuu26nesDDnjre/0R7UEXgt1be1gQR9BjPkh
 idJSK5mAMe+xk6rG5/lB1KsEHZ0Oe0XaC7T8lQCBUNGKH1gJL9gAmFOAY93Xa7n2fkfb
 JRWdzEF70nhdCmjgOrlXQYuI7njHj/tX/iWss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zAOiszuYUyIyWLQKIJG6bc55M3RXwlsKsxrmhc4uVW8=;
 b=QduQZWlydI6s6+mCLAxebKRVc72nQE0pKJfFk/MV6yphaHi8jiJAQW6HUrAH3GWaKJ
 MFZ6yd80Vc/KV0apXf77RJPdiQEju/JMHInbYJMIBNCGq8o6/fiue5molxp9w9rXj4Gk
 1aJUSIsp1wYlCpXuJB9sZn2iDyTEjBTQM1QgaqUFaiT6kdmGyv0BthiSajLETDhe6+G7
 09JkfwU+XmZb48R6wBoSnb+79P/tv6LWpdSI33pIO+DayogHzGLu2PCC4quYry9gKwGU
 lIwfHB+uEDE8yeXFlSG6ADachZc0DhxOMEskdW4fA6VDx2NJYzwBJ9y/vxXTsn3oJXK1
 ZdVg==
X-Gm-Message-State: AOAM533oTNVDMVPlFc7hmDs2jZawLm4Hq/mkNuR4+h2JogehbkeFiYSH
 X/NiW1cMjy8AB7cmuMYAfmKoBt2Y7IR6Sm0OXVdFNA==
X-Google-Smtp-Source: ABdhPJymTv/GY1o66DtI8nUb04RogVy4P/jau3IpWYQX9hL2oM8RWoh0Dt8euA0YAJD1frHT9NECvc2I9O/h/4i+Pzk=
X-Received: by 2002:a4a:b503:: with SMTP id r3mr11571270ooo.28.1604316665320; 
 Mon, 02 Nov 2020 03:31:05 -0800 (PST)
MIME-Version: 1.0
References: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604306433.git.yepeilin.cs@gmail.com>
 <72c954371ed9b1d050901b2d498a979017de8a3c.1604306433.git.yepeilin.cs@gmail.com>
 <20201102101044.GM401619@phenom.ffwll.local> <20201102111248.GA1558630@PWN>
In-Reply-To: <20201102111248.GA1558630@PWN>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 2 Nov 2020 12:30:54 +0100
Message-ID: <CAKMK7uGPnNM_96DgtJx0qqocNcro2y_skT21J-CqF9oX8651fA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] tty/vt: Avoid passing struct console_font_op to
 con_font_copy()
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
 USB list <linux-usb@vger.kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 George Kennedy <george.kennedy@oracle.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 2, 2020 at 12:12 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> On Mon, Nov 02, 2020 at 11:10:44AM +0100, Daniel Vetter wrote:
> > I'm not sure switching from int to unsigned just here makes much sense.
> > All the console code is still using int con to index all the various
> > arrays (I just checked fbcon.c code), and using int to index arrays is
> > pretty standard. As long as we have the con < 0 check to catch evil
> > userspace.
> >
> > There's still the switch from op to int for con_font_copy, but I think
> > that's better done as part of the larger cleanup we already discussed. And
> > then maybe also include patch 1 from this series in that rework.
>
> I see. I think at the moment there's not much we can do for
> con_font_get/set/default(). _get() and _default() use *op, and _set()
> uses all except one field of *op. Maybe we can change the type of *op
> from console_font_op to font_desc, after cleaning up everything else?

Yeah, for these one of the arguments should be the new font_desc, so
that we can remove the op stuff properly. Opening up all the arguments
without the font_desc doesn't make sense imo.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

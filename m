Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1F227A0B7
	for <lists+dri-devel@lfdr.de>; Sun, 27 Sep 2020 14:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075FD6E0C5;
	Sun, 27 Sep 2020 12:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A7B06E0C5
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Sep 2020 12:06:48 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 79D8D2389F;
 Sun, 27 Sep 2020 12:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601208408;
 bh=QHcjNHJZuDxl5EUnjYYZQunEgwhM8w3ezdc49mZGgGk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MhENV1HhflQPaxWUfLAnc6xTsItA6RXILvigXqyJWPKkbFAPMCkJVMaX0LMBGtxDv
 VD10aaV577rK1wy6dsfF2VGujJnB9EOtOtdyar0yJntRwOhsLxPrgL/pFy8cydevtl
 lKU4Nn3veJpPIIJWbfngaBgZCLwMidu1oEsDhDbI=
Date: Sun, 27 Sep 2020 14:06:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH] vt_ioctl: make VT_RESIZEX behave like VT_RESIZE
Message-ID: <20200927120658.GA107433@kroah.com>
References: <000000000000226d3f05b02dd607@google.com>
 <bbcef674-4ac6-c933-b55d-8961ada97f4c@i-love.sakura.ne.jp>
 <47907f77-b14b-b433-45c6-a315193f0c1a@i-love.sakura.ne.jp>
 <494395bc-a7dd-fdb1-8196-a236a266ef54@i-love.sakura.ne.jp>
 <20200927092701.GA1037755@PWN>
 <4933b81b-9b1a-355b-df0e-9b31e8280ab9@i-love.sakura.ne.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4933b81b-9b1a-355b-df0e-9b31e8280ab9@i-love.sakura.ne.jp>
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
Cc: syzbot <syzbot+b308f5fd049fbbc6e74f@syzkaller.appspotmail.com>,
 linux-fbdev@vger.kernel.org, George Kennedy <george.kennedy@oracle.com>,
 b.zolnierkie@samsung.com, daniel.vetter@ffwll.ch, deller@gmx.de,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Linus Torvalds <torvalds@linux-foundation.org>, jirislaby@kernel.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 27, 2020 at 08:46:30PM +0900, Tetsuo Handa wrote:
> syzbot is reporting UAF/OOB read at bit_putcs()/soft_cursor() [1][2], for
> vt_resizex() from ioctl(VT_RESIZEX) allows setting font height larger than
> actual font height calculated by con_font_set() from ioctl(PIO_FONT).
> Since fbcon_set_font() from con_font_set() allocates minimal amount of
> memory based on actual font height calculated by con_font_set(),
> use of vt_resizex() can cause UAF/OOB read for font data.
> 
> VT_RESIZEX was introduced in Linux 1.3.3, but it is unclear that what
> comes to the "+ more" part, and I couldn't find a user of VT_RESIZEX.
> 
>   #define VT_RESIZE   0x5609 /* set kernel's idea of screensize */
>   #define VT_RESIZEX  0x560A /* set kernel's idea of screensize + more */
> 
> So far we are not aware of syzbot reports caused by setting non-zero value
> to v_vlin parameter. But given that it is possible that nobody is using
> VT_RESIZEX, we can try removing support for v_clin and v_vlin parameters.

Debian code search doesn't show any users, and that's usually a good
indication of what userspace ioctls for old things like this, are being
used for.

So this makes sense to me, I'll queue it up, thanks!

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

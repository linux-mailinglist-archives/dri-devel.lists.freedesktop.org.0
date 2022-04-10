Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917A94FACFF
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 11:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E9310F2B3;
	Sun, 10 Apr 2022 09:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8F5E610F2B3
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 09:02:17 +0000 (UTC)
Received: from [192.168.0.2] (chello089173232159.chello.sk [89.173.232.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id 7C4207A0310;
 Sun, 10 Apr 2022 11:02:15 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Zheyu Ma <zheyuma97@gmail.com>
Subject: Re: [PATCH 1/7] video: fbdev: i740fb: Error out if 'pixclock' equals
 zero
Date: Sun, 10 Apr 2022 11:02:13 +0200
User-Agent: KMail/1.9.10
References: <20220404084723.79089-1-zheyuma97@gmail.com>
 <eb2edc5a-afad-f0c9-012f-9b9f226d2e5a@gmx.de>
 <CAMhUBjmm6ADp2Fr89CCQNX5FnhmBBrwFE0EQ3sq7CLER0J3ZEg@mail.gmail.com>
In-Reply-To: <CAMhUBjmm6ADp2Fr89CCQNX5FnhmBBrwFE0EQ3sq7CLER0J3ZEg@mail.gmail.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Disposition: inline
X-Length: 3115
X-UID: 8
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <202204101102.13505.linux@zary.sk>
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
Cc: Helge Deller <deller@gmx.de>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Friday 08 April 2022 03:58:10 Zheyu Ma wrote:
> On Fri, Apr 8, 2022 at 3:50 AM Helge Deller <deller@gmx.de> wrote:
> >
> > On 4/4/22 10:47, Zheyu Ma wrote:
> > > The userspace program could pass any values to the driver through
> > > ioctl() interface. If the driver doesn't check the value of 'pixclock',
> > > it may cause divide error.
> > >
> > > Fix this by checking whether 'pixclock' is zero in the function
> > > i740fb_check_var().
> > >
> > > The following log reveals it:
> > >
> > > divide error: 0000 [#1] PREEMPT SMP KASAN PTI
> > > RIP: 0010:i740fb_decode_var drivers/video/fbdev/i740fb.c:444 [inline]
> > > RIP: 0010:i740fb_set_par+0x272f/0x3bb0 drivers/video/fbdev/i740fb.c:739
> > > Call Trace:
> > >     fb_set_var+0x604/0xeb0 drivers/video/fbdev/core/fbmem.c:1036
> > >     do_fb_ioctl+0x234/0x670 drivers/video/fbdev/core/fbmem.c:1112
> > >     fb_ioctl+0xdd/0x130 drivers/video/fbdev/core/fbmem.c:1191
> > >     vfs_ioctl fs/ioctl.c:51 [inline]
> > >     __do_sys_ioctl fs/ioctl.c:874 [inline]
> > >
> > > Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> >
> > Hello Zheyu,
> >
> > I've applied the patches #2-#7 of this series, but left
> > out this specific patch (for now).
> > As discussed on the mailing list we can try to come up with a
> > better fix (to round up the pixclock when it's invalid).
> > If not, I will apply this one later.
> 
> I'm also looking forward to a more appropriate patch for this driver!

I was not able to reproduce it at first but finally found it: the monitor must be unplugged. If a valid EDID is present, fb_validate_mode() call in i740fb_check_var() will refuse zero pixclock.

Haven't found any obvious way to correct zero pixclock value. Most other drivers simply return -EINVAL.

> Thanks,
> Zheyu Ma
> 


-- 
Ondrej Zary

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5614F3D0B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 19:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 273D510EE02;
	Tue,  5 Apr 2022 17:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 487 seconds by postgrey-1.36 at gabe;
 Tue, 05 Apr 2022 17:54:55 UTC
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3D43F10EE02
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 17:54:55 +0000 (UTC)
Received: from [192.168.0.2] (chello089173232159.chello.sk [89.173.232.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id 891F17A04A9;
 Tue,  5 Apr 2022 19:46:46 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Helge Deller <deller@gmx.de>
Subject: Re: [BUG] fbdev: i740fb: Divide error when
 =?utf-8?q?=E2=80=98var-?=>=?utf-8?q?pixclock=E2=80=99_is?= zero
Date: Tue, 5 Apr 2022 19:46:43 +0200
User-Agent: KMail/1.9.10
References: <CAMhUBjmFhqTLBscHHVZ1VTSqrJBT1VEevA+KkjY+y9_ZtdRkMg@mail.gmail.com>
 <CAMuHMdUiEo8q9x0C0x5zOM=ax1=S06=s0JjcJvZYD4aMGLmEaQ@mail.gmail.com>
 <a564f6af-31fa-79a2-72c3-578f2c095b23@gmx.de>
In-Reply-To: <a564f6af-31fa-79a2-72c3-578f2c095b23@gmx.de>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202204051946.43277.linux@zary.sk>
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
 Zheyu Ma <zheyuma97@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On Tuesday 05 April 2022 08:33:57 Helge Deller wrote:
> Hello Geert,
> 
> On 4/4/22 13:46, Geert Uytterhoeven wrote:
> > Hi Helge,
> >
> > On Sun, Apr 3, 2022 at 5:41 PM Helge Deller <deller@gmx.de> wrote:
> >> On 4/3/22 13:26, Zheyu Ma wrote:
> >>> I found a bug in the function i740fb_set_par().
> >>
> >> Nice catch!
> >>
> >>> When the user calls the ioctl system call without setting the value to
> >>> 'var->pixclock', the driver will throw a divide error.
> >>>
> >>> This bug occurs because the driver uses the value of 'var->pixclock'
> >>> without checking it, as the following code snippet show:
> >>>
> >>> if ((1000000 / var->pixclock) > DACSPEED8) {
> >>>      dev_err(info->device, "requested pixclock %i MHz out of range
> >>> (max. %i MHz at 8bpp)\n",
> >>>          1000000 / var->pixclock, DACSPEED8);
> >>>     return -EINVAL;x
> >>> }
> >>>
> >>> We can fix this by checking the value of 'var->pixclock' in the
> >>> function i740fb_check_var() similar to commit
> >>> b36b242d4b8ea178f7fd038965e3cac7f30c3f09, or we should set the lowest
> >>> supported value when this field is zero.
> >>> I have no idea about which solution is better.
> >>
> >> Me neither.
> >> I think a solution like commit b36b242d4b8ea178f7fd038965e3cac7f30c3f09
> >> is sufficient.
> >>
> >> Note that i740fb_set_par() is called in i740fb_resume() as well.
> >> Since this doesn't comes form userspace I think adding a check for
> >> the return value there isn't necessary.
> >>
> >> Would you mind sending a patch like b36b242d4b8ea178f7fd038965e3cac7f30c3f09 ?
> >
> > When passed an invalid value, .check_var() is supposed to
> > round up the invalid to a valid value, if possible.
> 
> I don't disagree.
> The main problem probably is: what is the next valid value?
> This needs to be analyzed on a per-driver base and ideally tested.
> Right now a division-by-zero is tiggered which is probably more worse.

I still have an i740 card so I can test it.

> That said, currently I'd prefer to apply the zero-checks patches over
> any untested patches. It's easy to revert such checks if a better solution
> becomes available.
> 
> Thoughts?
> 
> > Commit b36b242d4b8ea178 ("video: fbdev: asiliantfb: Error out if
> > 'pixclock' equals zero") does not do that.
> 
> Helge
> 


-- 
Ondrej Zary

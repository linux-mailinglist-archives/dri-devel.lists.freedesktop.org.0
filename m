Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE8329E5F0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641696E866;
	Thu, 29 Oct 2020 08:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8D7AF6E3CE;
 Wed, 28 Oct 2020 20:15:38 +0000 (UTC)
Received: from [192.168.0.2] (188-167-68-178.dynamic.chello.sk
 [188.167.68.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id 502DD7A00EE;
 Wed, 28 Oct 2020 21:15:37 +0100 (CET)
From: Ondrej Zary <linux@zary.sk>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] nouveau broken on Riva TNT2 in 5.9.0-rc8: GPU not
 supported on big-endian
Date: Wed, 28 Oct 2020 21:15:32 +0100
User-Agent: KMail/1.9.10
References: <202010092326.20482.linux@zary.sk>
 <CAKb7UvggVn2c=jUNSfjf6r529n89xfNgVBpn3jnXznVh8Gs4+w@mail.gmail.com>
 <CACO55tuAxbcXbC9zrT5rs34s=5uBugkbcikORU5868ka9bHdkw@mail.gmail.com>
In-Reply-To: <CACO55tuAxbcXbC9zrT5rs34s=5uBugkbcikORU5868ka9bHdkw@mail.gmail.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <202010282115.32811.linux@zary.sk>
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday 10 October 2020 02:02:42 Karol Herbst wrote:
> On Sat, Oct 10, 2020 at 12:23 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> >
> > On Fri, Oct 9, 2020 at 5:54 PM Karol Herbst <kherbst@redhat.com> wrote:
> > >
> > > On Fri, Oct 9, 2020 at 11:35 PM Ondrej Zary <linux@zary.sk> wrote:
> > > >
> > > > Hello,
> > > > I'm testing 5.9.0-rc8 and found that Riva TNT2 stopped working:
> > > > [    0.000000] Linux version 5.9.0-rc8+ (zary@gsql) (gcc (Debian 8.3.0-6) 8.3.0, GNU ld (GNU Binutils for Debian) 2.31.1) #326 SMP Fri Oct 9 22:31:40 CEST 2020
> > > > ...
> > > > [   14.771464] nouveau 0000:01:00.0: GPU not supported on big-endian
> > > > [   14.771782] nouveau: probe of 0000:01:00.0 failed with error -38
> > > >
> > > > big-endian? WTF? The machine is x86.
> > > >
> > >
> > > mhh, we reworked the endianess checks a bit and apparently that broke
> > > something... I will give it some thoughts, but could you be so kind
> > > and create an mmiotrace under 5.9 with nouveau? You won't need to
> > > start X or anything while doing it. Just enable the trace and modprobe
> > > nouveau and collect the trace.
> >
> > Looks like nvkm_device_endianness unconditionally reads out 0x4. I
> > don't think that reg is there pre-NV11. At least NV4, NV5, NV10 and
> > maybe NV15 (which is logically pre-NV11) don't support big-endian
> > mode. Not sure about NV1A, which was the IGP of the series and IIRC
> > logically pre-NV11 as well (but clearly could only be used with x86
> > chips, since it was part of the motherboard).
> >
> > Aha, it's documented in rnndb:
> >
> > https://github.com/envytools/envytools/blob/master/rnndb/bus/pmc.xml
> > <reg32 offset="0x004" name="ENDIAN" variants="NV1A-"/>
> >
> 
> ohh, I should have checked there.. yeah, will write a fix for it then.
> Before my patch we just always tried to switch it, but never threw an
> error.

Any progress with the patch?

-- 
Ondrej Zary
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

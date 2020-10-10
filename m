Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9938B289FD5
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 12:03:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB2B6EEA9;
	Sat, 10 Oct 2020 10:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id B06976E14B;
 Sat, 10 Oct 2020 08:49:42 +0000 (UTC)
Received: from [192.168.0.2] (188-167-68-178.dynamic.chello.sk
 [188.167.68.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id DB18A7A02C5;
 Sat, 10 Oct 2020 10:49:39 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] nouveau broken on Riva TNT2 in 5.9.0-rc8: GPU not
 supported on big-endian
Date: Sat, 10 Oct 2020 10:49:37 +0200
User-Agent: KMail/1.9.10
References: <202010092326.20482.linux@zary.sk>
 <CACO55tuj_=PUYuBnJLZgCEize_8Po0VnuDVPtkHLEZxL3RgF7Q@mail.gmail.com>
 <CAKb7UvggVn2c=jUNSfjf6r529n89xfNgVBpn3jnXznVh8Gs4+w@mail.gmail.com>
In-Reply-To: <CAKb7UvggVn2c=jUNSfjf6r529n89xfNgVBpn3jnXznVh8Gs4+w@mail.gmail.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <202010101049.37663.linux@zary.sk>
X-Mailman-Approved-At: Sat, 10 Oct 2020 10:02:57 +0000
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
 Karol Herbst <kherbst@redhat.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Saturday 10 October 2020 00:23:38 Ilia Mirkin wrote:
> On Fri, Oct 9, 2020 at 5:54 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Fri, Oct 9, 2020 at 11:35 PM Ondrej Zary <linux@zary.sk> wrote:
> > >
> > > Hello,
> > > I'm testing 5.9.0-rc8 and found that Riva TNT2 stopped working:
> > > [    0.000000] Linux version 5.9.0-rc8+ (zary@gsql) (gcc (Debian 8.3.0-6) 8.3.0, GNU ld (GNU Binutils for Debian) 2.31.1) #326 SMP Fri Oct 9 22:31:40 CEST 2020
> > > ...
> > > [   14.771464] nouveau 0000:01:00.0: GPU not supported on big-endian
> > > [   14.771782] nouveau: probe of 0000:01:00.0 failed with error -38
> > >
> > > big-endian? WTF? The machine is x86.
> > >
> >
> > mhh, we reworked the endianess checks a bit and apparently that broke
> > something... I will give it some thoughts, but could you be so kind
> > and create an mmiotrace under 5.9 with nouveau? You won't need to
> > start X or anything while doing it. Just enable the trace and modprobe
> > nouveau and collect the trace.
> 
> Looks like nvkm_device_endianness unconditionally reads out 0x4. I
> don't think that reg is there pre-NV11. At least NV4, NV5, NV10 and
> maybe NV15 (which is logically pre-NV11) don't support big-endian
> mode. Not sure about NV1A, which was the IGP of the series and IIRC
> logically pre-NV11 as well (but clearly could only be used with x86
> chips, since it was part of the motherboard).

Yes, you're right. Forcing nvkm_device_endianness to return true allows
5.9.0-rc8 to work:
[    0.000000] Linux version 5.9.0-rc8+ (zary@gsql) (gcc (Debian 8.3.0-6) 8.3.0, GNU ld (GNU Binutils for Debian) 2.31.1) #326 SMP Fri Oct 9 22:31:40 CEST 2020
...
[   12.311258] nouveau 0000:01:00.0: bios: DCB table not found
[   12.311583] nouveau 0000:01:00.0: bios: DCB table not found
[   12.311834] nouveau 0000:01:00.0: bios: DCB table not found
[   12.311847] nouveau 0000:01:00.0: bios: DCB table not found
[   12.311989] agpgart-intel 0000:00:00.0: AGP 3.0 bridge
[   12.312017] agpgart-intel 0000:00:00.0: bridge is in legacy mode, falling back to 2.x
[   12.312031] agpgart-intel 0000:00:00.0: putting AGP V2 device into 4x mode
[   12.312066] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
[   12.312162] agpgart-intel 0000:00:00.0: AGP 3.0 bridge
[   12.312182] agpgart-intel 0000:00:00.0: bridge is in legacy mode, falling back to 2.x
[   12.312195] agpgart-intel 0000:00:00.0: putting AGP V2 device into 4x mode
[   12.312230] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
[   12.312247] nouveau 0000:01:00.0: tmr: unknown input clock freq
[   12.318341] nouveau 0000:01:00.0: fb: 32 MiB SDRAM
[   12.333376] [TTM] Zone  kernel: Available graphics memory: 385048 KiB
[   12.333392] [TTM] Initializing pool allocator
[   12.333434] nouveau 0000:01:00.0: DRM: VRAM: 31 MiB
[   12.333443] nouveau 0000:01:00.0: DRM: GART: 128 MiB
[   12.333453] nouveau 0000:01:00.0: DRM: BMP version 5.6
[   12.333460] nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
[   12.335355] nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer copies
[   12.335443] nouveau 0000:01:00.0: bios: DCB table not found
[   12.336033] nouveau 0000:01:00.0: DRM: Saving VGA fonts
[   12.376420] nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
[   12.410397] nouveau 0000:01:00.0: DRM: allocated 1280x1024 fb: 0x4000, bo b68d2ac4
[   12.441217] fbcon: nouveaudrmfb (fb0) is primary device
[   12.591964] Console: switching to colour frame buffer device 160x64
[   12.593876] nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer device
[   12.594944] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0

BTW. 5.8 kernel (that appeared today in Debian packports) is broken the same way.

> Aha, it's documented in rnndb:
> 
> https://github.com/envytools/envytools/blob/master/rnndb/bus/pmc.xml
> <reg32 offset="0x004" name="ENDIAN" variants="NV1A-"/>
> 
>   -ilia
> 


-- 
Ondrej Zary
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

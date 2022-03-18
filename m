Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8281F4DD51C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 08:12:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D612510EA0B;
	Fri, 18 Mar 2022 07:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:8234::])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB1D10EA0B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 07:12:31 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149]
 helo=[192.168.66.200]); authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1nV6mk-0000IO-93; Fri, 18 Mar 2022 08:12:30 +0100
Message-ID: <08e3a9b1-5ed3-be89-1d48-5d1061253789@leemhuis.info>
Date: Fri, 18 Mar 2022 08:12:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Zack Rusin <zackr@vmware.com>
Subject: Bug 215678 - vmwgfx: probe of 0000:00:0f.0 failed with error -16
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1647587551;
 3fcf8a01; 
X-HE-SMSGID: 1nV6mk-0000IO-93
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
Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, this is your Linux kernel regression tracker.

I noticed a regression report in bugzilla.kernel.org that afaics nobody
acted upon since it was reported about a week ago, that's why I decided
to forward it to the lists and a few relevant people to the CC. To quote
from https://bugzilla.kernel.org/show_bug.cgi?id=215678 :

> With latest kernel, i notice this:
> 
> dmesg | grep vmwgfx
> [    2.959200] vmwgfx 0000:00:0f.0: vgaarb: deactivate vga console
> [    2.959764] vmwgfx 0000:00:0f.0: BAR 1: can't reserve [mem 0xf0000000-0xf7ffffff pref]
> [    2.959766] vmwgfx: probe of 0000:00:0f.0 failed with error -16
> 
> 
> lspci -s 0000:00:0f.0 -nnvv
> 00:0f.0 VGA compatible controller [0300]: VMware SVGA II Adapter [15ad:0405] (prog-if 00 [VGA controller])
>         Subsystem: VMware SVGA II Adapter [15ad:0405]
>         Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Interrupt: pin A routed to IRQ 16
>         Region 0: I/O ports at 2140 [size=16]
>         Region 1: Memory at f0000000 (32-bit, prefetchable) [size=128M]
>         Region 2: Memory at fb800000 (32-bit, non-prefetchable) [size=8M]
>         Expansion ROM at 000c0000 [disabled] [size=128K]
>         Capabilities: [40] Vendor Specific Information: Len=00 <?>
>         Capabilities: [44] PCI Advanced Features
>                 AFCap: TP+ FLR+
>                 AFCtrl: FLR-
>                 AFStatus: TP-
>         Kernel modules: vmwgfx
> 
> Driver version:
> #define VMWGFX_DRIVER_DATE "20211206"
> 
> Host: Windows 11 & VMware Workstation 16 Pro 16.2.0 build-18760230
> Guest: Debian 11

Could somebody take a look into this? Or was this discussed somewhere
else already? Or even fixed?

Anyway, to get this tracked:

#regzbot introduced: v5.16..v5.17-rc7
#regzbot from: sander44 <ionut_n2001@yahoo.com>
#regzbot title: "vmwgfx: probe of 0000:00:0f.0 failed with error -16" in
guest
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215678

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

-- 
Additional information about regzbot:

If you want to know more about regzbot, check out its web-interface, the
getting start guide, and the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

The last two documents will explain how you can interact with regzbot
yourself if your want to.

Hint for reporters: when reporting a regression it's in your interest to
CC the regression list and tell regzbot about the issue, as that ensures
the regression makes it onto the radar of the Linux kernel's regression
tracker -- that's in your interest, as it ensures your report won't fall
through the cracks unnoticed.

Hint for developers: you normally don't need to care about regzbot once
it's involved. Fix the issue as you normally would, just remember to
include 'Link:' tag in the patch descriptions pointing to all reports
about the issue. This has been expected from developers even before
regzbot showed up for reasons explained in
'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst'.

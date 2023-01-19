Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D36E5673C17
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 15:34:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE5110E964;
	Thu, 19 Jan 2023 14:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8491410E95F;
 Thu, 19 Jan 2023 14:33:54 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1pIVzD-0002Km-CV; Thu, 19 Jan 2023 15:33:51 +0100
Message-ID: <fcec3c78-b5d9-eb48-0fc0-d1f27de87f23@leemhuis.info>
Date: Thu, 19 Jan 2023 15:33:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: linux-6.2-rc4+ hangs on poweroff/reboot: Bisected
Content-Language: en-US, de-DE
To: bskeggs@redhat.com, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
References: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
From: "Linux kernel regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <b64705e3-2e63-a466-f829-f9568b06766a@googlemail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1674138834;
 c1a870af; 
X-HE-SMSGID: 1pIVzD-0002Km-CV
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: ML nouveau <nouveau@lists.freedesktop.org>,
 Chris Clayton <chris2553@googlemail.com>, LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[adding various lists and the two other nouveau maintainers to the list
of recipients]

For the rest of this mail:

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 18.01.23 21:59, Chris Clayton wrote:
> Hi.
> 
> I build and installed the lastest development kernel earlier this week. I've found that when I try the laptop down (or
> reboot it), it hangs right at the end of closing the current session. The last line I see on  the screen when rebooting is:
> 
> 	sd 4:0:0:0: [sda] Synchronising SCSI cache
> 
> when closing down I see one additional line:
> 
> 	sd 4:0:0:0 [sda]Stopping disk
> 
> In both cases the machine then hangs and I have to hold down the power button fot a few seconds to switch it off.
> 
> Linux 6.1 is OK but 6.2-rc1 hangs, so I bisected between this two and landed on:
> 
> 	# first bad commit: [0e44c21708761977dcbea9b846b51a6fb684907a] drm/nouveau/flcn: new code to load+boot simple HS FWs
> (VPR scrubber)
> 
> I built and installed a kernel with f15cde64b66161bfa74fb58f4e5697d8265b802e (the parent of the bad commit) checked out
> and that shuts down and reboots fine. It the did the same with the bad commit checked out and that does indeed hang, so
> I'm confident the bisect outcome is OK.
> 
> Kernels 6.1.6 and 5.15.88 are also OK.
> 
> My system had dual GPUs - one intel and one NVidia. Related extracts from 'lscpi -v' is:
> 
> 00:02.0 VGA compatible controller: Intel Corporation CometLake-H GT2 [UHD Graphics] (rev 05) (prog-if 00 [VGA controller])
>         Subsystem: CLEVO/KAPOK Computer CometLake-H GT2 [UHD Graphics]
> 
>         Flags: bus master, fast devsel, latency 0, IRQ 142
> 
>         Memory at c2000000 (64-bit, non-prefetchable) [size=16M]
> 
>         Memory at a0000000 (64-bit, prefetchable) [size=256M]
> 
>         I/O ports at 5000 [size=64]
> 
>         Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
> 
>         Capabilities: [40] Vendor Specific Information: Len=0c <?>
> 
>         Capabilities: [70] Express Root Complex Integrated Endpoint, MSI 00
> 
>         Capabilities: [ac] MSI: Enable+ Count=1/1 Maskable- 64bit-
> 
>         Capabilities: [d0] Power Management version 2
> 
>         Kernel driver in use: i915
> 
>         Kernel modules: i915
> 
> 
> 01:00.0 VGA compatible controller: NVIDIA Corporation TU117M [GeForce GTX 1650 Ti Mobile] (rev a1) (prog-if 00 [VGA
> controller])
>         Subsystem: CLEVO/KAPOK Computer TU117M [GeForce GTX 1650 Ti Mobile]
>         Flags: bus master, fast devsel, latency 0, IRQ 141
>         Memory at c4000000 (32-bit, non-prefetchable) [size=16M]
>         Memory at b0000000 (64-bit, prefetchable) [size=256M]
>         Memory at c0000000 (64-bit, prefetchable) [size=32M]
>         I/O ports at 4000 [size=128]
>         Expansion ROM at c3000000 [disabled] [size=512K]
>         Capabilities: [60] Power Management version 3
>         Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
>         Capabilities: [78] Express Legacy Endpoint, MSI 00
>         Kernel driver in use: nouveau
>         Kernel modules: nouveau
> 
> DRI_PRIME=1 is exported in one of my init scripts (yes, I am still using sysvinit).
> 
> I've attached the bisect.log, but please let me know if I can provide any other diagnostics. Please cc me as I'm not
> subscribed.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced e44c2170876197
#regzbot title drm: nouveau: hangs on poweroff/reboot
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

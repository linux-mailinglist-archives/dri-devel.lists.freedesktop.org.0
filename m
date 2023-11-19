Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C353D7F048F
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 07:33:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B134310E06D;
	Sun, 19 Nov 2023 06:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3595810E06D;
 Sun, 19 Nov 2023 06:32:57 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1r4bMV-0000Gj-3u; Sun, 19 Nov 2023 07:32:55 +0100
Message-ID: <559d0fa5-953a-4a97-b03b-5eb1287c83d8@leemhuis.info>
Date: Sun, 19 Nov 2023 07:32:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Radeon regression in 6.6 kernel
Content-Language: en-US, de-DE
To: Phillip Susi <phill@thesusis.net>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <87edgv4x3i.fsf@vps.thesusis.net>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <87edgv4x3i.fsf@vps.thesusis.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1700375577;
 88fa1715; 
X-HE-SMSGID: 1r4bMV-0000Gj-3u
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Lo!

On 12.11.23 01:46, Phillip Susi wrote:
> I had been testing some things on a post 6.6-rc5 kernel for a week or
> two and then when I pulled to a post 6.6 release kernel, I found that
> system suspend was broken.  It seems that the radeon driver failed to
> suspend, leaving the display dead, the wayland display server hung, and
> the system still running.  I have been trying to bisect it for the last
> few days and have only been able to narrow it down to the following 3
> commits:
> 
> There are only 'skip'ped commits left to test.
> The first bad commit could be any of:
> 56e449603f0ac580700621a356d35d5716a62ce5
> c07bf1636f0005f9eb7956404490672286ea59d3
> b70438004a14f4d0f9890b3297cd66248728546c
> We cannot bisect more!

Hmm, not a single reply from the amdgpu folks. Wondering how we can
encourage them to look into this.

Phillip, reporting issues by mail should still work, but you might have
more luck here, as that's where the amdgpu afaics prefer to track bugs:
https://gitlab.freedesktop.org/drm/amd/-/issues

When you file an issue there, please mention it here.

Furthermore it might help if you could verify if 6.7-rc1 (or rc2, which
comes out later today) or 6.6.2-rc1 improve things.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke


> It appears that there was a late merge in the 6.6 window that originally
> forked from the -rc2, as many of the later commits that I bisected had
> that version number.
> 
> I couldn't get it more narrowed down because I had to skip the
> surrounding commits because they wouldn't even boot up to a gui desktop,
> let alone try to suspend.
> 
> When system suspend fails, I find the following in my syslog after I
> have to magic-sysrq reboot because the the display is dead:
> 
> Nov 11 18:44:39 faldara kernel: PM: suspend entry (deep)
> Nov 11 18:44:39 faldara kernel: Filesystems sync: 0.035 seconds
> Nov 11 18:44:40 faldara kernel: Freezing user space processes
> Nov 11 18:44:40 faldara kernel: Freezing user space processes completed (elapsed 0.001 seconds)
> Nov 11 18:44:40 faldara kernel: OOM killer disabled.
> Nov 11 18:44:40 faldara kernel: Freezing remaining freezable tasks
> Nov 11 18:44:40 faldara kernel: Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> Nov 11 18:44:40 faldara kernel: printk: Suspending console(s) (use no_console_suspend to debug)
> Nov 11 18:44:40 faldara kernel: serial 00:01: disabled
> Nov 11 18:44:40 faldara kernel: e1000e: EEE TX LPI TIMER: 00000011
> Nov 11 18:44:40 faldara kernel: sd 4:0:0:0: [sdb] Synchronizing SCSI cache
> Nov 11 18:44:40 faldara kernel: sd 1:0:0:0: [sda] Synchronizing SCSI cache
> Nov 11 18:44:40 faldara kernel: sd 5:0:0:0: [sdc] Synchronizing SCSI cache
> Nov 11 18:44:40 faldara kernel: sd 4:0:0:0: [sdb] Stopping disk
> Nov 11 18:44:40 faldara kernel: sd 1:0:0:0: [sda] Stopping disk
> Nov 11 18:44:40 faldara kernel: sd 5:0:0:0: [sdc] Stopping disk
> Nov 11 18:44:40 faldara kernel: amdgpu: Move buffer fallback to memcpy unavailable
> Nov 11 18:44:40 faldara kernel: [TTM] Buffer eviction failed
> Nov 11 18:44:40 faldara kernel: [drm] evicting device resources failed
> Nov 11 18:44:40 faldara kernel: amdgpu 0000:03:00.0: PM: pci_pm_suspend(): amdgpu_pmops_suspend+0x0/0x80 [amdgpu] returns -19
> Nov 11 18:44:40 faldara kernel: amdgpu 0000:03:00.0: PM: dpm_run_callback(): pci_pm_suspend+0x0/0x170 returns -19
> Nov 11 18:44:40 faldara kernel: amdgpu 0000:03:00.0: PM: failed to suspend async: error -19
> Nov 11 18:44:40 faldara kernel: PM: Some devices failed to suspend, or early wake event detected
> Nov 11 18:44:40 faldara kernel: xhci_hcd 0000:06:00.0: xHC error in resume, USBSTS 0x401, Reinit
> Nov 11 18:44:40 faldara kernel: usb usb3: root hub lost power or was reset
> Nov 11 18:44:40 faldara kernel: usb usb4: root hub lost power or was reset
> Nov 11 18:44:40 faldara kernel: serial 00:01: activated
> Nov 11 18:44:40 faldara kernel: nvme nvme0: 4/0/0 default/read/poll queues
> Nov 11 18:44:40 faldara kernel: ata8: SATA link down (SStatus 0 SControl 300)
> Nov 11 18:44:40 faldara kernel: ata7: SATA link down (SStatus 0 SControl 300)
> Nov 11 18:44:40 faldara kernel: ata4: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
> Nov 11 18:44:40 faldara kernel: ata1: SATA link down (SStatus 4 SControl 300)
> Nov 11 18:44:40 faldara kernel: ata3: SATA link down (SStatus 4 SControl 300)
> Nov 11 18:44:40 faldara kernel: ata4.00: configured for UDMA/133
> Nov 11 18:44:40 faldara kernel: OOM killer enabled.
> Nov 11 18:44:40 faldara kernel: Restarting tasks ... done.
> Nov 11 18:44:40 faldara kernel: random: crng reseeded on system resumption
> Nov 11 18:44:40 faldara kernel: PM: suspend exit
> Nov 11 18:44:40 faldara kernel: PM: suspend entry (s2idle)
> Nov 11 18:44:40 faldara systemd-networkd[384]: enp0s31f6: Gained IPv6LL
> Nov 11 18:44:40 faldara avahi-daemon[668]: Joining mDNS multicast group on interface enp0s31f6.IPv6 with address fe80::3ad5:47ff:fe0f:488a.
> 
> My video card is this:
> 
> 03:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Navi 23 (rev c7) (prog-if 00 [VGA controller])
>         Subsystem: Gigabyte Technology Co., Ltd Navi 23
>         Flags: bus master, fast devsel, latency 0, IRQ 139
>         Memory at e0000000 (64-bit, prefetchable) [size=256M]
>         Memory at f0000000 (64-bit, prefetchable) [size=2M]
>         I/O ports at e000 [size=256]
>         Memory at f7900000 (32-bit, non-prefetchable) [size=1M]
>         Expansion ROM at 000c0000 [disabled] [size=128K]
>         Capabilities: [48] Vendor Specific Information: Len=08 <?>
>         Capabilities: [50] Power Management version 3
>         Capabilities: [64] Express Legacy Endpoint, MSI 00
>         Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>         Capabilities: [100] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
>         Capabilities: [150] Advanced Error Reporting
>         Capabilities: [200] Physical Resizable BAR
>         Capabilities: [240] Power Budgeting <?>
>         Capabilities: [270] Secondary PCI Express
>         Capabilities: [2a0] Access Control Services
>         Capabilities: [2d0] Process Address Space ID (PASID)
>         Capabilities: [320] Latency Tolerance Reporting
>         Capabilities: [410] Physical Layer 16.0 GT/s <?>
>         Capabilities: [440] Lane Margining at the Receiver <?>
>         Kernel driver in use: amdgpu
>         Kernel modules: amdgpu

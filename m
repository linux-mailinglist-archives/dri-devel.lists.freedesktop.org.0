Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5874B8D74D5
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2024 13:08:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F31810E00C;
	Sun,  2 Jun 2024 11:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tfwno.gf header.i=@tfwno.gf header.b="bIPdDW3b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 497 seconds by postgrey-1.36 at gabe;
 Sat, 01 Jun 2024 16:55:05 UTC
Received: from mail.cock.li (mail.cock.li [37.120.193.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C16810E02D
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2024 16:55:03 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tfwno.gf; s=mail;
 t=1717260402; bh=AEiJ/PE5TwSufJEK5F85v80HSKDppTz/DFHiZ3AgN5o=;
 h=Date:From:To:Subject:From;
 b=bIPdDW3bZsPJd1Dv0/al8CnBmuj8dypW2dLu+e2B9J3iuVrZz67m32JUuv2O1CotN
 lw7O83K4MpEpvnaGta9BhMndulEvw9Eha7GRq/eA5bXxhHOtA7YGoHLHcj73j0lJzp
 vVnqdgBH0kYLd5JYggyb+vgv7ikcZz4Cg+jxPPKtQZrVazYFZCSUGSIkajcpeCd7eC
 qEwdhc6vCbA0Ia9pJC3yqaya69RRVVjbTALEfOiD8E4J5o9lqsjNSqxWPUPMuHqEXg
 jklEY/hOu+pl/rWnRnfRlGYyBE+mr5zRHewptSNniwUG4a2rdMVLXJ6rqMQAXLqpl1
 A9srzIEEKbqQg==
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 01 Jun 2024 16:46:41 +0000
From: ns@tfwno.gf
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Consistent race condition(?) in component binding
User-Agent: Roundcube Webmail/1.4.15
Message-ID: <95a2ab28b54ed84c7a2281859af9398a@tfwno.gf>
X-Sender: ns@tfwno.gf
X-Mailman-Approved-At: Sun, 02 Jun 2024 11:08:14 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello!

Kernel version: 6.10.0-rc1-gcc8ed4d0a848, but reproduces on every
kernel I've used on this system ever (almost certainly exists before
6.0).

Modules that use the driver core component APIs on my system (ThinkPad
T480) have, for as long as I can remember, bound to the wrong function.

Here are two examples (from the same boot, yes):
<6>[    2.886021] typec port1: bound usb3-port2 (ops 
usb_acpi_find_companion [usbcore])
<6>[    2.886037] typec port1: bound usb4-port2 (ops 
usb_acpi_find_companion [usbcore])
<6>[   13.213059] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops 
iterate_bxt_mmio [i915])
<6>[   13.405286] mei_hdcp 
0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 
(ops iterate_bxt_mmio [i915])

This is a fairly consistent bug that only seems to occur on my main
install, probably as a result of the bizzare timings between module
loading, udev, & such with my init system of choice (s6-linux-init);
this bit is just speculation, but I mention this because I booted the
same kernel with a Buildroot generated rootfs with systemd (ran as
initramfs for convenience's sake), & all the modules bound to the
correct function. I have no idea what's different there.

I can reproduce this across both GCC & LLVM toolchains (GCC 13, GCC 14,
& LLVM 18.1.6). The specific functions they bind to changes across TCs,
but they're both wrong. As an example, the drivers binding to
iterate_bxt_mmio above (LLVM-built kernel) bind to
__SCT__tp_func_intel_frontbuffer_flush on GCC builds.

I attempted to get better logs here by using KCSAN, but KCSAN actually
masked the bug (i.e. the bug stopped occuring with it enabled). It used
default settings:
$ grep KCSAN .config
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
CONFIG_KCSAN=y
CONFIG_KCSAN_VERBOSE=y
CONFIG_KCSAN_SELFTEST=y
CONFIG_KCSAN_EARLY_ENABLE=y
CONFIG_KCSAN_NUM_WATCHPOINTS=64
CONFIG_KCSAN_UDELAY_TASK=80
CONFIG_KCSAN_UDELAY_INTERRUPT=20
CONFIG_KCSAN_DELAY_RANDOMIZE=y
CONFIG_KCSAN_SKIP_WATCH=4000
CONFIG_KCSAN_SKIP_WATCH_RANDOMIZE=y
# CONFIG_KCSAN_INTERRUPT_WATCHER is not set
CONFIG_KCSAN_REPORT_ONCE_IN_MS=3000
CONFIG_KCSAN_REPORT_RACE_UNKNOWN_ORIGIN=y
# CONFIG_KCSAN_STRICT is not set
CONFIG_KCSAN_REPORT_VALUE_CHANGE_ONLY=y
CONFIG_KCSAN_ASSUME_PLAIN_WRITES_ATOMIC=y
# CONFIG_KCSAN_IGNORE_ATOMICS is not set
# CONFIG_KCSAN_PERMISSIVE is not set

I am open to trying patches to both mainline & stable.

Below is a dmesg from a KCSAN-enabled kernel.

Regards,
ns

<5>[    0.000000] Linux version 6.10.0-rc1-kcsan-gcc8ed4d0a848 
(torvalds@linux-foundation.org) (gcc (Gentoo Hardened 14.1.1_p20240518 
p1) 14.1.1 20240516, GNU ld (Gentoo 2.40 p5) 2.40.0) #1 SMP 
PREEMPT_DYNAMIC Fri May 31 23:26:48 UTC 2024
<6>[    0.000000] Command line: root=UUID=XXX rd.luks.uuid=XXX 
rd.luks.crypttab=0 rw init=/etc/s6-linux-init/current/bin/init quiet 
usbcore.authorized_default=1 threadirqs
<6>[    0.000000] KERNEL supported cpus:
<6>[    0.000000]   Intel GenuineIntel
<6>[    0.000000]   AMD AuthenticAMD
<6>[    0.000000]   Hygon HygonGenuine
<6>[    0.000000]   zhaoxin   Shanghai
<6>[    0.000000] BIOS-provided physical RAM map:
<6>[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x0000000000057fff] 
usable
<6>[    0.000000] BIOS-e820: [mem 0x0000000000058000-0x0000000000058fff] 
reserved
<6>[    0.000000] BIOS-e820: [mem 0x0000000000059000-0x000000000009cfff] 
usable
<6>[    0.000000] BIOS-e820: [mem 0x000000000009d000-0x00000000000fffff] 
reserved
<6>[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000003fffffff] 
usable
<6>[    0.000000] BIOS-e820: [mem 0x0000000040000000-0x00000000403fffff] 
reserved
<6>[    0.000000] BIOS-e820: [mem 0x0000000040400000-0x000000006c9d1fff] 
usable
<6>[    0.000000] BIOS-e820: [mem 0x000000006c9d2000-0x000000006c9d2fff] 
ACPI NVS
<6>[    0.000000] BIOS-e820: [mem 0x000000006c9d3000-0x000000006c9d3fff] 
reserved
<6>[    0.000000] BIOS-e820: [mem 0x000000006c9d4000-0x000000007a404fff] 
usable
<6>[    0.000000] BIOS-e820: [mem 0x000000007a405000-0x000000007b52cfff] 
reserved
<6>[    0.000000] BIOS-e820: [mem 0x000000007b52d000-0x000000007b599fff] 
ACPI NVS
<6>[    0.000000] BIOS-e820: [mem 0x000000007b59a000-0x000000007b5fefff] 
ACPI data
<6>[    0.000000] BIOS-e820: [mem 0x000000007b5ff000-0x000000007b5fffff] 
usable
<6>[    0.000000] BIOS-e820: [mem 0x000000007b600000-0x000000007f7fffff] 
reserved
<6>[    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] 
reserved
<6>[    0.000000] BIOS-e820: [mem 0x00000000fe010000-0x00000000fe010fff] 
reserved
<6>[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000047f7fffff] 
usable
<6>[    0.000000] NX (Execute Disable) protection: active
<6>[    0.000000] APIC: Static calls initialized
<6>[    0.000000] efi: EFI v2.5 by Lenovo
<6>[    0.000000] efi: TPMFinalLog=0x7b592000 SMBIOS=0x7a690000 SMBIOS 
3.0=0x7a68d000 ACPI=0x7b5fe000 ACPI 2.0=0x7b5fe014 ESRT=0x7a51a000 
MEMATTR=0x74d59298 INITRD=0x6cb38f18 RNG=0x7b5a2018 
TPMEventLog=0x6cb36018
<5>[    0.000000] random: crng init done
<6>[    0.000000] efi: Remove mem47: MMIO range=[0xf8000000-0xfbffffff] 
(64MB) from e820 map
<7>[    0.000000] e820: remove [mem 0xf8000000-0xfbffffff] reserved
<6>[    0.000000] efi: Not removing mem48: MMIO 
range=[0xfe010000-0xfe010fff] (4KB) from e820 map
<6>[    0.000000] SMBIOS 3.0.0 present.
<6>[    0.000000] DMI: LENOVO 20L5CTO1WW/20L5CTO1WW, BIOS N24ET61W (1.36 
) 10/13/2020
<6>[    0.000000] DMI: Memory slots populated: 2/2
<6>[    0.000000] tsc: Detected 2000.000 MHz processor
<6>[    0.000000] tsc: Detected 1999.968 MHz TSC
<7>[    0.001040] e820: update [mem 0x00000000-0x00000fff] usable ==> 
reserved
<7>[    0.001068] e820: remove [mem 0x000a0000-0x000fffff] usable
<6>[    0.001113] last_pfn = 0x47f800 max_arch_pfn = 0x400000000
<6>[    0.001133] MTRR map: 4 entries (3 fixed + 1 variable; max 23), 
built from 10 variable MTRRs
<6>[    0.001146] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  
UC- WT
<6>[    0.003205] last_pfn = 0x7b600 max_arch_pfn = 0x400000000
<6>[    0.025582] esrt: Reserving ESRT space from 0x000000007a51a000 to 
0x000000007a51a100.
<6>[    0.025629] Using GB pages for direct mapping
<6>[    0.026777] Secure boot disabled
<6>[    0.026784] RAMDISK: [mem 0x60ef3000-0x67b39fff]
<6>[    0.026797] ACPI: Early table checksum verification disabled
<6>[    0.026808] ACPI: RSDP 0x000000007B5FE014 000024 (v02 LENOVO)
<6>[    0.026835] ACPI: XSDT 0x000000007B5AC188 000124 (v01 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.026873] ACPI: FACP 0x000000007B5E1000 0000F4 (v05 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.026913] ACPI: DSDT 0x000000007B5BA000 022607 (v02 LENOVO SKL   
    00000000 INTL 20160527)
<6>[    0.026943] ACPI: FACS 0x000000007B53E000 000040
<6>[    0.026969] ACPI: SSDT 0x000000007B5E9000 0132C1 (v02 LENOVO 
DptfTabl 00001000 INTL 20160527)
<6>[    0.027000] ACPI: SSDT 0x000000007B5E8000 0003DB (v02 LENOVO 
Tpm2Tabl 00001000 INTL 20160527)
<6>[    0.027030] ACPI: TPM2 0x000000007B5E7000 000034 (v03 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027061] ACPI: UEFI 0x000000007B553000 000042 (v01 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027091] ACPI: SSDT 0x000000007B5E3000 0030E4 (v02 LENOVO 
SaSsdt   00003000 INTL 20160527)
<6>[    0.027122] ACPI: SSDT 0x000000007B5E2000 0005C6 (v02 LENOVO 
PerfTune 00001000 INTL 20160527)
<6>[    0.027153] ACPI: HPET 0x000000007B5E0000 000038 (v01 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027183] ACPI: APIC 0x000000007B5DF000 00012C (v03 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027213] ACPI: MCFG 0x000000007B5DE000 00003C (v01 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027244] ACPI: ECDT 0x000000007B5DD000 000053 (v01 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027274] ACPI: SSDT 0x000000007B5B8000 001CA3 (v02 LENOVO 
RVP7Rtd3 00001000 INTL 20160527)
<6>[    0.027305] ACPI: SSDT 0x000000007B5B7000 00021C (v01 LENOVO 
Rmv_Batt 00001000 INTL 20160527)
<6>[    0.027335] ACPI: SSDT 0x000000007B5B5000 00163C (v02 LENOVO 
ProjSsdt 00000010 INTL 20160527)
<6>[    0.027366] ACPI: BOOT 0x000000007B5B4000 000028 (v01 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027396] ACPI: BATB 0x000000007B5B3000 00004A (v02 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027427] ACPI: SSDT 0x000000007B5B1000 0017AE (v02 LENOVO 
CpuSsdt  00003000 INTL 20160527)
<6>[    0.027457] ACPI: SSDT 0x000000007B5B0000 00056D (v02 LENOVO CtdpB 
    00001000 INTL 20160527)
<6>[    0.027488] ACPI: SSDT 0x000000007B5AF000 000678 (v02 LENOVO 
UsbCTabl 00001000 INTL 20160527)
<6>[    0.027519] ACPI: LPIT 0x000000007B5AE000 000094 (v01 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027549] ACPI: WSMT 0x000000007B5AD000 000028 (v01 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027579] ACPI: SSDT 0x000000007B5FD000 0001D8 (v02 LENOVO 
HdaDsp   00000000 INTL 20160527)
<6>[    0.027610] ACPI: SSDT 0x000000007B5AB000 0004FC (v02 LENOVO 
TbtTypeC 00000000 INTL 20160527)
<6>[    0.027640] ACPI: SSDT 0x000000007B5AA000 0002D1 (v02 LENOVO Wwan  
    00000001 INTL 20160527)
<6>[    0.027671] ACPI: DBGP 0x000000007B5A9000 000034 (v01 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027702] ACPI: DBG2 0x000000007B5A8000 000054 (v00 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027732] ACPI: MSDM 0x000000007B5A7000 000055 (v03 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027762] ACPI: DMAR 0x000000007B5A6000 0000A8 (v01 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027793] ACPI: ASF! 0x000000007B5A5000 0000A0 (v32 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027823] ACPI: FPDT 0x000000007B5A4000 000044 (v01 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027853] ACPI: BGRT 0x000000007B5A3000 000038 (v01 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027884] ACPI: UEFI 0x000000007B53B000 00013E (v01 LENOVO 
TP-N24   00001360 PTEC 00000002)
<6>[    0.027911] ACPI: Reserving FACP table memory at [mem 
0x7b5e1000-0x7b5e10f3]
<6>[    0.027923] ACPI: Reserving DSDT table memory at [mem 
0x7b5ba000-0x7b5dc606]
<6>[    0.027934] ACPI: Reserving FACS table memory at [mem 
0x7b53e000-0x7b53e03f]
<6>[    0.027945] ACPI: Reserving SSDT table memory at [mem 
0x7b5e9000-0x7b5fc2c0]
<6>[    0.027956] ACPI: Reserving SSDT table memory at [mem 
0x7b5e8000-0x7b5e83da]
<6>[    0.027967] ACPI: Reserving TPM2 table memory at [mem 
0x7b5e7000-0x7b5e7033]
<6>[    0.027978] ACPI: Reserving UEFI table memory at [mem 
0x7b553000-0x7b553041]
<6>[    0.027989] ACPI: Reserving SSDT table memory at [mem 
0x7b5e3000-0x7b5e60e3]
<6>[    0.028000] ACPI: Reserving SSDT table memory at [mem 
0x7b5e2000-0x7b5e25c5]
<6>[    0.028011] ACPI: Reserving HPET table memory at [mem 
0x7b5e0000-0x7b5e0037]
<6>[    0.028022] ACPI: Reserving APIC table memory at [mem 
0x7b5df000-0x7b5df12b]
<6>[    0.028033] ACPI: Reserving MCFG table memory at [mem 
0x7b5de000-0x7b5de03b]
<6>[    0.028044] ACPI: Reserving ECDT table memory at [mem 
0x7b5dd000-0x7b5dd052]
<6>[    0.028055] ACPI: Reserving SSDT table memory at [mem 
0x7b5b8000-0x7b5b9ca2]
<6>[    0.028066] ACPI: Reserving SSDT table memory at [mem 
0x7b5b7000-0x7b5b721b]
<6>[    0.028077] ACPI: Reserving SSDT table memory at [mem 
0x7b5b5000-0x7b5b663b]
<6>[    0.028088] ACPI: Reserving BOOT table memory at [mem 
0x7b5b4000-0x7b5b4027]
<6>[    0.028099] ACPI: Reserving BATB table memory at [mem 
0x7b5b3000-0x7b5b3049]
<6>[    0.028110] ACPI: Reserving SSDT table memory at [mem 
0x7b5b1000-0x7b5b27ad]
<6>[    0.028121] ACPI: Reserving SSDT table memory at [mem 
0x7b5b0000-0x7b5b056c]
<6>[    0.028132] ACPI: Reserving SSDT table memory at [mem 
0x7b5af000-0x7b5af677]
<6>[    0.028143] ACPI: Reserving LPIT table memory at [mem 
0x7b5ae000-0x7b5ae093]
<6>[    0.028154] ACPI: Reserving WSMT table memory at [mem 
0x7b5ad000-0x7b5ad027]
<6>[    0.028165] ACPI: Reserving SSDT table memory at [mem 
0x7b5fd000-0x7b5fd1d7]
<6>[    0.028177] ACPI: Reserving SSDT table memory at [mem 
0x7b5ab000-0x7b5ab4fb]
<6>[    0.028188] ACPI: Reserving SSDT table memory at [mem 
0x7b5aa000-0x7b5aa2d0]
<6>[    0.028199] ACPI: Reserving DBGP table memory at [mem 
0x7b5a9000-0x7b5a9033]
<6>[    0.028209] ACPI: Reserving DBG2 table memory at [mem 
0x7b5a8000-0x7b5a8053]
<6>[    0.028220] ACPI: Reserving MSDM table memory at [mem 
0x7b5a7000-0x7b5a7054]
<6>[    0.028231] ACPI: Reserving DMAR table memory at [mem 
0x7b5a6000-0x7b5a60a7]
<6>[    0.028242] ACPI: Reserving ASF! table memory at [mem 
0x7b5a5000-0x7b5a509f]
<6>[    0.028253] ACPI: Reserving FPDT table memory at [mem 
0x7b5a4000-0x7b5a4043]
<6>[    0.028264] ACPI: Reserving BGRT table memory at [mem 
0x7b5a3000-0x7b5a3037]
<6>[    0.028275] ACPI: Reserving UEFI table memory at [mem 
0x7b53b000-0x7b53b13d]
<6>[    0.028614] No NUMA configuration found
<6>[    0.028623] Faking a node at [mem 
0x0000000000000000-0x000000047f7fffff]
<6>[    0.028652] NODE_DATA(0) allocated [mem 0x47f7e9000-0x47f7fffff]
<6>[    0.061967] Zone ranges:
<6>[    0.061974]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
<6>[    0.061990]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
<6>[    0.062005]   Normal   [mem 0x0000000100000000-0x000000047f7fffff]
<6>[    0.062019]   Device   empty
<6>[    0.062030] Movable zone start for each node
<6>[    0.062037] Early memory node ranges
<6>[    0.062043]   node   0: [mem 
0x0000000000001000-0x0000000000057fff]
<6>[    0.062054]   node   0: [mem 
0x0000000000059000-0x000000000009cfff]
<6>[    0.062064]   node   0: [mem 
0x0000000000100000-0x000000003fffffff]
<6>[    0.062075]   node   0: [mem 
0x0000000040400000-0x000000006c9d1fff]
<6>[    0.062086]   node   0: [mem 
0x000000006c9d4000-0x000000007a404fff]
<6>[    0.062096]   node   0: [mem 
0x000000007b5ff000-0x000000007b5fffff]
<6>[    0.062106]   node   0: [mem 
0x0000000100000000-0x000000047f7fffff]
<6>[    0.062129] Initmem setup node 0 [mem 
0x0000000000001000-0x000000047f7fffff]
<6>[    0.062203] On node 0, zone DMA: 1 pages in unavailable ranges
<6>[    0.062236] On node 0, zone DMA: 1 pages in unavailable ranges
<6>[    0.063485] On node 0, zone DMA: 99 pages in unavailable ranges
<6>[    0.200515] On node 0, zone DMA32: 1024 pages in unavailable 
ranges
<6>[    0.217995] On node 0, zone DMA32: 2 pages in unavailable ranges
<6>[    0.220182] On node 0, zone DMA32: 4602 pages in unavailable 
ranges
<6>[    0.240763] On node 0, zone Normal: 18944 pages in unavailable 
ranges
<6>[    0.241741] On node 0, zone Normal: 2048 pages in unavailable 
ranges
<6>[    0.241762] Reserving Intel graphics memory at [mem 
0x7d800000-0x7f7fffff]
<6>[    0.242170] ACPI: PM-Timer IO Port: 0x1808
<6>[    0.242216] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
<6>[    0.242228] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
<6>[    0.242239] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
<6>[    0.242249] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
<6>[    0.242259] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
<6>[    0.242270] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
<6>[    0.242280] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
<6>[    0.242290] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
<6>[    0.242301] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
<6>[    0.242311] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
<6>[    0.242321] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
<6>[    0.242332] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
<6>[    0.242342] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
<6>[    0.242352] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
<6>[    0.242363] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
<6>[    0.242373] ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
<6>[    0.242420] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, 
GSI 0-119
<6>[    0.242439] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl 
dfl)
<6>[    0.242455] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high 
level)
<6>[    0.242494] ACPI: Using ACPI (MADT) for SMP configuration 
information
<6>[    0.242503] ACPI: HPET id: 0x8086a201 base: 0xfed00000
<7>[    0.242539] e820: update [mem 0x7415b000-0x7425afff] usable ==> 
reserved
<6>[    0.242597] TSC deadline timer available
<6>[    0.242623] CPU topo: Max. logical packages:   1
<6>[    0.242630] CPU topo: Max. logical dies:       1
<6>[    0.242637] CPU topo: Max. dies per package:   1
<6>[    0.242663] CPU topo: Max. threads per core:   1
<6>[    0.242671] CPU topo: Num. cores per package:     4
<6>[    0.242678] CPU topo: Num. threads per package:   4
<6>[    0.242685] CPU topo: Allowing 4 present CPUs plus 0 hotplug CPUs
<6>[    0.242917] PM: hibernation: Registered nosave memory: [mem 
0x00000000-0x00000fff]
<6>[    0.242941] PM: hibernation: Registered nosave memory: [mem 
0x00058000-0x00058fff]
<6>[    0.242965] PM: hibernation: Registered nosave memory: [mem 
0x0009d000-0x000fffff]
<6>[    0.242988] PM: hibernation: Registered nosave memory: [mem 
0x40000000-0x403fffff]
<6>[    0.243012] PM: hibernation: Registered nosave memory: [mem 
0x6c9d2000-0x6c9d2fff]
<6>[    0.243021] PM: hibernation: Registered nosave memory: [mem 
0x6c9d3000-0x6c9d3fff]
<6>[    0.243046] PM: hibernation: Registered nosave memory: [mem 
0x7415b000-0x7425afff]
<6>[    0.243070] PM: hibernation: Registered nosave memory: [mem 
0x7a405000-0x7b52cfff]
<6>[    0.243080] PM: hibernation: Registered nosave memory: [mem 
0x7b52d000-0x7b599fff]
<6>[    0.243089] PM: hibernation: Registered nosave memory: [mem 
0x7b59a000-0x7b5fefff]
<6>[    0.243114] PM: hibernation: Registered nosave memory: [mem 
0x7b600000-0x7f7fffff]
<6>[    0.243123] PM: hibernation: Registered nosave memory: [mem 
0x7f800000-0xfe00ffff]
<6>[    0.243133] PM: hibernation: Registered nosave memory: [mem 
0xfe010000-0xfe010fff]
<6>[    0.243142] PM: hibernation: Registered nosave memory: [mem 
0xfe011000-0xffffffff]
<6>[    0.243160] [mem 0x7f800000-0xfe00ffff] available for PCI devices
<6>[    0.243169] Booting paravirtualized kernel on bare hardware
<6>[    0.243180] clocksource: refined-jiffies: mask: 0xffffffff 
max_cycles: 0xffffffff, max_idle_ns: 6370452778343963 ns
<6>[    0.258816] No bootconfig data provided, so skipping bootconfig
<6>[    0.258877] setup_percpu: NR_CPUS:512 nr_cpumask_bits:4 
nr_cpu_ids:4 nr_node_ids:1
<6>[    0.259406] percpu: Embedded 127 pages/cpu s397312 r8192 d114688 
u524288
<7>[    0.259490] pcpu-alloc: s397312 r8192 d114688 u524288 
alloc=1*2097152
<7>[    0.259508] pcpu-alloc: [0] 0 1 2 3
<5>[    0.259736] Kernel command line: root=UUID=XXX rd.luks.uuid=XXX 
rd.luks.crypttab=0 rw init=/etc/s6-linux-init/current/bin/init quiet 
usbcore.authorized_default=1 threadirqs
<6>[    0.262858] Dentry cache hash table entries: 2097152 (order: 12, 
16777216 bytes, linear)
<6>[    0.263890] Inode-cache hash table entries: 1048576 (order: 11, 
8388608 bytes, linear)
<6>[    0.264240] Fallback order for Node 0: 0
<6>[    0.264256] Built 1 zonelists, mobility grouping on.  Total pages: 
4167583
<6>[    0.264267] Policy zone: Normal
<6>[    0.265469] mem auto-init: stack:all(zero), heap alloc:on, heap 
free:off, mlocked free:on
<6>[    0.265509] software IO TLB: area num 4.
<6>[    0.379876] Memory: 1868500K/16670332K available (26624K kernel 
code, 10236K rwdata, 12800K rodata, 6732K init, 17444K bss, 641900K 
reserved, 0K cma-reserved)
<6>[    0.393026] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, 
Nodes=1
<6>[    0.393265] Kernel/User page tables isolation: enabled
<6>[    0.393640] ftrace: allocating 47044 entries in 184 pages
<6>[    0.410510] ftrace: allocated 184 pages with 4 groups
<6>[    0.414669] Dynamic Preempt: voluntary
<6>[    0.415160] Running RCU self tests
<6>[    0.415168] Running RCU synchronous self tests
<6>[    0.415185] rcu: Preemptible hierarchical RCU implementation.
<6>[    0.415192] rcu: 	RCU lockdep checking is enabled.
<6>[    0.415198] rcu: 	RCU restricting CPUs from NR_CPUS=512 to 
nr_cpu_ids=4.
<6>[    0.415208] 	Trampoline variant of Tasks RCU enabled.
<6>[    0.415214] 	Rude variant of Tasks RCU enabled.
<6>[    0.415220] 	Tracing variant of Tasks RCU enabled.
<6>[    0.415227] rcu: RCU calculated value of scheduler-enlistment 
delay is 30 jiffies.
<6>[    0.415235] rcu: Adjusting geometry for rcu_fanout_leaf=16, 
nr_cpu_ids=4
<6>[    0.415346] Running RCU synchronous self tests
<6>[    0.415359] RCU Tasks: Setting shift to 2 and lim to 1 
rcu_task_cb_adjust=1.
<6>[    0.415372] RCU Tasks Rude: Setting shift to 2 and lim to 1 
rcu_task_cb_adjust=1.
<6>[    0.415385] RCU Tasks Trace: Setting shift to 2 and lim to 1 
rcu_task_cb_adjust=1.
<6>[    0.476352] NR_IRQS: 33024, nr_irqs: 1024, preallocated irqs: 16
<6>[    0.477113] rcu: 	Offload RCU callbacks from CPUs: 0-3.
<6>[    0.477131] rcu: srcu_init: Setting srcu_struct sizes based on 
contention.
<6>[    0.480094] kfence: initialized - using 8388608 bytes for 1023 
objects at 0x(____ptrval____)-0x(____ptrval____)
<6>[    0.480562] Console: colour dummy device 80x25
<6>[    0.480655] printk: legacy console [tty0] enabled
<4>[    0.481055] Lock dependency validator: Copyright (c) 2006 Red Hat, 
Inc., Ingo Molnar
<4>[    0.481066] ... MAX_LOCKDEP_SUBCLASSES:  8
<4>[    0.481076] ... MAX_LOCK_DEPTH:          48
<4>[    0.481086] ... MAX_LOCKDEP_KEYS:        8192
<4>[    0.481096] ... CLASSHASH_SIZE:          4096
<4>[    0.481105] ... MAX_LOCKDEP_ENTRIES:     32768
<4>[    0.481115] ... MAX_LOCKDEP_CHAINS:      65536
<4>[    0.481124] ... CHAINHASH_SIZE:          32768
<4>[    0.481134]  memory used by lock dependency info: 6429 kB
<4>[    0.481144]  memory used for stack traces: 4224 kB
<4>[    0.481153]  per task-struct memory footprint: 1920 bytes
<6>[    0.481396] ACPI: Core revision 20240322
<6>[    0.487632] hpet: HPET dysfunctional in PC10. Force disabled.
<6>[    0.487645] APIC: Switch to symmetric I/O mode setup
<6>[    0.487658] DMAR: Host address width 39
<6>[    0.487669] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
<6>[    0.487759] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 
1c0000c40660462 ecap 19e2ff0505e
<6>[    0.487778] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
<6>[    0.487810] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap 
d2008c40660462 ecap f050da
<6>[    0.487827] DMAR: RMRR base: 0x0000007aa9f000 end: 
0x0000007aabefff
<6>[    0.487845] DMAR: RMRR base: 0x0000007d000000 end: 
0x0000007f7fffff
<6>[    0.487863] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 
1
<6>[    0.487877] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
<6>[    0.487889] DMAR-IR: Queued invalidation will be enabled to 
support x2apic and Intr-remapping.
<6>[    0.489766] DMAR-IR: Enabled IRQ remapping in x2apic mode
<6>[    0.489780] x2apic enabled
<6>[    0.490251] APIC: Switched APIC routing to: cluster x2apic
<6>[    0.494879] clocksource: tsc-early: mask: 0xffffffffffffffff 
max_cycles: 0x39a8208cdd2, max_idle_ns: 881590748921 ns
<6>[    0.494934] Calibrating delay loop (skipped), value calculated 
using timer frequency.. 4001.60 BogoMIPS (lpj=6666560)
<6>[    0.495012] CPU0: Thermal monitoring enabled (TM1)
<6>[    0.495169] Last level iTLB entries: 4KB 128, 2MB 8, 4MB 8
<6>[    0.495184] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
<6>[    0.495210] process: using mwait in idle threads
<6>[    0.495224] Spectre V1 : Mitigation: usercopy/swapgs barriers and 
__user pointer sanitization
<6>[    0.495246] Spectre V2 : Mitigation: IBRS
<6>[    0.495258] Spectre V2 : Spectre v2 / SpectreRSB mitigation: 
Filling RSB on context switch
<6>[    0.495272] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on 
VMEXIT
<6>[    0.495286] RETBleed: Mitigation: IBRS
<6>[    0.495312] Spectre V2 : mitigation: Enabling conditional Indirect 
Branch Prediction Barrier
<6>[    0.495339] Speculative Store Bypass: Mitigation: Speculative 
Store Bypass disabled via prctl
<6>[    0.495428] MDS: Mitigation: Clear CPU buffers
<6>[    0.495442] MMIO Stale Data: Mitigation: Clear CPU buffers
<6>[    0.495461] SRBDS: Mitigation: Microcode
<6>[    0.495501] GDS: Vulnerable: No microcode
<6>[    0.495550] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating 
point registers'
<6>[    0.495569] x86/fpu: Supporting XSAVE feature 0x002: 'SSE 
registers'
<6>[    0.495585] x86/fpu: Supporting XSAVE feature 0x004: 'AVX 
registers'
<6>[    0.495602] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds 
registers'
<6>[    0.495618] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
<6>[    0.495635] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
<6>[    0.495654] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
<6>[    0.495673] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
<6>[    0.495691] x86/fpu: Enabled xstate features 0x1f, context size is 
960 bytes, using 'compacted' format.
<6>[    0.498246] Freeing SMP alternatives memory: 36K
<6>[    0.498246] pid_max: default: 32768 minimum: 301
<6>[    0.498246] LSM: initializing 
lsm=lockdown,capability,landlock,yama,safesetid,tomoyo,bpf,ima,evm
<6>[    0.498246] landlock: Up and running.
<6>[    0.498246] Yama: becoming mindful.
<6>[    0.498246] TOMOYO Linux initialized
<6>[    0.498246] LSM support for eBPF active
<6>[    0.498246] Mount-cache hash table entries: 32768 (order: 6, 
262144 bytes, linear)
<6>[    0.498246] Mountpoint-cache hash table entries: 32768 (order: 6, 
262144 bytes, linear)
<6>[    0.498246] kcsan: enabled early
<4>[    0.498246] kcsan: non-strict mode configured - use 
CONFIG_KCSAN_STRICT=y to see all data races
<6>[    0.498246] Running RCU synchronous self tests
<6>[    0.498246] Running RCU synchronous self tests
<6>[    0.498246] smpboot: CPU0: Intel(R) Core(TM) i7-8550U CPU @ 
1.80GHz (family: 0x6, model: 0x8e, stepping: 0xa)
<6>[    0.498477] Running RCU Tasks wait API self tests
<6>[    0.499018] Running RCU Tasks Rude wait API self tests
<6>[    0.499366] Running RCU Tasks Trace wait API self tests
<6>[    0.499560] Performance Events: PEBS fmt3+, Skylake events, 
32-deep LBR, full-width counters, Intel PMU driver.
<6>[    0.499951] ... version:                4
<6>[    0.499965] ... bit width:              48
<6>[    0.499978] ... generic registers:      8
<6>[    0.499991] ... value mask:             0000ffffffffffff
<6>[    0.500006] ... max period:             00007fffffffffff
<6>[    0.500019] ... fixed-purpose events:   3
<6>[    0.500032] ... event mask:             00000007000000ff
<6>[    0.501320] signal: max sigframe size: 2032
<6>[    0.501526] Estimated ratio of average max frequency by base 
frequency (times 1024): 1894
<6>[    0.501887] rcu: Hierarchical SRCU implementation.
<6>[    0.501903] rcu: 	Max phase no-delay instances is 1000.
<6>[    0.508737] NMI watchdog: Enabled. Permanently consumes one hw-PMU 
counter.
<6>[    0.508958] Callback from call_rcu_tasks_trace() invoked.
<6>[    0.509615] smp: Bringing up secondary CPUs ...
<6>[    0.512282] smpboot: x86: Booting SMP configuration:
<6>[    0.512309] .... node  #0, CPUs:      #1 #2 #3
<6>[    0.518682] smp: Brought up 1 node, 4 CPUs
<6>[    0.518682] smpboot: Total of 4 processors activated (16006.40 
BogoMIPS)
<6>[    0.605884] Callback from call_rcu_tasks_rude() invoked.
<6>[    0.811804] Callback from call_rcu_tasks() invoked.
<6>[    0.853147] node 0 deferred pages initialised in 334ms
<6>[    0.878378] allocated 33554432 bytes of page_ext
<6>[    0.882744] devtmpfs: initialized
<6>[    0.882744] x86/mm: Memory block size: 128MB
<6>[    0.929859] ACPI: PM: Registering ACPI NVS region [mem 
0x6c9d2000-0x6c9d2fff] (4096 bytes)
<6>[    0.929885] ACPI: PM: Registering ACPI NVS region [mem 
0x7b52d000-0x7b599fff] (446464 bytes)
<6>[    0.931872] Running RCU synchronous self tests
<6>[    0.931980] Running RCU synchronous self tests
<6>[    0.932091] clocksource: jiffies: mask: 0xffffffff max_cycles: 
0xffffffff, max_idle_ns: 6370867519511994 ns
<6>[    0.932091] futex hash table entries: 1024 (order: 5, 131072 
bytes, linear)
<6>[    0.933515] prandom: seed boundary self test passed
<6>[    0.952318] prandom: 100 self tests passed
<6>[    0.952359] pinctrl core: initialized pinctrl subsystem
<6>[    0.954288] PM: RTC time: 15:26:42, date: 2024-06-01
<6>[    0.967855] NET: Registered PF_NETLINK/PF_ROUTE protocol family
<6>[    0.973920] DMA: preallocated 2048 KiB GFP_KERNEL pool for atomic 
allocations
<6>[    0.974235] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA pool for 
atomic allocations
<6>[    0.974596] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA32 pool 
for atomic allocations
<6>[    0.974943] audit: initializing netlink subsys (disabled)
<5>[    0.975094] audit: type=2000 audit(1717255602.479:1): 
state=initialized audit_enabled=0 res=1
<6>[    0.984675] kcsan: selftest: 3/3 tests passed
<6>[    0.987362] thermal_sys: Registered thermal governor 'fair_share'
<6>[    0.987379] thermal_sys: Registered thermal governor 'bang_bang'
<6>[    0.987397] thermal_sys: Registered thermal governor 'step_wise'
<6>[    0.987413] thermal_sys: Registered thermal governor 'user_space'
<6>[    0.987430] thermal_sys: Registered thermal governor 
'power_allocator'
<6>[    0.987619] EISA bus registered
<6>[    0.987779] cpuidle: using governor ladder
<6>[    0.987779] cpuidle: using governor menu
<6>[    0.989840] Simple Boot Flag at 0x47 set to 0x1
<6>[    0.990100] ACPI FADT declares the system doesn't support PCIe 
ASPM, so disable it
<6>[    0.990117] acpiphp: ACPI Hot Plug PCI Controller Driver version: 
0.5
<6>[    0.992245] PCI: ECAM [mem 0xf8000000-0xfbffffff] (base 
0xf8000000) for domain 0000 [bus 00-3f]
<6>[    0.992452] PCI: Using configuration type 1 for base access
<6>[    0.995623] kprobes: kprobe jump-optimization is enabled. All 
kprobes are optimized if possible.
<6>[    0.999288] Demotion targets for Node 0: null
<6>[    1.005452] ACPI: Added _OSI(Module Device)
<6>[    1.005473] ACPI: Added _OSI(Processor Device)
<6>[    1.005566] ACPI: Added _OSI(3.0 _SCP Extensions)
<6>[    1.005587] ACPI: Added _OSI(Processor Aggregator Device)
<6>[    1.878602] ACPI: 14 ACPI AML tables successfully acquired and 
loaded
<6>[    1.908554] ACPI: EC: EC started
<6>[    1.908580] ACPI: EC: interrupt blocked
<6>[    1.931725] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
<6>[    1.931743] ACPI: EC: Boot ECDT EC used to handle transactions
<5>[    1.965117] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
<6>[    2.148204] ACPI: Dynamic OEM Table Load:
<6>[    2.148586] ACPI: SSDT 0xFFFF8E5841304400 0003FF (v02 PmRef  
Cpu0Cst  00003001 INTL 20160527)
<6>[    2.180476] ACPI: Dynamic OEM Table Load:
<6>[    2.180747] ACPI: SSDT 0xFFFF8E5A55484800 0005CD (v02 PmRef  
Cpu0Ist  00003000 INTL 20160527)
<6>[    2.212226] ACPI: Dynamic OEM Table Load:
<6>[    2.212569] ACPI: SSDT 0xFFFF8E5A5555B6C0 0000BA (v02 PmRef  
Cpu0Hwp  00003000 INTL 20160527)
<6>[    2.241665] ACPI: Dynamic OEM Table Load:
<6>[    2.242054] ACPI: SSDT 0xFFFF8E5A55480800 000628 (v02 PmRef  
HwpLvt   00003000 INTL 20160527)
<6>[    2.278285] ACPI: Dynamic OEM Table Load:
<6>[    2.278285] ACPI: SSDT 0xFFFF8E5A55495000 000D14 (v02 PmRef  ApIst 
    00003000 INTL 20160527)
<6>[    2.319333] ACPI: Dynamic OEM Table Load:
<6>[    2.319593] ACPI: SSDT 0xFFFF8E5841305000 000317 (v02 PmRef  ApHwp 
    00003000 INTL 20160527)
<6>[    2.350326] ACPI: Dynamic OEM Table Load:
<6>[    2.350538] ACPI: SSDT 0xFFFF8E5841306400 00030A (v02 PmRef  ApCst 
    00003000 INTL 20160527)
<6>[    2.404540] ACPI: _OSC evaluated successfully for all CPUs
<6>[    2.404558] ACPI: Interpreter enabled
<6>[    2.405769] ACPI: PM: (supports S0 S3 S4 S5)
<6>[    2.405787] ACPI: Using IOAPIC for interrupt routing
<6>[    2.454478] PCI: Using host bridge windows from ACPI; if 
necessary, use "pci=nocrs" and report a bug
<6>[    2.454577] PCI: Using E820 reservations for host bridge windows
<6>[    2.468240] ACPI: Enabled 8 GPEs in block 00 to 7F
<6>[    2.553514] ACPI: \_SB_.PCI0.LPCB.EC__.PUBS: New power resource
<6>[    2.562348] acpi PNP0C0A:01: ACPI dock station (docks/bays count: 
1)
<6>[    2.692316] ACPI: \_SB_.PCI0.RP07.PXSX.WRST: New power resource
<6>[    2.705696] ACPI: \_SB_.PCI0.RP09.PXP_: New power resource
<6>[    3.069779] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-3e])
<6>[    3.069892] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig 
ASPM ClockPM Segments MSI EDR HPX-Type3]
<6>[    3.101667] acpi PNP0A08:00: _OSC: platform does not support [AER]
<6>[    3.116585] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug 
SHPCHotplug PME PCIeCapability LTR DPC]
<6>[    3.116631] acpi PNP0A08:00: FADT indicates ASPM is unsupported, 
using BIOS configuration
<6>[    3.161883] PCI host bridge to bus 0000:00
<6>[    3.161910] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 
window]
<6>[    3.161999] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff 
window]
<6>[    3.162039] pci_bus 0000:00: root bus resource [mem 
0x000a0000-0x000fffff window]
<6>[    3.162069] pci_bus 0000:00: root bus resource [mem 
0x7f800000-0xf7ffffff window]
<6>[    3.162095] pci_bus 0000:00: root bus resource [mem 
0xfd000000-0xfe7fffff window]
<6>[    3.162122] pci_bus 0000:00: root bus resource [bus 00-3e]
<6>[    3.162692] pci 0000:00:00.0: [8086:5914] type 00 class 0x060000 
conventional PCI endpoint
<6>[    3.164171] pci 0000:00:02.0: [8086:5917] type 00 class 0x030000 
PCIe Root Complex Integrated Endpoint
<6>[    3.164233] pci 0000:00:02.0: BAR 0 [mem 0xdb000000-0xdbffffff 
64bit]
<6>[    3.164278] pci 0000:00:02.0: BAR 2 [mem 0x80000000-0x9fffffff 
64bit pref]
<6>[    3.164343] pci 0000:00:02.0: BAR 4 [io  0xe000-0xe03f]
<6>[    3.164552] pci 0000:00:02.0: Video device with shadowed ROM at 
[mem 0x000c0000-0x000dffff]
<6>[    3.168878] pci 0000:00:04.0: [8086:1903] type 00 class 0x118000 
conventional PCI endpoint
<6>[    3.168965] pci 0000:00:04.0: BAR 0 [mem 0xdc340000-0xdc347fff 
64bit]
<6>[    3.175820] pci 0000:00:08.0: [8086:1911] type 00 class 0x088000 
conventional PCI endpoint
<6>[    3.175881] pci 0000:00:08.0: BAR 0 [mem 0xdc350000-0xdc350fff 
64bit]
<6>[    3.177128] pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330 
conventional PCI endpoint
<6>[    3.177197] pci 0000:00:14.0: BAR 0 [mem 0xdc320000-0xdc32ffff 
64bit]
<6>[    3.177521] pci 0000:00:14.0: PME# supported from D3hot D3cold
<6>[    3.189876] pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000 
conventional PCI endpoint
<6>[    3.189946] pci 0000:00:14.2: BAR 0 [mem 0xdc351000-0xdc351fff 
64bit]
<6>[    3.191237] pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000 
conventional PCI endpoint
<6>[    3.191357] pci 0000:00:16.0: BAR 0 [mem 0xdc352000-0xdc352fff 
64bit]
<6>[    3.191717] pci 0000:00:16.0: PME# supported from D3hot
<6>[    3.198419] pci 0000:00:1c.0: [8086:9d10] type 01 class 0x060400 
PCIe Root Port
<6>[    3.198535] pci 0000:00:1c.0: PCI bridge to [bus 01]
<6>[    3.198948] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
<6>[    3.207879] pci 0000:00:1c.4: [8086:9d14] type 01 class 0x060400 
PCIe Root Port
<6>[    3.207970] pci 0000:00:1c.4: PCI bridge to [bus 02]
<6>[    3.208005] pci 0000:00:1c.4:   bridge window [mem 
0xdc200000-0xdc2fffff]
<6>[    3.208330] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
<6>[    3.208412] pci 0000:00:1c.4: Intel SPT PCH root port ACS 
workaround enabled
<6>[    3.217788] pci 0000:00:1c.6: [8086:9d16] type 01 class 0x060400 
PCIe Root Port
<6>[    3.217878] pci 0000:00:1c.6: PCI bridge to [bus 03]
<6>[    3.217912] pci 0000:00:1c.6:   bridge window [mem 
0xdc100000-0xdc1fffff]
<6>[    3.218256] pci 0000:00:1c.6: PME# supported from D0 D3hot D3cold
<6>[    3.218373] pci 0000:00:1c.6: Intel SPT PCH root port ACS 
workaround enabled
<6>[    3.227029] pci 0000:00:1d.0: [8086:9d18] type 01 class 0x060400 
PCIe Root Port
<6>[    3.227134] pci 0000:00:1d.0: PCI bridge to [bus 04-3c]
<6>[    3.227167] pci 0000:00:1d.0:   bridge window [mem 
0xc4000000-0xda0fffff]
<6>[    3.227208] pci 0000:00:1d.0:   bridge window [mem 
0xa0000000-0xc1ffffff 64bit pref]
<6>[    3.227666] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
<6>[    3.227774] pci 0000:00:1d.0: Intel SPT PCH root port ACS 
workaround enabled
<6>[    3.237236] pci 0000:00:1d.2: [8086:9d1a] type 01 class 0x060400 
PCIe Root Port
<6>[    3.237323] pci 0000:00:1d.2: PCI bridge to [bus 3d]
<6>[    3.237355] pci 0000:00:1d.2:   bridge window [mem 
0xdc000000-0xdc0fffff]
<6>[    3.237919] pci 0000:00:1d.2: PME# supported from D0 D3hot D3cold
<6>[    3.238024] pci 0000:00:1d.2: Intel SPT PCH root port ACS 
workaround enabled
<6>[    3.247465] pci 0000:00:1f.0: [8086:9d4e] type 00 class 0x060100 
conventional PCI endpoint
<6>[    3.254701] pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000 
conventional PCI endpoint
<6>[    3.254758] pci 0000:00:1f.2: BAR 0 [mem 0xdc34c000-0xdc34ffff]
<6>[    3.261533] pci 0000:00:1f.3: [8086:9d71] type 00 class 0x040300 
conventional PCI endpoint
<6>[    3.261633] pci 0000:00:1f.3: BAR 0 [mem 0xdc348000-0xdc34bfff 
64bit]
<6>[    3.261722] pci 0000:00:1f.3: BAR 4 [mem 0xdc330000-0xdc33ffff 
64bit]
<6>[    3.261935] pci 0000:00:1f.3: PME# supported from D3hot D3cold
<6>[    3.271867] pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c0500 
conventional PCI endpoint
<6>[    3.272011] pci 0000:00:1f.4: BAR 0 [mem 0xdc353000-0xdc3530ff 
64bit]
<6>[    3.272093] pci 0000:00:1f.4: BAR 4 [io  0xefa0-0xefbf]
<6>[    3.278823] pci 0000:00:1f.6: [8086:15d8] type 00 class 0x020000 
conventional PCI endpoint
<6>[    3.278940] pci 0000:00:1f.6: BAR 0 [mem 0xdc300000-0xdc31ffff]
<6>[    3.279307] pci 0000:00:1f.6: PME# supported from D0 D3hot D3cold
<6>[    3.286193] pci 0000:00:1c.0: PCI bridge to [bus 01]
<6>[    3.287120] pci 0000:02:00.0: [8086:7360] type 00 class 0x0d4000 
PCIe Endpoint
<6>[    3.287373] pci 0000:02:00.0: BAR 0 [mem 0xdc200000-0xdc200fff 
64bit]
<6>[    3.287463] pci 0000:02:00.0: BAR 2 [mem 0xdc201000-0xdc2013ff 
64bit]
<6>[    3.288237] pci 0000:02:00.0: PME# supported from D0 D3hot D3cold
<6>[    3.290647] pci 0000:00:1c.4: PCI bridge to [bus 02]
<6>[    3.292743] pci 0000:03:00.0: [8086:24fd] type 00 class 0x028000 
PCIe Endpoint
<6>[    3.293863] pci 0000:03:00.0: BAR 0 [mem 0xdc100000-0xdc101fff 
64bit]
<6>[    3.299592] pci 0000:03:00.0: PME# supported from D0 D3hot D3cold
<6>[    3.309482] pci 0000:00:1c.6: PCI bridge to [bus 03]
<6>[    3.310232] pci 0000:04:00.0: [8086:15c0] type 01 class 0x060400 
PCIe Switch Upstream Port
<6>[    3.310343] pci 0000:04:00.0: PCI bridge to [bus 05-3c]
<6>[    3.310386] pci 0000:04:00.0:   bridge window [mem 
0xc4000000-0xda0fffff]
<6>[    3.310505] pci 0000:04:00.0:   bridge window [mem 
0xa0000000-0xc1ffffff 64bit pref]
<6>[    3.310556] pci 0000:04:00.0: enabling Extended Tags
<6>[    3.310929] pci 0000:04:00.0: supports D1 D2
<6>[    3.310950] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot 
D3cold
<6>[    3.312991] pci 0000:00:1d.0: PCI bridge to [bus 04-3c]
<6>[    3.313678] pci 0000:05:00.0: [8086:15c0] type 01 class 0x060400 
PCIe Switch Downstream Port
<6>[    3.313853] pci 0000:05:00.0: PCI bridge to [bus 06]
<6>[    3.313893] pci 0000:05:00.0:   bridge window [mem 
0xda000000-0xda0fffff]
<6>[    3.313968] pci 0000:05:00.0: enabling Extended Tags
<6>[    3.314515] pci 0000:05:00.0: supports D1 D2
<6>[    3.314536] pci 0000:05:00.0: PME# supported from D0 D1 D2 D3hot 
D3cold
<6>[    3.315741] pci 0000:05:01.0: [8086:15c0] type 01 class 0x060400 
PCIe Switch Downstream Port
<6>[    3.315917] pci 0000:05:01.0: PCI bridge to [bus 07-3b]
<6>[    3.315957] pci 0000:05:01.0:   bridge window [mem 
0xc4000000-0xd9efffff]
<6>[    3.316002] pci 0000:05:01.0:   bridge window [mem 
0xa0000000-0xc1ffffff 64bit pref]
<6>[    3.316056] pci 0000:05:01.0: enabling Extended Tags
<6>[    3.316494] pci 0000:05:01.0: supports D1 D2
<6>[    3.316515] pci 0000:05:01.0: PME# supported from D0 D1 D2 D3hot 
D3cold
<6>[    3.317771] pci 0000:05:02.0: [8086:15c0] type 01 class 0x060400 
PCIe Switch Downstream Port
<6>[    3.317920] pci 0000:05:02.0: PCI bridge to [bus 3c]
<6>[    3.317959] pci 0000:05:02.0:   bridge window [mem 
0xd9f00000-0xd9ffffff]
<6>[    3.318034] pci 0000:05:02.0: enabling Extended Tags
<6>[    3.318448] pci 0000:05:02.0: supports D1 D2
<6>[    3.318469] pci 0000:05:02.0: PME# supported from D0 D1 D2 D3hot 
D3cold
<6>[    3.320075] pci 0000:04:00.0: PCI bridge to [bus 05-3c]
<6>[    3.320476] pci 0000:06:00.0: [8086:15bf] type 00 class 0x088000 
PCIe Endpoint
<6>[    3.320619] pci 0000:06:00.0: BAR 0 [mem 0xda000000-0xda03ffff]
<6>[    3.320663] pci 0000:06:00.0: BAR 1 [mem 0xda040000-0xda040fff]
<6>[    3.320796] pci 0000:06:00.0: enabling Extended Tags
<6>[    3.321236] pci 0000:06:00.0: supports D1 D2
<6>[    3.321256] pci 0000:06:00.0: PME# supported from D0 D1 D2 D3hot 
D3cold
<6>[    3.322549] pci 0000:05:00.0: PCI bridge to [bus 06]
<6>[    3.322959] pci 0000:05:01.0: PCI bridge to [bus 07-3b]
<6>[    3.323609] pci 0000:3c:00.0: [8086:15c1] type 00 class 0x0c0330 
PCIe Endpoint
<6>[    3.323677] pci 0000:3c:00.0: BAR 0 [mem 0xd9f00000-0xd9f0ffff]
<6>[    3.323845] pci 0000:3c:00.0: enabling Extended Tags
<6>[    3.324280] pci 0000:3c:00.0: supports D1 D2
<6>[    3.324301] pci 0000:3c:00.0: PME# supported from D0 D1 D2 D3hot 
D3cold
<6>[    3.324567] pci 0000:3c:00.0: 8.000 Gb/s available PCIe bandwidth, 
limited by 2.5 GT/s PCIe x4 link at 0000:05:02.0 (capable of 31.504 Gb/s 
with 8.0 GT/s PCIe x4 link)
<6>[    3.326003] pci 0000:05:02.0: PCI bridge to [bus 3c]
<6>[    3.327225] pci 0000:3d:00.0: [144d:a809] type 00 class 0x010802 
PCIe Endpoint
<6>[    3.327442] pci 0000:3d:00.0: BAR 0 [mem 0xdc000000-0xdc003fff 
64bit]
<6>[    3.328288] pci 0000:3d:00.0: 15.752 Gb/s available PCIe 
bandwidth, limited by 8.0 GT/s PCIe x2 link at 0000:00:1d.2 (capable of 
31.504 Gb/s with 8.0 GT/s PCIe x4 link)
<6>[    3.330010] pci 0000:00:1d.2: PCI bridge to [bus 3d]
<6>[    3.369361] ACPI: PCI: Interrupt link LNKA configured for IRQ 11
<6>[    3.370180] ACPI: PCI: Interrupt link LNKB configured for IRQ 10
<6>[    3.370889] ACPI: PCI: Interrupt link LNKC configured for IRQ 11
<6>[    3.371825] ACPI: PCI: Interrupt link LNKD configured for IRQ 11
<6>[    3.372717] ACPI: PCI: Interrupt link LNKE configured for IRQ 11
<6>[    3.373562] ACPI: PCI: Interrupt link LNKF configured for IRQ 11
<6>[    3.374286] ACPI: PCI: Interrupt link LNKG configured for IRQ 11
<6>[    3.375102] ACPI: PCI: Interrupt link LNKH configured for IRQ 11
<6>[    3.414836] ACPI: EC: interrupt unblocked
<6>[    3.414909] ACPI: EC: event unblocked
<6>[    3.414920] ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
<6>[    3.414943] ACPI: EC: GPE=0x16
<6>[    3.414962] ACPI: \_SB_.PCI0.LPCB.EC__: Boot ECDT EC 
initialization complete
<6>[    3.414986] ACPI: \_SB_.PCI0.LPCB.EC__: EC: Used to handle 
transactions and events
<6>[    3.418385] iommu: Default domain type: Translated
<6>[    3.418385] iommu: DMA domain TLB invalidation policy: strict mode
<6>[    3.421479] pps_core: LinuxPPS API ver. 1 registered
<6>[    3.421542] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 
Rodolfo Giometti <giometti@linux.it>
<6>[    3.421634] PTP clock support registered
<6>[    3.424974] efivars: Registered efivars operations
<6>[    3.430335] NetLabel: Initializing
<6>[    3.430351] NetLabel:  domain hash size = 128
<6>[    3.430365] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
<6>[    3.430887] NetLabel:  unlabeled traffic allowed by default
<6>[    3.430973] mctp: management component transport protocol core
<6>[    3.431051] NET: Registered PF_MCTP protocol family
<6>[    3.431155] PCI: Using ACPI for IRQ routing
<7>[    3.435332] PCI: pci_cache_line_size set to 64 bytes
<7>[    3.436694] e820: reserve RAM buffer [mem 0x00058000-0x0005ffff]
<7>[    3.436714] e820: reserve RAM buffer [mem 0x0009d000-0x0009ffff]
<7>[    3.436732] e820: reserve RAM buffer [mem 0x6c9d2000-0x6fffffff]
<7>[    3.436751] e820: reserve RAM buffer [mem 0x7415b000-0x77ffffff]
<7>[    3.436769] e820: reserve RAM buffer [mem 0x7a405000-0x7bffffff]
<7>[    3.436845] e820: reserve RAM buffer [mem 0x7b600000-0x7bffffff]
<7>[    3.436863] e820: reserve RAM buffer [mem 0x47f800000-0x47fffffff]
<6>[    3.439052] pci 0000:00:02.0: vgaarb: setting as boot VGA device
<6>[    3.439052] pci 0000:00:02.0: vgaarb: bridge control possible
<6>[    3.439052] pci 0000:00:02.0: vgaarb: VGA device added: 
decodes=io+mem,owns=mem,locks=none
<6>[    3.439052] vgaarb: loaded
<6>[    3.442126] clocksource: Switched to clocksource tsc-early
<5>[    3.448056] VFS: Disk quotas dquot_6.6.0
<6>[    3.448157] VFS: Dquot-cache hash table entries: 512 (order 0, 
4096 bytes)
<6>[    3.450235] pnp: PnP ACPI init
<6>[    3.451810] system 00:00: [mem 0x40000000-0x403fffff] has been 
reserved
<6>[    3.454652] system 00:01: [mem 0xfd000000-0xfdabffff] has been 
reserved
<6>[    3.454684] system 00:01: [mem 0xfdad0000-0xfdadffff] has been 
reserved
<6>[    3.454772] system 00:01: [mem 0xfdb00000-0xfdffffff] has been 
reserved
<6>[    3.454802] system 00:01: [mem 0xfe000000-0xfe01ffff] could not be 
reserved
<6>[    3.454880] system 00:01: [mem 0xfe036000-0xfe03bfff] has been 
reserved
<6>[    3.454908] system 00:01: [mem 0xfe03d000-0xfe3fffff] has been 
reserved
<6>[    3.454936] system 00:01: [mem 0xfe410000-0xfe7fffff] has been 
reserved
<6>[    3.460606] system 00:02: [io  0xff00-0xfffe] has been reserved
<6>[    3.467196] system 00:03: [io  0x0680-0x069f] has been reserved
<6>[    3.467227] system 00:03: [io  0xffff] has been reserved
<6>[    3.467253] system 00:03: [io  0xffff] has been reserved
<6>[    3.467279] system 00:03: [io  0xffff] has been reserved
<6>[    3.467346] system 00:03: [io  0x1800-0x18fe] has been reserved
<6>[    3.467372] system 00:03: [io  0x164e-0x164f] has been reserved
<6>[    3.470150] system 00:05: [io  0x1854-0x1857] has been reserved
<6>[    3.473790] system 00:08: [io  0x1800-0x189f] could not be 
reserved
<6>[    3.473853] system 00:08: [io  0x0800-0x087f] has been reserved
<6>[    3.473880] system 00:08: [io  0x0880-0x08ff] has been reserved
<6>[    3.473977] system 00:08: [io  0x0900-0x097f] has been reserved
<6>[    3.474004] system 00:08: [io  0x0980-0x09ff] has been reserved
<6>[    3.474091] system 00:08: [io  0x0a00-0x0a7f] has been reserved
<6>[    3.474118] system 00:08: [io  0x0a80-0x0aff] has been reserved
<6>[    3.474146] system 00:08: [io  0x0b00-0x0b7f] has been reserved
<6>[    3.474173] system 00:08: [io  0x0b80-0x0bff] has been reserved
<6>[    3.474200] system 00:08: [io  0x15e0-0x15ef] has been reserved
<6>[    3.474244] system 00:08: [io  0x1600-0x167f] could not be 
reserved
<6>[    3.474279] system 00:08: [io  0x1640-0x165f] could not be 
reserved
<6>[    3.474364] system 00:08: [mem 0xf8000000-0xfbffffff] has been 
reserved
<6>[    3.474458] system 00:08: [mem 0xfed10000-0xfed13fff] has been 
reserved
<6>[    3.474490] system 00:08: [mem 0xfed18000-0xfed18fff] has been 
reserved
<6>[    3.474519] system 00:08: [mem 0xfed19000-0xfed19fff] has been 
reserved
<6>[    3.474547] system 00:08: [mem 0xfeb00000-0xfebfffff] has been 
reserved
<6>[    3.474576] system 00:08: [mem 0xfed20000-0xfed3ffff] has been 
reserved
<6>[    3.474663] system 00:08: [mem 0xfed90000-0xfed93fff] could not be 
reserved
<6>[    3.474708] system 00:08: [mem 0xf7fe0000-0xf7ffffff] has been 
reserved
<6>[    3.497491] system 00:09: [mem 0xfdaf0000-0xfdafffff] has been 
reserved
<6>[    3.497523] system 00:09: [mem 0xfdae0000-0xfdaeffff] has been 
reserved
<6>[    3.497559] system 00:09: [mem 0xfdac0000-0xfdacffff] has been 
reserved
<6>[    3.508404] system 00:0a: [mem 0xfed10000-0xfed17fff] could not be 
reserved
<6>[    3.508482] system 00:0a: [mem 0xfed18000-0xfed18fff] has been 
reserved
<6>[    3.508510] system 00:0a: [mem 0xfed19000-0xfed19fff] has been 
reserved
<6>[    3.508537] system 00:0a: [mem 0xf8000000-0xfbffffff] has been 
reserved
<6>[    3.508585] system 00:0a: [mem 0xfed20000-0xfed3ffff] has been 
reserved
<6>[    3.508613] system 00:0a: [mem 0xfed90000-0xfed93fff] could not be 
reserved
<6>[    3.508698] system 00:0a: [mem 0xfed45000-0xfed8ffff] has been 
reserved
<6>[    3.508790] system 00:0a: [mem 0xff000000-0xffffffff] has been 
reserved
<6>[    3.508818] system 00:0a: [mem 0xfee00000-0xfeefffff] has been 
reserved
<6>[    3.508847] system 00:0a: [mem 0xf7fe0000-0xf7ffffff] has been 
reserved
<6>[    3.513910] system 00:0b: [mem 0x00000000-0x0009ffff] could not be 
reserved
<6>[    3.513940] system 00:0b: [mem 0x000f0000-0x000fffff] could not be 
reserved
<6>[    3.513967] system 00:0b: [mem 0x00100000-0x7f7fffff] could not be 
reserved
<6>[    3.514059] system 00:0b: [mem 0xfec00000-0xfed3ffff] could not be 
reserved
<6>[    3.514087] system 00:0b: [mem 0xfed4c000-0xffffffff] could not be 
reserved
<6>[    3.516731] pnp: PnP ACPI: found 12 devices
<6>[    3.547577] clocksource: acpi_pm: mask: 0xffffff max_cycles: 
0xffffff, max_idle_ns: 2085701024 ns
<6>[    3.548733] NET: Registered PF_INET protocol family
<6>[    3.549731] IP idents hash table entries: 262144 (order: 9, 
2097152 bytes, linear)
<6>[    3.848771] tcp_listen_portaddr_hash hash table entries: 8192 
(order: 7, 589824 bytes, linear)
<6>[    3.850721] Table-perturb hash table entries: 65536 (order: 6, 
262144 bytes, linear)
<6>[    3.850953] TCP established hash table entries: 131072 (order: 8, 
1048576 bytes, linear)
<6>[    3.865282] TCP bind hash table entries: 65536 (order: 11, 9437184 
bytes, vmalloc hugepage)
<6>[    3.894662] TCP: Hash tables configured (established 131072 bind 
65536)
<6>[    3.896309] MPTCP token hash table entries: 16384 (order: 8, 
1441792 bytes, linear)
<6>[    3.900597] UDP hash table entries: 8192 (order: 8, 1310720 bytes, 
linear)
<6>[    3.906348] UDP-Lite hash table entries: 8192 (order: 8, 1310720 
bytes, linear)
<6>[    3.911929] NET: Registered PF_UNIX/PF_LOCAL protocol family
<6>[    3.912108] NET: Registered PF_XDP protocol family
<6>[    3.912152] pci 0000:00:1c.0: bridge window [io  0x1000-0x0fff] to 
[bus 01] add_size 1000
<6>[    3.912185] pci 0000:00:1c.0: bridge window [mem 
0x00100000-0x000fffff 64bit pref] to [bus 01] add_size 200000 add_align 
100000
<6>[    3.912289] pci 0000:00:1c.0: bridge window [mem 
0x00100000-0x000fffff] to [bus 01] add_size 200000 add_align 100000
<6>[    3.912329] pci 0000:05:01.0: bridge window [io  0x1000-0x0fff] to 
[bus 07-3b] add_size 1000
<6>[    3.912393] pci 0000:04:00.0: bridge window [io  0x1000-0x0fff] to 
[bus 05-3c] add_size 1000
<6>[    3.912458] pci 0000:00:1d.0: bridge window [io  0x1000-0x0fff] to 
[bus 04-3c] add_size 2000
<6>[    3.912519] pci 0000:00:1c.0: bridge window [mem 
0x7f800000-0x7f9fffff]: assigned
<6>[    3.912613] pci 0000:00:1c.0: bridge window [mem 
0x7fa00000-0x7fbfffff 64bit pref]: assigned
<6>[    3.912683] pci 0000:00:1c.0: bridge window [io  0x2000-0x2fff]: 
assigned
<6>[    3.912725] pci 0000:00:1d.0: bridge window [io  0x3000-0x4fff]: 
assigned
<6>[    3.912797] pci 0000:00:1c.0: PCI bridge to [bus 01]
<6>[    3.912823] pci 0000:00:1c.0:   bridge window [io  0x2000-0x2fff]
<6>[    3.912854] pci 0000:00:1c.0:   bridge window [mem 
0x7f800000-0x7f9fffff]
<6>[    3.912883] pci 0000:00:1c.0:   bridge window [mem 
0x7fa00000-0x7fbfffff 64bit pref]
<6>[    3.912920] pci 0000:00:1c.4: PCI bridge to [bus 02]
<6>[    3.912948] pci 0000:00:1c.4:   bridge window [mem 
0xdc200000-0xdc2fffff]
<6>[    3.913032] pci 0000:00:1c.6: PCI bridge to [bus 03]
<6>[    3.913060] pci 0000:00:1c.6:   bridge window [mem 
0xdc100000-0xdc1fffff]
<6>[    3.913104] pci 0000:04:00.0: bridge window [io  0x3000-0x3fff]: 
assigned
<6>[    3.913136] pci 0000:05:01.0: bridge window [io  0x3000-0x3fff]: 
assigned
<6>[    3.913166] pci 0000:05:00.0: PCI bridge to [bus 06]
<6>[    3.913194] pci 0000:05:00.0:   bridge window [mem 
0xda000000-0xda0fffff]
<6>[    3.913274] pci 0000:05:01.0: PCI bridge to [bus 07-3b]
<6>[    3.913297] pci 0000:05:01.0:   bridge window [io  0x3000-0x3fff]
<6>[    3.913327] pci 0000:05:01.0:   bridge window [mem 
0xc4000000-0xd9efffff]
<6>[    3.913356] pci 0000:05:01.0:   bridge window [mem 
0xa0000000-0xc1ffffff 64bit pref]
<6>[    3.913396] pci 0000:05:02.0: PCI bridge to [bus 3c]
<6>[    3.913487] pci 0000:05:02.0:   bridge window [mem 
0xd9f00000-0xd9ffffff]
<6>[    3.913525] pci 0000:04:00.0: PCI bridge to [bus 05-3c]
<6>[    3.913548] pci 0000:04:00.0:   bridge window [io  0x3000-0x3fff]
<6>[    3.913578] pci 0000:04:00.0:   bridge window [mem 
0xc4000000-0xda0fffff]
<6>[    3.913611] pci 0000:04:00.0:   bridge window [mem 
0xa0000000-0xc1ffffff 64bit pref]
<6>[    3.913738] pci 0000:00:1d.0: PCI bridge to [bus 04-3c]
<6>[    3.913760] pci 0000:00:1d.0:   bridge window [io  0x3000-0x4fff]
<6>[    3.913788] pci 0000:00:1d.0:   bridge window [mem 
0xc4000000-0xda0fffff]
<6>[    3.913816] pci 0000:00:1d.0:   bridge window [mem 
0xa0000000-0xc1ffffff 64bit pref]
<6>[    3.913850] pci 0000:00:1d.2: PCI bridge to [bus 3d]
<6>[    3.913931] pci 0000:00:1d.2:   bridge window [mem 
0xdc000000-0xdc0fffff]
<6>[    3.914047] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
<6>[    3.914071] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
<6>[    3.914095] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000fffff 
window]
<6>[    3.914119] pci_bus 0000:00: resource 7 [mem 0x7f800000-0xf7ffffff 
window]
<6>[    3.914162] pci_bus 0000:00: resource 8 [mem 0xfd000000-0xfe7fffff 
window]
<6>[    3.914191] pci_bus 0000:01: resource 0 [io  0x2000-0x2fff]
<6>[    3.914212] pci_bus 0000:01: resource 1 [mem 
0x7f800000-0x7f9fffff]
<6>[    3.914235] pci_bus 0000:01: resource 2 [mem 0x7fa00000-0x7fbfffff 
64bit pref]
<6>[    3.914302] pci_bus 0000:02: resource 1 [mem 
0xdc200000-0xdc2fffff]
<6>[    3.914355] pci_bus 0000:03: resource 1 [mem 
0xdc100000-0xdc1fffff]
<6>[    3.914380] pci_bus 0000:04: resource 0 [io  0x3000-0x4fff]
<6>[    3.914402] pci_bus 0000:04: resource 1 [mem 
0xc4000000-0xda0fffff]
<6>[    3.914425] pci_bus 0000:04: resource 2 [mem 0xa0000000-0xc1ffffff 
64bit pref]
<6>[    3.914451] pci_bus 0000:05: resource 0 [io  0x3000-0x3fff]
<6>[    3.914505] pci_bus 0000:05: resource 1 [mem 
0xc4000000-0xda0fffff]
<6>[    3.914527] pci_bus 0000:05: resource 2 [mem 0xa0000000-0xc1ffffff 
64bit pref]
<6>[    3.914552] pci_bus 0000:06: resource 1 [mem 
0xda000000-0xda0fffff]
<6>[    3.914575] pci_bus 0000:07: resource 0 [io  0x3000-0x3fff]
<6>[    3.914597] pci_bus 0000:07: resource 1 [mem 
0xc4000000-0xd9efffff]
<6>[    3.914619] pci_bus 0000:07: resource 2 [mem 0xa0000000-0xc1ffffff 
64bit pref]
<6>[    3.914666] pci_bus 0000:3c: resource 1 [mem 
0xd9f00000-0xd9ffffff]
<6>[    3.914689] pci_bus 0000:3d: resource 1 [mem 
0xdc000000-0xdc0fffff]
<6>[    3.927487] pci 0000:04:00.0: enabling device (0002 -> 0003)
<6>[    3.930723] PCI: CLS 128 bytes, default 64
<6>[    3.931133] pci 0000:00:1f.1: [8086:9d20] type 00 class 0x058000 
conventional PCI endpoint
<6>[    3.931236] pci 0000:00:1f.1: BAR 0 [mem 0xfd000000-0xfdffffff 
64bit]
<6>[    3.933884] DMAR: No ATSR found
<6>[    3.933966] DMAR: No SATC found
<6>[    3.933980] DMAR: IOMMU feature fl1gp_support inconsistent
<6>[    3.934045] DMAR: IOMMU feature pgsel_inv inconsistent
<6>[    3.934059] DMAR: IOMMU feature nwfs inconsistent
<6>[    3.934073] DMAR: IOMMU feature pasid inconsistent
<6>[    3.934087] DMAR: IOMMU feature eafs inconsistent
<6>[    3.934101] DMAR: IOMMU feature prs inconsistent
<6>[    3.934114] DMAR: IOMMU feature nest inconsistent
<6>[    3.934128] DMAR: IOMMU feature mts inconsistent
<6>[    3.934142] DMAR: IOMMU feature sc_support inconsistent
<6>[    3.934196] DMAR: IOMMU feature dev_iotlb_support inconsistent
<6>[    3.934212] DMAR: dmar0: Using Queued invalidation
<6>[    3.934374] DMAR: dmar1: Using Queued invalidation
<6>[    3.936510] Trying to unpack rootfs image as initramfs...
<6>[    3.938287] pci 0000:00:02.0: Adding to iommu group 0
<6>[    3.946227] pci 0000:00:00.0: Adding to iommu group 1
<6>[    3.946457] pci 0000:00:04.0: Adding to iommu group 2
<6>[    3.946830] pci 0000:00:08.0: Adding to iommu group 3
<6>[    3.947379] pci 0000:00:14.0: Adding to iommu group 4
<6>[    3.947749] pci 0000:00:14.2: Adding to iommu group 4
<6>[    3.948201] pci 0000:00:16.0: Adding to iommu group 5
<6>[    3.948766] pci 0000:00:1c.0: Adding to iommu group 6
<6>[    3.949081] pci 0000:00:1c.4: Adding to iommu group 7
<6>[    3.949356] pci 0000:00:1c.6: Adding to iommu group 8
<6>[    3.949718] pci 0000:00:1d.0: Adding to iommu group 9
<6>[    3.949998] pci 0000:00:1d.2: Adding to iommu group 10
<6>[    3.951445] pci 0000:00:1f.0: Adding to iommu group 11
<6>[    3.951739] pci 0000:00:1f.2: Adding to iommu group 11
<6>[    3.952069] pci 0000:00:1f.3: Adding to iommu group 11
<6>[    3.952399] pci 0000:00:1f.4: Adding to iommu group 11
<6>[    3.952740] pci 0000:00:1f.6: Adding to iommu group 11
<6>[    3.953011] pci 0000:02:00.0: Adding to iommu group 12
<6>[    3.953362] pci 0000:03:00.0: Adding to iommu group 13
<6>[    3.953634] pci 0000:04:00.0: Adding to iommu group 14
<6>[    3.954009] pci 0000:05:00.0: Adding to iommu group 15
<6>[    3.954488] pci 0000:05:01.0: Adding to iommu group 16
<6>[    3.954774] pci 0000:05:02.0: Adding to iommu group 17
<6>[    3.954916] pci 0000:06:00.0: Adding to iommu group 15
<6>[    3.954999] pci 0000:3c:00.0: Adding to iommu group 17
<6>[    3.955402] pci 0000:3d:00.0: Adding to iommu group 18
<6>[    3.967483] DMAR: Intel(R) Virtualization Technology for Directed 
I/O
<6>[    3.967503] PCI-DMA: Using software bounce buffering for IO 
(SWIOTLB)
<6>[    3.967516] software IO TLB: mapped [mem 
0x000000006faac000-0x0000000073aac000] (64MB)
<5>[    3.978329] Initialise system trusted keyrings
<5>[    3.979264] Key type blacklist registered
<6>[    3.979695] workingset: timestamp_bits=42 max_order=22 
bucket_order=0
<5>[    3.982684] integrity: Platform Keyring initialized
<5>[    3.982721] integrity: Machine keyring initialized
<5>[    3.982735] Allocating IMA blacklist keyring.
<5>[    4.513991] Key type asymmetric registered
<5>[    4.514072] Asymmetric key parser 'x509' registered
<6>[    4.981177] tsc: Refined TSC clocksource calibration: 1992.000 MHz
<6>[    4.981251] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 
0x396d519840e, max_idle_ns: 881590569543 ns
<6>[    4.987411] clocksource: Switched to clocksource tsc
<6>[    8.314726] Freeing initrd memory: 110876K
<6>[    8.362011] Block layer SCSI generic (bsg) driver version 0.4 
loaded (major 245)
<6>[    8.363032] io scheduler bfq registered
<6>[    8.379985] pcieport 0000:00:1c.0: PME: Signaling with IRQ 122
<6>[    8.380622] pcieport 0000:00:1c.0: pciehp: Slot #0 AttnBtn- 
PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ 
IbPresDis- LLActRep+
<6>[    8.385977] pcieport 0000:00:1c.4: PME: Signaling with IRQ 123
<6>[    8.389906] pcieport 0000:00:1c.6: PME: Signaling with IRQ 124
<6>[    8.391960] pcieport 0000:00:1d.0: PME: Signaling with IRQ 125
<6>[    8.392331] pcieport 0000:00:1d.0: pciehp: Slot #8 AttnBtn- 
PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ 
IbPresDis- LLActRep+
<6>[    8.397160] pcieport 0000:00:1d.2: PME: Signaling with IRQ 126
<6>[    8.399930] pcieport 0000:05:01.0: enabling device (0002 -> 0003)
<6>[    8.401629] pcieport 0000:05:01.0: pciehp: Slot #1 AttnBtn- 
PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ 
IbPresDis- LLActRep+
<6>[    8.405468] shpchp: Standard Hot Plug PCI Controller Driver 
version: 0.4
<6>[    8.428740] Serial: 8250/16550 driver, 32 ports, IRQ sharing 
enabled
<4>[    8.485918] hpet_acpi_add: no address or irqs in _CRS
<6>[    8.489097] tpm_tis STM7304:00: 2.0 TPM (device-id 0x0, rev-id 78)
<6>[    8.765486] ACPI: bus type drm_connector registered
<6>[    8.768794] platform eisa.0: Probing EISA bus 0
<4>[    8.768828] platform eisa.0: EISA: Cannot allocate resource for 
mainboard
<4>[    8.768851] platform eisa.0: Cannot allocate resource for EISA 
slot 1
<4>[    8.768935] platform eisa.0: Cannot allocate resource for EISA 
slot 2
<4>[    8.768956] platform eisa.0: Cannot allocate resource for EISA 
slot 3
<4>[    8.768978] platform eisa.0: Cannot allocate resource for EISA 
slot 4
<4>[    8.769051] platform eisa.0: Cannot allocate resource for EISA 
slot 5
<4>[    8.769072] platform eisa.0: Cannot allocate resource for EISA 
slot 6
<4>[    8.769094] platform eisa.0: Cannot allocate resource for EISA 
slot 7
<4>[    8.769115] platform eisa.0: Cannot allocate resource for EISA 
slot 8
<6>[    8.769135] platform eisa.0: EISA: Detected 0 cards
<6>[    8.769300] intel_pstate: Intel P-state driver initializing
<6>[    8.773692] intel_pstate: HWP enabled
<6>[    8.773826] ledtrig-cpu: registered to indicate activity on CPUs
<6>[    8.780399] [drm] Initialized simpledrm 1.0.0 20200625 for 
simple-framebuffer.0 on minor 0
<6>[    8.792410] fbcon: Deferring console take-over
<6>[    8.792436] simple-framebuffer simple-framebuffer.0: [drm] fb0: 
simpledrmdrmfb frame buffer device
<6>[    8.796673] NET: Registered PF_INET6 protocol family
<6>[    8.821418] Segment Routing with IPv6
<6>[    8.821426] RPL Segment Routing with IPv6
<6>[    8.821497] In-situ OAM (IOAM) with IPv6
<7>[    8.822115] start plist test
<7>[    8.855152] end plist test
<4>[    8.857963] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
<6>[    8.858259] microcode: Current revision: 0x000000e0
<6>[    8.861671] IPI shorthand broadcast: enabled
<6>[    8.901691] sched_clock: Marking stable (8883370435, 
17636901)->(9218381437, -317374101)
<6>[    8.902449] Timer migration: 1 hierarchy levels; 8 children per 
group; 1 crossnode level
<6>[    9.077222] registered taskstats version 1
<5>[    9.119228] Loading compiled-in X.509 certificates
<5>[   10.066474] Loaded X.509 cert 'Build time autogenerated kernel 
key: XXX'
<5>[   10.077335] Loaded X.509 cert 'Build time autogenerated kernel 
key: XXX'
<6>[   10.228174] zswap: loaded using pool lzo/zsmalloc
<6>[   10.228698] Demotion targets for Node 0: null
<5>[   10.229311] Key type .fscrypt registered
<5>[   10.229320] Key type fscrypt-provisioning registered
<5>[   10.230186] Key type big_key registered
<6>[   10.298088] cryptd: max_cpu_qlen set to 1000
<6>[   10.527725] AVX2 version of gcm_enc/dec engaged.
<6>[   10.528515] AES CTR mode by8 optimization enabled
<5>[   11.189568] Key type encrypted registered
<5>[   11.190702] Loading compiled-in module X.509 certificates
<5>[   11.199824] Loaded X.509 cert 'Build time autogenerated kernel 
key: XXX'
<6>[   11.199885] ima: Allocated hash algorithm: sha256
<6>[   11.388213] ima: No architecture policies found
<6>[   11.388587] evm: Initialising EVM extended attributes:
<6>[   11.388593] evm: security.selinux
<6>[   11.388599] evm: security.SMACK64
<6>[   11.388605] evm: security.SMACK64EXEC
<6>[   11.388654] evm: security.SMACK64TRANSMUTE
<6>[   11.388660] evm: security.SMACK64MMAP
<6>[   11.388666] evm: security.apparmor
<6>[   11.388671] evm: security.ima
<6>[   11.388677] evm: security.capability
<6>[   11.388683] evm: HMAC attrs: 0x1
<6>[   13.185400] PM:   Magic number: 12:40:436
<6>[   13.643002] clk: Disabling unused clocks
<6>[   13.643215] PM: genpd: Disabling unused power domains
<6>[   13.653950] Freeing unused decrypted memory: 2028K
<6>[   13.660967] Freeing unused kernel image (initmem) memory: 6732K
<6>[   13.662488] Write protecting the kernel read-only data: 40960k
<6>[   13.669380] Freeing unused kernel image (rodata/data gap) memory: 
1536K
<6>[   13.844251] x86/mm: Checked W+X mappings: passed, no W+X pages 
found.
<6>[   13.844262] rodata_test: all tests were successful
<6>[   13.844268] x86/mm: Checking user space page tables
<6>[   14.007582] x86/mm: Checked W+X mappings: passed, no W+X pages 
found.
<6>[   14.007749] Run /init as init process
<7>[   14.007756]   with arguments:
<7>[   14.007763]     /init
<7>[   14.007770]   with environment:
<7>[   14.007856]     HOME=/
<7>[   14.007862]     TERM=linux
<30>[   14.749139] dracut: Gentoo-2.15
<3>[   15.247699] 
==================================================================
<6>[   15.247754] fbcon: Taking over console
<3>[   15.247779] BUG: KCSAN: data-race in _find_next_and_bit+0x44/0x120

<3>[   15.247848] race at unknown origin, with read to 
0xffffffff9b119d80 of 8 bytes by interrupt on cpu 2:
<4>[   15.247907]  _find_next_and_bit+0x44/0x120
<4>[   15.247924]  sched_balance_trigger+0x196/0x6b0
<4>[   15.247943]  update_process_times+0x99/0xd0
<4>[   15.247957]  tick_nohz_handler+0x101/0x240
<4>[   15.247972]  __hrtimer_run_queues+0x12c/0x670
<4>[   15.247987]  hrtimer_interrupt+0x1c6/0x3b0
<4>[   15.248002]  __sysvec_apic_timer_interrupt+0xa4/0x2a0
<4>[   15.248023]  sysvec_apic_timer_interrupt+0x87/0xc0
<4>[   15.248040]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
<4>[   15.248061]  lock_acquire+0xec/0x2d0
<4>[   15.248074]  do_wp_page+0x649/0x1f80
<4>[   15.248092]  __handle_mm_fault+0x11b5/0x19b0
<4>[   15.248107]  handle_mm_fault+0x314/0x6c0
<4>[   15.248122]  do_user_addr_fault+0x1f9/0x6c0
<4>[   15.248137]  exc_page_fault+0x86/0x270
<4>[   15.248151]  asm_exc_page_fault+0x26/0x30

<4>[   15.248187] 2 locks held by init/310:
<4>[   15.248197]  #0: ffff8e5a247c5bb8 
(&vma->vm_lock->lock){++++}-{3:3}, at: lock_vma_under_rcu+0x165/0x5e0
<4>[   15.248239]  #1: ffffffff9a2839a0 
(mmu_notifier_invalidate_range_start){+.+.}-{0:0}, at: 
do_wp_page+0x634/0x1f80
<4>[   15.248285] irq event stamp: 2276
<4>[   15.248292] hardirqs last  enabled at (2275): [<ffffffff9784e0df>] 
mem_cgroup_commit_charge+0x10f/0x310
<4>[   15.248310] hardirqs last disabled at (2276): [<ffffffff9882a57e>] 
sysvec_apic_timer_interrupt+0xe/0xc0
<4>[   15.248327] softirqs last  enabled at (2096): [<ffffffff9725f1b7>] 
fpu_clone+0x227/0x760
<4>[   15.248344] softirqs last disabled at (2094): [<ffffffff9725f175>] 
fpu_clone+0x1e5/0x760

<3>[   15.248382] value changed: 0x000000000000000b -> 
0x0000000000000009

<3>[   15.248443] Reported by Kernel Concurrency Sanitizer on:
<4>[   15.248479] CPU: 2 PID: 310 Comm: init Not tainted 
6.10.0-rc1-kcsan-gcc8ed4d0a848 #1 
c26748db4f4a3ce4a9ac87919620b9e720a797cd
<4>[   15.248497] Hardware name: LENOVO 20L5CTO1WW/20L5CTO1WW, BIOS 
N24ET61W (1.36 ) 10/13/2020
<3>[   15.248507] 
==================================================================
<6>[   15.259082] Console: switching to colour frame buffer device 
213x65
<6>[   16.272450] device-mapper: uevent: version 1.0.3
<6>[   16.273350] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) 
initialised: dm-devel@lists.linux.dev
<6>[   18.409611] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] 
at 0x60,0x64 irq 1,12
<6>[   18.421243] serio: i8042 KBD port at 0x60,0x64 irq 1
<6>[   18.421472] serio: i8042 AUX port at 0x60,0x64 irq 12
<6>[   19.588639] ACPI: battery: Slot [BAT0] (battery present)
<6>[   19.632963] ACPI: battery: Slot [BAT1] (battery present)
<6>[   19.838451] ACPI: bus type USB registered
<6>[   19.838713] usbcore: registered new interface driver usbfs
<6>[   19.839041] usbcore: registered new interface driver hub
<6>[   19.839123] usbcore: registered new device driver usb
<6>[   19.963282] e1000e: Intel(R) PRO/1000 Network Driver
<6>[   19.963293] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
<6>[   19.965445] e1000e 0000:00:1f.6: Interrupt Throttling Rate 
(ints/sec) turned off
<6>[   20.524256] ACPI: bus type thunderbolt registered
<3>[   20.530290] 
==================================================================
<3>[   20.530909] BUG: KCSAN: data-race in qi_submit_sync+0x504/0x900

<3>[   20.531575] race at unknown origin, with read to 
0xffff8e584026f954 of 4 bytes by task 439 on cpu 3:
<4>[   20.532333]  qi_submit_sync+0x504/0x900
<4>[   20.532347]  modify_irte.isra.0+0x191/0x2c0
<4>[   20.532359]  intel_ir_reconfigure_irte+0xd7/0x370
<4>[   20.532370]  intel_ir_set_affinity+0x6f/0xa0
<4>[   20.532382]  msi_domain_set_affinity+0x89/0x1b0
<4>[   20.532397]  irq_do_set_affinity+0x2cd/0x350
<4>[   20.532412]  irq_setup_affinity+0x188/0x280
<4>[   20.532427]  irq_startup+0x1e4/0x200
<4>[   20.532438]  __setup_irq+0xc5f/0xd50
<4>[   20.532453]  request_threaded_irq+0x16e/0x220
<4>[   20.532468]  tb_ring_alloc+0x58d/0x820 [thunderbolt]
<4>[   20.532781]  tb_ring_alloc_tx+0x21/0x40 [thunderbolt]
<4>[   20.533081]  tb_ctl_alloc+0x17d/0x300 [thunderbolt]
<4>[   20.533382]  tb_domain_alloc+0xfb/0x1f0 [thunderbolt]
<4>[   20.533691]  icm_probe+0x23/0x8c0 [thunderbolt]
<4>[   20.534024]  nhi_probe+0x5e0/0x820 [thunderbolt]
<4>[   20.534337]  local_pci_probe+0x78/0xe0
<4>[   20.534351]  pci_device_probe+0x140/0x3d0
<4>[   20.534366]  really_probe+0x14a/0x4b0
<4>[   20.534380]  __driver_probe_device+0xca/0x1b0
<4>[   20.534394]  driver_probe_device+0x60/0x150
<4>[   20.534409]  __driver_attach+0x11f/0x2b0
<4>[   20.534423]  bus_for_each_dev+0xa4/0x100
<4>[   20.534435]  driver_attach+0x2b/0x40
<4>[   20.534448]  bus_add_driver+0x1e9/0x300
<4>[   20.534460]  driver_register+0xdc/0x180
<4>[   20.534476]  __pci_register_driver+0xf3/0x110
<4>[   20.534489]  nhi_init+0x60/0xff0 [thunderbolt]
<4>[   20.534817]  do_one_initcall+0x95/0x4d0
<4>[   20.534836]  do_init_module+0x166/0x3d0
<4>[   20.534852]  load_module+0x3233/0x35e0
<4>[   20.534869]  __do_sys_init_module+0x1f4/0x230
<4>[   20.534887]  __x64_sys_init_module+0x42/0x60
<4>[   20.534905]  x64_sys_call+0xffe/0x2140
<4>[   20.534917]  do_syscall_64+0x90/0x180
<4>[   20.534928]  entry_SYSCALL_64_after_hwframe+0x76/0x7e

<4>[   20.535111] 7 locks held by (udev-worker)/439:
<4>[   20.535120]  #0: ffff8e59b07571b0 (&dev->mutex){....}-{3:3}, at: 
__driver_attach+0x114/0x2b0
<4>[   20.535159]  #1: ffff8e58ffcba2e8 
(&desc->request_mutex){+.+.}-{3:3}, at: __setup_irq+0x16e/0xd50
<4>[   20.535198]  #2: ffff8e58ffcba130 
(&irq_desc_lock_class){-.-.}-{2:2}, at: __setup_irq+0x1c9/0xd50
<4>[   20.535238]  #3: ffffffff9a1a7218 (mask_lock){....}-{2:2}, at: 
irq_setup_affinity+0x8c/0x280
<4>[   20.535277]  #4: ffffffff9a1a7258 (tmp_mask_lock){....}-{2:2}, at: 
irq_do_set_affinity+0x73/0x350
<4>[   20.535314]  #5: ffffffff9a32b318 (irq_2_ir_lock){....}-{2:2}, at: 
modify_irte.isra.0+0x45/0x2c0
<4>[   20.535347]  #6: ffff8e5840262978 (&qi->q_lock){....}-{2:2}, at: 
qi_submit_sync+0x110/0x900
<4>[   20.535382] irq event stamp: 17107
<4>[   20.535389] hardirqs last  enabled at (17106): 
[<ffffffff98851f58>] _raw_spin_unlock_irq+0x28/0x50
<4>[   20.535413] hardirqs last disabled at (17107): 
[<ffffffff98851c92>] _raw_spin_lock_irqsave+0x62/0x70
<4>[   20.535432] softirqs last  enabled at (14501): 
[<ffffffff9763ecaf>] btf_alloc_id+0x5f/0x150
<4>[   20.535445] softirqs last disabled at (14499): 
[<ffffffff9763ec72>] btf_alloc_id+0x22/0x150

<3>[   20.535619] value changed: 0x00000001 -> 0x00000002

<3>[   20.536222] Reported by Kernel Concurrency Sanitizer on:
<4>[   20.536697] CPU: 3 PID: 439 Comm: (udev-worker) Not tainted 
6.10.0-rc1-kcsan-gcc8ed4d0a848 #1 
c26748db4f4a3ce4a9ac87919620b9e720a797cd
<4>[   20.536714] Hardware name: LENOVO 20L5CTO1WW/20L5CTO1WW, BIOS 
N24ET61W (1.36 ) 10/13/2020
<3>[   20.536724] 
==================================================================
<6>[   20.761912] input: AT Translated Set 2 keyboard as 
/devices/platform/i8042/serio0/input/input0
<6>[   20.763527] e1000e 0000:00:1f.6 0000:00:1f.6 (uninitialized): 
registered PHC clock
<6>[   20.769118] xhci_hcd 0000:00:14.0: xHCI Host Controller
<6>[   20.770145] xhci_hcd 0000:00:14.0: new USB bus registered, 
assigned bus number 1
<6>[   20.772909] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci 
version 0x100 quirks 0x0000000081109810
<6>[   20.871206] xhci_hcd 0000:00:14.0: xHCI Host Controller
<6>[   20.871238] xhci_hcd 0000:00:14.0: new USB bus registered, 
assigned bus number 2
<6>[   20.871297] xhci_hcd 0000:00:14.0: Host supports USB 3.0 
SuperSpeed
<6>[   20.873101] usb usb1: New USB device found, idVendor=1d6b, 
idProduct=0002, bcdDevice= 6.10
<6>[   20.873134] usb usb1: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
<6>[   20.873147] usb usb1: Product: xHCI Host Controller
<6>[   20.873238] usb usb1: Manufacturer: Linux 
6.10.0-rc1-kcsan-gcc8ed4d0a848 xhci-hcd
<6>[   20.873249] usb usb1: SerialNumber: 0000:00:14.0
<6>[   20.879358] e1000e 0000:00:1f.6 eth0: (PCI Express:2.5GT/s:Width 
x1) xx:xx:xx:xx:xx:xx
<6>[   20.879375] e1000e 0000:00:1f.6 eth0: Intel(R) PRO/1000 Network 
Connection
<6>[   20.879626] e1000e 0000:00:1f.6 eth0: MAC: 12, PHY: 12, PBA No: 
1000FF-0FF
<6>[   20.903245] hub 1-0:1.0: USB hub found
<6>[   20.904586] hub 1-0:1.0: 12 ports detected
<6>[   20.946205] usb usb2: New USB device found, idVendor=1d6b, 
idProduct=0003, bcdDevice= 6.10
<6>[   20.946300] usb usb2: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
<6>[   20.946312] usb usb2: Product: xHCI Host Controller
<6>[   20.946323] usb usb2: Manufacturer: Linux 
6.10.0-rc1-kcsan-gcc8ed4d0a848 xhci-hcd
<6>[   20.946335] usb usb2: SerialNumber: 0000:00:14.0
<6>[   20.948266] hub 2-0:1.0: USB hub found
<6>[   20.948328] hub 2-0:1.0: 6 ports detected
<6>[   20.969129] xhci_hcd 0000:3c:00.0: xHCI Host Controller
<6>[   20.969275] xhci_hcd 0000:3c:00.0: new USB bus registered, 
assigned bus number 3
<6>[   20.973667] xhci_hcd 0000:3c:00.0: hcc params 0x200077c1 hci 
version 0x110 quirks 0x0000000200009810
<6>[   20.979474] xhci_hcd 0000:3c:00.0: xHCI Host Controller
<6>[   20.979500] xhci_hcd 0000:3c:00.0: new USB bus registered, 
assigned bus number 4
<6>[   20.979519] xhci_hcd 0000:3c:00.0: Host supports USB 3.1 Enhanced 
SuperSpeed
<6>[   20.979887] usb usb3: New USB device found, idVendor=1d6b, 
idProduct=0002, bcdDevice= 6.10
<6>[   20.979902] usb usb3: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
<6>[   20.979914] usb usb3: Product: xHCI Host Controller
<6>[   20.979925] usb usb3: Manufacturer: Linux 
6.10.0-rc1-kcsan-gcc8ed4d0a848 xhci-hcd
<6>[   20.979937] usb usb3: SerialNumber: 0000:3c:00.0
<6>[   20.991520] hub 3-0:1.0: USB hub found
<6>[   20.991577] hub 3-0:1.0: 2 ports detected
<6>[   21.005954] usb usb4: New USB device found, idVendor=1d6b, 
idProduct=0003, bcdDevice= 6.10
<6>[   21.005970] usb usb4: New USB device strings: Mfr=3, Product=2, 
SerialNumber=1
<6>[   21.005982] usb usb4: Product: xHCI Host Controller
<6>[   21.006003] usb usb4: Manufacturer: Linux 
6.10.0-rc1-kcsan-gcc8ed4d0a848 xhci-hcd
<6>[   21.006015] usb usb4: SerialNumber: 0000:3c:00.0
<6>[   21.017575] hub 4-0:1.0: USB hub found
<6>[   21.017861] hub 4-0:1.0: 2 ports detected
<6>[   21.211063] usb 1-1: new full-speed USB device number 2 using 
xhci_hcd
<6>[   21.356110] usb 1-1: New USB device found, idVendor=1532, 
idProduct=005c, bcdDevice= 2.00
<6>[   21.356163] usb 1-1: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
<6>[   21.356175] usb 1-1: Product: Razer DeathAdder Elite
<6>[   21.356229] usb 1-1: Manufacturer: Razer
<6>[   21.481363] usb 2-3: new SuperSpeed USB device number 2 using 
xhci_hcd
<6>[   21.519093] usb 2-3: New USB device found, idVendor=0bda, 
idProduct=0316, bcdDevice= 2.04
<6>[   21.519110] usb 2-3: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
<6>[   21.519122] usb 2-3: Product: USB3.0-CRW
<6>[   21.519132] usb 2-3: Manufacturer: Generic
<6>[   21.519142] usb 2-3: SerialNumber: XXX
<6>[   21.637312] usb 1-2: new full-speed USB device number 3 using 
xhci_hcd
<6>[   21.713721] typec port0: bound usb3-port1 (ops connector_ops 
[usbcore])
<6>[   21.714725] typec port0: bound usb4-port1 (ops connector_ops 
[usbcore])
<6>[   21.744672] nvme nvme0: pci function 0000:3d:00.0
<6>[   21.767858] nvme nvme0: D3 entry latency set to 8 seconds
<6>[   21.817307] nvme nvme0: allocated 64 MiB host memory buffer.
<6>[   21.860465] usb 1-2: New USB device found, idVendor=1852, 
idProduct=7022, bcdDevice= 0.01
<6>[   21.860481] usb 1-2: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
<6>[   21.860492] usb 1-2: Product: DigiHug USB Audio
<6>[   21.860502] usb 1-2: Manufacturer: FiiO
<6>[   21.906429] nvme nvme0: 4/0/0 default/read/poll queues
<6>[   21.974612]  nvme0n1: p1 p2
<6>[   22.004381] usb 1-5: new high-speed USB device number 4 using 
xhci_hcd
<6>[   22.169673] usb 1-5: New USB device found, idVendor=5986, 
idProduct=1141, bcdDevice=37.59
<6>[   22.169693] usb 1-5: New USB device strings: Mfr=3, Product=1, 
SerialNumber=2
<6>[   22.169777] usb 1-5: Product: Integrated IR Camera
<6>[   22.169788] usb 1-5: Manufacturer: Bison
<6>[   22.169798] usb 1-5: SerialNumber: XXX
<6>[   22.307743] usb 1-7: new full-speed USB device number 5 using 
xhci_hcd
<6>[   22.453452] usb 1-7: New USB device found, idVendor=8087, 
idProduct=0a2b, bcdDevice= 0.10
<6>[   22.453468] usb 1-7: New USB device strings: Mfr=0, Product=0, 
SerialNumber=0
<6>[   22.597728] usb 1-8: new high-speed USB device number 6 using 
xhci_hcd
<6>[   22.756219] usb 1-8: New USB device found, idVendor=5986, 
idProduct=2113, bcdDevice=54.22
<6>[   22.756235] usb 1-8: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
<6>[   22.756247] usb 1-8: Product: Integrated Camera
<6>[   22.756257] usb 1-8: Manufacturer: SunplusIT Inc
<6>[   23.124079] hid: raw HID events driver (C) Jiri Kosina
<6>[   23.458983] usbcore: registered new interface driver usbhid
<6>[   23.458996] usbhid: USB HID core driver
<6>[   23.492247] input: Razer Razer DeathAdder Elite as 
/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.0/0003:1532:005C.0001/input/input2
<6>[   23.494342] hid-generic 0003:1532:005C.0001: input,hidraw0: USB 
HID v1.11 Mouse [Razer Razer DeathAdder Elite] on 
usb-0000:00:14.0-1/input0
<6>[   23.497227] input: Razer Razer DeathAdder Elite Keyboard as 
/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:1532:005C.0002/input/input3
<6>[   23.558572] input: Razer Razer DeathAdder Elite as 
/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:1532:005C.0002/input/input4
<6>[   23.561548] hid-generic 0003:1532:005C.0002: input,hidraw1: USB 
HID v1.11 Keyboard [Razer Razer DeathAdder Elite] on 
usb-0000:00:14.0-1/input1
<6>[   23.562791] input: Razer Razer DeathAdder Elite as 
/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.2/0003:1532:005C.0003/input/input5
<6>[   23.618192] hid-generic 0003:1532:005C.0003: input,hidraw2: USB 
HID v1.11 Keyboard [Razer Razer DeathAdder Elite] on 
usb-0000:00:14.0-1/input2
<6>[   23.619188] input: FiiO DigiHug USB Audio as 
/devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.0/0003:1852:7022.0004/input/input6
<5>[   23.671909] SCSI subsystem initialized
<6>[   23.678219] hid-generic 0003:1852:7022.0004: input,hidraw3: USB 
HID v1.00 Device [FiiO DigiHug USB Audio] on usb-0000:00:14.0-2/input0
<4>[   23.787659] workqueue: acpi_os_execute_deferred hogged CPU for 
 >10256us 4 times, consider switching to WQ_UNBOUND
<6>[   23.848142] usb-storage 2-3:1.0: USB Mass Storage device detected
<6>[   23.853873] scsi host0: usb-storage 2-3:1.0
<6>[   23.857248] usbcore: registered new interface driver usb-storage
<6>[   23.937592] usbcore: registered new interface driver uas
<4>[   23.964310] workqueue: acpi_os_execute_deferred hogged CPU for 
 >10256us 5 times, consider switching to WQ_UNBOUND
<4>[   24.854320] workqueue: acpi_os_execute_deferred hogged CPU for 
 >10256us 7 times, consider switching to WQ_UNBOUND
<5>[   24.881180] scsi 0:0:0:0: Direct-Access     Generic- SD/MMC        
    1.00 PQ: 0 ANSI: 6
<5>[   25.045737] sd 0:0:0:0: [sda] Media removed, stopped polling
<5>[   25.048564] sd 0:0:0:0: [sda] Attached SCSI removable disk
<6>[   25.173715] typec port1: bound usb3-port2 (ops connector_ops 
[usbcore])
<6>[   25.174508] typec port1: bound usb4-port2 (ops connector_ops 
[usbcore])
<6>[   43.197486] i915 0000:00:02.0: enabling device (0006 -> 0007)
<6>[   43.203748] i915 0000:00:02.0: [drm] VT-d active for gfx access
<6>[   43.231866] Console: switching to colour dummy device 80x25
<6>[   43.280565] i915 0000:00:02.0: [drm] Using Transparent Hugepages
<6>[   43.287947] i915 0000:00:02.0: vgaarb: VGA decodes changed: 
olddecodes=io+mem,decodes=io+mem:owns=mem
<6>[   43.292463] i915 0000:00:02.0: [drm] Finished loading DMC firmware 
i915/kbl_dmc_ver1_04.bin (v1.4)
<6>[   44.009811] i915 0000:00:02.0: [drm] Reducing the compressed 
framebuffer size. This may lead to less power savings than a 
non-reduced-size. Try to increase stolen memory size if available in 
BIOS.
<6>[   44.035472] [drm] Initialized i915 1.6.0 20230929 for 0000:00:02.0 
on minor 1
<6>[   44.068891] ACPI: video: Video Device [GFX0] (multi-head: yes  
rom: no  post: no)
<6>[   44.072570] input: Video Bus as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input7
<6>[   44.159548] fbcon: i915drmfb (fb0) is primary device
<6>[   44.172521] Console: switching to colour frame buffer device 
213x65
<6>[   44.261370] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer 
device
<5>[   44.801867] Key type trusted registered
<30>[   44.916764] dracut: open --type luks /dev/nvme0n1p2 luks-XXX
<6>[   74.252433] SGI XFS with ACLs, security attributes, realtime, 
scrub, repair, quota, no debug enabled
<5>[   74.346464] XFS (dm-0): Mounting V5 Filesystem XXX
<3>[   74.419334] 
==================================================================
<3>[   74.419557] BUG: KCSAN: data-race in qi_submit_sync+0x562/0x900

<3>[   74.419787] race at unknown origin, with read to 
0xffff8e584026f9ac of 4 bytes by task 519 on cpu 0:
<4>[   74.420023]  qi_submit_sync+0x562/0x900
<4>[   74.420034]  qi_flush_iotlb+0xda/0x110
<4>[   74.420045]  cache_tag_flush_range+0x4a0/0x4b0
<4>[   74.420056]  intel_iommu_tlb_sync+0x56/0x80
<4>[   74.420070]  __iommu_dma_unmap+0x475/0x560
<4>[   74.420083]  iommu_dma_unmap_page+0x4c/0x100
<4>[   74.420097]  dma_unmap_page_attrs+0x7b/0x320
<4>[   74.420108]  nvme_unmap_data+0x231/0x2b0 [nvme]
<4>[   74.420144]  nvme_pci_complete_batch+0x14b/0x1a0 [nvme]
<4>[   74.420180]  nvme_irq+0x92/0xa0 [nvme]
<4>[   74.420214]  irq_forced_thread_fn+0x5e/0x100
<4>[   74.420226]  irq_thread+0x22b/0x2f0
<4>[   74.420238]  kthread+0x17c/0x1b0
<4>[   74.420246]  ret_from_fork+0x31/0x50
<4>[   74.420259]  ret_from_fork_asm+0x1a/0x30

<4>[   74.420328] 2 locks held by irq/158-nvme0q1/519:
<4>[   74.420335]  #0: ffff8e587ecc12d8 
(&domain->cache_lock){..-.}-{2:2}, at: cache_tag_flush_range+0x74/0x4b0
<4>[   74.420365]  #1: ffff8e5840262978 (&qi->q_lock){..-.}-{2:2}, at: 
qi_submit_sync+0x110/0x900
<4>[   74.420392] irq event stamp: 2479
<4>[   74.420397] hardirqs last  enabled at (2477): [<ffffffff97375f27>] 
finish_task_switch.isra.0+0xc7/0x2e0
<4>[   74.420409] hardirqs last disabled at (2479): [<ffffffff973f5d0a>] 
irq_forced_thread_fn+0xca/0x100
<4>[   74.420422] softirqs last  enabled at (2472): [<ffffffff973144e7>] 
do_softirq+0x47/0xc0
<4>[   74.420432] softirqs last disabled at (2478): [<ffffffff973f5c61>] 
irq_forced_thread_fn+0x21/0x100

<3>[   74.420505] value changed: 0x00000001 -> 0x00000002

<3>[   74.420708] Reported by Kernel Concurrency Sanitizer on:
<4>[   74.420865] CPU: 0 PID: 519 Comm: irq/158-nvme0q1 Not tainted 
6.10.0-rc1-kcsan-gcc8ed4d0a848 #1 
c26748db4f4a3ce4a9ac87919620b9e720a797cd
<4>[   74.420877] Hardware name: LENOVO 20L5CTO1WW/20L5CTO1WW, BIOS 
N24ET61W (1.36 ) 10/13/2020
<3>[   74.420884] 
==================================================================
<6>[   74.423562] XFS (dm-0): Ending clean mount
<30>[   74.697385] dracut: Remounting /dev/disk/by-uuid/XXX with -o 
defaults,rw
<30>[   74.817974] dracut: Mounted root filesystem /dev/mapper/luks-XXX
<30>[   75.419872] dracut: Switching root
<3>[   75.969401] 
==================================================================
<3>[   75.969407] BUG: KCSAN: data-race in qi_submit_sync+0x504/0x900

<3>[   75.969424] race at unknown origin, with read to 
0xffff8e584026fb9c of 4 bytes by task 522 on cpu 2:
<4>[   75.969432]  qi_submit_sync+0x504/0x900
<4>[   75.969444]  qi_flush_iotlb+0xda/0x110
<4>[   75.969455]  cache_tag_flush_range+0x4a0/0x4b0
<4>[   75.969467]  intel_iommu_tlb_sync+0x56/0x80
<4>[   75.969482]  __iommu_dma_unmap+0x475/0x560
<4>[   75.969497]  iommu_dma_unmap_sg+0x115/0x1e0
<4>[   75.969511]  dma_unmap_sg_attrs+0x60/0xc0
<4>[   75.969521]  nvme_unmap_data+0xb8/0x2b0 [nvme]
<4>[   75.969564]  nvme_pci_complete_batch+0x14b/0x1a0 [nvme]
<4>[   75.969606]  nvme_irq+0x92/0xa0 [nvme]
<4>[   75.969647]  irq_forced_thread_fn+0x5e/0x100
<4>[   75.969660]  irq_thread+0x22b/0x2f0
<4>[   75.969672]  kthread+0x17c/0x1b0
<4>[   75.969680]  ret_from_fork+0x31/0x50
<4>[   75.969694]  ret_from_fork_asm+0x1a/0x30

<4>[   75.969707] 2 locks held by irq/160-nvme0q3/522:
<4>[   75.969713]  #0: ffff8e587ecc12d8 
(&domain->cache_lock){..-.}-{2:2}, at: cache_tag_flush_range+0x74/0x4b0
<4>[   75.969742]  #1: ffff8e5840262978 (&qi->q_lock){..-.}-{2:2}, at: 
qi_submit_sync+0x110/0x900
<4>[   75.969768] irq event stamp: 5289
<4>[   75.969772] hardirqs last  enabled at (5287): [<ffffffff97375f27>] 
finish_task_switch.isra.0+0xc7/0x2e0
<4>[   75.969784] hardirqs last disabled at (5289): [<ffffffff973f5d0a>] 
irq_forced_thread_fn+0xca/0x100
<4>[   75.969798] softirqs last  enabled at (5282): [<ffffffff973144e7>] 
do_softirq+0x47/0xc0
<4>[   75.969809] softirqs last disabled at (5288): [<ffffffff973f5c61>] 
irq_forced_thread_fn+0x21/0x100

<3>[   75.969826] value changed: 0x00000001 -> 0x00000002

<3>[   75.969834] Reported by Kernel Concurrency Sanitizer on:
<4>[   75.969838] CPU: 2 PID: 522 Comm: irq/160-nvme0q3 Not tainted 
6.10.0-rc1-kcsan-gcc8ed4d0a848 #1 
c26748db4f4a3ce4a9ac87919620b9e720a797cd
<4>[   75.969851] Hardware name: LENOVO 20L5CTO1WW/20L5CTO1WW, BIOS 
N24ET61W (1.36 ) 10/13/2020
<3>[   75.969857] 
==================================================================
<6>[   78.121210] input: Sleep Button as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input9
<6>[   78.420112] rtc_cmos 00:04: RTC can wake from S4
<6>[   78.425419] rtc_cmos 00:04: registered as rtc0
<6>[   78.425671] rtc_cmos 00:04: setting system clock to 
2024-06-01T15:28:00 UTC (1717255680)
<6>[   78.425908] rtc_cmos 00:04: alarms up to one month, y3k, 242 bytes 
nvram
<6>[   78.463012] ACPI: button: Sleep Button [SLPB]
<6>[   78.464715] input: Lid Switch as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input10
<6>[   78.467247] ACPI: button: Lid Switch [LID]
<6>[   78.468797] input: Power Button as 
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input11
<6>[   78.474520] ACPI: button: Power Button [PWRF]
<6>[   78.591672] ACPI: AC: AC Adapter [AC] (on-line)
<6>[   78.631017] Consider using thermal netlink events interface
<6>[   78.939727] mc: Linux media interface: v0.10
<6>[   79.089785] thermal LNXTHERM:00: registered as thermal_zone3
<6>[   79.089802] ACPI: thermal: Thermal Zone [THM0] (67 C)
<6>[   79.127098] mei_me 0000:00:16.0: enabling device (0004 -> 0006)
<6>[   79.130043] iosm 0000:02:00.0: enabling device (0000 -> 0002)
<6>[   79.259505] wwan wwan0: port wwan0xmmrpc0 attached
<6>[   79.878004] videodev: Linux video capture interface: v2.00
<6>[   80.326692] usb 1-5: Found UVC 1.50 device Integrated IR Camera 
(5986:1141)
<6>[   80.337126] usb 1-8: Found UVC 1.00 device Integrated Camera 
(5986:2113)
<6>[   80.359246] usbcore: registered new interface driver uvcvideo
<6>[   80.501803] pstore: Using crash dump compression: deflate
<6>[   80.501993] pstore: Registered efi_pstore as persistent store 
backend
<6>[   81.107496] e1000e 0000:00:1f.6 enp0s31f6: renamed from eth0
<3>[   82.727610] 
==================================================================
<3>[   82.727616] BUG: KCSAN: data-race in _find_next_and_bit+0x44/0x120

<3>[   82.727632] race at unknown origin, with read to 
0xffffffff9b119d80 of 8 bytes by interrupt on cpu 1:
<4>[   82.727640]  _find_next_and_bit+0x44/0x120
<4>[   82.727651]  sched_balance_trigger+0x196/0x6b0
<4>[   82.727664]  update_process_times+0x99/0xd0
<4>[   82.727673]  tick_nohz_handler+0x101/0x240
<4>[   82.727684]  __hrtimer_run_queues+0x12c/0x670
<4>[   82.727693]  hrtimer_interrupt+0x1c6/0x3b0
<4>[   82.727703]  __sysvec_apic_timer_interrupt+0xa4/0x2a0
<4>[   82.727718]  sysvec_apic_timer_interrupt+0x87/0xc0
<4>[   82.727728]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
<4>[   82.727743]  mutex_spin_on_owner+0x107/0x180
<4>[   82.727753]  __mutex_lock+0x977/0xca0
<4>[   82.727762]  mutex_lock_nested+0x1b/0x30
<4>[   82.727772]  ftrace_free_mem+0x51/0x480
<4>[   82.727784]  do_init_module+0x1ea/0x3d0
<4>[   82.727797]  load_module+0x3233/0x35e0
<4>[   82.727810]  __do_sys_init_module+0x1f4/0x230
<4>[   82.727823]  __x64_sys_init_module+0x42/0x60
<4>[   82.727837]  x64_sys_call+0xffe/0x2140
<4>[   82.727846]  do_syscall_64+0x90/0x180
<4>[   82.727854]  entry_SYSCALL_64_after_hwframe+0x76/0x7e

<4>[   82.727871] 1 lock held by (udev-worker)/936:
<4>[   82.727877]  #0: ffffffff9a23a028 (ftrace_lock){+.+.}-{3:3}, at: 
ftrace_free_mem+0x51/0x480
<4>[   82.727905] irq event stamp: 18547
<4>[   82.727909] hardirqs last  enabled at (18546): 
[<ffffffff98843538>] __schedule+0x1438/0x1940
<4>[   82.727919] hardirqs last disabled at (18547): 
[<ffffffff9882a57e>] sysvec_apic_timer_interrupt+0xe/0xc0
<4>[   82.727931] softirqs last  enabled at (17695): 
[<ffffffff9763ecaf>] btf_alloc_id+0x5f/0x150
<4>[   82.727941] softirqs last disabled at (17693): 
[<ffffffff9763ec72>] btf_alloc_id+0x22/0x150

<3>[   82.727954] value changed: 0x0000000000000001 -> 
0x0000000000000000

<3>[   82.727963] Reported by Kernel Concurrency Sanitizer on:
<4>[   82.727967] CPU: 1 PID: 936 Comm: (udev-worker) Not tainted 
6.10.0-rc1-kcsan-gcc8ed4d0a848 #1 
c26748db4f4a3ce4a9ac87919620b9e720a797cd
<4>[   82.727979] Hardware name: LENOVO 20L5CTO1WW/20L5CTO1WW, BIOS 
N24ET61W (1.36 ) 10/13/2020
<3>[   82.727986] 
==================================================================
<6>[   83.175946] wwan wwan0: port wwan0at0 attached
<6>[   83.181644] wwan wwan0: port wwan0at1 attached
<6>[   83.325925] intel_rapl_common: Found RAPL domain package
<6>[   83.326005] intel_rapl_common: Found RAPL domain core
<6>[   83.326014] intel_rapl_common: Found RAPL domain uncore
<6>[   83.326023] intel_rapl_common: Found RAPL domain dram
<6>[   83.326033] intel_rapl_common: Found RAPL domain psys
<4>[   83.330848] resource: resource sanity check: requesting [mem 
0x00000000fed10000-0x00000000fed15fff], which spans more than pnp 00:08 
[mem 0xfed10000-0xfed13fff]
<4>[   83.330907] caller snb_uncore_imc_init_box+0xd2/0x140 
[intel_uncore] mapping multiple BARs
<6>[   83.336009] Bluetooth: Core ver 2.22
<6>[   83.336293] NET: Registered PF_BLUETOOTH protocol family
<6>[   83.336302] Bluetooth: HCI device and connection manager 
initialized
<6>[   83.336460] Bluetooth: HCI socket layer initialized
<6>[   83.336474] Bluetooth: L2CAP socket layer initialized
<6>[   83.336669] Bluetooth: SCO socket layer initialized
<6>[   83.339104] Non-volatile memory driver v1.3
<6>[   83.340255] input: PC Speaker as 
/devices/platform/pcspkr/input/input13
<5>[   83.400673] cfg80211: Loading compiled-in X.509 certificates for 
regulatory database
<5>[   83.666408] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
<5>[   83.668887] Loaded X.509 cert 'wens: 
61c038651aabdcf94bd0ac7ff06c7248db18c600'
<6>[   83.674667] proc_thermal 0000:00:04.0: enabling device (0000 -> 
0002)
<6>[   83.823705] thinkpad_acpi: ThinkPad ACPI Extras v0.26
<6>[   83.823718] thinkpad_acpi: http://ibm-acpi.sf.net/
<6>[   83.823725] thinkpad_acpi: ThinkPad BIOS N24ET61W (1.36 ), EC 
N24HT36W
<6>[   83.823736] thinkpad_acpi: Lenovo ThinkPad T480, model 20L5CTO1WW
<6>[   83.977643] thinkpad_acpi: radio switch found; radios are enabled
<6>[   83.977781] thinkpad_acpi: This ThinkPad has standard ACPI 
backlight brightness control, supported by the ACPI video driver
<5>[   83.977790] thinkpad_acpi: Disabling thinkpad-acpi brightness 
events by default...
<6>[   84.021709] thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: 
radio is unblocked
<6>[   84.027983] thinkpad_acpi: rfkill switch tpacpi_wwan_sw: radio is 
unblocked
<6>[   84.158521] thinkpad_acpi: battery 2 registered (start 75, stop 
80, behaviours: 0x7)
<6>[   84.210807] thinkpad_acpi: battery 1 registered (start 75, stop 
80, behaviours: 0x7)
<6>[   84.210885] ACPI: battery: new extension: ThinkPad Battery 
Extension
<6>[   84.248272] input: ThinkPad Extra Buttons as 
/devices/platform/thinkpad_acpi/input/input14
<6>[   84.315243] intel_rapl_common: Found RAPL domain package
<6>[   84.315255] intel_rapl_common: Found RAPL domain dram
<6>[   84.450303] i801_smbus 0000:00:1f.4: enabling device (0000 -> 
0003)
<6>[   84.451794] i801_smbus 0000:00:1f.4: SPD Write Disable is set
<6>[   84.452084] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
<6>[   84.518001] i2c i2c-6: Successfully instantiated SPD at 0x50
<6>[   84.518861] i2c i2c-6: Successfully instantiated SPD at 0x51
<6>[   84.633693] psmouse serio1: synaptics: queried max coordinates: x 
[..5676], y [..4690]
<6>[   84.654671] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 
655360 ms ovfl timer
<6>[   84.654684] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
<6>[   84.654693] RAPL PMU: hw unit of domain package 2^-14 Joules
<6>[   84.654701] RAPL PMU: hw unit of domain dram 2^-14 Joules
<6>[   84.654710] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
<6>[   84.654718] RAPL PMU: hw unit of domain psys 2^-14 Joules
<6>[   84.668589] psmouse serio1: synaptics: queried min coordinates: x 
[1266..], y [1162..]
<6>[   84.668674] psmouse serio1: synaptics: Trying to set up SMBus 
access
<6>[   84.675400] mei_hdcp 
0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04: bound 0000:00:02.0 
(ops i915_hdcp_ops [i915])
<6>[   84.735852] Intel(R) Wireless WiFi driver for Linux
<6>[   86.524232] usbcore: registered new interface driver btusb
<6>[   86.641101] ee1004 6-0050: 512 byte EE1004-compliant SPD EEPROM, 
read-only
<6>[   86.642166] ee1004 6-0051: 512 byte EE1004-compliant SPD EEPROM, 
read-only
<6>[   86.684278] Bluetooth: hci0: Firmware revision 0.1 build 19 week 
44 2021
<6>[   86.686725] iwlwifi 0000:03:00.0: Detected crf-id 0xbadcafe, 
cnv-id 0x10 wfpm id 0x80000000
<6>[   86.686918] iwlwifi 0000:03:00.0: PCI dev 24fd/0010, rev=0x230, 
rfid=0xd55555d5
<3>[   86.690872] Bluetooth: hci0: Reading supported features failed 
(-16)
<6>[   86.707865] Bluetooth: hci0: Error reading debug features
<4>[   86.795331] Bluetooth: hci0: HCI LE Coded PHY feature bit is set, 
but its usage is not supported.
<3>[   86.808485] 
==================================================================
<3>[   86.815514] BUG: KCSAN: data-race in qi_submit_sync+0x504/0x900

<3>[   86.829404] race at unknown origin, with read to 
0xffff8e584026fa1c of 4 bytes by interrupt on cpu 0:
<4>[   86.836613]  qi_submit_sync+0x504/0x900
<4>[   86.836627]  qi_flush_iotlb+0xda/0x110
<4>[   86.836642]  cache_tag_flush_range+0x4a0/0x4b0
<4>[   86.836658]  intel_iommu_tlb_sync+0x56/0x80
<4>[   86.836675]  __iommu_dma_unmap+0x475/0x560
<4>[   86.836692]  iommu_dma_unmap_page+0x4c/0x100
<4>[   86.836708]  dma_unmap_page_attrs+0x7b/0x320
<4>[   86.836723]  usb_hcd_unmap_urb_for_dma+0xe1/0x220 [usbcore]
<4>[   86.837006]  xhci_unmap_urb_for_dma+0x73/0x230 [xhci_hcd]
<4>[   86.837256]  __usb_hcd_giveback_urb+0x9f/0x200 [usbcore]
<4>[   86.837564]  usb_giveback_urb_bh+0x1b3/0x2a0 [usbcore]
<4>[   86.837862]  process_one_work+0x528/0xaf0
<4>[   86.837877]  bh_worker+0x420/0x4a0
<4>[   86.837891]  workqueue_softirq_action+0xc3/0x100
<4>[   86.837909]  tasklet_hi_action+0x22/0x60
<4>[   86.837921]  handle_softirqs+0xdc/0x4c0
<4>[   86.837933]  do_softirq+0x47/0xc0
<4>[   86.837945]  __local_bh_enable_ip+0xbd/0xe0
<4>[   86.837957]  irq_forced_thread_fn+0xb1/0x100
<4>[   86.837972]  irq_thread+0x22b/0x2f0
<4>[   86.837987]  kthread+0x17c/0x1b0
<4>[   86.837997]  ret_from_fork+0x31/0x50
<4>[   86.838014]  ret_from_fork_asm+0x1a/0x30

<4>[   86.845200] 4 locks held by irq/147-xhci_hc/494:
<4>[   86.845210]  #0: ffff8e584018bb48 
((wq_completion)events_bh_highpri){+.-.}-{0:0}, at: 
process_one_work+0x965/0xaf0
<4>[   86.845249]  #1: ffffa9a900003e78 
((work_completion)(&bh->bh)){+.-.}-{0:0}, at: 
process_one_work+0x4ba/0xaf0
<4>[   86.845287]  #2: ffff8e587ecbaed8 
(&domain->cache_lock){..-.}-{2:2}, at: cache_tag_flush_range+0x74/0x4b0
<4>[   86.845323]  #3: ffff8e5840262978 (&qi->q_lock){..-.}-{2:2}, at: 
qi_submit_sync+0x110/0x900
<4>[   86.845359] irq event stamp: 12013
<4>[   86.845366] hardirqs last  enabled at (12012): 
[<ffffffff98851f58>] _raw_spin_unlock_irq+0x28/0x50
<4>[   86.845385] hardirqs last disabled at (12013): 
[<ffffffff98851c92>] _raw_spin_lock_irqsave+0x62/0x70
<4>[   86.845404] softirqs last  enabled at (12006): 
[<ffffffff973f5cec>] irq_forced_thread_fn+0xac/0x100
<4>[   86.845420] softirqs last disabled at (12007): 
[<ffffffff973144e7>] do_softirq+0x47/0xc0

<3>[   86.852541] value changed: 0x00000001 -> 0x00000002

<3>[   86.867092] Reported by Kernel Concurrency Sanitizer on:
<4>[   86.874754] CPU: 0 PID: 494 Comm: irq/147-xhci_hc Not tainted 
6.10.0-rc1-kcsan-gcc8ed4d0a848 #1 
c26748db4f4a3ce4a9ac87919620b9e720a797cd
<4>[   86.874770] Hardware name: LENOVO 20L5CTO1WW/20L5CTO1WW, BIOS 
N24ET61W (1.36 ) 10/13/2020
<3>[   86.874779] 
==================================================================
<6>[   86.883619] iwlwifi 0000:03:00.0: loaded firmware version 
36.ca7b901d.0 8265-36.ucode op_mode iwlmvm
<6>[   88.597171] iTCO_vendor_support: vendor-support=0
<6>[   88.617330] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops 
i915_audio_component_bind_ops [i915])
<6>[   88.671695] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device 
(Version=4, TCOBASE=0x0400)
<6>[   89.771750] iTCO_wdt iTCO_wdt: initialized. heartbeat=30 sec 
(nowayout=1)
<6>[   89.780498] usbcore: registered new interface driver snd-usb-audio
<4>[   90.519933] snd_hda_intel 0000:00:1f.3: azx_get_response timeout, 
switching to polling mode: last cmd=0x000f0000
<6>[   90.586786] rmi4_smbus 6-002c: registering SMbus-connected sensor
<6>[   90.748881] rmi4_f01 rmi4-00.fn01: found RMI device, manufacturer: 
Synaptics, product: TM3276-022, fw id: 2700066
<6>[   91.107954] snd_hda_codec_realtek hdaudioC0D0: autoconfig for 
ALC257: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
<6>[   91.107977] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=0 
(0x0/0x0/0x0/0x0/0x0)
<6>[   91.107992] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=1 
(0x21/0x0/0x0/0x0/0x0)
<6>[   91.108086] snd_hda_codec_realtek hdaudioC0D0:    mono: 
mono_out=0x0
<6>[   91.108097] snd_hda_codec_realtek hdaudioC0D0:    inputs:
<6>[   91.182710] input: Synaptics TM3276-022 as 
/devices/pci0000:00/0000:00:1f.4/i2c-6/6-002c/rmi4-00/input/input15
<6>[   91.194238] serio: RMI4 PS/2 pass-through port at rmi4-00.fn03
<6>[   91.632045] psmouse serio2: trackpoint: IBM TrackPoint firmware: 
0x0e, buttons: 3/3
<6>[   91.669665] input: TPPS/2 IBM TrackPoint as 
/devices/pci0000:00/0000:00:1f.4/i2c-6/6-002c/rmi4-00/rmi4-00.fn03/serio2/input/input17
<6>[   93.048682] input: HDA Intel PCH Headphone as 
/devices/pci0000:00/0000:00:1f.3/sound/card0/input16
<6>[   93.051416] input: HDA Intel PCH HDMI/DP,pcm=3 as 
/devices/pci0000:00/0000:00:1f.3/sound/card0/input18
<6>[   93.052319] input: HDA Intel PCH HDMI/DP,pcm=7 as 
/devices/pci0000:00/0000:00:1f.3/sound/card0/input19
<6>[   93.054177] input: HDA Intel PCH HDMI/DP,pcm=8 as 
/devices/pci0000:00/0000:00:1f.3/sound/card0/input20
<6>[   93.074623] intel_tcc_cooling: Programmable TCC Offset detected
<6>[   93.361888] intel_pmc_core intel_pmc_core.0:  initialized
<6>[   94.593195] iwlwifi 0000:03:00.0: Detected Intel(R) Dual Band 
Wireless AC 8265, REV=0x230
<4>[   94.597175] thermal thermal_zone6: failed to read out thermal zone 
(-61)
<6>[   94.677721] iwlwifi 0000:03:00.0: base HW address: 
18:56:80:04:e9:df, OTP minor version: 0x0
<7>[   94.771176] ieee80211 phy0: Selected rate control algorithm 
'iwl-mvm-rs'
<6>[   99.297875] Adding 17266684k swap on /swapfile.  Priority:-2 
extents:1 across:17266684k SS
<3>[   99.504686] 
==================================================================
<3>[   99.504693] BUG: KCSAN: data-race in qi_submit_sync+0x562/0x900

<3>[   99.504711] race at unknown origin, with read to 
0xffff8e584026f904 of 4 bytes by task 522 on cpu 2:
<4>[   99.504720]  qi_submit_sync+0x562/0x900
<4>[   99.504732]  qi_flush_iotlb+0xda/0x110
<4>[   99.504743]  cache_tag_flush_range+0x4a0/0x4b0
<4>[   99.504756]  intel_iommu_tlb_sync+0x56/0x80
<4>[   99.504771]  __iommu_dma_unmap+0x475/0x560
<4>[   99.504786]  iommu_dma_unmap_sg+0x115/0x1e0
<4>[   99.504801]  dma_unmap_sg_attrs+0x60/0xc0
<4>[   99.504812]  nvme_unmap_data+0xb8/0x2b0 [nvme]
<4>[   99.504858]  nvme_pci_complete_batch+0x14b/0x1a0 [nvme]
<4>[   99.504903]  nvme_irq+0x92/0xa0 [nvme]
<4>[   99.504946]  irq_forced_thread_fn+0x5e/0x100
<4>[   99.504959]  irq_thread+0x22b/0x2f0
<4>[   99.504972]  kthread+0x17c/0x1b0
<4>[   99.504979]  ret_from_fork+0x31/0x50
<4>[   99.504994]  ret_from_fork_asm+0x1a/0x30

<4>[   99.505007] 2 locks held by irq/160-nvme0q3/522:
<4>[   99.505013]  #0: ffff8e587ecc12d8 
(&domain->cache_lock){..-.}-{2:2}, at: cache_tag_flush_range+0x74/0x4b0
<4>[   99.505043]  #1: ffff8e5840262978 (&qi->q_lock){..-.}-{2:2}, at: 
qi_submit_sync+0x110/0x900
<4>[   99.505070] irq event stamp: 11401
<4>[   99.505074] hardirqs last  enabled at (11399): 
[<ffffffff97375f27>] finish_task_switch.isra.0+0xc7/0x2e0
<4>[   99.505087] hardirqs last disabled at (11401): 
[<ffffffff973f5d0a>] irq_forced_thread_fn+0xca/0x100
<4>[   99.505102] softirqs last  enabled at (11394): 
[<ffffffff973144e7>] do_softirq+0x47/0xc0
<4>[   99.505113] softirqs last disabled at (11400): 
[<ffffffff973f5c61>] irq_forced_thread_fn+0x21/0x100

<3>[   99.505131] value changed: 0x00000001 -> 0x00000002

<3>[   99.505139] Reported by Kernel Concurrency Sanitizer on:
<4>[   99.505144] CPU: 2 PID: 522 Comm: irq/160-nvme0q3 Not tainted 
6.10.0-rc1-kcsan-gcc8ed4d0a848 #1 
c26748db4f4a3ce4a9ac87919620b9e720a797cd
<4>[   99.505158] Hardware name: LENOVO 20L5CTO1WW/20L5CTO1WW, BIOS 
N24ET61W (1.36 ) 10/13/2020
<3>[   99.505165] 
==================================================================
<6>[   99.601335] 8021q: 802.1Q VLAN Support v1.8
<6>[  104.200380] e1000e 0000:00:1f.6 enp0s31f6: NIC Link is Up 1000 
Mbps Full Duplex, Flow Control: None
<6>[  104.342564] NET: Registered PF_PACKET protocol family
<3>[  105.220153] 
==================================================================
<3>[  105.247661] BUG: KCSAN: data-race in qi_submit_sync+0x562/0x900

<3>[  105.302400] race at unknown origin, with read to 
0xffff8e584026f88c of 4 bytes by interrupt on cpu 1:
<4>[  105.327859]  qi_submit_sync+0x562/0x900
<4>[  105.327901]  qi_flush_iotlb+0xda/0x110
<4>[  105.327940]  cache_tag_flush_range+0x4a0/0x4b0
<4>[  105.327984]  intel_iommu_tlb_sync+0x56/0x80
<4>[  105.328032]  __iommu_dma_unmap+0x475/0x560
<4>[  105.328081]  iommu_dma_unmap_page+0x4c/0x100
<4>[  105.328129]  dma_unmap_page_attrs+0x7b/0x320
<4>[  105.328169]  e1000_put_txbuf.isra.0+0x6a/0xf0 [e1000e]
<4>[  105.328691]  e1000_clean_tx_irq+0x1de/0x630 [e1000e]
<4>[  105.329211]  e1000e_poll+0xcc/0x550 [e1000e]
<4>[  105.329731]  __napi_poll.constprop.0+0x61/0x210
<4>[  105.329778]  net_rx_action+0x513/0xae0
<4>[  105.329820]  handle_softirqs+0xdc/0x4c0
<4>[  105.329854]  do_softirq+0x47/0xc0
<4>[  105.329886]  __local_bh_enable_ip+0xbd/0xe0
<4>[  105.329921]  irq_forced_thread_fn+0xb1/0x100
<4>[  105.329964]  irq_thread+0x22b/0x2f0
<4>[  105.330008]  kthread+0x17c/0x1b0
<4>[  105.330037]  ret_from_fork+0x31/0x50
<4>[  105.330084]  ret_from_fork_asm+0x1a/0x30

<4>[  105.354986] 2 locks held by irq/130-enp0s31/1101:
<4>[  105.355013]  #0: ffff8e587ecba0d8 
(&domain->cache_lock){..-.}-{2:2}, at: cache_tag_flush_range+0x74/0x4b0
<4>[  105.355128]  #1: ffff8e5840262978 (&qi->q_lock){..-.}-{2:2}, at: 
qi_submit_sync+0x110/0x900
<4>[  105.355233] irq event stamp: 269
<4>[  105.355252] hardirqs last  enabled at (268): [<ffffffff98308043>] 
net_rx_action+0x1e3/0xae0
<4>[  105.355300] hardirqs last disabled at (269): [<ffffffff98851c92>] 
_raw_spin_lock_irqsave+0x62/0x70
<4>[  105.355355] softirqs last  enabled at (264): [<ffffffff973f5cec>] 
irq_forced_thread_fn+0xac/0x100
<4>[  105.355403] softirqs last disabled at (265): [<ffffffff973144e7>] 
do_softirq+0x47/0xc0

<3>[  105.379419] value changed: 0x00000001 -> 0x00000002

<3>[  105.428044] Reported by Kernel Concurrency Sanitizer on:
<4>[  105.452403] CPU: 1 PID: 1101 Comm: irq/130-enp0s31 Not tainted 
6.10.0-rc1-kcsan-gcc8ed4d0a848 #1 
c26748db4f4a3ce4a9ac87919620b9e720a797cd
<4>[  105.452449] Hardware name: LENOVO 20L5CTO1WW/20L5CTO1WW, BIOS 
N24ET61W (1.36 ) 10/13/2020
<3>[  105.452474] 
==================================================================
<3>[  124.702996] 
==================================================================
<3>[  124.703009] BUG: KCSAN: data-race in qi_submit_sync+0x562/0x900

<3>[  124.703031] race at unknown origin, with read to 
0xffff8e584026d62c of 4 bytes by task 13 on cpu 0:
<4>[  124.703042]  qi_submit_sync+0x562/0x900
<4>[  124.703053]  qi_flush_iotlb+0xda/0x110
<4>[  124.703063]  cache_tag_flush_range+0x3ee/0x4b0
<4>[  124.703075]  intel_iommu_tlb_sync+0x56/0x80
<4>[  124.703089]  __iommu_dma_unmap+0x475/0x560
<4>[  124.703102]  iommu_dma_unmap_sg+0x115/0x1e0
<4>[  124.703115]  dma_unmap_sg_attrs+0x60/0xc0
<4>[  124.703125]  i915_gem_gtt_finish_pages+0x8f/0xc0 [i915]
<4>[  124.704639]  i915_gem_object_put_pages_internal+0x16/0x90 [i915]
<4>[  124.706143]  __i915_gem_object_put_pages+0xab/0x110 [i915]
<4>[  124.707653]  __i915_gem_object_pages_fini+0x227/0x340 [i915]
<4>[  124.709162]  i915_gem_flush_free_objects+0xc0/0xe0 [i915]
<4>[  124.710673]  __i915_gem_free_work+0x15/0x20 [i915]
<4>[  124.712183]  process_one_work+0x528/0xaf0
<4>[  124.712195]  worker_thread+0x3fd/0x750
<4>[  124.712205]  kthread+0x17c/0x1b0
<4>[  124.712214]  ret_from_fork+0x31/0x50
<4>[  124.712227]  ret_from_fork_asm+0x1a/0x30

<4>[  124.712242] 4 locks held by kworker/u16:1/13:
<4>[  124.712249]  #0: ffff8e5906d03948 
((wq_completion)i915){+.+.}-{0:0}, at: process_one_work+0x965/0xaf0
<4>[  124.712279]  #1: ffffa9a9000f3e00 
((work_completion)(&i915->mm.free_work)){+.+.}-{0:0}, at: 
process_one_work+0x4ba/0xaf0
<4>[  124.712308]  #2: ffff8e587ecba6d8 
(&domain->cache_lock){..-.}-{2:2}, at: cache_tag_flush_range+0x74/0x4b0
<4>[  124.712337]  #3: ffff8e5840262258 (&qi->q_lock){..-.}-{2:2}, at: 
qi_submit_sync+0x598/0x900
<4>[  124.712364] irq event stamp: 36151
<4>[  124.712369] hardirqs last  enabled at (36150): 
[<ffffffff98851f58>] _raw_spin_unlock_irq+0x28/0x50
<4>[  124.712385] hardirqs last disabled at (36151): 
[<ffffffff98851c92>] _raw_spin_lock_irqsave+0x62/0x70
<4>[  124.712399] softirqs last  enabled at (34379): 
[<ffffffff9860a504>] __fib6_clean_all+0xb4/0x1f0
<4>[  124.712414] softirqs last disabled at (34373): 
[<ffffffff9860a4e3>] __fib6_clean_all+0x93/0x1f0

<3>[  124.712435] value changed: 0x00000001 -> 0x00000002

<3>[  124.712450] Reported by Kernel Concurrency Sanitizer on:
<4>[  124.712458] CPU: 0 PID: 13 Comm: kworker/u16:1 Not tainted 
6.10.0-rc1-kcsan-gcc8ed4d0a848 #1 
c26748db4f4a3ce4a9ac87919620b9e720a797cd
<4>[  124.712470] Hardware name: LENOVO 20L5CTO1WW/20L5CTO1WW, BIOS 
N24ET61W (1.36 ) 10/13/2020
<4>[  124.712477] Workqueue: i915 __i915_gem_free_work [i915]
<3>[  124.714045] 
==================================================================
<3>[  126.799056] 
==================================================================
<3>[  126.799069] BUG: KCSAN: data-race in qi_submit_sync+0x5b7/0x900

<3>[  126.799092] race at unknown origin, with read to 
0xffff8e584026d744 of 4 bytes by task 13 on cpu 1:
<4>[  126.799104]  qi_submit_sync+0x5b7/0x900
<4>[  126.799116]  qi_flush_iotlb+0xda/0x110
<4>[  126.799128]  cache_tag_flush_range+0x3ee/0x4b0
<4>[  126.799141]  intel_iommu_tlb_sync+0x56/0x80
<4>[  126.799155]  __iommu_dma_unmap+0x475/0x560
<4>[  126.799170]  iommu_dma_unmap_sg+0x115/0x1e0
<4>[  126.799184]  dma_unmap_sg_attrs+0x60/0xc0
<4>[  126.799195]  i915_gem_gtt_finish_pages+0x8f/0xc0 [i915]
<4>[  126.800829]  i915_gem_object_put_pages_internal+0x16/0x90 [i915]
<4>[  126.802439]  __i915_gem_object_put_pages+0xab/0x110 [i915]
<4>[  126.804051]  __i915_gem_object_pages_fini+0x227/0x340 [i915]
<4>[  126.805661]  i915_gem_flush_free_objects+0xc0/0xe0 [i915]
<4>[  126.807286]  __i915_gem_free_work+0x15/0x20 [i915]
<4>[  126.808907]  process_one_work+0x528/0xaf0
<4>[  126.808920]  worker_thread+0x3fd/0x750
<4>[  126.808932]  kthread+0x17c/0x1b0
<4>[  126.808940]  ret_from_fork+0x31/0x50
<4>[  126.808954]  ret_from_fork_asm+0x1a/0x30

<4>[  126.808971] 4 locks held by kworker/u16:1/13:
<4>[  126.808979]  #0: ffff8e5906d03948 
((wq_completion)i915){+.+.}-{0:0}, at: process_one_work+0x965/0xaf0
<4>[  126.809011]  #1: ffffa9a9000f3e00 
((work_completion)(&i915->mm.free_work)){+.+.}-{0:0}, at: 
process_one_work+0x4ba/0xaf0
<4>[  126.809042]  #2: ffff8e587ecba6d8 
(&domain->cache_lock){..-.}-{2:2}, at: cache_tag_flush_range+0x74/0x4b0
<4>[  126.809074]  #3: ffff8e5840262258 (&qi->q_lock){..-.}-{2:2}, at: 
qi_submit_sync+0x598/0x900
<4>[  126.809103] irq event stamp: 37599
<4>[  126.809108] hardirqs last  enabled at (37598): 
[<ffffffff98851f58>] _raw_spin_unlock_irq+0x28/0x50
<4>[  126.809125] hardirqs last disabled at (37599): 
[<ffffffff98851c92>] _raw_spin_lock_irqsave+0x62/0x70
<4>[  126.809141] softirqs last  enabled at (34379): 
[<ffffffff9860a504>] __fib6_clean_all+0xb4/0x1f0
<4>[  126.809158] softirqs last disabled at (34373): 
[<ffffffff9860a4e3>] __fib6_clean_all+0x93/0x1f0

<3>[  126.809180] value changed: 0x00000001 -> 0x00000002

<3>[  126.809196] Reported by Kernel Concurrency Sanitizer on:
<4>[  126.809204] CPU: 1 PID: 13 Comm: kworker/u16:1 Not tainted 
6.10.0-rc1-kcsan-gcc8ed4d0a848 #1 
c26748db4f4a3ce4a9ac87919620b9e720a797cd
<4>[  126.809217] Hardware name: LENOVO 20L5CTO1WW/20L5CTO1WW, BIOS 
N24ET61W (1.36 ) 10/13/2020
<4>[  126.809225] Workqueue: i915 __i915_gem_free_work [i915]
<3>[  126.810858] 
==================================================================
<3>[  132.193309] 
==================================================================
<3>[  132.193323] BUG: KCSAN: data-race in qi_submit_sync+0x5b7/0x900

<3>[  132.193346] race at unknown origin, with read to 
0xffff8e584026d634 of 4 bytes by task 51 on cpu 0:
<4>[  132.193358]  qi_submit_sync+0x5b7/0x900
<4>[  132.193370]  qi_flush_iotlb+0xda/0x110
<4>[  132.193381]  cache_tag_flush_range+0x3ee/0x4b0
<4>[  132.193395]  intel_iommu_tlb_sync+0x56/0x80
<4>[  132.193410]  __iommu_dma_unmap+0x475/0x560
<4>[  132.193424]  iommu_dma_unmap_sg+0x115/0x1e0
<4>[  132.193439]  dma_unmap_sg_attrs+0x60/0xc0
<4>[  132.193449]  i915_gem_gtt_finish_pages+0x8f/0xc0 [i915]
<4>[  132.195088]  i915_gem_object_put_pages_internal+0x16/0x90 [i915]
<4>[  132.196697]  __i915_gem_object_put_pages+0xab/0x110 [i915]
<4>[  132.198309]  __i915_gem_object_pages_fini+0x227/0x340 [i915]
<4>[  132.199919]  i915_gem_flush_free_objects+0xc0/0xe0 [i915]
<4>[  132.201532]  __i915_gem_free_work+0x15/0x20 [i915]
<4>[  132.203143]  process_one_work+0x528/0xaf0
<4>[  132.203156]  worker_thread+0x3fd/0x750
<4>[  132.203168]  kthread+0x17c/0x1b0
<4>[  132.203176]  ret_from_fork+0x31/0x50
<4>[  132.203191]  ret_from_fork_asm+0x1a/0x30

<4>[  132.203208] 4 locks held by kworker/u16:4/51:
<4>[  132.203215]  #0: ffff8e5906d03948 
((wq_completion)i915){+.+.}-{0:0}, at: process_one_work+0x965/0xaf0
<4>[  132.203248]  #1: ffffa9a900247e00 
((work_completion)(&i915->mm.free_work)){+.+.}-{0:0}, at: 
process_one_work+0x4ba/0xaf0
<4>[  132.203279]  #2: ffff8e587ecba6d8 
(&domain->cache_lock){..-.}-{2:2}, at: cache_tag_flush_range+0x74/0x4b0
<4>[  132.203310]  #3: ffff8e5840262258 (&qi->q_lock){..-.}-{2:2}, at: 
qi_submit_sync+0x598/0x900
<4>[  132.203340] irq event stamp: 7498
<4>[  132.203345] hardirqs last  enabled at (7497): [<ffffffff98851f58>] 
_raw_spin_unlock_irq+0x28/0x50
<4>[  132.203362] hardirqs last disabled at (7498): [<ffffffff98851c92>] 
_raw_spin_lock_irqsave+0x62/0x70
<4>[  132.203378] softirqs last  enabled at (4500): [<ffffffff9860a504>] 
__fib6_clean_all+0xb4/0x1f0
<4>[  132.203394] softirqs last disabled at (4494): [<ffffffff9860a4e3>] 
__fib6_clean_all+0x93/0x1f0

<3>[  132.203416] value changed: 0x00000001 -> 0x00000002

<3>[  132.203432] Reported by Kernel Concurrency Sanitizer on:
<4>[  132.203440] CPU: 0 PID: 51 Comm: kworker/u16:4 Not tainted 
6.10.0-rc1-kcsan-gcc8ed4d0a848 #1 
c26748db4f4a3ce4a9ac87919620b9e720a797cd
<4>[  132.203453] Hardware name: LENOVO 20L5CTO1WW/20L5CTO1WW, BIOS 
N24ET61W (1.36 ) 10/13/2020
<4>[  132.203461] Workqueue: i915 __i915_gem_free_work [i915]
<3>[  132.205095] 
==================================================================
<3>[  132.209045] 
==================================================================
<3>[  132.209051] BUG: KCSAN: data-race in qi_submit_sync+0x562/0x900

<3>[  132.209065] race at unknown origin, with read to 
0xffff8e584026d43c of 4 bytes by task 51 on cpu 0:
<4>[  132.209072]  qi_submit_sync+0x562/0x900
<4>[  132.209081]  qi_flush_iotlb+0xda/0x110
<4>[  132.209091]  cache_tag_flush_range+0x3ee/0x4b0
<4>[  132.209102]  intel_iommu_tlb_sync+0x56/0x80
<4>[  132.209115]  __iommu_dma_unmap+0x475/0x560
<4>[  132.209127]  iommu_dma_unmap_sg+0x115/0x1e0
<4>[  132.209140]  dma_unmap_sg_attrs+0x60/0xc0
<4>[  132.209148]  i915_gem_gtt_finish_pages+0x8f/0xc0 [i915]
<4>[  132.210767]  i915_gem_object_put_pages_internal+0x16/0x90 [i915]
<4>[  132.212378]  __i915_gem_object_put_pages+0xab/0x110 [i915]
<4>[  132.213990]  __i915_gem_object_pages_fini+0x227/0x340 [i915]
<4>[  132.215600]  i915_gem_flush_free_objects+0xc0/0xe0 [i915]
<4>[  132.217210]  __i915_gem_free_work+0x15/0x20 [i915]
<4>[  132.218822]  process_one_work+0x528/0xaf0
<4>[  132.218835]  worker_thread+0x3fd/0x750
<4>[  132.218846]  kthread+0x17c/0x1b0
<4>[  132.218855]  ret_from_fork+0x31/0x50
<4>[  132.218869]  ret_from_fork_asm+0x1a/0x30

<4>[  132.218886] 4 locks held by kworker/u16:4/51:
<4>[  132.218893]  #0: ffff8e5906d03948 
((wq_completion)i915){+.+.}-{0:0}, at: process_one_work+0x965/0xaf0
<4>[  132.218925]  #1: ffffa9a900247e00 
((work_completion)(&i915->mm.free_work)){+.+.}-{0:0}, at: 
process_one_work+0x4ba/0xaf0
<4>[  132.218956]  #2: ffff8e587ecba6d8 
(&domain->cache_lock){..-.}-{2:2}, at: cache_tag_flush_range+0x74/0x4b0
<4>[  132.218987]  #3: ffff8e5840262258 (&qi->q_lock){..-.}-{2:2}, at: 
qi_submit_sync+0x598/0x900
<4>[  132.219017] irq event stamp: 7954
<4>[  132.219022] hardirqs last  enabled at (7953): [<ffffffff9742eedc>] 
__call_rcu_common+0x29c/0xaf0
<4>[  132.219036] hardirqs last disabled at (7954): [<ffffffff98851c92>] 
_raw_spin_lock_irqsave+0x62/0x70
<4>[  132.219053] softirqs last  enabled at (4500): [<ffffffff9860a504>] 
__fib6_clean_all+0xb4/0x1f0
<4>[  132.219068] softirqs last disabled at (4494): [<ffffffff9860a4e3>] 
__fib6_clean_all+0x93/0x1f0

<3>[  132.219090] value changed: 0x00000001 -> 0x00000002

<3>[  132.219106] Reported by Kernel Concurrency Sanitizer on:
<4>[  132.219114] CPU: 0 PID: 51 Comm: kworker/u16:4 Not tainted 
6.10.0-rc1-kcsan-gcc8ed4d0a848 #1 
c26748db4f4a3ce4a9ac87919620b9e720a797cd
<4>[  132.219127] Hardware name: LENOVO 20L5CTO1WW/20L5CTO1WW, BIOS 
N24ET61W (1.36 ) 10/13/2020
<4>[  132.219134] Workqueue: i915 __i915_gem_free_work [i915]
<3>[  132.220783] 
==================================================================
<3>[  132.372469] 
==================================================================
<3>[  132.372484] BUG: KCSAN: data-race in qi_submit_sync+0x504/0x900

<3>[  132.372507] race at unknown origin, with read to 
0xffff8e584026d52c of 4 bytes by task 51 on cpu 2:
<4>[  132.372519]  qi_submit_sync+0x504/0x900
<4>[  132.372531]  qi_flush_iotlb+0xda/0x110
<4>[  132.372542]  cache_tag_flush_range+0x3ee/0x4b0
<4>[  132.372555]  intel_iommu_tlb_sync+0x56/0x80
<4>[  132.372569]  __iommu_dma_unmap+0x475/0x560
<4>[  132.372584]  iommu_dma_unmap_sg+0x115/0x1e0
<4>[  132.372598]  dma_unmap_sg_attrs+0x60/0xc0
<4>[  132.372609]  i915_gem_gtt_finish_pages+0x8f/0xc0 [i915]
<4>[  132.374244]  i915_gem_object_put_pages_internal+0x16/0x90 [i915]
<4>[  132.375852]  __i915_gem_object_put_pages+0xab/0x110 [i915]
<4>[  132.377465]  __i915_gem_object_pages_fini+0x227/0x340 [i915]
<4>[  132.379076]  i915_gem_flush_free_objects+0xc0/0xe0 [i915]
<4>[  132.380686]  __i915_gem_free_work+0x15/0x20 [i915]
<4>[  132.382296]  process_one_work+0x528/0xaf0
<4>[  132.382309]  worker_thread+0x3fd/0x750
<4>[  132.382321]  kthread+0x17c/0x1b0
<4>[  132.382329]  ret_from_fork+0x31/0x50
<4>[  132.382344]  ret_from_fork_asm+0x1a/0x30

<4>[  132.382361] 4 locks held by kworker/u16:4/51:
<4>[  132.382369]  #0: ffff8e5906d03948 
((wq_completion)i915){+.+.}-{0:0}, at: process_one_work+0x965/0xaf0
<4>[  132.382401]  #1: ffffa9a900247e00 
((work_completion)(&i915->mm.free_work)){+.+.}-{0:0}, at: 
process_one_work+0x4ba/0xaf0
<4>[  132.382432]  #2: ffff8e587ecba6d8 
(&domain->cache_lock){..-.}-{2:2}, at: cache_tag_flush_range+0x74/0x4b0
<4>[  132.382464]  #3: ffff8e5840262258 (&qi->q_lock){..-.}-{2:2}, at: 
qi_submit_sync+0x110/0x900
<4>[  132.382494] irq event stamp: 10842
<4>[  132.382499] hardirqs last  enabled at (10841): 
[<ffffffff9742eedc>] __call_rcu_common+0x29c/0xaf0
<4>[  132.382513] hardirqs last disabled at (10842): 
[<ffffffff98851c92>] _raw_spin_lock_irqsave+0x62/0x70
<4>[  132.382530] softirqs last  enabled at (4500): [<ffffffff9860a504>] 
__fib6_clean_all+0xb4/0x1f0
<4>[  132.382546] softirqs last disabled at (4494): [<ffffffff9860a4e3>] 
__fib6_clean_all+0x93/0x1f0

<3>[  132.382569] value changed: 0x00000001 -> 0x00000002

<3>[  132.382585] Reported by Kernel Concurrency Sanitizer on:
<4>[  132.382593] CPU: 2 PID: 51 Comm: kworker/u16:4 Not tainted 
6.10.0-rc1-kcsan-gcc8ed4d0a848 #1 
c26748db4f4a3ce4a9ac87919620b9e720a797cd
<4>[  132.382606] Hardware name: LENOVO 20L5CTO1WW/20L5CTO1WW, BIOS 
N24ET61W (1.36 ) 10/13/2020
<4>[  132.382614] Workqueue: i915 __i915_gem_free_work [i915]
<3>[  132.384235] 
==================================================================
<3>[  148.893033] 
==================================================================
<3>[  148.893046] BUG: KCSAN: data-race in qi_submit_sync+0x5b7/0x900

<3>[  148.893069] race at unknown origin, with read to 
0xffff8e584026d70c of 4 bytes by task 51 on cpu 2:
<4>[  148.893082]  qi_submit_sync+0x5b7/0x900
<4>[  148.893093]  qi_flush_iotlb+0xda/0x110
<4>[  148.893105]  cache_tag_flush_range+0x3ee/0x4b0
<4>[  148.893139]  intel_iommu_tlb_sync+0x56/0x80
<4>[  148.893155]  __iommu_dma_unmap+0x475/0x560
<4>[  148.893187]  iommu_dma_unmap_sg+0x115/0x1e0
<4>[  148.893201]  dma_unmap_sg_attrs+0x60/0xc0
<4>[  148.893212]  i915_gem_gtt_finish_pages+0x8f/0xc0 [i915]
<4>[  148.894755]  i915_gem_object_put_pages_internal+0x16/0x90 [i915]
<4>[  148.896392]  __i915_gem_object_put_pages+0xab/0x110 [i915]
<4>[  148.897951]  __i915_gem_object_pages_fini+0x227/0x340 [i915]
<4>[  148.899569]  i915_gem_flush_free_objects+0xc0/0xe0 [i915]
<4>[  148.901096]  __i915_gem_free_work+0x15/0x20 [i915]
<4>[  148.902657]  process_one_work+0x528/0xaf0
<4>[  148.902669]  worker_thread+0x3fd/0x750
<4>[  148.902680]  kthread+0x17c/0x1b0
<4>[  148.902688]  ret_from_fork+0x31/0x50
<4>[  148.902701]  ret_from_fork_asm+0x1a/0x30

<4>[  148.902717] 4 locks held by kworker/u16:4/51:
<4>[  148.902724]  #0: ffff8e5906d03948 
((wq_completion)i915){+.+.}-{0:0}, at: process_one_work+0x965/0xaf0
<4>[  148.902755]  #1: ffffa9a900247e00 
((work_completion)(&i915->mm.free_work)){+.+.}-{0:0}, at: 
process_one_work+0x4ba/0xaf0
<4>[  148.902783]  #2: ffff8e587ecba6d8 
(&domain->cache_lock){..-.}-{2:2}, at: cache_tag_flush_range+0x74/0x4b0
<4>[  148.902812]  #3: ffff8e5840262258 (&qi->q_lock){..-.}-{2:2}, at: 
qi_submit_sync+0x598/0x900
<4>[  148.902840] irq event stamp: 21742
<4>[  148.902845] hardirqs last  enabled at (21741): 
[<ffffffff98851f58>] _raw_spin_unlock_irq+0x28/0x50
<4>[  148.902860] hardirqs last disabled at (21742): 
[<ffffffff98851c92>] _raw_spin_lock_irqsave+0x62/0x70
<4>[  148.902875] softirqs last  enabled at (4500): [<ffffffff9860a504>] 
__fib6_clean_all+0xb4/0x1f0
<4>[  148.902890] softirqs last disabled at (4494): [<ffffffff9860a4e3>] 
__fib6_clean_all+0x93/0x1f0

<3>[  148.902910] value changed: 0x00000001 -> 0x00000002

<3>[  148.902925] Reported by Kernel Concurrency Sanitizer on:
<4>[  148.902932] CPU: 2 PID: 51 Comm: kworker/u16:4 Not tainted 
6.10.0-rc1-kcsan-gcc8ed4d0a848 #1 
c26748db4f4a3ce4a9ac87919620b9e720a797cd
<4>[  148.902944] Hardware name: LENOVO 20L5CTO1WW/20L5CTO1WW, BIOS 
N24ET61W (1.36 ) 10/13/2020
<4>[  148.902952] Workqueue: i915 __i915_gem_free_work [i915]
<3>[  148.904446] 
==================================================================
<3>[  390.489455] 
==================================================================
<3>[  390.489505] BUG: KCSAN: data-race in qi_submit_sync+0x5b7/0x900

<3>[  390.489601] race at unknown origin, with read to 
0xffff8e584026d71c of 4 bytes by task 51 on cpu 2:
<4>[  390.489651]  qi_submit_sync+0x5b7/0x900
<4>[  390.489699]  qi_flush_iotlb+0xda/0x110
<4>[  390.489746]  cache_tag_flush_range+0x3ee/0x4b0
<4>[  390.489799]  intel_iommu_tlb_sync+0x56/0x80
<4>[  390.489859]  __iommu_dma_unmap+0x475/0x560
<4>[  390.489919]  iommu_dma_unmap_sg+0x115/0x1e0
<4>[  390.489979]  dma_unmap_sg_attrs+0x60/0xc0
<4>[  390.490024]  i915_gem_gtt_finish_pages+0x8f/0xc0 [i915]
<4>[  390.496450]  i915_gem_object_put_pages_internal+0x16/0x90 [i915]
<4>[  390.499613]  __i915_gem_object_put_pages+0xab/0x110 [i915]
<4>[  390.501284]  __i915_gem_object_pages_fini+0x227/0x340 [i915]
<4>[  390.502812]  i915_gem_flush_free_objects+0xc0/0xe0 [i915]
<4>[  390.504340]  __i915_gem_free_work+0x15/0x20 [i915]
<4>[  390.505914]  process_one_work+0x528/0xaf0
<4>[  390.505927]  worker_thread+0x3fd/0x750
<4>[  390.505938]  kthread+0x17c/0x1b0
<4>[  390.505946]  ret_from_fork+0x31/0x50
<4>[  390.505959]  ret_from_fork_asm+0x1a/0x30

<4>[  390.505976] 4 locks held by kworker/u16:4/51:
<4>[  390.505983]  #0: ffff8e5906d03948 
((wq_completion)i915){+.+.}-{0:0}, at: process_one_work+0x965/0xaf0
<4>[  390.506013]  #1: ffffa9a900247e00 
((work_completion)(&i915->mm.free_work)){+.+.}-{0:0}, at: 
process_one_work+0x4ba/0xaf0
<4>[  390.506042]  #2: ffff8e587ecba6d8 
(&domain->cache_lock){..-.}-{2:2}, at: cache_tag_flush_range+0x74/0x4b0
<4>[  390.506071]  #3: ffff8e5840262258 (&qi->q_lock){..-.}-{2:2}, at: 
qi_submit_sync+0x598/0x900
<4>[  390.506098] irq event stamp: 53718
<4>[  390.506103] hardirqs last  enabled at (53717): 
[<ffffffff9742eedc>] __call_rcu_common+0x29c/0xaf0
<4>[  390.506116] hardirqs last disabled at (53718): 
[<ffffffff98851c92>] _raw_spin_lock_irqsave+0x62/0x70
<4>[  390.506132] softirqs last  enabled at (42086): 
[<ffffffff985dfc0a>] addrconf_verify_rtnl+0x32a/0xcc0
<4>[  390.506143] softirqs last disabled at (42080): 
[<ffffffff985df916>] addrconf_verify_rtnl+0x36/0xcc0

<3>[  390.506161] value changed: 0x00000001 -> 0x00000002

<3>[  390.506175] Reported by Kernel Concurrency Sanitizer on:
<4>[  390.506183] CPU: 2 PID: 51 Comm: kworker/u16:4 Not tainted 
6.10.0-rc1-kcsan-gcc8ed4d0a848 #1 
c26748db4f4a3ce4a9ac87919620b9e720a797cd
<4>[  390.506195] Hardware name: LENOVO 20L5CTO1WW/20L5CTO1WW, BIOS 
N24ET61W (1.36 ) 10/13/2020
<4>[  390.506203] Workqueue: i915 __i915_gem_free_work [i915]
<3>[  390.507732] 
==================================================================

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C0CB58F0A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 09:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79CB610E6AE;
	Tue, 16 Sep 2025 07:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=9lo.re header.i=@9lo.re header.b="F5K9p3RC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch
 [109.224.244.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F47C10E044
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 23:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=9lo.re;
 s=protonmail; t=1757978552; x=1758237752;
 bh=FP0G1rYCZv88Y5ney0o0VJkpmX1aCUpxKP9h++0pfCo=;
 h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=F5K9p3RCGOXKTz4OlHyh7410POlGDxvSFQ4NzqdpX+GnXMWOMAcEJ2hOPHobqZ/JB
 KJSGkvIJMMjTP+gGgh/jzCHdYwXXjMI4/AEKh5JfoAoHXqgB0+pJOZt2WhkU12HbLu
 RcBwPPzLYQ4vXLzHebBnasA9l/fc0o3wyr3Hhx1kjAM3IRbezSwR76U+1umBrIhpJp
 sAs9y9kzWViLCL0adaboibavc9rhwLQ2ozjbZ17xVfcwba7ibEsobjuYvGza9+oeEr
 I9ko5M6dnnQBfuUbZQTPyFhwuU1V8HRapFmFZgWzfqraAg8q0VnuPFHo8mbb48/cKn
 nciLAe5C2xVIA==
Date: Mon, 15 Sep 2025 23:22:27 +0000
To: "stable@vger.kernel.org" <stable@vger.kernel.org>
From: ninelore <9l@9lo.re>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: [REGRESSION] 6.16 fae58d0155 prevents boot of google-tomato (mt8195)
Message-ID: <QwcOPAuQZfqo0I9EwUu4tVCuhXRvtfAgFZ7Hq896xRKosseOz3wvuKJFV1YLUTTTwMANMW6bZPUfLwXQPPgBFiYEzKUjMGZ5D56349pz4m8=@9lo.re>
Feedback-ID: 102649497:user:proton
X-Pm-Message-ID: 56d543a10b9a7da68f232b74507a59caefe5b057
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha512;
 boundary="------149793b4db5c990e3313c60e16447f495ea79fbb6f3b5d0dd1ef1c3bfe66fdee";
 charset=utf-8
X-Mailman-Approved-At: Tue, 16 Sep 2025 07:21:33 +0000
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------149793b4db5c990e3313c60e16447f495ea79fbb6f3b5d0dd1ef1c3bfe66fdee
Content-Type: multipart/mixed;boundary=---------------------e4078a503789c7b603013e5b74816ff0

-----------------------e4078a503789c7b603013e5b74816ff0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

Hi,

starting with the bisected commit fae58d0155a979a8c414bbc12db09dd4b2f910d0=
 ("[v2] drm/mediatek: Fix device/node reference count leaks in mtk_drm_get=
_all_drm_priv") on 6.16.y my chromebook codenamed google-tomato with the S=
oC MT8195 seems to hang while initializing drm. Kernel messages over seria=
l show CPU stalls some minutes later. I am attaching the full kernel logs =
below.

This issue is present in 6.16.7, however not in v6.17-rc6

This is my first time reporting a bug here. Please let me know if you need=
 additional information.

Thanks and kind regards

Ingo Reitz

--------

Booting Linux on physical CPU 0x0000000000 [0x412fd050]
Linux version 6.16.4 (nixbld@localhost) (aarch64-unknown-linux-gnu-gcc (GC=
C) 14.3.0, GNU ld (GNU Binutils) 2.44) #1-NixOS SMP Tue Jan  1 00:00:00 UT=
C 1980
Machine model: Acer Tomato (rev3 - 4) board
Reserved memory: created DMA memory pool at 0x0000000050000000, size 41 Mi=
B
OF: reserved mem: initialized node memory@50000000, compatible id shared-d=
ma-pool
OF: reserved mem: 0x0000000050000000..0x00000000528fffff (41984 KiB) nomap=
 non-reusable memory@50000000
Reserved memory: created DMA memory pool at 0x0000000060000000, size 13 Mi=
B
OF: reserved mem: initialized node memory@60000000, compatible id shared-d=
ma-pool
OF: reserved mem: 0x0000000060000000..0x0000000060d7ffff (13824 KiB) nomap=
 non-reusable memory@60000000
Reserved memory: created DMA memory pool at 0x0000000060d80000, size 1 MiB
OF: reserved mem: initialized node memory@60d80000, compatible id shared-d=
ma-pool
OF: reserved mem: 0x0000000060d80000..0x0000000060e7ffff (1024 KiB) nomap =
non-reusable memory@60d80000
Reserved memory: created DMA memory pool at 0x0000000060e80000, size 2 MiB
OF: reserved mem: initialized node memory@60e80000, compatible id shared-d=
ma-pool
OF: reserved mem: 0x0000000060e80000..0x00000000610fffff (2560 KiB) nomap =
non-reusable memory@60e80000
Zone ranges:
  Normal   [mem 0x0000000040000000-0x000000023fffffff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x0000000040000000-0x000000004fffffff]
  node   0: [mem 0x0000000050000000-0x00000000528fffff]
  node   0: [mem 0x0000000052900000-0x00000000545fffff]
  node   0: [mem 0x0000000054660000-0x000000005fffffff]
  node   0: [mem 0x0000000060000000-0x00000000610fffff]
  node   0: [mem 0x0000000061100000-0x00000000fffdafff]
  node   0: [mem 0x0000000100000000-0x000000023fffffff]
Initmem setup node 0 [mem 0x0000000040000000-0x000000023fffffff]
On node 0, zone Normal: 96 pages in unavailable ranges
On node 0, zone Normal: 37 pages in unavailable ranges
psci: probing for conduit method from DT.
psci: PSCIv1.1 detected in firmware.
psci: Using standard PSCI v0.2 function IDs
psci: MIGRATE_INFO_TYPE not supported.
psci: SMC Calling Convention v1.5
percpu: Embedded 17 pages/cpu s40608 r0 d29024 u69632
pcpu-alloc: s40608 r0 d29024 u69632 alloc=3D17*4096
pcpu-alloc: [0] 0 [0] 1 [0] 2 [0] 3 [0] 4 [0] 5 [0] 6 [0] 7 =


Detected VIPT I-cache on CPU0
CPU features: detected: GIC system register CPU interface
CPU features: detected: Virtualization Host Extensions
CPU features: kernel page table isolation disabled by kernel configuration
alternatives: applying boot alternatives
Kernel command line: console=3Dtty0 console=3DttyS0,115200n8 loglevel=3D15
printk: log buffer data + meta data: 131072 + 458752 =3D 589824 bytes
Dentry cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear=
)
Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
software IO TLB: SWIOTLB bounce buffer size adjusted to 8MB
software IO TLB: area num 8.
software IO TLB: mapped [mem 0x0000000236a00000-0x0000000237200000] (8MB)
Built 1 zonelists, mobility grouping on.  Total pages: 2097019
mem auto-init: stack:all(zero), heap alloc:off, heap free:off
SLUB: HWalign=3D64, Order=3D0-1, MinObjects=3D0, CPUs=3D8, Nodes=3D1
rcu: Hierarchical RCU implementation.
rcu: 	RCU restricting CPUs from NR_CPUS=3D512 to nr_cpu_ids=3D8.
rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D8
NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
GICv3: GIC: Using split EOI/Deactivate mode
GICv3: 864 SPIs implemented
GICv3: 0 Extended SPIs implemented
Root IRQ handler: 0xffff80008001007c
GICv3: GICv3 features: 16 PPIs
GICv3: GICD_CTRL.DS=3D0, SCR_EL3.FIQ=3D0
GICv3: CPU0: found redistributor 0 region 0:0x000000000c040000
GICv3: GIC: PPI partition interrupt-partition-0[0] { /cpus/cpu@0[0] /cpus/=
cpu@100[1] /cpus/cpu@200[2] /cpus/cpu@300[3] }
GICv3: GIC: PPI partition interrupt-partition-1[1] { /cpus/cpu@400[4] /cpu=
s/cpu@500[5] /cpus/cpu@600[6] /cpus/cpu@700[7] }
rcu: srcu_init: Setting srcu_struct sizes based on contention.
arch_timer: cp15 timer(s) running at 13.00MHz (phys).
clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x2ff89e=
acb, max_idle_ns: 440795202429 ns
sched_clock: 56 bits at 13MHz, resolution 76ns, wraps every 4398046511101n=
s
Console: colour dummy device 80x25
printk: legacy console [tty0] enabled
Calibrating delay loop (skipped), value calculated using timer frequency..=
 26.00 BogoMIPS (lpj=3D52000)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
Mountpoint-cache hash table entries: 16384 (order: 5, 131072 bytes, linear=
)
rcu: Hierarchical SRCU implementation.
rcu: 	Max phase no-delay instances is 1000.
smp: Bringing up secondary CPUs ...
Detected VIPT I-cache on CPU1
GICv3: CPU1: found redistributor 100 region 0:0x000000000c060000
CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
Detected VIPT I-cache on CPU2
GICv3: CPU2: found redistributor 200 region 0:0x000000000c080000
CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
Detected VIPT I-cache on CPU3
GICv3: CPU3: found redistributor 300 region 0:0x000000000c0a0000
CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
CPU features: detected: Spectre-v4
CPU features: detected: Spectre-BHB
Detected PIPT I-cache on CPU4
GICv3: CPU4: found redistributor 400 region 0:0x000000000c0c0000
CPU4: Booted secondary processor 0x0000000400 [0x411fd410]
Detected PIPT I-cache on CPU5
GICv3: CPU5: found redistributor 500 region 0:0x000000000c0e0000
CPU5: Booted secondary processor 0x0000000500 [0x411fd410]
Detected PIPT I-cache on CPU6
GICv3: CPU6: found redistributor 600 region 0:0x000000000c100000
CPU6: Booted secondary processor 0x0000000600 [0x411fd410]
Detected PIPT I-cache on CPU7
GICv3: CPU7: found redistributor 700 region 0:0x000000000c120000
CPU7: Booted secondary processor 0x0000000700 [0x411fd410]
smp: Brought up 1 node, 8 CPUs
SMP: Total of 8 processors activated.
CPU: All CPU(s) started at EL2
CPU features: detected: 32-bit EL0 Support
CPU features: detected: Data cache clean to the PoU not required for I/D c=
oherence
CPU features: detected: Common not Private translations
CPU features: detected: CRC32 instructions
CPU features: detected: Data cache clean to Point of Persistence
CPU features: detected: RCpc load-acquire (LDAPR)
CPU features: detected: LSE atomic instructions
CPU features: detected: PMUv3
CPU features: detected: RAS Extension Support
CPU features: detected: Speculative Store Bypassing Safe (SSBS)
spectre-bhb mitigation disabled by compile time option
spectre-bhb mitigation disabled by compile time option
alternatives: applying system-wide alternatives
CPU features: detected: Hardware dirty bit management on CPU0-7
Memory: 8159184K/8388076K available (4928K kernel code, 924K rwdata, 1800K=
 rodata, 896K init, 479K bss, 224752K reserved, 0K cma-reserved)
devtmpfs: initialized
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns=
: 7645041785100000 ns
futex hash table entries: 2048 (131072 bytes on 1 NUMA nodes, total 128 Ki=
B, linear).
pinctrl core: initialized pinctrl subsystem
DMA: preallocated 1024 KiB GFP_KERNEL pool for atomic allocations
thermal_sys: Registered thermal governor 'step_wise'
thermal_sys: Registered thermal governor 'power_allocator'
hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
ASID allocator initialised with 65536 entries
Serial: AMBA PL011 UART driver
/soc/interrupt-controller@c000000: Fixed dependency cycle(s) with /soc/int=
errupt-controller@c000000
/soc/syscon@1c01a000: Fixed dependency cycle(s) with /soc/ovl@1c000000
/soc/ovl@1c000000: Fixed dependency cycle(s) with /soc/rdma@1c002000
/soc/ovl@1c000000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/rdma@1c002000: Fixed dependency cycle(s) with /soc/color@1c003000
/soc/rdma@1c002000: Fixed dependency cycle(s) with /soc/ovl@1c000000
/soc/rdma@1c002000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/color@1c003000: Fixed dependency cycle(s) with /soc/ccorr@1c004000
/soc/color@1c003000: Fixed dependency cycle(s) with /soc/rdma@1c002000
/soc/color@1c003000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/ccorr@1c004000: Fixed dependency cycle(s) with /soc/aal@1c005000
/soc/ccorr@1c004000: Fixed dependency cycle(s) with /soc/color@1c003000
/soc/ccorr@1c004000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/aal@1c005000: Fixed dependency cycle(s) with /soc/gamma@1c006000
/soc/aal@1c005000: Fixed dependency cycle(s) with /soc/ccorr@1c004000
/soc/aal@1c005000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/gamma@1c006000: Fixed dependency cycle(s) with /soc/dither@1c007000
/soc/gamma@1c006000: Fixed dependency cycle(s) with /soc/aal@1c005000
/soc/gamma@1c006000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/dither@1c007000: Fixed dependency cycle(s) with /soc/dsc@1c009000
/soc/dither@1c007000: Fixed dependency cycle(s) with /soc/gamma@1c006000
/soc/dither@1c007000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/dsc@1c009000: Fixed dependency cycle(s) with /soc/merge@1c014000
/soc/dsc@1c009000: Fixed dependency cycle(s) with /soc/dither@1c007000
/soc/dsc@1c009000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/merge@1c014000: Fixed dependency cycle(s) with /soc/dp-intf@1c015000
/soc/merge@1c014000: Fixed dependency cycle(s) with /soc/dsc@1c009000
/soc/merge@1c014000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/dp-intf@1c015000: Fixed dependency cycle(s) with /soc/edp-tx@1c500000
/soc/dp-intf@1c015000: Fixed dependency cycle(s) with /soc/merge@1c014000
/soc/dp-intf@1c015000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/syscon@1c100000: Fixed dependency cycle(s) with /soc/hdr-engine@1c114=
000
/soc/vpp-merge@1c110000: Fixed dependency cycle(s) with /soc/dp-intf@1c113=
000
/soc/vpp-merge@1c110000: Fixed dependency cycle(s) with /soc/hdr-engine@1c=
114000
/soc/vpp-merge@1c110000: Fixed dependency cycle(s) with /soc/syscon@1c1000=
00
/soc/dp-intf@1c113000: Fixed dependency cycle(s) with /soc/dp-tx@1c600000
/soc/dp-intf@1c113000: Fixed dependency cycle(s) with /soc/vpp-merge@1c110=
000
/soc/dp-intf@1c113000: Fixed dependency cycle(s) with /soc/syscon@1c100000
/soc/hdr-engine@1c114000: Fixed dependency cycle(s) with /soc/vpp-merge@1c=
110000
/soc/hdr-engine@1c114000: Fixed dependency cycle(s) with /soc/syscon@1c100=
000
/soc/edp-tx@1c500000: Fixed dependency cycle(s) with /soc/edp-tx@1c500000/=
aux-bus/panel
/soc/edp-tx@1c500000: Fixed dependency cycle(s) with /soc/dp-intf@1c015000
/soc/edp-tx@1c500000/aux-bus/panel: Fixed dependency cycle(s) with /soc/ed=
p-tx@1c500000
/soc/dp-tx@1c600000: Fixed dependency cycle(s) with /soc/dp-intf@1c113000
/soc/pinctrl@10005000: Fixed dependency cycle(s) with /soc/pinctrl@1000500=
0/pio-default-pins
/soc/pcie@112f8000: Fixed dependency cycle(s) with /soc/pcie@112f8000/inte=
rrupt-controller
/soc/syscon@1c01a000: Fixed dependency cycle(s) with /soc/ovl@1c000000
/soc/syscon@1c01a000: Fixed dependency cycle(s) with /soc/ovl@1c000000
/soc/ovl@1c000000: Fixed dependency cycle(s) with /soc/rdma@1c002000
/soc/ovl@1c000000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/ovl@1c000000: Fixed dependency cycle(s) with /soc/rdma@1c002000
/soc/rdma@1c002000: Fixed dependency cycle(s) with /soc/color@1c003000
/soc/rdma@1c002000: Fixed dependency cycle(s) with /soc/ovl@1c000000
/soc/rdma@1c002000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/rdma@1c002000: Fixed dependency cycle(s) with /soc/color@1c003000
/soc/color@1c003000: Fixed dependency cycle(s) with /soc/ccorr@1c004000
/soc/color@1c003000: Fixed dependency cycle(s) with /soc/rdma@1c002000
/soc/color@1c003000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/color@1c003000: Fixed dependency cycle(s) with /soc/ccorr@1c004000
/soc/ccorr@1c004000: Fixed dependency cycle(s) with /soc/aal@1c005000
/soc/ccorr@1c004000: Fixed dependency cycle(s) with /soc/color@1c003000
/soc/ccorr@1c004000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/ccorr@1c004000: Fixed dependency cycle(s) with /soc/aal@1c005000
/soc/aal@1c005000: Fixed dependency cycle(s) with /soc/gamma@1c006000
/soc/aal@1c005000: Fixed dependency cycle(s) with /soc/ccorr@1c004000
/soc/aal@1c005000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/aal@1c005000: Fixed dependency cycle(s) with /soc/gamma@1c006000
/soc/gamma@1c006000: Fixed dependency cycle(s) with /soc/dither@1c007000
/soc/gamma@1c006000: Fixed dependency cycle(s) with /soc/aal@1c005000
/soc/gamma@1c006000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/gamma@1c006000: Fixed dependency cycle(s) with /soc/dither@1c007000
/soc/dither@1c007000: Fixed dependency cycle(s) with /soc/dsc@1c009000
/soc/dither@1c007000: Fixed dependency cycle(s) with /soc/gamma@1c006000
/soc/dither@1c007000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/dither@1c007000: Fixed dependency cycle(s) with /soc/dsc@1c009000
/soc/dsc@1c009000: Fixed dependency cycle(s) with /soc/merge@1c014000
/soc/dsc@1c009000: Fixed dependency cycle(s) with /soc/dither@1c007000
/soc/dsc@1c009000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/dsc@1c009000: Fixed dependency cycle(s) with /soc/merge@1c014000
/soc/merge@1c014000: Fixed dependency cycle(s) with /soc/dp-intf@1c015000
/soc/merge@1c014000: Fixed dependency cycle(s) with /soc/dsc@1c009000
/soc/merge@1c014000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/merge@1c014000: Fixed dependency cycle(s) with /soc/dp-intf@1c015000
/soc/dp-intf@1c015000: Fixed dependency cycle(s) with /soc/edp-tx@1c500000
/soc/dp-intf@1c015000: Fixed dependency cycle(s) with /soc/merge@1c014000
/soc/dp-intf@1c015000: Fixed dependency cycle(s) with /soc/syscon@1c01a000
/soc/syscon@1c100000: Fixed dependency cycle(s) with /soc/hdr-engine@1c114=
000
/soc/vpp-merge@1c110000: Fixed dependency cycle(s) with /soc/dp-intf@1c113=
000
/soc/vpp-merge@1c110000: Fixed dependency cycle(s) with /soc/hdr-engine@1c=
114000
/soc/vpp-merge@1c110000: Fixed dependency cycle(s) with /soc/syscon@1c1000=
00
/soc/vpp-merge@1c110000: Fixed dependency cycle(s) with /soc/dp-intf@1c113=
000
/soc/dp-intf@1c113000: Fixed dependency cycle(s) with /soc/dp-tx@1c600000
/soc/dp-intf@1c113000: Fixed dependency cycle(s) with /soc/vpp-merge@1c110=
000
/soc/dp-intf@1c113000: Fixed dependency cycle(s) with /soc/syscon@1c100000
/soc/vpp-merge@1c110000: Fixed dependency cycle(s) with /soc/hdr-engine@1c=
114000
/soc/syscon@1c100000: Fixed dependency cycle(s) with /soc/hdr-engine@1c114=
000
/soc/hdr-engine@1c114000: Fixed dependency cycle(s) with /soc/vpp-merge@1c=
110000
/soc/hdr-engine@1c114000: Fixed dependency cycle(s) with /soc/syscon@1c100=
000
/soc/dp-intf@1c015000: Fixed dependency cycle(s) with /soc/edp-tx@1c500000
/soc/edp-tx@1c500000: Fixed dependency cycle(s) with /soc/edp-tx@1c500000/=
aux-bus/panel
/soc/edp-tx@1c500000: Fixed dependency cycle(s) with /soc/dp-intf@1c015000
/soc/edp-tx@1c500000/aux-bus/panel: Fixed dependency cycle(s) with /soc/ed=
p-tx@1c500000
/soc/dp-intf@1c113000: Fixed dependency cycle(s) with /soc/dp-tx@1c600000
/soc/dp-tx@1c600000: Fixed dependency cycle(s) with /soc/dp-intf@1c113000
HugeTLB: allocation took 0ms with hugepage_allocation_threads=3D2
HugeTLB: allocation took 0ms with hugepage_allocation_threads=3D2
HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
HugeTLB: registered 32.0 MiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 32.0 MiB page
HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
HugeTLB: registered 64.0 KiB page size, pre-allocated 0 pages
HugeTLB: 0 KiB vmemmap can be freed for a 64.0 KiB page
iommu: Default domain type: Translated
iommu: DMA domain TLB invalidation policy: strict mode
SCSI subsystem initialized
libata version 3.00 loaded.
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
vgaarb: loaded
clocksource: Switched to clocksource arch_sys_counter
PCI: CLS 0 bytes, default 64
Unpacking initramfs...
workingset: timestamp_bits=3D62 max_order=3D21 bucket_order=3D0
squashfs: version 4.0 (2009/01/31) Phillip Lougher
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
io scheduler mq-deadline registered
io scheduler kyber registered
io scheduler bfq registered
Freeing initrd memory: 2996K
cannot find "mediatek,mt8195-fhctl"
mtk-socinfo mtk-socinfo.0.auto: MediaTek Kompanio 1380 (MT8195) SoC detect=
ed.
Serial: 8250/16550 driver, 32 ports, IRQ sharing disabled
printk: legacy console [ttyS0] disabled
11001100.serial: ttyS0 at MMIO 0x11001100 (irq =3D 253, base_baud =3D 1625=
000) is a ST16650V2
printk: legacy console [ttyS0] enabled
Serial: AMBA driver
loop: module loaded
mt6359-keys: Failed to locate of_node [id: -1]
mt6359-accdet: Failed to locate of_node [id: -1]
mtk-spi-nor 1132c000.spi: spi frequency: 52000000 Hz
usbcore: registered new interface driver usb-storage
mt6397-rtc mt6359-rtc: registered as rtc0
mt6397-rtc mt6359-rtc: setting system clock to 2025-09-15T22:15:30 UTC (17=
57974530)
mtk-lvts-thermal 1100b000.thermal-sensor: golden temp=3D60
vgpu11_sshub: Bringing 400000uV into 550000-550000uV
thermal thermal_zone0: power_allocator: sustainable_power will be estimate=
d
thermal thermal_zone1: power_allocator: sustainable_power will be estimate=
d
thermal thermal_zone2: power_allocator: sustainable_power will be estimate=
d
thermal thermal_zone3: power_allocator: sustainable_power will be estimate=
d
thermal thermal_zone4: power_allocator: sustainable_power will be estimate=
d
thermal thermal_zone5: power_allocator: sustainable_power will be estimate=
d
thermal thermal_zone6: power_allocator: sustainable_power will be estimate=
d
thermal thermal_zone7: power_allocator: sustainable_power will be estimate=
d
thermal thermal_zone8: power_allocator: sustainable_power will be estimate=
d
mtk-lvts-thermal 11278000.thermal-sensor: golden temp=3D60
thermal thermal_zone9: power_allocator: sustainable_power will be estimate=
d
thermal thermal_zone10: power_allocator: sustainable_power will be estimat=
ed
thermal thermal_zone11: power_allocator: sustainable_power will be estimat=
ed
thermal thermal_zone12: power_allocator: sustainable_power will be estimat=
ed
thermal thermal_zone13: power_allocator: sustainable_power will be estimat=
ed
thermal thermal_zone14: power_allocator: sustainable_power will be estimat=
ed
thermal thermal_zone15: power_allocator: sustainable_power will be estimat=
ed
thermal thermal_zone16: power_allocator: sustainable_power will be estimat=
ed
cpu cpu0: EM: created perf domain
cpu cpu4: EM: created perf domain
coreboot_table firmware:coreboot: probe with driver coreboot_table failed =
with error -22
hid: raw HID events driver (C) Jiri Kosina
usbcore: registered new interface driver usbhid
usbhid: USB HID core driver
spi_master spi0: will run message pump with realtime priority
hw perfevents: enabled with armv8_cortex_a55 PMU driver, 7 (0,8000003f) co=
unters available
hw perfevents: enabled with armv8_cortex_a78 PMU driver, 7 (0,8000003f) co=
unters available
mediatek-drm mediatek-drm.12.auto: Adding component match for /soc/ovl@1c0=
00000
mediatek-drm mediatek-drm.12.auto: Adding component match for /soc/rdma@1c=
002000
mediatek-drm mediatek-drm.12.auto: Adding component match for /soc/color@1=
c003000
mediatek-drm mediatek-drm.12.auto: Adding component match for /soc/ccorr@1=
c004000
mediatek-drm mediatek-drm.12.auto: Adding component match for /soc/aal@1c0=
05000
mediatek-drm mediatek-drm.12.auto: Adding component match for /soc/gamma@1=
c006000
mediatek-drm mediatek-drm.12.auto: Adding component match for /soc/merge@1=
c014000
mediatek-drm mediatek-drm.12.auto: Adding component match for /soc/dp-intf=
@1c015000
mediatek-disp-ovl-adaptor mediatek-disp-ovl-adaptor.15.auto: Failed to get=
 id. type: 2, alias: -19
mediatek-disp-ovl-adaptor mediatek-disp-ovl-adaptor.15.auto: Skipping unkn=
own component /soc/merge@1c014000
mediatek-disp-ovl-adaptor mediatek-disp-ovl-adaptor.15.auto: Failed to get=
 id. type: 2, alias: 5
mediatek-disp-ovl-adaptor mediatek-disp-ovl-adaptor.15.auto: Skipping unkn=
own component /soc/vpp-merge@1c110000
mediatek-drm mediatek-drm.14.auto: Adding component match for /soc/vpp-mer=
ge@1c110000
mediatek-drm mediatek-drm.14.auto: Adding component match for /soc/dp-intf=
@1c113000
mtk-msdc 11230000.mmc: Final PAD_DS_TUNE: 0x15011
mtk-power-controller 10006000.syscon:power-controller: /soc/syscon@1000600=
0/power-controller/power-domain@15/power-domain@16/power-domain@18/power-d=
omain@20: A default off power domain has been ON
input: cros_ec as /devices/platform/soc/1100a000.spi/spi_master/spi0/spi0.=
0/1100a000.spi:ec@0:keyboard-controller/input/input0
mmc0: Host Software Queue enabled
mmc0: new HS400 MMC card at address 0001
mmcblk0: mmc0:0001 DA4128 116 GiB
 mmcblk0: p1 p2 p3
mmcblk0boot0: mmc0:0001 DA4128 4.00 MiB
mmcblk0boot1: mmc0:0001 DA4128 4.00 MiB
mmcblk0rpmb: mmc0:0001 DA4128 16.0 MiB, chardev (249:0)
input: cros_ec_buttons as /devices/platform/soc/1100a000.spi/spi_master/sp=
i0/spi0.0/1100a000.spi:ec@0:keyboard-controller/input/input1
/soc/edp-tx@1c500000: Fixed dependency cycle(s) with /soc/edp-tx@1c500000/=
aux-bus/panel
/soc/edp-tx@1c500000/aux-bus/panel: Fixed dependency cycle(s) with /soc/ed=
p-tx@1c500000
cros-ec-spi spi0.0: Chrome EC device registered
mtu3 11201000.usb: uwk - reg:0x400, version:103
mtu3 11201000.usb: dr_mode: 1, drd: auto
mtu3 11201000.usb: u2p_dis_msk: 0, u3p_dis_msk: 0
mtu3 11201000.usb: usb3-drd: 1
xhci-mtk 11200000.usb: supply vusb33 not found, using dummy regulator
xhci-mtk 11200000.usb: xHCI Host Controller
xhci-mtk 11200000.usb: new USB bus registered, assigned bus number 1
xhci-mtk 11200000.usb: hcc params 0x01400f99 hci version 0x110 quirks 0x00=
00000000200010
xhci-mtk 11200000.usb: irq 287, io mem 0x11200000
xhci-mtk 11200000.usb: xHCI Host Controller
xhci-mtk 11200000.usb: new USB bus registered, assigned bus number 2
xhci-mtk 11200000.usb: Host supports USB 3.2 Enhanced SuperSpeed
usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0002, bcdDevi=
ce=3D 6.16
usb usb1: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb1: Product: xHCI Host Controller
usb usb1: Manufacturer: Linux 6.16.4 xhci-hcd
usb usb1: SerialNumber: 11200000.usb
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
usb usb2: We don't know the algorithms for LPM for this host, disabling LP=
M.
usb usb2: New USB device found, idVendor=3D1d6b, idProduct=3D0003, bcdDevi=
ce=3D 6.16
usb usb2: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb2: Product: xHCI Host Controller
usb usb2: Manufacturer: Linux 6.16.4 xhci-hcd
usb usb2: SerialNumber: 11200000.usb
hub 2-0:1.0: USB hub found
hub 2-0:1.0: 1 port detected
mtu3 11201000.usb: xHCI platform device register success...
mtu3 112a1000.usb: uwk - reg:0x400, version:105
mtu3 112a1000.usb: dr_mode: 1, drd: auto
mtu3 112a1000.usb: u2p_dis_msk: 0, u3p_dis_msk: 0
mtu3 112a1000.usb: usb3-drd: 0
xhci-mtk 112a0000.usb: supply vusb33 not found, using dummy regulator
xhci-mtk 112a0000.usb: xHCI Host Controller
xhci-mtk 112a0000.usb: new USB bus registered, assigned bus number 3
xhci-mtk 112a0000.usb: USB3 root hub has no ports
xhci-mtk 112a0000.usb: hcc params 0x01400f99 hci version 0x110 quirks 0x00=
00000000200010
xhci-mtk 112a0000.usb: irq 288, io mem 0x112a0000
usb usb3: New USB device found, idVendor=3D1d6b, idProduct=3D0002, bcdDevi=
ce=3D 6.16
usb usb3: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb3: Product: xHCI Host Controller
usb usb3: Manufacturer: Linux 6.16.4 xhci-hcd
usb usb3: SerialNumber: 112a0000.usb
hub 3-0:1.0: USB hub found
hub 3-0:1.0: 1 port detected
mtu3 112a1000.usb: xHCI platform device register success...
mtu3 112b1000.usb: uwk - reg:0x400, version:106
mtu3 112b1000.usb: dr_mode: 1, drd: auto
mtu3 112b1000.usb: u2p_dis_msk: 0, u3p_dis_msk: 0
mtu3 112b1000.usb: usb3-drd: 0
xhci-mtk 112b0000.usb: supply vusb33 not found, using dummy regulator
xhci-mtk 112b0000.usb: xHCI Host Controller
xhci-mtk 112b0000.usb: new USB bus registered, assigned bus number 4
xhci-mtk 112b0000.usb: USB3 root hub has no ports
xhci-mtk 112b0000.usb: hcc params 0x01400f99 hci version 0x110 quirks 0x00=
00000020200010
xhci-mtk 112b0000.usb: irq 289, io mem 0x112b0000
usb usb4: New USB device found, idVendor=3D1d6b, idProduct=3D0002, bcdDevi=
ce=3D 6.16
usb usb4: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb4: Product: xHCI Host Controller
usb usb4: Manufacturer: Linux 6.16.4 xhci-hcd
usb usb4: SerialNumber: 112b0000.usb
hub 4-0:1.0: USB hub found
hub 4-0:1.0: 1 port detected
mtu3 112b1000.usb: xHCI platform device register success...
thermal thermal_zone17: power_allocator: sustainable_power will be estimat=
ed
thermal thermal_zone18: power_allocator: sustainable_power will be estimat=
ed
mtk-msdc 11240000.mmc: Got CD GPIO
usb 1-1: new high-speed USB device number 2 using xhci-mtk
usb 3-1: new high-speed USB device number 2 using xhci-mtk
usb 1-1: New USB device found, idVendor=3D05e3, idProduct=3D0610, bcdDevic=
e=3D65.02
usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
usb 1-1: Product: USB2.1 Hub
usb 1-1: Manufacturer: GenesysLogic
hub 1-1:1.0: USB hub found
hub 1-1:1.0: 3 ports detected
usb 4-1: new high-speed USB device number 2 using xhci-mtk
usb 2-1: new SuperSpeed USB device number 2 using xhci-mtk
usb 2-1: New USB device found, idVendor=3D05e3, idProduct=3D0620, bcdDevic=
e=3D65.02
usb 2-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D0
usb 2-1: Product: USB3.2 Hub
usb 2-1: Manufacturer: GenesysLogic
hub 2-1:1.0: USB hub found
hub 2-1:1.0: 3 ports detected
usb 3-1: New USB device found, idVendor=3D0408, idProduct=3D4034, bcdDevic=
e=3D 0.02
usb 3-1: New USB device strings: Mfr=3D1, Product=3D2, SerialNumber=3D3
usb 3-1: Product: ACER HD User Facing
usb 3-1: Manufacturer: Quanta
usb 3-1: SerialNumber: 01.00.00
usb 4-1: New USB device found, idVendor=3D04ca, idProduct=3D3802, bcdDevic=
e=3D 1.00
usb 4-1: New USB device strings: Mfr=3D5, Product=3D6, SerialNumber=3D7
usb 4-1: Product: Wireless_Device
usb 4-1: Manufacturer: MediaTek Inc.
usb 4-1: SerialNumber: 000000000
panel-simple-dp-aux aux-1c500000.edp-tx: Detected BOE NE135FBM-N41 v8.1 (0=
x095f)
xhci-mtk 11290000.usb: uwk - reg:0x400, version:104
xhci-mtk 11290000.usb: xHCI Host Controller
xhci-mtk 11290000.usb: new USB bus registered, assigned bus number 5
xhci-mtk 11290000.usb: hcc params 0x01400f99 hci version 0x110 quirks 0x00=
00000000200010
xhci-mtk 11290000.usb: irq 291, io mem 0x11290000
xhci-mtk 11290000.usb: xHCI Host Controller
xhci-mtk 11290000.usb: new USB bus registered, assigned bus number 6
xhci-mtk 11290000.usb: Host supports USB 3.2 Enhanced SuperSpeed
usb usb5: New USB device found, idVendor=3D1d6b, idProduct=3D0002, bcdDevi=
ce=3D 6.16
usb usb5: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb5: Product: xHCI Host Controller
usb usb5: Manufacturer: Linux 6.16.4 xhci-hcd
usb usb5: SerialNumber: 11290000.usb
hub 5-0:1.0: USB hub found
hub 5-0:1.0: 1 port detected
usb usb6: We don't know the algorithms for LPM for this host, disabling LP=
M.
usb usb6: New USB device found, idVendor=3D1d6b, idProduct=3D0003, bcdDevi=
ce=3D 6.16
usb usb6: New USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1
usb usb6: Product: xHCI Host Controller
usb usb6: Manufacturer: Linux 6.16.4 xhci-hcd
usb usb6: SerialNumber: 11290000.usb
hub 6-0:1.0: USB hub found
hub 6-0:1.0: 1 port detected
i2c_hid_of 4-0010: supply vddl not found, using dummy regulator
platform 14001000.dma-controller: Adding to iommu group 0
platform 14009000.display: Adding to iommu group 0
platform 1400c000.dma-controller: Adding to iommu group 0
platform 14f0a000.dma-controller: Adding to iommu group 0
platform 14f25000.dma-controller: Adding to iommu group 0
platform soc:jpgenc-master: Adding to iommu group 1
i2c_hid_of 4-0010: i2c_hid_get_input: IRQ triggered but there's no data
platform 1c105000.dma-controller: Adding to iommu group 2
input: hid-over-i2c 04F3:4040 Touchscreen as /devices/platform/soc/11e0400=
0.i2c/i2c-4/4-0010/0018:04F3:4040.0001/input/input2
platform 1c107000.dma-controller: Adding to iommu group 2
input: hid-over-i2c 04F3:4040 as /devices/platform/soc/11e04000.i2c/i2c-4/=
4-0010/0018:04F3:4040.0001/input/input3
platform 1c109000.dma-controller: Adding to iommu group 2
input: hid-over-i2c 04F3:4040 as /devices/platform/soc/11e04000.i2c/i2c-4/=
4-0010/0018:04F3:4040.0001/input/input4
platform 1c10b000.dma-controller: Adding to iommu group 2
input: hid-over-i2c 04F3:4040 Stylus as /devices/platform/soc/11e04000.i2c=
/i2c-4/4-0010/0018:04F3:4040.0001/input/input5
platform 1c114000.hdr-engine: Adding to iommu group 2
hid-generic 0018:04F3:4040.0001: input,hidraw0: I2C HID v1.00 Device [hid-=
over-i2c 04F3:4040] on 4-0010
mtk-iommu 14018000.iommu: bound 1c019000.larb (ops 0xffff800080611fb8)
mtk-iommu 14018000.iommu: bound 1c103000.larb (ops 0xffff800080611fb8)
mtk-iommu 14018000.iommu: bound 14013000.larb (ops 0xffff800080611fb8)
mtk-iommu 14018000.iommu: bound 14f03000.larb (ops 0xffff800080611fb8)
mtk-iommu 14018000.iommu: bound 14e05000.larb (ops 0xffff800080611fb8)
mtk-iommu 14018000.iommu: bound 15340000.larb (ops 0xffff800080611fb8)
mtk-iommu 14018000.iommu: bound 16002000.larb (ops 0xffff800080611fb8)
mtk-iommu 14018000.iommu: bound 16012000.larb (ops 0xffff800080611fb8)
mtk-iommu 14018000.iommu: bound 17201000.larb (ops 0xffff800080611fb8)
mtk-iommu 14018000.iommu: bound 1b010000.larb (ops 0xffff800080611fb8)
mtk-iommu 14018000.iommu: bound 1803e000.larb (ops 0xffff800080611fb8)
mtk-iommu 14018000.iommu: bound 1800e000.larb (ops 0xffff800080611fb8)
mtk-iommu 14018000.iommu: bound 16142000.larb (ops 0xffff800080611fb8)
mtk-iommu 14018000.iommu: bound 16014000.larb (ops 0xffff800080611fb8)
platform 14f08000.dma-controller: Adding to iommu group 0
platform 14f09000.dma-controller: Adding to iommu group 0
platform 14f1f000.display: Adding to iommu group 0
platform 14f23000.dma-controller: Adding to iommu group 0
platform 14f24000.dma-controller: Adding to iommu group 0
platform 18000000.video-codec: Adding to iommu group 1
platform 1a020000.video-codec: Adding to iommu group 1
platform soc:jpgdec-master: Adding to iommu group 1
platform 1c000000.ovl: Adding to iommu group 2
platform 1c002000.rdma: Adding to iommu group 2
platform 1c104000.dma-controller: Adding to iommu group 2
platform 1c106000.dma-controller: Adding to iommu group 2
platform 1c108000.dma-controller: Adding to iommu group 2
platform 1c10a000.dma-controller: Adding to iommu group 2
mtk-iommu 1c01f000.iommu: bound 1c018000.larb (ops 0xffff800080611fb8)
mtk-iommu 1c01f000.iommu: bound 1c102000.larb (ops 0xffff800080611fb8)
mtk-iommu 1c01f000.iommu: bound 14f02000.larb (ops 0xffff800080611fb8)
mtk-iommu 1c01f000.iommu: bound 14e04000.larb (ops 0xffff800080611fb8)
mtk-iommu 1c01f000.iommu: bound 15001000.larb (ops 0xffff800080611fb8)
mtk-iommu 1c01f000.iommu: bound 15120000.larb (ops 0xffff800080611fb8)
mtk-iommu 1c01f000.iommu: bound 15230000.larb (ops 0xffff800080611fb8)
mtk-iommu 1c01f000.iommu: bound 16001000.larb (ops 0xffff800080611fb8)
mtk-iommu 1c01f000.iommu: bound 16013000.larb (ops 0xffff800080611fb8)
mtk-iommu 1c01f000.iommu: bound 1a010000.larb (ops 0xffff800080611fb8)
mtk-iommu 1c01f000.iommu: bound 1802e000.larb (ops 0xffff800080611fb8)
mtk-iommu 1c01f000.iommu: bound 1800d000.larb (ops 0xffff800080611fb8)
mtk-iommu 1c01f000.iommu: bound 16141000.larb (ops 0xffff800080611fb8)
mtk-iommu 1c01f000.iommu: bound 16015000.larb (ops 0xffff800080611fb8)
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D1751
rcu: 	(detected by 0, t=3D5252 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D6170
rcu: 	(detected by 0, t=3D21007 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D10589
rcu: 	(detected by 0, t=3D36762 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D15008
rcu: 	(detected by 0, t=3D52517 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D19427
rcu: 	(detected by 0, t=3D68272 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D23846
rcu: 	(detected by 0, t=3D84027 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D28265
rcu: 	(detected by 0, t=3D99782 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D32684
rcu: 	(detected by 0, t=3D115537 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D37103
rcu: 	(detected by 0, t=3D131292 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D41522
rcu: 	(detected by 0, t=3D147047 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D45941
rcu: 	(detected by 0, t=3D162802 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D50360
rcu: 	(detected by 0, t=3D178557 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D54779
rcu: 	(detected by 0, t=3D194312 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
random: crng init done
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D59198
rcu: 	(detected by 0, t=3D210067 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D63617
rcu: 	(detected by 0, t=3D225822 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D68036
rcu: 	(detected by 0, t=3D241577 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D72455
rcu: 	(detected by 0, t=3D257332 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D76874
rcu: 	(detected by 0, t=3D273087 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D81293
rcu: 	(detected by 0, t=3D288842 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D85712
rcu: 	(detected by 0, t=3D304597 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D90131
rcu: 	(detected by 0, t=3D320352 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D94550
rcu: 	(detected by 0, t=3D336107 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D98969
rcu: 	(detected by 0, t=3D351862 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D103388
rcu: 	(detected by 0, t=3D367617 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D107807
rcu: 	(detected by 0, t=3D383372 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D112226
rcu: 	(detected by 0, t=3D399127 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D116645
rcu: 	(detected by 0, t=3D414882 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D121064
rcu: 	(detected by 0, t=3D430637 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D125483
rcu: 	(detected by 0, t=3D446392 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D129902
rcu: 	(detected by 0, t=3D462147 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D134321
rcu: 	(detected by 0, t=3D477902 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D138740
rcu: 	(detected by 0, t=3D493657 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
rcu: 	5-...0: (37 ticks this GP) idle=3D39b4/1/0x4000000000000000 softirq=3D=
263/265 fqs=3D143159
rcu: 	(detected by 0, t=3D509412 jiffies, g=3D-919, q=3D73 ncpus=3D8)
Sending NMI from CPU 0 to CPUs 5:
-----------------------e4078a503789c7b603013e5b74816ff0
Content-Type: application/pgp-keys; filename="publickey - 9l@9lo.re - 0x1CD76C53.asc"; name="publickey - 9l@9lo.re - 0x1CD76C53.asc"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="publickey - 9l@9lo.re - 0x1CD76C53.asc"; name="publickey - 9l@9lo.re - 0x1CD76C53.asc"

LS0tLS1CRUdJTiBQR1AgUFVCTElDIEtFWSBCTE9DSy0tLS0tCgp4ak1FWmVDL0dSWUpLd1lCQkFI
YVJ3OEJBUWRBNzRSNzFBb1BXUHpPNDN3SXozOGFxY1haRklBTnQ0S2QKWDJCSXFaeTAyenZORlRs
c1FEbHNieTV5WlNBOE9XeEFPV3h2TG5KbFBzS01CQkFXQ2dBK0JZSmw0TDhaCkJBc0pCd2dKa0hs
TDRsZ3Z0Nk5SQXhVSUNnUVdBQUlCQWhrQkFwc0RBaDRCRmlFRUhOZHNVNjM1SytnNwphSWQ3ZVV2
aVdDKzNvMUVBQUJHbEFQMFd3OVFVSWw2cFhKbjAvWmYxYjJ4ZmtNZllSQXBEdkZ4ek9aa2gKZ1Yz
WUNnRUF2WHFka2M5MXJEQkVwYW1NaVBEei9odE5aUXdiWWRtZUNYZG1aNGV1dUFiT09BUmw0TDha
CkVnb3JCZ0VFQVpkVkFRVUJBUWRBQUMyckhBdExHMGRJRjAyMGhoU1dIdWVNSWdxbFYvMXlpTTVN
UFl3WApoRnNEQVFnSHduZ0VHQllLQUNvRmdtWGd2eGtKa0hsTDRsZ3Z0Nk5SQXBzTUZpRUVITmRz
VTYzNUsrZzcKYUlkN2VVdmlXQyszbzFFQUFITXRBUUQ0aGpwWHRxR2JYNVJWVHFMcmhzT1o4cVhu
TXJKRWVhNHdEU0NCCmhLdWg0d0VBMFB6SCtQd3Z3K3ZjTHd4Z0xhdGJnWkkrZE5ETFZndkdEWmhY
dVlxTjlBaz0KPVFMOU8KLS0tLS1FTkQgUEdQIFBVQkxJQyBLRVkgQkxPQ0stLS0tLQo=
-----------------------e4078a503789c7b603013e5b74816ff0--

--------149793b4db5c990e3313c60e16447f495ea79fbb6f3b5d0dd1ef1c3bfe66fdee
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wrsEARYKAG0FgmjIn6UJEHlL4lgvt6NRRRQAAAAAABwAIHNhbHRAbm90YXRp
b25zLm9wZW5wZ3Bqcy5vcmf0l9UwZVOXCFKdkP7UqpVIfmzZnem5ETzX0VhF
k5YeWBYhBBzXbFOt+SvoO2iHe3lL4lgvt6NRAABYiQD/QG8W2ZGeBYyuJBok
sqgyqACrRYKjwEcYrISyh1OGMQUBAIxkPgufBPAPl5lJ3B03kSLf9xvD7WxL
dAb4qY2/r/4E
=jcB0
-----END PGP SIGNATURE-----


--------149793b4db5c990e3313c60e16447f495ea79fbb6f3b5d0dd1ef1c3bfe66fdee--


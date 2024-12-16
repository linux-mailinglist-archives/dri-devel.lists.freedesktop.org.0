Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5169D9F3D3B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 23:09:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1687F10E150;
	Mon, 16 Dec 2024 22:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="d8O6rX+k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4D010E150
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 22:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=9GHozb9/bomsCtvJcY3b8mjqzPEmi+Rbpv7p+Jrdzuw=; b=d8O6rX+kEvmHjWx7
 +qCme2yXE8YU1kh56r9jBookOChs7NRikHKViJ1mznQvTPUKBVzNJKuPUVOv9XbRafa+sPEeAL/9s
 7ibWG53BRCExgWsNNZ2U6CJapD43eoMj6FevIWeuNdFF+TgHjtAEoj35/aviM1ljknuumS+EfhEA3
 oUWrUHNvfJThbFpovE0Cp7kTVgNqPxfEH2FUoV43ChwX3N3TvdpELsOlTrbcF18TAdkq5Flc4ZjYz
 5zlhwfnhSl+GnZ0Q/Il2zHPRQRLC6foWR75DBJjd3vqwuCOOuxQg0MTvGbwb6t4aAyiymCrA5ZtuI
 tLQGa1fBVJHmV+kgEQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1tNJHB-005jQM-07;
 Mon, 16 Dec 2024 22:09:17 +0000
Date: Mon, 16 Dec 2024 22:09:16 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: kraxel@redhat.com, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: a bochs-drm (?) oops on head
Message-ID: <Z2ClDCAOmJRvOLhf@gallifrey>
References: <Z18dbfDAiFadsSdg@gallifrey>
 <b2e2a217-dced-472f-9084-9822f7e6803c@suse.de>
 <Z2AvS_8xgBhnF4CW@gallifrey>
 <51a183c7-de10-4419-b540-b7c2ab23520a@suse.de>
 <Z2Bk6-fxzw2dj5Eq@gallifrey>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2Bk6-fxzw2dj5Eq@gallifrey>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 22:08:46 up 222 days,  9:22,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* Dr. David Alan Gilbert (linux@treblig.org) wrote:
> * Thomas Zimmermann (tzimmermann@suse.de) wrote:
> > Hi
> > 
> > 
> > Am 16.12.24 um 14:46 schrieb Dr. David Alan Gilbert:
> > [...]
> > > 
> > > > The attached patch fixes the problem for me. Could you please test and
> > > > report back the results.
> > > That gets me a different oops; this was run with:
> > > qemu-system-x86_64  -M pc -cpu host --enable-kvm -smp 4 -m 2G -kernel /discs/fast/kernel/arch/x86/boot/bzImage -append "console=tty0 console=ttyS0 root=/dev/vdb1 single" -drive if=virtio,file=/discs/more/images/debian12-64scan.qcow2
> > > 
> > > It looks to me if it made the mistake of trying to print something in the middle of being removed:
> > 
> > From the stack trace below, I'd say it is the one at [1]. But I fail to
> > reproduce the problem.
> > 
> > Could you please send me the complete output of dmesg after the system
> > finished booting?
> 
> Sure; this is as far as it gets until it hits the vga oops that stops it:

I'm back to 6.9.0 and it's still there, I'll keep going.

Dave

> [    0.000000][    T0] Linux version 6.13.0-rc2+ (dg@dalek) (gcc (GCC) 14.2.1 20240912 (Red Hat 14.2.1-3), GNU ld version 2.43.1-4.fc41) #373 SMP PREEMPT_DYNAMIC Mon Dec 16 13:25:32 GMT 2024
> [    0.000000][    T0] Command line: console=tty0 console=ttyS0 root=/dev/vdb1 single
> [    0.000000][    T0] KERNEL supported cpus:
> [    0.000000][    T0]   Intel GenuineIntel
> [    0.000000][    T0]   AMD AuthenticAMD
> [    0.000000][    T0]   Hygon HygonGenuine
> [    0.000000][    T0]   Centaur CentaurHauls
> [    0.000000][    T0]   zhaoxin   Shanghai  
> [    0.000000][    T0] BIOS-provided physical RAM map:
> [    0.000000][    T0] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
> [    0.000000][    T0] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
> [    0.000000][    T0] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
> [    0.000000][    T0] BIOS-e820: [mem 0x0000000000100000-0x000000007ffdcfff] usable
> [    0.000000][    T0] BIOS-e820: [mem 0x000000007ffdd000-0x000000007fffffff] reserved
> [    0.000000][    T0] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
> [    0.000000][    T0] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
> [    0.000000][    T0] BIOS-e820: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
> [    0.000000][    T0] NX (Execute Disable) protection: active
> [    0.000000][    T0] APIC: Static calls initialized
> [    0.000000][    T0] SMBIOS 2.8 present.
> [    0.000000][    T0] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-3.fc41 04/01/2014
> [    0.000000][    T0] DMI: Memory slots populated: 1/1
> [    0.000000][    T0] Hypervisor detected: KVM
> [    0.000000][    T0] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000004][    T0] kvm-clock: using sched offset of 2473079990 cycles
> [    0.000013][    T0] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> [    0.000041][    T0] tsc: Detected 3493.430 MHz processor
> [    0.010442][    T0] last_pfn = 0x7ffdd max_arch_pfn = 0x400000000
> [    0.010480][    T0] MTRR map: 4 entries (3 fixed + 1 variable; max 19), built from 8 variable MTRRs
> [    0.010495][    T0] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
> [    0.014831][    T0] found SMP MP-table at [mem 0x000f5490-0x000f549f]
> [    0.045290][    T0] ACPI: Early table checksum verification disabled
> [    0.045302][    T0] ACPI: RSDP 0x00000000000F52D0 000014 (v00 BOCHS )
> [    0.045326][    T0] ACPI: RSDT 0x000000007FFE1D5D 000034 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.045358][    T0] ACPI: FACP 0x000000007FFE1BF9 000074 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.045393][    T0] ACPI: DSDT 0x000000007FFE0040 001BB9 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.045422][    T0] ACPI: FACS 0x000000007FFE0000 000040
> [    0.045444][    T0] ACPI: APIC 0x000000007FFE1C6D 000090 (v03 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.045474][    T0] ACPI: HPET 0x000000007FFE1CFD 000038 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.045503][    T0] ACPI: WAET 0x000000007FFE1D35 000028 (v01 BOCHS  BXPC     00000001 BXPC 00000001)
> [    0.045529][    T0] ACPI: Reserving FACP table memory at [mem 0x7ffe1bf9-0x7ffe1c6c]
> [    0.045540][    T0] ACPI: Reserving DSDT table memory at [mem 0x7ffe0040-0x7ffe1bf8]
> [    0.045550][    T0] ACPI: Reserving FACS table memory at [mem 0x7ffe0000-0x7ffe003f]
> [    0.045560][    T0] ACPI: Reserving APIC table memory at [mem 0x7ffe1c6d-0x7ffe1cfc]
> [    0.045570][    T0] ACPI: Reserving HPET table memory at [mem 0x7ffe1cfd-0x7ffe1d34]
> [    0.045580][    T0] ACPI: Reserving WAET table memory at [mem 0x7ffe1d35-0x7ffe1d5c]
> [    0.046825][    T0] No NUMA configuration found
> [    0.046833][    T0] Faking a node at [mem 0x0000000000000000-0x000000007ffdcfff]
> [    0.046981][    T0] NODE_DATA(0) allocated [mem 0x7ff997c0-0x7ffd87bf]
> [    0.052667][    T0] Zone ranges:
> [    0.052676][    T0]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.052692][    T0]   DMA32    [mem 0x0000000001000000-0x000000007ffdcfff]
> [    0.052705][    T0]   Normal   empty
> [    0.052714][    T0]   Device   empty
> [    0.052722][    T0] Movable zone start for each node
> [    0.052762][    T0] Early memory node ranges
> [    0.052767][    T0]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> [    0.052777][    T0]   node   0: [mem 0x0000000000100000-0x000000007ffdcfff]
> [    0.052791][    T0] Initmem setup node 0 [mem 0x0000000000001000-0x000000007ffdcfff]
> [    0.052859][    T0] On node 0, zone DMA: 1 pages in unavailable ranges
> [    0.053757][    T0] On node 0, zone DMA: 97 pages in unavailable ranges
> [    0.069886][    T0] On node 0, zone DMA32: 35 pages in unavailable ranges
> [    0.070162][    T0] ACPI: PM-Timer IO Port: 0x608
> [    0.070207][    T0] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
> [    0.070259][    T0] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI 0-23
> [    0.070278][    T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> [    0.070291][    T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
> [    0.070304][    T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
> [    0.070316][    T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high level)
> [    0.070328][    T0] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high level)
> [    0.070360][    T0] ACPI: Using ACPI (MADT) for SMP configuration information
> [    0.070367][    T0] ACPI: HPET id: 0x8086a201 base: 0xfed00000
> [    0.070387][    T0] TSC deadline timer available
> [    0.070408][    T0] CPU topo: Max. logical packages:   1
> [    0.070414][    T0] CPU topo: Max. logical dies:       1
> [    0.070420][    T0] CPU topo: Max. dies per package:   1
> [    0.070441][    T0] CPU topo: Max. threads per core:   1
> [    0.070447][    T0] CPU topo: Num. cores per package:     4
> [    0.070454][    T0] CPU topo: Num. threads per package:   4
> [    0.070460][    T0] CPU topo: Allowing 4 present CPUs plus 0 hotplug CPUs
> [    0.070540][    T0] kvm-guest: APIC: eoi() replaced with kvm_guest_apic_eoi_write()
> [    0.070574][    T0] kvm-guest: KVM setup pv remote TLB flush
> [    0.070582][    T0] kvm-guest: setup PV sched yield
> [    0.070667][    T0] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
> [    0.070685][    T0] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x0009ffff]
> [    0.070695][    T0] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000effff]
> [    0.070704][    T0] PM: hibernation: Registered nosave memory: [mem 0x000f0000-0x000fffff]
> [    0.070719][    T0] [mem 0x80000000-0xfeffbfff] available for PCI devices
> [    0.070729][    T0] Booting paravirtualized kernel on KVM
> [    0.070743][    T0] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
> [    0.154769][    T0] No bootconfig data provided, so skipping bootconfig
> [    0.154806][    T0] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:4 nr_cpu_ids:4 nr_node_ids:1
> [    0.157476][    T0] percpu: Embedded 575 pages/cpu s2318336 r8192 d28672 u4194304
> [    0.157774][    T0] kvm-guest: PV spinlocks enabled
> [    0.157793][    T0] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, linear)
> [    0.157812][    T0] Kernel command line: console=tty0 console=ttyS0 root=/dev/vdb1 single
> [    0.161279][    T0] Unknown kernel command line parameters "single", will be passed to user space.
> [    0.161326][    T0] random: crng init done
> [    0.161332][    T0] printk: log buffer data + meta data: 131072 + 458752 = 589824 bytes
> [    0.161623][    T0] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> [    0.161722][    T0] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
> [    0.161939][    T0] Fallback order for Node 0: 0 
> [    0.161957][    T0] Built 1 zonelists, mobility grouping on.  Total pages: 524155
> [    0.161966][    T0] Policy zone: DMA32
> [    0.162301][    T0] mem auto-init: stack:all(pattern), heap alloc:on, heap free:on
> [    0.162311][    T0] mem auto-init: clearing system memory may take some time...
> [    0.386143][    T0] SLUB: HWalign=64, Order=0-1, MinObjects=0, CPUs=4, Nodes=1
> [    0.386180][    T0] kmemleak: Kernel memory leak detector disabled
> [    0.386258][    T0] ODEBUG: selftest passed
> [    0.388868][    T0] ftrace: allocating 401982 entries in 1571 pages
> [    0.394854][    T0] ftrace section at ffffffffb26a0408 sorted properly
> [    1.520886][    T0] ftrace: allocated 1571 pages with 5 groups
> [    1.540405][    T0] Dynamic Preempt: none
> [    1.540866][    T0] Running RCU self tests
> [    1.540874][    T0] Running RCU synchronous self tests
> [    1.540908][    T0] rcu: Preemptible hierarchical RCU implementation.
> [    1.540914][    T0] rcu: 	RCU event tracing is enabled.
> [    1.540918][    T0] rcu: 	RCU lockdep checking is enabled.
> [    1.540923][    T0] rcu: 	RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=4.
> [    1.540932][    T0] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
> [    1.540940][    T0] rcu: 	RCU callback double-/use-after-free debug is enabled.
> [    1.540946][    T0] rcu: 	RCU debug extended QS entry/exit.
> [    1.540951][    T0] 	Trampoline variant of Tasks RCU enabled.
> [    1.540956][    T0] 	Rude variant of Tasks RCU enabled.
> [    1.540960][    T0] 	Tracing variant of Tasks RCU enabled.
> [    1.540966][    T0] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> [    1.540974][    T0] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
> [    1.541080][    T0] Running RCU synchronous self tests
> [    1.541095][    T0] RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
> [    1.541113][    T0] RCU Tasks Rude: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
> [    1.541132][    T0] RCU Tasks Trace: Setting shift to 2 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=4.
> [    1.640708][    T0] NR_IRQS: 524544, nr_irqs: 456, preallocated irqs: 16
> [    1.641458][    T0] rcu: 	Offload RCU callbacks from CPUs: 0-3.
> [    1.641473][    T0] rcu: srcu_init: Setting srcu_struct sizes based on contention.
> [    1.642201][    T0] workqueue: round-robin CPU selection forced, expect performance impact
> [    1.642213][    T0] kfence: initialized - using 2097152 bytes for 255 objects at 0x(____ptrval____)-0x(____ptrval____)
> [    1.646137][    T0] Console: colour VGA+ 80x25
> [    1.646184][    T0] printk: legacy console [tty0] enabled
> [    1.693145][    T0] printk: legacy console [ttyS0] enabled
> [    1.780760][    T0] serial port 0 not yet initialized
> [    1.781824][    T0] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
> [    1.782994][    T0] ... MAX_LOCKDEP_SUBCLASSES:  8
> [    1.783695][    T0] ... MAX_LOCK_DEPTH:          48
> [    1.784388][    T0] ... MAX_LOCKDEP_KEYS:        8192
> [    1.785108][    T0] ... CLASSHASH_SIZE:          4096
> [    1.785818][    T0] ... MAX_LOCKDEP_ENTRIES:     32768
> [    1.786552][    T0] ... MAX_LOCKDEP_CHAINS:      65536
> [    1.787274][    T0] ... CHAINHASH_SIZE:          32768
> [    1.787988][    T0]  memory used by lock dependency info: 6941 kB
> [    1.788816][    T0]  memory used for stack traces: 4224 kB
> [    1.789586][    T0]  per task-struct memory footprint: 2688 bytes
> [    1.790514][    T0] ACPI: Core revision 20240827
> [    1.791630][    T0] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604467 ns
> [    1.793222][    T0] APIC: Switch to symmetric I/O mode setup
> [    1.794188][    T0] x2apic enabled
> [    1.795561][    T0] APIC: Switched APIC routing to: physical x2apic
> [    1.796435][    T0] kvm-guest: APIC: send_IPI_mask() replaced with kvm_send_ipi_mask()
> [    1.797658][    T0] kvm-guest: APIC: send_IPI_mask_allbutself() replaced with kvm_send_ipi_mask_allbutself()
> [    1.799561][    T0] kvm-guest: setup PV IPIs
> [    1.801532][    T0] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
> [    1.802507][    T0] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x325b12d0341, max_idle_ns: 440795304325 ns
> [    1.804104][    T0] Calibrating delay loop (skipped) preset value.. 6986.86 BogoMIPS (lpj=13973720)
> [    1.808177][    T0] x86/cpu: User Mode Instruction Prevention (UMIP) activated
> [    1.809403][    T0] Last level iTLB entries: 4KB 512, 2MB 255, 4MB 127
> [    1.810335][    T0] Last level dTLB entries: 4KB 512, 2MB 255, 4MB 127, 1GB 0
> [    1.811356][    T0] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
> [    1.812716][    T0] Spectre V2 : Mitigation: Retpolines
> [    1.813492][    T0] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
> [    1.814792][    T0] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
> [    1.816455][    T0] Spectre V2 : Enabling Speculation Barrier for firmware calls
> [    1.817549][    T0] RETBleed: Mitigation: untrained return thunk
> [    1.818961][    T0] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
> [    1.820100][    T0] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
> [    1.821413][    T0] Speculative Return Stack Overflow: IBPB-extending microcode not applied!
> [    1.822645][    T0] Speculative Return Stack Overflow: WARNING: See https://kernel.org/doc/html/latest/admin-guide/hw-vuln/srso.html for mitigation options.
> [    1.822659][    T0] Speculative Return Stack Overflow: Vulnerable: Safe RET, no microcode
> [    1.825811][    T0] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
> [    1.827019][    T0] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> [    1.828096][    T0] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> [    1.829203][    T0] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> [    1.830183][    T0] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'compacted' format.
> [    3.987368][    T0] debug: unmapping init [mem 0xffffffffb6ed1000-0xffffffffb6f03fff]
> [    3.989072][    T0] pid_max: default: 4096 minimum: 301
> [    3.990221][    T0] LSM: initializing lsm=lockdown,capability,apparmor,landlock,yama,loadpin,safesetid,tomoyo,bpf,ima,evm
> [    3.994852][    T0] AppArmor: AppArmor initialized
> [    3.996743][    T0] landlock: Up and running.
> [    3.997498][    T0] Yama: becoming mindful.
> [    3.998324][    T0] LoadPin: ready to pin (currently not enforcing)
> [    4.000063][    T0] TOMOYO Linux initialized
> [    4.006069][    T0] LSM support for eBPF active
> [    4.007901][    T0] stackdepot: allocating hash table of 16384 entries via kvcalloc
> [    4.009454][    T0] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
> [    4.010813][    T0] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
> [    4.019136][    T0] kcsan: strict mode configured
> [    4.019938][    T0] Running RCU synchronous self tests
> [    4.020413][    T0] Running RCU synchronous self tests
> [    4.022824][    T1] smpboot: CPU0: AMD Ryzen 9 3950X 16-Core Processor (family: 0x17, model: 0x71, stepping: 0x0)
> [    4.027546][    T1] Running RCU Tasks wait API self tests
> [    4.132934][    T1] Running RCU Tasks Rude wait API self tests
> [    4.135233][    T1] Running RCU Tasks Trace wait API self tests
> [    4.137060][    T1] Performance Events: Fam17h+ core perfctr, AMD PMU driver.
> [    4.138990][    T1] ... version:                0
> [    4.140125][    T1] ... bit width:              48
> [    4.141413][    T1] ... generic registers:      6
> [    4.142672][    T1] ... value mask:             0000ffffffffffff
> [    4.144125][    T1] ... max period:             00007fffffffffff
> [    4.145652][    T1] ... fixed-purpose events:   0
> [    4.147502][    T1] ... event mask:             000000000000003f
> [    4.151367][    T1] signal: max sigframe size: 1776
> [    4.153794][    T1] rcu: Hierarchical SRCU implementation.
> [    4.155197][    T1] rcu: 	Max phase no-delay instances is 1000.
> [    4.158935][    T1] Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
> [    4.380342][   T15] Callback from call_rcu_tasks_trace() invoked.
> [    4.428824][    T1] smp: Bringing up secondary CPUs ...
> [    4.434652][    T1] smpboot: x86: Booting SMP configuration:
> [    4.435728][    T1] .... node  #0, CPUs:      #1 #2 #3
> [    4.453399][    T1] smp: Brought up 1 node, 4 CPUs
> [    4.453627][    T1] ----------------
> [    4.454335][    T1] | NMI testsuite:
> [    4.456138][    T1] --------------------
> [    4.457261][    T1]   remote IPI:  ok  |
> [    4.458782][    T1]    local IPI:  ok  |
> [    4.459690][    T1] --------------------
> [    4.460406][    T1] Good, all   2 testcases passed! |
> [    4.461263][    T1] ---------------------------------
> [    4.462119][    T1] smpboot: Total of 4 processors activated (27947.44 BogoMIPS)
> [    4.492085][   T13] Callback from call_rcu_tasks() invoked.
> [    5.115784][   T49] node 0 deferred pages initialised in 652ms
> [    5.120092][   T49] pgdatinit0 (49) used greatest stack depth: 13864 bytes left
> [    5.120680][    T1] Memory: 1359644K/2096620K available (315392K kernel code, 44584K rwdata, 139208K rodata, 85484K init, 25580K bss, 724252K reserved, 0K cma-reserved)
> [    5.128422][    T1] allocated 4194304 bytes of page_ext
> [    5.139065][    T1] devtmpfs: initialized
> [    5.144116][    T1] x86/mm: Memory block size: 128MB
> [    5.176122][    T1] version magic: 0x42343220
> [    5.196169][    T1] Running RCU synchronous self tests
> [    5.197052][    T1] Running RCU synchronous self tests
> [    5.239377][    T1] DMA-API: preallocated 65536 debug entries
> [    5.240110][    T1] DMA-API: debugging enabled by kernel config
> [    5.241029][    T1] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
> [    5.242597][    T1] futex hash table entries: 16 (order: -1, 2048 bytes, linear)
> [    5.265899][    T1] prandom: seed boundary self test passed
> [    5.279418][    T1] prandom: 100 self tests passed
> [    5.280395][    T1] pinctrl core: initialized pinctrl subsystem
> [    5.309948][    T1] 
> [    5.310403][    T1] *************************************************************
> [    5.310424][    T1] **     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE    **
> [    5.310444][    T1] **                                                         **
> [    5.310464][    T1] **  IOMMU DebugFS SUPPORT HAS BEEN ENABLED IN THIS KERNEL  **
> [    5.312821][    T1] **                                                         **
> [    5.312842][    T1] ** This means that this kernel is built to expose internal **
> [    5.315591][    T1] ** IOMMU data structures, which may compromise security on **
> [    5.315612][    T1] ** your system.                                            **
> [    5.315631][    T1] **                                                         **
> [    5.316867][    T1] ** If you see this message and you are not debugging the   **
> [    5.316888][    T1] ** kernel, report this immediately to your vendor!         **
> [    5.318831][    T1] **                                                         **
> [    5.318852][    T1] **     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE    **
> [    5.318872][    T1] *************************************************************
> [    5.321027][    T1] PM: RTC time: 17:30:28, date: 2024-12-16
> [    5.353605][    T1] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    5.369950][    T1] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic allocations
> [    5.371445][    T1] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> [    5.372805][    T1] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> [    5.374563][    T1] audit: initializing netlink subsys (disabled)
> [    5.377078][   T54] audit: type=2000 audit(1734370228.953:1): state=initialized audit_enabled=0 res=1
> [    5.390662][    T1] kcsan: selftest: 3/3 tests passed
> [    5.420535][    T1] thermal_sys: Registered thermal governor 'fair_share'
> [    5.420570][    T1] thermal_sys: Registered thermal governor 'bang_bang'
> [    5.421658][    T1] thermal_sys: Registered thermal governor 'step_wise'
> [    5.422669][    T1] thermal_sys: Registered thermal governor 'user_space'
> [    5.423689][    T1] thermal_sys: Registered thermal governor 'power_allocator'
> [    5.426639][    T1] EISA bus registered
> [    5.428587][    T1] cpuidle: using governor ladder
> [    5.429257][    T1] cpuidle: using governor menu
> [    5.435595][    T1] NET: Registered PF_QIPCRTR protocol family
> [    5.499562][    T1] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
> [    5.514557][    T1] dca service started, version 1.12.1
> [    5.517775][    T1] PCI: Using configuration type 1 for base access
> [    5.518794][    T1] PCI: Using configuration type 1 for extended access
> [    5.529845][    T1] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
> [    5.537147][    T1] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
> [    5.540174][    T1] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
> [    5.543214][    T1] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
> [    5.545062][    T1] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
> [    5.569577][    T1] cryptd: max_cpu_qlen set to 1000
> [    5.642228][    T1] raid6: avx2x4   gen()  2106 MB/s
> [    5.710561][    T1] raid6: avx2x2   gen()  1236 MB/s
> [    5.778767][    T1] raid6: avx2x1   gen()   682 MB/s
> [    5.779705][    T1] raid6: using algorithm avx2x4 gen() 2106 MB/s
> [    5.846672][    T1] raid6: .... xor() 1525 MB/s, rmw enabled
> [    5.847684][    T1] raid6: using avx2x2 recovery algorithm
> [    5.857729][    T1] gpio-f7188x: Unsupported Fintek device 0xffff
> [    5.858863][    T1] gpio-f7188x: Unsupported Fintek device 0xffff
> [    5.873370][    T1] ACPI: Added _OSI(Module Device)
> [    5.874276][    T1] ACPI: Added _OSI(Processor Device)
> [    5.875173][    T1] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    5.876101][    T1] ACPI: Added _OSI(Processor Aggregator Device)
> [    5.939822][    T1] ACPI: 1 ACPI AML tables successfully acquired and loaded
> [    5.964305][    T1] ACPI: Interpreter enabled
> [    5.965793][    T1] ACPI: PM: (supports S0 S3 S4 S5)
> [    5.966660][    T1] ACPI: Using IOAPIC for interrupt routing
> [    5.977860][    T1] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
> [    5.979446][    T1] PCI: Using E820 reservations for host bridge windows
> [    6.180310][    T1] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    6.181633][    T1] acpi PNP0A03:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI EDR HPX-Type3]
> [    6.209674][    T1] acpiphp: Slot [3] registered
> [    6.211153][    T1] acpiphp: Slot [4] registered
> [    6.212641][    T1] acpiphp: Slot [5] registered
> [    6.214138][    T1] acpiphp: Slot [6] registered
> [    6.215603][    T1] acpiphp: Slot [7] registered
> [    6.217113][    T1] acpiphp: Slot [8] registered
> [    6.218653][    T1] acpiphp: Slot [9] registered
> [    6.220214][    T1] acpiphp: Slot [10] registered
> [    6.221689][    T1] acpiphp: Slot [11] registered
> [    6.223189][    T1] acpiphp: Slot [12] registered
> [    6.224671][    T1] acpiphp: Slot [13] registered
> [    6.226180][    T1] acpiphp: Slot [14] registered
> [    6.227663][    T1] acpiphp: Slot [15] registered
> [    6.229069][    T1] acpiphp: Slot [16] registered
> [    6.230551][    T1] acpiphp: Slot [17] registered
> [    6.232083][    T1] acpiphp: Slot [18] registered
> [    6.233581][    T1] acpiphp: Slot [19] registered
> [    6.235072][    T1] acpiphp: Slot [20] registered
> [    6.236696][    T1] acpiphp: Slot [21] registered
> [    6.238170][    T1] acpiphp: Slot [22] registered
> [    6.240198][    T1] acpiphp: Slot [23] registered
> [    6.241702][    T1] acpiphp: Slot [24] registered
> [    6.243199][    T1] acpiphp: Slot [25] registered
> [    6.244767][    T1] acpiphp: Slot [26] registered
> [    6.246248][    T1] acpiphp: Slot [27] registered
> [    6.247762][    T1] acpiphp: Slot [28] registered
> [    6.249079][    T1] acpiphp: Slot [29] registered
> [    6.250584][    T1] acpiphp: Slot [30] registered
> [    6.252431][    T1] acpiphp: Slot [31] registered
> [    6.253416][    T1] PCI host bridge to bus 0000:00
> [    6.254419][    T1] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
> [    6.255715][    T1] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
> [    6.256588][    T1] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
> [    6.257991][    T1] pci_bus 0000:00: root bus resource [mem 0x80000000-0xfebfffff window]
> [    6.259588][    T1] pci_bus 0000:00: root bus resource [mem 0x100000000-0x17fffffff window]
> [    6.260625][    T1] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    6.262534][    T1] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000 conventional PCI endpoint
> [    6.269704][    T1] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100 conventional PCI endpoint
> [    6.275747][    T1] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180 conventional PCI endpoint
> [    6.278696][    T1] pci 0000:00:01.1: BAR 4 [io  0xc0c0-0xc0cf]
> [    6.280560][    T1] pci 0000:00:01.1: BAR 0 [io  0x01f0-0x01f7]: legacy IDE quirk
> [    6.281858][    T1] pci 0000:00:01.1: BAR 1 [io  0x03f6]: legacy IDE quirk
> [    6.283503][    T1] pci 0000:00:01.1: BAR 2 [io  0x0170-0x0177]: legacy IDE quirk
> [    6.288593][    T1] pci 0000:00:01.1: BAR 3 [io  0x0376]: legacy IDE quirk
> [    6.293874][    T1] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000 conventional PCI endpoint
> [    6.295987][    T1] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed by PIIX4 ACPI
> [    6.296617][    T1] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PIIX4 SMB
> [    6.302219][    T1] pci 0000:00:02.0: [1234:1111] type 00 class 0x030000 conventional PCI endpoint
> [    6.304399][    T1] pci 0000:00:02.0: BAR 0 [mem 0xfd000000-0xfdffffff pref]
> [    6.307558][    T1] pci 0000:00:02.0: BAR 2 [mem 0xfebf0000-0xfebf0fff]
> [    6.312381][    T1] pci 0000:00:02.0: ROM [mem 0xfebe0000-0xfebeffff pref]
> [    6.313749][    T1] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
> [    6.319129][    T1] pci 0000:00:03.0: [8086:100e] type 00 class 0x020000 conventional PCI endpoint
> [    6.321311][    T1] pci 0000:00:03.0: BAR 0 [mem 0xfebc0000-0xfebdffff]
> [    6.323008][    T1] pci 0000:00:03.0: BAR 1 [io  0xc080-0xc0bf]
> [    6.328110][    T1] pci 0000:00:03.0: ROM [mem 0xfeb80000-0xfebbffff pref]
> [    6.368480][    T1] pci 0000:00:04.0: [1af4:1001] type 00 class 0x010000 conventional PCI endpoint
> [    6.371126][    T1] pci 0000:00:04.0: BAR 0 [io  0xc000-0xc07f]
> [    6.372917][    T1] pci 0000:00:04.0: BAR 1 [mem 0xfebf1000-0xfebf1fff]
> [    6.376846][    T1] pci 0000:00:04.0: BAR 4 [mem 0xfe000000-0xfe003fff 64bit pref]
> [    6.439241][    T1] ACPI: PCI: Interrupt link LNKA configured for IRQ 10
> [    6.443375][    T1] ACPI: PCI: Interrupt link LNKB configured for IRQ 10
> [    6.447633][    T1] ACPI: PCI: Interrupt link LNKC configured for IRQ 11
> [    6.452209][    T1] ACPI: PCI: Interrupt link LNKD configured for IRQ 11
> [    6.454833][    T1] ACPI: PCI: Interrupt link LNKS configured for IRQ 9
> [    6.532788][    T1] iommu: Default domain type: Translated
> [    6.533828][    T1] iommu: DMA domain TLB invalidation policy: lazy mode
> [   10.476963][    T1] arm-v7s io-pgtable: self test ok
> [   10.478246][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 32
> [   10.481895][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 36
> [   10.484960][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 40
> [   10.488974][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 42
> [   10.493045][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 44
> [   10.496847][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 48
> [   10.500416][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 32
> [   10.503540][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 36
> [   10.505519][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 40
> [   10.508762][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 42
> [   10.511976][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 44
> [   10.513376][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x02004000, IAS 48
> [   10.515942][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 32
> [   10.521041][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 36
> [   10.522773][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 40
> [   10.524702][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 42
> [   10.529453][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 44
> [   10.533154][    T1] arm-lpae io-pgtable: selftest: pgsize_bitmap 0x20010000, IAS 48
> [   10.536832][    T1] arm-lpae io-pgtable: selftest: completed with 18 PASS 0 FAIL
> [   10.568995][    T1] SCSI subsystem initialized
> [   10.577169][    T1] ACPI: bus type USB registered
> [   10.579609][    T1] usbcore: registered new interface driver usbfs
> [   10.581026][    T1] usbcore: registered new interface driver hub
> [   10.583284][    T1] usbcore: registered new device driver usb
> [   10.598385][    T1] mc: Linux media interface: v0.10
> [   10.600200][    T1] videodev: Linux video capture interface: v2.00
> [   10.604267][    T1] pps_core: LinuxPPS API ver. 1 registered
> [   10.605232][    T1] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> [   10.607396][    T1] PTP clock support registered
> [   10.614713][    T1] EDAC MC: Ver: 3.0.0
> [   10.623250][    T1] scmi_core: SCMI protocol bus registered
> [   10.636772][    T1] FPGA manager framework
> [   10.644710][    T1] Advanced Linux Sound Architecture Driver Initialized.
> [   10.658367][    T1] Bluetooth: Core ver 2.22
> [   10.659535][    T1] NET: Registered PF_BLUETOOTH protocol family
> [   10.660519][    T1] Bluetooth: HCI device and connection manager initialized
> [   10.661779][    T1] Bluetooth: HCI socket layer initialized
> [   10.662743][    T1] Bluetooth: L2CAP socket layer initialized
> [   10.663786][    T1] Bluetooth: SCO socket layer initialized
> [   10.664585][    T1] NET: Registered PF_ATMPVC protocol family
> [   10.665569][    T1] NET: Registered PF_ATMSVC protocol family
> [   10.667228][    T1] NetLabel: Initializing
> [   10.668014][    T1] NetLabel:  domain hash size = 128
> [   10.672445][    T1] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
> [   10.674645][    T1] NetLabel:  unlabeled traffic allowed by default
> [   10.685543][    T1] nfc: nfc_init: NFC Core ver 0.1
> [   10.687320][    T1] NET: Registered PF_NFC protocol family
> [   10.688667][    T1] mctp: management component transport protocol core
> [   10.690320][    T1] NET: Registered PF_MCTP protocol family
> [   10.692520][    T1] PCI: Using ACPI for IRQ routing
> [   10.696811][    T1] pci 0000:00:02.0: vgaarb: setting as boot VGA device
> [   10.699721][    T1] pci 0000:00:02.0: vgaarb: bridge control possible
> [   10.700086][    T1] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
> [   10.700186][    T1] vgaarb: loaded
> [   10.711505][    T1] dcdbas dcdbas: Dell Systems Management Base Driver (version 5.6.0-3.4)
> [   10.714089][    T1] dcdbas dcdbas: Dell Systems Management Base Driver (version 5.6.0-3.4)
> [   10.730012][    T1] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
> [   10.731110][    T1] hpet0: 3 comparators, 64-bit 100.000000 MHz counter
> [   10.740331][    T1] clocksource: Switched to clocksource kvm-clock
> [   18.363721][    T1] VFS: Disk quotas dquot_6.6.0
> [   18.365758][    T1] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> [   18.371878][    T1] netfs: FS-Cache loaded
> [   18.376394][    T1] CacheFiles: Loaded
> [   18.379163][    T1] TOMOYO: 2.6.0
> [   18.380280][    T1] Mandatory Access Control activated.
> [   18.386547][    T1] AppArmor: AppArmor Filesystem Enabled
> [   18.388723][    T1] pnp: PnP ACPI init
> [   18.407893][    T1] pnp: PnP ACPI: found 6 devices
> [   18.556385][    T1] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
> [   18.566380][    T1] NET: Registered PF_INET protocol family
> [   18.568004][    T1] IP idents hash table entries: 32768 (order: 6, 262144 bytes, linear)
> [   18.578587][    T1] tcp_listen_portaddr_hash hash table entries: 1024 (order: 4, 81920 bytes, linear)
> [   18.580619][    T1] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
> [   18.582149][    T1] TCP established hash table entries: 16384 (order: 5, 131072 bytes, linear)
> [   18.593140][    T1] TCP bind hash table entries: 16384 (order: 9, 2621440 bytes, linear)
> [   18.600556][    T1] TCP: Hash tables configured (established 16384 bind 16384)
> [   18.603648][    T1] MPTCP token hash table entries: 2048 (order: 5, 196608 bytes, linear)
> [   18.605974][    T1] UDP hash table entries: 1024 (order: 5, 196608 bytes, linear)
> [   18.608270][    T1] UDP-Lite hash table entries: 1024 (order: 5, 196608 bytes, linear)
> [   18.611604][    T1] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [   18.618430][    T1] RPC: Registered named UNIX socket transport module.
> [   18.619773][    T1] RPC: Registered udp transport module.
> [   18.620716][    T1] RPC: Registered tcp transport module.
> [   18.621638][    T1] RPC: Registered tcp-with-tls transport module.
> [   18.622727][    T1] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [   18.638132][    T1] NET: Registered PF_XDP protocol family
> [   18.640298][    T1] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
> [   18.643124][    T1] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
> [   18.645537][    T1] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
> [   18.648405][    T1] pci_bus 0000:00: resource 7 [mem 0x80000000-0xfebfffff window]
> [   18.651392][    T1] pci_bus 0000:00: resource 8 [mem 0x100000000-0x17fffffff window]
> [   18.656263][    T1] pci 0000:00:01.0: PIIX3: Enabling Passive Release
> [   18.658482][    T1] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> [   18.662416][    T1] PCI: CLS 0 bytes, default 64
> [   18.665882][    T1] ACPI: bus type thunderbolt registered
> [   18.680963][    T1] kvm_intel: VMX not supported by CPU 2
> [   18.682418][    T1] kvm_amd: TSC scaling supported
> [   18.683476][    T1] kvm_amd: Nested Virtualization enabled
> [   18.684429][    T1] kvm_amd: Nested Paging enabled
> [   18.685277][    T1] kvm_amd: LBR virtualization supported
> [   18.686247][    T1] kvm_amd: Virtual VMLOAD VMSAVE supported
> [   18.687256][    T1] kvm_amd: Virtual GIF supported
> [   18.771577][    T1] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x325b12d0341, max_idle_ns: 440795304325 ns
> [   18.773933][    T1] mce: Machine check injector initialized
> [   18.805719][    T1] AES CTR mode by8 optimization enabled
> [   18.814729][    T1] AVX512/GFNI instructions are not detected.
> [   18.817638][    T1] Beginning ww mutex selftests
> [   19.274663][    C3] workqueue: test_mutex_work hogged CPU for >10000us 4 times, consider switching to WQ_UNBOUND
> [   21.322810][   T16] stress (stress_inorder_work) failed with -35
> [   25.431462][    T1] All ww mutex selftests passed
> [   25.454244][    T1] ====[ backtrace testing ]===========
> [   25.455172][    T1] Testing a backtrace from process context.
> [   25.456336][    T1] The following trace is a kernel self test and not a bug!
> [   25.457414][    T1] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc2+ #373 5a5c0ce8f09b0b72067981f01985e201a0118bb6
> [   25.458830][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-3.fc41 04/01/2014
> [   25.458830][    T1] Call Trace:
> [   25.458830][    T1]  <TASK>
> [   25.458830][    T1]  dump_stack_lvl+0x1b5/0x2c0
> [   25.458830][    T1]  ? __pfx_backtrace_regression_test+0x40/0x40
> [   25.458830][    T1]  dump_stack+0x1e/0x2a
> [   25.458830][    T1]  backtrace_regression_test+0x54/0x115
> [   25.458830][    T1]  ? __pfx_backtrace_regression_test+0x40/0x40
> [   25.458830][    T1]  ? srso_return_thunk+0x5/0x7f
> [   25.458830][    T1]  ? trace_initcall_start+0x9e/0x240
> [   25.458830][    T1]  ? __pfx_backtrace_regression_test+0x40/0x40
> [   25.458830][    T1]  ? __pfx_backtrace_regression_test+0x40/0x40
> [   25.458830][    T1]  do_one_initcall+0xa7/0x500
> [   25.458830][    T1]  do_initcalls+0x1d5/0x240
> [   25.458830][    T1]  kernel_init_freeable+0x1e4/0x280
> [   25.458830][    T1]  ? __pfx_kernel_init+0x40/0x40
> [   25.458830][    T1]  kernel_init+0x2a/0x280
> [   25.458830][    T1]  ret_from_fork+0x4d/0x80
> [   25.458830][    T1]  ? __pfx_kernel_init+0x40/0x40
> [   25.458830][    T1]  ret_from_fork_asm+0x22/0x80
> [   25.458830][    T1]  </TASK>
> [   25.477500][    T1] Testing a backtrace from BH context.
> [   25.478362][    T1] The following trace is a kernel self test and not a bug!
> [   25.479677][    C2] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc2+ #373 5a5c0ce8f09b0b72067981f01985e201a0118bb6
> [   25.481581][    C2] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-3.fc41 04/01/2014
> [   25.483043][    C2] Call Trace:
> [   25.483090][    C2]  <IRQ>
> [   25.483090][    C2]  dump_stack_lvl+0x1b5/0x2c0
> [   25.483090][    C2]  ? process_one_work+0x8f0/0xb40
> [   25.483090][    C2]  dump_stack+0x1e/0x2a
> [   25.483090][    C2]  backtrace_test_bh_workfn+0x1c/0x40
> [   25.483090][    C2]  process_one_work+0x968/0xb40
> [   25.483090][    C2]  ? process_one_work+0x8f0/0xb40
> [   25.483090][    C2]  ? process_one_work+0x8f0/0xb40
> [   25.483090][    C2]  bh_worker+0x56b/0x640
> [   25.483090][    C2]  ? srso_return_thunk+0x5/0x7f
> [   25.483090][    C2]  workqueue_softirq_action+0xe0/0x140
> [   25.483090][    C2]  tasklet_action+0x19/0x80
> [   25.483090][    C2]  handle_softirqs+0xfe/0x5c0
> [   25.483090][    C2]  ? srso_return_thunk+0x5/0x7f
> [   25.483090][    C2]  ? start_flush_work+0x335/0x880
> [   25.483090][    C2]  do_softirq+0x10c/0x180
> [   25.483090][    C2]  </IRQ>
> [   25.483090][    C2]  <TASK>
> [   25.483090][    C2]  __local_bh_enable_ip+0x148/0x180
> [   25.483090][    C2]  ? start_flush_work+0x335/0x880
> [   25.483090][    C2]  start_flush_work+0x5b5/0x880
> [   25.483090][    C2]  __flush_work+0x10e/0x240
> [   25.483090][    C2]  ? __pfx_wq_barrier_func+0x40/0x40
> [   25.483090][    C2]  flush_work+0x2b/0x40
> [   25.483090][    C2]  ? __pfx_backtrace_regression_test+0x40/0x40
> [   25.483090][    C2]  backtrace_regression_test+0x9c/0x115
> [   25.483090][    C2]  ? __pfx_backtrace_regression_test+0x40/0x40
> [   25.483090][    C2]  ? srso_return_thunk+0x5/0x7f
> [   25.483090][    C2]  ? trace_initcall_start+0x9e/0x240
> [   25.483090][    C2]  ? __pfx_backtrace_regression_test+0x40/0x40
> [   25.483090][    C2]  ? __pfx_backtrace_regression_test+0x40/0x40
> [   25.483090][    C2]  do_one_initcall+0xa7/0x500
> [   25.483090][    C2]  do_initcalls+0x1d5/0x240
> [   25.483090][    C2]  kernel_init_freeable+0x1e4/0x280
> [   25.483090][    C2]  ? __pfx_kernel_init+0x40/0x40
> [   25.483090][    C2]  kernel_init+0x2a/0x280
> [   25.483090][    C2]  ret_from_fork+0x4d/0x80
> [   25.483090][    C2]  ? __pfx_kernel_init+0x40/0x40
> [   25.483090][    C2]  ret_from_fork_asm+0x22/0x80
> [   25.483090][    C2]  </TASK>
> [   25.520336][    T1] Testing a saved backtrace.
> [   25.521105][    T1] The following trace is a kernel self test and not a bug!
> [   25.522190][    T1]  backtrace_regression_test+0xcf/0x115
> [   25.523206][    T1]  do_one_initcall+0xa7/0x500
> [   25.524038][    T1]  do_initcalls+0x1d5/0x240
> [   25.524810][    T1]  kernel_init_freeable+0x1e4/0x280
> [   25.525676][    T1]  kernel_init+0x2a/0x280
> [   25.526426][    T1]  ret_from_fork+0x4d/0x80
> [   25.527260][    T1]  ret_from_fork_asm+0x22/0x80
> [   25.528115][    T1] ====[ end of backtrace testing ]====
> [   25.573922][    T1] Initialise system trusted keyrings
> [   25.575876][    T1] Key type blacklist registered
> [   25.578277][    T1] workingset: timestamp_bits=36 max_order=19 bucket_order=0
> [   30.667766][    T1] dmapool test: size:16   align:16   blocks:8192 time:5087085
> [   35.747199][    T1] dmapool test: size:64   align:64   blocks:8192 time:5075431
> [   40.981623][    T1] dmapool test: size:256  align:256  blocks:8192 time:5217728
> [   42.284524][    T1] dmapool test: size:1024 align:1024 blocks:2048 time:1275536
> [   43.007130][    T1] dmapool test: size:4096 align:4096 blocks:1024 time:698842
> [   48.370682][    T1] dmapool test: size:68   align:32   blocks:8192 time:5316148
> [   48.386172][    T1] zbud: loaded
> [   48.398332][    T1] DLM installed
> [   48.401409][    T1] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [   48.424204][    T1] NFS: Registering the id_resolver key type
> [   48.425870][    T1] Key type id_resolver registered
> [   48.427281][    T1] Key type id_legacy registered
> [   48.428773][    T1] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
> [   48.430969][    T1] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
> [   48.441394][  T100] kworker/u16:6 (100) used greatest stack depth: 13480 bytes left
> [   48.443160][    T1] utf8_selftest: init_test_ucd: Unable to load utf8 table.
> [   48.459821][    T1] Key type cifs.spnego registered
> [   48.462133][    T1] Key type cifs.idmap registered
> [   48.472166][    T1] ntfs3: Enabled Linux POSIX ACLs support
> [   48.473634][    T1] ntfs3: Warning: Activated 64 bits per cluster. Windows does not support this
> [   48.476087][    T1] ntfs3: Read-only LZX/Xpress compression included
> [   48.477890][    T1] efs: 1.0a - http://aeschi.ch.eu.org/efs/
> [   48.478939][    T1] jffs2: version 2.2. (NAND) (SUMMARY)  © 2001-2006 Red Hat, Inc.
> [   48.481936][    T1] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
> [   48.483451][    T1] QNX4 filesystem 0.2.3 registered.
> [   48.485365][    T1] qnx6: QNX6 filesystem 1.0.0 registered.
> [   48.488674][    T1] fuse: init (API version 7.41)
> [   48.494447][    T1] orangefs_debugfs_init: called with debug mask: :none: :0:
> [   48.498194][    T1] orangefs_init: module version upstream loaded
> [   48.499559][    T1] JFS: nTxBlock = 8192, nTxLock = 65536
> [   48.532393][    T1] SGI XFS with ACLs, security attributes, realtime, scrub, repair, quota, fatal assert, debug enabled
> [   48.541259][    T1] 9p: Installing v9fs 9p2000 file system support
> [   48.542937][    T1] NILFS version 2 loaded
> [   48.543688][    T1] befs: version: 0.9.3
> [   48.545367][    T1] ocfs2: Registered cluster interface o2cb
> [   48.547843][    T1] ocfs2: Registered cluster interface user
> [   48.549799][    T1] OCFS2 User DLM kernel interface loaded
> [   48.566077][    T1] gfs2: GFS2 installed
> [   48.582956][    T1] ceph: loaded (mds proto 32)
> [   48.591893][    T1] integrity: Platform Keyring initialized
> [   48.592931][    T1] integrity: Machine keyring initialized
> [   48.593866][    T1] Allocating IMA blacklist keyring.
> [   48.914083][    T1] NET: Registered PF_ALG protocol family
> [   48.915468][    T1] xor: automatically using best checksumming function   avx       
> [   48.916911][    T1] async_tx: api initialized (async)
> [   48.917817][    T1] Key type asymmetric registered
> [   48.918800][    T1] Asymmetric key parser 'x509' registered
> [   48.919849][    T1] Asymmetric key parser 'pkcs8' registered
> [   48.920814][    T1] Key type pkcs7_test registered
> [   48.922361][    T1] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 507)
> [   48.925549][    T1] io scheduler mq-deadline registered
> [   48.926468][    T1] io scheduler kyber registered
> [   48.927484][    T1] io scheduler bfq registered
> [   48.928904][    T1] testing lwq....
> [   48.929569][    T1]  lwq: run some threads
> [   49.092522][    T1]  lwq: dequeue first 50: 36(800) 85(798) 0(802) 23(801) 56(799) 86(798) 24(801) 37(800) 87(798) 57(799)
> [   49.094831][    T1]  lwq: ...  88(798) 25(801) 58(799) 89(798) 38(800) 90(798) 3(802) 60(799) 92(798) 26(801)
> [   49.096884][    T1]  lwq: ...  4(802) 39(800) 93(798) 61(799) 94(798) 1(802) 59(799) 40(800) 27(801) 62(799)
> [   49.098923][    T1]  lwq: ...  95(798) 41(800) 6(802) 5(802) 96(798) 63(799) 97(798) 28(801) 64(799) 91(798)
> [   49.100976][    T1]  lwq: ...  98(798) 2(802) 42(800) 7(802) 99(798) 65(799) 8(802) 43(800) 66(799) 9(802)
> [   49.103008][    T1]  lwq: delete the multiples of 3 (test lwq_for_each_safe())
> [   49.104607][    T1]  lwq: dequeue remaining: 29 67 10 68 44 11 70 46 13 71 31 47 14 73 32 49 17 16 76 50 77 19 74 34 22 80 79 52 53 82 20 83 35 55
> [   49.126218][    T1] test_hexdump: all 1184 tests passed
> [   49.127197][    T1] 
> [   49.127197][    T1] Start testing find_bit() with random-filled bitmap
> [   49.140630][    T1] find_next_bit:                 9710154 ns, 163808 iterations
> [   49.151862][    T1] find_next_zero_bit:            9949113 ns, 163873 iterations
> [   49.165443][    T1] find_last_bit:                12298312 ns, 163808 iterations
> [   49.234082][    T1] find_nth_bit:                 67282340 ns,  16552 iterations
> [   49.299050][    T1] find_first_bit:               63633612 ns,  16553 iterations
> [   50.771083][    T1] find_first_and_bit:         1470719309 ns,  32666 iterations
> [   50.777968][    T1] find_next_and_bit:             5539477 ns,  73517 iterations
> [   50.779283][    T1] 
> [   50.779283][    T1] Start testing find_bit() with sparse bitmap
> [   50.783621][    T1] find_next_bit:                  117050 ns,    654 iterations
> [   50.804884][    T1] find_next_zero_bit:           19752252 ns, 327027 iterations
> [   50.806279][    T1] find_last_bit:                  126016 ns,    654 iterations
> [   50.832973][    T1] find_nth_bit:                 25211188 ns,    653 iterations
> [   50.858323][    T1] find_first_bit:               24086076 ns,    654 iterations
> [   50.859810][    T1] find_first_and_bit:             155783 ns,      1 iterations
> [   50.861222][    T1] find_next_and_bit:              148428 ns,      1 iterations
> [   50.864745][    T1] test_firmware: interface ready
> [   50.866087][    T1] sysctl could not get directory: /debug/test_sysctl/mnt/mnt_error -30
> [   50.869034][    T1] min_heap_test: test passed
> [   50.869829][    T1] test_printf: loaded.
> [   50.878047][    T1] test_printf: all 448 tests passed
> [   50.879000][    T1] test_scanf: loaded.
> [   50.925441][    T1] test_scanf: all 2545 tests passed
> [   50.926322][    T1] test_bitmap: loaded.
> [   50.931352][    T1] test_bitmap: parselist: 14: input is '0-2047:128/256' OK, Time: 6021
> [   50.933153][    T1] test_bitmap: bitmap_print_to_pagebuf: input is '0-32767
> [   50.933153][    T1] ', Time: 13946
> [   51.646468][    T1] test_bitmap: Time spent in test_bitmap_read_perf:	25494540
> [   51.687689][    T1] test_bitmap: Time spent in test_bitmap_write_perf:	39553165
> [   51.705607][    T1] test_bitmap: all 390447 tests passed
> [   51.706544][    T1] PA: 0x000019bfc0000000 for VA: 0xffffb70f80000000
> [   51.707668][    T1] PA: 0x0000000004117b48 for VA: 0xffff9d4fc4117b48
> [   51.709897][    T1] test_memcat_p: test passed
> [   52.400793][    T1] test_meminit: all 11 tests in test_pages passed
> [   52.586246][    T1] test_meminit: all 40 tests in test_kvmalloc passed
> [   60.926960][    T1] test_meminit: all 70 tests in test_kmemcache passed
> [   61.283974][    T1] test_meminit: all 10 tests in test_rcu_persistent passed
> [   61.285210][    T1] test_meminit: all 131 tests passed!
> [   61.338805][    T1] added new 256 MB chunk (total 1 chunks, 256 MB) PFNs [0xafff0000 0xb0000000)
> [   61.388003][    T1] added new 256 MB chunk (total 1 chunks, 256 MB) PFNs [0xaffe0000 0xafff0000)
> [   61.392725][    T1] HMM test module loaded. This is only for testing HMM.
> [   61.394512][    T1] ref_tracker: reference already released.
> [   61.394630][    T1] ref_tracker: allocated in:
> [   61.394630][    T1]  alloctest_ref_tracker_alloc1.constprop.0+0x27/0x40
> [   61.394630][    T1]  test_ref_tracker_init+0x83/0x240
> [   61.394630][    T1]  do_one_initcall+0xa7/0x500
> [   61.394630][    T1]  do_initcalls+0x1d5/0x240
> [   61.394630][    T1]  kernel_init_freeable+0x1e4/0x280
> [   61.394630][    T1]  kernel_init+0x2a/0x280
> [   61.394630][    T1]  ret_from_fork+0x4d/0x80
> [   61.394630][    T1]  ret_from_fork_asm+0x22/0x80
> [   61.394630][    T1] ref_tracker: freed in:
> [   61.394630][    T1]  alloctest_ref_tracker_free.constprop.0+0x22/0x40
> [   61.394630][    T1]  test_ref_tracker_init+0x177/0x240
> [   61.394630][    T1]  do_one_initcall+0xa7/0x500
> [   61.394630][    T1]  do_initcalls+0x1d5/0x240
> [   61.394630][    T1]  kernel_init_freeable+0x1e4/0x280
> [   61.394630][    T1]  kernel_init+0x2a/0x280
> [   61.394630][    T1]  ret_from_fork+0x4d/0x80
> [   61.394630][    T1]  ret_from_fork_asm+0x22/0x80
> [   61.415871][    T1] ------------[ cut here ]------------
> [   61.416777][    T1] WARNING: CPU: 3 PID: 1 at lib/ref_tracker.c:255 ref_tracker_free.cold+0xd9/0xe5
> [   61.418310][    T1] Modules linked in:
> [   61.419104][    T1] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted: G                 N 6.13.0-rc2+ #373 5a5c0ce8f09b0b72067981f01985e201a0118bb6
> [   61.421154][    T1] Tainted: [N]=TEST
> [   61.421846][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-3.fc41 04/01/2014
> [   61.423442][    T1] RIP: 0010:ref_tracker_free.cold+0xd9/0xe5
> [   61.424725][    T1] Code: c7 7b 6f bd aa e8 6e 70 e4 ff 4c 89 e7 e8 a6 5e bc 01 8b 7b 18 e8 9e 03 2f 04 e8 d9 80 8d 01 4c 89 ee 48 89 ef e8 0e 96 f5 12 <0f> 0b bb ea ff ff ff e9 ac 16 2f 04 e8 bd 80 8d 01 0f b6 f3 48 c7
> [   61.427722][    T1] RSP: 0018:ffffb70f80013d40 EFLAGS: 00010246
> [   61.428849][    T1] RAX: 0000000000000000 RBX: ffff9d4fc43a8200 RCX: 0000000000000000
> [   61.430168][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [   61.431557][    T1] RBP: ffffffffb8226d20 R08: 0000000000000000 R09: 0000000000000000
> [   61.432970][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: ffff9d4fc43a8218
> [   61.434293][    T1] R13: 0000000000000282 R14: 0000000002500001 R15: ffff9d4fc43a8210
> [   61.435670][    T1] FS:  0000000000000000(0000) GS:ffff9d503d600000(0000) knlGS:0000000000000000
> [   61.437173][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   61.438238][    T1] CR2: 0000000000000000 CR3: 0000000056520000 CR4: 0000000000350ef0
> [   61.439623][    T1] Call Trace:
> [   61.440507][    T1]  <TASK>
> [   61.441099][    T1]  ? __warn.cold+0x107/0x135
> [   61.441945][    T1]  ? ref_tracker_free.cold+0xd9/0xe5
> [   61.442942][    T1]  ? report_bug+0x223/0x3c0
> [   61.443814][    T1]  ? handle_bug+0x71/0x100
> [   61.444609][    T1]  ? exc_invalid_op+0x17/0x80
> [   61.445450][    T1]  ? asm_exc_invalid_op+0x1a/0x40
> [   61.446398][    T1]  ? ref_tracker_free.cold+0xd9/0xe5
> [   61.447408][    T1]  ? alloctest_ref_tracker_free.constprop.0+0x22/0x40
> [   61.448544][    T1]  ? test_ref_tracker_init+0x199/0x240
> [   61.449504][    T1]  ? do_one_initcall+0xa7/0x500
> [   61.450354][    T1]  ? do_initcalls+0x1d5/0x240
> [   61.451244][    T1]  ? kernel_init_freeable+0x1e4/0x280
> [   61.452207][    T1]  ? kernel_init+0x2a/0x280
> [   61.453023][    T1]  ? ret_from_fork+0x4d/0x80
> [   61.453861][    T1]  ? ret_from_fork_asm+0x22/0x80
> [   61.454865][    T1]  alloctest_ref_tracker_free.constprop.0+0x22/0x40
> [   61.456114][    T1]  test_ref_tracker_init+0x199/0x240
> [   61.457059][    T1]  ? __pfx_test_ref_tracker_init+0x40/0x40
> [   61.458063][    T1]  do_one_initcall+0xa7/0x500
> [   61.459010][    T1]  do_initcalls+0x1d5/0x240
> [   61.459865][    T1]  kernel_init_freeable+0x1e4/0x280
> [   61.460769][    T1]  ? __pfx_kernel_init+0x40/0x40
> [   61.461644][    T1]  kernel_init+0x2a/0x280
> [   61.462441][    T1]  ret_from_fork+0x4d/0x80
> [   61.463333][    T1]  ? __pfx_kernel_init+0x40/0x40
> [   61.464252][    T1]  ret_from_fork_asm+0x22/0x80
> [   61.465209][    T1]  </TASK>
> [   61.465791][    T1] irq event stamp: 15484139
> [   61.466578][    T1] hardirqs last  enabled at (15484149): [<ffffffff910f2868>] __up_console_sem+0x168/0x1c0
> [   61.468267][    T1] hardirqs last disabled at (15484160): [<ffffffff910f284d>] __up_console_sem+0x14d/0x1c0
> [   61.469880][    T1] softirqs last  enabled at (15483640): [<ffffffff90f92f55>] handle_softirqs+0x415/0x5c0
> [   61.471546][    T1] softirqs last disabled at (15483621): [<ffffffff90f93241>] __irq_exit_rcu+0x101/0x180
> [   61.473354][    T1] ---[ end trace 0000000000000000 ]---
> [   61.474606][    T1] ref_tracker: selftest@00000000bb84478e has 1/2 users at
> [   61.474606][    T1]      test_ref_tracker_timer_func+0x2a/0x80
> [   61.474606][    T1]      call_timer_fn+0xf3/0x280
> [   61.474606][    T1]      __run_timers+0x5cc/0x680
> [   61.474606][    T1]      run_timer_base+0xb1/0x100
> [   61.474606][    T1]      run_timer_softirq+0x28/0x80
> [   61.474606][    T1]      handle_softirqs+0xfe/0x5c0
> [   61.474606][    T1]      __irq_exit_rcu+0x101/0x180
> [   61.474606][    T1]      irq_exit_rcu+0xe/0x40
> [   61.474606][    T1]      sysvec_apic_timer_interrupt+0xcf/0x140
> [   61.474606][    T1]      asm_sysvec_apic_timer_interrupt+0x1a/0x40
> [   61.474606][    T1] 
> [   61.474975][    T1] ref_tracker: selftest@00000000bb84478e has 1/2 users at
> [   61.474975][    T1]      alloctest_ref_tracker_alloc1.constprop.0+0x27/0x40
> [   61.474975][    T1]      test_ref_tracker_init+0x77/0x240
> [   61.474975][    T1]      do_one_initcall+0xa7/0x500
> [   61.474975][    T1]      do_initcalls+0x1d5/0x240
> [   61.474975][    T1]      kernel_init_freeable+0x1e4/0x280
> [   61.474975][    T1]      kernel_init+0x2a/0x280
> [   61.474975][    T1]      ret_from_fork+0x4d/0x80
> [   61.474975][    T1]      ret_from_fork_asm+0x22/0x80
> [   61.474975][    T1] 
> [   61.493553][    T1] ------------[ cut here ]------------
> [   61.494468][    T1] WARNING: CPU: 3 PID: 1 at lib/ref_tracker.c:179 ref_tracker_dir_exit+0x27c/0x380
> [   61.496086][    T1] Modules linked in:
> [   61.496816][    T1] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W        N 6.13.0-rc2+ #373 5a5c0ce8f09b0b72067981f01985e201a0118bb6
> [   61.498891][    T1] Tainted: [W]=WARN, [N]=TEST
> [   61.499690][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-3.fc41 04/01/2014
> [   61.501250][    T1] RIP: 0010:ref_tracker_dir_exit+0x27c/0x380
> [   61.502289][    T1] Code: b1 fd 4c 89 e7 e8 e4 51 8d fd 4d 8b 24 24 4c 39 2c 24 0f 85 56 ff ff ff e8 11 6e 5e fd 48 8b 74 24 10 48 89 ef e8 44 83 c6 0e <0f> 0b e8 fd 6d 5e fd 48 8d 5d 4c be 04 00 00 00 ba 04 00 00 00 48
> [   61.505475][    T1] RSP: 0018:ffffb70f80013db0 EFLAGS: 00010246
> [   61.506490][    T1] RAX: 0000000000000000 RBX: ffffffffb8226d78 RCX: 0000000000000000
> [   61.507912][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [   61.509238][    T1] RBP: ffffffffb8226d20 R08: 0000000000000000 R09: 0000000000000000
> [   61.510561][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffffb8226d78
> [   61.511950][    T1] R13: ffffffffb8226d78 R14: ffffffffb8226d78 R15: ffffffffb8226d78
> [   61.513274][    T1] FS:  0000000000000000(0000) GS:ffff9d503d600000(0000) knlGS:0000000000000000
> [   61.514775][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   61.515888][    T1] CR2: 0000000000000000 CR3: 0000000056520000 CR4: 0000000000350ef0
> [   61.517224][    T1] Call Trace:
> [   61.517844][    T1]  <TASK>
> [   61.518421][    T1]  ? __warn.cold+0x107/0x135
> [   61.519318][    T1]  ? ref_tracker_dir_exit+0x27c/0x380
> [   61.520510][    T1]  ? report_bug+0x223/0x3c0
> [   61.521371][    T1]  ? handle_bug+0x71/0x100
> [   61.522178][    T1]  ? exc_invalid_op+0x17/0x80
> [   61.523073][    T1]  ? asm_exc_invalid_op+0x1a/0x40
> [   61.524031][    T1]  ? ref_tracker_dir_exit+0x27c/0x380
> [   61.525042][    T1]  test_ref_tracker_init+0x1f5/0x240
> [   61.525973][    T1]  ? __pfx_test_ref_tracker_init+0x40/0x40
> [   61.527041][    T1]  do_one_initcall+0xa7/0x500
> [   61.527962][    T1]  do_initcalls+0x1d5/0x240
> [   61.528811][    T1]  kernel_init_freeable+0x1e4/0x280
> [   61.529713][    T1]  ? __pfx_kernel_init+0x40/0x40
> [   61.530593][    T1]  kernel_init+0x2a/0x280
> [   61.531456][    T1]  ret_from_fork+0x4d/0x80
> [   61.532311][    T1]  ? __pfx_kernel_init+0x40/0x40
> [   61.533196][    T1]  ret_from_fork_asm+0x22/0x80
> [   61.534153][    T1]  </TASK>
> [   61.534810][    T1] irq event stamp: 15484617
> [   61.535588][    T1] hardirqs last  enabled at (15484627): [<ffffffff910f2868>] __up_console_sem+0x168/0x1c0
> [   61.537414][    T1] hardirqs last disabled at (15484636): [<ffffffff910f284d>] __up_console_sem+0x14d/0x1c0
> [   61.539089][    T1] softirqs last  enabled at (15484212): [<ffffffff90f92f55>] handle_softirqs+0x415/0x5c0
> [   61.540731][    T1] softirqs last disabled at (15484207): [<ffffffff90f93241>] __irq_exit_rcu+0x101/0x180
> [   61.542343][    T1] ---[ end trace 0000000000000000 ]---
> [   61.543315][    T1] test_div64: Starting 64bit/32bit division and modulo test
> [   61.560638][    T1] test_div64: Completed 64bit/32bit division and modulo test, 0.016142247s elapsed
> [   61.572224][    T1] crc32: CRC_LE_BITS = 64, CRC_BE BITS = 64
> [   61.573205][    T1] crc32: self tests passed, processed 225944 bytes in 4609581 nsec
> [   61.579229][    T1] crc32c: CRC_LE_BITS = 64
> [   61.580013][    T1] crc32c: self tests passed, processed 112972 bytes in 2308783 nsec
> [   61.967386][    T1] crc32_combine: 8373 self tests passed
> [   62.346854][    T1] crc32c_combine: 8373 self tests passed
> [   62.350988][    T1] xz_dec_test: module loaded
> [   62.351784][    T1] xz_dec_test: Create a device node with 'mknod xz_dec_test c 505 0' and write .xz files to it.
> [   62.357112][    T1] atomic64_test: passed for x86-64 platform with CX8 and with SSE
> [   62.358513][    T1] glob: 64 self-tests passed, 0 failed
> [   62.359566][    T1] rbtree testing
> [   62.479782][    T1]  -> test 1 (latency of nnodes insert+delete): 419732 cycles
> [   62.604083][    T1]  -> test 2 (latency of nnodes cached insert+delete): 427610 cycles
> [   62.619169][    T1]  -> test 3 (latency of inorder traversal): 39449 cycles
> [   62.620514][    T1]  -> test 4 (latency to fetch first node)
> [   62.621473][    T1]         non-cached: 623 cycles
> [   62.622345][    T1]         cached: 87 cycles
> [   63.255580][    T1] augmented rbtree testing
> [   63.457607][    T1]  -> test 1 (latency of nnodes insert+delete): 705508 cycles
> [   63.663982][    T1]  -> test 2 (latency of nnodes cached insert+delete): 713570 cycles
> [   64.707227][    T1] gpio_it87: no device
> [   64.720568][    T1] usbcore: registered new interface driver gpio-mpsse
> [   64.750427][    T1] gpio_winbond: chip ID at 2e is ffff
> [   64.751406][    T1] gpio_winbond: not an our chip
> [   64.752485][    T1] gpio_winbond: chip ID at 4e is ffff
> [   64.753397][    T1] gpio_winbond: not an our chip
> [   64.796797][    T1] leds_apu: No PC Engines APUv1 board detected. For APUv2,3 support, enable CONFIG_PCENGINES_APU2
> [   64.807406][    T1] leds_ss4200: no LED devices found
> [   64.835995][    T1] SPI driver leds_cr0014114 has no spi_device_id for crane,cr0014114
> [   64.838242][    T1] SPI driver leds_el15203000 has no spi_device_id for crane,el15203000
> [   64.840127][    T1] SPI driver leds_spi_byte has no spi_device_id for ubnt,acb-spi-led
> [   64.864112][    T1] ledtrig-cpu: registered to indicate activity on CPUs
> [   64.879756][    T1] cpcihp_zt5550: ZT5550 CompactPCI Hot Plug Driver version: 0.2
> [   64.881769][    T1] cpcihp_generic: Generic port I/O CompactPCI Hot Plug Driver version: 0.1
> [   64.883202][    T1] cpcihp_generic: not configured, disabling.
> [   64.884617][    T1] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
> [   64.922573][    T1] acpiphp_ibm: ibm_acpiphp_init: acpi_walk_namespace failed
> [   64.965488][    T1] switchtec: loaded.
> [   64.968881][    T1] SPI driver hx8357 has no spi_device_id for himax,hx8369
> [   64.999403][    T1] rivafb_setup START
> [   65.000627][    T1] nvidiafb_setup START
> [   65.004022][    T1] VIA Graphics Integration Chipset framebuffer 2.4 initializing
> [   65.013567][    T1] no IO addresses supplied
> [   65.019640][    T1] hgafb: HGA card not detected.
> [   65.021040][    T1] hgafb hgafb.0: probe with driver hgafb failed with error -22
> [   65.041682][    T1] usbcore: registered new interface driver udlfb
> [   65.044661][    T1] usbcore: registered new interface driver smscufx
> [   65.049881][    T1] hv_vmbus: registering driver hyperv_fb
> [   65.059809][    T1] uvesafb: failed to execute /sbin/v86d
> [   65.060791][    T1] uvesafb: make sure that the v86d helper is installed and executable
> [   65.062145][    T1] uvesafb: Getting VBE info block failed (eax=0x4f00, err=-2)
> [   65.063512][    T1] uvesafb: vbe_init() failed with -22
> [   65.064500][    T1] uvesafb uvesafb.0: probe with driver uvesafb failed with error -22
> [   65.068350][    T1] IPMI message handler: version 39.2
> [   65.070120][    T1] ipmi device interface
> [   65.073336][    T1] ipmi_si: IPMI System Interface driver
> [   65.077713][    T1] ipmi_si: Unable to find any System Interface(s)
> [   65.078831][    T1] ipmi_ssif: IPMI SSIF Interface driver
> [   65.081374][    T1] IPMI Watchdog: driver initialized
> [   65.082257][    T1] IPMI poweroff: Copyright (C) 2004 MontaVista Software - IPMI Powerdown via sys_reboot
> [   65.101967][    T1] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
> [   65.158247][    T1] ERST DBG: ERST support is disabled.
> [   65.169207][    T1] isapnp: Scanning for PnP cards...
> [   65.527216][    T1] isapnp: No Plug & Play device found
> [   65.765895][    T1] ioatdma: Intel(R) QuickData Technology Driver 5.00
> [   65.768432][    T1] idxd driver failed to load without MOVDIR64B.
> [   67.922319][    T1] ACPI: \_SB_.LNKD: Enabled at IRQ 11
> [   73.260968][    T1] N_HDLC line discipline registered with maxframe=4096
> [   73.262151][    T1] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [   73.292531][    T1] 00:04: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
> [   73.308991][    T1] printk: legacy console [ttyS0] disabled
> ** 15016 printk messages dropped **
> [   73.260968][    T1] N_HDLC line discipline registered with maxframe=4096
> [   73.262151][    T1] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [   73.292531][    T1] 00:04: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
> [   73.308991][    T1] printk: legacy console [ttyS0] disabled
> [   73.312470][    T1] serial 00:04: Runtime PM usage count underflow!
> [   73.350562][    T1] 00:04: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
> [   73.351324][    T1] printk: legacy console [ttyS0] enabled
> [   73.448187][    T1] Driver 'dfl-uart' was unable to register with bus_type 'dfl' because the bus was not initialized.
> [   73.463638][    T1] Serial: AMBA driver
> [   73.480306][    T1] msm_serial: driver initialized
> [   73.484878][    T1] Freescale QUICC Engine UART device driver
> [   73.490547][    T1] SuperH (H)SCI(F) driver initialized
> [   73.493567][    T1] STMicroelectronics ASC driver initialized
> [   73.495411][    T1] STM32 USART driver initialized
> [   73.508748][    T1] MOXA Intellio family driver version 6.0k
> [   73.517468][    T1] mmtimer: Hardware unsupported
> [   73.520897][    T1] lp: driver loaded but no devices found
> [   73.521798][    T1] Applicom driver: $Id: ac.c,v 1.30 2000/03/22 16:03:57 dwmw2 Exp $
> [   73.523381][    T1] ac.o: No PCI boards found.
> [   73.524156][    T1] ac.o: For an ISA board you must supply memory and irq parameters.
> [   73.530328][    T1] Non-volatile memory driver v1.3
> [   73.557631][    T1] ------------[ cut here ]------------
> [   73.558546][    T1] module-autoload: duplicate request for module parport_lowlevel
> [   73.560269][    T1] WARNING: CPU: 3 PID: 1 at kernel/module/dups.c:184 kmod_dup_request_exists_wait+0x2b0/0x540
> [   73.561932][    T1] Modules linked in:
> [   73.562793][    T1] CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W        N 6.13.0-rc2+ #373 5a5c0ce8f09b0b72067981f01985e201a0118bb6
> [   73.564839][    T1] Tainted: [W]=WARN, [N]=TEST
> [   73.565638][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-3.fc41 04/01/2014
> [   73.567232][    T1] RIP: 0010:kmod_dup_request_exists_wait+0x2b0/0x540
> [   73.568391][    T1] Code: 12 00 83 e3 01 31 ff 89 de e8 2c 6a 12 00 84 db 0f 84 aa 0c 6a fe e8 5f 66 12 00 4c 89 e6 48 c7 c7 68 0e 1f aa e8 d0 89 db ff <0f> 0b e8 49 66 12 00 0f b6 74 24 06 31 ff e8 fd 69 12 00 45 84 ed
> [   73.571569][    T1] RSP: 0018:ffffb70f80013ce0 EFLAGS: 00010246
> [   73.572625][    T1] RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
> [   73.573981][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [   73.575374][    T1] RBP: ffff9d4fc5411800 R08: 0000000000000000 R09: 0000000000000000
> [   73.576745][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: ffffb70f80013d40
> [   73.578062][    T1] R13: 0000000000000001 R14: ffffb70f80013d24 R15: 001fffffffc00000
> [   73.579435][    T1] FS:  0000000000000000(0000) GS:ffff9d503d600000(0000) knlGS:0000000000000000
> [   73.580934][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   73.581995][    T1] CR2: 0000000000000000 CR3: 0000000056520000 CR4: 0000000000350ef0
> [   73.583379][    T1] Call Trace:
> [   73.584056][    T1]  <TASK>
> [   73.584636][    T1]  ? __warn.cold+0x107/0x135
> [   73.585475][    T1]  ? kmod_dup_request_exists_wait+0x2b0/0x540
> [   73.587147][    T1]  ? report_bug+0x223/0x3c0
> [   73.588524][    T1]  ? handle_bug+0x71/0x100
> [   73.589762][    T1]  ? exc_invalid_op+0x17/0x80
> [   73.591302][    T1]  ? asm_exc_invalid_op+0x1a/0x40
> [   73.593610][    T1]  ? kmod_dup_request_exists_wait+0x2b0/0x540
> [   73.596021][    T1]  __request_module+0x1fc/0x400
> [   73.597509][    T1]  __parport_register_driver+0x140/0x180
> [   73.599132][    T1]  ppdev_init+0xa1/0x140
> [   73.600388][    T1]  ? __pfx_ppdev_init+0x40/0x40
> [   73.601236][    T1]  do_one_initcall+0xa7/0x500
> [   73.602282][    T1]  do_initcalls+0x1d5/0x240
> [   73.603211][    T1]  kernel_init_freeable+0x1e4/0x280
> [   73.604115][    T1]  ? __pfx_kernel_init+0x40/0x40
> [   73.604991][    T1]  kernel_init+0x2a/0x280
> [   73.605777][    T1]  ret_from_fork+0x4d/0x80
> [   73.606591][    T1]  ? __pfx_kernel_init+0x40/0x40
> [   73.607529][    T1]  ret_from_fork_asm+0x22/0x80
> [   73.608528][    T1]  </TASK>
> [   73.609111][    T1] irq event stamp: 18153181
> [   73.609880][    T1] hardirqs last  enabled at (18153191): [<ffffffff910f2868>] __up_console_sem+0x168/0x1c0
> [   73.611546][    T1] hardirqs last disabled at (18153202): [<ffffffff910f284d>] __up_console_sem+0x14d/0x1c0
> [   73.613199][    T1] softirqs last  enabled at (18153104): [<ffffffff90f92f55>] handle_softirqs+0x415/0x5c0
> [   73.614846][    T1] softirqs last disabled at (18153093): [<ffffffff90f93241>] __irq_exit_rcu+0x101/0x180
> [   73.616440][    T1] ---[ end trace 0000000000000000 ]---
> [   73.617365][    T1] ppdev: user-space parallel port driver
> [   73.618543][    T1] telclk_interrupt = 0xf non-mcpbl0010 hw.
> [   73.619785][    T1] smapi::smapi_init, ERROR invalid usSmapiID
> [   73.620803][    T1] mwave: tp3780i::tp3780I_InitializeBoardData: Error: SMAPI is not available on this machine
> [   73.622381][    T1] mwave: mwavedd::mwave_init: Error: Failed to initialize board data
> [   73.623753][    T1] mwave: mwavedd::mwave_init: Error: Failed to initialize
> [   73.624925][    T1] Linux agpgart interface v0.103
> [   73.630177][    T1] Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 seconds, margin is 60 seconds).
> [   73.645164][    T1] usbcore: registered new interface driver xillyusb
> [   73.666788][    T1] ACPI: bus type drm_connector registered
> [   73.675138][    T1] [drm] radeon kernel modesetting enabled.
> [   73.677037][    T1] [drm] amdgpu kernel modesetting enabled.
> [   73.680257][    T1] amdgpu: Virtual CRAT table created for CPU
> [   73.682468][    T1] amdgpu: Topology: Add CPU node
> [   73.684983][    T1] **************************************************************
> [   73.686200][    T1] **     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE     **
> [   73.689714][    T1] **                                                          **
> [   73.690996][    T1] ** CONFIG_DRM_I915_REPLAY_GPU_HANGS_API builds are intended **
> [   73.692225][    T1] ** for specific userspace graphics stack developers only!   **
> [   73.693434][    T1] **                                                          **
> [   73.694695][    T1] ** If you are seeing this message please report this to the **
> [   73.695919][    T1] ** provider of your kernel build.                           **
> [   73.697174][    T1] **                                                          **
> [   73.698578][    T1] **     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE     **
> [   73.699850][    T1] **************************************************************
> [   73.723580][    T1] [drm] Initialized vgem 1.0.0 for vgem on minor 0
> [   73.749611][    T1] [drm] Initialized vkms 1.0.0 for vkms on minor 1
> [   73.928971][    T1] Console: switching to colour frame buffer device 128x48
> [   73.989849][    T1] platform vkms: [drm] fb0: vkmsdrmfb frame buffer device
> [   74.009342][    T1] usbcore: registered new interface driver udl
> [   74.077481][    T1] SPI driver abt-y030xx067a has no spi_device_id for abt,y030xx067a
> [   74.088805][    T1] SPI driver panel-ilitek-ili9322 has no spi_device_id for dlink,dir-685-panel
> [   74.090492][    T1] SPI driver panel-ilitek-ili9322 has no spi_device_id for ilitek,ili9322
> [   74.094556][    T1] SPI driver panel-innolux-ej030na has no spi_device_id for innolux,ej030na
> [   74.106367][    T1] SPI driver nt39016 has no spi_device_id for kingdisplay,kd035g6-54nt
> [   74.116623][    T1] SPI driver s6d27a1-panel has no spi_device_id for samsung,s6d27a1
> [   74.120701][    T1] SPI driver panel-samsung-s6e63m0 has no spi_device_id for samsung,s6e63m0
> [   74.177273][    T1] bochs-drm 0000:00:02.0: vgaarb: deactivate vga console
> [   74.179388][    T1] [drm] Found bochs VGA, ID 0xb0c5.
> [   74.180931][    T1] [drm] Framebuffer size 16384 kB @ 0xfd000000, mmio @ 0xfebf0000.
> [   74.199314][    T1] [drm] Initialized bochs-drm 1.0.0 for 0000:00:02.0 on minor 2
> [   74.265834][    T1] fbcon: bochs-drmdrmfb (fb1) is primary device
> [   74.265882][    T1] fbcon: Remapping primary device, fb1, to tty 1-63
> [   79.736367][    T1] bochs-drm 0000:00:02.0: [drm] fb1: bochs-drmdrmfb frame buffer device
> [   79.800872][    T1] bochs-drm 0000:00:02.0: vgaarb: deactivate vga console
> [   79.802400][    T1] BUG: kernel NULL pointer dereference, address: 000000000000020c
> [   79.802448][    T1] #PF: supervisor write access in kernel mode
> [   79.802498][    T1] #PF: error_code(0x0002) - not-present page
> [   79.802545][    T1] PGD 0 P4D 0 
> [   79.802622][    T1] Oops: Oops: 0002 [#1] PREEMPT SMP DEBUG_PAGEALLOC NOPTI
> [   79.802669][    T1] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W        N 6.13.0-rc2+ #373 5a5c0ce8f09b0b72067981f01985e201a0118bb6
> [   79.802669][    T1] Tainted: [W]=WARN, [N]=TEST
> [   79.802669][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-3.fc41 04/01/2014
> [   79.802669][    T1] RIP: 0010:fbcon_cursor+0xa9/0x3c0
> [   79.802669][    T1] Code: c0 05 00 00 66 89 44 24 06 e8 f3 35 2a fd 0f b7 bb c0 05 00 00 e8 27 b8 e9 fc 49 8d bc 24 0c 02 00 00 49 89 c7 e8 d7 3d 2a fd <45> 89 bc 24 0c 02 00 00 48 8d bd e0 05 00 00 e8 c3 3b 2a fd 44 8b
> [   79.802669][    T1] RSP: 0018:ffffb70f800136c0 EFLAGS: 00010046
> [   79.802669][    T1] RAX: 0000000000000000 RBX: ffff9d4fc10a8800 RCX: 0000000000000000
> [   79.802669][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [   79.802669][    T1] RBP: ffff9d4fc54ba800 R08: 0000000000000000 R09: 0000000000000000
> [   79.802669][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> [   79.802669][    T1] R13: 0000000000000000 R14: ffff9d4fc54bade8 R15: 0000000000000032
> [   79.802669][    T1] FS:  0000000000000000(0000) GS:ffff9d503d200000(0000) knlGS:0000000000000000
> [   79.802669][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   79.802669][    T1] CR2: 000000000000020c CR3: 0000000056520000 CR4: 0000000000350ef0
> [   79.802669][    T1] Call Trace:
> [   79.802669][    T1]  <TASK>
> [   79.802669][    T1]  ? __die+0x23/0x80
> [   79.802669][    T1]  ? page_fault_oops+0x21c/0x240
> [   79.802669][    T1]  ? do_user_addr_fault+0x893/0x1180
> [   79.802669][    T1]  ? srso_return_thunk+0x5/0x7f
> [   79.802669][    T1]  ? exc_page_fault+0x3f/0x180
> [   79.802669][    T1]  ? exc_page_fault+0x87/0x180
> [   79.802669][    T1]  ? asm_exc_page_fault+0x26/0x40
> [   79.802669][    T1]  ? fbcon_cursor+0xa9/0x3c0
> [   79.802669][    T1]  hide_cursor+0x66/0x1c0
> [   79.802669][    T1]  vt_console_print+0x9b1/0xa40
> [   79.802669][    T1]  ? srso_return_thunk+0x5/0x7f
> [   79.802669][    T1]  ? irq_trace+0x84/0xc0
> [   79.802669][    T1]  ? srso_return_thunk+0x5/0x7f
> [   79.802669][    T1]  ? console_emit_next_record+0x1fe/0x440
> [   79.802669][    T1]  console_emit_next_record+0x232/0x440
> [   79.802669][    T1]  ? console_emit_next_record+0x1fe/0x440
> [   79.802669][    T1]  console_flush_all+0x590/0x7c0
> [   79.802669][    T1]  ? console_flush_all+0x26/0x7c0
> [   79.802669][    T1]  console_unlock+0xf9/0x280
> [   79.802669][    T1]  vprintk_emit+0x572/0x5c0
> [   79.802669][    T1]  dev_vprintk_emit+0x70/0xc0
> [   79.802669][    T1]  ? __mutex_lock+0x380/0xd40
> [   79.802669][    T1]  dev_printk_emit+0x7f/0xc0
> [   79.802669][    T1]  __dev_printk+0x89/0x100
> [   79.802669][    T1]  _dev_info+0xba/0xf5
> [   79.802669][    T1]  vga_remove_vgacon.cold+0x18/0xc0
> [   79.802669][    T1]  aperture_remove_conflicting_pci_devices+0x142/0x1c0
> [   79.802669][    T1]  ? __pfx_bochs_pci_probe+0x40/0x40
> [   79.802669][    T1]  bochs_pci_probe+0x30/0x380
> [   79.802669][    T1]  local_pci_probe+0x88/0x100
> [   79.802669][    T1]  pci_call_probe+0x126/0x340
> [   79.802669][    T1]  ? srso_return_thunk+0x5/0x7f
> [   79.802669][    T1]  ? pci_match_device+0x287/0x380
> [   79.802669][    T1]  pci_device_probe+0x154/0x280
> [   79.802669][    T1]  ? __pfx_pci_device_probe+0x40/0x40
> [   79.802669][    T1]  really_probe+0x411/0x780
> [   79.802669][    T1]  __driver_probe_device+0x194/0x280
> [   79.802669][    T1]  driver_probe_device+0x6f/0x1c0
> [   79.802669][    T1]  __driver_attach+0x204/0x380
> [   79.802669][    T1]  ? __pfx___driver_attach+0x40/0x40
> [   79.802669][    T1]  bus_for_each_dev+0xe3/0x180
> [   79.802669][    T1]  driver_attach+0x3a/0x80
> [   79.802669][    T1]  bus_add_driver+0x1fd/0x3c0
> [   79.802669][    T1]  driver_register+0x11d/0x1c0
> [   79.802669][    T1]  __pci_register_driver+0x105/0x140
> [   79.802669][    T1]  bochs_pci_driver_init+0x8a/0xc0
> [   79.802669][    T1]  ? __pfx_bochs_pci_driver_init+0x40/0x40
> [   79.802669][    T1]  do_one_initcall+0xa7/0x500
> [   79.802669][    T1]  do_initcalls+0x1d5/0x240
> [   79.802669][    T1]  kernel_init_freeable+0x1e4/0x280
> [   79.802669][    T1]  ? __pfx_kernel_init+0x40/0x40
> [   79.802669][    T1]  kernel_init+0x2a/0x280
> [   79.802669][    T1]  ret_from_fork+0x4d/0x80
> [   79.802669][    T1]  ? __pfx_kernel_init+0x40/0x40
> [   79.802669][    T1]  ret_from_fork_asm+0x22/0x80
> [   79.802669][    T1]  </TASK>
> [   79.802669][    T1] Modules linked in:
> [   79.802669][    T1] CR2: 000000000000020c
> [   79.802669][    T1] ---[ end trace 0000000000000000 ]---
> [   79.802669][    T1] RIP: 0010:fbcon_cursor+0xa9/0x3c0
> [   79.802669][    T1] Code: c0 05 00 00 66 89 44 24 06 e8 f3 35 2a fd 0f b7 bb c0 05 00 00 e8 27 b8 e9 fc 49 8d bc 24 0c 02 00 00 49 89 c7 e8 d7 3d 2a fd <45> 89 bc 24 0c 02 00 00 48 8d bd e0 05 00 00 e8 c3 3b 2a fd 44 8b
> [   79.802669][    T1] RSP: 0018:ffffb70f800136c0 EFLAGS: 00010046
> [   79.802669][    T1] RAX: 0000000000000000 RBX: ffff9d4fc10a8800 RCX: 0000000000000000
> [   79.802669][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> [   79.802669][    T1] RBP: ffff9d4fc54ba800 R08: 0000000000000000 R09: 0000000000000000
> [   79.802669][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> [   79.802669][    T1] R13: 0000000000000000 R14: ffff9d4fc54bade8 R15: 0000000000000032
> [   79.802669][    T1] FS:  0000000000000000(0000) GS:ffff9d503d200000(0000) knlGS:0000000000000000
> [   79.802669][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   79.802669][    T1] CR2: 000000000000020c CR3: 0000000056520000 CR4: 0000000000350ef0
> [   79.802669][    T1] Kernel panic - not syncing: Fatal exception
> [   79.802669][    T1] Kernel Offset: 0xe800000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> [   79.802669][    T1] ---[ end Kernel panic - not syncing: Fatal exception ]---
> 
> 
> 
> > Best regards
> > Thomas
> > 
> > [1]
> > https://elixir.bootlin.com/linux/v6.12.5/source/drivers/pci/vgaarb.c#L173
> > 
> > 
> > > 
> > > [   73.569852][    T1] bochs-drm 0000:00:02.0: vgaarb: deactivate vga console
> > > [   73.571802][    T1] [drm] Found bochs VGA, ID 0xb0c5.
> > > [   73.572787][    T1] [drm] Framebuffer size 16384 kB @ 0xfd000000, mmio @ 0xfebf0000.
> > > [   73.581626][    T1] [drm] Initialized bochs-drm 1.0.0 for 0000:00:02.0 on minor 2
> > > [   73.650048][    T1] fbcon: bochs-drmdrmfb (fb1) is primary device
> > > [   73.650134][    T1] fbcon: Remapping primary device, fb1, to tty 1-63
> > > [   79.276550][    T1] bochs-drm 0000:00:02.0: [drm] fb1: bochs-drmdrmfb frame buffer device
> > > [   79.346726][    T1] bochs-drm 0000:00:02.0: vgaarb: deactivate vga console
> > > [   79.348731][    T1] BUG: kernel NULL pointer dereference, address: 000000000000020c
> > > [   79.348799][    T1] #PF: supervisor write access in kernel mode
> > > [   79.348857][    T1] #PF: error_code(0x0002) - not-present page
> > > [   79.348913][    T1] PGD 0 P4D 0
> > > [   79.348999][    T1] Oops: Oops: 0002 [#1] PREEMPT SMP DEBUG_PAGEALLOC NOPTI
> > > [   79.349107][    T1] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W        N 6.13.0-rc2+ #373 5a5c0ce8f09b0b72067981f01985e201a0118bb6
> > > [   79.349268][    T1] Tainted: [W]=WARN, [N]=TEST
> > > [   79.349313][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-3.fc41 04/01/2014
> > > [   79.349377][    T1] RIP: 0010:fbcon_cursor+0xa9/0x3c0
> > > [   79.349524][    T1] Code: c0 05 00 00 66 89 44 24 06 e8 f3 35 2a fd 0f b7 bb c0 05 00 00 e8 27 b8 e9 fc 49 8d bc 24 0c 02 00 00 49 89 c7 e8 d7 3d 2a fd <45> 89 bc 24 0c 02 00 00 48 8d bd e0 05 00 00 e8 c3 3b 2a fd 44 8b
> > > [   79.349628][    T1] RSP: 0018:ffffb927800136c0 EFLAGS: 00010046
> > > [   79.349716][    T1] RAX: 0000000000000000 RBX: ffff9835810a8800 RCX: 0000000000000000
> > > [   79.349808][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> > > [   79.349879][    T1] RBP: ffff983585d07000 R08: 0000000000000000 R09: 0000000000000000
> > > [   79.349952][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> > > [   79.350024][    T1] R13: 0000000000000000 R14: ffff983585d075e8 R15: 0000000000000032
> > > [   79.350101][    T1] FS:  0000000000000000(0000) GS:ffff9835fd200000(0000) knlGS:0000000000000000
> > > [   79.350196][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [   79.350278][    T1] CR2: 000000000000020c CR3: 000000004d920000 CR4: 0000000000350ef0
> > > [   79.350344][    T1] Call Trace:
> > > [   79.350373][    T1]  <TASK>
> > > [   79.350413][    T1]  ? __die+0x23/0x80
> > > [   79.350540][    T1]  ? page_fault_oops+0x21c/0x240
> > > [   79.350675][    T1]  ? do_user_addr_fault+0x893/0x1180
> > > [   79.350798][    T1]  ? srso_return_thunk+0x5/0x7f
> > > [   79.350904][    T1]  ? exc_page_fault+0x3f/0x180
> > > [   79.351066][    T1]  ? exc_page_fault+0x87/0x180
> > > [   79.351211][    T1]  ? asm_exc_page_fault+0x26/0x40
> > > [   79.351379][    T1]  ? fbcon_cursor+0xa9/0x3c0
> > > [   79.351542][    T1]  hide_cursor+0x66/0x1c0
> > > [   79.351656][    T1]  vt_console_print+0x9b1/0xa40
> > > [   79.351813][    T1]  ? srso_return_thunk+0x5/0x7f
> > > [   79.351920][    T1]  ? irq_trace+0x84/0xc0
> > > [   79.352029][    T1]  ? srso_return_thunk+0x5/0x7f
> > > [   79.352153][    T1]  ? console_emit_next_record+0x1fe/0x440
> > > [   79.352254][    T1]  console_emit_next_record+0x232/0x440
> > > [   79.352333][    T1]  ? console_emit_next_record+0x1fe/0x440
> > > [   79.352450][    T1]  console_flush_all+0x590/0x7c0
> > > [   79.352531][    T1]  ? console_flush_all+0x26/0x7c0
> > > [   79.352601][    T1]  console_unlock+0xf9/0x280
> > > [   79.352601][    T1]  vprintk_emit+0x572/0x5c0
> > > [   79.352601][    T1]  dev_vprintk_emit+0x70/0xc0
> > > [   79.352601][    T1]  ? __mutex_lock+0x380/0xd40
> > > [   79.352601][    T1]  dev_printk_emit+0x7f/0xc0
> > > [   79.352601][    T1]  __dev_printk+0x89/0x100
> > > [   79.352601][    T1]  _dev_info+0xba/0xf5
> > > [   79.352601][    T1]  vga_remove_vgacon.cold+0x18/0xc0
> > > [   79.352601][    T1]  aperture_remove_conflicting_pci_devices+0x142/0x1c0
> > > [   79.352601][    T1]  ? __pfx_bochs_pci_probe+0x40/0x40
> > > [   79.352601][    T1]  bochs_pci_probe+0x30/0x380
> > > [   79.352601][    T1]  local_pci_probe+0x88/0x100
> > > [   79.352601][    T1]  pci_call_probe+0x126/0x340
> > > [   79.352601][    T1]  ? srso_return_thunk+0x5/0x7f
> > > [   79.352601][    T1]  ? pci_match_device+0x287/0x380
> > > [   79.352601][    T1]  pci_device_probe+0x154/0x280
> > > [   79.352601][    T1]  ? __pfx_pci_device_probe+0x40/0x40
> > > [   79.352601][    T1]  really_probe+0x411/0x780
> > > [   79.352601][    T1]  __driver_probe_device+0x194/0x280
> > > [   79.352601][    T1]  driver_probe_device+0x6f/0x1c0
> > > [   79.352601][    T1]  __driver_attach+0x204/0x380
> > > [   79.352601][    T1]  ? __pfx___driver_attach+0x40/0x40
> > > [   79.352601][    T1]  bus_for_each_dev+0xe3/0x180
> > > [   79.352601][    T1]  driver_attach+0x3a/0x80
> > > [   79.352601][    T1]  bus_add_driver+0x1fd/0x3c0
> > > [   79.352601][    T1]  driver_register+0x11d/0x1c0
> > > [   79.352601][    T1]  __pci_register_driver+0x105/0x140
> > > [   79.352601][    T1]  bochs_pci_driver_init+0x8a/0xc0
> > > [   79.352601][    T1]  ? __pfx_bochs_pci_driver_init+0x40/0x40
> > > [   79.352601][    T1]  do_one_initcall+0xa7/0x500
> > > [   79.352601][    T1]  do_initcalls+0x1d5/0x240
> > > [   79.352601][    T1]  kernel_init_freeable+0x1e4/0x280
> > > [   79.352601][    T1]  ? __pfx_kernel_init+0x40/0x40
> > > [   79.352601][    T1]  kernel_init+0x2a/0x280
> > > [   79.352601][    T1]  ret_from_fork+0x4d/0x80
> > > [   79.352601][    T1]  ? __pfx_kernel_init+0x40/0x40
> > > [   79.352601][    T1]  ret_from_fork_asm+0x22/0x80
> > > [   79.352601][    T1]  </TASK>
> > > [   79.352601][    T1] Modules linked in:
> > > [   79.352601][    T1] CR2: 000000000000020c
> > > [   79.352601][    T1] ---[ end trace 0000000000000000 ]---
> > > [   79.352601][    T1] RIP: 0010:fbcon_cursor+0xa9/0x3c0
> > > [   79.352601][    T1] Code: c0 05 00 00 66 89 44 24 06 e8 f3 35 2a fd 0f b7 bb c0 05 00 00 e8 27 b8 e9 fc 49 8d bc 24 0c 02 00 00 49 89 c7 e8 d7 3d 2a fd <45> 89 bc 24 0c 02 00 00 48 8d bd e0 05 00 00 e8 c3 3b 2a fd 44 8b
> > > [   79.352601][    T1] RSP: 0018:ffffb927800136c0 EFLAGS: 00010046
> > > [   79.352601][    T1] RAX: 0000000000000000 RBX: ffff9835810a8800 RCX: 0000000000000000
> > > [   79.352601][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> > > [   79.352601][    T1] RBP: ffff983585d07000 R08: 0000000000000000 R09: 0000000000000000
> > > [   79.352601][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> > > [   79.352601][    T1] R13: 0000000000000000 R14: ffff983585d075e8 R15: 0000000000000032
> > > [   79.352601][    T1] FS:  0000000000000000(0000) GS:ffff9835fd200000(0000) knlGS:0000000000000000
> > > [   79.352601][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > [   79.352601][    T1] CR2: 000000000000020c CR3: 000000004d920000 CR4: 0000000000350ef0
> > > [   79.352601][    T1] Kernel panic - not syncing: Fatal exception
> > > [   79.352601][    T1] Kernel Offset: 0xf800000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
> > > [   79.352601][    T1] ---[ end Kernel panic - not syncing: Fatal exception ]---
> > > 
> > > > Best regards
> > > > Thomas
> > > > 
> > > > 
> > > > > Dave
> > > > > 
> > > > -- 
> > > > --
> > > > Thomas Zimmermann
> > > > Graphics Driver Developer
> > > > SUSE Software Solutions Germany GmbH
> > > > Frankenstrasse 146, 90461 Nuernberg, Germany
> > > > GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> > > > HRB 36809 (AG Nuernberg)
> > > >  From bebba3b34d5df5aa7c882f080633b43ddb87f4ad Mon Sep 17 00:00:00 2001
> > > > From: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Date: Mon, 16 Dec 2024 09:21:46 +0100
> > > > Subject: [PATCH] drm/bochs: Do not put DRM device in PCI remove callback
> > > > 
> > > > Removing the bochs PCI device should mark the DRM device as unplugged
> > > > without removing it. Hence clear the respective call to drm_dev_put()
> > > > from bochs_pci_remove().
> > > > 
> > > > Fixes a double unref in devm_drm_dev_init_release(). An example error
> > > > message is shown below:
> > > > 
> > > > [   32.958338] BUG: KASAN: use-after-free in drm_dev_put.part.0+0x1b/0x90
> > > > [   32.958850] Write of size 4 at addr ffff888152134004 by task (udev-worker)/591
> > > > [   32.959574] CPU: 3 UID: 0 PID: 591 Comm: (udev-worker) Tainted: G            E      6.13.0-rc2-1-default+ #3417
> > > > [   32.960316] Tainted: [E]=UNSIGNED_MODULE
> > > > [   32.960637] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.3-2-gc13ff2cd-prebuilt.qemu.org 04/01/2014
> > > > [   32.961429] Call Trace:
> > > > [   32.961433]  <TASK>
> > > > [   32.961439]  dump_stack_lvl+0x68/0x90
> > > > [   32.961452]  print_address_description.constprop.0+0x88/0x330
> > > > [   32.961461]  ? preempt_count_sub+0x14/0xc0
> > > > [   32.961473]  print_report+0xe2/0x1d0
> > > > [   32.961479]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > [   32.963725]  ? __virt_addr_valid+0x143/0x320
> > > > [   32.964077]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > [   32.964463]  ? drm_dev_put.part.0+0x1b/0x90
> > > > [   32.964817]  kasan_report+0xce/0x1a0
> > > > [   32.965123]  ? drm_dev_put.part.0+0x1b/0x90
> > > > [   32.965474]  kasan_check_range+0xff/0x1c0
> > > > [   32.965806]  drm_dev_put.part.0+0x1b/0x90
> > > > [   32.966138]  release_nodes+0x84/0xc0
> > > > [   32.966447]  devres_release_all+0xd2/0x110
> > > > [   32.966788]  ? __pfx_devres_release_all+0x10/0x10
> > > > [   32.967177]  ? preempt_count_sub+0x14/0xc0
> > > > [   32.967523]  device_unbind_cleanup+0x16/0xc0
> > > > [   32.967886]  really_probe+0x1b7/0x570
> > > > [   32.968207]  __driver_probe_device+0xca/0x1b0
> > > > [   32.968568]  driver_probe_device+0x4a/0xf0
> > > > [   32.968907]  __driver_attach+0x10b/0x290
> > > > [   32.969239]  ? __pfx___driver_attach+0x10/0x10
> > > > [   32.969598]  bus_for_each_dev+0xc0/0x110
> > > > [   32.969923]  ? __pfx_bus_for_each_dev+0x10/0x10
> > > > [   32.970291]  ? bus_add_driver+0x17a/0x2b0
> > > > [   32.970622]  ? srso_alias_return_thunk+0x5/0xfbef5
> > > > [   32.971011]  bus_add_driver+0x19a/0x2b0
> > > > [   32.971335]  driver_register+0xd8/0x160
> > > > [   32.971671]  ? __pfx_bochs_pci_driver_init+0x10/0x10 [bochs]
> > > > [   32.972130]  do_one_initcall+0xba/0x390
> > > > [...]
> > > > 
> > > > After unplugging the DRM device, clients will close their references.
> > > > Closing the final reference will also release the DRM device.
> > > > 
> > > > Reported-by: Dr. David Alan Gilbert <dave@treblig.org>
> > > > Closes: https://lore.kernel.org/lkml/Z18dbfDAiFadsSdg@gallifrey/
> > > > Fixes: 04826f588682 ("drm/bochs: Allocate DRM device in struct bochs_device")
> > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > > > Cc: virtualization@lists.linux.dev
> > > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > ---
> > > >   drivers/gpu/drm/tiny/bochs.c | 1 -
> > > >   1 file changed, 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> > > > index 89a699370a59..c67e1f906785 100644
> > > > --- a/drivers/gpu/drm/tiny/bochs.c
> > > > +++ b/drivers/gpu/drm/tiny/bochs.c
> > > > @@ -757,7 +757,6 @@ static void bochs_pci_remove(struct pci_dev *pdev)
> > > >   	drm_dev_unplug(dev);
> > > >   	drm_atomic_helper_shutdown(dev);
> > > > -	drm_dev_put(dev);
> > > >   }
> > > >   static void bochs_pci_shutdown(struct pci_dev *pdev)
> > > > -- 
> > > > 2.47.1
> > > > 
> > 
> > -- 
> > --
> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Software Solutions Germany GmbH
> > Frankenstrasse 146, 90461 Nuernberg, Germany
> > GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> > HRB 36809 (AG Nuernberg)
> > 
> -- 
>  -----Open up your eyes, open up your mind, open up your code -------   
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

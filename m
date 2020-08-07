Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0462402BF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65926E392;
	Mon, 10 Aug 2020 07:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D896E1EE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 20:10:30 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id l204so3041145oib.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 13:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9P23e4d5hOedlGVW59wZ4qpgg6vh9oYeC0yad0FB7Rk=;
 b=WBflqQfGXYlTKTO0OkDvSaPex3CvFKXYhqtYwGAoGCRLSRsvo5s16n1OEQ/Rsk2nOo
 rsSvEameJnsjqAzFzyprE4TaRxGxglv0rTjN0kSibkq3Iof9YwL22QAyRxv+Vqtk0vEf
 HlHmjTLQ2H/eq7zSrkRjnMfIFqVXtMuloxXK7RL5negPIGCre4WAOpMWFUdN24FdZFgb
 s3ISeR806CccpuhRlTJXvl76ZrueJpanf4jIZavUYuUanyt+l7cbNS5zMiKVhQ0EEz0G
 N9+S2ZbcshJwoRTCxqz5iVwjSsXH/0WDfaM9x6Qe2r2z8ASF1jbuQqS/QmqLtMuwqfvp
 s9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9P23e4d5hOedlGVW59wZ4qpgg6vh9oYeC0yad0FB7Rk=;
 b=DaIWwbuAoNIVzzGbG8rMbQGRzqeQfLzaqUZL3wtmfLkxX+5spSoPeD46HlcD5nPetE
 iPYO3JYibZwTLT/yfYhA55rmke1nl6MN2fUDpjOSJ0O92QbYZF7d0gzNnqP0qHxF4Y0K
 +muSCDl7tvX6QHFUCqFLFgORWTnmPF+mbVQ+EMweAlwFdnj4//pWL2VRq0cZHSnKf8RK
 Dnvl2/eZcOoO5eH5JkH+bMAAIZYsVifoflGP8nQUmyzVKpRHL98zbHkXBOYVzfR36Mli
 Rj9WkefjOH8uayH4NVeSS/ZDB2torhzd9xsK2zmyRxfDRroL0XkfvlYQCCTCg5wDT/q+
 uobQ==
X-Gm-Message-State: AOAM532FsCnQcbNet1D/HI84R0NnIfcQHM3RVnVhUn/i69nC880rV9SK
 zkNNKDuCWKzL+GVtuOG7tDo=
X-Google-Smtp-Source: ABdhPJwvzuE1oujB2IsJuSprkHZMmLtJscVDgAEwMLD5GSletHE1e6Tqgnj9cmIzTkh1u/fs8MnQBw==
X-Received: by 2002:a54:4512:: with SMTP id l18mr12454569oil.148.1596831028820; 
 Fri, 07 Aug 2020 13:10:28 -0700 (PDT)
Received: from frodo.hsd1.co.comcast.net ([2601:284:8204:6ba0::af38])
 by smtp.googlemail.com with ESMTPSA id s6sm1835794otq.75.2020.08.07.13.10.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 13:10:28 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] dyndbg: enable 'cache' of active pr_debug callsites
Date: Fri,  7 Aug 2020 14:09:55 -0600
Message-Id: <20200807200957.1269454-9-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200807200957.1269454-1-jim.cromie@gmail.com>
References: <20200807200957.1269454-1-jim.cromie@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 10 Aug 2020 07:35:58 +0000
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
Cc: Jim Cromie <jim.cromie@gmail.com>, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

in ddebug_zpool_put() dont zs_unmap the callsite, if it is enabled for
printing.  This will eliminate possibly repeated un-maps then re-maps
of enabled and invoked pr-debug callsites, and will promptly retire
all other uses.

But this causes kernel to BUG
[    1.364303] BUG: sleeping function called from invalid context at mm/slab.h:567

[jimc@frodo build-v2]$ krun -a main.dyndbg=+pmf -q=-s -q=-S
./.virtme_mods/lib/modules/0.0.0
/usr/bin/qemu-system-x86_64 -fsdev local,id=virtfs1,path=/,security_model=none,readonly,multidevs=remap -device virtio-9p-pci,fsdev=virtfs1,mount_tag=/dev/root -fsdev local,id=virtfs5,path=/usr/local/lib/python3.8/site-packages/virtme-0.1.1-py3.8.egg/virtme/guest,security_model=none,readonly,multidevs=remap -device virtio-9p-pci,fsdev=virtfs5,mount_tag=virtme.guesttools -machine accel=kvm:tcg -watchdog i6300esb -cpu host -parallel none -net none -echr 1 -serial none -chardev stdio,id=console,signal=off,mux=on -serial chardev:console -mon chardev=console -vga none -display none -kernel ./arch/x86/boot/bzImage -append 'virtme_link_mods=/home/jimc/projects/lx/linux.git/build-v2/.virtme_mods/lib/modules/0.0.0 earlyprintk=serial,ttyS0,115200 console=ttyS0 psmouse.proto=exps "virtme_stty_con=rows 25 cols 102 iutf8" TERM=xterm-256color rootfstype=9p rootflags=version=9p2000.L,trans=virtio,access=any raid=noautodetect ro nokaslr dynamic_debug.verbose=3 module.dyndbg=+pm main.dyndbg=+pmf init
 =/bin/sh -- -c "mount -t tmpfs run /run;mkdir -p /run/virtme/guesttools;/bin/mount -n -t 9p -o ro,version=9p2000.L,trans=virtio,access=any virtme.guesttools /run/virtme/guesttools;exec /run/virtme/guesttools/virtme-init"' -s -S
Wrong EFI loader signature.
early console in extract_kernel
input_data: 0x00000000033373a8
input_len: 0x0000000000aba748
output: 0x0000000001000000
output_len: 0x00000000025f9e28
kernel_total_size: 0x0000000002e2c000
needed_size: 0x0000000003000000
trampoline_32bit: 0x000000000009d000

KASLR disabled: 'nokaslr' on cmdline.

Decompressing Linux... Parsing ELF... No relocation needed... done.
Booting the kernel.
[    0.000000] Linux version 5.8.0-00025-g4e76f4427bf8 (jimc@frodo) (gcc (GCC) 10.2.1 20200723 (Red Hat 10.2.1-1), GNU ld version 2.34-4.fc32) #30 SMP Thu Aug 6 16:39:03 MDT 2020
[    0.000000] Command line: virtme_link_mods=/home/jimc/projects/lx/linux.git/build-v2/.virtme_mods/lib/modules/0.0.0 earlyprintk=serial,ttyS0,115200 console=ttyS0 psmouse.proto=exps "virtme_stty_con=rows 25 cols 102 iutf8" TERM=xterm-256color rootfstype=9p rootflags=version=9p2000.L,trans=virtio,access=any raid=noautodetect ro nokaslr dynamic_debug.verbose=3 module.dyndbg=+pm main.dyndbg=+pmf init=/bin/sh -- -c "mount -t tmpfs run /run;mkdir -p /run/virtme/guesttools;/bin/mount -n -t 9p -o ro,version=9p2000.L,trans=virtio,access=any virtme.guesttools /run/virtme/guesttools;exec /run/virtme/guesttools/virtme-init"
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
[    0.000000] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
[    0.000000] x86/fpu: Enabled xstate features 0x1f, context size is 960 bytes, using 'compacted' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000007fdffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000007fe0000-0x0000000007ffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
[    0.000000] printk: bootconsole [earlyser0] enabled
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.8 present.
[    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-2.fc32 04/01/2014
[    0.000000] Hypervisor detected: KVM
[    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
[    0.000000] kvm-clock: cpu 0, msr 3141001, primary cpu clock
[    0.000000] kvm-clock: using sched offset of 218135524 cycles
[    0.000900] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    0.003580] tsc: Detected 2591.998 MHz processor
[    0.004611] last_pfn = 0x7fe0 max_arch_pfn = 0x400000000
[    0.005518] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
[    0.013334] found SMP MP-table at [mem 0x000f5c30-0x000f5c3f]
[    0.014404] check: Scanning 1 areas for low memory corruption
[    0.015327] Using GB pages for direct mapping
[    0.016207] ACPI: Early table checksum verification disabled
[    0.017097] ACPI: RSDP 0x00000000000F5A70 000014 (v00 BOCHS )
[    0.018015] ACPI: RSDT 0x0000000007FE157B 000030 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
[    0.019607] ACPI: FACP 0x0000000007FE1457 000074 (v01 BOCHS  BXPCFACP 00000001 BXPC 00000001)
[    0.021045] ACPI: DSDT 0x0000000007FE0040 001417 (v01 BOCHS  BXPCDSDT 00000001 BXPC 00000001)
[    0.022479] ACPI: FACS 0x0000000007FE0000 000040
[    0.023399] ACPI: APIC 0x0000000007FE14CB 000078 (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
[    0.024818] ACPI: HPET 0x0000000007FE1543 000038 (v01 BOCHS  BXPCHPET 00000001 BXPC 00000001)
[    0.026390] No NUMA configuration found
[    0.026962] Faking a node at [mem 0x0000000000000000-0x0000000007fdffff]
[    0.027986] NODE_DATA(0) allocated [mem 0x07fdc000-0x07fdffff]
[    0.028978] Zone ranges:
[    0.029398]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.030489]   DMA32    [mem 0x0000000001000000-0x0000000007fdffff]
[    0.031567]   Normal   empty
[    0.031954] Movable zone start for each node
[    0.032662] Early memory node ranges
[    0.033219]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.034078]   node   0: [mem 0x0000000000100000-0x0000000007fdffff]
[    0.035334] Zeroed struct page in unavailable ranges: 130 pages
[    0.035336] Initmem setup node 0 [mem 0x0000000000001000-0x0000000007fdffff]
[    0.038090] ACPI: PM-Timer IO Port: 0x608
[    0.038770] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
[    0.039730] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI 0-23
[    0.040855] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.041956] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
[    0.043186] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.044213] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high level)
[    0.045280] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high level)
[    0.046277] Using ACPI (MADT) for SMP configuration information
[    0.047208] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.048083] TSC deadline timer available
[    0.048763] smpboot: Allowing 1 CPUs, 0 hotplug CPUs
[    0.049527] KVM setup pv remote TLB flush
[    0.050297] KVM setup pv sched yield
[    0.050864] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.052112] PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x0009ffff]
[    0.053290] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000effff]
[    0.054468] PM: hibernation: Registered nosave memory: [mem 0x000f0000-0x000fffff]
[    0.055881] [mem 0x08000000-0xfeffbfff] available for PCI devices
[    0.056952] Booting paravirtualized kernel on KVM
[    0.057938] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.059627] setup_percpu: NR_CPUS:64 nr_cpumask_bits:64 nr_cpu_ids:1 nr_node_ids:1
[    0.061318] percpu: Embedded 502 pages/cpu s2015896 r8192 d32104 u2097152
[    0.062483] KVM setup async PF for cpu 0
[    0.063242] kvm-stealtime: cpu 0, msr 7a17cc0
[    0.063989] Built 1 zonelists, mobility grouping on.  Total pages: 32105
[    0.065255] Policy zone: DMA32
[    0.065776] Kernel command line: virtme_link_mods=/home/jimc/projects/lx/linux.git/build-v2/.virtme_mods/lib/modules/0.0.0 earlyprintk=serial,ttyS0,115200 console=ttyS0 psmouse.proto=exps "virtme_stty_con=rows 25 cols 102 iutf8" TERM=xterm-256color rootfstype=9p rootflags=version=9p2000.L,trans=virtio,access=any raid=noautodetect ro nokaslr dynamic_debug.verbose=3 module.dyndbg=+pm main.dyndbg=+pmf init=/bin/sh -- -c "mount -t tmpfs run /run;mkdir -p /run/virtme/guesttools;/bin/mount -n -t 9p -o ro,version=9p2000.L,trans=virtio,access=any virtme.guesttools /run/virtme/guesttools;exec /run/virtme/guesttools/virtme-init"
[    0.075229] Dentry cache hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.076569] Inode-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.077888] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.079127] Memory: 79000K/130552K available (16390K kernel code, 2056K rwdata, 8476K rodata, 3008K init, 13184K bss, 51552K reserved, 0K cma-reserved)
[    0.081449] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
[    0.082840] Kernel/User page tables isolation: enabled
[    0.088889] Running RCU self tests
[    0.089529] rcu: Hierarchical RCU implementation.
[    0.090444] rcu: 	RCU event tracing is enabled.
[    0.091347] rcu: 	RCU lockdep checking is enabled.
[    0.092084] rcu: 	RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=1.
[    0.093238] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    0.094467] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
[    0.096052] NR_IRQS: 4352, nr_irqs: 256, preallocated irqs: 16
[    0.097804] random: get_random_bytes called from start_kernel+0x36b/0x544 with crng_init=0
[    0.097951] Console: colour *CGA 80x25
[    0.100066] printk: console [ttyS0] enabled
[    0.100066] printk: console [ttyS0] enabled
[    0.101286] printk: bootconsole [earlyser0] disabled
[    0.101286] printk: bootconsole [earlyser0] disabled
[    0.102875] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
[    0.104018] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.104714] ... MAX_LOCK_DEPTH:          48
[    0.105600] ... MAX_LOCKDEP_KEYS:        8192
[    0.106572] ... CLASSHASH_SIZE:          4096
[    0.107509] ... MAX_LOCKDEP_ENTRIES:     32768
[    0.108265] ... MAX_LOCKDEP_CHAINS:      65536
[    0.108892] ... CHAINHASH_SIZE:          32768
[    0.109598]  memory used by lock dependency info: 6813 kB
[    0.110461]  memory used for stack traces: 4224 kB
[    0.111274]  per task-struct memory footprint: 2688 bytes
[    0.112067] ------------------------
[    0.112669] | Locking API testsuite:
[    0.113368] ----------------------------------------------------------------------------
[    0.114770]                                  | spin |wlock |rlock |mutex | wsem | rsem |
[    0.116032]   --------------------------------------------------------------------------
[    0.117269]                      A-A deadlock:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
[    0.121931]                  A-B-B-A deadlock:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
[    0.126875]              A-B-B-C-C-A deadlock:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
[    0.131594]              A-B-C-A-B-C deadlock:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
[    0.136460]          A-B-B-C-C-D-D-A deadlock:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
[    0.141138]          A-B-C-D-B-D-D-A deadlock:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
[    0.146236]          A-B-C-D-B-C-D-A deadlock:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
[    0.151113]                     double unlock:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
[    0.155610]                   initialize held:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
[    0.159968]   --------------------------------------------------------------------------
[    0.161246]               recursive read-lock:             |  ok  |             |  ok  |
[    0.163424]            recursive read-lock #2:             |  ok  |             |  ok  |
[    0.165567]             mixed read-write-lock:             |  ok  |             |  ok  |
[    0.167698]             mixed write-read-lock:             |  ok  |             |  ok  |
[    0.170041]   mixed read-lock/lock-write ABBA:             |  ok  |             |  ok  |
[    0.170927]    mixed read-lock/lock-read ABBA:             |FAILED|             |  ok  |
[    0.173043]  mixed write-lock/lock-write ABBA:             |  ok  |             |  ok  |
[    0.175456]   --------------------------------------------------------------------------
[    0.178055]      hard-irqs-on + irq-safe-A/12:  ok  |  ok  |  ok  |
[    0.180435]      soft-irqs-on + irq-safe-A/12:  ok  |  ok  |  ok  |
[    0.182596]      hard-irqs-on + irq-safe-A/21:  ok  |  ok  |  ok  |
[    0.184786]      soft-irqs-on + irq-safe-A/21:  ok  |  ok  |  ok  |
[    0.187120]        sirq-safe-A => hirqs-on/12:  ok  |  ok  |  ok  |
[    0.189291]        sirq-safe-A => hirqs-on/21:  ok  |  ok  |  ok  |
[    0.191487]          hard-safe-A + irqs-on/12:  ok  |  ok  |  ok  |
[    0.193918]          soft-safe-A + irqs-on/12:  ok  |  ok  |  ok  |
[    0.196176]          hard-safe-A + irqs-on/21:  ok  |  ok  |  ok  |
[    0.198335]          soft-safe-A + irqs-on/21:  ok  |  ok  |  ok  |
[    0.200556]     hard-safe-A + unsafe-B #1/123:  ok  |  ok  |  ok  |
[    0.203119]     soft-safe-A + unsafe-B #1/123:  ok  |  ok  |  ok  |
[    0.205467]     hard-safe-A + unsafe-B #1/132:  ok  |  ok  |  ok  |
[    0.208201]     soft-safe-A + unsafe-B #1/132:  ok  |  ok  |  ok  |
[    0.210585]     hard-safe-A + unsafe-B #1/213:  ok  |  ok  |  ok  |
[    0.213147]     soft-safe-A + unsafe-B #1/213:  ok  |  ok  |  ok  |
[    0.215550]     hard-safe-A + unsafe-B #1/231:  ok  |  ok  |  ok  |
[    0.217926]     soft-safe-A + unsafe-B #1/231:  ok  |  ok  |  ok  |
[    0.220455]     hard-safe-A + unsafe-B #1/312:  ok  |  ok  |  ok  |
[    0.222807]     soft-safe-A + unsafe-B #1/312:  ok  |  ok  |  ok  |
[    0.225246]     hard-safe-A + unsafe-B #1/321:  ok  |  ok  |  ok  |
[    0.227480]     soft-safe-A + unsafe-B #1/321:  ok  |  ok  |  ok  |
[    0.229886]     hard-safe-A + unsafe-B #2/123:  ok  |  ok  |  ok  |
[    0.232121]     soft-safe-A + unsafe-B #2/123:  ok  |  ok  |  ok  |
[    0.234488]     hard-safe-A + unsafe-B #2/132:  ok  |  ok  |  ok  |
[    0.237863]     soft-safe-A + unsafe-B #2/132:  ok  |  ok  |  ok  |
[    0.241987]     hard-safe-A + unsafe-B #2/213:  ok  |  ok  |  ok  |
[    0.244188]     soft-safe-A + unsafe-B #2/213:  ok  |  ok  |  ok  |
[    0.246434]     hard-safe-A + unsafe-B #2/231:  ok  |  ok  |  ok  |
[    0.248782]     soft-safe-A + unsafe-B #2/231:  ok  |  ok  |  ok  |
[    0.250969]     hard-safe-A + unsafe-B #2/312:  ok  |  ok  |  ok  |
[    0.253578]     soft-safe-A + unsafe-B #2/312:  ok  |  ok  |  ok  |
[    0.256138]     hard-safe-A + unsafe-B #2/321:  ok  |  ok  |  ok  |
[    0.258583]     soft-safe-A + unsafe-B #2/321:  ok  |  ok  |  ok  |
[    0.261091]       hard-irq lock-inversion/123:  ok  |  ok  |  ok  |
[    0.263609]       soft-irq lock-inversion/123:  ok  |  ok  |  ok  |
[    0.266030]       hard-irq lock-inversion/132:  ok  |  ok  |  ok  |
[    0.268224]       soft-irq lock-inversion/132:  ok  |  ok  |  ok  |
[    0.270522]       hard-irq lock-inversion/213:  ok  |  ok  |  ok  |
[    0.272741]       soft-irq lock-inversion/213:  ok  |  ok  |  ok  |
[    0.274977]       hard-irq lock-inversion/231:  ok  |  ok  |  ok  |
[    0.277139]       soft-irq lock-inversion/231:  ok  |  ok  |  ok  |
[    0.279390]       hard-irq lock-inversion/312:  ok  |  ok  |  ok  |
[    0.281880]       soft-irq lock-inversion/312:  ok  |  ok  |  ok  |
[    0.284206]       hard-irq lock-inversion/321:  ok  |  ok  |  ok  |
[    0.286949]       soft-irq lock-inversion/321:  ok  |  ok  |  ok  |
[    0.289404]       hard-irq read-recursion/123:  ok  |
[    0.290832]       soft-irq read-recursion/123:  ok  |
[    0.292139]       hard-irq read-recursion/132:  ok  |
[    0.293402]       soft-irq read-recursion/132:  ok  |
[    0.294707]       hard-irq read-recursion/213:  ok  |
[    0.296035]       soft-irq read-recursion/213:  ok  |
[    0.297515]       hard-irq read-recursion/231:  ok  |
[    0.298786]       soft-irq read-recursion/231:  ok  |
[    0.300243]       hard-irq read-recursion/312:  ok  |
[    0.301589]       soft-irq read-recursion/312:  ok  |
[    0.302907]       hard-irq read-recursion/321:  ok  |
[    0.304080]       soft-irq read-recursion/321:  ok  |
[    0.305288]   --------------------------------------------------------------------------
[    0.306410]   | Wound/wait tests |
[    0.306883]   ---------------------
[    0.307421]                   ww api failures:  ok  |  ok  |  ok  |
[    0.309949]                ww contexts mixing:  ok  |  ok  |
[    0.311666]              finishing ww context:  ok  |  ok  |  ok  |  ok  |
[    0.314669]                locking mismatches:  ok  |  ok  |  ok  |
[    0.317124]                  EDEADLK handling:  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
[    0.323525]            spinlock nest unlocked:  ok  |
[    0.324643]   -----------------------------------------------------
[    0.325504]                                  |block | try  |context|
[    0.326631]   -----------------------------------------------------
[    0.327505]                           context:  ok  |  ok  |  ok  |
[    0.329832]                               try:  ok  |  ok  |  ok  |
[    0.331964]                             block:  ok  |  ok  |  ok  |
[    0.334585]                          spinlock:  ok  |  ok  |  ok  |
[    0.337766] -------------------------------------------------------
[    0.338756] Good, all 261 testcases passed! |
[    0.339394] ---------------------------------
[    0.340334] ACPI: Core revision 20200528
[    0.341167] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604467 ns
[    0.342557] APIC: Switch to symmetric I/O mode setup
[    0.343248] KVM setup pv IPIs
[    0.345126] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.345981] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x255cb518234, max_idle_ns: 440795279333 ns
[    0.347449] Calibrating delay loop (skipped) preset value.. 5183.99 BogoMIPS (lpj=2591998)
[    0.348446] pid_max: default: 32768 minimum: 301
[    0.349095] LSM: Security Framework initializing
[    0.349460] SELinux:  Initializing.
[    0.349964] Mount-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
[    0.350446] Mountpoint-cache hash table entries: 512 (order: 0, 4096 bytes, linear)
Poking KASLR using RDRAND RDTSC...
[    0.353011] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.353541] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.354445] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.355453] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.356449] Spectre V2 : Mitigation: Full generic retpoline
[    0.357446] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    0.358444] Spectre V2 : Enabling Restricted Speculation for firmware calls
[    0.359450] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.360447] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
[    0.361458] TAA: Mitigation: Clear CPU buffers
[    0.362446] SRBDS: Unknown: Dependent on hypervisor status
[    0.363444] MDS: Mitigation: Clear CPU buffers
[    0.374194] Freeing SMP alternatives memory: 40K
[    0.375553] smpboot: CPU0: Intel(R) Core(TM) i7-6700HQ CPU @ 2.60GHz (family: 0x6, model: 0x5e, stepping: 0x3)
[    0.376791] Performance Events: Skylake events, full-width counters, Intel PMU driver.
[    0.377456] ... version:                2
[    0.378089] ... bit width:              48
[    0.378447] ... generic registers:      4
[    0.379067] ... value mask:             0000ffffffffffff
[    0.379446] ... max period:             00007fffffffffff
[    0.380291] ... fixed-purpose events:   3
[    0.380453] ... event mask:             000000070000000f
[    0.381618] rcu: Hierarchical SRCU implementation.
[    0.382784] dyndbg:   6 debug prints in module main
[    0.383485] dyndbg:   1 debug prints in module initramfs
[    0.384338] dyndbg:   3 debug prints in module ibs
[    0.384448] dyndbg:   2 debug prints in module pt
[    0.385176] dyndbg:  11 debug prints in module kvm
[    0.385448] dyndbg:  15 debug prints in module kvm_intel
[    0.386231] dyndbg:   1 debug prints in module kvm_amd
[    0.386471] dyndbg:   1 debug prints in module common
[    0.387311] dyndbg:   1 debug prints in module amd
[    0.387466] dyndbg:   1 debug prints in module hygon
[    0.388234] dyndbg:   1 debug prints in module therm_throt
[    0.388447] dyndbg:   2 debug prints in module mtrr
[    0.389158] dyndbg:   7 debug prints in module generic
[    0.389447] dyndbg:   6 debug prints in module cleanup
[    0.390213] dyndbg:  19 debug prints in module microcode
[    0.390447] dyndbg:   1 debug prints in module mshyperv
[    0.391193] dyndbg:   5 debug prints in module boot
[    0.391447] dyndbg:  21 debug prints in module smpboot
[    0.392372] dyndbg:   1 debug prints in module tsc_sync
[    0.392448] dyndbg:   2 debug prints in module setup_percpu
[    0.393274] dyndbg:  30 debug prints in module vector
[    0.393447] dyndbg:   2 debug prints in module hpet
[    0.394139] dyndbg:   2 debug prints in module init
[    0.394447] dyndbg:   4 debug prints in module init_64
[    0.395237] dyndbg:   1 debug prints in module numa
[    0.395447] dyndbg:   1 debug prints in module pti
[    0.396142] dyndbg:   2 debug prints in module iosf_mbi
[    0.396447] dyndbg:   4 debug prints in module params
[    0.397197] dyndbg:   4 debug prints in module async
[    0.397447] dyndbg:   4 debug prints in module snapshot
[    0.398219] dyndbg:   6 debug prints in module swap
[    0.398447] dyndbg:   1 debug prints in module manage
[    0.399198] dyndbg:  14 debug prints in module irqdomain
[    0.399447] dyndbg:   1 debug prints in module cpuhotplug
[    0.400254] dyndbg:   2 debug prints in module msi
[    0.400448] dyndbg:   2 debug prints in module freezer
[    0.401248] dyndbg:  18 debug prints in module module
[    0.401454] dyndbg:   1 debug prints in module cgroup
[    0.402235] dyndbg:   1 debug prints in module util
[    0.402466] dyndbg:   1 debug prints in module swapfile
[    0.403376] dyndbg:   5 debug prints in module zswap
[    0.403448] dyndbg:   6 debug prints in module mempolicy
[    0.404214] dyndbg:   1 debug prints in module sparse
[    0.404454] dyndbg:   1 debug prints in module sparse_vmemmap
[    0.405374] dyndbg:   3 debug prints in module zpool
[    0.405448] dyndbg:   1 debug prints in module fsnotify
[    0.406112] dyndbg:   2 debug prints in module notification
[    0.406447] dyndbg:   1 debug prints in module inotify_fsnotify
[    0.407234] dyndbg:   5 debug prints in module inotify_user
[    0.407448] dyndbg:  22 debug prints in module aio
[    0.408221] dyndbg:  14 debug prints in module binfmt_misc
[    0.408447] dyndbg:   2 debug prints in module mount
[    0.409127] dyndbg:   1 debug prints in module dir
[    0.409447] dyndbg:  32 debug prints in module autofs4
[    0.410141] dyndbg:   1 debug prints in module debugfs
[    0.410447] dyndbg:   1 debug prints in module tracefs
[    0.411080] dyndbg:  11 debug prints in module selinux
[    0.411447] dyndbg:   6 debug prints in module asymmetric_keys
[    0.412295] dyndbg:  13 debug prints in module x509_key_parser
[    0.412448] dyndbg:  21 debug prints in module pkcs7_message
[    0.413252] dyndbg:  14 debug prints in module efi
[    0.413447] dyndbg:   2 debug prints in module bsg
[    0.414439] dyndbg:   1 debug prints in module percpu_refcount
[    0.414448] dyndbg:  11 debug prints in module asn1_decoder
[    0.415325] dyndbg:   1 debug prints in module decompress
[    0.415447] dyndbg:  10 debug prints in module kobject
[    0.416268] dyndbg:   6 debug prints in module kobject_uevent
[    0.416447] dyndbg:   6 debug prints in module probe
[    0.417267] dyndbg:   9 debug prints in module pci
[    0.417447] dyndbg:   3 debug prints in module pci_driver
[    0.418258] dyndbg:   2 debug prints in module setup_bus
[    0.418447] dyndbg:   2 debug prints in module setup_irq
[    0.419314] dyndbg:   4 debug prints in module pcieportdrv
[    0.419448] dyndbg:   3 debug prints in module slot
[    0.420182] dyndbg:   2 debug prints in module pci_acpi
[    0.420448] dyndbg:   2 debug prints in module quirks
[    0.421285] dyndbg:   1 debug prints in module pci_hotplug
[    0.421447] dyndbg:   3 debug prints in module backlight
[    0.422213] dyndbg:   1 debug prints in module fb
[    0.422447] dyndbg:   7 debug prints in module tables
[    0.423239] dyndbg:  89 debug prints in module acpi
[    0.423465] dyndbg:   1 debug prints in module button
[    0.424291] dyndbg:   3 debug prints in module fan
[    0.424448] dyndbg:   1 debug prints in module video
[    0.425451] dyndbg:   8 debug prints in module processor
[    0.426405] dyndbg:   4 debug prints in module srat
[    0.426449] dyndbg:  24 debug prints in module cppc_acpi
[    0.427295] dyndbg:   7 debug prints in module pnp
[    0.427447] dyndbg:   6 debug prints in module clk
[    0.428223] dyndbg:   9 debug prints in module dmaengine
[    0.428447] dyndbg:   2 debug prints in module virt_dma
[    0.429254] dyndbg:   3 debug prints in module acpi_dma
[    0.429447] dyndbg:   5 debug prints in module dw_dmac_core
[    0.430364] dyndbg:  10 debug prints in module virtio_ring
[    0.430447] dyndbg:   5 debug prints in module tty_io
[    0.431225] dyndbg:   1 debug prints in module tty_jobctrl
[    0.431447] dyndbg:   1 debug prints in module vt_ioctl
[    0.432268] dyndbg:   4 debug prints in module serial_core
[    0.432447] dyndbg:   4 debug prints in module 8250
[    0.433246] dyndbg:   5 debug prints in module 8250_base
[    0.433447] dyndbg:   8 debug prints in module 8250_pci
[    0.434452] dyndbg:   1 debug prints in module 8250_exar
[    0.435254] dyndbg:   2 debug prints in module virtio_console
[    0.435447] dyndbg:   6 debug prints in module iommu
[    0.436400] dyndbg:   2 debug prints in module dmar
[    0.436447] dyndbg:   3 debug prints in module iommu
[    0.437241] dyndbg:   1 debug prints in module drm
[    0.437447] dyndbg:  19 debug prints in module vgaarb
[    0.438350] dyndbg:   7 debug prints in module component
[    0.438449] dyndbg:  16 debug prints in module core
[    0.439245] dyndbg:   7 debug prints in module bus
[    0.439450] dyndbg:  20 debug prints in module dd
[    0.440184] dyndbg:   1 debug prints in module syscore
[    0.440447] dyndbg:   5 debug prints in module class
[    0.441198] dyndbg:   4 debug prints in module platform
[    0.441447] dyndbg:   6 debug prints in module main
[    0.442203] dyndbg:   1 debug prints in module wakeup
[    0.442447] dyndbg:   6 debug prints in module clock_ops
[    0.443391] dyndbg:  15 debug prints in module firmware_class
[    0.443447] dyndbg:   1 debug prints in module regmap
[    0.444227] dyndbg:   7 debug prints in module regcache
[    0.444448] dyndbg:   1 debug prints in module regmap_debugfs
[    0.445248] dyndbg:   1 debug prints in module dma_buf
[    0.445448] dyndbg:   5 debug prints in module scsi_mod
[    0.446454] dyndbg:   2 debug prints in module virtio_scsi
[    0.447451] dyndbg:  98 debug prints in module cdrom
[    0.448250] dyndbg:  14 debug prints in module pcmcia_core
[    0.448449] dyndbg:  79 debug prints in module pcmcia
[    0.449353] dyndbg:   2 debug prints in module pcmcia_rsrc
[    0.449447] dyndbg:  13 debug prints in module yenta_socket
[    0.450320] dyndbg: 153 debug prints in module usbcore
[    0.450448] dyndbg:  10 debug prints in module pci_quirks
[    0.451268] dyndbg:  53 debug prints in module ehci_hcd
[    0.451447] dyndbg:   2 debug prints in module ehci_pci
[    0.452336] dyndbg:  46 debug prints in module ohci_hcd
[    0.452447] dyndbg:  11 debug prints in module uhci_hcd
[    0.453253] dyndbg:  10 debug prints in module usb_storage
[    0.453463] dyndbg:   6 debug prints in module libps2
[    0.454370] dyndbg:   6 debug prints in module input_core
[    0.454448] dyndbg:  11 debug prints in module ff_memless
[    0.455385] dyndbg:   3 debug prints in module input_polldev
[    0.455461] dyndbg:   5 debug prints in module atkbd
[    0.456294] dyndbg:  27 debug prints in module psmouse
[    0.456453] dyndbg:  11 debug prints in module rtc_core
[    0.457263] dyndbg:   5 debug prints in module rtc_cmos
[    0.457447] dyndbg:   1 debug prints in module i2c_boardinfo
[    0.458203] dyndbg:  24 debug prints in module i2c_core
[    0.458447] dyndbg:   2 debug prints in module i2c_smbus
[    0.459317] dyndbg:  11 debug prints in module i2c_i801
[    0.459450] dyndbg:  17 debug prints in module pps_core
[    0.460334] dyndbg:   8 debug prints in module power_supply
[    0.460452] dyndbg:   1 debug prints in module hwmon
[    0.461361] dyndbg:   8 debug prints in module thermal_sys
[    0.461448] dyndbg:  48 debug prints in module md_mod
[    0.462303] dyndbg:   5 debug prints in module dm_mod
[    0.462448] dyndbg:  43 debug prints in module cpufreq
[    0.463268] dyndbg:   9 debug prints in module freq_table
[    0.463448] dyndbg:   1 debug prints in module cpufreq_performance
[    0.464447] dyndbg:   4 debug prints in module cpufreq_userspace
[    0.465448] dyndbg:  23 debug prints in module acpi_cpufreq
[    0.466434] dyndbg:  17 debug prints in module intel_pstate
[    0.466449] dyndbg:   1 debug prints in module sysfs
[    0.467364] dyndbg:   1 debug prints in module led_class
[    0.467451] dyndbg:   2 debug prints in module dmi_scan
[    0.468364] dyndbg:   4 debug prints in module esrt
[    0.468451] dyndbg:   1 debug prints in module hid
[    0.469273] dyndbg:   4 debug prints in module hid_pl
[    0.469447] dyndbg:   1 debug prints in module hid_sony
[    0.470307] dyndbg:  32 debug prints in module usbhid
[    0.470447] dyndbg:   2 debug prints in module mailbox
[    0.471297] dyndbg:   6 debug prints in module pcc
[    0.471463] dyndbg:   1 debug prints in module nvmem_core
[    0.472349] dyndbg:   3 debug prints in module snd
[    0.472447] dyndbg:   1 debug prints in module snd_timer
[    0.473406] dyndbg:   5 debug prints in module snd_pcm
[    0.473449] dyndbg:  11 debug prints in module snd_seq
[    0.474315] dyndbg:  19 debug prints in module snd_hda_codec
[    0.474448] dyndbg:  12 debug prints in module snd_hda_intel
[    0.475448] dyndbg:  16 debug prints in module snd_hda_core
[    0.476447] dyndbg:   1 debug prints in module sock
[    0.477309] dyndbg:  17 debug prints in module dev
[    0.477447] dyndbg:   2 debug prints in module sch_api
[    0.478271] dyndbg:   1 debug prints in module netfilter
[    0.478450] dyndbg:  43 debug prints in module nf_conntrack
[    0.479432] dyndbg:   1 debug prints in module nf_conntrack_netlink
[    0.479451] dyndbg:  19 debug prints in module nf_conntrack_ftp
[    0.480441] dyndbg:   4 debug prints in module nf_conntrack_irc
[    0.480469] dyndbg:   2 debug prints in module nf_conntrack_sip
[    0.481419] dyndbg:   4 debug prints in module nf_nat
[    0.481447] dyndbg:   2 debug prints in module nf_nat_ftp
[    0.482299] dyndbg:   1 debug prints in module nf_nat_irc
[    0.482447] dyndbg:   2 debug prints in module x_tables
[    0.483288] dyndbg:   4 debug prints in module xt_tcpudp
[    0.483447] dyndbg:   3 debug prints in module route
[    0.484234] dyndbg:   1 debug prints in module ip_fragment
[    0.484447] dyndbg:   1 debug prints in module ip_output
[    0.485346] dyndbg:   1 debug prints in module tcp
[    0.485447] dyndbg:   6 debug prints in module tcp_input
[    0.486335] dyndbg:   2 debug prints in module tcp_output
[    0.486448] dyndbg:   3 debug prints in module tcp_timer
[    0.487264] dyndbg:   1 debug prints in module tcp_ipv4
[    0.487447] dyndbg:   1 debug prints in module tcp_cong
[    0.488281] dyndbg:   1 debug prints in module tcp_rate
[    0.488447] dyndbg:   1 debug prints in module tcp_recovery
[    0.489337] dyndbg:   8 debug prints in module udp
[    0.489448] dyndbg:   1 debug prints in module arp
[    0.490308] dyndbg:   2 debug prints in module icmp
[    0.490447] dyndbg:   1 debug prints in module devinet
[    0.491223] dyndbg:   8 debug prints in module fib_trie
[    0.491447] dyndbg:  27 debug prints in module ping
[    0.492225] dyndbg:   1 debug prints in module sysctl_net_ipv4
[    0.492447] dyndbg:  11 debug prints in module ipconfig
[    0.493233] dyndbg:   1 debug prints in module tcp_cubic
[    0.493449] dyndbg:  39 debug prints in module ipv6
[    0.494276] dyndbg:   1 debug prints in module ah6
[    0.494447] dyndbg:   1 debug prints in module esp6
[    0.495152] dyndbg:  12 debug prints in module nf_defrag_ipv6
[    0.495447] dyndbg:   6 debug prints in module nf_reject_ipv6
[    0.496372] dyndbg:   2 debug prints in module sit
[    0.496448] dyndbg:   2 debug prints in module ip6_checksum
[    0.497306] dyndbg:  35 debug prints in module cfg80211
[    0.497452] dyndbg:   6 debug prints in module mac80211
[    0.498213] dyndbg:   2 debug prints in module i386
[    0.498456] dyndbg:   2 debug prints in module fixup
[    0.499187] dyndbg:   7 debug prints in module irq
[    0.499448] dyndbg: 224 modules, 1994 entries and 8960 bytes in ddebug tables, 79760 bytes in __dyndbg section, 79760 bytes in __dyndbg_callsites section
[    0.500447] dyndbg: 1994 entries. repeated entries: 1769 module 1646 file 799 func
[    0.501449] dyndbg: virtme_link_mods="/home/jimc/projects/lx/linux.git/build-v2/.virtme_mods/lib/modules/0.0.0"
[    0.502447] dyndbg: earlyprintk="serial,ttyS0,115200"
[    0.503340] dyndbg: console="ttyS0"
[    0.503448] dyndbg: psmouse.proto="exps"
[    0.504154] dyndbg: virtme_stty_con="rows 25 cols 102 iutf8"
[    0.504452] dyndbg: TERM="xterm-256color"
[    0.505396] dyndbg: rootfstype="9p"
[    0.505449] dyndbg: rootflags="version=9p2000.L,trans=virtio,access=any"
[    0.506450] dyndbg: raid="noautodetect"
[    0.507166] dyndbg: ro="(null)"
[    0.507447] dyndbg: nokaslr="(null)"
[    0.507995] dyndbg: dynamic_debug.verbose="3"
[    0.508446] dyndbg: module.dyndbg="+pm"
[    0.509067] dyndbg: query 0: "+pm"
[    0.509446] dyndbg: split into words: "+pm"
[    0.510144] dyndbg: op='+'
[    0.510446] dyndbg: flags=0x3
[    0.510898] dyndbg: *flagsp=0x3 *maskp=0xffffffff
[    0.511447] dyndbg: parsed: func="" file="" module="module" format="" lineno=0-0
[    0.512473] dyndbg: changed kernel/module.c:4001 [module]__do_sys_finit_module =pm
[    0.513453] dyndbg: changed kernel/module.c:3980 [module]__do_sys_init_module =pm
[    0.514452] dyndbg: changed kernel/module.c:3302 [module]move_module =pm
[    0.515467] dyndbg: changed kernel/module.c:3284 [module]move_module =pm
[    0.516419] dyndbg: changed kernel/module.c:2707 [module]layout_symtab =pm
[    0.516452] dyndbg: changed kernel/module.c:2680 [module]layout_symtab =pm
[    0.517410] dyndbg: changed kernel/module.c:2461 [module]layout_sections =pm
[    0.517457] dyndbg: changed kernel/module.c:2448 [module]layout_sections =pm
[    0.518471] dyndbg: changed kernel/module.c:2427 [module]layout_sections =pm
[    0.519456] dyndbg: changed kernel/module.c:2415 [module]layout_sections =pm
[    0.520458] dyndbg: changed kernel/module.c:2300 [module]simplify_symbols =pm
[    0.521452] dyndbg: changed kernel/module.c:2292 [module]simplify_symbols =pm
[    0.522452] dyndbg: changed kernel/module.c:1007 [module]__do_sys_delete_module =pm
[    0.523454] dyndbg: changed kernel/module.c:901 [module]module_unload_free =pm
[    0.524452] dyndbg: changed kernel/module.c:859 [module]add_module_usage =pm
[    0.525452] dyndbg: changed kernel/module.c:844 [module]already_uses =pm
[    0.526452] dyndbg: changed kernel/module.c:840 [module]already_uses =pm
[    0.527451] dyndbg: changed kernel/module.c:608 [module]find_symbol =pm
[    0.528449] dyndbg: applied: func="" file="" module="module" format="" lineno=0-0
[    0.529461] dyndbg: processed 1 queries, with 18 matches, 0 errs
[    0.530361] dyndbg: main.dyndbg="+pmf"
[    0.530447] dyndbg: query 0: "+pmf"
[    0.531105] dyndbg: split into words: "+pmf"
[    0.531446] dyndbg: op='+'
[    0.531876] dyndbg: flags=0x7
[    0.532440] dyndbg: *flagsp=0x7 *maskp=0xffffffff
[    0.532447] dyndbg: parsed: func="" file="" module="main" format="" lineno=0-0
[    0.533416] dyndbg: changed drivers/base/power/main.c:445 [main]pm_dev_dbg =pmf
[    0.533455] dyndbg: changed drivers/base/power/main.c:202 [main]device_pm_move_last =pmf
[    0.534452] dyndbg: changed drivers/base/power/main.c:189 [main]device_pm_move_after =pmf
[    0.535452] dyndbg: changed drivers/base/power/main.c:175 [main]device_pm_move_before =pmf
[    0.536453] dyndbg: changed drivers/base/power/main.c:156 [main]device_pm_remove =pmf
[    0.537452] dyndbg: changed drivers/base/power/main.c:135 [main]device_pm_add =pmf
[    0.538449] dyndbg: changed init/main.c:1331 [main]run_init_process =pmf
[    0.539386] dyndbg: changed init/main.c:1329 [main]run_init_process =pmf
[    0.539447] dyndbg: changed init/main.c:1328 [main]run_init_process =pmf
[    0.540435] dyndbg: changed init/main.c:1326 [main]run_init_process =pmf
[    0.540448] dyndbg: changed init/main.c:1115 [main]initcall_blacklisted =pmf
[    0.541447] dyndbg: changed init/main.c:1076 [main]initcall_blacklist =pmf
[    0.542339] dyndbg: applied: func="" file="" module="main" format="" lineno=0-0
[    0.542450] dyndbg: processed 1 queries, with 12 matches, 0 errs
[    0.543451] dyndbg: init="/bin/sh"
[    0.544127] smp: Bringing up secondary CPUs ...
[    0.544449] smp: Brought up 1 node, 1 CPU
[    0.545130] smpboot: Max logical packages: 1
[    0.545449] smpboot: Total of 1 processors activated (5183.99 BogoMIPS)
[    0.546839] devtmpfs: initialized
[    0.548202] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.548452] futex hash table entries: 256 (order: 3, 32768 bytes, linear)
[    0.549664] PM: RTC time: 00:46:43, date: 2020-08-07
[    0.550466] thermal_sys: Registered thermal governor 'step_wise'
[    0.550467] thermal_sys: Registered thermal governor 'user_space'
[    0.551644] NET: Registered protocol family 16
[    0.552713] audit: initializing netlink subsys (disabled)
[    0.553532] audit: type=2000 audit(1596761203.662:1): state=initialized audit_enabled=0 res=1
[    0.554971] cpuidle: using governor menu
[    0.555555] ACPI: bus type PCI registered
[    0.556412] PCI: Using configuration type 1 for base access
[    0.568724] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.569690] cryptomgr_test (19) used greatest stack depth: 14840 bytes left
[    0.572805] ACPI: Added _OSI(Module Device)
[    0.573456] ACPI: Added _OSI(Processor Device)
[    0.574110] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.574447] ACPI: Added _OSI(Processor Aggregator Device)
[    0.575295] ACPI: Added _OSI(Linux-Dell-Video)
[    0.575506] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.576314] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.578310] ACPI: 1 ACPI AML tables successfully acquired and loaded
[    0.580046] ACPI: Interpreter enabled
[    0.580532] ACPI: (supports S0 S3 S4 S5)
[    0.581240] ACPI: Using IOAPIC for interrupt routing
[    0.581491] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.582716] ACPI: Enabled 2 GPEs in block 00 to 0F
[    0.592022] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.592457] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments MSI HPX-Type3]
[    0.593500] acpi PNP0A03:00: fail to add MMCONFIG information, can't access extended PCI configuration space under this bridge.
[    0.594647] PCI host bridge to bus 0000:00
[    0.595302] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.595457] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.596413] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.596448] pci_bus 0000:00: root bus resource [mem 0x08000000-0xfebfffff window]
[    0.597447] pci_bus 0000:00: root bus resource [mem 0x100000000-0x17fffffff window]
[    0.598449] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.599388] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
[    0.600305] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
[    0.601408] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
[    0.603406] pci 0000:00:01.1: reg 0x20: [io  0xc080-0xc08f]
[    0.604297] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x01f7]
[    0.604449] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
[    0.605447] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x0177]
[    0.606447] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
[    0.607866] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
[    0.609461] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed by PIIX4 ACPI
[    0.610491] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PIIX4 SMB
[    0.612002] pci 0000:00:02.0: [1af4:1009] type 00 class 0x000200
[    0.613238] pci 0000:00:02.0: reg 0x10: [io  0xc000-0xc03f]
[    0.614084] pci 0000:00:02.0: reg 0x14: [mem 0xfebfd000-0xfebfdfff]
[    0.617136] pci 0000:00:02.0: reg 0x20: [mem 0xfebf4000-0xfebf7fff 64bit pref]
[    0.619337] pci 0000:00:03.0: [1af4:1009] type 00 class 0x000200
[    0.620450] pci 0000:00:03.0: reg 0x10: [io  0xc040-0xc07f]
[    0.622041] pci 0000:00:03.0: reg 0x14: [mem 0xfebfe000-0xfebfefff]
[    0.625400] pci 0000:00:03.0: reg 0x20: [mem 0xfebf8000-0xfebfbfff 64bit pref]
[    0.626990] pci 0000:00:04.0: [8086:25ab] type 00 class 0x088000
[    0.627717] pci 0000:00:04.0: reg 0x10: [mem 0xfebff000-0xfebff00f]
[    0.631736] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 *10 11)
[    0.632626] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)
[    0.633664] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)
[    0.634766] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 10 *11)
[    0.635551] ACPI: PCI Interrupt Link [LNKS] (IRQs *9)
[    0.636710] iommu: Default domain type: Translated
[    0.637656] vgaarb: loaded
[    0.638518] SCSI subsystem initialized
[    0.639275] ACPI: bus type USB registered
[    0.639530] usbcore: registered new interface driver usbfs
[    0.640305] usbcore: registered new interface driver hub
[    0.640482] usbcore: registered new device driver usb
[    0.641460] pps_core: LinuxPPS API ver. 1 registered
[    0.642264] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.642464] PTP clock support registered
[    0.643299] Advanced Linux Sound Architecture Driver Initialized.
[    0.644011] NetLabel: Initializing
[    0.644447] NetLabel:  domain hash size = 128
[    0.645113] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.645484] NetLabel:  unlabeled traffic allowed by default
[    0.646506] PCI: Using ACPI for IRQ routing
[    0.647581] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.648448] hpet0: 3 comparators, 64-bit 100.000000 MHz counter
[    0.652478] clocksource: Switched to clocksource kvm-clock
[    0.810605] VFS: Disk quotas dquot_6.6.0
[    0.811509] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.812869] pnp: PnP ACPI init
[    0.814458] pnp: PnP ACPI: found 5 devices
[    0.824953] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.826824] NET: Registered protocol family 2
[    0.828000] tcp_listen_portaddr_hash hash table entries: 64 (order: 0, 5632 bytes, linear)
[    0.829351] TCP established hash table entries: 1024 (order: 1, 8192 bytes, linear)
[    0.830688] TCP bind hash table entries: 1024 (order: 4, 81920 bytes, linear)
[    0.831938] TCP: Hash tables configured (established 1024 bind 1024)
[    0.833143] UDP hash table entries: 256 (order: 3, 49152 bytes, linear)
[    0.834457] UDP-Lite hash table entries: 256 (order: 3, 49152 bytes, linear)
[    0.835774] NET: Registered protocol family 1
[    0.836796] RPC: Registered named UNIX socket transport module.
[    0.837784] RPC: Registered udp transport module.
[    0.838506] RPC: Registered tcp transport module.
[    0.839492] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.841142] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.842085] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.842919] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.843899] pci_bus 0000:00: resource 7 [mem 0x08000000-0xfebfffff window]
[    0.845022] pci_bus 0000:00: resource 8 [mem 0x100000000-0x17fffffff window]
[    0.846622] pci 0000:00:01.0: PIIX3: Enabling Passive Release
[    0.847617] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
[    0.848722] pci 0000:00:01.0: Activating ISA DMA hang workarounds
[    0.849796] PCI: CLS 0 bytes, default 64
[    0.850789] RAPL PMU: API unit is 2^-32 Joules, 0 fixed counters, 10737418240 ms ovfl timer
[    0.852897] kvm: already loaded the other module
[    0.853839] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x255cb518234, max_idle_ns: 440795279333 ns
[    0.855861] check: Scanning for low memory corruption every 60 seconds
[    0.858222] Initialise system trusted keyrings
[    0.859187] workingset: timestamp_bits=56 max_order=15 bucket_order=0
[    0.868673] zbud: loaded
[    0.871222] NFS: Registering the id_resolver key type
[    0.872176] Key type id_resolver registered
[    0.872878] Key type id_legacy registered
[    0.873688] 9p: Installing v9fs 9p2000 file system support
[    0.882923] Key type asymmetric registered
[    0.883786] Asymmetric key parser 'x509' registered
[    0.884535] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[    0.885639] io scheduler mq-deadline registered
[    0.886292] io scheduler kyber registered
[    0.887591] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
[    0.889220] ACPI: Power Button [PWRF]
[    1.019699] PCI Interrupt Link [LNKB] enabled at IRQ 10
[    1.148365] PCI Interrupt Link [LNKC] enabled at IRQ 11
[    1.150685] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.152160] 00:04: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    1.154491] Non-volatile memory driver v1.3
[    1.155330] Linux agpgart interface v0.103
[    1.173865] loop: module loaded
[    1.176134] scsi host0: ata_piix
[    1.177034] scsi host1: ata_piix
[    1.177651] ata1: PATA max MWDMA2 cmd 0x1f0 ctl 0x3f6 bmdma 0xc080 irq 14
[    1.178648] ata2: PATA max MWDMA2 cmd 0x170 ctl 0x376 bmdma 0xc088 irq 15
[    1.180343] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    1.181262] ehci-pci: EHCI PCI platform driver
[    1.181910] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    1.183041] uhci_hcd: USB Universal Host Controller Interface driver
[    1.184018] usbcore: registered new interface driver usb-storage
[    1.184906] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,12
[    1.186830] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.187574] serio: i8042 AUX port at 0x60,0x64 irq 12
[    1.189138] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input1
[    1.191348] rtc_cmos 00:00: RTC can wake from S4
[    1.193774] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8042/serio1/input/input3
[    1.196269] rtc_cmos 00:00: registered as rtc0
[    1.197262] rtc_cmos 00:00: setting system clock to 2020-08-07T00:46:44 UTC (1596761204)
[    1.198746] rtc_cmos 00:00: alarms up to one day, y3k, 114 bytes nvram, hpet irqs
[    1.200734] i6300ESB timer 0000:00:04.0: initialized. heartbeat=30 sec (nowayout=0)
[    1.202299] device-mapper: ioctl: 4.42.0-ioctl (2020-02-27) initialised: dm-devel@redhat.com
[    1.203681] intel_pstate: CPU model not supported
[    1.204836] hid: raw HID events driver (C) Jiri Kosina
[    1.206965] usbcore: registered new interface driver usbhid
[    1.208054] usbhid: USB HID core driver
[    1.210148] Initializing XFRM netlink socket
[    1.211744] NET: Registered protocol family 10
[    1.215494] Segment Routing with IPv6
[    1.216481] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
[    1.217919] NET: Registered protocol family 17
[    1.218669] 9pnet: Installing 9P2000 support
[    1.220942] Key type dns_resolver registered
[    1.221784] IPI shorthand broadcast: enabled
[    1.222360] sched_clock: Marking stable (974790714, 246701357)->(1352607600, -131115529)
[    1.223874] registered taskstats version 1
[    1.224404] Loading compiled-in X.509 certificates
[    1.225739] zswap: loaded using pool zstd/zsmalloc
[    1.271317] dyndbg: total pages: 24 compaction: 0
[    1.350122] ata2.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
[    1.357252] scsi 1:0:0:0: CD-ROM            QEMU     QEMU DVD-ROM     2.5+ PQ: 0 ANSI: 5
[    1.364303] BUG: sleeping function called from invalid context at mm/slab.h:567
[    1.368292] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 7, name: kworker/u2:0
[    1.371245] 4 locks held by kworker/u2:0/7:
[    1.372739]  #0: ffff888007412948 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1f5/0x5c0
[    1.375712]  #1: ffffc90000043e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, at: process_one_work+0x1f5/0x5c0
[    1.378357]  #2: ffff8880061500f0 (&shost->scan_mutex){+.+.}-{4:4}, at: __scsi_add_device+0x7d/0x120
[    1.380376]  #3: ffff8880063b40b0 (&zspage->lock){.+.+}-{3:3}, at: zs_map_object+0x7b/0x2b0
[    1.382161] CPU: 0 PID: 7 Comm: kworker/u2:0 Not tainted 5.8.0-00025-g4e76f4427bf8 #30
[    1.383739] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-2.fc32 04/01/2014
[    1.385230] Workqueue: events_unbound async_run_entry_fn
[    1.386137] Call Trace:
[    1.386587]  dump_stack+0x81/0xba
[    1.387183]  ___might_sleep.cold+0xa6/0xb7
[    1.387887]  __might_sleep+0x46/0x80
[    1.388511]  __kmalloc_track_caller+0x177/0x200
[    1.389183]  kstrdup_const+0x45/0x70
[    1.389713]  __kernfs_new_node+0x4b/0x280
[    1.390331]  ? dynamic_emit_prefix+0x1da/0x1f0
[    1.391004]  ? __dynamic_pr_debug+0x8a/0xb0
[    1.391697]  kernfs_create_dir_ns+0x44/0xc0
[    1.392366]  sysfs_create_dir_ns+0x6c/0xd0
[    1.392971]  kobject_add_internal+0x102/0x300
[    1.393627]  kobject_add+0x7e/0xb0
[    1.394112]  ? device_links_flush_sync_list+0xf0/0xf0
[    1.394805]  ? get_device+0x20/0x20
[    1.395334]  device_add+0x123/0x810
[    1.395843]  ? scsi_attach_vpd+0xfb/0x110
[    1.396412]  scsi_sysfs_add_sdev+0x160/0x290
[    1.396997]  scsi_probe_and_add_lun+0x83f/0xbe0
[    1.397659]  __scsi_add_device+0x10a/0x120
[    1.398268]  ata_scsi_scan_host+0x98/0x1d0
[    1.398811]  ? wait_woken+0xb0/0xb0
[    1.399284]  async_port_probe+0x56/0x70
[    1.399799]  async_run_entry_fn+0x37/0x150
[    1.400372]  process_one_work+0x273/0x5c0
[    1.400891]  worker_thread+0x50/0x400
[    1.401412]  kthread+0x14c/0x170
[    1.401830]  ? process_one_work+0x5c0/0x5c0
[    1.402411]  ? kthread_create_worker_on_cpu+0x60/0x60
[    1.403185]  ret_from_fork+0x22/0x30
[    1.403779]
[    1.403983] =============================
[    1.404536] [ BUG: Invalid wait context ]
[    1.405132] 5.8.0-00025-g4e76f4427bf8 #30 Tainted: G        W
[    1.406196] -----------------------------
[    1.406847] kworker/u2:0/7 is trying to lock:
[    1.407513] ffffffff82cb6b70 (iattr_mutex){+.+.}-{4:4}, at: kernfs_xattr_get+0x25/0x60
[    1.408997] other info that might help us debug this:
[    1.409780] context-{5:5}
[    1.410276] 4 locks held by kworker/u2:0/7:
[    1.410924]  #0: ffff888007412948 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1f5/0x5c0
[    1.412649]  #1: ffffc90000043e58 ((work_completion)(&entry->work)){+.+.}-{0:0}, at: process_one_work+0x1f5/0x5c0
[    1.414238]  #2: ffff8880061500f0 (&shost->scan_mutex){+.+.}-{4:4}, at: __scsi_add_device+0x7d/0x120
[    1.415713]  #3: ffff8880063b40b0 (&zspage->lock){.+.+}-{3:3}, at: zs_map_object+0x7b/0x2b0
[    1.417024] stack backtrace:
[    1.417468] CPU: 0 PID: 7 Comm: kworker/u2:0 Tainted: G        W         5.8.0-00025-g4e76f4427bf8 #30
[    1.419019] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-2.fc32 04/01/2014
[    1.420344] Workqueue: events_unbound async_run_entry_fn
[    1.421154] Call Trace:
[    1.421578]  dump_stack+0x81/0xba
[    1.422123]  __lock_acquire.cold+0xc8/0x2d0
[    1.422709]  ? noop_count+0x10/0x10
[    1.423207]  ? __bfs+0xf4/0x210
[    1.423713]  lock_acquire+0xa2/0x3e0
[    1.424358]  ? kernfs_xattr_get+0x25/0x60
[    1.425109]  ? ___might_sleep+0x15c/0x190
[    1.425777]  __mutex_lock+0x8e/0x930
[    1.426362]  ? kernfs_xattr_get+0x25/0x60
[    1.426948]  ? __lock_acquire+0x1285/0x20e0
[    1.427623]  ? kernfs_xattr_get+0x25/0x60
[    1.428183]  mutex_lock_nested+0x16/0x20
[    1.429053]  kernfs_xattr_get+0x25/0x60
[    1.429695]  selinux_kernfs_init_security+0x5c/0x210
[    1.430475]  ? sched_clock+0x9/0x10
[    1.431012]  ? sched_clock_cpu+0x11/0xc0
[    1.432023]  security_kernfs_init_security+0x2a/0x40
[    1.432866]  __kernfs_new_node+0x1b7/0x280
[    1.433500]  ? dynamic_emit_prefix+0x1da/0x1f0
[    1.434231]  ? __dynamic_pr_debug+0x8a/0xb0
[    1.434852]  kernfs_create_dir_ns+0x44/0xc0
[    1.435586]  sysfs_create_dir_ns+0x6c/0xd0
[    1.436254]  kobject_add_internal+0x102/0x300
[    1.436970]  kobject_add+0x7e/0xb0
[    1.437515]  ? device_links_flush_sync_list+0xf0/0xf0
[    1.438445]  ? get_device+0x20/0x20
[    1.438965]  device_add+0x123/0x810
[    1.439573]  ? scsi_attach_vpd+0xfb/0x110
[    1.440377]  scsi_sysfs_add_sdev+0x160/0x290
[    1.441038]  scsi_probe_and_add_lun+0x83f/0xbe0
[    1.441981]  __scsi_add_device+0x10a/0x120
[    1.442519]  ata_scsi_scan_host+0x98/0x1d0
[    1.443125]  ? wait_woken+0xb0/0xb0
[    1.443630]  async_port_probe+0x56/0x70
[    1.444163]  async_run_entry_fn+0x37/0x150
[    1.444687]  process_one_work+0x273/0x5c0
[    1.445242]  worker_thread+0x50/0x400
[    1.445739]  kthread+0x14c/0x170
[    1.446207]  ? process_one_work+0x5c0/0x5c0
[    1.446745]  ? kthread_create_worker_on_cpu+0x60/0x60
[    1.447494]  ret_from_fork+0x22/0x30
[    1.448107] main:device_pm_add: PM: Adding info for scsi:target1:0:0
[    1.449033] kobject: 'target1:0:0' (00000000e397c75d): kobject_uevent_env
[    1.449990] kobject: 'target1:0:0' (00000000e397c75d): fill_kobj_path: path = '/devices/pci0000:00/0000:00:01.1/ata2/host1/target1:0:0'
[    1.451753] kobject: '1:0:0:0' (00000000a54577f2): kobject_add_internal: parent: 'target1:0:0', set: 'devices'
[    1.453131] main:device_pm_add: PM: Adding info for scsi:1:0:0:0
[    1.453999] kobject: '1:0:0:0' (00000000a54577f2): kobject_uevent_env
[    1.454998] kobject: '1:0:0:0' (00000000a54577f2): fill_kobj_path: path = '/devices/pci0000:00/0000:00:01.1/ata2/host1/target1:0:0/1:0:0:0'
[    1.456836] BUG: scheduling while atomic: kworker/u2:0/7/0x00000011
[    1.457715] INFO: lockdep is turned off.
[    1.458651] Modules linked in:
[    1.459134] CPU: 0 PID: 7 Comm: kworker/u2:0 Tainted: G        W         5.8.0-00025-g4e76f4427bf8 #30
[    1.460629] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-2.fc32 04/01/2014
[    1.462015] Workqueue: events_unbound async_run_entry_fn
[    1.463068] Call Trace:
[    1.463470]  dump_stack+0x81/0xba
[    1.464030]  __schedule_bug.cold+0x5f/0x70
[    1.464812]  __schedule+0x80b/0x9a0
[    1.465477]  ? wait_for_completion_io+0x7e/0x110
[    1.466188]  schedule+0x69/0xe0
[    1.466888]  schedule_timeout+0xe0/0x120
[    1.467514]  ? __blk_mq_delay_run_hw_queue+0x16d/0x180
[    1.468363]  ? _raw_spin_unlock_irq+0x23/0x40
[    1.469057]  ? trace_hardirqs_on+0x2b/0xf0
[    1.469709]  io_schedule_timeout+0x4b/0x80
[    1.470405]  wait_for_completion_io+0xa9/0x110
[    1.471149]  blk_execute_rq+0x7f/0xb0
[    1.471748]  __scsi_execute+0x109/0x260
[    1.472426]  scsi_test_unit_ready+0x5b/0xe0
[    1.473097]  sr_probe+0x23b/0x600
[    1.473608]  ? kernfs_create_link+0x63/0xa0
[    1.474256]  really_probe+0x27b/0x410
[    1.474866]  driver_probe_device+0xe4/0x150
[    1.475633]  __device_attach_driver+0x6c/0xd0
[    1.476351]  ? driver_allows_async_probing+0x50/0x50
[    1.477091]  bus_for_each_drv+0x82/0xd0
[    1.477686]  __device_attach+0x111/0x1b0
[    1.478352]  device_initial_probe+0xe/0x10
[    1.478976]  bus_probe_device+0x9b/0xb0
[    1.479601]  device_add+0x3a8/0x810
[    1.480197]  scsi_sysfs_add_sdev+0x91/0x290
[    1.480856]  scsi_probe_and_add_lun+0x83f/0xbe0
[    1.481630]  __scsi_add_device+0x10a/0x120
[    1.482328]  ata_scsi_scan_host+0x98/0x1d0
[    1.482955]  ? wait_woken+0xb0/0xb0
[    1.483459]  async_port_probe+0x56/0x70
[    1.484023]  async_run_entry_fn+0x37/0x150
[    1.484796]  process_one_work+0x273/0x5c0
[    1.485604]  worker_thread+0x50/0x400
[    1.486303]  kthread+0x14c/0x170
[    1.486858]  ? process_one_work+0x5c0/0x5c0
[    1.487708]  ? kthread_create_worker_on_cpu+0x60/0x60
[    1.488631]  ret_from_fork+0x22/0x30
QEMU 4.2.1 monitor - type 'help' for more information

(qemu) dump-guest-memory -p dump.p
(qemu) q

[jimc@frodo build-v2]$ gdb vmlinux dump.p
GNU gdb (GDB) Fedora 9.1-5.fc32
...
Reading symbols from vmlinux...
[New LWP 1]
1271		for (fn = initcall_levels[level]; fn < initcall_levels[level+1]; fn++)
(gdb) bt

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 701d3d1fb7e7..38f7107699e9 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -172,7 +172,9 @@ static void ddebug_callsite_put(struct _ddebug *dp)
 		/* no site to unmap, or no means to restore */
 		return;
 
-	/* always unmap for now. if !pr-debug was too hard */
+	if (dp->flags & _DPRINTK_FLAGS_PRINT)
+		return; /* keep maps of enabled pr_debugs */
+
 	zs_unmap_object(dd_callsite_zpool, dp->zhandle);
 	dp->site = NULL;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

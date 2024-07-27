Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B67B93EE4A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 09:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6560F10E318;
	Mon, 29 Jul 2024 07:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VdIQrF3l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58BA510E0C6
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 11:33:17 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id
 41be03b00d2f7-7163489149eso1359246a12.1
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jul 2024 04:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722079997; x=1722684797; darn=lists.freedesktop.org;
 h=content-transfer-encoding:subject:cc:to:content-language:from
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GNsl/OB/ICoYuyVAs9uaoPUuOZcT20AfXn9QPNPXeNE=;
 b=VdIQrF3lGE34LLIbqJcObXwfxpZuBakLNUYrgpKIEpCWcIqgvr3e5IT74cfQliL7Z7
 Ew0IvzC8WsyCO5H5bkOx4C74VxI0xeJLZN1e0GSXHoi0utCBRz8uO2ZCigbLuJuvx+BL
 QeHpfcBxpgyJAf3X0L2miK4WG76tuhrTWk5kjZsSN9dE/rXQtM51tTj0MkF+548IlLcM
 Mn6Gcd/QmUrYgtZ8sfPxneuy5vNp6ezWnU8H0rYrmj5xOdSG/OXsweAkceR6ItOesY/g
 eNMkPOxesO5JERZNWHyNmYOSPoITqjwdHTUSP2nirJvpWwzaolZvvjFL12PZvQ3fXAGF
 5siQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722079997; x=1722684797;
 h=content-transfer-encoding:subject:cc:to:content-language:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GNsl/OB/ICoYuyVAs9uaoPUuOZcT20AfXn9QPNPXeNE=;
 b=NurjPngloI3UsgdZ3WwYcUSxx6wMHi/tiLa3IwGUOv2PYFciExgf5KizG1ykOaAjr4
 RrisrB2mkmFhrJpFVLOgOhfp4+qUpcbHDr6Gov1kWF0P8rQjDP1QVO8B/o60zkiTxBlS
 n7ZZmM+tMZLAMGraJAp6icnrKnydJYWTu3zQLDz0QN/OGHt/QMq8B25P9xqWDbuLYhBy
 fdGF2iXbMJ1Q/1q/vhVNxE9rTKM8y2terZJyhbbpCr59WEs09AtyTi/xoofkTUdPWAnl
 /Nx+dTYHGmuZFKxnzLM2Uh4N6ukuwFI65ssFF4pL9EqA/1l0G/u3xgbnvabZL8XmOLm2
 Y5dQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjepxQCd3ekCsvRl+FTowA4T9E9g5RwNmkMDZBy07SY9rm6nCpCI7BiS/liuDwaw/FX7bYCW92ixKx5bBf44GS7VAKaJ0EBT2eJJ07oC14
X-Gm-Message-State: AOJu0YzN/6G697Hf3epCTCiXkCKEJiFv2Ns/bEZ4qakupUnZstcqLwzZ
 rqC/oV424IT4Xphqtpm1MroOcssfNRIz/h6k5JRvMBhYdGght7aK
X-Google-Smtp-Source: AGHT+IHMtS8YvavSNWPHUD1V/9UtCDbubv3vzr/KpWwv2xE1BmQ6/qykmiGKO2gPhNGYAA8DQ6bI0A==
X-Received: by 2002:a17:90a:a790:b0:2c9:1012:b323 with SMTP id
 98e67ed59e1d1-2cf7e5f51d7mr2501059a91.27.1722079995697; 
 Sat, 27 Jul 2024 04:33:15 -0700 (PDT)
Received: from [192.168.97.143] ([223.39.211.248])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cd8f73bd52sm3652871a91.1.2024.07.27.04.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Jul 2024 04:33:15 -0700 (PDT)
Message-ID: <38a703a9-6efb-456a-a248-1dd3687e526d@gmail.com>
Date: Sat, 27 Jul 2024 20:33:10 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Language: en-US, tr, en-GB
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: panel-simple-dp-aux: "DP AUX done_probing() can't defer" on MT8186 w/
 Collabora kernel
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 29 Jul 2024 07:16:05 +0000
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

Hi,

I have a MT8186 "Magneton" Chromebook that I'm trying to boot a kernel
based on Collabora's for-kernelci branch [1], using a config from
postmarketOS [2] (intended for that), on a Debian sid installation.
This sometimes fails to enable the display with:

> panel-simple-dp-aux aux-0-0058: DP AUX done_probing() can't defer

I know this is a weird out-of-tree combination of things but I've been
asked to report this on the mailing list by wens on the #linux-mediatek
IRC channel.

[1] https://gitlab.collabora.com/google/chromeos-kernel/-/commits/for-kernelci/

[2] https://gitlab.com/postmarketOS/pmaports/-/blob/master/device/testing/linux-postmarketos-mediatek-mt81xx/config-postmarketos-mediatek-mt81xx.aarch64

Serial output from the system starting with dmesg and some more info copied below.

----8<----
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x411fd050]
[    0.000000] Linux version 6.10.0-rc4-next-20240620+ (alpernebbi@ALPER-C340) (aarch64-linux-gnu-gcc (Debian 13.2.0-12) 13.2.0, GNU ld (GNU Binutils for Debian) 2.42.90.2024
[    0.000000] KASLR enabled
[    0.000000] random: crng init done
[    0.000000] Machine model: Google Magneton board
[    0.000000] earlycon: mtk8250 at MMIO32 0x0000000011002000 (options '115200n8')
[    0.000000] printk: legacy bootconsole [mtk8250] enabled
[    0.000000] printk: debug: skip boot console de-registration.
[    0.000000] Reserved memory: created DMA memory pool at 0x0000000050000000, size 16 MiB
[    0.000000] OF: reserved mem: initialized node memory@50000000, compatible id shared-dma-pool
[    0.000000] OF: reserved mem: 0x0000000050000000..0x000000005109ffff (17024 KiB) nomap non-reusable memory@50000000
[    0.000000] Reserved memory: created DMA memory pool at 0x0000000060000000, size 10 MiB
[    0.000000] OF: reserved mem: initialized node memory@60000000, compatible id shared-dma-pool
[    0.000000] OF: reserved mem: 0x0000000060000000..0x00000000609fffff (10240 KiB) nomap non-reusable memory@60000000
[    0.000000] Reserved memory: created DMA memory pool at 0x0000000061000000, size 1 MiB
[    0.000000] OF: reserved mem: initialized node memory@61000000, compatible id shared-dma-pool
[    0.000000] OF: reserved mem: 0x0000000061000000..0x00000000610fffff (1024 KiB) nomap non-reusable memory@61000000
[    0.000000] OF: reserved mem: 0x00000000ffec5000..0x00000000fffc4fff (1024 KiB) map non-reusable ramoops
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem 0x0000000040000000-0x000000013fffffff]
[    0.000000] NUMA: NODE_DATA [mem 0x13f7ac340-0x13f7aefff]
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000040000000-0x00000000ffffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000013fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000040000000-0x000000004fffffff]
[    0.000000]   node   0: [mem 0x0000000050000000-0x000000005109ffff]
[    0.000000]   node   0: [mem 0x00000000510a0000-0x00000000545fffff]
[    0.000000]   node   0: [mem 0x0000000054700000-0x000000005fffffff]
[    0.000000]   node   0: [mem 0x0000000060000000-0x00000000609fffff]
[    0.000000]   node   0: [mem 0x0000000060a00000-0x0000000060ffffff]
[    0.000000]   node   0: [mem 0x0000000061000000-0x00000000610fffff]
[    0.000000]   node   0: [mem 0x0000000061100000-0x0000000069ffffff]
[    0.000000]   node   0: [mem 0x000000006a100000-0x00000000ffdfffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x000000013fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x000000013fffffff]
[    0.000000] On node 0, zone DMA: 256 pages in unavailable ranges
[    0.000000] On node 0, zone DMA: 256 pages in unavailable ranges
[    0.000000] On node 0, zone Normal: 512 pages in unavailable ranges
[    0.000000] cma: Reserved 32 MiB at 0x00000000fde00000 on node -1
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.2
[    0.000000] percpu: Embedded 34 pages/cpu s98648 r8192 d32424 u139264
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] CPU features: detected: Virtualization Host Extensions
[    0.000000] CPU features: kernel page table isolation forced ON by KASLR
[    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
[    0.000000] CPU features: detected: Qualcomm erratum 1009, or ARM erratum 1286807, 2441009
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or 1530923
[    0.000000] alternatives: applying boot alternatives
[    0.000000] Kernel command line: cros_secure kern_guid=62abee0c-620d-4f78-b09a-7ea2441e553d earlycon keep_bootcon splash plymouth.ignore-serial-consoles ipv6.disable=1 ro3
[    0.000000] Unknown kernel command line parameters "cros_secure splash kern_guid=62abee0c-620d-4f78-b09a-7ea2441e553d", will be passed to user space.
[    0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes, linear)
[    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.000000] Fallback order for Node 0: 0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 1047552
[    0.000000] Policy zone: Normal
[    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
[    0.000000] software IO TLB: area num 8.
[    0.000000] software IO TLB: mapped [mem 0x00000000f9e00000-0x00000000fde00000] (64MB)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=8, Nodes=1
[    0.000000] ftrace: allocating 62929 entries in 246 pages
[    0.000000] ftrace: allocated 246 pages with 6 groups
[    0.000000] trace event string verifier disabled
[    0.000000] Dynamic Preempt: full
[    0.000000] rcu: Preemptible hierarchical RCU implementation.
[    0.000000] rcu:     RCU priority boosting: priority 1 delay 500 ms.
[    0.000000]  Trampoline variant of Tasks RCU enabled.
[    0.000000]  Rude variant of Tasks RCU enabled.
[    0.000000]  Tracing variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    0.000000] RCU Tasks: Setting shift to 3 and lim to 1 rcu_task_cb_adjust=1.
[    0.000000] RCU Tasks Rude: Setting shift to 3 and lim to 1 rcu_task_cb_adjust=1.
[    0.000000] RCU Tasks Trace: Setting shift to 3 and lim to 1 rcu_task_cb_adjust=1.
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
[    0.000000] GICv3: 480 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] Root IRQ handler: gic_handle_irq
[    0.000000] GICv3: GICv3 features: 16 PPIs
[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x000000000c040000
[    0.000000] GICv3: GIC: PPI partition interrupt-partition-0[0] { /cpus/cpu@0[0] /cpus/cpu@100[1] /cpus/cpu@200[2] /cpus/cpu@300[3] /cpus/cpu@400[4] /cpus/cpu@500[5] }
[    0.000000] GICv3: GIC: PPI partition interrupt-partition-1[1] { /cpus/cpu@600[6] /cpus/cpu@700[7] }
[    0.000000] rcu:     Offload RCU callbacks from CPUs: 0-7.
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.000000] arch_timer: cp15 timer(s) running at 13.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x2ff89eacb, max_idle_ns: 440795202429 ns
[    0.000000] sched_clock: 56 bits at 13MHz, resolution 76ns, wraps every 4398046511101ns
[    0.008507] Console: colour dummy device 80x25
[    0.012984] printk: legacy console [tty0] enabled
[    0.017804] Calibrating delay loop (skipped), value calculated using timer frequency.. 26.00 BogoMIPS (lpj=13000)
[    0.028150] pid_max: default: 32768 minimum: 301
[    0.032882] LSM: initializing lsm=capability,landlock,yama,loadpin,safesetid
[    0.040069] landlock: Up and running.
[    0.043755] Yama: becoming mindful.
[    0.047274] LoadPin: ready to pin (currently not enforcing)
[    0.052948] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.060410] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes, linear)
[    0.069889] rcu: Hierarchical SRCU implementation.
[    0.074722] rcu:     Max phase no-delay instances is 400.
[    0.081449] smp: Bringing up secondary CPUs ...
[    0.086387] Detected VIPT I-cache on CPU1
[    0.086440] GICv3: CPU1: found redistributor 100 region 0:0x000000000c060000
[    0.086471] CPU1: Booted secondary processor 0x0000000100 [0x411fd050]
[    0.086904] Detected VIPT I-cache on CPU2
[    0.086945] GICv3: CPU2: found redistributor 200 region 0:0x000000000c080000
[    0.086967] CPU2: Booted secondary processor 0x0000000200 [0x411fd050]
[    0.087334] Detected VIPT I-cache on CPU3
[    0.087368] GICv3: CPU3: found redistributor 300 region 0:0x000000000c0a0000
[    0.087385] CPU3: Booted secondary processor 0x0000000300 [0x411fd050]
[    0.087785] Detected VIPT I-cache on CPU4
[    0.087819] GICv3: CPU4: found redistributor 400 region 0:0x000000000c0c0000
[    0.087833] CPU4: Booted secondary processor 0x0000000400 [0x411fd050]
[    0.088303] Detected VIPT I-cache on CPU5
[    0.088339] GICv3: CPU5: found redistributor 500 region 0:0x000000000c0e0000
[    0.088353] CPU5: Booted secondary processor 0x0000000500 [0x411fd050]
[    0.088736] CPU features: detected: Spectre-v4
[    0.088742] CPU features: detected: Spectre-BHB
[    0.088744] CPU features: detected: ARM erratum 1418040
[    0.088746] CPU features: detected: ARM erratum 1463225
[    0.088749] Detected PIPT I-cache on CPU6
[    0.088785] GICv3: CPU6: found redistributor 600 region 0:0x000000000c100000
[    0.088792] arch_timer: Enabling local workaround for ARM erratum 1418040
[    0.088802] CPU6: Booted secondary processor 0x0000000600 [0x413fd0b0]
[    0.089206] Detected PIPT I-cache on CPU7
[    0.089246] GICv3: CPU7: found redistributor 700 region 0:0x000000000c120000
[    0.089253] arch_timer: Enabling local workaround for ARM erratum 1418040
[    0.089263] CPU7: Booted secondary processor 0x0000000700 [0x413fd0b0]
[    0.089322] smp: Brought up 1 node, 8 CPUs
[    0.250592] SMP: Total of 8 processors activated.
[    0.255354] CPU: All CPU(s) started at EL2
[    0.259481] CPU features: detected: 32-bit EL0 Support
[    0.264657] CPU features: detected: Data cache clean to the PoU not required for I/D coherence
[    0.273335] CPU features: detected: Common not Private translations
[    0.279660] CPU features: detected: CRC32 instructions
[    0.284846] CPU features: detected: RCpc load-acquire (LDAPR)
[    0.290635] CPU features: detected: LSE atomic instructions
[    0.296247] CPU features: detected: Privileged Access Never
[    0.301859] CPU features: detected: RAS Extension Support
[    0.307297] CPU features: detected: Speculative Store Bypassing Safe (SSBS)
[    0.314347] alternatives: applying system-wide alternatives
[    0.323003] CPU features: detected: Hardware dirty bit management on CPU6-7
[    0.330234] Memory: 3921748K/4190208K available (19968K kernel code, 3812K rwdata, 8912K rodata, 2624K init, 651K bss, 227044K reserved, 32768K cma-reserved)
[    0.345533] devtmpfs: initialized
[    0.353393] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    0.363222] futex hash table entries: 2048 (order: 5, 131072 bytes, linear)
[    0.370478] 2G module region forced by RANDOMIZE_MODULE_REGION_FULL
[    0.376793] 0 pages in range for non-PLT usage
[    0.376795] 515232 pages in range for PLT usage
[    0.381391] pinctrl core: initialized pinctrl subsystem
[    0.393015] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.399535] DMA: preallocated 512 KiB GFP_KERNEL pool for atomic allocations
[    0.406769] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.414664] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.422658] audit: initializing netlink subsys (disabled)
[    0.428174] audit: type=2000 audit(0.145:1): state=initialized audit_enabled=0 res=1
[    0.428495] thermal_sys: Registered thermal governor 'step_wise'
[    0.435985] thermal_sys: Registered thermal governor 'user_space'
[    0.442036] thermal_sys: Registered thermal governor 'power_allocator'
[    0.448186] cpuidle: using governor ladder
[    0.458886] cpuidle: using governor menu
[    0.462907] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.469842] ASID allocator initialised with 32768 entries
[    0.475495] Serial: AMBA PL011 UART driver
[    0.480259] pstore: Using crash dump compression: deflate
[    0.485701] printk: legacy console [ramoops-1] enabled
[    0.491283] pstore: Registered ramoops as persistent store backend
[    0.497512] ramoops: using 0x100000@0xffec5000, ecc: 0
[    0.512673] platform 1400a000.dpi: Fixed dependency cycle(s) with /soc/i2c@1100f000/dp-bridge@5c
[    0.522051] platform 14013000.dsi: Fixed dependency cycle(s) with /soc/i2c@11007000/anx7625@58
[    0.534813] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.541676] HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
[    0.547994] HugeTLB: registered 32.0 MiB page size, pre-allocated 0 pages
[    0.554831] HugeTLB: 0 KiB vmemmap can be freed for a 32.0 MiB page
[    0.561144] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.567980] HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
[    0.574293] HugeTLB: registered 64.0 KiB page size, pre-allocated 0 pages
[    0.581129] HugeTLB: 0 KiB vmemmap can be freed for a 64.0 KiB page
[    0.587695] Demotion targets for Node 0: null
[    0.592466] cryptd: max_cpu_qlen set to 1000
[    0.597611] iommu: Default domain type: Translated
[    0.602442] iommu: DMA domain TLB invalidation policy: strict mode
[    0.609008] SCSI subsystem initialized
[    0.612957] usbcore: registered new interface driver usbfs
[    0.618511] usbcore: registered new interface driver hub
[    0.623874] usbcore: registered new device driver usb
[    0.629165] mc: Linux media interface: v0.10
[    0.633483] videodev: Linux video capture interface: v2.00
[    0.639018] pps_core: LinuxPPS API ver. 1 registered
[    0.644017] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.653222] PTP clock support registered
[    0.657182] EDAC MC: Ver: 3.0.0
[    0.660480] scmi_core: SCMI protocol bus registered
[    0.666001] FPGA manager framework
[    0.669469] Advanced Linux Sound Architecture Driver Initialized.
[    0.676648] NetLabel: Initializing
[    0.680077] NetLabel:  domain hash size = 128
[    0.684462] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.690210] NetLabel:  unlabeled traffic allowed by default
[    0.695899] vgaarb: loaded
[    0.698782] clocksource: Switched to clocksource arch_sys_counter
[    0.705126] VFS: Disk quotas dquot_6.6.0
[    0.709097] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.719295] NET: Registered PF_INET protocol family
[    0.724313] IP idents hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.733725] tcp_listen_portaddr_hash hash table entries: 2048 (order: 3, 32768 bytes, linear)
[    0.742347] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.750156] TCP established hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.758319] TCP bind hash table entries: 32768 (order: 8, 1048576 bytes, linear)
[    0.766482] TCP: Hash tables configured (established 32768 bind 32768)
[    0.773155] MPTCP token hash table entries: 4096 (order: 4, 98304 bytes, linear)
[    0.780646] UDP hash table entries: 2048 (order: 4, 65536 bytes, linear)
[    0.787467] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes, linear)
[    0.794875] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.800792] RPC: Registered named UNIX socket transport module.
[    0.806757] RPC: Registered udp transport module.
[    0.811493] RPC: Registered tcp transport module.
[    0.816229] RPC: Registered tcp-with-tls transport module.
[    0.821753] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.828244] PCI: CLS 0 bytes, default 64
[    0.832362] Unpacking initramfs...
[    0.838154] kvm [1]: nv: 477 coarse grained trap handlers
[    0.843794] kvm [1]: IPA Size Limit: 40 bits
[    0.848105] kvm [1]: GICv3: no GICV resource entry
[    0.852931] kvm [1]: disabling GICv2 emulation
[    0.857415] kvm [1]: GIC system register CPU interface enabled
[    0.863302] kvm [1]: vgic interrupt IRQ18
[    0.867357] kvm [1]: VHE mode initialized successfully
[    0.873344] Initialise system trusted keyrings
[    0.877928] workingset: timestamp_bits=42 max_order=20 bucket_order=0
[    0.885062] NFS: Registering the id_resolver key type
[    0.890186] Key type id_resolver registered
[    0.894403] Key type id_legacy registered
[    0.898461] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    0.905222] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver Registering...
[    0.912692] ntfs3: Read-only LZX/Xpress compression included
[    0.918534] 9p: Installing v9fs 9p2000 file system support
[    0.953318] Key type asymmetric registered
[    0.957469] Asymmetric key parser 'x509' registered
[    0.962449] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 242)
[    0.970008] io scheduler mq-deadline registered
[    0.974581] io scheduler kyber registered
[    0.980720] mediatek-mipi-tx 11cc0000.dsi-phy: can't get nvmem_cell_get, ignore it
[    0.993275] cannot find "mediatek,mt8186-fhctl"
[    1.006546] mtk-socinfo mtk-socinfo.0.auto: MediaTek Kompanio 520 (MT8186) SoC detected.
[    1.017364] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.044875] 11002000.serial: ttyS0 at MMIO 0x11002000 (irq = 245, base_baud = 1625000) is a ST16650V2
[    1.054218] printk: legacy console [ttyS0] enabled
[    1.054218] printk: legacy console [ttyS0] enabled
[    1.064520] SPI driver tpm_tis_spi has no spi_device_id for atmel,attpm20p
[    1.064520] SPI driver tpm_tis_spi has no spi_device_id for atmel,attpm20p
[    1.093138] mt6359-auxadc: Failed to locate of_node [id: -1]
[    1.093138] mt6359-auxadc: Failed to locate of_node [id: -1]
[    1.104650] platform mt6358-regulator: Fixed dependency cycle(s) with /soc/pwrap@1000d000/pmic/regulators/vs2
[    1.104650] platform mt6358-regulator: Fixed dependency cycle(s) with /soc/pwrap@1000d000/pmic/regulators/vs2
[    1.124532] platform mt6358-regulator: Fixed dependency cycle(s) with /soc/pwrap@1000d000/pmic/regulators/vdram1
[    1.124532] platform mt6358-regulator: Fixed dependency cycle(s) with /soc/pwrap@1000d000/pmic/regulators/vdram1
[    1.144926] platform mt6358-regulator: Fixed dependency cycle(s) with /soc/pwrap@1000d000/pmic/regulators/vs1
[    1.144926] platform mt6358-regulator: Fixed dependency cycle(s) with /soc/pwrap@1000d000/pmic/regulators/vs1
[    1.165555] mt6358-keys: Failed to locate of_node [id: -1]
[    1.165555] mt6358-keys: Failed to locate of_node [id: -1]
[    1.177125] megasas: 07.727.03.00-rc1
[    1.177125] megasas: 07.727.03.00-rc1
[    1.188699] mtk-spi-nor 11000000.spi: spi frequency: 39000000 Hz
[    1.192275] tpm_tis_spi spi1.0: TPM ready IRQ confirmed on attempt 2
[    1.188699] mtk-spi-nor 11000000.spi: spi frequency: 39000000 Hz
[    1.192275] tpm_tis_spi spi1.0: TPM ready IRQ confirmed on attempt 2
[    1.215093] thunder_xcv, ver 1.0
[    1.215093] thunder_xcv, ver 1.0
[    1.221570] thunder_bgx, ver 1.0
[    1.223260] tpm_tis_spi spi1.0: 2.0 TPM (device-id 0x504A, rev-id 83)
[    1.224798] nicpf, ver 1.0
[    1.221570] thunder_bgx, ver 1.0
[    1.223260] tpm_tis_spi spi1.0: 2.0 TPM (device-id 0x504A, rev-id 83)
[    1.224798] nicpf, ver 1.0
[    1.246626] hns3: Hisilicon Ethernet Network Driver for Hip08 Family - version
[    1.246626] hns3: Hisilicon Ethernet Network Driver for Hip08 Family - version
[    1.261094] hns3: Copyright (c) 2017 Huawei Corporation.
[    1.261094] hns3: Copyright (c) 2017 Huawei Corporation.
[    1.271747] hclge is initializing
[    1.272661] tpm_tis_spi spi1.0: Cr50 firmware version: Ti50/D3C1 RO_B:0.0.56/- RW_A:0.23.90/ti50_common_mp-15224.B:v0.0
[    1.275069] e1000: Intel(R) PRO/1000 Network Driver
[    1.271747] hclge is initializing
[    1.272661] tpm_tis_spi spi1.0: Cr50 firmware version: Ti50/D3C1 RO_B:0.0.56/- RW_A:0.23.90/ti50_common_mp-15224.B:v0.0
[    1.275069] e1000: Intel(R) PRO/1000 Network Driver
[    1.309722] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    1.309722] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    1.321230] e1000e: Intel(R) PRO/1000 Network Driver
[    1.321230] e1000e: Intel(R) PRO/1000 Network Driver
[    1.331160] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.331160] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    1.343022] igb: Intel(R) Gigabit Ethernet Network Driver
[    1.343022] igb: Intel(R) Gigabit Ethernet Network Driver
[    1.353825] igb: Copyright (c) 2007-2014 Intel Corporation.
[    1.353825] igb: Copyright (c) 2007-2014 Intel Corporation.
[    1.365006] igbvf: Intel(R) Gigabit Virtual Function Network Driver
[    1.365006] igbvf: Intel(R) Gigabit Virtual Function Network Driver
[    1.377563] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    1.377563] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    1.389557] sky2: driver version 1.30
[    1.389557] sky2: driver version 1.30
[    1.397005] PPP generic driver version 2.4.2
[    1.397005] PPP generic driver version 2.4.2
[    1.405753] PPP MPPE Compression module registered
[    1.405753] PPP MPPE Compression module registered
[    1.415512] VFIO - User Level meta-driver version: 0.3
[    1.415512] VFIO - User Level meta-driver version: 0.3
[    1.426991] usbcore: registered new interface driver cdc_acm
[    1.426991] usbcore: registered new interface driver cdc_acm
[    1.438319] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
[    1.438319] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
[    1.454426] usbcore: registered new interface driver uas
[    1.454426] usbcore: registered new interface driver uas
[    1.465085] usbcore: registered new interface driver usb-storage
[    1.465085] usbcore: registered new interface driver usb-storage
[    1.478701] mt6397-rtc mt6358-rtc: registered as rtc0
[    1.478701] mt6397-rtc mt6358-rtc: registered as rtc0
[    1.488960] mt6397-rtc mt6358-rtc: setting system clock to 2024-07-27T10:41:40 UTC (1722076900)
[    1.488960] mt6397-rtc mt6358-rtc: setting system clock to 2024-07-27T10:41:40 UTC (1722076900)
[    1.506486] i2c_dev: i2c /dev entries driver
[    1.506486] i2c_dev: i2c /dev entries driver
[    1.515593] platform 14013000.dsi: Fixed dependency cycle(s) with /soc/i2c@11007000/anx7625@58
[    1.515593] platform 14013000.dsi: Fixed dependency cycle(s) with /soc/i2c@11007000/anx7625@58
[    1.532895] i2c 0-0058: Fixed dependency cycle(s) with /soc/i2c@11007000/anx7625@58/aux-bus/panel
[    1.532895] i2c 0-0058: Fixed dependency cycle(s) with /soc/i2c@11007000/anx7625@58/aux-bus/panel
[    1.550670] i2c 0-0058: Fixed dependency cycle(s) with /soc/dsi@14013000
[    1.550670] i2c 0-0058: Fixed dependency cycle(s) with /soc/dsi@14013000
[    1.565918] platform 1400a000.dpi: Fixed dependency cycle(s) with /soc/i2c@1100f000/dp-bridge@5c
[    1.565918] platform 1400a000.dpi: Fixed dependency cycle(s) with /soc/i2c@1100f000/dp-bridge@5c
[    1.583575] i2c 3-005c: Fixed dependency cycle(s) with /soc/dpi@1400a000
[    1.583575] i2c 3-005c: Fixed dependency cycle(s) with /soc/dpi@1400a000
[    1.599857] mtk-lvts-thermal 1100b000.thermal-sensor: error -ENODATA: Failed to initialize the lvts domain
[    1.599857] mtk-lvts-thermal 1100b000.thermal-sensor: error -ENODATA: Failed to initialize the lvts domain
[    1.619220] mtk-lvts-thermal 1100b000.thermal-sensor: probe with driver mtk-lvts-thermal failed with error -61
[    1.619220] mtk-lvts-thermal 1100b000.thermal-sensor: probe with driver mtk-lvts-thermal failed with error -61
[    1.639806] mtk-wdt 10007000.watchdog: Watchdog enabled (timeout=31 sec, nowayout=0)
[    1.639806] mtk-wdt 10007000.watchdog: Watchdog enabled (timeout=31 sec, nowayout=0)
[    1.655743] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised: dm-devel@lists.linux.dev
[    1.655743] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialised: dm-devel@lists.linux.dev
[    1.673773] mtk-cpufreq mtk-cpufreq: failed to initialize dvfs info for cpu0
[    1.673773] mtk-cpufreq mtk-cpufreq: failed to initialize dvfs info for cpu0
[    1.688859] sdhci: Secure Digital Host Controller Interface driver
[    1.688859] sdhci: Secure Digital Host Controller Interface driver
[    1.701258] sdhci: Copyright(c) Pierre Ossman
[    1.701258] sdhci: Copyright(c) Pierre Ossman
[    1.710320] Synopsys Designware Multimedia Card Interface Driver
[    1.710320] Synopsys Designware Multimedia Card Interface Driver
[    1.722447] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.722447] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.734817] ledtrig-cpu: registered to indicate activity on CPUs
[    1.734817] ledtrig-cpu: registered to indicate activity on CPUs
[    1.747884] SMCCC: SOC_ID: ID = jep106:0426:8186 Revision = 0x00000000
[    1.747884] SMCCC: SOC_ID: ID = jep106:0426:8186 Revision = 0x00000000
[    1.760979] hid: raw HID events driver (C) Jiri Kosina
[    1.760979] hid: raw HID events driver (C) Jiri Kosina
[    1.771518] usbcore: registered new interface driver usbhid
[    1.771518] usbcore: registered new interface driver usbhid
[    1.782692] usbhid: USB HID core driver
[    1.782692] usbhid: USB HID core driver
[    1.790577] spi_master spi0: will run message pump with realtime priority
[    1.791964] mtk-scp 10500000.scp: error -EINVAL: invalid resource (null)
[    1.790577] spi_master spi0: will run message pump with realtime priority
[    1.791964] mtk-scp 10500000.scp: error -EINVAL: invalid resource (null)
[    1.818010] mtk-scp 10500000.scp: assigned reserved memory node memory@50000000
[    1.818010] mtk-scp 10500000.scp: assigned reserved memory node memory@50000000
[    1.833626] remoteproc remoteproc0: scp is available
[    1.833626] remoteproc remoteproc0: scp is available
[    1.847036] hw perfevents: enabled with armv8_cortex_a55 PMU driver, 7 counters available
[    1.847036] hw perfevents: enabled with armv8_cortex_a55 PMU driver, 7 counters available
[    1.863970] hw perfevents: enabled with armv8_cortex_a76 PMU driver, 7 counters available
[    1.871878] sbs-battery 6-000b: sbs-battery: battery gas gauge device registered
[    1.872521] watchdog: Delayed init of the lockup detector failed: -19
[    1.863970] hw perfevents: enabled with armv8_cortex_a76 PMU driver, 7 counters available
[    1.878710] mt8186-audio 11210000.audio-controller: mtk_afe_combine_sub_dai(), num of dai 41
[    1.871878] sbs-battery 6-000b: sbs-battery: battery gas gauge device registered
[    1.878930] mt8186-audio 11210000.audio-controller: No cache defaults, reading back from HW
[    1.872521] watchdog: Delayed init of the lockup detector failed: -19
[    1.878710] mt8186-audio 11210000.audio-controller: mtk_afe_combine_sub_dai(), num of dai 41
[    1.878930] mt8186-audio 11210000.audio-controller: No cache defaults, reading back from HW
[    1.941714] watchdog: Hard watchdog permanently disabled
[    1.943371] input: cros_ec as /devices/platform/soc/11010000.spi/spi_master/spi0/spi0.0/11010000.spi:ec@0:keyboard-controller/input/input0
[    1.941714] watchdog: Hard watchdog permanently disabled
[    1.943371] input: cros_ec as /devices/platform/soc/11010000.spi/spi_master/spi0/spi0.0/11010000.spi:ec@0:keyboard-controller/input/input0
[    1.966439] sbs-battery 6-000b: I2C adapter does not support I2C_FUNC_SMBUS_READ_BLOCK_DATA.
[    1.966439] Fallback method does not support PEC.
[    1.977499] Initializing XFRM netlink socket
[    1.966439] sbs-battery 6-000b: I2C adapter does not support I2C_FUNC_SMBUS_READ_BLOCK_DATA.
[    1.966439] Fallback method does not support PEC.
[    2.004527] input: cros_ec_buttons as /devices/platform/soc/11010000.spi/spi_master/spi0/spi0.0/11010000.spi:ec@0:keyboard-controller/input/input1
[    1.977499] Initializing XFRM netlink socket
[    2.004527] input: cros_ec_buttons as /devices/platform/soc/11010000.spi/spi_master/spi0/spi0.0/11010000.spi:ec@0:keyboard-controller/input/input1
[    2.038557] NET: Registered PF_PACKET protocol family
[    2.038557] NET: Registered PF_PACKET protocol family
[    2.048815] NET: Registered PF_KEY protocol family
[    2.048815] NET: Registered PF_KEY protocol family
[    2.056102] cros-ec-spi spi0.0: Chrome EC device registered
[    2.058722] 9pnet: Installing 9P2000 support
[    2.056102] cros-ec-spi spi0.0: Chrome EC device registered
[    2.058722] 9pnet: Installing 9P2000 support
[    2.078182] Key type dns_resolver registered
[    2.078182] Key type dns_resolver registered
[    2.091183] Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
[    2.091183] Timer migration: 1 hierarchy levels; 8 children per group; 1 crossnode level
[    2.108196] registered taskstats version 1
[    2.108196] registered taskstats version 1
[    2.116881] Loading compiled-in X.509 certificates
[    2.116881] Loading compiled-in X.509 certificates
[    2.130642] Demotion targets for Node 0: null
[    2.130642] Demotion targets for Node 0: null
[    2.139571] Key type .fscrypt registered
[    2.139571] Key type .fscrypt registered
[    2.147457] Key type fscrypt-provisioning registered
[    2.147457] Key type fscrypt-provisioning registered
[    2.157510] Key type encrypted registered
[    2.157510] Key type encrypted registered
[    2.180457] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/ovl@14005000
[    2.180457] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/ovl@14005000
[    2.197282] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/ovl@14006000
[    2.197282] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/ovl@14006000
[    2.214053] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/rdma@14007000
[    2.214053] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/rdma@14007000
[    2.231068] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/color@14009000
[    2.231068] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/color@14009000
[    2.248202] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/dpi@1400a000
[    2.248202] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/dpi@1400a000
[    2.264969] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/ccorr@1400b000
[    2.264969] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/ccorr@1400b000
[    2.282081] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/aal@1400c000
[    2.282081] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/aal@1400c000
[    2.298835] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/gamma@1400d000
[    2.298835] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/gamma@1400d000
[    2.316023] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/dsi@14013000
[    2.316023] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/dsi@14013000
[    2.332803] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/rdma@1401f000
[    2.332803] mediatek-drm mediatek-drm.13.auto: Adding component match for /soc/rdma@1401f000
[    2.354280] mtk-cpufreq mtk-cpufreq: failed to initialize dvfs info for cpu0
[    2.354280] mtk-cpufreq mtk-cpufreq: failed to initialize dvfs info for cpu0
[    2.369271] mtk-cpufreq mtk-cpufreq: failed to initialize dvfs info for cpu0
[    2.369271] mtk-cpufreq mtk-cpufreq: failed to initialize dvfs info for cpu0
[    2.383546] i2c_hid_of 2-002c: supply vddl not found, using dummy regulator
[    2.383546] i2c_hid_of 2-002c: supply vddl not found, using dummy regulator
[    2.399009] cpufreq: cpufreq_online: CPU0: Running at unlisted initial frequency: 1999998 KHz, changing to: 2000000 KHz
[    2.399009] cpufreq: cpufreq_online: CPU0: Running at unlisted initial frequency: 1999998 KHz, changing to: 2000000 KHz
[    2.410006] cpu cpu0: EM: created perf domain
[    2.410006] cpu cpu0: EM: created perf domain
[    2.430067] cpufreq: cpufreq_online: CPU6: Running at unlisted initial frequency: 1084999 KHz, changing to: 1085000 KHz
[    2.430067] cpufreq: cpufreq_online: CPU6: Running at unlisted initial frequency: 1084999 KHz, changing to: 1085000 KHz
[    2.441051] cpu cpu6: EM: created perf domain
[    2.441051] cpu cpu6: EM: created perf domain
[    2.462596] input: wifi-wakeup as /devices/platform/wifi-wakeup/input/input2
[    2.462596] input: wifi-wakeup as /devices/platform/wifi-wakeup/input/input2
[    2.470258] clk: Disabling unused clocks
[    2.470258] clk: Disabling unused clocks
[    2.478200] pp3300_vcn33_x: Bringing 3500000uV into 3300000-3300000uV
[    2.478200] pp3300_vcn33_x: Bringing 3500000uV into 3300000-3300000uV
[    2.478982] pp2760_vsim2_x: Bringing 1860000uV into 2700000-2700000uV
[    2.478982] pp2760_vsim2_x: Bringing 1860000uV into 2700000-2700000uV
[    2.481209] PM: genpd: Disabling unused power domains
[    2.481219] ALSA device list:
[    2.481225]   No soundcards found.
[    2.487725] elan_i2c 2-0015: Elan Touchpad: Module ID: 0x010a, Firmware: 0x0002, Sample: 0x0002, IAP: 0x0002
[    2.488157] input: Elan Touchpad as /devices/platform/soc/11009000.i2c/i2c-2/2-0015/input/input3
[    2.481209] PM: genpd: Disabling unused power domains
[    2.510471] mtu3 11201000.usb: supply vusb33 not found, using dummy regulator
[    2.481219] ALSA device list:
[    2.481225]   No soundcards found.
[    2.521952] mtk-power-controller 10006000.syscon:power-controller: Failed to create device link (0x180) with mt6358-regulator
[    2.531694] mtu3 11201000.usb: dr_mode: 3, drd: auto
[    2.487725] elan_i2c 2-0015: Elan Touchpad: Module ID: 0x010a, Firmware: 0x0002, Sample: 0x0002, IAP: 0x0002
[    2.540700] mtk-power-controller 10006000.syscon:power-controller: Failed to create device link (0x180) with mt6358-regulator
[    2.488157] input: Elan Touchpad as /devices/platform/soc/11009000.i2c/i2c-2/2-0015/input/input3
[    2.545503] mtu3 11201000.usb: u2p_dis_msk: 0, u3p_dis_msk: 0
[    2.545603] mtu3 11201000.usb: usb3-drd: 0
[    2.510471] mtu3 11201000.usb: supply vusb33 not found, using dummy regulator
[    2.521952] mtk-power-controller 10006000.syscon:power-controller: Failed to create device link (0x180) with mt6358-regulator
[    2.531694] mtu3 11201000.usb: dr_mode: 3, drd: auto
[    2.540700] mtk-power-controller 10006000.syscon:power-controller: Failed to create device link (0x180) with mt6358-regulator
[    2.545503] mtu3 11201000.usb: u2p_dis_msk: 0, u3p_dis_msk: 0
[    2.545603] mtu3 11201000.usb: usb3-drd: 0
[    2.659893] mtu3 11201000.usb: irq 270
[    2.659893] mtu3 11201000.usb: irq 270
[    2.667418] mtu3 11201000.usb: IP version 0x1006(U2 IP)
[    2.667418] mtu3 11201000.usb: IP version 0x1006(U2 IP)
[    2.677878] mtu3 11201000.usb: max_speed: high-speed
[    2.677878] mtu3 11201000.usb: max_speed: high-speed
[    2.687814] mtu3 11201000.usb: fifosz/epnum: Tx=0x2000/8, Rx=0x2000/8
[    2.687814] mtu3 11201000.usb: fifosz/epnum: Tx=0x2000/8, Rx=0x2000/8
[    2.700713] mtu3 11201000.usb: dma mask: 36 bits
[    2.700713] mtu3 11201000.usb: dma mask: 36 bits
[    2.711008] xhci-mtk 11200000.usb: supply vusb33 not found, using dummy regulator
[    2.711008] xhci-mtk 11200000.usb: supply vusb33 not found, using dummy regulator
[    2.726118] xhci-mtk 11200000.usb: uwk - reg:0x420, version:2
[    2.726118] xhci-mtk 11200000.usb: uwk - reg:0x420, version:2
[    2.737957] xhci-mtk 11200000.usb: xHCI Host Controller
[    2.737957] xhci-mtk 11200000.usb: xHCI Host Controller
[    2.748422] xhci-mtk 11200000.usb: new USB bus registered, assigned bus number 1
[    2.748422] xhci-mtk 11200000.usb: new USB bus registered, assigned bus number 1
[    2.763266] xhci-mtk 11200000.usb: USB3 root hub has no ports
[    2.763266] xhci-mtk 11200000.usb: USB3 root hub has no ports
[    2.774758] xhci-mtk 11200000.usb: hcc params 0x01400f99 hci version 0x110 quirks 0x0000000000200010
[    2.774758] xhci-mtk 11200000.usb: hcc params 0x01400f99 hci version 0x110 quirks 0x0000000000200010
[    2.793052] xhci-mtk 11200000.usb: irq 271, io mem 0x11200000
[    2.793052] xhci-mtk 11200000.usb: irq 271, io mem 0x11200000
[    2.805266] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.10
[    2.805266] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.10
[    2.821836] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.821836] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    2.836286] usb usb1: Product: xHCI Host Controller
[    2.836286] usb usb1: Product: xHCI Host Controller
[    2.846036] usb usb1: Manufacturer: Linux 6.10.0-rc4-next-20240620+ xhci-hcd
[    2.846036] usb usb1: Manufacturer: Linux 6.10.0-rc4-next-20240620+ xhci-hcd
[    2.860134] usb usb1: SerialNumber: 11200000.usb
[    2.860134] usb usb1: SerialNumber: 11200000.usb
[    2.870081] hub 1-0:1.0: USB hub found
[    2.870081] hub 1-0:1.0: USB hub found
[    2.877829] hub 1-0:1.0: 1 port detected
[    2.877829] hub 1-0:1.0: 1 port detected
[    2.886660] mtu3 11201000.usb: xHCI platform device register success...
[    2.886660] mtu3 11201000.usb: xHCI platform device register success...
[    2.900404] mtu3 11281000.usb: supply vusb33 not found, using dummy regulator
[    2.900404] mtu3 11281000.usb: supply vusb33 not found, using dummy regulator
[    2.914908] mtu3 11281000.usb: dr_mode: 3, drd: auto
[    2.914908] mtu3 11281000.usb: dr_mode: 3, drd: auto
[    2.924838] mtu3 11281000.usb: u2p_dis_msk: 0, u3p_dis_msk: 0
[    2.924838] mtu3 11281000.usb: u2p_dis_msk: 0, u3p_dis_msk: 0
[    2.936429] mtu3 11281000.usb: usb3-drd: 1
[    2.936429] mtu3 11281000.usb: usb3-drd: 1
[    2.944678] mtu3 11281000.usb: irq 272
[    2.944678] mtu3 11281000.usb: irq 272
[    2.952185] mtu3 11281000.usb: IP version 0x1006(U3 IP)
[    2.952185] mtu3 11281000.usb: IP version 0x1006(U3 IP)
[    2.962632] mtu3 11281000.usb: max_speed: super-speed-plus
[    2.962632] mtu3 11281000.usb: max_speed: super-speed-plus
[    2.973603] mtu3 11281000.usb: fifosz/epnum: Tx=0x4000/8, Rx=0x4000/8
[    2.973603] mtu3 11281000.usb: fifosz/epnum: Tx=0x4000/8, Rx=0x4000/8
[    2.986493] mtu3 11281000.usb: dma mask: 36 bits
[    2.986493] mtu3 11281000.usb: dma mask: 36 bits
[    2.996953] xhci-mtk 11280000.usb: supply vusb33 not found, using dummy regulator
[    2.996953] xhci-mtk 11280000.usb: supply vusb33 not found, using dummy regulator
[    3.012073] xhci-mtk 11280000.usb: uwk - reg:0x424, version:2
[    3.012073] xhci-mtk 11280000.usb: uwk - reg:0x424, version:2
[    3.024007] xhci-mtk 11280000.usb: xHCI Host Controller
[    3.024007] xhci-mtk 11280000.usb: xHCI Host Controller
[    3.034480] xhci-mtk 11280000.usb: new USB bus registered, assigned bus number 2
[    3.034480] xhci-mtk 11280000.usb: new USB bus registered, assigned bus number 2
[    3.050768] xhci-mtk 11280000.usb: hcc params 0x01400f99 hci version 0x110 quirks 0x0000000000200010
[    3.050768] xhci-mtk 11280000.usb: hcc params 0x01400f99 hci version 0x110 quirks 0x0000000000200010
[    3.069066] xhci-mtk 11280000.usb: irq 273, io mem 0x11280000
[    3.069066] xhci-mtk 11280000.usb: irq 273, io mem 0x11280000
[    3.080599] xhci-mtk 11280000.usb: xHCI Host Controller
[    3.080599] xhci-mtk 11280000.usb: xHCI Host Controller
[    3.091049] xhci-mtk 11280000.usb: new USB bus registered, assigned bus number 3
[    3.091049] xhci-mtk 11280000.usb: new USB bus registered, assigned bus number 3
[    3.105844] xhci-mtk 11280000.usb: Host supports USB 3.2 Enhanced SuperSpeed
[    3.105844] xhci-mtk 11280000.usb: Host supports USB 3.2 Enhanced SuperSpeed
[    3.120398] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.10
[    3.120398] usb usb2: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.10
[    3.137065] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.137065] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.151521] usb usb2: Product: xHCI Host Controller
[    3.151521] usb usb2: Product: xHCI Host Controller
[    3.161271] usb usb2: Manufacturer: Linux 6.10.0-rc4-next-20240620+ xhci-hcd
[    3.161271] usb usb2: Manufacturer: Linux 6.10.0-rc4-next-20240620+ xhci-hcd
[    3.173070] Freeing initrd memory: 14816K
[    3.175389] usb usb2: SerialNumber: 11280000.usb
[    3.173070] Freeing initrd memory: 14816K
[    3.175389] usb usb2: SerialNumber: 11280000.usb
[    3.192690] remoteproc remoteproc0: Direct firmware load for mediatek/mt8186/scp.img failed with error -2
[    3.192690] remoteproc remoteproc0: Direct firmware load for mediatek/mt8186/scp.img failed with error -2
[    3.202858] hub 2-0:1.0: USB hub found
[    3.211869] LoadPin: firmware old-api-pinning-ignored obj=<unknown> pid=102 cmdline=""
[    3.215762] hub 2-0:1.0: 1 port detected
[    3.223529] remoteproc remoteproc0: powering up scp
[    3.223563] remoteproc remoteproc0: Direct firmware load for mediatek/mt8186/scp.img failed with error -2
[    3.224106] Freeing unused kernel memory: 2624K
[    3.224196] Run /init as init process
[Loading, please wait...
    3.202858] hub 2-0:1.0: USB hub found
[    3.211869] LoadPin: firmware old-api-pinning-ignored obj=<unknown> pid=102 cmdline=""
[    3.215762] hub 2-0:1.0: 1 port detected
[    3.223529] remoteproc remoteproc0: powering up scp
[    3.223563] remoteproc remoteproc0: Direct firmware load for mediatek/mt8186/scp.img failed with error -2
[    3.224106] Freeing unused kernel memory: 2624K
[    3.224196] Run /init as init process
[    3.227966] usb usb3: We don't know the algorithms for LPM for this host, disabling LPM.
[    3.232341] LoadPin: firmware old-api-pinning-ignored obj=<unknown> pid=102 cmdline=""
[    3.242398] usb usb3: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.10
[    3.246435] remoteproc remoteproc0: request_firmware failed: -2
[    3.250074] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.250077] usb usb3: Product: xHCI Host Controller
Starting systemd[    3.250079] usb usb3: Manufacturer: Linux 6.10.0-rc4-next-20240620+ xhci-hcd
-udevd version 2[    3.282444] usb 1-1: new high-speed USB device number 2 using xhci-mtk
[    3.286925] usb usb3: SerialNumber: 11280000.usb
[56.2-1
    3.227966] usb usb3: We don't know the algorithms for LPM for this host, disabling LPM.
[    3.287375] hub 3-0:1.0: USB hub found
[    3.232341] LoadPin: firmware old-api-pinning-ignored obj=<unknown> pid=102 cmdline=""
[    3.242398] usb usb3: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.10
[    3.246435] remoteproc remoteproc0: request_firmware failed: -2
[    3.250074] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.250077] usb usb3: Product: xHCI Host Controller
[    3.250079] usb usb3: Manufacturer: Linux 6.10.0-rc4-next-20240620+ xhci-hcd
[    3.282444] usb 1-1: new high-speed USB device number 2 using xhci-mtk
[    3.286925] usb usb3: SerialNumber: 11280000.usb
[    3.287375] hub 3-0:1.0: USB hub found
[    3.422831] hub 3-0:1.0: 1 port detected
[    3.422831] hub 3-0:1.0: 1 port detected
[    3.428765] usb 1-1: New USB device found, idVendor=30c9, idProduct=0093, bcdDevice= 0.09
[    3.431320] mtu3 11281000.usb: xHCI platform device register success...
[    3.438886] usb 1-1: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[    3.438891] usb 1-1: Product: Integrated Camera
[    3.428765] usb 1-1: New USB device found, idVendor=30c9, idProduct=0093, bcdDevice= 0.09
[    3.438895] usb 1-1: Manufacturer: Lenovo
[    3.431320] mtu3 11281000.usb: xHCI platform device register success...
[    3.438886] usb 1-1: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[    3.452629] usb 1-1: SerialNumber: 8SSC21J75356V1SR34D04F6
[    3.438891] usb 1-1: Product: Integrated Camera
[    3.438895] usb 1-1: Manufacturer: Lenovo
[    3.452629] usb 1-1: SerialNumber: 8SSC21J75356V1SR34D04F6
[    3.509460] mtk-msdc 11240000.mmc: allocated mmc-pwrseq
[    3.510120] mmc0: CQHCI version 5.10
[    3.509460] mtk-msdc 11240000.mmc: allocated mmc-pwrseq
[    3.518988] mt6358-sound mt6358-sound: mt6358_platform_driver_probe(), dev name mt6358-sound
[    3.510120] mmc0: CQHCI version 5.10
[    3.518988] mt6358-sound mt6358-sound: mt6358_platform_driver_probe(), dev name mt6358-sound
[    3.533140] mtk-iommu 14016000.iommu: bound 14003000.smi (ops mtk_smi_larb_component_ops)
[    3.533151] mtk-iommu 14016000.iommu: bound 14004000.smi (ops mtk_smi_larb_component_ops)
[    3.533155] mtk-iommu 14016000.iommu: bound 1b002000.smi (ops mtk_smi_larb_component_ops)
[    3.533159] mtk-iommu 14016000.iommu: bound 1602e000.smi (ops mtk_smi_larb_component_ops)
[    3.533163] mtk-iommu 14016000.iommu: bound 17010000.smi (ops mtk_smi_larb_component_ops)
[    3.533167] mtk-iommu 14016000.iommu: bound 14023000.smi (ops mtk_smi_larb_component_ops)
[    3.533171] mtk-iommu 14016000.iommu: bound 1502e000.smi (ops mtk_smi_larb_component_ops)
[    3.533175] mtk-iommu 14016000.iommu: bound 1582e000.smi (ops mtk_smi_larb_component_ops)
[    3.533179] mtk-iommu 14016000.iommu: bound 1a001000.smi (ops mtk_smi_larb_component_ops)
[    3.533183] mtk-iommu 14016000.iommu: bound 1a002000.smi (ops mtk_smi_larb_component_ops)
[    3.533186] mtk-iommu 14016000.iommu: bound 1a00f000.smi (ops mtk_smi_larb_component_ops)
[    3.533140] mtk-iommu 14016000.iommu: bound 14003000.smi (ops mtk_smi_larb_component_ops)
[    3.533190] mtk-iommu 14016000.iommu: bound 1a010000.smi (ops mtk_smi_larb_component_ops)
[    3.533151] mtk-iommu 14016000.iommu: bound 14004000.smi (ops mtk_smi_larb_component_ops)
[    3.533194] mtk-iommu 14016000.iommu: bound 1c10f000.smi (ops mtk_smi_larb_component_ops)
[    3.533198] mtk-iommu 14016000.iommu: bound 1c00f000.smi (ops mtk_smi_larb_component_ops)
[    3.533422] mediatek-disp-ovl 14005000.ovl: Adding to iommu group 0
[    3.533912] mediatek-disp-ovl 14006000.ovl: Adding to iommu group 0
[    3.533155] mtk-iommu 14016000.iommu: bound 1b002000.smi (ops mtk_smi_larb_component_ops)
[    3.534567] mediatek-disp-rdma 14007000.rdma: Adding to iommu group 0
[    3.533159] mtk-iommu 14016000.iommu: bound 1602e000.smi (ops mtk_smi_larb_component_ops)
[    3.534948] mediatek-disp-rdma 1401f000.rdma: Adding to iommu group 0
[    3.535266] panfrost 13040000.gpu: clock rate = 249999863
[    3.533163] mtk-iommu 14016000.iommu: bound 17010000.smi (ops mtk_smi_larb_component_ops)
[    3.536548] panfrost 13040000.gpu: [drm:panfrost_devfreq_init] Failed to register cooling device
[    3.533167] mtk-iommu 14016000.iommu: bound 14023000.smi (ops mtk_smi_larb_component_ops)
[    3.552980] panfrost 13040000.gpu: mali-g52 id 0x7402 major 0x1 minor 0x0 status 0x0
[    3.533171] mtk-iommu 14016000.iommu: bound 1502e000.smi (ops mtk_smi_larb_component_ops)
[    3.533175] mtk-iommu 14016000.iommu: bound 1582e000.smi (ops mtk_smi_larb_component_ops)
[    3.568628] panfrost 13040000.gpu: features: 00000000,00000cf7, issues: 00000000,00000400
[    3.533179] mtk-iommu 14016000.iommu: bound 1a001000.smi (ops mtk_smi_larb_component_ops)
[    3.533183] mtk-iommu 14016000.iommu: bound 1a002000.smi (ops mtk_smi_larb_component_ops)
[    3.584962] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00000002 Tiler:0x00000209 Mem:0x1 MMU:0x00002823 AS:0xff JS:0x7
[    3.533186] mtk-iommu 14016000.iommu: bound 1a00f000.smi (ops mtk_smi_larb_component_ops)
[    3.613761] mtk-msdc 11230000.mmc: Final PAD_DS_TUNE: 0x12814
[    3.533190] mtk-iommu 14016000.iommu: bound 1a010000.smi (ops mtk_smi_larb_component_ops)
[    3.617696] panfrost 13040000.gpu: shader_present=0x3 l2_present=0x1
[    3.654048] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=52 arg=00000C00; host->error=0x00000002
[    3.658950] mmc0: Command Queue Engine enabled
[    3.659383] [drm] Initialized panfrost 1.2.0 for 13040000.gpu on minor 0
[    3.533194] mtk-iommu 14016000.iommu: bound 1c10f000.smi (ops mtk_smi_larb_component_ops)
[    3.533198] mtk-iommu 14016000.iommu: bound 1c00f000.smi (ops mtk_smi_larb_component_ops)
[    3.533422] mediatek-disp-ovl 14005000.ovl: Adding to iommu group 0
[    3.667376] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=52 arg=80000C08; host->error=0x00000002
[    3.533912] mediatek-disp-ovl 14006000.ovl: Adding to iommu group 0
[    3.674926] mmc0: new HS400 MMC card at address 0001
[    3.534567] mediatek-disp-rdma 14007000.rdma: Adding to iommu group 0
[    3.678798] usb 2-1: new high-speed USB device number 2 using xhci-mtk
[    3.534948] mediatek-disp-rdma 1401f000.rdma: Adding to iommu group 0
[    3.706121] mmc1: new ultra high speed SDR104 SDIO card at address 0001
[    3.535266] panfrost 13040000.gpu: clock rate = 249999863
[    3.710871] mmcblk0: mmc0:0001 DV4064 58.2 GiB
[    3.536548] panfrost 13040000.gpu: [drm:panfrost_devfreq_init] Failed to register cooling device
[    3.727478]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12
[    3.813718] panel-simple-dp-aux aux-0-0058: Detected BOE NT140FHM-N45 (0x09ae)
[    3.835339] mmcblk0boot0: mmc0:0001 DV4064 4.00 MiB
[    3.552980] panfrost 13040000.gpu: mali-g52 id 0x7402 major 0x1 minor 0x0 status 0x0
[    3.837247] mediatek-drm mediatek-drm.13.auto: bound 14005000.ovl (ops mtk_disp_ovl_component_ops)
[    3.846458] mmcblk0boot1: mmc0:0001 DV4064 4.00 MiB
[    3.850245] mediatek-drm mediatek-drm.13.auto: bound 14006000.ovl (ops mtk_disp_ovl_component_ops)
[    3.857505] mmcblk0rpmb: mmc0:0001 DV4064 16.0 MiB, chardev (236:0)
[    3.865082] usb 2-1: New USB device found, idVendor=0bda, idProduct=5411, bcdDevice= 1.16
[    3.865107] mediatek-drm mediatek-drm.13.auto: bound 14007000.rdma (ops mtk_disp_rdma_component_ops)
[    3.865117] mediatek-drm mediatek-drm.13.auto: bound 14009000.color (ops mtk_disp_color_component_ops)
[    3.865141] [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc/dpi@1400a000 to encoder TMDS-32: -517
[    3.865199] [drm:mtk_dsi_host_attach] *ERROR* failed to add dsi_host component: -517
[    3.865206] anx7625 0-0058: [drm:anx7625_link_bridge] *ERROR* fail to attach dsi to host.
[    3.865214] panel-simple-dp-aux aux-0-0058: DP AUX done_probing() can't defer
[    3.568628] panfrost 13040000.gpu: features: 00000000,00000cf7, issues: 00000000,00000400
[    3.865217] panel-simple-dp-aux aux-0-0058: Skipping disable of already disabled panel
[    3.865218] panel-simple-dp-aux aux-0-0058: Skipping unprepare of already unprepared panel
[    3.584962] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00000002 Tiler:0x00000209 Mem:0x1 MMU:0x00002823 AS:0xff JS:0x7
[    3.865234] panel-simple-dp-aux aux-0-0058: probe with driver panel-simple-dp-aux failed with error -22
[    3.613761] mtk-msdc 11230000.mmc: Final PAD_DS_TUNE: 0x12814
[    3.865657] it6505 3-005c: Didn't register Type-C switches, err: 0
[    3.617696] panfrost 13040000.gpu: shader_present=0x3 l2_present=0x1
[    3.654048] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=52 arg=00000C00; host->error=0x00000002
[    3.658950] mmc0: Command Queue Engine enabled
[    3.865811] it6505 3-005c: error endpoint, use default
[    3.659383] [drm] Initialized panfrost 1.2.0 for 13040000.gpu on minor 0
[    3.866612] mtk-jpeg 17030000.jpeg-encoder: Adding to iommu group 1
[    3.866944] mtk-jpeg 17030000.jpeg-encoder: mtk-jpeg-enc device registered as /dev/video0 (81,0)
[    3.867828] mtk-vcodec-enc 17020000.video-encoder: Adding to iommu group 1
[    3.869473] mtk-vcodec-dec 16000000.video-decoder: Adding to iommu group 1
[    3.667376] mtk-msdc 11240000.mmc: msdc_track_cmd_data: cmd=52 arg=80000C08; host->error=0x00000002
[    3.870168] mtk-vdec-comp 16025000.video-codec: Adding to iommu group 1
[    3.674926] mmc0: new HS400 MMC card at address 0001
[    3.943719] usb 3-1: new SuperSpeed USB device number 2 using xhci-mtk
[    3.678798] usb 2-1: new high-speed USB device number 2 using xhci-mtk
[    3.944547] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    3.706121] mmc1: new ultra high speed SDR104 SDIO card at address 0001
[    3.974382] usb 3-1: New USB device found, idVendor=0bda, idProduct=0411, bcdDevice= 1.16
[    3.710871] mmcblk0: mmc0:0001 DV4064 58.2 GiB
[    3.979000] usb 2-1: Product: USB2.1 Hub
[    3.983868] usb 3-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    3.727478]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12
[    3.992829] usb 2-1: Manufacturer: Generic
[    3.813718] panel-simple-dp-aux aux-0-0058: Detected BOE NT140FHM-N45 (0x09ae)
[    3.999091] usb 3-1: Product: USB3.2 Hub
[    3.835339] mmcblk0boot0: mmc0:0001 DV4064 4.00 MiB
[    4.008335] hub 2-1:1.0: USB hub found
[    3.837247] mediatek-drm mediatek-drm.13.auto: bound 14005000.ovl (ops mtk_disp_ovl_component_ops)
[    4.016393] usb 3-1: Manufacturer: Generic
[    3.846458] mmcblk0boot1: mmc0:0001 DV4064 4.00 MiB
[    4.026797] hub 2-1:1.0: 3 ports detected
[    3.850245] mediatek-drm mediatek-drm.13.auto: bound 14006000.ovl (ops mtk_disp_ovl_component_ops)
[    4.037432] hub 3-1:1.0: USB hub found
[    3.857505] mmcblk0rpmb: mmc0:0001 DV4064 16.0 MiB, chardev (236:0)
[    3.865082] usb 2-1: New USB device found, idVendor=0bda, idProduct=5411, bcdDevice= 1.16
[    3.865107] mediatek-drm mediatek-drm.13.auto: bound 14007000.rdma (ops mtk_disp_rdma_component_ops)
[    3.865117] mediatek-drm mediatek-drm.13.auto: bound 14009000.color (ops mtk_disp_color_component_ops)
[    3.865141] [drm:drm_bridge_attach] *ERROR* failed to attach bridge /soc/dpi@1400a000 to encoder TMDS-32: -517
[    3.865199] [drm:mtk_dsi_host_attach] *ERROR* failed to add dsi_host component: -517
[    3.865206] anx7625 0-0058: [drm:anx7625_link_bridge] *ERROR* fail to attach dsi to host.
[    3.865214] panel-simple-dp-aux aux-0-0058: DP AUX done_probing() can't defer
[    3.865217] panel-simple-dp-aux aux-0-0058: Skipping disable of already disabled panel
[    3.865218] panel-simple-dp-aux aux-0-0058: Skipping unprepare of already unprepared panel
[    3.865234] panel-simple-dp-aux aux-0-0058: probe with driver panel-simple-dp-aux failed with error -22
[    3.865657] it6505 3-005c: Didn't register Type-C switches, err: 0
[    3.865811] it6505 3-005c: error endpoint, use default
[    3.866612] mtk-jpeg 17030000.jpeg-encoder: Adding to iommu group 1
[    3.866944] mtk-jpeg 17030000.jpeg-encoder: mtk-jpeg-enc device registered as /dev/video0 (81,0)
[    3.867828] mtk-vcodec-enc 17020000.video-encoder: Adding to iommu group 1
[    3.869473] mtk-vcodec-dec 16000000.video-decoder: Adding to iommu group 1
[    3.870168] mtk-vdec-comp 16025000.video-codec: Adding to iommu group 1
[    3.943719] usb 3-1: new SuperSpeed USB device number 2 using xhci-mtk
[    3.944547] usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    3.974382] usb 3-1: New USB device found, idVendor=0bda, idProduct=0411, bcdDevice= 1.16
[    3.979000] usb 2-1: Product: USB2.1 Hub
[    3.983868] usb 3-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    3.992829] usb 2-1: Manufacturer: Generic
[    3.999091] usb 3-1: Product: USB3.2 Hub
[    4.008335] hub 2-1:1.0: USB hub found
[    4.016393] usb 3-1: Manufacturer: Generic
[    4.026797] hub 2-1:1.0: 3 ports detected
[    4.037432] hub 3-1:1.0: USB hub found
[    4.509607] hub 3-1:1.0: 3 ports detected
[    4.509607] hub 3-1:1.0: 3 ports detected
Begin: Loading essential drivers ... done.
Begin: Running /scripts/init-premount ... [    4.802389] usb 3-1.3: new SuperSpeed USB device number 3 using xhci-mtk
[    4.802389] usb 3-1.3: new SuperSpeed USB device number 3 using xhci-mtk
[    4.852604] usb 3-1.3: New USB device found, idVendor=0bda, idProduct=0316, bcdDevice= 5.02
[    4.852604] usb 3-1.3: New USB device found, idVendor=0bda, idProduct=0316, bcdDevice= 5.02
[    4.869546] usb 3-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    4.869546] usb 3-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    4.884340] usb 3-1.3: Product: USB3.1 Card Reader
[    4.884340] usb 3-1.3: Product: USB3.1 Card Reader
[    4.893999] usb 3-1.3: Manufacturer: Realtek
[    4.893999] usb 3-1.3: Manufacturer: Realtek
[    4.902589] usb 3-1.3: SerialNumber: 201806010000
[    4.902589] usb 3-1.3: SerialNumber: 201806010000
[    4.918334] usb-storage 3-1.3:1.0: USB Mass Storage device detected
[    4.918334] usb-storage 3-1.3:1.0: USB Mass Storage device detected
[    4.932018] scsi host0: usb-storage 3-1.3:1.0
[    4.932018] scsi host0: usb-storage 3-1.3:1.0
[    5.953285] scsi 0:0:0:0: Direct-Access     Generic- SD/MMC CRW       1.00 PQ: 0 ANSI: 6
[    5.953285] scsi 0:0:0:0: Direct-Access     Generic- SD/MMC CRW       1.00 PQ: 0 ANSI: 6
[    6.501134] sd 0:0:0:0: [sda] 249737216 512-byte logical blocks: (128 GB/119 GiB)
[    6.501134] sd 0:0:0:0: [sda] 249737216 512-byte logical blocks: (128 GB/119 GiB)
[    6.517421] sd 0:0:0:0: [sda] Write Protect is off
[    6.517421] sd 0:0:0:0: [sda] Write Protect is off
[    6.527825] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    6.527825] sd 0:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support DPO or FUA
[    6.575594]  sda: sda1 sda2 sda3 sda4 sda5 sda6
[    6.575594]  sda: sda1 sda2 sda3 sda4 sda5 sda6
[    6.587584] sd 0:0:0:0: [sda] Attached SCSI removable disk
[    6.587584] sd 0:0:0:0: [sda] Attached SCSI removable disk
[    7.380497] EXT4-fs (sda2): orphan cleanup on readonly fs
[    7.380497] EXT4-fs (sda2): orphan cleanup on readonly fs
[    7.394716] EXT4-fs (sda2): mounted filesystem 1be06062-b9dc-47f7-85b6-38c866b70df3 ro with ordered data mode. Quota mode: none.
[    7.394716] EXT4-fs (sda2): mounted filesystem 1be06062-b9dc-47f7-85b6-38c866b70df3 ro with ordered data mode. Quota mode: none.
[    8.174877] LoadPin: sda2 (8:2): writable
[    8.174877] LoadPin: sda2 (8:2): writable
[    8.183112] LoadPin: kernel-module pinned obj="/usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net/ipv6/ipv6.ko" pid=1 cmdline="/sbin/init cros_secure splash"
[    8.183112] LoadPin: kernel-module pinned obj="/usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net/ipv6/ipv6.ko" pid=1 cmdline="/sbin/init cros_secure splash"
[    8.253084] IPv6: Loaded, but administratively disabled, reboot required to enable
[    8.253084] IPv6: Loaded, but administratively disabled, reboot required to enable
[    8.362367] systemd[1]: systemd 256.2-1 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +)
[    8.362367] systemd[1]: systemd 256.2-1 running in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL +BLKID +CURL +ELFUTILS +)
[    8.428136] systemd[1]: Detected architecture arm64.
[    8.428136] systemd[1]: Detected architecture arm64.
[    8.462167] systemd[1]: Hostname set to <DEBIAN-SD-ARM64>.
[    8.462167] systemd[1]: Hostname set to <DEBIAN-SD-ARM64>.
[    8.766162] systemd[1]: bpf-restrict-fs: BPF LSM hook not enabled in the kernel, BPF LSM not supported.
[    8.766162] systemd[1]: bpf-restrict-fs: BPF LSM hook not enabled in the kernel, BPF LSM not supported.
[   10.358524] systemd[1]: Queued start job for default target graphical.target.
[   10.358524] systemd[1]: Queued start job for default target graphical.target.
[   10.391439] systemd[1]: Created slice system-getty.slice - Slice /system/getty.
[   10.391439] systemd[1]: Created slice system-getty.slice - Slice /system/getty.
[   10.408443] systemd[1]: Created slice system-modprobe.slice - Slice /system/modprobe.
[   10.408443] systemd[1]: Created slice system-modprobe.slice - Slice /system/modprobe.
[   10.425575] systemd[1]: Created slice system-serial\x2dgetty.slice - Slice /system/serial-getty.
[   10.425575] systemd[1]: Created slice system-serial\x2dgetty.slice - Slice /system/serial-getty.
[   10.444628] systemd[1]: Created slice system-systemd\x2dfsck.slice - Slice /system/systemd-fsck.
[   10.444628] systemd[1]: Created slice system-systemd\x2dfsck.slice - Slice /system/systemd-fsck.
[   10.462872] systemd[1]: Created slice user.slice - User and Session Slice.
[   10.462872] systemd[1]: Created slice user.slice - User and Session Slice.
[   10.477004] systemd[1]: Started systemd-ask-password-wall.path - Forward Password Requests to Wall Directory Watch.
[   10.477004] systemd[1]: Started systemd-ask-password-wall.path - Forward Password Requests to Wall Directory Watch.
[   10.498495] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats File System Automount Point.
[   10.498495] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.automount - Arbitrary Executable File Formats File System Automount Point.
[   10.523699] systemd[1]: Expecting device dev-disk-by\x2duuid-71d24ac7\x2d4b56\x2d4a27\x2db74a\x2dfa7b2c82378a.device - /dev/disk/by-uuid/71d24ac7-4b56-4a27-b74a-fa7b2c823.
[   10.523699] systemd[1]: Expecting device dev-disk-by\x2duuid-71d24ac7\x2d4b56\x2d4a27\x2db74a\x2dfa7b2c82378a.device - /dev/disk/by-uuid/71d24ac7-4b56-4a27-b74a-fa7b2c823.
[   10.555298] systemd[1]: Expecting device dev-disk-by\x2duuid-D5D6\x2dD817.device - /dev/disk/by-uuid/D5D6-D817...
[   10.555298] systemd[1]: Expecting device dev-disk-by\x2duuid-D5D6\x2dD817.device - /dev/disk/by-uuid/D5D6-D817...
[   10.575894] systemd[1]: Expecting device dev-ttyAMA0.device - /dev/ttyAMA0...
[   10.575894] systemd[1]: Expecting device dev-ttyAMA0.device - /dev/ttyAMA0...
[   10.590236] systemd[1]: Expecting device dev-ttyS0.device - /dev/ttyS0...
[   10.590236] systemd[1]: Expecting device dev-ttyS0.device - /dev/ttyS0...
[   10.603895] systemd[1]: Reached target integritysetup.target - Local Integrity Protected Volumes.
[   10.603895] systemd[1]: Reached target integritysetup.target - Local Integrity Protected Volumes.
[   10.621733] systemd[1]: Reached target nss-user-lookup.target - User and Group Name Lookups.
[   10.621733] systemd[1]: Reached target nss-user-lookup.target - User and Group Name Lookups.
[   10.638675] systemd[1]: Reached target remote-fs.target - Remote File Systems.
[   10.638675] systemd[1]: Reached target remote-fs.target - Remote File Systems.
[   10.653180] systemd[1]: Reached target slices.target - Slice Units.
[   10.653180] systemd[1]: Reached target slices.target - Slice Units.
[   10.665809] systemd[1]: Reached target veritysetup.target - Local Verity Protected Volumes.
[   10.665809] systemd[1]: Reached target veritysetup.target - Local Verity Protected Volumes.
[   10.684733] systemd[1]: Listening on systemd-creds.socket - Credential Encryption/Decryption.
[   10.684733] systemd[1]: Listening on systemd-creds.socket - Credential Encryption/Decryption.
[   10.702034] systemd[1]: Listening on systemd-initctl.socket - initctl Compatibility Named Pipe.
[   10.702034] systemd[1]: Listening on systemd-initctl.socket - initctl Compatibility Named Pipe.
[   10.719657] systemd[1]: Listening on systemd-journald-dev-log.socket - Journal Socket (/dev/log).
[   10.719657] systemd[1]: Listening on systemd-journald-dev-log.socket - Journal Socket (/dev/log).
[   10.737658] systemd[1]: Listening on systemd-journald.socket - Journal Sockets.
[   10.737658] systemd[1]: Listening on systemd-journald.socket - Journal Sockets.
[   10.752414] systemd[1]: systemd-pcrextend.socket - TPM PCR Measurements was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[   10.752414] systemd[1]: systemd-pcrextend.socket - TPM PCR Measurements was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[   10.779966] systemd[1]: systemd-pcrlock.socket - Make TPM PCR Policy was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[   10.779966] systemd[1]: systemd-pcrlock.socket - Make TPM PCR Policy was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[   10.807106] systemd[1]: Listening on systemd-udevd-control.socket - udev Control Socket.
[   10.807106] systemd[1]: Listening on systemd-udevd-control.socket - udev Control Socket.
[   10.823489] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[   10.823489] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[   10.863255] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File System...
[   10.863255] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File System...
[   10.879750] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue File System...
[   10.879750] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queue File System...
[   10.897476] systemd[1]: Mounting run-lock.mount - Legacy Locks Directory /run/lock...
[   10.897476] systemd[1]: Mounting run-lock.mount - Legacy Locks Directory /run/lock...
[   10.914739] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug File System...
[   10.914739] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug File System...
[   10.932072] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace File System...
[   10.932072] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace File System...
[   10.950802] systemd[1]: Starting keyboard-setup.service - Set the console keyboard layout...
[   10.950802] systemd[1]: Starting keyboard-setup.service - Set the console keyboard layout...
[   10.969995] systemd[1]: Starting kmod-static-nodes.service - Create List of Static Device Nodes...
[   10.969995] systemd[1]: Starting kmod-static-nodes.service - Create List of Static Device Nodes...
[   10.989805] systemd[1]: Starting modprobe@configfs.service - Load Kernel Module configfs...
[   10.989805] systemd[1]: Starting modprobe@configfs.service - Load Kernel Module configfs...
[   11.008281] systemd[1]: Starting modprobe@drm.service - Load Kernel Module drm...
[   11.008281] systemd[1]: Starting modprobe@drm.service - Load Kernel Module drm...
[   11.025343] systemd[1]: Starting modprobe@efi_pstore.service - Load Kernel Module efi_pstore...
[   11.025343] systemd[1]: Starting modprobe@efi_pstore.service - Load Kernel Module efi_pstore...
[   11.044546] systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
[   11.044546] systemd[1]: Starting modprobe@fuse.service - Load Kernel Module fuse...
[   11.060972] systemd[1]: systemd-fsck-root.service - File System Check on Root Device was skipped because of an unmet condition check (ConditionPathExists=!/run/initramfs/.
[   11.060972] systemd[1]: systemd-fsck-root.service - File System Check on Root Device was skipped because of an unmet condition check (ConditionPathExists=!/run/initramfs/.
[   11.093455] systemd[1]: systemd-hibernate-clear.service - Clear Stale Hibernate Storage Info was skipped because of an unmet condition check (ConditionPathExists=/sys/fir.
[   11.094200] fuse: init (API version 7.40)
[   11.093455] systemd[1]: systemd-hibernate-clear.service - Clear Stale Hibernate Storage Info was skipped because of an unmet condition check (ConditionPathExists=/sys/fir.
[   11.094200] fuse: init (API version 7.40)
[   11.158564] systemd[1]: Starting systemd-journald.service - Journal Service...
[   11.158564] systemd[1]: Starting systemd-journald.service - Journal Service...
[   11.175683] systemd[1]: Starting systemd-modules-load.service - Load Kernel Modules...
[   11.175683] systemd[1]: Starting systemd-modules-load.service - Load Kernel Modules...
[   11.191788] systemd[1]: systemd-pcrmachine.service - TPM PCR Machine ID Measurement was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[   11.191788] systemd[1]: systemd-pcrmachine.service - TPM PCR Machine ID Measurement was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[   11.223119] systemd[1]: Starting systemd-remount-fs.service - Remount Root and Kernel File Systems...
[   11.223119] systemd[1]: Starting systemd-remount-fs.service - Remount Root and Kernel File Systems...
[   11.241884] systemd[1]: systemd-tpm2-setup-early.service - Early TPM SRK Setup was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[   11.241884] systemd[1]: systemd-tpm2-setup-early.service - Early TPM SRK Setup was skipped because of an unmet condition check (ConditionSecurity=measured-uki).
[   11.272347] systemd[1]: Starting systemd-udev-load-credentials.service - Load udev Rules from Credentials...
[   11.272347] systemd[1]: Starting systemd-udev-load-credentials.service - Load udev Rules from Credentials...
[   11.293710] systemd[1]: Starting systemd-udev-trigger.service - Coldplug All udev Devices...
[   11.293710] systemd[1]: Starting systemd-udev-trigger.service - Coldplug All udev Devices...
[   11.308550] systemd-journald[312]: Collecting audit messages is disabled.
[   11.312433] EXT4-fs (sda2): re-mounted 1be06062-b9dc-47f7-85b6-38c866b70df3 r/w. Quota mode: none.
[   11.308550] systemd-journald[312]: Collecting audit messages is disabled.
[   11.312433] EXT4-fs (sda2): re-mounted 1be06062-b9dc-47f7-85b6-38c866b70df3 r/w. Quota mode: none.
[   11.346181] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File System.
[   11.346181] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File System.
[   11.360891] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue File System.
[   11.360891] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue File System.
[   11.376561] systemd[1]: Started systemd-journald.service - Journal Service.
[   11.376561] systemd[1]: Started systemd-journald.service - Journal Service.
[   11.471011] systemd-journald[312]: Received client request to flush runtime journal.
[   11.471011] systemd-journald[312]: Received client request to flush runtime journal.

Debian GNU/Linux trixie/sid DEBIAN-SD-ARM64 ttyS0

DEBIAN-SD-ARM64 login: alpernebbi
Password:
Linux DEBIAN-SD-ARM64 6.10.0-rc4-next-20240620+ #3 SMP PREEMPT_DYNAMIC Fri Jul 26 23:26:02 KST 2024 aarch64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
You have new mail.

alpernebbi@DEBIAN-SD-ARM64 ~
$ sudo mount -t debugfs none /sys/kernel/debug
[sudo] password for alpernebbi:

alpernebbi@DEBIAN-SD-ARM64 ~
$ sudo cat /sys/kernel/debug/devices_deferred
sound   mt8186_mt6366: Cannot register card

alpernebbi@DEBIAN-SD-ARM64 ~
$ lsmod
Module                  Size  Used by
mt7921s                20480  0
mt76_sdio              28672  1 mt7921s
mt7921_common          73728  1 mt7921s
mt792x_lib             53248  2 mt7921s,mt7921_common
btmtksdio              28672  0
mt76_connac_lib        77824  3 mt792x_lib,mt7921s,mt7921_common
btmtk                  12288  1 btmtksdio
mt76                  114688  5 mt792x_lib,mt7921s,mt7921_common,mt76_sdio,mt76_connac_lib
bluetooth             811008  21 btmtk,btmtksdio
snd_sof_mt8186         24576  0
mtk_adsp_common        12288  1 snd_sof_mt8186
snd_sof_xtensa_dsp     12288  1 snd_sof_mt8186
uvcvideo              118784  0
mac80211             1003520  4 mt792x_lib,mt76,mt7921_common,mt76_connac_lib
snd_sof_of             12288  1 snd_sof_mt8186
ecdh_generic           16384  1 bluetooth
ecc                    36864  1 ecdh_generic
snd_sof               229376  3 snd_sof_mt8186,mtk_adsp_common,snd_sof_of
uvc                    12288  1 uvcvideo
cfg80211             1024000  4 mt76,mac80211,mt7921_common,mt76_connac_lib
videobuf2_vmalloc      16384  1 uvcvideo
rfkill                 40960  5 bluetooth,cfg80211
mt8186_mt6366          57344  0
snd_sof_utils          16384  1 snd_sof
snd_soc_rt5682s        90112  0
crct10dif_ce           12288  1
cros_usbpd_logger      16384  0
snd_soc_rt1015p        16384  0
fuse                  159744  3
ip_tables              32768  0
x_tables               57344  1 ip_tables
ipv6                  614400  0

alpernebbi@DEBIAN-SD-ARM64 ~
$ lsinitramfs /boot/initrd.img-6.10.0-rc4-next-20240620+
.
bin
conf
conf/arch.conf
conf/conf.d
conf/conf.d/resume
conf/initramfs.conf
etc
etc/default
etc/default/keyboard
etc/fonts
etc/fonts/conf.d
etc/fonts/conf.d/60-latin.conf
etc/fonts/fonts.conf
etc/fstab
etc/ld.so.cache
etc/ld.so.conf
etc/ld.so.conf.d
etc/ld.so.conf.d/aarch64-linux-gnu.conf
etc/ld.so.conf.d/fakeroot-aarch64-linux-gnu.conf
etc/ld.so.conf.d/libc.conf
etc/modprobe.d
etc/modprobe.d/ath9k_htc.conf
etc/modprobe.d/mtk.conf
etc/mtab
etc/nsswitch.conf
etc/os-release
etc/passwd
etc/plymouth
etc/plymouth/plymouthd.conf
etc/udev
etc/udev/udev.conf
init
lib
run
sbin
scripts
scripts/functions
scripts/init-bottom
scripts/init-bottom/ORDER
scripts/init-bottom/plymouth
scripts/init-bottom/udev
scripts/init-premount
scripts/init-premount/ORDER
scripts/init-premount/plymouth
scripts/init-top
scripts/init-top/ORDER
scripts/init-top/all_generic_ide
scripts/init-top/blacklist
scripts/init-top/keymap
scripts/init-top/udev
scripts/local
scripts/local-bottom
scripts/local-bottom/ORDER
scripts/local-bottom/ntfs_3g
scripts/local-premount
scripts/local-premount/ORDER
scripts/local-premount/ntfs_3g
scripts/local-premount/resume
scripts/nfs
scripts/panic
scripts/panic/ORDER
scripts/panic/plymouth
usr
usr/bin
usr/bin/fstype
usr/bin/ipconfig
usr/bin/kmod
usr/bin/minips
usr/bin/nfsmount
usr/bin/ntfs-3g
usr/bin/plymouth
usr/bin/udevadm
usr/lib
usr/lib/aarch64-linux-gnu
usr/lib/aarch64-linux-gnu/ld-linux-aarch64.so.1
usr/lib/aarch64-linux-gnu/libX11.so.6
usr/lib/aarch64-linux-gnu/libX11.so.6.4.0
usr/lib/aarch64-linux-gnu/libXau.so.6
usr/lib/aarch64-linux-gnu/libXau.so.6.0.0
usr/lib/aarch64-linux-gnu/libXdmcp.so.6
usr/lib/aarch64-linux-gnu/libXdmcp.so.6.0.0
usr/lib/aarch64-linux-gnu/libXext.so.6
usr/lib/aarch64-linux-gnu/libXext.so.6.4.0
usr/lib/aarch64-linux-gnu/libXrender.so.1
usr/lib/aarch64-linux-gnu/libXrender.so.1.3.0
usr/lib/aarch64-linux-gnu/libacl.so.1
usr/lib/aarch64-linux-gnu/libacl.so.1.1.2302
usr/lib/aarch64-linux-gnu/libblkid.so.1
usr/lib/aarch64-linux-gnu/libblkid.so.1.1.0
usr/lib/aarch64-linux-gnu/libbrotlicommon.so.1
usr/lib/aarch64-linux-gnu/libbrotlicommon.so.1.1.0
usr/lib/aarch64-linux-gnu/libbrotlidec.so.1
usr/lib/aarch64-linux-gnu/libbrotlidec.so.1.1.0
usr/lib/aarch64-linux-gnu/libbsd.so.0
usr/lib/aarch64-linux-gnu/libbsd.so.0.12.2
usr/lib/aarch64-linux-gnu/libbz2.so.1.0
usr/lib/aarch64-linux-gnu/libbz2.so.1.0.4
usr/lib/aarch64-linux-gnu/libc.so.6
usr/lib/aarch64-linux-gnu/libcairo.so.2
usr/lib/aarch64-linux-gnu/libcairo.so.2.11800.0
usr/lib/aarch64-linux-gnu/libcap.so.2
usr/lib/aarch64-linux-gnu/libcap.so.2.66
usr/lib/aarch64-linux-gnu/libcom_err.so.2
usr/lib/aarch64-linux-gnu/libcom_err.so.2.1
usr/lib/aarch64-linux-gnu/libcrypto.so.3
usr/lib/aarch64-linux-gnu/libdatrie.so.1
usr/lib/aarch64-linux-gnu/libdatrie.so.1.4.0
usr/lib/aarch64-linux-gnu/libdevmapper.so.1.02.1
usr/lib/aarch64-linux-gnu/libdrm.so.2
usr/lib/aarch64-linux-gnu/libdrm.so.2.4.0
usr/lib/aarch64-linux-gnu/libe2p.so.2
usr/lib/aarch64-linux-gnu/libe2p.so.2.3
usr/lib/aarch64-linux-gnu/libevdev.so.2
usr/lib/aarch64-linux-gnu/libevdev.so.2.3.0
usr/lib/aarch64-linux-gnu/libexpat.so.1
usr/lib/aarch64-linux-gnu/libexpat.so.1.9.2
usr/lib/aarch64-linux-gnu/libext2fs.so.2
usr/lib/aarch64-linux-gnu/libext2fs.so.2.4
usr/lib/aarch64-linux-gnu/libffi.so.8
usr/lib/aarch64-linux-gnu/libffi.so.8.1.4
usr/lib/aarch64-linux-gnu/libfontconfig.so.1
usr/lib/aarch64-linux-gnu/libfontconfig.so.1.12.1
usr/lib/aarch64-linux-gnu/libfreetype.so.6
usr/lib/aarch64-linux-gnu/libfreetype.so.6.20.1
usr/lib/aarch64-linux-gnu/libfribidi.so.0
usr/lib/aarch64-linux-gnu/libfribidi.so.0.4.0
usr/lib/aarch64-linux-gnu/libfuse3.so.3
usr/lib/aarch64-linux-gnu/libfuse3.so.3.14.0
usr/lib/aarch64-linux-gnu/libgio-2.0.so.0
usr/lib/aarch64-linux-gnu/libgio-2.0.so.0.8000.4
usr/lib/aarch64-linux-gnu/libglib-2.0.so.0
usr/lib/aarch64-linux-gnu/libglib-2.0.so.0.8000.4
usr/lib/aarch64-linux-gnu/libgmodule-2.0.so.0
usr/lib/aarch64-linux-gnu/libgmodule-2.0.so.0.8000.4
usr/lib/aarch64-linux-gnu/libgobject-2.0.so.0
usr/lib/aarch64-linux-gnu/libgobject-2.0.so.0.8000.4
usr/lib/aarch64-linux-gnu/libgraphite2.so.3
usr/lib/aarch64-linux-gnu/libgraphite2.so.3.2.1
usr/lib/aarch64-linux-gnu/libharfbuzz.so.0
usr/lib/aarch64-linux-gnu/libharfbuzz.so.0.60830.0
usr/lib/aarch64-linux-gnu/libkmod.so.2
usr/lib/aarch64-linux-gnu/libkmod.so.2.4.2
usr/lib/aarch64-linux-gnu/liblzma.so.5
usr/lib/aarch64-linux-gnu/liblzma.so.5.6.2
usr/lib/aarch64-linux-gnu/libm.so.6
usr/lib/aarch64-linux-gnu/libmd.so.0
usr/lib/aarch64-linux-gnu/libmd.so.0.1.0
usr/lib/aarch64-linux-gnu/libmount.so.1
usr/lib/aarch64-linux-gnu/libmount.so.1.1.0
usr/lib/aarch64-linux-gnu/libnss_files.so.2
usr/lib/aarch64-linux-gnu/libntfs-3g.so.89
usr/lib/aarch64-linux-gnu/libntfs-3g.so.89.0.0
usr/lib/aarch64-linux-gnu/libpango-1.0.so.0
usr/lib/aarch64-linux-gnu/libpango-1.0.so.0.5400.0
usr/lib/aarch64-linux-gnu/libpangocairo-1.0.so.0
usr/lib/aarch64-linux-gnu/libpangocairo-1.0.so.0.5400.0
usr/lib/aarch64-linux-gnu/libpangoft2-1.0.so.0
usr/lib/aarch64-linux-gnu/libpangoft2-1.0.so.0.5400.0
usr/lib/aarch64-linux-gnu/libpcre2-8.so.0
usr/lib/aarch64-linux-gnu/libpcre2-8.so.0.11.2
usr/lib/aarch64-linux-gnu/libpixman-1.so.0
usr/lib/aarch64-linux-gnu/libpixman-1.so.0.42.2
usr/lib/aarch64-linux-gnu/libply-splash-core.so.5
usr/lib/aarch64-linux-gnu/libply-splash-core.so.5.0.0
usr/lib/aarch64-linux-gnu/libply-splash-graphics.so.5
usr/lib/aarch64-linux-gnu/libply-splash-graphics.so.5.0.0
usr/lib/aarch64-linux-gnu/libply.so.5
usr/lib/aarch64-linux-gnu/libply.so.5.0.0
usr/lib/aarch64-linux-gnu/libpng16.so.16
usr/lib/aarch64-linux-gnu/libpng16.so.16.43.0
usr/lib/aarch64-linux-gnu/libresolv.so.2
usr/lib/aarch64-linux-gnu/libselinux.so.1
usr/lib/aarch64-linux-gnu/libthai.so.0
usr/lib/aarch64-linux-gnu/libthai.so.0.3.1
usr/lib/aarch64-linux-gnu/libudev.so.1
usr/lib/aarch64-linux-gnu/libudev.so.1.7.9
usr/lib/aarch64-linux-gnu/libuuid.so.1
usr/lib/aarch64-linux-gnu/libuuid.so.1.3.0
usr/lib/aarch64-linux-gnu/libxcb-render.so.0
usr/lib/aarch64-linux-gnu/libxcb-render.so.0.0.0
usr/lib/aarch64-linux-gnu/libxcb-shm.so.0
usr/lib/aarch64-linux-gnu/libxcb-shm.so.0.0.0
usr/lib/aarch64-linux-gnu/libxcb.so.1
usr/lib/aarch64-linux-gnu/libxcb.so.1.1.0
usr/lib/aarch64-linux-gnu/libxkbcommon.so.0
usr/lib/aarch64-linux-gnu/libxkbcommon.so.0.0.0
usr/lib/aarch64-linux-gnu/libz.so.1
usr/lib/aarch64-linux-gnu/libz.so.1.3.1
usr/lib/aarch64-linux-gnu/libzstd.so.1
usr/lib/aarch64-linux-gnu/libzstd.so.1.5.6
usr/lib/aarch64-linux-gnu/plymouth
usr/lib/aarch64-linux-gnu/plymouth/details.so
usr/lib/aarch64-linux-gnu/plymouth/label-pango.so
usr/lib/aarch64-linux-gnu/plymouth/renderers
usr/lib/aarch64-linux-gnu/plymouth/renderers/drm.so
usr/lib/aarch64-linux-gnu/plymouth/renderers/frame-buffer.so
usr/lib/aarch64-linux-gnu/plymouth/script.so
usr/lib/aarch64-linux-gnu/plymouth/text.so
usr/lib/firmware
usr/lib/firmware/lt9611uxc_fw.bin
usr/lib/firmware/mediatek
usr/lib/firmware/mediatek/mt7981_wo.bin
usr/lib/firmware/mediatek/mt7986_wo_0.bin
usr/lib/firmware/mediatek/mt7986_wo_1.bin
usr/lib/firmware/microchip
usr/lib/firmware/microchip/mscc_vsc8574_revb_int8051_29e8.bin
usr/lib/firmware/microchip/mscc_vsc8584_revb_int8051_fb48.bin
usr/lib/firmware/powervr
usr/lib/firmware/powervr/rogue_33.15.11.3_v1.fw
usr/lib/klibc-cvcxr0TOdnbc46UNBwjttYLN7ys.so
usr/lib/ld-linux-aarch64.so.1
usr/lib/modprobe.d
usr/lib/modprobe.d/aliases.conf
usr/lib/modprobe.d/fbdev-blacklist.conf
usr/lib/modprobe.d/systemd.conf
usr/lib/modules
usr/lib/modules/6.10.0-rc4-next-20240620+
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/arch
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/arch/arm64
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/arch/arm64/crypto
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/arch/arm64/crypto/chacha-neon.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/arch/arm64/crypto/poly1305-neon.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/arch/arm64/lib
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/arch/arm64/lib/xor-neon.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/crypto
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/crypto/blake2b_generic.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/crypto/crc32_generic.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/crypto/xor.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/block
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/block/loop.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/block/zram
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/block/zram/zram.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/cdrom
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/cdrom/cdrom.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/clk-bd718x7.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt6779-aud.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt6779-cam.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt6779-img.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt6779-ipe.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt6779-mfg.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt6779-mm.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt6779-vdec.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt6779-venc.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt6779.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt6795-apmixedsys.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt6795-infracfg.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt6795-mfg.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt6795-mm.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt6795-pericfg.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt6795-topckgen.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt6795-vdecsys.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt6795-vencsys.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt7981-eth.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt8188-cam.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt8188-ccu.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt8188-img.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt8188-ipe.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt8188-mfg.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt8188-vdec.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt8188-vdo0.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt8188-vdo1.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt8188-venc.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt8188-vpp0.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt8188-vpp1.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/clk/mediatek/clk-mt8188-wpe.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpio
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpio/gpio-altera.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpio/gpio-bd9571mwv.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/arm
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/arm/mali-dp.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/bridge
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/bridge/adv7511
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/bridge/adv7511/adv7511.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/bridge/lontium-lt8912b.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/bridge/lontium-lt9611.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/bridge/lontium-lt9611uxc.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/bridge/nwl-dsi.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/bridge/samsung-dsim.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/bridge/sii902x.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/bridge/thc63lvd1024.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/bridge/ti-sn65dsi86.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/drm_ttm_helper.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/drm_vram_helper.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/i2c
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/i2c/ch7006.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/i2c/sil164.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/i2c/tda998x.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/panel
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/panel/panel-lvds.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/panel/panel-raydium-rm67191.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/panel/panel-sitronix-st7703.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/panel/panel-truly-nt35597.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/pl111
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/pl111/pl111_drm.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/ttm
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/gpu/drm/ttm/ttm.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/hid
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/hid/hid-apple.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/hid/hid-cherry.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/hid/hid-chicony.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/hid/hid-lg-g15.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/hid/hid-logitech.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/hid/hid-microsoft.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/i2c
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/i2c/busses
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/i2c/busses/i2c-gpio.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/input
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/input/keyboard
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/input/keyboard/adc-keys.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/input/keyboard/mt6779-keypad.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/media
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/media/cec
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/media/cec/core
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/media/cec/core/cec.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/media/rc
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/media/rc/rc-core.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/mfd
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/mfd/wm8994.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/ipvlan
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/ipvlan/ipvlan.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/mdio
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/mdio.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/mdio/mdio-bcm-unimac.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/pcs
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/pcs/pcs-mtk-lynxi.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/pcs/pcs_xpcs.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/phy
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/phy/ax88796b.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/phy/bcm-phy-lib.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/phy/bcm54140.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/phy/bcm7xxx.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/phy/broadcom.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/phy/marvell.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/phy/marvell10g.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/phy/mediatek-ge-soc.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/phy/microchip.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/phy/smsc.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/tap.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/usb
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/usb/asix.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/usb/ax88179_178a.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/usb/cdc_ether.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/usb/cdc_ncm.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/usb/dm9601.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/usb/lan78xx.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/usb/mcs7830.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/usb/pegasus.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/usb/r8152.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/usb/r8153_ecm.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/usb/rndis_host.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/usb/rtl8150.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/usb/smsc75xx.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/usb/smsc95xx.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/usb/sr9800.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/usb/usbnet.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/vxlan
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/vxlan/vxlan.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/wireguard
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/net/wireguard/wireguard.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/nvme
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/nvme/host
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/nvme/host/nvme-core.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/nvme/host/nvme.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/pci
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/pci/controller
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/pci/controller/dwc
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/pci/controller/dwc/pci-meson.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/regulator
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/regulator/tps6287x-regulator.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/regulator/tps65132-regulator.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/regulator/vctrl-regulator.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/rtc
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/rtc/rtc-ds1307.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/rtc/rtc-hym8563.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/rtc/rtc-m41t80.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/rtc/rtc-pcf2127.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/rtc/rtc-pcf85363.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/rtc/rtc-rv3028.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/rtc/rtc-rv8803.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/rtc/rtc-rx8581.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/scsi
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/scsi/mpt3sas
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/scsi/mpt3sas/mpt3sas.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/scsi/raid_class.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/scsi/sr_mod.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/spi
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/spi/spi-dw-mmio.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/spi/spi-dw.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/usb
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/usb/host
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/usb/host/xhci-pci-renesas.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/usb/host/xhci-pci.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/usb/typec
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/usb/typec/tcpm
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/drivers/usb/typec/tcpm/fusb302.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/fs
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/fs/fuse
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/fs/fuse/fuse.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/lib
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/lib/crypto
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/lib/crypto/libchacha.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/lib/crypto/libchacha20poly1305.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/lib/crypto/libcurve25519-generic.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/lib/raid6
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/lib/raid6/raid6_pq.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/mm
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/mm/zsmalloc.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net/802
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net/802/stp.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net/bridge
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net/bridge/bridge.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net/dsa
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net/dsa/dsa_core.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net/ipv4
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net/ipv4/udp_tunnel.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net/ipv6
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net/ipv6/ip6_udp_tunnel.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net/ipv6/ipv6.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net/llc
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net/llc/llc.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net/psample
usr/lib/modules/6.10.0-rc4-next-20240620+/kernel/net/psample/psample.ko
usr/lib/modules/6.10.0-rc4-next-20240620+/modules.alias
usr/lib/modules/6.10.0-rc4-next-20240620+/modules.alias.bin
usr/lib/modules/6.10.0-rc4-next-20240620+/modules.builtin
usr/lib/modules/6.10.0-rc4-next-20240620+/modules.builtin.alias.bin
usr/lib/modules/6.10.0-rc4-next-20240620+/modules.builtin.bin
usr/lib/modules/6.10.0-rc4-next-20240620+/modules.builtin.modinfo
usr/lib/modules/6.10.0-rc4-next-20240620+/modules.dep
usr/lib/modules/6.10.0-rc4-next-20240620+/modules.dep.bin
usr/lib/modules/6.10.0-rc4-next-20240620+/modules.devname
usr/lib/modules/6.10.0-rc4-next-20240620+/modules.order
usr/lib/modules/6.10.0-rc4-next-20240620+/modules.softdep
usr/lib/modules/6.10.0-rc4-next-20240620+/modules.symbols
usr/lib/modules/6.10.0-rc4-next-20240620+/modules.symbols.bin
usr/lib/modules/6.10.0-rc4-next-20240620+/modules.weakdep
usr/lib/systemd
usr/lib/systemd/network
usr/lib/systemd/network/73-usb-net-by-mac.link
usr/lib/systemd/network/80-6rd-tunnel.link
usr/lib/systemd/network/80-container-vb.link
usr/lib/systemd/network/80-container-ve.link
usr/lib/systemd/network/80-container-vz.link
usr/lib/systemd/network/80-vm-vt.link
usr/lib/systemd/network/99-default.link
usr/lib/systemd/systemd-udevd
usr/lib/udev
usr/lib/udev/ata_id
usr/lib/udev/rules.d
usr/lib/udev/rules.d/50-firmware.rules
usr/lib/udev/rules.d/50-udev-default.rules
usr/lib/udev/rules.d/55-dm.rules
usr/lib/udev/rules.d/60-block.rules
usr/lib/udev/rules.d/60-persistent-storage-dm.rules
usr/lib/udev/rules.d/60-persistent-storage.rules
usr/lib/udev/rules.d/71-seat.rules
usr/lib/udev/rules.d/73-special-net-names.rules
usr/lib/udev/rules.d/75-net-description.rules
usr/lib/udev/rules.d/80-drivers.rules
usr/lib/udev/rules.d/80-net-setup-link.rules
usr/lib/udev/rules.d/95-dm-notify.rules
usr/lib/udev/scsi_id
usr/libexec
usr/libexec/plymouth
usr/libexec/plymouth/plymouthd-fd-escrow
usr/local
usr/local/share
usr/local/share/fonts
usr/sbin
usr/sbin/blkid
usr/sbin/dmsetup
usr/sbin/e2fsck
usr/sbin/fsck
usr/sbin/fsck.ext4
usr/sbin/logsave
usr/sbin/modprobe
usr/sbin/mount.fuse3
usr/sbin/mount.ntfs
usr/sbin/mount.ntfs-3g
usr/sbin/plymouthd
usr/sbin/rmmod
usr/sbin/vconfig
usr/sbin/uevent
usr/sbin/udhcpd
usr/sbin/udhcpc
usr/sbin/ubirename
usr/sbin/tunctl
usr/sbin/tc
usr/sbin/syslogd
usr/sbin/sysctl
usr/sbin/switch_root
usr/sbin/swapon
usr/sbin/swapoff
usr/sbin/sulogin
usr/sbin/start-stop-daemon
usr/sbin/run-init
usr/sbin/route
usr/sbin/reboot
usr/sbin/rdate
usr/sbin/poweroff
usr/sbin/pivot_root
usr/sbin/partprobe
usr/sbin/nologin
usr/sbin/nbd-client
usr/sbin/nameif
usr/sbin/modinfo
usr/sbin/mkswap
usr/sbin/mke2fs
usr/sbin/mkdosfs
usr/sbin/mim
usr/sbin/mdev
usr/sbin/lsmod
usr/sbin/losetup
usr/sbin/logread
usr/sbin/loadkmap
usr/sbin/loadfont
usr/sbin/klogd
usr/sbin/ip
usr/sbin/insmod
usr/sbin/init
usr/sbin/ifup
usr/sbin/ifdown
usr/sbin/ifconfig
usr/sbin/i2ctransfer
usr/sbin/i2cset
usr/sbin/i2cget
usr/sbin/i2cdump
usr/sbin/i2cdetect
usr/sbin/hwclock
usr/sbin/httpd
usr/sbin/halt
usr/sbin/getty
usr/sbin/fstrim
usr/sbin/fsfreeze
usr/sbin/freeramdisk
usr/sbin/findfs
usr/sbin/fdisk
usr/sbin/devmem
usr/sbin/depmod
usr/sbin/crond
usr/sbin/chroot
usr/sbin/brctl
usr/sbin/blockdev
usr/sbin/arping
usr/sbin/arp
usr/sbin/adjtimex
usr/sbin/acpid
usr/bin/zcat
usr/bin/yes
usr/bin/xzcat
usr/bin/xz
usr/bin/xxd
usr/bin/xargs
usr/bin/whoami
usr/bin/who
usr/bin/which
usr/bin/wget
usr/bin/wc
usr/bin/watch
usr/bin/w
usr/bin/vi
usr/bin/uuencode
usr/bin/uudecode
usr/bin/usleep
usr/bin/uptime
usr/bin/unzip
usr/bin/unxz
usr/bin/unshare
usr/bin/unlzma
usr/bin/unlink
usr/bin/unix2dos
usr/bin/uniq
usr/bin/unexpand
usr/bin/uncompress
usr/bin/uname
usr/bin/umount
usr/bin/udhcpc6
usr/bin/tty
usr/bin/ts
usr/bin/truncate
usr/bin/true
usr/bin/traceroute6
usr/bin/traceroute
usr/bin/tr
usr/bin/touch
usr/bin/top
usr/bin/timeout
usr/bin/time
usr/bin/tftp
usr/bin/test
usr/bin/telnet
usr/bin/tee
usr/bin/taskset
usr/bin/tar
usr/bin/tail
usr/bin/tac
usr/bin/sync
usr/bin/svok
usr/bin/svc
usr/bin/su
usr/bin/stty
usr/bin/strings
usr/bin/stat
usr/bin/ssl_client
usr/bin/sort
usr/bin/sleep
usr/bin/shuf
usr/bin/shred
usr/bin/sha512sum
usr/bin/sha3sum
usr/bin/sha256sum
usr/bin/sha1sum
usr/bin/sh
usr/bin/setsid
usr/bin/setpriv
usr/bin/setkeycodes
usr/bin/seq
usr/bin/sed
usr/bin/run-parts
usr/bin/rpm2cpio
usr/bin/rpm
usr/bin/rmdir
usr/bin/rm
usr/bin/rev
usr/bin/resume
usr/bin/reset
usr/bin/renice
usr/bin/realpath
usr/bin/readlink
usr/bin/pwd
usr/bin/ps
usr/bin/printf
usr/bin/ping6
usr/bin/ping
usr/bin/pidof
usr/bin/patch
usr/bin/paste
usr/bin/passwd
usr/bin/openvt
usr/bin/od
usr/bin/nuke
usr/bin/nslookup
usr/bin/nsenter
usr/bin/nproc
usr/bin/nl
usr/bin/netstat
usr/bin/nc
usr/bin/mv
usr/bin/mt
usr/bin/mount
usr/bin/more
usr/bin/mktemp
usr/bin/mkpasswd
usr/bin/mknod
usr/bin/mkfifo
usr/bin/mkdir
usr/bin/microcom
usr/bin/md5sum
usr/bin/lzop
usr/bin/lzma
usr/bin/lzcat
usr/bin/lsscsi
usr/bin/ls
usr/bin/logname
usr/bin/login
usr/bin/logger
usr/bin/ln
usr/bin/linuxrc
usr/bin/linux64
usr/bin/linux32
usr/bin/link
usr/bin/less
usr/bin/last
usr/bin/killall
usr/bin/kill
usr/bin/ipcalc
usr/bin/ionice
usr/bin/install
usr/bin/id
usr/bin/hostname
usr/bin/hostid
usr/bin/hexdump
usr/bin/head
usr/bin/gzip
usr/bin/gunzip
usr/bin/groups
usr/bin/grep
usr/bin/getopt
usr/bin/ftpput
usr/bin/ftpget
usr/bin/free
usr/bin/fold
usr/bin/find
usr/bin/fgrep
usr/bin/fatattr
usr/bin/false
usr/bin/fallocate
usr/bin/factor
usr/bin/expr
usr/bin/expand
usr/bin/env
usr/bin/egrep
usr/bin/ed
usr/bin/echo
usr/bin/dumpleases
usr/bin/dumpkmap
usr/bin/du
usr/bin/dpkg-deb
usr/bin/dpkg
usr/bin/dos2unix
usr/bin/dnsdomainname
usr/bin/dmesg
usr/bin/dirname
usr/bin/diff
usr/bin/df
usr/bin/deallocvt
usr/bin/dd
usr/bin/dc
usr/bin/date
usr/bin/cut
usr/bin/cttyhack
usr/bin/crontab
usr/bin/crc32
usr/bin/cpio
usr/bin/cp
usr/bin/cmp
usr/bin/clear
usr/bin/chvt
usr/bin/chown
usr/bin/chmod
usr/bin/chgrp
usr/bin/cat
usr/bin/cal
usr/bin/bzip2
usr/bin/bzcat
usr/bin/busybox
usr/bin/bunzip2
usr/bin/blkdiscard
usr/bin/bc
usr/bin/basename
usr/bin/base64
usr/bin/awk
usr/bin/ash
usr/bin/ascii
usr/bin/arch
usr/bin/ar
usr/bin/[[
usr/bin/[
usr/sbin/watchdog
usr/share
usr/share/fonts
usr/share/fonts/truetype
usr/share/fonts/truetype/dejavu
usr/share/fonts/truetype/dejavu/DejaVuSans.ttf
usr/share/fonts/truetype/dejavu/DejaVuSerif.ttf
usr/share/plymouth
usr/share/plymouth/debian-logo.png
usr/share/plymouth/plymouthd.defaults
usr/share/plymouth/themes
usr/share/plymouth/themes/details
usr/share/plymouth/themes/details/details.plymouth
usr/share/plymouth/themes/emerald
usr/share/plymouth/themes/emerald/Emerald_plymouth.svg
usr/share/plymouth/themes/emerald/debian.png
usr/share/plymouth/themes/emerald/emerald.plymouth
usr/share/plymouth/themes/emerald/emerald.script
usr/share/plymouth/themes/emerald/glow.png
usr/share/plymouth/themes/emerald/glow.xcf
usr/share/plymouth/themes/emerald/logo+emerald.png
usr/share/plymouth/themes/emerald/logo+emerald.svg
usr/share/plymouth/themes/emerald/password_dot.png
usr/share/plymouth/themes/emerald/password_dot16.png
usr/share/plymouth/themes/emerald/password_field.png
usr/share/plymouth/themes/emerald/password_field16.png
usr/share/plymouth/themes/text
usr/share/plymouth/themes/text/text.plymouth
var
var/cache
var/cache/fontconfig
var/cache/fontconfig/3830d5c3ddfd5cd38a049b759396e72e-le64.cache-9
var/cache/fontconfig/4c599c202bc5c08e2d34565a40eac3b2-le64.cache-9
var/cache/fontconfig/7ef2298fde41cc6eeb7af42e48b7d293-le64.cache-9
var/cache/fontconfig/CACHEDIR.TAG
var/cache/fontconfig/d589a48862398ed80a3d6066f4f56f4c-le64.cache-9



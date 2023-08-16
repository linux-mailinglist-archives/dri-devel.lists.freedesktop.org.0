Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4229F77DE3D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 12:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A9B10E321;
	Wed, 16 Aug 2023 10:12:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B5810E0CD;
 Wed, 16 Aug 2023 10:12:11 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A0E4F40E0196; 
 Wed, 16 Aug 2023 10:12:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 54D_TbA7UJMo; Wed, 16 Aug 2023 10:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1692180725; bh=KRivlcHpy8KC4ZdVygipZRrY0dBavzdGMHcrHUherDY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S3DjW/hGZkbWHHZ3DiOo5yc2E0Gq0bA9jMgckRoegkrOiLlqaveoMNb8kz6voFU+P
 CJmTRriOZ1ORAp0fAPY5sDHZ3XSdPvNe/MzJyi/pRi0jynP55AbsjybK5+iSb0RZGM
 5+HbGJvf0GAZMpXWrpiUcNnXeH1KfgkYvNyQbcJPIofwvxXlaRhVEksCoB5YCC+kIG
 eNAIVAkSFvJAt+vL1xVCKiJ0UDlJCVgvm1KRFchG+cuK5isH3Pt6sykqUejj63nN7u
 B0Kur5pBbYagzkjd1ELElahWfVb1qrHmeeLpryql7C1QkTQ+mThnzv0w5Aw+CW5UVu
 n5V5kyC9//fBSaA+HF5fQf/vj5SNlDQwAf//xWFBHgyw0R1nfAE4Dzyke+6TRaGvno
 6lwlHyjnmfiIf2BPq9wurJnYEaM3VfslkNxm2G/MkaZdGUvWz7RfCf+EKOQOaYHkCf
 BFbtOnEYMOWsDaAFPnce7Dsb0C8rAXvYvlv59L8DTfEG2wF3FkCydBeZQ7gci3C2oM
 3hDSqGO09pYgFOKMU6ZladIqXWe2TSImcT4TDDRdreryZ3Fz7gAurZZLnWagEMtQBj
 OvR1808k9mhGy0QtDyPDnkvQlw8LO8dNL1jwvIaLl38e+oGoyGGdmOe/6OPc3vG+wD
 6tzjU4b49d0G2CHIfpRtbC+s=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 42DDD40E0193;
 Wed, 16 Aug 2023 10:11:58 +0000 (UTC)
Date: Wed, 16 Aug 2023 12:11:57 +0200
From: Borislav Petkov <bp@alien8.de>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: fix use-after-free in error handling
 of nouveau_connector_create
Message-ID: <20230816101157.GFZNyg7QARIL+io6m4@fat_crate.local>
References: <20230814144933.3956959-1-kherbst@redhat.com>
 <20230816093015.GDZNyXJ28y9uspb4Mr@fat_crate.local>
 <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
 <20230816100344.GEZNyfAIt0CJa+g6Sj@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230816100344.GEZNyfAIt0CJa+g6Sj@fat_crate.local>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 16, 2023 at 12:03:44PM +0200, Borislav Petkov wrote:
> On Wed, Aug 16, 2023 at 11:51:50AM +0200, Karol Herbst wrote:
> > Mind sharing your kernel logs with that patch applied? I suspect your
> > system boots up but you might just not have the connector available or
> > something? It could be that you have one of those GPUs affected by the
> > original change and then we'd have to figure out what to do with that.
> 
> Lemme do the KASAN run you requested first. It is an old and slooow box,
> the grandma. :-)

Does that help?

[    0.000000] microcode: updated early: 0x710 -> 0x718, date = 2019-05-21
[    0.000000] Linux version 6.5.0-rc5 (root@gondor) (gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1) #3 SMP PREEMPT_DYNAMIC Wed Aug 16 11:39:30 CEST 2023
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-6.5.0-rc5 root=/dev/sda7 ro earlyprintk=ttyS0,115200 console=ttyS0,115200 console=tty0 ras=cec_disable root=/dev/sda7 log_buf_len=10M resume=/dev/sda5 no_console_suspend ignore_loglevel
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Centaur CentaurHauls
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000018ebafff] usable
[    0.000000] BIOS-e820: [mem 0x0000000018ebb000-0x0000000018fe7fff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x0000000018fe8000-0x0000000018fe8fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000018fe9000-0x0000000018ffffff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x0000000019000000-0x000000001dffcfff] usable
[    0.000000] BIOS-e820: [mem 0x000000001dffd000-0x000000001dffffff] ACPI data
[    0.000000] BIOS-e820: [mem 0x000000001e000000-0x00000000ac77cfff] usable
[    0.000000] BIOS-e820: [mem 0x00000000ac77d000-0x00000000ac77ffff] type 20
[    0.000000] BIOS-e820: [mem 0x00000000ac780000-0x00000000ac780fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ac781000-0x00000000ac782fff] type 20
[    0.000000] BIOS-e820: [mem 0x00000000ac783000-0x00000000ac7d9fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ac7da000-0x00000000ac7dafff] type 20
[    0.000000] BIOS-e820: [mem 0x00000000ac7db000-0x00000000ac7dcfff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ac7dd000-0x00000000ac7e7fff] type 20
[    0.000000] BIOS-e820: [mem 0x00000000ac7e8000-0x00000000ac7f1fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ac7f2000-0x00000000ac7f5fff] type 20
[    0.000000] BIOS-e820: [mem 0x00000000ac7f6000-0x00000000ac7f9fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ac7fa000-0x00000000ac7fafff] type 20
[    0.000000] BIOS-e820: [mem 0x00000000ac7fb000-0x00000000ac803fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ac804000-0x00000000ac810fff] type 20
[    0.000000] BIOS-e820: [mem 0x00000000ac811000-0x00000000ac813fff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ac814000-0x00000000ad7fffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000b0000000-0x00000000b3ffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed20000-0x00000000fed3ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000fed50000-0x00000000fed8ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ffa00000-0x00000000ffa3ffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000044fffffff] usable
[    0.000000] printk: bootconsole [earlyser0] enabled
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] efi: EFI v2.0 by American Megatrends
[    0.000000] efi: ACPI 2.0=0x1dffff98 SMBIOS=0xac811018 
[    0.000000] efi: Remove mem57: MMIO range=[0xb0000000-0xb3ffffff] (64MB) from e820 map
[    0.000000] e820: remove [mem 0xb0000000-0xb3ffffff] reserved
[    0.000000] efi: Not removing mem58: MMIO range=[0xfed20000-0xfed3ffff] (128KB) from e820 map
[    0.000000] efi: Remove mem59: MMIO range=[0xfed50000-0xfed8ffff] (0MB) from e820 map
[    0.000000] e820: remove [mem 0xfed50000-0xfed8ffff] reserved
[    0.000000] efi: Remove mem60: MMIO range=[0xffa00000-0xffa3ffff] (0MB) from e820 map
[    0.000000] e820: remove [mem 0xffa00000-0xffa3ffff] reserved
[    0.000000] SMBIOS 2.6 present.
[    0.000000] DMI: Dell Inc. Precision T3600/0PTTT9, BIOS A13 05/11/2014
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 3591.677 MHz processor
[    0.001418] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.007973] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.013555] last_pfn = 0x450000 max_arch_pfn = 0x400000000
[    0.019024] total RAM covered: 16352M
[    0.023219] Found optimal setting for mtrr clean up
[    0.027935]  gran_size: 64K 	chunk_size: 64M 	num_reg: 8  	lose cover RAM: 0G
[    0.035067] MTRR map: 6 entries (3 fixed + 3 variable; max 23), built from 10 variable MTRRs
[    0.043496] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.050917] e820: update [mem 0xae000000-0xffffffff] usable ==> reserved
[    0.057479] last_pfn = 0xad800 max_arch_pfn = 0x400000000
[    0.065122] found SMP MP-table at [mem 0x000f1dd0-0x000f1ddf]
[    0.070730] Using GB pages for direct mapping
[    0.090229] printk: log_buf_len: 16777216 bytes
[    0.094607] printk: early log buf free: 257712(98%)
[    0.099473] Secure boot could not be determined
[    0.103994] RAMDISK: [mem 0x36fab000-0x377ccfff]
[    0.108601] ACPI: Early table checksum verification disabled
[    0.114256] ACPI: RSDP 0x000000001DFFFF98 000024 (v02 DELL  )
[    0.119991] ACPI: XSDT 0x000000001DFFEE18 00006C (v01 DELL   CBX3     06222004 MSFT 00010013)
[    0.128513] ACPI: FACP 0x0000000018FF0C18 0000F4 (v04 DELL   CBX3     06222004 MSFT 00010013)
[    0.137034] ACPI: DSDT 0x0000000018FA9018 006373 (v01 DELL   CBX3     00000000 INTL 20091112)
[    0.145551] ACPI: FACS 0x0000000018FFDF40 000040
[    0.150159] ACPI: FACS 0x0000000018FF1F40 000040
[    0.154767] ACPI: APIC 0x000000001DFFDC18 000158 (v02 DELL   CBX3     06222004 MSFT 00010013)
[    0.163287] ACPI: MCFG 0x0000000018FFED18 00003C (v01 A M I  OEMMCFG. 06222004 MSFT 00000097)
[    0.171808] ACPI: TCPA 0x0000000018FFEC98 000032 (v02                 00000000      00000000)
[    0.180328] ACPI: SSDT 0x0000000018FEFA98 000306 (v01 DELLTP TPM      00003000 INTL 20091112)
[    0.188847] ACPI: HPET 0x0000000018FFEC18 000038 (v01 A M I   PCHHPET 06222004 AMI. 00000003)
[    0.197367] ACPI: BOOT 0x0000000018FFEB98 000028 (v01 DELL   CBX3     06222004 AMI  00010013)
[    0.205886] ACPI: SSDT 0x0000000018FB0018 037106 (v02 INTEL  CpuPm    00004000 INTL 20091112)
[    0.214406] ACPI: SLIC 0x0000000018FEEC18 000176 (v03 DELL   CBX3     06222004 MSFT 00010013)
[    0.222924] ACPI: Reserving FACP table memory at [mem 0x18ff0c18-0x18ff0d0b]
[    0.229966] ACPI: Reserving DSDT table memory at [mem 0x18fa9018-0x18faf38a]
[    0.237007] ACPI: Reserving FACS table memory at [mem 0x18ffdf40-0x18ffdf7f]
[    0.244048] ACPI: Reserving FACS table memory at [mem 0x18ff1f40-0x18ff1f7f]
[    0.251090] ACPI: Reserving APIC table memory at [mem 0x1dffdc18-0x1dffdd6f]
[    0.258130] ACPI: Reserving MCFG table memory at [mem 0x18ffed18-0x18ffed53]
[    0.265173] ACPI: Reserving TCPA table memory at [mem 0x18ffec98-0x18ffecc9]
[    0.272214] ACPI: Reserving SSDT table memory at [mem 0x18fefa98-0x18fefd9d]
[    0.279256] ACPI: Reserving HPET table memory at [mem 0x18ffec18-0x18ffec4f]
[    0.286297] ACPI: Reserving BOOT table memory at [mem 0x18ffeb98-0x18ffebbf]
[    0.293338] ACPI: Reserving SSDT table memory at [mem 0x18fb0018-0x18fe711d]
[    0.300380] ACPI: Reserving SLIC table memory at [mem 0x18feec18-0x18feed8d]
[    0.307765] No NUMA configuration found
[    0.311437] Faking a node at [mem 0x0000000000000000-0x000000044fffffff]
[    0.318139] NODE_DATA(0) allocated [mem 0x44b7f9000-0x44b7fcfff]
[    0.324235] Zone ranges:
[    0.326652]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.332826]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.338997]   Normal   [mem 0x0000000100000000-0x000000044fffffff]
[    0.345169] Movable zone start for each node
[    0.349429] Early memory node ranges
[    0.352994]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.359254]   node   0: [mem 0x0000000000100000-0x0000000018ebafff]
[    0.365513]   node   0: [mem 0x0000000018fe8000-0x0000000018fe8fff]
[    0.371772]   node   0: [mem 0x0000000019000000-0x000000001dffcfff]
[    0.378031]   node   0: [mem 0x000000001e000000-0x00000000ac77cfff]
[    0.384292]   node   0: [mem 0x00000000ac814000-0x00000000ad7fffff]
[    0.390551]   node   0: [mem 0x0000000100000000-0x000000044fffffff]
[    0.396814] Initmem setup node 0 [mem 0x0000000000001000-0x000000044fffffff]
[    0.403866] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.404058] On node 0, zone DMA: 96 pages in unavailable ranges
[    0.414355] On node 0, zone DMA32: 301 pages in unavailable ranges
[    0.421088] On node 0, zone DMA32: 23 pages in unavailable ranges
[    0.454526] On node 0, zone DMA32: 3 pages in unavailable ranges
[    0.460680] On node 0, zone DMA32: 151 pages in unavailable ranges
[    0.630210] On node 0, zone Normal: 10240 pages in unavailable ranges
[    0.818820] kasan: KernelAddressSanitizer initialized
[    0.830342] ACPI: PM-Timer IO Port: 0x408
[    0.834224] IOAPIC[0]: apic_id 0, version 32, address 0xfec00000, GSI 0-23
[    0.841063] IOAPIC[1]: apic_id 2, version 32, address 0xfec3f000, GSI 24-47
[    0.848015] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.854359] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.860972] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.867399] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.872530] TSC deadline timer available
[    0.876439] smpboot: Allowing 32 CPUs, 24 hotplug CPUs
[    0.881649] PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.889132] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0x000fffff]
[    0.896695] PM: hibernation: Registered nosave memory: [mem 0x18ebb000-0x18fe7fff]
[    0.904258] PM: hibernation: Registered nosave memory: [mem 0x18fe9000-0x18ffffff]
[    0.911820] PM: hibernation: Registered nosave memory: [mem 0x1dffd000-0x1dffffff]
[    0.919382] PM: hibernation: Registered nosave memory: [mem 0xac77d000-0xac77ffff]
[    0.926943] PM: hibernation: Registered nosave memory: [mem 0xac780000-0xac780fff]
[    0.934506] PM: hibernation: Registered nosave memory: [mem 0xac781000-0xac782fff]
[    0.942069] PM: hibernation: Registered nosave memory: [mem 0xac783000-0xac7d9fff]
[    0.949631] PM: hibernation: Registered nosave memory: [mem 0xac7da000-0xac7dafff]
[    0.957195] PM: hibernation: Registered nosave memory: [mem 0xac7db000-0xac7dcfff]
[    0.964758] PM: hibernation: Registered nosave memory: [mem 0xac7dd000-0xac7e7fff]
[    0.972320] PM: hibernation: Registered nosave memory: [mem 0xac7e8000-0xac7f1fff]
[    0.979883] PM: hibernation: Registered nosave memory: [mem 0xac7f2000-0xac7f5fff]
[    0.987613] PM: hibernation: Registered nosave memory: [mem 0xac7f6000-0xac7f9fff]
[    0.995098] PM: hibernation: Registered nosave memory: [mem 0xac7fa000-0xac7fafff]
[    1.002661] PM: hibernation: Registered nosave memory: [mem 0xac7fb000-0xac803fff]
[    1.010223] PM: hibernation: Registered nosave memory: [mem 0xac804000-0xac810fff]
[    1.017786] PM: hibernation: Registered nosave memory: [mem 0xac811000-0xac813fff]
[    1.025351] PM: hibernation: Registered nosave memory: [mem 0xad800000-0xfed1ffff]
[    1.032911] PM: hibernation: Registered nosave memory: [mem 0xfed20000-0xfed3ffff]
[    1.040472] PM: hibernation: Registered nosave memory: [mem 0xfed40000-0xffffffff]
[    1.048042] [mem 0xad800000-0xfed1ffff] available for PCI devices
[    1.054120] Booting paravirtualized kernel on bare hardware
[    1.059685] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    1.078742] setup_percpu: NR_CPUS:256 nr_cpumask_bits:32 nr_cpu_ids:32 nr_node_ids:1
[    1.088987] percpu: Embedded 94 pages/cpu s348160 r8192 d28672 u524288
[    1.095390] pcpu-alloc: s348160 r8192 d28672 u524288 alloc=1*2097152
[    1.101712] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07 
[    1.107014] pcpu-alloc: [0] 08 09 10 11 [0] 12 13 14 15 
[    1.112316] pcpu-alloc: [0] 16 17 18 19 [0] 20 21 22 23 
[    1.117617] pcpu-alloc: [0] 24 25 26 27 [0] 28 29 30 31 
[    1.122979] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-6.5.0-rc5 root=/dev/sda7 ro earlyprintk=ttyS0,115200 console=ttyS0,115200 console=tty0 ras=cec_disable root=/dev/sda7 log_buf_len=10M resume=/dev/sda5 no_console_suspend ignore_loglevel
[    1.144603] Unknown kernel command line parameters "BOOT_IMAGE=/boot/vmlinuz-6.5.0-rc5", will be passed to user space.
[    1.156659] Dentry cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    1.165330] Inode-cache hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    1.175046] Fallback order for Node 0: 0 
[    1.175064] Built 1 zonelists, mobility grouping on.  Total pages: 4117961
[    1.185780] Policy zone: Normal
[    1.188925] mem auto-init: stack:off, heap alloc:off, heap free:off
[    1.195166] stackdepot: allocating hash table via alloc_large_system_hash
[    1.202766] stackdepot hash table entries: 1048576 (order: 11, 8388608 bytes, linear)
[    1.210459] software IO TLB: area num 32.
[    1.501030] Memory: 14043492K/16733956K available (22528K kernel code, 7558K rwdata, 9380K rodata, 5236K init, 15984K bss, 2690208K reserved, 0K cma-reserved)
[    1.515658] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=32, Nodes=1
[    1.522197] Kernel/User page tables isolation: enabled
[    1.527533] ftrace: allocating 41167 entries in 161 pages
[    1.541748] ftrace: allocated 161 pages with 3 groups
[    1.547083] Dynamic Preempt: full
[    1.551137] Running RCU self tests
[    1.554376] Running RCU synchronous self tests
[    1.558840] rcu: Preemptible hierarchical RCU implementation.
[    1.564548] rcu: 	RCU lockdep checking is enabled.
[    1.569330] rcu: 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=32.
[    1.576110] 	Trampoline variant of Tasks RCU enabled.
[    1.581152] 	Rude variant of Tasks RCU enabled.
[    1.585673] rcu: RCU calculated value of scheduler-enlistment delay is 100 jiffies.
[    1.593322] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=32
[    1.600298] Running RCU synchronous self tests
[    1.629889] NR_IRQS: 16640, nr_irqs: 1088, preallocated irqs: 16
[    1.636277] rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    1.643446] Console: colour dummy device 80x25
[    1.647757] printk: console [tty0] enabled
[    1.651824] printk: bootconsole [earlyser0] disabled
[    1.656867] printk: console [ttyS0] enabled
[    2.930923] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
[    2.938752] ... MAX_LOCKDEP_SUBCLASSES:  8
[    2.942894] ... MAX_LOCK_DEPTH:          48
[    2.947125] ... MAX_LOCKDEP_KEYS:        8192
[    2.951531] ... CLASSHASH_SIZE:          4096
[    2.955937] ... MAX_LOCKDEP_ENTRIES:     32768
[    2.960431] ... MAX_LOCKDEP_CHAINS:      65536
[    2.964922] ... CHAINHASH_SIZE:          32768
[    2.969416]  memory used by lock dependency info: 6493 kB
[    2.974874]  memory used for stack traces: 4224 kB
[    2.979717]  per task-struct memory footprint: 1920 bytes
[    2.985289] ACPI: Core revision 20230331
[    2.990634] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484882848 ns
[    2.999951] APIC: Switch to symmetric I/O mode setup
[    3.005285] x2apic: IRQ remapping doesn't support X2APIC mode
[    3.011209] Switched APIC routing to physical flat.
[    3.017363] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    3.027925] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x33c59cc73f9, max_idle_ns: 440795215499 ns
[    3.038698] Calibrating delay loop (skipped), value calculated using timer frequency.. 7183.35 BogoMIPS (lpj=3591677)
[    3.039693] CPU0: Thermal monitoring enabled (TM1)
[    3.040757] process: using mwait in idle threads
[    3.041685] Last level iTLB entries: 4KB 512, 2MB 8, 4MB 8
[    3.042668] Last level dTLB entries: 4KB 512, 2MB 32, 4MB 32, 1GB 0
[    3.043677] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    3.044670] Spectre V2 : Mitigation: Retpolines
[    3.045668] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
[    3.046668] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXIT
[    3.047668] Spectre V2 : Enabling Restricted Speculation for firmware calls
[    3.048673] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    3.049668] Spectre V2 : User space: Mitigation: STIBP via prctl
[    3.050669] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
[    3.051678] MDS: Mitigation: Clear CPU buffers
[    3.052668] MMIO Stale Data: Unknown: No mitigations
[    3.053694] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    3.054668] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    3.055668] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    3.056668] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    3.058668] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
[    3.087782] Freeing SMP alternatives memory: 36K
[    3.088670] pid_max: default: 32768 minimum: 301
[    3.106029] Mount-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    3.106693] Mountpoint-cache hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    3.110284] Running RCU synchronous self tests
[    3.110676] Running RCU synchronous self tests
[    3.112863] smpboot: CPU0: Intel(R) Xeon(R) CPU E5-1620 0 @ 3.60GHz (family: 0x6, model: 0x2d, stepping: 0x7)
[    3.115185] RCU Tasks: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1.
[    3.115859] RCU Tasks Rude: Setting shift to 5 and lim to 1 rcu_task_cb_adjust=1.
[    3.116838] Running RCU-tasks wait API self tests
[    3.229921] Performance Events: PEBS fmt1+, SandyBridge events, 16-deep LBR, full-width counters, Intel PMU driver.
[    3.230688] ... version:                3
[    3.231669] ... bit width:              48
[    3.232669] ... generic registers:      4
[    3.233682] ... value mask:             0000ffffffffffff
[    3.234669] ... max period:             00007fffffffffff
[    3.235674] ... fixed-purpose events:   3
[    3.236669] ... event mask:             000000070000000f
[    3.238313] signal: max sigframe size: 1776
[    3.238739] Estimated ratio of average max frequency by base frequency (times 1024): 1052
[    3.239951] rcu: Hierarchical SRCU implementation.
[    3.240678] rcu: 	Max phase no-delay instances is 400.
[    3.247346] NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    3.251040] smp: Bringing up secondary CPUs ...
[    3.253034] smpboot: x86: Booting SMP configuration:
[    3.253699] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7
[    3.270991] MDS CPU bug present and SMT on, data leak possible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more details.
[    3.276378] smp: Brought up 1 node, 8 CPUs
[    3.276686] smpboot: Max logical packages: 4
[    3.277670] smpboot: Total of 8 processors activated (57466.83 BogoMIPS)
[    3.284669] devtmpfs: initialized
[    3.291038] ACPI: PM: Registering ACPI NVS region [mem 0x18ebb000-0x18fe7fff] (1232896 bytes)
[    3.292716] ACPI: PM: Registering ACPI NVS region [mem 0x18fe9000-0x18ffffff] (94208 bytes)
[    3.294461] Running RCU synchronous self tests
[    3.294724] Running RCU synchronous self tests
[    3.296958] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1911260446275000 ns
[    3.297690] futex hash table entries: 8192 (order: 8, 1048576 bytes, linear)
[    3.302441] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    3.305208] DMA: preallocated 2048 KiB GFP_KERNEL pool for atomic allocations
[    3.305738] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    3.306747] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    3.309031] thermal_sys: Registered thermal governor 'step_wise'
[    3.309038] thermal_sys: Registered thermal governor 'user_space'
[    3.309869] cpuidle: using governor ladder
[    3.311767] cpuidle: using governor menu
[    3.312813] Simple Boot Flag at 0xf3 set to 0x1
[    3.313752] ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    3.315526] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xb0000000-0xb3ffffff] (base 0xb0000000)
[    3.315678] PCI: not using MMCONFIG
[    3.316693] PCI: Using configuration type 1 for base access
[    3.317787] core: PMU erratum BJ122, BV98, HSD29 worked around, HT is on
[    3.323027] kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    3.325733] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    3.326670] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    3.327669] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    3.328669] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    3.342754] Callback from call_rcu_tasks_rude() invoked.
[    3.348356] ACPI: Added _OSI(Module Device)
[    3.352701] ACPI: Added _OSI(Processor Device)
[    3.356698] ACPI: Added _OSI(3.0 _SCP Extensions)
[    3.361698] ACPI: Added _OSI(Processor Aggregator Device)
[    3.437993] Callback from call_rcu_tasks() invoked.
[    8.065519] ACPI: 3 ACPI AML tables successfully acquired and loaded
[    8.797658] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    9.021000] ACPI: Interpreter enabled
[    9.025462] ACPI: PM: (supports S0 S1 S3 S4 S5)
[    9.030754] ACPI: Using IOAPIC for interrupt routing
[    9.037171] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xb0000000-0xb3ffffff] (base 0xb0000000)
[    9.117945] [Firmware Info]: PCI: MMCONFIG at [mem 0xb0000000-0xb3ffffff] not reserved in ACPI motherboard resources
[    9.128714] PCI: MMCONFIG at [mem 0xb0000000-0xb3ffffff] reserved as EfiMemoryMappedIO
[    9.150432] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    9.159706] PCI: Using E820 reservations for host bridge windows
[    9.179421] ACPI: Enabled 7 GPEs in block 00 to 3F
[    9.834043] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-1f])
[    9.840824] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    9.861410] acpi PNP0A08:00: _OSC: platform does not support [AER PCIeCapability LTR]
[    9.881593] acpi PNP0A08:00: _OSC: not requesting control; platform does not support [PCIeCapability]
[    9.890715] acpi PNP0A08:00: _OSC: OS requested [PME AER PCIeCapability LTR]
[    9.897706] acpi PNP0A08:00: _OSC: platform willing to grant [PME]
[    9.903708] acpi PNP0A08:00: _OSC: platform retains control of PCIe features (AE_SUPPORT)
[    9.935426] PCI host bridge to bus 0000:00
[    9.939742] pci_bus 0000:00: root bus resource [io  0x0000-0x03af window]
[    9.946727] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window]
[    9.953727] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window]
[    9.960736] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    9.966740] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000dffff window]
[    9.974729] pci_bus 0000:00: root bus resource [mem 0xb0000000-0xfbffffff window]
[    9.981746] pci_bus 0000:00: root bus resource [bus 00-1f]
[    9.988609] pci 0000:00:00.0: [8086:3c00] type 00 class 0x060000
[    9.995502] pci 0000:00:00.0: PME# supported from D0 D3hot D3cold
[   10.003356] pci 0000:00:01.0: [8086:3c02] type 01 class 0x060400
[   10.010273] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[   10.024263] pci 0000:00:01.1: [8086:3c03] type 01 class 0x060400
[   10.030288] pci 0000:00:01.1: PME# supported from D0 D3hot D3cold
[   10.043175] pci 0000:00:02.0: [8086:3c04] type 01 class 0x060400
[   10.049270] pci 0000:00:02.0: PME# supported from D0 D3hot D3cold
[   10.062290] pci 0000:00:03.0: [8086:3c08] type 01 class 0x060400
[   10.067866] pci 0000:00:03.0: enabling Extended Tags
[   10.073153] pci 0000:00:03.0: PME# supported from D0 D3hot D3cold
[   10.086086] pci 0000:00:05.0: [8086:3c28] type 00 class 0x088000
[   10.094031] pci 0000:00:05.2: [8086:3c2a] type 00 class 0x088000
[   10.101960] pci 0000:00:05.4: [8086:3c2c] type 00 class 0x080020
[   10.108724] pci 0000:00:05.4: reg 0x10: [mem 0xf332d000-0xf332dfff]
[   10.116977] pci 0000:00:11.0: [8086:1d3e] type 01 class 0x060400
[   10.123268] pci 0000:00:11.0: PME# supported from D0 D3hot D3cold
[   10.135971] pci 0000:00:16.0: [8086:1d3a] type 00 class 0x078000
[   10.141765] pci 0000:00:16.0: reg 0x10: [mem 0xf332c000-0xf332c00f 64bit]
[   10.149157] pci 0000:00:16.0: PME# supported from D0 D3hot D3cold
[   10.156691] pci 0000:00:16.3: [8086:1d3d] type 00 class 0x070002
[   10.162744] pci 0000:00:16.3: reg 0x10: [io  0xf0a0-0xf0a7]
[   10.168721] pci 0000:00:16.3: reg 0x14: [mem 0xf332a000-0xf332afff]
[   10.176898] pci 0000:00:19.0: [8086:1502] type 00 class 0x020000
[   10.182748] pci 0000:00:19.0: reg 0x10: [mem 0xf3300000-0xf331ffff]
[   10.188726] pci 0000:00:19.0: reg 0x14: [mem 0xf3329000-0xf3329fff]
[   10.195749] pci 0000:00:19.0: reg 0x18: [io  0xf040-0xf05f]
[   10.201106] pci 0000:00:19.0: PME# supported from D0 D3hot D3cold
[   10.213590] pci 0000:00:1a.0: [8086:1d2d] type 00 class 0x0c0320
[   10.218767] pci 0000:00:1a.0: reg 0x10: [mem 0xf3328000-0xf33283ff]
[   10.226192] pci 0000:00:1a.0: PME# supported from D0 D3hot D3cold
[   10.237706] pci 0000:00:1b.0: [8086:1d20] type 00 class 0x040300
[   10.243761] pci 0000:00:1b.0: reg 0x10: [mem 0xf3320000-0xf3323fff 64bit]
[   10.251271] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[   10.262785] pci 0000:00:1c.0: [8086:1d16] type 01 class 0x060400
[   10.269267] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[   10.281789] pci 0000:00:1c.2: [8086:1d14] type 01 class 0x060400
[   10.288267] pci 0000:00:1c.2: PME# supported from D0 D3hot D3cold
[   10.299753] pci 0000:00:1d.0: [8086:1d26] type 00 class 0x0c0320
[   10.306700] pci 0000:00:1d.0: reg 0x10: [mem 0xf3327000-0xf33273ff]
[   10.313190] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
[   10.324818] pci 0000:00:1e.0: [8086:244e] type 01 class 0x060401
[   10.336865] pci 0000:00:1f.0: [8086:1d41] type 00 class 0x060100
[   10.349201] pci 0000:00:1f.2: [8086:1d02] type 00 class 0x010601
[   10.355752] pci 0000:00:1f.2: reg 0x10: [io  0xf090-0xf097]
[   10.360723] pci 0000:00:1f.2: reg 0x14: [io  0xf080-0xf083]
[   10.366726] pci 0000:00:1f.2: reg 0x18: [io  0xf070-0xf077]
[   10.371737] pci 0000:00:1f.2: reg 0x1c: [io  0xf060-0xf063]
[   10.377723] pci 0000:00:1f.2: reg 0x20: [io  0xf020-0xf03f]
[   10.383726] pci 0000:00:1f.2: reg 0x24: [mem 0xf3326000-0xf33267ff]
[   10.390093] pci 0000:00:1f.2: PME# supported from D3hot
[   10.399662] pci 0000:00:1f.3: [8086:1d22] type 00 class 0x0c0500
[   10.406759] pci 0000:00:1f.3: reg 0x10: [mem 0xf3325000-0xf33250ff 64bit]
[   10.413756] pci 0000:00:1f.3: reg 0x20: [io  0xf000-0xf01f]
[   10.424895] pci 0000:00:01.0: PCI bridge to [bus 01]
[   10.431682] pci 0000:00:01.1: PCI bridge to [bus 02]
[   10.436746] pci 0000:03:00.0: [10de:10d8] type 00 class 0x030000
[   10.442748] pci 0000:03:00.0: reg 0x10: [mem 0xf2000000-0xf2ffffff]
[   10.449739] pci 0000:03:00.0: reg 0x14: [mem 0xf4000000-0xf7ffffff 64bit pref]
[   10.456757] pci 0000:03:00.0: reg 0x1c: [mem 0xf8000000-0xf9ffffff 64bit pref]
[   10.463728] pci 0000:03:00.0: reg 0x24: [io  0xe000-0xe07f]
[   10.469724] pci 0000:03:00.0: reg 0x30: [mem 0xf3000000-0xf307ffff pref]
[   10.475753] pci 0000:03:00.0: enabling Extended Tags
[   10.481146] pci 0000:03:00.0: BAR 3: assigned to efifb
[   10.486736] pci 0000:03:00.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
[   10.497019] pci 0000:03:00.1: [10de:0be3] type 00 class 0x040300
[   10.503720] pci 0000:03:00.1: reg 0x10: [mem 0xf3080000-0xf3083fff]
[   10.509811] pci 0000:03:00.1: enabling Extended Tags
[   10.517365] pci 0000:00:02.0: PCI bridge to [bus 03]
[   10.521739] pci 0000:00:02.0:   bridge window [io  0xe000-0xefff]
[   10.528679] pci 0000:00:02.0:   bridge window [mem 0xf2000000-0xf30fffff]
[   10.534715] pci 0000:00:02.0:   bridge window [mem 0xf4000000-0xf9ffffff 64bit pref]
[   10.543614] pci 0000:00:03.0: PCI bridge to [bus 04]
[   10.549784] pci 0000:05:00.0: [8086:1d6b] type 00 class 0x010700
[   10.555766] pci 0000:05:00.0: reg 0x10: [mem 0xfa800000-0xfa803fff 64bit pref]
[   10.562745] pci 0000:05:00.0: reg 0x18: [mem 0xfa400000-0xfa7fffff 64bit pref]
[   10.569731] pci 0000:05:00.0: reg 0x20: [io  0xd000-0xd0ff]
[   10.575775] pci 0000:05:00.0: enabling Extended Tags
[   10.581452] pci 0000:05:00.0: reg 0x164: [mem 0x00000000-0x00003fff 64bit pref]
[   10.588727] pci 0000:05:00.0: VF(n) BAR0 space: [mem 0x00000000-0x0007bfff 64bit pref] (contains BAR0 for 31 VFs)
[   10.601444] pci 0000:00:11.0: PCI bridge to [bus 05]
[   10.606712] pci 0000:00:11.0:   bridge window [io  0xd000-0xdfff]
[   10.612710] pci 0000:00:11.0:   bridge window [mem 0xf3200000-0xf32fffff]
[   10.619720] pci 0000:00:11.0:   bridge window [mem 0xfa400000-0xfa8fffff 64bit pref]
[   10.627662] pci 0000:00:1c.0: PCI bridge to [bus 06]
[   10.633746] pci 0000:07:00.0: [1033:0194] type 00 class 0x0c0330
[   10.639767] pci 0000:07:00.0: reg 0x10: [mem 0xf3100000-0xf3101fff 64bit]
[   10.647465] pci 0000:07:00.0: PME# supported from D0 D3hot D3cold
[   10.660200] pci 0000:00:1c.2: PCI bridge to [bus 07]
[   10.664716] pci 0000:00:1c.2:   bridge window [mem 0xf3100000-0xf31fffff]
[   10.671841] pci_bus 0000:08: extended config space not accessible
[   10.678615] pci 0000:00:1e.0: PCI bridge to [bus 08] (subtractive decode)
[   10.685760] pci 0000:00:1e.0:   bridge window [io  0x0000-0x03af window] (subtractive decode)
[   10.693731] pci 0000:00:1e.0:   bridge window [io  0x03e0-0x0cf7 window] (subtractive decode)
[   10.702735] pci 0000:00:1e.0:   bridge window [io  0x03b0-0x03df window] (subtractive decode)
[   10.710731] pci 0000:00:1e.0:   bridge window [io  0x0d00-0xffff window] (subtractive decode)
[   10.719753] pci 0000:00:1e.0:   bridge window [mem 0x000a0000-0x000dffff window] (subtractive decode)
[   10.728734] pci 0000:00:1e.0:   bridge window [mem 0xb0000000-0xfbffffff window] (subtractive decode)
[   10.776050] ACPI: PCI: Interrupt link LNKA configured for IRQ 11
[   10.789396] ACPI: PCI: Interrupt link LNKB configured for IRQ 10
[   10.801228] ACPI: PCI: Interrupt link LNKC configured for IRQ 5
[   10.813133] ACPI: PCI: Interrupt link LNKD configured for IRQ 10
[   10.826221] ACPI: PCI: Interrupt link LNKE configured for IRQ 3
[   10.838287] ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[   10.843704] ACPI: PCI: Interrupt link LNKF disabled
[   10.855255] ACPI: PCI: Interrupt link LNKG configured for IRQ 11
[   10.868188] ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[   10.873704] ACPI: PCI: Interrupt link LNKH disabled
[   10.898154] ACPI: PCI Root Bridge [PCI1] (domain 0000 [bus 20-ff])
[   10.904803] acpi PNP0A08:01: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[   10.926282] acpi PNP0A08:01: _OSC: platform does not support [AER PCIeCapability LTR]
[   10.945495] acpi PNP0A08:01: _OSC: not requesting control; platform does not support [PCIeCapability]
[   10.954718] acpi PNP0A08:01: _OSC: OS requested [PME AER PCIeCapability LTR]
[   10.961705] acpi PNP0A08:01: _OSC: platform willing to grant [PME]
[   10.967701] acpi PNP0A08:01: _OSC: platform retains control of PCIe features (AE_SUPPORT)
[   10.976226] acpi PNP0A08:01: [Firmware Info]: MMCONFIG for domain 0000 [bus 00-3f] only partially covers this bridge
[   11.010005] PCI host bridge to bus 0000:20
[   11.013721] pci_bus 0000:20: root bus resource [io  0x03b0-0x03df window]
[   11.020727] pci_bus 0000:20: root bus resource [mem 0x000a0000-0x000bffff window]
[   11.027708] pci_bus 0000:20: root bus resource [bus 20-ff]
[   11.042045] iommu: Default domain type: Translated
[   11.046697] iommu: DMA domain TLB invalidation policy: lazy mode
[   11.056611] SCSI subsystem initialized
[   11.060809] libata version 3.00 loaded.
[   11.064886] ACPI: bus type USB registered
[   11.069287] usbcore: registered new interface driver usbfs
[   11.075029] usbcore: registered new interface driver hub
[   11.081199] usbcore: registered new device driver usb
[   11.086443] pps_core: LinuxPPS API ver. 1 registered
[   11.091698] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[   11.100904] PTP clock support registered
[   11.107867] efivars: Registered efivars operations
[   11.119959] PCI: Using ACPI for IRQ routing
[   11.128357] PCI: Discovered peer bus 3f
[   11.132725] PCI: root bus 3f: using default resources
[   11.137748] PCI: Probing PCI hardware (bus 3f)
[   11.142662] PCI host bridge to bus 0000:3f
[   11.146720] pci_bus 0000:3f: root bus resource [io  0x0000-0xffff]
[   11.152724] pci_bus 0000:3f: root bus resource [mem 0x00000000-0x3fffffffffff]
[   11.160713] pci_bus 0000:3f: No busn resource found for root bus, will use [bus 3f-ff]
[   11.168704] pci_bus 0000:3f: busn_res: can not insert [bus 3f-ff] under domain [bus 00-ff] (conflicts with (null) [bus 20-ff])
[   11.179866] pci 0000:3f:08.0: [8086:3c80] type 00 class 0x088000
[   11.187202] pci 0000:3f:08.3: [8086:3c83] type 00 class 0x088000
[   11.194351] pci 0000:3f:08.4: [8086:3c84] type 00 class 0x088000
[   11.202340] pci 0000:3f:09.0: [8086:3c90] type 00 class 0x088000
[   11.210080] pci 0000:3f:09.3: [8086:3c93] type 00 class 0x088000
[   11.217355] pci 0000:3f:09.4: [8086:3c94] type 00 class 0x088000
[   11.224302] pci 0000:3f:0a.0: [8086:3cc0] type 00 class 0x088000
[   11.232109] pci 0000:3f:0a.1: [8086:3cc1] type 00 class 0x088000
[   11.239042] pci 0000:3f:0a.2: [8086:3cc2] type 00 class 0x088000
[   11.247151] pci 0000:3f:0a.3: [8086:3cd0] type 00 class 0x088000
[   11.254129] pci 0000:3f:0b.0: [8086:3ce0] type 00 class 0x088000
[   11.261036] pci 0000:3f:0b.3: [8086:3ce3] type 00 class 0x088000
[   11.269128] pci 0000:3f:0c.0: [8086:3ce8] type 00 class 0x088000
[   11.276115] pci 0000:3f:0c.1: [8086:3ce8] type 00 class 0x088000
[   11.283090] pci 0000:3f:0c.6: [8086:3cf4] type 00 class 0x088000
[   11.291109] pci 0000:3f:0c.7: [8086:3cf6] type 00 class 0x088000
[   11.298109] pci 0000:3f:0d.0: [8086:3ce8] type 00 class 0x088000
[   11.305041] pci 0000:3f:0d.1: [8086:3ce8] type 00 class 0x088000
[   11.313150] pci 0000:3f:0d.6: [8086:3cf5] type 00 class 0x088000
[   11.320123] pci 0000:3f:0e.0: [8086:3ca0] type 00 class 0x088000
[   11.327066] pci 0000:3f:0e.1: [8086:3c46] type 00 class 0x110100
[   11.335160] pci 0000:3f:0f.0: [8086:3ca8] type 00 class 0x088000
[   11.342309] pci 0000:3f:0f.1: [8086:3c71] type 00 class 0x088000
[   11.350316] pci 0000:3f:0f.2: [8086:3caa] type 00 class 0x088000
[   11.357303] pci 0000:3f:0f.3: [8086:3cab] type 00 class 0x088000
[   11.365341] pci 0000:3f:0f.4: [8086:3cac] type 00 class 0x088000
[   11.372289] pci 0000:3f:0f.5: [8086:3cad] type 00 class 0x088000
[   11.380327] pci 0000:3f:0f.6: [8086:3cae] type 00 class 0x088000
[   11.387114] pci 0000:3f:10.0: [8086:3cb0] type 00 class 0x088000
[   11.395347] pci 0000:3f:10.1: [8086:3cb1] type 00 class 0x088000
[   11.402295] pci 0000:3f:10.2: [8086:3cb2] type 00 class 0x088000
[   11.410342] pci 0000:3f:10.3: [8086:3cb3] type 00 class 0x088000
[   11.417276] pci 0000:3f:10.4: [8086:3cb4] type 00 class 0x088000
[   11.425321] pci 0000:3f:10.5: [8086:3cb5] type 00 class 0x088000
[   11.432285] pci 0000:3f:10.6: [8086:3cb6] type 00 class 0x088000
[   11.440300] pci 0000:3f:10.7: [8086:3cb7] type 00 class 0x088000
[   11.447335] pci 0000:3f:11.0: [8086:3cb8] type 00 class 0x088000
[   11.455168] pci 0000:3f:13.0: [8086:3ce4] type 00 class 0x088000
[   11.462089] pci 0000:3f:13.1: [8086:3c43] type 00 class 0x110100
[   11.470088] pci 0000:3f:13.4: [8086:3ce6] type 00 class 0x110100
[   11.477138] pci 0000:3f:13.5: [8086:3c44] type 00 class 0x110100
[   11.484039] pci 0000:3f:13.6: [8086:3c45] type 00 class 0x088000
[   11.492146] pci_bus 0000:3f: busn_res: [bus 3f-ff] end is updated to 3f
[   11.498705] pci_bus 0000:3f: busn_res: can not insert [bus 3f] under domain [bus 00-ff] (conflicts with (null) [bus 20-ff])
[   11.510251] PCI: pci_cache_line_size set to 64 bytes
[   11.515149] e820: reserve RAM buffer [mem 0x18ebb000-0x1bffffff]
[   11.521775] e820: reserve RAM buffer [mem 0x18fe9000-0x1bffffff]
[   11.527723] e820: reserve RAM buffer [mem 0x1dffd000-0x1fffffff]
[   11.533722] e820: reserve RAM buffer [mem 0xac77d000-0xafffffff]
[   11.539731] e820: reserve RAM buffer [mem 0xad800000-0xafffffff]
[   11.550990] pci 0000:03:00.0: vgaarb: setting as boot VGA device
[   11.551662] pci 0000:03:00.0: vgaarb: bridge control possible
[   11.551662] pci 0000:03:00.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
[   11.570939] vgaarb: loaded
[   11.576287] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
[   11.582714] hpet0: 8 comparators, 64-bit 14.318180 MHz counter
[   11.591663] clocksource: Switched to clocksource tsc-early
[   11.605269] pnp: PnP ACPI init
[   11.611894] system 00:00: [mem 0xfc000000-0xfcffffff] has been reserved
[   11.618871] system 00:00: [mem 0xfd000000-0xfdffffff] has been reserved
[   11.625778] system 00:00: [mem 0xfe000000-0xfeafffff] has been reserved
[   11.632699] system 00:00: [mem 0xfeb00000-0xfebfffff] has been reserved
[   11.639708] system 00:00: [mem 0xfed00400-0xfed3ffff] could not be reserved
[   11.646932] system 00:00: [mem 0xfed45000-0xfedfffff] has been reserved
[   11.659368] system 00:01: [io  0x0680-0x069f] has been reserved
[   11.665589] system 00:01: [io  0x0800-0x080f] has been reserved
[   11.671750] system 00:01: [io  0xffff] has been reserved
[   11.677312] system 00:01: [io  0xffff] has been reserved
[   11.682900] system 00:01: [io  0x0400-0x0453] has been reserved
[   11.689059] system 00:01: [io  0x0458-0x047f] has been reserved
[   11.695273] system 00:01: [io  0x0500-0x057f] has been reserved
[   11.701435] system 00:01: [io  0x164e-0x164f] has been reserved
[   11.712091] system 00:03: [io  0x0454-0x0457] has been reserved
[   11.752937] pnp: PnP ACPI: found 8 devices
[   11.823033] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[   11.832846] NET: Registered PF_INET protocol family
[   11.838980] IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[   11.868803] tcp_listen_portaddr_hash hash table entries: 8192 (order: 7, 589824 bytes, linear)
[   11.878040] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[   11.885937] TCP established hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[   11.895759] TCP bind hash table entries: 65536 (order: 11, 9437184 bytes, vmalloc hugepage)
[   11.911184] TCP: Hash tables configured (established 131072 bind 65536)
[   11.918697] UDP hash table entries: 8192 (order: 8, 1310720 bytes, linear)
[   11.926742] UDP-Lite hash table entries: 8192 (order: 8, 1310720 bytes, linear)
[   11.935769] NET: Registered PF_UNIX/PF_LOCAL protocol family
[   11.941607] pci 0000:00:01.0: PCI bridge to [bus 01]
[   11.946662] pci 0000:00:01.1: PCI bridge to [bus 02]
[   11.951704] pci 0000:00:02.0: PCI bridge to [bus 03]
[   11.956732] pci 0000:00:02.0:   bridge window [io  0xe000-0xefff]
[   11.962901] pci 0000:00:02.0:   bridge window [mem 0xf2000000-0xf30fffff]
[   11.969768] pci 0000:00:02.0:   bridge window [mem 0xf4000000-0xf9ffffff 64bit pref]
[   11.977605] pci 0000:00:03.0: PCI bridge to [bus 04]
[   11.982675] pci 0000:05:00.0: BAR 7: assigned [mem 0xfa804000-0xfa87ffff 64bit pref]
[   11.990520] pci 0000:00:11.0: PCI bridge to [bus 05]
[   11.995549] pci 0000:00:11.0:   bridge window [io  0xd000-0xdfff]
[   12.001717] pci 0000:00:11.0:   bridge window [mem 0xf3200000-0xf32fffff]
[   12.008590] pci 0000:00:11.0:   bridge window [mem 0xfa400000-0xfa8fffff 64bit pref]
[   12.016438] pci 0000:00:1c.0: PCI bridge to [bus 06]
[   12.021480] pci 0000:00:1c.2: PCI bridge to [bus 07]
[   12.026510] pci 0000:00:1c.2:   bridge window [mem 0xf3100000-0xf31fffff]
[   12.033384] pci 0000:00:1e.0: PCI bridge to [bus 08]
[   12.038424] pci_bus 0000:00: resource 4 [io  0x0000-0x03af window]
[   12.044677] pci_bus 0000:00: resource 5 [io  0x03e0-0x0cf7 window]
[   12.050949] pci_bus 0000:00: resource 6 [io  0x03b0-0x03df window]
[   12.057207] pci_bus 0000:00: resource 7 [io  0x0d00-0xffff window]
[   12.063468] pci_bus 0000:00: resource 8 [mem 0x000a0000-0x000dffff window]
[   12.070423] pci_bus 0000:00: resource 9 [mem 0xb0000000-0xfbffffff window]
[   12.077387] pci_bus 0000:03: resource 0 [io  0xe000-0xefff]
[   12.083030] pci_bus 0000:03: resource 1 [mem 0xf2000000-0xf30fffff]
[   12.089372] pci_bus 0000:03: resource 2 [mem 0xf4000000-0xf9ffffff 64bit pref]
[   12.096688] pci_bus 0000:05: resource 0 [io  0xd000-0xdfff]
[   12.102336] pci_bus 0000:05: resource 1 [mem 0xf3200000-0xf32fffff]
[   12.108679] pci_bus 0000:05: resource 2 [mem 0xfa400000-0xfa8fffff 64bit pref]
[   12.115996] pci_bus 0000:07: resource 1 [mem 0xf3100000-0xf31fffff]
[   12.122346] pci_bus 0000:08: resource 4 [io  0x0000-0x03af window]
[   12.128610] pci_bus 0000:08: resource 5 [io  0x03e0-0x0cf7 window]
[   12.134881] pci_bus 0000:08: resource 6 [io  0x03b0-0x03df window]
[   12.141147] pci_bus 0000:08: resource 7 [io  0x0d00-0xffff window]
[   12.147403] pci_bus 0000:08: resource 8 [mem 0x000a0000-0x000dffff window]
[   12.154365] pci_bus 0000:08: resource 9 [mem 0xb0000000-0xfbffffff window]
[   12.162336] pci_bus 0000:20: resource 4 [io  0x03b0-0x03df window]
[   12.168594] pci_bus 0000:20: resource 5 [mem 0x000a0000-0x000bffff window]
[   12.175765] pci_bus 0000:3f: resource 4 [io  0x0000-0xffff]
[   12.181417] pci_bus 0000:3f: resource 5 [mem 0x00000000-0x3fffffffffff]
[   12.188184] pci 0000:00:05.0: disabled boot interrupts on device [8086:3c28]
[   12.210139] pci 0000:03:00.1: extending delay after power-on from D3hot to 20 msec
[   12.218344] pci 0000:03:00.1: D0 power state depends on 0000:03:00.0
[   12.228834] pci 0000:07:00.0: enabling device (0000 -> 0002)
[   12.235913] pci 0000:07:00.0: quirk_usb_early_handoff+0x0/0x850 took 10669 usecs
[   12.243717] PCI: CLS 64 bytes, default 64
[   12.247887] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[   12.248758] Unpacking initramfs...
[   12.254409] software IO TLB: mapped [mem 0x00000000a877d000-0x00000000ac77d000] (64MB)
[   12.274860] Initialise system trusted keyrings
[   12.279954] workingset: timestamp_bits=56 max_order=22 bucket_order=0
[   12.291482] ntfs: driver 2.1.32 [Flags: R/W].
[   12.296236] fuse: init (API version 7.38)
[   12.302392] 9p: Installing v9fs 9p2000 file system support
[   12.309468] Key type asymmetric registered
[   12.313946] Asymmetric key parser 'x509' registered
[   12.319445] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 250)
[   12.424171] efifb: probing for efifb
[   12.428725] efifb: framebuffer at 0xf9000000, using 1920k, total 1920k
[   12.435460] efifb: mode is 800x600x32, linelength=3200, pages=1
[   12.441665] efifb: scrolling: redraw
[   12.445343] efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[   12.460852] Console: switching to colour frame buffer device 100x37
[   12.471822] fb0: EFI VGA frame buffer device
[   12.481986] ACPI: \_PR_.CP00: Found 4 idle states
[   12.492226] ACPI: \_PR_.CP01: Found 4 idle states
[   12.502457] ACPI: \_PR_.CP02: Found 4 idle states
[   12.512702] ACPI: \_PR_.CP03: Found 4 idle states
[   12.522877] ACPI: \_PR_.CP04: Found 4 idle states
[   12.533116] ACPI: \_PR_.CP05: Found 4 idle states
[   12.543427] ACPI: \_PR_.CP06: Found 4 idle states
[   12.553690] ACPI: \_PR_.CP07: Found 4 idle states
[   12.894130] Freeing initrd memory: 8328K
[   13.301790] tsc: Refined TSC clocksource calibration: 3591.345 MHz
[   13.308176] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x33c4635c383, max_idle_ns: 440795314831 ns
[   13.320080] clocksource: Switched to clocksource tsc
[   13.969574] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[   13.982400] 00:05: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[   14.006972] serial 0000:00:16.3: enabling device (0000 -> 0003)
[   14.035537] 0000:00:16.3: ttyS1 at I/O 0xf0a0 (irq = 17, base_baud = 115200) is a 16550A
[   14.056948] Linux agpgart interface v0.103
[   14.064485] ACPI: bus type drm_connector registered
[   14.088977] Console: switching to colour dummy device 80x25
[   14.097801] nouveau 0000:03:00.0: vgaarb: deactivate vga console
[   14.111690] nouveau 0000:03:00.0: NVIDIA GT218 (0a8c00b1)
[   14.239921] nouveau 0000:03:00.0: bios: version 70.18.83.00.08
[   14.268747] nouveau 0000:03:00.0: fb: 512 MiB DDR3
[   15.117583] nouveau 0000:03:00.0: DRM: VRAM: 512 MiB
[   15.122821] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
[   15.128290] nouveau 0000:03:00.0: DRM: TMDS table version 2.0
[   15.134207] nouveau 0000:03:00.0: DRM: DCB version 4.0
[   15.139502] nouveau 0000:03:00.0: DRM: DCB outp 00: 02000360 00000000
[   15.146153] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000362 00020010
[   15.152780] nouveau 0000:03:00.0: DRM: DCB outp 02: 028003a6 0f220010
[   15.159400] nouveau 0000:03:00.0: DRM: DCB outp 03: 01011380 00000000
[   15.166020] nouveau 0000:03:00.0: DRM: DCB outp 04: 08011382 00020010
[   15.172676] nouveau 0000:03:00.0: DRM: DCB outp 05: 088113c6 0f220010
[   15.179310] nouveau 0000:03:00.0: DRM: DCB conn 00: 00101064
[   15.185126] nouveau 0000:03:00.0: DRM: DCB conn 01: 00202165
[   15.208740] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
[   15.232744] ==================================================================
[   15.233667] BUG: KASAN: slab-use-after-free in drm_connector_list_iter_next+0xf5/0x1c0
[   15.233667] Read of size 4 at addr ffff8881079ec050 by task swapper/0/1
[   15.233667] 
[   15.233667] CPU: 7 PID: 1 Comm: swapper/0 Not tainted 6.5.0-rc5 #3
[   15.233667] Hardware name: Dell Inc. Precision T3600/0PTTT9, BIOS A13 05/11/2014
[   15.233667] Call Trace:
[   15.233667]  <TASK>
[   15.233667]  dump_stack_lvl+0x60/0xb0
[   15.233667]  print_address_description.constprop.0+0x2c/0x3d0
[   15.233667]  kasan_report+0x11d/0x130
[   15.233667]  ? __pfx_lock_acquire+0x10/0x10
[   15.233667]  ? drm_connector_list_iter_next+0xf5/0x1c0
[   15.233667]  kasan_check_range+0xf0/0x1a0
[   15.233667]  drm_connector_list_iter_next+0xf5/0x1c0
[   15.233667]  ? __pfx_drm_connector_list_iter_next+0x10/0x10
[   15.233667]  nouveau_connector_create+0x126/0xd20
[   15.233667]  ? __pfx_nouveau_connector_create+0x10/0x10
[   15.233667]  ? nv50_head_create+0x3cb/0x430
[   15.233667]  nv50_display_create+0x84a/0x13d0
[   15.233667]  nouveau_display_create+0x53a/0x840
[   15.233667]  nouveau_drm_device_init+0x256/0xdf0
[   15.233667]  ? __pfx_nouveau_drm_device_init+0x10/0x10
[   15.233667]  ? pci_enable_device_flags+0x4e/0x1b0
[   15.233667]  nouveau_drm_probe+0x152/0x380
[   15.233667]  ? __pfx_nouveau_drm_probe+0x10/0x10
[   15.233667]  ? preempt_count_sub+0x14/0xd0
[   15.233667]  ? _raw_spin_unlock_irqrestore+0x42/0x70
[   15.233667]  ? __pfx_nouveau_drm_probe+0x10/0x10
[   15.233667]  local_pci_probe+0x7b/0xe0
[   15.233667]  pci_device_probe+0x155/0x350
[   15.233667]  ? kernfs_add_one+0x214/0x270
[   15.233667]  ? __pfx_pci_device_probe+0x10/0x10
[   15.233667]  ? kernfs_create_link+0xc7/0x120
[   15.233667]  ? kernfs_put+0x18/0x40
[   15.233667]  ? sysfs_do_create_link_sd+0x76/0xe0
[   15.233667]  really_probe+0x130/0x400
[   15.233667]  __driver_probe_device+0xc2/0x190
[   15.233667]  driver_probe_device+0x4d/0x180
[   15.233667]  __driver_attach+0xd6/0x280
[   15.233667]  ? __pfx___driver_attach+0x10/0x10
[   15.233667]  bus_for_each_dev+0xc2/0x110
[   15.233667]  ? __pfx_bus_for_each_dev+0x10/0x10
[   15.233667]  bus_add_driver+0x156/0x2a0
[   15.233667]  driver_register+0xa1/0x1d0
[   15.233667]  ? __pfx_nouveau_drm_init+0x10/0x10
[   15.233667]  do_one_initcall+0xbb/0x360
[   15.233667]  ? __pfx_do_one_initcall+0x10/0x10
[   15.233667]  ? __pfx_parse_args+0x10/0x10
[   15.233667]  ? __kmem_cache_alloc_node+0x13d/0x230
[   15.233667]  ? kasan_set_track+0x21/0x30
[   15.233667]  ? rcu_is_watching+0x34/0x60
[   15.233667]  kernel_init_freeable+0x268/0x450
[   15.233667]  ? __pfx_kernel_init+0x10/0x10
[   15.233667]  kernel_init+0x1b/0x1e0
[   15.233667]  ? _raw_spin_unlock_irq+0x2f/0x50
[   15.233667]  ret_from_fork+0x30/0x50
[   15.233667]  ? __pfx_kernel_init+0x10/0x10
[   15.233667]  ret_from_fork_asm+0x1b/0x30
[   15.233667]  </TASK>
[   15.233667] 
[   15.233667] Allocated by task 1:
[   15.233667]  kasan_save_stack+0x1e/0x40
[   15.233667]  kasan_set_track+0x21/0x30
[   15.233667]  __kasan_kmalloc+0x7b/0x90
[   15.233667]  nouveau_connector_create+0x282/0xd20
[   15.233667]  nv50_display_create+0x84a/0x13d0
[   15.233667]  nouveau_display_create+0x53a/0x840
[   15.233667]  nouveau_drm_device_init+0x256/0xdf0
[   15.233667]  nouveau_drm_probe+0x152/0x380
[   15.233667]  local_pci_probe+0x7b/0xe0
[   15.233667]  pci_device_probe+0x155/0x350
[   15.233667]  really_probe+0x130/0x400
[   15.233667]  __driver_probe_device+0xc2/0x190
[   15.233667]  driver_probe_device+0x4d/0x180
[   15.233667]  __driver_attach+0xd6/0x280
[   15.233667]  bus_for_each_dev+0xc2/0x110
[   15.233667]  bus_add_driver+0x156/0x2a0
[   15.233667]  driver_register+0xa1/0x1d0
[   15.233667]  do_one_initcall+0xbb/0x360
[   15.233667]  kernel_init_freeable+0x268/0x450
[   15.233667]  kernel_init+0x1b/0x1e0
[   15.233667]  ret_from_fork+0x30/0x50
[   15.233667]  ret_from_fork_asm+0x1b/0x30
[   15.233667] 
[   15.233667] Freed by task 1:
[   15.233667]  kasan_save_stack+0x1e/0x40
[   15.233667]  kasan_set_track+0x21/0x30
[   15.233667]  kasan_save_free_info+0x27/0x40
[   15.233667]  ____kasan_slab_free+0x147/0x1c0
[   15.233667]  __kmem_cache_free+0x8e/0x200
[   15.233667]  nouveau_connector_create+0xacb/0xd20
[   15.233667]  nv50_display_create+0x84a/0x13d0
[   15.233667]  nouveau_display_create+0x53a/0x840
[   15.233667]  nouveau_drm_device_init+0x256/0xdf0
[   15.233667]  nouveau_drm_probe+0x152/0x380
[   15.233667]  local_pci_probe+0x7b/0xe0
[   15.233667]  pci_device_probe+0x155/0x350
[   15.233667]  really_probe+0x130/0x400
[   15.233667]  __driver_probe_device+0xc2/0x190
[   15.233667]  driver_probe_device+0x4d/0x180
[   15.233667]  __driver_attach+0xd6/0x280
[   15.233667]  bus_for_each_dev+0xc2/0x110
[   15.233667]  bus_add_driver+0x156/0x2a0
[   15.233667]  driver_register+0xa1/0x1d0
[   15.233667]  do_one_initcall+0xbb/0x360
[   15.233667]  kernel_init_freeable+0x268/0x450
[   15.233667]  kernel_init+0x1b/0x1e0
[   15.233667]  ret_from_fork+0x30/0x50
[   15.233667]  ret_from_fork_asm+0x1b/0x30
[   15.233667] 
[   15.233667] The buggy address belongs to the object at ffff8881079ec000
[   15.233667]  which belongs to the cache kmalloc-8k of size 8192
[   15.233667] The buggy address is located 80 bytes inside of
[   15.233667]  freed 8192-byte region [ffff8881079ec000, ffff8881079ee000)
[   15.233667] 
[   15.233667] The buggy address belongs to the physical page:
[   15.233667] page:(____ptrval____) refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1079e8
[   15.233667] head:(____ptrval____) order:3 entire_mapcount:0 nr_pages_mapped:0 pincount:0
[   15.233667] flags: 0x2ffff0000010200(slab|head|node=0|zone=2|lastcpupid=0xffff)
[   15.233667] page_type: 0xffffffff()
[   15.233667] raw: 02ffff0000010200 ffff888100043180 dead000000000122 0000000000000000
[   15.233667] raw: 0000000000000000 0000000080020002 00000001ffffffff 0000000000000000
[   15.233667] page dumped because: kasan: bad access detected
[   15.233667] 
[   15.233667] Memory state around the buggy address:
[   15.233667]  ffff8881079ebf00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[   15.233667]  ffff8881079ebf80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[   15.233667] >ffff8881079ec000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[   15.233667]                                                  ^
[   15.233667]  ffff8881079ec080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[   15.233667]  ffff8881079ec100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
[   15.233667] ==================================================================
[   15.233667] Disabling lock debugging due to kernel taint
[   15.839119] BUG: kernel NULL pointer dereference, address: 0000000000000850
[   15.840026] #PF: supervisor read access in kernel mode
[   15.840026] #PF: error_code(0x0000) - not-present page
[   15.840026] PGD 0 P4D 0 
[   15.840026] Oops: 0000 [#1] PREEMPT SMP KASAN PTI
[   15.840026] CPU: 7 PID: 1 Comm: swapper/0 Tainted: G    B              6.5.0-rc5 #3
[   15.840026] Hardware name: Dell Inc. Precision T3600/0PTTT9, BIOS A13 05/11/2014
[   15.840026] RIP: 0010:nouveau_connector_create+0x1db/0xd20
[   15.840026] Code: 00 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 48 89 df e8 f7 a9 80 ff 48 8b 2b 4c 8d a5 50 08 00 00 4c 89 e7 e8 e5 a9 80 ff <48> 8b 85 50 08 00 00 48 8d 68 f8 49 39 c4 0f 84 58 ff ff ff 48 8d
[   15.840026] RSP: 0000:ffffc9000002f7e0 EFLAGS: 00010282
[   15.840026] RAX: 0000000000000000 RBX: ffff8881079ec000 RCX: ffffffff81c1cd2b
[   15.840026] RDX: 0000000000000000 RSI: 0000000000000008 RDI: 0000000000000850
[   15.840026] RBP: 0000000000000000 R08: ffffffff81c1cc8e R09: 0000000000000000
[   15.840026] R10: ffffffff83759187 R11: 6e696c6261736944 R12: 0000000000000850
[   15.840026] R13: 0000000000000000 R14: ffff888109728000 R15: ffff888109285cb4
[   15.840026] FS:  0000000000000000(0000) GS:ffff8883ba780000(0000) knlGS:0000000000000000
[   15.840026] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   15.840026] CR2: 0000000000000850 CR3: 000000000803a001 CR4: 00000000000606e0
[   15.840026] Call Trace:
[   15.840026]  <TASK>
[   15.840026]  ? __die+0x20/0x70
[   15.840026]  ? page_fault_oops+0x1df/0x5f0
[   15.840026]  ? __pfx_page_fault_oops+0x10/0x10
[   15.840026]  ? __rcu_read_unlock+0x6d/0x2d0
[   15.840026]  ? is_prefetch.constprop.0+0x6a/0x240
[   15.840026]  ? __pfx_is_prefetch.constprop.0+0x10/0x10
[   15.840026]  ? search_bpf_extables+0xe8/0x190
[   15.840026]  ? fixup_exception+0x37/0x4d0
[   15.840026]  ? kernelmode_fixup_or_oops+0x9c/0x150
[   15.840026]  ? exc_page_fault+0x5b/0xd0
[   15.840026]  ? asm_exc_page_fault+0x22/0x30
[   15.840026]  ? nouveau_connector_create+0x13e/0xd20
[   15.840026]  ? nouveau_connector_create+0x1db/0xd20
[   15.840026]  ? nouveau_connector_create+0x1db/0xd20
[   15.840026]  ? __pfx_nouveau_connector_create+0x10/0x10
[   15.840026]  ? nv50_head_create+0x3cb/0x430
[   15.840026]  nv50_display_create+0x84a/0x13d0
[   15.840026]  nouveau_display_create+0x53a/0x840
[   15.840026]  nouveau_drm_device_init+0x256/0xdf0
[   15.840026]  ? __pfx_nouveau_drm_device_init+0x10/0x10
[   15.840026]  ? pci_enable_device_flags+0x4e/0x1b0
[   15.840026]  nouveau_drm_probe+0x152/0x380
[   15.840026]  ? __pfx_nouveau_drm_probe+0x10/0x10
[   15.840026]  ? preempt_count_sub+0x14/0xd0
[   15.840026]  ? _raw_spin_unlock_irqrestore+0x42/0x70
[   15.840026]  ? __pfx_nouveau_drm_probe+0x10/0x10
[   15.840026]  local_pci_probe+0x7b/0xe0
[   15.840026]  pci_device_probe+0x155/0x350
[   15.840026]  ? kernfs_add_one+0x214/0x270
[   15.840026]  ? __pfx_pci_device_probe+0x10/0x10
[   15.840026]  ? kernfs_create_link+0xc7/0x120
[   15.840026]  ? kernfs_put+0x18/0x40
[   15.840026]  ? sysfs_do_create_link_sd+0x76/0xe0
[   15.840026]  really_probe+0x130/0x400
[   15.840026]  __driver_probe_device+0xc2/0x190
[   15.840026]  driver_probe_device+0x4d/0x180
[   15.840026]  __driver_attach+0xd6/0x280
[   15.840026]  ? __pfx___driver_attach+0x10/0x10
[   15.840026]  bus_for_each_dev+0xc2/0x110
[   15.840026]  ? __pfx_bus_for_each_dev+0x10/0x10
[   15.840026]  bus_add_driver+0x156/0x2a0
[   15.840026]  driver_register+0xa1/0x1d0
[   15.840026]  ? __pfx_nouveau_drm_init+0x10/0x10
[   15.840026]  do_one_initcall+0xbb/0x360
[   15.840026]  ? __pfx_do_one_initcall+0x10/0x10
[   15.840026]  ? __pfx_parse_args+0x10/0x10
[   15.840026]  ? __kmem_cache_alloc_node+0x13d/0x230
[   15.840026]  ? kasan_set_track+0x21/0x30
[   15.840026]  ? rcu_is_watching+0x34/0x60
[   15.840026]  kernel_init_freeable+0x268/0x450
[   15.840026]  ? __pfx_kernel_init+0x10/0x10
[   15.840026]  kernel_init+0x1b/0x1e0
[   15.840026]  ? _raw_spin_unlock_irq+0x2f/0x50
[   15.840026]  ret_from_fork+0x30/0x50
[   15.840026]  ? __pfx_kernel_init+0x10/0x10
[   15.840026]  ret_from_fork_asm+0x1b/0x30
[   15.840026]  </TASK>
[   15.840026] Modules linked in:
[   15.840026] CR2: 0000000000000850
[   15.840026] ---[ end trace 0000000000000000 ]---
[   15.840026] RIP: 0010:nouveau_connector_create+0x1db/0xd20
[   15.840026] Code: 00 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 48 89 df e8 f7 a9 80 ff 48 8b 2b 4c 8d a5 50 08 00 00 4c 89 e7 e8 e5 a9 80 ff <48> 8b 85 50 08 00 00 48 8d 68 f8 49 39 c4 0f 84 58 ff ff ff 48 8d
[   15.840026] RSP: 0000:ffffc9000002f7e0 EFLAGS: 00010282
[   15.840026] RAX: 0000000000000000 RBX: ffff8881079ec000 RCX: ffffffff81c1cd2b
[   15.840026] RDX: 0000000000000000 RSI: 0000000000000008 RDI: 0000000000000850
[   15.840026] RBP: 0000000000000000 R08: ffffffff81c1cc8e R09: 0000000000000000
[   15.840026] R10: ffffffff83759187 R11: 6e696c6261736944 R12: 0000000000000850
[   15.840026] R13: 0000000000000000 R14: ffff888109728000 R15: ffff888109285cb4
[   15.840026] FS:  0000000000000000(0000) GS:ffff8883ba780000(0000) knlGS:0000000000000000
[   15.840026] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   15.840026] CR2: 0000000000000850 CR3: 000000000803a001 CR4: 00000000000606e0
[   15.840026] note: swapper/0[1] exited with irqs disabled
[   16.317213] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009
[   16.318167] Kernel Offset: disabled
[   16.318167] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000009 ]---

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

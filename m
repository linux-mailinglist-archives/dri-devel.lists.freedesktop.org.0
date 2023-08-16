Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DEA77E42D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 16:54:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AE110E0E7;
	Wed, 16 Aug 2023 14:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1608D10E0E7;
 Wed, 16 Aug 2023 14:53:55 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 23E8140E0193; 
 Wed, 16 Aug 2023 14:53:53 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
 header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
 by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id H2xnBl_8putw; Wed, 16 Aug 2023 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
 t=1692197630; bh=eATcUugUKmg/0JLDPnk8Wvs/F7ufU1c8fhbjk7WJvtI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BTK7HLiiZf02cDAAdM3jz4GmxhDB0shh60FYymu0Vlw1t8ld2/jJ6GNQ+HS84wBP1
 nZsvabY37js5GdXt4MCn+7AiK7gfQCViow2ueU0NsyPmdeZcq+znNZOmb+b8l+KTOF
 uUk9VgYDxHOkBlH4FYbheDy4m30u8juOd1BfUV2+pHV8HUc9Dkkz7Cs9dSTPZgjGL+
 UcezEFCH2UI8WOQh4pmsXGxiFjoKqO9bXbh0YrI2oXwuaH8RO4ykXYxozPIjqdNCSS
 o1k7up5aK2o3E9wmj+LYTTLe2VOKyNMOrbn1lUcjfmpziRCw4rj9p/8cWregNJjMXn
 DoqCvnNU19ErIrJ/UZrk8YU1/bM10A6808cGXYYtyn8tpRHNZp/6ngw2T6syeX7No+
 cMEOdk6czenYVV73LUx0qrGd+bFU4IyLFNj9p/Q+dQsuk0JwcyOnfLRfdJXmiNy3b0
 FH62Fy3alJfJjqkhSGBI6WoDiUWgwSW+5KB8Z5J1DHpPo9W/DxPZQQXc7ZaKegSGO+
 Nfi09lkBPiP1AaDM0vhYEx4QH1BinPVwbGksInzBXErqRz/hqyedBaVcUluu/fiDHz
 kP/z7U2ipabaDDZc4l42BCzywGm2FY7AunmGHGUs5U28on/PqdXfNH3KLN3x/CIEX+
 p47aHtVtcbL3x11/EvkaJs4w=
Received: from zn.tnic (pd9530d32.dip0.t-ipconnect.de [217.83.13.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id AFD0E40E00F4;
 Wed, 16 Aug 2023 14:53:43 +0000 (UTC)
Date: Wed, 16 Aug 2023 16:53:38 +0200
From: Borislav Petkov <bp@alien8.de>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: fix use-after-free in error handling
 of nouveau_connector_create
Message-ID: <20230816145338.GIZNzi8o3d9x9bcPzX@fat_crate.local>
References: <20230814144933.3956959-1-kherbst@redhat.com>
 <20230816093015.GDZNyXJ28y9uspb4Mr@fat_crate.local>
 <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CACO55tu8ab-rxCzxFXbUh4Z=W9E-1f8sH6BVd=P+16dQ9PQNjg@mail.gmail.com>
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

On Wed, Aug 16, 2023 at 11:51:50AM +0200, Karol Herbst wrote:
> Mind sharing your kernel logs with that patch applied? I suspect your
> system boots up but you might just not have the connector available or
> something? It could be that you have one of those GPUs affected by the
> original change and then we'd have to figure out what to do with that.

Close. With your patch applied, the machine is up and I can log in and
use it. However, the output on the connected monitor stops after...

[    6.815167] ACPI: \_PR_.CP05: Found 4 idle states
[    6.825438] ACPI: \_PR_.CP06: Found 4 idle states
[    6.835661] ACPI: \_PR_.CP07: Found 4 idle states
[    7.280093] Freeing initrd memory: 8328K
[    7.601986] tsc: Refined TSC clocksource calibration: 3591.346 MHz
[    7.608360] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x33c46403b59, max_idle_ns: 440795293818 ns
[    7.620254] clocksource: Switched to clocksource tsc
[    8.337724] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    8.350553] 00:05: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
[    8.375311] serial 0000:00:16.3: enabling device (0000 -> 0003)
[    8.403681] 0000:00:16.3: ttyS1 at I/O 0xf0a0 (irq = 17, base_baud = 115200) is a 16550A
[    8.424951] Linux agpgart interface v0.103
[    8.432456] ACPI: bus type drm_connector registered

... this line here above. It is the last one output. What you see here
below what I'm catching from serial.

[    8.456734] Console: switching to colour dummy device 80x25
[    8.464414] nouveau 0000:03:00.0: vgaarb: deactivate vga console
[    8.473063] nouveau 0000:03:00.0: NVIDIA GT218 (0a8c00b1)
[    8.594096] nouveau 0000:03:00.0: bios: version 70.18.83.00.08
[    8.607906] nouveau 0000:03:00.0: fb: 512 MiB DDR3
[    8.926721] nouveau 0000:03:00.0: DRM: VRAM: 512 MiB
[    8.931763] nouveau 0000:03:00.0: DRM: GART: 1048576 MiB
[    8.937156] nouveau 0000:03:00.0: DRM: TMDS table version 2.0
[    8.942969] nouveau 0000:03:00.0: DRM: DCB version 4.0
[    8.948173] nouveau 0000:03:00.0: DRM: DCB outp 00: 02000360 00000000
[    8.954696] nouveau 0000:03:00.0: DRM: DCB outp 01: 02000362 00020010
[    8.961211] nouveau 0000:03:00.0: DRM: DCB outp 02: 028003a6 0f220010
[    8.967739] nouveau 0000:03:00.0: DRM: DCB outp 03: 01011380 00000000
[    8.974261] nouveau 0000:03:00.0: DRM: DCB outp 04: 08011382 00020010
[    8.980769] nouveau 0000:03:00.0: DRM: DCB outp 05: 088113c6 0f220010
[    8.987293] nouveau 0000:03:00.0: DRM: DCB conn 00: 00101064
[    8.993015] nouveau 0000:03:00.0: DRM: DCB conn 01: 00202165
[    9.005724] nouveau 0000:03:00.0: DRM: MM: using COPY for buffer copies
[    9.023889] [drm] Initialized nouveau 1.3.1 20120801 for 0000:03:00.0 on minor 0
[    9.032044] nouveau 0000:03:00.0: [drm] Cannot find any crtc or sizes
[    9.162909] megasas: 07.725.01.00-rc1
[    9.167537] st: Version 20160209, fixed bufsize 32768, s/g segs 256
[    9.176058] ahci 0000:00:1f.2: version 3.0
[    9.194078] ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 6 ports 6 Gbps 0x3 impl SATA mode
[    9.202487] ahci 0000:00:1f.2: flags: 64bit ncq sntf pm led clo pio slum part ems apst 
[    9.243154] scsi host0: ahci
[    9.252090] scsi host1: ahci
[    9.260389] scsi host2: ahci
[    9.268061] scsi host3: ahci
[    9.273542] scsi host4: ahci
[    9.279071] scsi host5: ahci
...

and so on until full boot.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

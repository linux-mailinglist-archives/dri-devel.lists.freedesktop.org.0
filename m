Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC23289FCC
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 12:03:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12F46EE9E;
	Sat, 10 Oct 2020 10:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 541 seconds by postgrey-1.36 at gabe;
 Fri, 09 Oct 2020 21:35:27 UTC
Received: from hosting.gsystem.sk (hosting.gsystem.sk [212.5.213.30])
 by gabe.freedesktop.org (Postfix) with ESMTP id 69D876EE21;
 Fri,  9 Oct 2020 21:35:27 +0000 (UTC)
Received: from [192.168.0.2] (188-167-68-178.dynamic.chello.sk
 [188.167.68.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by hosting.gsystem.sk (Postfix) with ESMTPSA id 2216C7A01AC;
 Fri,  9 Oct 2020 23:26:23 +0200 (CEST)
From: Ondrej Zary <linux@zary.sk>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: nouveau broken on Riva TNT2 in 5.9.0-rc8: GPU not supported on
 big-endian
Date: Fri, 9 Oct 2020 23:26:20 +0200
User-Agent: KMail/1.9.10
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <202010092326.20482.linux@zary.sk>
X-Mailman-Approved-At: Sat, 10 Oct 2020 10:02:57 +0000
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,
I'm testing 5.9.0-rc8 and found that Riva TNT2 stopped working:
[    0.000000] Linux version 5.9.0-rc8+ (zary@gsql) (gcc (Debian 8.3.0-6) 8.3.0, GNU ld (GNU Binutils for Debian) 2.31.1) #326 SMP Fri Oct 9 22:31:40 CEST 2020
...
[   14.771464] nouveau 0000:01:00.0: GPU not supported on big-endian
[   14.771782] nouveau: probe of 0000:01:00.0 failed with error -38

big-endian? WTF? The machine is x86.

It works fine with Debian 5.7 kernel (5.7.10-1~bpo10+1):
[    0.000000] Linux version 5.7.0-0.bpo.2-686 (debian-kernel@lists.debian.org) (gcc version 8.3.0 (Debian 8.3.0-6), GNU ld (GNU Binutils for Debian) 2.31.1) #1 SMP Debian 5.7.10-1~bpo10+1 (2020-07-30)
...
[   23.266196] nouveau 0000:01:00.0: NVIDIA NV05 (20154000)
[   23.288582] nouveau 0000:01:00.0: bios: version 02.05.20.02.00
[   23.288869] nouveau 0000:01:00.0: bios: DCB table not found
[   23.289595] nouveau 0000:01:00.0: bios: DCB table not found
[   23.289956] nouveau 0000:01:00.0: bios: DCB table not found
[   23.290015] nouveau 0000:01:00.0: bios: DCB table not found
[   23.290215] agpgart-intel 0000:00:00.0: AGP 3.0 bridge
[   23.290287] agpgart-intel 0000:00:00.0: bridge is in legacy mode, falling back to 2.x
[   23.290351] agpgart-intel 0000:00:00.0: putting AGP V2 device into 4x mode
[   23.290430] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
[   23.290565] agpgart-intel 0000:00:00.0: AGP 3.0 bridge
[   23.290627] agpgart-intel 0000:00:00.0: bridge is in legacy mode, falling back to 2.x
[   23.290690] agpgart-intel 0000:00:00.0: putting AGP V2 device into 4x mode
[   23.290768] nouveau 0000:01:00.0: putting AGP V2 device into 4x mode
[   23.290830] nouveau 0000:01:00.0: tmr: unknown input clock freq
[   23.293026] nouveau 0000:01:00.0: fb: 32 MiB SDRAM
[   23.301269] [TTM] Zone  kernel: Available graphics memory: 382728 KiB
[   23.301327] [TTM] Initializing pool allocator
[   23.301414] nouveau 0000:01:00.0: DRM: VRAM: 31 MiB
[   23.301465] nouveau 0000:01:00.0: DRM: GART: 128 MiB
[   23.301518] nouveau 0000:01:00.0: DRM: BMP version 5.6
[   23.301570] nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
[   23.303594] nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer copies
[   23.303719] nouveau 0000:01:00.0: bios: DCB table not found
[   23.304904] nouveau 0000:01:00.0: DRM: Saving VGA fonts
[   23.349089] nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
[   23.349681] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   23.383066] nouveau 0000:01:00.0: DRM: allocated 1280x1024 fb: 0x4000, bo b10d2f17
[   23.413903] fbcon: nouveaudrmfb (fb0) is primary device
[   23.569851] Console: switching to colour frame buffer device 160x64
[   23.571050] nouveau 0000:01:00.0: fb0: nouveaudrmfb frame buffer device


-- 
Ondrej Zary
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B512319E7
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 08:58:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D932B6E455;
	Wed, 29 Jul 2020 06:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 411 seconds by postgrey-1.36 at gabe;
 Wed, 29 Jul 2020 05:10:55 UTC
Received: from mta01.start.ca (mta01.start.ca [162.250.196.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7B56E43B
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 05:10:55 +0000 (UTC)
Received: from mta01.start.ca (localhost [127.0.0.1])
 by mta01.start.ca (Postfix) with ESMTP id AFC8541E7E;
 Wed, 29 Jul 2020 01:04:03 -0400 (EDT)
Received: from localhost (dhcp-24-53-240-163.cable.user.start.ca
 [24.53.240.163])
 by mta01.start.ca (Postfix) with ESMTPS id 747A141E12;
 Wed, 29 Jul 2020 01:04:03 -0400 (EDT)
Date: Wed, 29 Jul 2020 01:04:03 -0400
From: Nick Bowler <nbowler@draconx.ca>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: PROBLEM: 5.8-rc7 no video output with nouveau on NV36 (regression)
Message-ID: <20200729050403.jwbgdmvmc3ajdnem@atlas.draconx.ca>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: NeoMutt/20180716
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 29 Jul 2020 06:58:35 +0000
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
Cc: James Jones <jajones@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

After installing Linux 5.8-rc7 I seem to get no video output on my
NV36 card once the nouveau module is loaded.  The display (connected
to the digital output) simply reports "No Signal".

I bisected to the following commit, and reverting this commit on
top of 5.8-rc7 appears to correct the issue.

  fa4f4c213f5f7807360c41f2501a3031a9940f3a is the first bad commit
  commit fa4f4c213f5f7807360c41f2501a3031a9940f3a
  Author: James Jones <jajones@nvidia.com>
  Date:   Mon Feb 10 15:15:55 2020 -0800
  
      drm/nouveau/kms: Support NVIDIA format modifiers
      
      Allow setting the block layout of a nouveau FB
      object using DRM format modifiers.  When
      specified, the format modifier block layout and
      kind overrides the GEM buffer's implicit layout
      and kind.  The specified format modifier is
      validated against the list of modifiers supported
      by the target display hardware.
      
      v2: Used Tesla family instead of NV50 chipset compare
      v4: Do not cache kind, tile_mode in nouveau_framebuffer
      v5: Resolved against nouveau_framebuffer cleanup
      
      Signed-off-by: James Jones <jajones@nvidia.com>
      Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
  
   drivers/gpu/drm/nouveau/dispnv50/wndw.c   | 20 ++++---
   drivers/gpu/drm/nouveau/nouveau_display.c | 89 ++++++++++++++++++++++++++++++-
   drivers/gpu/drm/nouveau/nouveau_display.h |  4 ++
   3 files changed, 104 insertions(+), 9 deletions(-)

The dmesg output from loading the driver is identical except several
lines are missing in the non-working case, which I have marked with
"XXX" below:

      [  168.222926] PCI Interrupt Link [LNKE] enabled at IRQ 16
      [  168.223199] nouveau 0000:01:00.0: vgaarb: deactivate vga console
      [  168.224379] Console: switching to colour dummy device 80x25
      [  168.224612] nouveau 0000:01:00.0: NVIDIA NV36 (436200a1)
      [  168.324779] nouveau 0000:01:00.0: bios: version 04.36.20.21.00
      [  168.325646] agpgart-amd64 0000:00:00.0: AGP 3.0 bridge
      [  168.325657] agpgart: modprobe tried to set rate=x12. Setting to AGP3 x8 mode.
      [  168.325662] agpgart-amd64 0000:00:00.0: putting AGP V3 device into 8x mode
      [  168.325679] nouveau 0000:01:00.0: putting AGP V3 device into 8x mode
      [  168.325908] agpgart-amd64 0000:00:00.0: AGP 3.0 bridge
      [  168.325914] agpgart: modprobe tried to set rate=x12. Setting to AGP3 x8 mode.
      [  168.325918] agpgart-amd64 0000:00:00.0: putting AGP V3 device into 8x mode
      [  168.325933] nouveau 0000:01:00.0: putting AGP V3 device into 8x mode
      [  168.325990] nouveau 0000:01:00.0: tmr: unknown input clock freq
      [  168.326732] nouveau 0000:01:00.0: fb: 256 MiB DDR1
      [  168.328174] [TTM] Zone  kernel: Available graphics memory: 1022540 KiB
      [  168.328175] [TTM] Initializing pool allocator
      [  168.328181] [TTM] Initializing DMA pool allocator
      [  168.328200] nouveau 0000:01:00.0: DRM: VRAM: 255 MiB
      [  168.328201] nouveau 0000:01:00.0: DRM: GART: 128 MiB
      [  168.328204] nouveau 0000:01:00.0: DRM: BMP version 5.40
      [  168.328208] nouveau 0000:01:00.0: DRM: DCB version 2.2
      [  168.328210] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000300 00009c40
      [  168.328214] nouveau 0000:01:00.0: DRM: DCB outp 01: 02010310 00009c40
      [  168.328215] nouveau 0000:01:00.0: DRM: DCB outp 02: 04000302 00000000
      [  168.328217] nouveau 0000:01:00.0: DRM: DCB outp 03: 02020321 00000303
      [  168.328495] nouveau 0000:01:00.0: DRM: Loading NV17 power sequencing microcode
      [  168.329691] nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer copies
      [  168.330258] nouveau 0000:01:00.0: DRM: Saving VGA fonts
      [  168.389460] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
      [  168.391250] nouveau 0000:01:00.0: DRM: Setting dpms mode 3 on TV encoder (output 3)
  XXX [  168.487647] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x9000, bo 00000000ff426de1
  XXX [  168.491835] fbcon: nouveaudrmfb (fb0) is primary device
  XXX [  168.608512] nouveau 0000:01:00.0: DRM: 0xE4FB: Parsing digital output script table
  XXX [  168.662451] Console: switching to colour frame buffer device 240x67
  XXX [  168.755987] nouveau 0000:01:00.0: fb0: nouveaudrmfb frame buffer device
      [  168.763736] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0

Let me know if you need any more info.

Cheers,
  Nick
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

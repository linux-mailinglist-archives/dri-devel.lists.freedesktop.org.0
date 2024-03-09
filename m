Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9288772C1
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 19:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F171122BD;
	Sat,  9 Mar 2024 18:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Na3ZzPEv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9301122AD
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 18:15:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 377DBCE01C1;
 Sat,  9 Mar 2024 18:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69FBFC433F1;
 Sat,  9 Mar 2024 18:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710008148;
 bh=1NJl9mXnMzZzopksxxgGge5qO9JJgmiilKhwb7g3eig=;
 h=From:Subject:Date:To:Cc:Reply-To:From;
 b=Na3ZzPEvwa4O0WZSjA59AlWLXEEHJuuu/TN5NUSg2XkLqLjOOH1lfnKXhKuG9JHnr
 DHQ+iOufkVH64hKVRrgKgDsWd1bYThbp2TQbYpYr/nF7tlLynHuze5Q5Pt/lqEbPYB
 ebQKKOGPpIErBx1zsEPKYyUE6/SRZ/c3zY9+V2Csa0aOpMGax5+bUpB/DTXvjdNlDF
 XDL7fEDX5/cxFzCa5qCHygMi1Y+2TO7S0ao47fhm+qEpm9TNVj24+JyYkJbg9BOREI
 UJ8RKsmNAdD1iliihcU6w3H7O/1TYefeB8GWNMWP0t8WwKE9l2lT6tikQsRJPI5s7p
 PM/Gr1ZaMo7+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 44CCAC54E41;
 Sat,  9 Mar 2024 18:15:48 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Subject: [PATCH v2 00/28] sparc32: sunset sun4m and sun4d
Date: Sat, 09 Mar 2024 19:15:21 +0100
Message-Id: <20240309-sunset-v2-0-f09912574d2c@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADmn7GUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxMDYwNL3eLSvOLUEl1jE2PzpFQzk+QU0zQloOKCotS0zAqwQdGxtbUAZB7
 W9lgAAAA=
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
Cc: Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Kjetil Oftedal <oftedal@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, sparclinux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-sound@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710008145; l=7406;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=1NJl9mXnMzZzopksxxgGge5qO9JJgmiilKhwb7g3eig=; =?utf-8?q?b=3DrEflVNXGOMo+?=
 =?utf-8?q?Li+bzuhPlRnIo+TvZn/G8VUk8BZAuXBrwWeyHqKFp6zDu3+tKXSZaIvWLoW3DYEN?=
 4CHZt4V+BNTo2GApis+OJtQSsES1RZiAaUB9Az+S5S60wpS1LV47
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
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
Reply-To: sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the second attempt to sunset sun4m and sun4d.
See [1] for the inital attempt.

The sun4m and sun4d parts of the kernel have seen no real interest
for several years now. Last time a few people surfaced, but it was
either due to a personal project or for nostalgic reasons.
It is time to let go and drop the parts of sparc32 that in reality
are not in use.

LEON from Frontgrade Gaisler is the only real user of sparc32,
and this patchset reduces sparc32 to what is required by LEON.

The defconfig is first adapted to the one used by Gaisler.
Then the patches removes sun4m and sun4d specific
implementations such as small drivers, SMP support, IRQ suppor etc.

Removing sun4m and sun4d support allowed removal of the run time
patching of the code as well as a lot of assembler code.
The result is a much cleaner assembler code that is easier to
understand and thus maintain and extend.

Changes in v2:
  - Rebased on top of Andreas' for-next branch
  - Collected ack's
  - Added patch to remove cpuid patching (Andreas)
  - Run-time testing using qemu (Andreas, Mark Cave-Ayland)

	Sam

[1]: https://lore.kernel.org/all/20201218184347.2180772-1-sam@ravnborg.org/

---
Sam Ravnborg (28):
      sparc32: Update defconfig to LEON SMP
      sparc32: Drop sun4m/sun4d support from head_32.S
      sparc32: Drop floppy support
      sparc32: Drop sun4m specific led driver
      sparc32: Drop sun specific power management drivers
      sparc32: Drop auxio support
      sparc32: Drop run-time patching of ipi trap
      sparc32: Drop patching of interrupt vector
      sparc32: Drop sun4m/sun4d specific irq handling
      sparc32: Drop sun4d/sun4m smp support
      sparc32: Drop pcic support
      sparc32: Drop mbus support
      sparc32: Drop unused function __get_{phys,iospace}
      sparc32: Drop unused mmu models
      sparc32: Drop check for sparc_model
      sparc32: Drop use of sparc_config
      sparc32: Drop run-time cpuid patching
      sparc32: Drop run-time patching of ASI instructions
      sparc32: Drop support for 7 register windows
      sparc32: Drop additional sun4d bits
      sparc32: Drop unused prom ranges support
      sparc32: Drop unused sbus iommu support
      sparc32: Drop sun4m irq support
      sparc32: Drop unused trampoline code
      sparc32: Drop config SPARC_LEON
      sparc32: Drop sbus support
      sbus: char: Drop now unused uctrl driver
      fbdev/p9100: Drop now unused driver p9100

 arch/sparc/Kconfig                    |  54 +--
 arch/sparc/configs/sparc32_defconfig  | 170 +++----
 arch/sparc/include/asm/asmmacro.h     |  22 -
 arch/sparc/include/asm/auxio_32.h     |  73 +--
 arch/sparc/include/asm/cpu_type.h     |  18 -
 arch/sparc/include/asm/elf_32.h       |   2 -
 arch/sparc/include/asm/fb.h           |   8 +-
 arch/sparc/include/asm/floppy.h       |   2 -
 arch/sparc/include/asm/floppy_32.h    | 393 ----------------
 arch/sparc/include/asm/io-unit.h      |  59 ---
 arch/sparc/include/asm/io_32.h        |  83 ----
 arch/sparc/include/asm/iommu.h        |   2 -
 arch/sparc/include/asm/iommu_32.h     | 122 -----
 arch/sparc/include/asm/irq_32.h       |   2 -
 arch/sparc/include/asm/mbus.h         |  97 ----
 arch/sparc/include/asm/mxcc.h         | 138 ------
 arch/sparc/include/asm/obio.h         | 226 ---------
 arch/sparc/include/asm/oplib_32.h     |  11 -
 arch/sparc/include/asm/pcic.h         | 130 ------
 arch/sparc/include/asm/pgtable_32.h   |  24 -
 arch/sparc/include/asm/pgtsrmmu.h     |  33 +-
 arch/sparc/include/asm/ross.h         | 192 --------
 arch/sparc/include/asm/sbi.h          | 116 -----
 arch/sparc/include/asm/sections.h     |   3 -
 arch/sparc/include/asm/setup.h        |  12 -
 arch/sparc/include/asm/swift.h        | 107 -----
 arch/sparc/include/asm/switch_to_32.h |   1 -
 arch/sparc/include/asm/timer_32.h     |   1 +
 arch/sparc/include/asm/tsunami.h      |  65 ---
 arch/sparc/include/asm/turbosparc.h   | 126 -----
 arch/sparc/include/asm/viking.h       | 255 -----------
 arch/sparc/include/asm/winmacro.h     |  12 -
 arch/sparc/kernel/Makefile            |   8 +-
 arch/sparc/kernel/apc.c               | 196 --------
 arch/sparc/kernel/auxio_32.c          | 139 ------
 arch/sparc/kernel/cpu.c               |   1 -
 arch/sparc/kernel/devices.c           |  10 +-
 arch/sparc/kernel/entry.S             | 426 +----------------
 arch/sparc/kernel/etrap_32.S          |  50 +-
 arch/sparc/kernel/head_32.S           | 255 +----------
 arch/sparc/kernel/ioport.c            |  55 +--
 arch/sparc/kernel/irq.h               |  84 +---
 arch/sparc/kernel/irq_32.c            | 133 +-----
 arch/sparc/kernel/kernel.h            |  53 +--
 arch/sparc/kernel/led.c               | 146 ------
 arch/sparc/kernel/leon_kernel.c       |  53 +--
 arch/sparc/kernel/leon_pmc.c          |  16 +-
 arch/sparc/kernel/leon_smp.c          |   3 -
 arch/sparc/kernel/of_device_32.c      |  18 +-
 arch/sparc/kernel/pcic.c              | 840 ----------------------------------
 arch/sparc/kernel/pmc.c               | 100 ----
 arch/sparc/kernel/process_32.c        |  10 -
 arch/sparc/kernel/rtrap_32.S          |  73 ++-
 arch/sparc/kernel/setup_32.c          | 109 -----
 arch/sparc/kernel/smp_32.c            | 102 +----
 arch/sparc/kernel/sun4d_irq.c         | 519 ---------------------
 arch/sparc/kernel/sun4d_smp.c         | 415 -----------------
 arch/sparc/kernel/sun4m_irq.c         | 478 -------------------
 arch/sparc/kernel/sun4m_smp.c         | 275 -----------
 arch/sparc/kernel/time_32.c           |  68 +--
 arch/sparc/kernel/trampoline_32.S     | 127 +----
 arch/sparc/kernel/ttable_32.S         |   9 +-
 arch/sparc/kernel/vmlinux.lds.S       |   5 -
 arch/sparc/kernel/wof.S               |  61 +--
 arch/sparc/kernel/wuf.S               |  41 +-
 arch/sparc/mm/Makefile                |   4 +-
 arch/sparc/mm/hypersparc.S            | 414 -----------------
 arch/sparc/mm/io-unit.c               | 286 ------------
 arch/sparc/mm/iommu.c                 | 455 ------------------
 arch/sparc/mm/mm_32.h                 |   4 -
 arch/sparc/mm/srmmu.c                 | 836 +--------------------------------
 arch/sparc/mm/srmmu_access.S          |  83 ----
 arch/sparc/mm/swift.S                 | 256 -----------
 arch/sparc/mm/tsunami.S               | 132 ------
 arch/sparc/mm/viking.S                | 284 ------------
 arch/sparc/prom/Makefile              |   1 -
 arch/sparc/prom/init_32.c             |   2 -
 arch/sparc/prom/misc_32.c             |   2 -
 arch/sparc/prom/ranges.c              | 114 -----
 drivers/sbus/char/Kconfig             |   8 -
 drivers/sbus/char/Makefile            |   1 -
 drivers/sbus/char/uctrl.c             | 434 ------------------
 drivers/usb/host/Kconfig              |   2 +-
 drivers/usb/host/ehci-hcd.c           |   4 +-
 drivers/usb/host/uhci-hcd.c           |   2 +-
 drivers/video/fbdev/Kconfig           |  10 +-
 drivers/video/fbdev/Makefile          |   1 -
 drivers/video/fbdev/p9100.c           | 372 ---------------
 sound/sparc/Kconfig                   |   1 +
 89 files changed, 316 insertions(+), 10829 deletions(-)
---
base-commit: 84b76d05828a1909e20d0f66553b876b801f98c8
change-id: 20240309-sunset-3437be64cd5f

Best regards,
-- 
Sam Ravnborg <sam@ravnborg.org>


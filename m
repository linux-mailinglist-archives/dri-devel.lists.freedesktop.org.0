Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F0C2D0C50
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 09:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D245A6E598;
	Mon,  7 Dec 2020 08:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 478 seconds by postgrey-1.36 at gabe;
 Fri, 04 Dec 2020 17:12:06 UTC
Received: from latitanza.investici.org (latitanza.investici.org
 [IPv6:2001:888:2000:56::19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A6F6E197
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 17:12:06 +0000 (UTC)
Received: from mx3.investici.org (unknown [127.0.0.1])
 by latitanza.investici.org (Postfix) with ESMTP id 4CnfF12X1nz8shk;
 Fri,  4 Dec 2020 17:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=privacyrequired.com;
 s=stigmate; t=1607101445;
 bh=CNSPo3rU73iLufUhzAAlkyJdrqDxV3HykhrbciRVVqg=;
 h=From:To:Cc:Subject:Date:From;
 b=CAj2903IlbaunC80bM+z7sehEdvvySRvMXF2B7QVSeGl9c1o2+R49o1Johhg6BSQ4
 Q4EMyEP3bIuGgoqirMK1uT98XPrJ1OTptjksAJf1V5Duw6RhXyRn+MKAiMRbwunKkr
 vE228J0uaZtyVw5ECCzsQr3hgtGk8lvECyg5M/Pg=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234])
 (Authenticated sender: laniel_francis@privacyrequired.com) by localhost
 (Postfix) with ESMTPSA id 4CnfDy1SRgz8sfb; 
 Fri,  4 Dec 2020 17:04:02 +0000 (UTC)
From: laniel_francis@privacyrequired.com
To: Russell King <linux@armlinux.org.uk>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Ard Biesheuvel <ardb@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
 dm-devel@redhat.com, Bin Liu <b-liu@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jessica Yu <jeyu@kernel.org>
Subject: [RFC PATCH v1 00/12] Replace strstarts() by str_has_prefix()
Date: Fri,  4 Dec 2020 18:03:06 +0100
Message-Id: <20201204170319.20383-1-laniel_francis@privacyrequired.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 07 Dec 2020 08:56:49 +0000
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
Cc: linux-efi@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-crypto@vger.kernel.org,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Francis Laniel <laniel_francis@privacyrequired.com>

Hi.


First, I hope you are fine and the same for your relatives.

In this patch set, I replaced all calls to strstarts() by calls to
str_has_prefix().
Indeed, the kernel has two functions to test if a string begins with an other:
1. strstarts() which returns a bool, so 1 if the string begins with the prefix,
0 otherwise.
2. str_has_prefix() which returns the length of the prefix or 0.

str_has_prefix() was introduced later than strstarts(), in commit 495d714ad140
which also stated that str_has_prefix() should replace strstarts().
This is what this patch set does.

Concerning the patches, the modifications cover different areas of the kernel.
I compiled all of them and they compile smoothly.
Unfortunately, I did not test all of them, so here are the status of the patches
regarding test:
1. Tested with qemu-system-arm using insmod.
2. I do not have access to a bcm47xx MIPS CPU an qemu-system-mips does not
emulate this board.
3. Tested with qemu-system-x86_64 calling
crypto_alloc_skcipher("essiv(authenc(hmac(sha256),cbc(aes)),sha256)", 0, 0)
through LKDTM.
4. Tested with qemu-system-x86_64 using crypsetup.
5. I do not have access to a renesas board and I lack some context to test it
with qemu-system-arm.
6. I do not have access to an OMAP board and I lack some context to test it with
qemu-system-arm.
7. I did not find how to boot from the EFI_STUB with qemu. If you know how to
do, I would be happy to try running this code.
8. I ran qemu-system-x86_64 with a floppy disk attached but impossible to go
through this module code...
9. I do not have access to a bcm63xx MIPS CPU an qemu-system-mips does not
emulate this board.
10. Tested with qemu-system-x86_64 using insmod.
11. I do not have access to an AM335x or DA8xx platforms and I lack some context
to test it with qemu-system-arm.

If you see a way to improve the patches or if I did something wrong with the
mail do not hesitate to ask.


Best regards.

Francis Laniel (12):
  arm: Replace strstarts() by str_has_prefix().
  mips: Replace strstarts() by str_has_prefix().
  crypto: Replace strstarts() by str_has_prefix().
  device-mapper: Replace strstarts() by str_has_prefix().
  renesas: Replace strstarts() by str_has_prefix().
  omap: Replace strstarts() by str_has_prefix().
  efi: Replace strstarts() by str_has_prefix().
  ide: Replace strstarts() by str_has_prefix().
  mips: Replace strstarts() by str_has_prefix().
  module: Replace strstarts() by str_has_prefix().
  musb: Replace strstarts() by str_has_prefix().
  string.h: Remove strstarts().

 arch/arm/kernel/module.c                      | 12 +++++------
 arch/mips/bcm47xx/board.c                     |  4 ++--
 arch/mips/bcm63xx/boards/board_bcm963xx.c     |  2 +-
 crypto/essiv.c                                |  2 +-
 .../firmware/efi/libstub/efi-stub-helper.c    |  2 +-
 drivers/firmware/efi/libstub/gop.c            | 10 +++++-----
 drivers/gpu/drm/omapdrm/dss/base.c            |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  2 +-
 drivers/ide/ide-floppy.c                      |  4 ++--
 drivers/md/dm-crypt.c                         |  4 ++--
 drivers/usb/musb/musb_cppi41.c                |  4 ++--
 drivers/usb/musb/musb_debugfs.c               | 20 +++++++++----------
 include/linux/string.h                        | 10 ----------
 kernel/module.c                               |  6 +++---
 14 files changed, 37 insertions(+), 47 deletions(-)

-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

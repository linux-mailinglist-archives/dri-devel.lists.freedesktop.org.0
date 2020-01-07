Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C3D132B7F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 17:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC87F6E10F;
	Tue,  7 Jan 2020 16:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAE46E10F;
 Tue,  7 Jan 2020 16:53:29 +0000 (UTC)
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B395D2073D;
 Tue,  7 Jan 2020 16:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578416009;
 bh=5pGZzG2R2Yg9BvXiJJcmzkQkuLAOfS9PEHpiBXb0Uls=;
 h=From:To:Cc:Subject:Date:From;
 b=Q+mZvp8DRBQ+NGLFMRHq+ToaCPgY0sfmDNR9VpdaiZ9T2V/2nT/SeANXkK/wLMDoP
 zenjraQPO9M07VwPEmNNuyRUDTXxaFInE+OA1UUiQvrcd9MJ0C7xFDpFQN49dMy/gI
 GDlqwuMx3bvmjp+6UgH+xyziWuKaIO8OxKhrqNsk=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jiri Slaby <jirislaby@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Dave Jiang <dave.jiang@intel.com>,
 Jon Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-ntb@googlegroups.com, virtualization@lists.linux-foundation.org,
 linux-arch@vger.kernel.org
Subject: [RFT 00/13] iomap: Constify ioreadX() iomem argument
Date: Tue,  7 Jan 2020 17:52:57 +0100
Message-Id: <1578415992-24054-1-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

The ioread8/16/32() and others have inconsistent interface among the
architectures: some taking address as const, some not.

It seems there is nothing really stopping all of them to take
pointer to const.

Patchset was really tested on all affected architectures.
Build testing is in progress - I hope auto-builders will point any issues.


Todo
====
Convert also string versions (ioread16_rep() etc) if this aproach looks OK.


Merging
=======
The first 5 patches - iomap, alpha, sh, parisc and powerpc - should probably go
via one tree, or even squashed into one.

All other can go separately after these get merged.

Best regards,
Krzysztof


Krzysztof Kozlowski (13):
  iomap: Constify ioreadX() iomem argument (as in generic
    implementation)
  alpha: Constify ioreadX() iomem argument (as in generic
    implementation)
  sh: Constify ioreadX() iomem argument (as in generic implementation)
  parisc: Constify ioreadX() iomem argument (as in generic
    implementation)
  powerpc: Constify ioreadX() iomem argument (as in generic
    implementation)
  arc: Constify ioreadX() iomem argument (as in generic implementation)
  drm/mgag200: Constify ioreadX() iomem argument (as in generic
    implementation)
  drm/nouveau: Constify ioreadX() iomem argument (as in generic
    implementation)
  media: fsl-viu: Constify ioreadX() iomem argument (as in generic
    implementation)
  net: wireless: ath5k: Constify ioreadX() iomem argument (as in generic
    implementation)
  net: wireless: rtl818x: Constify ioreadX() iomem argument (as in
    generic implementation)
  ntb: intel: Constify ioreadX() iomem argument (as in generic
    implementation)
  virtio: pci: Constify ioreadX() iomem argument (as in generic
    implementation)

 arch/alpha/include/asm/core_apecs.h                |  6 +--
 arch/alpha/include/asm/core_cia.h                  |  6 +--
 arch/alpha/include/asm/core_lca.h                  |  6 +--
 arch/alpha/include/asm/core_marvel.h               |  4 +-
 arch/alpha/include/asm/core_mcpcia.h               |  6 +--
 arch/alpha/include/asm/core_t2.h                   |  2 +-
 arch/alpha/include/asm/io.h                        | 12 +++---
 arch/alpha/include/asm/io_trivial.h                | 16 ++++----
 arch/alpha/include/asm/jensen.h                    |  2 +-
 arch/alpha/include/asm/machvec.h                   |  6 +--
 arch/alpha/kernel/core_marvel.c                    |  2 +-
 arch/alpha/kernel/io.c                             |  6 +--
 arch/arc/plat-axs10x/axs10x.c                      |  4 +-
 arch/parisc/include/asm/io.h                       |  4 +-
 arch/parisc/lib/iomap.c                            | 48 +++++++++++-----------
 arch/powerpc/kernel/iomap.c                        | 22 +++++-----
 arch/sh/kernel/iomap.c                             | 10 ++---
 drivers/gpu/drm/mgag200/mgag200_drv.h              |  4 +-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |  2 +-
 drivers/media/platform/fsl-viu.c                   |  2 +-
 drivers/net/wireless/ath/ath5k/ahb.c               | 10 ++---
 .../net/wireless/realtek/rtl818x/rtl8180/rtl8180.h |  6 +--
 drivers/ntb/hw/intel/ntb_hw_gen1.c                 |  2 +-
 drivers/ntb/hw/intel/ntb_hw_gen3.h                 |  2 +-
 drivers/ntb/hw/intel/ntb_hw_intel.h                |  2 +-
 drivers/virtio/virtio_pci_modern.c                 |  6 +--
 include/asm-generic/iomap.h                        | 22 +++++-----
 include/linux/io-64-nonatomic-hi-lo.h              |  4 +-
 include/linux/io-64-nonatomic-lo-hi.h              |  4 +-
 lib/iomap.c                                        | 18 ++++----
 30 files changed, 123 insertions(+), 123 deletions(-)

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

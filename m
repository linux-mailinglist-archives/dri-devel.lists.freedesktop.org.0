Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5339CF6F2
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 22:22:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA8710E3D3;
	Fri, 15 Nov 2024 21:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="qSckkTef";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8E93510E045;
 Fri, 15 Nov 2024 21:22:42 +0000 (UTC)
Received: from eahariha-devbox.internal.cloudapp.net (unknown [40.91.112.99])
 by linux.microsoft.com (Postfix) with ESMTPSA id C8F55206BCE1;
 Fri, 15 Nov 2024 13:22:41 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C8F55206BCE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1731705762;
 bh=NaKJY5KeJ2E1lFlJGT3YRi054w9/PadhToJsjl04lc4=;
 h=From:Subject:Date:To:Cc:From;
 b=qSckkTefY4nSDpMG6iW1ikvAvcu+Bro+zmtddjC9Ua2IIcocuRc7w5JVg1mXiL1Zv
 gjq7MVSAX23TgeVecpPfH5/IBxuFBQ/uZHv6yLuKDmXda9ST9w35n4VJDzv6x+pplU
 738dCnI1RTxo/K26kLo/E4BvWWcYM0/mvOAHIgpM=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: [PATCH 00/22] Converge on using secs_to_jiffies()
Date: Fri, 15 Nov 2024 21:22:30 +0000
Message-Id: <20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJa7N2cC/y2NQQqDQAxFryJZN2AGKehVpIt2JtOmi5k2sSKId
 zdol+/Bf38FYxU2GJoVlGcxqcWBLg3E1708GSU5Q2hDR0QBYy0zq3vjaDhVfEvOXsDU94lauj4
 SEfj8o5xlOdLj7WTl788fpr/cth3E5bKGfwAAAA==
X-Change-ID: 20241112-converge-secs-to-jiffies-d99d1016bd11
To: Pablo Neira Ayuso <pablo@netfilter.org>, 
 Jozsef Kadlecsik <kadlec@netfilter.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>, 
 Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>, 
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>, 
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 James Smart <james.smart@broadcom.com>, 
 Dick Kennedy <dick.kennedy@broadcom.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Jack Wang <jinpu.wang@cloud.ionos.com>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Louis Peens <louis.peens@corigine.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr, 
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org, 
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-mm@kvack.org, 
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org, 
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org, 
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com, 
 linuxppc-dev@lists.ozlabs.org, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Easwar Hariharan <eahariha@linux.microsoft.com>, 
 Michael Kelley <mhklinux@outlook.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
X-Mailer: b4 0.14.2
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

This is a series that follows up on my previous series to introduce
secs_to_jiffies() and convert a few initial users.[1] In the review for
that series, Anna-Maria requested converting other users with
Coccinelle. This is part 1 that converts users of msecs_to_jiffies()
that use the multiply pattern of either of:
- msecs_to_jiffies(N*1000), or
- msecs_to_jiffies(N*MSEC_PER_SEC)

The entire conversion is made with Coccinelle in the script added in
patch 2. Some changes suggested by Coccinelle have been deferred to
later parts that will address other possible variant patterns.

CC: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>

[1] https://lore.kernel.org/all/20241030-open-coded-timeouts-v3-0-9ba123facf88@linux.microsoft.com/
[2] https://lore.kernel.org/all/8734kngfni.fsf@somnus/

---
Easwar Hariharan (22):
      netfilter: conntrack: Cleanup timeout definitions
      coccinelle: misc: Add secs_to_jiffies script
      arm: pxa: Convert timeouts to use secs_to_jiffies()
      s390: kernel: Convert timeouts to use secs_to_jiffies()
      powerpc/papr_scm: Convert timeouts to secs_to_jiffies()
      mm: kmemleak: Convert timeouts to secs_to_jiffies()
      accel/habanalabs: Convert timeouts to secs_to_jiffies()
      drm/xe: Convert timeout to secs_to_jiffies()
      drm/etnaviv: Convert timeouts to secs_to_jiffies()
      scsi: lpfc: Convert timeouts to secs_to_jiffies()
      scsi: arcmsr: Convert timeouts to secs_to_jiffies()
      scsi: pm8001: Convert timeouts to secs_to_jiffies()
      xen/blkback: Convert timeouts to secs_to_jiffies()
      gve: Convert timeouts to secs_to_jiffies()
      wifi: ath11k: Convert timeouts to secs_to_jiffies()
      Bluetooth: MGMT: Convert timeouts to secs_to_jiffies()
      staging: vc04_services: Convert timeouts to secs_to_jiffies()
      ceph: Convert timeouts to secs_to_jiffies()
      livepatch: Convert timeouts to secs_to_jiffies()
      ALSA: line6: Convert timeouts to secs_to_jiffies()
      nfp: Convert timeouts to secs_to_jiffies()
      jiffies: Define secs_to_jiffies()

 arch/arm/mach-pxa/sharpsl_pm.c                      |  6 +++---
 arch/powerpc/platforms/pseries/papr_scm.c           |  2 +-
 arch/s390/kernel/lgr.c                              |  3 ++-
 arch/s390/kernel/time.c                             |  4 ++--
 arch/s390/kernel/topology.c                         |  2 +-
 drivers/accel/habanalabs/common/device.c            |  2 +-
 drivers/accel/habanalabs/common/habanalabs_drv.c    |  3 +--
 drivers/block/xen-blkback/blkback.c                 |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_cmdbuf.c            |  2 +-
 drivers/gpu/drm/xe/xe_device.c                      |  2 +-
 drivers/net/ethernet/google/gve/gve_tx_dqo.c        |  6 ++----
 drivers/net/ethernet/netronome/nfp/nfp_net_common.c |  2 +-
 drivers/net/wireless/ath/ath11k/debugfs.c           |  2 +-
 drivers/scsi/arcmsr/arcmsr_hba.c                    |  2 +-
 drivers/scsi/lpfc/lpfc_init.c                       | 18 +++++++++---------
 drivers/scsi/lpfc/lpfc_nportdisc.c                  |  8 ++++----
 drivers/scsi/lpfc/lpfc_nvme.c                       |  2 +-
 drivers/scsi/lpfc/lpfc_sli.c                        |  4 ++--
 drivers/scsi/lpfc/lpfc_vmid.c                       |  2 +-
 drivers/scsi/pm8001/pm8001_init.c                   |  2 +-
 .../vc04_services/bcm2835-audio/bcm2835-vchiq.c     |  2 +-
 fs/ceph/quota.c                                     |  2 +-
 include/linux/jiffies.h                             | 13 +++++++++++++
 mm/kmemleak.c                                       |  4 ++--
 net/bluetooth/hci_event.c                           |  2 --
 net/bluetooth/mgmt.c                                |  2 +-
 net/netfilter/nf_conntrack_proto_sctp.c             | 21 ++++++++-------------
 samples/livepatch/livepatch-callbacks-busymod.c     |  2 +-
 samples/livepatch/livepatch-shadow-fix1.c           |  2 +-
 samples/livepatch/livepatch-shadow-mod.c            | 10 +++++-----
 scripts/coccinelle/misc/secs_to_jiffies.cocci       | 21 +++++++++++++++++++++
 sound/usb/line6/toneport.c                          |  2 +-
 32 files changed, 92 insertions(+), 67 deletions(-)
---
base-commit: 2d5404caa8c7bb5c4e0435f94b28834ae5456623
change-id: 20241112-converge-secs-to-jiffies-d99d1016bd11

Best regards,
-- 
Easwar Hariharan <eahariha@linux.microsoft.com>


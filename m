Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97728A210D2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 19:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C9F10E6E8;
	Tue, 28 Jan 2025 18:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="rbsRgRXs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 54FC910E03F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jan 2025 18:21:58 +0000 (UTC)
Received: from eahariha-devbox.internal.cloudapp.net (unknown [40.91.112.99])
 by linux.microsoft.com (Postfix) with ESMTPSA id 5C2E02037175;
 Tue, 28 Jan 2025 10:21:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5C2E02037175
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1738088517;
 bh=DWnZxqt2SesB4Fck6kqsaU204yIBxTyh+Yo+gWHnxew=;
 h=From:Subject:Date:To:Cc:From;
 b=rbsRgRXsDhgQ49qwzz8O9F+b3CIaPu+u/u5bFNXstLiqFfaEZgC1iIU54pEJ4SCC9
 qXRUrwxGkFwK11MEhKH4r7I0e/4uhHl3G7yCK3E3A4G+YwxkrF4Z/N40iZHmQckLfV
 +mfJ829accGVQ64/iuqsqnpCIMIptrmhiAA8pmnE=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: [PATCH 00/16] Converge on using secs_to_jiffies() part two
Date: Tue, 28 Jan 2025 18:21:45 +0000
Message-Id: <20250128-converge-secs-to-jiffies-part-two-v1-0-9a6ecf0b2308@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADogmWcC/x2NMQrDMAwAvxI0VxAbE0O/UjoYV2qUwQ6SSQshf
 6/oeDfcnWCkQgb36QSlQ0x6cwi3Cepa2ptQXs4Q55hCDBlrbwepe6NqODpuwuwF3IsOHJ+OnNI
 ccikLLxm8syuxfP+Px/O6fgSSOflzAAAA
X-Change-ID: 20241217-converge-secs-to-jiffies-part-two-f44017aa6f67
To: Andrew Morton <akpm@linux-foundation.org>, 
 Yaron Avizrat <yaron.avizrat@intel.com>, Oded Gabbay <ogabbay@kernel.org>, 
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
 James Smart <james.smart@broadcom.com>, 
 Dick Kennedy <dick.kennedy@broadcom.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
 David Sterba <dsterba@suse.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Dongsheng Yang <dongsheng.yang@easystack.cn>, Jens Axboe <axboe@kernel.dk>, 
 Xiubo Li <xiubli@redhat.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Carlos Maiolino <cem@kernel.org>, 
 "Darrick J. Wong" <djwong@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Frank Li <Frank.Li@nxp.com>, 
 Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Selvin Xavier <selvin.xavier@broadcom.com>, 
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>
Cc: cocci@inria.fr, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-sound@vger.kernel.org, linux-btrfs@vger.kernel.org, 
 ceph-devel@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-ide@vger.kernel.org, linux-xfs@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-nvme@lists.infradead.org, 
 linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-rdma@vger.kernel.org, 
 Easwar Hariharan <eahariha@linux.microsoft.com>
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

This is the second series (part 1*) that converts users of msecs_to_jiffies() that
either use the multiply pattern of either of:
- msecs_to_jiffies(N*1000) or
- msecs_to_jiffies(N*MSEC_PER_SEC)

where N is a constant or an expression, to avoid the multiplication.

The conversion is made with Coccinelle with the secs_to_jiffies() script
in scripts/coccinelle/misc. Attention is paid to what the best change
can be rather than restricting to what the tool provides.

Andrew has kindly agreed to take the series through mm.git modulo the
patches maintainers want to pick through their own trees.

This series is based on next-20250128

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>

* https://lore.kernel.org/all/20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com/

---
Easwar Hariharan (16):
      coccinelle: misc: secs_to_jiffies: Patch expressions too
      scsi: lpfc: convert timeouts to secs_to_jiffies()
      accel/habanalabs: convert timeouts to secs_to_jiffies()
      ALSA: ac97: convert timeouts to secs_to_jiffies()
      btrfs: convert timeouts to secs_to_jiffies()
      rbd: convert timeouts to secs_to_jiffies()
      libceph: convert timeouts to secs_to_jiffies()
      libata: zpodd: convert timeouts to secs_to_jiffies()
      xfs: convert timeouts to secs_to_jiffies()
      power: supply: da9030: convert timeouts to secs_to_jiffies()
      nvme: convert timeouts to secs_to_jiffies()
      spi: spi-fsl-lpspi: convert timeouts to secs_to_jiffies()
      spi: spi-imx: convert timeouts to secs_to_jiffies()
      platform/x86/amd/pmf: convert timeouts to secs_to_jiffies()
      platform/x86: thinkpad_acpi: convert timeouts to secs_to_jiffies()
      RDMA/bnxt_re: convert timeouts to secs_to_jiffies()

 .../accel/habanalabs/common/command_submission.c   |  2 +-
 drivers/accel/habanalabs/common/debugfs.c          |  2 +-
 drivers/accel/habanalabs/common/device.c           |  2 +-
 drivers/accel/habanalabs/common/habanalabs_drv.c   |  2 +-
 drivers/ata/libata-zpodd.c                         |  3 +--
 drivers/block/rbd.c                                |  6 +++---
 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c         |  2 +-
 drivers/nvme/host/core.c                           |  6 ++----
 drivers/platform/x86/amd/pmf/acpi.c                |  3 ++-
 drivers/platform/x86/thinkpad_acpi.c               |  2 +-
 drivers/power/supply/da9030_battery.c              |  3 +--
 drivers/scsi/lpfc/lpfc_init.c                      |  4 ++--
 drivers/scsi/lpfc/lpfc_scsi.c                      | 12 +++++------
 drivers/scsi/lpfc/lpfc_sli.c                       | 24 ++++++++--------------
 drivers/scsi/lpfc/lpfc_vport.c                     |  2 +-
 drivers/spi/spi-fsl-lpspi.c                        |  2 +-
 drivers/spi/spi-imx.c                              |  2 +-
 fs/btrfs/disk-io.c                                 |  6 +++---
 fs/xfs/xfs_icache.c                                |  2 +-
 fs/xfs/xfs_sysfs.c                                 |  7 +++----
 net/ceph/ceph_common.c                             | 10 ++++-----
 net/ceph/osd_client.c                              |  3 +--
 scripts/coccinelle/misc/secs_to_jiffies.cocci      | 22 ++++++++++++++------
 sound/pci/ac97/ac97_codec.c                        |  3 +--
 24 files changed, 63 insertions(+), 69 deletions(-)
---
base-commit: 9a87ce288fe30f268b3a598422fe76af9bb2c2d2
change-id: 20241217-converge-secs-to-jiffies-part-two-f44017aa6f67

Best regards,
-- 
Easwar Hariharan <eahariha@linux.microsoft.com>


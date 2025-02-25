Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCF0A44C49
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 21:17:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A3010E7C7;
	Tue, 25 Feb 2025 20:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="OJWfAvqA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 55C9010E7CB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 20:17:23 +0000 (UTC)
Received: from eahariha-devbox.internal.cloudapp.net (unknown [40.91.112.99])
 by linux.microsoft.com (Postfix) with ESMTPSA id 920F4203CDFC;
 Tue, 25 Feb 2025 12:17:19 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 920F4203CDFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1740514639;
 bh=pRPTMwC85c4lYLBd5/aEkvEtme0QilCw7nKJr8ytgmI=;
 h=From:Subject:Date:To:Cc:From;
 b=OJWfAvqAxjSS6nUkULU00Pa8nQ9u9kKy42lXSCjyZ4ZUUOElAuQC0IJLL8YdgMxy4
 fRHYXp6qo5lzLvyA3yVmWt3cKN1fewJPyBbSi8i8x+l37gp4hdCbMSActzutlKgtXo
 djKAYQpE3vAmx4Iwoj2HThNeFrxgkdmyOVA8YA+8=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Subject: [PATCH v3 00/16] Converge on using secs_to_jiffies() part two
Date: Tue, 25 Feb 2025 20:17:14 +0000
Message-Id: <20250225-converge-secs-to-jiffies-part-two-v3-0-a43967e36c88@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEslvmcC/43NMRKCMBCF4aswqV1nExDQyns4FjFsZB0hThKjj
 sPdDTY2FpT/K773FoE8UxC74i08JQ7sxhzlqhCm1+OZgLvcQqGqpJINGDcm8nkPZAJEBxe2Ngt
 w0z5CfDiwVYWy0bq2dSOyc/Nk+fn9OBxz9xyi86/vZZLzOusblKpdoCcJCFtdk7F4UiW2+yuP9
 +d6YONdcDaujRvE/JPUz1ZYLrFVtrsGN61GaTuk//Y0TR+h+4siOAEAAA==
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
 Easwar Hariharan <eahariha@linux.microsoft.com>, 
 Takashi Iwai <tiwai@suse.de>, Carlos Maiolino <cmaiolino@redhat.com>
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

This series is based on next-20250225

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>

* https://lore.kernel.org/all/20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com/

---
Changes in v3:
- Change commit message prefix from libata: zpodd to ata: libata-zpodd: in patch 8 (Damien)
- Split up overly long line in patch 9 (Christoph)
- Fixup unnecessary line break in patch 14 (Ilpo)
- Combine v1 and v2
- Fix some additional hunks in patch 2 (scsi: lpfc) which the more concise script missed
- msecs_to_jiffies -> msecs_to_jiffies() in commit messages throughout
- Bug in secs_to_jiffies() uncovered by LKP merged in 6.14-rc2: bb2784d9ab4958 ("jiffies: Cast to unsigned long in secs_to_jiffies() conversion")
- Link to v2: https://lore.kernel.org/r/20250203-converge-secs-to-jiffies-part-two-v2-0-d7058a01fd0e@linux.microsoft.com

Changes in v2:
- Remove unneeded range checks in rbd and libceph. While there, convert some timeouts that should have been fixed in part 1. (Ilya)
- Fixup secs_to_jiffies.cocci to be a bit more verbose
- Link to v1: https://lore.kernel.org/r/20250128-converge-secs-to-jiffies-part-two-v1-0-9a6ecf0b2308@linux.microsoft.com

---
Easwar Hariharan (16):
      coccinelle: misc: secs_to_jiffies: Patch expressions too
      scsi: lpfc: convert timeouts to secs_to_jiffies()
      accel/habanalabs: convert timeouts to secs_to_jiffies()
      ALSA: ac97: convert timeouts to secs_to_jiffies()
      btrfs: convert timeouts to secs_to_jiffies()
      rbd: convert timeouts to secs_to_jiffies()
      libceph: convert timeouts to secs_to_jiffies()
      ata: libata-zpodd: convert timeouts to secs_to_jiffies()
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
 drivers/ata/libata-zpodd.c                         |  3 +-
 drivers/block/rbd.c                                |  8 ++---
 drivers/infiniband/hw/bnxt_re/qplib_rcfw.c         |  2 +-
 drivers/nvme/host/core.c                           |  6 ++--
 drivers/platform/x86/amd/pmf/acpi.c                |  2 +-
 drivers/platform/x86/thinkpad_acpi.c               |  2 +-
 drivers/power/supply/da9030_battery.c              |  3 +-
 drivers/scsi/lpfc/lpfc.h                           |  3 +-
 drivers/scsi/lpfc/lpfc_els.c                       | 11 +++---
 drivers/scsi/lpfc/lpfc_hbadisc.c                   |  2 +-
 drivers/scsi/lpfc/lpfc_init.c                      | 10 +++---
 drivers/scsi/lpfc/lpfc_scsi.c                      | 12 +++----
 drivers/scsi/lpfc/lpfc_sli.c                       | 41 +++++++++-------------
 drivers/scsi/lpfc/lpfc_vport.c                     |  2 +-
 drivers/spi/spi-fsl-lpspi.c                        |  2 +-
 drivers/spi/spi-imx.c                              |  2 +-
 fs/btrfs/disk-io.c                                 |  6 ++--
 fs/xfs/xfs_icache.c                                |  2 +-
 fs/xfs/xfs_sysfs.c                                 |  8 ++---
 include/linux/ceph/libceph.h                       | 12 +++----
 net/ceph/ceph_common.c                             | 18 ++++------
 net/ceph/osd_client.c                              |  3 +-
 scripts/coccinelle/misc/secs_to_jiffies.cocci      | 10 ++++++
 sound/pci/ac97/ac97_codec.c                        |  3 +-
 28 files changed, 82 insertions(+), 99 deletions(-)
---
base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
change-id: 20241217-converge-secs-to-jiffies-part-two-f44017aa6f67

Best regards,
-- 
Easwar Hariharan <eahariha@linux.microsoft.com>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048359BA6CF
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 18:04:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E8310E271;
	Sun,  3 Nov 2024 17:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="LVkLlDoy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E523010E271;
 Sun,  3 Nov 2024 17:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1730653478;
 bh=vLmXHFQrVeANwVFZr7GPEQiJDwV80UwagiHdL+WieYg=;
 h=From:Subject:Date:To:Cc:From;
 b=LVkLlDoyAjxSEKNfss+XSXyWYJJQzcZv2JQqsJCbi9rUIOTJ4RL7OxwixFQenCjjd
 rlVUh9qqiGz1yV+aWCGMfosXXIgbUe7lyF1Ond/E8etyVdz8oI4rmOCryfvOvF9wdn
 hyWkvUc8pYcWGzPC5QJ3hJWaxe+zEoDAAboNa6yg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 00/10] sysfs: constify struct bin_attribute (Part 1)
Date: Sun, 03 Nov 2024 17:03:29 +0000
Message-Id: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOGsJ2cC/22NQQ6CMBBFr2JmbU1bQasr72GIKTC1synaKSgh3
 N2KJm5cvp/89yZgjIQMx9UEEQdi6kIGvV5B4224oqA2M2ipCyW1ETyyY9F0gZOoKVxsSlFYKc1
 hVxjVyhry9RbR0XPRnqsPR7z32Z5+oydOXRyX9KDe67eyVf8rgxJSaG2UdXbvZFmeHkjM3Pjeb
 wImqOZ5fgH1E5+t0gAAAA==
X-Change-ID: 20241028-sysfs-const-bin_attr-a00896481d0b
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Davidlohr Bueso <dave@stgolabs.net>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, 
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "David E. Box" <david.e.box@linux.intel.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Matt Turner <mattst88@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Logan Gunthorpe <logang@deltatee.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>
Cc: Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-rdma@vger.kernel.org, linux-mtd@lists.infradead.org, 
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-hyperv@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730653468; l=3861;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=vLmXHFQrVeANwVFZr7GPEQiJDwV80UwagiHdL+WieYg=;
 b=Bvbt1J2LqQ69JnMU1VrxxAk0oh5wwQXMdeGiNk0LKpzFZww+HQ7ZSL0xtSH7vjejf+nvXyav9
 7mYQXMoReN6DBjpqywBjK9Kq5FxOhy2hVOb+j2ENGg6yuLHGvmQRl99
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

struct bin_attribute contains a bunch of pointer members, which when
overwritten by accident or malice can lead to system instability and
security problems.
Moving the definitions of struct bin_attribute to read-only memory
makes these modifications impossible.
The same change has been performed for many other structures in the
past. (struct class, struct ctl_table...)

For the structure definitions throughout the core to be moved to
read-only memory the following steps are necessary.

1) Change all callbacks invoked from the sysfs core to only pass const
   pointers
2) Adapt the sysfs core to only work in terms of const pointers
3) Adapt the sysfs core APIs to allow const pointers
4) Change all structure definitions through the core to const

This series provides the foundation for step 1) above.
It converts some callbacks in a single step to const and provides a
foundation for those callbacks where a single step is not possible.

Patches 1-5 change the bin_attribute callbacks of 'struct
attribute_group'. The remaining ones touch 'struct bin_attribute' itself.

The techniques employed by this series can later be reused for the
same change for other sysfs attributes.

This series is intended to be merged through the driver core tree.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Drop RFC state
- Refuse registration of attributes with both read/read_new or
  write/write_new
- Remove don't drop llseek() callback, as it is actually used.
  Instead also migrate it to "const".
- _Generic machinery: Simplify and make more robust against misuse
- Link to v1: https://lore.kernel.org/r/20241031-sysfs-const-bin_attr-v1-0-2281afa7f055@weissschuh.net

---
Thomas Weißschuh (10):
      sysfs: explicitly pass size to sysfs_add_bin_file_mode_ns()
      sysfs: introduce callback attribute_group::bin_size
      PCI/sysfs: Calculate bin_attribute size through bin_size()
      nvmem: core: calculate bin_attribute size through bin_size()
      sysfs: treewide: constify attribute callback of bin_is_visible()
      sysfs: treewide: constify attribute callback of bin_attribute::mmap()
      sysfs: treewide: constify attribute callback of bin_attribute::llseek()
      sysfs: implement all BIN_ATTR_* macros in terms of __BIN_ATTR()
      sysfs: bin_attribute: add const read/write callback variants
      driver core: Constify attribute arguments of binary attributes

 arch/alpha/kernel/pci-sysfs.c           |  6 +--
 drivers/base/node.c                     |  4 +-
 drivers/base/topology.c                 |  4 +-
 drivers/cxl/port.c                      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c |  2 +-
 drivers/infiniband/hw/qib/qib_sysfs.c   |  2 +-
 drivers/misc/ocxl/sysfs.c               |  2 +-
 drivers/mtd/spi-nor/sysfs.c             |  2 +-
 drivers/nvmem/core.c                    | 16 ++++--
 drivers/pci/p2pdma.c                    |  2 +-
 drivers/pci/pci-sysfs.c                 | 42 ++++++++-------
 drivers/pci/vpd.c                       |  2 +-
 drivers/platform/x86/amd/hsmp.c         |  2 +-
 drivers/platform/x86/intel/pmt/class.c  |  2 +-
 drivers/platform/x86/intel/sdsi.c       |  2 +-
 drivers/scsi/scsi_sysfs.c               |  2 +-
 drivers/uio/uio_hv_generic.c            |  2 +-
 drivers/usb/core/sysfs.c                |  2 +-
 fs/sysfs/file.c                         | 30 +++++++----
 fs/sysfs/group.c                        |  5 +-
 fs/sysfs/sysfs.h                        |  2 +-
 include/linux/sysfs.h                   | 94 ++++++++++++++++++++-------------
 22 files changed, 138 insertions(+), 91 deletions(-)
---
base-commit: 3e5e6c9900c3d71895e8bdeacfb579462e98eba1
change-id: 20241028-sysfs-const-bin_attr-a00896481d0b

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


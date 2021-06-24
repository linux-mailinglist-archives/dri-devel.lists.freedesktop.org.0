Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CD43B32E9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 17:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962676EC46;
	Thu, 24 Jun 2021 15:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42E56EB2E
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 15:55:38 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id g21so3843481pfc.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 08:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rdc0HB9wCm28bStTIxqWIJNvJopKcq8sWWQzFyMGdN8=;
 b=EWUPwdxHp5YKeCTYM1Ou9zc1bF9zF4WPE1YYn08iLU0DKzgmmZp5S8YTmyG8h6lXtv
 H7bIKs3GpVKupJr/fP+pph0lGjQ+mJcFcHV01gy1FmuxsYy+jElw6HlWfLFvvUP+d+yn
 QsIj+YxXmhSRVl7m7zjzDw87xA/6voIVdj0mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rdc0HB9wCm28bStTIxqWIJNvJopKcq8sWWQzFyMGdN8=;
 b=SdTkkRG9fY2YO6HYqS/R6OcSR5JBNKgGmoZvm23Hvz7UpVIZZYb88mF31Ufbwk76gR
 qyehUZHtMWpw8vGa3P+AlRZtMkE9dHR2WYFRaEoWl9uN+8tfkHolqJRd0/RvPNOQbmEL
 fJe+0fFEl5f7IeiudqIpO12VSLlydY0EFhrVHfCTqgbarzz1sgLfMDOkOKuybZXnIpwB
 bxWWAoR2O+hDAOdhvJi0bIZ1NEacim80zpJvz3zQlzkqjt/E6CvN7KiNM/bFlV7MWfd5
 sLTKHGx/XCcYsUAsdN8VxHgf2H6/lfktsFfoBzOu2gtre6M72S37drDHz2vYsTyfJ7H6
 pAYQ==
X-Gm-Message-State: AOAM533b5O18CbMLyNGSQQX2IQvvHp00xo58EmQgFKpBxh9wrYACC90y
 JWYNG64khhbTRnvlkZLV3R2zPg==
X-Google-Smtp-Source: ABdhPJy87SSPlxL47d7OH+XoeGh+AXQQoDaeBE720F3P2KtS6fZXS8ICxE/Q45nw3Tf/1EGtaohwag==
X-Received: by 2002:a05:6a00:810:b029:301:f08c:6b0d with SMTP id
 m16-20020a056a000810b0290301f08c6b0dmr5744051pfk.8.1624550138225; 
 Thu, 24 Jun 2021 08:55:38 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:165a:99ec:42d5:d8b])
 by smtp.gmail.com with UTF8SMTPSA id oc9sm2594487pjb.43.2021.06.24.08.55.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 08:55:37 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v15 00/12] Restricted DMA
Date: Thu, 24 Jun 2021 23:55:14 +0800
Message-Id: <20210624155526.2775863-1-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, jxgao@google.com, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 airlied@linux.ie, Robin Murphy <robin.murphy@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, tientzu@chromium.org,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 quic_qiancai@quicinc.com, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, thomas.lendacky@amd.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series implements mitigations for lack of DMA access control on
systems without an IOMMU, which could result in the DMA accessing the
system memory at unexpected times and/or unexpected addresses, possibly
leading to data leakage or corruption.

For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus is
not behind an IOMMU. As PCI-e, by design, gives the device full access to
system memory, a vulnerability in the Wi-Fi firmware could easily escalate
to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
full chain of exploits; [2], [3]).

To mitigate the security concerns, we introduce restricted DMA. Restricted
DMA utilizes the existing swiotlb to bounce streaming DMA in and out of a
specially allocated region and does memory allocation from the same region.
The feature on its own provides a basic level of protection against the DMA
overwriting buffer contents at unexpected times. However, to protect
against general data leakage and system memory corruption, the system needs
to provide a way to restrict the DMA to a predefined memory region (this is
usually done at firmware level, e.g. MPU in ATF on some ARM platforms [4]).

[1a] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_4.html
[1b] https://googleprojectzero.blogspot.com/2017/04/over-air-exploiting-broadcoms-wi-fi_11.html
[2] https://blade.tencent.com/en/advisories/qualpwn/
[3] https://www.bleepingcomputer.com/news/security/vulnerabilities-found-in-highly-popular-firmware-for-wifi-chips/
[4] https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/mediatek/mt8183/drivers/emi_mpu/emi_mpu.c#L132

v15:
- Apply Will's diff (https://lore.kernel.org/patchwork/patch/1448957/#1647521)
  to fix the crash reported by Qian.
- Add Stefano's Acked-by tag for patch 01/12 from v14

v14:
- Move set_memory_decrypted before swiotlb_init_io_tlb_mem (patch 01/12, 10,12)
- Add Stefano's Acked-by tag from v13
https://lore.kernel.org/patchwork/cover/1448954/

v13:
- Fix xen-swiotlb issues
  - memset in patch 01/12
  - is_swiotlb_force_bounce in patch 06/12
- Fix the dts example typo in reserved-memory.txt
- Add Stefano and Will's Tested-by tag from v12
https://lore.kernel.org/patchwork/cover/1448001/

v12:
Split is_dev_swiotlb_force into is_swiotlb_force_bounce (patch 06/12) and
is_swiotlb_for_alloc (patch 09/12)
https://lore.kernel.org/patchwork/cover/1447254/

v11:
- Rebase against swiotlb devel/for-linus-5.14
- s/mempry/memory/g
- exchange the order of patch 09/12 and 10/12
https://lore.kernel.org/patchwork/cover/1447216/

v10:
Address the comments in v9 to
  - fix the dev->dma_io_tlb_mem assignment
  - propagate swiotlb_force setting into io_tlb_default_mem->force
  - move set_memory_decrypted out of swiotlb_init_io_tlb_mem
  - move debugfs_dir declaration into the main CONFIG_DEBUG_FS block
  - add swiotlb_ prefix to find_slots and release_slots
  - merge the 3 alloc/free related patches
  - move the CONFIG_DMA_RESTRICTED_POOL later
https://lore.kernel.org/patchwork/cover/1446882/

v9:
Address the comments in v7 to
  - set swiotlb active pool to dev->dma_io_tlb_mem
  - get rid of get_io_tlb_mem
  - dig out the device struct for is_swiotlb_active
  - move debugfs_create_dir out of swiotlb_create_debugfs
  - do set_memory_decrypted conditionally in swiotlb_init_io_tlb_mem
  - use IS_ENABLED in kernel/dma/direct.c
  - fix redefinition of 'of_dma_set_restricted_buffer'
https://lore.kernel.org/patchwork/cover/1445081/

v8:
- Fix reserved-memory.txt and add the reg property in example.
- Fix sizeof for of_property_count_elems_of_size in
  drivers/of/address.c#of_dma_set_restricted_buffer.
- Apply Will's suggestion to try the OF node having DMA configuration in
  drivers/of/address.c#of_dma_set_restricted_buffer.
- Fix typo in the comment of drivers/of/address.c#of_dma_set_restricted_buffer.
- Add error message for PageHighMem in
  kernel/dma/swiotlb.c#rmem_swiotlb_device_init and move it to
  rmem_swiotlb_setup.
- Fix the message string in rmem_swiotlb_setup.
https://lore.kernel.org/patchwork/cover/1437112/

v7:
Fix debugfs, PageHighMem and comment style in rmem_swiotlb_device_init
https://lore.kernel.org/patchwork/cover/1431031/

v6:
Address the comments in v5
https://lore.kernel.org/patchwork/cover/1423201/

v5:
Rebase on latest linux-next
https://lore.kernel.org/patchwork/cover/1416899/

v4:
- Fix spinlock bad magic
- Use rmem->name for debugfs entry
- Address the comments in v3
https://lore.kernel.org/patchwork/cover/1378113/

v3:
Using only one reserved memory region for both streaming DMA and memory
allocation.
https://lore.kernel.org/patchwork/cover/1360992/

v2:
Building on top of swiotlb.
https://lore.kernel.org/patchwork/cover/1280705/

v1:
Using dma_map_ops.
https://lore.kernel.org/patchwork/cover/1271660/

Claire Chang (12):
  swiotlb: Refactor swiotlb init functions
  swiotlb: Refactor swiotlb_create_debugfs
  swiotlb: Set dev->dma_io_tlb_mem to the swiotlb pool used
  swiotlb: Update is_swiotlb_buffer to add a struct device argument
  swiotlb: Update is_swiotlb_active to add a struct device argument
  swiotlb: Use is_swiotlb_force_bounce for swiotlb data bouncing
  swiotlb: Move alloc_size to swiotlb_find_slots
  swiotlb: Refactor swiotlb_tbl_unmap_single
  swiotlb: Add restricted DMA alloc/free support
  swiotlb: Add restricted DMA pool initialization
  dt-bindings: of: Add restricted DMA pool
  of: Add plumbing for restricted DMA pool

 .../reserved-memory/reserved-memory.txt       |  36 ++-
 drivers/base/core.c                           |   4 +
 drivers/gpu/drm/i915/gem/i915_gem_internal.c  |   2 +-
 drivers/gpu/drm/nouveau/nouveau_ttm.c         |   2 +-
 drivers/iommu/dma-iommu.c                     |  12 +-
 drivers/of/address.c                          |  33 +++
 drivers/of/device.c                           |   3 +
 drivers/of/of_private.h                       |   6 +
 drivers/pci/xen-pcifront.c                    |   2 +-
 drivers/xen/swiotlb-xen.c                     |   4 +-
 include/linux/device.h                        |   4 +
 include/linux/swiotlb.h                       |  53 +++-
 kernel/dma/Kconfig                            |  14 +
 kernel/dma/direct.c                           |  59 ++--
 kernel/dma/direct.h                           |   8 +-
 kernel/dma/swiotlb.c                          | 251 +++++++++++++-----
 16 files changed, 390 insertions(+), 103 deletions(-)

-- 
2.32.0.288.g62a8d224e6-goog


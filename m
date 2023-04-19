Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5205A6E771A
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 12:05:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826F310E90D;
	Wed, 19 Apr 2023 10:05:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout11.his.huawei.com (frasgout11.his.huawei.com
 [14.137.139.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223BA10E913
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 10:05:01 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.18.147.229])
 by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4Q1bkh0QYQz9v7V0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:55:24 +0800 (CST)
Received: from A2101119013HW2.china.huawei.com (unknown [10.45.152.239])
 by APP1 (Coremail) with SMTP id LxC2BwAXi_aYvD9k7TY6Ag--.1944S2;
 Wed, 19 Apr 2023 11:04:29 +0100 (CET)
From: Petr Tesarik <petrtesarik@huaweicloud.com>
To: Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Borislav Petkov <bp@suse.de>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Kim Phillips <kim.phillips@amd.com>,
 "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Muchun Song <muchun.song@linux.dev>, Ondrej Zary <linux@zary.sk>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Petr Tesarik <petr.tesarik.ext@huawei.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>,
 Won Chung <wonchung@google.com>,
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 linux-kernel@vger.kernel.org (open list),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 iommu@lists.linux.dev (open list:DMA MAPPING HELPERS)
Subject: [PATCH v2 0/7] Allow dynamic allocation of software IO TLB bounce
 buffers
Date: Wed, 19 Apr 2023 12:03:52 +0200
Message-Id: <cover.1681898595.git.petr.tesarik.ext@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LxC2BwAXi_aYvD9k7TY6Ag--.1944S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw18WF1rGrW5WFyrCry5CFg_yoW5Ww15pF
 Wak34jvrn8tryxu3yxCr4xWa4rGan5ZFW7Ga9Yvwn5ZrW5urn2vw12yrW3J3s8Gr4fXF4Y
 qF1qvr15CFyrur7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvlb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
 6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
 vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
 xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8C
 rVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4
 IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x02
 64kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2
 IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v2
 6rWY6r4UJwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI
 8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2
 z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
 DU0xZFpf9x07jeKZXUUUUU=
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
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
Cc: petr@tesarici.cz, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Roberto Sassu <roberto.sassu@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Petr Tesarik <petr.tesarik.ext@huawei.com>

The goal of my work is to provide more flexibility in the sizing of
SWIOTLB.

The software IO TLB was designed with these assumptions:

1. It would not be used much, especially on 64-bit systems.
2. A small fixed memory area (64 MiB by default) is sufficient to
   handle the few cases which require a bounce buffer.
3. 64 MiB is little enough that it has no impact on the rest of the
   system.

First, if SEV is active, all DMA must be done through shared
unencrypted pages, and SWIOTLB is used to make this happen without
changing device drivers. The software IO TLB size is increased to
6% of total memory in sev_setup_arch(), but that is more of an
approximation. The actual requirements may vary depending on the
amount of I/O and which drivers are used. These factors may not be
know at boot time, i.e. when SWIOTLB is allocated.

Second, other colleagues have noticed that they can reliably get
rid of occasional OOM kills on an Arm embedded device by reducing
the SWIOTLB size. This can be achieved with a kernel parameter, but
determining the right value puts additional burden on pre-release
testing, which could be avoided if SWIOTLB is allocated small and
grows only when necessary.

Changes from v1-devel-v7:
- Add comments to acquire/release barriers
- Fix whitespace issues reported by checkpatch.pl

Changes from v1-devel-v6:
- Provide long description of functions
- Fix kernel-doc (Returns: to Return:)
- Rename __lookup_dyn_slot() to lookup_dyn_slot_locked()

Changes from RFC:
- Track dynamic buffers per device instead of per swiotlb
- Use a linked list instead of a maple tree
- Move initialization of swiotlb fields of struct device to a
  helper function
- Rename __lookup_dyn_slot() to lookup_dyn_slot_locked()
- Introduce per-device flag if dynamic buffers are in use
- Add one more user of DMA_ATTR_MAY_SLEEP
- Add kernel-doc comments for new (and some old) code
- Properly escape '*' in dma-attributes.rst

Petr Tesarik (7):
  swiotlb: Use a helper to initialize swiotlb fields in struct device
  swiotlb: Move code around in preparation for dynamic bounce buffers
  dma-mapping: introduce the DMA_ATTR_MAY_SLEEP attribute
  swiotlb: Dynamically allocated bounce buffers
  swiotlb: Add a boot option to enable dynamic bounce buffers
  drm: Use DMA_ATTR_MAY_SLEEP from process context
  swiotlb: per-device flag if there are dynamically allocated buffers

 .../admin-guide/kernel-parameters.txt         |   6 +-
 Documentation/core-api/dma-attributes.rst     |  10 +
 drivers/base/core.c                           |   4 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |   2 +-
 drivers/gpu/drm/drm_prime.c                   |   2 +-
 include/linux/device.h                        |  12 +
 include/linux/dma-mapping.h                   |   6 +
 include/linux/swiotlb.h                       |  54 ++-
 kernel/dma/swiotlb.c                          | 382 ++++++++++++++++--
 9 files changed, 443 insertions(+), 35 deletions(-)

-- 
2.25.1


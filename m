Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 983591921C3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 08:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380DA89906;
	Wed, 25 Mar 2020 07:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0441C89906
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 07:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 504153F571;
 Wed, 25 Mar 2020 08:31:18 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=K6FAcklo; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 240Ax9Ctyqk7; Wed, 25 Mar 2020 08:31:16 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 9C7D33F535;
 Wed, 25 Mar 2020 08:31:12 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 47404360025;
 Wed, 25 Mar 2020 08:31:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1585121472; bh=pK1naLxV8d5FNCHfUP/WjEfmBTs06NNmz9tLvg9Fe88=;
 h=From:To:Cc:Subject:Date:From;
 b=K6FAcklog012NxHhQiX72Pn9IWpr6GMNj8ArNXpaG13eJ4YL9ZoxHbFtPW/vyMfqa
 xxqTZLGImcVpmPJnBSoxQ7C7TGS9yK26+mK26YGfXkVbHLjYeyIi4f9YraT+Qal0+J
 6HgwotGtZtVzn1JE7pWAqVeu72E5AVv96RK/oJmc=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: airlied@gmail.com,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [git pull] ttm-transhuge
Date: Wed, 25 Mar 2020 08:31:02 +0100
Message-Id: <20200325073102.6129-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
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
Cc: linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dave, Daniel.

Another one (the last for some time) of those pull requests that Linus probably
wants separate. The mm and ttm patches have been acked by the maintainers
for merge through drm, but see CAVEATS below:

CAVEATS:
  - Patch 1/9 is trivial, but I can't get it acked or reviewed by fs people
    despite repeated efforts.
  - There are two trivial conflicts (patch context) with linux-next.

This pull request is not urgent for 5.7. Although that would be desirable,
it may well wait for 5.8.

----------------------------------------------------------------------------

Huge page-table entries for TTM

In order to reduce CPU usage [1] and in theory TLB misses this patchset enables
huge- and giant page-table entries for TTM and TTM-enabled graphics drivers.

Patch 1 and 2 introduce a vma_is_special_huge() function to make the mm code
take the same path as DAX when splitting huge- and giant page table entries,
(which currently means zapping the page-table entry and rely on re-faulting).

Patch 3 makes the mm code split existing huge page-table entries
on huge_fault fallbacks. Typically on COW or on buffer-objects that want
write-notify. COW and write-notification is always done on the lowest
page-table level. See the patch log message for additional considerations.

Patch 4 introduces functions to allow the graphics drivers to manipulate
the caching- and encryption flags of huge page-table entries without ugly
hacks.

Patch 5 implements the huge_fault handler in TTM.
This enables huge page-table entries, provided that the kernel is configured
to support transhuge pages, either by default or using madvise().
However, they are unlikely to be inserted unless the kernel buffer object
pfns and user-space addresses align perfectly. There are various options
here, but since buffer objects that reside in system pages typically start
at huge page boundaries if they are backed by huge pages, we try to enforce
buffer object starting pfns and user-space addresses to be huge page-size
aligned if their size exceeds a huge page-size. If pud-size transhuge
("giant") pages are enabled by the arch, the same holds for those.

Patch 6 implements a specialized huge_fault handler for vmwgfx.
The vmwgfx driver may perform dirty-tracking and needs some special code
to handle that correctly.

Patch 7 implements a drm helper to align user-space addresses according
to the above scheme, if possible.

Patch 8 implements a TTM range manager for vmwgfx that does the same for
graphics IO memory. This may later be reused by other graphics drivers
if necessary.

Patch 9 finally hooks up the helpers of patch 7 and 8 to the vmwgfx driver.
A similar change is needed for graphics drivers that want a reasonable
likelyhood of actually using huge page-table entries.

If a buffer object size is not huge-page or giant-page aligned,
its size will NOT be inflated by this patchset. This means that the buffer
object tail will use smaller size page-table entries and thus no memory
overhead occurs. Drivers that want to pay the memory overhead price need to
implement their own scheme to inflate buffer-object sizes.

PMD size huge page-table-entries have been tested with vmwgfx and found to
work well both with system memory backed and IO memory backed buffer objects.

PUD size giant page-table-entries have seen limited (fault and COW) testing
using a modified kernel (to support 1GB page allocations) and a fake vmwgfx
TTM memory type. The vmwgfx driver does otherwise not support 1GB-size IO
memory resources.

[1]
The below test program generates the following gnu time output when run on a
vmwgfx-enabled kernel without the patch series:

4.78user 6.02system 0:10.91elapsed 99%CPU (0avgtext+0avgdata 1624maxresident)k
0inputs+0outputs (0major+640077minor)pagefaults 0swaps

and with the patch series:

1.71user 3.60system 0:05.40elapsed 98%CPU (0avgtext+0avgdata 1656maxresident)k
0inputs+0outputs (0major+20079minor)pagefaults 0swaps

A consistent number of reduced graphics page-faults can be seen with normal
graphics applications, but probably due to the aggressive buffer object
caching in vmwgfx user-space drivers the CPU time reduction is within
error limits.

#include <unistd.h>
#include <string.h>
#include <sys/mman.h>
#include <xf86drm.h>

static void checkerr(int ret, const char *name)
{
  if (ret < 0) {
    perror(name);
    exit(-1);
  }
}

int main(int agc, const char *argv[])
{
    struct drm_mode_create_dumb c_arg = {0};
    struct drm_mode_map_dumb m_arg = {0};
    struct drm_mode_destroy_dumb d_arg = {0};
    int ret, i, fd;
    void *map;

    fd = open("/dev/dri/card0", O_RDWR);
    checkerr(fd, argv[0]);

    for (i = 0; i < 10000; ++i) {
      c_arg.bpp = 32;
      c_arg.width = 1024;
      c_arg.height = 1024;      
      ret = drmIoctl(fd, DRM_IOCTL_MODE_CREATE_DUMB, &c_arg);
      checkerr(fd, argv[0]);

      m_arg.handle = c_arg.handle;
      ret = drmIoctl(fd, DRM_IOCTL_MODE_MAP_DUMB, &m_arg);
      checkerr(fd, argv[0]);
      
      map = mmap(NULL, c_arg.size, PROT_READ | PROT_WRITE, MAP_SHARED, fd,
	       m_arg.offset);
      checkerr(map == MAP_FAILED ? -1 : 0, argv[0]);

      (void) madvise((void *) map, c_arg.size, MADV_HUGEPAGE);
      memset(map, 0x67, c_arg.size);
      munmap(map, c_arg.size);

      d_arg.handle = c_arg.handle;
      ret = drmIoctl(fd, DRM_IOCTL_MODE_DESTROY_DUMB, &d_arg);
      checkerr(ret, argv[0]);
    }
    
    close(fd);
}

----------------------------------------------------------------------------


The following changes since commit cb7adfd6ad12a11902ebe374bec7fd4efa2cec1c:

  Merge tag 'mediatek-drm-next-5.7' of https://github.com/ckhu-mediatek/linux.git-tags into drm-next (2020-03-20 13:08:38 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~thomash/linux ttm-transhuge

for you to fetch changes up to 9431042dbc8ce490d49c7f9d5142805b6249208b:

  drm/vmwgfx: Hook up the helpers to align buffer objects (2020-03-24 18:50:35 +0100)

----------------------------------------------------------------
Thomas Hellstrom (VMware) (9):
      fs: Constify vma argument to vma_is_dax
      mm: Introduce vma_is_special_huge
      mm: Split huge pages on write-notify or COW
      mm: Add vmf_insert_pfn_xxx_prot() for huge page-table entries
      drm/ttm, drm/vmwgfx: Support huge TTM pagefaults
      drm/vmwgfx: Support huge page faults
      drm: Add a drm_get_unmapped_area() helper
      drm/vmwgfx: Introduce a huge page aligning TTM range manager
      drm/vmwgfx: Hook up the helpers to align buffer objects

 drivers/gpu/drm/drm_file.c                 | 141 ++++++++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_bo_vm.c            | 161 +++++++++++++++++++++++++++-
 drivers/gpu/drm/vmwgfx/Makefile            |   1 +
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        |  13 +++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  12 +++
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c |  76 ++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c        | 166 +++++++++++++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |   2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c   |   5 +-
 include/drm/drm_file.h                     |   9 ++
 include/drm/ttm/ttm_bo_api.h               |   3 +-
 include/linux/fs.h                         |   2 +-
 include/linux/huge_mm.h                    |  41 ++++++-
 include/linux/mm.h                         |  17 +++
 mm/huge_memory.c                           |  44 ++++++--
 mm/memory.c                                |  27 +++--
 16 files changed, 692 insertions(+), 28 deletions(-)
 create mode 100644 drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

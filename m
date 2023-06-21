Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EA8738BF2
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 18:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802CA10E323;
	Wed, 21 Jun 2023 16:46:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 742AB10E324
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 16:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=gPF8zQQSIHiKU2e2Ly4ej0SDtpoejzkFWwWEYtBtv+s=; b=R6XCM2zV5SdOXGzdC4zN24TUJT
 M4veWjCAPq0VNUMCOXwK50bgiMz71O8YN/hsbWICKjaGBn0L/hOi6O3vzf8WibWLHu9fl3oQnQsny
 VGKEA7Ik15shC5pM7bj5sOsWEZqfwMVm1w/UApf/gyrXm2EOIwgAe4VVVX5iq6/R6BNzAkxe/vJHh
 XJoF4JmL38Rj6+7jZjgWTJ1XxMEElaDGBPXE4ET31k0NcLCnoFJ3RJwwdIo3TnQpnX9h+isSLIe6j
 JkTmNrRbvZfY6wvO0Tfw3qOS6OftxBxHLANWzL3TPle2V4DyHE+CsN5B7LgFifpOLmUjM6a7p9apc
 NtFA7iFA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qC0y1-00EjDe-6y; Wed, 21 Jun 2023 16:46:01 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 00/13] Remove pagevecs
Date: Wed, 21 Jun 2023 17:45:44 +0100
Message-Id: <20230621164557.3510324-1-willy@infradead.org>
X-Mailer: git-send-email 2.37.1
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
Cc: linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-afs@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We're almost done with the pagevec -> folio_batch conversion.  Finish
the job.

Matthew Wilcox (Oracle) (13):
  afs: Convert pagevec to folio_batch in afs_extend_writeback()
  mm: Add __folio_batch_release()
  scatterlist: Add sg_set_folio()
  i915: Convert shmem_sg_free_table() to use a folio_batch
  drm: Convert drm_gem_put_pages() to use a folio_batch
  mm: Remove check_move_unevictable_pages()
  pagevec: Rename fbatch_count()
  i915: Convert i915_gpu_error to use a folio_batch
  net: Convert sunrpc from pagevec to folio_batch
  mm: Remove struct pagevec
  mm: Rename invalidate_mapping_pagevec to mapping_try_invalidate
  mm: Remove references to pagevec
  mm: Remove unnecessary pagevec includes

 drivers/gpu/drm/drm_gem.c                 | 68 +++++++++++++----------
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 55 ++++++++++--------
 drivers/gpu/drm/i915/i915_gpu_error.c     | 50 ++++++++---------
 fs/afs/write.c                            | 16 +++---
 include/linux/pagevec.h                   | 67 +++-------------------
 include/linux/scatterlist.h               | 24 ++++++++
 include/linux/sunrpc/svc.h                |  2 +-
 include/linux/swap.h                      |  1 -
 mm/fadvise.c                              | 17 +++---
 mm/huge_memory.c                          |  2 +-
 mm/internal.h                             |  4 +-
 mm/khugepaged.c                           |  6 +-
 mm/ksm.c                                  |  6 +-
 mm/memory.c                               |  6 +-
 mm/memory_hotplug.c                       |  1 -
 mm/migrate.c                              |  1 -
 mm/migrate_device.c                       |  2 +-
 mm/readahead.c                            |  1 -
 mm/swap.c                                 | 20 +++----
 mm/swap_state.c                           |  1 -
 mm/truncate.c                             | 27 +++++----
 mm/vmscan.c                               | 17 ------
 net/sunrpc/svc.c                          | 10 ++--
 23 files changed, 185 insertions(+), 219 deletions(-)

-- 
2.39.2


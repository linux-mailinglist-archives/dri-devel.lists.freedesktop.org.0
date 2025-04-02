Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8CFA791AF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 17:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 191D810E817;
	Wed,  2 Apr 2025 15:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="ScTsTzt7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0449210E7F8;
 Wed,  2 Apr 2025 15:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=JrWfZHYaL1LB2CfV3wA6B/ZV3xONYPAnicrYvr7FKzI=; b=ScTsTzt7A9KqbWcH+wfjuvFyEF
 p8UcTNQSyVSGqkHBnpx/RaVrlyhPH+97A0cB4uZrbN6Dvn0Z8imW2i5xQORC+EaVlmOalg8rgX8ou
 uetEj7BIdtEiE/cxYdPeQTYYeG3cmuWHI7sfzF/tIPEGBnW3WN00BLf4VXN5yt5+A/6xqjcGyg+GU
 jt8bImdTOgS7baV2zVD+5+m6ad6mvjOqnmCur8NpI695S0vEumnhOZpMU12g58CZwD2m0tVjtWmqb
 fw0qhf/pRz+i/hH9RYkdaUUcpAKy1IZ1oK12wPWuh29tYSlOtLHULMclZ8PvKTunXEEWiUpwTGHCC
 fyG6Fnrg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzzZW-00000009gs5-484m;
 Wed, 02 Apr 2025 15:00:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/9] Remove aops->writepage
Date: Wed,  2 Apr 2025 15:59:54 +0100
Message-ID: <20250402150005.2309458-1-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have just one filesystm (vboxsf) left which implements ->writepage.
This patchset converts it to writepages then removes all the callers
of ->writepage.

v1: https://lore.kernel.org/linux-mm/20250307135414.2987755-1-willy@infradead.org/
v2:
 - Added ttm patch
 - Remove f2fs patches as they were merged
 - Add 9p patch
 - Add warning in migration code about aops which set writepages but not
   migrate_folio

Matthew Wilcox (Oracle) (9):
  9p: Add a migrate_folio method
  vboxsf: Convert to writepages
  migrate: Remove call to ->writepage
  writeback: Remove writeback_use_writepage()
  shmem: Add shmem_writeout()
  i915: Use writeback_iter()
  ttm: Call shmem_writeout() from ttm_backup_backup_page()
  mm: Remove swap_writepage() and shmem_writepage()
  fs: Remove aops->writepage

 Documentation/admin-guide/cgroup-v2.rst   |  2 +-
 Documentation/filesystems/fscrypt.rst     |  2 +-
 Documentation/filesystems/locking.rst     | 54 +-------------------
 Documentation/filesystems/vfs.rst         | 39 ++++-----------
 block/blk-wbt.c                           |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 32 +++---------
 drivers/gpu/drm/ttm/ttm_backup.c          |  8 +--
 fs/9p/vfs_addr.c                          |  1 +
 fs/buffer.c                               |  4 +-
 fs/vboxsf/file.c                          | 47 +++++++++---------
 include/linux/fs.h                        |  1 -
 include/linux/shmem_fs.h                  |  7 +--
 mm/migrate.c                              | 60 +++--------------------
 mm/page-writeback.c                       | 28 +----------
 mm/page_io.c                              |  3 +-
 mm/shmem.c                                | 33 ++++++-------
 mm/swap.h                                 |  4 +-
 mm/swap_state.c                           |  1 -
 mm/swapfile.c                             |  2 +-
 mm/vmscan.c                               | 29 ++++++-----
 20 files changed, 101 insertions(+), 258 deletions(-)

-- 
2.47.2


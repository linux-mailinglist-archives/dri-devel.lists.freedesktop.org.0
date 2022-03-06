Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33694CE910
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 06:33:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8D310F26D;
	Sun,  6 Mar 2022 05:33:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1A510F26D;
 Sun,  6 Mar 2022 05:32:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 419F7B80E52;
 Sun,  6 Mar 2022 05:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60900C340EF;
 Sun,  6 Mar 2022 05:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646544776;
 bh=UBl0Cn7SYsEWQP0mkjEP12HH7xWeNZim7VPPZ9aaiTE=;
 h=From:To:Cc:Subject:Date:From;
 b=Nf4TxnefPNULT2ZF3w48Nx7IyrXI5cg6baok7cswurLbnmnnvxlwM1h48wZmVZqsZ
 R7BGYtVkCdA6nOUw637GmAnQlhXlwvvKtg9NjL/U8AFj/y1qwytcUVhmH3ABo9g8LY
 ubG06ZdBvHGqJ25qOIPJdf9/zPqxaQVyGDLy1tcIywZuflGcW62KsH8VknB28YY2hS
 x9L/nacEEpqYzBOA3jynG83BWpGh7zSPw9a1x7ETRC74lUEJ2XlG2qQaXTnYvov+QK
 AH17RQQXWyUnxGpsz32x9Sp5z+wG7//6e1d5/zMAVW3hcSnQUhLJjXWAo+fa7vx3r1
 CtEqFjQJdNo6w==
From: Jarkko Sakkinen <jarkko@kernel.org>
To: linux-mm@kvack.org
Subject: [PATCH RFC 0/3] MAP_POPULATE for device memory
Date: Sun,  6 Mar 2022 07:32:04 +0200
Message-Id: <20220306053211.135762-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.35.1
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
Cc: Michal Hocko <mhocko@suse.com>, zhangyiru <zhangyiru3@huawei.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Jason Ekstrand <jason@jlekstrand.net>,
 Alexander Mikhalitsyn <alexander.mikhalitsyn@virtuozzo.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-unionfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, Matthew Auld <matthew.auld@intel.com>,
 Vasily Averin <vvs@virtuozzo.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Shakeel Butt <shakeelb@google.com>,
 Reinette Chatre <reinette.chatre@intel.com>, linux-sgx@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nathaniel McCallum <nathaniel@profian.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Alexey Gladkov <legion@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For device memory (aka VM_IO | VM_PFNMAP) MAP_POPULATE does nothing. Allow
to use that for initializing the device memory by providing a new callback
f_ops->populate() for the purpose.

SGX patches are provided to show the callback in context.

An obvious alternative is a ioctl but it is less elegant and requires
two syscalls (mmap + ioctl) per memory range, instead of just one
(mmap).

Jarkko Sakkinen (3):
  mm: Add f_ops->populate()
  x86/sgx: Export sgx_encl_page_alloc()
  x86/sgx: Implement EAUG population with MAP_POPULATE

 arch/mips/kernel/vdso.c                    |   2 +-
 arch/x86/kernel/cpu/sgx/driver.c           | 129 +++++++++++++++++++++
 arch/x86/kernel/cpu/sgx/encl.c             |  38 ++++++
 arch/x86/kernel/cpu/sgx/encl.h             |   3 +
 arch/x86/kernel/cpu/sgx/ioctl.c            |  38 ------
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |   2 +-
 fs/coda/file.c                             |   2 +-
 fs/overlayfs/file.c                        |   2 +-
 include/linux/fs.h                         |  12 +-
 include/linux/mm.h                         |   2 +-
 ipc/shm.c                                  |   2 +-
 mm/mmap.c                                  |  10 +-
 mm/nommu.c                                 |   4 +-
 13 files changed, 193 insertions(+), 53 deletions(-)

-- 
2.35.1


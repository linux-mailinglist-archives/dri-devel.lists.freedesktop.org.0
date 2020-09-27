Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7286F279EFE
	for <lists+dri-devel@lfdr.de>; Sun, 27 Sep 2020 08:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B71C6E233;
	Sun, 27 Sep 2020 06:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7996E0D4;
 Sun, 27 Sep 2020 06:46:53 +0000 (UTC)
Received: from localhost (unknown [213.57.247.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0EEF42388B;
 Sun, 27 Sep 2020 06:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601189212;
 bh=xmCWyq6RaSo+IrJCKqTPZpDrslEZVwXOjyafz2NWLM8=;
 h=From:To:Cc:Subject:Date:From;
 b=i4AsYz9MIRN1LDK4025GeUsETw5MBForxmQKvrFe3zsXWAL6+vLRsxxcCY+yVdv6z
 8aFC+NMY7rO9MngEnKE9gkvBIZ2HUPhcO79jnHd6BbFu/AobEIuvqF4gZnLYU29S6v
 O3qmEuEcMO8PDuX5+xS7aypHnOdKzXqCWw5gUyWE=
From: Leon Romanovsky <leon@kernel.org>
To: Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: [PATCH rdma-next v4 0/4] Dynamicaly allocate SG table from the pages
Date: Sun, 27 Sep 2020 09:46:43 +0300
Message-Id: <20200927064647.3106737-1-leon@kernel.org>
X-Mailer: git-send-email 2.26.2
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 Maor Gottlieb <maorg@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Leon Romanovsky <leonro@nvidia.com>


Changelog:
v4:
 * Fixed formatting in first patch.
 * Added fix (clear tmp_netnts) in first patch to fix i915 failure.
 * Added test patches
v3: https://lore.kernel.org/linux-rdma/20200922083958.2150803-1-leon@kernel.org/
 * Squashed Christopher's suggestion to avoid introduced new API, but extend existing one.
v2: https://lore.kernel.org/linux-rdma/20200916140726.839377-1-leon@kernel.org
 * Fixed indentations and comments
 * Deleted sg_alloc_next()
 * Squashed lib/scatterlist patches into one
v1: https://lore.kernel.org/lkml/20200910134259.1304543-1-leon@kernel.org
 * Changed _sg_chain to be __sg_chain
 * Added dependency on ARCH_NO_SG_CHAIN
 * Removed struct sg_append
v0:
 * https://lore.kernel.org/lkml/20200903121853.1145976-1-leon@kernel.org

--------------------------------------------------------------------------
From Maor:

This series extends __sg_alloc_table_from_pages to allow chaining of
new pages to already initialized SG table.

This allows drivers to utilize the optimization of merging contiguous
pages without a need to pre allocate all the pages and hold them in
a very large temporary buffer prior to the call to SG table initialization.

The second patch changes the Infiniband driver to use the new API. It
removes duplicate functionality from the code and benefits the
optimization of allocating dynamic SG table from pages.

In huge pages system of 2MB page size, without this change, the SG table
would contain x512 SG entries.
E.g. for 100GB memory registration:

             Number of entries      Size
    Before        26214400          600.0MB
    After            51200            1.2MB

Thanks

Maor Gottlieb (2):
  lib/scatterlist: Add support in dynamic allocation of SG table from
    pages
  RDMA/umem: Move to allocate SG table from pages

Tvrtko Ursulin (2):
  tools/testing/scatterlist: Rejuvenate bit-rotten test
  tools/testing/scatterlist: Show errors in human readable form

 drivers/gpu/drm/i915/gem/i915_gem_userptr.c |  12 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c  |  15 +-
 drivers/infiniband/core/umem.c              |  92 ++---------
 include/linux/scatterlist.h                 |  43 +++---
 lib/scatterlist.c                           | 160 +++++++++++++++-----
 lib/sg_pool.c                               |   3 +-
 tools/testing/scatterlist/Makefile          |   3 +-
 tools/testing/scatterlist/linux/mm.h        |  35 +++++
 tools/testing/scatterlist/main.c            |  53 +++++--
 9 files changed, 248 insertions(+), 168 deletions(-)

--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

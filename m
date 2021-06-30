Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 731F13B82AA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 15:07:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 606C36E138;
	Wed, 30 Jun 2021 13:07:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C216E105;
 Wed, 30 Jun 2021 13:07:18 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10030"; a="195634516"
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="195634516"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 06:07:17 -0700
X-IronPort-AV: E=Sophos;i="5.83,312,1616482800"; d="scan'208";a="558290323"
Received: from vanderss-mobl.ger.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.133])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2021 06:07:15 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/i915/gem: dma-buf fixes for migration
Date: Wed, 30 Jun 2021 15:06:59 +0200
Message-Id: <20210630130701.349458-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Our dma-buf code is currently completely broken unless the importer is
dynamic in which case the sg_list caching saves the day. In particular,
the case where another instance of our driver tries to import a dma-buf
exported by our driver ends up in a recursive lock.

Since the recent TTM migration work spec specifies to fix up the dma-buf
code with migration and there's no point in doing so when it's
completely broken, take a first step to make at least the exporter obey
the dma-buf locking rules the dma-buf core enforces for a dynamic exporter:

- Implement and act on pin- and unpin.
- Call move_notify if migrating. (we opt not to migrate while dma-buf_mapped).
- map_dma_buf() is unconditionally called locked.

Add a selftest that ensures that it works with both our own and a fake
dynamic importer.

Also implement migration in the second patch before pinning in pin()
and map_dma_buf().

Note that the importer remains broken for other non-dynamic exporters, but
at least not for the same-driver-separate-instances case.

Regardless whether we want to fix this now with this series, or in an
unspecified future, the selftest may come in handy.

Thomas Hellström (2):
  drm/i915/gem: Make our dma-buf exporter dynamic
  drm/i915/gem: Migrate to system at dma-buf map time

 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  48 ++++++-
 .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 118 +++++++++++++++++-
 2 files changed, 162 insertions(+), 4 deletions(-)

-- 
2.31.1


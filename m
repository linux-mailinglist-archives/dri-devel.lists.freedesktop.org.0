Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE979B26161
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56F410E2C0;
	Thu, 14 Aug 2025 09:48:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X5+rh+QN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2260410E2C0;
 Thu, 14 Aug 2025 09:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755164933; x=1786700933;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oHZCjCggCGmF2cqQ/pqAIGefHXk/xNas8BCsSHYLSzI=;
 b=X5+rh+QN9MyOtF5aqOPFM7jCoKCjLwqcTmw+URELBUq79wq52iNcHZIa
 BAQkyNpTbzk9wEUuCJXDtir7VJJIOYya3EdrOKJK3kyDlsCSBj+yuzB6m
 Ep59hwl/NjF1wKG5G9Z80eeVrmKxWszr8n5EoVvJKeA3c9TX8VWMRLvuA
 30QnEoHUocMBs8whCkrRH6H9wL86bxAsFBrJq/lqJZFSPQeAOdlf1z/26
 JnOYVa0nGGK1RQT6zFe15dMpTcoHXric93jYAZokQD3FJVtdHMqjdt3t9
 xKhV2aqky+YnP1OPQB54P77kZ2AG/oA/EpSe7KbRe7Oxw0AWEwnMyUeK6 g==;
X-CSE-ConnectionGUID: 9ZrXPYRjQYWbX0M6U9bM5Q==
X-CSE-MsgGUID: WzAVNyLITUaN9PZOvF+O3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67746945"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="67746945"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 02:48:53 -0700
X-CSE-ConnectionGUID: bMnA+89jTyC7F2UB3p4EAA==
X-CSE-MsgGUID: i2qJNeW5RP22Q9bH7GHNVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="166980939"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.150])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 02:48:49 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH 0/4] dma-buf/fence-chain: Speed up processing of rearmed
 callbacks
Date: Thu, 14 Aug 2025 10:16:11 +0200
Message-ID: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CI results indicate excessive time spent on processing of wait_backward
selftest.  The test case enables signaling on each link of a 4096 links
long chain, then signals those links one after another in reverse order.
That scanario corresponds to user space potentially building a dma_fence
chain of an arbitrary length step by step, e.g. via drm_syncobj IOCTLs,
and each step waiting on a chain link it has added.

When first user starts waiting on a not yet signaled fence of a chain
link, or signaling is explicitly enabled on it, a dma_fence_chain callback
is added to a user fence of that link.  When the user fence of that chain
link is then signaled, the chain is traversed in search for a first not
signaled link and the callback is rearmed on a user fence of that link.
Each time an arbitrary user fence is signaled, all dma_fence_chain
callbacks added to it so far must be rearmed to another user fence of the
chain.  In extreme scenarios, when all N links of a chain are awaited and
then signaled in reverse order, the dma_fence_chain callback may be called
up to N * (N + 1) / 2 times (an arithmetic series).

To avoid that potential excessive accumulation of dma_fence_chain
callbacks, rearm a trimmed-down, signal only callback version to the base
fence of a previous link, if not yet signaled, otherwise just signal the
base fence of the current link instead of traversing the chain in search
for a first not signaled link and moving all callbacks collected so far to
a user fence of that link.

For more clear correspondence to a potential userspace scenario, update
the wait_* selftests so they actually wait on each link fence of the chain
instead of just enabling signaling.  For easy evaluation of the change
impact, report processing time of signaling loop of each wait_* test case.


Janusz Krzysztofik (4):
  dma-buf/fence-chain: Report time spent in wait_* test cases
  dma-buf/fence-chain: Let test cases decide which fence to wait on
  dma-buf/fence-chain: Wait on each tested chain link
  dma-buf/fence-chain: Speed up processing of rearmed callbacks

 drivers/dma-buf/dma-fence-chain.c    | 101 ++++++++++++++++----
 drivers/dma-buf/st-dma-fence-chain.c | 133 +++++++++++++++++++++------
 2 files changed, 189 insertions(+), 45 deletions(-)

-- 
2.50.1


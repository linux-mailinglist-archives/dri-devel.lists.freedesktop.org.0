Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3854B9A8B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 09:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5E210E9A9;
	Thu, 17 Feb 2022 08:06:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66E910E9A7;
 Thu, 17 Feb 2022 08:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645085201; x=1676621201;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1+WEwUVqnFRXICc+zmyLmv5NFYJ5z3vpZjiO9Cn9qHE=;
 b=WNqxJGRPce7xP2jl6oBOVbrvN7RoAhnCM2bT9LQ8QslPBCyzDPQCQs9N
 7kL0Ck2Ol5LlQbEBkLe8tL+YWPkF/ouDBf32JgccSZnhIrG5cQxuuv9UY
 6M7SlugHoe/6WSVKfcEk4CmeZaTcD9zPS1QHAk3je3LwbcCvVSCa4ZQgc
 tAEbqJrx0uBgZXkdNk9EaMcQ6/of34RX59dAShELFp2lBffxrunt6ovlu
 mQYs0FRQ5rzjJHMV7cSH2U+sIDnQ+dmQLcJd5h7ogTt/N5KG+V7z+DklP
 OuXQ85guCsBdOaS0N5ktu5VJp5bnPVsCigcQgFw6INz9rKwWePyyFAOyo A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="314088974"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="314088974"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 00:06:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; d="scan'208";a="501531623"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 00:06:40 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/mm: Add an iterator to optimally walk over holes
 suitable for an allocation
Date: Wed, 16 Feb 2022 23:50:11 -0800
Message-Id: <20220217075014.922605-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The first patch is a drm core patch that replaces the for loop in
drm_mm_insert_node_in_range() with the iterator and would not
cause any functional changes. The second patch is a i915 driver
specific patch that also uses the iterator but solves a different
problem.

v2:
- Added a new patch to this series to fix a potential NULL
  dereference.
- Fixed a typo associated with the iterator introduced in the
  drm core patch.
- Added locking around the snippet in the i915 patch that
  traverses the GGTT hole nodes.

Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Christian König <christian.koenig@amd.com>

Vivek Kasireddy (3):
  drm/mm: Ensure that the entry is not NULL before extracting rb_node
  drm/mm: Add an iterator to optimally walk over holes for an allocation
    (v4)
  drm/i915/gem: Don't try to map and fence large scanout buffers (v8)

 drivers/gpu/drm/drm_mm.c        |  37 +++++-----
 drivers/gpu/drm/i915/i915_gem.c | 124 +++++++++++++++++++++++---------
 include/drm/drm_mm.h            |  36 ++++++++++
 3 files changed, 144 insertions(+), 53 deletions(-)

-- 
2.34.1


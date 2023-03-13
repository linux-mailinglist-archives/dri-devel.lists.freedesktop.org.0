Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848366B7F67
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 18:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F43310E5D6;
	Mon, 13 Mar 2023 17:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BF2910E5D3;
 Mon, 13 Mar 2023 17:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678728285; x=1710264285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M+8llYfU5DkATQH8XYEVBx0dwEiKJNGHgN32m1zPY2I=;
 b=NY0MJxdtU7J+X3duvYTC4clu1skg+BKj8DBtJwlsakQWUNx2nvRCXdxK
 v+RJiZNP89yiOI1J2lTnTZrBP9sfFoatOlP6XQiCXueoQpuaLn+0s4pht
 LNxmaaoq6WVRfNKmdcahNuACWkdvRezO5KVa0JZORIJcv3xDk2Qk53X3y
 7rx6oyirYzEND/YcL06tfhEvSAeqoLxGGKURcfVAWkewjWfFfSBiqqFl5
 iBJV6f6oYXxwKOrqdEvHn6raw28vnvr4T/I7fZ2FJtSrejLT6baJLAOEn
 0r0RS7KhavJWicYlcINyEmCgGe22JAoN8jIjKNmZEowoMEo8Hf33Ka+HT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="321062293"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="321062293"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 10:24:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924586728"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="924586728"
Received: from jkrzyszt-mobl1.ger.corp.intel.com (HELO
 jkrzyszt-mobl1.intranet) ([10.213.1.93])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 10:24:40 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/3] drm/i915/active: Fix other potential list corruption root
 causes
Date: Mon, 13 Mar 2023 18:24:12 +0100
Message-Id: <20230313172415.125932-1-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While perfroming root cause analyses of fence callback list corruptions,
a couple of other potential though less likely root causes have been
identified in addition to barrier tasks list deletion results ignored.
This series tries to fix those potential issues, also in longterm stable
releases starting from v5.10.  The third patch, while not fixing any real
bug, is believed to make the code more predictable and easy to understand,
then more easy to debug should other barrier related issue still exist.

Janusz Krzysztofik (3):
  drm/i915/active: Serialize preallocation of idle barriers
  drm/i915/active: Serialize use of barriers as fence trackers
  drm/i915/active: Simplify llist search-and-delete

 drivers/gpu/drm/i915/i915_active.c | 124 ++++++++++++++++++-----------
 1 file changed, 78 insertions(+), 46 deletions(-)

-- 
2.25.1


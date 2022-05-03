Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B9A517D41
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 08:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2782B10FE01;
	Tue,  3 May 2022 06:15:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7F210FE00;
 Tue,  3 May 2022 06:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651558554; x=1683094554;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CpgxHoasoCjAahnwUEYAJ3jYQqTT6BFB3I4HnxPt7kM=;
 b=lcsjcZ3KH/jND8Q1zO5ewBKVqiK+h7MXI2iTWLS06BB1jFq/SYEx8bnX
 EVzQ9aJFjBtUO3FzRytVXF/yz4eJa3sC1L6uHNo5ZmRA/CIIcqpeR/ovF
 tPU7HA9xBxfrswqADlpPpI14+eIJtWw89m/qFhDGmAlwMsHBJTtun+ElL
 2K+ICz2D6Tz26yImnpnyDnp+2qjSdADk9dyTcrDg6WrmQEAfmBiuwMK6S
 73YlbfBZAtDgOpHVKvFXYSGe7GQWvRtCfcwv45S/e76VlLOkm1T3fjzpb
 WKj6Ax1X0oKX4/9bT75hu5NP6xKu3ygdEOaj5rmXBgslTiNIl75lyzapv g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="267283119"
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="267283119"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 23:15:53 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="653143918"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 23:15:53 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/gem: Make drop_pages() return bool
Date: Mon,  2 May 2022 23:15:56 -0700
Message-Id: <20220503061556.513175-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.36.0
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit e4e806253003 ("drm/i915: Change shrink ordering to use locking
around unbinding.") changed the return type to int without changing the
return values or their meaning to "0 is success". Move it back to
boolean.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
index 6a6ff98a8746..1030053571a2 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
@@ -36,7 +36,7 @@ static bool can_release_pages(struct drm_i915_gem_object *obj)
 	return swap_available() || obj->mm.madv == I915_MADV_DONTNEED;
 }
 
-static int drop_pages(struct drm_i915_gem_object *obj,
+static bool drop_pages(struct drm_i915_gem_object *obj,
 		       unsigned long shrink, bool trylock_vm)
 {
 	unsigned long flags;
-- 
2.36.0


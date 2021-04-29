Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EED36E71A
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 10:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F6E6EDB5;
	Thu, 29 Apr 2021 08:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB3B6EDB5;
 Thu, 29 Apr 2021 08:35:44 +0000 (UTC)
IronPort-SDR: 761ZnhlQJLZLBF0hn/BFAYjVzuD4neTulPTPWWeTnw9meH2QUMsXQ8zXarTBJVtnR3Orkmo2PB
 iJEEMkPUCTfA==
X-IronPort-AV: E=McAfee;i="6200,9189,9968"; a="176435774"
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="176435774"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 01:35:43 -0700
IronPort-SDR: 7F8FaQqYJw6p1wDlgx7bsVny6KoYaEoVmKaxMZ3ETAP5QyO9uOLjB+97S9MZiM2PzUrTRmmnTP
 Qf4c9EkK1zZA==
X-IronPort-AV: E=Sophos;i="5.82,258,1613462400"; d="scan'208";a="423971294"
Received: from gwaise-mobl1.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.208.64])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2021 01:35:41 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/overlay: Fix active retire callback alignment
Date: Thu, 29 Apr 2021 09:35:29 +0100
Message-Id: <20210429083530.849546-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

__i915_active_call annotation is required on the retire callback to ensure
correct function alignment.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: a21ce8ad12d2 ("drm/i915/overlay: Switch to using i915_active tracking")
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index fffbde4256db..428819ba18dd 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -383,7 +383,7 @@ static void intel_overlay_off_tail(struct intel_overlay *overlay)
 		i830_overlay_clock_gating(dev_priv, true);
 }
 
-static void
+__i915_active_call static void
 intel_overlay_last_flip_retire(struct i915_active *active)
 {
 	struct intel_overlay *overlay =
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

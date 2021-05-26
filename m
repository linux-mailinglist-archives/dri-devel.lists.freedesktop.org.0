Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 884C33919BE
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 16:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF2F6ED8D;
	Wed, 26 May 2021 14:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4526A6ED74;
 Wed, 26 May 2021 14:15:40 +0000 (UTC)
IronPort-SDR: StluCb+EMcEoVFYod2JLAVhdL6u7eu79aSYvjEMscxIQeAVVyGz75rUoo8HWlDOK6ej/VNv7+0
 N4bitXdLDifg==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223660666"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="223660666"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:23 -0700
IronPort-SDR: WhY2rwh71IMvB8AzD8ZwUIVqKNac3qIBNmivhC/i/ju0nlhk/LTCTHV/dB28QRJFOJ/2u2AoDI
 KNvidS28YxWg==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="547206464"
Received: from wardmich-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.209.181])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 07:15:21 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/12] drm/i915/selftests: Remove redundant set-to-gtt-domain
 before batch submission
Date: Wed, 26 May 2021 15:14:55 +0100
Message-Id: <20210526141456.2334192-12-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
References: <20210526141456.2334192-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

In construction the rpcs_query batch we know that it is device coherent
and ready for execution, the set-to-gtt-domain here is redudant.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
index 3d8d5f242e34..eed5be597eee 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
@@ -954,8 +954,6 @@ emit_rpcs_query(struct drm_i915_gem_object *obj,
 	err = i915_gem_object_lock(obj, &ww);
 	if (!err)
 		err = i915_gem_object_lock(rpcs, &ww);
-	if (!err)
-		err = i915_gem_object_set_to_gtt_domain(obj, false);
 	if (!err)
 		err = i915_vma_pin_ww(vma, &ww, 0, 0, PIN_USER);
 	if (err)
-- 
2.30.2


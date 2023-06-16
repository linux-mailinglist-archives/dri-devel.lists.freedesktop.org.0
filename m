Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ADF733C1C
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jun 2023 00:11:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B670010E693;
	Fri, 16 Jun 2023 22:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD5D10E142;
 Fri, 16 Jun 2023 22:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686953474; x=1718489474;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MsOHNhkZdw47mpRisnLrelTXF7tLgbhgwW8ZJ6fjMEk=;
 b=gD7fL3vD6/NkMr5RtIl35Zlicxt+W/TxlVKQgWcekCIclY/cntmo/KRk
 kPz5JLPZ1T2PXRPmWSL326Sq0qDXM9v23IDySCEC7QJnFFSDReY4KuXm+
 XmBxY0jgaR41OaBmE4Uve4obORa0RI2PSfN1HI1dcRkRZbgSOUyIpyqPU
 8x/F0V/hhucsxVw+nvN7e88xxc/U2Qz/XG+EPogMviwrQGH0B78/RUyg0
 YAkDwSf3dMnMjvMJ6tqD0ILtAy4dcJ2OIYTbHegiOihA6dxQwTHhLsJ2w
 bT7+VebQBb3oaxJvOS8hps90K+D8aXrIVj94ZmghVH7AQXEDQIP8mJxxp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="359333674"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="359333674"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2023 15:11:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="690403337"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; d="scan'208";a="690403337"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.12])
 by orsmga006.jf.intel.com with ESMTP; 16 Jun 2023 15:11:12 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/gt: Remove incorrect hard coded cache coherrency
 setting
Date: Fri, 16 Jun 2023 15:11:10 -0700
Message-Id: <20230616221110.1045918-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previouse i915_gem_object_create_internal already set it with proper
value before function return. This hard coded setting is incorrect for
platforms like MTL, thus need to be removed.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_timeline.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index b9640212d659..693d18e14b00 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -26,8 +26,6 @@ static struct i915_vma *hwsp_alloc(struct intel_gt *gt)
 	if (IS_ERR(obj))
 		return ERR_CAST(obj);
 
-	i915_gem_object_set_cache_coherency(obj, I915_CACHE_LLC);
-
 	vma = i915_vma_instance(obj, &gt->ggtt->vm, NULL);
 	if (IS_ERR(vma))
 		i915_gem_object_put(obj);
-- 
2.34.1


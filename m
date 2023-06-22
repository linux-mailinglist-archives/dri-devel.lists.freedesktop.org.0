Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6DF73A4D3
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 17:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A48D010E58C;
	Thu, 22 Jun 2023 15:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23AE010E589;
 Thu, 22 Jun 2023 15:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687447608; x=1718983608;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MsOHNhkZdw47mpRisnLrelTXF7tLgbhgwW8ZJ6fjMEk=;
 b=NHBGYTw9cNPL0ge9cxuEAb6Nlj9giTy0qrGKC6m4Oga/zXt89RXD/Iq6
 fTWNTEfPHiEoN7O9UUsSHIdQsREvVEat5jCDzATP52XN8rWjMoxW3eTaT
 FtrPohqDWkv1jh07VhKEWpP8GnCiVIio6uhv1OQs5ssc9JbYW2FYZlUYk
 wvNRiUz23Tj6GPXyhMrqV3Mk7A5r7PEIH14LI4AUU6/CBNjF1sMByjmTg
 GOo5B+UusKd5mYHIJctNNLSaQqZPtEukHI9mUbqB6Irjgl254pCPUBrYC
 dOPtwMtaMygpoborVdbpXHw34qKRLbX1EZH5yIGykCPxtK1VaaRN2Oi6B g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="340858721"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="340858721"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 08:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="1045223063"
X-IronPort-AV: E=Sophos;i="6.01,149,1684825200"; d="scan'208";a="1045223063"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.12])
 by fmsmga005.fm.intel.com with ESMTP; 22 Jun 2023 08:26:46 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/gt: Remove incorrect hard coded cache coherrency
 setting
Date: Thu, 22 Jun 2023 08:26:44 -0700
Message-Id: <20230622152644.169400-1-zhanjun.dong@intel.com>
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


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBDB6F1E6A
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 20:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8004410EDC6;
	Fri, 28 Apr 2023 18:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E4E10EDB8;
 Fri, 28 Apr 2023 18:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682708309; x=1714244309;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dUyyu8pmFBbWpj+pEuFHpB7A16dEuG/eMJujD38nygM=;
 b=C8pamLJ2Ba8XR8OtP4+3Aef1KXzfWyXrDjIG8XXBfJ9jKNsiiqNW88Fx
 SPRlSKAjoPzULF/O3kXR6v/BUdgBK3qcyBrCSq4iidr1HYBTIiETCZUde
 BZmrG/0xvB5jD+jueSzX+mUPxkUYgDGrXfwxEjrIxS7D/gmxEQii9PBZh
 PDA9rdgepm7kPfa643TMgV1agxfUkL36xx/co88zyIdRxBgH49aCrpEG3
 3FHDYCQ41m5Quy3iKIJZqPqLj7kwRT4IfOqTaLkTlW5gOFLbD6ia9jZgB
 3EdRQqNvOqQXlESFy9liM2U+fP0PQejPTYUWtl1m4k/8OuxIOXiT0u4It g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="350747181"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="350747181"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 11:58:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="645254614"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; d="scan'208";a="645254614"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 11:58:29 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 7/8] drm/i915/mtl/huc: Use the media gt for the HuC getparam
Date: Fri, 28 Apr 2023 11:58:09 -0700
Message-Id: <20230428185810.4127234-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428185810.4127234-1-daniele.ceraolospurio@intel.com>
References: <20230428185810.4127234-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On MTL, for obvious reasons, HuC is only available on the media tile.
We already disable SW support for HuC on the root gt due to the
absence of VCS engines, but we also need to update the getparam to point
to the HuC struct in the media GT.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_getparam.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 2238e096c957..7aa47550e4f2 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -98,7 +98,11 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 		value = sseu->min_eu_in_pool;
 		break;
 	case I915_PARAM_HUC_STATUS:
-		value = intel_huc_check_status(&to_gt(i915)->uc.huc);
+		/* On platform with a media GT, the HuC is on that GT */
+		if (i915->media_gt)
+			value = intel_huc_check_status(&i915->media_gt->uc.huc);
+		else
+			value = intel_huc_check_status(&to_gt(i915)->uc.huc);
 		if (value < 0)
 			return value;
 		break;
-- 
2.40.0


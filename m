Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAA26F106C
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 04:35:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062A610EC3D;
	Fri, 28 Apr 2023 02:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC33F10EC27;
 Fri, 28 Apr 2023 02:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682649278; x=1714185278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dUyyu8pmFBbWpj+pEuFHpB7A16dEuG/eMJujD38nygM=;
 b=MZb99OyMcU5cLzG8TK6QFEtQEBnovYc8trNiktmonKorZ/cF8FN91wmd
 pkVXlCtKQi6N+d7PFSymNthwudBBQ0Z92lr2ZJuQGvjxqG4GKKlc6YLIC
 NPBv8uEgRftR5eUp4JWFa00HJeV3OYZngIP+858Y91tcPx5U4HGC2AXcg
 1Zq5InaszzS3ZVemzmCghLmKr3+Cp86u51W7AiQOOLg/gnTm8L8Lz5Dq1
 P1VgPF3DJEt7DZ56FVO66iDA4fw57e8CsFCEZqbFPvAJWFCSERZ2Mp75F
 UkFRK2gxchwQNYx0sLwckhfH+mGNUnl38taVWQXAF6/sQMfdQkJJ92qys w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346386514"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="346386514"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 19:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="644937249"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="644937249"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 19:34:38 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 7/8] drm/i915/mtl/huc: Use the media gt for the HuC getparam
Date: Thu, 27 Apr 2023 19:34:15 -0700
Message-Id: <20230428023416.4051910-8-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230428023416.4051910-1-daniele.ceraolospurio@intel.com>
References: <20230428023416.4051910-1-daniele.ceraolospurio@intel.com>
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


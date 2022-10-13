Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C4E5FCF1E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 02:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C65C10E286;
	Thu, 13 Oct 2022 00:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987E110E10C;
 Thu, 13 Oct 2022 00:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665619292; x=1697155292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GeHgFsygOObwNYeUUVx5RblLGSidVD3kegc/MT18pyo=;
 b=Kqg7k4R/YXxoRT6YWnTYQRET/HGyHjLyXu3tXcHYcjgFDTm6ZV/cbM5l
 Gbb4q1B0tnJMjn7XbOSYyG+rGlLZkGRaNF2tDIuiUADDGxlQZEtwhp8tB
 D9ESJDLsl03zD/HwO8AZ7gDNiM4ppf0BqLRQNOSNF+OXqxH571DkrhT1B
 snsME6PDllI1n4wz8XYpHhJSQXsGhVr0a50c+8mU7X3ciYh8au985EX5x
 mjAho+Sm0dfeMoPje5CM4udRL1pQXWBTxyXKhlFMhEU3kfzA5ZbTb1zGm
 XWgn6KxPCJ0g7vnC5vekRtLUy2FTm2FrCnHBCLh0aukKcn+u5tBUcTwKF g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="292263361"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="292263361"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 17:01:32 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="802031096"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="802031096"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 17:01:32 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm/i915/uc: fetch uc firmwares for each GT
Date: Wed, 12 Oct 2022 17:03:27 -0700
Message-Id: <20221013000332.1738078-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013000332.1738078-1-daniele.ceraolospurio@intel.com>
References: <20221013000332.1738078-1-daniele.ceraolospurio@intel.com>
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
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The FW binaries are independently loaded on each GT. On MTL, the memory
is shared so we could potentially re-use a single allocation, but on
discrete multi-gt platforms we are going to need independent copies,
so it is easier to do the same on MTL as well, given that the amount
of duplicated memory is relatively small (~500K).

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 55d605c0c55d..9093d2be9e1c 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -1140,7 +1140,8 @@ int i915_gem_init(struct drm_i915_private *dev_priv)
 	if (ret)
 		return ret;
 
-	intel_uc_fetch_firmwares(&to_gt(dev_priv)->uc);
+	for_each_gt(gt, dev_priv, i)
+		intel_uc_fetch_firmwares(&gt->uc);
 	intel_wopcm_init(&dev_priv->wopcm);
 
 	ret = i915_init_ggtt(dev_priv);
-- 
2.37.3


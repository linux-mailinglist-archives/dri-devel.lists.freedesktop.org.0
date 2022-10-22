Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133936082B5
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 02:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C780310E27E;
	Sat, 22 Oct 2022 00:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EFA10E298;
 Sat, 22 Oct 2022 00:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666397267; x=1697933267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GeHgFsygOObwNYeUUVx5RblLGSidVD3kegc/MT18pyo=;
 b=RNXb3+H+aBvysohX7w329z/7Hrv3r40XFes1qMjI6Aeh786mWXjumdyi
 eSObkfTXN0LfNmKdYlna8gIzfwZ9W6e5NEEgZc92qtYtWocEWsJNhnfQ+
 dgAeIYEYpGDcyXuFUNQkng7PW52Ji6tqyKGzcBdBWTjf8sHhbcpJo+Y6x
 f6fmJL6mFqmyzxiWh9xX0ufYguWNCjTculroY32DMa8aA803ApuEczXsT
 StlEQjZ9fe5QGype2GE29cvcx0BBi4yTyj70roEaBiFLyhCt43IA/uZiC
 RdCFXxMv8GhnC97K91/8Auke8cnywY9mzNqHAlrsgy1hDk6A77iE4OS1C w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="371354919"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="371354919"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 17:07:47 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="693917222"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="693917222"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 17:07:47 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/7] drm/i915/uc: fetch uc firmwares for each GT
Date: Fri, 21 Oct 2022 17:10:03 -0700
Message-Id: <20221022001008.2340224-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
References: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
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


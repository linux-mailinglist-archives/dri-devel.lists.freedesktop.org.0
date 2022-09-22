Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E205E6F70
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 00:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4306710E4D2;
	Thu, 22 Sep 2022 22:10:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6946210E476;
 Thu, 22 Sep 2022 22:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663884628; x=1695420628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U4xOZzqFiQhpk/cURvQ5wuqSR9QFPec6WpxlWKIJlnE=;
 b=BrPdMBKltH+rn52Erj+andUgGcqnAWQnmiFTVu0UGsfq31/p3SAVGIcM
 HWFAKSnFczP/4bQGZwRTteoTLbsTbRNRmFBrTcmvghdODlDmzXTIMKBjB
 UfkprDTwU4Ug62zyecZpmxKyvFJ75dWSC0ZTG/4wwrqa1+c2sOznmsivw
 DbCdcIRSNquWa2v9T1y95NfyUrNjT0AWL5kQGvZDk+VhJLqkTQGLZvPdt
 bopV3f6Aq3E+Kuzn0oOXHSeWnLKW9TXnce8PjrWrxnq6jnFv/ftyHvXqb
 Q3vZWge8w52pZkRZoS5G/PLI9b5UXHy9O3hLdQkeGwqGvnl6n3MoAHYZn Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="280815500"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="280815500"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 15:10:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; d="scan'208";a="682416236"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 15:10:28 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/7] drm/i915/uc: fetch uc firmwares for each GT
Date: Thu, 22 Sep 2022 15:11:12 -0700
Message-Id: <20220922221117.458087-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
References: <20220922221117.458087-1-daniele.ceraolospurio@intel.com>
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
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org
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
---
 drivers/gpu/drm/i915/i915_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 88df9a35e0fe..a5b192ac885c 100644
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


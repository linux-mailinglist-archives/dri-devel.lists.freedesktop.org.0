Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DFB572B67
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 04:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A75B611AFF4;
	Wed, 13 Jul 2022 02:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F320311A0D7;
 Wed, 13 Jul 2022 02:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657680230; x=1689216230;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o2DPgk1E6I//2denyXC8xZdqJrZpghXpjgCnZT1skY0=;
 b=IoO5UC7tUDAdaFN6pGrI8IrGKcgh6OGd1lhC9K1fxG2mMcxz/fPgVgj/
 UVXBnLeo90k7kc3yxkt1ccIGz1GDbeuMZQd7xntQ+c2EMmJroI5vTZzLj
 CtsDqyAFyNptQqg1kmPncI+07W+FcKpPcUAJytUtafAhBEHef6nuCCpFo
 I0rYJ+0VLYqF37SRPZ/4kER5lE3mFwZC9NzbR8zMOqpKAk9CRNK6qRkfd
 fSkvMogle9Bv4v+TodoL3VQdF6AYxfCRmp/eHOLUrYuvq2kDObRN3b5Jf
 zFMIBo8RWdjlHLaVfgn2xpl/E3nKVvkl3UysGZXGFGBXErKOsqz5y1OMT A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10406"; a="264881623"
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="264881623"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 19:43:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; d="scan'208";a="698237337"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga002.fm.intel.com with ESMTP; 12 Jul 2022 19:43:50 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/selftests: Increase delay for RPS test
Date: Tue, 12 Jul 2022 19:43:23 -0700
Message-Id: <20220713024323.15370-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

live_rps_control is failing in BAT on a TGL. Increase the
time we wait for actual frequency to change, and see if this
is just a matter of slowness.

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/1759
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_rps.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_rps.c b/drivers/gpu/drm/i915/gt/selftest_rps.c
index cfb4708dd62e..5f311a646f32 100644
--- a/drivers/gpu/drm/i915/gt/selftest_rps.c
+++ b/drivers/gpu/drm/i915/gt/selftest_rps.c
@@ -195,7 +195,8 @@ static u8 rps_set_check(struct intel_rps *rps, u8 freq)
 	GEM_BUG_ON(rps->last_freq != freq);
 	mutex_unlock(&rps->lock);
 
-	return wait_for_freq(rps, freq, 50);
+	/* FIXME: Increase delay to debug CI failure */
+	return wait_for_freq(rps, freq, 200);
 }
 
 static void show_pstate_limits(struct intel_rps *rps)
-- 
2.35.1


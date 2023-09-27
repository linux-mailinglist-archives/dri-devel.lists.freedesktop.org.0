Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CB67B01B9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 12:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561BE10E4C9;
	Wed, 27 Sep 2023 10:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E98D110E03D;
 Wed, 27 Sep 2023 10:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695810200; x=1727346200;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oUN1ZFIU+w+ZKAhlUs03JDqXGLzEy5Smcph0ZIGqvlc=;
 b=S2Vm+rlfO25DPLMwQopzMPyVnGjeR9SaO0GRet0rkY3EwsE3AsAKRsh4
 Z4dqlCpE5LZvFXw234eBLJW9qCLcOcHOG9A7pEcnC13QKEARs9V3RlWVw
 FxvEZvod/Ww18MGkkbYcLVstWU218jq1rAXKMvw3L6A8h20fideu9BjUQ
 scuLL13j4ZH5iADZzY5o3bJkWwWJjjwkHdE7/K7P94zmHKlbaQ0nvp7w2
 QHikWlgbwv9EJJqd3u4Wimd2QMHows7FvdtztV5bi4h6+O3AkopbmzZMO
 L5zrOkJNEXXm047K9KlCFbl8RWN1xWCVSieinyh6rhAvxBB9kiSJfsN1F Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="384579329"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="384579329"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 03:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="1080093607"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="1080093607"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 03:22:47 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/3] drm/i915: Reset steer semaphore for media GT
Date: Wed, 27 Sep 2023 12:22:36 +0200
Message-ID: <20230927102237.30773-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230927102237.30773-1-nirmoy.das@intel.com>
References: <20230927102237.30773-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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
Cc: matthew.d.roper@intel.com, andi.shyti@linux.intel.com,
 dri-devel@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During resime, the steer semaphore on GT1 was observed to be held. The
hardware team has confirmed the safety of clearing the steer semaphore
during driver load/resume, as no lock acquisitions can occur in this
process by other agents.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index 93062c35e072..f6d9aba9ebb0 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -686,6 +686,17 @@ int intel_gt_init(struct intel_gt *gt)
 	if (err)
 		return err;
 
+	/*
+	 * Reset the steer semaphore on GT1, as we have observed it
+	 * remaining held after a suspend operation. Confirmation
+	 * from the hardware team ensures the safety of resetting
+	 * the steer semaphore during driver load/resume, as there
+	 * are no lock acquisitions during this process by other
+	 * agents.
+	 */
+	if (MEDIA_VER(gt->i915) >= 13 && gt->type == GT_MEDIA)
+		intel_gt_mcr_lock_reset(gt);
+
 	intel_gt_init_workarounds(gt);
 
 	/*
-- 
2.41.0


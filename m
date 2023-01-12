Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE0A6667D4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 01:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDAF10E83E;
	Thu, 12 Jan 2023 00:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FC710E2D0;
 Thu, 12 Jan 2023 00:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673483831; x=1705019831;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j+mkL5K1cfdTcTY3q3jasf0ic8q8wUSIm4/DghnhMJ4=;
 b=gqFSVcadvLY6lLgGWeMW8V8+zBptpdthkaJttPdaEGu0ppz7Ij0pDF18
 WpXH7aVv0MP/IJTVP5xZ+py7Ogjig5DhfbMLvTI9thjfAX84Wu8ipDJRq
 x+ZSRhEy4vFowk8LpgZT6nQJikUMJW9Wpun2XqLqBwHyOmikmI9DOoCbz
 fjR//aqrpMySScAPW949wjRLYANnSuYbU8xvcWkSgQj6SC5l7xBKoTgNK
 0oWYpd6okmUtQddS1zW6uUxL995KKU7i/EXpR0pEo1lbeleRxDCdUN5fO
 Z9Sz65pZccAJvAOzJ9J0E+t+E45KrIpG0482/H0F7h+DGbKk3pS94YRZ3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="303271477"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="303271477"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 16:37:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="635179855"
X-IronPort-AV: E=Sophos;i="5.96,318,1665471600"; d="scan'208";a="635179855"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga006.jf.intel.com with ESMTP; 11 Jan 2023 16:37:10 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 2/6] drm/i915/pxp: add device link between i915 and mei_pxp
Date: Wed, 11 Jan 2023 16:37:02 -0800
Message-Id: <20230112003706.950931-3-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112003706.950931-1-alan.previn.teres.alexis@intel.com>
References: <20230112003706.950931-1-alan.previn.teres.alexis@intel.com>
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
	Vivi@freedesktop.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rodrigo <rodrigo.vivi@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	dri-devel@lists.freedesktop.org,
	Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Juston Li <justonli@chromium.org>,
	Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alexander Usyskin <alexander.usyskin@intel.com>

Add device link with i915 as consumer and mei_pxp as supplier
to ensure proper ordering of power flows.

V2: condition on absence of heci_pxp to filter out DG

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
index d50354bfb993..bef6d7f8ac55 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_tee.c
@@ -127,6 +127,10 @@ static int i915_pxp_tee_component_bind(struct device *i915_kdev,
 	intel_wakeref_t wakeref;
 	int ret = 0;
 
+	if (!HAS_HECI_PXP(i915) &&
+	    drm_WARN_ON(&i915->drm, !device_link_add(i915_kdev, tee_kdev, DL_FLAG_STATELESS)))
+		return -ENOMEM;
+
 	mutex_lock(&pxp->tee_mutex);
 	pxp->pxp_component = data;
 	pxp->pxp_component->tee_dev = tee_kdev;
@@ -169,6 +173,9 @@ static void i915_pxp_tee_component_unbind(struct device *i915_kdev,
 	mutex_lock(&pxp->tee_mutex);
 	pxp->pxp_component = NULL;
 	mutex_unlock(&pxp->tee_mutex);
+
+	if (!HAS_HECI_PXP(i915))
+		device_link_remove(i915_kdev, tee_kdev);
 }
 
 static const struct component_ops i915_pxp_tee_component_ops = {
-- 
2.39.0


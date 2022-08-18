Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C29599168
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:44:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0160610E43C;
	Thu, 18 Aug 2022 23:43:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD93310E665;
 Thu, 18 Aug 2022 23:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660866153; x=1692402153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B/jdwWrSBKrdnDrbs8PCH+tbMmvku9GrwhVCFQE8gmQ=;
 b=I2cEqkpodOsWm4qcei+YoLZ5VrfmzcDoFq00Ebq+MqWR6xlIIS47fVk4
 UgEWTsZoKIbFoBtzM+apCoF1+Fb9RujGJ7yeQMtxYJKPpAcPCyd4Ii4Ex
 GtkWpPaFvDu1OPKuY3m3XqqsoxcLNJQIpgViWkei2AodBdgxyte96Ciug
 lA4lkFGvK6jwmivWZfcT2Rrg33GdcUe7S/ODROlxcLBGq6E6B/e1hJN3V
 dBwsrZ9F6VPZk3m+f04pylqsju6Hoaod5vcQUJElMFd4652Pe74AUU1ea
 KroBaIJTvnHj5pan/hwSzE+/VLezXb+MxJ7CbNsP4ZN0vuoKZZvhKfjxp w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="275938528"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="275938528"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:29 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="783953303"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 18/21] drm/i915/mtl: Reuse adl-p DBUF calculations
Date: Thu, 18 Aug 2022 16:41:59 -0700
Message-Id: <20220818234202.451742-19-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Meteorlake uses a similar DBUF calculations as ADL-P.
Reuse the call flow for meteorlake.

Bspec: 49255

Original Author: Caz Yokoyama
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/intel_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index 5cdc2ce4f42b..d09e9e5f4481 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -4934,7 +4934,7 @@ static u8 skl_compute_dbuf_slices(struct intel_crtc *crtc, u8 active_pipes, bool
 
 	if (IS_DG2(dev_priv))
 		return dg2_compute_dbuf_slices(pipe, active_pipes, join_mbus);
-	else if (IS_ALDERLAKE_P(dev_priv))
+	else if (DISPLAY_VER(dev_priv) >= 13)
 		return adlp_compute_dbuf_slices(pipe, active_pipes, join_mbus);
 	else if (DISPLAY_VER(dev_priv) == 12)
 		return tgl_compute_dbuf_slices(pipe, active_pipes, join_mbus);
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9E27920D4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 09:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359BE10E44E;
	Tue,  5 Sep 2023 07:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CB910E44B;
 Tue,  5 Sep 2023 07:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693900028; x=1725436028;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8w6vathco/3VSDHicn8j9OBGfih+wcrfBc8/ikY3iHU=;
 b=mlk0lzxVJtCwIOPS6xu4fqIyC0PgLRolvTeRuv1iHKRDjV5bcjT1a4SS
 5TYSx54qPFzvKxBk7nIaHK5JFPuQWRin9q0qVclYF7ApDNpkTHzKwWDCg
 GttPqobVBd+5skSdeKooYQcuJ+d6cEMOU6m970oxd/qvE7UK+LkuOy4+q
 3HhHw/hkCegdGOpTXl25cBeUvSCE3O4HXju47aV7UH/RIrCN0e0bhMw7D
 1ZEEElJWehT/bPmDZA+znzpVaKGbSCF8PrtTEd6nyTmf8H7hOVYwmQ6uA
 coWOPL7sB1fxXv4oSUe1OHnLAF8g7TlUOjza8E/wlHmFWFKG6iOLObzag Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="443133671"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; d="scan'208";a="443133671"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 00:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="855878498"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; d="scan'208";a="855878498"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2023 00:47:05 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 4/6] drm/i915/panelreplay: Enable panel replay dpcd
 initialization for DP
Date: Tue,  5 Sep 2023 13:05:49 +0530
Message-Id: <20230905073551.958368-5-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20230905073551.958368-1-animesh.manna@intel.com>
References: <20230905073551.958368-1-animesh.manna@intel.com>
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
Cc: jani.nikula@intel.com, jouni.hogander@intel.com,
 Animesh Manna <animesh.manna@intel.com>, arun.r.murthy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to similarity panel replay dpcd initialization got added in psr
function which is specific for edp panel. This patch enables panel
replay initialization for dp connector.

Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index f2209fc94125..4e9c126a47ff 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2747,6 +2747,9 @@ void intel_psr_init(struct intel_dp *intel_dp)
 	if (!(HAS_PSR(dev_priv) || HAS_DP20(dev_priv)))
 		return;
 
+	if (!intel_dp_is_edp(intel_dp))
+		intel_psr_init_dpcd(intel_dp);
+
 	/*
 	 * HSW spec explicitly says PSR is tied to port A.
 	 * BDW+ platforms have a instance of PSR registers per transcoder but
-- 
2.29.0


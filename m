Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199977A91BC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 08:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7BC10E562;
	Thu, 21 Sep 2023 06:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A9A10E560;
 Thu, 21 Sep 2023 06:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695277511; x=1726813511;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jfSqV8u4PMrelK3kTBsfAOLyTHSW1KleLWsGc6XOy54=;
 b=ZDetDCwPbv99yze/ACG0F/+keyxhK8lfs9aKx4XulO+hPaWEUtOeX66v
 wgLH2+UZTMIZI0K4ZUIU+BIxu/XwAAcvWC9CFPkaJUY2d8XTScet9cnOF
 Z82SHqKReAc2kAduSvl+pUyJfKTWu8c8KsEgEWeMuhGTwqZ9fbE0CtxnW
 yJTBZ1yFuWqzxcvDcy6Ly8ciB/0MeKKujsSefiXYuEzvQ2J1PDhttz2gA
 vrX3aEoqRzUcC1Oyy7Nhc7/nr5CmVDpHKvGwpYflSH0apXAdPm00ihlDa
 xKEL1SGEcJYXa9jZX6GCbnl3LCJu8vda9fYHz6+zOyXdXUdUFPhchrNu7 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="379314122"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="379314122"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 23:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="812488163"
X-IronPort-AV: E=Sophos;i="6.03,164,1694761200"; d="scan'208";a="812488163"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmsmga008.fm.intel.com with ESMTP; 20 Sep 2023 23:25:09 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 4/6] drm/i915/panelreplay: Enable panel replay dpcd
 initialization for DP
Date: Thu, 21 Sep 2023 11:43:33 +0530
Message-Id: <20230921061335.454818-5-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20230921061335.454818-1-animesh.manna@intel.com>
References: <20230921061335.454818-1-animesh.manna@intel.com>
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
 Animesh Manna <animesh.manna@intel.com>, arun.r.murthy@intel.com,
 dri-devel@lists.freedesktop.org
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
index 2427bd5cb7ca..a59f13c29c3d 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -2749,6 +2749,9 @@ void intel_psr_init(struct intel_dp *intel_dp)
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


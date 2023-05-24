Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E0970F8A2
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 16:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3B4B10E02A;
	Wed, 24 May 2023 14:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 901EC10E67F;
 Wed, 24 May 2023 14:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684938408; x=1716474408;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7cnq5p7k0gB9nQsV7CXRCA9SIpNtA8Pnd1kTPvPXfx8=;
 b=Wy4gbtoD/Uir5ZVRQ16d/8OMjFxlWl59AZOkG/qZXfQRXGowbSVSElJs
 aDxlsHqyJs0S3siOWfd3nBQKaDnbzhcbOamqWHHScM+qyClI0KNPxqJNU
 bHjo49ptRiTS9A2k1OZfD//o3ArhOQK87kJTTBYRrd8bzXLGNYmYM5Tlq
 SrYpu6M0eenNB/CeWQvS0m6Rn+/Vy/7EmcKx9hHg21UH92ZgW34CLUu7W
 AFV46QMZf2/hNx8zlvitUASh/DvP8/CzngSjdytZshI9ZGXNOy0wCMYkM
 At14rN+GyYjmjVOvFDiaUk46z4o5rq4kTS0gW6nQG+NGwRyWQq5/jLT6k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="356806408"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="356806408"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:26:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="1034556033"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="1034556033"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 07:26:45 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/14] drm/i915/dp: Remove extra logs for printing DSC info
Date: Wed, 24 May 2023 19:52:03 +0530
Message-Id: <20230524142210.3779331-8-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230524142210.3779331-1-ankit.k.nautiyal@intel.com>
References: <20230524142210.3779331-1-ankit.k.nautiyal@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSC compressed bpp and slice counts are already getting printed at the
end of dsc compute config. Remove extra logs.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 424005ab9f73..090ee61b1147 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1766,9 +1766,6 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 								output_bpp);
 		}
 		pipe_config->dsc.slice_count = dsc_dp_slice_count;
-		drm_dbg_kms(&dev_priv->drm, "DSC: compressed bpp %d slice count %d\n",
-			    pipe_config->dsc.compressed_bpp,
-			    pipe_config->dsc.slice_count);
 	}
 	/*
 	 * VDSC engine operates at 1 Pixel per clock, so if peak pixel rate
-- 
2.25.1


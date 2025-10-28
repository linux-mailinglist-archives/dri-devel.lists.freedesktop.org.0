Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E83B8C14957
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 13:20:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E629210E3BA;
	Tue, 28 Oct 2025 12:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lHyTncZw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0D210E3BC;
 Tue, 28 Oct 2025 12:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761654049; x=1793190049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cqOE46hU9IfCQN+N6jkhG+pBlUgNu65z/7TlwIZhaKo=;
 b=lHyTncZwYpcIVNhKD49DdjOnapwVWMo+/HmSjOSs3Jr82Fs7C6WvyXeY
 G8Db9dCB294gMFHVPlR92vAV2pFwj2auvEwlGt//MN9CNVGO2sbNY2VKU
 AZz93N6nsJynRAw7kCgYEA41tNCFZ+fy8+4N+Bu/AV4/FH2WqPrImzZ3/
 xMS7F9dpq6XL+OEdTy5Cvm9k0bquyiQxOI7mZq+Xb2SOjuxsp3aY+9649
 caE+5LKdh2XBCDs402j+cAm8ae19yWWujz8RCxyJ6hPILBsjiYl42vt+s
 IQlh5cjiblEvxw4lfT+xMMbSP8DeZSMEfzQUt3cBfzLR8ah2xMBOHolev A==;
X-CSE-ConnectionGUID: eTwEmj+yTQ+qqfpt9nIBww==
X-CSE-MsgGUID: HiXO/fIBRRewdeXh3+dM4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75198264"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="75198264"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:20:48 -0700
X-CSE-ConnectionGUID: NDLh4urmTRua+xvRjSI4dQ==
X-CSE-MsgGUID: 4VA6lJtJSUCksrpA7E8N8w==
X-ExtLoop1: 1
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 05:20:47 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: nemesa.garg@intel.com,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [RESEND 02/10] drm/i915/display: Introduce HAS_CASF for sharpness
 support
Date: Tue, 28 Oct 2025 17:37:38 +0530
Message-ID: <20251028120747.3027332-3-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251028120747.3027332-1-ankit.k.nautiyal@intel.com>
References: <20251028120747.3027332-1-ankit.k.nautiyal@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Nemesa Garg <nemesa.garg@intel.com>

Add HAS_CASF macro to check whether platform supports
the content adaptive sharpness capability or not.

v2: Update commit message[Ankit]
v3: Remove \n from middle[Jani]
v4: Remove the logging part

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_device.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_device.h b/drivers/gpu/drm/i915/display/intel_display_device.h
index 8fdb8a0a4282..ece66c8c4ce6 100644
--- a/drivers/gpu/drm/i915/display/intel_display_device.h
+++ b/drivers/gpu/drm/i915/display/intel_display_device.h
@@ -148,6 +148,7 @@ struct intel_display_platforms {
 #define HAS_AS_SDP(__display)		(DISPLAY_VER(__display) >= 13)
 #define HAS_AUX_CCS(__display)		(IS_DISPLAY_VER(__display, 9, 12) || (__display)->platform.alderlake_p || (__display)->platform.meteorlake)
 #define HAS_BIGJOINER(__display)	(DISPLAY_VER(__display) >= 11 && HAS_DSC(__display))
+#define HAS_CASF(__display)		(DISPLAY_VER(__display) >= 20)
 #define HAS_CDCLK_CRAWL(__display)	(DISPLAY_INFO(__display)->has_cdclk_crawl)
 #define HAS_CDCLK_SQUASH(__display)	(DISPLAY_INFO(__display)->has_cdclk_squash)
 #define HAS_CMRR(__display)		(DISPLAY_VER(__display) >= 20)
-- 
2.45.2


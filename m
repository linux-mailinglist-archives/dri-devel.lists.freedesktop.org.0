Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FB4C0AEC6
	for <lists+dri-devel@lfdr.de>; Sun, 26 Oct 2025 18:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9264910E303;
	Sun, 26 Oct 2025 17:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FwP2z2b0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4479110E2FE;
 Sun, 26 Oct 2025 17:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761499847; x=1793035847;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LhgLl0Th035Eo3b4Jf3SUXOy5yQzyG75W9lYUdmF0B8=;
 b=FwP2z2b0CJ2J136wZThJHsQjIx/duEFZncvuJflbgkVSVSKWqQaC7gPo
 ILXmmT1aMssc9rOC2EUogqDZDV+0njD/OTKAQXG6nxMjG1gBxTlC5M5E8
 xZ9XC1jJiOE9wn97jHHucb3rdVYOpaCn+iQOdnfi0hxpfCRKx9Eol1R5R
 mmWIKDi3fdaqZ4vXdqBNCwVk+XJ1ygPQCjA3q5P3THlyThjxhBKicq9vH
 ZJO65jQyiIH1y/HtrXZrP3Fb7tW4SpgpGJADFxyFXwGrytPJkmWODEa6P
 /KREMYO6IezzNe2+hWY5RW60OSe1haTiExZpCZTu5Z/uxKMNCYV0fiX8p w==;
X-CSE-ConnectionGUID: Ga7NFuPDTqWBqt0SVjnImw==
X-CSE-MsgGUID: GyjG50eEQOGrbmwiwSS8dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63629607"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; d="scan'208";a="63629607"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 10:30:47 -0700
X-CSE-ConnectionGUID: cQkzKU2pSZ6QtHsVoATPww==
X-CSE-MsgGUID: OzY+FvpGR1mModCfNc3yEg==
X-ExtLoop1: 1
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa003.fm.intel.com with ESMTP; 26 Oct 2025 10:30:45 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH 02/10] drm/i915/display: Introduce HAS_CASF for sharpness
 support
Date: Sun, 26 Oct 2025 22:56:19 +0530
Message-Id: <20251026172628.2705365-3-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251026172628.2705365-1-nemesa.garg@intel.com>
References: <20251026172628.2705365-1-nemesa.garg@intel.com>
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
2.25.1


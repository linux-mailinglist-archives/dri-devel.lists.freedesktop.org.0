Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E755B7C93
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 23:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B3F10E4D2;
	Tue, 13 Sep 2022 21:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE51310E4E3;
 Tue, 13 Sep 2022 21:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663103425; x=1694639425;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TN5pYqDSvZT6HUbR63hRR463c4rwk7ONQsgovidS+dg=;
 b=fBh+sIOHlkKb3jEPupJclnppNq9hQPwdNsuH4h+jozo4QCa0MR8Gl0KN
 0TC1RPMFnq1oeHAq+HH28U2sP0PJYdXngND30Kca02F2uvOiJS7OEXbMc
 SmxzsWuqO2OUk692yepyIQovPtSY31zWrz8g2/1IhAHGE154ZRxPimy0r
 t3Ccgk70gvjd6e/vmBmOLFaS4+CmFNI5eYvLGAFH27DjtETcpKxM0NoU+
 hc11gjRYfLlkD1Ctv6v2kfgIukDd2NCGNp70HlHFRpTvyxrLeYaCPx6+/
 FrSyERspdfzDzMR0jxAAPRlBPEUbW0wxcO7N/8KeLLOchJdgSe7J9Q0N1 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="384556961"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="384556961"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 14:10:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="685023944"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 14:10:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: [PATCH v2 3/3] drm/i915: Invert if/else ladder for stolen init
Date: Tue, 13 Sep 2022 14:09:58 -0700
Message-Id: <20220908-if-ladder-v2-3-7a7b15545c93@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908-if-ladder-v2-0-7a7b15545c93@intel.com>
References: <20220908-if-ladder-v2-0-7a7b15545c93@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-bbe61
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

Continue converting the driver to the convention of last version first,
extending it to the future platforms. Now, any GRAPHICS_VER >= 11 will
be handled by the first branch.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 4f4c9461a23b..acc561c0f0aa 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -430,48 +430,29 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
 	reserved_base = stolen_top;
 	reserved_size = 0;
 
-	switch (GRAPHICS_VER(i915)) {
-	case 2:
-	case 3:
-		break;
-	case 4:
-		if (!IS_G4X(i915))
-			break;
-		fallthrough;
-	case 5:
-		g4x_get_stolen_reserved(i915, uncore,
+	if (GRAPHICS_VER(i915) >= 11) {
+		icl_get_stolen_reserved(i915, uncore,
 					&reserved_base, &reserved_size);
-		break;
-	case 6:
-		gen6_get_stolen_reserved(i915, uncore,
-					 &reserved_base, &reserved_size);
-		break;
-	case 7:
-		if (IS_VALLEYVIEW(i915))
-			vlv_get_stolen_reserved(i915, uncore,
-						&reserved_base, &reserved_size);
-		else
-			gen7_get_stolen_reserved(i915, uncore,
-						 &reserved_base, &reserved_size);
-		break;
-	case 8:
-	case 9:
+	} else if (GRAPHICS_VER(i915) >= 8) {
 		if (IS_LP(i915))
 			chv_get_stolen_reserved(i915, uncore,
 						&reserved_base, &reserved_size);
 		else
 			bdw_get_stolen_reserved(i915, uncore,
 						&reserved_base, &reserved_size);
-		break;
-	default:
-		MISSING_CASE(GRAPHICS_VER(i915));
-		fallthrough;
-	case 11:
-	case 12:
-		icl_get_stolen_reserved(i915, uncore,
-					&reserved_base,
-					&reserved_size);
-		break;
+	} else if (GRAPHICS_VER(i915) >= 7) {
+		if (IS_VALLEYVIEW(i915))
+			vlv_get_stolen_reserved(i915, uncore,
+						&reserved_base, &reserved_size);
+		else
+			gen7_get_stolen_reserved(i915, uncore,
+						 &reserved_base, &reserved_size);
+	} else if (GRAPHICS_VER(i915) >= 6) {
+		gen6_get_stolen_reserved(i915, uncore,
+					 &reserved_base, &reserved_size);
+	} else if (GRAPHICS_VER(i915) >= 5 || IS_G4X(i915)) {
+		g4x_get_stolen_reserved(i915, uncore,
+					&reserved_base, &reserved_size);
 	}
 
 	/*

-- 
b4 0.10.0-dev-bbe61

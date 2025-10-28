Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A585C16BA8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 21:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9771810E660;
	Tue, 28 Oct 2025 20:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X8T01r+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61FA210E65F;
 Tue, 28 Oct 2025 20:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761682064; x=1793218064;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c/KX4SInIpTqpHV9Y1bXyP8YI4ZfV9PNWWOnM+Yp8mo=;
 b=X8T01r+PPK2vDJ6HMBOom/j9CUvwa5wG8ETdCxe/NmXh+gly0WtZE7+v
 EulBfd8srXZqLHhWROUmYD3W8Z8OJ3itH8BRoKCrW5LFqeDqgvKoInVDn
 POd48okgNU7Q+P923ooRFB+ZjA3ey0bCuc9pAd4/w9ghOePeGeN7sPtqr
 0S0HoYGraM3vBRb0N6TkomXlp4MT+qwxEVaFBWBgtYgdU3qegcnxkzYSn
 fIij4ui+qKal/M2+seBOFOfeeJyLmI/KaFhGF2OC7Up/urFnw1OxG0wi6
 myQSeQzRvo3IiTehXTbnK3knuN4u57YttzE5w2J3BXnAr36tWL3McQX6G Q==;
X-CSE-ConnectionGUID: KUTCSYp2QQiwOKD5dbDi3Q==
X-CSE-MsgGUID: yo4XVpVwSC2PFiYhKqpOzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86423105"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="86423105"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:07:43 -0700
X-CSE-ConnectionGUID: hNCa1MsTREOgERl+KpOLuQ==
X-CSE-MsgGUID: I1MfAsjSQdGP2giSt+/Kzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; d="scan'208";a="185531769"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 13:07:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 tiago.martins.araujo@gmail.com, jani.nikula@intel.com
Subject: [PATCH 2/3] drm/edid: add DRM_EDID_IDENT_INIT() to initialize struct
 drm_edid_ident
Date: Tue, 28 Oct 2025 22:07:26 +0200
Message-ID: <710b2ac6a211606ec1f90afa57b79e8c7375a27e.1761681968.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1761681968.git.jani.nikula@intel.com>
References: <cover.1761681968.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Add a convenience helper for initializing struct drm_edid_ident.

Cc: Tiago Martins Araújo <tiago.martins.araujo@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 include/drm/drm_edid.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 3d1aecfec9b2..04f7a7f1f108 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -340,6 +340,12 @@ struct drm_edid_ident {
 	const char *name;
 };
 
+#define DRM_EDID_IDENT_INIT(_vend_chr_0, _vend_chr_1, _vend_chr_2, _product_id, _name) \
+{ \
+	.panel_id = drm_edid_encode_panel_id(_vend_chr_0, _vend_chr_1, _vend_chr_2, _product_id), \
+	.name = _name, \
+}
+
 #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))
 
 /* Short Audio Descriptor */
-- 
2.47.3


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53FBB9730CF
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 12:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9885810E763;
	Tue, 10 Sep 2024 10:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CGmMECB5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14D910E746;
 Tue, 10 Sep 2024 10:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725962669; x=1757498669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WKqIK/ZmFsJXPRHNyOF84G9TKFW1bzTau2Aa5vuIsSE=;
 b=CGmMECB5J/1WOLblz9iyKicIU59xBStrkDJD6xBVwQyxVKQY65ttd1lQ
 TfwIHC0wFIOG16ssKqYPmnfmJznkBRH7rNP1NyUERPc6/oQh3Mhxrgq+5
 QnPjxhAozZGwzNnBrGBUnqgPi+8fQH6GCcamBmdnhYbU4tYnLDfA5aiYo
 6Ez0hjTbn6n5rJbln5hqL4V1Qw3Q+XJpGZHUfGw9O+mwh8pxwDXlF9QWF
 QhuBPruBcGrFtk+RXALgoyU/AZbx4DcPbCK18JVy/WLeP5h+HiTv46vxe
 KPZDKCiI01UCfTZGecJqXbQVmZJ3VzYjGDkkUS9NxhisJY6ZALsJPqvkC g==;
X-CSE-ConnectionGUID: saMqa4kzSf+AM/d9phydlg==
X-CSE-MsgGUID: 15grZCipSuuZ7YkwGzKlqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="50112853"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="50112853"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 03:04:29 -0700
X-CSE-ConnectionGUID: jj7kEEvrRgCFIGl1kkE12g==
X-CSE-MsgGUID: K8yj2zkQR02nFABJei6yng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="71762389"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.43])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 03:04:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Nathan Chancellor <nathan@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 6/8] drm/meson: dw-hdmi: annotate dw_hdmi_dwc_write_bits()
 with __maybe_unused
Date: Tue, 10 Sep 2024 13:03:42 +0300
Message-Id: <fdc82abdabed667fc85d278cfb03d19e5c472d7b.1725962479.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1725962479.git.jani.nikula@intel.com>
References: <cover.1725962479.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Building with clang and and W=1 leads to warning about unused
dw_hdmi_dwc_write_bits(). Fix by annotating it with __maybe_unused.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-amlogic@lists.infradead.org
Cc: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/meson/meson_dw_hdmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
index 5565f7777529..8d99d70a36e3 100644
--- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
@@ -273,10 +273,10 @@ static inline void dw_hdmi_g12a_dwc_write(struct meson_dw_hdmi *dw_hdmi,
 }
 
 /* Helper to change specific bits in controller registers */
-static inline void dw_hdmi_dwc_write_bits(struct meson_dw_hdmi *dw_hdmi,
-					  unsigned int addr,
-					  unsigned int mask,
-					  unsigned int val)
+static inline __maybe_unused void dw_hdmi_dwc_write_bits(struct meson_dw_hdmi *dw_hdmi,
+							 unsigned int addr,
+							 unsigned int mask,
+							 unsigned int val)
 {
 	unsigned int data = dw_hdmi->data->dwc_read(dw_hdmi, addr);
 
-- 
2.39.2


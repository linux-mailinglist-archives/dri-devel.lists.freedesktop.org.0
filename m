Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76633674B09
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 05:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9713D10EA35;
	Fri, 20 Jan 2023 04:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6F010EA39;
 Fri, 20 Jan 2023 04:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674189756; x=1705725756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DhLDj2i8IEPsmqfQqOwzv7dgulmId8XHqE2OO6Wdhbs=;
 b=kDTcvslxW99GkBQhBJMGHh4qJRSaOTIVFD8NMu0aEfmmOH+0t1hhuKaW
 KhCRE9Z4PNrlKkGCzaN/ctouep5TklWzTx2NNItqEFP18pk6JBoOTRUhP
 5I8HvbmB4Jjl3roYCl+2hP6MlkdDCcdP9lDXLmURa8HdvK4EIimQZiwh1
 N0c7/DJpkwuSYdk1nnQIjNMn7pLndUdNDiJDQ0+kQQnTSiWgAIHmnyIRC
 s8aWGuQX4JA/NStWzp09LUMkEue7ebKAIVzIEYjruntDwpJGhNXbeXy6R
 8/Qs2IHUMAnYiynFjJtXSurkNkBWwjO7Xiqq5skkOlm2MLAcfVT8mM7sz Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323195612"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="323195612"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:42:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692735109"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="692735109"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:42:33 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 16/16] drm/i915/dsc: Allow DSC only with fractional bpp when
 forced from debugfs
Date: Fri, 20 Jan 2023 10:08:44 +0530
Message-Id: <20230120043844.3761895-17-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
References: <20230120043844.3761895-1-ankit.k.nautiyal@intel.com>
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
Cc: manasi.d.navare@intel.com, vandita.kulkarni@intel.com,
 anusha.srivatsa@intel.com, swati2.sharma@intel.com,
 stanislav.lisovskiy@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Swati Sharma <swati2.sharma@intel.com>

If force_dsc_fractional_bpp_en is set through debugfs allow DSC iff
compressed bpp is fractional. Continue if we computed compressed bpp is
computed as integer.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 8dede5969af5..48ade9077352 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1609,6 +1609,9 @@ static int dsc_compute_compressed_bpp(struct intel_dp *intel_dp,
 	for (compressed_bppx16 = dsc_max_bppx16;
 	     compressed_bppx16 >= dsc_min_bppx16;
 	     compressed_bppx16 -= bppx16_step) {
+		if (intel_dp->force_dsc_fractional_bpp_en &&
+		    (compressed_bppx16 % 16 == 0))
+			continue;
 		ret = dsc_compute_link_config(intel_dp,
 					      pipe_config,
 					      limits,
@@ -1705,6 +1708,9 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 		int forced_bpc = intel_dp->force_dsc_bpc;
 		int forced_bpp = forced_bpc * 3;
 
+		if (intel_dp->force_dsc_fractional_bpp_en)
+			drm_dbg_kms(&dev_priv->drm,
+				    "Forcing DSC fractional bpp\n");
 		if (forced_bpc < 8 ||  /* Min Input BPC for ICL+ is 8 */
 		    forced_bpc > conn_state->max_requested_bpc ||
 		    forced_bpp < limits->min_bpp ||
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3CD674AF1
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 05:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65CE410EA20;
	Fri, 20 Jan 2023 04:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFAC10EA1B;
 Fri, 20 Jan 2023 04:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674189716; x=1705725716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2DTrRuRCrH6of8QmOjxkfeQOQhgiC0KT+RfzBD0mkR4=;
 b=TBIfExpkQ/I7W9///zAdCBTrYfnCv75PcxH8iVU9pkAsl0gV4bE5jH+E
 1N2x92EtdoUsEn2+CI+3uU8cGwbXVrTcoazMfhkztgpyxs2WQfeoQLaOr
 r2oKkp8f2jpupv5ej0IPzlbCWIeFsGwqFXyCq8I6FF0sTAS51uD9uAQmO
 hsG8sEqa4DkavpgMxV0u1vhGwKg9x9SGfeqnIaCVPJJ6lx+sJvvE1beDX
 V1p/hxV7UcfsDmy05MCxOAuLZRg+LqGTOEWHaKldsYJ2Ld01FPhpO3ZYY
 nXUcx/+DTgDjN4uTJC3hx44SRGQjAgW/g6+sRhqkNOOxXfgPo6wqs4V1O A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="323195445"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="323195445"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:41:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692734908"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; d="scan'208";a="692734908"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 20:41:53 -0800
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 01/16] drm/i915/dp: Remove extra logs for printing DSC info
Date: Fri, 20 Jan 2023 10:08:29 +0530
Message-Id: <20230120043844.3761895-2-ankit.k.nautiyal@intel.com>
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

DSC compressed bpp and slice counts are already getting printed at the
end of dsc compute config. Remove extra logs.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 80d95cec8f9d..93aebd3683a4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -1576,9 +1576,6 @@ int intel_dp_dsc_compute_config(struct intel_dp *intel_dp,
 								pipe_config->pipe_bpp);
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


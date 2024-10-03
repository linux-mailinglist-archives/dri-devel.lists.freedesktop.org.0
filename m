Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01C198EDF1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 13:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4958010E807;
	Thu,  3 Oct 2024 11:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ItmiA0r6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CE0010E807
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 11:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727954354; x=1759490354;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f71NPFG/zGrZfNemG//LfafSmN0hY0k7o5M+KaLTHfU=;
 b=ItmiA0r6zm/tGts4UWtN0LTP4KCLeDrFFtewuUAxUVV70Ii9E9nIQlxC
 hvDhPKfFjeB6yD1f80JmGtwyUDwtEMRlWR8dh99AG0QYgK7SeRQV9swyr
 4xXcEdX0ZiBXQtDBmePhdML9PRJ4k0XaW+o5hjUmXcN3xSbqtEmMFl5na
 MJw7x5W5kmES3o9o5OC0dCrFQhkM1wboZFZRRzrX6/kYsD/L1GhhxBSe3
 eacecRttvjaBhhRW+F98OAbxJYjS3oVDg6XiwPmOZIhpmmQ6ACoHJ1DDg
 fpwbDQjVBqe8IB23U0Thy7X2V3685ckTT+kr1jplTsWN1zbq02dq08KZE g==;
X-CSE-ConnectionGUID: iS2PpD8NQluX8x/Xay/4Tw==
X-CSE-MsgGUID: Kybm9TPwRh28f86nl1yGMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27012980"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="27012980"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 04:19:14 -0700
X-CSE-ConnectionGUID: Q4IpU6++SGCZclxUduFizA==
X-CSE-MsgGUID: HZ+XwzHdRwKjBWm2HahGCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74423773"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 03 Oct 2024 04:19:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2024 14:19:11 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v2 06/10] drm/imx/dcss: Fix 64bit divisions
Date: Thu,  3 Oct 2024 14:18:47 +0300
Message-ID: <20241003111851.10453-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
References: <20241003111851.10453-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Use the appropriate 64bit division helpers to make the code
build on 32bit architectures.

Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/imx/dcss/dcss-scaler.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-scaler.c b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
index 825728c356ff..32c3f46b21da 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-scaler.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
@@ -136,7 +136,7 @@ static int div_q(int A, int B)
 	else
 		temp -= B / 2;
 
-	result = (int)(temp / B);
+	result = div_s64(temp, B);
 	return result;
 }
 
@@ -239,7 +239,7 @@ static void dcss_scaler_gaussian_filter(int fc_q, bool use_5_taps,
 			ll_temp = coef[phase][i];
 			ll_temp <<= PSC_COEFF_PRECISION;
 			ll_temp += sum >> 1;
-			ll_temp /= sum;
+			ll_temp = div_s64(ll_temp, sum);
 			coef[phase][i] = (int)ll_temp;
 		}
 	}
-- 
2.45.2


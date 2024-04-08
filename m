Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD4789CA45
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 19:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 962A8112824;
	Mon,  8 Apr 2024 17:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VLI+dTli";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EB7112824
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Apr 2024 17:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712595882; x=1744131882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cn9MfN19RLJ8ogB+euZHk15/Vu5OXvBvOlwH46mZQmU=;
 b=VLI+dTliWRZJe1MCxNZ3Wlt6QgTM9hC5MLazCqFxbDEwASfiDPdZieCD
 Nui30vexkW0vVtnDrc8Sqb0q1nyVfPGXsIXgEk2gBR+d+6YDMmNrHuimj
 Bv6QSZ6NMrtjQQEzonRYWCgHsdx0K559676Q5wHSffcpNr5MMcpzfixwO
 QEv8Y4vWsG0WSMWvBCzECkc0b1tpalnElGEHgt5BUE/+hAhwuDrMBAEf5
 5x2S3p2rJZq3GRbkDblAWkmHBBpltQjkoOiD3e/Fsp+kRzckcwEKtpKdW
 Ysa+U8BxLBT8dPamSIoj4/1qQnUkrR6/vtxOvIaLsTSJl0v+eBf0SQl/j A==;
X-CSE-ConnectionGUID: 5kr8u2peRpG/QOKerzX2iw==
X-CSE-MsgGUID: rfdHNrKSRUG0a0URTd9wVA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7793358"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="7793358"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792328"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792328"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 10:04:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 20:04:38 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 04/21] drm/imx/dcss: Fix 64bit divisions
Date: Mon,  8 Apr 2024 20:04:09 +0300
Message-ID: <20240408170426.9285-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
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
2.43.2


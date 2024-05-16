Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E11D8C7B2D
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 19:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0A010ED57;
	Thu, 16 May 2024 17:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mOaLFM3Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7F610E3B5;
 Thu, 16 May 2024 17:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715880809; x=1747416809;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IOeEh7kRfRKtlnqKWfmYj0750ClwuhWw8RQ+Q/sQk2g=;
 b=mOaLFM3YjqwUER1s6VE4G8aYoWpf4BT6mi/oFXiA675Ta/iG6NkpR07N
 HU1VK7nQ1yYXzH8ZgaylvtEhKNP4Ss0Gc1ioJrQNEq4INn1T2RgIt4zMC
 lV+amjreKcPfcpo5JGGM/qSIXXGgiqWLA71A+QrwgCgRUb8T0rU5AVbfC
 /2PBHBPDar0XfsON/2yOI6rnaZc3dOnb1fqRl87HABCpmPAbjFaWWMGyx
 WAN4BkycaeMa43niGTMfkR/UYFZBpSsEATK8Ago0LszdpG9KcOnxjQrLZ
 YlE5w0ghtcWsZUFf8jAjb4o+0KnMLJ2V+UkUUXaZ3XWWTK+cP3Yl665T0 w==;
X-CSE-ConnectionGUID: 6MC1eNBySAmxQPNhfENRVw==
X-CSE-MsgGUID: 9lRH4SVTTfiB3si9ZldoyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="29517753"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="29517753"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 10:33:28 -0700
X-CSE-ConnectionGUID: DOei1TphQAeqg2T3nrzenA==
X-CSE-MsgGUID: /yPbzQicTPeQSd+YypkeiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="31512477"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 16 May 2024 10:33:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 16 May 2024 20:33:24 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/probe-helper: Call drm_mode_validate_ycbcr420() before
 connector->mode_valid()
Date: Thu, 16 May 2024 20:33:24 +0300
Message-ID: <20240516173324.18149-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.1
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

Make life easier for drivers by filtering out unwanted YCbCr 4:2:0
only modes prior to calling the connector->mode_valid() hook.
Currently drivers will still see YCbCr 4:2:0 only modes in said
hook, which will likely come as a suprise when the driver has
declared no support for such modes (via setting
connector->ycbcr_420_allowed to false).

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10992
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 4f75a1cfd820..249c8c2cb319 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -474,6 +474,10 @@ static int __drm_helper_update_and_validate(struct drm_connector *connector,
 		if (mode->status != MODE_OK)
 			continue;
 
+		mode->status = drm_mode_validate_ycbcr420(mode, connector);
+		if (mode->status != MODE_OK)
+			continue;
+
 		ret = drm_mode_validate_pipeline(mode, connector, ctx,
 						 &mode->status);
 		if (ret) {
@@ -486,10 +490,6 @@ static int __drm_helper_update_and_validate(struct drm_connector *connector,
 			else
 				return -EDEADLK;
 		}
-
-		if (mode->status != MODE_OK)
-			continue;
-		mode->status = drm_mode_validate_ycbcr420(mode, connector);
 	}
 
 	return 0;
-- 
2.44.1


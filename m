Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C793299D44A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 18:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3165C10E0AA;
	Mon, 14 Oct 2024 16:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yj/qflBa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BFC10E046;
 Mon, 14 Oct 2024 16:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728922181; x=1760458181;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qnv02q9ID0opb9y+eBj++9oNKzynDcChPobJVDYMsPM=;
 b=Yj/qflBarE8Gn3raoZH8XySqmsD3xrdc1YxAuVa4SD8gO01qNdKBQMFF
 TuzGM/4E0qjjNcCbMSzNpwebW06rglZmyPNjSZbA4luUbN0sBvMoAw7HE
 xo+9ee4OKRiKRxcBwIjLnssRJjQkN6LYkNtO4YymAc4rhNUoAfnBkZlRf
 KTzYpHVFjHonxTbY8w6rNh+kwUhvv6ffVejzoOSgLovCuSLE9ahuYMGjK
 5Ql55X2GFMh4hhYWN/twBFcHgrbKPGPcwSdnqesLWg3zK0+gAxx+M1ja+
 IaKi5neeETkyRuPhrr9NTvhZqv4BQqkScxSbiG0UApwLgHS+xFMOfL/ht g==;
X-CSE-ConnectionGUID: GiKC8ovPR+S11owXqkOXhA==
X-CSE-MsgGUID: IK1Cn69ZRa6u/OA3iJxfTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28408482"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="28408482"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 09:09:39 -0700
X-CSE-ConnectionGUID: bScTTqBnQY6FfKili8oakg==
X-CSE-MsgGUID: auhFY9CbTRyXrgY44mG+DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="77720745"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 14 Oct 2024 09:09:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 14 Oct 2024 19:09:36 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, Erhard Furtner <erhard_f@mailbox.org>
Subject: [PATCH] drm/radeon: Fix encoder->possible_clones
Date: Mon, 14 Oct 2024 19:09:36 +0300
Message-ID: <20241014160936.24886-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

Include the encoder itself in its possible_clones bitmask.
In the past nothing validated that drivers were populating
possible_clones correctly, but that changed in commit
74d2aacbe840 ("drm: Validate encoder->possible_clones").
Looks like radeon never got the memo and is still not
following the rules 100% correctly.

This results in some warnings during driver initialization:
Bogus possible_clones: [ENCODER:46:TV-46] possible_clones=0x4 (full encoder mask=0x7)
WARNING: CPU: 0 PID: 170 at drivers/gpu/drm/drm_mode_config.c:615 drm_mode_config_validate+0x113/0x39c
...

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: stable@vger.kernel.org
Fixes: 74d2aacbe840 ("drm: Validate encoder->possible_clones")
Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Closes: https://lore.kernel.org/dri-devel/20241009000321.418e4294@yea/
Tested-by: Erhard Furtner <erhard_f@mailbox.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/radeon/radeon_encoders.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_encoders.c b/drivers/gpu/drm/radeon/radeon_encoders.c
index 0f723292409e..fafed331e0a0 100644
--- a/drivers/gpu/drm/radeon/radeon_encoders.c
+++ b/drivers/gpu/drm/radeon/radeon_encoders.c
@@ -43,7 +43,7 @@ static uint32_t radeon_encoder_clones(struct drm_encoder *encoder)
 	struct radeon_device *rdev = dev->dev_private;
 	struct radeon_encoder *radeon_encoder = to_radeon_encoder(encoder);
 	struct drm_encoder *clone_encoder;
-	uint32_t index_mask = 0;
+	uint32_t index_mask = drm_encoder_mask(encoder);
 	int count;
 
 	/* DIG routing gets problematic */
-- 
2.45.2


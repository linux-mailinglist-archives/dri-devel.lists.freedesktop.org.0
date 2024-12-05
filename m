Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259D49E593F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 16:03:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8710F10EEB7;
	Thu,  5 Dec 2024 15:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kW+aEkOt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A154510EEAF;
 Thu,  5 Dec 2024 15:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733410998; x=1764946998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xdm2W9G4tud+fGwnz4XctuLIlKhDZgs4DypnCRwNcTg=;
 b=kW+aEkOtWl+xlAWXXb1rDU2ViLqVQ9vRRFDxH6Kp8PB6Cv3CS7pyBCU3
 K4sZnNtWYDhY3wVDujFfxkooNguecaKtoC2wX6gGNQCI3UPvhjnX1PcaR
 TE5+86XIf4xY+a3wGSARAYsqj+I6KgeH4ukG7LEZTZ2KQ8Y/7HjuYabwX
 8YxuHstXie+rE7+vXDE6xzneQooihp+5FWjFugNxahwChePVOxG0qS3iY
 BqYcSpOVWTpxOdI+mozz1CJv3K5rxW4D+hvgD5aFYBKaSuXC7VMAIfsbc
 6Wth853l36Jtu5EV9sR3Lc2oIvJgGKoAa5Pbfdw6s/zYmI0CEp5AlKyeR Q==;
X-CSE-ConnectionGUID: 7/SuJSwLRUKJI0ZSunsrbQ==
X-CSE-MsgGUID: 3C0IEP0PQSeG7BlRKW25qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="51142040"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="51142040"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 07:03:17 -0800
X-CSE-ConnectionGUID: R3T1NA7uQtyxhlI2jqefzg==
X-CSE-MsgGUID: VKyJbwVCSi2deNFrfogdIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="93983037"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 07:03:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 2/3] drm: renesas: rcar-du: annotate rcar_cmm_read() with
 __maybe_unused
Date: Thu,  5 Dec 2024 17:03:00 +0200
Message-Id: <5b0df175e8b86e5d8746ee32e63bb633bc2765b1.1733410889.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1733410889.git.jani.nikula@intel.com>
References: <cover.1733410889.git.jani.nikula@intel.com>
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
rcar_cmm_read(). Fix by annotating it with __maybe_unused.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
index 26a2f5ad8ee5..ea52b0af9226 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
@@ -32,7 +32,7 @@ struct rcar_cmm {
 	} lut;
 };
 
-static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
+static inline __maybe_unused int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
 {
 	return ioread32(rcmm->base + reg);
 }
-- 
2.39.5


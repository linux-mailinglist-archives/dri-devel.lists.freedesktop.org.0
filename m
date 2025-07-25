Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9804B117BF
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 07:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C13110E9BE;
	Fri, 25 Jul 2025 05:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WmYv/gwf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B9BA10E9C6;
 Fri, 25 Jul 2025 05:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753419913; x=1784955913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rKk85jetrncvas2X2Fen8fZVZ7GI6R9JYsPb6Z+qujk=;
 b=WmYv/gwfv1RSMpXK23vAsbeit0hoNhGvYJwfSTHp8TrpmorMbrCR2pWR
 WjmbeW6uQZjAQw6suDN8/FpzuO/m3KagG/mDVEBiBR783eYRvj3D/OhDR
 8DtUNEsCo6YKcBhgzOwdDU5CRFnzEiUPuFUjEPMeEaB1DTr4gjrl57KGJ
 UFoUJOuLEE5olJxsAEnR9K+z+Hq9NZR0z2C/l7a/8LkjD10jLsYCQ4ax5
 nT9thGf67J1x3DzfY9q7pJs2ahyduV/iO7mwDAymtalXUGMIJ0HXGeaQr
 mlBVg8X5r5eBp+4MdoMUnS5tVKngqODpZBSyxUDGW1I8L796/EAlsrcwg g==;
X-CSE-ConnectionGUID: PBc7A9ObR+eMFXzr0ccZfQ==
X-CSE-MsgGUID: q3wjineEQyafdo48r8f0jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="78299568"
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="78299568"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 22:05:13 -0700
X-CSE-ConnectionGUID: y8PxT623RimVOqdWCUAZXg==
X-CSE-MsgGUID: mrekq+fyQcWXsDdfCVZMQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,338,1744095600"; d="scan'208";a="160956796"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2025 22:05:11 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com, uma.shankar@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 25/28] drm/i915/writeback: Initialize writeback encoder.
Date: Fri, 25 Jul 2025 10:34:06 +0530
Message-Id: <20250725050409.2687242-26-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call the init function to initialize the writeback encoder
only for ADLP.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 67ed3d6791b8..dbde689713fe 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7895,6 +7895,9 @@ void intel_setup_outputs(struct intel_display *display)
 		intel_dvo_init(display);
 	}
 
+	if (DISPLAY_VER(display) == 13)
+		intel_writeback_init(display);
+
 	for_each_intel_encoder(display->drm, encoder) {
 		encoder->base.possible_crtcs =
 			intel_encoder_possible_crtcs(encoder);
-- 
2.34.1


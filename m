Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE43ACA7646
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACA510EAEE;
	Fri,  5 Dec 2025 11:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hf3HQilD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464BC10EAE3;
 Fri,  5 Dec 2025 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934148; x=1796470148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o+k8TIdV8g4PvsXdrbkcaOEm2bSNntG+xePYgZIKBzc=;
 b=hf3HQilDksYhJdzf7t47qNrUstEjLqX2bJvYwx68JpojhqRgJnpLx1US
 AeAYNQIjua6od4v4HQiW0oKMbEDKKMmrOvunn5PEG7JxYY902+ECnEplH
 x0sof7IAk0GJIvESm+HSD0Nr2ozVzUFfKdU7qLQiYq8ER50yeReMTi/So
 NYxA1rl5tbOrg2VEH36HESkT8eusGUsv4DaC04FAFHmDlZCWgkGKbKihV
 CMik1UXDJXwuC+ZK0MS9gXR16O4qThHN9f+JnmuOEiTXg/YnPOxcil9Hl
 s5wjNRyR8r1aAree6ZKmJy4sfUy4iMUeaDtu8781VYXNGc3xI3usklSF4 w==;
X-CSE-ConnectionGUID: hspNxwHSQHi9uKK4Fvttmw==
X-CSE-MsgGUID: cz/v9Hz6QrCi+n1STwOZFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78431607"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="78431607"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:08 -0800
X-CSE-ConnectionGUID: DARiugDNTO6CRGYrd+/Ejg==
X-CSE-MsgGUID: jFDxisSKSsWfM5RUzBswzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195097564"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 15/25] drm/vblank: pass vblank to
 drm_reset_vblank_timestamp()
Date: Fri,  5 Dec 2025 13:27:31 +0200
Message-ID: <f8e781051b598f1d0b9693646d0a221e17419323.1764933891.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764933891.git.jani.nikula@intel.com>
References: <cover.1764933891.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Use the vblank pointer instead of a dev, pipe pair to simplify
code. Rename to drm_vblank_crtc_reset_timestamp().

v2: Rename (Thomas)

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 5182dfc7b930..ed4a589c408f 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -245,8 +245,10 @@ static u32 __get_vblank_counter(struct drm_device *dev, unsigned int pipe)
  * Note: caller must hold &drm_device.vbl_lock since this reads & writes
  * device vblank fields.
  */
-static void drm_reset_vblank_timestamp(struct drm_device *dev, unsigned int pipe)
+static void drm_vblank_crtc_reset_timestamp(struct drm_vblank_crtc *vblank)
 {
+	struct drm_device *dev = vblank->dev;
+	unsigned int pipe = vblank->pipe;
 	u32 cur_vblank;
 	bool rc;
 	ktime_t t_vblank;
@@ -1490,7 +1492,7 @@ void drm_crtc_vblank_on_config(struct drm_crtc *crtc,
 		vblank->inmodeset = 0;
 	}
 
-	drm_reset_vblank_timestamp(dev, pipe);
+	drm_vblank_crtc_reset_timestamp(vblank);
 
 	/*
 	 * re-enable interrupts if there are users left, or the
-- 
2.47.3


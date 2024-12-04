Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA2D9E3CC2
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 15:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87AAE10E4C4;
	Wed,  4 Dec 2024 14:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYX+yngZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D858B10E2A7;
 Wed,  4 Dec 2024 14:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733322695; x=1764858695;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WSnr9Gs28zd/o19K+x0F05ubgL2i+J58mbFo2QtcJhk=;
 b=mYX+yngZKiGV69xEYAhyiy7CW3r1DVT2hrEQEdPl24IHsmO7R6k1iXl/
 MFmMoGPPvQnL/T2NubVgm1oPh8MG4zTuLCYlMXXJ6rQquqC9UeK2gvuDy
 kkfZVALKvMt/S6h8P81r/kcXdsEOMl9DZFqKMK/FYAMzQtC5gdAmD2yGn
 1Qu6RbQTBHPOkWvp50yivUI5FK5w2zojcUemIINz3OPQWQt83ebDLJjjH
 h3NEiPZGAjuEGuYxatNPlXIo4WJlSWJyyYY1JMeHOlxv7uCmxkBCaZGl7
 niKiIWMvVyRe3yGS8hUqB0kvhgZfkKiPIWvUJYvEpBoYstN5yQJLiqYkS g==;
X-CSE-ConnectionGUID: ot4UcoelRi+ubsZ6CFkevw==
X-CSE-MsgGUID: hr18bjdqQI2E9e4zkeiDRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44255543"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44255543"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 06:31:33 -0800
X-CSE-ConnectionGUID: RWrVFwaDQJawuBy/TS9v0w==
X-CSE-MsgGUID: qnG6y7WzQneJtDQJ8TxR0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="93963396"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.205])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 06:31:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, Alex Deucher <alexander.deucher@amd.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/3] accel/ivpu: remove DRIVER_DATE conditional drm_driver
 init
Date: Wed,  4 Dec 2024 16:31:11 +0200
Message-Id: <0e4276552dde66dcdd275740cbc63d232cefd8f4.1733322525.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1733322525.git.jani.nikula@intel.com>
References: <cover.1733322525.git.jani.nikula@intel.com>
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

The ivpu struct drm_driver has conditional initialization based on #ifdef
DRIVER_DATE, which is never defined anywhere. Neither are the macros
referenced within the block: DRIVER_DATE, DRIVER_MAJOR, DRIVER_MINOR,
and DRIVER_PATCHLEVEL. With the struct drm_driver date member going away
anyway, just remove the conditional compilation.

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Note: I prefer to merge this together with the other patches via
drm-misc-next.

Cc: David Airlie <airlied@gmail.com>
Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/accel/ivpu/ivpu_drv.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index ca2bf47ce248..1f359dbe5150 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -458,15 +458,8 @@ static const struct drm_driver driver = {
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
 
-#ifdef DRIVER_DATE
-	.date = DRIVER_DATE,
-	.major = DRIVER_MAJOR,
-	.minor = DRIVER_MINOR,
-	.patchlevel = DRIVER_PATCHLEVEL,
-#else
 	.date = UTS_RELEASE,
 	.major = 1,
-#endif
 };
 
 static void ivpu_context_abort_invalid(struct ivpu_device *vdev)
-- 
2.39.5


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 664249B39A1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2024 19:52:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4598310E382;
	Mon, 28 Oct 2024 18:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMBzcJeT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C8D10E37E;
 Mon, 28 Oct 2024 18:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730141518; x=1761677518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zC0kaP/VUvFXwq72G7ZGbPHgTEEaDZeHpIHQdAVRd4o=;
 b=MMBzcJeTQDJgZg09NA53DEUGroGypE6YGiUMU1kieLZgNUtDWyM6E3Da
 NjyUl8haEfrdP1TYDnnV1w6afZQzJElq2FTprmlKUczkhdWLRjaXh8r4V
 0vI9Lmuwp9ctACZAMoNWEtIyQ0qGT2gd4xlgi8AUddRUnhhgPQj8bipGA
 uuWjO4A36tzWyTxsMpksXiLrYX5tNsth2GPcGouNLJSKayjygiU5sF/XR
 QEoM5C7wkt+1V9FayghhuhneliPGUWDS8y02fSNYePnTwWZ5Gd6CkInsv
 QLKuxdqlGk6bWumwMiCBG7a1wA0/fcu9rLeFykDrdmKQ6jVsLqNeJGeLF g==;
X-CSE-ConnectionGUID: L7oNrVBaRHipoOD4Oq6C4Q==
X-CSE-MsgGUID: VFSNY2rOScGmsNh4EP6qbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29210285"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="29210285"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 11:51:58 -0700
X-CSE-ConnectionGUID: MoKsILHhSzCQFRXrjmDDYA==
X-CSE-MsgGUID: TSgM8gHJQDu/edxSH3AMcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="86497311"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.21])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 11:51:54 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Oded Gabbay <ogabbay@kernel.org>,
 Simona Vetter <simona@ffwll.ch>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/3] accel/ivpu: remove DRIVER_DATE conditional drm_driver
 init
Date: Mon, 28 Oct 2024 20:51:40 +0200
Message-Id: <20241028185141.3756176-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241028185141.3756176-1-jani.nikula@intel.com>
References: <20241028185141.3756176-1-jani.nikula@intel.com>
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
index e7d8967c02f2..07c7e5a5f22b 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -456,15 +456,8 @@ static const struct drm_driver driver = {
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


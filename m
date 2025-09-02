Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C29B3F6EC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 09:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F56C10E5B2;
	Tue,  2 Sep 2025 07:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZmCJm+cA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5D810E5B2;
 Tue,  2 Sep 2025 07:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756799266; x=1788335266;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=a2XsBFZzATOVU1iT6/c3e8oxNqM8Vq5p/eStxOWwjGs=;
 b=ZmCJm+cA6Eher6bttcHcFl6bk8FeBjot3HJ2e45ITovyKdIyhBTIno8j
 zrJKWi0hjUKu1kGmDdHG/JP9zPKwRmwXcrGrg8S2QWGGELOqwzJ5N/Qg5
 e4jF/rogqBl7wjQSIiNtK1GBuWw1K/DNFx14RcGOLtWnWgFncUw2Hp3Wo
 Vq4X8iEB0Et0GAsWfuXlb5gNbNpco0WGiIuhbDjQhLcg7NXf3R0ctkU3o
 LG/QBxEGf9sKyYe8tuDpaOTHaJbx7guXO5tntjSIDkgz1ToTAR45fJJJf
 1bUV9w/9cS8jhRXt/03E/QNmzbAI1jd3DusqEyJV1p4bZAIgLm2cm4O31 A==;
X-CSE-ConnectionGUID: f5zUdqLGTRSPss4MTfOBWw==
X-CSE-MsgGUID: b5ml9v/RQQGDpzagjCtAsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="81641714"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="81641714"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 00:47:46 -0700
X-CSE-ConnectionGUID: QNrq3vBqQRqE6BBNzh7oNA==
X-CSE-MsgGUID: 0CGpGvyJSxmwnxVpQWs/7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="194850751"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 02 Sep 2025 00:47:41 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 02 Sep 2025 13:17:53 +0530
Subject: [PATCH v4 2/4] drm/atomic: Add error_code element in atomic_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-atomic-v4-2-a97b4bed969b@intel.com>
References: <20250902-atomic-v4-0-a97b4bed969b@intel.com>
In-Reply-To: <20250902-atomic-v4-0-a97b4bed969b@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Now that a proper error code will be returned to the user on any failure
in atomic_ioctl() via struct drm_mode_atomic, add a new element
error_code in the struct drm_atomic_state so as to hold the error code
during the atomic_check() and atomic_commit() phases.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/drm/drm_atomic.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 38636a593c9d98cadda85ccd67326cb152f0dd27..d380001b24b4223baa54dae6c3c43e19dfb1958d 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -524,6 +524,13 @@ struct drm_atomic_state {
 	 * commit without blocking.
 	 */
 	struct work_struct commit_work;
+
+	/* @error_code
+	 *
+	 * struct to convey user readable error to the user.
+	 * Error codes defined in enum drm_mode_atomic_failure_flags
+	 */
+	struct drm_mode_atomic_err_code *error_code;
 };
 
 void __drm_crtc_commit_free(struct kref *kref);

-- 
2.25.1


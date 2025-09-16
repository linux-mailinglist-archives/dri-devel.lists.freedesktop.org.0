Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696E0B58EEF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 09:18:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903F210E6B0;
	Tue, 16 Sep 2025 07:18:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JD4o3Z0v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9919A10E6AE;
 Tue, 16 Sep 2025 07:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758007091; x=1789543091;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=7waYKT/79XuN3r+rHdq4wz9SV5nf91V1HxttUEfNlM8=;
 b=JD4o3Z0vRXbFiFWr12+F4SekJCrt4uKlz17auWJg2QrjJ9XX30DQf5yR
 rERwWJTRQKDcO1kBzmOgo8ZZs2ZIGaIvyrS+pDHf5HM8WIpSD67xWAkLg
 QtbZ3BuLRloaHkj+ASZlnCn50+hr5sV1XvxmkwhcmaJwzwJMvjjsckAYa
 EKLU53zDWkFZ4kFxQf5PHEv1n8ULqt2owxNgJy1oaPQNC2CG+hTk0QEC/
 l3j4Udxbm7l+VOPhfixAXnaexOMj7RUx2lhpXnxwBx4fvvPL0ZzQEIbdp
 geG1Bbmbht48DgXW3lTwHJhGI68Xrg6biZJ5ACvp38bhY6ty5QzZjqaUB Q==;
X-CSE-ConnectionGUID: tS7UMKAMRzC2EUyu2R76EQ==
X-CSE-MsgGUID: aM6p3h+4Ql65wSRggIP57A==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="70526969"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="70526969"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 00:18:10 -0700
X-CSE-ConnectionGUID: unkPyt4jQPG/B/6CEeXFTg==
X-CSE-MsgGUID: EmzI70mgR3GvrTWr+Pxi+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="175650788"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa010.fm.intel.com with ESMTP; 16 Sep 2025 00:18:05 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 16 Sep 2025 12:48:12 +0530
Subject: [PATCH v5 2/5] drm/atomic: Add error_code element in atomic_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-atomic-v5-2-821525cfbf25@intel.com>
References: <20250916-atomic-v5-0-821525cfbf25@intel.com>
In-Reply-To: <20250916-atomic-v5-0-821525cfbf25@intel.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
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
New function added to print the error message and fill the struct
err_code with proper error message and error code.

v5: Add a function for printing the error message and filling err_code
    struct

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic.c | 34 ++++++++++++++++++++++++++++++++--
 include/drm/drm_atomic.h     | 10 ++++++++++
 2 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index cd15cf52f0c9144711da5879da57884674aea9e4..86d1d14a3f434c48028598d7dfe8e651b2de0305 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1511,9 +1511,8 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
 	if (!state->allow_modeset) {
 		for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
 			if (drm_atomic_crtc_needs_modeset(new_crtc_state)) {
-				drm_dbg_atomic(dev, "[CRTC:%d:%s] requires full modeset\n",
+				drm_dbg_atomic(dev, "[CRTC:%d:%s] requires full modese\n",
 					       crtc->base.id, crtc->name);
-				return -EINVAL;
 			}
 		}
 	}
@@ -1897,6 +1896,37 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p)
 }
 EXPORT_SYMBOL(drm_state_dump);
 
+/**
+ * drm_mode_atomic_add_error_msg - function to add error code and error string
+ *
+ * @err_code: pointer to struct drm_mode_atomic_err_code that stores the failure
+ *	      reason
+ * @failure_code: failure code in enum drm_mode_atomic_failure_codes
+ * @failure_string: failure reason string message
+ *
+ * Returns: void
+ */
+void drm_mode_atomic_add_error_msg(struct drm_mode_atomic_err_code *err_code,
+				   __u64 failure_code, const char *format, ...)
+{
+	struct drm_atomic_state *state = container_of(err_code,
+						      struct drm_atomic_state,
+						      error_code);
+	va_list varg;
+	char *failure_string;
+
+	err_code->failure_code = failure_code;
+
+	va_start(varg, format);
+	failure_string = kvasprintf(GFP_ATOMIC, format, varg);
+
+	drm_err(state->dev, "%s\n", failure_string);
+	strscpy_pad(err_code->failure_string, failure_string,
+		    sizeof(err_code->failure_string));
+	va_end(varg);
+}
+EXPORT_SYMBOL(drm_mode_atomic_add_error_msg);
+
 #ifdef CONFIG_DEBUG_FS
 static int drm_state_info(struct seq_file *m, void *data)
 {
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 38636a593c9d98cadda85ccd67326cb152f0dd27..ab04cffc9d03d70a791fe3eaaa7f1efea39b600a 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -524,6 +524,13 @@ struct drm_atomic_state {
 	 * commit without blocking.
 	 */
 	struct work_struct commit_work;
+
+	/* @error_code: pointer to struct holding failure reason and string
+	 *
+	 * struct to convey user readable error to the user.
+	 * Error codes defined in enum drm_mode_atomic_failure_flags
+	 */
+	struct drm_mode_atomic_err_code error_code;
 };
 
 void __drm_crtc_commit_free(struct kref *kref);
@@ -1247,5 +1254,8 @@ drm_atomic_get_old_bridge_state(const struct drm_atomic_state *state,
 struct drm_bridge_state *
 drm_atomic_get_new_bridge_state(const struct drm_atomic_state *state,
 				struct drm_bridge *bridge);
+__printf(3, 4)
+void drm_mode_atomic_add_error_msg(struct drm_mode_atomic_err_code *err_code,
+				   __u64 failure_code, const char *format, ...);
 
 #endif /* DRM_ATOMIC_H_ */

-- 
2.25.1


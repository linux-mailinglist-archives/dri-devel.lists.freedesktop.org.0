Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86807CF6ADC
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 05:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE06F10E473;
	Tue,  6 Jan 2026 04:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SJgR54eI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26ACC10E475;
 Tue,  6 Jan 2026 04:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767674402; x=1799210402;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=UQx0KnHhK50PNsTumTDOyQKDC64LfzGoiwvVYCiAr3w=;
 b=SJgR54eI9Za+rr/ym3w6u/ysO+C73rDtfIAiE1NA17hK2PmPpWwjAwoo
 fOFCdNXIeZwe5//2z2QtG+R59R+Gu1VpFmgiVSRvIfPhtAinJ5QsgpxeY
 JJFizw45MNazSP6adYOfRowIzWUrXsThMU69GU4brrCymc22ZKGLkcjuR
 1PkQecX4QvKEOajzpz/K3qbKmY+uleBg2uzztDFtpyqSu22ee4tPwcqaw
 JXf1ql3o91Fiei1PXUaAFetIiqkScqUFZv/EHwUU4xt5QguXCAHwcvDxh
 JNEXWOsWzMQXVcGrZC2sP8FltLONpuxymoWty0lTY3m/pBKfO9zU330Bs w==;
X-CSE-ConnectionGUID: NMkR8ATFTZ6kvBwTIHym5w==
X-CSE-MsgGUID: k4VFBLOUSOS8Ly1WHnMtvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="86459297"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="86459297"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 20:40:02 -0800
X-CSE-ConnectionGUID: h3Y5Cj09T/ChB0QPtZzP3w==
X-CSE-MsgGUID: woTh9jYpRzell33gUkk+/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="207034342"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 05 Jan 2026 20:39:57 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 06 Jan 2026 10:07:57 +0530
Subject: [PATCH v7 2/5] drm/atomic: Add error_code element in atomic_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-atomic-v7-2-d51d9a351684@intel.com>
References: <20260106-atomic-v7-0-d51d9a351684@intel.com>
In-Reply-To: <20260106-atomic-v7-0-d51d9a351684@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com
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
v6: Replace drm_err with drm_dbg_atomic print
v6: Add keyword "commit failed" in dbg msg (Suraj)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic.c | 31 +++++++++++++++++++++++++++++++
 include/drm/drm_atomic.h     | 10 ++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 52738b80ddbeb124896f6124df5628e2ac27faa4..0f4f6071cc305a114654c6973272bbc4b1ff36c8 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -2105,6 +2105,37 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p)
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
+	drm_dbg_atomic(state->dev, "Commit failed: %s\n", failure_string);
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
index 178f8f62c80fc58fe42e8564a716da1a99ddb7da..b080f981ec1afd4b2569aba703c93fc1ea582cbf 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -633,6 +633,13 @@ struct drm_atomic_state {
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
@@ -1360,5 +1367,8 @@ drm_atomic_get_old_bridge_state(const struct drm_atomic_state *state,
 struct drm_bridge_state *
 drm_atomic_get_new_bridge_state(const struct drm_atomic_state *state,
 				struct drm_bridge *bridge);
+__printf(3, 4)
+void drm_mode_atomic_add_error_msg(struct drm_mode_atomic_err_code *err_code,
+				   __u64 failure_code, const char *format, ...);
 
 #endif /* DRM_ATOMIC_H_ */

-- 
2.25.1


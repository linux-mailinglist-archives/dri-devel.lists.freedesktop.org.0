Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCxkF2Mge2lPBgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:54:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C00ADCE1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 09:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE2010E815;
	Thu, 29 Jan 2026 08:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cBTenZZx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080F510E814;
 Thu, 29 Jan 2026 08:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769676896; x=1801212896;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=vWKK7NEBfQIlgdB3T+S6NtxzCQCJAI3w1c70/UrU9JQ=;
 b=cBTenZZx4WtPxPwfuOZI7oF3t1a220/hYQdb/S7DNe6nnWDIH6mI/e7p
 EY0dD3iyRwyzRWhzuKgTq+uuhfQdU9wp1BNqhqweDMc6ZoAo9YVI1y562
 RXPMs6aYFw/cM7BNGJtpJKjFIBo0WWImc0HaxnuP2fZDmeWzGnWlxgkbT
 4Kd6yJw9wgD+CR+FoMfwCO0vo+e48td1ZUrZQ6w8X1Ek/35QBZ5klOcXH
 Yaj6gvLYBdhwX+n3h0wQNJjRXrMsN5wkGIoEpxzRHEzeJcSHCpwvS5H0A
 gV3Zahat5CAcS1qV4RfQcdnVyTzsyn5Fos6pwOoK29SAjWbUVscBT03Ic w==;
X-CSE-ConnectionGUID: DkfVPHvjRwGKObH4R+8zqA==
X-CSE-MsgGUID: QkcvVdhGQ9i45A2Irizdfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69919940"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="69919940"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 00:54:55 -0800
X-CSE-ConnectionGUID: h51ETfifSj+gfuO7PDw+hQ==
X-CSE-MsgGUID: RFbUKIxBTra/12k8FAmm/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="213019526"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 29 Jan 2026 00:54:50 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 29 Jan 2026 14:22:59 +0530
Subject: [PATCH v8 2/7] drm/atomic: Add error_code element in atomic_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-atomic-v8-2-4cb7b0faa051@intel.com>
References: <20260129-atomic-v8-0-4cb7b0faa051@intel.com>
In-Reply-To: <20260129-atomic-v8-0-4cb7b0faa051@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, xaver.hugl@kde.org, 
 harry.wentland@amd.com, uma.shankar@intel.com, louis.chauvet@bootlin.com, 
 naveen1.kumar@intel.com, ramya.krishna.yella@intel.com
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>, 
 Suraj Kandpal <suraj.kandpal@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,kde.org,amd.com,bootlin.com];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim,intel.com:mid]
X-Rspamd-Queue-Id: 10C00ADCE1
X-Rspamd-Action: no action

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
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
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


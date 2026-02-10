Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EgxOO70imkNPAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:05:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9669111885B
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:05:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF71010E505;
	Tue, 10 Feb 2026 09:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JJJccv6l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CA910E502;
 Tue, 10 Feb 2026 09:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770714348; x=1802250348;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=k8KcQizw1EiNdyHN4iPqr5qMyTflmY57Kt5kExxUANA=;
 b=JJJccv6l/4AZBqB6i8oND1H/QVlmsmOa2Rymsh6zD4hKn184ZZggWtZM
 juWfNsC8Tmz+KbfYfVSTk3SrjWFNRa1SRGZqGeq973Jv/x/chc5515QeK
 xP7IcPNvFhzR+v0+qmA2Wpanz3FIDOjOZ3gruAqqb4XP2/1EB0lrhngjt
 j+5loItB7PtbRQngCHvKEnK9nVIN/T+Yp5v6b9CgjVyK6Wa9qDYG+jCTR
 zLqkBL7qvFKvomfZ7NwQDYC3ZGntt5Qye1cigk8BJs7EX0eoPxTTacTGe
 9fVbpjpzoNeXLWW+8RipgZQAggRI23lJA1xLELHu9FNBb+vfAuogiHb8A A==;
X-CSE-ConnectionGUID: ClAEnYVFRl2y7lT4EEdloQ==
X-CSE-MsgGUID: KBM6AM9lQh+qzRhoEfWlbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="94479183"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="94479183"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 01:05:48 -0800
X-CSE-ConnectionGUID: tDDJZNXeQey2T4vuYgVXpA==
X-CSE-MsgGUID: HpwlbdTZR7+mRCeSW6R1vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="242478973"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa002.jf.intel.com with ESMTP; 10 Feb 2026 01:05:42 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 10 Feb 2026 14:33:57 +0530
Subject: [PATCH v9 3/7] drm/atomic: Allocate atomic_state at the beginning
 of atomic_ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260210-atomic-v9-3-525c88fd2402@intel.com>
References: <20260210-atomic-v9-0-525c88fd2402@intel.com>
In-Reply-To: <20260210-atomic-v9-0-525c88fd2402@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,kde.org,amd.com,bootlin.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 9669111885B
X-Rspamd-Action: no action

Move atomic_state allocation to the beginning of the atomic_ioctl
to accommodate drm_mode_atomic_err_code usage for returning error
code on failures.
As atomic state is required for drm_mode_atomic_err_code to store the
error codes.

v7: Reframe commit message (Suraj)
v8: Moved the clearing fence change to a different patch (Suraj/Louis)
v9: Free allocated atomic_state before return on error, move this change
from patch 5 (Suraj)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index dc013a22bf265512a4fa1edf0ae90931ff0d35e6..c228c9aed75acdb09a80df5dad54440a5c182254 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1576,6 +1576,14 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	if (!drm_core_check_feature(dev, DRIVER_ATOMIC))
 		return -EOPNOTSUPP;
 
+	state = drm_atomic_state_alloc(dev);
+	if (!state)
+		return -ENOMEM;
+
+	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
+	state->acquire_ctx = &ctx;
+	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
+
 	/* disallow for userspace that has not enabled atomic cap (even
 	 * though this may be a bit overkill, since legacy userspace
 	 * wouldn't know how to call this ioctl)
@@ -1583,24 +1591,28 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 	if (!file_priv->atomic) {
 		drm_dbg_atomic(dev,
 			       "commit failed: atomic cap not enabled\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 
 	if (arg->flags & ~DRM_MODE_ATOMIC_FLAGS) {
 		drm_dbg_atomic(dev, "commit failed: invalid flag\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 
 	if (arg->reserved) {
 		drm_dbg_atomic(dev, "commit failed: reserved field set\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 
 	if (arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) {
 		if (!dev->mode_config.async_page_flip) {
 			drm_dbg_atomic(dev,
 				       "commit failed: DRM_MODE_PAGE_FLIP_ASYNC not supported\n");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto out;
 		}
 
 		async_flip = true;
@@ -1611,16 +1623,10 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
 			(arg->flags & DRM_MODE_PAGE_FLIP_EVENT)) {
 		drm_dbg_atomic(dev,
 			       "commit failed: page-flip event requested with test-only commit\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto out;
 	}
 
-	state = drm_atomic_state_alloc(dev);
-	if (!state)
-		return -ENOMEM;
-
-	drm_modeset_acquire_init(&ctx, DRM_MODESET_ACQUIRE_INTERRUPTIBLE);
-	state->acquire_ctx = &ctx;
-	state->allow_modeset = !!(arg->flags & DRM_MODE_ATOMIC_ALLOW_MODESET);
 	state->plane_color_pipeline = file_priv->plane_color_pipeline;
 
 retry:

-- 
2.25.1


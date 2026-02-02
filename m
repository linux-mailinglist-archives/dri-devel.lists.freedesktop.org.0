Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG//MmB3gGne8gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:07:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F5FCA82E
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5C210E3EF;
	Mon,  2 Feb 2026 10:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VNK/izUD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4965310E3EC;
 Mon,  2 Feb 2026 10:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770026844; x=1801562844;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Sda6mzWU3H3Dd0al4RaXm66Utb2rYLYYx0KwXkwuGIw=;
 b=VNK/izUDD3wpETl6LsWDkI6R7mz0/SrfVzZBjvxJSv2Fg+EjQhvWNy0B
 BsQ6i/a1CL25go+VE/aXmaqPOJJGEbdtbT+NOBqsBeiyU0luHtp2A78Bw
 FcR/abfghncvY1dYe3H+tuF2uHaNieVjuPn9xwOlzW1qe/RLswjBnoaMQ
 vC71zZGjm2KNkQkh0MYvkegjXe0hyr3UIuNeGDu2x98BR7NjvroLmvqA+
 2G5O/HHUYxG19XAtcQ2vjC+RQPwbWmzjXMxTgEKdXCOdC4TNeXcusVH6v
 pmNlZzNDS6fbgp4LP5gncoomSyUb4CwJvhcONSi70dEbOTmV7/oc/bHOO g==;
X-CSE-ConnectionGUID: Bo7a7KdrRFOVDhCEx2iziw==
X-CSE-MsgGUID: zMUUku0XQyWwcuWecdqBSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71163347"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71163347"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 02:07:24 -0800
X-CSE-ConnectionGUID: ZRkMhK/ZRlSOA3lfkSQ1iw==
X-CSE-MsgGUID: acjZgYf6Q6yN4xVwRkpUMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="208984817"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa007.fm.intel.com with ESMTP; 02 Feb 2026 02:07:20 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com,
 maarten.lankhorst@intel.com, chaitanya.kumar.borah@intel.com
Subject: [RESEND 1/9] drm/colorop: Add destroy helper for colorop objects
Date: Mon,  2 Feb 2026 15:11:54 +0530
Message-Id: <20260202094202.2871478-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260202094202.2871478-1-chaitanya.kumar.borah@intel.com>
References: <20260202094202.2871478-1-chaitanya.kumar.borah@intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A2F5FCA82E
X-Rspamd-Action: no action

Add a helper that performs common cleanup and frees the
associated object. This can be used by drivers if they do not
require any driver-specific teardown.

v2:
- Add function documentation only before definition (Jani)

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_colorop.c | 15 +++++++++++++++
 include/drm/drm_colorop.h     |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 44eb823585d2..c226870fde9e 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -178,6 +178,21 @@ void drm_colorop_cleanup(struct drm_colorop *colorop)
 }
 EXPORT_SYMBOL(drm_colorop_cleanup);
 
+/**
+ * drm_colorop_destroy - destroy colorop
+ * @colorop: drm colorop
+ *
+ * Destroys @colorop by performing common DRM cleanup and freeing the
+ * colorop object. This can be used by drivers if they do not
+ * require any driver-specific teardown.
+ */
+void drm_colorop_destroy(struct drm_colorop *colorop)
+{
+	drm_colorop_cleanup(colorop);
+	kfree(colorop);
+}
+EXPORT_SYMBOL(drm_colorop_destroy);
+
 /**
  * drm_colorop_pipeline_destroy - Helper for color pipeline destruction
  *
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index a3a32f9f918c..3056f3f02597 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -420,6 +420,8 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
  */
 void drm_colorop_reset(struct drm_colorop *colorop);
 
+void drm_colorop_destroy(struct drm_colorop *colorop);
+
 /**
  * drm_colorop_index - find the index of a registered colorop
  * @colorop: colorop to find index for
-- 
2.25.1


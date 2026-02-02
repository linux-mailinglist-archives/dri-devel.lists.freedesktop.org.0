Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLEhMnd3gGne8gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:07:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09E6CA8A4
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 11:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15CD10E400;
	Mon,  2 Feb 2026 10:07:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CZ+5tEnq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF1F10E3F5;
 Mon,  2 Feb 2026 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770026868; x=1801562868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AqgWhp0SbFOw474GljvoV8bTi2HwEKZmNpgTIC1uipE=;
 b=CZ+5tEnq12xFuhFOK4yq0KFMcYAFAQpK5EDk0YDFWW3YYZ8EzHPkIV4m
 ZjY4a+FUwz3mZDqROb8GUIjDdLLRTfoprjVue9D4mKNud1iqINusCsA+0
 MVU+M05gySZLB2/MtBBMkc4Bb3rlvWxs4RosowZXkmwefcfxYKtC5mR+k
 6HR32qATHPWD6LJoxjj/X/+UTh0xoV9jjYs4lDZsOxXl7jHG3o5Tsnkzl
 gUycDXfls1faOR7XJXYRIC394FQV5pWbFKUcHARRXoNnHMRAiKDQqwHXD
 /B/7zjkjT1JXzhPef2wzn6ae3P6gDDnQtC+BYgbITWDXb1UH8oDhcEXWc Q==;
X-CSE-ConnectionGUID: Egviub71QDO0LYI6dE/qbw==
X-CSE-MsgGUID: 5eMAbIvUTT6g1hi4yYXbBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71163397"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="71163397"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 02:07:48 -0800
X-CSE-ConnectionGUID: 4IiCGL8RSPWWCrjvdhoAgg==
X-CSE-MsgGUID: tEngsx/PQCimPhG20LymCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="208984856"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa007.fm.intel.com with ESMTP; 02 Feb 2026 02:07:44 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 alex.hung@amd.com, daniels@collabora.com, uma.shankar@intel.com,
 suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com,
 maarten.lankhorst@intel.com, chaitanya.kumar.borah@intel.com
Subject: [RESEND 6/9] drm: Clean up colorop objects during mode_config cleanup
Date: Mon,  2 Feb 2026 15:11:59 +0530
Message-Id: <20260202094202.2871478-7-chaitanya.kumar.borah@intel.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: A09E6CA8A4
X-Rspamd-Action: no action

Tear down all registered drm_colorop objects during
drm_mode_config_cleanup() by invoking their destroy callbacks.

This ensures proper cleanup of color pipeline objects during DRM device
removal.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_mode_config.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index d12db9b0bab8..84ae8a23a367 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -524,6 +524,7 @@ void drm_mode_config_cleanup(struct drm_device *dev)
 	struct drm_property *property, *pt;
 	struct drm_property_blob *blob, *bt;
 	struct drm_plane *plane, *plt;
+	struct drm_colorop *colorop, *copt;
 
 	list_for_each_entry_safe(encoder, enct, &dev->mode_config.encoder_list,
 				 head) {
@@ -553,6 +554,11 @@ void drm_mode_config_cleanup(struct drm_device *dev)
 		drm_property_destroy(dev, property);
 	}
 
+	list_for_each_entry_safe(colorop, copt, &dev->mode_config.colorop_list,
+				 head) {
+		colorop->funcs->destroy(colorop);
+	}
+
 	list_for_each_entry_safe(plane, plt, &dev->mode_config.plane_list,
 				 head) {
 		plane->funcs->destroy(plane);
-- 
2.25.1


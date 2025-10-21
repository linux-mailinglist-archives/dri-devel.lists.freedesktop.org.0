Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BA8BF84AB
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 21:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF2E10E330;
	Tue, 21 Oct 2025 19:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cBU55orG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354D710E322;
 Tue, 21 Oct 2025 19:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761075905; x=1792611905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bqCKM1DfywcVHaQrRGuyah09esclic3Tcoid36Rotm8=;
 b=cBU55orGB3PZMP0vLx/5iopZsWptFeJfGOVLRgIQJy//Xudms2RcZUR9
 6aHGffynoEhun9wCtgBDmJNJ9dAbzbkq5/gXG2EH/GmWwss0gxV4xKHL3
 R4Nw9u5scyIwixfkqx+FMtMBRk9d4pwOYVeaNKzpgYe0/k2joV7asn7QZ
 CoCtMVx1XrV7BsNRizsfnEuFPTRcEGwxcYYqcghb7DvekdYAAT8lpUVy+
 1eost67l6kY85bF0ITn7Vp+4JOi/zK+NeVa5F/426XycMAhmMSjteo+4m
 QDhBNr/yuK3onlqBgXiYueuQ543ScEavcUWXMx+oLDqUQou24y0f7UP5m Q==;
X-CSE-ConnectionGUID: snyrVWNjTMKuxKST040WSg==
X-CSE-MsgGUID: /GmLlQhgSZqBUiiZRgTcNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67078286"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="67078286"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 12:45:05 -0700
X-CSE-ConnectionGUID: Oifx3pQeR/6icc0j0DFUOA==
X-CSE-MsgGUID: mlhNOYjySbm3DOv/k9oJig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; d="scan'208";a="214312016"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.214])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2025 12:45:03 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH 1/5] drm/uapi: Validate DRM_IOCTL_MODE_CREATE_DUMB flags
Date: Tue, 21 Oct 2025 22:44:51 +0300
Message-ID: <20251021194455.24297-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251021194455.24297-1-ville.syrjala@linux.intel.com>
References: <20251021194455.24297-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Currently we allow any garbage in drm_mode_create_dumb::flags.
Reject the ioctl if flags has anything in it since we currently
have no defined flags.

The uapi documentation already says that the flags must be
zero.

I checked that at least these current users all zero the struct
fully before issuing the ioctl:
gbm: https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/src/gbm/backends/dri/gbm_dri.c?ref_type=heads#L852
modesetting: https://gitlab.freedesktop.org/xorg/xserver/-/blob/master/hw/xfree86/drivers/modesetting/dumb_bo.c#L52
plymouth: https://gitlab.freedesktop.org/plymouth/plymouth/-/blob/main/src/plugins/renderers/drm/plugin.c?ref_type=heads#L235

Mesa also has other users besides gbm, but all of those appear to be
using designated initializers and do not assign anything into 'flags'.

If someone can think of other important users that might be
feeding stack garbage into the flags currently, let me know.

Cc: Daniel Stone <daniels@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_dumb_buffers.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index e9eed9a5b760..fdc249198022 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -197,6 +197,8 @@ int drm_mode_create_dumb(struct drm_device *dev,
 		return -ENOSYS;
 	if (!args->width || !args->height || !args->bpp)
 		return -EINVAL;
+	if (args->flags)
+		return -EINVAL;
 
 	/* overflow checks for 32bit size calculations */
 	if (args->bpp > U32_MAX - 8)
-- 
2.49.1


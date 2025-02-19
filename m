Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA72A3C511
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 17:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D14D10E159;
	Wed, 19 Feb 2025 16:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MqpYZSmq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22F810E159;
 Wed, 19 Feb 2025 16:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739982849; x=1771518849;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LZP9spHzBkXi8OevGQHa9oaBE1omnHWKEEy+0ExF+Ns=;
 b=MqpYZSmqBV8Io7ezxQuw35jGZIa/LiqiLYbqE/l9A20SX5FsajZN4OmK
 EjmnhMWDDuZ65i0uJwFBp48FdBYDq+0lw4ZxEzxVrSON3lHaUtrIvYsyn
 sa9qZTXdHwNHiQyC3vTWAZIvsPSykITrqQaoYFhBg3VWzMrzuWf/5grAg
 mFYwVYaR2tOfOKMk3yjeBu2EA0KOWcEtk9emRPNKxkmw/IGJKuFcMyKpr
 Zy2IOxxdP7WC0cfz97w5/XJB3cp1RtOWkXbuIi5UlHVdf/l0lgM+5Z0xe
 EAa+81i+f70YslD2Z5Iv02ZtFkIDStVtd/9PtGh01rcsgIpH1l6oT46tA g==;
X-CSE-ConnectionGUID: n8xsrt0KSa63/ycN0aDWDA==
X-CSE-MsgGUID: viBY5R/0QKG2qlnp8m9uIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="66086988"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="66086988"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 08:34:08 -0800
X-CSE-ConnectionGUID: 5PLyzEAaREKK7yvbAcQCLA==
X-CSE-MsgGUID: pJK2ghGMQLeK7a2MxJTl/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="114950780"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 19 Feb 2025 08:02:43 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 19 Feb 2025 18:02:39 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/atomic: Filter out redundant DPMS calls
Date: Wed, 19 Feb 2025 18:02:39 +0200
Message-ID: <20250219160239.17502-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Video players (eg. mpv) do periodic XResetScreenSaver() calls to
keep the screen on while the video playing. The modesetting ddx
plumbs these straight through into the kernel as DPMS setproperty
ioctls, without any filtering whatsoever. When implemented via
atomic these end up as full commits on the crtc, which leads to a
dropped frame every time XResetScreenSaver() is called.

Let's just filter out redundant DPMS property changes in the
kernel to avoid this issue.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 2765ba90ad8f..c2726af6698e 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -957,6 +957,10 @@ int drm_atomic_connector_commit_dpms(struct drm_atomic_state *state,
 
 	if (mode != DRM_MODE_DPMS_ON)
 		mode = DRM_MODE_DPMS_OFF;
+
+	if (connector->dpms == mode)
+		goto out;
+
 	connector->dpms = mode;
 
 	crtc = connector->state->crtc;
-- 
2.45.3


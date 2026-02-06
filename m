Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKs3CLlthmmTNAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 23:39:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68476103EC8
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 23:39:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C192C10E94F;
	Fri,  6 Feb 2026 22:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kPdzXVFj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3B310E94F
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 22:39:47 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4806ce0f97bso23492435e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 14:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770417586; x=1771022386; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nC/CLADSz1/RKI81/8Wfm/loaE6jM2lExFPSIaWRTkQ=;
 b=kPdzXVFj+LLHgxF7htFwWMUI6oV8PJ4S5N+OIFwbtOznyl5IlNC8boBVTJnSiTAKFD
 wbXU1ZMtn/lRCCOaytQgvapLEsoiRHPSugguiXYldT0QgbxdcJD9ub0Ds6J1KMxTRd5Z
 rFQ9/D33PHby566B6eiFg6bvIvecpD/3T5sVCkZnG2f1W2HEtqtxsWJAiC6tthohbkb9
 nBAXn8DRdwUx0Cn3hqyJiljnEo1yIlYvD1CdBPTL579fGn4dlXfXFWEWs98wihGst9dP
 eV7uqt+3tm98RBEPrGc4NHVchE5uCLsDioRm5mM2hFc4ap+8rt4EpM4yqHJyy5UHgKJG
 kZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770417586; x=1771022386;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nC/CLADSz1/RKI81/8Wfm/loaE6jM2lExFPSIaWRTkQ=;
 b=I+8MuXoY3f18IBVIds+kqz1gEHYQHB89G44L9bgmdEnIQxgP7/qSIkC+jgw1/Wev54
 9y3ut30T6f1gSMmNRxYkHg5OlH2hdBjYmGw95bZ06rwHnt1p2bq4HTRWjjcCTzBhdupD
 SHnZTkLkaFs+PJQ9vHhK0+2pPWW/Io+PgasqE4f46gwm2cCtzCEJG5k5m/04igGG03Vl
 0tpv+Eop9TTm4utN+OdbWDOGi7Gye9WLNpCa1PYNgZLHRbdaOzP1ZtJtT7WJJhyqKfij
 +Bl8AyO/VKkKrQSBi2o6+bMUXyowDXSZ9Dp1RDFKzX9tiSjHIBruuftXC/Pxh4ditwJ7
 Vyiw==
X-Gm-Message-State: AOJu0YyL/QjPAKLiYqlJuEdvWjC+WYstMRYxx4LUQN+FvC/mj9zj5bsa
 ypPZRBnfFghJp9yW+xZ4xtDdjMvtrA1JdRtbpzYcRcwdKnHQlH9NON1w
X-Gm-Gg: AZuq6aKlf5OBYc7WNzsBDoIcIH39U33Jab+6sOUxbXTm4k7ZBPOGyKIqMX7PHDkgHkN
 G25504vYfaXr7Yz47o56W8KvaHcxpzVkn7z2mAk7JBsR07kvPa0jac92jRoP0T7x88FrmiUem09
 AebP2X6Sh8EdBfnH7po314LEORlb/P1H321YfZcyo4grk+c7OLWKWO6NLVtQ5mlHOTOGaTWrWcX
 uvk2FuxIZJRPiiOPg9UBJO2/gFr1K1n5OQTxURtYvAbk7/d9/g+Ds8vQso7ozWlkFc1pImibwLF
 xANXOFk3FdlK5erUOSQq7mEPYxpxsJDwwdGs/vO1MKw6rnYVJ8hZ3snpeqqqatoDxK/Ie7IWWzS
 1TgXIngeqtF8N5QqyxZm9gEH9ILDDgzmroc90QFO6iGmOYaQFQ3C7t0So5Z6aElnzjLLXm6zfjK
 EtAwZyP0p4bXs4tnMlbsFYERST/J5JBcFBQfHYP1+jqVOSPbU5XNQjc34V4HEk2hOtouWir4vZ0
 aShCk7ARadjIDMlSR5VGwL6Xe+A1DXtahy/Vbk01lZBs897IWmn1+yr
X-Received: by 2002:a05:600c:4449:b0:480:32da:f33e with SMTP id
 5b1f17b1804b1-48320216075mr70766265e9.17.1770417585968; 
 Fri, 06 Feb 2026 14:39:45 -0800 (PST)
Received: from groovy.localdomain
 (dynamic-2a02-3100-6338-cb00-9208-8a8e-8354-3ed2.310.pool.telefonica.de.
 [2a02:3100:6338:cb00:9208:8a8e:8354:3ed2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48320736953sm75292715e9.15.2026.02.06.14.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 14:39:45 -0800 (PST)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Mario Kleiner <mario.kleiner.de@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH] drm/amd/display: Use same max plane scaling limits for all 64
 bpp formats
Date: Fri,  6 Feb 2026 23:38:28 +0100
Message-ID: <20260206223828.33061-1-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.43.0
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:mario.kleiner.de@gmail.com,m:alexander.deucher@amd.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:mariokleinerde@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mariokleinerde@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mariokleinerde@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,amd.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 68476103EC8
X-Rspamd-Action: no action

The plane scaling hw seems to have the same min/max plane scaling limits
for all 16 bpc / 64 bpp interleaved pixel color formats.

Therefore add cases to amdgpu_dm_plane_get_min_max_dc_plane_scaling() for
all the 16 bpc fixed-point / unorm formats to use the same .fp16
up/downscaling factor limits as used by the fp16 floating point formats.

So far, 16 bpc unorm formats were not handled, and the default: path
returned max/min factors for 32 bpp argb8888 formats, which were wrong
and bigger than what many DCE / DCN hw generations could handle.

The result sometimes was misscaling of framebuffers with
DRM_FORMAT_XRGB16161616, DRM_FORMAT_ARGB16161616, DRM_FORMAT_XBGR16161616,
DRM_FORMAT_ABGR16161616, leading to very wrong looking display, as tested
on Polaris11 / DCE-11.2.

So far this went unnoticed, because only few userspace clients used such
16 bpc unorm framebuffers, and those didn't use hw plane scaling, so they
did not experience this issue.

With upcoming Mesa 26 exposing 16 bpc unorm formats under both OpenGL
and Vulkan under Wayland, and the upcoming GNOME 50 Mutter Wayland
compositor allowing for direct scanout of these formats, the scaling
hw will be used on these formats if possible for HiDPI display scaling,
so it is important to use the correct hw scaling limits to avoid wrong
display.

Tested on AMD Polaris 11 / DCE 11.2 with upcoming Mesa 26 and GNOME 50
on HiDPI displays with scaling enabled. The mutter Wayland compositor now
correctly falls back to scaling via desktop compositing instead of direct
scanout, thereby avoiding wrong image display. For unscaled mode, it
correctly uses direct scanout.

Fixes: 580204038f5b ("drm/amd/display: Enable support for 16 bpc fixed-point framebuffers.")
Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
Tested-by: Mario Kleiner <mario.kleiner.de@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index d3e62f511c8f..394880ec1078 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -1060,10 +1060,15 @@ static void amdgpu_dm_plane_get_min_max_dc_plane_scaling(struct drm_device *dev,
 		*min_downscale = plane_cap->max_downscale_factor.nv12;
 		break;
 
+	/* All 64 bpp formats have the same fp16 scaling limits */
 	case DRM_FORMAT_XRGB16161616F:
 	case DRM_FORMAT_ARGB16161616F:
 	case DRM_FORMAT_XBGR16161616F:
 	case DRM_FORMAT_ABGR16161616F:
+	case DRM_FORMAT_XRGB16161616:
+	case DRM_FORMAT_ARGB16161616:
+	case DRM_FORMAT_XBGR16161616:
+	case DRM_FORMAT_ABGR16161616:
 		*max_upscale = plane_cap->max_upscale_factor.fp16;
 		*min_downscale = plane_cap->max_downscale_factor.fp16;
 		break;
-- 
2.43.0


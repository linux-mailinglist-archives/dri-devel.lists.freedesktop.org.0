Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 994FABDE24D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 13:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B7A10E0A1;
	Wed, 15 Oct 2025 11:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nNtbzxfZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7704610E0A1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 11:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760526043;
 bh=HB6Q6D4Hs4FfwnTwoNDE1V+Zug5U4RJSGIpBXea7yjM=;
 h=From:To:Cc:Subject:Date:From;
 b=nNtbzxfZ8MwKmdcO30dL2wxS1gkEQ4P0hml3N62NHpLIubNURfEH49P0kkiB+UwZB
 X9BQ+0cwk4Mw5ksVUUd+czEM2JrD+UhACK2LmXe4wWKpehleSUzVk4ZSjyklBhxwDM
 oFSE1hHhxqtDnQMnmcqnIhd/Dv89Bme0M+Zcx27tAwYk3hz/bcl+AadSW/kAzO+fnh
 Ie49W9s9B2KA7DF8epPXFCFOFsDC1m4KgWJoEuiT85DIG/cVpRlDo8Z+zQF8+WiKyX
 iBCsIxiae5esnD5F659i14AmGA8ksCdkb4dE7JCdqWpqIDTwMutQ2InlIzQZpqpGVB
 dJt9Dz67v519A==
Received: from reinforced.mynet (unknown
 [IPv6:2a01:4b00:be1d:c600:6089:8bab:34a0:d4c5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: daniels)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D929917E05FE;
 Wed, 15 Oct 2025 13:00:42 +0200 (CEST)
From: Daniel Stone <daniels@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: andy.yan@rock-chips.com, hjc@rock-chips.com, heiko@sntech.de,
 cristian.ciocaltea@collabora.com, kernel@collabora.com
Subject: [PATCH 00/13] drm/rockchip: No more post-atomic_check fixups
Date: Wed, 15 Oct 2025 12:00:29 +0100
Message-ID: <20251015110042.41273-1-daniels@collabora.com>
X-Mailer: git-send-email 2.51.0
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

Hi,
This series is a pretty small and consistent one for VOP2. The atomic
uAPI very clearly specifies that drivers should either do what userspace
requested (on a successful commit), or fail atomic_check if it is not
for any reason possible to do what userspace requested.

VOP2 is unfortunately littered with a bunch of cases where it will apply
fixups after atomic_check - doing something different to what userspace
requested, e.g. clipping or aligning regions - or throw error messages
into the log when userspace does request a condition which can't be met.

Doing something different to what was requested is bad because it
results in unexpected visual output which can look like artifacts.
Throwing errors into the log is bad because generic userspace will
reasonably attempt to try any configuration it can. For example,
throwing an error message on a plane not being aligned to a 16 pixel
boundary can result in 15 frames' worth of error output in the log when
a window is being animated across a screen.

This series removes all post-check fixups - failing the check if the
configuration cannot be applied - and also demotes all messages about
unsupported configurations to DEBUG_KMS.

Cheers,
Daniel

Daniel Stone (13):
  drm/rockchip: Demote normal drm_err to debug
  drm/rockchip: Declare framebuffer width/height bounds
  drm/rockchip: Return error code for errors
  drm/rockchip: Rename variables for clarity
  drm/rockchip: Use temporary variables
  drm/rockchip: Switch impossible format conditional to WARN_ON
  drm/rockchip: Switch impossible pos conditional to WARN_ON
  drm/rockchip: Fix eSmart test condition
  drm/rockchip: Enforce scaling workaround in plane_check
  drm/rockchip: Enforce AFBC source alignment in plane_check
  drm/rockchip: Enforce AFBC transform stride align in plane_check
  drm/rockchip: Use drm_is_afbc helper function
  drm/rockchip: Simplify format_mod_supported

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 202 +++++++++----------
 1 file changed, 99 insertions(+), 103 deletions(-)

-- 
2.51.0


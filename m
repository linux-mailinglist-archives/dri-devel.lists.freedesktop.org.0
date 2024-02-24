Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9128625B4
	for <lists+dri-devel@lfdr.de>; Sat, 24 Feb 2024 16:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB19610E10F;
	Sat, 24 Feb 2024 15:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xff.cz header.i=@xff.cz header.b="L9I4meje";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DCD10E10F
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Feb 2024 15:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1708787167; bh=Uryo3XdwAekEHSVjuMlMntBb6I1zHeuqUQ7N7xRLv/U=;
 h=From:To:Cc:Subject:Date:From;
 b=L9I4meje818PMKLYF5UA9Z980dPtZPCvuEHAL7MwqojCWJPc7xFfL2iAoX8mXD2fI
 DeaNRvSzDJnxkEngB9cioOYKej5HrJ/2mEcDFCTHdkyh6ddvPadR/JinhQSd0GZPyh
 yZe5GBB4MjEO5Qhzgsisj4VGB/McpYIn3o4yjQ+8=
From: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Ondrej Jirman <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH v2 0/3] Move blender setup from individual planes to crtc
 commit in sun4i-drm
Date: Sat, 24 Feb 2024 16:05:57 +0100
Message-ID: <20240224150604.3855534-1-megi@xff.cz>
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

From: Ondrej Jirman <megi@xff.cz>

This series refactors blender setup from individual planes to a common
place where it can be performed at once and is easier to reason about.

In the process this fixes a few bugs that allowed blender pipes to be
disabled while corresponding DRM planes were requested to be enabled.

Please take a look. :)

v2:
- use regmap_write where possible
- add review tags

Thank you very much,
	Ondřej Jirman

Ondrej Jirman (3):
  drm/sun4i: Unify sun8i_*_layer structs
  drm/sun4i: Add more parameters to sunxi_engine commit callback
  drm/sun4i: Fix layer zpos change/atomic modesetting

 drivers/gpu/drm/sun4i/sun4i_backend.c  |  4 +-
 drivers/gpu/drm/sun4i/sun4i_crtc.c     |  2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 70 ++++++++++++++++++++-
 drivers/gpu/drm/sun4i/sun8i_mixer.h    | 20 ++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 85 +++----------------------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h | 20 ++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 86 +++-----------------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h | 20 ++----
 drivers/gpu/drm/sun4i/sunxi_engine.h   | 13 +++-
 9 files changed, 125 insertions(+), 195 deletions(-)

-- 
2.44.0


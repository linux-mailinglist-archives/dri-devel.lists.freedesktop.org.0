Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8808A8585EF
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 20:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3212C10EC5C;
	Fri, 16 Feb 2024 19:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=xff.cz header.i=@xff.cz header.b="z3mvE0kH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E15910EC5C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Feb 2024 19:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1708110272; bh=sRk5vgWXV6TN/MIXrm4lDllEkl5I4mq5NJ+73eNz0L4=;
 h=From:To:Cc:Subject:Date:From;
 b=z3mvE0kHkdjI+3haAogAZtgaLooSLbHIzpB1TsKN+hul18rP6xfYei3GFGva5RCQC
 /NlLC2CoMXvzJW2BFZknPblJXo+AX93t81Roc/5diNNnQLg9Gub6jAsxjnJ9CsbW81
 dP5U4mCnh/+4yZ1ijwbwKsbSJHVfyxHUxy8iMoYg=
From: =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Ondrej Jirman <megi@xff.cz>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Move blender setup from individual planes to crtc commit
 in sun4i-drm
Date: Fri, 16 Feb 2024 20:04:23 +0100
Message-ID: <20240216190430.1374132-1-megi@xff.cz>
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

Thank you very much,
	Ondřej Jirman

Ondrej Jirman (3):
  drm/sun4i: Unify sun8i_*_layer structs
  drm/sun4i: Add more parameters to sunxi_engine commit callback
  drm/sun4i: Fix layer zpos change/atomic modesetting

 drivers/gpu/drm/sun4i/sun4i_backend.c  |  4 +-
 drivers/gpu/drm/sun4i/sun4i_crtc.c     |  2 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 82 +++++++++++++++++++++++-
 drivers/gpu/drm/sun4i/sun8i_mixer.h    | 20 ++++++
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 85 +++----------------------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.h | 20 ++----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 86 +++-----------------------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h | 20 ++----
 drivers/gpu/drm/sun4i/sunxi_engine.h   | 13 +++-
 9 files changed, 137 insertions(+), 195 deletions(-)

-- 
2.43.0


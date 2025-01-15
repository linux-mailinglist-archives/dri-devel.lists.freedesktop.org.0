Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6675A12D1E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 22:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C442B10E023;
	Wed, 15 Jan 2025 21:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SnqTht0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B47210E023
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 21:05:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2FA665C007A;
 Wed, 15 Jan 2025 21:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A80C4CED1;
 Wed, 15 Jan 2025 21:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736975141;
 bh=lKM/DC0pI/I/NPuiSy6v3+7VljKlpcN12umdnUdYvdk=;
 h=From:Subject:Date:To:Cc:From;
 b=SnqTht0C3m5Eo0+TQO+JvH8vj/z4nD1X+dgoCuoVZs/v1o/w43calDRQ36JxGrWUf
 JtgNjViupE/Hr3GmhazwBWWJBVlMKcH09qn4KdgAwvu9u6h/xb0bVVky2nMthzwoGw
 f9VEc7kfirVmjOMrWvFkI9VDSaUQ3NIMtuwc+szfz9iRN2ipk6Wg6B4PavsrSQUTXQ
 mTjLZLnnciB4SGiRzUIbKZFc2abuGF+cWUIuEJw0Bx5oJitHdHdPxr0ehSdOWZbhYX
 9/Mqid/LdNXTYstCmSlVekU/7P84KyDcc8LzO6Cr2IXjS2WLxIDJrIU00RrJQ2MCuj
 pCxYelZZ0yvug==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 00/29] drm/bridge: Various quality of life improvements
Date: Wed, 15 Jan 2025 22:05:07 +0100
Message-Id: <20250115-bridge-connector-v1-0-9a2fecd886a6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAMjiGcC/x2MywqAIBAAfyX2nKD2wn4lOpSttReNNSKQ/r2l4
 wzMFMjIhBnGqgDjTZlSFDB1Bf5Y4o6KNmGw2nbamE6tTJtYn2JEfyVWwTXGtWj7IQSQ7GQM9Pz
 LaX7fD14B6fliAAAA
X-Change-ID: 20250115-bridge-connector-f93194e267ff
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3432; i=mripard@kernel.org;
 h=from:subject:message-id; bh=lKM/DC0pI/I/NPuiSy6v3+7VljKlpcN12umdnUdYvdk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDOkdyty7V6s/2RJpnfI0aVOI4YQFay5fNJ3NcuecJ8fr7
 bPMGVdpdkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJvExlrK+eZXIqldv+gvhK
 FZWynF0/WM/ZiPnmyz943H/gq1nGL/kJvvN2XD5W1HX+sGT0xcwEc8Y6q/sLvP+saF/gt/lv82r
 +WS+Odvr8fSuhcOvIjPwHOS/MHSa+zuP7Jjs5co6NwwGN8Cl6AA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Here's a series of changes after to the KMS helpers and bridge API
following a bunch of reviews I did.

It's mostly centered across providing an easier time to deal with bridge
states, and a somewhat consistent with the other entities API.

It's build tested only.

Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (29):
      drm/atomic-helper: Fix commit_tail state variable name
      drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_dependencies()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_tail()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_tail_rpm()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_modeset_disables()
      drm/atomic-helper: Change parameter name of disable_outputs()
      drm/bridge: Change parameter name of drm_atomic_bridge_chain_disable()
      drm/bridge: Change parameter name of drm_atomic_bridge_chain_post_disable()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_update_legacy_modeset_state()
      drm/atomic-helper: Change parameter name of crtc_set_mode()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_planes()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_modeset_enables()
      drm/bridge: Change parameter name of drm_atomic_bridge_chain_pre_enable()
      drm/bridge: Change parameter name of drm_atomic_bridge_chain_enable()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_writebacks()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_fake_vblank()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_hw_done()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_vblanks()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_cleanup_planes()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_commit_cleanup_done()
      drm/atomic-helper: Change parameter name of drm_atomic_helper_wait_for_flip_done()
      drm/bridge: Rename atomic hooks parameters to drop old prefix
      drm/bridge: Provide a helper to retrieve current bridge state
      drm/bridge: Provide a helper to get the global state from a bridge state
      drm/bridge: Provide pointers to the connector and crtc in bridge state
      drm/bridge: cdns-csi: Switch to atomic helpers
      drm/bridge: tc358775: Switch to atomic commit
      drm/bridge: tc358768: Convert to atomic helpers
      drm/bridge: ti-sn65dsi86: Use bridge_state crtc pointer

 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c |  22 ++-
 drivers/gpu/drm/bridge/tc358768.c              |  28 ++-
 drivers/gpu/drm/bridge/tc358775.c              |  32 ++--
 drivers/gpu/drm/bridge/ti-sn65dsi86.c          |  41 +++--
 drivers/gpu/drm/drm_atomic_helper.c            | 242 ++++++++++++-------------
 drivers/gpu/drm/drm_atomic_state_helper.c      |   5 +
 drivers/gpu/drm/drm_bridge.c                   |  61 ++++---
 include/drm/drm_atomic.h                       |  30 +++
 include/drm/drm_bridge.h                       |  25 ++-
 9 files changed, 279 insertions(+), 207 deletions(-)
---
base-commit: 573b73e5ac2ce0d58859eace8218f3a7e9212186
change-id: 20250115-bridge-connector-f93194e267ff

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


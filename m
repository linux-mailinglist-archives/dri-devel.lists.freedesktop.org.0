Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9AF86A866
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 07:36:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593C310E4A4;
	Wed, 28 Feb 2024 06:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=atomide.com header.i=@atomide.com header.b="Y2Gr/SB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CF710E4A4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Feb 2024 06:36:37 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id CE44C603C6;
 Wed, 28 Feb 2024 06:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1709102196;
 bh=TvTu9swDGR5SvHLBlOYu7buPsT5R8bc5TqNCjCJsSbM=;
 h=From:To:Cc:Subject:Date:From;
 b=Y2Gr/SB1PUa/DjxFssS8AgREcs9iHYLHpEXttrjyyvxWTTFvlaxVc2mz0IwjHj/ga
 Lh9bispRdd2XNYF8lo0lZevIuUqi4x7LkeciX3WXBDWrKyLazs0TskwJawtwHzIfaB
 v5UsSaI9B2BOFS8UjI/MtH13LKTd6fFchpLhZ97DpSFV0Zny2+sAf4tJcI3kNzy1eA
 HKcAafAfTtKkrQwyzmca9e2tDDE+tpzzikBxSp42YBAAmD1R62p6jSnaJRTkhTT2oy
 5i6U4FWgwvNHN5ggcERnnQ0FTJa4dBhSOK2jhC1mKzHzMOag285MuWU/x1yMa4M06H
 FJKNqxB8tGjWg==
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 0/2] Fixes for omapdrm console
Date: Wed, 28 Feb 2024 08:35:30 +0200
Message-ID: <20240228063540.4444-1-tony@atomide.com>
X-Mailer: git-send-email 2.43.1
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

Here are two fixes for omapdrm for missing drm_framebuffer_funcs.dirty
that needs to be paired with omap_framebuffer_dirty(), and to add
FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS so things behave as earlier with
drm_fb_helper_sys_write(). Without these fixes, the console won't update
for the command mode displays. And likely mmap() using writes can miss
updates as noted by Thomas.

Regards,

Tony

Changes since v2:
- Fix cache issue noted by Tomi using custom omap_fbdev_fb_mmap() as
  suggested by Thomas

- Add FB_DMAMEM_HELPERS_DEFERRED Kconfig option and use it for omapdrm
  as noted by Thomas

Changes since v1:

- Add FB_GEN_DEFAULT_DEFERRED_DMAMEM_OPS to use with
  FB_DEFAULT_DEFERRED_OPS as suggested by Thomas

Tony Lindgren (2):
  drm/omapdrm: Fix console by implementing fb_dirty
  drm/omapdrm: Fix console with deferred ops

 drivers/gpu/drm/omapdrm/Kconfig      |  2 +-
 drivers/gpu/drm/omapdrm/omap_fbdev.c | 40 +++++++++++++++++++++++-----
 drivers/video/fbdev/core/Kconfig     |  6 +++++
 include/linux/fb.h                   |  4 +++
 4 files changed, 45 insertions(+), 7 deletions(-)

-- 
2.43.1

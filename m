Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0E6962A87
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 16:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E708010E54E;
	Wed, 28 Aug 2024 14:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D6E10E54E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 14:42:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C2946A4155C;
 Wed, 28 Aug 2024 14:42:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F07C4CEDF;
 Wed, 28 Aug 2024 14:26:15 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/7] media: export InfoFrames to debugfs
Date: Wed, 28 Aug 2024 16:24:06 +0200
Message-ID: <cover.1724855053.git.hverkuil-cisco@xs4all.nl>
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

Maxime added support for exporting InfoFrames to debugfs for drm,
and this series does the same for the media subsystem.

I used the same names for the InfoFrames as the drm implementation
does, and the format is the same as well. And edid-decode can be
used to parse the InfoFrames and do conformity checking.

The first two patches add helpers for this to the core framework,
and the next 5 patches add support for this to the HDMI drivers.

I tested the three adv drivers, and Dave Stevenson tested the tc358743
driver.

I don't have a tda1997x available for testing, so I might decide
to just drop that patch.

This is very useful for debugging received InfoFrames.

Regards,

	Hans

Hans Verkuil (7):
  media: v4l2-core: add v4l2_debugfs_root()
  media: v4l2-core: add v4l2_debugfs_if_alloc/free()
  media: i2c: adv7511-v4l2: export InfoFrames to debugfs
  media: i2c: adv7604: export InfoFrames to debugfs
  media: i2c: adv7842: export InfoFrames to debugfs
  media: i2c: tc358743: export InfoFrames to debugfs
  media: i2c: tda1997x: export InfoFrames to debugfs

 drivers/media/i2c/adv7511-v4l2.c          |  91 +++++++++++++---
 drivers/media/i2c/adv7604.c               |  90 ++++++++++++----
 drivers/media/i2c/adv7842.c               | 120 ++++++++++++++++------
 drivers/media/i2c/tc358743.c              |  36 ++++++-
 drivers/media/i2c/tda1997x.c              |  50 ++++++++-
 drivers/media/v4l2-core/v4l2-dev.c        |  14 +++
 drivers/media/v4l2-core/v4l2-dv-timings.c |  63 ++++++++++++
 include/media/v4l2-dev.h                  |  15 +++
 include/media/v4l2-dv-timings.h           |  48 +++++++++
 9 files changed, 455 insertions(+), 72 deletions(-)

-- 
2.43.0


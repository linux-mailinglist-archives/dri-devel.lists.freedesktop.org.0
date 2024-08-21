Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB49959F80
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 16:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F1B10E600;
	Wed, 21 Aug 2024 14:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3412C10E5F9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 14:16:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 53E6FCE0E00
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 14:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D630C32781;
 Wed, 21 Aug 2024 14:16:43 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/7] media: export InfoFrames to debugfs
Date: Wed, 21 Aug 2024 16:10:14 +0200
Message-ID: <cover.1724249420.git.hverkuil-cisco@xs4all.nl>
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

I tested the three adv drivers, and I hope to test the tc358743
driver at some point in the not too distant future :-)

I don't have a tda1997x available for testing, so I might decide
to just drop this.

It's RFC for now, but I think it is quite straightforward.

This is very useful for debugging received InfoFrames.

Regards,

	Hans

Hans Verkuil (7):
  media: v4l2-core: add v4l2_debugfs_root()
  media: v4l2-core: add v4l2_debugfs_if_alloc/free()
  media: i2c: adv7511-v4l2: export InfoFrames to debugfs
  media: i2c: adv7604: export InfoFrames to debugfs
  media: i2c: adv7842: export InfoFrames to debugfs
  media: i2c: tda1997x: export InfoFrames to debugfs
  media: i2c: tc358743: export InfoFrames to debugfs

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


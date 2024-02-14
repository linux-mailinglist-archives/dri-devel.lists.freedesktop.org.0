Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86A88548FD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 13:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361CF10E1EB;
	Wed, 14 Feb 2024 12:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lktErl8e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9469510E222
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 12:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707912899;
 bh=tfISkpmpp4nJRcfb3dG1pEk85K2saMry/h9bbcDcZVc=;
 h=From:To:Cc:Subject:Date:From;
 b=lktErl8emXZHiqOYad3nGkmzkVwF/jIOq8I9KToY++xNzSATm6o9jnxce9vzGrvej
 WQzLzChYKMePwRsZrRIHemSHL2Z8gZAHy1lNJWuCscuy07vlIHbMFhlRU5XuSZKpYU
 mjdIra5TFyd8KJkzRRPQ/tlP8KgOY3LiV/woOuGwEsMAfCdC4zMiig72xWF1N/yhXE
 tklI/2hOpOhJIwjZvF4BlYHBygXGf095uI+sgKILDMIYxzeIJZIS2gEp1KMwCJjrYH
 zWq4/TcxHKec+AufIpi4YSxvnT7iWzVs03C4IeYS1Hm4RZYYiqgDhKwXBx8upF/Dn5
 4JWE1v1EkPDGg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1577A378045F;
 Wed, 14 Feb 2024 12:14:59 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/1] Always record job cycle and timestamp information
Date: Wed, 14 Feb 2024 12:14:26 +0000
Message-ID: <20240214121435.3813983-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.43.0
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

A driver user expressed interest in being able to access engine usage stats
through fdinfo when debugfs is not built into their kernel. In the current
implementation, this wasn't possible, because it was assumed even for
inflight jobs enabling the cycle counter and timestamp registers would
incur in additional power consumption, so both were kept disabled until
toggled through debugfs.

A second read of the TRM made me think otherwise, but this is something
that would be best clarified by someone from ARM's side.

Adrián Larumbe (1):
  drm/panfrost: Always record job cycle and timestamp information

 drivers/gpu/drm/panfrost/Makefile           |  2 --
 drivers/gpu/drm/panfrost/panfrost_debugfs.c | 21 ------------------
 drivers/gpu/drm/panfrost/panfrost_debugfs.h | 14 ------------
 drivers/gpu/drm/panfrost/panfrost_device.h  |  1 -
 drivers/gpu/drm/panfrost/panfrost_drv.c     |  5 -----
 drivers/gpu/drm/panfrost/panfrost_job.c     | 24 ++++++++-------------
 drivers/gpu/drm/panfrost/panfrost_job.h     |  1 -
 7 files changed, 9 insertions(+), 59 deletions(-)
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h


base-commit: 6b1f93ea345947c94bf3a7a6e668a2acfd310918
-- 
2.43.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B62E8FDBAE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 02:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1678E10E0A6;
	Thu,  6 Jun 2024 00:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Q+QJYzRN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F8F10E0A6
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 00:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1717635274;
 bh=lzJtHlgCun8Ywse+qQtajmZ7QYd4hIobqe/lcYmoP90=;
 h=From:To:Cc:Subject:Date:From;
 b=Q+QJYzRNDdNIbSd2bjvzdE1wxoxmzu2NfmaEuMUR7YIrQpCoVRQsbCcScQfQ1g/Y+
 7qhPdZ9VQYPuj60zfPY+kiLAsqDJrUwqBgEejeVLj9ilC2gMH3kar4Uxq9pxHhS/gW
 5OVo9fJxTjXJsiLhN+Mbbk09E0SXFhvUWf95gk5f9h7fYCy9QC+tk+OGhRPavzKA5c
 BkRUJNgz3TZ8lGGqgjmtOW6kRN9tnwVnfnNKvYiylfdELKdIa+i10RXS/bZxISQjM0
 syvPwYUfB6QLDV1J2dmMjLgboADFpKUtU9tLt8lg1VhWr7Yc09aZy85QvnsJnX/TKs
 mVqccGx5/ceBQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id AC85D37821C1;
 Thu,  6 Jun 2024 00:54:33 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] Support fdinfo runtime and memory stats on Panthor
Date: Thu,  6 Jun 2024 01:49:52 +0100
Message-ID: <20240606005416.1172431-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.45.1
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

This patch series enables userspace utilities like gputop and nvtop to
query a render context's fdinfo file and figure out rates of engine
and memory utilisation.

Previous discussion can be found at
https://lore.kernel.org/dri-devel/20240423213240.91412-1-adrian.larumbe@collabora.com/

Changelog:
v3:
 - Fixed some nits and removed useless bounds check in panthor_sched.c
 - Added support for sysfs profiling knob and optional job accounting
 - Added new patches for calculating size of internal BO's
v2:
 - Split original first patch in two, one for FW CS cycle and timestamp
 calculations and job accounting memory management, and a second one
 that enables fdinfo.
 - Moved NUM_INSTRS_PER_SLOT to the file prelude
 - Removed nelem variable from the group's struct definition.
 - Precompute size of group's syncobj BO to avoid code duplication.
 - Some minor nits.


Adrián Larumbe (7):
  drm/panthor: introduce job cycle and timestamp accounting
  drm/panthor: add DRM fdinfo support
  drm/panthor: enable fdinfo for memory stats
  drm/panthor: add sysfs knob for enabling job profiling
  drm/panthor: support job accounting
  drm/drm_file: add display of driver's internal memory size
  drm/panthor: register size of internal objects through fdinfo

 Documentation/gpu/drm-usage-stats.rst     |   4 +
 drivers/gpu/drm/drm_file.c                |   9 +-
 drivers/gpu/drm/msm/msm_drv.c             |   2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c   |   2 +-
 drivers/gpu/drm/panthor/panthor_devfreq.c |  10 +
 drivers/gpu/drm/panthor/panthor_device.c  |   2 +
 drivers/gpu/drm/panthor/panthor_device.h  |  21 ++
 drivers/gpu/drm/panthor/panthor_drv.c     |  83 +++++-
 drivers/gpu/drm/panthor/panthor_fw.c      |  16 +-
 drivers/gpu/drm/panthor/panthor_fw.h      |   5 +-
 drivers/gpu/drm/panthor/panthor_gem.c     |  67 ++++-
 drivers/gpu/drm/panthor/panthor_gem.h     |  16 +-
 drivers/gpu/drm/panthor/panthor_heap.c    |  23 +-
 drivers/gpu/drm/panthor/panthor_heap.h    |   6 +-
 drivers/gpu/drm/panthor/panthor_mmu.c     |   8 +-
 drivers/gpu/drm/panthor/panthor_mmu.h     |   3 +-
 drivers/gpu/drm/panthor/panthor_sched.c   | 304 +++++++++++++++++++---
 include/drm/drm_file.h                    |   7 +-
 18 files changed, 522 insertions(+), 66 deletions(-)


base-commit: 310ec03841a36e3f45fb528f0dfdfe5b9e84b037
-- 
2.45.1


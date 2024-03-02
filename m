Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B83D86F0EF
	for <lists+dri-devel@lfdr.de>; Sat,  2 Mar 2024 16:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E838C10F4C6;
	Sat,  2 Mar 2024 15:49:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kH023/Uv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E0B110F4C6
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Mar 2024 15:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709394570;
 bh=HynQocuJOxjcyWAXFyZaIokqOOlqZOfq1ChkQP5+nVw=;
 h=From:To:Cc:Subject:Date:From;
 b=kH023/UvRJljNhpLdKB/Nn8WM/o540hNs2gVrI9jRtYaqRvJsMvrzXWRTc8Y5gceE
 Q/tTR3gK2LW9EbzxDQMtpxi2MfDk/mm1d+lkkbKFtj4mVUmhYDLGboojXXPk7ekw89
 VZbs8AFM6DQO8xU503UXz6+Yeuj2Acw+yZ/lZpryw1nQpWqRDB8xGY+ELa8XvyTifA
 lXQRLHz/4Qc/cXSs9pNHf28cO5CZqQYT/5LmBazHGkuNxP6nRarASFWMOdikBS7OkU
 eDU+3qB/qYLvXOkDW6LK1fxHu2DiX1ueAchyvpq0AEp19pB6c8qsBnQjN4L9LK7+/M
 2G1gATNL95o+w==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 18DA637813CA;
 Sat,  2 Mar 2024 15:49:30 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: [PATCH v2 0/1] drm/panfrost: Replace fdinfo's profiling debugfs knob
Date: Sat,  2 Mar 2024 15:48:40 +0000
Message-ID: <20240302154845.3223223-2-adrian.larumbe@collabora.com>
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

This is v2 of the patch already discussed in [1]

Changelog:
 - Turned the profile mode atomic variable into a boolean
 - Rewrote the sysfs file's uAPI documentation to make it more generic
 - Improved the casting of the profiling variable inside the Panfrost device structure

[1]https://lore.kernel.org/dri-devel/20240221161237.2478193-1-adrian.larumbe@collabora.com/

Adrián Larumbe (1):
  drm/panfrost: Replace fdinfo's profiling debugfs knob with sysfs

 .../testing/sysfs-driver-panfrost-profiling   | 10 +++
 Documentation/gpu/panfrost.rst                |  9 +++
 drivers/gpu/drm/panfrost/Makefile             |  5 +-
 drivers/gpu/drm/panfrost/panfrost_debugfs.c   | 21 ------
 drivers/gpu/drm/panfrost/panfrost_debugfs.h   | 14 ----
 drivers/gpu/drm/panfrost/panfrost_device.h    |  5 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       | 14 ++--
 drivers/gpu/drm/panfrost/panfrost_job.c       |  2 +-
 drivers/gpu/drm/panfrost/panfrost_sysfs.c     | 70 +++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_sysfs.h     | 15 ++++
 10 files changed, 120 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-panfrost-profiling
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.c
 delete mode 100644 drivers/gpu/drm/panfrost/panfrost_debugfs.h
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_sysfs.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_sysfs.h


base-commit: 216c1282dde38ca87ebdf1ccacee5a0682901574
-- 
2.43.0


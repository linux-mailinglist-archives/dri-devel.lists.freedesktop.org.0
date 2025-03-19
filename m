Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8DCA692D2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 16:16:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECCCA10E519;
	Wed, 19 Mar 2025 15:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="EdCtippt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5D710E519
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 15:16:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742397373; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=kP6MKm231y+p86vJj3lgqWO41uwKU7hab++9xSsLjAMYFNr8KpqU3si1FxV5CQ70vdqiBZ4oRE7daC0ac48QHqJXo+LqrqeZm4S++FeURr6YgZ5DbP++pEjEGSNYMQtIPl86+kWooWD6Ius3ukit1VexH1i6xCkEDaBGvibPLHA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742397373;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=iQsw2Yqkfu4c/F+2H/DRIW2untXcbSo1Qujc3AC3PUM=; 
 b=KAnceKq3mqZtxruSZPl+wcl020RzYJ7+2bf0+ExjCmdEJVeqjIMVBQkVq6DaX9s8WHGiXYl10G9UvxNuQGEFJ7xbg9CjRw5CEkLyK4yK0rm70mJHiyr1gCwtXDXe1ohGaaZzKgTnYjTOzkuTAzFaB8eQLZVrG8fszFUUKy+pSCM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742397373; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=iQsw2Yqkfu4c/F+2H/DRIW2untXcbSo1Qujc3AC3PUM=;
 b=EdCtipptt3uSiM/xN4sPQyPSyyX7IyXuFHKbeWY/83/xVlrbAKLUGC/+yXpSTYQl
 lKP8wy31bcZleBB2fyc295PCtlehHssL+USG89HE7XKBUAmWakwxIeu6ODLB18W3ZeI
 ec6Kqvph54pSUnUe8QJBeaKxGYC1sxiO38tpxP7Q=
Received: by mx.zohomail.com with SMTPS id 1742397372202236.04927725024265;
 Wed, 19 Mar 2025 08:16:12 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] Panthor BO tagging and GEMS debug display
Date: Wed, 19 Mar 2025 15:03:15 +0000
Message-ID: <20250319150953.1634322-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
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

This patch series is aimed at providing UM with detailed memory profiling
information in debug builds. It is achieved through a device-wide list of
DRM GEM objects, and also implementing the ability to label BO's from UM
through a new IOCTL.

The new debugfs file shows a list of driver DRM GEM objects in tabular mode.
To visualise it, cat sudo cat /sys/kernel/debug/dri/*.gpu/gems.

Previous discussion mail archive:
https://lore.kernel.org/dri-devel/20250316215139.3940623-1-adrian.larumbe@collabora.com/

Changelog:
 v2:
  - Consolidated some debugfs and labelling struct members into nested structs
  - Added helpers for handling the debugfs gems linked list
  - Fixed ioctl naming scheme in the uapi header file
  - Added label length limit and param consistency checks in BO labelling ioctl

Adrián Larumbe (4):
  drm/panthor: Introduce BO labeling
  drm/panthor: Add driver IOCTL for setting BO labels
  drm/panthor: show device-wide list of DRM GEM objects over DebugFS
  drm/panthor: Display heap chunk entries in DebugFS GEMS file

 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_device.h |  11 ++
 drivers/gpu/drm/panthor/panthor_drv.c    |  63 ++++++++++
 drivers/gpu/drm/panthor/panthor_gem.c    | 154 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_gem.h    |  48 +++++++
 drivers/gpu/drm/panthor/panthor_heap.c   |   3 +
 include/uapi/drm/panthor_drm.h           |  19 +++
 7 files changed, 303 insertions(+)

--
2.48.1

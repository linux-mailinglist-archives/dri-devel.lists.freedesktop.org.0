Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AC4872929
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 22:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8888A112CB8;
	Tue,  5 Mar 2024 21:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="endf5MQ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C4F112CB8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 21:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709673079;
 bh=OKwLmlwHaVM9YDm02QY7BaQXKQlATiOtDVXMPFzNoF8=;
 h=From:To:Cc:Subject:Date:From;
 b=endf5MQ4Js1GWRWnOg9eYVceof+qnDPQd9vjpPl2lb7brl2Zb1u9q52UXgNOVC7c/
 WcxuQO+i6VGwX6XlON4J4lF9kFK++q4eOycYsNU7LXi1Tj1RPGPaAPNpmWSq2PXmPv
 CQO1cqJFXHzVaCju3q3WmTk+M6dPf+WKm6+u4CtH/SLRcSyhR7LEkhsj7+1ohtyRD7
 ZfhZc2hs5Tz4kUaGIKJ8ELkj9Ld/PbLAtmt5HwRCunJwg/T/fOCgNtTs9eIRXdwO7e
 lZguXX9MEhYQWltncKNDIAmFIbXWkecfTIj9eeuNqzGwaMk6+i4kO+le8WQxhnLv+R
 4kOHJOdE4oUwg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5B5663781FDF;
 Tue,  5 Mar 2024 21:11:18 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: boris.brezillon@collabora.com, steven.price@arm.com, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: adrian.larumbe@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: [PATCH 0/2] Support fdinfo runtime and memory stats on Panthor
Date: Tue,  5 Mar 2024 21:05:48 +0000
Message-ID: <20240305211000.659103-1-adrian.larumbe@collabora.com>
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

This patch series enables userspace utilities like gputop and nvtop to
query a render context's fdinfo file and figure out rates of engine
and memory utilisation.

Adrián Larumbe (2):
  drm/panthor: Enable fdinfo for cycle and time measurements
  drm/panthor: Enable fdinfo for memory stats

 drivers/gpu/drm/panthor/panthor_devfreq.c |  10 +
 drivers/gpu/drm/panthor/panthor_device.h  |  11 ++
 drivers/gpu/drm/panthor/panthor_drv.c     |  32 ++++
 drivers/gpu/drm/panthor/panthor_gem.c     |  12 ++
 drivers/gpu/drm/panthor/panthor_sched.c   | 217 +++++++++++++++++++---
 5 files changed, 254 insertions(+), 28 deletions(-)


base-commit: e635b7eb7062b464bbd9795308b1a80eac0b01f5
-- 
2.43.0


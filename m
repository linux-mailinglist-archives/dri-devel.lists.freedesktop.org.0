Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2067D9332BC
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 22:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D609B10E8A3;
	Tue, 16 Jul 2024 20:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ffUeQQE6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5F610E8A3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 20:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721160793;
 bh=6sp+DN6OIsTNJSurT4rQssO9dRU9wxOW/cy+PG12B20=;
 h=From:To:Cc:Subject:Date:From;
 b=ffUeQQE6mQ3O3hXk1iq2IzQrs6RpFI17LsMwo+rS61feLh60BiAd9xfovGojL9ckI
 HH4Q7zA/y8J3Cp1LgaZvbRDt9ynDa/dz8plShv74IU8+96g6At7UeJxXUXIBIKREnE
 UOA8AMViU/oZ+xLRmCehx4UiI/HbZ4YWa5lKslwm8hDHSgJqljXowOcOKDF7l1IhAE
 /THrq/C+7Cr/J6PtFCA2R8VB5Y9ScNQUs6B/fPej1apKyJiRpJuJGCfUDlHHduS1q5
 PByU0MeUEvIqpS63xbyO7J3RUzTIVFGzkWHLgcsmi/5HkxY9W6yKkOhgguiuLhFuYa
 X2Ah/KNQzZiLA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id E1C463780480;
 Tue, 16 Jul 2024 20:13:12 +0000 (UTC)
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
Subject: [PATCH v4 0/4] Support fdinfo runtime and memory stats on Panthor
Date: Tue, 16 Jul 2024 21:11:39 +0100
Message-ID: <20240716201302.2939894-1-adrian.larumbe@collabora.com>
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
https://lore.kernel.org/dri-devel/dqhnxhgho6spfh7xhw6yvs2iiqeqzeg63e6jqqpw2g7gkrfphn@dojsixyl4esv/

Changelog:
v4:
 - Fixed wrong assignment location for frequency values in Panthor's devfreq
 - Removed the last two commits about registering size of internal BO's
 - Rearranged patch series so that sysfs knob is done last and all the previous
 time sampling and fdinfo show dependencies are already in place
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

Adrián Larumbe (4):
  drm/panthor: introduce job cycle and timestamp accounting
  drm/panthor: add DRM fdinfo support
  drm/panthor: enable fdinfo for memory stats
  drm/panthor: add sysfs knob for enabling job profiling

 drivers/gpu/drm/panthor/panthor_devfreq.c |  18 +-
 drivers/gpu/drm/panthor/panthor_device.h  |  12 +
 drivers/gpu/drm/panthor/panthor_drv.c     |  69 +++++
 drivers/gpu/drm/panthor/panthor_gem.c     |  12 +
 drivers/gpu/drm/panthor/panthor_sched.c   | 291 +++++++++++++++++++---
 5 files changed, 371 insertions(+), 31 deletions(-)

-- 
2.45.1


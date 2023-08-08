Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B878774E31
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 00:22:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885A410E115;
	Tue,  8 Aug 2023 22:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F7510E115
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 22:22:50 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C236766071E0;
 Tue,  8 Aug 2023 23:22:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691533368;
 bh=5SDjhQMDm26ufFacwMtrPXYKPBi6NVFzvYKGHSHP5T8=;
 h=From:To:Cc:Subject:Date:From;
 b=JI2dpb94v0ahhW3yz2OoaSdcrGzIRriXFBJNEFEum+6b5q4mir5WfbaG+iS48/PaE
 IMEV8ada+23MguCmu2amYAEonW8Oh0tZ0WN3pKePxbJzFUwBlwXdP6D+gMQO1icuK0
 ZizBcqO9DBnrPoXRD1nrmJP2NQi0CpwZhRjG0NrkdcjqeWElJRLeZQvyVgxgMZ5yQY
 0seqzIiq1DdkHw1PcIw/VRoNvqd55jUEj5cx7R69uA7hW1d5mfn2jSgHrEeVKUYMR5
 Ph78g5jCY8bLrZ6eG+VU0rroyik9dtK6p4d7VtarlhFAvYDZDT0nqrhCfMz97Iclf5
 qmkDGKGI2fgZA==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: robh@kernel.org, steven.price@arm.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 0/2] Add fdinfo support to Panfrost
Date: Tue,  8 Aug 2023 23:22:37 +0100
Message-ID: <20230808222240.1016623-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.41.0
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
Cc: adrian.larumbe@collabora.com, kernel@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds basic fdinfo support to the Panfrost DRM driver.
It will display a series of key:value pairs under /proc/pid/fdinfo/fd
for render processes that open the Panfrost DRM file.

The pairs contain basic drm gpu engine and memory region information that
can either be cat by a privileged user or accessed with IGT's gputop
utility.

Adrián Larumbe (2):
  drm/panfrost: Add fdinfo support to Panfrost
  drm/panfrost: Add drm memory stats display through fdinfo

 drivers/gpu/drm/panfrost/panfrost_device.c | 12 +++++++
 drivers/gpu/drm/panfrost/panfrost_device.h | 10 ++++++
 drivers/gpu/drm/panfrost/panfrost_drv.c    | 40 ++++++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_gem.c    | 16 +++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h    |  1 +
 drivers/gpu/drm/panfrost/panfrost_job.c    |  6 ++++
 drivers/gpu/drm/panfrost/panfrost_job.h    |  3 ++
 7 files changed, 85 insertions(+), 3 deletions(-)

-- 
2.41.0


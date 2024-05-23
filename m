Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A280D8CD143
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 13:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E355710E231;
	Thu, 23 May 2024 11:32:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="taQOIum8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D3410E1AA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 11:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716463967;
 bh=P8iZRYjzf5V/CwUg/tRStLzmlTzFHauJjmXv3MkDoCs=;
 h=From:To:Cc:Subject:Date:From;
 b=taQOIum8Twjkoi5IyV7Vq6dIRtnTd0nMeQutsIHIpCrhgEovTWViWuRgANmci3jCB
 PEwcy/7mdF08aneb6cv2asq1wSUWj1sPFbpVzyBv2dz1II6dk+BOkoTQoKHE5E9qlN
 CVVY0K/22QLDrWIDOgd7cusZ82eq3ibKrWtkErq1XH6+EhfieMIZpy8KL1qCErajy2
 R+gGSM160e6U3pqG+rqWTc7uxM5+kz4iBozc9Qp0KAZjj0uHihJdOSmO80farKXArM
 nlQc1cjSdZfaXS4ZCqWFz19SkM7WWuc4Ek1RKJZ5PZExYe/A3+NwWt3bu9xvcqjR0n
 wG2ToueKf7JpA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1925537821B8;
 Thu, 23 May 2024 11:32:47 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Zack Rusin <zack.rusin@broadcom.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v4 0/3] drm: Fix dma_resv deadlock at drm object pin time
Date: Thu, 23 May 2024 12:32:16 +0100
Message-ID: <20240523113236.432585-1-adrian.larumbe@collabora.com>
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

This is v4 of https://lore.kernel.org/lkml/20240521181817.097af5e1@collabora.com/T/

The goal of this patch series is fixing a deadlock upon locking the dma reservation
of a DRM gem object when pinning it, at a prime import operation.

Changelog:
v3:
 - Split driver fixes into separate commits for Panfrost and Lima
 - Make drivers call drm_gem_shmem_pin_locked instead of drm_gem_shmem_object_pin
 - Improved commit message for first patch to explain why dma resv locking in the 
 pin callback is no longer necessary.
v2:
 - Removed comment explaining reason why an already-locked
pin function replaced the locked variant inside Panfrost's
object pin callback.
 - Moved already-assigned attachment warning into generic
already-locked gem object pin function


Adrián Larumbe (3):
  drm/panfrost: Fix dma_resv deadlock at drm object pin time
  drm/lima: Fix dma_resv deadlock at drm object pin time
  drm/gem-shmem: Add import attachment warning to locked pin function

 drivers/gpu/drm/drm_gem_shmem_helper.c  | 2 ++
 drivers/gpu/drm/lima/lima_gem.c         | 2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)


base-commit: 7acacca1b157fcb258cfd781603425f73bc7370b
-- 
2.45.1


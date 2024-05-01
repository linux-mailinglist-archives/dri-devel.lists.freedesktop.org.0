Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A398B85C5
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2024 08:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5993E1121D7;
	Wed,  1 May 2024 06:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="yuTqdv0+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459361121D7;
 Wed,  1 May 2024 06:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714546617;
 bh=+gpJXoDEqYzBuZulQbczBn4Pg+8UdQjqkKQDhtgftuY=;
 h=From:To:Cc:Subject:Date:From;
 b=yuTqdv0+509GARpdGOcAmrDFIxTdHACNuq70OZV/uZkrBBYLeXnkdHQppBi+f1K0w
 XhJvjKC4KJhIUNFstpRB1834LTcx959ulNuv/8zpD3sObav68v7HSdZkBmjxd8IrjM
 nfcPLv0yYiZ0ols0ubim7uB8TGHHVgiI3WE3mgo4yf3fHxVt8nRznYThiPm5yoG4HC
 dtO83IN9gN+qkr8cVynrVFxUpn4clCfMkbP6Pe1ap7foEK93Uw64rV/LIrE1qPO+YN
 nRSNJ2xO/fsIrFzjtP3oc2PicaCDckOy3HyqIGRYot5U0iNqVKczLMLrs1tPHQTnsm
 Twy98Bk3lgeKg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: alarumbe)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 43E7E3782087;
 Wed,  1 May 2024 06:56:56 +0000 (UTC)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Qiang Yu <yuq825@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig= <christian.koenig@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Zack Rusin <zack.rusin@broadcom.com>
Cc: kernel@collabora.com, Adrian Larumbe <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH v3 0/2] drm: Fix dma_resv deadlock at drm object pin time
Date: Wed,  1 May 2024 07:55:58 +0100
Message-ID: <20240501065650.2809530-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.44.0
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

This is v3 of https://lore.kernel.org/dri-devel/20240424090429.57de7d1c@collabora.com/

The goal of this patch series is fixing a deadlock upon locking the dma reservation
of a DRM gem object when pinning it, at a prime import operation.

Changes from v2:
 - Removed comment explaining reason why an already-locked
pin function replaced the locked variant inside Panfrost's
object pin callback.
 - Moved already-assigned attachment warning into generic
already-locked gem object pin function

Adrián Larumbe (2):
  drm/panfrost: Fix dma_resv deadlock at drm object pin time
  drm/gem-shmem: Add import attachment warning to locked pin function

 drivers/gpu/drm/drm_gem_shmem_helper.c  | 2 ++
 drivers/gpu/drm/lima/lima_gem.c         | 2 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)


base-commit: 75b68f22e39aafb22f3d8e3071e1aba73560788c
-- 
2.44.0


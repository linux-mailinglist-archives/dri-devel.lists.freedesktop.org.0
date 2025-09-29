Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4ECBAA2AB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 19:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A5B10E46F;
	Mon, 29 Sep 2025 17:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="s+v406U+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C8510E216
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 04:38:09 +0000 (UTC)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20250929042918epoutp02819d50caca78b402ebb4833c63fd3dc1~ppnbDBqu42973729737epoutp02g
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20250929042918epoutp02819d50caca78b402ebb4833c63fd3dc1~ppnbDBqu42973729737epoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1759120158;
 bh=D5wRPUu5G4Y4BWyRfH1H7IBbVKWaqq7gWN8q6OvyK9M=;
 h=From:To:Cc:Subject:Date:References:From;
 b=s+v406U+PLcaD+EY0XDxC+20eJv3QWSeozFIVY7UsAN4tfULGnTc8F7vQSD3zdzyO
 rhzpEmMEGY6CAL4L3PLWXI/qKFUKe3zAZMSrtlp/1C6Zd+ZZoMYrbxOFkv98iJV29r
 f8slEvX3yQwMPcvUiHi6ykaMs8z9bAvV5r6Izqaw=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
 20250929042918epcas2p273bdddf86958b34ea115371bc3f2d25b~ppnar_-kI1350313503epcas2p2L;
 Mon, 29 Sep 2025 04:29:18 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.202]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4cZp9n5Csbz6B9mH; Mon, 29 Sep
 2025 04:29:17 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20250929042917epcas2p26f004fefc4b491c5190f0854a7fe1f86~ppnZ0b28b1831418314epcas2p2N;
 Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
Received: from tayo (unknown [10.229.9.198]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20250929042917epsmtip15533e0f7be7361ed94f2258f0311f7a2~ppnZvhldn2403224032epsmtip1h;
 Mon, 29 Sep 2025 04:29:17 +0000 (GMT)
From: Hoyoung Lee <hy_fifty.lee@samsung.com>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Hoyoung Lee <hy_fifty.lee@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/exynos: KMS cleanups for off-screen planes and
 mode_config
Date: Mon, 29 Sep 2025 13:31:07 +0900
Message-ID: <20250929043110.3631025-1-hy_fifty.lee@samsung.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250929042917epcas2p26f004fefc4b491c5190f0854a7fe1f86
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250929042917epcas2p26f004fefc4b491c5190f0854a7fe1f86
References: <CGME20250929042917epcas2p26f004fefc4b491c5190f0854a7fe1f86@epcas2p2.samsung.com>
X-Mailman-Approved-At: Mon, 29 Sep 2025 17:28:00 +0000
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

Hi all,

This small series makes Exynos KMS a bit more robust and better aligned
with common DRM layering:

- Patch 1 treats fully off-screen planes as not visible and routes them
through the explicit disable path instead of programming zero-sized
dimensions in ->atomic_update(). This ensures the proper disable
semantics run when a plane contributes nothing to the frame, and avoids
keeping a logically enabled window around.

- Patch 2 converts mode-config initialization to
drmm_mode_config_init(), tying the lifetime to drm_device and dropping
the now-unnecessary manual drm_mode_config_cleanup() in error/unbind
paths.

- Patch 3 moves the device-wide mode_config setup (funcs/helpers and
limits) from exynos_drm_fb.c to exynos_drm_drv.c and calls
drm_mode_config_init() from inside exynos_drm_mode_config_init().
Historically Exynos put this in fb.c when the driver grew around fbdev
helpers; today it obscures ownership and ordering. Placing it in drv.c
matches other vendors, makes the init order explicit (before creating
CRTC/planes/connectors and binding components), and centralizes device-
level policy in the core driver.

No userspace ABI changes. Comments and reviews are very welcome.

Thanks,
Hoyoung Lee.

Hoyoung Lee (3):
  drm/exynos: plane: Disable fully off-screen planes instead of
    zero-sized update
  drm/exynos: Convert to drmm_mode_config_init() and drop manual cleanup
  drm/exynos: Move mode_config setup from fb.c to drv.c

 drivers/gpu/drm/exynos/exynos_drm_drv.c   | 49 +++++++++++++++++++----
 drivers/gpu/drm/exynos/exynos_drm_fb.c    | 34 +---------------
 drivers/gpu/drm/exynos/exynos_drm_fb.h    |  7 +++-
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 12 +++++-
 4 files changed, 60 insertions(+), 42 deletions(-)

--
2.34.1


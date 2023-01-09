Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A21A6624CE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 12:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A2710E3EE;
	Mon,  9 Jan 2023 11:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E44B10E3EE;
 Mon,  9 Jan 2023 11:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NdG2SoBQNefmtCjBfqFc7RiKIKDklbD/hLdBiL+vaNg=; b=H+oOZISn35maD65qd/e1DFSUSA
 Y1xCH93Jp2UYe09efyPYdQdb6AF9rz6dxe9uBXF4q8XYK4znsiO3UzX6Ms+f/ghqeNv1y9/+IApe3
 bczyAUjKR0U+yAJsZQ5QJNua7PGkfCHawJbXaLq6UgWXCrZE3bLoXRw9aRQOn1xIpKLMLis1Z6bsX
 mRj5cEVD+6uJZKSTnrZFBGITkuKji85B69mX3V2QTdShKZbscQ+C3Y3RisDMSxEZvMFhaEFdsdxkv
 5385zLYDxKWDruUq1f4JYOwH0oqRiLeKUsxQ2W5ZbTOGJ2x2+oa5gVnqT1rMCSKmtw5kw8mVXxfSA
 DZiF/Amw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEqlP-003LkJ-68; Mon, 09 Jan 2023 12:56:27 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Emma Anholt <emma@anholt.net>, Alexey Brodkin <abrodkin@synopsys.com>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Tomi Valkeinen <tomba@kernel.org>
Subject: [PATCH v2 0/7] Convert drivers to the new debugfs device-centered
 functions
Date: Mon,  9 Jan 2023 08:55:14 -0300
Message-Id: <20230109115520.40088-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit 1c9cacbea880 ("drm/debugfs: create device-centered debugfs functions")
introduced new device-centered debugfs functions, which center the debugfs files
management on the drm_device instead of drm_minor. Therefore, this patchset
converts 6 drivers to this new debugfs device-centered structure as it was already
performed on the vc4 (f2ede40e46e8), v3d (c0dda238e264), and vkms (03d2673bb757)
drivers.

Best Regards,
- Maíra Canal

---
v1 -> v2: https://lore.kernel.org/dri-devel/20221226155029.244355-1-mcanal@igalia.com/T/

- Drop some of the #ifdef guards and mark the potentially unused functions
  as __maybe_unused (Daniel Vetter).
- Fix pl111 compilation error when CONFIG_DEBUG_FS=n (kernel test robot).

Maíra Canal (7):
  drm/etnaviv: use new debugfs device-centered functions
  drm/pl111: use new debugfs device-centered functions
  drm/arc: use new debugfs device-centered functions
  drm/virtio: use new debugfs device-centered functions
  drm/omap: use new debugfs device-centered functions
  drm/qxl: remove unused debugfs structure
  drm/qxl: use new debugfs device-centered functions

 drivers/gpu/drm/etnaviv/etnaviv_drv.c    | 29 ++++++-------
 drivers/gpu/drm/omapdrm/omap_debugfs.c   | 29 +++++--------
 drivers/gpu/drm/omapdrm/omap_drv.c       |  7 +--
 drivers/gpu/drm/omapdrm/omap_drv.h       |  2 +-
 drivers/gpu/drm/pl111/Makefile           |  4 +-
 drivers/gpu/drm/pl111/pl111_debugfs.c    | 17 +++-----
 drivers/gpu/drm/pl111/pl111_drm.h        |  2 +-
 drivers/gpu/drm/pl111/pl111_drv.c        |  6 +--
 drivers/gpu/drm/qxl/qxl_debugfs.c        | 55 +++++-------------------
 drivers/gpu/drm/qxl/qxl_drv.c            |  5 +--
 drivers/gpu/drm/qxl/qxl_drv.h            | 22 +---------
 drivers/gpu/drm/tiny/arcpgu.c            | 24 +++--------
 drivers/gpu/drm/virtio/virtgpu_debugfs.c | 17 +++-----
 drivers/gpu/drm/virtio/virtgpu_drv.c     |  5 +--
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  2 +-
 15 files changed, 65 insertions(+), 161 deletions(-)

-- 
2.39.0


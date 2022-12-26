Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E9C6563E4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 16:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344EF10E18C;
	Mon, 26 Dec 2022 15:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A4B10E036;
 Mon, 26 Dec 2022 15:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rma/6l23MS9C4FR5JDIPAjsfEzUFpsYwj7pYGeckqyo=; b=N5x3iBtzXoyvQoAR35OI3Lak1V
 g1KpUISJgC/cu2CU0L4i4Bplx4TDUC4iUN6Nox34Ql+sdCnZTVENxHDR0/r/kx73mrD190tdSCeRD
 jsF7/CA4saUhR1oaHHYntVBKLDSpp6SDMY/9c5HttH+DhKaSSegI2FeemZHGRbmQssreMfzuLiDxV
 TTB2BIkkts0BOupsJuTeMWXyFIeNf+04E59YlDZNEro9fooelnmwBfIxiCVT5HK2+L2zKKRyH85X1
 DOssx2aN4IyDazepUffDc23GhGVsFPSR0qtDHjFsnNksmRJS7Kb+IdHLsT8NYL9wNt4O3hhKCnlus
 0CBOJ3Sg==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1p9plB-00AXBr-0X; Mon, 26 Dec 2022 16:51:29 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] Convert drivers to the new debugfs device-centered
 functions
Date: Mon, 26 Dec 2022 12:50:20 -0300
Message-Id: <20221226155029.244355-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.38.1
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Tomi Valkeinen <tomba@kernel.org>, Emma Anholt <emma@anholt.net>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Liviu Dudau <liviu.dudau@arm.com>, etnaviv@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, Melissa Wen <mwen@igalia.com>,
 noralf@tronnes.org, Gerd Hoffmann <kraxel@redhat.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 David Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The commit 1c9cacbea880 ("drm/debugfs: create device-centered debugfs functions")
introduced new device-centered debugfs functions, which center the debugfs files
management on the drm_device instead of drm_minor. Therefore, this patchset
converts 8 drivers to this new debugfs device-centered structure as it was already
performed on the vc4 (f2ede40e46e8), v3d (c0dda238e264), and vkms (03d2673bb757)
drivers.

Best Regards,
- Maíra Canal

Maíra Canal (9):
  drm/etnaviv: use new debugfs device-centered functions
  drm/gud: use new debugfs device-centered functions
  drm/arm/hdlcd: use new debugfs device-centered functions
  drm/pl111: use new debugfs device-centered functions
  drm/arc: use new debugfs device-centered functions
  drm/virtio: use new debugfs device-centered functions
  drm/omap: use new debugfs device-centered functions
  drm/qxl: remove unused debugfs structure
  drm/qxl: use new debugfs device-centered functions

 drivers/gpu/drm/arm/hdlcd_drv.c          | 24 +++++-------
 drivers/gpu/drm/etnaviv/etnaviv_drv.c    | 29 ++++++---------
 drivers/gpu/drm/gud/gud_drv.c            | 17 ++-------
 drivers/gpu/drm/omapdrm/omap_debugfs.c   | 29 +++++----------
 drivers/gpu/drm/omapdrm/omap_drv.c       |  7 ++--
 drivers/gpu/drm/omapdrm/omap_drv.h       |  2 +-
 drivers/gpu/drm/pl111/pl111_debugfs.c    | 15 ++------
 drivers/gpu/drm/pl111/pl111_drm.h        |  2 +-
 drivers/gpu/drm/pl111/pl111_drv.c        |  6 +--
 drivers/gpu/drm/qxl/qxl_debugfs.c        | 47 ++++--------------------
 drivers/gpu/drm/qxl/qxl_drv.c            |  5 +--
 drivers/gpu/drm/qxl/qxl_drv.h            | 22 +----------
 drivers/gpu/drm/tiny/arcpgu.c            | 22 +++--------
 drivers/gpu/drm/virtio/virtgpu_debugfs.c | 17 ++++-----
 drivers/gpu/drm/virtio/virtgpu_drv.c     |  5 +--
 drivers/gpu/drm/virtio/virtgpu_drv.h     |  2 +-
 16 files changed, 74 insertions(+), 177 deletions(-)

-- 
2.38.1


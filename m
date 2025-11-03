Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC02C2D863
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 18:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020F910E4B6;
	Mon,  3 Nov 2025 17:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="J5b7bEqf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096BE10E4B3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 17:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1762191960;
 bh=iCFLoO01rKyz3zjReJvF8wKHNMO4EC20vnW4OBrUXBk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J5b7bEqfzrOe4wKlz6m1acNl2GPQtH0zjvqt66zyG3B/1rEdzdJZvcKp0iLde1Usj
 19LRTDuFI/jVR2ctcRsYcmxrHrSoqIdGmEtrvJdoCPjeT0mVjbUo8UKkudN6fAxPOh
 DwQuRjYDHbpFttQi1AezJ7C2FMdRqbkfZ2zUWbu0jiEriKvu17G6TRi0L8XFDiWXYT
 We2ma/qRLY3C0IYAVDp/9oEahjJ0K5PfX41yIAmxeMFj9U160KzSWYJkb1D4B5s9ci
 90dTITgue1DxaQmniRNKht+vhltSkzAvLv+8G2xB/APCqyH1+NnuGU748X44y2rktn
 0RHXgTdJcEhTg==
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:e41c:5800:b6c0:b468:93e5:9b17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 41AFB17E1402;
 Mon,  3 Nov 2025 18:46:00 +0100 (CET)
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: dmitry.baryshkov@oss.qualcomm.com, tzimmermann@suse.de,
 simona.vetter@ffwll.ch, jani.nikula@linux.intel.com,
 ian.forbes@broadcom.com, louis.chauvet@bootlin.com,
 daniel.stone@collabora.com
Subject: [PATCH v4 3/3] drm/vkms: Add polling for HPD
Date: Mon,  3 Nov 2025 19:45:57 +0200
Message-ID: <20251103174558.7709-4-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251103174558.7709-1-marius.vlad@collabora.com>
References: <20251103174558.7709-1-marius.vlad@collabora.com>
MIME-Version: 1.0
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

vkms is missing any kind of HPD (polling/irq), so add polling to handle
hotplug events.

Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index e8472d9b6e3b..ec815c42ef04 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -198,6 +198,9 @@ static int vkms_create(struct vkms_config *config)
 	if (ret)
 		goto out_devres;
 
+	/* init kms poll for handling hpd */
+	drm_kms_helper_poll_init(&vkms_device->drm);
+
 	drm_client_setup(&vkms_device->drm, NULL);
 
 	return 0;
@@ -240,6 +243,7 @@ static void vkms_destroy(struct vkms_config *config)
 
 	fdev = config->dev->faux_dev;
 
+	drm_kms_helper_poll_fini(&config->dev->drm);
 	drm_dev_unregister(&config->dev->drm);
 	drm_atomic_helper_shutdown(&config->dev->drm);
 	devres_release_group(&fdev->dev, NULL);
-- 
2.47.2


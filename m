Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B121EAFC62E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 10:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F313F10E160;
	Tue,  8 Jul 2025 08:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r7YsaUmV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E698110E160
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 08:52:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 972CD4646A;
 Tue,  8 Jul 2025 08:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE8BC4CEED;
 Tue,  8 Jul 2025 08:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751964740;
 bh=QIqY2h1NWf9cbTcj6mUj2T3JGhmfNBfrg9dpy8GlrF0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r7YsaUmVCdo9PWttJRs+Qb0hOI4FD3haWcT16lpz/lEu4mHt+B1iUFFv0rQ7A/jTb
 6t9yMwH+UdZXYs6yY+wjFuvvdX+Q1bmFaVsYZ0RMg22vxcwwYYS62oNFd2Ml3+Bcei
 ZLTh2kP8/aBDlMeMpgD6H0V7TZZOPjo6eZrHJLtNz8NUSPN2lZSNhhSzj2saAG3HKq
 VP6+WrxU9ULoYEzdSKH6UHTL6VKcUUsJZR2ZBKgtIo3JPwqtzc6HnBcXIGW5BDeYDt
 T2rFCoK0udDUw0NmdEZw3TXT5fBfHTiLeCyALTQsPPIWWAHxKZs4r1M/XQognu64Dt
 cubAg4HkHvsDQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
 (envelope-from <johan@kernel.org>) id 1uZ43g-0000000042H-1tXm;
 Tue, 08 Jul 2025 10:52:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
Subject: [PATCH 1/2] drm/bridge: fix OF node leak
Date: Tue,  8 Jul 2025 10:51:23 +0200
Message-ID: <20250708085124.15445-2-johan@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708085124.15445-1-johan@kernel.org>
References: <20250708085124.15445-1-johan@kernel.org>
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

Make sure to drop the OF node reference taken when creating the aux
bridge device when the device is later released.

Fixes: 6914968a0b52 ("drm/bridge: properly refcount DT nodes in aux bridge drivers")
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/gpu/drm/bridge/aux-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
index c179b86d208f..6642ac6819a0 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -17,6 +17,7 @@ static void drm_aux_bridge_release(struct device *dev)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
 
+	of_node_put(dev->of_node);
 	ida_free(&drm_aux_bridge_ida, adev->id);
 
 	kfree(adev);
@@ -64,6 +65,7 @@ int drm_aux_bridge_register(struct device *parent)
 
 	ret = auxiliary_device_init(adev);
 	if (ret) {
+		of_node_put(adev->dev.of_node);
 		ida_free(&drm_aux_bridge_ida, adev->id);
 		kfree(adev);
 		return ret;
-- 
2.49.0


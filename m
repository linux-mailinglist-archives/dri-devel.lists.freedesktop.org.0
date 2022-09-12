Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 339865B5D36
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 17:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CA110E5A6;
	Mon, 12 Sep 2022 15:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 749DA10E5A6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 15:32:51 +0000 (UTC)
Received: from
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
 (linux.microsoft.com [13.77.154.182])
 by linux.microsoft.com (Postfix) with ESMTPSA id C0B6B204778A;
 Mon, 12 Sep 2022 08:32:50 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C0B6B204778A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1662996770;
 bh=24KADFj4btF3I+/3El4CjQCGgseN2zkrF5osGbvl+xE=;
 h=From:To:Subject:Date:From;
 b=j9D/dSfidQMifQCZLsMtHDo19KCgzJdaiREUzzmOzl66gK2quNutiCpl+4gkezUJQ
 eB2xYy9dfWKa4n6cS1WeSdC/soiOpA6Etdp8weEkfulOQy58CICPM3FleUgoxoszB9
 EPHjJlzAXk1jAz9DCBj4dJxqThntGvyQV3DAjKO8=
From: Saurabh Sengar <ssengar@linux.microsoft.com>
To: ssengar@microsoft.com, drawat.floss@gmail.com, airlied@linux.ie,
 daniel@ffwll.ch, linux-hyperv@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mikelley@microsoft.com
Subject: [PATCH] drm/hyperv: Don't overwrite dirt_needed value set by host
Date: Mon, 12 Sep 2022 08:32:46 -0700
Message-Id: <1662996766-19304-1-git-send-email-ssengar@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
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

Existing code is causing a race condition where dirt_needed value is
already set by the host and gets overwritten with default value. Remove
this default setting of dirt_needed, to avoid overwriting the value
received in the channel callback set by vmbus_open. Removing this
setting also means the default value for dirt_needed is changed to false
as it's allocated by kzalloc which is similar to legacy hyperv_fb driver.

Signed-off-by: Saurabh Sengar <ssengar@linux.microsoft.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 4a8941fa0815..57d49a08b37f 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -198,8 +198,6 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
 	if (ret)
 		drm_warn(dev, "Failed to update vram location.\n");
 
-	hv->dirt_needed = true;
-
 	ret = hyperv_mode_config_init(hv);
 	if (ret)
 		goto err_vmbus_close;
-- 
2.31.1


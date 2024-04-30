Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8D58B749C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2024 13:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07AE710E16B;
	Tue, 30 Apr 2024 11:37:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="gucP6Rz6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7CE10E147
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2024 11:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714477050;
 bh=htbLC5ubtC6OFuOJXNKPV0DwQ9NNX0z74BQ5IkxpDJY=;
 h=From:To:Cc:Subject:Date:From;
 b=gucP6Rz6wfNchLtp/1iei+as1E9mcADXOxTUzwbbg3FumALZ4D0U9Opgyp2Kk12Zn
 D65wqlISs0Vfi3SGkPcSMQxvkg82PbjoJYFOf7u7O0lMExH4m7CLLZBCagfyEixKoe
 PxJU70hl+l8QsFtrPvyZFGY97G0l9GuCjubZwjWf33SAk5JmiAxWWvC1VGmBogrkPH
 tB+4ZxM0tXUMLuFMc7bsf9hUF55TjyppYGfvNNh7T2viN5SrZ4mgcoA6iXX/KUkcKX
 cJwcpVBObU/aewslWTsbXaY5at082R+v+OB8mgxpZuas/rStz2CGOA/StDvyPDrIGA
 xRdfqNWY9EoCQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id A25AC37813C4;
 Tue, 30 Apr 2024 11:37:29 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH] drm/panthor: Fix the FW reset logic
Date: Tue, 30 Apr 2024 13:37:27 +0200
Message-ID: <20240430113727.493155-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.44.0
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

In the post_reset function, if the fast reset didn't succeed, we
are not clearing the fast_reset flag, which prevents firmware
sections from being reloaded. While at it, use panthor_fw_stop()
instead of manually writing DISABLE to the MCU_CONTROL register.

Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 181395e2859a..fedf9627453f 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1083,10 +1083,11 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
 		if (!ret)
 			goto out;
 
-		/* Force a disable, so we get a fresh boot on the next
-		 * panthor_fw_start() call.
+		/* Forcibly reset the MCU and force a slow reset, so we get a
+		 * fresh boot on the next panthor_fw_start() call.
 		 */
-		gpu_write(ptdev, MCU_CONTROL, MCU_CONTROL_DISABLE);
+		panthor_fw_stop(ptdev);
+		ptdev->fw->fast_reset = false;
 		drm_err(&ptdev->base, "FW fast reset failed, trying a slow reset");
 	}
 
-- 
2.44.0


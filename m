Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DDB9C6DD0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 12:26:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427FD10E070;
	Wed, 13 Nov 2024 11:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="U96RG3A+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F1C10E070
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 11:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731497202;
 bh=9Eug4ny21FB+VTsG3HD8fvfihKPa9daeEy58mMwRL3w=;
 h=From:To:Cc:Subject:Date:From;
 b=U96RG3A+oyT3B1VxBjv5+QdzHqWTw1NK3NWneMnaZN2BzzN+oNkvmcvkgqDvLC4vH
 xsD+hNeJLaL5ksbgYzr3F2qAfcExIDvD4lW2EIoSPqLZxDCnsNt20YYxpBaAInSUYR
 g5fwlPD5v8t9SerEM2GA0I4xlvnQNKus1pZwE9vG5nH9qu9oZfdsqUu8siA066N9ya
 jIYdr9F29j3DhrbUCHooiGfYR1otynOEFhPi5i7WYEx8jH8S9AaJrJCMk9HXdbbKv+
 I/dp5UulhM5oLFs7JP8J/GpUZVf4yfq0iCIXsN752xOVNMqwmgTLk1z2lEsy3GZ2G5
 ZAStRnsI4ZNyA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 93CAE17E3609;
 Wed, 13 Nov 2024 12:26:41 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Cc: robh@kernel.org, steven.price@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] drm/panfrost: Add GPU ID for MT8188 Mali-G57 MC3
Date: Wed, 13 Nov 2024 12:26:22 +0100
Message-ID: <20241113112622.123044-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
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

The MediaTek MT8188 SoC has a Mali-G57 MC3 GPU and, similarly to
MT8192, it has yet another special GPU ID.

Add the GPU ID to the list and treat it as a standard Mali-G57.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index f5abde3866fb..174e190ba40f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -236,6 +236,10 @@ static const struct panfrost_model gpu_models[] = {
 	 */
 	GPU_MODEL(g57, 0x9003,
 		GPU_REV(g57, 0, 0)),
+
+	/* MediaTek MT8188 Mali-G57 MC3 */
+	GPU_MODEL(g57, 0x9093,
+		GPU_REV(g57, 0, 0)),
 };
 
 static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
-- 
2.47.0


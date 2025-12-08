Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BB4CACCD5
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 11:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92A010E418;
	Mon,  8 Dec 2025 10:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="hz/iJOZX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D49710E40E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 10:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1765188532;
 bh=OoR9L2IH60zmLHyFwhaidivDiTD0lZox93OL3ITDOlA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hz/iJOZX7Zkf56oM+D2y8AigpF7yyGWc+oACC0/8fOiWPGOYf6KVSGkHkf57bEaHx
 OlfwcpycL7moGqYhr/HnJvTlu3b4wt1XHpo0TY7LfXqoVropnML0HbRJckOcVmH63d
 HTyJvLgQF7xfZCgSaZ2Gaq9pPeJrmAhu8O3TVAJo4qLe6AmLYLgVUm2GUdLWXAF8d6
 rr4xVZyUDaUHu+WjDk5cM4syCLmfcfYCDyaPgUb3ojr2g0vSY6oF8Uo1VSr6mXJVoT
 fOrckERk9PSjP9fL2OrY7cn6i3pdSuFYHf/1uRpqUUkCJ3+QejBBj2MeATkSZvVccm
 QbkdggTIEtWFw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 71FCC17E1572;
 Mon,  8 Dec 2025 11:08:52 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH v8 02/13] drm/panthor: Fix panthor_gpu_coherency_set()
Date: Mon,  8 Dec 2025 11:08:29 +0100
Message-ID: <20251208100841.730527-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251208100841.730527-1-boris.brezillon@collabora.com>
References: <20251208100841.730527-1-boris.brezillon@collabora.com>
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

GPU_COHERENCY_PROTOCOL takes one of GPU_COHERENCY_xx
not BIT(GPU_COHERENCY_xx).

v3:
- New commit

v4:
- Add Steve's R-b

v5:
- No changes

v6:
- No changes

v7:
- No changes

v8:
- No changes

Cc: Akash Goel <akash.goel@arm.com>
Fixes: dd7db8d911a1 ("drm/panthor: Explicitly set the coherency mode")
Reported-by: Steven Price <steven.price@arm.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 9cb5dee93212..ff5231269518 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -51,7 +51,7 @@ struct panthor_gpu {
 static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 {
 	gpu_write(ptdev, GPU_COHERENCY_PROTOCOL,
-		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
+		  ptdev->coherent ? GPU_COHERENCY_ACE_LITE : GPU_COHERENCY_NONE);
 }
 
 static void panthor_gpu_l2_config_set(struct panthor_device *ptdev)
-- 
2.51.1


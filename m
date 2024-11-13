Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA529C7788
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2024 16:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 286C610E72A;
	Wed, 13 Nov 2024 15:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fTYwylvU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73B210E14A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2024 15:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1731512582;
 bh=n3sCBHRxn4Sd6GX+6E0HQCReVuQjiYGbZcxLE8+2uw8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fTYwylvUigjKdnTGYdD+nfiNIXezI/Il4z5AFxY5Osrvk8ExE1Hj0CQamrw8QnEwt
 V3i6yGqMPSqQueS4U+aoNTEf4U0JRQfVRVY4SgHUpZWKUfW1NR69M+SVW0vHK3Uk/D
 ubyiTdeYgKuD5E021uglWWKMfdyMej9zKtMRlFFAUFocRYjN2mY8WwVGEYm4UMa+yb
 dJUgKWhO6hYxyWvbH7eM4ReXnxRzwgR8KDjJYhY9wSVTwzinWkt8XF2ssvxtLNJiVO
 95nI7kP4+LeSYpAsyMx5uySKXMSPoPRUKtF9Nm3pByWEUkpJxuld8vBbujMDJfNUwR
 pgHP5GyDpdNtA==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5A1E417E36CD;
 Wed, 13 Nov 2024 16:43:02 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	kernel@collabora.com
Subject: [PATCH 1/5] drm/panthor: Preserve the result returned by
 panthor_fw_resume()
Date: Wed, 13 Nov 2024 16:42:53 +0100
Message-ID: <20241113154257.1971284-2-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241113154257.1971284-1-boris.brezillon@collabora.com>
References: <20241113154257.1971284-1-boris.brezillon@collabora.com>
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

WARN() will return true if the condition is true, false otherwise.
If we store the return of drm_WARN_ON() in ret, we lose the actual
error code.

Fixes: 5fe909cae118 ("drm/panthor: Add the device logical block")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 4082c8f2951d..db7ba40f771d 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -441,8 +441,8 @@ int panthor_device_resume(struct device *dev)
 	    drm_dev_enter(&ptdev->base, &cookie)) {
 		panthor_gpu_resume(ptdev);
 		panthor_mmu_resume(ptdev);
-		ret = drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
-		if (!ret) {
+		ret = panthor_fw_resume(ptdev);
+		if (!drm_WARN_ON(&ptdev->base, ret)) {
 			panthor_sched_resume(ptdev);
 		} else {
 			panthor_mmu_suspend(ptdev);
-- 
2.46.2


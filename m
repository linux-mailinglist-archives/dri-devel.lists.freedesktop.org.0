Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541198BA0A1
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 20:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C043010E875;
	Thu,  2 May 2024 18:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="48jhSxjD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5F810E469
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 18:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714675097;
 bh=DjRIkPw7KmW0hMerrbyhJ7T5a8eVe4o2K3/wZxbRVtM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=48jhSxjDqtAg7gZ5LPX3YuB9oWbSQr70CXyczD1kOJg6n26NKKqkNm0WT9N5h46z6
 uTTFQ+buWR2QitQS0dfMbUzf2//OQQECH4uYQf+rTPorexT1T5dgR6YE412V3T1SJW
 q/ejKFfp+UJg9nnQ9vxMbUNGf6+mOVPoj5BKniwgWy4QVeEZvFjvnJLOqgj6hBny9d
 ecWYss0mmx6yHcN8m5MaXbLXhcVQ4SJwA95ZSdffeNMS64Q+JV0g5UfOTzzS8EwEiQ
 gYbOHEM8DMhlykYMX3MY1gbjbcqvLSq2WvMNagqYGp2HrhxCQlo1gNv88/lQ3o/UXw
 uAGuO2DM9epmQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id AD5B0378214B;
 Thu,  2 May 2024 18:38:16 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: [PATCH 3/4] drm/panthor: Reset the FW VM to NULL on unplug
Date: Thu,  2 May 2024 20:38:11 +0200
Message-ID: <20240502183813.1612017-4-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240502183813.1612017-1-boris.brezillon@collabora.com>
References: <20240502183813.1612017-1-boris.brezillon@collabora.com>
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

This way get NULL derefs instead of use-after-free if the FW VM is
referenced after the device has been unplugged.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index b41685304a83..93165961a6b5 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1141,6 +1141,7 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 	 * state to keep the active_refcnt balanced.
 	 */
 	panthor_vm_put(ptdev->fw->vm);
+	ptdev->fw->vm = NULL;
 
 	panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
 }
-- 
2.44.0


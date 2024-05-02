Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6BF8BA0A0
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 20:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0F910E469;
	Thu,  2 May 2024 18:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qR0QXv3J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8C010E469
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 18:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714675095;
 bh=07oaTuHE3BVClNZd6QA9gATtgBKtfrWT13Xo3pNnSPU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qR0QXv3J0PLs9jbYbB+wZi4T6UQTb16ggeXU5NtReIybytp120G+D8ARbKg6CcL6o
 DFVnxz+XxLWeGB4MYdiJouUukLmWKKJxygaB1EwutgMug5wTxQjfo3+rRXOlNcakOa
 Rf/qkzMZ/AH6+0z1FNtKdUTYlNbR7P3UYqi7xB1YIe1zcNgXZKrWvyyxQEjeBzqM97
 Kwyok+xk57XGrAe0XIk0w7HYunm0ezbEpkx/uZxZIwmMr0q+5zyfnrVQZ3+lrkWjMO
 A+loRg8GFFGNmiq3nYgdr6GEJiwRmeHOw11T02FuX5E6bar4grOBK/uOqVRvHmrb+q
 1MeaPyajO1NSg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5D71C3782121;
 Thu,  2 May 2024 18:38:15 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: [PATCH 1/4] drm/panthor: Force an immediate reset on unrecoverable
 faults
Date: Thu,  2 May 2024 20:38:09 +0200
Message-ID: <20240502183813.1612017-2-boris.brezillon@collabora.com>
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

If the FW reports an unrecoverable fault, we need to reset the GPU
before we can start re-using it again.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |  1 +
 drivers/gpu/drm/panthor/panthor_device.h |  1 +
 drivers/gpu/drm/panthor/panthor_sched.c  | 11 ++++++++++-
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 75276cbeba20..4c5b54e7abb7 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -293,6 +293,7 @@ static const struct panthor_exception_info panthor_exception_infos[] = {
 	PANTHOR_EXCEPTION(ACTIVE),
 	PANTHOR_EXCEPTION(CS_RES_TERM),
 	PANTHOR_EXCEPTION(CS_CONFIG_FAULT),
+	PANTHOR_EXCEPTION(CS_UNRECOVERABLE),
 	PANTHOR_EXCEPTION(CS_ENDPOINT_FAULT),
 	PANTHOR_EXCEPTION(CS_BUS_FAULT),
 	PANTHOR_EXCEPTION(CS_INSTR_INVALID),
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 2fdd671b38fd..e388c0472ba7 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -216,6 +216,7 @@ enum drm_panthor_exception_type {
 	DRM_PANTHOR_EXCEPTION_CS_RES_TERM = 0x0f,
 	DRM_PANTHOR_EXCEPTION_MAX_NON_FAULT = 0x3f,
 	DRM_PANTHOR_EXCEPTION_CS_CONFIG_FAULT = 0x40,
+	DRM_PANTHOR_EXCEPTION_CS_UNRECOVERABLE = 0x41,
 	DRM_PANTHOR_EXCEPTION_CS_ENDPOINT_FAULT = 0x44,
 	DRM_PANTHOR_EXCEPTION_CS_BUS_FAULT = 0x48,
 	DRM_PANTHOR_EXCEPTION_CS_INSTR_INVALID = 0x49,
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 7f16a4a14e9a..1d2708c3ab0a 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1281,7 +1281,16 @@ cs_slot_process_fatal_event_locked(struct panthor_device *ptdev,
 	if (group)
 		group->fatal_queues |= BIT(cs_id);
 
-	sched_queue_delayed_work(sched, tick, 0);
+	if (CS_EXCEPTION_TYPE(fatal) == DRM_PANTHOR_EXCEPTION_CS_UNRECOVERABLE) {
+		/* If this exception is unrecoverable, queue a reset, and make
+		 * sure we stop scheduling groups until the reset has happened.
+		 */
+		panthor_device_schedule_reset(ptdev);
+		cancel_delayed_work(&sched->tick_work);
+	} else {
+		sched_queue_delayed_work(sched, tick, 0);
+	}
+
 	drm_warn(&ptdev->base,
 		 "CSG slot %d CS slot: %d\n"
 		 "CS_FATAL.EXCEPTION_TYPE: 0x%x (%s)\n"
-- 
2.44.0


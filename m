Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54F2C9183F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 10:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E1110E8A2;
	Fri, 28 Nov 2025 09:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="kBBpFd+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CD210E04A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Nov 2025 09:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764323331;
 bh=0+ELiCgH1VUkiSKc1ttJOD01pR45Gkc1MPKrEOrfj4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kBBpFd+P1a9aAgenQG7Bpg2e/yhEC+BwHENTbJOqhRtXZoFVdMn4VELNrs5wRTMet
 3q62TwPVf377NinTAflrgIAqp7DSdpKdj6xIRP6Cp8qd1XBXJcQMgi3ryAZwj0h9DZ
 Im8LPNK6bMb3dqROkxM6+KyMGHNlyhR1mCBWJADgqwzc8/E7Qt2Y1XSML4bCP8j9jv
 TmIkBUUUzOKMdIhEbhB0o0nl0EvDL09bKsf2WrKjx/V3wWN+7/z6t509N5vFGXEhvP
 QWvDOBBJfK8Ai1+DNCrczmUj+bN2Ve36VQ0Hlm84eRTOtM42NKU4LbXajupzlVhfk9
 0hC/bY2xNCg2g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2988C17E1339;
 Fri, 28 Nov 2025 10:48:51 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Florent Tomasin <florent.tomasin@arm.com>,
 Heinrich Fink <hfink@snap.com>, Chia-I Wu <olvaffe@gmail.com>,
 kernel@collabora.com
Subject: [PATCH v3 2/8] drm/panthor: Don't try to enable extract events
Date: Fri, 28 Nov 2025 10:48:33 +0100
Message-ID: <20251128094839.3856402-3-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251128094839.3856402-1-boris.brezillon@collabora.com>
References: <20251128094839.3856402-1-boris.brezillon@collabora.com>
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

Not only this only works once, because of how extract events work
(event is enabled if the req and ack bit differ, and it's signalled
by the FW by setting identical req and ack, to re-enable the event,
we need to toggle the bit, which we never do). But more importantly,
we never do anything with this event, so we're better off dropping it
when programming the CS slot.

v2:
- Add R-b

v3:
- Collect R-b

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 5b2ab963ac99..5ec553818c28 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1180,12 +1180,10 @@ cs_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 cs_id)
 	panthor_fw_update_reqs(cs_iface, req,
 			       CS_IDLE_SYNC_WAIT |
 			       CS_IDLE_EMPTY |
-			       CS_STATE_START |
-			       CS_EXTRACT_EVENT,
+			       CS_STATE_START,
 			       CS_IDLE_SYNC_WAIT |
 			       CS_IDLE_EMPTY |
-			       CS_STATE_MASK |
-			       CS_EXTRACT_EVENT);
+			       CS_STATE_MASK);
 	if (queue->iface.input->insert != queue->iface.input->extract)
 		queue_resume_timeout(queue);
 }
-- 
2.51.1


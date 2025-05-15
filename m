Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FBFAB83E8
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 12:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B0210E82A;
	Thu, 15 May 2025 10:33:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ashley.smith@collabora.com header.b="kj00T6U1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D677B10E82A
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 10:33:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747305204; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=eNaZ7RWGgKlEcIpnXfQASf7ZtEaVuagBnyKCwWMynDnDtXoIiiHPgtoG7fsVxByQGNVIih74aBxGXeKzcExCLCxm23nykdS/PjbC+eCeNlaIDyQzate45f0tDWB2tHsbwPuR/huY/G/l529z4j4OF46XvSmDzPtqzqrSWcRjTqI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747305204;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=IzhJq/KI+z8Y+0dsDs/7LMPucBSPLRXhlb7t+uypEPE=; 
 b=PvqiFdV+SisuTA+4b7ioQHkOq/LlIQPMzdwhSgGkR5F2A9s1V9CPRSjCVUcN3tpZFG5hFnMw3iHOvudLxxNTvMZE+3UAwk3y3Ee6JX758N6zLnZCTYmt2G5+19IAuH0qRNEhaj+1uLpckZST+C4GtDKk5fCkDMQsBgJcVnDaYGU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ashley.smith@collabora.com;
 dmarc=pass header.from=<ashley.smith@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747305204; 
 s=zohomail; d=collabora.com; i=ashley.smith@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=IzhJq/KI+z8Y+0dsDs/7LMPucBSPLRXhlb7t+uypEPE=;
 b=kj00T6U1H9gIyY2OZkB3vvNTxkKvzcLfF0gAvoZYQZ1cQgLevinPfwaQor8mYI5W
 sJLE3IaAR0+PQ4Kat7qCFFZe38YVwr4X9eaBZLiYuz0aVH/G/tOG/3/AUGTdmkwKatj
 WekdMzgtVxFv83nA/8wjLEltWgQoSYZaBI3crfOs=
Received: by mx.zohomail.com with SMTPS id 174730520201961.4224475817598;
 Thu, 15 May 2025 03:33:22 -0700 (PDT)
From: Ashley Smith <ashley.smith@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, Ashley Smith <ashley.smith@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: Reset queue slots if termination fails
Date: Thu, 15 May 2025 11:33:05 +0100
Message-ID: <20250515103314.1682471-1-ashley.smith@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

This fixes a bug where if we timeout after a suspend and the termination
fails, due to waiting on a fence that will never be signalled for
example, we do not resume the group correctly. The fix forces a reset
for groups that are not terminated correctly.

Signed-off-by: Ashley Smith <ashley.smith@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 43ee57728de5..1f4a5a103975 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -2727,8 +2727,17 @@ void panthor_sched_suspend(struct panthor_device *ptdev)
 			 * automatically terminate all active groups, so let's
 			 * force the state to halted here.
 			 */
-			if (csg_slot->group->state != PANTHOR_CS_GROUP_TERMINATED)
+			if (csg_slot->group->state != PANTHOR_CS_GROUP_TERMINATED) {
 				csg_slot->group->state = PANTHOR_CS_GROUP_TERMINATED;
+
+				/* Reset the queue slots manually if the termination
+				 * request failed.
+				 */
+				for (i = 0; i queue_count; i++) {
+					if (group->queues[i])
+						cs_slot_reset_locked(ptdev, csg_id, i);
+				}
+			}
 			slot_mask &= ~BIT(csg_id);
 		}
 	}

base-commit: 9934ab18051118385c7ea44d8e14175edbe6dc9c
-- 
2.43.0


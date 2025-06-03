Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5E8ACC396
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 11:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C06E10E5AC;
	Tue,  3 Jun 2025 09:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ashley.smith@collabora.com header.b="aVcSgi+Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA9910E5AC
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 09:51:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1748944249; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DcwlziAs74z1jHob7MPp84ml9uSmoJiBbwm/fY6sMaPsKheMTKn6Q40yOWicZcu0A6XNkGCCe/Ne0XR6BUsF7XRqQQ7sUiV/96S1iBQ7gDlbUypeRC9lHJ2zG2xHDGfl7VITofug+kv7whIhJPm97wBfOpKaz+llo/XgwnUA+RU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1748944249;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=fA75GZ8Du58l/Cfml68DsSM1nb55/pIKPein/E2W0nk=; 
 b=RQAJlJxwc9SCfrim3amOl2AivZgG2OsOklqdRkd+b6tA1KQNlg8qmR+Dbydi1F3549jkCYQx/eysK/z5EPCks/hxqGS/e/Nyxb0gp5IyvCslllaX522zY40f5oOI8PW0Y1rVM0wYFRg3Dh9O5eYzv5NPmLq7+EoLxf0GvJO/apY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ashley.smith@collabora.com;
 dmarc=pass header.from=<ashley.smith@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748944249; 
 s=zohomail; d=collabora.com; i=ashley.smith@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=fA75GZ8Du58l/Cfml68DsSM1nb55/pIKPein/E2W0nk=;
 b=aVcSgi+Q7eTeT+qrk7Gr28pXAJ1nQjVE9UFNak9CrHYq8xKkaz5pGW0mFSkMITKX
 MNJjU7UIWVtLP31pTsTiFl9Bvdv+7DDhJUDgWUgFWw589sGbcwtvJm9dzo++17ohZf5
 1dYVcq83rPsXrSmVm4m1lUwO9hCwTBryAAp5ymd8=
Received: by mx.zohomail.com with SMTPS id 1748944246587913.3359863134881;
 Tue, 3 Jun 2025 02:50:46 -0700 (PDT)
From: Ashley Smith <ashley.smith@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, Ashley Smith <ashley.smith@collabora.com>,
 dri-devel@lists.freedesktop.org (open list:ARM MALI PANTHOR DRM DRIVER),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 1/2] drm/panthor: Reset queue slots if termination fails
Date: Tue,  3 Jun 2025 10:49:31 +0100
Message-ID: <20250603094952.4188093-2-ashley.smith@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250603094952.4188093-1-ashley.smith@collabora.com>
References: <20250603094952.4188093-1-ashley.smith@collabora.com>
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
Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
---
 drivers/gpu/drm/panthor/panthor_sched.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 43ee57728de5..65d8ae3dcac1 100644
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
+				for (i = 0; i < group->queue_count; i++) {
+					if (group->queues[i])
+						cs_slot_reset_locked(ptdev, csg_id, i);
+				}
+			}
 			slot_mask &= ~BIT(csg_id);
 		}
 	}
-- 
2.43.0


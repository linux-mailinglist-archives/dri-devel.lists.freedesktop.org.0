Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E35B4A2DCD
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 11:50:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C0310E698;
	Sat, 29 Jan 2022 10:50:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from qq.com (smtpbg474.qq.com [59.36.132.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B903189266;
 Sat, 29 Jan 2022 07:43:50 +0000 (UTC)
X-QQ-mid: bizesmtp38t1643441745tmhbo8l6
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sat, 29 Jan 2022 15:35:32 +0800 (CST)
X-QQ-SSF: 0140000000200090G000B00A0000000
X-QQ-FEAT: bUbfunjy+D9R0CmpzyPUKsRG+w28FZ5+xzS5jLRxjTrEDp7XJQpIJvqOe7KG5
 gBHHcpg37gSpNF19qFhVDzA17mPuRoYbXtLqoxZjDZBTzf439IacU96VH3sJS7/FVTYHMDA
 DLtpExDtvtRUrnV/iZ25AbJwajRMUrCFEvENfLqskTvlxXHtWjnK9X62Klc9dYM8fcHIgcZ
 CLqDG++mVrjE2V/VgEJjaAeZ09qXHM1Y89P4pueINUi7kq/XUpJC+qaQQuYHhrYU/2WprQG
 m7GGnHh1tQra4adeJ8W9qWcJi4bUoMyhVaGoBlr9Z6P+GdZcqdD+1FlnifX/c3GEw9pIK4k
 QnOikdcLcr1f0BPfI/WDqPCvurGyspMVAOEI/Yv
X-QQ-GoodBg: 2
From: zhanglianjie <zhanglianjie@uniontech.com>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 2/2] drm/radeon/uvd: Fix forgotten unmap buffer objects
Date: Sat, 29 Jan 2022 15:35:24 +0800
Message-Id: <20220129073524.31534-2-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220129073524.31534-1-zhanglianjie@uniontech.com>
References: <20220129073524.31534-1-zhanglianjie@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
X-Mailman-Approved-At: Sat, 29 Jan 2022 10:50:33 +0000
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 zhanglianjie <zhanglianjie@uniontech.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

after the buffer object is successfully mapped, call radeon_bo_kunmap before the function returns.

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
index 377f9cdb5b53..c5482f7793db 100644
--- a/drivers/gpu/drm/radeon/radeon_uvd.c
+++ b/drivers/gpu/drm/radeon/radeon_uvd.c
@@ -497,6 +497,7 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
 	handle = msg[2];

 	if (handle == 0) {
+		radeon_bo_kunmap(bo);
 		DRM_ERROR("Invalid UVD handle!\n");
 		return -EINVAL;
 	}
@@ -559,11 +560,10 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
 		return 0;

 	default:
-
 		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
-		return -EINVAL;
 	}

+	radeon_bo_kunmap(bo);
 	BUG();
 	return -EINVAL;
 }
--
2.20.1




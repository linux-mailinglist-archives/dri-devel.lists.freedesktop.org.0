Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBA5386EC2
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 03:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7EA56E566;
	Tue, 18 May 2021 01:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986F06E566
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 01:09:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7758561354;
 Tue, 18 May 2021 01:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621300183;
 bh=Q7N5BFJD1w+E3XQGJHFoJg4hWxx3QjNXlxWafl5zlYU=;
 h=From:To:Cc:Subject:Date:From;
 b=YMfEP7m6CIKFLPmKNgY9J6OvgmibnUgQn9tZifjmKMGGrh5+VyDG0SSVGiRoPpC8g
 QcXrF6fkU3mqyPmPu+2eC+srUY9lAUmotDsXpQWlR03Zkl7cHx9EuXONG3xtjvjh4u
 xz0KoQ2QoSfAhwYWOHBk88To1qgJiB15ATnpHPH/MD6bhlbxY5iCsWg3v5sQTUvugF
 6e5WhGO3QE6HVjfH2awDp+ThDTiWga6HZSeE4bE8RcVcpZfWWH85q43TFLo+y/0qkz
 aeXxYORL20F73gIdo5skQpZ0+K0oeJKS06/f9/Rn2UOxAGdKHlrIVuMeFbpICwrVEt
 9ImMI7HktY79g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 1/5] drm/ttm: Do not add non-system domain BO
 into swap list
Date: Mon, 17 May 2021 21:09:36 -0400
Message-Id: <20210518010940.1485417-1-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Guchun Chen <guchun.chen@amd.com>,
 xinhui pan <xinhui.pan@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: xinhui pan <xinhui.pan@amd.com>

[ Upstream commit ad2c28bd9a4083816fa45a7e90c2486cde8a9873 ]

BO would be added into swap list if it is validated into system domain.
If BO is validated again into non-system domain, say, VRAM domain. It
actually should not be in the swap list.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
Acked-by: Guchun Chen <guchun.chen@amd.com>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210224032808.150465-1-xinhui.pan@amd.com
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 101a68dc615b..799ec7a7caa4 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -153,6 +153,8 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
 
 		swap = &ttm_bo_glob.swap_lru[bo->priority];
 		list_move_tail(&bo->swap, swap);
+	} else {
+		list_del_init(&bo->swap);
 	}
 
 	if (bdev->driver->del_from_lru_notify)
-- 
2.30.2


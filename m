Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D93492756
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 14:38:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6B010E220;
	Tue, 18 Jan 2022 13:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9FD10E220
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 13:38:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 980171F43F1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642513086;
 bh=gAJqDSZX33NiJSylH50FUmE5ljeiUi+EvyLQjN8gu0s=;
 h=From:To:Cc:Subject:Date:From;
 b=en6ZVaKEZ5/Pcq6HgkiyVqRZ/ISe6Mx4RYmT5gQQ1+x6gnXvJVHmWg0exmzoyqhvJ
 7prirfD4v9hYzp5XMmqJrbD/N+j0Ex5Ke3RPaWsww6YSLbc+5R6jC1y6XNDDiq1D0D
 woERW0SCrQa8NcH8w9osIcXVQz56C0dluayI0XUvsgbRxBzP72fzktTf1gdFNmzr3S
 3sqs6dbyBdjpARKvso0i2HYRiy4nDc4RwdrI5s6a4oyb7XCylZxytyXZEs3JW5PBsG
 2g6jXjZVV1Sb+OOFpuOCJpPyjlbhO1gZH3wRXPjSrKPHYLzFkBMnVUg+qxfenY707V
 QeGBbOq7IBg5g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH 1/2] drm: mediatek: mtk_drm_plane: Use kmalloc in
 mtk_plane_duplicate_state
Date: Tue, 18 Jan 2022 14:37:58 +0100
Message-Id: <20220118133759.112458-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to zero out the newly allocated memory because we are
duplicating all members of struct mtk_plane_state: switch to kmalloc
to save some overhead.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index c74cb94e445e..39cb9a80d976 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -57,7 +57,7 @@ static struct drm_plane_state *mtk_plane_duplicate_state(struct drm_plane *plane
 	struct mtk_plane_state *old_state = to_mtk_plane_state(plane->state);
 	struct mtk_plane_state *state;
 
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	state = kmalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return NULL;
 
-- 
2.33.1


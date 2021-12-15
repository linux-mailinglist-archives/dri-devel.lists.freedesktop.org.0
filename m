Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0161475127
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 04:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8BC10E187;
	Wed, 15 Dec 2021 03:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3828D10E1A2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 03:00:50 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R311e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=9; SR=0; TI=SMTPD_---0V-gJWWD_1639537246; 
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0V-gJWWD_1639537246) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 15 Dec 2021 11:00:46 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: tomba@kernel.org
Subject: [PATCH -next] drm/omap: Fix NULL but dereferenced coccicheck error
Date: Wed, 15 Dec 2021 11:00:44 +0800
Message-Id: <20211215030044.57748-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
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
Cc: narmstrong@baylibre.com, airlied@linux.ie,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yang Li <yang.lee@linux.alibaba.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Eliminate the following coccicheck warning:
./drivers/gpu/drm/omapdrm/omap_overlay.c:89:22-25: ERROR: r_ovl is NULL
but dereferenced.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Fixes: e02b5cc9e898 ("drm/omap: Add a 'right overlay' to plane state")
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/omapdrm/omap_overlay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_overlay.c b/drivers/gpu/drm/omapdrm/omap_overlay.c
index 10730c9b2752..b0bc9ad2ef73 100644
--- a/drivers/gpu/drm/omapdrm/omap_overlay.c
+++ b/drivers/gpu/drm/omapdrm/omap_overlay.c
@@ -86,7 +86,7 @@ int omap_overlay_assign(struct drm_atomic_state *s, struct drm_plane *plane,
 		r_ovl = omap_plane_find_free_overlay(s->dev, overlay_map,
 						     caps, fourcc);
 		if (!r_ovl) {
-			overlay_map[r_ovl->idx] = NULL;
+			overlay_map[ovl->idx] = NULL;
 			*overlay = NULL;
 			return -ENOMEM;
 		}
-- 
2.20.1.7.g153144c


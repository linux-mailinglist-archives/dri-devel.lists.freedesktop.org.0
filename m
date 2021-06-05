Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C3639C813
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 14:18:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 997AD6E090;
	Sat,  5 Jun 2021 12:18:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m17639.qiye.163.com (mail-m17639.qiye.163.com
 [59.111.176.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012C06E090
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jun 2021 12:18:43 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m17639.qiye.163.com (Hmail) with ESMTPA id 9303838015E;
 Sat,  5 Jun 2021 20:18:40 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/etnaviv: remove NULL check which is not needed
Date: Sat,  5 Jun 2021 05:18:38 -0700
Message-Id: <20210605121838.8357-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQkhNTVZJTBkYGUwaHkNMSU9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NUk6Cio*NT8VAQk2MRgWCCs2
 KgNPCypVSlVKTUlJQ0JOTklKS05PVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFKQkJPNwY+
X-HM-Tid: 0a79dc1c6bfdd994kuws9303838015e
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
Cc: Bernard Zhao <bernard@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

NULL check before kvfree functions is not needed.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index b390dd4d60b7..d741b1d735f7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -80,8 +80,7 @@ static void etnaviv_gem_prime_release(struct etnaviv_gem_object *etnaviv_obj)
 	/* Don't drop the pages for imported dmabuf, as they are not
 	 * ours, just free the array we allocated:
 	 */
-	if (etnaviv_obj->pages)
-		kvfree(etnaviv_obj->pages);
+	kvfree(etnaviv_obj->pages);
 
 	drm_prime_gem_destroy(&etnaviv_obj->base, etnaviv_obj->sgt);
 }
-- 
2.31.0


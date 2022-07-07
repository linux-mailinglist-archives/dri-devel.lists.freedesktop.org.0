Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC09556985A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 04:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531BF1120AF;
	Thu,  7 Jul 2022 02:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
 by gabe.freedesktop.org (Postfix) with ESMTP id F0CAC1120AF
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 02:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=uPjOJ
 ejaSDN7uAYGz6Ql1oMiNrfvcjWMFsA+QGLMMTE=; b=Cistx+0I8TYBPB67LnBnn
 l4KFZy2uTjCQmQvMzY3P4BY0OJtecrwDJCgb2F9wFTZyyDJpndQyMUyproY3dTz9
 +yRHQ1RMhDyVZmJQ9kxmlx1BUkvhMb3YqfnZyKX7oSPxQUx/tBMuDIFq9sJBXUUt
 akum/aUjVIzR2QfxLzFCJM=
Received: from localhost.localdomain (unknown [124.16.139.61])
 by smtp1 (Coremail) with SMTP id C8mowACnhN38ScZiod+TGA--.18137S2;
 Thu, 07 Jul 2022 10:50:37 +0800 (CST)
From: Liang He <windhl@126.com>
To: airlied@linux.ie, orsonzhai@gmail.com, baolin.wang7@gmail.com,
 zhang.lyra@gmail.com, windhl@126.com, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sprd: Remove of_node_put() in sprd_crtc_init()
Date: Thu,  7 Jul 2022 10:50:35 +0800
Message-Id: <20220707025035.307733-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowACnhN38ScZiod+TGA--.18137S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF4UXF45Xw48KryxtFy7KFg_yoWxKwc_u3
 yrursxWr47GFZ8uw17tr4rZ3yIkF48uFW8u3Z0qa4Skr13Jw1Fyryqv345Xr17Aa1jyF98
 Ga1Duw4jvayDZjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_lApDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuB43F2JVkPz78gAAsU
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

As the new reference created in 'dpu->base.port' will be escaped out,
we need not to call of_node_put() again.

Fixes: b07bcf34b6c9 ("drm/sprd: add Unisoc's drm display controller driver")
Signed-off-by: Liang He <windhl@126.com>
---
 drivers/gpu/drm/sprd/sprd_dpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index 1637203ea103..e1b70f989da5 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -741,7 +741,6 @@ static struct sprd_dpu *sprd_crtc_init(struct drm_device *drm,
 		return ERR_PTR(-EINVAL);
 	}
 	dpu->base.port = port;
-	of_node_put(port);
 
 	return dpu;
 }
-- 
2.25.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0526C458D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 10:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C3310E8B9;
	Wed, 22 Mar 2023 09:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Wed, 22 Mar 2023 09:04:05 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4883210E8B9;
 Wed, 22 Mar 2023 09:04:04 +0000 (UTC)
X-UUID: adafd4d116cd41dfb51ecabed6ce9250-20230322
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20, REQID:6f55a80e-d090-412f-94ec-3ae6d833094b, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:25
X-CID-INFO: VERSION:1.1.20, REQID:6f55a80e-d090-412f-94ec-3ae6d833094b, IP:5,
 URL
 :0,TC:0,Content:0,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:25
X-CID-META: VersionHash:25b5999, CLOUDID:28df2229-564d-42d9-9875-7c868ee415ec,
 B
 ulkID:230322165700VFA7MY6F,BulkQuantity:1,Recheck:0,SF:38|24|17|19|44|102,
 TC:nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,O
 SI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: adafd4d116cd41dfb51ecabed6ce9250-20230322
X-User: zhouzongmin@kylinos.cn
Received: from thinkpadx13gen2i.. [(116.128.244.169)] by mailgw
 (envelope-from <zhouzongmin@kylinos.cn>) (Generic MTA)
 with ESMTP id 294111190; Wed, 22 Mar 2023 16:58:50 +0800
From: Zongmin Zhou <zhouzongmin@kylinos.cn>
To: airlied@redhat.com, kraxel@redhat.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/qxl: prevent memory leak
Date: Wed, 22 Mar 2023 16:58:47 +0800
Message-Id: <20230322085847.3385930-1-zhouzongmin@kylinos.cn>
X-Mailer: git-send-email 2.34.1
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
Cc: Zongmin Zhou <zhouzongmin@kylinos.cn>, spice-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The allocated memory for qdev->dumb_heads should be released
in qxl_destroy_monitors_object before qxl suspend.
otherwise,qxl_create_monitors_object will be called to
reallocate memory for qdev->dumb_heads after qxl resume,
it will cause memory leak.

Signed-off-by: Zongmin Zhou<zhouzongmin@kylinos.cn>
---
 drivers/gpu/drm/qxl/qxl_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 6492a70e3c39..404b0483bb7c 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -1229,6 +1229,9 @@ int qxl_destroy_monitors_object(struct qxl_device *qdev)
 	if (!qdev->monitors_config_bo)
 		return 0;
 
+	kfree(qdev->dumb_heads);
+	qdev->dumb_heads = NULL;
+
 	qdev->monitors_config = NULL;
 	qdev->ram_header->monitors_config = 0;
 
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus

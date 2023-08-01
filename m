Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A4C76A73C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 04:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D430D10E2FE;
	Tue,  1 Aug 2023 02:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 305 seconds by postgrey-1.36 at gabe;
 Tue, 01 Aug 2023 02:58:31 UTC
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BEC10E2FE;
 Tue,  1 Aug 2023 02:58:30 +0000 (UTC)
X-UUID: eac41c770e474558b078cdeaa3e4ec1b-20230801
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.28, REQID:eacacd6f-0419-4e3f-8a56-feae8cc10ea2, IP:15,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-INFO: VERSION:1.1.28, REQID:eacacd6f-0419-4e3f-8a56-feae8cc10ea2, IP:15,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:0
X-CID-META: VersionHash:176cd25, CLOUDID:37c58ad2-cd77-4e67-bbfd-aa4eaace762f,
 B
 ulkID:230801105315WRTL5TH5,BulkQuantity:0,Recheck:0,SF:38|24|17|19|44|102,
 TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: eac41c770e474558b078cdeaa3e4ec1b-20230801
X-User: zhouzongmin@kylinos.cn
Received: from thinkpadx13gen2i.. [(111.48.58.12)] by mailgw
 (envelope-from <zhouzongmin@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2053895444; Tue, 01 Aug 2023 10:53:14 +0800
From: Zongmin Zhou <zhouzongmin@kylinos.cn>
To: airlied@redhat.com, kraxel@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [RESEND PATCH] drm/qxl: prevent memory leak
Date: Tue,  1 Aug 2023 10:53:09 +0800
Message-Id: <20230801025309.4049813-1-zhouzongmin@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425014543.3448839-1-zhouzongmin@kylinos.cn>
References: <20230425014543.3448839-1-zhouzongmin@kylinos.cn>
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


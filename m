Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9792C4F9528
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 14:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B21410F0F7;
	Fri,  8 Apr 2022 12:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C62A10F0D3
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 12:03:19 +0000 (UTC)
X-UUID: ddfd92ebdddb45b5858bc125837b6dd1-20220408
X-UUID: ddfd92ebdddb45b5858bc125837b6dd1-20220408
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 148416000; Fri, 08 Apr 2022 20:03:17 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Apr 2022 20:03:15 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 8 Apr 2022 20:03:14 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Apr 2022 20:03:13 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: [PATCH v9,
 17/17] media: mediatek: vcodec: prevent kernel crash when rmmod
 mtk-vcodec-dec.ko
Date: Fri, 8 Apr 2022 20:02:40 +0800
Message-ID: <20220408120240.29571-18-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408120240.29571-1-yunfei.dong@mediatek.com>
References: <20220408120240.29571-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the driver support subdev mode, the parameter "dev->pm.dev" will be
NULL in mtk_vcodec_dec_remove. Kernel will crash when try to rmmod
mtk-vcodec-dec.ko.

[ 4380.702726] pc : do_raw_spin_trylock+0x4/0x80
[ 4380.707075] lr : _raw_spin_lock_irq+0x90/0x14c
[ 4380.711509] sp : ffff80000819bc10
[ 4380.714811] x29: ffff80000819bc10 x28: ffff3600c03e4000 x27: 0000000000000000
[ 4380.721934] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
[ 4380.729057] x23: ffff3600c0f34930 x22: ffffd5e923549000 x21: 0000000000000220
[ 4380.736179] x20: 0000000000000208 x19: ffffd5e9213e8ebc x18: 0000000000000020
[ 4380.743298] x17: 0000002000000000 x16: ffffd5e9213e8e90 x15: 696c346f65646976
[ 4380.750420] x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000040
[ 4380.757542] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
[ 4380.764664] x8 : 0000000000000000 x7 : ffff3600c7273ae8 x6 : ffffd5e9213e8ebc
[ 4380.771786] x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
[ 4380.778908] x2 : 0000000000000000 x1 : ffff3600c03e4000 x0 : 0000000000000208
[ 4380.786031] Call trace:
[ 4380.788465]  do_raw_spin_trylock+0x4/0x80
[ 4380.792462]  __pm_runtime_disable+0x2c/0x1b0
[ 4380.796723]  mtk_vcodec_dec_remove+0x5c/0xa0 [mtk_vcodec_dec]
[ 4380.802466]  platform_remove+0x2c/0x60
[ 4380.806204]  __device_release_driver+0x194/0x250
[ 4380.810810]  driver_detach+0xc8/0x15c
[ 4380.814462]  bus_remove_driver+0x5c/0xb0
[ 4380.818375]  driver_unregister+0x34/0x64
[ 4380.822288]  platform_driver_unregister+0x18/0x24
[ 4380.826979]  mtk_vcodec_dec_driver_exit+0x1c/0x888 [mtk_vcodec_dec]
[ 4380.833240]  __arm64_sys_delete_module+0x190/0x224
[ 4380.838020]  invoke_syscall+0x48/0x114
[ 4380.841760]  el0_svc_common.constprop.0+0x60/0x11c
[ 4380.846540]  do_el0_svc+0x28/0x90
[ 4380.849844]  el0_svc+0x4c/0x100
[ 4380.852975]  el0t_64_sync_handler+0xec/0xf0
[ 4380.857148]  el0t_64_sync+0x190/0x194
[ 4380.860801] Code: 94431515 17ffffca d503201f d503245f (b9400004)

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
index a84df6596aaa..5da4572c5b14 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
@@ -482,7 +482,8 @@ static int mtk_vcodec_dec_remove(struct platform_device *pdev)
 		video_unregister_device(dev->vfd_dec);
 
 	v4l2_device_unregister(&dev->v4l2_dev);
-	pm_runtime_disable(dev->pm.dev);
+	if (!dev->vdec_pdata->is_subdev_supported)
+		pm_runtime_disable(dev->pm.dev);
 	mtk_vcodec_fw_release(dev->fw_handler);
 	return 0;
 }
-- 
2.18.0


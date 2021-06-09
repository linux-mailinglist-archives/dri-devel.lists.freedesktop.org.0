Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A56C3A0CDE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 08:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B136E0D6;
	Wed,  9 Jun 2021 06:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D242F6E0D6;
 Wed,  9 Jun 2021 06:58:08 +0000 (UTC)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G0HtC4rxYzYsRm;
 Wed,  9 Jun 2021 14:55:15 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 14:58:05 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 9 Jun 2021
 14:58:04 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <linux-kernel@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Lyude Paul
 <lyude@redhat.com>
Subject: [PATCH -next v2] drm/nouveau/mpeg: use list_move instead of
 list_del/list_add in nv44.c
Date: Wed, 9 Jun 2021 15:07:13 +0800
Message-ID: <20210609070713.1328686-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
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
Cc: kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>,
 nouveau@lists.freedesktop.org, yuehaibing@huawei.com,
 dri-devel@lists.freedesktop.org, yangjihong1@huawei.com, libaokun1@huawei.com,
 yukuai3@huawei.com, weiyongjun1@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Using list_move() instead of list_del() + list_add() in nv44.c.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
V1->V2:
	CC mailist

 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c b/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c
index 521ce43a2871..16acd33764de 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c
@@ -158,8 +158,7 @@ nv44_mpeg_intr(struct nvkm_engine *engine)
 	list_for_each_entry(temp, &mpeg->chan, head) {
 		if (temp->inst >> 4 == inst) {
 			chan = temp;
-			list_del(&chan->head);
-			list_add(&chan->head, &mpeg->chan);
+			list_move(&chan->head, &mpeg->chan);
 			break;
 		}
 	}


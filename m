Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E518096715E
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 13:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6317910E110;
	Sat, 31 Aug 2024 11:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5CD10EAB4;
 Sat, 31 Aug 2024 01:19:51 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.48])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WwcZZ4CG7zgYZP;
 Sat, 31 Aug 2024 09:17:42 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id B21C718006C;
 Sat, 31 Aug 2024 09:19:47 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 31 Aug
 2024 09:19:47 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <kherbst@redhat.com>, <lyude@redhat.com>, <dakr@redhat.com>,
 <felix.kuehling@amd.com>, <shashank.sharma@amd.com>,
 <srinivasan.shanmugam@amd.com>, <zhenguo.yin@amd.com>, <Jesse.Zhang@amd.com>
CC: <lizetao1@huawei.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH -next -v2 3/3] drm/nouveau/volt: use clamp() in nvkm_volt_map()
Date: Sat, 31 Aug 2024 09:28:03 +0800
Message-ID: <20240831012803.3950100-4-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240831012803.3950100-1-lizetao1@huawei.com>
References: <20240831012803.3950100-1-lizetao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-Mailman-Approved-At: Sat, 31 Aug 2024 11:44:34 +0000
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

When it needs to get a value within a certain interval, using clamp()
makes the code easier to understand than min(max()).

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
v1 -> v2: Change the patch title prefix to drm/nouveau/volt
v1: https://lore.kernel.org/all/20240830012216.603623-4-lizetao1@huawei.com/

 drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c
index a17a6dd8d3de..803b98df4858 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/base.c
@@ -142,7 +142,7 @@ nvkm_volt_map(struct nvkm_volt *volt, u8 id, u8 temp)
 			return -ENODEV;
 		}
 
-		result = min(max(result, (s64)info.min), (s64)info.max);
+		result = clamp(result, (s64)info.min, (s64)info.max);
 
 		if (info.link != 0xff) {
 			int ret = nvkm_volt_map(volt, info.link, temp);
-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C689E3DCEF1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Aug 2021 05:36:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31826E3DA;
	Mon,  2 Aug 2021 03:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baidu.com (mx21.baidu.com [220.181.3.85])
 by gabe.freedesktop.org (Postfix) with ESMTP id 509F46E3DA
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Aug 2021 03:36:01 +0000 (UTC)
Received: from BC-Mail-Ex06.internal.baidu.com (unknown [172.31.51.46])
 by Forcepoint Email with ESMTPS id 96AA597033AF3533E4AD;
 Mon,  2 Aug 2021 11:35:59 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex06.internal.baidu.com (172.31.51.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Mon, 2 Aug 2021 11:35:59 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Mon, 2 Aug 2021 11:35:58 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <linux-graphics-maintainer@vmware.com>, <zackr@vmware.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
CC: <dri-devel@lists.freedesktop.org>, Cai Huoqing <caihuoqing@baidu.com>
Subject: [PATCH] drm/vmwgfx: Replace "vmw_num_pages" with "PFN_UP"
Date: Mon, 2 Aug 2021 11:35:52 +0800
Message-ID: <20210802033552.990-1-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex15.internal.baidu.com (172.31.51.55) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
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

we counld use PFN_UP instead of vmw_num_pages()

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 .../gpu/drm/vmwgfx/device_include/vm_basic_types.h  | 13 ++++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c                 |  6 +++---
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/device_include/vm_basic_types.h b/drivers/gpu/drm/vmwgfx/device_include/vm_basic_types.h
index 35bd2852189f..1f6e3bbc6605 100644
--- a/drivers/gpu/drm/vmwgfx/device_include/vm_basic_types.h
+++ b/drivers/gpu/drm/vmwgfx/device_include/vm_basic_types.h
@@ -97,19 +97,18 @@ typedef __attribute__((aligned(32))) struct MKSGuestStatInfoEntry {
 } MKSGuestStatInfoEntry;
 
 #define INVALID_PPN64       ((PPN64)0x000fffffffffffffULL)
-#define vmw_num_pages(size) (PAGE_ALIGN(size) >> PAGE_SHIFT)
 
 #define MKS_GUEST_STAT_INSTANCE_DESC_LENGTH 1024
 #define MKS_GUEST_STAT_INSTANCE_MAX_STATS   4096
-#define MKS_GUEST_STAT_INSTANCE_MAX_STAT_PPNS                \
-	(vmw_num_pages(MKS_GUEST_STAT_INSTANCE_MAX_STATS *   \
+#define MKS_GUEST_STAT_INSTANCE_MAX_STAT_PPNS        \
+	(PFN_UP(MKS_GUEST_STAT_INSTANCE_MAX_STATS *  \
 		sizeof(MKSGuestStatCounterTime)))
-#define MKS_GUEST_STAT_INSTANCE_MAX_INFO_PPNS                \
-	(vmw_num_pages(MKS_GUEST_STAT_INSTANCE_MAX_STATS *   \
+#define MKS_GUEST_STAT_INSTANCE_MAX_INFO_PPNS        \
+	(PFN_UP(MKS_GUEST_STAT_INSTANCE_MAX_STATS *  \
 		sizeof(MKSGuestStatInfoEntry)))
 #define MKS_GUEST_STAT_AVERAGE_NAME_LENGTH  40
-#define MKS_GUEST_STAT_INSTANCE_MAX_STRS_PPNS                \
-	(vmw_num_pages(MKS_GUEST_STAT_INSTANCE_MAX_STATS *   \
+#define MKS_GUEST_STAT_INSTANCE_MAX_STRS_PPNS        \
+	(PFN_UP(MKS_GUEST_STAT_INSTANCE_MAX_STATS *  \
 		MKS_GUEST_STAT_AVERAGE_NAME_LENGTH))
 
 /*
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
index ed9c7b3a1e08..e50fb82a3030 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
@@ -1016,9 +1016,9 @@ int vmw_mksstat_add_ioctl(struct drm_device *dev, void *data,
 
 	struct page *page;
 	MKSGuestStatInstanceDescriptor *pdesc;
-	const size_t num_pages_stat = vmw_num_pages(arg->stat_len);
-	const size_t num_pages_info = vmw_num_pages(arg->info_len);
-	const size_t num_pages_strs = vmw_num_pages(arg->strs_len);
+	const size_t num_pages_stat = PFN_UP(arg->stat_len);
+	const size_t num_pages_info = PFN_UP(arg->info_len);
+	const size_t num_pages_strs = PFN_UP(arg->strs_len);
 	long desc_len;
 	long nr_pinned_stat;
 	long nr_pinned_info;
-- 
2.25.1


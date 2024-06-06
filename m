Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C6B8FE614
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 14:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1994B10E91E;
	Thu,  6 Jun 2024 12:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70B910E922
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 12:09:12 +0000 (UTC)
X-UUID: 9215e79023fd11ef9305a59a3cc225df-20240606
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:fea27831-eeb0-439f-8a9c-de7b6491236c, IP:25,
 URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:-1,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:-1
X-CID-INFO: VERSION:1.1.38, REQID:fea27831-eeb0-439f-8a9c-de7b6491236c, IP:25,
 UR
 L:0,TC:0,Content:-25,EDM:0,RT:0,SF:-1,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-1
X-CID-META: VersionHash:82c5f88, CLOUDID:901b4fd3b59d44e3d60918a0391e12b0,
 BulkI
 D:240606200906C0SIN0UP,BulkQuantity:0,Recheck:0,SF:66|25|72|19|44|102,TC:n
 il,Content:0,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,CO
 L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME,
 HR_CTE_8B
 HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
 HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
 HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NAME
 IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_UNTRUSTED, SA_UNFAMILIAR
 SN_UNTRUSTED, SN_UNFAMILIAR, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS
 CIE_BAD, CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
 GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI, AMN_C_BU ABX_MISS_RDNS
X-UUID: 9215e79023fd11ef9305a59a3cc225df-20240606
X-User: pengfuyuan@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw.kylinos.cn
 (envelope-from <pengfuyuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 1518246745; Thu, 06 Jun 2024 20:09:05 +0800
From: pengfuyuan <pengfuyuan@kylinos.cn>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, pengfuyuan <pengfuyuan@kylinos.cn>,
 k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH] arm/komeda: Remove all CONFIG_DEBUG_FS conditional
 compilations
Date: Thu,  6 Jun 2024 20:08:42 +0800
Message-Id: <20240606120842.1377267-1-pengfuyuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since the debugfs functions have no-op stubs for CONFIG_DEBUG_FS=n,
the compiler will optimize the rest away since they are no longer referenced.

The benefit of removing the conditional compilation is that the build
is actually tested for both CONFIG_DEBUG_FS configuration values.
Assuming most developers have it enabled, CONFIG_DEBUG_FS=n is not tested
much and may fail the build due to the conditional compilation.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 14ee79becacb..5ba62e637a61 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -12,10 +12,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/dma-mapping.h>
-#ifdef CONFIG_DEBUG_FS
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
-#endif
 
 #include <drm/drm_print.h>
 
@@ -43,7 +41,6 @@ static int komeda_register_show(struct seq_file *sf, void *x)
 
 DEFINE_SHOW_ATTRIBUTE(komeda_register);
 
-#ifdef CONFIG_DEBUG_FS
 static void komeda_debugfs_init(struct komeda_dev *mdev)
 {
 	if (!debugfs_initialized())
@@ -55,7 +52,6 @@ static void komeda_debugfs_init(struct komeda_dev *mdev)
 	debugfs_create_x16("err_verbosity", 0664, mdev->debugfs_root,
 			   &mdev->err_verbosity);
 }
-#endif
 
 static ssize_t
 core_id_show(struct device *dev, struct device_attribute *attr, char *buf)
@@ -265,9 +261,7 @@ struct komeda_dev *komeda_dev_create(struct device *dev)
 
 	mdev->err_verbosity = KOMEDA_DEV_PRINT_ERR_EVENTS;
 
-#ifdef CONFIG_DEBUG_FS
 	komeda_debugfs_init(mdev);
-#endif
 
 	return mdev;
 
@@ -286,9 +280,7 @@ void komeda_dev_destroy(struct komeda_dev *mdev)
 
 	sysfs_remove_group(&dev->kobj, &komeda_sysfs_attr_group);
 
-#ifdef CONFIG_DEBUG_FS
 	debugfs_remove_recursive(mdev->debugfs_root);
-#endif
 
 	if (mdev->aclk)
 		clk_prepare_enable(mdev->aclk);
-- 
2.25.1


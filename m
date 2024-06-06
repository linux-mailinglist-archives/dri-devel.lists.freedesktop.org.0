Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 502648FE054
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 09:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375F310E074;
	Thu,  6 Jun 2024 07:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0466810E074
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 07:59:19 +0000 (UTC)
X-UUID: a79610b823da11ef9305a59a3cc225df-20240606
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:b18f9f8c-2039-4090-b582-3a6fc4c2f8a9, IP:25,
 URL:0,TC:0,Content:-5,EDM:25,RT:0,SF:-1,FILE:0,BULK:0,RULE:Release_Ham,ACT
 ION:release,TS:44
X-CID-INFO: VERSION:1.1.38, REQID:b18f9f8c-2039-4090-b582-3a6fc4c2f8a9, IP:25,
 UR
 L:0,TC:0,Content:-5,EDM:25,RT:0,SF:-1,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:44
X-CID-META: VersionHash:82c5f88, CLOUDID:6242702a3fbea42b9ae4b3f3e5dc454a,
 BulkI
 D:240606155911IJGA8PEG,BulkQuantity:0,Recheck:0,SF:25|72|19|44|66|102,TC:n
 il,Content:0,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
 :0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
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
X-UUID: a79610b823da11ef9305a59a3cc225df-20240606
X-User: pengfuyuan@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw.kylinos.cn
 (envelope-from <pengfuyuan@kylinos.cn>) (Generic MTA)
 with ESMTP id 301779591; Thu, 06 Jun 2024 15:59:09 +0800
From: pengfuyuan <pengfuyuan@kylinos.cn>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, pengfuyuan <pengfuyuan@kylinos.cn>,
 k2ci <kernel-bot@kylinos.cn>
Subject: [PATCH] arm/komeda: Compile DEFINE_SHOW_ATTRIBUTE() only when
 CONFIG_DEBUG_FS is enabled
Date: Thu,  6 Jun 2024 15:58:46 +0800
Message-Id: <20240606075846.1307007-1-pengfuyuan@kylinos.cn>
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

We do not call komeda_debugfs_init() and the debugfs core function
declaration if CONFIG_DEBUG_FS is not defined, but we should not
compile it either because the debugfs core function declaration is
not included.

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
---
 drivers/gpu/drm/arm/display/komeda/komeda_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
index 14ee79becacb..7ada8e6f407c 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_dev.c
@@ -21,6 +21,7 @@
 
 #include "komeda_dev.h"
 
+#ifdef CONFIG_DEBUG_FS
 static int komeda_register_show(struct seq_file *sf, void *x)
 {
 	struct komeda_dev *mdev = sf->private;
@@ -43,7 +44,6 @@ static int komeda_register_show(struct seq_file *sf, void *x)
 
 DEFINE_SHOW_ATTRIBUTE(komeda_register);
 
-#ifdef CONFIG_DEBUG_FS
 static void komeda_debugfs_init(struct komeda_dev *mdev)
 {
 	if (!debugfs_initialized())
-- 
2.25.1


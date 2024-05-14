Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5538C507C
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 13:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1349B10E53C;
	Tue, 14 May 2024 11:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267B510E130
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 03:06:58 +0000 (UTC)
X-UUID: 024cb122119f11ef9305a59a3cc225df-20240514
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38, REQID:a63ab78e-0f97-4de1-b6a2-02799ef45fe2, IP:15,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:8,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:23
X-CID-INFO: VERSION:1.1.38, REQID:a63ab78e-0f97-4de1-b6a2-02799ef45fe2, IP:15,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:8,FILE:0,BULK:0,RULE:Release_HamU,ACTION:
 release,TS:23
X-CID-META: VersionHash:82c5f88, CLOUDID:37fb2e2b3d59177dacdf6e4160e7f6d5,
 BulkI
 D:240514110651FZNTF11P,BulkQuantity:0,Recheck:0,SF:66|38|24|16|19|44|102,T
 C:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil
 ,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_USA,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME,
 HR_CTE_8B
 HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
 HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
 HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
 IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_UNTRUSTED, SA_LOWREP
 SA_EXISTED, SN_UNTRUSTED, SN_UNFAMILIAR, SPF_NOPASS, DKIM_NOPASS
 DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO
 GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI, AMN_C_BU ABX_MISS_RDNS
X-UUID: 024cb122119f11ef9305a59a3cc225df-20240514
X-User: cuitao@kylinos.cn
Received: from localhost.localdomain [(39.156.73.13)] by mailgw.kylinos.cn
 (envelope-from <cuitao@kylinos.cn>)
 (Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
 with ESMTP id 1664633602; Tue, 14 May 2024 11:06:50 +0800
From: cuitao <cuitao@kylinos.cn>
To: yuq825@gmail.com,
	dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 cuitao <cuitao@kylinos.cn>
Subject: [PATCH] drm/lima: implify the allocation of sync slab caches
Date: Tue, 14 May 2024 11:05:32 +0800
Message-Id: <20240514030532.15065-1-cuitao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 14 May 2024 11:05:48 +0000
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

Use the new KMEM_CACHE() macro instead of direct kmem_cache_create
to simplify the creation of SLAB caches.

Signed-off-by: cuitao <cuitao@kylinos.cn>
---
 drivers/gpu/drm/lima/lima_sched.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 00b19adfc888..414a45082b86 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -28,9 +28,7 @@ static int lima_fence_slab_refcnt;
 int lima_sched_slab_init(void)
 {
 	if (!lima_fence_slab) {
-		lima_fence_slab = kmem_cache_create(
-			"lima_fence", sizeof(struct lima_fence), 0,
-			SLAB_HWCACHE_ALIGN, NULL);
+		lima_fence_slab = KMEM_CACHE(lima_fence, SLAB_HWCACHE_ALIGN);
 		if (!lima_fence_slab)
 			return -ENOMEM;
 	}
-- 
2.25.1


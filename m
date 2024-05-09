Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBADE8C0CF5
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2024 10:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8654B10E0CE;
	Thu,  9 May 2024 08:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C3C10E14D;
 Thu,  9 May 2024 08:58:08 +0000 (UTC)
X-UUID: 3dbb7bfa0de211ef9305a59a3cc225df-20240509
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:4de40844-5ccd-4772-b5d8-70320bbaec82, IP:10,
 URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-11,FILE:0,BULK:0,RULE:Release_Ham,ACTI
 ON:release,TS:-1
X-CID-INFO: VERSION:1.1.37, REQID:4de40844-5ccd-4772-b5d8-70320bbaec82, IP:10,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:-11,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-1
X-CID-META: VersionHash:6f543d0, CLOUDID:8d15c9d744e307d403f4a7dd4da8004e,
 BulkI
 D:240509165804T4MFGNYY,BulkQuantity:0,Recheck:0,SF:25|17|19|44|66|102,TC:n
 il,Content:0,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,CO
 L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-CTIC-Tags: HR_CC_CHARSET, HR_CC_CHARSET_NUM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT,
 HR_CC_NAME
 HR_CC_NO_NAME, HR_CHARSET, HR_CHARSET_NUM, HR_CTE_8B, HR_CTT_MISS
 HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_SJ_LANG
 HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN
 HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NAME, DN_TRUSTED
 SRC_TRUSTED, SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED
 SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD
 CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_T1
 AMN_GOOD, AMN_C_TI, AMN_C_BU, ABX_MISS_RDNS
X-UUID: 3dbb7bfa0de211ef9305a59a3cc225df-20240509
X-User: oushixiong@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw.kylinos.cn
 (envelope-from <oushixiong@kylinos.cn>) (Generic MTA)
 with ESMTP id 931486327; Thu, 09 May 2024 16:58:02 +0800
From: oushixiong <oushixiong@kylinos.cn>
To: Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Xinhui.Pan@amd.com,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/radeon: Delay Connector detecting when HPD singals is
 unstable
Date: Thu,  9 May 2024 16:57:58 +0800
Message-Id: <20240509085758.123046-1-oushixiong@kylinos.cn>
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

From: Shixiong Ou <oushixiong@kylinos.cn>

In some causes, HPD signals will jitter when plugging in
or unplugging HDMI.

Rescheduling the hotplug work for a second when EDID may still be
readable but HDP is disconnected, and fixes this issue.

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/radeon/radeon_connectors.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
index b84b58926106..cf0114ca59a4 100644
--- a/drivers/gpu/drm/radeon/radeon_connectors.c
+++ b/drivers/gpu/drm/radeon/radeon_connectors.c
@@ -1267,6 +1267,16 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
 			goto exit;
 		}
 	}
+
+	if (dret && radeon_connector->hpd.hpd != RADEON_HPD_NONE &&
+	    !radeon_hpd_sense(rdev, radeon_connector->hpd.hpd) &&
+	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIA) {
+		DRM_DEBUG_KMS("EDID is readable when HPD disconnected\n");
+		schedule_delayed_work(&rdev->hotplug_work, msecs_to_jiffies(1000));
+		ret = connector_status_disconnected;
+		goto exit;
+	}
+
 	if (dret) {
 		radeon_connector->detected_by_load = false;
 		radeon_connector_free_edid(connector);
-- 
2.17.1


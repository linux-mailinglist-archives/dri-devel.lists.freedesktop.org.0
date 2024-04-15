Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EAD8A471D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 04:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211BD10F127;
	Mon, 15 Apr 2024 02:52:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C858410F5C2;
 Mon, 15 Apr 2024 02:52:44 +0000 (UTC)
X-UUID: 325194bafad311eeaf09c5092e5928d1-20240415
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:02117ba6-a9a5-4e51-b790-ad657f0da0a4, IP:10,
 URL:0,TC:0,Content:-5,EDM:-25,RT:0,SF:-1,FILE:0,BULK:0,RULE:Release_Ham,AC
 TION:release,TS:-21
X-CID-INFO: VERSION:1.1.37, REQID:02117ba6-a9a5-4e51-b790-ad657f0da0a4, IP:10,
 UR
 L:0,TC:0,Content:-5,EDM:-25,RT:0,SF:-1,FILE:0,BULK:0,RULE:EDM_GE969F26,ACT
 ION:release,TS:-21
X-CID-META: VersionHash:6f543d0, CLOUDID:ac8ec112b8a1349a46baf061f9423a61,
 BulkI
 D:240415104546ICIJYRA7,BulkQuantity:1,Recheck:0,SF:44|66|38|25|72|19|102,T
 C:nil,Content:0,EDM:1,IP:-2,URL:0,File:nil,RT:nil,Bulk:41,QS:nil,BEC:nil,C
 OL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME,
 HR_CTE_8B
 HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
 HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
 HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
 HR_TO_NO_NAME, DN_TRUSTED, SRC_TRUSTED, SA_EXISTED, SN_EXISTED
 SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF
 GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD
 AMN_C_TI, AMN_C_BU, ABX_MISS_RDNS, ZHF_RECV_LOCALHOST
X-UUID: 325194bafad311eeaf09c5092e5928d1-20240415
X-User: yaolu@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by mailgw
 (envelope-from <yaolu@kylinos.cn>) (Generic MTA)
 with ESMTP id 246354815; Mon, 15 Apr 2024 10:52:28 +0800
From: Lu Yao <yaolu@kylinos.cn>
To: lucas.demarchi@intel.com, ogabbay@kernel.org,
 thomas.hellstrom@linux.intel.com, maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Lu Yao <yaolu@kylinos.cn>
Subject: [PATCH] drm/xe: select X86_PLATFORM_DEVICES when ACPI_WMI is selected
Date: Mon, 15 Apr 2024 10:52:15 +0800
Message-Id: <20240415025215.15811-1-yaolu@kylinos.cn>
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

ACPI_WMI is a subitem of X86_PLATFORM_DEVICES. And X86_PLATFORM_DEVICES
is not selected in the current Kconfig, and may cause Kconfig warnings:

WARNING: unmet direct dependencies detected for ACPI_WMI
  Depends on [n]: X86_PLATFORM_DEVICES [=n] && ACPI [=y]
  Selected by [m]:
  - DRM_XE [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y] &&
    (m && MODULES [=y] || y && KUNIT [=y]=y) && X86 [=y] && ACPI [=y]

Signed-off-by: Lu Yao <yaolu@kylinos.cn>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 1a556d087e63..f483e69a5d0f 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -26,6 +26,7 @@ config DRM_XE
 	select INPUT if ACPI
 	select ACPI_VIDEO if X86 && ACPI
 	select ACPI_BUTTON if ACPI
+	select X86_PLATFORM_DEVICES if X86 && ACPI
 	select ACPI_WMI if X86 && ACPI
 	select SYNC_FILE
 	select IOSF_MBI
-- 
2.25.1


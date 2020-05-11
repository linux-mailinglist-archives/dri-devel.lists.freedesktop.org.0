Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BF31CD909
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 13:55:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC196E440;
	Mon, 11 May 2020 11:55:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36EA6E07B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 11:55:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dPqS5LBqZR+/CpDmrYePUfzWwnm3rx1H1V9h0lGebmCkpntWBW2r177AJ8N+R4fDv5rWdSlaRI4wyf3sAVNZTDiLh998ZC7xXEwzbzlgjIQsPjbs1f196Hl2V2wZFmWWZAPuoXjdkK7bkzlyMmriGr4F0whyQmbAl9pSXc6U7ENd3TkkSR/lJAD8o4SrTmDQTcvdrPtBhQCz81GrCawed9YWRHSuQshjS2E2axqGCFB9f7AzSMYDRb9tHuRuBBT8BirKH5SGLpBdPAGgHNwJ4v3c15+zTnajBWkXNTvGj3LDfTXo3JRUEGEt+ikI2ritI76Wdebs0d8ZhMptaUaquA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vd+Sq4mLENVO27RVHVSewHzwTDKziQbuI+D57oRGYE0=;
 b=oI6uDIrUAOoGyEVvMvs0ylqCHNrfyip0vfISScW7ycvpBROUiJ8OPtyPJ5HzWO/3TxKxEfEw5Oz8XsHs1wZAD5tOGK3jPgs2/K34B3+zS79XxZ/9mKHT/98Oe6xQGkY3OwNAvZ1e4CvIopgXmhYELrkWMM31J6tg+WQk0svFJe5JVdPEO0M59HfxVpSiZCvHyRuLHfbeEhA9H4pmI9M3MJJ31qlx1yJfYTQ0R1WNTTQw0br3L3tIIXHW1XZVxnFSjHc4vv4znvOJDV4g0YT5CifsskcypRvMyL8DH/yMZEbOdw1tuZqm+BlFpDeaEciSr/bMciYtfGeyzFp5fksG2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vd+Sq4mLENVO27RVHVSewHzwTDKziQbuI+D57oRGYE0=;
 b=mjYWUkPZsWbj60/O+UMvBkO/vF32y3A1W7cLHjyDfIHUjKfPWke/2RZwP+d7X2F7TBzRW/Ia/g8Wol629fQLoXSjJzobC0TehiH6tN4zz5ayA9OEPLZnrvK3+EWTGGLfYS4vx+Yb7x5kQRPm9OfWsuQKGsVIScDdH278MugV2So=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1159.namprd12.prod.outlook.com (2603:10b6:903:36::17)
 by CY4PR12MB1944.namprd12.prod.outlook.com (2603:10b6:903:127::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Mon, 11 May
 2020 11:55:42 +0000
Received: from CY4PR12MB1159.namprd12.prod.outlook.com
 ([fe80::e9c0:2506:396c:70b7]) by CY4PR12MB1159.namprd12.prod.outlook.com
 ([fe80::e9c0:2506:396c:70b7%10]) with mapi id 15.20.2979.033; Mon, 11 May
 2020 11:55:42 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Brian Starkey <brian.starkey@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Simon Ser <contact@emersion.fr>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Helen Koike <helen.koike@collabora.com>
Subject: [PATCH V4 2/3] drm/vkms: Compute CRC without change input data
Date: Mon, 11 May 2020 07:55:23 -0400
Message-Id: <20200511115524.22602-3-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511115524.22602-1-Rodrigo.Siqueira@amd.com>
References: <20200511115524.22602-1-Rodrigo.Siqueira@amd.com>
X-ClientProxiedBy: YT1PR01CA0104.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::13) To CY4PR12MB1159.namprd12.prod.outlook.com
 (2603:10b6:903:36::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56a0:11a1::2) by
 YT1PR01CA0104.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.28 via Frontend Transport; Mon, 11 May 2020 11:55:41 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [2607:fea8:56a0:11a1::2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ec93e22f-693f-4646-5148-08d7f5a23b35
X-MS-TrafficTypeDiagnostic: CY4PR12MB1944:
X-Microsoft-Antispam-PRVS: <CY4PR12MB1944E866E40099BFAE3E73BE98A10@CY4PR12MB1944.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 04004D94E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OvWpsw55LzMTIZftZxnxcCtSzrrIbT9EaATDvGMv0MrrJEgO4D9zVH6zK60BL4hv9tF1fwWWvbp7InvT683PEIOhWmHKcRJqzdcg9dmmQQLDDHL3XSQqsQHASgjhpGhgO09ZTxkQR3dQT5rwua1lDCDM9j6d/loSQrFHSC3Riy42c3Q+EjoFrPGXq8dCpTds7wnOWGWsALhSQY2oT0IWGaiN1aUH8NXmp1aEBPOw/GIDzw7F82+AkkGvdiyhPGOc3gxB2LHdRHepAh4UuKGlKZRhroFKMSJ8+AIn6PPqOvcynX6txYIOtKZa/0Umifeho8Lnvn/6X8ooMlOHtfejLTUMJXmgrI5LqS9r5l4cuC0AKa4m8LPWczAdXjuGAWNn76fCCJtAPIDrKVbl84YxHS8C9jBlUlaw787F/3t3Mg5uMS1AC5VV3TwBBpMaRTGepKao1+2LpsmgsdqzfcmZQ+u5guN+wU5/ya3MDmBBvMX2coqntnSo5kTrFqtx9PMudyZNYlrWY8ch56iGjyI7cA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1159.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(396003)(136003)(366004)(39860400002)(346002)(33430700001)(36756003)(66946007)(66476007)(86362001)(66556008)(1076003)(6666004)(6506007)(16526019)(52116002)(186003)(316002)(110136005)(2616005)(4326008)(478600001)(6512007)(2906002)(6486002)(5660300002)(33440700001)(8676002)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: +ldLpcm70FTO9FmysMZisZrrcE3E1my5nYwzmfI+ac3Jex1CPaPlhqQELo0NKdJCBDy5+TGlonPPYajIe+QmDh2xeoZ77SuQ6rKRh46HXzunIaO1ayAMPGO6bm0s0gQNDjmRpmLqXZFKfvuyhxftf8u6s8nG4anbFVCKbP22FF9gNsqOQVtuxGS3SsBmtkudqxc56PtQR7bnyKvWLpUbwnu1NsxMue40GhqtsOacF56/6JBh0XbD7Y/5D2/B5qcgDdp3+Z38x4jngZgPyhrYbFb/6UU8z542ashImA0uJpgBw3KaaMaOThIJ9EiptuvbIJxfuIs8l34DuT0PKm8q7H6xri7BMpRPQ3NC9dY17s+1wossskbrY6MpP2Q4K7QiLJbdaF+V0IJe+oi2smIYUuwn/etga1pFxi2Jb9TiJjerx9RX3nDKLPu8TLqwPWKUAnrTMa1RCIfDmKqNAa08loLy6SD41P4vZtKTgdDFOEc3gzCLB7TOTwZdPkxta00W
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec93e22f-693f-4646-5148-08d7f5a23b35
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2020 11:55:42.4800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PgvaTcbi9v+3m7IFnN7xbLsFJk/RLFj1xGvn79qAzuSKMCfr4TLRArZb+MzwpQ5yKuZXb6DBYJowALH2MxO1Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1944
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

The compute_crc() function is responsible for calculating the
framebuffer CRC value; due to the XRGB format, this function has to
ignore the alpha channel during the CRC computation. Therefore,
compute_crc() set zero to the alpha channel directly in the input
framebuffer, which is not a problem since this function receives a copy
of the original buffer. However, if we want to use this function in a
context without a buffer copy, it will change the initial value. This
patch makes compute_crc() calculate the CRC value without modifying the
input framebuffer.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 31 +++++++++++++++++-----------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 258e659ecfba..686d25e7b01d 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -9,33 +9,40 @@
 
 #include "vkms_drv.h"
 
+static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
+				 const struct vkms_composer *composer)
+{
+	int src_offset = composer->offset + (y * composer->pitch)
+					  + (x * composer->cpp);
+
+	return *(u32 *)&buffer[src_offset];
+}
+
 /**
  * compute_crc - Compute CRC value on output frame
  *
- * @vaddr_out: address to final framebuffer
+ * @vaddr: address to final framebuffer
  * @composer: framebuffer's metadata
  *
  * returns CRC value computed using crc32 on the visible portion of
  * the final framebuffer at vaddr_out
  */
-static uint32_t compute_crc(void *vaddr_out, struct vkms_composer *composer)
+static uint32_t compute_crc(const u8 *vaddr,
+			    const struct vkms_composer *composer)
 {
-	int i, j, src_offset;
+	int x, y;
 	int x_src = composer->src.x1 >> 16;
 	int y_src = composer->src.y1 >> 16;
 	int h_src = drm_rect_height(&composer->src) >> 16;
 	int w_src = drm_rect_width(&composer->src) >> 16;
-	u32 crc = 0;
+	u32 crc = 0, pixel = 0;
 
-	for (i = y_src; i < y_src + h_src; ++i) {
-		for (j = x_src; j < x_src + w_src; ++j) {
-			src_offset = composer->offset
-				     + (i * composer->pitch)
-				     + (j * composer->cpp);
+	for (y = y_src; y < y_src + h_src; ++y) {
+		for (x = x_src; x < x_src + w_src; ++x) {
 			/* XRGB format ignores Alpha channel */
-			memset(vaddr_out + src_offset + 24, 0,  8);
-			crc = crc32_le(crc, vaddr_out + src_offset,
-				       sizeof(u32));
+			pixel = get_pixel_from_buffer(x, y, vaddr, composer);
+			bitmap_clear((void *)&pixel, 0, 8);
+			crc = crc32_le(crc, (void *)&pixel, sizeof(u32));
 		}
 	}
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

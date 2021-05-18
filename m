Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E79533875B9
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 11:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D1866EB1B;
	Tue, 18 May 2021 09:52:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2057.outbound.protection.outlook.com [40.107.223.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02646EB1B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 09:52:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldphnhndKuJiNUjPKRcetlWY9Hpx8ExrzNagR9DhcmsqNsspYcZPrqmDylnJx5iOsirdjYDJPRBABEmNcNsh+v3cJE0sxY5UW2IIYfojI/860R6iYxo/QzxL5E0kaxq0iJj4IhIjLo3J9eO8YslEYdl+Zr3ELWNZxzoKco/B/Br/GpZNAsB4kgvSfOXgg7p5uYnZvhdlCtrTzog3rEG26467O9ZSiTY5BNALQDA7dTpGDzwxV+MTYKLkeJpP4tE387eeUvITOcocdYbePsDp21y7xVZiPXzPojFhneUB+M3PRsF5PKEiOamYlbiDSwZGGuKDNVmGDR8JMmh/589Bzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCpviyJ7FmA4C/LYkpOVdZOEr+eVvFT8aACG6+3b5vQ=;
 b=oMp+i6zxcwMAZ8zTg/ftef1XtB+E4sExbNt4noKvcfl2YA/RBqMUeDY7RjHAhxRdXgVp245Rpt8MKNgN2H+YAWLY8bnsf97CtANMTbf++sTa1/nTKlL4fMW8sfX3dKUKt2qx3OOKxS2HVqpDm7ydjdlXX3/n2Cr7r8BJUW/2XuzK3T/ZLxVEjUlx3bSfnhzzV4byVGOh470/xoXEYmHKKyszWCxZRdUB3Kdv0yhWw2wbGOpZjlz0wymoRvjSHgm20l+boR7BT9N8POp9y7QMjw75w9EVV7N+lP1SNV6FdEdFTjSzfZl5SVc4cNyAgDZ5pHlFuSuSKdyuc2J7G9FX5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OCpviyJ7FmA4C/LYkpOVdZOEr+eVvFT8aACG6+3b5vQ=;
 b=A63I6HAd8dh6ZnIzflfdaX0eN/8AFp9w5noEjXjqoaAVAJWnkMy6RcyPS3eK2NLuVQfHS8VFi3/mIDBMx5D6+xxiCZnwRuhToIFaNU8TFXY3j5+7mBwS3n5A/AdYVqsF0kEpnqKty7fZrZWghLlAtOMw1HwYV0TEPlCazuEWP9s=
Authentication-Results: crapouillou.net; dkim=none (message not signed)
 header.d=none;crapouillou.net; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0075.namprd11.prod.outlook.com (2603:10b6:4:6c::16) by
 DM6PR11MB3082.namprd11.prod.outlook.com (2603:10b6:5:6b::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.26; Tue, 18 May 2021 09:52:17 +0000
Received: from DM5PR11MB0075.namprd11.prod.outlook.com
 ([fe80::7cf5:4b57:4804:20bf]) by DM5PR11MB0075.namprd11.prod.outlook.com
 ([fe80::7cf5:4b57:4804:20bf%5]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 09:52:17 +0000
From: quanyang.wang@windriver.com
To: Paul Cercueil <paul@crapouillou.net>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@xilinx.com>
Subject: [V2][PATCH 2/2] drm: xlnx: consolidate the functions which
 programming AUDIO_VIDEO_SELECT register
Date: Tue, 18 May 2021 17:50:19 +0800
Message-Id: <20210518095019.3855369-3-quanyang.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518095019.3855369-1-quanyang.wang@windriver.com>
References: <20210518095019.3855369-1-quanyang.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0090.apcprd04.prod.outlook.com
 (2603:1096:202:15::34) To DM5PR11MB0075.namprd11.prod.outlook.com
 (2603:10b6:4:6c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qwang2-d1.wrs.com (60.247.85.82) by
 HK2PR04CA0090.apcprd04.prod.outlook.com (2603:1096:202:15::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.35 via Frontend Transport; Tue, 18 May 2021 09:52:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd723d3a-22ea-4c8c-be0a-08d919e29eff
X-MS-TrafficTypeDiagnostic: DM6PR11MB3082:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB308284847D9F6524F21B8651F02C9@DM6PR11MB3082.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jIz9HTzbtXZxEX8s/XWoE6q0NIKax2TdI8xa2d4MdkM/cp9XtrXx43jIrkBq13N+Zk9gN7abmY9m3JJoQbnZOOuaOG02QB3j5u4pMbywXrCX/1vKIKa7imEpyR+JrDT3IPy198n9bFU+asx6Ax7LmbRGkioDsmO2k2vXwLGwLZzlR/OPKBwnk6QFcnBMo/NJh+erExWXfLdzG8vD+VdRt0NlVNDLdwqhId5ss4Cy4qkXxe9hHFp1rYAzdjQLlBIof13SMdAU8Lhvv0vH3yDtPWTwYoIesRXJ6uEUOTrWT0TAWffUDqPu6oG/YkvSRcvojhNRcsxh3DkYjUgITFxEJ+terac1skhqDRyr/3rXcMm1gAu1gC/M5o7Y0lF/5X4F5Okxx7wRFwl34RDxGzH5oM6LGRE7tVrBYa+sK0L0X6Yw3Q+357RHZE63Vq7LdGsnoZQz9wCDLbcQzQonTb8rRxoepwrrdSaHRlwx4irlbzIKbPDP6BG6lygATb4h4LYYBdqFWgo1PA1+pJ5Bj+dZE8N3NP2IDDUx5lzAggToa9KAUf0+03el4gtAFUrJOzUFZbvSI3VRqdzJWwlL42SJIs+vR9K1EXq7gSL0N/UU9E/ve/S5kXYgtelT6lLrzSIz89MqRCk1x2J6JkW8sMxvVTgXHIMAj5FJUYUUMLUEOMg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB0075.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39850400004)(66556008)(52116002)(83380400001)(66946007)(66476007)(110136005)(38350700002)(478600001)(8936002)(5660300002)(38100700002)(6486002)(316002)(2906002)(2616005)(6512007)(9686003)(186003)(956004)(4326008)(1076003)(16526019)(36756003)(107886003)(8676002)(26005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XWJSYmaLmfq+nOfKvPhvhRNUO+gygDUS6JsBFf84P4w0NEju18ldS4EE1JJp?=
 =?us-ascii?Q?t4AJCDoLJl+3xdPbEJMF5rCyl8/PIH8wn9kUeWo8+Oy1NrpzzUZsVR2IXdyJ?=
 =?us-ascii?Q?whrLPCnmMlftS5s2SnL4QsEGqbQZeDSEsoXjOSeU96NUM9UcVh1GSS0kll0k?=
 =?us-ascii?Q?fNDYZgKsMMoQFC0ArVfJd2oQdkDXEWQSCCrGHkBHKX9vkuLhqkduu3pTgpCt?=
 =?us-ascii?Q?76XAYQ2TzuaoEhukl+gkjVJh+c846UgpkvIYKNAENCOAzgSecbTi6G/DBnS8?=
 =?us-ascii?Q?kxifrfrzFALBzePOJ5WJcoJXPmsLoy8Km17/6wiFyrKIceXdBdpR515Y83ah?=
 =?us-ascii?Q?35AKc5qZeSsDykMd+xIkqIG5SMfuVQIwZidczJlCt1KTgYePnhJt2aQyNC7d?=
 =?us-ascii?Q?4cMg5e+yCdfVUgXVZA1rIgESVmdw+dClL14TR1h5ww1t+HpoSP1xuUVUgjBL?=
 =?us-ascii?Q?G9uoAGv1+C0OJK39/9ouuHNJj3c6ouE7zPudMQDDbKgDVQc/zC/fygNDAY9Q?=
 =?us-ascii?Q?F+quLPOoruFHOkHlhbnJmV+mz5u25Q43BeAxUxKgFgjGmdBxyIbNykvLwApo?=
 =?us-ascii?Q?cQrW/G/gRffd5fCjHPnhCSun+3r19Uzf9uOTShGJJrDz4Ep40iIV487s8NNr?=
 =?us-ascii?Q?eEqCj+J1u/cNt7G3w0jaFH8R6Xjak+EGwta8DMQO4DsKilPax+7cXCaTKyQe?=
 =?us-ascii?Q?FwxZIfp/vYBNlD/+kQKq86tR/uLJVS37G2X77Sb1y2lfhiCDjYS+P05dK7Ck?=
 =?us-ascii?Q?BdrKbxc1PnylshFoksntr0zyURfn2gPjvpQGMSupg4NidL09yHp+9pEGssfI?=
 =?us-ascii?Q?8Qw2W8e2F26qazQimu5rYgmOeNtUgMq6o8uQd1tVEoA9b9lmOhwRhqoSpfZb?=
 =?us-ascii?Q?R38jLTMbgA3AdE49w4TpLK5rjTc2KrssWgbOz5DnzMFCV7lz+ssR8I+T2cPq?=
 =?us-ascii?Q?/refV/0jOZw2cWYNK4Kd/bGGmi7RFyQHOXSO/xKb4g+z26Mtr+0esCyErwQZ?=
 =?us-ascii?Q?zW6c8+ZEVfF4H5pRHeXK1gY6+Bz8n6NFWs92/op36IJVjsULWgnmp+geFQ1o?=
 =?us-ascii?Q?VKXMLZ+pWfiqY2pMHsSk+7FofteCzr7biln68FoGaDTU5TW0nwd+fws+ijFf?=
 =?us-ascii?Q?zLLI/n5FKB85ws2nP+4oykdP0JcCVgAumYRF4fuA7S5q1lP2VazIcr2tgrjQ?=
 =?us-ascii?Q?BONDreussOBWsupJN13nRB13YFZP4QDiS3Imy9FRMUQhP2BJXxKJAQTPk8zx?=
 =?us-ascii?Q?yx7Mh+xD/eUkJGapiC312uq9vntojB5ccu8rHzjVMRGirltz3lS77r2CAll6?=
 =?us-ascii?Q?bxQG44W11f34teHwMVKJE0kI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd723d3a-22ea-4c8c-be0a-08d919e29eff
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0075.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 09:52:17.1928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAlld9FsdfDpHSCZdekPf/Y4pmHk6Ds1Y8VjhRE/26MGb1vxnLrxaewm/SdxsxmoNcFEpTJt3CbvI8nc/D0rLMPDtj244DzRzM7iFmqkQjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3082
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
Cc: Quanyang Wang <quanyang.wang@windriver.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Quanyang Wang <quanyang.wang@windriver.com>

For now, the functions zynqmp_disp_avbuf_enable/disable_audio and
zynqmp_disp_avbuf_enable/disable_video are all programming the register
AV_BUF_OUTPUT_AUDIO_VIDEO_SELECT to select the output for audio or video.
And in the future, many drm properties (like video_tpg, audio_tpg,
audio_pl, etc) also need to access it. So let's introduce some variables
of enum type and consolidate the code to unify handling this.

Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c      | 168 ++++++++++++++----------
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |  23 +---
 2 files changed, 106 insertions(+), 85 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index eefb278e24c6..3672d2f5665b 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -102,12 +102,39 @@ enum zynqmp_disp_layer_id {
 
 /**
  * enum zynqmp_disp_layer_mode - Layer mode
- * @ZYNQMP_DISP_LAYER_NONLIVE: non-live (memory) mode
+ * @ZYNQMP_DISP_LAYER_MEM: memory mode
  * @ZYNQMP_DISP_LAYER_LIVE: live (stream) mode
+ * @ZYNQMP_DISP_LAYER_TPG: tpg mode (only for video layer)
+ * @ZYNQMP_DISP_LAYER_DISABLE: disable mode
  */
 enum zynqmp_disp_layer_mode {
-	ZYNQMP_DISP_LAYER_NONLIVE,
-	ZYNQMP_DISP_LAYER_LIVE
+	ZYNQMP_DISP_LAYER_MEM,
+	ZYNQMP_DISP_LAYER_LIVE,
+	ZYNQMP_DISP_LAYER_TPG,
+	ZYNQMP_DISP_LAYER_DISABLE
+};
+
+enum avbuf_vid_mode {
+	VID_MODE_LIVE,
+	VID_MODE_MEM,
+	VID_MODE_TPG,
+	VID_MODE_NONE
+};
+
+enum avbuf_gfx_mode {
+	GFX_MODE_DISABLE,
+	GFX_MODE_MEM,
+	GFX_MODE_LIVE,
+	GFX_MODE_NONE
+};
+
+enum avbuf_aud_mode {
+	AUD1_MODE_LIVE,
+	AUD1_MODE_MEM,
+	AUD1_MODE_TPG,
+	AUD1_MODE_DISABLE,
+	AUD2_MODE_DISABLE,
+	AUD2_MODE_ENABLE
 };
 
 /**
@@ -542,92 +569,102 @@ static void zynqmp_disp_avbuf_disable_channels(struct zynqmp_disp_avbuf *avbuf)
 }
 
 /**
- * zynqmp_disp_avbuf_enable_audio - Enable audio
+ * zynqmp_disp_avbuf_output_select - Select the buffer manager outputs
  * @avbuf: Audio/video buffer manager
+ * @layer: The layer
+ * @mode: The mode for this layer
  *
- * Enable all audio buffers with a non-live (memory) source.
+ * Select the buffer manager outputs for @layer.
  */
-static void zynqmp_disp_avbuf_enable_audio(struct zynqmp_disp_avbuf *avbuf)
+static void zynqmp_disp_avbuf_output_select(struct zynqmp_disp_avbuf *avbuf,
+					   struct zynqmp_disp_layer *layer,
+					   u32 mode)
 {
-	u32 val;
+	u32 reg;
 
-	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
-	val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK;
-	val |= ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MEM;
-	val |= ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_EN;
-	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
+	reg = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
+
+	/* Select audio mode when the layer is NULL */
+	if (layer == NULL) {
+		if (mode >= AUD2_MODE_DISABLE) {
+			reg &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_MASK;
+			reg |= FIELD_PREP(ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_MASK,
+					(mode - AUD2_MODE_DISABLE));
+		} else {
+			reg &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK;
+			reg |= FIELD_PREP(ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK, mode);
+		}
+	} else if (is_layer_vid(layer)) {
+		reg &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
+		reg |= FIELD_PREP(ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK, mode);
+	} else {
+		reg &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK;
+		reg |= FIELD_PREP(ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK, mode);
+	}
+
+	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, reg);
 }
 
 /**
- * zynqmp_disp_avbuf_disable_audio - Disable audio
+ * zynqmp_disp_avbuf_enable_audio - Enable audio
  * @avbuf: Audio/video buffer manager
  *
- * Disable all audio buffers.
+ * Enable all audio buffers.
  */
-static void zynqmp_disp_avbuf_disable_audio(struct zynqmp_disp_avbuf *avbuf)
+static void zynqmp_disp_avbuf_enable_audio(struct zynqmp_disp_avbuf *avbuf)
 {
-	u32 val;
-
-	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
-	val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK;
-	val |= ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_DISABLE;
-	val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_EN;
-	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
+	zynqmp_disp_avbuf_output_select(avbuf, NULL, AUD1_MODE_MEM);
+	zynqmp_disp_avbuf_output_select(avbuf, NULL, AUD2_MODE_ENABLE);
 }
 
 /**
- * zynqmp_disp_avbuf_enable_video - Enable a video layer
+ * zynqmp_disp_avbuf_disable_audio - Disable audio
  * @avbuf: Audio/video buffer manager
- * @layer: The layer
- * @mode: Operating mode of layer
  *
- * Enable the video/graphics buffer for @layer.
+ * Disable all audio buffers.
  */
-static void zynqmp_disp_avbuf_enable_video(struct zynqmp_disp_avbuf *avbuf,
-					   struct zynqmp_disp_layer *layer,
-					   enum zynqmp_disp_layer_mode mode)
+static void zynqmp_disp_avbuf_disable_audio(struct zynqmp_disp_avbuf *avbuf)
 {
-	u32 val;
-
-	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
-	if (is_layer_vid(layer)) {
-		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
-		if (mode == ZYNQMP_DISP_LAYER_NONLIVE)
-			val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM;
-		else
-			val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_LIVE;
-	} else {
-		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK;
-		val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM;
-		if (mode == ZYNQMP_DISP_LAYER_NONLIVE)
-			val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM;
-		else
-			val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_LIVE;
-	}
-	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
+	zynqmp_disp_avbuf_output_select(avbuf, NULL, AUD1_MODE_DISABLE);
+	zynqmp_disp_avbuf_output_select(avbuf, NULL, AUD2_MODE_DISABLE);
 }
 
 /**
- * zynqmp_disp_avbuf_disable_video - Disable a video layer
- * @avbuf: Audio/video buffer manager
+ * zynqmp_disp_avbuf_set_layer_output - Set layer output
  * @layer: The layer
+ * @mode: The layer mode
  *
- * Disable the video/graphics buffer for @layer.
+ * Set output for @layer
  */
-static void zynqmp_disp_avbuf_disable_video(struct zynqmp_disp_avbuf *avbuf,
-					    struct zynqmp_disp_layer *layer)
+static void zynqmp_disp_avbuf_set_layer_output(struct zynqmp_disp_layer *layer,
+					   enum zynqmp_disp_layer_mode mode)
 {
-	u32 val;
-
-	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
-	if (is_layer_vid(layer)) {
-		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
-		val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_NONE;
-	} else {
-		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK;
-		val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_DISABLE;
+	struct zynqmp_disp *disp = layer->disp;
+	int val;
+
+	switch (mode) {
+	case ZYNQMP_DISP_LAYER_LIVE:
+		val = is_layer_vid(layer) ? VID_MODE_LIVE : GFX_MODE_LIVE;
+		break;
+	case ZYNQMP_DISP_LAYER_MEM:
+		val = is_layer_vid(layer) ? VID_MODE_MEM : GFX_MODE_MEM;
+		break;
+	case ZYNQMP_DISP_LAYER_TPG:
+		if (!is_layer_vid(layer)) {
+			dev_err(disp->dev, "gfx layer has no tpg mode\n");
+			return;
+		}
+		val = VID_MODE_TPG;
+		break;
+	case ZYNQMP_DISP_LAYER_DISABLE:
+		val = is_layer_vid(layer) ? VID_MODE_NONE : GFX_MODE_DISABLE;
+		break;
+	default:
+		dev_err(disp->dev, "invalid layer mode\n");
+		return;
 	}
-	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
+
+	zynqmp_disp_avbuf_output_select(&disp->avbuf, layer, val);
 }
 
 /**
@@ -1030,11 +1067,10 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
  */
 static void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
 {
-	zynqmp_disp_avbuf_enable_video(&layer->disp->avbuf, layer,
-				       ZYNQMP_DISP_LAYER_NONLIVE);
+	zynqmp_disp_avbuf_set_layer_output(layer, ZYNQMP_DISP_LAYER_MEM);
 	zynqmp_disp_blend_layer_enable(&layer->disp->blend, layer);
 
-	layer->mode = ZYNQMP_DISP_LAYER_NONLIVE;
+	layer->mode = ZYNQMP_DISP_LAYER_MEM;
 }
 
 /**
@@ -1051,7 +1087,7 @@ static void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
 	for (i = 0; i < layer->drm_fmt->num_planes; i++)
 		dmaengine_terminate_sync(layer->dmas[i].chan);
 
-	zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer);
+	zynqmp_disp_avbuf_set_layer_output(layer, ZYNQMP_DISP_LAYER_DISABLE);
 	zynqmp_disp_blend_layer_disable(&layer->disp->blend, layer);
 }
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
index f92a006d5070..4316e324102d 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
@@ -118,25 +118,10 @@
 #define ZYNQMP_DISP_AV_BUF_STC_SNAPSHOT0		0x60
 #define ZYNQMP_DISP_AV_BUF_STC_SNAPSHOT1		0x64
 #define ZYNQMP_DISP_AV_BUF_OUTPUT			0x70
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_SHIFT		0
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK		(0x3 << 0)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_LIVE		(0 << 0)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM		(1 << 0)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_PATTERN		(2 << 0)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_NONE		(3 << 0)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_SHIFT		2
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK		(0x3 << 2)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_DISABLE		(0 << 2)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM		(1 << 2)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_LIVE		(2 << 2)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_NONE		(3 << 2)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_SHIFT		4
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK		(0x3 << 4)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_PL		(0 << 4)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MEM		(1 << 4)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_PATTERN		(2 << 4)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_DISABLE		(3 << 4)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_EN		BIT(6)
+#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK		GENMASK(1, 0)
+#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK		GENMASK(3, 2)
+#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK		GENMASK(5, 4)
+#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_MASK		BIT(6)
 #define ZYNQMP_DISP_AV_BUF_HCOUNT_VCOUNT_INT0		0x74
 #define ZYNQMP_DISP_AV_BUF_HCOUNT_VCOUNT_INT1		0x78
 #define ZYNQMP_DISP_AV_BUF_PATTERN_GEN_SELECT		0x100
-- 
2.25.1


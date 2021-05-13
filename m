Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C36D37F71D
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 13:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F92E6ECFD;
	Thu, 13 May 2021 11:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA0C16ECFD
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 11:47:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcuFYc2Xr0ik7VGVrVIJ9mE/Z42TmAaLHOtimpuvbBs/TI0UlgLnKurVPTLi0OZ6gCy+zIEfQG73sOCNyGNnUFupX/OpA4onqEZmOUqZ9y0SmH9MJiOSRlJkZmJabYEfYtPNwgRu8TLCqnJk6ZMlQB8wtzduzM9T1HVFSNhkCVVRLTmhHvzuRZlSsCXpsI7w4GdoEeCeYChhV05xx/yafMhg4kNkzgzWg6p7fBsZdodaR87TofmdrPpXHXcKGSFieo05X1hXRc3CyQqgSR1lF1JRwox+6NqiC9gY4Aj1kxIEXiXn7ugf5MwdYyZFAq6S6z5qFghWtpfovmEpoB8DBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMgLOrBKS2Yp6bUfFSPf4d5N+TRabJcA+h4KfAx0bgI=;
 b=ji/09I75AcE8d3lHXeyxalv8wDmGqgFXsEGA7Jdk+uYQLguXxRBcujlSEdBiv/wLmcqtFXR2KcFuf189w+tc0XE5H+qIgXaWnlLzxS9Hgc9LSq3ccvl/o3sTK9mPPgI13HOLJuJnJ/qFJc+LBzS7OSCGrgQrKIpusF96p9UXHN+vmSqlSxTbM2beZacvqbbGThf+Kjr919mCTLhPRseZ2qs31rr/ffi3wdNVWzw3VDy7h8lPzKT9O/L0H62vHrHs+WjhP/WBMRIDdZCJckmK8jaqgbrybR3cXp4r7tFlOEUrXFFgPbaTLquKg7j6VA3JmY4JeR0Woio3AMi7DLyhPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMgLOrBKS2Yp6bUfFSPf4d5N+TRabJcA+h4KfAx0bgI=;
 b=lnWU4nhn08Sy0d32pWO5gNBgKqHdioweDn9lovLZmANZVJHea9QweXGm/7ufiRzEcJZNMya5/P92WZByD3z0MrGcNUfeKUhFe0AS1M0Tmwq1t9/VxwypktAZGKF8N23hOzgzvE/npBf4CVRrBqBSQ0677tbtaZCqj3Zoqdv+1aQ=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=windriver.com;
Received: from CY4PR11MB0071.namprd11.prod.outlook.com (2603:10b6:910:7a::30)
 by CY4PR11MB1351.namprd11.prod.outlook.com (2603:10b6:903:26::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 13 May
 2021 11:47:19 +0000
Received: from CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::f45f:e820:49f5:3725]) by CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::f45f:e820:49f5:3725%6]) with mapi id 15.20.4108.031; Thu, 13 May 2021
 11:47:19 +0000
From: quanyang.wang@windriver.com
To: Hyun Kwon <hyun.kwon@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 2/2] drm: xlnx: consolidate the functions which programming
 AUDIO_VIDEO_SELECT register
Date: Thu, 13 May 2021 19:45:40 +0800
Message-Id: <20210513114540.1241122-3-quanyang.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210513114540.1241122-1-quanyang.wang@windriver.com>
References: <20210513114540.1241122-1-quanyang.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2P15301CA0015.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::25) To CY4PR11MB0071.namprd11.prod.outlook.com
 (2603:10b6:910:7a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-qwang2-d1.wrs.com (60.247.85.82) by
 HK2P15301CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.8 via Frontend Transport; Thu, 13 May 2021 11:47:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41240ec6-c1b1-402d-0cd1-08d91604dc9c
X-MS-TrafficTypeDiagnostic: CY4PR11MB1351:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR11MB13519D0CE25CB9877E4C4ABEF0519@CY4PR11MB1351.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6KJf/CMipGiQz0nFd6KqoQEGQoGi+9bJH8xxKqdsoEgH43dbXvlV+6MhZZsioLhgDfdHvKDBt5INsrh8nBnVjyqMYDCaxRnbdKKqsg+RjZDBpcqJFsFTo7vQHx/K2507Mho4XhtRazwmjLmTD3UdqXKZ32nGrM06VLlquQHl4VWvE/7PYhRXd47HUDEtGvitBXrYEJXMwa8AE6Aho+ZNGoQq2oSatpwaqLtBTuDC91WW7GakLOhhPP83pnvbbGn4ImikOaGY9Sx5OxMZlG9eeQUytJNx6BxyeRQTeEcjCQPnryorNxzsw1u0uy3pi55H8NyTO98ZyIF2ZOLRxzwZWGBmH0fQ3ifB8SrCOIivutALsgoZ/ns7MpRdCC/36WpN4vn2+72bp7BIwPwW4LlME0Z83tJ9ojf/shmjwBUlqdv3/Bdk0xQWO2FQClQF4w/8Qc6BaCf2pGWrU9E8/jyWEv1JVMfSKQVxHGugXPiTVhK3Ss/lPQhgUaSth6Ujr7Iv7pLPoUP8NzdvKzu4edP4ZtLSe8Dn2rFoQOJUeMSpjGJcxWdS3YdG2bY7QRYxdGGtvCctNvR7z3C41JznCpJhVfPN+fTDZQwR4IE9JDM0MCmt0JqN9apQdEKeM2BB2KLXRuNiy8wbW/By7b6ZS0T7Ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0071.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(376002)(396003)(346002)(136003)(366004)(6506007)(6636002)(4326008)(26005)(107886003)(186003)(16526019)(52116002)(36756003)(38350700002)(2906002)(38100700002)(86362001)(1076003)(9686003)(2616005)(956004)(6512007)(316002)(83380400001)(110136005)(5660300002)(66556008)(66476007)(66946007)(8936002)(478600001)(6486002)(6666004)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?j4Z+iHyuhG+fJJ6R/Sz/2SiAUDQ5PzVUNKTmqPwb+6BNvfzBtfXk892a1XEU?=
 =?us-ascii?Q?5lyN6o+7aIRRpIkvd8m01mnJCffPKGmCY167VKxW8+EEAEgJOPM3dsjn1E25?=
 =?us-ascii?Q?eBus1lH+AG0vUr24qcKC8VWR5izM5sMEol4OP94TWcom7XV6xi2oOAXKwXgT?=
 =?us-ascii?Q?ZcDD+k+GTFZzYPSsIJrMCs2ES5O99zGfXtBVhnbmlbfPWg/6Gf8olq4GxC8z?=
 =?us-ascii?Q?hAWl/env1/zcscsrumxSZBCMPXS8LSnfcWhFCV2yy9HzAx2lyfHuRlq0BRoT?=
 =?us-ascii?Q?HoaU2O7kcGJTHaXx2WBNf4cHBc5riRjhpMBKu7PDoHMOCgXVEiJbXVhzIBVD?=
 =?us-ascii?Q?FQGDWKbF60v1Sh9yQcAwZlyRNXTDFkzuyttBv4+mAIMVWAD7wdiB8Ex/l0lZ?=
 =?us-ascii?Q?RUQdXRATz1TA0150kizp2Eg5E3jvW0YAVu8b45iShyLVej8gYvCIMBH18x4I?=
 =?us-ascii?Q?Yin4SiP6LEUeSSikWAUXR4PTJlFDQeTYRoxDKgKhxyK7o38TNDbrOybeeSVe?=
 =?us-ascii?Q?ShB8QxT3GqG0ZUU4HiXci/Ztf7xKOQ2T+lqMjJdJ4LoMNnKSiXqedkbV49/M?=
 =?us-ascii?Q?y0J7AgHdogoShRhrK3BTkcOKrntxoMuA8ZkPhFC30GWrbq661CKQpnAnohhp?=
 =?us-ascii?Q?xxGyOXFSOaCtYatF5XmCxn48xiUgggzlMy5P0hhVecnUecWkV1prcWUvpCs9?=
 =?us-ascii?Q?yAmR1aGV71nkR1E0uz16/Jkiy5TUdwsUsSMZsjcxi8kN0p3pjHNrumeGDy2O?=
 =?us-ascii?Q?wg7A3UGkdYbPIroB1iE7ZUDyBBdYglOfPWwEmN73UrSrBQP7ww5/rD2pSYqA?=
 =?us-ascii?Q?7JSbT1NjJMggS6PSun2MqwvLFhTpMo47YENENvcS0/vI9oUlUN702wCOlxe6?=
 =?us-ascii?Q?mu/GnJbJMXYlzOdJcLeY+wQzLcIv4j7WVNpkGrIbxVJNPTFho0T2v7gAWnST?=
 =?us-ascii?Q?ZttBw7pkf2pkJvwCZbensrZmLKK00sOdrW8r8eXKOZfgGLba5Xuka7pFib5R?=
 =?us-ascii?Q?PpDbRR0HTIZZ8t/24Xq1Q/Mq+Fxb+xhcngDRUk5Fs2lrSYTq04U4ZzLm9qWE?=
 =?us-ascii?Q?nR8agqmB63GMBYi899SCQcWqn8/9Lz8Zm0Ekfdso7cpCbdgGkZsCrnbopqls?=
 =?us-ascii?Q?D+zxvKRwrYOs+nLKv0pWGBmcZVXAA8JWJQqOI5QuILVtekLcWZeG47OIG8WV?=
 =?us-ascii?Q?n6qtKnIVctD/ugpWuENaYwIT7qTgX8qQJVngP24p8lIPiCna99zDAk7KGczW?=
 =?us-ascii?Q?bDywUNwoYf/hzfbIKv/30M9tKdJP/3OwCmVZO8J2Pymp3h1flmJ4RjV1TgKP?=
 =?us-ascii?Q?KDJuMkFbxCvRaSuHhPuX5TUf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41240ec6-c1b1-402d-0cd1-08d91604dc9c
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 11:47:18.9378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PNyGRP2s6bj6m4TmYH3Lpn6AjjFmAGSKcb4wNc4QYV7k05ijF+UlSo6kDHwONJ2FjqhOkduJUhZXpohtSFHbsOMxAr5q2QEhTReqrn5AB8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1351
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
 drivers/gpu/drm/xlnx/zynqmp_disp.c      | 166 ++++++++++++++----------
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |  15 +--
 2 files changed, 101 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index c55e24412f8c..a82bc88a98aa 100644
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
@@ -542,92 +569,98 @@ static void zynqmp_disp_avbuf_disable_channels(struct zynqmp_disp_avbuf *avbuf)
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
+					   struct zynqmp_disp_layer *layer, u32 mode)
 {
-	u32 val;
-
-	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
-	val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK;
-	val |= ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MEM;
-	val |= ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_EN;
-	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT, val);
+	u32 reg;
+
+	reg = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
+	/* Select audio mode when the layer is NULL */
+	if (layer == NULL) {
+		if (mode >= AUD2_MODE_DISABLE) {
+			reg &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_MASK;
+			reg |= (mode - AUD2_MODE_DISABLE)
+				<< ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_SHIFT;
+		} else {
+			reg &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK;
+			reg |= mode << ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_SHIFT;
+		}
+	} else if (is_layer_vid(layer)) {
+		reg &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
+		reg |= mode << ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_SHIFT;
+	} else {
+		reg &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK;
+		reg |= mode << ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_SHIFT;
+	}
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
+ * zynqmp_disp_avbuf_set_layer_output -Set layer output
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
+	int val;
+	struct zynqmp_disp *disp = layer->disp;
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
+	zynqmp_disp_avbuf_output_select(&disp->avbuf, layer, val);
 }
 
 /**
@@ -1030,11 +1063,10 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
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
@@ -1051,7 +1083,7 @@ static void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
 	for (i = 0; i < layer->drm_fmt->num_planes; i++)
 		dmaengine_terminate_sync(layer->dmas[i].chan);
 
-	zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer);
+	zynqmp_disp_avbuf_set_layer_output(layer, ZYNQMP_DISP_LAYER_DISABLE);
 	zynqmp_disp_blend_layer_disable(&layer->disp->blend, layer);
 }
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
index f92a006d5070..dad3e356d9ab 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
@@ -120,23 +120,12 @@
 #define ZYNQMP_DISP_AV_BUF_OUTPUT			0x70
 #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_SHIFT		0
 #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK		(0x3 << 0)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_LIVE		(0 << 0)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM		(1 << 0)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_PATTERN		(2 << 0)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_NONE		(3 << 0)
 #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_SHIFT		2
 #define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MASK		(0x3 << 2)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_DISABLE		(0 << 2)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_MEM		(1 << 2)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_LIVE		(2 << 2)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_VID2_NONE		(3 << 2)
 #define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_SHIFT		4
 #define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MASK		(0x3 << 4)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_PL		(0 << 4)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_MEM		(1 << 4)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_PATTERN		(2 << 4)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD1_DISABLE		(3 << 4)
-#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_EN		BIT(6)
+#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_MASK		(0x1 << 6)
+#define ZYNQMP_DISP_AV_BUF_OUTPUT_AUD2_SHIFT		6
 #define ZYNQMP_DISP_AV_BUF_HCOUNT_VCOUNT_INT0		0x74
 #define ZYNQMP_DISP_AV_BUF_HCOUNT_VCOUNT_INT1		0x78
 #define ZYNQMP_DISP_AV_BUF_PATTERN_GEN_SELECT		0x100
-- 
2.25.1


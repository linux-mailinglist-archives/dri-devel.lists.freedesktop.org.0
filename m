Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608493875B8
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 11:52:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1DC6EB18;
	Tue, 18 May 2021 09:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED026EB18
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 09:52:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHwww/bP2YBPaLLShsGdZ5W9lDtjH6z/Sw2kIe1FhG9zOO1wDlRrnSJcuwIDlG10thwBSTME2ltfAVunNfGZN6QTWKl3dXEMuNqpJ5i9ImGbFeu+Ut6HHoydNNTRAa942bz/RwqQwjN7456oCmF5lQWWTtwmbsMcjWYY1Q1x4uqhOd49+evFavQG1CehelnqXc8wZ6teLkpSF3zYoxOpoLnpUTxFo2Xr0QYqmaiq3F7C+S4RXhRmW0/9d4SPkVo9r0naWXa2OQEjBTSkLMAzHDlUurjXWwGqd2eLiwwtBn1m2YjF83lSVGiMp2SBc7eMjXXI/qKi5fk1FeGuRThRsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpLMGnRiM4QTatSPLhHZrQ6zkkFDM3we1bXF5Wg4DJA=;
 b=D3R0xEA6PtIPh9dsoZ/voP257+3HyXvpMxVpz0vo0dnTRemvwRQ0FsX3WLQZV/kKr14v4vZ0Xp4nycQLcdkwmWrFivb3X4NSF243Jv41TzEjk4bVXlJbIWwe4KGP4IAyUwUoIaFS8zxdLYWapJ9b4jWDI8TL2R/PzHt8yS7spfrdsjgxRzIGQ/cqy6lIWdE6hZE0tfBSHBhLjMzYVYAB+nsqG41NqBjYXNZ0OraPZ0Q0dkkZOJ+1iUrWPEnYTiOflYvcJVBTnEljkeayI+NfrqJpn59/Lf1qV4nwMqJwxdgSsy8zM6Rjr1/ycuhi6U3udLXBeZXYlzwCK76THr7xnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpLMGnRiM4QTatSPLhHZrQ6zkkFDM3we1bXF5Wg4DJA=;
 b=Exee+QLOf3Fq8wu0ktC7dLtyxkhf4r/QHRfX4FlCEYC4cjgzus5430Jo1af5s+hG9rp+YMInmXtcllUBtCizq1n9Kz8VcF0eCic2AIh8d0lPkR7h4qAAeNIQwmu8OdBskLL4PMCmaqILs6Dw+OA1a4aqyzDGsu2ChPURL6hWoAA=
Authentication-Results: crapouillou.net; dkim=none (message not signed)
 header.d=none;crapouillou.net; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0075.namprd11.prod.outlook.com (2603:10b6:4:6c::16) by
 DM6PR11MB3082.namprd11.prod.outlook.com (2603:10b6:5:6b::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.26; Tue, 18 May 2021 09:52:13 +0000
Received: from DM5PR11MB0075.namprd11.prod.outlook.com
 ([fe80::7cf5:4b57:4804:20bf]) by DM5PR11MB0075.namprd11.prod.outlook.com
 ([fe80::7cf5:4b57:4804:20bf%5]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 09:52:13 +0000
From: quanyang.wang@windriver.com
To: Paul Cercueil <paul@crapouillou.net>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@xilinx.com>
Subject: [V2][PATCH 1/2] drm: xlnx: add is_layer_vid() to simplify the code
Date: Tue, 18 May 2021 17:50:18 +0800
Message-Id: <20210518095019.3855369-2-quanyang.wang@windriver.com>
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
 15.20.4108.35 via Frontend Transport; Tue, 18 May 2021 09:52:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2111573d-4606-49fe-8147-08d919e29cc9
X-MS-TrafficTypeDiagnostic: DM6PR11MB3082:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR11MB30823550A7B5A2F1C9EB5DAFF02C9@DM6PR11MB3082.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m2uvKgKvvlVWK8Inok69DG/wGrA7I9sXv9BdmczEjH0mlDu53CL96x96xeLy+bk5xdgmWBIjbFBqkKGasVbVFQ7ferr9JFRHCASxCxKKgRuEQ+y33jk/cQzUt580nu+MKlROgt8wbO/HD32F3G6tG64nLh8xxWW6066+6+O5wYXfKnwE8KV95irU+VeJpSq4y8ooloSz/zWMRQnu+BLYRrDaMpGged5uYKYkdx4ArcVWlB6dNgYlDvIholL7M954rNlWSlO2NYRR1zF7s+NVUDY7q0Yy7jhoZus4z4nroxQvjqZMy0kHYhsHAx2ZAIc+ns6pai3kWv0WIAoEDo/7wY7f8dKAfnxkYBBkX9B/NVtyrOoo2DGtD3sHkfYrCqU+mEj0+8yPHigyUDYk7mtBPm4VPzSujmhEsqpirwu6y5iFDMKanzbLd+IwW6hy0B/w0iAokqM8pZ9g3hhmJQehUD2glP9kjx4Rg45hSh7YTZ7ZA5sEzwtr+9oz3F+cU+hxhRfiCkdW2cR8MdQ9jRBy+QGMXxQzyYZIuhQBO9nhDO5+zEmaitAn+ewe+WprfjYqXc09xx7ppRuNc/l3BrlArN0AQLGaLwwYRUr9NVze9ZGIFDLD9G8mCcYLUoSgNSkzuxBKs0VLeOsLNxeRUUYi6gPT3oCRIHH9H1NJ86WkiKQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB0075.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(396003)(366004)(39850400004)(66556008)(52116002)(83380400001)(66946007)(66476007)(110136005)(38350700002)(478600001)(8936002)(5660300002)(38100700002)(6486002)(316002)(2906002)(2616005)(6512007)(9686003)(186003)(956004)(4326008)(1076003)(16526019)(36756003)(107886003)(8676002)(26005)(86362001)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sYv56vXyakjx9dSvlpjJb5YiFp5jX7S0QCdBLKo6baEXWfFClI0Y2Wdr5EI/?=
 =?us-ascii?Q?qDpFwi57uB69t6ZdQ+gmz4Ab4bxY7pFawLORctqqd/tSlOAGPeCcZZALMxGr?=
 =?us-ascii?Q?feNwPG6Muf0wIOuMCsrNbzx+EzgcandsiTIwmDdsz7ASB4iKU1q6rLLLPm9M?=
 =?us-ascii?Q?F0B6fhxdrmDPy4XR48w0DKo2c7B5cLw7GkONBLohmy4Q31N/a6r9pL4VRYSo?=
 =?us-ascii?Q?XrDIqc4o5EuINBaWlEEK33UzYb/4kuUheOd/oMr+03KVw10FVE0LIgbNBBZc?=
 =?us-ascii?Q?NS0toI7Od6W2ksVlkbSM+gDkSLn27/NooPvynrnzeF3uWy3usDggW5bS1OHt?=
 =?us-ascii?Q?8ZYjjv15nKZECLvrPCqj17O7w6SuaaPG8aOqPET0xRXGdqlVwG9iHXDyVwT2?=
 =?us-ascii?Q?mt3iNdmhz5HHokKH6lscDAFohafDbhqgrFE7Jr9aOKuzuPaEqFvm8995YVRl?=
 =?us-ascii?Q?Uc0CAtuoj6EdtzMEIueuByyHLpvAg85pZCZbEeeLYuUirP8rvXJNZfGDl7DD?=
 =?us-ascii?Q?Hie68XMvCvYlpPEvssOMiXcQ4V6umvuarfh/w9YJk17zem82JFIjVA4qU+FU?=
 =?us-ascii?Q?tARvShe5daoQGn3UW3ptdkgRGn/gZuncezZKy3C6CZtvMm233kAfSvudRU2H?=
 =?us-ascii?Q?48DdemvVlUPdoj4b/H0xsMx1nhpfOhkyXBwReBht4xd/MVdrIv1zeKB0iYc8?=
 =?us-ascii?Q?9+UkNGggHHDmYwzff+zymMS5FE8TuqcRTg9irXXqMLmbROAsfKe/b8dqjuzZ?=
 =?us-ascii?Q?cWwnk8dKmGNh3BLL1qWjnvv54FqPl/PpwWRF61uAszhUl5Ywdq6Tfw28JSSH?=
 =?us-ascii?Q?RQ+w0bJAVLQFrcccbh2qnEN6blU/qBvbDk9J6CJezuqA/j+HWnVruWqoC5s+?=
 =?us-ascii?Q?cxi6N66+casXAApAIgiKLkHd9fYY3Gmb7l9R+ojVJyS71UpSNQpVJqPc9TJ/?=
 =?us-ascii?Q?xz5rvVGKb/8J83y+ZuOVkE02XJwinrcT0quJNyzGz6bEufBWNgzKRIky/ES9?=
 =?us-ascii?Q?VHm9u2DLfeomzNboDAqkr6zDlB3we22lEAmHBjaK7u3mxuwCgqJOeJ6JOVJF?=
 =?us-ascii?Q?5awXL/ppjOP6Bpaq0924wEBfEt2v84alsgCArL+/Vwoic5pjmweMFQpdupb2?=
 =?us-ascii?Q?/tAnbDmCR7PQMu0qXAy75GMqYyAGkT4qMfaf3bbjGAzp939x8F8JNaSmP0Tw?=
 =?us-ascii?Q?QcK5u3DHAHyJNXNWIOmlXPFpc1kP+OXgDadMzrPCwzfPmM1RL5ItmQtbtM2a?=
 =?us-ascii?Q?2JafUk+UFf4ssAR763NsyK7IvnzW+2Enjcfiij3S0jlx8+d94g0RhRZzS5ur?=
 =?us-ascii?Q?SDpcE4ZNvS2Y9YrQ5MxdlRyq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2111573d-4606-49fe-8147-08d919e29cc9
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0075.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 09:52:13.4909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e79GLX7bY0RNV15mPjfqoGTu4mk6kSuwk8qV8JEXxO5DV4J1WRxtUv0HB/iQ59vLrWIOTqqihnftPifSgSDasELlBpnsQ6+vOGmj+azGxXY=
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

Add a new function is_layer_vid() to simplify the code that
judges if a layer is the video layer.

Acked-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 39 +++++++++++++++++-------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 109d627968ac..eefb278e24c6 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -434,30 +434,35 @@ static void zynqmp_disp_avbuf_write(struct zynqmp_disp_avbuf *avbuf,
 	writel(val, avbuf->base + reg);
 }
 
+static bool is_layer_vid(const struct zynqmp_disp_layer *layer)
+{
+	return layer->id == ZYNQMP_DISP_LAYER_VID;
+}
+
 /**
  * zynqmp_disp_avbuf_set_format - Set the input format for a layer
  * @avbuf: Audio/video buffer manager
- * @layer: The layer ID
+ * @layer: The layer
  * @fmt: The format information
  *
  * Set the video buffer manager format for @layer to @fmt.
  */
 static void zynqmp_disp_avbuf_set_format(struct zynqmp_disp_avbuf *avbuf,
-					 enum zynqmp_disp_layer_id layer,
+					 struct zynqmp_disp_layer *layer,
 					 const struct zynqmp_disp_format *fmt)
 {
 	unsigned int i;
 	u32 val;
 
 	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_FMT);
-	val &= layer == ZYNQMP_DISP_LAYER_VID
+	val &= is_layer_vid(layer)
 	    ? ~ZYNQMP_DISP_AV_BUF_FMT_NL_VID_MASK
 	    : ~ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_MASK;
 	val |= fmt->buf_fmt;
 	zynqmp_disp_avbuf_write(avbuf, ZYNQMP_DISP_AV_BUF_FMT, val);
 
 	for (i = 0; i < ZYNQMP_DISP_AV_BUF_NUM_SF; i++) {
-		unsigned int reg = layer == ZYNQMP_DISP_LAYER_VID
+		unsigned int reg = is_layer_vid(layer)
 				 ? ZYNQMP_DISP_AV_BUF_VID_COMP_SF(i)
 				 : ZYNQMP_DISP_AV_BUF_GFX_COMP_SF(i);
 
@@ -573,19 +578,19 @@ static void zynqmp_disp_avbuf_disable_audio(struct zynqmp_disp_avbuf *avbuf)
 /**
  * zynqmp_disp_avbuf_enable_video - Enable a video layer
  * @avbuf: Audio/video buffer manager
- * @layer: The layer ID
+ * @layer: The layer
  * @mode: Operating mode of layer
  *
  * Enable the video/graphics buffer for @layer.
  */
 static void zynqmp_disp_avbuf_enable_video(struct zynqmp_disp_avbuf *avbuf,
-					   enum zynqmp_disp_layer_id layer,
+					   struct zynqmp_disp_layer *layer,
 					   enum zynqmp_disp_layer_mode mode)
 {
 	u32 val;
 
 	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
-	if (layer == ZYNQMP_DISP_LAYER_VID) {
+	if (is_layer_vid(layer)) {
 		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
 		if (mode == ZYNQMP_DISP_LAYER_NONLIVE)
 			val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MEM;
@@ -605,17 +610,17 @@ static void zynqmp_disp_avbuf_enable_video(struct zynqmp_disp_avbuf *avbuf,
 /**
  * zynqmp_disp_avbuf_disable_video - Disable a video layer
  * @avbuf: Audio/video buffer manager
- * @layer: The layer ID
+ * @layer: The layer
  *
  * Disable the video/graphics buffer for @layer.
  */
 static void zynqmp_disp_avbuf_disable_video(struct zynqmp_disp_avbuf *avbuf,
-					    enum zynqmp_disp_layer_id layer)
+					    struct zynqmp_disp_layer *layer)
 {
 	u32 val;
 
 	val = zynqmp_disp_avbuf_read(avbuf, ZYNQMP_DISP_AV_BUF_OUTPUT);
-	if (layer == ZYNQMP_DISP_LAYER_VID) {
+	if (is_layer_vid(layer)) {
 		val &= ~ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_MASK;
 		val |= ZYNQMP_DISP_AV_BUF_OUTPUT_VID1_NONE;
 	} else {
@@ -807,7 +812,7 @@ static void zynqmp_disp_blend_layer_set_csc(struct zynqmp_disp_blend *blend,
 		}
 	}
 
-	if (layer->id == ZYNQMP_DISP_LAYER_VID)
+	if (is_layer_vid(layer))
 		reg = ZYNQMP_DISP_V_BLEND_IN1CSC_COEFF(0);
 	else
 		reg = ZYNQMP_DISP_V_BLEND_IN2CSC_COEFF(0);
@@ -818,7 +823,7 @@ static void zynqmp_disp_blend_layer_set_csc(struct zynqmp_disp_blend *blend,
 		zynqmp_disp_blend_write(blend, reg + 8, coeffs[i + swap[2]]);
 	}
 
-	if (layer->id == ZYNQMP_DISP_LAYER_VID)
+	if (is_layer_vid(layer))
 		reg = ZYNQMP_DISP_V_BLEND_IN1CSC_OFFSET(0);
 	else
 		reg = ZYNQMP_DISP_V_BLEND_IN2CSC_OFFSET(0);
@@ -1025,7 +1030,7 @@ zynqmp_disp_layer_find_format(struct zynqmp_disp_layer *layer,
  */
 static void zynqmp_disp_layer_enable(struct zynqmp_disp_layer *layer)
 {
-	zynqmp_disp_avbuf_enable_video(&layer->disp->avbuf, layer->id,
+	zynqmp_disp_avbuf_enable_video(&layer->disp->avbuf, layer,
 				       ZYNQMP_DISP_LAYER_NONLIVE);
 	zynqmp_disp_blend_layer_enable(&layer->disp->blend, layer);
 
@@ -1046,7 +1051,7 @@ static void zynqmp_disp_layer_disable(struct zynqmp_disp_layer *layer)
 	for (i = 0; i < layer->drm_fmt->num_planes; i++)
 		dmaengine_terminate_sync(layer->dmas[i].chan);
 
-	zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer->id);
+	zynqmp_disp_avbuf_disable_video(&layer->disp->avbuf, layer);
 	zynqmp_disp_blend_layer_disable(&layer->disp->blend, layer);
 }
 
@@ -1067,7 +1072,7 @@ static void zynqmp_disp_layer_set_format(struct zynqmp_disp_layer *layer,
 	layer->disp_fmt = zynqmp_disp_layer_find_format(layer, info->format);
 	layer->drm_fmt = info;
 
-	zynqmp_disp_avbuf_set_format(&layer->disp->avbuf, layer->id,
+	zynqmp_disp_avbuf_set_format(&layer->disp->avbuf, layer,
 				     layer->disp_fmt);
 
 	/*
@@ -1244,8 +1249,8 @@ static int zynqmp_disp_create_planes(struct zynqmp_disp *disp)
 			drm_formats[j] = layer->info->formats[j].drm_fmt;
 
 		/* Graphics layer is primary, and video layer is overlay. */
-		type = i == ZYNQMP_DISP_LAYER_GFX
-		     ? DRM_PLANE_TYPE_PRIMARY : DRM_PLANE_TYPE_OVERLAY;
+		type = is_layer_vid(layer)
+		     ? DRM_PLANE_TYPE_OVERLAY : DRM_PLANE_TYPE_PRIMARY;
 		ret = drm_universal_plane_init(disp->drm, &layer->plane, 0,
 					       &zynqmp_disp_plane_funcs,
 					       drm_formats,
-- 
2.25.1


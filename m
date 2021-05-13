Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D1F37F71C
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 13:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C096ECFB;
	Thu, 13 May 2021 11:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672356ECFB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 11:47:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJZ9wmeTc8oDzCVD+2POU6o3WpANjSOk45L0ATBnSvhhcy0amj1OQJE6fcqOdzKDTc/A9JUgEIO4H0kg7/LpOx/tYJFdUwUPQZ3CxIwicM7N1cEcp65GUfIY2E6QKpAcrV72N4pRz77Aectz7HyrXVPEoDI6a4Jjzjf8qvtRVIO3qW8rOwXtZbukstegNCLrZKmoJNlJdwm7Mlv5MR5RfIYC5cwoPeldXf6eHVXI3iDERz2WLhgJAeKQ0hW7MTEFOA4y/7LJOgx9/jSvvVOYl5pZoywbZQuo/CCsoAbnz+NTunbvRh8fKOw+h9WYvHUrIE1axVf8I5eGxOj5+ZGa3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1uY3lGbe/gw+QDrPFIacKpl2upGCk6k3uHi/guOlM4=;
 b=WtK0WD4DDkaw8AsygetJT7YJTV9Zn0P8H7annZXDI21jvg/9wcPdxlbhUHqO2GiFRtIkg6Wh3HXPgugNbD9C20ACqhjoEkOWjmp0BGuMr6Ude0noNI1XSGFOlSv7wGWPLB340qIHZfzWTnl+4+aeSnc/INOkZE5qYQ0xQXN4b97Fbjgj4MTSshfEf4JRrnSjBPUnTscZwUIBqSue0P63fP24pcSknIvmnARVPS99frgEZSR2eaXgJGVIaPUOWLOC7OF97JUcxxi9f8/c1h6bQOpFuOFIh0zNKCEp7XlL6Fdl0Et+/ZFGE0duzXd0CRSyG7lAr6GK5Yc1paBi4kaDUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1uY3lGbe/gw+QDrPFIacKpl2upGCk6k3uHi/guOlM4=;
 b=Ti0gp1SYXjr+z4F2DKvfrz2oqUWeFljDH4TTg7DHdVAmNPXdpIMUUa0kvdcGdbJzOQLP4GTwxCqP5OfBUHZM3iccphyv5cZPaPpVJJWRT64E9i2flDzGkTiLpP8BVX9zAxKo2KyHj2kzjTXx6pXfGrRpVqMaguxSWAzxF8sfh7k=
Authentication-Results: xilinx.com; dkim=none (message not signed)
 header.d=none;xilinx.com; dmarc=none action=none header.from=windriver.com;
Received: from CY4PR11MB0071.namprd11.prod.outlook.com (2603:10b6:910:7a::30)
 by CY4PR1101MB2344.namprd11.prod.outlook.com (2603:10b6:903:b4::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Thu, 13 May
 2021 11:47:15 +0000
Received: from CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::f45f:e820:49f5:3725]) by CY4PR11MB0071.namprd11.prod.outlook.com
 ([fe80::f45f:e820:49f5:3725%6]) with mapi id 15.20.4108.031; Thu, 13 May 2021
 11:47:15 +0000
From: quanyang.wang@windriver.com
To: Hyun Kwon <hyun.kwon@xilinx.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 1/2] drm: xlnx: add is_layer_vid() to simplify the code
Date: Thu, 13 May 2021 19:45:39 +0800
Message-Id: <20210513114540.1241122-2-quanyang.wang@windriver.com>
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
 15.20.4150.8 via Frontend Transport; Thu, 13 May 2021 11:47:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c9bc3cc-719b-4163-6af4-08d91604dac7
X-MS-TrafficTypeDiagnostic: CY4PR1101MB2344:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1101MB234463CBD38E2E2F3BC788CDF0519@CY4PR1101MB2344.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fShkNyx8iI9VXwDM8m2XGfdnyMaDD2PNZ5CfQy5sjp2Qz8BMsIG/k3BpeU20qbLceh8GApvQ/1DkLwpAiB+Gwlzck4mfpN8r4gruBXweLmu0IqpnmnSqAwTEH5l13a/fLelEu8CC+8Kjg6QLZjR34DfDHSY64r00NmdeyB3xDyjiIHZGRzA+AhdUgo7anAh83Ba6VVYOWcP9LGeLw8yNrzxmcSSQk2aeIgpbcDd3e9ZHJ3u/OML1IPJfgB0FEuBNlMs328BZRAKlSyYW9ofldsA58lgZulPMmbC0tMWdBJHjPeMREwze4n2Kp/TvcCYcElvNurRVIzOhKKoiWKtw8oenn0Bi9NAc7QqUQD41TRLwX2o4O9tV38bynJY3Er1EgPMJfLlkxFmZhXEkyHTXG8b2a20YpJ/L0Ln6G8eQR1yONdID1ZrwT0PrG0gabTTqs/InNHZswkEQWO5KUpVbW23Nc0v0PoqoEUZlk7TFMCzwTbkTpRGiynJ7qT3bMyXzEVS44uJ7+xyAmaL+RkncbQ7hXDLj39c8ZAYSsyPyfp2md9bzkRtIjdMZRkj03Vzuz6Bab3RjuiAO170i8J8xX5thcQjcSIblMK6VKyfmDfEnPks/1frO7fHTS6OtGIz0nNG23mh4wkSd0ovCKuuCDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB0071.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(39830400003)(136003)(346002)(36756003)(86362001)(52116002)(38350700002)(38100700002)(83380400001)(2616005)(6666004)(66476007)(66556008)(66946007)(2906002)(4326008)(107886003)(6636002)(6512007)(110136005)(316002)(8676002)(186003)(6486002)(1076003)(956004)(9686003)(16526019)(478600001)(26005)(5660300002)(8936002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0H+8R9ybWVJWTpe23DYYFWL6+9zEu3bFbRD9nS6tGwXXyLlrimHAEEaUTRzr?=
 =?us-ascii?Q?2HYhF9xtojmy1zShjFghplJ4FPq4gkElV2HRskBEsC1h8HiKOIghQW79BYzX?=
 =?us-ascii?Q?D7b9yMhkHvjc9/y7/MbpaGKGG/m6GU4Bl/dMRBvHDA7Nrn2eFn0zVAxyTJul?=
 =?us-ascii?Q?P6Hs0NIJYGP1EMp6FexYsH3OwLX2sDW0qJX0i33khsHtHETLHlxysdG75IEm?=
 =?us-ascii?Q?P7Ds3EuIkmLw8ng7kB3EN4S0ousr4V8jCAUkAO5XQL5PXrYDqimjs1QF3Xsz?=
 =?us-ascii?Q?qlMwY4Qpln6/V91YE2FKLlMrzTBSooqJ6/xgNdCIaUTDlFUY276J/I222AAE?=
 =?us-ascii?Q?p5jFI2Ba/ar230Wyqv+h8qrR4oaQnveBufBTRR0+D7oRWlKqLlzQkmC9qxLs?=
 =?us-ascii?Q?857Xs9v29UWXEb7WHmHe8/qvu/lLqbyh9t7r835yFQ/7n8yTaFEwvCyr1gde?=
 =?us-ascii?Q?3fQoDTKyYfXzNuj6fGJngZ933EXgkoH7HTSnKbPmQ+yOf4Y3eiq6wLNktBgP?=
 =?us-ascii?Q?TrF2AEgHzLnRhjF7oJFj2GmObV74RdtftHWx8y+t/e7QewSWYhWKdRPYuCzA?=
 =?us-ascii?Q?gtV3iUBellFPDzqNURvPTfr/Coxk8KwPWWxEl0b85wkV/kYBsT5n2HbtOtPP?=
 =?us-ascii?Q?LUyZjFeKsixcYN5V2ERl64LAkz4oTQsr7Wcib6zOg2NIelbgHGz0/GVI99A3?=
 =?us-ascii?Q?CnsNF0u5/gvhOyG7zXyuI6iEBX8A/pC3J4o9l4Nd+KFJLYbD15Q5V7Ba7dGk?=
 =?us-ascii?Q?HXTHgDgInn5UREFZzBPY0PeyINewe+Dz/w8o0rEIwI73Xyt1vYxj1BsxLPks?=
 =?us-ascii?Q?9grOZ7+9SYlp33V9knDrbJX0uNGBqO/QKXGZa2OGL9BDma9uXEz8j3h4Wk9B?=
 =?us-ascii?Q?nxhi8klUDSZqD39R0NiN+plrf87QZKkEnDEFzjOCQL8bOJruyemYnyp5VfIM?=
 =?us-ascii?Q?8ZblC+3DXjW92xR3sXX4Yls0tSAVz8fZj/pa+PVTJfu0ajOuXMUX/rqLEL1+?=
 =?us-ascii?Q?ooZLn7BKbzm0UuVlMSpdSB/xoaO8XjBh/pOMJwwCC/PoFKsUZrbGlKjQlSn8?=
 =?us-ascii?Q?yE9e1JmMraeSve5tPbYdA2Dk3ipSM3eE3GcgWJyarHAZasF4zQmPqKnXBRk9?=
 =?us-ascii?Q?lV8in116AtiNK2K1WeTwQTWCPI+Q/8etWaROuf3CLyk7FoD89V9ZM9mR22HI?=
 =?us-ascii?Q?VMtU+I4ETEQmrKzSiQHKCWZK9BUYAKa9Z8m24UAHPFzdlNihDOsaJyd3+Vbi?=
 =?us-ascii?Q?NzA2vXLvjhrqrpDZnKr/+9xO+BcZuiGCxyzO4O9fra7TUC2i4NDQvTh0KxVR?=
 =?us-ascii?Q?swf3GPrN+j759jQdnPn8d3Gq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c9bc3cc-719b-4163-6af4-08d91604dac7
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB0071.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 11:47:15.8556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jQdc0bV/lLPbAgRasFAu1/N7VgnvV+qXPB4sclznM3YDzIlFqVSDYr2F902di0/i8qGYgfmf2PtFlIK2Ui3+Ym6YS2FkDIhYEoqUiSGBV/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1101MB2344
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

Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 39 +++++++++++++++++-------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 109d627968ac..c55e24412f8c 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -434,30 +434,35 @@ static void zynqmp_disp_avbuf_write(struct zynqmp_disp_avbuf *avbuf,
 	writel(val, avbuf->base + reg);
 }
 
+static bool is_layer_vid(struct zynqmp_disp_layer *layer)
+{
+	return (layer->id == ZYNQMP_DISP_LAYER_VID) ? true : false;
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


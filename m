Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9190169A5C7
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 07:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38FD10E3F4;
	Fri, 17 Feb 2023 06:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F32610E3F4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 06:53:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQeraaspLZwA6sbVpIPgVP98luFSXCgJAPbhQDpuIQpf4DwFd5YBmyD2tWAlB1fj/FxtKjmGqVzCPMBIIOgZTfUPtJg/94VQEzAqwJhnTSthidpjvvjW/NjtLYmG/ZxLwA1CGXVT0fpXWOLMo0M4Bf7NATRQ9HoklVxNiIsoKAHTeLfHIVpOuz0CeCPeE2a0o2ODok7IfFFFITfTcTJNCO9e/5F2hImLTeBlNpQ0Kq9r1JttNklE19b4E7XEmBF9h1o+uGCt3W5YCd0lG+wo+hbPP1YsDSIKJy/RuTVKxwf20tTGsPSinK8UKn5ZEMhwWVLGjUPGHcxHbWjLYoJAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcTqDhdohyQQSQqHWgeTGMrWfiWKhF+XMgLvrmk69T8=;
 b=Fihk2ckbBpwHVEurZ+DRBM3pQ0KQHy9hRrOEGSZOTQxZvq35P1a+T9GMxJrBIsIa46iHYF/fMQa7n1np2xJ/6G9sH5KI5kILHo+r2JWaIzLLqzp9veGkeeg1FHpyfm5PMQ8I15J8jB4pylpa08pFvGY2dq9CKZkW3kqn3CcJ1FIuIwC1Tws5qiIUccw/6xFpaHHZ6jDq6g7ygIv6CDTxu7qjLrXK5HHW97QsxS9Gd5iRilrLK+lz0phMQydjrysR7QAsS0ritsFsVKxI0f8sulBmf5c/Or13SH6gbnvV3fHfguGn1zL/2IgjC3NzktGOcotrw6BvysO5H9gzCg5W+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcTqDhdohyQQSQqHWgeTGMrWfiWKhF+XMgLvrmk69T8=;
 b=sJbooNolrSPoN7aNE/+JlR/qiJ+Yr4b5bsnaMxBujWALES93TPxPD/2QMMsGB7cfxe1/PVdv9Vx+4G2vEckwNXrU82BJc5yD7qGeVDbA/MnatCwUlHJxkw5KELOJoOCjBcO2+sjJNNVOBnJM3zVHwx6jrPCjIRkJj1f+XUSnPR8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7541.eurprd04.prod.outlook.com (2603:10a6:20b:29a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Fri, 17 Feb
 2023 06:53:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6111.014; Fri, 17 Feb 2023
 06:53:19 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/6] drm: lcdif: Determine bus format and flags in
 ->atomic_check()
Date: Fri, 17 Feb 2023 14:54:04 +0800
Message-Id: <20230217065407.2259731-4-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230217065407.2259731-1-victor.liu@nxp.com>
References: <20230217065407.2259731-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e7d225b-29f2-4601-d0d8-08db10b3a74d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GCBfSAc8aX7dEM3D8lIKhstwsV0g5K6DhLMz44OHwldmIjq9va5kfg/YmwGm+jOF7ZsMvQo/9DJbnm/tGuJY9eRLir1G25aHhxSgS5NOkxZrJIKjgRDl8VKz9hVqAw0Py4TKjLvNuqBnWfpLlYm7KttBAoHIcad9kFWo8/3Q9aN330XodZxqbTiKxYQuKhbOV8ODJc8fv4ZxdzuWJgLq1tD6f9hRd3yOXxjxp/LhBfc9gPU0NHeN2po1q0zWcpq+pbzKZ1PVGieApD3QDN9cH706S6cZQ799VQc9moqi3GO9/QUwdTl0dMVgrdNdNiJ7ctRiC5q6On8nET07xG8RR3rjid4dzXeXQrQacdnlHG6KwBbEJS77ru7d7ghY9wvnhKlpU0r20pounWEOhGmJ693gMn4G09LxK0hMUsQlFiARwqF/79Ht9JLHFNfj7dCdP//8ZPK1tuYBXfYRa6Y7914oqQVEfRCibap0ob4iXT3TbGC2vlYvLQo9Mi5oSCR7PnyNNQiHTLH67y8RmEoQD0is9NEVLFOp+NjD24xJCDhd9Q/iHTe25+dVfv9Y/2QulEfLAviRpUIbK4RbKgO0oQ7nS8v22Y+0VV8m4fyxPnVGkSvo2vidOWFcBQDd/MsMXn8C6vK5rxPV8aS+Ffh1/hM8gHAdENRUulXbJLz54jMRvz2uH35Rqp9WEZuC7qocoZ7tWYVqZ6lFG3DanbvdQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(346002)(396003)(376002)(39860400002)(451199018)(186003)(26005)(6486002)(6666004)(478600001)(52116002)(1076003)(6506007)(4326008)(66556008)(66476007)(66946007)(8676002)(7416002)(5660300002)(8936002)(316002)(2906002)(41300700001)(38350700002)(38100700002)(86362001)(6512007)(83380400001)(36756003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nSmV3REnQ66FS7I6kdtPbUbSwz+eZlCrFERDFVk0f+5NuBgUTIVrjFp8D9gV?=
 =?us-ascii?Q?5hHsCCyZ2KKOagg9ZR6JN9oeo9B3ZaFjJ4VXMOBjVmU650p2TdapCVzaZE/d?=
 =?us-ascii?Q?T7eTUn5S6QL8L8S8P2Qcr6w3uEroMYBZVhebQG6uhS5bqc77Z7lJW4MfTb96?=
 =?us-ascii?Q?8/HBuU0b91YAJSesD94qiaNkJ3LqyxT1Ivw40lRgfh6JMiei569BZHd13SKQ?=
 =?us-ascii?Q?t+GxUN64YvEWZg772ofNkY+9mF6yDh2/50LmQ32dU1Yf/FwFGAkUmv75M6Fz?=
 =?us-ascii?Q?PfvAQOOcmvsfUARz64pSHllLCGUFWM+n/XS1A9hNTX4JcGgO+K5dTWufpO/N?=
 =?us-ascii?Q?UIiH/9VVDX29ID9FkDUfnu1vKusECQhBZ0ivACA7FV+lZe/WDATB8yFHuKbu?=
 =?us-ascii?Q?zc4M+4XxOAK6jMTEW3ouiP96MLkmym3Nst91bD5Tgscu/7qUddbJGgjxPASK?=
 =?us-ascii?Q?HTaUMhfHNU0ZwTq+q0nSKa5tOl5X3rr9vPxU83xN58XkqR48jcyxlqqXPrUp?=
 =?us-ascii?Q?E4xM6R1PzqwddxSqGz3JVLP0iuWyq3cVE0H6yG9RLCRy0l+v2yBppXvFcg+7?=
 =?us-ascii?Q?75mxJtKzBCR63nh0Hp+eGp4PkKNw8oMHU5C0NUoHcGbN8dEAaszUUcebyKci?=
 =?us-ascii?Q?4qpXsiF8GWnEH+BONHu4uhmnojAne7oEybeU3ifPFseAyWzAED8NKRYYYAOB?=
 =?us-ascii?Q?1N9Lx0itudM8pdt7ZRdPR0GZ9aVaeyefIGD+wSpGcZRJ5YdvlMlLOg3WV2uF?=
 =?us-ascii?Q?mfUXkq717ZaZc6/bwAq3EJFi2YqIDuTz2QM9b5JHYHPIHOb+Utu/yfIbRiPp?=
 =?us-ascii?Q?JofSpInDyVIAwaFBxxgeIU10e8TBBLCuPZ0TIscKBOJ3PLuPahRVxy727Uw+?=
 =?us-ascii?Q?EzmsMx64dynsdMFa+8j8jFfK8pLlMMkojQWHvS6MiVki+KGzZZOlmHFAfaDE?=
 =?us-ascii?Q?FUQmV2kXUJlsbQHnptoWI6bVCfTCAICLCER4jmMY/HFLRqmhm9dWGlkjb7G2?=
 =?us-ascii?Q?J3wnVi58P6QyzSCwLnxMEuOgdJY/MKqdEEbneHD6JLo8hnEr1gudLSmzYEup?=
 =?us-ascii?Q?I8pCZV7FXKj4vUp2y0gFKoqxtV1+Uk9ZJztvcp619E4jMsNSguiGHWSig48l?=
 =?us-ascii?Q?+SLT6mUpYEUxHsQd1SKCM+ju1L4c7DLKksOD+ZHBfH7bH3fV5xVyb+k95kae?=
 =?us-ascii?Q?qilgqmEHU3YgWhfI9ETQtm8MXV2Olq99mqxwaF9FjW+KUBq26WS7WcrD6AUq?=
 =?us-ascii?Q?e9U9QGl+D2Dv8bOUPJ0i+CdJJxGnMeeyUGd65ctTtCe7wp1OElKcpG+hUkz/?=
 =?us-ascii?Q?CjqHWKBc6KzNIjbOoEuF+SwvixvaOkf6zElssuaClIkm4OzufxYet0hrQVy7?=
 =?us-ascii?Q?qRCkVjEb7KxuRkiGJJXz1BKmo7iIjq+UhqqIOWE/DXH7L7wrBK1FHSncDmwC?=
 =?us-ascii?Q?nuVIB/mrjmji1/Xd2eI7FRPzmYum2FvLJGlKnthkR7YdqbtOkcvt7su+bWEG?=
 =?us-ascii?Q?sUplLX6ADkUIBaIUf/3VAUJFE2MqPLbHvzdDklEEbC5JMqb9LH17uuHFM3WC?=
 =?us-ascii?Q?qjrjWqp1XVH09UEv9aQfp0aDMDNB/OtMjmGts0Sf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e7d225b-29f2-4601-d0d8-08db10b3a74d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 06:53:19.7017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8RM1/WYx8Dx+29H5gZsgHQkY6MLb9NKRjUsmIjyP4BwEmWSwg8kBHy1kArWHWE3w5rGkgVe8gOMK/sFzu8vJdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7541
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
Cc: marex@denx.de, alexander.stein@ew.tq-group.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
 linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of determining LCDIF output bus format and bus flags in
->atomic_enable(), do that in ->atomic_check().  This is a
preparation for the upcoming patch to check consistent bus format
and bus flags across all first downstream bridges in ->atomic_check().
New lcdif_crtc_state structure is introduced to cache bus format
and bus flags states in ->atomic_check() so that they can be read
in ->atomic_enable().

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v3->v4:
* Use 'new_{c,p}state' instead of 'new_{crtc,plane}_state'. (Alexander)
* Simplify lcdif_crtc_reset() by calling lcdif_crtc_atomic_destroy_state().
  (Alexander)
* Add '!crtc->state' check in lcdif_crtc_atomic_duplicate_state(). (Alexander)

v2->v3:
* No change.

v1->v2:
* Split from patch 2/2 in v1. (Marek, Alexander)
* Add comment on the 'base' member of lcdif_crtc_state structure to
  note it should always be the first member. (Lothar)

 drivers/gpu/drm/mxsfb/lcdif_kms.c | 134 ++++++++++++++++++++++--------
 1 file changed, 99 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index e54200a9fcb9..d46de433cd8e 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -30,6 +30,18 @@
 #include "lcdif_drv.h"
 #include "lcdif_regs.h"
 
+struct lcdif_crtc_state {
+	struct drm_crtc_state	base;	/* always be the first member */
+	u32			bus_format;
+	u32			bus_flags;
+};
+
+static inline struct lcdif_crtc_state *
+to_lcdif_crtc_state(struct drm_crtc_state *s)
+{
+	return container_of(s, struct lcdif_crtc_state, base);
+}
+
 /* -----------------------------------------------------------------------------
  * CRTC
  */
@@ -385,48 +397,72 @@ static void lcdif_reset_block(struct lcdif_drm_private *lcdif)
 	readl(lcdif->base + LCDC_V8_CTRL);
 }
 
-static void lcdif_crtc_mode_set_nofb(struct lcdif_drm_private *lcdif,
-				     struct drm_plane_state *plane_state,
-				     struct drm_bridge_state *bridge_state,
-				     const u32 bus_format)
+static void lcdif_crtc_mode_set_nofb(struct drm_crtc_state *crtc_state,
+				     struct drm_plane_state *plane_state)
 {
-	struct drm_device *drm = lcdif->crtc.dev;
-	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
-	u32 bus_flags = 0;
-
-	if (lcdif->bridge->timings)
-		bus_flags = lcdif->bridge->timings->input_bus_flags;
-	else if (bridge_state)
-		bus_flags = bridge_state->input_bus_cfg.flags;
+	struct lcdif_crtc_state *lcdif_crtc_state = to_lcdif_crtc_state(crtc_state);
+	struct drm_device *drm = crtc_state->crtc->dev;
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(drm);
+	struct drm_display_mode *m = &crtc_state->adjusted_mode;
 
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual: %dkHz)\n",
 			     m->crtc_clock,
 			     (int)(clk_get_rate(lcdif->clk) / 1000));
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Bridge bus_flags: 0x%08X\n",
-			     bus_flags);
+			     lcdif_crtc_state->bus_flags);
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m->flags);
 
 	/* Mandatory eLCDIF reset as per the Reference Manual */
 	lcdif_reset_block(lcdif);
 
-	lcdif_set_formats(lcdif, plane_state, bus_format);
+	lcdif_set_formats(lcdif, plane_state, lcdif_crtc_state->bus_format);
 
-	lcdif_set_mode(lcdif, bus_flags);
+	lcdif_set_mode(lcdif, lcdif_crtc_state->bus_flags);
 }
 
 static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
 				   struct drm_atomic_state *state)
 {
+	struct drm_device *drm = crtc->dev;
+	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(drm);
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
+	struct lcdif_crtc_state *lcdif_crtc_state = to_lcdif_crtc_state(crtc_state);
 	bool has_primary = crtc_state->plane_mask &
 			   drm_plane_mask(crtc->primary);
+	struct drm_bridge_state *bridge_state;
+	struct drm_bridge *bridge = lcdif->bridge;
+	int ret;
 
 	/* The primary plane has to be enabled when the CRTC is active. */
 	if (crtc_state->active && !has_primary)
 		return -EINVAL;
 
-	return drm_atomic_add_affected_planes(state, crtc);
+	ret = drm_atomic_add_affected_planes(state, crtc);
+	if (ret)
+		return ret;
+
+	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
+	if (!bridge_state)
+		lcdif_crtc_state->bus_format = MEDIA_BUS_FMT_FIXED;
+	else
+		lcdif_crtc_state->bus_format = bridge_state->input_bus_cfg.format;
+
+	if (lcdif_crtc_state->bus_format == MEDIA_BUS_FMT_FIXED) {
+		dev_warn_once(drm->dev,
+			      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
+			      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
+		lcdif_crtc_state->bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	}
+
+	if (bridge->timings)
+		lcdif_crtc_state->bus_flags = bridge->timings->input_bus_flags;
+	else if (bridge_state)
+		lcdif_crtc_state->bus_flags = bridge_state->input_bus_cfg.flags;
+	else
+		lcdif_crtc_state->bus_flags = 0;
+
+	return 0;
 }
 
 static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
@@ -458,32 +494,18 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 				     struct drm_atomic_state *state)
 {
 	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
+	struct drm_crtc_state *new_cstate = drm_atomic_get_new_crtc_state(state, crtc);
 	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
 									    crtc->primary);
 	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
-	struct drm_bridge_state *bridge_state = NULL;
 	struct drm_device *drm = lcdif->drm;
-	u32 bus_format;
 	dma_addr_t paddr;
 
-	bridge_state = drm_atomic_get_new_bridge_state(state, lcdif->bridge);
-	if (!bridge_state)
-		bus_format = MEDIA_BUS_FMT_FIXED;
-	else
-		bus_format = bridge_state->input_bus_cfg.format;
-
-	if (bus_format == MEDIA_BUS_FMT_FIXED) {
-		dev_warn_once(drm->dev,
-			      "Bridge does not provide bus format, assuming MEDIA_BUS_FMT_RGB888_1X24.\n"
-			      "Please fix bridge driver by handling atomic_get_input_bus_fmts.\n");
-		bus_format = MEDIA_BUS_FMT_RGB888_1X24;
-	}
-
 	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
 
 	pm_runtime_get_sync(drm->dev);
 
-	lcdif_crtc_mode_set_nofb(lcdif, new_pstate, bridge_state, bus_format);
+	lcdif_crtc_mode_set_nofb(new_cstate, new_pstate);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
 	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
@@ -520,6 +542,48 @@ static void lcdif_crtc_atomic_disable(struct drm_crtc *crtc,
 	pm_runtime_put_sync(drm->dev);
 }
 
+static void lcdif_crtc_atomic_destroy_state(struct drm_crtc *crtc,
+					    struct drm_crtc_state *state)
+{
+	__drm_atomic_helper_crtc_destroy_state(state);
+	kfree(to_lcdif_crtc_state(state));
+}
+
+static void lcdif_crtc_reset(struct drm_crtc *crtc)
+{
+	struct lcdif_crtc_state *state;
+
+	if (crtc->state)
+		lcdif_crtc_atomic_destroy_state(crtc, crtc->state);
+
+	crtc->state = NULL;
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (state)
+		__drm_atomic_helper_crtc_reset(crtc, &state->base);
+}
+
+static struct drm_crtc_state *
+lcdif_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+{
+	struct lcdif_crtc_state *old = to_lcdif_crtc_state(crtc->state);
+	struct lcdif_crtc_state *new;
+
+	if (WARN_ON(!crtc->state))
+		return NULL;
+
+	new = kzalloc(sizeof(*new), GFP_KERNEL);
+	if (!new)
+		return NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &new->base);
+
+	new->bus_format = old->bus_format;
+	new->bus_flags = old->bus_flags;
+
+	return &new->base;
+}
+
 static int lcdif_crtc_enable_vblank(struct drm_crtc *crtc)
 {
 	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc->dev);
@@ -548,12 +612,12 @@ static const struct drm_crtc_helper_funcs lcdif_crtc_helper_funcs = {
 };
 
 static const struct drm_crtc_funcs lcdif_crtc_funcs = {
-	.reset = drm_atomic_helper_crtc_reset,
+	.reset = lcdif_crtc_reset,
 	.destroy = drm_crtc_cleanup,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
-	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+	.atomic_duplicate_state = lcdif_crtc_atomic_duplicate_state,
+	.atomic_destroy_state = lcdif_crtc_atomic_destroy_state,
 	.enable_vblank = lcdif_crtc_enable_vblank,
 	.disable_vblank = lcdif_crtc_disable_vblank,
 };
-- 
2.37.1


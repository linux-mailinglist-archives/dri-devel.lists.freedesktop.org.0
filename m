Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33075755B48
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 08:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C5210E1D7;
	Mon, 17 Jul 2023 06:14:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF65610E1D7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 06:14:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdlRNXZCdiktnzgUytgUkXMYuFX/0rMVoL9zNT2H5kwGupn8nKxZEC3wety9Gycua9O4gVbGYOkaVkPfCMRk/OZVqtpG3+9+oNK3k2zarKitI3tBRlGzmKu8oexOQ43LkqhCsCLEEcRO/gnYZcWNZt9ZZabi6uuQTIofa6XPFKodiS8VEim2OhkacSqxu7KW69lRQTEHAHXW2Lz0MCBpsrQQDqWC7+yrvbKJeBdvntMM0vlaJBseiOwPJY8WGkYy+MyaARUhMCPN0Cji9l/gDipQxblRHeIULvk/2i6VaS+07GQAFJ974PPGwuzGape0EVA2nr/bpmzRuN/1AAoRQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtBGpIw+8nn8CYdE6ecYbiaiI2pxQc+iH/ZRZob4l+0=;
 b=U+10s3TWWcQbABAv9I233XJCdX3bI6wPr8UXx7oRXfM+oNVMdcrsnmnahOO3nb1tgspNJlp5C6T1W0vtIH5VPg6GpLoxnJVspLiUvOxc9Jb6T+QGPeBOu/EH5FeqqDt7mCVWG1+bukENJNKV4r2PQuq0Nu3UL4eCn/+4Ej7bOgk0oY5J4e4t4VfFs/zuMx121U+O9VVRYYJEj6C3xWLBioLGUlupe5gSJtJ5EdA0Bx1RdBcrpr+o2s8mI1YPnNAQZUm9Zxipxuweb003+dVyXebySDg1ScbtsvXE0SPIorIgeh78W8RAPCeul6p7nVjlPc3r68J5i7cweExljxToGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtBGpIw+8nn8CYdE6ecYbiaiI2pxQc+iH/ZRZob4l+0=;
 b=rVghk8pDF4Bn9dWn8nFm600R/t2r38WfCGAAtyFqBBY87rMg7o1MYqYer02ROUsn9anLp4kVd08SA40OzW14qXq56G0l/4i7O4s6Zf1///8OzKfwErtA7TWo6/DeYs8j6WHRxdqdDZEG/FtQ7OQwFvLarevKF6YK6LhulXvYqNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB9189.eurprd04.prod.outlook.com (2603:10a6:20b:44c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Mon, 17 Jul
 2023 06:14:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::7af:d8d5:d0ce:f68e%2]) with mapi id 15.20.6588.027; Mon, 17 Jul 2023
 06:14:09 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/9] drm/bridge: synopsys: dw-mipi-dsi: Add mode fixup support
Date: Mon, 17 Jul 2023 14:18:26 +0800
Message-Id: <20230717061831.1826878-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230717061831.1826878-1-victor.liu@nxp.com>
References: <20230717061831.1826878-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB9189:EE_
X-MS-Office365-Filtering-Correlation-Id: b3c59adc-d279-481a-3956-08db868d089c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L/o8znFX//ndvNAJbjGs0ob643BIxsfCZahkxW8cwKBxizJiXBRKqhgwgt/Tg7n86/SfBXZL1FyshnCTbI7m3GyDS19MqHSuQSqLjy7zr8KFKtvm5W6UWDo2AixMeHQgfnDxWcxCiE/K1d6wjNXH3++QrlOxCfRvDu2uB73swd3ynMDT3IK4xA3aLG2xF0fDvkApYNCuqouGqL6Ed9AZXmVoPBu6YpXHSp/O5u4wGh8ugREtwSpBQcK8IXCFIFI3c5SGJQ2dSrFbmstyimrdbHuUxwl573qG3qBuHsuMVW/8jDHSIF7iuAGgrix+a3hVF8gWoG/X7nkzz2cTT1PsDgw46oFanG8bMDI2x+4A00rPMJmsupVncVN5UAmn1+hJs+8aWVpIYwJAh3D3WH4Z8SYTgXezSOiAqmdhSLc0ZVeNhKyWTcsQIn77jbBXNLjx1CShQCt2DEpOT9yze8k/Qa6/XNaOzwRoouFpvpP/VoNm2h2vDI2/JKSC9FeqhHdWYiulnhe7cNLwYBTuYcFLFnGeZed59XdP1WfYP2EimhbPnfj5qCGkQ8gQ/h1yiwvrQlRBbM6TWMoCdjGWjbCS8JZE8XuXDWkhIG3fzA4k6C3UC341NPzgvkcfhi7jo9Ub
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(478600001)(52116002)(6486002)(6666004)(186003)(1076003)(6506007)(26005)(6512007)(2906002)(41300700001)(316002)(66556008)(66476007)(4326008)(5660300002)(7416002)(36756003)(8936002)(8676002)(66946007)(38350700002)(38100700002)(86362001)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K4YYUhFk+uqJa2fdskSzn/EGbamCOyzSJPqbhzHzI6h1Gr4GA0fYioCg44nf?=
 =?us-ascii?Q?FSRWiLbWEswSNVyD17c+4LIxM3gwLwk4qd9/uiecPPpwBymVdks1zPgRvicr?=
 =?us-ascii?Q?XRqM3hgUFgPP29LYHJrCX4P/cRrFcSvvWwEn2SoNzZthf0FNmMB8pOQi86M9?=
 =?us-ascii?Q?XiID8BNZqgV30uD08my4ofwHOvV7aCJ2acjcfLv6UlZkcuc2En0h8UgPvsQB?=
 =?us-ascii?Q?EU9XJbC01w7dBdUYC2GtSfKfRn2zJ7Abh6Ln/2aECmjh7ahBExTflU48ZzeR?=
 =?us-ascii?Q?Nx2Rms7FkjckO9XofZY4CW8pKdmYIDtFsILFHpc9lR6ZSDs4v3TpEvVXV7Mc?=
 =?us-ascii?Q?e8Ur2Qv/If6xe2+fSYM5GuxgcREJ8KWl8Vip8edZttXcZXWdUIrCBSiFei8m?=
 =?us-ascii?Q?zT3He2GCgrEP3P42Y11+8zxl5gYwcTKQmr3VGjLgkR4ADyJizOh1DX+JCMNl?=
 =?us-ascii?Q?qRmgItEf741uexU7wQyK94KG3K9NtX44E2KGSqOVE9GND4oxK+HImdwz7VBx?=
 =?us-ascii?Q?dq9S2iXJR7dY2v2IaIQJbE9qdqZoBuqRsb+e1nNdihEqEyLVx5kl0ktE0qSp?=
 =?us-ascii?Q?r/vY8GK0aq6FrB8o6sJl8piTU8LZt3qZOC70N69kkRm2oxniW18YxekhcTMB?=
 =?us-ascii?Q?np9uWdmHMdjEqipBw0naz6iyOYyjSczGWabvQBeAHaz7wme1bgQthxtDnYNi?=
 =?us-ascii?Q?cKfu4yU5RMKgLdLUGySSH62nWm82RMRb4xinycb8PSLM0dreS+CUu5b13ZZj?=
 =?us-ascii?Q?2xTDg0jOJcE/HNklUujaYtEYFGC1SLELmcWrcSSQPp9AZfit3lGblmX8nD0N?=
 =?us-ascii?Q?MUJDt8ALrHutoGkmjSUoRPRQQXsneN1p7dkpV4bNFKEs1ltlGRhQuKk2Kg+H?=
 =?us-ascii?Q?YZE9VZi6SqRPC+MQfD3EzWTgZfbT01dtrYHMNjyfiM2hT2eDbUW+ug4Mjjfw?=
 =?us-ascii?Q?sTk/0hKD3GyZrcUONxC+/otd3insTrTLmYh9fh1gFnV6eUr4CTHtxhFFT+iG?=
 =?us-ascii?Q?3IxdlQcKnUAIR/Yg4ARO9JAcGpplEeZeGEY3QP4cxesJMZC8ZqgeqpG2Egma?=
 =?us-ascii?Q?IFCQCF4tG6/cRjY+5jqX4gJAUbpOCdALYViYFyMURgzLnlgPS7DmIXAzsewc?=
 =?us-ascii?Q?V5TOQTuJM/y+Mi4QTo/P6bG+9Yn7u870QzWPeDjmwRQhle9dPG8vC7WNjq+5?=
 =?us-ascii?Q?RJGLa1E7PT025lypEMdgafdEeiHj13UeGMXeb+5yubwAQCx+1eixrlXuAmm9?=
 =?us-ascii?Q?6iNlGJg8aQy5tHdQS2b989xvp2iYlAroWa4yQ0FRoyU3zL+j8bEw2bvfFQ69?=
 =?us-ascii?Q?uwVNyuNq5bg7mM+SCnfpjW5+XrAXT0B2LdARf6tUEJl8CCVwoHfc5sH/6r8z?=
 =?us-ascii?Q?231WfUNPwLy5lUTrlbeGU5XZ9nNi0D8yRrxS6AqrnmKPS3vFb6OtRO93sgl8?=
 =?us-ascii?Q?8xRWENQq/ugwvf1ce9U1HUyC1YN/L+e3RGKeGDqUpCZtlZhqrdSyHwodffmp?=
 =?us-ascii?Q?yfwFqqUuHdCg7XBvusOQ0dK31geyysIf8IvZvXc/pXxuqW6IvXWPndMWtVB0?=
 =?us-ascii?Q?W7bWLT4wp3LbYt31Kr4LpoE6wESQIQDP1pyKgfTw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3c59adc-d279-481a-3956-08db868d089c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 06:14:09.8408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onbQ9aGU5MhGLTMxzTWC4+vBYpSL13g7Tn1eMhcHceytqo3peJL8SOu7PHmUOqfdotHGaGQTh/ZgxCY+bDD0tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9189
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, rfoss@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, shawnguo@kernel.org,
 s.hauer@pengutronix.de, jernej.skrabec@gmail.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Vendor drivers may need to fixup mode due to pixel clock tree limitation,
so introduce the ->mode_fixup() callcack to struct dw_mipi_dsi_plat_data
and call it at atomic check stage if available.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 14 ++++++++++++++
 include/drm/bridge/dw_mipi_dsi.h              |  3 +++
 2 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 8cd89a63b5f2..c754d55f71d1 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -571,9 +571,23 @@ static int dw_mipi_dsi_bridge_atomic_check(struct drm_bridge *bridge,
 					   struct drm_crtc_state *crtc_state,
 					   struct drm_connector_state *conn_state)
 {
+	struct dw_mipi_dsi *dsi = bridge_to_dsi(bridge);
+	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
+	bool ret;
+
 	bridge_state->input_bus_cfg.flags =
 		DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE;
 
+	if (pdata->mode_fixup) {
+		ret = pdata->mode_fixup(pdata->priv_data, &crtc_state->mode,
+					&crtc_state->adjusted_mode);
+		if (!ret) {
+			DRM_DEBUG_DRIVER("failed to fixup mode " DRM_MODE_FMT "\n",
+					 DRM_MODE_ARG(&crtc_state->mode));
+			return -EINVAL;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
index 246650f2814f..65d5e68065e3 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -59,6 +59,9 @@ struct dw_mipi_dsi_plat_data {
 					   unsigned long mode_flags,
 					   u32 lanes, u32 format);
 
+	bool (*mode_fixup)(void *priv_data, const struct drm_display_mode *mode,
+			   struct drm_display_mode *adjusted_mode);
+
 	u32 *(*get_input_bus_fmts)(void *priv_data,
 				   struct drm_bridge *bridge,
 				   struct drm_bridge_state *bridge_state,
-- 
2.37.1


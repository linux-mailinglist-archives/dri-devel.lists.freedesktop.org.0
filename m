Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F4C67AA67
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 07:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB92A10E724;
	Wed, 25 Jan 2023 06:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2075.outbound.protection.outlook.com [40.107.15.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA78810E724
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 06:39:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OwLmh6Ee5UmVPX/NZa4Xr8YR0UUxx6sGSrmtxNSvYdfOEXMDh1jOZZp3aqRsQlg0IKfB2XY9uAOLxbSuA2/0R3B9jIx56TMA1N3PWj/zIxfj5ZuovW/Smur0WQeqB6A3evM0KKwWCdkOtEr34DzCQHi3E4Xky8ZSecG2N5477JWwS6II8DH69OLfa3I4SxzfA4MC2gOGsEFjbxBtSbej4hDAVnoKyknBOEnHYzcdWfNlPn3cp8XDgAelHyDWUz9bvMmkQiTDMRpWCziUaGeB9dqezesaM5j3sRfyBajgZqTOCcyj9gYfY8vg4jNXT0Ekaycd5IyVkEGccBsI9CYSuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsC3lCnOTBRIwZzgatPgcp8D9BZ10Ds4TO6CXvwCmDw=;
 b=LZqT7IRRwhRtiMdIi3snMmft0QQSvbXv33cfB89w0Qc/VrK4oIwH9arOVhWrtSQywO9Fe2m9ibiD024vkehXeREDy62l5z1vj59Yz8WLkhBd2dmQPFHX9gJ4Xbs1msJB9SeOwUIEIsEupdN9JXzpCSTlkhYMRSPJPx6LzkateXaOoQnJmfMkKOK7oFVhZlVpVMp4DYBevfikqyWgdVrLg+4G9vnF+5t1JMLAsehk/zlz2DysJJjCk8uDjn/+xv2Dw3ZQIZVkjB8HtLiz6CPRhzHSVk11UoaDblIMeFdQ/NB7JAdulfBUxiZChqjH9m2Eyy/4dER8oTdgIPYVea2ocQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsC3lCnOTBRIwZzgatPgcp8D9BZ10Ds4TO6CXvwCmDw=;
 b=akvmUWP/y8jVzs86GyaxjNC75ndCMhE863iLdFRgRyS2p258jcsG5qh7rAt+7bNmtrdB/LVN7+tbz2dTnyUz03f61/A6oI4Ui1tYrXBoSO4XzH1rgWvLo3Z+DlruzeKOpqYR7FXlB9W2dxRPOX+0Bo6z0XCrRN3hx5mqdlvg1EI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9425.eurprd04.prod.outlook.com (2603:10a6:10:36b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 06:39:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Wed, 25 Jan 2023
 06:39:20 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/6] drm: lcdif: Add i.MX93 LCDIF support
Date: Wed, 25 Jan 2023 14:40:24 +0800
Message-Id: <20230125064030.1222121-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0073.apcprd02.prod.outlook.com
 (2603:1096:4:90::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: 79fbfe8e-ae84-43aa-c058-08dafe9ee364
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o/ZId+8V7mXWZTJ3oEtOyzLRBRwqNLakmFuC/DEVnLhWLvE6V5jpNpAMixU5U/JkhgE/BvPP7LkzaoDqyDayZfYttRLPYQuOMH+4Hn+Prbs64HhIKZ8G0UoeGmCB8SPZuDIb83Pj2HYgy5A2MkYIOD1TeXfenVDyULzxYo8DcydaWnjqoFSQbzml4u/9cKlfV1ygwoOuc49UP3GlVaZKUgwlfSKxw0OlWx/86FmcqJKbuQ59d3nKBsmy/RKI5tigV8yVm56qAwGSKQlVJB1ke2wCGN6Bz8CSwjgMgni1R/QMBiDspOGkkw/jyZUbE5xNZpBYML+8bKlIBQqzr92uyLTgn1V2FP3bfewbjL0gBdwkJioIeWMO+Q/qeIEOV1bpnMNsecblyrb4hV981opmzndFT1nJ9oMu+hof30Axn4vCzUKVefdMbrXZKksZb1TlWSzmGrnHERJktn4rXjaVSOhoIEasK06UvkqnolXVWNuNzhsHCiWrH2KGzihJxttgTWf4K3+Kay26LY/BZ9g0gamW9SviPQHyJXAJLS1L1H8h8v68cnT8zylGAPTTmMSEC+hT19yzzQ4sDxbQH4lVjViioCHqEmfHJK1qJiOr+FNiV3iIYFoBxdr+ZFY3sDXPCEjUAUfeEKuV86rtq16xATTHF7heSxZnn8H0koegBSl1LVZpsKLLpj8KkHjZfTpA/F7HH/trHDNQdBPJSbbpnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39860400002)(396003)(346002)(376002)(366004)(451199018)(36756003)(1076003)(38100700002)(8936002)(316002)(5660300002)(38350700002)(2616005)(2906002)(4326008)(86362001)(66476007)(6512007)(66946007)(8676002)(66556008)(41300700001)(83380400001)(6506007)(26005)(6486002)(478600001)(52116002)(186003)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IxFcdjHaIHTS7G2rD8bX1Zc1fPFBODZDfhi1FoiAf9Q3e7OsJyGHlxfm9KKD?=
 =?us-ascii?Q?5koFzaVaT5OfBxbnIkDlO2/zy/C+fdVnN2RdOf0gMB4C1+eHuV1K/mNldKRn?=
 =?us-ascii?Q?oXansBaqYxMo6Jnq16Bv6duk8PlQKoZpvLFHYG+D1ak5ZNbP61qTvpxW4Kad?=
 =?us-ascii?Q?C4XPceouWmIukJkBGIoBUfUS6l31TFQ16IO0ZmeJ3niDwCesuSqPXaACJd/H?=
 =?us-ascii?Q?6xbLh9vYZfNkicj7oEH5aGc8lljG0NJEUIuuT9FZdaTPKvoiNX6AeljJRq7k?=
 =?us-ascii?Q?a72rZvwnJ2cRJtzHaQEGgm1CsV0iCDZQgRuZh6QxYXfAyNjZcpKMJX69FkJG?=
 =?us-ascii?Q?D2eBj9DGOkl5MkuWoMXdBpOWQtIWa3l6Cn9WAOye6vHp+/PUUesGjwSkB4IR?=
 =?us-ascii?Q?Rpc//rb0kjWV7gGyp+YPKEoz2XO4cCubqz+ScQfx5T8mU2JBw20sjauFWd/a?=
 =?us-ascii?Q?lk+yRwjKaApkULJS1RtnUup8zBtfvQRAFusDGN6BhJrsV/IUH9miuauFLDQt?=
 =?us-ascii?Q?7vvFSJpzblAboq2sHQvxW7gpom06hkScDtwpMirawLzRb5+LHqGVxP1QI8St?=
 =?us-ascii?Q?oCUg/39mK6BsrTSZ0ab3goDFX+NuHG6uIvSqAgiChFIH0O8/RozgI1vvn+jx?=
 =?us-ascii?Q?OdqGub/t0jHT+lHHoV7+1HapYiPf/kPvUZBZOr5JUoIWhla3iOITWce2HFa9?=
 =?us-ascii?Q?bZIgyTCnvEfY06Y1QdRHsaiHHZeCxGl8eK5BQnhNfA7yiSfQ/3GjUVFyPHRX?=
 =?us-ascii?Q?0I9UCOODZ5cyyAdI9KKHj5oDUu4pFktmJJce0LDbbULn7SWqJhkw+qNWQjx7?=
 =?us-ascii?Q?df3OsviD5c74LAmXo2T3+XNRAWTCE3vU93twNXF6FpvVhtyEB123Em1hIfSI?=
 =?us-ascii?Q?eIIAiAwbdNvXFMkvJSDfZ1rTyBOi0gv0f+TXsvoFrgjZW/2W53uD00b8GKGo?=
 =?us-ascii?Q?HNgW99HS3PM5c6hP46XuqKtPLNgjF6pJY26ZQzJshuu4Qe3xJVOfNa9QscT8?=
 =?us-ascii?Q?2AEiE5ysfrX54YckY+K+/pS1YVyxNd3Ul7vG7C5MNAjsbCAEyJrRX4hnU6UI?=
 =?us-ascii?Q?cqYtVo+carUhUmM2e9HLcgYzDv9kDUM/cyDKt5IHrVKIwtQz84MAtYSq6TjW?=
 =?us-ascii?Q?5MKRuEPhFz6bSv7DbZmqpQwI6//+w2VaL6rTg1V+sp9xoG65/KZdUc7wz80R?=
 =?us-ascii?Q?iUHmUhjZrp3jWFBdTBmFovpTwUqIaGBt3ho3RIWjZLOQAgBBD3Y1guqdxyF3?=
 =?us-ascii?Q?gEg72/mFgs/n5jLh5Fvij7Q92oVKhagBAQx3LeOOyDJIMMdTVDVUkZQ0Hdc+?=
 =?us-ascii?Q?0m51EGG4rUHW8tPhpGU/aC7V0q+n0tO79JJlEas/VzGrp2FXKPndBXuTXw/z?=
 =?us-ascii?Q?8PUMY/XPEjuEYAufAip11qNZa4VZTbt+kbFJcLVRekk4/oVEnEvFVtW+VZ6J?=
 =?us-ascii?Q?fu8CIpu6hhtmiUrc4MEZUFK2PYTSg6p3N71/XBh51sIJytpdc0NJk5vNPRoD?=
 =?us-ascii?Q?9X18zbbWJgqKRvkOfhceoBR6pXco6L9wQbYmOZvZAkgC5lSfTfCh7g27bwra?=
 =?us-ascii?Q?k3zJZHVg58DUvz5WRJ7FesIn8GGaur++OThbkZ1K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fbfe8e-ae84-43aa-c058-08dafe9ee364
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 06:39:20.2946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6AhsI95VX3P6bNSMdxfK6f/2AcSuwXINKujgO9En/QGReYrnEnamIvOnxi/iHcPjUPmeRq8t7SdMsTXx2I8cfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9425
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
 LW@KARO-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch set aims to add i.MX93 LCDIF display controller support
in the existing LCDIF DRM driver.  The LCDIF embedded in i.MX93 SoC
is essentially the same to those embedded in i.MX8mp SoC.  Through
internal bridges, i.MX93 LCDIF may drive a MIPI DSI display or a LVDS
display or a parallel display.

Patch 1/6 adds device tree binding support for i.MX93 LCDIF in the
existing fsl,lcdif.yaml.

Patch 2/6 drops lcdif->bridge NULL pointer check as a cleanup patch.

Patch 3/6~5/6 prepare for adding i.MX93 LCDIF support step by step.

Patch 6/6 adds i.MX93 LCDIF compatible string as the last step of
adding i.MX93 LCDIF support.

v1->v2:
* Add Krzysztof's A-b and Marek's R-b tags on patch 1/6.
* Split patch 2/2 in v1 into patch 2/6~6/6 in v2. (Marek, Alexander)
* Drop '!remote ||' from lcdif_attach_bridge(). (Lothar)
* Add comment on the 'base' member of lcdif_crtc_state structure to
  note it should always be the first member. (Lothar)
* Drop unneeded 'bridges' member from lcdif_drm_private structure.
* Drop a comment about bridge input bus format from lcdif_crtc_atomic_check().

Liu Ying (6):
  dt-bindings: lcdif: Add i.MX93 LCDIF support
  drm: lcdif: Drop unnecessary NULL pointer check on lcdif->bridge
  drm: lcdif: Determine bus format and flags in ->atomic_check()
  drm: lcdif: Check consistent bus format and flags across first bridges
  drm: lcdif: Add multiple encoders and first bridges support
  drm: lcdif: Add i.MX93 LCDIF compatible string

 .../bindings/display/fsl,lcdif.yaml           |   7 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c             |  71 +++++-
 drivers/gpu/drm/mxsfb/lcdif_drv.h             |   5 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c             | 202 ++++++++++++------
 4 files changed, 207 insertions(+), 78 deletions(-)

-- 
2.37.1


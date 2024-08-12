Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059F594F785
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 21:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D85C10E299;
	Mon, 12 Aug 2024 19:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="nBiTdP1V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013031.outbound.protection.outlook.com [52.101.67.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 820CB10E299
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 19:36:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdUrOLd8XQpagxcpngo6pHVk+4UpvTMzFftin/39Yg5IKmfsTg3NW2uDepJWI9qfYrt7HpQphEOp6Blk75vKkhMKMYyQoFdhxumY9swdHK4ppGVEgSiZ2MOWnXQ7KyrSC5SgyKdUXDg7kE/MBt+03pTTwLlzCRBSq1JL1zplkqvEN/ocqgd+cVFF9O+AqJaJBYZuGhJ+Q6uSc4xp5ssCxNSzc8JkcQEcwO6Xi3ELKzfG6wCnjh+SpKniaWC9a9ZRWDNy0Kh6p0gv49di23JF27tzqQUjuVTQk6jRtvr9z1Rval0Z8xDAD6C8u7LC0hAPLPkZZZrXnwjuuuZqrs5+9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Au7rj0nZZAK3SaoPATblCyPZc96GE1gHN5yJ+8mhNNQ=;
 b=iBxHDf9xAHJopXohr96H9f40gOdbiSMvesimxW/Z5VUqg5fBeUwkTjS3XaH++322JMtICje/XdU8gWyLIP73hnKI9xZ4Nr9cc7nvmybi3ZYf9bWR4j/Nwx0FMWpb6A4LzawBM1kSfInX4vFPXTAPBltSWk0mDi44ij9sQ2mEZAo8ce1BNGYy9XAsvwDETt9Uo6RPHxB1AI5wEmrYK+fXucm2EZU5xkbICd9Q9QG+j4eU4Bb3JVmfni2Pao5b1fsBqfTlj1d1vWg//MoW1TJoMmhel+DY2aWz62ez0QP4O/FYZppXn1y/x71PgViTwmkwdFurURVvDsmjApMQbjlf4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Au7rj0nZZAK3SaoPATblCyPZc96GE1gHN5yJ+8mhNNQ=;
 b=nBiTdP1VxjCFTIiW7fH77f8F0t0XMO3ZHpE1ZX7E055TaH+tjSo8OZ+hju/cfccp8aUdg6JR803+Hw0WAV8k4F5qrRKrikv6SSRnzfFWJTCKCRJ4GOB76dkHFPpHyQpQuwUELo1YCDRw43POM0Lp6FNU0xfetinBnCv0Tkf/ZbWMapbK7N/dd9g6ySfRNMm5kXoJtamwPcnQ0MJlrJ+pg32MTd+13+EqBArUaFJvuH9+Ixjfwy0Vb/PjmcVJXfYRLM9ZY58IxVyyrPF0HSSmq9JrDpeFKqzk97ZKzpwDts0KQomQTm/LyCPJM5vDeujuH1dQVskZGBiGnPiJHalj1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9825.eurprd04.prod.outlook.com (2603:10a6:20b:672::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Mon, 12 Aug
 2024 19:36:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 19:36:44 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liu Ying <victor.liu@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: display: panel-simple-lvds-dual-ports: use
 unevaluatedProperties
Date: Mon, 12 Aug 2024 15:36:26 -0400
Message-Id: <20240812193626.3826250-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0068.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::45) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9825:EE_
X-MS-Office365-Filtering-Correlation-Id: 72851918-1ad4-4575-0d30-08dcbb0618bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|366016|7416014|376014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1iPoPY5G2H2XaUZCQwaJGUho+lS41Hfc/CCvW1LSBrWNEhSCTHTl9bckqcn/?=
 =?us-ascii?Q?jhz4mP00Rx5RB47+RMNqmGVmn4RHi79FDZF8NgE2+8hr1be/smDZkd0yY/gF?=
 =?us-ascii?Q?XqpqNEygToOA9mY9dolYIkUJiEalnb5mrd6hh/jN3SjqK9YHUmJw+crP668s?=
 =?us-ascii?Q?lP57WkBkMGKAEM4GIXcmlI2vaybFQrr12FBEOsLOvCC9EVEQn8UYUOiQtH4B?=
 =?us-ascii?Q?4a8KX0n3sQT0C+pVuprbubqMQso7D8vBqWGaju7CKe5XOzDgDg0EcVnTijle?=
 =?us-ascii?Q?2JM1slNjytPQBHK9GeU+SZnxpMw74XC6Wkzaw09XUGnpF2wUy62jSD8+/lpG?=
 =?us-ascii?Q?561f7aUMlZCGLEjGRyk8tXWi1rF4g1JfmGCdciExfxd452a0YdpVpBywkH5/?=
 =?us-ascii?Q?hPrc4d7Tu0Pggrgx+QkOphvIIkT1S66opyg9Hpqnm4a7FUMdkauMWR4TjKF3?=
 =?us-ascii?Q?X52EZ9M95QsWF9K8PNuqO4hymUO6qorc3JnRH03P49Lg9+byDlgnS04Jsk0r?=
 =?us-ascii?Q?qcHPjqmYPwLHtdI713Cq8D0IYfHcusVMB2EoUjPH9W30pGJ5dV+CrLk5ZyYv?=
 =?us-ascii?Q?Bg83GpjCvplweF+aJSVpUMLBxP+VelJEDtQ8RSchFLaAgAS9W1y3AseIrAyX?=
 =?us-ascii?Q?QhT5pfiu2/XqcgvLPkp8boErRRw5deGczD6cEupePadCIUNoyhWwLSIGFkLc?=
 =?us-ascii?Q?3G9nLcmLIwkQYOHNPFgeSHPGNeRbXnLwaVgZcr/TwDwk56uD8Rgr8VIa+IdQ?=
 =?us-ascii?Q?GW3dVhcL0m9AK/EqukcBsUhV4h24HN6w1QW0IRrdJVbe3lwWCWXGcl0ASZt8?=
 =?us-ascii?Q?b2c/w4Ben59OVGKBnkKilomJ4jRCs9zEJi91PMSF3cRNOjBk0pICJU4fjCRx?=
 =?us-ascii?Q?IQwaErDqnrUwbo1VHH4oQ9JHSaZ5jzMXuDwTwJVuZ+OVo3B9Xsn4NFBtcT+y?=
 =?us-ascii?Q?a2Ks70VFSbquf6uKxN49MRZZFeFgJP6tf6UlO8+aZTAnLF9oRwLD8b6IIuzk?=
 =?us-ascii?Q?4KYP5WfYKB5pXUOtnWIbi74ZpTCSsj6q67D2UVpJAKf1xoHAMxQwuyBJMedT?=
 =?us-ascii?Q?Z95BAcrFes9HpsLqesCoJh7iYk/t4QFD061/VyzbCMr2CQVBRZM6sHPWk+bI?=
 =?us-ascii?Q?pa9wf5A8N0CN4YZ94uAvhduJ/U544AEzlEIll+ih4ZZVVhsaxn9tzpJsWKQL?=
 =?us-ascii?Q?UKWZDe7osvbWSEjbILc88vxxDb9a66tltnaNMQdL2QjC1FvfxajEydK3mx6C?=
 =?us-ascii?Q?TDVPfiCbzVH8H6gj+UcxVcAjv2mGw/yqm6cRaxy+xZGTRBxnoqHrINcCk6nV?=
 =?us-ascii?Q?vucRTCFEjU9/VMcUJro0Pbqdbaf8GYOGHG/c8Tx4N/u+q4ukwD78Wgp5fuOq?=
 =?us-ascii?Q?LSoGo9b6J5oKy7cB/lMZ2gR3Sd2l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(366016)(7416014)(376014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?72F/Nc/geXAgjV96aT7AWn9DHm98vMz3gXFL1Zh6tk1EPArVHKvJd+mfTuEv?=
 =?us-ascii?Q?/ThCDGMzxNF7uymPtNgFfA/KpcY9rNVQQdAxlZKCZyHcxdyBj+kPSS7K4Hus?=
 =?us-ascii?Q?WfvJs67x8Im3IQRPkpXttqA9Q3gZd8dMkZcudMePRYhopKNo6xvnoqSoisXb?=
 =?us-ascii?Q?lfuxM0CaF1e6Arg0Ef0wZRosn9K25DTQW/BEd9Y4AKGB8bkCt+D6SM0pugXU?=
 =?us-ascii?Q?lZFxnLbcd0X4H4xzY+OWI2ZD/oLy+GSjqRlcaemo0fZ1V5bTCzBPUWxK6hOX?=
 =?us-ascii?Q?I7CRw8qFPkwXdCX1KHNW/F5Del7PAZ/ZNoLsP7oD+1sbMUuTkzLTeK0gD+4E?=
 =?us-ascii?Q?TSswukhCs4b9qy0namLZZq3Axd9oy7/aFwvyoNyswhWp5Wz8Xie6++rAUJc6?=
 =?us-ascii?Q?uRV03S3zruQyjCULEeNVdrKBibDIrdcLnqGhEdTeseoQicGgAYLIWv67g1fE?=
 =?us-ascii?Q?tR0z0BCIaR0a6ZDoCbWSmuTQcXQ1zgRGMQ1InYe2r5uwQ4206bat90cJ8auG?=
 =?us-ascii?Q?i5mAzZh0OZgS6uKJ7I2TDCSp8vwtYY/LjqnLyjqWmtpFS6TJU1oRymRQz04j?=
 =?us-ascii?Q?f63Ct0pzFT8hNm905CaYBAmxVdnAWK912PPKfNdsvyU6KbA+RJ7HWnEH1iD6?=
 =?us-ascii?Q?iZiuuZkjhAYGkg96m/Rq/6LVK60u8dURbX8bc0gT8OuAeL4FwzpJz1FuroqA?=
 =?us-ascii?Q?HfutSD3M0+Ivu1tN8iePyAQI4d0bO8U6NSrjjaq21NIkk/dK5eI0TWBoFD0+?=
 =?us-ascii?Q?JuldmZMXq6BzaXs7TThnQMn7YOjTRZN7pma/RNBEup83vsJIYYWzKXHEnu3l?=
 =?us-ascii?Q?Pbc5glRaYBeAgi5kXHTEGMgquP8dZKqtLzkO6x+1Ya3wiyJHGel6veZs6yoG?=
 =?us-ascii?Q?cw4y/0aBU9xfCqaTr2sQjYxA1/Bx4VV6Zk2+E4/KDHHwH5PsCTWeD4HOaiDA?=
 =?us-ascii?Q?nNHf7L7oC+NA/EJKF5BYh/gwq9BER5R9HxxqyqM7LSbuF8vR5Bm53H+LXfxm?=
 =?us-ascii?Q?n3ldMSX+GzYLsQKR7COKKM+zjRGVxYbbsHo3zIrPB2RQloMbhbHdeddGc5vG?=
 =?us-ascii?Q?C4arJlGig8G/VuDhJVaAHfDRcExEWjaaeX52dt52XbEsTfbTYDBdFQzDZRHH?=
 =?us-ascii?Q?5IKzjx9ykzpvDBP8D6mopGPrboI3WXXWTn+4D3K0x+yxK0kgdnBf1uS8iahP?=
 =?us-ascii?Q?25fnWR3A3IyL9SuqLoiSJb2sPM4Clm2uVwIwXwfXBDM8F7e/RcZwByF2h2Eq?=
 =?us-ascii?Q?+iAYKAcMwjUBJ6iR+hO8L8oJ9ZlmiInpMLIux1dof3OhdjYMe7f4Ubnxg1Bt?=
 =?us-ascii?Q?NxWNEwALO73FLw7zaxOU2+CIkaOYvXl1vMt0Oye1i6Jo/2Hnjp13ICH1VzOf?=
 =?us-ascii?Q?wuVW1XJToPwd+18DFzdmoGvfzrSyPaR5VvjF4e12IM7BIEPStriklqAWd5Ww?=
 =?us-ascii?Q?vwbz8hYwEvV1OvElFM+Hr8o0Sxczg1GbWB53OAZQv0UiV7e6R950isW5CtCq?=
 =?us-ascii?Q?xS+fib+tnHkZmRkr/Bv061k+QawTkyuP+Gps9dSS92xsXv8aF7ybuPBboP/N?=
 =?us-ascii?Q?KTmR2fWYj4+OBCEwLic=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72851918-1ad4-4575-0d30-08dcbb0618bb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 19:36:44.1719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dd0TSIqRQEjWpYExYT3ZKF1wGg5jBSfn7LlUFY2ioJLZN2BEdTlTJvPMF3nkvGDlhvl/7ECak3fC1Ot2IUpFMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9825
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

Replace additionalProperties with unevaluatedProperties because it ref to
panel-common.yaml.

Remove properties (backlight, enable-gpios and power-supply), which defined
in panel-common.yaml.

Fix below warning:
arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: panel-lvds: 'panel-timing' does not match any of the regexes: 'pinctrl-[0-9]+'
        from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-lvds-dual-ports.yaml#

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../display/panel/panel-simple-lvds-dual-ports.yaml         | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
index e78160d1aa24c..10ed4b57232b9 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -84,11 +84,7 @@ properties:
       - port@0
       - port@1
 
-  backlight: true
-  enable-gpios: true
-  power-supply: true
-
-additionalProperties: false
+unevaluatedProperties: false
 
 required:
   - compatible
-- 
2.34.1


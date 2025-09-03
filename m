Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0760B41F0A
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 14:34:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4045210E7E5;
	Wed,  3 Sep 2025 12:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B12gxrBP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011051.outbound.protection.outlook.com [52.101.65.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B942410E7E5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 12:33:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DhagCQLwiUJ3AkY69SUlbN4naRk7ltSgl8GPB51qHmpHkyB35WIj0saajA1f5AbK1JzmBtnGSxgNSQOAew6lwe6kKmyVWv/10dXW7LMMp14P6IN9OIqruFj6GzG3v59Kt4w3rxp32jfV8s+Okuqs2McVq4+F34nTbe+dXD04DWS2FQM5fnyVTRaQpfzWL4Sj/x4LnTVWR9eT/9Exm4g08krQxHOLvkXtXKlcYAtIt12xcf04eGgRxUAfk12ZTV1HRhwAjnqU8Y5e92nCiQbyJ9dy9MaUNga8jXKvJH2tdXoV+GPrXbrFP8aNX6JyZpS1glYDr3I1Zrcn64/xFwY1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPt4MLYCAEQPYANek9L1QQlfFcs2JxPa21INawyIleQ=;
 b=WqRq3MOSxKFWR/ZDGo6HgEpkjBnkY3hhhhVfiR+Qbx4wCfqJ3RwBRx6nWx6sgX8c6XT8MMFQMzZ1rGvl2Gum3YbhjNRK4W2uGhwQnTinQP3wQmJ3+nNrHR+b+O3uil2IzqshOfTKd//BbbV05mXK5FoKGmAjerhStjiKA9Mkd+k7DgqHUl4fpLIpLZIJcZVeGmqJrfjyJX6eWOvD30loV2l6L9eOksnKCjaKrRqKw5+3dVdzvXgEQZaEvzUiyTQJjClnMMMCqQS26fRVzpePVdf6EmmwxIGUrpLnUFBg1KZC5xMedrdfMM6zvYFh5/8Sx79sjyLUH9M5R3JHcbnwFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPt4MLYCAEQPYANek9L1QQlfFcs2JxPa21INawyIleQ=;
 b=B12gxrBPcgLxgjQRDKzGaAt3IDiVHpShlvHCvdhlnOlpF5Javfw1jpC7POUjzEJy6ujK12h7Dt8rbbFDNqjXkK8ZqyBCjEEqmgb2rw80TWdANwuoJUq6M9VBQt3zzklsVNQNZkHZWIDQSntTsVP0AAyCLcN1RCgdvLz47f/s1e/eKADiA3ULLNBo5kGsUrgWIt4xc+//rTm7tVsteOazCXhj49PhWY/1aJxZufmT1nh63zOOpIYDjI3FFNj44WUIkkSG4SGWLWrGCaHnV541Z1EDtnfv79Dx2drAF8LNC6h6ZL7hW+9O+Nqvt9/O+Fxy28n7QYp5+tNUD/7YZlVluA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DB9PR04MB8233.eurprd04.prod.outlook.com (2603:10a6:10:24b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 12:33:55 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%5]) with mapi id 15.20.9094.015; Wed, 3 Sep 2025
 12:33:55 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>
Cc: Frank Li <frank.li@nxp.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/9] dt-bindings: display: fsl,ldb: Add i.MX94 LDB
Date: Wed,  3 Sep 2025 15:33:19 +0300
Message-Id: <20250903123332.2569241-2-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com>
References: <20250903123332.2569241-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P191CA0022.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::13) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DB9PR04MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: 23706a6e-029a-4c0f-ac5b-08ddeae62561
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|19092799006|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pDQi4zFs/CLGS3oXIx1xNqrRkhhVH1tSQ44HSYBq7LhNq+XJSiF7f+pLpi2C?=
 =?us-ascii?Q?uHTW4IALVxOd91Rs0DILmEgRsI4nmanRx+eko5rjspPv0Q6f6bihFis4Um2Y?=
 =?us-ascii?Q?aY7isnvAbQFdl4Gg4eAUFKDq1poTZ3yntG3CL8BoQJc7aYepBI1Lrm822fuU?=
 =?us-ascii?Q?kG6/5pFzPFpXrrsW/mlGb7X21Khwqrucs1IX2riwCBZVeDiaaVBxiJtYkGHn?=
 =?us-ascii?Q?upyO2dnvMDcQziF6ArLqeGHpmBYP/5eGCb473QeePaaXdcMdHnTWypg4BxXz?=
 =?us-ascii?Q?He8OFBS+dZU/xkMvBjtx4q6X98yEQS+BpHAXVn8XtnURrM8R4o1NMVYd3U2A?=
 =?us-ascii?Q?Wxd2gJozY12nSLPSUzm/n/KSsI55DcqIEIdFXKrwlbgnnR8qOn0ECgu89BNn?=
 =?us-ascii?Q?BOHlnCD8pIofkL2WTWSJLSafKoFvpfJS4URRHHb4G+zuru/1BJv3Fq9Yd7bP?=
 =?us-ascii?Q?byILHP4OU0WqoluDU6HvZCmNZYnw6v6YlFUJURdDbh0BD1RIWzyaxKghe7ZE?=
 =?us-ascii?Q?nFXuSCC5bN5q7T/bww9rJCSW5ZKWlkyDx6E3RC0P69E6yWcnIiSnlchwaKu9?=
 =?us-ascii?Q?32EsTj4UsCGgkixBgAIQlhjXNl78/i1YoT5luTlLppTk9xPpKhLz1Lw7h7fO?=
 =?us-ascii?Q?nDDc7FLOFYPtqX1IRbe2/gJ9Em/l67QfeLL8UTe5t3TXsudkGpew9xto1/pv?=
 =?us-ascii?Q?bb4hWdB3CcjseYvubOgcIc1YS+M1m/Ith3MQI12LX6dyfTk0Xr5TbT0uOfM3?=
 =?us-ascii?Q?FkPlP8FZ+5wczbxI80VVxahHeMYs0hPsiwlhuhp5iDtUeORqw3MgSTE98pK2?=
 =?us-ascii?Q?/LZzY1VbJZCYiggj7j1KPW1jPB5JjHMFrMaLcJEciXMIDhBglYmumbUH+TUB?=
 =?us-ascii?Q?l2HxU6ypNEkVx93cdTNbniTNt+69tOzPHA+weaU4eDUSqzaMXbEMIARlfeqi?=
 =?us-ascii?Q?mSpcfGS7rPs+lb5iPRVsMMdfPvbQPwdvjBWws7b8uaX/PIJlgnMa7FYbZnAg?=
 =?us-ascii?Q?niokaSgD1uBV4DZixl21pEuvtmwjrWuDgiWGgqEatlgwYoz7ViblhzjPIU1/?=
 =?us-ascii?Q?ISnd5+8cl563YGDtAOBecXPciQrw2qsNNt++4d3gX1wYxTwP5N5xtMdIgewr?=
 =?us-ascii?Q?So402HOzfhQNwgTQ1iNfOVytxvPLUgDLyUSWCR20dQgsTW2q5P4Ew3bB7YWc?=
 =?us-ascii?Q?KWF2Mi8Bv9j83X3UI78XWeKMMsIg+dkFydCateIEuvEbM4WqoQdrFYWYZY1d?=
 =?us-ascii?Q?GRkBsaSh0DU1cyEJC+jEZ4lpDLkzY6TnJ/C8iGDPzURdb+V39iuNGORYSxyT?=
 =?us-ascii?Q?JFJkn6302kQAJPUyZecJnEpMGEHBMBMWujjyV4pcy0DELfYGJnJMDXTV5MTz?=
 =?us-ascii?Q?NNNh+yENNfgPZTNBP7S3c3BInrPAq7SA+vVJDIvzRnintG3Q9UUt5Uo/ADHx?=
 =?us-ascii?Q?x+SKwmMn6bHRUZhHGfWLYkroLDQVAl23D/IAmDLBSwE68DpHrvzf4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(19092799006)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KoRcyIZwE0+bZ/071zH7QaVP/Smfa7oosik5Wpn+IMrpqkEjfsGYZp5RbjQC?=
 =?us-ascii?Q?80xVKCW+v6do+GZvoiPM10z/EHZeEIaDnIkHoRp3haA/gxhpn0LjD2QG0Txm?=
 =?us-ascii?Q?FEXlpkTcaVBAkI2UQYAZM69GumWmdc6gFiNEV6l4KMx7UWdLfckaeM3GgHBd?=
 =?us-ascii?Q?CQL0JK9RSbJmRqfIHIWU1l5+CEDfnmAUIa/L68B2DHfZbtpPq8r2VTwNIdRj?=
 =?us-ascii?Q?UwlOB1lZYmjU6Z8vOhvpGm+TtTXXEQXke92hstzXJUK5wspYATs7BXatm1U1?=
 =?us-ascii?Q?9/vvUt47pQapjsyB6knHMplhTeaS+qDB4NSXsGI8Q/emSAbhv14mURJ02Zq/?=
 =?us-ascii?Q?6Sa/l3T59i7oXtWb/yk01ZSkjBTH1MrSSjtGKq6UA9E+Qh3glzzJVLM8oygU?=
 =?us-ascii?Q?qFOkiSknud4C6fbGIhbsOOj+FR2S/lH9bPN34WBWcGfDKUjiz5+lSFdOBSCz?=
 =?us-ascii?Q?VWetx2oWV5rC5/LhcwfXHSlWWyim3W6AWTI4nxL1WVu8oIj0ijr1yfVpEedX?=
 =?us-ascii?Q?NT1uITWaMDxim2HQYJn1oZp7RpHPIN40+pIS9yMaqZCVbfLTtf98z3DZTR0i?=
 =?us-ascii?Q?gRGmzeikIOXxV85yWQ4NFvfMiVQRQMnqweoLCInuO6uQcLoTKIE7wB22mqrO?=
 =?us-ascii?Q?Mpw7AlGrnKshZAU+GrzZYymSycprA7SLEKmusNEe5awDW0ryJeGA8QVQ93OJ?=
 =?us-ascii?Q?1bzNGfuFOipG56aXpprXuv5tV4QGkwhuanxqNnetVGZjTziiyyhSM7UvLr+X?=
 =?us-ascii?Q?pPSdPzufYZm1rnnGvsbps91Jj5MbWqyXqeum/mQ9ShqG40mODboX/xHR78kw?=
 =?us-ascii?Q?0SlDHKuUzkl/T6xHFXjOpW2I3QE4qor9WCvvSj1d8c1GKwyOfemWKN24W/qB?=
 =?us-ascii?Q?sFV6wwNp1bH53ENw3TRiXYibd7JGJMR5hSa3TfmkVVm4sn395kaLy8PWsZu/?=
 =?us-ascii?Q?EDIs/Oail+mJNiqr0tBRf0PUbUNrVOivRfIFsIXnV/TpuosTbxDIjUwIM+zW?=
 =?us-ascii?Q?h93WZDen64NnLyCTd6x8brzvdqKWfLpGzkptG1HHLK14rIH1iXDUPJpfJlvr?=
 =?us-ascii?Q?THMqMoMWPrPGa7ZMbipixGDRLp3NWVA6KzmssZEgXiw7o3flCkmTZCG+GJgS?=
 =?us-ascii?Q?viKCvnzPauBdJvTkwETKskQHdWDORi8AZMMdTibwv2LfYOrhADr8bXp5MO1U?=
 =?us-ascii?Q?882DbN6Lrorny+7yAXsAf5OfVqMq5+9AJahHi7kCrUdVz5koX1koePPv6/Sv?=
 =?us-ascii?Q?MiAc4qAHtfLvBWA6GrVO90AJQHBZNNB5r40AmbGB6DDeQ+1jNUTApocuSJcz?=
 =?us-ascii?Q?a4F3a4ALrwgZSiZK+G+Q7NRr1eSIhzxUtZaW9Q865LoNNWBwzuoRLH+qgm+O?=
 =?us-ascii?Q?wqNxwore3hnP0w16p4KTk3WIdB0Zhs6LtF3/RL/1pUBK2A67Sn9ErDLrpzHh?=
 =?us-ascii?Q?H7AML1XLxv7Q8JrMvr6L+Mt06vykWog8eW8QLse1VRZtxwVFtyDZKHrQNpmx?=
 =?us-ascii?Q?xiwpd6oieJ8JpkeZiQyn0He1kz1MCuzwSrbOLwK38pQUpPUmiLZw4TwuyvPQ?=
 =?us-ascii?Q?4XKLnzEQ9tCCgVSlbJQet7mjPLER7NksOVerGPr/f/Dy5yQxNxHF6FIntq7N?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23706a6e-029a-4c0f-ac5b-08ddeae62561
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 12:33:54.9444 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wyxvd4MqvlV+hmKe5yrDzbz4bwdNaArvoAcwNzXnGWNS8eMeG8GrQAHprMQ8Hwy66E1iOU+B0k3+C7EujbLeLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8233
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

i.MX94 has a single LVDS port and share similar LDB and LVDS control
registers as i.MX8MP and i.MX93.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 07388bf2b90df..a54b8f1478049 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -20,6 +20,7 @@ properties:
       - fsl,imx6sx-ldb
       - fsl,imx8mp-ldb
       - fsl,imx93-ldb
+      - fsl,imx94-ldb
 
   clocks:
     maxItems: 1
@@ -68,6 +69,7 @@ allOf:
             enum:
               - fsl,imx6sx-ldb
               - fsl,imx93-ldb
+              - fsl,imx94-ldb
     then:
       properties:
         ports:
-- 
2.49.0


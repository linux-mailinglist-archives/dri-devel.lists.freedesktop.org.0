Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C91119544D0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 10:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A18A10E5E0;
	Fri, 16 Aug 2024 08:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="TbwJehM1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010053.outbound.protection.outlook.com [52.101.69.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEDD410E5E9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2024 08:50:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTP2ywvMqs/VmEHzKQIAlGFv/+NLeofFIuzkj6v1ICWJOOwGpYiaEEbN113lC5dU7H63rx5/7mM6EGYNTnrNqK6LL+Tt2a7+KdFp3PTQbkigT3YBJHOTGx2W0aMDuRq7tnEc2u+/tCt7Hv5eFejejA/uEosPq5b9kcBcOmh0eraAYvY/yPfkVfo2hzTfPheJ+9uU9Gdd9xc6JasBk32hz1uHONkLdwCgVPenjk5ecGJ+QnKK/BlkxlxlYjw8Rlmh3Rt/iPrOBpGVcxfVhwNX5tSCOBK/0aAMDoj6YQ6IfxFHXrgdN435UeI3KcSsBPdyVApCa7Iz3DsOGdaokK7N9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQ9CuOsSqxYwbNnBYn/LGhXDEmEvkI3CtNq2vOMc5Ik=;
 b=rMNqq4e7H+i3x6N5hOLsw8WVfw34VHhbqmKuJMXG64uIGJ5TfmiCrxXI5wl2E1oWscj9k1I3QozMxapUpPoejIzX4fFi2lc7fCVyY0oeTIOZDxqONd3pxx0dTHkbT60JNvDTCyowtkHmgt+RMFgA3YaaO+6E1QqjEO3O1F0WAeTJBbEIOEiTOYNOicWLTMKuK0ZMxIaoYlp4Ar9IRzuDKzokpK9Rzpeh8UYMAMF3PfBiSHEv2tAQJuG6T44xdR16hwt4EIOVISe9YLbp2lVHvcd3ebc+PR3lsNVxkOafyh8uVjJc6kwi31UVXOm2ywO9j9IdeUtQzqWOwb49hBrjVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQ9CuOsSqxYwbNnBYn/LGhXDEmEvkI3CtNq2vOMc5Ik=;
 b=TbwJehM1RcYpQXo/egZpFWcWYiEKUB96UMbGBB1OZ81Y4O66P2clDpYGlsjdEJqhBctLpeELQlB4CAUJVB39/EHcu/GIuF79hU4P/XY7+2TV5lUnTORTIcwZc87UUVvZFZFc81aUsBzApsNPXFw1zDMIyiIEb8I7VJgRdCM8PGMQOA5G3E9tU9g6EaysXIA45cE8uiCzBv17+YjNVJA+qzdBuZ2MxZl5DP7aVTsNxhDdvv3dIB1KRGRjR7qv8tn+8/qKe3TBE9WcgArwkgiqVkLMRPy3ImhcEoiRnKDd1ilrKJ3CsLJVV1sEomc9ZpOkVMWGdcc4nOiefpsLXhZi8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB8571.eurprd04.prod.outlook.com (2603:10a6:20b:436::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 08:49:58 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 08:49:57 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org
Subject: [PATCH 1/2] dt-bindings: display: panel-simple: Add On Tat Industrial
 Company KD50G21-40NT-A1
Date: Fri, 16 Aug 2024 16:50:03 +0800
Message-Id: <20240816085004.491494-2-victor.liu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240816085004.491494-1-victor.liu@nxp.com>
References: <20240816085004.491494-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: da275a43-5272-44dc-99ac-08dcbdd06803
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6yEkF+5NiU4BYCWm9AuPQhB8ZqAZNCe420qSgvHY4LBS/7XL8E8V1vsMn/1T?=
 =?us-ascii?Q?dzHi78hpg3vn5WpF4J6aWYGGjZ+Qh8q9UKWrURzftK5nZ7buBKpJGTbScZvE?=
 =?us-ascii?Q?OU4b1+srlQbyLpTKcARWxbzXfUPPg4C50L900mJ4A19IkZCPR1MjXhveeBTA?=
 =?us-ascii?Q?NJxn+2s7uU+93+QGKNM3o2B6l9pmbSiSb3Ah2YICoWLi+ejcuhouZVPZiS+f?=
 =?us-ascii?Q?YTSot2x4Y3uKAWsGY4YyL2LPI/mEwLHqfJneWgewennJQlemKDILslbh4pxg?=
 =?us-ascii?Q?h1DGhuWdR4pts+V2NLIc3NS6bwVs7aBJMSouHJ6xV2tTDgUVHH3/hlw74wjI?=
 =?us-ascii?Q?8SY3CVqxf5AdY2m6lEWxhDbCf0alcpegba2b1PtKQYdm9chryZsuzNUh09MM?=
 =?us-ascii?Q?LlhJOrb56lCHsMyEKYbQo2PzeQ9oC0R1Aq6grXyiQSUZi98HNsQ6rgmOhgFa?=
 =?us-ascii?Q?Yg22q9tTuSUAA24qQDiWRN/LdHPl3ZGRt+Brz9+yxEN/hgibmAgbs4nffAC8?=
 =?us-ascii?Q?AMfUbEP6F41vBzUJ4m8Cj5zB4fDDCtIX2xmVqI6zcvrmiSXOmE8ywLfogfDH?=
 =?us-ascii?Q?uCQWAyN+Gsf0ouMr7jeE/VybXhF4PLpJvjaUkjoM5WlKROZV66vuGFyogGel?=
 =?us-ascii?Q?7s+ou5+SDva4get/AOwN2MZkYZ+bjNmxqESzk39CzWaiNOocvPfR7sT634Td?=
 =?us-ascii?Q?PIKM5iM9BcU8X+M4LGCAvzGDZ2NdfdT+zsdytSjrxJwXqT7lCdNd2rY5InJc?=
 =?us-ascii?Q?UGIw6wRQViU3/bfGcvvY+MLJQYCuBsIwmGK3GcW9M6RwVj8CkTB/Zt3TeDkO?=
 =?us-ascii?Q?C65o0j6Twik5bIOQ0H1YBLASzh9Fe5QYsQp4oFTOzzhNdgmAbfVbPB5ssCOg?=
 =?us-ascii?Q?HPIxm3BOu7PWuMC7ySLIyD3SHMrIebG1GOX3tddUI5qpxL3TySRwHt3Wnigq?=
 =?us-ascii?Q?Z6N+INDo3hBK9iZS3gh8IXAyGasTff9RFoyB68HZ2GfEPnlT7CXmsJZVowHM?=
 =?us-ascii?Q?gEz2rgDhRm4VCS3YBSojqFAnN/Nsnq+Ddvs4rFxQl369wm+/jximXYD8av3k?=
 =?us-ascii?Q?K8otmRMav+MQdTn8H5oAgHSbPS5CtIdaGTCUm9q1bBySVBLx6Z3B70vjtqtv?=
 =?us-ascii?Q?2SkdETsnCJdWado3BAsD0M/ITUa/q0PqKA8CGxz8ECApqnJ4LVwySBatc5O6?=
 =?us-ascii?Q?wSmxgktb2QXFp7oCtjNA8P2XPPYcNJMUTcU/OSZAaV6Z3QRn8eHJ2EqzMSwv?=
 =?us-ascii?Q?CwsP/3FVGIKRoXNEEG7DMnYEfFswyOcdYwGBTQa7XmwIv64EQ0w7c6Gfs52s?=
 =?us-ascii?Q?XYYkbHpUs0D9xMwK57CKXnRVuACwltcLNAvVgLZW1LapwtI7Gm0Q+KViPRQo?=
 =?us-ascii?Q?b49+76Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(52116014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6ti/7kkLgOBTFYh2glFBqk9a3/nUrGnS4Zr54i77a6M+O/XwgwdjTSwXxg4f?=
 =?us-ascii?Q?V6tGdZxpGsX2Npol+LY3akNey0zpnc/htAFJRxA1vBaObNyzV0CuKdekCQw5?=
 =?us-ascii?Q?405fDQMekParMY/2q1cgXGkZsrKX77gh1s0MeB6L890Br0RqzBMtfaqdJFso?=
 =?us-ascii?Q?tMkn26lP0rLf0WOAO04RrgLb2DHI00CXqrFooMvqDXoy0vHHY7UD6D87Jdm8?=
 =?us-ascii?Q?DC+V92+rrHDXf3pPMb/34WWXyhxE70rWJRBz6Dy0FSjMVp90NniHp5CQ0IRP?=
 =?us-ascii?Q?/PVz2OypuImWz116u4f1Ph4QSff9aNx8yw9X/qLWbTQCV7o97k23TMaAYscj?=
 =?us-ascii?Q?4Hz0ZewTpHsppXYSJN2Dgln2vvxGhsOGlzCBEVbVuzIJQyeFkCBOhkUjUOtM?=
 =?us-ascii?Q?3beM1/dPJJtPFckmA3RZFEmplC9T6HV/g17nRm3QuZnmXv+LfEJF4CL3RSUK?=
 =?us-ascii?Q?tw0Lcnj4kKP94V13E44cvx6y6O6q0NL48KR4OriZ2ScNgJ58Ny8GCwbbH8Uo?=
 =?us-ascii?Q?KkBsq1I9RF0FA4S1o7dUx5/3G2nLvs/XEni17kg2/2zSCubtQ6EUBrEHr62p?=
 =?us-ascii?Q?rg2sH6/9bIAUKKy35KC/SlTK8ECxMuAXfp6bWDsPN7e/5ma7nizxSLSbhCuy?=
 =?us-ascii?Q?aeqAmCzN/KQoZT/XGmvAQSsLYx1A2n9KAtF1HeNSpZ8PmneiWG+al8YoEoze?=
 =?us-ascii?Q?v71+htlXdo/ELHK1myqDrNuY1bZJbzKRSaBh+wVY5x7TXtmIJR6/TMklMggQ?=
 =?us-ascii?Q?Dy45VscRtoRgpuAM7GICLMQaiHtk8QeoG8CSQKfyhEtdp18HWVH4M7Tn3hvL?=
 =?us-ascii?Q?JBZQgPLd5FiT6X34IU+B8Yd5fs2GXILaHDcBckQZuDHxvWGMDL/iTEG1ojUE?=
 =?us-ascii?Q?H0LDRyE44KYAHg2LMsmLk7bQ9SSyQYQBspQagkg11lc+YAIsfQ7wOfzkd5Em?=
 =?us-ascii?Q?hakJ10s2yX5CKUKRliBO1QJthXGnUp6vXX209WyPDy+bOaAM6jLMFveEkC/F?=
 =?us-ascii?Q?vozdg7K5FgWqsFdUVqFeYQP/beGjHFgFDYSl8uxzs5ZAufPsYyDBhRnOZRyg?=
 =?us-ascii?Q?6u4wMz7uvB1LeStwtEuizLi1lul7v64cZ5/sr6NcWsTWtVPol3AdRwhQH/1u?=
 =?us-ascii?Q?dBMBSQROifDV0S8SEJrLIh2VeVPK1EDJHs5viN4fTAXvWpf4G7LYuPIYLcW8?=
 =?us-ascii?Q?fp4j70FMWfeiBISc4fqRXheYMfgWLhaoAr02B81S9Trqd20poWktRr78GFgT?=
 =?us-ascii?Q?W5rQyZw+H13Yu/pMCSW6OVytvUIOUgm+ZYVvg6bUe1VskSl0/V3j8mt6ZPQA?=
 =?us-ascii?Q?YZHVJr90fY1QcWx8syhqD3kBhG45U1Oxo9nu/aC69QMV3ZoFYfVsvYQel7X9?=
 =?us-ascii?Q?6PQmGDrukHPWFE9Yr+LxCeELEJ+RiFhn09bSwaeeigb1S0M3lByovelvCSCT?=
 =?us-ascii?Q?1QFBnyYLlk4IiWAM0G7vndYDXWlRA8gr+BRjm9Xiex7OSLvhCMZLJKioZ+Uy?=
 =?us-ascii?Q?Hd1AVFBpjVlS49/A/VfU2LUjtzjPROPCkkI7/2p1+pjNJjBZAnAkApq1CeAc?=
 =?us-ascii?Q?UlJpgQRMTfgSTp0uQ7njGx9y56ctvlSIklKv+8La?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da275a43-5272-44dc-99ac-08dcbdd06803
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 08:49:57.9287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBqKlGPDcbiMZGl1b90XRI5EVZr1mHQ5AjOXdYT4rdngOdyT7UYy2UVoBWXZsLISlgYDtHM00v7t5EiUIRGQZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8571
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

Document On Tat Industrial Company KD50G21-40NT-A1 5" WVGA TFT LCD panel.

The LCD module specification can be found at:
https://cdn-shop.adafruit.com/datasheets/KD50G21-40NT-A1.pdf

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 8a87e0100dcb..c72a13b70efa 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -222,6 +222,8 @@ properties:
       - okaya,rs800480t-7x0gp
         # Olimex 4.3" TFT LCD panel
       - olimex,lcd-olinuxino-43-ts
+        # On Tat Industrial Company 5" DPI TFT panel.
+      - ontat,kd50g21-40nt-a1
         # On Tat Industrial Company 7" DPI TFT panel.
       - ontat,yx700wv03
         # OrtusTech COM37H3M05DTC Blanview 3.7" VGA portrait TFT-LCD panel
-- 
2.34.1


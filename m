Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569BF676CBB
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 13:17:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E5B10E0BC;
	Sun, 22 Jan 2023 12:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2074.outbound.protection.outlook.com [40.107.8.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60D610E0BC
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 12:17:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DN7Dct9M9Qd7kulUOpdNaA6xyWAwrwSJ4NNhJHxSlSbe0TuOBfGLVE8HP1T/H2Hz6EwQ/ebxcpx8UnBq8V0McB1UlvaYpWzwdIb8diqVJFtEdNFU/+jCTtEMHY8AH6Y8pNEtPt7lUkvFUHhKsBLrj1PN2/nPLu8a/ButhwgmBvQkNDdJQS4Vbag0Xd6k6JWvAe/PRydYR0pB7sq+kLklwRRwzc/SD42hPM4mDoBPPWaF2oukDZhU/Fw89HYhMvOyZayUESUubgxdBiw85i1WqyqJjhTZbaqpMtFESrpzpLTlBNpaXtFyenoIPPwZQva54stlqVVY1vyNwVqyIBiglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJ2BTxNNDNOfKUWBFH6ZYXHmd0Z4jvQhxlZCXjKSGv4=;
 b=oGGDfc5pTVvavx2093eEN2wTu8bHGjAxN+aLXAmU97yfL9vj7JGrgFdAeTcyC5tk/r5WJYv4dIHs+tgSC3ZUE6JE54Rv7x1LD+OxiMQSDpIyDHWopHTCJVlGOB8T4LeMuYTRvGDyLA3Hwn0FfqfLeioEftkDN/oPQ2+2hF4SGCiCPhCJrpyqO2Wt0YHxKQ4EktFhu16whVTzCXTXoif0Vk7s23pP3bx15v+VEFZUhjzntqPG1N2jFd6Rfu+bkIQtG/rOkj39jPDpi57QA1XdeANvkIMPmF1Y/WoIXamEImaqHMW0Gt46t/qjKyIzH689SESn4opElrHh9OjiXvXlnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJ2BTxNNDNOfKUWBFH6ZYXHmd0Z4jvQhxlZCXjKSGv4=;
 b=B3QqviJ2R1fIdkxhcpbIXRdSjaRBjBq0Sez+aW6ZVxw6J13+m1kmp4IIUbyu1w3pOjH3U4svOmvz4ip0jtQgVJGnSqO6HgDHgx5J2Qbsh9m1D1lMHvT1uYHhFtHDpsj4p8Rq/ImDjuNkpfVq0gIHenWnjFQ4Br2ngwm86Xd4te8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS4PR04MB9388.eurprd04.prod.outlook.com (2603:10a6:20b:4eb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Sun, 22 Jan
 2023 12:17:30 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%7]) with mapi id 15.20.6002.028; Sun, 22 Jan 2023
 12:17:30 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/bridge: fsl-ldb: Add i.MX93 LDB support
Date: Sun, 22 Jan 2023 20:18:34 +0800
Message-Id: <20230122121836.778195-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0247.apcprd06.prod.outlook.com
 (2603:1096:4:ac::31) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS4PR04MB9388:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ccb9252-59a2-4890-8de5-08dafc72a1bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AjD1gBvwGP1BDq4Of1zgu/lOYy/EO+qri1W2aeUavuxpAVMoDJKZdnEZRTEgbjhRj3lKrqH7c4XEAkwtAQ/E/CgIW5pKpNpW6UXnRIJ7aur3FuVghiHrtl4uNhdC77xb3YC4+0H9LRuUyGvy+8/skshtYp3b6FDU0ZjNHx1+3KTAOU2nzm4dRhW6YEFTsOyAgJXDN6QyRIpC2iMlXzGqV34Vdvk2Bpq/nvLiyhvUxvRgj3fWZaRzQcYbveunsGQpRiJ0JqOCPjlLOMAnug2J07RmiKeDESZzFf1TnLZfAmU2k5B4tjYIB9oCY/3mvPcA1aOklJdORzkKu/6jYlVrgTPJx9qEafLeaxYerRbuIIVk/h4i7iJq5VsOSyCxOdJEXm4xwRmaxdrxfIiuOCtTIBl9UnFvJB/LmbMBQdEIVrZ/+9TZdTcoVrdWOf0aEgN1Al/Or4hjmj3CSPBy1dQyGH5AprnuC7Svyxb9Os9Z9xAfhBmAUbuNDbj2N0dZsb8HIo2YEqNpnEY0gGjz9FfHNi3KhqC2yu6lN2nuZSxZujS5IriazeZufuE10pl8yumMy0LrYRDZSNalfX0u2cGjxmeyo6zbL28OvbjQJmBa96N+UJzrh3d1JmdnZahDb0d8etSU8bmGZwkmwUt9DO4WkMXo7XDm4NVVay05ydVvPyFyWaauZTAgONB2AHqFdP3/6CvuOWvcR4CSTmSgErLssg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(366004)(136003)(451199015)(6506007)(478600001)(1076003)(26005)(186003)(36756003)(6512007)(52116002)(6486002)(2616005)(86362001)(38350700002)(38100700002)(83380400001)(8936002)(4326008)(66556008)(7416002)(316002)(66946007)(5660300002)(4744005)(41300700001)(8676002)(2906002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ABPx90d8fa9Q3IzcTpsNb9OYcdLqt4PC7GjUXyXvAlPE01JOlPqTGKwYTYl3?=
 =?us-ascii?Q?3iDX/cVxhDUtDw36gTch1j9IDBzZjf1jTmCh3/5WywDYM0vHraulju7VYcQK?=
 =?us-ascii?Q?r3bc+Qa9b/BfsQACCQshi1CxGdX3jhpKIsPLMuyYOkO3t24xfg7VxD6Plbzw?=
 =?us-ascii?Q?1uhSa8IKDmTblBVnXcJdm/6GMF+PjxR7WiFcAq02otFu+SQLERaGO6bO6OcL?=
 =?us-ascii?Q?Hs5y7uvuJTZ7TfBguJSdcFXTzghVz+TDICJsRwOpr2EsfRO/IDLmeQbXJfWt?=
 =?us-ascii?Q?/qD9PuunhDBi5YrhKQ98UC1SFp4BS1DOqzzTqLPz7PvsWn5xdGaEeDwZ+oCv?=
 =?us-ascii?Q?bSKihoWlQkfkWqz0YofbRIVuenpVxljjbQo3m1t0GdEywq0EYtARDOhJ2KYw?=
 =?us-ascii?Q?YqT1h7jcmrNzWLKSHGZ/sCMcDDkEx/XjZqS/j2mdgzAHDa3vIrHLFRMgp2mU?=
 =?us-ascii?Q?5egwLTC1tNc8ryl/tEMzztIDDaLmGvriaz+clf28crX6oeJaXMR+RxsohUVm?=
 =?us-ascii?Q?EFkRYxCcnhN4p3fYEKPxz7vxY422KwLm+GS0PvaflRnQFREnqsUwD8aw4WJS?=
 =?us-ascii?Q?u9Gam0mcWMICj4MvFgalqxaHswnmoB42sq8hhUQj4lH7Bqtjnb5Qy4z0lhQN?=
 =?us-ascii?Q?AuX6ytIjbslaIjSOFDyKuWeINtC3B5k8nZsEdEuslTcCawa5cpFpVHFEYnOe?=
 =?us-ascii?Q?2ktpdW7Z+WmjBiKK91nJDXbDtWDcMjB/Hw1vHAsFnJACEvpquWFng6+Zvhhr?=
 =?us-ascii?Q?7pEIz1/ysY4Em+zEzCuoQ07Sr+ONdzUgORsqz56BleSNjaMyFc6Ic5X5bll8?=
 =?us-ascii?Q?mwn36R9o+4sTseZqPi/YNjtrwMyIZqf3ledNEYbLfGpzJj0AsvOeqIgbu1r1?=
 =?us-ascii?Q?n7iwWk8/xEWZmbp7GSR96DmrbRaOEqSmcN0pbxb2sOvPDo+b8GJzDysRS35D?=
 =?us-ascii?Q?7bv9Wjo4IKcgCF457dwwKQ2556I3cxJ6UKqxOqeNb8JMa0gEWbJq1eZdKoYz?=
 =?us-ascii?Q?6ENSZEK/ylGPnBpqEwxbE1QzfVlzLO+z1zHaMz564nSYftMq2akPmmlnD1no?=
 =?us-ascii?Q?1nPoz7wlwtDOHZQxS82v09vo0jqvO/7up88fpFWljgrJlwqLRmnYsen7znaP?=
 =?us-ascii?Q?nu31SPyLuHfvQ5+Kv3k9gOJ6SOXjqkoM0UfkRl9vtfH1dt3zNdpTDRSmzeIt?=
 =?us-ascii?Q?6eKxkk5cZZcBlZOk2MhciXq1r/EO8TPh/YSBvQ9hTePRaXY5oTBrzDMRO0NH?=
 =?us-ascii?Q?rl2ezs+kcoggYXZOP8eyEs+A4stKQHDmfIM0e4mX2X1Q/cHqZrapSBenRRT/?=
 =?us-ascii?Q?ABzq/cdzz3vS7Y95gAy55VH5qTLwCt5xkXo+UOSEXzgaRAEw+xzNeYoIsvWP?=
 =?us-ascii?Q?cix2QnSVYDSF6mJEmIZBMS4hMNJv2C8875Pr+xs3k2kwKA2YVsdcgENl7AfE?=
 =?us-ascii?Q?9MYiSHQAWWju+cWEpD9ncVoWOVECeBrDfzAtTJ0ot4KZECNqrCRR/Z+vzGWE?=
 =?us-ascii?Q?gFHbALrFn8RgJx9PNGH1KF+tsqvZQavbS95SAMeuIXCLAkC38ylwnegnuEyN?=
 =?us-ascii?Q?QJIBrGW/TOfNuAHT35vKX0DJmbpHxivUpnAOvHit?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ccb9252-59a2-4890-8de5-08dafc72a1bf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2023 12:17:30.2107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jh8rcVgmoCaB14G1hnfgZ0BRcJh/E1fzMIaZFmBXK3rd4flTzqeYUVNgOnPlgUa6RqiZHYoaPhdCRLwosUyvjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9388
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
Cc: marex@denx.de, neil.armstrong@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, linux-imx@nxp.com, jernej.skrabec@gmail.com,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, robert.foss@linaro.org,
 andrzej.hajda@intel.com, Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch set aims to add i.MX93 LVDS Display Bridge(LDB) support in
the existing i.MX8mp LDB DRM bridge driver.  Same to i.MX8mp LDB, i.MX93
LDB is controlled by mediamix blk-ctrl through two registers.  i.MX93
LDB supports only one LVDS channel(channel 0) while i.MX8mp supports at
most two.

Patch 1/2 adds device tree binding for i.MX93 LDB in the existing
fsl,ldb.yaml.

Patch 2/2 adds i.MX93 LDB support in the existing i.MX8mp LDB DRM bridge
driver.

v1->v2:
* Drop redundant "device tree binding" from patch 1/2's subject. (Krzysztof)
* Add Krzysztof's A-b tag on patch 1/2.

Liu Ying (2):
  dt-bindings: display: bridge: ldb: Add i.MX93 LDB
  drm/bridge: fsl-ldb: Add i.MX93 LDB support

 .../bindings/display/bridge/fsl,ldb.yaml      | 16 +++++-
 drivers/gpu/drm/bridge/fsl-ldb.c              | 53 +++++++++++++++----
 2 files changed, 59 insertions(+), 10 deletions(-)

-- 
2.37.1


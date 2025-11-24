Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA3DC83DFF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 09:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B93C10E36E;
	Tue, 25 Nov 2025 08:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="t865ABsa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11020133.outbound.protection.outlook.com [52.101.69.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A27410E1FA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 09:36:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyJCWcsCw0yYAfcNUDoorjQi01lJWA0wpJFfmFi4pfyzUugvPyVK6pSfJ/TeZd9sKm09QQC0vCLjqf+HKgEDnqgFCRBu8RZmT8XqG4YfZhzpgfR3BrMnXVIaP0CGfAe0lUSbbrZN9TmkTCNT/5PiXLyP5Jev7fifFFkifndCBXthc4OUGqgVJPLMQBwHkK1DqinUutx582VriA6A9EAi9yMNhJgmP0sOYpLGjtFvFvbUHgqN7ZurSHYpGc3f63QnVYCafryDtiXHl0aWQpFJOyPRlg1WnsbVIxjL9/I3B7PzKyjQcjTh0+FFO8cHRyQbKeuL6elofi0azVsNKqbvJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rizoj6BSLW38YMY0XcaYRVPNjpeIic4XdoPF1vIpbsU=;
 b=jvFMPzz60SjpkCjiN5xPG2M50NEdFkRGMKLe2mUJa4CLl/xiJi7oKXCBdgPeVTSDxz7dWKVNZcn6o01ICaGvN+m5vNrUIANrrbM9ojeReL4D6kgKLebc1aUmDInn9k6XPmoNT3jERraiKs5FrZxUxB0RPzIuGyt70/FJkBpiH7Wvsd1FQYZ8S4s/fDU2P5r2k+fTrU+Vzipz13AcwdZQSbVglYz+6/LLL1fm5/7a1nAr2rMhGhEoQcmCFX1issUn/DvD/HXrGXAxUJecvOZjUFj5HnNkAfK6eZvKlkCUkYF6GJKZwmJQzDO18RSrZEQrI9Uh2igY6YKxvcFo6UQQbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=intel.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rizoj6BSLW38YMY0XcaYRVPNjpeIic4XdoPF1vIpbsU=;
 b=t865ABsaBk6KprBO5npcmV/GPt1tuCfV6hXXojBYE/T3QPz/okdeS91ZEF88TFtD7LBH2MCwNlGAnxyR4N4IL66K4Q3IEVVaGIBLn5KIBnekjdLuUolTJrMzdE9rHIL2yDFKgaQb1uqm790GABFkWnf+B4wziwyZxdLCER7oK1YEQj2Jz5O4C6LD/kzk1rFA2U6eMgSCLKBjGduWRfmsRHy4xclJBFJ42PUKsojoog1Ln0+2pgnzGuv2Fn+E/QghxieKv4ADcwRGVbeX/yh0WB1voMLGurpbq0gnxDGGxAjNjDNtBygJj5B6vOcp1kCyhMJfYTXL/2nL47AS+5xtoQ==
Received: from AS4P192CA0032.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::15)
 by VI6PPF1A673103C.EURP195.PROD.OUTLOOK.COM (2603:10a6:808:1::106)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 09:36:38 +0000
Received: from AM3PEPF0000A791.eurprd04.prod.outlook.com
 (2603:10a6:20b:658:cafe::8d) by AS4P192CA0032.outlook.office365.com
 (2603:10a6:20b:658::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 09:36:31 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM3PEPF0000A791.mail.protection.outlook.com (10.167.16.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 09:36:37 +0000
Received: from ls-radium.phytec (172.25.39.17) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 24 Nov
 2025 10:36:34 +0100
From: Daniel Schultz <d.schultz@phytec.de>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH] drm: bridge: tc358775: Fix Regulator Names
Date: Mon, 24 Nov 2025 01:36:19 -0800
Message-ID: <20251124093619.3378556-1-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A791:EE_|VI6PPF1A673103C:EE_
X-MS-Office365-Filtering-Correlation-Id: b119e83e-08a7-44ff-3711-08de2b3cf701
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|376014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1gtM2JuVcyi0z/v2uLN6MNqx69lM6BRr1kFq9kOd40ILTMUvbXsUsXPaYfij?=
 =?us-ascii?Q?jEHJ5F8SSkZ/gpASn5UlWe+0gMlx400QNrS3gpS9qiam+hj/6ri7sX3jf+5U?=
 =?us-ascii?Q?tmcCgWUUz2gpUq80fNylxsSpkkRkqHgUWfyno9KinlvVG3OctYf7PG3iM7lA?=
 =?us-ascii?Q?PIApiJ01SDwr303Z6WQmf1x2Sa+yyxigwVTrNO+ZEu3JYS7Ke/P6OG6suLci?=
 =?us-ascii?Q?0XF8+VtPQFQU+pLS/JeRy3HsCes9yrMz+gugixxCWPToSiowAOWFqFmU7RhU?=
 =?us-ascii?Q?UHGqefBfA7TbsEiWxQc0P9PTLC2WfKjW5t9G43EfcDdm4j1TJZyzxiwD7oNa?=
 =?us-ascii?Q?0VK8+NAautIomlWO4z0mEQEiTCDkpgx8bg0Zf/Oz3mfAc3nts4c5rwB5m1hU?=
 =?us-ascii?Q?PGg5vPMl4ICR/oAbgaU2PvIxL0lmpyu2O6SvtEMrkBk30GcpqA1gZuw/GyMB?=
 =?us-ascii?Q?cWlGbkI2+I/GngRjcDKdzuBhq91otAmcyspSITF1WzSnHp5WJkAjhb2hy+gj?=
 =?us-ascii?Q?In+FhOUMFDf7gyhNn03w7Tkzu4ruEzo/WN2hzGmB68UYY+DtyDOj1/y38slo?=
 =?us-ascii?Q?S/Yo89U2/j3WhByDAG8+eSuMe15nLWSpNYkFfV+RPJ4AAtJPrpE9C6v1Ih77?=
 =?us-ascii?Q?fTXGRObaOaID1tadfAe85tN/A9OsYEy+iZkyJ8EJQpF/9bFCtdbMno1UEPbf?=
 =?us-ascii?Q?CsN+ccMaKXePqfEo3+C5vspTya3ajAMtwRBTssLE1VRTXg+NP0iwDSNhY+no?=
 =?us-ascii?Q?qiQvwEQYL3f5eJwpF5+lUbba/YT3OM4gi9SSu9El3m+Oz6ll6JumhJ2BHwf5?=
 =?us-ascii?Q?i+g28y9FaeeG355z1dxgVSw7C/pkxI1Q7lCdIdIx+DotN6VLA+c38F/5Ekle?=
 =?us-ascii?Q?AmVOaNJdh2Z4a8tUz/CW3sUhAcPwxMslZW1eCvnic0sa2JZDIsgxxFEr9INr?=
 =?us-ascii?Q?RBYLEzTuvsJLYnMzIO+t1HZHf374wKTCitlvyaVSSpPuRSjXh8vQSktRx41R?=
 =?us-ascii?Q?m7PW95UmRrBlmEr4d7Op4TMlZTUyjQfwGA5UNpL/k1tAuwoLfaq9tHDGC4sn?=
 =?us-ascii?Q?NgQmCgr6o66IPBUR7aajtaAjHXYA9kZiMosgF8jAe6eSi/mTv5qHJ0oZkKgq?=
 =?us-ascii?Q?pEhA9ZUAfMaAPm/dTjUHyRLeRHHjJ5Z37Bf7OIHvcXTN1nL7oMQ0le7ky0lJ?=
 =?us-ascii?Q?S9yPitlb+UvjY/ZF5PYG/B+X+u17821gGhTsl+8BNs3vDhrYTRsVmGREvxY3?=
 =?us-ascii?Q?tld7ikiI3YCPqjLBYtllq1AdR2tl8gGGinplm7qOujiasNNTeqXHcnUPV2Jx?=
 =?us-ascii?Q?3mBNbO5ie2XUxWinSX6wEjKv0RXq9SNJTXrhP54gW8SkpIUTZWZgtC30AzO8?=
 =?us-ascii?Q?ogqWakbm5mg69Mk9y+zLN0cSvh8LKs6fEu0dNE2ZqFXBmpuFzNm+rspTvh3C?=
 =?us-ascii?Q?KGrAMY6xvZzA0pBRQKFOgiZ53hIFh1Ks13c422DfTQqWTrMy6WwDgZFnQgPh?=
 =?us-ascii?Q?buQDspFfgSm6WYiqDPJJPYEshePHA5EPShE36o5gNvxGje4iUi5nJ5v688di?=
 =?us-ascii?Q?hi5PBBi5EYdMA3qywmU=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Postix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 09:36:37.4845 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b119e83e-08a7-44ff-3711-08de2b3cf701
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF1A673103C
X-Mailman-Approved-At: Tue, 25 Nov 2025 08:03:45 +0000
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

Drop the -supply suffix from the regulator names inside the
probe function. devm_regulator_get() expects property names without
-supply and will automatically append them.

This fixes:
[...] tc358775 0-000f: supply vddio-supply not found, using dummy regulator
[...] tc358775 0-000f: supply vdd-supply not found, using dummy regulator

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 drivers/gpu/drm/bridge/tc358775.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 366b12db0e7c..d70506501ebc 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -677,14 +677,14 @@ static int tc_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	tc->vddio = devm_regulator_get(dev, "vddio-supply");
+	tc->vddio = devm_regulator_get(dev, "vddio");
 	if (IS_ERR(tc->vddio)) {
 		ret = PTR_ERR(tc->vddio);
 		dev_err(dev, "vddio-supply not found\n");
 		return ret;
 	}
 
-	tc->vdd = devm_regulator_get(dev, "vdd-supply");
+	tc->vdd = devm_regulator_get(dev, "vdd");
 	if (IS_ERR(tc->vdd)) {
 		ret = PTR_ERR(tc->vdd);
 		dev_err(dev, "vdd-supply not found\n");
-- 
2.25.1


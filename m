Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B24C83DF0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 09:03:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8369E10E370;
	Tue, 25 Nov 2025 08:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=phytec.de header.i=@phytec.de header.b="hAD2lZ1a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11023111.outbound.protection.outlook.com
 [52.101.83.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BCA10E2B8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 12:40:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLvJ5BOY49Jtja3dJkhNLr1tN3+M4U+VuQ0jWE+wJaob5N6x2+ZLp22oTv+92mBDOrGoM7XEZyUb05DOKcrcyg6obFKbymMmHU4AIXj36gE1ZLcPWEpxkE3VELw2NsW9zOy3vV1UHRbDmaz+KsW5tmq6vgTIZUmanfZnPRgGgo3i6jGp8/BDHJuNeHXSxJsJBTQ7IlU0CzG548OF/3RgJG0GHkAs7I9BIXHfmephCAINEbPg5dNsLKORhSxHJX8ewY+uxbxFnZyLv6fIWXCs86ssTka6Mr0kdSnaNTkOU3nm/V8iX/y6yE3bH1m3hCf+iUbtFLire4XQu1hQPVPk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6YCS070f0HECMbg5D/uMVn/e9fyRfWtYhycBfvkLrQ=;
 b=CAHx5X7ck3UhTMiFFIRWwVfC6coAcRe7DqjtsLzrfaCDOBEKweBCzaFpydoheOD27CaB1oLRdaw4ysR1LI79VV5Qd2dmX8x3POr6vU5l1+jYHjsuXF/KmOQa92AB+oNXzbJGb0a5NS+hxlqHSJSQznIeSiJqE31rE0yV/x+vJO+gPEHyyu0K/ugXyhVPd4Wds9+rTp5AiJzmIWyOaliiidC5rbAf759yCYgdgMl9k/v6V7pGHuYxPKOxOfLPPH32n2hZdO/K1SZ00sUXfOeM1jheaphfpD14X312Op96Hm5sdTuAEPa5hBKUdpO5LCTxobXzOSXmCfJukT5RWKy/Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=linaro.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6YCS070f0HECMbg5D/uMVn/e9fyRfWtYhycBfvkLrQ=;
 b=hAD2lZ1a1JzwwLqMiN2mCG/eW7HohNGIevU+DJ7h7TQPe9nuoXX+M/rSEzhbDw0mqFYsF5r5sAr5eFoLm/ojZC4JTibDnZyG4Urw9CMvAEttNxZAaCxdNA15gx0fLtKOy07x2LFQdf/d2CIt699eW1/1ib0x41d00TqUMn5fn3nDYgtkF+NQZl4ubZfX5JMuP1VcQWEqsSbwlVGEBazChKWk9PRW1KZJXtmSWTN2jQqUN62HDpVLDdcsuVPLvlzuVNZtSaO/I/4+f6v7OALqd6ZQXOC0IJSHWT8lPmq4uR4Te6I3T66+TKJXHpjA5lOz6a4/tv2/m/eJNvNiB4c7MA==
Received: from DU2PR04CA0268.eurprd04.prod.outlook.com (2603:10a6:10:28e::33)
 by DU7PPF971B7265A.EURP195.PROD.OUTLOOK.COM (2603:10a6:18:3::bdd)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 12:40:03 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::a2) by DU2PR04CA0268.outlook.office365.com
 (2603:10a6:10:28e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 12:39:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de;
 dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 12:40:02 +0000
Received: from ls-radium.phytec (172.25.39.17) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 24 Nov
 2025 13:39:58 +0100
From: Daniel Schultz <d.schultz@phytec.de>
To: <neil.armstrong@linaro.org>, <jessica.zhang@oss.qualcomm.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <thierry.reding@gmail.com>, <sam@ravnborg.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
CC: <upstream@lists.phytec.de>, Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 2/2] dt-bindings: display: simple: Add Sharp LQ070Y3LG05
Date: Mon, 24 Nov 2025 04:39:38 -0800
Message-ID: <20251124123938.936521-2-d.schultz@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251124123938.936521-1-d.schultz@phytec.de>
References: <20251124123938.936521-1-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|DU7PPF971B7265A:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dcb206f-d59f-4d52-79cd-08de2b5696b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xdGr6H+FFVy+ySES6sUyyDBrX7m+bc9HHIKn7oVsBcMw5urypdnRDj7Mz6cK?=
 =?us-ascii?Q?bkvzi0T03nXkepoZwp4gUx2Fin6Fp9qzq1hQwWzXASkNfdLZnOBc1XAEv3HP?=
 =?us-ascii?Q?McWsOcn6XmVn8ADx9GHldmO8Wilq+t2gBa5FN85XwKlZV6QE6tf5t7ZdODWN?=
 =?us-ascii?Q?rYa/OKvlXsZ1Sb68bqCzCO9NGMmUXJkuFaWrARJ4ULMUg5QhdMG37eNozEjr?=
 =?us-ascii?Q?7H6D5kS59OBPWXCwi0siqOIfgNHZ6ucTofttSuzm82grslsbqRRfgnaBUUdP?=
 =?us-ascii?Q?kIe2m3bXG08WOFvjchWWyvbaPfEcbfs5Jl899J5Swt97ClBSgsyUMcQMVlZ/?=
 =?us-ascii?Q?NM+fDgLS6ahVGveVG0GQJoiphn5RSzP6nCFgmh26iUWPMJpTkQHQq41MJluP?=
 =?us-ascii?Q?fBNiJK4z7Qys0lmVAskc7IkP1arC0B6UTfUiGkYGzOVtiwN7va7rVC0yz49A?=
 =?us-ascii?Q?SzTXAUfenhM/jlFF+neAPbJaCMDisoEkcLgmYHEcxP3A98/ezP4K86T2S5fY?=
 =?us-ascii?Q?zKig3yb5P5PcjiAdMUI0N2LcGe6C8aspRI6iV7CF9sEmVqA3ipuT5oceRea9?=
 =?us-ascii?Q?4SL8WbLAfEOONCZ/mPzQc16s+x2Sj92GDzi5fkLmNPpt6W/xxdswO8eOtLZa?=
 =?us-ascii?Q?DTq5gWZUyRZLMGJa71S3n9IGOIDDxlzFI8fRjoYEMGkSdfJm96BEhsLPcQQ8?=
 =?us-ascii?Q?wIZcxbQ07mm98nz8etNk+Q9kPnVkrjNeER3Y4LqMNZGqJ8+T6avPfWYz25zh?=
 =?us-ascii?Q?Uz9eal2afezySAUfPgjPnz9gMhuSUn1H+86GaakfcfCPJ+wTF41KchA/yah8?=
 =?us-ascii?Q?9sfausRr/M6S+8GjBl5AGkOyBlB9wEBxzQKtz8QfAON8gSJL4E9m/0ZakhzF?=
 =?us-ascii?Q?vkPxBhmEgcjMB8IxF+oVLRm6TVmLlEsk/bDxh0QOHGiWkXo//YzCJqSFEfkP?=
 =?us-ascii?Q?f0sgNB7ZiWOZMQ9VyWA6sCLdTY6IGCMc9GD1dJMrcnAs4aZ491hiKbjfxVZ3?=
 =?us-ascii?Q?+EG3M5h98+HGrBljJ3vyKunDLXAoriKnBeuiVMeyxNAI0Xefh9zkS/jUsDhJ?=
 =?us-ascii?Q?bN6G4yAdAWPTevU2wsWDbCzKgTdu9yBeZUma5Tm2g1PClT/Nqf4LCRka4z6F?=
 =?us-ascii?Q?e6ONlBVfQnfP38b57oLr5zQlxnFO4L65/SMp9nzE2F0YE/3ObQ2sKiuJEcKk?=
 =?us-ascii?Q?wxwfJJHHWEOsriIrQqitWUMPk/pleKgM169uDO0kMXplKNQQL/pCm+D/z+Du?=
 =?us-ascii?Q?eCZp47nZLtt9K54ocOkO0eo332hoaPN8y7M//EVOw5adr/BCuZOkZ7ivfBQC?=
 =?us-ascii?Q?+6jF+8AA+pnbnDfnebg21fJnFxiZI206tPbpDS+Vpg9Z6OdaBPf+ek1f338z?=
 =?us-ascii?Q?3VQWuFa6s2vz6BaoqUwy/4FgUtc04f9QipNlj1Z8RCQ515gBPqRdKUqfnkQL?=
 =?us-ascii?Q?t3/qlmFAi9qypghK6OyAtOS77iYer6F22MMs5nGKekTpugLutCN/N2oD9u0H?=
 =?us-ascii?Q?bA2Zw2PP3oAAWjNffs7hsN+vukEGoauMEuAbS0l39zoVqd780/hIqrMB3Axf?=
 =?us-ascii?Q?jaItnWjUOND+34D/Iv4QcfLYc8CcWqXyzMKd/iUH?=
X-Forefront-Antispam-Report: CIP:91.26.50.189; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:Postix.phytec.de; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 12:40:02.8218 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dcb206f-d59f-4d52-79cd-08de2b5696b6
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29; Ip=[91.26.50.189];
 Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF971B7265A
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

Add the Sharp LQ070Y3LG05 7" WVGA lanscape LVDS RGB TFT-LCD panel.

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 2017428d8828..3a55829f960b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -284,6 +284,8 @@ properties:
       - sharp,lq035q7db03
         # Sharp LQ070Y3DG3B 7.0" WVGA landscape TFT LCD panel
       - sharp,lq070y3dg3b
+        # Sharp LQ070Y3LG05 7.0" WVGA langscape LVDS TFT LCD panel
+      - sharp,lq070y3lg05
         # Sharp Display Corp. LQ101K1LY04 10.07" WXGA TFT LCD panel
       - sharp,lq101k1ly04
         # Sharp LS020B1DD01D 2.0" HQVGA TFT LCD panel
-- 
2.25.1


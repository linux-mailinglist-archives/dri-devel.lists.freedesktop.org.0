Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAABB2B8B1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 07:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AC2E10E529;
	Tue, 19 Aug 2025 05:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="N+B1msu7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11022138.outbound.protection.outlook.com
 [52.101.66.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090AA10E205
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 05:32:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H32oRtZDdu/O+xci8IB9HjB4Uc6512ygQ1u8o5uO3SmALGVPLE4v6PshhGqTu4zz4cqVkZ2+XQKMXhjihNgz269ppAvUIBlKYYDV17yeDdKrWtLWwelAT6QtkLleKoC6tvUs3FRnlzHH9HSiVrXkakOQbQQ5svdwvCQekPoniBkqhQihpJ96pwPC+N+woV7x8guqWYSkkMnrQNOlAlRtdQBNfKjLhaSg5gVBqmGebcMMF9vWvucpVZUcWV4G8vEVI3aFt5A2s8iKHoWkINyEQ3wSeNLRJ0OyZPVfbklurgm3w9kfzJjZwwj1jI9mEyuyye+LpkgYfc43sVazbhSS/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UI2Rm7ObFrokcKHzgELus7TMu6jr8Niwg7nlb6Lpxq0=;
 b=Mtuag+8PAjOr5Mz9/q5YP68Y/S4kkNWj4gJiblBuFlwHeyX67ggPxWQWQcEIJj5VVrgqkRg9KEWoEV0X8/KYPSlAV5WM7Ytf+e3SG95tXzVk+zaPL8j4Y2DilknWqu34TOlMeSYaImbiwOzesi9LJXhQSURhXjphunN/Mm7DSYYu98sheyEcaEMDLdQg5r0lP5FnF+oBY7255ITvNhY9j1c8ZfY47FIbcsPN+PUXFLlvTH3k1wyrgs3/v7OSDRqLgRbueWQ08qir1MEjaQE83GXiuEVp2GMQtNQjrI45Ad/+edZ1MxGX/iUleEMxfhd5x/tJ0wVJ6lYXBy2Ud4fkzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UI2Rm7ObFrokcKHzgELus7TMu6jr8Niwg7nlb6Lpxq0=;
 b=N+B1msu7Z3NXEwo7T8+omFqpQSn7CRuW8JVIZLS7UtILLb0To7ocOIt2YTp/X4EUxtOReOibeAd87s8/UgZmuzsyUIEDWGcE5fOBlsupZr71ZBgMuVgANekYja83XNNY8xt7xH2Z4MwhIMyKI0jsyn4ALllC+78OkrvDnQkPxfdSDa2PI/hUigtBVftO4MsxypTzd6nBAeAU13fNq2CUcUDNHtHzmJuiIc8IXUjzE+k2En4bi4/4iSIHlqyLLl3ukZkkYq/lfk3m6/89RUWZaabaQkUD/FJmSq7OWLybQGPTgtqBdu8KwPcNz/3QoMGnW/1USHfK2emlLL8VsBncMw==
Received: from DUZPR01CA0293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::7) by GV1PR04MB10774.eurprd04.prod.outlook.com
 (2603:10a6:150:205::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 05:32:18 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:4b7:cafe::55) by DUZPR01CA0293.outlook.office365.com
 (2603:10a6:10:4b7::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.22 via Frontend Transport; Tue,
 19 Aug 2025 05:32:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Tue, 19 Aug 2025 05:32:16 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com (40.93.81.79) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Tue, 19 Aug 2025 05:32:16 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DBBPR04MB7851.eurprd04.prod.outlook.com (2603:10a6:10:1e1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 05:32:12 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9052.012; Tue, 19 Aug 2025
 05:32:11 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: dri-devel@lists.freedesktop.org
CC: Mike Looijmans <mike.looijmans@topic.nl>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm: bridge: Add TI tmds181 and sn65dp159 driver (RFC)
Date: Tue, 19 Aug 2025 07:31:13 +0200
Message-ID: <20250819053205.9976-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0P190CA0025.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::35) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DBBPR04MB7851:EE_|DB1PEPF0003922D:EE_|GV1PR04MB10774:EE_
X-MS-Office365-Filtering-Correlation-Id: 481be02a-75e3-464c-7085-08dddee1c2a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?3WPX9tS1zNJlCURtXS3oSbLcWDUGjPqvCcxu4TiKfC7GBDxFMvfVV1bJccYG?=
 =?us-ascii?Q?Juk8LNMQXyTuG/BwHUc6k1+f4B7vk8mq1snJRWD1lN9zstVWvsjxmNARsg8g?=
 =?us-ascii?Q?KPGmDhuElLi1CgTKb2oY3hUpg9NuSXZ6k9LgIRAXr9DvFJmYJpaNz/0PTCTj?=
 =?us-ascii?Q?4JU0l45G2zVKHi1VjZy3vY87UmEyYorGiA2KWN27+YURCRCBc4ywaF8q0BUf?=
 =?us-ascii?Q?yo5Hw7vCuZCcKegGYzfqLawHKSZBQBr3obAXFxaEdzX37GxK/KV+BQKyENG7?=
 =?us-ascii?Q?LwNyYEFLJUM3IXL7Vf/P2WD5UcKJOZqFSJR8q/5wvSn7u+kspMQvfJZT8AZb?=
 =?us-ascii?Q?KwBQWjOF0MyGGJnBfvHcTf/ou02sSmV1WnUPA5swSHbZvchBKk/16xXT0/2f?=
 =?us-ascii?Q?74pGhD7RO87SEH8EgppsE5ke3+6mI+BdnG9wrGYMPLobSAqIWeGUNZn3qFn1?=
 =?us-ascii?Q?xoEQ2mix0UtX/Ian2Tu8OyO8xlxC31mg8ysHMpM8N5A9brDIrk1E21Rbl4EC?=
 =?us-ascii?Q?UAlDwIohQOq1VJi2XvKQzIq64Bsn18TSWBSdMkshzsA4lNah/9nuleTFa1sB?=
 =?us-ascii?Q?69aE7Tu+cxR7ScV9GApYyNl8EFYLAyw/4ClZ9FP+0cRRD5SzS1DYZ2iT9z4a?=
 =?us-ascii?Q?JTP3D1utLKCpvsaIlC0oYBjNY09Ao7tYeG2qaZGcf/EEHE7ofDfB2wbwX5Fj?=
 =?us-ascii?Q?L0sXWjIt7m5CSjhOdQEH7z4m8X6cOnBFLUmz8EHV/BzwcNKJZown7wcntOsb?=
 =?us-ascii?Q?oklsRn0Ueg+xU9YuSTNcmNcb0c2sAA2/ea4YEuWvkPCLeiUA6XxAkzoYR2NJ?=
 =?us-ascii?Q?+Fsxml559RQAIaPOJ0EYbSwzs4sLL+6aJej/0A3Z6KybB/H1N0WqqXvdBwoD?=
 =?us-ascii?Q?roXKwe9DV4cWcCV1WICm+S/R1PX8HdDLSRQ5srHV88j8fW62kwuolatnSP7h?=
 =?us-ascii?Q?8KA8SClBWLey9qnYKrUSpUkCEvxT7hiIL4SNC3EWKwm5V5o3cl3fanD4+qP5?=
 =?us-ascii?Q?VqhSOcfmJElCur0RuKVeDhvBSILAZG5T7w4CfsoWmr0Riv1OJXaRhAROg2l5?=
 =?us-ascii?Q?Q9UxQYXPYPn8EK+1qdym0EyZLRb6Atj82zPyl67rKRV8SorUb041jBRUHa11?=
 =?us-ascii?Q?Mb8stH1OKuyf1uu9IfOyVcuY8jDsF5OMp+dVyvvtbeFb+W3fQ25+NMjgguZn?=
 =?us-ascii?Q?HN78XZKzivFqQM6RXCFim33RadkiTNWlK+hvgw43I3lHBE9b8JRYOSCIH/8e?=
 =?us-ascii?Q?4gwjZsOxlOEW/DRZZjl99PBBAZkYopoynne9xsblJk3fcqbwSIgtzcwcb0qW?=
 =?us-ascii?Q?DZZDvHwY+iE1YD0CqsESUrgp5Tz3s0KrNMP1fvoAj7ntPhlzFJg+YN8ZnkDn?=
 =?us-ascii?Q?97WVJYYaOWyRgnYs85G6ee8terkSga/AZ5x3Yn/Jfd6EmCw8z/yZ9kNNQpiE?=
 =?us-ascii?Q?4ZGuSTBSbtVMb9hn24aK5TYeLoDj3eGvO3ev7zSyHnkJQEbwj9mWww=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7851
X-CodeTwo-MessageID: 8ffab7bf-9a13-4ecb-805f-0369a96ee0db.20250819053215@westeu11-emailsignatures-cloud.codetwo.com
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.926dbb5e-6af2-4dff-910b-4ccd35fd5ca1@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4470531c-d962-4509-ecca-08dddee1bf78
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|14060799003|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E+J5RQcJ/f1Dy9s6xTo6ACNgvPB5o++NxT5Bo5xOeowMmUixaWqFf18mfgLc?=
 =?us-ascii?Q?uB+JvDz3c2XsLsdXt7hwaiMm3JDkhnvTt2vB2AzgltT5hmStP0Yy9WiAUeEy?=
 =?us-ascii?Q?HyfRVboYpgnP5AACsD93pD7Nh8oiqr2B72jNu7SYeFbyWT3qZGxUlSS4rSXQ?=
 =?us-ascii?Q?NfeaXGPy6Kh1AYKNp3ybgn0hMG1IVsbOj/ccZTdMZrDgfPmrnFRg2uQoDkCl?=
 =?us-ascii?Q?5gzcI+CbV4lKPm4HhaEZbfL/npRhOcjX7ObJCyHNfVfl3qmRWjIhca5WoJMo?=
 =?us-ascii?Q?SzyjOg78+sCYdFJ1y7cFq5jqG0jX3eumcxcWO61Pk05OZB4DyW2tTBbME93z?=
 =?us-ascii?Q?PUW3WQHPF2cZfZt1eYjdouTwMgdg8pqbW7SrcH3cN1HJbIVhZEnh1Gr8As+M?=
 =?us-ascii?Q?D9y82ouVu6duDRHLRUhQJS4dUP4MjAtrNuWbgOK8ckmbNAgUMrLjKxQqrixd?=
 =?us-ascii?Q?ulO1y1q7sAB7k5ULHMpBvPgtxBjz9jK78rykk5d05d0u7V5VblxdtE8W8eUj?=
 =?us-ascii?Q?t7QDzhEVX+HzJtvukgcmGqVMRr1y7vyiswpfWJEr4HI4fYmB7BTdapwzIH9L?=
 =?us-ascii?Q?A8cAztsg2vql5rANxhiURGcySZG+W5LPWgyODdZs5Y0vFscYhM4q5QsbSzGV?=
 =?us-ascii?Q?88vAc6h5d8GKSAb/pMoCF0nPh4vFz1tZVuJJ7bgJar29Hdo5TlhT0lwpfo9a?=
 =?us-ascii?Q?JJWeim+8rrMXjTE94HH88OSSfjphxFj4v4LJObA4voqF7BCd+15zv6vYzfQh?=
 =?us-ascii?Q?HzIDftt3bMNeUwwYcL3gENldXkL1QNN9XYG/kIowVrlxvVc5FP5cHMPq8Q/q?=
 =?us-ascii?Q?i2zdFeFSrqUyqxPh/k+FfSM/ik3xOE0FfAci2kFGqLCTOcmprGnlnGryus/B?=
 =?us-ascii?Q?C9CAzyUnaBGtCC9c+xMxvxzdinjmLTgRt8XXWESnB0s7TBEBX+xnTiWioXhW?=
 =?us-ascii?Q?wFJUZ63fxVSuEkMZlgxxHRhIwCzD0nnVMwfCWura/3hOpuFZ/X2UGyX6q5Tx?=
 =?us-ascii?Q?MJVEwaBYTTnzJcdG3B8nH3yxQ6IdMd+TgFw/FpJtsbehtFXEcxA6Mtl8oHKB?=
 =?us-ascii?Q?DXp9sc448jqeAxBa8wXAIKSq6XpBj1wkCqeGALeDMZXSEuKSVuEzOFuwBT5i?=
 =?us-ascii?Q?O8GzcIKeVnaR540l9Z101ADJhfiRnq3mRCKNr83CzCHfzl85oO8bIxEpNC+7?=
 =?us-ascii?Q?WE4sRHwvnOYCKuMdrQ9ByEUr2b6bNcZH+21ytGeuekX0AQbO4glQpDQtEjVL?=
 =?us-ascii?Q?BNaxV/e+bL+8dQlEr0hfNcDC7t6yr3hpzCTlxMkAM4SunAYbXib4x1rCQjbG?=
 =?us-ascii?Q?sxM5BJKxun5vbD/gkrea2/fZMWriS/lm0Yw7t9seezJFTCaEZdt/u8CeTusc?=
 =?us-ascii?Q?3RAfHQVGYRyquwmFynKmFr276TCYCnBWVsgkfH8mvopuHqce3tKTQhfhvJgr?=
 =?us-ascii?Q?gF4u1ARTQf+Q+aAIa53oClCQhEeIgohjijZTlMTL8GnXMmwPaukte2gjr+74?=
 =?us-ascii?Q?gbds0Bl5+meCqLFTbeiMTRgJMIBGUJU4I10d?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(14060799003)(35042699022)(36860700013)(1800799024);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 05:32:16.8383 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 481be02a-75e3-464c-7085-08dddee1c2a9
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10774
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


In the past I've seen (and contributed to) hacks that model the chips as
phy or even (really!) clock drivers. Since the chip usually sits between
a signal that is (almost) HDMI and a HDMI connector, I decided to stop
lying and write it as a DRM bridge driver.

Our experience with these chips is that they work best under manual control
enabling them only once the signal is active. At low resolutions (under 4k)=
,
the optimal setting is usually to only use redriver mode. Setting the
termination to 150-300 Ohms improves EMC performance at lower resolutions,
hence the driver enables 75-150 Ohms for HDMI2 modes and defaults to
150-300 Ohm termination for other modes.


Changes in v2:
Document driver specific bindings like slew-rate and threshold
Use atomic_enable/disable
Use #defines for bit fields in registers
Allow HDMI 2 compliance
Filter modes on clock range
Use cross-over pixel frequency instead of manual overides
Devicetree bindings according to standards

Mike Looijmans (2):
  dt-bindings: drm/bridge: ti-tmds181: Add TI TMDS181 and SN65DP159
    bindings
  drm: bridge: Add TI tmds181 and sn65dp159 driver

 .../bindings/display/bridge/ti,tmds181.yaml   | 143 +++++
 drivers/gpu/drm/bridge/Kconfig                |  11 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ti-tmds181.c           | 561 ++++++++++++++++++
 4 files changed, 716 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,tmd=
s181.yaml
 create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c

--=20
2.43.0

base-commit: 53e760d8949895390e256e723e7ee46618310361
branch: drm-ti-tmds181

Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=

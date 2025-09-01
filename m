Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37960B3E723
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 16:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6462E10E101;
	Mon,  1 Sep 2025 14:30:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="J/CmX9W9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11020087.outbound.protection.outlook.com [52.101.69.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C5210E101
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 14:30:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QHreXeWvXfRKZfUA3rTNEMtXQQMejLmFYuzO7+tvd+dTdNJbGXuM8nXSK931NOuYb+/r2/8gPK+ZUxbe/inKK58Dtz/cgT3pwYnGVpA3ZlNWlE4aXTDZLP/5Dtlzb1/JNY8jZG5kINZ/U/P3BiW0gBOkYKV1Q6rqS+ltniSyyJK/+H3I7NK6emMqnyfw3rUzrddBZigAO1o2d9lCidUpZ+09x6DD3CqVspLc/FU7c4EpOW9Hqt3bSMktQ6Hn4cLLBMY9YY2KuUtAkkh4r3Y+jpq3pDpm24j1dtpoF6cIvUxVgp3nQUpCnaJ5K7Xr2aLcTdfR/fXK4KaJPfX1EDuv0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BBnHM2BdxqnQPTrxrymFATPU7tr1ZKtwBHTZXRXJrw=;
 b=bEcgBrvYi9RaBM90H4ywFRZ0g9ppfVTzB3mooiWSrsQknO3XhRmYrUYQVCFxN0RryWjFCfWNrRkc4nrptTRD9rNo1nLiO769idU5mRAZXsqXtKgO0YSIYKD1TUXD+BUGwfcVX88KCbdRQalf0MMMp/YvRhQhOLheZOV83BWdXr4WMvCg9I9E89B+jHavoW9dSK0Oyf/niCiL4jCqa4GA2f1VvExO0w6XH16rTbU3ZrSQKlLpwlGBasm0wB7th0ZsmCeHpWQF7ryCG3vVOFK6WFU5yV3xAGCIk0eg+VVgrByo8xukcqbdZ2WjKc6lLSz4RS9bH42/2lDCy/X/zdpfNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BBnHM2BdxqnQPTrxrymFATPU7tr1ZKtwBHTZXRXJrw=;
 b=J/CmX9W9cBZqYwbCM1gIKlmd5rz2MU4rmLt/q3RsTV1KvK8cfYsPW4GjseExsbf+n08rLAovSZ2ixVWhw3PUfJOChIJ3EGXmNbRpehrVeqkwq54UGAvV85g2cDwyR/wZB5ittCZ5xv94Ya2QvSsEwKoKBQHjLF/JYRqFaWX+zbT6WsFTM1JolTO1dFjJClmY6l6seXFfDyrS3zd726vDRSoRnrUojCabIjOrR4sRG6YG5aghH6frg3a4UfiIho9MmgxhV+8Ba5rkf/QB5iSx2qXp/lZRX6jiHoC32Wfj3zd8q2WIWd+7M4j7qTS666QolYCb/TWu7lY/h6kHju5oyQ==
Received: from DUZPR01CA0086.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::13) by PAXPR04MB8302.eurprd04.prod.outlook.com
 (2603:10a6:102:1ca::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.15; Mon, 1 Sep
 2025 14:30:09 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::c0) by DUZPR01CA0086.outlook.office365.com
 (2603:10a6:10:46a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.26 via Frontend Transport; Mon,
 1 Sep 2025 14:30:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.11 via Frontend Transport; Mon, 1 Sep 2025 14:30:08 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com (40.93.81.78) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 01 Sep 2025 14:30:07 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PA4PR04MB7806.eurprd04.prod.outlook.com (2603:10a6:102:c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Mon, 1 Sep
 2025 14:30:04 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9094.011; Mon, 1 Sep 2025
 14:30:04 +0000
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
Subject: [PATCH v4 0/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Date: Mon, 1 Sep 2025 16:29:00 +0200
Message-ID: <20250901142958.843678-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM8P251CA0009.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::14) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PA4PR04MB7806:EE_|DB1PEPF000509ED:EE_|PAXPR04MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: de6c9093-10c1-4b01-39e7-08dde9640d25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?09T+9B8y+ojBPywdA58bkGP48TwqgQHEOdh5gI1IwwysU5LHXO921PuCRbS+?=
 =?us-ascii?Q?lc9J4CPWiil5oxlQLwmFaLoXl2+UxENBIt6ErFFYwjPq33QWMjjfm/G0d+c+?=
 =?us-ascii?Q?TReyXNxtUkykMBT/Kf9VxfDgDK3/4tKxe24gm8hoz5L7JZLfhIjHnhzDYGB9?=
 =?us-ascii?Q?Pe12qa25m5LMWr0LraQJCfqdhO3Fq+LFzV0SG/PPjkwOShxsAkRk4qlWTSsD?=
 =?us-ascii?Q?kReloZBlFKWNLCzdczWKXskJPkzmIlYoXJ4DRaqGElh0/PU1jaEyo4MyJxth?=
 =?us-ascii?Q?UOLfLvcz3R8a0a7qrwPG547EdMiOO0PDfsWNU7jHl2VNW+ARhW4zZQUh0RNO?=
 =?us-ascii?Q?OAEltpMnrgB3G1E3duyVfWqCVlJitbpwoV+ZRtrvFEwKCEfeCCY4H2sOu6s5?=
 =?us-ascii?Q?Z4vn2ehOyjh0V0Nz6mLObcaRoCKM/vWont0QKS5IDX8MRXQcOUGC9AftQpyc?=
 =?us-ascii?Q?N9iEbLiH+Q64yREe+XipxP6PBdcM68NQjJutIwAXMp+2GkaS8wx7aC0fSV+0?=
 =?us-ascii?Q?PyfdjsUlpRTfVCquuCUyv+ydpeoXwfJyF1qqb22m2ZrSZ4ckLd0ANXmE8fqG?=
 =?us-ascii?Q?f5nCSfBAMc90PfxJvLntKZT5AdCESf1mJJbUsMOk+Rd4HnKnQ5xUp2qJdX4/?=
 =?us-ascii?Q?4jL63GzyWYIA0gTyXcTghVpQ/U2OviXcvQupIWNHSUYvfHGNNVkYpWBtF9lZ?=
 =?us-ascii?Q?Dy9adoU1vPmcPIevxlaQU2SHrsSmDf90ADWRPCrc04i5PKYF2yY7ChrtrNVg?=
 =?us-ascii?Q?xzCyF0F6HMv7VoBNe+zVu/PHJLtfYEoNaM5VIOb3KqJdhOeapYIC3SfGS6QI?=
 =?us-ascii?Q?Q2uYUewHnvWTsQ1P6HAHfUkLZKHhoUlxomB5C09MRWReANiGYWAFap3H1f7r?=
 =?us-ascii?Q?/2v7Ynd2Acz6j4rcJDeWdBiTYp9HHz9vJdluINm+T7PHlQSgEw58AVqUy5xr?=
 =?us-ascii?Q?KsSbHVmVu5+iopmkN4e+9YO3VLVlQXgG09G3qUxTOzIsZSC59C3Kyln8QAyM?=
 =?us-ascii?Q?QDcokn23ayli+v0cVAvNSNXYiJFQ7IlWryVv+uQ3EYa8q5wyGn/Xm2TGD01E?=
 =?us-ascii?Q?JuKQUgp3nlO5x9Ck7N6L63bsD1tAJRFOzt94R0o2T4OT7cBRT7nUOh+5Tc4t?=
 =?us-ascii?Q?J7NZVEVjvNe3ufX6blWGknVOERUidFYRVIYhKWIOvZCdjXpyk5QKSjpuHlrM?=
 =?us-ascii?Q?ekcQWXLiia7zSdCACJCfLW2ydTpPDjL71bBqar7mNulIcIWw7QdeD96pVdLq?=
 =?us-ascii?Q?d5CMd/UxPGO9X8SIYk07knAxRTRa4XBV/g45Yu780cnijnQVqDHig2imK8VQ?=
 =?us-ascii?Q?zLk5tAK2NjYHPlcd4gbeGoKfSePNNTDvCVEcZQgV7I8dkdTYuANgQIRdnptp?=
 =?us-ascii?Q?OACHe6ct5vdCB4DKTQ3LKy5Zq+8zIZ7fnmqoIQywseiaxe3uJk3QXaK0aUOu?=
 =?us-ascii?Q?jEY7vcqPgCrP6GUxGrDroBVew/RrUvcoFlQKiHa30PkRCGdJYZwkVg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7806
X-CodeTwo-MessageID: 3df33c9c-ef57-4404-a30a-f6360855418b.20250901143007@westeu11-emailsignatures-cloud.codetwo.com
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.d6331613-729b-4f92-9c2d-d2abe6df38d5@emailsignatures365.codetwo.com>
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 97fbac1e-6c81-4175-a11c-08dde9640ab2
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|14060799003|1800799024|82310400026|35042699022|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t4nWL0ITFsmo3Z4ABFq67kNL/ktxGVJJfB/L9AQ8ri8d1kpzOusM7ab0jtj8?=
 =?us-ascii?Q?coyOtTUoPeKXpBD5LVviW9WsuNtwondmqUH439gy71wwVg8CAP4mS8gqTFKi?=
 =?us-ascii?Q?FwEpyEjGgTXsnd/72sDzhvV+a0g0UkbgrDulbZ77cJEsy7IwnllzQ70xJ4Ej?=
 =?us-ascii?Q?97u7B+AlYWsam5+ODf4OcvzFzNwNmd6My3C0ta1OhY33oOGJSedjc5lf3v2N?=
 =?us-ascii?Q?Rt2ZtqsGRQbXNwR8kShNTWlzrMNifJGObZocNVJZ2pWGbTHDMcUPmORD2Zbd?=
 =?us-ascii?Q?CxnxrLAPDg+ROfvAcMwlMSLVY5+dQxkrPdnk0CL/62yaXTtoGsO7BcwEtFgR?=
 =?us-ascii?Q?480cf/OQyc3uJNR6TeFupz3gEJu6c3aKBABVvjt79jeYeVKf27uqUSaT1Gu0?=
 =?us-ascii?Q?s5dn6A9mW/SwfGLBZZpP/5g5PSyDKjn55yBA0UeXosNNfYrZ17C6jbrmGimw?=
 =?us-ascii?Q?zuTf1yD8wYvcSOLG1PzKEqFi93mzFEnYnKWunC/FEsIqwI4q1MP6ug+UlO6E?=
 =?us-ascii?Q?1ommUS1QbKIJ200GWIpm1CsSRD7fA4bMNmQT51eYdGninO6Pehv08uPccagJ?=
 =?us-ascii?Q?K3gX6JyotwkZlOIEbCStFaujYS2DmFOpedcymSvQQXLzdN7QVpGWE0TkMSln?=
 =?us-ascii?Q?I4+LVuZM7fuU8pPKrG1YiT+pWlqj8n2J3CKqZB91Qe+dwuhuTqTdlXNQ1BeE?=
 =?us-ascii?Q?6xr/5aapJqcLll22huDsLvf3UQ5Rk8hoIvk4WwTOa48CNFXJaOzg+YwbgQOE?=
 =?us-ascii?Q?NhOrK53IJaogSZ5yLihiERIEOi4rNsAbmL9IAIZuWZdFcAoC6dJs2Z8GtlJi?=
 =?us-ascii?Q?yJ/ku8ttG6Z0EC8zmI7/psbnVHQSwny3qOjIDGIIINpNZLkQgdfEx/Zg4T7S?=
 =?us-ascii?Q?47ip/tSIVk1L41LD9IDGRnmryCE4Onlh6VpY8EIcT4miejudXtKZSwqEAoLy?=
 =?us-ascii?Q?vYcHOrnf5sdkUgm1ihlDkAqch+MQrwk/h1MjV/rt3+ROTKFM0MY/z3wXOP65?=
 =?us-ascii?Q?D6KcJcoyQXRkvHAOd0jX9W7JOjUWfphDpsgg+cyiyW+cEiH8b8oudx1LN2Zn?=
 =?us-ascii?Q?HsD+Tbi8dkH2UOMuwv47QIjCknipRQ2LXEza8tD2CbbZCnjqhC4Xlhf//D34?=
 =?us-ascii?Q?DdL5lTP+CYB6s6UznpUojJWGrpX5AYCQtfrIrJCfztS3PA9tTtAWJVeYg+9k?=
 =?us-ascii?Q?AdultWYrlAZFi/lvFRhWSCnodheP8g0a8uH6ebSc5+kMPn2FeYmvbAUOzn34?=
 =?us-ascii?Q?hw4jWxHplaCTNEb01plWZONkPQXMfcwU/T/l9ajV6HpOIcaqBoAMQjdVPgc/?=
 =?us-ascii?Q?niyrHfmZtImcGTRr8exVkshIRGiI45+DuIb8hl6x87pT5Yocd3km1IieFsUM?=
 =?us-ascii?Q?8MHu6k0Rm6DMVZGzDEAdTVMhsiM+cKzlegPRe8n3vb06frJCweqT46jcaaUy?=
 =?us-ascii?Q?kZkwrCKDpog9aIrf4FWNrwD5ZVKilta0?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(36860700013)(14060799003)(1800799024)(82310400026)(35042699022)(376014)(7416014);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 14:30:08.0306 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de6c9093-10c1-4b01-39e7-08dde9640d25
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8302
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


Changes in v4:
Use fallback compatible
dev_err_probe, this_module, of_match_ptr
Use fallback compatible in driver
Add vcc-supply and vdd-supply in driver

Changes in v3:
Fix duplicate links
Add vcc-supply and vdd-supply
Fix missing type for ti,slew-rate
Lower-case hex values and use defines for EYESCAN registers
Remove equalizer code (unlikely to be used)
Remove attributes (no longer useful, undocumented)
Fix build for 6.17 kernel
Use devm_drm_bridge_alloc
Sort includes and add linux/bitfield.h
Check chip type and complain on mismatch

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

 .../bindings/display/bridge/ti,tmds181.yaml   | 152 +++++++
 drivers/gpu/drm/bridge/Kconfig                |  11 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/ti-tmds181.c           | 401 ++++++++++++++++++
 4 files changed, 565 insertions(+)
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

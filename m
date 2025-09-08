Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC64AB483FC
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 08:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34B910E462;
	Mon,  8 Sep 2025 06:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="yAT2Oupu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11021107.outbound.protection.outlook.com
 [52.101.65.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA0110E462
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 06:16:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8CZCQ72jApAbykkvulpvN3GrZJDD04A6kOkSIHjEuqIqaAZXSUo6L1tlnhkTsRENnQioZdzu0HIjkGv+nGq+XdFqS9oQJTTgoFE2C9GMvwRp9Uy34XG6NE2wvBfcno4uA5gWfNuyAtMvdfsmoMfBJaBjdVxHmQWNIdZ3WZVeFrL8749G74pN1mSupcNmfwe/0pKkGmhB2wQgRV9MbLaCoo+2i7gtSW3SWSyPmPWNsUMhZ9xS1o0wZ1h+ZRZ25M/YUjy2EPODiuGgKxCygTbTfqyZUc18Z8bxOne50pzYfc/BJBwBJ5rKRnmrAaUToskVMYkqEmfEylm4eQttmT5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Er+3QL954+3GC3Z+lQcBibK5maVSCGMNQZYzlJZFdXI=;
 b=fD53P3vB6s2pLvXZfGFTlqxmp76Q+todzVVez6t1caROiG1qDlzf6+u1/mA/9jIvadRSvNnCi7AOyyKZiqL8C4vSIAUtT8o7ZNAZdGX7hP38oj3JWq5Kq+061LUbAnKvmbPKDYLxu19y9yhtmHQDz32GLm/f/mAggwj9YvtGhJLsBOUNKQjIjpOJ5Y2ZUx10bvVaxGnXuLEsfpeZyuF7dk0SXPPKTKAqZj83xbIZnQczhhmMNX9jgdwtVQF0uLH6J85HT4WRv+upp5hD1lfnu9r4LzaIGLzATHuVhKlrAhsAwoTIisvMyOcd2bDhDiZMhwjxQM65cQ+HEuMlKWTOng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=topic.nl; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=topic.nl; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Er+3QL954+3GC3Z+lQcBibK5maVSCGMNQZYzlJZFdXI=;
 b=yAT2Oupugfu8bl03ZTHQTuHYQE6SsB/mHBvWX8Bsy4P47pLIFwVuOmpwJa+FMl0bgeDjFfMOmIsEmOXucOI5j7Hv/JREr4cDiWyWPxsUt7avSodr/ApJdC5cltu9dpLzYb1O/LOhbhUJ330okgm/mQIopYSwYZURowElW6hZxmDsxlbyUOz4FDCNzNlnPK93M9j7ysHIniJuKTIerjZ0B9cBOA6fT38T3LW/wzb48S2J+1gyRfcuFQhg3fdD3KMgIxk9UXH7gHQcIVkH4Ukf2bG8sNEOLSBDekg3Os5byUS2elAUPZYouHCFyarM6+Ph3wXSLGG3DmQzSBrQWhIhBg==
Received: from AM0PR02CA0182.eurprd02.prod.outlook.com (2603:10a6:20b:28e::19)
 by AM7PR04MB6936.eurprd04.prod.outlook.com (2603:10a6:20b:106::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Mon, 8 Sep
 2025 06:16:19 +0000
Received: from AMS0EPF000001AC.eurprd05.prod.outlook.com
 (2603:10a6:20b:28e:cafe::ea) by AM0PR02CA0182.outlook.office365.com
 (2603:10a6:20b:28e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.22 via Frontend Transport; Mon,
 8 Sep 2025 06:16:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AMS0EPF000001AC.mail.protection.outlook.com (10.167.16.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Mon, 8 Sep 2025 06:16:18 +0000
Received: from PA4PR04CU001.outbound.protection.outlook.com (40.93.76.78) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 08 Sep 2025 06:16:18 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by DU7PR04MB11091.eurprd04.prod.outlook.com (2603:10a6:10:5b4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.13; Mon, 8 Sep
 2025 06:16:12 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::b067:7ceb:e3d7:6f93%5]) with mapi id 15.20.9115.007; Mon, 8 Sep 2025
 06:16:12 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: dri-devel@lists.freedesktop.org
CC: Mike Looijmans <mike.looijmans@topic.nl>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
Date: Mon, 8 Sep 2025 08:15:58 +0200
Message-ID: <20250908061605.76787-3-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908061605.76787-1-mike.looijmans@topic.nl>
References: <20250908061605.76787-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.94313a15-b5dc-4467-815b-1439b9ed5ea8@emailsignatures365.codetwo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM9P195CA0021.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::26) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|DU7PR04MB11091:EE_|AMS0EPF000001AC:EE_|AM7PR04MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1d146c-3e1d-4eff-9ecc-08ddee9f3980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|376014|1800799024|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?0fquudwMVdBKWG7bHoOY/hDqLRW6HBndeMYx8KD3nnYR5Jr9LRc5hHYJjGvx?=
 =?us-ascii?Q?KMK+m8SybxF2Gg23fptKO8FQoh2OWVqYyH7V7YXDT1PVHzm+LliNJwuR+Q1u?=
 =?us-ascii?Q?lXfcT89bnjt4XUJsSafhqzWdCs7j4mOsiyyNH18w0JqLt1uUQuOGnLqmaFhx?=
 =?us-ascii?Q?VUEot+PWJOz8jcMXUlDwoLtlKuW6ZzvNDT1Ox664kxuYXRgzxR3P0oO17YJQ?=
 =?us-ascii?Q?N6c14bvqrxtoljUMAym9sF8lfhlBKD1EB/q8Vywstf+Tv/hmCiFB1GxpVGuL?=
 =?us-ascii?Q?rjDiBf6tlbaZNIfJnRZsZd9Mfyl4bzFwO4p7cTsXQjyT8YApQC14m//4SRdV?=
 =?us-ascii?Q?IZ5ceHU2r4SzmIesqCasObmLqGqezRBAVP4evwZBbVjFP8ytjEHjiDai2nnM?=
 =?us-ascii?Q?EIMrnDe5rzMvTQTW5tcFMbfXB2rRc4ruBPZ54KU7F+rfLA8ygwvWFL4z3zo8?=
 =?us-ascii?Q?lkK15HeZM0nWfpx5hjoQyRwqkZ1ELyiV0m6DvNeO4i7V60mKcka7nvG7gFXX?=
 =?us-ascii?Q?YrwJoqg8KeIyFfh2fOgAzyGPd/j+NpUP6WzpFCM5lzUSFgob4a/UdXEslqrt?=
 =?us-ascii?Q?rsQwyd5Ff50zfEaINAKKH//HA0gJuHbYXIAeNer6hTIASH8RKbmGcqXXre0v?=
 =?us-ascii?Q?WwKz/DBPI37DinKXyloH0PX1MEYVniCRAOTnPAohJm8EoRxGUHTRp6AEa+5W?=
 =?us-ascii?Q?cWgejMJ9st1aAafF1BNxDDuQHBrVazHi0d8PVpgI8fNm3th6zXsO70vd3w54?=
 =?us-ascii?Q?GGXxmzlpw1/j0p+dD750/WBEno5HWGLOg/HHtewPA0hCX5eZcmm8v3HJu7I4?=
 =?us-ascii?Q?zSIZUVrzESq4spqM2l5R78dkmzD16RQIRqLyy9Z8tlhabu1mN46qa2ODGlGX?=
 =?us-ascii?Q?myfriirhzYgRuiY21QNGr44qmdbYTqNCHs7ko9lygGQfN+jQzGAmlkwqXhLr?=
 =?us-ascii?Q?3nAwLCGIQ3MvHl1qkpx7ELa8o7jnMHBYH6BCZgnteU/M0BBv5ONO/B6SCGM0?=
 =?us-ascii?Q?Lb2Wec1diRBkLm/fjMjOUFO1JYE+/8BfpbBZvGBW0DN1XhV0raQdfZRy04Sm?=
 =?us-ascii?Q?xC2EgTwy8lknfb6f56M+bHKnn+lDmaJH2CamoNAWzDi9rRYSR2rhIBsZkw87?=
 =?us-ascii?Q?B4mD2F6h7khnieg+I1nRr0xcq5xEdNMxbpcfb9Ha25gtx0wC/jyxU2UnB971?=
 =?us-ascii?Q?vXs7B+K43Ds2FFHOxX/3xlJFb6zsV1Mk6QpDPpkOsN/NxHbXvhu0nwdnQAr3?=
 =?us-ascii?Q?uUUCN+gHHKaU+zQmuPh3d7H2MZSrDAEqbAVFd4NcFok7Y5lLul7JNJU3ajtr?=
 =?us-ascii?Q?+wB6EwZ3iREz5GJLFgsI3I1EjU2ZnjYeCcwHeHgfst2azhPHGmc9UCBI8sNZ?=
 =?us-ascii?Q?dEEs+ExfuPoZ2u7aaLqzKNUXvGp41eVaW8oSNx+Da1Q6jg6DkK9tk+t1JjXL?=
 =?us-ascii?Q?PyPTIlKFRtw=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11091
X-CodeTwo-MessageID: da6aa174-3cc2-4cb8-8f79-b1179c739700.20250908061618@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 59f9f906-01f2-47c3-72bd-08ddee9f3572
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|35042699022|14060799003|82310400026|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d1YPVj0Tu0T58Si5nn6xYsPQ7zXN5jzwo0D4LzZgXlxmlVfRkL+v1lBJwAuC?=
 =?us-ascii?Q?D9/b7liAt8taSZx3SIBmeWd3W/VzSgQAh/Wx6AH3Cph1xleUZq2uOpOWfWSC?=
 =?us-ascii?Q?53J5k1q/Cz8m8TSiVvEfjDqX4/234K4niRx4MrYQSImlFO6qkXBHIXXhorRB?=
 =?us-ascii?Q?+qMyIX0VXYFZJ4p4NMTwd/GqTn0XdL0N2TsR2OWqzXHfaQMx9HD7kW9/wez1?=
 =?us-ascii?Q?XQrastyvbpWxKg5I5+i4vDuIk72qopVsFiFq9CUsZ5jQofRFTQ3W59sBKRYI?=
 =?us-ascii?Q?aMnsq4mzYFHISAkJb2s9BwaSrP3I/v5PwbO1IdNAFBP0scY3BPu/dr0cIDnR?=
 =?us-ascii?Q?7UCDucbt4LHW3j8kEMkkC135ZHCufRT8kIhgP09b6+3tPQ/9aUCIbsY0mgvh?=
 =?us-ascii?Q?TsOu/q1vIoevs31axGv9/KJJUgX3w1zP44zt7/H6K5PZdrOdeNxvnWIqMVh3?=
 =?us-ascii?Q?oGpBpPPczAmsXJMmoLAjkukvFEDCfLDZqQ8RdFxrF8oPZ819uPUH3pdelhp9?=
 =?us-ascii?Q?tIuZQ5qgPiEeBat5cM9KquoQAeFsMxzKw5PkTlgf5IxwARXmYYWaHyGa5jaV?=
 =?us-ascii?Q?QxsECqCwxYUlyfGP470qmxdLDdZA8zYhtI3oiQlyLRH5rSZRx8iudwCbo0ny?=
 =?us-ascii?Q?YadYTxmgmqDT8KCz/g8fbWagIrY5BLP3PapYx3ECrFZbZJTe2NOMPlz4H3UH?=
 =?us-ascii?Q?Wal3r8eldPN0HZYM3F/lK43V2/YG95WIU7WfjzJOv4U+SVBeuOQDavlHzm1k?=
 =?us-ascii?Q?fA77wZm2vXDiNrz2Gw7E6gc/6MN7sHiOMJCSSSW8TTjMzqoW3LOVKJFav6FQ?=
 =?us-ascii?Q?Qx12VGjo8L2bKpAvDfD/1/ZutY8a4Q6On05X5WllE/4oTxRklwRH3fBm/nrf?=
 =?us-ascii?Q?R+ezVNgKwOP8iz4OTeVVYPbpnM8bePOtToWnbGAIs06yNsYxfxINuVPGWmSz?=
 =?us-ascii?Q?TYnzkMm7akzIplfc8IulTLF48SvluFbvvYvVRCMlxZBkNGktcUtUZZR6nHWU?=
 =?us-ascii?Q?XPN6FnQyXvfRxIV6JWFvT7cvD/jp6zoQDBaANlYqFPTRlTE2TfLarz6gRPo+?=
 =?us-ascii?Q?BVlE/F/692xLWNmdpx8VgsaKiPF4WVyzgpaeffFVrxNc+Z5BBxTHZKxFBztu?=
 =?us-ascii?Q?3Amp1zrYOHl8mAtPKkpeWt+xr8iGS9Bq9PTO4UVk5NgUXr1e9q/MX4+p2zZC?=
 =?us-ascii?Q?DjIO+pHCU7TnB4PXUg5Pftz1x3Srp+j+Y6tOTT2huDrxHsW+IYfPQ7tPfoqh?=
 =?us-ascii?Q?4n5fNk3GaLAGHe8HftWbAqLaRNelzDUHjkn3EbSK7h88GNhPoZ8AYA6UkOdT?=
 =?us-ascii?Q?eSKCTMdz2VLFkk3vLcuf7fcgcjEkkgjlpCnYrtM91Ld5fRLVW23aeUIjctQM?=
 =?us-ascii?Q?TWxbr0xPDEcaVXAJad4W+2Igvq1uTUkOTeODI0QOvNbLmmJy1x8m84eDGjzU?=
 =?us-ascii?Q?qfce0ADcpyT/WUE3RcQF2ScUklj0bZl2?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(35042699022)(14060799003)(82310400026)(7416014)(376014)(13003099007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 06:16:18.8079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1d146c-3e1d-4eff-9ecc-08ddee9f3980
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AC.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6936
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

The tmds181 and sn65dp159 are "retimers" and hence can be considered
HDMI-to-HDMI bridges. Typical usage is to convert the output of an
FPGA into a valid HDMI signal, and it will typically be inserted
between an encoder and hdmi-connector.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---

Changes in v5:
Really added vcc/vdd regulator support
"oe" gpio is now "reset" (reversed logic)
devicetree enums ti,equalizer and ti,mode
Always disable HDMI_SEL (formerly "dvi-mode")

Changes in v4:
dev_err_probe, this_module, of_match_ptr
Use fallback compatible
Add vcc-supply and vdd-supply

Changes in v3:
Lower-case hex values and use defines for EYESCAN registers
Remove equalizer code (unlikely to be used)
Remove attributes (no longer useful, undocumented)
Fix build for 6.17 kernel
Use devm_drm_bridge_alloc
Sort includes and add linux/bitfield.h
Check chip type and complain on mismatch

Changes in v2:
Use atomic_enable/disable
Use #defines for bit fields in registers
Allow HDMI 2 compliance
Filter modes on clock range
Use cross-over pixel frequency instead of manual overides
Devicetree bindings according to standards

 drivers/gpu/drm/bridge/Kconfig      |  11 +
 drivers/gpu/drm/bridge/Makefile     |   1 +
 drivers/gpu/drm/bridge/ti-tmds181.c | 427 ++++++++++++++++++++++++++++
 3 files changed, 439 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfi=
g
index b9e0ca85226a..753177fc9b50 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -430,6 +430,17 @@ config DRM_TI_SN65DSI86
 	help
 	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
=20
+config DRM_TI_TMDS181
+        tristate "TI TMDS181 and SN65DP159 HDMI retimer bridge driver"
+	depends on OF
+	select DRM_KMS_HELPER
+	select REGMAP_I2C
+	help
+	  Enable this to support the TI TMDS181 and SN65DP159 HDMI retimers.
+	  The SN65DP159 provides output into a cable (source) whereas the
+	  TMDS181 is meant to forward a cable signal into a PCB (sink). Either
+	  can be set up as source or sink though.
+
 config DRM_TI_TPD12S015
 	tristate "TI TPD12S015 HDMI level shifter and ESD protection"
 	depends on OF
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makef=
ile
index 245e8a27e3fc..f4b5089e903c 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -39,6 +39,7 @@ obj-$(CONFIG_DRM_TI_SN65DSI83) +=3D ti-sn65dsi83.o
 obj-$(CONFIG_DRM_TI_SN65DSI86) +=3D ti-sn65dsi86.o
 obj-$(CONFIG_DRM_TI_TDP158) +=3D ti-tdp158.o
 obj-$(CONFIG_DRM_TI_TFP410) +=3D ti-tfp410.o
+obj-$(CONFIG_DRM_TI_TMDS181) +=3D ti-tmds181.o
 obj-$(CONFIG_DRM_TI_TPD12S015) +=3D ti-tpd12s015.o
 obj-$(CONFIG_DRM_NWL_MIPI_DSI) +=3D nwl-dsi.o
 obj-$(CONFIG_DRM_ITE_IT66121) +=3D ite-it66121.o
diff --git a/drivers/gpu/drm/bridge/ti-tmds181.c b/drivers/gpu/drm/bridge/t=
i-tmds181.c
new file mode 100644
index 000000000000..3005f549b1ee
--- /dev/null
+++ b/drivers/gpu/drm/bridge/ti-tmds181.c
@@ -0,0 +1,427 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * TI tmds181 and sn65dp159 HDMI redriver and retimer chips
+ *
+ * Copyright (C) 2018 - 2025 Topic Embedded Products <www.topic.nl>
+ *
+ * based on code
+ * Copyright (C) 2007 Hans Verkuil
+ * Copyright (C) 2016, 2017 Leon Woestenberg <leon@sidebranch.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/slab.h>
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc.h>
+#include <drm/display/drm_hdmi_helper.h>
+#include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
+
+MODULE_DESCRIPTION("I2C device driver for DP159 and TMDS181 redriver/retim=
er");
+MODULE_AUTHOR("Mike Looijmans");
+MODULE_LICENSE("GPL");
+
+#define TMDS181_REG_ID		0
+#define TMDS181_REG_REV		0x8
+#define TMDS181_REG_CTRL9	0x9
+/* Registers A and B have a volatile bit, but we don't use it, so cache is=
 ok */
+#define TMDS181_REG_CTRLA	0xa
+#define TMDS181_REG_CTRLB	0xb
+#define TMDS181_REG_CTRLC	0xc
+#define TMDS181_REG_EQUALIZER	0xd
+/* EYESCAN registers don't appear to deserve separate names */
+#define TMDS181_REG_EYESCAN_E	0xe
+#define TMDS181_REG_EYESCAN_F	0xf
+#define TMDS181_REG_EYESCAN_15	0x15
+#define TMDS181_REG_EYESCAN_17	0x17
+#define TMDS181_REG_EYESCAN_1F	0x1f
+#define TMDS181_REG_AUX		0x20
+
+
+#define TMDS181_CTRL9_SIG_EN			BIT(4)
+#define TMDS181_CTRL9_PD_EN			BIT(3)
+#define TMDS181_CTRL9_HPD_AUTO_PWRDWN_DISABLE	BIT(2)
+#define TMDS181_CTRL9_I2C_DR_CTL		GENMASK(1, 0)
+
+#define TMDS181_CTRLA_MODE_SINK			BIT(7)
+#define TMDS181_CTRLA_HPDSNK_GATE_EN		BIT(6)
+#define TMDS181_CTRLA_EQ_ADA_EN			BIT(5)
+#define TMDS181_CTRLA_EQ_EN			BIT(4)
+#define TMDS181_CTRLA_AUX_BRG_EN		BIT(3)
+#define TMDS181_CTRLA_APPLY			BIT(2)
+#define TMDS181_CTRLA_DEV_FUNC_MODE		GENMASK(1, 0)
+
+#define TMDS181_CTRLB_SLEW_CTL			GENMASK(7, 6)
+#define TMDS181_CTRLB_HDMI_SEL_DVI		BIT(5)
+#define TMDS181_CTRLB_TX_TERM_CTL		GENMASK(4, 3)
+#define TMDS181_CTRLB_DDC_DR_SEL		BIT(2)
+#define TMDS181_CTRLB_TMDS_CLOCK_RATIO_STATUS	BIT(1)
+#define TMDS181_CTRLB_DDC_TRAIN_SET		BIT(0)
+
+#define TMDS181_CTRLB_TX_TERM_150_300_OHMS	1
+#define TMDS181_CTRLB_TX_TERM_75_150_OHMS	3
+
+#define TMDS181_CTRLC_VSWING_DATA		GENMASK(7, 5)
+#define TMDS181_CTRLC_VSWING_CLK		GENMASK(4, 2)
+#define TMDS181_CTRLC_HDMI_TWPST1		GENMASK(1, 0)
+
+#define TMDS181_EQ_DATA_LANE			GENMASK(5, 3)
+#define TMDS181_EQ_CLOCK_LANE			GENMASK(2, 1)
+#define TMDS181_EQ_DIS_HDMI2_SWG		BIT(0)
+
+/* Above this data rate HDMI2 standards apply (TX termination) */
+#define HDMI2_PIXEL_RATE_KHZ	340000
+
+enum tmds181_chip {
+	tmds181,
+	dp159,
+};
+
+struct tmds181_data {
+	struct i2c_client *client;
+	struct regmap *regmap;
+	struct drm_bridge *next_bridge;
+	struct drm_bridge bridge;
+	u32 retimer_threshold_khz;
+};
+
+static inline struct tmds181_data *
+drm_bridge_to_tmds181_data(struct drm_bridge *bridge)
+{
+	return container_of(bridge, struct tmds181_data, bridge);
+}
+
+static int tmds181_attach(struct drm_bridge *bridge, struct drm_encoder *e=
ncoder,
+			  enum drm_bridge_attach_flags flags)
+{
+	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
+
+	return drm_bridge_attach(encoder, data->next_bridge, bridge, flags);
+}
+
+static enum drm_mode_status
+tmds181_mode_valid(struct drm_bridge *bridge, const struct drm_display_inf=
o *info,
+		   const struct drm_display_mode *mode)
+{
+	unsigned long long rate;
+
+	rate =3D drm_hdmi_compute_mode_clock(mode, 8, HDMI_COLORSPACE_RGB);
+
+	/* Minimum clock rate is 25MHz */
+	if (rate < 25000000)
+		return MODE_CLOCK_LOW;
+
+	/*
+	 * When in HDMI 2 mode, the clock is 1/40th of the bitrate. The limit is
+	 * then the data rate of 6Gbps, which would use a 600MHz pixel clock.
+	 */
+	if (rate > 600000000)
+		return MODE_CLOCK_HIGH;
+
+	return MODE_OK;
+}
+
+static void tmds181_enable(struct drm_bridge *bridge, struct drm_atomic_st=
ate *state)
+{
+	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
+	const struct drm_crtc_state *crtc_state;
+	const struct drm_display_mode *mode;
+	struct drm_connector *connector;
+	struct drm_crtc *crtc;
+	unsigned int val;
+
+	/*
+	 * Retrieve the CRTC adjusted mode. This requires a little dance to go
+	 * from the bridge to the encoder, to the connector and to the CRTC.
+	 */
+	connector =3D drm_atomic_get_new_connector_for_encoder(state,
+							     bridge->encoder);
+	crtc =3D drm_atomic_get_new_connector_state(state, connector)->crtc;
+	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
+	mode =3D &crtc_state->adjusted_mode;
+
+	/* Set retimer/redriver mode based on pixel clock */
+	val =3D mode->clock > data->retimer_threshold_khz ? TMDS181_CTRLA_DEV_FUN=
C_MODE : 0;
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+			   TMDS181_CTRLA_DEV_FUNC_MODE, val);
+
+	/* Configure TX termination based on pixel clock */
+	val =3D mode->clock > HDMI2_PIXEL_RATE_KHZ ?
+				TMDS181_CTRLB_TX_TERM_75_150_OHMS :
+				TMDS181_CTRLB_TX_TERM_150_300_OHMS;
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRLB,
+			   TMDS181_CTRLB_TX_TERM_CTL,
+			   FIELD_PREP(TMDS181_CTRLB_TX_TERM_CTL, val));
+
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
+			   TMDS181_CTRL9_PD_EN, 0);
+}
+
+static void tmds181_disable(struct drm_bridge *bridge, struct drm_atomic_s=
tate *state)
+{
+	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
+
+	/* Set the PD_EN bit */
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
+			   TMDS181_CTRL9_PD_EN, TMDS181_CTRL9_PD_EN);
+}
+
+static const struct drm_bridge_funcs tmds181_bridge_funcs =3D {
+	.attach		=3D tmds181_attach,
+	.mode_valid	=3D tmds181_mode_valid,
+	.atomic_enable	=3D tmds181_enable,
+	.atomic_disable	=3D tmds181_disable,
+
+	.atomic_reset =3D drm_atomic_helper_bridge_reset,
+	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
+};
+
+static const u8 tmds181_id_tmds181[8] __nonstring =3D "TMDS181 ";
+static const u8 tmds181_id_dp159[8]   __nonstring =3D "DP159   ";
+
+static int tmds181_check_id(struct tmds181_data *data, enum tmds181_chip *=
chip)
+{
+	int ret;
+	int retry;
+	u8 buffer[8];
+
+	for (retry =3D 0; retry < 20; ++retry) {
+		ret =3D regmap_bulk_read(data->regmap, TMDS181_REG_ID, buffer,
+				       sizeof(buffer));
+		if (!ret)
+			break;
+
+		/* Compensate for very long OE power-up delays due to the cap */
+		usleep_range(5000, 10000);
+	}
+
+	if (ret) {
+		dev_err(&data->client->dev, "I2C read ID failed\n");
+		return ret;
+	}
+
+	if (memcmp(buffer, tmds181_id_tmds181, sizeof(buffer)) =3D=3D 0) {
+		dev_info(&data->client->dev, "Detected: TMDS181\n");
+		*chip =3D tmds181;
+		return 0;
+	}
+
+	if (memcmp(buffer, tmds181_id_dp159, sizeof(buffer)) =3D=3D 0) {
+		dev_info(&data->client->dev, "Detected: DP159\n");
+		*chip =3D dp159;
+		return 0;
+	}
+
+	dev_err(&data->client->dev, "Unknown ID: %*pE\n", (int)sizeof(buffer), bu=
ffer);
+
+	return -ENODEV;
+}
+
+static bool tmds181_regmap_is_volatile(struct device *dev, unsigned int re=
g)
+{
+	switch (reg) {
+	/* IBERT result and status registers, not used yet */
+	case TMDS181_REG_EYESCAN_15:
+	case TMDS181_REG_EYESCAN_17 ... TMDS181_REG_EYESCAN_1F:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config tmds181_regmap_config =3D {
+	.reg_bits =3D 8,
+	.val_bits =3D 8,
+	.cache_type =3D REGCACHE_RBTREE,
+	.max_register =3D TMDS181_REG_AUX,
+	.volatile_reg =3D tmds181_regmap_is_volatile,
+};
+
+static const char * const tmds181_supplies[] =3D {
+	"vdd", "vcc"
+};
+
+static int tmds181_probe(struct i2c_client *client)
+{
+	struct tmds181_data *data;
+	struct gpio_desc *reset_gpio;
+	enum tmds181_chip chip;
+	const char *str;
+	int ret;
+	u32 param;
+	u8 val;
+
+	/* Check if the adapter supports the needed features */
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
+		return -EIO;
+
+	data =3D devm_drm_bridge_alloc(&client->dev, struct tmds181_data, bridge,
+				     &tmds181_bridge_funcs);
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	data->client =3D client;
+	i2c_set_clientdata(client, data);
+	data->regmap =3D devm_regmap_init_i2c(client, &tmds181_regmap_config);
+	if (IS_ERR(data->regmap))
+		return PTR_ERR(data->regmap);
+
+	/* The "OE" pin acts as a reset */
+	reset_gpio =3D devm_gpiod_get_optional(&client->dev, "reset",
+					     GPIOD_OUT_HIGH);
+	if (IS_ERR(reset_gpio))
+		return dev_err_probe(&client->dev, PTR_ERR(reset_gpio),
+				     "failed to acquire 'reset' gpio\n");
+
+	/* Enable power supplies while reset is active */
+	ret =3D devm_regulator_bulk_get_enable(&client->dev,
+					     ARRAY_SIZE(tmds181_supplies),
+					     tmds181_supplies);
+	if (ret)
+		return dev_err_probe(&client->dev, ret,
+				     "Failed to enable power supplies\n");
+
+	if (reset_gpio) {
+		/* Need at least 100us reset pulse */
+		usleep_range(100, 200);
+		gpiod_set_value_cansleep(reset_gpio, 0);
+	}
+
+	/* Reading the ID also provides time for the reset */
+	ret =3D tmds181_check_id(data, &chip);
+	if (ret)
+		return ret;
+
+	/*
+	 * We take care of power control, so disable the chips PM functions, and
+	 * allow the DDC to run at 400kHz
+	 */
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
+			TMDS181_CTRL9_SIG_EN | TMDS181_CTRL9_PD_EN |
+			TMDS181_CTRL9_HPD_AUTO_PWRDWN_DISABLE |
+			TMDS181_CTRL9_I2C_DR_CTL,
+			TMDS181_CTRL9_PD_EN |
+			TMDS181_CTRL9_HPD_AUTO_PWRDWN_DISABLE |
+			TMDS181_CTRL9_I2C_DR_CTL);
+
+	/* Apply configuration changes */
+	if (!of_property_read_string(client->dev.of_node, "ti,mode", &str)) {
+		if (!strcmp(str, "source"))
+			val =3D 0;
+		else if (!strcmp(str, "sink"))
+			val =3D TMDS181_CTRLA_MODE_SINK;
+		else
+			return -EINVAL;
+		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+				   TMDS181_CTRLA_MODE_SINK, val);
+	}
+
+	/*
+	 * Using the automatic modes of the chip uses considerable power as it
+	 * will keep the PLL running at all times. So instead, define our own
+	 * threshold for the pixel rate. This also allows to use a sane default
+	 * of 200MHz pixel rate for the redriver-retimer crossover point, as the
+	 * modes below 3k don't show any benefit from the retimer.
+	 */
+	data->retimer_threshold_khz =3D 200000;
+	if (!of_property_read_u32(client->dev.of_node,
+				  "ti,retimer-threshold-hz", &param))
+		data->retimer_threshold_khz =3D param / 1000;
+
+	/* Default to low-power redriver mode */
+	regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+			   TMDS181_CTRLA_DEV_FUNC_MODE, 0);
+
+	/* Default is adaptive equalizer */
+	val =3D TMDS181_CTRLA_EQ_EN | TMDS181_CTRLA_EQ_ADA_EN;
+	if (!of_property_read_string(client->dev.of_node, "ti,equalizer", &str)) =
{
+		if (!strcmp(str, "disabled"))
+			val =3D 0;
+		else if (!strcmp(str, "fixed"))
+			val =3D TMDS181_CTRLA_EQ_EN;
+		else if (!strcmp(str, "adaptive"))
+			val =3D TMDS181_CTRLA_EQ_EN | TMDS181_CTRLA_EQ_ADA_EN;
+		else
+			return -EINVAL;
+		regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
+				   TMDS181_CTRLA_EQ_EN | TMDS181_CTRLA_EQ_ADA_EN,
+				   val);
+	}
+
+	switch (chip) {
+	case dp159:
+		/*
+		 * Disable the "Adaptor ID block" on the DDC interface, which
+		 * could conflict with this driver.
+		 */
+		val =3D TMDS181_CTRLB_HDMI_SEL_DVI;
+		if (!of_property_read_u32(client->dev.of_node, "slew-rate",
+					  &param)) {
+			if (param > 3)
+				return dev_err_probe(&client->dev, -EINVAL,
+						     "invalid slew-rate\n");
+			/* Implement 0 =3D slow, 3 =3D fast slew rate */
+			val |=3D FIELD_PREP(TMDS181_CTRLB_SLEW_CTL, (3 - param));
+		}
+		break;
+	default:
+		val =3D TMDS181_CTRLB_DDC_DR_SEL;
+		break;
+	}
+
+	/* Default to low-speed termination */
+	val |=3D FIELD_PREP(TMDS181_CTRLB_TX_TERM_CTL, TMDS181_CTRLB_TX_TERM_150_=
300_OHMS);
+
+	ret =3D regmap_write(data->regmap, TMDS181_REG_CTRLB, val);
+	if (ret < 0) {
+		dev_err(&client->dev, "regmap_write(B) failed\n");
+		return ret;
+	}
+
+	/* Find next bridge in chain */
+	data->next_bridge =3D devm_drm_of_get_bridge(&client->dev, client->dev.of=
_node, 1, 0);
+	if (IS_ERR(data->next_bridge))
+		return dev_err_probe(&client->dev, PTR_ERR(data->next_bridge),
+				     "Failed to find next bridge\n");
+
+	/* Register the bridge. */
+	data->bridge.of_node =3D client->dev.of_node;
+
+	return devm_drm_bridge_add(&client->dev, &data->bridge);
+}
+
+static const struct i2c_device_id tmds181_id[] =3D {
+	{ "tmds181", },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, tmds181_id);
+
+#if IS_ENABLED(CONFIG_OF)
+static const struct of_device_id tmds181_of_match[] =3D {
+	{ .compatible =3D "ti,tmds181", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, tmds181_of_match);
+#endif
+
+static struct i2c_driver tmds181_driver =3D {
+	.driver =3D {
+		.name	=3D "tmds181",
+		.of_match_table =3D tmds181_of_match,
+	},
+	.probe		=3D tmds181_probe,
+	.id_table	=3D tmds181_id,
+};
+
+module_i2c_driver(tmds181_driver);
--=20
2.43.0


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

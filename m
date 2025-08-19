Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AC7B2C015
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 13:19:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DDB10E5A3;
	Tue, 19 Aug 2025 11:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="Eo908jla";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11021127.outbound.protection.outlook.com [52.101.70.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0285210E5AA
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 11:19:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RhRg9HkPAMmcpnCnK2h52Gpx+5XbXGQUV2C7a55tAz0RVlYPDwdc2E7lh/KWFZ7FSQ/yB8PRpC5dN2G9wuw/QZaMN4gcec+G+OMYynjTWmZxM/Cv/q4PEZ0UK5YgviHeMgdDOvK6g2oozF4j/ph6C4pApZUTPxnEy+NI3i4VOwarRhgdb4Cg9gGcmJfA8mc8Sw5XJfdPof3R++DjQTiEMfAJ7bd8wh5JS3AF2YEiwiSkdW5SbJC9Zo1j5b+6BrgFDf0wsNPdbJeSNQHoEAXIat7dCHeW1LbYclSENpCgRD+IsrfBcY+m3zujcf8CSV5kQ/oAVG0V8Z/uqjqelzNG7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IlRihHnrgtHbE85uX5aKpzAQowkW2KD1Etj37S/EIEA=;
 b=Ex9WROVW0JviOgcgveQLcM0ObOyZsG1DpWVQ8mhnek+KTI4dz4OE07Ju1gqcixQNasGkPyHwUfeetBArS5U/GRgtYIIm1Uc3G9mUu4e7TNqyOSWNUKGbxuEhiEO9ijCzBPZnldgWLCS5GJiKphuFiibrZfxQttXhGcqqEXErM2zFMz/oOHECjqx2xvzBfU9iCniLRzrBrZFDW6x8ej3lHCyIqE5vN98fLwPOLKvhK9ucpxWMCGHUn/JKbdeFuH1MznfyNpv4kJQYfCfE35o9/kMLMs+EMCZALoPBXtmYj0lpnR7Om0QfavPKydfCy30Xqgzh41TdON3Sns4yEZUKgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IlRihHnrgtHbE85uX5aKpzAQowkW2KD1Etj37S/EIEA=;
 b=Eo908jlaGKxjrMskft/wgsIzd5nftdPXZIMNGIa0j4SPJG0ydU2V+fT+/bBDbeYdmvz/2ac+CaxS/n4gpzNk6vYyk7JkWr5yUlJ4ZiCTlDPlcco5OUBxd8JlE5s7rqkPtgYRnxFF3NQ++9RPHR14SDRlOHWjRkI1wRjSTcU5dfKNEg917spbDWBp6w/1H99GCxHj0afkte4M7oqhqOiV+KyR+M7QJ/gXae1g4OL73gMq70Z2c3+823Q2g4KUJqE+dk/i1HWwHN95Vn35mlqcPxHmhlT1UWltgbxlQ4/MemQBLElPtEO6m5DMjd4NUpJYrAKDtDUgxQZlAgJj84FXvg==
Received: from DB9PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:10:1da::33)
 by AM9PR04MB8713.eurprd04.prod.outlook.com (2603:10a6:20b:43c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Tue, 19 Aug
 2025 11:19:17 +0000
Received: from DU2PEPF0001E9C5.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::3f) by DB9PR05CA0028.outlook.office365.com
 (2603:10a6:10:1da::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.13 via Frontend Transport; Tue,
 19 Aug 2025 11:19:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 DU2PEPF0001E9C5.mail.protection.outlook.com (10.167.8.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Tue, 19 Aug 2025 11:19:16 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com (40.93.65.31) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Tue, 19 Aug 2025 11:19:15 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AS8PR04MB7656.eurprd04.prod.outlook.com (2603:10a6:20b:29b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.8; Tue, 19 Aug
 2025 11:19:13 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9052.012; Tue, 19 Aug 2025
 11:19:13 +0000
Message-ID: <fcee104e-08f5-4502-b4ea-ffe7d42ba86a@topic.nl>
Date: Tue, 19 Aug 2025 13:19:13 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
References: <20250812145256.135645-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6fffab14-bc0e-422f-81bd-f55176f1f6c8@emailsignatures365.codetwo.com>
 <20250812145256.135645-3-mike.looijmans@topic.nl>
 <63xsz4p45hkz23z5hnqzyminrsr2s7m6u74csw244wmlaaihqa@4ib2opfe5l2v>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <63xsz4p45hkz23z5hnqzyminrsr2s7m6u74csw244wmlaaihqa@4ib2opfe5l2v>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P190CA0006.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::9) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AS8PR04MB7656:EE_|DU2PEPF0001E9C5:EE_|AM9PR04MB8713:EE_
X-MS-Office365-Filtering-Correlation-Id: b37b0be3-4daf-4bb0-4f83-08dddf123be0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ZVppTS90V29mNGVGcmN3MVFYWE9FdkdmVUJyd1pXWG5LQVJBVDRUcnowWXJ4?=
 =?utf-8?B?bzI4blhwdEJVVTVSWFVBazlMbHZNTm5EWVQxLzlNZ3B1U2RQWkpFQVNWckk4?=
 =?utf-8?B?eEdrM3ZjeDQ4TzlJdFFsUVU1Yld6b1ZrdjhZOWlRb3BkUnl2eW9lTk5OUEk2?=
 =?utf-8?B?ZXZZd0VTTW1QOUJocVFwcFhzVitqQ0RSL3hoSnNyc1BBZTZHMm9tTVE1b0hL?=
 =?utf-8?B?MlIzZDlZdFhTVmlSS21VMzJFaHhFNG1QeWZOckdySXpld1JYNkxIUy80bmtv?=
 =?utf-8?B?RGlXc3FCcktQbHNrZ3U5UUM3WGdBOWh0aG1NdCtqKzRBdHNlS0xRSzQ0RlBX?=
 =?utf-8?B?OU10dm1kRTMrUzlldXdpRWNIelVHajQ4NEprN3o0eHpSRlNOaUpoVlNoeVpr?=
 =?utf-8?B?M1dia3lndFpFRjhTeFpZY2JtTnhBR01mTGlYTGRYOEVGeXgvZ3drZWVkbEU2?=
 =?utf-8?B?WDZIVVl2Wm9JVit6cWZ5Z3RuT3FIV1JlaWZHS2NSUTBNc3kwNndlNmorT3Bh?=
 =?utf-8?B?eTFQWTRRSUM0UGwra0tkeG1iTWJPb2hhZ093ZkNvN2I4L1ZsSDl5ZDc5SmZ6?=
 =?utf-8?B?aVZXekhVdlpFZGNzME8yYmJkMW9kVDl0dWUvNWVNNGFmYSttcklScktUMlpp?=
 =?utf-8?B?VDRxUHVpcEVjZ2dZQ2QvcHBXOWxMQ0V2RzVYSjgraVN4ZGFRdmFmWjhZWjRv?=
 =?utf-8?B?Y0Njbm52ZjBEcXhadm8rN1V5bllHR1ByUitxbkVkMXgzVStBTmp3Q3FUcWs0?=
 =?utf-8?B?Mk5QQzEzbTFKcUpYUXB2VmxERmxXVC94V1F3d0tSQmdpZERBKzZLWjJJN2Vk?=
 =?utf-8?B?WUF4b1NrK0YyN0pXa21Dd1VTS1M1bFhVc0tRakQxdTFrWHk4SXU5YzkxT2Q5?=
 =?utf-8?B?eE85NU5vMk10RmZpd08rWDRmKzUyZDA0YVNiU1hZRi9vdkdYMlVkTm9xa2hh?=
 =?utf-8?B?bnpUMk1zVGJlcmRhVFVWajV4UHZaMVZ2WXhUYUVyOW9DNy9ocTdIZDZEZWRY?=
 =?utf-8?B?WnIyNEJoeGp3Q2hVWnBGWEpKOWNPTUlJdnRrRGc1M1FMbHdWUFZOUDFHcFNW?=
 =?utf-8?B?b2tNcEt1UHQxejFjVlQ1TXZUM284M3lubUtrWFF6eFh5WW1oR3NIbFZHOTZQ?=
 =?utf-8?B?M2V1TzcvN3NOU3lIcG0vSXlLZHBaYW1wUWFjVmR3cUVVOUNpZ05xQm5MWFV3?=
 =?utf-8?B?d09jUTBxSkNadmFWekU0MkZkM3NoME9ZMERtZllCQ2R5eEVWVFVGanRxUlR0?=
 =?utf-8?B?eWJrK3JTSDYweDlKRlVBamxNZDBYZGV2RzczQ2NlWDBMclptUk9mTzBnMmMr?=
 =?utf-8?B?MWZ6U0RxOVNYOFZIMkJ2Y21PbEJEU1JuaGlDMUFQSmpWcjNNNmFTVHZyWTZa?=
 =?utf-8?B?U0s0em9DUk9JVVl2ZHI4MDhQWmFWajQyMFhJWkhsSXZnYUk0YlZOcmZENHVB?=
 =?utf-8?B?eWNuMm8xYmM0UjdqYWViTlBPSFEvczRUS3pmOTVFSUFaUm1LTlhVY3puRnJu?=
 =?utf-8?B?UUl3VlNQaHR6WlRDcjlRSGtGSW8vUm9HQ1BYd1hURk5YOWg1bGt2VzBWNFJU?=
 =?utf-8?B?dHZQeFRoZThxSVJ2Y2M2UE9zNk1GTk9TRmx3R2tzbGlrSE9VekE2ckM3ZXND?=
 =?utf-8?B?aHRoYS85QS9NTSt5ZUtTK0lHMS9NYjJ1Q0kycVlBalQ5VEZqY3o1RzlLR2Y1?=
 =?utf-8?B?QklCaEFTUGdBb3NUM1l2eWsxUFNjOENnQXRtME42TUpvK2ZXQ2FzMmdHYTkx?=
 =?utf-8?B?dUV1MXluemRrVVhpK3JkMWkyVTBIVkszRk5IZ2JaMGxqVDdlb3ljcGdPeDQz?=
 =?utf-8?B?ekdqWjBMOXpXUUFDSHpTU0lHTitzWTZlc2p2WFRUeFVnVEUydG13NjVMaG1u?=
 =?utf-8?B?VUhkOTlGMjBKV0F1ZVRiQlM0anlESmtRYjFieDJGUzBkc0l6N3FTVXBCblhp?=
 =?utf-8?Q?EXcGE5acG8o=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7656
X-CodeTwo-MessageID: 97664379-403b-4534-bc7b-da0ff756a2a5.20250819111915@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b361b496-9783-40b3-74ef-08dddf123a46
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|14060799003|35042699022|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3VJNW10am9xcnBDd2lHSndtWkc3MFYyZWFNZFY4dmlpbnZsVUVJMGEvREU2?=
 =?utf-8?B?ZjBjelpvOVJvbVZSTEpQdFVHdytERm55TzdoOVhqZ04wV0hhcUswL3JZY25E?=
 =?utf-8?B?WEZXYnNzMndXMUxzaVpqcTVhZkx6RW9rYUs0eGF1R0FuVEVrTkduT09KL2ly?=
 =?utf-8?B?NEtRZlcxaTcvQThaOW9mU08wb1VDMzl1QnpFMTdYeVl6Y3dQS2JBSytIRlVM?=
 =?utf-8?B?V1BpVnUyUGhXMFhIZHR4YlV6TmdMUE03cUFIQjFuOWpCMVp1TngyU0w0L00y?=
 =?utf-8?B?Tk1TNEdtdXFqc0dDQ3RlYTJ3UGUyUkF5OTdkeXV5L0NPMVhmbWh0OThQV05p?=
 =?utf-8?B?WUdiQ0l0OVUrelZta2NEbEI4SkkxWUZ6MUNucWFVdTV2RW1kN2g3WGlXcm9j?=
 =?utf-8?B?MHl6THFTM2tiQTJqTmhnSU5vTW5aUXlST1NHQ1hudmVGblludDdQYWlOdTVH?=
 =?utf-8?B?VXlsajZNSm4xYVVycXI4Yko3dWJZdUk3ZldQaDJtZnFFbjIyV0xIVVhkQ2N3?=
 =?utf-8?B?c2lmUllrTWprWE5Bb2dyTWRtQUZoQzhaVjhpOGgxSDNDU2tmb1lON2J6dHdn?=
 =?utf-8?B?U3d3R3dFaE4rZEZ4WHRaYlNPcDUyRE0rVGx5VWtFR0lsR1VDdHluMjlFVTFG?=
 =?utf-8?B?ektNVmYzTGUxeFRpWDBUTU42OUswajhldWxRSTArcU8vZkQxK3ZaUVNKZVBV?=
 =?utf-8?B?Q1lKK2JHNEtnS0JjeFNlcEIvdzFweXh5WkNtb01YN1BqYVp1dzJLNGlTelBw?=
 =?utf-8?B?VW9xRDZ4U2xIeUJtYWZCbmZtWFVXdXdvaHVKb2I0eHBSTGxRSmxHM2dJNk80?=
 =?utf-8?B?eTFnMTFCWlZqV2hDTzZiMmpJM3lWQzRTeWZmTUx1cFVIWWpNTDArS3dEK3Fy?=
 =?utf-8?B?WEJ0OE5yamdCSHVDQjZBUGpOSnlPSEhxQmM2ZXFtb3NYaUxhSmxhaUpMTWg2?=
 =?utf-8?B?cjdlWUR1cWhDZmkrRHpiM0tyM3NMRys4azZJbnFFNUZsTnhUeEUxK2N6T0ZJ?=
 =?utf-8?B?Mm5xaWFYKytzei9YMmtaYnVIbzFnd1BUTldUQi9OQ3BsMy9McVFESk1HZ3ZF?=
 =?utf-8?B?b2RsblkxNHRBVEFaSHNMOGZmY1UyUzgyV0wvQUNLb0NmN2pOa2R5eXJld0Fy?=
 =?utf-8?B?TnlBQ2lwYlNYL1JRZFNDYmNlUTRDZWJyeFBZb0I0ZXFUQitjMVF5SWRSbVkz?=
 =?utf-8?B?UkxtU1FVdTBkcmhDbzVIamtLUm9jQWNHQUZRMEdKOVBPQzN6WkFyejlsdGZI?=
 =?utf-8?B?UjlMK2dPNGh5eWZtZ1ljZ2NER1daM2x2Z09kRnppMCt0OHFObFE1L2dkME4x?=
 =?utf-8?B?aU8vbThpQ3l6VUlPVzlyQTZ3eG5LdTJScnQyT0wzdkJGdThscWlYaWJWM3A1?=
 =?utf-8?B?MWFHUkNoT1RqdnBpSnhFaFQvWlJ5WnZJN2pHZGV3a3pTUVlZK01QOWFlU1A3?=
 =?utf-8?B?dXplb3BaMjUxM3BlRi9CbkVtUW10SkM3c1VCNmdaZ0tPajQzYVBJYTNrUlUr?=
 =?utf-8?B?ZEdyNGc3VDMwbS9tVXA4RmZQRmd5am9VVENoU04zeEt0VVkvSWJBVzcranhG?=
 =?utf-8?B?eTVNVFJGTlNoK3gxWXFOc1ZPeHVIWWhrYlE3WGZxeW5sZ0lKODEyU3JMK0gv?=
 =?utf-8?B?Sk0vaEdzMTFuVHEwMzFPc3pkNmdTcG9jYUVsTXNsVmxGUG0zL3drSTJlWjZz?=
 =?utf-8?B?Qk0yQUdIdmJNMjQxUmoxTGFXdGdmTHQ0bkZsMFNibEN6SmZWRXM2Q2ZFbnhZ?=
 =?utf-8?B?YzUveDBqdG1JYnhVN3pLYnM2WmlrRGUzNUVqQ28wNUJWNlI5REFNNHFUNGFG?=
 =?utf-8?B?d0ZoYUljYU1RT0ZUMjI5eCtzaGFKL2RGOHBBa3AzU21vRndGVEI2VmdWSXZ1?=
 =?utf-8?B?RUZTNkVVeU5WR24vUTZRVUo2UDIyODZoNTdRaUNKV3FpUUxoTC91S3lZaVNT?=
 =?utf-8?B?eUFYT2lvZVF3bno4T2ovUnNMbURnNWpTaHhZSEkwamZ2L2ttNk1xcGJqWDNO?=
 =?utf-8?B?VzdSQUMvUXFBPT0=?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(14060799003)(35042699022)(1800799024)(82310400026);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 11:19:16.1039 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b37b0be3-4daf-4bb0-4f83-08dddf123be0
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8713
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

On 19-08-2025 12:26, Dmitry Baryshkov wrote:
> On Tue, Aug 12, 2025 at 04:51:35PM +0200, Mike Looijmans wrote:
>> The tmds181 and sn65dp159 are "retimers" and hence can be considered
>> HDMI-to-HDMI bridges. Typical usage is to convert the output of an
>> FPGA into a valid HDMI signal, and it will typically be inserted
>> between an encoder and hdmi-connector.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>>
>>   drivers/gpu/drm/bridge/Kconfig      |  11 +
>>   drivers/gpu/drm/bridge/Makefile     |   1 +
>>   drivers/gpu/drm/bridge/ti-tmds181.c | 512 ++++++++++++++++++++++++++++
>>   3 files changed, 524 insertions(+)
>>   create mode 100644 drivers/gpu/drm/bridge/ti-tmds181.c
>>
>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kco=
nfig
>> index b9e0ca85226a..753177fc9b50 100644
>> --- a/drivers/gpu/drm/bridge/Kconfig
>> +++ b/drivers/gpu/drm/bridge/Kconfig
>> @@ -430,6 +430,17 @@ config DRM_TI_SN65DSI86
>>   	help
>>   	  Texas Instruments SN65DSI86 DSI to eDP Bridge driver
>>  =20
>> +config DRM_TI_TMDS181
>> +        tristate "TI TMDS181 and SN65DP159 HDMI retimer bridge driver"
>> +	depends on OF
>> +	select DRM_KMS_HELPER
>> +	select REGMAP_I2C
>> +	help
>> +	  Enable this to support the TI TMDS181 and SN65DP159 HDMI retimers.
>> +	  The SN65DP159 provides output into a cable (source) whereas the
>> +	  TMDS181 is meant to forward a cable signal into a PCB (sink). Either
>> +	  can be set up as source or sink though.
>> +
>>   config DRM_TI_TPD12S015
>>   	tristate "TI TPD12S015 HDMI level shifter and ESD protection"
>>   	depends on OF
>> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Ma=
kefile
>> index 245e8a27e3fc..f4b5089e903c 100644
>> --- a/drivers/gpu/drm/bridge/Makefile
>> +++ b/drivers/gpu/drm/bridge/Makefile
>> @@ -39,6 +39,7 @@ obj-$(CONFIG_DRM_TI_SN65DSI83) +=3D ti-sn65dsi83.o
>>   obj-$(CONFIG_DRM_TI_SN65DSI86) +=3D ti-sn65dsi86.o
>>   obj-$(CONFIG_DRM_TI_TDP158) +=3D ti-tdp158.o
>>   obj-$(CONFIG_DRM_TI_TFP410) +=3D ti-tfp410.o
>> +obj-$(CONFIG_DRM_TI_TMDS181) +=3D ti-tmds181.o
>>   obj-$(CONFIG_DRM_TI_TPD12S015) +=3D ti-tpd12s015.o
>>   obj-$(CONFIG_DRM_NWL_MIPI_DSI) +=3D nwl-dsi.o
>>   obj-$(CONFIG_DRM_ITE_IT66121) +=3D ite-it66121.o
>> diff --git a/drivers/gpu/drm/bridge/ti-tmds181.c b/drivers/gpu/drm/bridg=
e/ti-tmds181.c
>> new file mode 100644
>> index 000000000000..6fbbc13ddc10
>> --- /dev/null
>> +++ b/drivers/gpu/drm/bridge/ti-tmds181.c
>> @@ -0,0 +1,512 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * TI tmds181 and sn65dp159 HDMI redriver and retimer chips
>> + *
>> + * Copyright (C) 2018 - 2025 Topic Embedded Products <www.topic.nl>
>> + *
>> + * based on code
>> + * Copyright (C) 2007 Hans Verkuil
>> + * Copyright (C) 2016, 2017 Leon Woestenberg <leon@sidebranch.com>
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/kernel.h>
>> +#include <linux/i2c.h>
>> +#include <linux/slab.h>
>> +#include <linux/of.h>
>> +#include <linux/regmap.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/delay.h>
>> +
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_bridge.h>
>> +#include <drm/drm_crtc.h>
>> +#include <drm/drm_print.h>
>> +#include <drm/drm_probe_helper.h>
>> +
>> +MODULE_DESCRIPTION("I2C device driver for DP159 and TMDS181 redriver/re=
timer");
>> +MODULE_AUTHOR("Mike Looijmans");
>> +MODULE_LICENSE("GPL");
>> +
>> +#define TMDS181_REG_ID		0
>> +#define TMDS181_REG_REV		0x8
>> +#define TMDS181_REG_CTRL9	0x9
>> +/* Registers A and B have a volatile bit, but we don't use it, so cache=
 is ok */
>> +#define TMDS181_REG_CTRLA	0xA
>> +#define TMDS181_REG_CTRLB	0xB
>> +#define TMDS181_REG_CTRLC	0xC
>> +#define TMDS181_REG_EQUALIZER	0xD
>> +#define TMDS181_REG_EYESCAN	0xE
> Usually it's recommended to use lowercase hex.

Will change in v3


>> ...
>> +	/* Apply configuration changes */
>> +	if (of_property_read_bool(client->dev.of_node, "source-mode"))
> Undocumented DT properties. Please document them in DT bindings.

Damn, this is the wrong version of the file, this looks like it's just=20
v1 again. I'll post v3 ASAP.


> ...


--=20
Mike Looijmans





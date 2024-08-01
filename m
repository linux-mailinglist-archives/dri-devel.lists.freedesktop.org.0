Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935BA944A11
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 13:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745E010E910;
	Thu,  1 Aug 2024 11:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ginzinger.com header.i=@ginzinger.com header.b="iQtlflE9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 466 seconds by postgrey-1.36 at gabe;
 Thu, 01 Aug 2024 09:21:03 UTC
Received: from hz-relay01.de.seppmail.cloud (hz-relay01.de.seppmail.cloud
 [162.55.72.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3AD10E038
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 09:21:03 +0000 (UTC)
Received: from hz-relay01 (localhost [127.0.0.1])
 by hz-relay01.de.seppmail.cloud (Postfix) with SMTP id 4WZNY74tjKz1LlF;
 Thu,  1 Aug 2024 11:13:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=ginzinger.com; h=from:to
 :cc:subject:date:message-id:mime-version:content-type; s=
 default; bh=Jz50OEO7iv1c8ZFFW3/jlEGOWnMoyphrdDWMn6mqRU0=; b=iQtl
 flE9v6BOj4sI0N4XQ/XnN363ulASXVErzIZzJDXgdubB+7Q/hJ6vVEVPI0SOmbHT
 PTjN48678pEAAtwVy2gY1D1Plhnu6oGL7IWBWR74tTyeBiI+sQtfOwZPRDD8414w
 Pyw1OTBX7mTDdy7BQrpTY6/ZwiJb911RbLV/0+CHHVpI371zXeFRwfMHxfUJPhiw
 gTlJgvyze37fAadUgFeUFdjF9wDO/X71/fvjR/23vMB4ZKCQtIkTZqLI7wXDUWmb
 wKjYlXPE8oZ+AylPMz5cwru8QqUHP6zAM8mUUhzZGbV6wdsApjtVm6JXblboEsRp
 eTXLDVawMVR8WsI/pw==
Received: from hz-outgate03.de.seppmail.cloud (unknown [10.11.1.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by hz-relay01.de.seppmail.cloud (Postfix) with ESMTPS;
 Thu,  1 Aug 2024 11:13:14 +0200 (CEST)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2040.outbound.protection.outlook.com [104.47.11.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (not verified))
 by hz-outgate03.de.seppmail.cloud (Postfix) with ESMTPS id 4WZNY31Q98zGnv7;
 Thu,  1 Aug 2024 11:13:10 +0200 (CEST)
Received: from AM6P191CA0097.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::38)
 by PR3PR06MB7132.eurprd06.prod.outlook.com (2603:10a6:102:8d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 09:13:07 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:209:8a:cafe::3f) by AM6P191CA0097.outlook.office365.com
 (2603:10a6:209:8a::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.34 via Frontend
 Transport; Thu, 1 Aug 2024 09:13:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=ginzinger.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ginzinger.com;
Received-SPF: Pass (protection.outlook.com: domain of ginzinger.com designates
 20.93.157.195 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:13:07 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (104.47.11.40) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Thu, 01 Aug 2024 09:13:07 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ginzinger.com;
Received: from AM0PR06MB5155.eurprd06.prod.outlook.com (2603:10a6:208:f3::23)
 by VI2PR06MB9134.eurprd06.prod.outlook.com (2603:10a6:800:21d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 09:13:05 +0000
Received: from AM0PR06MB5155.eurprd06.prod.outlook.com
 ([fe80::7c6d:514b:6060:6088]) by AM0PR06MB5155.eurprd06.prod.outlook.com
 ([fe80::7c6d:514b:6060:6088%5]) with mapi id 15.20.7807.009; Thu, 1 Aug 2024
 09:13:05 +0000
From: =?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?=
 <martin.kepplinger-novakovic@ginzinger.com>
To: ukleinek@kernel.org, lee@kernel.org, daniel.thompson@linaro.org,
 jingoohan1@gmail.com
CC: linux-pwm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] backlight: pwm_bl: print errno for probe errors
Date: Thu, 1 Aug 2024 11:12:55 +0200
Message-ID: <20240801091255.1410027-1-martin.kepplinger-novakovic@ginzinger.com>
X-Mailer: git-send-email 2.39.2
X-ClientProxiedBy: VI1PR0202CA0021.eurprd02.prod.outlook.com
 (2603:10a6:803:14::34) To AM0PR06MB5155.eurprd06.prod.outlook.com
 (2603:10a6:208:f3::23)
X-MS-TrafficTypeDiagnostic: AM0PR06MB5155:EE_|VI2PR06MB9134:EE_|AMS0EPF000001A6:EE_|PR3PR06MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 3faab4ba-42b9-4e72-f342-08dcb20a286e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|52116014|1800799024|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?eWNXVFhPcytXd3dPZXRXbzFvRXdaRTBGR3R4cWlEYTRvYTNTSVZiY1F4R2ts?=
 =?utf-8?B?TEEvWkNFcFByVVZwaGtjL1dWVlpvS1NoTHlqWFBzRWpHMUlxenVYeEhUaER4?=
 =?utf-8?B?SHZCVWNqSFlvTWdzODJ6NzJiZVgyR3orMzJ1N29oL1VWVmdEZm0rM1J4dFda?=
 =?utf-8?B?cWlwNHNxZ0llbnN1MnlLNEs4R2pwYWFBNkp3YXYxVVFhVnpnbWhQa05zTmJR?=
 =?utf-8?B?eG1LelZESk5nS29ta2ZBZmNsTXlhSXpxaTB6WXgwaDRaQlFXU1Aya0FMSmpO?=
 =?utf-8?B?TytLQWFnbnZuOVBaWWhGdWJHZzVITmJoM0VQL2lpTXRXSVY0MmxGVllsTnhj?=
 =?utf-8?B?Qy8xaXpIRWphZllaZ05sMHQ0ME1kcmZzZmsrZCtVYmdaajErMWxuUEhTZUFP?=
 =?utf-8?B?aFVySkJuVkVDY2o4RFBaNFZZYSsyVXBrcWh3TDVDb0FRZ3dJVVhWb2hwdHlq?=
 =?utf-8?B?VS9iK3NHR3lNajR3NGNack5MK0FNN2dRbTFDS1FpUWJrYWhGbnB2VlQ4K0FS?=
 =?utf-8?B?TFJwNmhlemh0bDQ1aGs2Y3ZsNFpzakpoUkoybWFPMkhkeENNcmxQOXlLN2Zw?=
 =?utf-8?B?cFZlUmNDYjRZTUtMb2RuZXV4SWFVazU0TTYyakRxWEZOZzhxek9aTXFyYnVI?=
 =?utf-8?B?MzNpMUsvMHZtVjBHa08vOVpFV0hRMmNSZnNaZ2NEM1hJVlZmSjBpdGRVRmtQ?=
 =?utf-8?B?NGxvZFQvL3RhK3V0ckhuY01tMmFxYUlCZFB1Q2ExNVhIMmRuZXQ2WFU1SXow?=
 =?utf-8?B?aG9YNTBCNFBhU0Y2S3d6a0lqY0prd3ZVL3lWWjkxaVZGY0M2MjcwanVaSjQz?=
 =?utf-8?B?dVhMc2x6bklXVkdwOHFEMzNkdlpJTUhiQWZYRjJFT0p1djZ2K0xXTDYxMXhK?=
 =?utf-8?B?VUZBVC90SG1DWDhlN1A1MENxOWRWak9ZS3F1bkZXNUhaVk0yMURjckxwOEk2?=
 =?utf-8?B?UE1rWFE5L3lWRmczNHlDWmU3dy9hWWg5UUVzNmlGaW1WMDl1T1hockxGZGVo?=
 =?utf-8?B?OHNNZUdiUzlLcmlCZ3R0SWZBMW9zR3R1Z3kyU3NrVTJualFGTnNSY2Z3U2xo?=
 =?utf-8?B?UmttM3JWLzY4V3Z0Y21SS1V4RitjSlFuRDRseXRobFRoZmtCTDNvYStZc2tp?=
 =?utf-8?B?dXVNQzdlQmJpMVJXUXNMZlY5NjBna2pVOUp6dTZFOVltNXdRQVFrcWs4N2Vh?=
 =?utf-8?B?RnQxTDFGbE1vZ1dQTlNBWVhzSk1XYkZXd1FmZ1RKRTlKR1Q1a20ycytnYlhM?=
 =?utf-8?B?dFdUN3ZlcWVoQS94QUZQYVcveVJPQVM4Y2w5YXM5RW41WXYrNTlNdlZOakJG?=
 =?utf-8?B?QUxYL21KZldFL1MwWmRhYW5NeUl6cmY0eFhyTDVQMnIyVGk1LzByTk0xcENn?=
 =?utf-8?B?RWgrak1Qa25LTEVJTTVuMXN4bUJCczNJZ2ZFZTJHWnNBRlZzdDBkNEhodzA2?=
 =?utf-8?B?R1BVNXVVK1FscnBWTFJIb1RBdHh6MEc2RjA3NzY2L09hanZXVVh5aG1CZVl1?=
 =?utf-8?B?WDZVWVc5dGpIM0N6VzJvY0VKamo0QzlSNjQ2UksxL1hPQ0VxZm1hc2xSVWwz?=
 =?utf-8?B?UUtQY01jYkFBWTVxanZmZjNXUllvT3dSKzBIY2VsdThNbGlRSWVrTVNiM0Qv?=
 =?utf-8?B?SWVsMUlkQ29TVGlGdXp5a05teklkNHRNMURPNmxHcHBISklySjhMejJTYWpR?=
 =?utf-8?B?VzFLNm1yT2VPVHMvTS8zY3IraHQzc1RHUkpEL0ZEbUVvcmhpOXBlUC9YMndM?=
 =?utf-8?B?Qk9ObGJLaEJmZWpIeUlBS3JvMkZ6QkZkdVpTUWFHbzh3VU9XQzhZTUQrNE1o?=
 =?utf-8?B?QkxFZkNuR0FnK3ZMTlV3S2xpR3kxTjJaS3VsRUFESmVrNkltVVMweldaMnBD?=
 =?utf-8?B?b2grVFFGVHBIRzBvamF5Nmp1Q3QvWFN2NytCQUVEeHc5dlE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR06MB5155.eurprd06.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR06MB9134
X-CodeTwo-MessageID: 1afcd3b9-57bd-4d15-b48a-df04eda0e4a0.20240801091307@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fe10f730-12d1-4901-d384-08dcb20a2741
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmV6KzVEcHRUYmJZZlppU1lNVjhGVFZmWUxoU2cvTHZaSUlySXpoWTZaaGpt?=
 =?utf-8?B?TTcvYVN6Njd4Nm0yQjhlQjdFbFFaNU1ONGtjOWg3b2pIeVU4Q1NJNW1YQ2Fn?=
 =?utf-8?B?d2R4UkNKTkgweTMzUEZTNEd4eHFmUDU2RndJa3MrTEV5eWxQTmNZSkc2bEpn?=
 =?utf-8?B?QUZaNzdVYVE3KytEU1o5M1AvUGdmWlF0bjdoYUdBTUVTRlluV240YXRxV0t2?=
 =?utf-8?B?M1owcWFLN05MMDlhSXpucDdyS2kvbnFNUTdUUDhsdXNZWlBzRjhSd1lrWCth?=
 =?utf-8?B?SkE1RUhsQm56VVZDS3J6eVEvMzQ3YXFtL0ZaRXVaaCtpbk1FUzFDVmFPTytk?=
 =?utf-8?B?Z2pRRXhBVEdxeXRxM1UwcFpPQ1ZWaUQ4d1FwcUNNQS95R2hGdzJxbFl3UlFn?=
 =?utf-8?B?QVhTbkVmZjdJRDRxdzM3TUFJZXUzREJ3Q2E2dTNIekdITFhxeFQrOUdWYTgv?=
 =?utf-8?B?OHJQWmhkTGpKNnlBNUJtMW1GVU1vaGFNYVI1a2xIcGYvdXQ3bXMrSTBXUlBa?=
 =?utf-8?B?eHd4a2hGS3ZXWEtSWjZnMFlsODdUbVhLT2M3ZDFOc1VHNGwyL3o0cUUySExt?=
 =?utf-8?B?alBZQ3RyUTIzMzFtSTNVWU44Z0RtR0NFUnNqbnFHVk5pekZJN0tHUkRtdFpY?=
 =?utf-8?B?QzFnaThJUUNKd1EwdTJVejEycEJ1c294RGxQY0FNT2hDV0gwQ3g5bjZOVU94?=
 =?utf-8?B?RHFMaDZTR0xQRG11OUh0Y253MGVRbVRYM2xwZkJXVTZEZGxoZlcvU2NGdG5C?=
 =?utf-8?B?dTZQVUludlEvWjh2Yy9LNVdXNmMrVjdzYjRDTnZjaTlxbjd3M1lGK3U0V25H?=
 =?utf-8?B?OGI4TWxkVVVGWkxIY0xPM2p5Ukp6bm5YOWJHdFFNd1RuYkk5TWpXRUxheTV2?=
 =?utf-8?B?TXI3K1RZalMyb1hnaTZaNytZWXp4emdzRzdXaWIvSHRNY2pVL3EySHAyWHY4?=
 =?utf-8?B?cWhJVk5WSlNFSW1rUE1ha0cvVUU5YU8vWHBrUmtrRTJTT1p0QlArUmpkcG1Q?=
 =?utf-8?B?MXhycDAvOXZCZldjQUU4SnZQcE5YQ2R5Z3VnbTBWU0dmRGhsTzZUU0VxVkhS?=
 =?utf-8?B?TFN1RnpMOFhQMnhFbVVWV0ljVDQ4Mm9lSUQwODRHRmtBeHpMSXRWSFQ1TGRP?=
 =?utf-8?B?THBGT2JjVGlGN0lEb08wNERjbXpRaDJXZWJwejdtWkJSZ3E4cHIzR3RYcTNF?=
 =?utf-8?B?ZklIOW1nRUkyYnFZcmgyc2JQdGs2aHAzTW5wK0R5NlJhK1MwbE5uMXBWS0gv?=
 =?utf-8?B?bm01N0NnU25EN055c1pZdWdPZSsxRFVXZ3h2TFZUK0t5ZjcxbGticnpyUzBG?=
 =?utf-8?B?eDJja0ZKaDZ3Y2Vvc09EWHk2NlRwVDkrUlhMZTl5b2ZHbUFRaU1DSWdDNXE1?=
 =?utf-8?B?SUE2TlZwbmJMQ2Ixei9zRWpURzBpUVRjVGhiM3NLN25NOTdGZXlQckhQMFor?=
 =?utf-8?B?K0dSUS8ybHZUcXBDaFA1MTc4czdoU1FLdGhXbW03WUthSmRQSVhHRnlEaFVV?=
 =?utf-8?B?RGxrWkhwenVUTzhmcGJkZHFzOVhtVDhBRzR5YnBWT1FCUXdEMG1BNjA4VmRN?=
 =?utf-8?B?bVBLTTQ2bFJuczlSTkNQNWgrc2NzVFBOVks3am42LzExVm9UczFQVTdicG0x?=
 =?utf-8?B?RlR1QjBGTFJxZDFMeHVDRlRKY2lGN2Q2L2V0ckFLSWxYQ0s2aGFiMWQzcDN6?=
 =?utf-8?B?SXV1UzZrYXAxamZLVEdlMXZoNi9XNnNmZjdGbGdZbUxWYm1VSkpDUkFGU3ZL?=
 =?utf-8?B?dDZTU25FMW1YWEFBc3dnOXNqTHdXcW95YWUwWDNTYmgxSW9waGFMaDVDQXBP?=
 =?utf-8?B?S2prMUtaNWxTdHpZblY0Y3Z4ZGx2Tm5oU3lmSGJLVnF5clh4cDRpbEtaWFhn?=
 =?utf-8?B?RWhNUU1KU3EvMDNQMUUyeHdiL3lTS3ZoamR0bjM4NStYdnhEY0xQbkR5cjNm?=
 =?utf-8?Q?DltNZ/ioq6B3hN+cHU33oyaaIWZ0wiEE?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(35042699022)(1800799024)(376014)(82310400026)(36860700013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: iEZ4Fd2z9Tu0TxoAh/nme485Efg0bDeSAtQ+BUFk5J3NGkYCs8nx8lvYW1dslnzpSkYV9IeINya0P4njklQeo/de1kmvSDPm6uW1kdDJykpdQJNl+sGXsLv3VfhmiJYgTVA1aYNlNyD96IEfKydR634ZcwvdgMDPbko3v7839sJ9LyrjTKTRmqTpDCb5Sj47UBVmbtwSwkh3AZFEyp7pwYBks58FLjewgrbmrZj/bsN1DsoCZcRmHNMyL71BfKL/kYyDAPBCDdrs5KuAa2MX2EH6dHMiVDFZ9DyGq3mcKSvmbwD6lLD/BeYUXTAryHMRxBO3+fWDabC031O00+0U8qHsb5SXVmNNw72VzQdWzhtpc30OxM1I+VZaEiE0kCw/G9mAc7eBgZF3gz4zyKMD/jXfHovwQvZ/GTc8+59QkiDSscEd7aTIMutykg0c+5nZ4Eewest6zsPR86jfP4eQnnIwsD4T5JRGSeLT0r+N6tAbugvpS/CtttR8ZmPNuEkpa9XIpaFHUStF31nHySxM3/OwGfB2jvVXubXHe78xogQbuD8gdTN/PhOz1rBCyNg7GJnLAep9ehLan2nusq49+Cd3lNZ19BcNucsCKE5uYq5QK3nEYUPuAO2JpXb94Sp7h4P/kD8ddfAQX1fEcYANOW2q5d/GMf0oF70VqPflRvk=
X-SM-Relay: yes
X-OriginatorOrg: ginzinger.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:13:07.7232 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3faab4ba-42b9-4e72-f342-08dcb20a286e
X-MS-Exchange-CrossTenant-Id: 198354b3-f56d-4ad5-b1e4-7eb8b115ed44
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=198354b3-f56d-4ad5-b1e4-7eb8b115ed44; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7132
X-SEPP-enc: yes
X-SEPP-enc: yes
X-SEPP-CCCVersion: 2024-06-24T10:15:43+02:00 98369f65
X-SM-outgoing: yes
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
 micalg="sha-256"; boundary="----3A617C76A16FD0E011B95CA2D09E5E62"
X-Mailman-Approved-At: Thu, 01 Aug 2024 11:08:17 +0000
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

This is an S/MIME signed message

------3A617C76A16FD0E011B95CA2D09E5E62
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-version: 1.0

This makes debugging often easier.

Signed-off-by: Martin Kepplinger-Novakovi=C4=87 <martin.kepplinger-novakovi=
c@ginzinger.com>
---
 drivers/video/backlight/pwm_bl.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm=
_bl.c
index f1005bd0c41e3..cc7e7af71891f 100644
--- a/drivers/video/backlight/pwm_bl.c
+++ b/drivers/video/backlight/pwm_bl.c
@@ -502,7 +502,8 @@ static int pwm_backlight_probe(struct platform_device *=
pdev)
 						  GPIOD_ASIS);
 	if (IS_ERR(pb->enable_gpio)) {
 		ret =3D dev_err_probe(&pdev->dev, PTR_ERR(pb->enable_gpio),
-				    "failed to acquire enable GPIO\n");
+				    "failed to acquire enable GPIO: %ld\n",
+				    PTR_ERR(pb->enable_gpio));
 		goto err_alloc;
 	}
=20
@@ -513,7 +514,8 @@ static int pwm_backlight_probe(struct platform_device *=
pdev)
 			pb->power_supply =3D NULL;
 		} else {
 			dev_err_probe(&pdev->dev, ret,
-				      "failed to acquire power regulator\n");
+				      "failed to acquire power regulator: %d\n",
+				      ret);
 			goto err_alloc;
 		}
 	}
@@ -521,7 +523,8 @@ static int pwm_backlight_probe(struct platform_device *=
pdev)
 	pb->pwm =3D devm_pwm_get(&pdev->dev, NULL);
 	if (IS_ERR(pb->pwm)) {
 		ret =3D dev_err_probe(&pdev->dev, PTR_ERR(pb->pwm),
-				    "unable to request PWM\n");
+				    "unable to request PWM: %ld\n",
+				    PTR_ERR(pb->pwm));
 		goto err_alloc;
 	}
=20
--=20
2.39.2

------3A617C76A16FD0E011B95CA2D09E5E62
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

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
9Y7oNygYkeoqiqYZfpX8Svi9iebhrIAZ6R6XbZ3SdZgMQwY+pAP41Mcs3OAFkMa8
Qja5Lw1/nrhkHnQEokfz5+xyy/g+emV0edXahk+8vH6aRpQMXbM6P5kmMk7I7rbs
XvOxUDNepnRLic+00Vv0VdX1a2eeL506mQ+2kiPBawBgW98dGdnpjC5gF3dDXSrh
yPotiOEopIgyFFNltnFJEIhD0SpoB2RG9L4UN/0n/8ezh6EbFhTYlYihb1/6+oSB
qqBObKC63QIDAQABo4IBTzCCAUswXAYIKwYBBQUHAQEEUDBOMEwGCCsGAQUFBzAC
hkBodHRwOi8vYWlhLnN3aXNzc2lnbi5jaC9haXItNGE3ZjE3ODgtMjZiNS00OGVj
LWE1NDctYzFjZDBiZjE3YzNkMBIGA1UdEwEB/wQIMAYBAf8CAQAwHwYDVR0gBBgw
FjAIBgYEAI96AQMwCgYIYIV0AVkCAQswUQYDVR0fBEowSDBGoESgQoZAaHR0cDov
L2NybC5zd2lzc3NpZ24uY2gvY2RwLTNlZTU1ZmQ0LTU5MzgtNDFlZS04MmRiLTMy
MjNhY2VmNWMyMzATBgNVHSUEDDAKBggrBgEFBQcDBDAOBgNVHQ8BAf8EBAMCAQYw
HQYDVR0OBBYEFAuD1HIghszhOu+ZtnfNUaajco9cMB8GA1UdIwQYMBaAFMwurYmM
g+NAoyVppeqSfdI3OsfGMA0GCSqGSIb3DQEBCwUAA4ICAQCn67t6kPdNeuYINCIt
IDH6NVHyMjLy4+MMR0gVwYB1GzvjebenaJJ62jX4eNiwia56a3rxXVVU08yKbwIt
FpchbfuEvkXEOQkHpp4H2B4zzfwEmOf0/xE8qt1AuejiFrfy/QHzJKxKgV/QXnye
GphAY0IRvnM45EI2MdbF3u/xz+1lPcLseAfWCeiy2LQxAzTVHFz1E+b4V2S6Yyr1
kLAOVvZ0dlGUc1tVNtanuh/dMZ+fTban7pktCQRJI90NTdT0iNfwm7YncsH5yn2K
xwYJUgGEGMzRAdJudevVVEJhnBsMF2N70l/Otj6In5yXLuXYq75YlVJMLJOZ93Bo
wKiH+nKaHPNy16mSgZrBhBKP8oT++8jUTJPFKWiVaPKnV17zNyRgXgcFBLhlndAU
uESEDy3BqfDOOB5xOFVsfBUzyphbpZo5eXiR6oCOzf0YOGZLcXp/P4Yf0ZvvU1Ey
hJ+SnSVyhM2wn/sHeNTn/EUQzN7f9RUbGrzbdczz51MsLpUzp3NX+qZL1iy/8izS
e7vD1giSk2ygbcPg2+tbAY00xZyNZA8BYifOfDBWsP/6596QYltVONxnrNGfVZlk
ydiMp+D1NeE0k9/uAqW6v4wLjAq0TLS7fTC5utcNXDmnl9aDq9aQn95+N+rP4mcD
9wVA73PTHRG6VFstM3kXzweXHjCCB2wwggVUoAMCAQICFBa3V/uiBoK31zPhseXz
/UMQogW1MA0GCSqGSIb3DQEBCwUAMFMxCzAJBgNVBAYTAkNIMRUwEwYDVQQKEwxT
d2lzc1NpZ24gQUcxLTArBgNVBAMTJFN3aXNzU2lnbiBSU0EgU01JTUUgTENQIElD
QSAyMDIyIC0gMTAeFw0yNDA2MjAwNzU0MzdaFw0yNTA2MjAwNzU0MzdaMG4xMjAw
BgNVBAMMKW1hcnRpbi5rZXBwbGluZ2VyLW5vdmFrb3ZpY0BnaW56aW5nZXIuY29t
MTgwNgYJKoZIhvcNAQkBFiltYXJ0aW4ua2VwcGxpbmdlci1ub3Zha292aWNAZ2lu
emluZ2VyLmNvbTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALTH/7yL
NeeXRymXxM9YBR8E/yuPjeb7aHTCMHyPKrt+zl1aQKn4w/WLWOLRROv7uDhTupth
bRe5OVLDnieu+PnC8mIHX6AcRVCgh/mX+5btCITVwZFlmVIToGX4n9L7qRRb63VZ
0StrfHcQ4hP7K7W3if23V5a1448E00TZsINfZoJvY9Eb5t4415r2799TKBQ7dejU
XQN4UtVCGwIAVsqmOGlkZ9/zD4aCLvTCMLZNdryBRprOpdFnQzakJVD6VQKzypvr
0xz3NasdEYWfZiX5cqtE3djni/CL1spqCK1FZBen789mhnixlKsaEsQ5ftaLRKkE
cx2KR7XqMYXspK5IsEZ1kZE8H0k47XRlbSyao+rAA0CfPimgKWJB/x2ypUs0PZc2
SFlLCBi3tqVIJV86b99b3eH1KQwv442/pm4u01uIjtjZEUWi8+MS+ne4+Q1lydjd
ESy2Yp9v9ooVJJwA++dtZ3bqXT/OqQZymbKn2OX6Xei5/48QUf5RD4RN64REesjF
3UnBwoXhmuoXprQs2Mqgx42taEq8HGIADI9XYzt9UoulF7Lwlg2ERb/CzGx3VGmZ
oCAbfwL60l6IrTitLjM/PJK2fucCGNt2PoEXU4IG8UfHqL4/LWpUqTNCLb3t21ZR
3wom4EKvTkRBBafKbzKcNAcqBhdYQ6KguRYbAgMBAAGjggIbMIICFzCBsgYIKwYB
BQUHAQEEgaUwgaIwTAYIKwYBBQUHMAKGQGh0dHA6Ly9haWEuc3dpc3NzaWduLmNo
L2Fpci03OWI0NmZhYy00Y2QyLTRkNDItOWZlMC05Y2QwNzhkMTNkOGMwUgYIKwYB
BQUHMAGGRmh0dHA6Ly9vY3NwLnN3aXNzc2lnbi5jaC9zaWduL29jcy1hYWNjY2Vk
NS02NmU4LTQwNjktOWIxYi1mZDI5YWI3M2VmZWMwcgYDVR0gBGswaTAJBgdngQwB
BQEBMAgGBgQAj3oBAzBSBghghXQBWQIBCzBGMEQGCCsGAQUFBwIBFjhodHRwczov
L3JlcG9zaXRvcnkuc3dpc3NzaWduLmNvbS9Td2lzc1NpZ25fQ1BTX1NNSU1FLnBk
ZjBRBgNVHR8ESjBIMEagRKBChkBodHRwOi8vY3JsLnN3aXNzc2lnbi5jaC9jZHAt
ZDUwNTdiYTAtY2UwOS00ZDFkLThjYzktMGE2MGZhNGM0OWMwMBMGA1UdJQQMMAoG
CCsGAQUFBwMEMA4GA1UdDwEB/wQEAwIFoDA0BgNVHREELTArgSltYXJ0aW4ua2Vw
cGxpbmdlci1ub3Zha292aWNAZ2luemluZ2VyLmNvbTAdBgNVHQ4EFgQU7kSuCQze
9cYnSYrKpcxE5xmLCNkwHwYDVR0jBBgwFoAUC4PUciCGzOE675m2d81RpqNyj1ww
DQYJKoZIhvcNAQELBQADggIBANM4nto/dVNbvkxZuSluLizU7QHFhREyYKtgs/ll
lDIN5EWWFOUT3LVR30Khy6OwZGSzMLRZWCCXtS8cHn6czFRMzSKFVMjxpMXBHBPL
3OrPKg9cXdEsDV14YR7ebJqVaMj6iUM/zs6T+xLBQq6grIpYzNnDzeHrNBt2M7Ha
D4Cc2Xa+zBhzS8o/KyosAM8y96W+TYiWuWJHapOQkrKc81YhM9ZwR3RZA9ha4sfL
KRs9S8x2EfAWzk951vNM3H02eO61EbA4/Ziqwbav1QS+kL3Y3hpN+F8MDCb2EN3l
eg3XtsJ6548fKfrZXJYErTQKpxEburCY716ZbJpxaKrZjKuFTNA1q8BYp07tlNsr
5YVNQTtUGP/kMrYyI5uqJ9W/IPFxjzpCN4t4uf6y/GEzwk3a1zgEHtqBIhxGZ0oI
LVwQ7mf5Es2aRiJrsiHEBsX175k5ppTASvkzVA+qucXb6O1nZs9INyFGes5/SAgu
gGNwmf952/sNuMjwoeWa5CB0ukXkwhHI9l7K/HWKWYCYjOPevhTG+wSLP7st1wkN
04Uh4lA1G9hpenPa9RsII49WLRpwOBxYCI3LCf+jIO6Eb8nUfBbiCK3XgfKMV8iN
866P73BrePe9kQfsE231xeFNoj18l1Xa9T8JyD6Z3WX+OwXpRv+CZZ1KlR2jc46o
b6olMYIDezCCA3cCAQEwazBTMQswCQYDVQQGEwJDSDEVMBMGA1UEChMMU3dpc3NT
aWduIEFHMS0wKwYDVQQDEyRTd2lzc1NpZ24gUlNBIFNNSU1FIExDUCBJQ0EgMjAy
MiAtIDECFBa3V/uiBoK31zPhseXz/UMQogW1MAsGCWCGSAFlAwQCAaCB5DAYBgkq
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNDA4MDEwOTEz
MTVaMC8GCSqGSIb3DQEJBDEiBCC9X/k5C73XieCZvHRzqwMhA7QZyx3Kyt99UqK7
3u1tsDB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYw
CwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG
9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG9w0BAQEFAASC
AgAtCmzlz/wnwz+24Hasy9Z5phBl6YXO7WcWNVRwW8DBbADMvXRVKXU2JwKGWwKO
YRDuEdSECFploQ32vQxToE/s2stJu4KPNFUGazkIEvXxcEWSvtV1zLEvERKogwJ2
bTHiDYpfcBztSy1FlIRQ0JF5sXCf+/juI1bV553Cp/smj47wLfi62zQceljIYkTv
R6v4+nCjfTciTKGQ/tQlqjavlkh94Lr8YH/8ySCQ5DdGUIyvkfUS/EW/xNMp3Agm
jQrwufMqIx687/LGFDu61/eyqyh15g1NvwnTsFTExv0MtvRLHCnhtU+aPogeC4WU
R5QnCWkZ96T4DbmTCalXIWqN7Jm1phWm//rSV/fwtYm9owT7tYhVL7f0pK90vLeT
CjAG+Tya7EB51w9C45huy0aUMurPHlKSTBoDXp7hB+Bae1rxA1UVhBpxGNECIeBA
K+tsF2Qm+W8CiSkLXAIjRJoek43DQcy7ZeWV+02bhk9CwTI6XJW/F1aebeFfDGb6
7i73qFMVWmYIUXetwEQZTefSaoy8TspZD6JtKYyU1tUpZBIghSWPCVpqw8UcB9tM
1vGOLbotrOl91twjj3E82WtI3a6dvsk43P+7vDPF1Jeii9unAJYE0RdA939IY/0M
7vDHPKtZlnzNx+8aGchrPvAdZES3/AY8+khXBOsqsVr8zg==

------3A617C76A16FD0E011B95CA2D09E5E62--


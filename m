Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BE6AEE159
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 16:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8537310E47D;
	Mon, 30 Jun 2025 14:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="wZrTxss9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11022095.outbound.protection.outlook.com [52.101.66.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A6B10E240
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 14:47:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wSBC+txodKhNDZTWFItnnCQ6Dym7y330btkOVSUskA9PmzWZrptsp+pY2v4Czwshvb2P/2jiLicJUIyI9H9bPhk9Ytnp/z717ejU8RWSCGOZRoVLwn7iPRxdsbvV0YbMtuqMwp/vx/kUvXMvNtJkrulorDGwTu9c8Af994EkOf4+a9Ln1H7Z6KE1Uxxp1pjzYNbk5RxHvyNPModF3zyxgLNRPZmIWRb410EdC0D49DNSQYlg9qd82o34B7R92sJO1l76CLruCQ6KGS+Ke5j474nfetkwgsIEzXlfyg7/Qa+nAcOy73P8u+2GhMrTtyFLgil+4b4wVUDESaEbg/XQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuDkxZrOK6tNBfVJvqCf2NerCSdUt8+LKmKvwOxI0ms=;
 b=iUoeEo0oe+uYpERh+of05SvBmHdoBQdWUBxJMYJb+m3KkvFjxgV3f0ON4JbQ4do1iXi7iDQgZtYg8l78Zww7avpPeIxPkQpumjWlQHQ0OhtYqjZOdQvRWNWd3Xa0Qd+2h/+HYkVKOPmdZ6Zl/zDzgc00P2zrMJZZLscw3cs7AJBXWUkJ0tik8h5MNupKtzrI1FiJwCq+1jFXyyjILmFKaUrF6pPYfj/wAlZ5XaoN0guH8D0cuzz8JHoopZlQ1gZLJ9oP+OE2q9jGXLAn1kWshEMzgiK3dnILduqZ5yees/dC/u2YsejCuADcXkcawInt4zM9WQl5Q+DU73i4A6zs8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuDkxZrOK6tNBfVJvqCf2NerCSdUt8+LKmKvwOxI0ms=;
 b=wZrTxss9zuy3O5UeMwsXMAnEFLkQdz1zS15xYtvAq9f0MNOIX1gYdMwCc3Zt1uwixH1aw2cn12O5/yhamvi8H4hi+J3bsAv/qRnXvcKuw+abylA6N1RnYqgDoUhKSxIOYyki2yamHXLQxOLObAmSTxWatmLTv5moMYDBVkTykXUXkOCW7zMcoTSt9yKdtWraCnGosoqVM/Ao5qFMxcKAbRULjLHgeMkBtXtNDWmsezK7xNMFh+sPNVhoB5QJhv5yY9Oby4sFvN6tt8d6/MksuFbkZFGjqsRgkVXajkzMxQJxgsnjBXhs48XksM7OIKJGnIwS9kgixVZClPNyaEA+JQ==
Received: from CWLP123CA0175.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19b::13)
 by AS8PR04MB8165.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 14:47:33 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:400:19b:cafe::fd) by CWLP123CA0175.outlook.office365.com
 (2603:10a6:400:19b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Mon,
 30 Jun 2025 14:47:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 14:47:33 +0000
Received: from AM0PR83CU005.outbound.protection.outlook.com (40.93.65.14) by
 westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Mon, 30 Jun 2025 14:47:32 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by VI1PR04MB9833.eurprd04.prod.outlook.com (2603:10a6:800:1da::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Mon, 30 Jun
 2025 14:47:29 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.8880.030; Mon, 30 Jun 2025
 14:47:29 +0000
Message-ID: <6b52a77f-47fb-4da3-a750-d5344b1f3416@topic.nl>
Date: Mon, 30 Jun 2025 16:47:28 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
To: Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Michal Simek <michal.simek@amd.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <20250627181911.GF24912@pendragon.ideasonboard.com>
 <42af6260-c8af-42e1-a9bb-adfaaabf0190@topic.nl>
 <20250630-psychedelic-tested-smilodon-adcbb3@houat>
 <20250630091156.GE24861@pendragon.ideasonboard.com>
 <20250630-phenomenal-taipan-of-imagination-59b300@houat>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <20250630-phenomenal-taipan-of-imagination-59b300@houat>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0P190CA0025.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::35) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|VI1PR04MB9833:EE_|AM4PEPF00027A64:EE_|AS8PR04MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff2e6c9-cbe5-4e02-deb0-08ddb7e50c1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?ZXl2SkhKUEtOWE9SQlR0RHVMSTNLU1ljd3g2cjY1N1pmc2JGejVyTDJ3VUJr?=
 =?utf-8?B?eGhnNFltZXFYMm45UHNOTTYzbzZtSllTZmlGQ3Y4N0MzWWFidVg1QVlIYngz?=
 =?utf-8?B?L2JpTlkvY0pjUE5TUnEyVlkzUU91L0kyUFRSQ2h3TVRKUmg3dks2VFNqZGlW?=
 =?utf-8?B?SHk4U0ExL1JrSFZyVXhRVnJ2UnVhOTBZVGxPamNwYlJjNUh0TUY2Q3dMWm5k?=
 =?utf-8?B?ZUNJb01UYWhFSjZtVkxFZzEvQzhkUDVLNXl4eDUxWHVTSkxsVGEvcmFFVzRi?=
 =?utf-8?B?OUJUbmFsSyszL0ZueXFUdEVQYW1ZOEJvWjkxQ1JRY1RvTmovTjRJaWNRV3ps?=
 =?utf-8?B?blM2RkVIM3pmMXhXYXIyQ0E2U0JhSW1xcTBTdTJMWGRBY3F4ekRtd0xsUWxx?=
 =?utf-8?B?Tm5laE14SmRPajYyZWlDY0x3V3RocktGait0c3QxcVBqSGdmME54MW5yVjJP?=
 =?utf-8?B?NVJ5WTlaQ0VINzdBVVhIemExQytuSWVDL1I0VFlDaHUxT0Y5OFJ2UnVuU0xE?=
 =?utf-8?B?eTlNQzFVUThxQWlYZDI4eERTZ3pPZDNwenAyTEYxdGRBajZEaUNpN3NDUDZi?=
 =?utf-8?B?YmRPS09WaUkweUNoMFdlVDNEdUI0RnBYSVBjTDJNS1l5QURlWWwwdWgvemdh?=
 =?utf-8?B?Tll1WjhoYXV4TjFwcDVTSnpDQjQ1WDlsWXFLSlBZV0JOUXMySEhBYzBhTk5j?=
 =?utf-8?B?Nmo1SnlEdkl3Y3BhakQ5dnlvZk5rZHVXMUZCOTBKUHBneUdFdk1icVcwYWpX?=
 =?utf-8?B?UUxvY2NwZnRKa2Q4cVl4a1ZDMldNRFlEempPQWdWRnArZnpWelF6Q2JQVjEx?=
 =?utf-8?B?eXE2ZGpsbFBRWFBONmFLNjN0MmU0cHNKV2gzR3RzWlcrNzJ0WDVFY294VDd0?=
 =?utf-8?B?VHdhVEwwK29Ha3luOU1rMGN5RHRBVk92Z3FFc3V2Q2JBTHhSbHJhTHhPcG9s?=
 =?utf-8?B?Z3VQTU1YbUdzWFlLQnJlWVRhT1dLRkYvZFZhMmduc3ZmOE9xRVg1UTBCbTVR?=
 =?utf-8?B?VTlxTWtOQXRsQVoyeVNYbDJhd0FpM01VeU91TUd0VXFFOVRqY0xGN0U3YVo3?=
 =?utf-8?B?RmVzWEZ6UUdtVXRnOHl6TVcrbHBsN0F6QWdqVUVLQ0QzTi92anV1WWsxeGtZ?=
 =?utf-8?B?Q1d5Q2tIdElhS2h6RkNEcUFiVnpGdE5wQVNZd1h5ZFFsaVZLYXFMay83Rzc4?=
 =?utf-8?B?QTNWWGpXQXNhN2lXUHo4RWR5NEczeHVPamo4K1dKeFphUzd0N09uVmk0WW14?=
 =?utf-8?B?YlFFV3Y5U0xXUEpHRGtlbGd5ZFRSQkEwV2JOaVRyOVNSMi9uZms4R2hLZmtB?=
 =?utf-8?B?UzY2QXlqaFFCcHMrSWZoMXJwaUllTTlYcFN3WTJYNTVqZzFlQVI2czgxOWk3?=
 =?utf-8?B?TThaL0xKSkh6a1MyNytwUG02YlhndjZtcjFDcE5ReWR5UTErbk1yN1BCSmN0?=
 =?utf-8?B?dWoxZG9IcDNUUVFrcUFKa1ZEeTFpZllnT3NBS092akdQZkNjZXNFckQ3bC9x?=
 =?utf-8?B?RlFoM0ZxOWJLQ0t3MFppQ2hrZ0QzZkZTTmU2MmNCMEc3c1BoTyt0WEdUMERP?=
 =?utf-8?B?RkZEc0pYL284RENWV1pqYkJpalIzZWd1Sk9KNVhiL01FTXpOV2NKR1psbVRl?=
 =?utf-8?B?MTR6cWdVNFFmVzRmY3JDb3FZRW5zUjRKR0JQMEVwWUJqL3EvQjNtWjd2cHpa?=
 =?utf-8?B?a3drQjlwYnBHYkdoMCtCVUFOaU9PRWI3MVZ0YnFlODR4cDZvVTFsYzZubS9i?=
 =?utf-8?B?Tzlhb25YczdHWlcvcGNlc3RLaWZOOWZmMy9vR2N4MW1DMXAvWlJ0eUltZXls?=
 =?utf-8?B?NzVXd3hQbldQRndhY1B6MnJQV1AyejRTMnRrWHRDVksyL1VVN0JEWEkxUEsw?=
 =?utf-8?B?NVJnbU9LYUpxSU5INW5WazhqUWtMVVB5TmZjdmFoQU1MelJHYnVLbm1UZWF6?=
 =?utf-8?B?ZUlhOFNwQkREMzF4UzVub0dUZ2N0NGFvREE2SUVDMFd2Smd5bEZWOUVLVGJi?=
 =?utf-8?B?ZzR2ZjZSTXZBPT0=?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9833
X-CodeTwo-MessageID: fec49026-d647-4c41-9fe5-b5eec6feeac1.20250630144732@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7732609d-b3e4-49c3-8383-08ddb7e5093f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|82310400026|1800799024|36860700013|7416014|376014|35042699022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDVPNkNrTXdYVHdDN1YycGtVQngzSEZFYU53SUxscExxOHFiNG5XdEVSb3ZT?=
 =?utf-8?B?aW9acGdRd1JyOHIwTmNRcUtBb1E5R1JvQ0V4R1NJYU9Sc0xSR0Q0aXZpUGV5?=
 =?utf-8?B?RkJWOE91blcxb29wR29ZdkF2QW9CUERNeUNkTklsQWVJb3huckkySWpiMjQw?=
 =?utf-8?B?ZkZybk1XWGk5YU5LV2VPbjFZdEFEZFQrTjdDQmdvTmRYSlFHYTIzWnRzNEdT?=
 =?utf-8?B?M0JEaE02TnFZYjh3Rmp0Z1ZMRDExUGYyeGJXUlZKRHBmNFZ2NGFCZ3FqdkVq?=
 =?utf-8?B?VkJrREhKV3YrU2hUS0puUG5LNm93V09tTGp4NzE4ai9yVzE2R3Zhc1pDWFFx?=
 =?utf-8?B?WHQvZEc3WmhEQVViaFp2bzhsTC82WHRTTlVEbW9tNHlwVk5McHllTlVvR2VZ?=
 =?utf-8?B?UEZ5QTJQSldOa0Ftc1NXaFRMWlVaUzFIaGdITHJrNGlBRnpndDlrd3UvaHJD?=
 =?utf-8?B?V3lLZWh5TUpoMkZRRjFiNzA5SUtCNHBwWFpmZnlkRm95K0tnNVFKRzRlSDZS?=
 =?utf-8?B?RHFsN2JpKzE2QkxlakxwSUdrNm5FVGJ2c1c2WnB2RFBrbHAvVi9ZS0RpRGIy?=
 =?utf-8?B?eXdKRUFOQlN6cWZQYzUvUzBnQksxY2tmMjllQWlLZXRCR2h1bUlKS3ZNU3hO?=
 =?utf-8?B?d0VEQUdSZUZVN1A0R1AyVjkwMVlaSDNFVko0RCtsUGxiMDFWcUxZK1hMSGdW?=
 =?utf-8?B?dW81Z3VQa1p4YUJsRVBkRzRadUg3Mzk5ZDNpVWpOeUxTbGZ4enN6cmpMMlNt?=
 =?utf-8?B?elV1UmthUTlYWlNydm5oZnhCdXZ6aVYxd2hhQzJVQk5OTUYvQ3hBMFd6RHlv?=
 =?utf-8?B?SmQ3clpOV3Exdnh1bjhBMEtrS2pDeXM2dkVCNmFqbHBFT3NRQmdsZFBubERP?=
 =?utf-8?B?T0FvNC91andYNC9TMk91SWgyd2xlcVhnOVdOaC9BcUd5ZitZZ1Vkbit5N0dm?=
 =?utf-8?B?eXlrRGg3N0d6ejZ3T01rVW9ING1wdGxrNFZIbm5zajRCbWxCcVQySlUrSEh4?=
 =?utf-8?B?Z2Z1U25NMjFzb0l3K2oyVmZ5TGt2SlhpSVRWUGhYRTg2OHZ1akZsSml0YWlS?=
 =?utf-8?B?Y3BGVGVvZmpsS0ZTRXd4bFhvamkxS2NrbDk2QTlDQ2FzM1R1b2I2eXZTRWcv?=
 =?utf-8?B?T3ZNWm5JcG05RUxVQVVkVTJRN25UOVdRTDhDZjVXa1g4bHhYNWhuc0FwS29m?=
 =?utf-8?B?WFpwRW0rTjZINFBMVFl5a2pJK3F1a3F6TDJxRGxKTWJHRGlmR1pDK0xncW95?=
 =?utf-8?B?U1A2OHJIZjRkL2hJWEM2UXVrZFFtSGJNV2w0SEdBclM5cExKdzlQNUU5UjIv?=
 =?utf-8?B?NG5heDZFUFlDMUp2N2JZUDNIV2VVcWlmcGJ2OXcvNVlPNFBHcFQ4ZDdWV3BV?=
 =?utf-8?B?T2krS0NXSmw3OGZyLzdHalpUcXVsTTVBZzR0Ly9WelNKTXZNQTViOGpTVE1s?=
 =?utf-8?B?SldvNHdXTnk1dmVqeDYvbnpFNU5iN0x3SkxtcW9ZYlpWSDNUODdzRlF5VUcx?=
 =?utf-8?B?UkxHcWl0RFBsVlNacVpnTElLb1l0UEZGd2JsNkVwRkNMbUlvckd1bEc2ZGww?=
 =?utf-8?B?bC9yNjF2ejFEWk1Ydkdjc0ZkNCtpbjZZdTVLV2RXL1NEMUR0NGJJekp0eTky?=
 =?utf-8?B?TCsxNEVCUS82Q2Y1QnFvcXB1NExNVmFCNVR4TVlRRVRLQ09TaCtFV3FrRE8x?=
 =?utf-8?B?UVR4bzlkUGpxaFBRNUdyNENYZzl3U29BVVBrUzlEaGZGS2ErMzdvbkduZmNn?=
 =?utf-8?B?ZjdISlN3aHpjYlRRSEpBMkcyMUxyUG01ZTFaRk1PZ05Wc0tVU0pzM0x6WFRh?=
 =?utf-8?B?MFVzT1lEWlY3MGZQSDRXOGxwTU44VG5kdzhnRk9EOERNTHpCalMxTGZkdUdj?=
 =?utf-8?B?S1Q1blZ2aGFFRVk2Nmd2TlI3cG03YXhoaGFveW5LQ2ppT0g0d1d2dTlXb3Jj?=
 =?utf-8?B?bC9INzFYV2lNVWlmUHpFS0FmaEJTNGxkeGhjOFdiSG1JeW1WM2xlWFowWkJt?=
 =?utf-8?B?Wi80d29SdUpOTGw4MXhFM1A3cUdUTy8zYy80akRGbS9Fc2FXMG1EdHkyZVhU?=
 =?utf-8?Q?/NnHSw?=
X-Forefront-Antispam-Report: CIP:13.93.42.39; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu12-emailsignatures-cloud.codetwo.com;
 PTR:westeu12-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(14060799003)(82310400026)(1800799024)(36860700013)(7416014)(376014)(35042699022);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:47:33.4648 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff2e6c9-cbe5-4e02-deb0-08ddb7e50c1d
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.93.42.39];
 Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8165
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

On 30-06-2025 11:29, Maxime Ripard wrote:
> On Mon, Jun 30, 2025 at 12:11:56PM +0300, Laurent Pinchart wrote:
>> On Mon, Jun 30, 2025 at 10:27:55AM +0200, Maxime Ripard wrote:
>>> On Mon, Jun 30, 2025 at 10:03:16AM +0200, Mike Looijmans wrote:
>>>> On 27-06-2025 20:19, Laurent Pinchart wrote:
>>>>> On Fri, Jun 27, 2025 at 04:50:46PM +0200, Mike Looijmans wrote:
>>>>>> XRGB8888 is the default mode that Xorg will want to use. Add support
>>>>>> for this to the Zynqmp DisplayPort driver, so that applications can =
use
>>>>>> 32-bit framebuffers. This solves that the X server would fail to sta=
rt
>>>>>> unless one provided an xorg.conf that sets DefaultDepth to 16.
>>>>>>
>>>>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>>>>> ---
>>>>>>
>>>>>>    drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
>>>>>>    1 file changed, 5 insertions(+)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xl=
nx/zynqmp_disp.c
>>>>>> index 80d1e499a18d..501428437000 100644
>>>>>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>>>>>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>>>>>> @@ -312,6 +312,11 @@ static const struct zynqmp_disp_format avbuf_gf=
x_fmts[] =3D {
>>>>>>    		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
>>>>>>    		.swap		=3D true,
>>>>>>    		.sf		=3D scaling_factors_888,
>>>>>> +	}, {
>>>>>> +		.drm_fmt	=3D DRM_FORMAT_XRGB8888,
>>>>>> +		.buf_fmt	=3D ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
>>>>>> +		.swap		=3D true,
>>>>>> +		.sf		=3D scaling_factors_888,
>>>>> I'm afraid that's not enough. There's a crucial difference between
>>>>> DRM_FORMAT_ARGB8888 (already supported by this driver) and
>>>>> DRM_FORMAT_XRGB8888: for the latter, the 'X' component must be ignore=
d.
>>>>> The graphics layer is blended on top of the video layer, and the blen=
der
>>>>> uses both a global alpha parameter and the alpha channel of the graph=
ics
>>>>> layer for 32-bit RGB formats. This will lead to incorrect operation w=
hen
>>>>> the 'X' component is not set to full opacity.
>>>> I spent a few hours digging in the source code and what I could find i=
n the
>>>> TRM and register maps, but there's not enough information in there to
>>>> explain how the blender works. The obvious "XRGB" implementation would=
 be to
>>>> just disable the blender.
>>>>
>>>> What I got from experimenting so far is that the alpha component is ig=
nored
>>>> anyway while the video path isn't active. So as long as one isn't usin=
g the
>>>> video blending path, the ARGB and XRGB modes are identical.
>>>>
>>>> Guess I'll need assistance from AMD/Xilinx to completely implement the=
 XRGB
>>>> modes.
>>>>
>>>> (For our application, this patch is sufficient as it solves the issues=
 like
>>>> X11 not starting up, OpenGL not working and horrendously slow scaling
>>>> performance)
>>> Given that we consider XRGB8888 mandatory,
>> How about platforms that can't support it at all ?
> We emulate it.
>
>>> this patch is a good thing to
>>> have anyway, even if suboptimal, or broken in some scenario we can
>>> always fix later.
>> It needs to at least be updated to disallow XRGB8888 usage when the
>> video plan is enabled, or when global alpha is set to a non-opaque
>> value.
> Yeah, that's reasonable

And feasible too I think. Basically only allow XRGB8888 when things are=20
either totally transparent or totally opaque. I'm only concerned it=20
might to lead to strange behavior, depending on which layer you enable=20
first.


>
> Maxime


--=20
Mike Looijmans



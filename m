Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF18A2BC95
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 08:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648F810EA34;
	Fri,  7 Feb 2025 07:44:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="WyytjkMx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1A410EA37
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 07:43:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrhpGmaMg5AjhSD1+ZgmGYkmvz07bLD45tih2BB/cwXCnAz6egLiRgUpKoLprEXiUvnrwK/93bzhTN/WOMzmMb2SaJ9Voa2t/9DiaRIDiPdspPhLrXSHlO4mHbMOr/trUg7AJbAYieUn1g9pA9o+Q35chgutk4DHL401mGWxlVMResjti+XK3i2yQ+ymhKWHO6JVdZnmw7nkjzc6FzjQzOPawYFUvJt3ktKj+o+YIWEzwvRrkn59O7K6mteCjSmCYY0PVt/m6mrJbYHq4SuLUrICf/TvcMIqCCn+ofVbBpUAb9xD9wqKeMlKO1jim8o9OKTb7bmk4zSmyJDIHVM9Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8VYEpUHvPsdqRGF7bsy9JEv2vHQzJZyDHn87EpywJ8=;
 b=ktfOfrZ4kSvyaajbXaMAyTR6YMkhL7imhx8ECy9BMT1LSIynLouFcJ4fQgpy6ERgYMjKc3qewDVxdceykQZJCJ+CNQ2W8jC4ui0XMx5iHOR9uQ9saB6sHxCvElHuyO8ITK9o1eFM+vIonEFzcORGfht+yBMnCrst/yqe0bvIL6FFEz8J6ZpFjBvAcEq+GsD9bwKbQjJrZlPLxY7rpVokSbK1/g9mAwEKovFJTsf7twNCRkWBce5UZxg7vzTi9s44plC4DryFY48rkCCIw1SlGEGbQDegLSJcETzTlls9Bc/Nkyabm0N5fOjXscbj1CSjkwjIbJLwHIEzuGwQ2fhrRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8VYEpUHvPsdqRGF7bsy9JEv2vHQzJZyDHn87EpywJ8=;
 b=WyytjkMxpI3P7mdBOSkrSMy6ceT04qYt5VYX2cAj1bAsnClVyDPS2n5gHkj+piwv9EMy8rKJWAK4WSXe+WWW0EA3FkZsKdJwUo6f3bRgQv/3wrPRlC7ROYfrAQvcUvPSaPpPtNWXwHdH2GS5Iuc0dhSsWRxdzVvfGM2hYG7+9sB9qMAuVjzVPsFEyaNhpw4gQ7cTetVcQLxfA4HBJ7ddY9R+ngv4ywRxJxGIkJZuOFWKzwMicXVluLgEVg0QfEUjV2GShGLmi4R7lp94jDKIIIi2f+uSkzseSDUB3EGXpvKmv8OD9VVfB68/ccoDZ1UyzcXHe+3B4eImHBytOiGdbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB8PR04MB7161.eurprd04.prod.outlook.com (2603:10a6:10:124::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Fri, 7 Feb
 2025 07:43:48 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 07:43:48 +0000
Message-ID: <544243dc-9511-45b0-9fe5-8633621269e7@nxp.com>
Date: Fri, 7 Feb 2025 15:44:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] Add ITE IT6263 LVDS to HDMI converter support
To: Maxime Ripard <mripard@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
 sboyd@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 marex@denx.de
References: <20241114065759.3341908-1-victor.liu@nxp.com>
 <20241217-uppish-sapphire-dinosaur-4c40a2@houat>
 <aba80c42-1b48-426f-b29d-88bf18473602@nxp.com>
 <64eaq2n3pfcxxxcw5n3cqpx3ie3vyqo6v6akc5g72anoazendf@5vrlafr3q676>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <64eaq2n3pfcxxxcw5n3cqpx3ie3vyqo6v6akc5g72anoazendf@5vrlafr3q676>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:4:186::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB8PR04MB7161:EE_
X-MS-Office365-Filtering-Correlation-Id: de7f9adc-13c8-4e8c-4816-08dd474b27f9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3E0NERPVk4yMUxvNEFQeEhTNzhGV2oyNCs3VXpCKzdTSWJJQWRKR2IxOGNQ?=
 =?utf-8?B?RWE2UXFJM1pDSURVRmFHaWNCZWxnekx2QWNXT05zRHFGRFJNbC85NjQ2ZGsx?=
 =?utf-8?B?RlFrWmR5OE4xWG9aUWd1Y2VGSWt3OHpmZjkwRFI2STFMSUE4VTB5QkE1emQ0?=
 =?utf-8?B?SXI5YWR6bjUrWU1mdGNZdTdxeXZoNFpiQTE2akU1NEdHNlZ6MlZ5K0h3Yi9r?=
 =?utf-8?B?Nkp0anRaYTVBdlBkTmdaNlB5V2x0NjZ2TFAwWm0wTiszZ0tjTlFvdTE0bCtt?=
 =?utf-8?B?OUtGYnFheXJUVnJaR09sdlZicTNhT0xUYzJqendkdEtNTmtKQ0xIWnBLdE14?=
 =?utf-8?B?SWhxdFhXOHBCR2E2VXk5ODZuRm5QMjMrQUxwOGNETS9lV2xqNTYrTmxJRUVL?=
 =?utf-8?B?WVhmNnJ2a2VFaEJ3bE5WaHlvbjBiZFhzR1ZvQXFjaEhwdHNPOEY0MzgwTzRa?=
 =?utf-8?B?aE1SZm1XS294R2UwQ2hpN1B5RlFuc21yWjMyeXEyNlFpNUpSMTBnakNMYUk2?=
 =?utf-8?B?MFQ0My9CT0w1bXNLK2RqY1dlck1GdUg2Wk5PN2NXaGJVVmFqU1grRy9FeGF4?=
 =?utf-8?B?bjJndkNzbUxQVmVMWEVURnBHcTZTbHEzbkh6OU9ZL1IxM3p3dFNPNXJqOU9W?=
 =?utf-8?B?TTlFejVjN01uT2I0a1ZXeGd6MGc0TmI3QU4rRkZha3c2dktNdE55TDQ2a2RE?=
 =?utf-8?B?NWtBeFYwbE9QWUx2VkRHY05Qd256c1RKcVM4aHAxaVJGMm1tOGhyTXlqSUhK?=
 =?utf-8?B?Z1gxRlpsMk9iVDhSdWhSR2lEN01UNFdLZDJwbVBVU0htL2tzdlk5eVFRTGJh?=
 =?utf-8?B?WncrdUIyR2E1WnUySzlRN0U1RWtPU2FQR3VGeFVTWEkwMmhNYkpNcTlXUXBJ?=
 =?utf-8?B?TjZwOC9OTTQweVp2RTNKVzRNcStMdWFXeWtjRi8vSVoxN1U2WStrdFN6NjhX?=
 =?utf-8?B?UWtxdVkzZ2Q3UmFqRFhHNVJjYm5wNnJXSjdLOENoSzNQYjEzZW1iTkczdkpi?=
 =?utf-8?B?UnUvUkZmTTRrNkJlOUQ3Yk5RdmdJQjBINGhlSmJDWFFBeUhZWGJJeXRGTXUr?=
 =?utf-8?B?U2NUc05MQjlFMGl6WHI0SUx0TE94Nm5zajRGWmN5OXBZZTloYkViQ3JGbXhI?=
 =?utf-8?B?eklKU1lBTW4ySUJYa0dRL05ISE9ObjFlWHBUVE9WcDBoYWVsQ25ZemJWQXUr?=
 =?utf-8?B?em9UUlJGSVFPL3FJSit5dmtDbjNJek9QUDNmYlFFM2JjQ0FCZEs1amZ5NUFv?=
 =?utf-8?B?cDdiQ3dBSmJ3UlJ3Q0lnV1REc21RcFdNMjVaMFFpWFA5SjAveG93dElHSVR0?=
 =?utf-8?B?WkdYTnBISXNMS0dmSDMzbDZ4dDkwcnlvaGxvaWxjTEtaSVhPWEdXdklIY2ZM?=
 =?utf-8?B?cUlYV216cGRVWUxVSDNnalN3RVd6d08rQ0h3ZVJyakw3aFpWUkIrWk1GNEda?=
 =?utf-8?B?WDhVV0JLdEFRSzA1TnM5K0t0VmdSZmFXMUlvK2xkYTJ6bXl6Z3ZIbGU5dlNG?=
 =?utf-8?B?QTBXNXI2cnJ0MEh0bXNDMWtjVnl4TDN1cUFYUXpmdVE4SW01Q1krYy95ejNQ?=
 =?utf-8?B?eWxTOElwTlJsakdvUFhETEE2MmRKaGFzekxWekpoQ3JiMFNTNnRxTUtzdmpG?=
 =?utf-8?B?Zk5mekhKU2hTeFFpSTZLeGlNc0REaWlCVnRUZUlWcmdybU5IbUNqWUhVYS9l?=
 =?utf-8?B?dFRHYldsWHhHOTViRkg3aUUvbzd3T0Y3Um1qeGR0cE9ISVB2eGVyRFAwK0dT?=
 =?utf-8?B?a0lVazFDV3FhRXRzUWJLSW1FRWJ2ZGx3UWRLTmIreGVsaDd4dWR5emJIQ2Ur?=
 =?utf-8?B?OHJCQkc1Qy9PZjE4VTE2UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWV2dnNNSFJiSXFOa1MvSDE4aEh1NHVnTUU2VUoxdWJzTERybE5odmx2QXdm?=
 =?utf-8?B?cGJXUlhUeTNRYUpzZ3hpMnNsMjBpMzA1bERPUno2Vk15bXJJRk5LNWROQnEy?=
 =?utf-8?B?TVJ5akcxQlBDU1FNcDNDR0dETkp0aFdtZXNxWWxkSWRpTEhmcng5MVNwVElB?=
 =?utf-8?B?eVYrQUVzLzkvSEg5czF5ZjQxNUtBeW1NZFNIc2tIazdGWHcyemp2N2d4Zm4w?=
 =?utf-8?B?eFU3LytROHlBeUh2TXQvQkVSdHlMZjNjeDFscWtWY3Z2L0pKY1YzRzVsVkRX?=
 =?utf-8?B?T2ZpblNkaFZuN3dJK0JITDNrNHFkenFvR25TZFFlUm1Ba2xNaFNGcndaa3V5?=
 =?utf-8?B?SGlvamIvenVOL3JkRlBhYm5sTlg1VHVzVEZ4aFM3RXovdVk3VHVvanB0bk1R?=
 =?utf-8?B?OGpnRDMzeWpYZDdDM0RCWmVNM2d6emJpLzBySWMyUEtZTVZ1c2xPSHE3MmRo?=
 =?utf-8?B?UnV5YnhYZzgrVVZ6b0R5VlNBUGozS0hBdTdGbUJLWUp5YzZiZzJ6OFZMcjVQ?=
 =?utf-8?B?NCtuTHRLQzNTRkxXTWM1d2N5RXJOM0htNTBnelI0OHpQU0RKSzBJNStGeWt6?=
 =?utf-8?B?ZTRLemdQMkJjUmpYQWRJL3VzTHlhUDlUYUhvRnVxRlk1UCtQbnpzaG11SWN6?=
 =?utf-8?B?TUlkVE5zK1VUNFpSVjMxR0xXL1huRDZlb1FyY1kwdUZsclpqbnBBZXh3V2R0?=
 =?utf-8?B?eHFmQ2Q4bnpzV3MxK2JDU0lkSjZKMnlxVXo4UW1PdlZub0Y2WG1JOG5tUTRL?=
 =?utf-8?B?WTRGangyazA5VVN6cFdIMXp3MDRWNmNmYzdsazBleHhFbDF6b3pXQXZVSVpR?=
 =?utf-8?B?WHB4ZXFnTzY0enQ2VWY2QjZDaXhaSGdUUzVrcGhIZW5nN05jMlhrUkVDWEI3?=
 =?utf-8?B?Wk9IRzVLSXhQb0tEZ1hLSTJFQWFqU2hVbnEvOENxanJjakJtZTMybHRRb0xV?=
 =?utf-8?B?VHdNSDRWdTJTeVpUenpkLy9XUng2TjlVc25RTUw3MFdxYjN2ZzVOVGs5S3My?=
 =?utf-8?B?SExuT3Irc1Q2QXNkQWZSck9IV2N4UzlXY0hsVmZqbjRjMlY1TW9hU1RBdG9l?=
 =?utf-8?B?dEJ5c2VBd0xhZmpJaFJkOWtNUFFJZHJyeThncWszcW9KZXp2dE43ME1ZWXg1?=
 =?utf-8?B?ZWFhYy9lM29WR0J3MVBuL2JQMVkvUzhQeFl0ZmtDWUhyVWdiUmpqRkdTelBD?=
 =?utf-8?B?NDVCTzE3VmxRVHdLY1N1QXBScjVyaEZVUWxpWmlXT0x5R1N2Wmk3VjlKMS9s?=
 =?utf-8?B?K2dqY0tqZDc2RzhhaFMyd3hhWStuSjJPcEZFY2NtTHdJSHZoQThZNFhRb2U4?=
 =?utf-8?B?OGFsSTB0OTh0QUhmdzBIS3VmdFZHZHd0YkZxeSsrUUlERjhySzJlOE1WS001?=
 =?utf-8?B?NnkyVWdYbm14eHNUSGhkQUNwenJZNGZESFRIT0htQnk0anZzOVIyVUFTbzF4?=
 =?utf-8?B?amQyM29ndWltazExbkxTa2xxQng2bTlwTTlDL1U4aEFLc2tBU1MyVThPSGJD?=
 =?utf-8?B?ZWkraEc0cml1SElqbDVxa01FajB2NUpBd21HOElNQkhRN2NGVnNwQ0NBR0lF?=
 =?utf-8?B?MG1UN2RDbXd6T1pGT3AwR21yL25YK1drcW45RENoMGJ5TVFrVkFLSDhCMW1E?=
 =?utf-8?B?ZjhDRVR6T2hIbnlTZGM5TEZWbUd0SFpiRHpNOXo3Y09TUzhzVkMzU0piYVl4?=
 =?utf-8?B?akhEOEhXZWdKRnZ0SXZuNWdacC9GSlIzZklMZE9JSHg1RVA1ZlVteVV5d1E1?=
 =?utf-8?B?dHBoamoxVVdJN0hrVngvT2plQlhpNVJTZS9vME1nMkpBN1M5UmxsR2VheHZQ?=
 =?utf-8?B?VnpnYmhJQ0tkWGh1TzMwWjJJWlZ0MTM1R3ZkRnBLZU5HYXEvVjRGckJac0ww?=
 =?utf-8?B?R0hYbWkvR0djQ3ZpZHZmMEQ3SS84UnYyZTl4THFHMCtkYmMvV2kxNWxOdlZ3?=
 =?utf-8?B?eGR1bmNRcklJUVMzRmFIZitSNm5mRGhpVHNFZTVUOVI4dUowTzhiZ1l4UXcw?=
 =?utf-8?B?Q0ZOeHR2V1ZXbG9CQzlrWFZMNTViWkU2aDlVSExZM1QzYVZuekplb0tDN3Y5?=
 =?utf-8?B?RW5YK1QzRDBjYTJDN3Z5QVFhNFptTXZxSlNyMDZoaTBXVGVSdk9hc2lvdUVz?=
 =?utf-8?Q?QbsrOlFWRD+WwvbliCgfKqXCY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de7f9adc-13c8-4e8c-4816-08dd474b27f9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 07:43:47.9811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYo/8LUBF2pFhMasKMGlLBAc9ERW0iDj5MvGsOAMzEL6+OzmihPc5i605WdSD5rFufWQJLa2b4ycKze+x64BjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7161
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

On 01/28/2025, Maxime Ripard wrote:
> On Wed, Dec 18, 2024 at 02:02:18PM +0800, Liu Ying wrote:
>> On 12/17/2024, Maxime Ripard wrote:
>>> On Thu, Nov 14, 2024 at 02:57:52PM +0800, Liu Ying wrote:
>>>> This patch series aims to add ITE IT6263 LVDS to HDMI converter on
>>>> i.MX8MP EVK.
>>>>
>>>> Since IT6263 DT binding and driver were picked up from v5 and landed
>>>> in drm-misc, this patch series contains patches almost all i.MX8MP
>>>> SoC/platform specific.
>>>>
>>>> Patch 1 is a preparation patch to allow display mode of an existing
>>>> panel to pass the added mode validation logic in patch 3.
>>>>
>>>> Patch 2 is a preparation patch to drop CLK_SET_RATE_PARENT flag for
>>>> media_disp{1,2}_pix clocks.  Patch 5 depends on patch 2.
>>>>
>>>> Patch 3 allows i.MX8MP LVDS Display Bridge(LDB) bridge driver to find
>>>> the next non-panel bridge, that is the IT6263 in this case.
>>>>
>>>> Patch 4 adds mode validation logic to i.MX8MP LDB bridge driver against
>>>> "ldb" clock so that it can filter out unsupported display modes read
>>>> from EDID.
>>>>
>>>> Patch 5 adds mode validation logic to i.MX8MP LDB bridge driver against
>>>> "pix" clock so that it can filter out display modes which are not
>>>> supported by pixel clock tree.
>>>>
>>>> Patch 6 adds DT overlays to support NXP adapter cards[1][2] with IT6263
>>>> populated.
>>>>
>>>> Patch 7 enables the IT6263 bridge driver in defconfig.
>>>>
>>>> Note that patch 3 and 4 depend on patch[3] in shawnguo/imx/fixes.
>>>>
>>>> Since this patch series is related to another one[4] authored by Marek,
>>>> Maxime asked for a proper description[5] about the exact problem.
>>>>
>>>> Admittedly, it's a bit complicated.  Here, I'm trying to do so and explain
>>>> a bit more.
>>>>
>>>> [ Description ]
>>>> It's a clock problem about shared i.MX8MP video PLL between MIPI DSI and
>>>> LVDS display pipelines.  The pipelines are driven by separate DRM driver
>>>> instances, hence there is no way to negotiate a dynamically changeable
>>>> PLL rate to satisfy both of them.  The only solution is to assign a
>>>> sensible/unchangeable clock rate for the PLL in DT.
>>>>
>>>> Admittedly, sys_pll3_out can be another clock source to derive pixel clock
>>>> for i.MX8MP MIPI DSI display pipeline if a particalur i.MX8MP platform
>>>> doesn't use audio(sys_pll3_out is supposed to derive audio AXI clock running
>>>> at nominal 600MHz).  However, for i.MX8MP platforms with audio features,
>>>> the shared video PLL case has to be handled and it determines that the above
>>>> solution(unchangeable PLL rate assigned in DT) has to be used no matter
>>>> sys_pll3_out is for display or audio, because the separate DRM driver
>>>> instances really don't know if they are sharing the video PLL or not.
>>>>
>>>> [[ i.MX8MP Display Hardware ]]
>>>> i.MX8MP SoC supports three display pipelines:
>>>>
>>>>  -----------------------------           ------------------------
>>>> | imx8mp_media_disp_pix_sels  |         | imx8mp_media_ldb_sels  |
>>>>  -----------------------------           ------------------------
>>>> |  osc_24m (fixed 24MHz)      |         |  osc_24m (fixed 24MHz) |
>>>> |*-video_pll1_out (video)     |         |  sys_pll2_333m (sys)   |
>>>> |  audio_pll2_out (audio)     |         |  sys_pll2_100m (sys)   |
>>>> |  audio_pll1_out (audio)     |         | -sys_pll1_800m (sys)   |
>>>> | -sys_pll1_800m (sys)        |         | -sys_pll2_1000m (sys)  |
>>>> | -sys_pll2_1000m (sys)       |         |  clk_ext2 (external)   |
>>>> |  sys_pll3_out (audio ?)     |         |  audio_pll2_out (audio)|
>>>> |  clk_ext4 (external)        |         |*-video_pll1_out (video)|
>>>>  -----------------------------           ------------------------
>>>>              ||                                     |
>>>>  -----------------------------           ------------------------
>>>> |   media_disp{1,2}_pix       |         |        media_ldb       |
>>>>  ----------------------------- mux+div   ------------------------ mux+div
>>>>              ||                                     |
>>>>  -----------------------------           ------------------------
>>>> | media_disp{1,2}_pix_root_clk|         |   media_ldb_root_clk   |
>>>>  ----------------------------- gate      ------------------------ gate
>>>>              ||                                     | (LVDS serial clock)
>>>>              ||                                     V
>>>> 	     || (Disp2 Pclk)  --------      ------------------
>>>> 	     | ------------> | LCDIF2 | -> |       LDB        | -> panel/bridge
>>>> 	     |                --------      ------------------
>>>> 	     |  (Disp1 Pclk)  --------      ------------------
>>>> 	      -------------> | LCDIF1 | -> | Samsung MIPI DSI | -> panel/bridge
>>>> 	                      --------      ------------------
>>>>                               --------      ------------------      ----------
>>>>                              | LCDIF3 | -> | Synopsys HDMI TX | -> | HDMI PHY |
>>>>                               --------      ------------------     |     +    |
>>>>                                  ^                                 |    PLL   |
>>>>                                  |                                  ----------
>>>>                                  | (Disp3 pclk)                         | |
>>>>                                   --------------------------------------  |
>>>>                                                                           V
>>>>                                                                     panel/bridge
>>>>
>>>> * video_pll1_out is supposed to be used by video outputs.
>>>>
>>>> - LCDIF2 + LDB can only use the *same* video_pll1_out, sys_pll1_800m or
>>>>   sys_pll2_1000m.
>>>>
>>>> [[ i.MX8MP Display Drivers ]]
>>>> LCDIF: drivers/gpu/drm/mxsfb/lcdif_*.c
>>>> Three LCDIFv3 display controllers are driven by three imx-lcdif DRM instances
>>>> separately.
>>>>
>>>> LDB: drivers/gpu/drm/bridge/fsl-ldb.c
>>>>
>>>> Samsung MIPI DSI: drivers/gpu/drm/bridge/samsung-dsim.c
>>>>
>>>> Synopsys HDMI TX: drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>>>>
>>>> [[ Problem - Shared Video PLL Between Samsung MIPI DSI and LDB ]]
>>>> osc_24m, audio_pll*, sys_pll* and clk_ext* are not for video outputs,
>>>> because:
>>>> a. Aparently, osc_24m runs at fixed 24MHz which is too low for most displays.
>>>> b. Audio subsystem may consume all audio_pll*.
>>>> c. sys_pll* are system clocks which are supposed to run at fixed typical
>>>>    rates, e.g., sys_pll2_1000m runs at 1000MHz.
>>>> d. sys_pll3_out is supposed to derive audio AXI clock running at nominal
>>>>    600MHz(i.MX8MP data sheet specifies the rate), see NXP downstream kernel:
>>>>    https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx8mp-evk-ndm.dts#L19
>>>>    https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx8mp-ddr4-evk.dts#L25
>>>
>>> Is there any downside to using any of these clocks, aside from the fact
>>> that their rate must not change?
>>
>> osc_24m and sys_pll* don't support spread spectrum while audio_pll* and
>> video_pll1_out support it. Other than that, I don't see any downside to
>> use any of these clocks, if their clock rates happen to meet the clock
>> rate requirements of the MIPI DSI and LDB display pipelines.
>>
>>>
>>> Also, if they can't change their rate, why do they have
>>> CLK_SET_RATE_PARENT (sys_pll* in particular) ?
>>
>> If media_disp{1,2}_pix and media_ldb clocks have no CLK_SET_RATE_PARENT,
>> it doesn't mattter whether their parent clocks(these clocks) have it or not.
>> Note that patch 2 drops CLK_SET_RATE_PARENT for media_disp{1,2}_pix clocks.
>>
>> Anyway, why have sys_pll* clocks got CLK_SET_RATE_PARENT? The reason I can
>> think of is that it makes some potential i.MX8MP platforms possible to set
>> the sys_pll* rates with the parent clock rates(sys_pll1/2/3) updated
>> accordingly, e.g., if sys_pll2_1000m is the only active child of sys_pll2_out,
>> sys_pll2_1000m's rate can be assigned to 800MHz(not typical 1000MHz) in DT.
>> Or, maybe, the sys_pll* rates can be assigned to some particular values to
>> support nominal/overdrive modes of various i.MX8MP clock roots(some are
>> derived from the sys_pll* clocks).
>>
>>>
>>>> e. clk_ext* are external clocks without known capabilities.
>>>>
>>>> So, the only eligible video_pll1_out is supposed to be shared between LDB
>>>> and Samsung MIPI DSI in the two separate display pipelines if sys_pll3_out
>>>> is already used to derive the audio AXI clock.
>>>>
>>>> With the shared video_pll1_out, drivers for the two display pipelines cannot
>>>> change the PLL clock rate in runtime, since the pipelines are driven by two
>>>> DRM driver instances.
>>>
>>> What is the typicall frequency on those pipelines? Could setting the PLL
>>
>> For MIPI DSI to HDMI(ADV7535) and LVDS to HDMI(IT6263), the typical pixel
>> rates are 148.5MHz(1080p60Hz) and 74.25MHz(720p60Hz) and the typical LDB
>> clock rate is 519.75MHz.
>>
>> For MIPI DSI panel and LVDS panel, there no typical pixel rates. It depends
>> on individual panels. However, it's possible to override panel's pixel clock
>> rate in DT to use a fixed PLL clock rate if the pixel clock rate deviation
>> is still acceptable by the panel.
>>
>>> high enough that any frequency required by any of these pipelines can be
>>> accomodated through a divider work?
>>
>> Yes, that's why media_blk_ctrl node in imx8mp.dtsi assigns video_pll1 clock
>> rate to 1.0395GHz. That rate supports the typical 148.5MHz and 74.25MHz
>> pixel clock rates. With this patch series applied, i.MX8MP EVK would use
>> this fixed 1.0395GHz video_pll1 clock to drive both MIPI DSI to HDMI and
>> LVDS to HDMI simultaneously.
>>
>>>
>>> Something like you run the PLL at 594MHz, and then most HDMI frequencies
>>> can be reached by a 1, 2 or 4 divider.
>>
>> PLL running at 594MHz does support the typical pixel clock rates for MIPI
>> DSI to HDMI, but not for LVDS to HDMI due to the 7x(single-LVDS link) or
>> 3.5x(dual-LVDS link) folder between LDB clock rate and pixel clock rate.
>> PLL running at 1.0395GHz is the one chosen to support both MIPI DSI to
>> HDMI and LVDS to HDMI, e.g., with dual-LVDS link, 148.5MHz pixel clock rate
>> = 1.0395GHz / 7 and 519.75MHz LDB clock rate(148.5MHz * 3.5) = 1.0395GHz / 2.
>>
>>>
>>>> [[ Solution ]]
>>>> Assign the PLL clock source(s) and the PLL clock rate(s) in DT.  Disallow
>>>> display drivers to change the PLL clock source(s) or rate(s) in runtime
>>>> including LCDIF driver and bridge drivers.  With sensible PLL clock rate(s),
>>>> typical display modes like 1920x1080@60 can be supported if external HDMI
>>>> bridges are connected, and panel display modes can be too.  Also the unneeded
>>>> CLK_SET_RATE_PARENT flag can be dropped for media_disp{1,2}_pix clocks.
>>>> If needed, bridge drivers just call clk_round_rate() to validate clocks so
>>>> that unsupported display modes can be filtered out.  Although the
>>>> unchangeable PLL clock rate disallows more potential display modes, the
>>>> solution works for single/dual/triple display pipelines(OFC, hardware designers
>>>> should pick panel/bridge display devices carefully first by considering clock
>>>> resources).
>>>
>>> I think it's a reasonable idea, if not for the hardcode-it it DT stuff.
>>> If we can manage to have a fixed setup work ok for all display use
>>> cases, why would it be in DT? The clock driver seems like a much better
>>> choice to me.
>>
>> Different i.MX8MP platforms may have different display devices(panel(s)
>> and/or bridge(s)). It's flexible to allow each platform to assign the PLL
>> rate(s) in DT. It doesn't look doable with clock driver, does it?
> 
> Why not? Plenty of platforms are doing it. If anything, it's more

Keep CLK_SET_RATE_PARENT flag for IMX8MP_CLK_MEDIA_DISP{1,2}_PIX clocks, check
compatible machines and call clk_set_rate_exclusive() in imx8mp_clocks_probe()
like the below snippet ?  This is the only way I can think of to fix the
video_pll1 clock rate in the clock driver.

-8<-
if (of_machine_is_compatible("fsl,imx8mp-evk")) {
	err = clk_set_rate_exclusive(hws[IMX8MP_VIDEO_PLL1]->clk, 1039500000);
	if (err < 0) {
		dev_err(dev, "failed to set exclusive rate for video_pll1: %d\n", err);
			return err;
 	}
}
-8<-

However, it's not as flexible as assigning the video_pll1 clock rate in DT,
because the i.MX8MP EVK board exposes it's MIPI DSI and LVDS connectors through
MINI-SAS connectors(find MINI-SAS connectors in the board image at
https://www.nxp.com/design/design-center/development-boards-and-designs/8MPLUSLPD4-EVK)
and people may connect various sensible MIPI DSI/LVDS panels or bridges with
MIPI DSI/LVDS input interfaces as they want(not necessarily the panels and
bridges provided by NXP).  Hardcoding the PLL clock rate in the
clk_set_rate_exclusive() function call is really not flexible.  Instead, people
may flexibly assign a sensible PLL clock rate according to the actual connected
display devices.

> flexible to deal with it in the clock driver, because then you don't
> have to filter out modes that aren't compatible with the frequency that
> got assigned in the DT.

I still need to filter out unsupported modes(due to clock constraints) in DRM
driver even if I use the above snippet in imx8mp_clocks_probe(), e.g., the below
two modes with 27MHz pixel clock rate need to be filtered out for IT6263 LVDS to
HDMI bridge with dual LVDS links because the 1.0395GHz PLL rate cannot satisfy
the 27MHZ pixel clock rate.

#7 720x576 50.00 720 732 796 864 576 581 586 625 27000 flags: nhsync, nvsync; type: driver
#8 720x480 59.94 720 736 798 858 480 489 495 525 27000 flags: nhsync, nvsync; type: driver

> 
> Also, it's more robust since that frequency isn't guaranteed to be
> constant across the system life.

If we drop CLK_SET_RATE_PARENT flag for IMX8MP_CLK_MEDIA_DISP{1,2}_PIX clocks
and assign the PLL rate(s) in DT, I don't think the PLL rate(s) would change
across the system life.

> 
> Maxime

-- 
Regards,
Liu Ying

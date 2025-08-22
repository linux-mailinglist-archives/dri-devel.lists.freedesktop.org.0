Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0463AB31DF3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 17:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40B410E142;
	Fri, 22 Aug 2025 15:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=topic.nl header.i=@topic.nl header.b="VfADMPpz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11021105.outbound.protection.outlook.com
 [40.107.130.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBF910E142
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 15:17:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/9qKJvBekeP2DDDmbnypxUH91K91gvfyzu+9MZvevZBrkxPKP7XX9Gr6PYkxSiS/pIXtgiJX11sb+ozJvqYjGKQtmUJzxb1iICWj9W7bwT40IoLERd8rL9v1mhe9EPBdi6725Fiw1C/Vk0Op5PDqKdf/aiid5dKIoR6eAqXV9VZvsn46vcyVYRt5paiUaPKR9IqhK+veQv1NG78Ap1orJ3U8mrmTwftEVSiETZzCmYiCrZRWTsdxvsMzyjcxBeiveyaSaFuT23C8uJKlhPBFpaHxKswjxKt6SbTfEIT4ZLaUwr3TsTsNwRCiLb5qkMxRxBeGU73QxKwsZ2FQyytXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9F1NItjIqI9YfumN56aoa7QFUZbU4WUtGozobOL+bE=;
 b=JA3g8SXQuBLXQJKFGQbwRE61OELoRonJ4zNy7XT6jsxWI6DXVClKpaqo6ZBVkCmOrGHLmm0T/j9hIQopxwm6r0hgA6MpN74JING5FtBqewAP9RdH6WyDWfrgvOPY+MFYmd0BRFhg/cHDjQvnR6ZDcOEiyaC92HV9KkKHqgHcVssdo8p4t76pnnOmTCYWYfRe3aY7/8BIostkLkYQzHKt5MPjuFXM6oS5eVevzPkH34ut7CFI//ll7PUmZ3pOTuqN20I0RjKBxl+Xx4K/VVurelKqv6PPPDqrlkr5N43+V548s99WWfhIZosmJjdyRj7lUoR/gvV7yQaZy/6GQXPiIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.93.157.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=topic.nl; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9F1NItjIqI9YfumN56aoa7QFUZbU4WUtGozobOL+bE=;
 b=VfADMPpz41ZzOBvdd/k3NIiCS4FSRx1gfd9eC7TxXz0m+o5tukdw10bI+JDP4lIQ+dWoqv+C2vFUMi87bcnqIP3IrZPyGbacsu5xZ55z/OvVYtrMf/qfZbEU73B0tottH8uRX1SWvNK31x+tsW/GUZCyKoOJzs+q5iuyJ0qQ2K3iXTxfIyuHc3wCKMgCR24EsK7M0Zrf9ZCQmSxSDFuRF4tMZ8zm1khzSesqv6V3sSy/GxgrjCPrUIhETRPF71KUa059/eADE9bpkzftitgYxnAzvG4LjFfFurtQOC3Rano+1uEQxnUbY0gbxGuqUW+ZoyiSZRRCtQ6Ez+U7BPyaqg==
Received: from AS4P189CA0046.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::11)
 by AS8PR04MB7925.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 15:17:01 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::40) by AS4P189CA0046.outlook.office365.com
 (2603:10a6:20b:659::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.18 via Frontend Transport; Fri,
 22 Aug 2025 15:17:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.93.157.195)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 20.93.157.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.93.157.195; helo=westeu11-emailsignatures-cloud.codetwo.com;
 pr=C
Received: from westeu11-emailsignatures-cloud.codetwo.com (20.93.157.195) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 15:17:00 +0000
Received: from GV1PR07CU001.outbound.protection.outlook.com (40.93.214.97) by
 westeu11-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12)
 via SMTP; Fri, 22 Aug 2025 15:17:00 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by AS8PR04MB9045.eurprd04.prod.outlook.com (2603:10a6:20b:440::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Fri, 22 Aug
 2025 15:16:57 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%7]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 15:16:57 +0000
Message-ID: <92127515-13fa-433b-b3a5-053326090e69@topic.nl>
Date: Fri, 22 Aug 2025 17:16:56 +0200
User-Agent: Mozilla Thunderbird
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: Re: [PATCH v3 2/2] drm: bridge: Add TI tmds181 and sn65dp159 driver
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
References: <20250820144128.17603-1-mike.looijmans@topic.nl>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.51b271ba-97e3-4830-97f9-7b6b4e0d202f@emailsignatures365.codetwo.com>
 <20250820144128.17603-3-mike.looijmans@topic.nl>
 <20250821-ivory-pegasus-of-aurora-c5c400@kuoka>
Content-Language: en-US, nl
Organization: Topic
In-Reply-To: <20250821-ivory-pegasus-of-aurora-c5c400@kuoka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM0PR06CA0116.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::21) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|AS8PR04MB9045:EE_|AM4PEPF00027A5E:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: e0d53c5d-dc1e-4f67-6db8-08dde18ef172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|366016|1800799024|52116014|7416014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?c3YrVEc5QjRadzJwWVBDdlBPenJ3RnFaaWRiV3hoVngwbTFmZks2VHRpWXdE?=
 =?utf-8?B?WGpZUkFWczliNXM0MXZSdnFtb25qOEdDRi9DY3pQSnlKZ2x2UHVlL3NyZzh1?=
 =?utf-8?B?bFVaK2hqRkhUbmNaZDhMMDRtNDUza1h3aVkwR0lSOTlXY21LZWtNZXNpenh1?=
 =?utf-8?B?c3VzNERHTkFVY2RqMC85VHV5dDZFbjhZZ1EvUkxnTkZubXcwcVNtV0RmNExL?=
 =?utf-8?B?SEs5YUVCamNsYlhHbG9LcWNrc09vSkdKc0xOcm9kbk40a1B0SjZxN3hUS0Jj?=
 =?utf-8?B?THowWkVKRXR5a2ZzQW43bXZoZThvVWFWWW9Fb2FSWStWWThaTDdPdWp4S2Zy?=
 =?utf-8?B?bDRBZ3E5VWZpYjgzMlc3SXQ2bUVIZ2hzMWxkTThsRHpQNG5GdUY1VXpsdVBW?=
 =?utf-8?B?V0ZRUm05Qi9vTHIxVzlMUkJVay8rYXJ3UzluUXJNb0JxdFVQNnl3SjdMczFV?=
 =?utf-8?B?eklOKy94MTRKQ2syNVhhS2h4dndsU1RFc2dWNkxYQjJodFFYMDI3TEQvVExF?=
 =?utf-8?B?OGh3UDFXeHNWcDZxRGhOVjRuV3ZYcTJ1VkhXdTM2OWhISTZ2TktEajBrM1hk?=
 =?utf-8?B?S29qWCsyMkdvYlh6SjlCc2gxT2syYmF3M2cvaE5MaCtCWGRBYmdHMW9yZGV2?=
 =?utf-8?B?ODZQdWdKOTFWMHIrdHJMWDdIMXlNSzVNblRFUXhMZVFPWmd5a3htZ3Y5cldn?=
 =?utf-8?B?dGxJbnlHRkRZM1NWOEhFaVdLTDFLZzRJa0FkSzlWZWhrRjJ0UVhmZURWaEhk?=
 =?utf-8?B?Vk5YOEEwN2N3aTlRU2VlYVZHS01laXVVVjlaUzkxbHloSGsyK25saWxRNzM1?=
 =?utf-8?B?ZTVwR3E4QlhwVmNiZHZKb1FRZThFM1VKZjAxaGJLd3FQNXZLUm4ya1ArNlJu?=
 =?utf-8?B?VXFlUmNsbTgxM0lYUVFaNThFMTkwNU8wOVk4S3YxUE92Yjdqbnd1MG05NG1P?=
 =?utf-8?B?ZVRrWjZmSHJaUVo3OUh4WU0yUll3Y0pQOUduNldzZWh6eE5VQktMRDVlN2NL?=
 =?utf-8?B?QlpGdjFXODhOYmVObUpmVHd5QnE5TzMxL044dHZRWXF6eVNsclIxSnJkbDlq?=
 =?utf-8?B?TjQxWjhtZDJJcDl0ekRQOG9HcFh3MzhuMHZzRkJWQmtJTVV2SDA0OElCc1Ux?=
 =?utf-8?B?VXRsQTZXM3hsenVCdmVSZ2x1MDZ1bFRLRHZybDlOc2pPRHlLalNPdFBIb1da?=
 =?utf-8?B?QTVHMW1sTUwyY0M2ZkRNQnhRVzQrWFpvRG90NUhOQkx1QkV4WVdzSjlXQVhx?=
 =?utf-8?B?ZzR1Q3hHZ083RU1ZcndDaG9KOGFMOEhLRHFKWkJWVE10Y1dkMDFmek5VRlVT?=
 =?utf-8?B?K1Zreml5cTB5Z0FVb0I4RWlFNU95ekNDUEN2MkNSOStVWXJZS3RxYjBnUDAx?=
 =?utf-8?B?eHo1RVNsZkhocHZDb0psc1ZieHBOa2VQUWxnQkZadFJsOFQvdzZzUERia2I4?=
 =?utf-8?B?a0RiR0JuRjdmM1A3cjFGdjZaTDdISjNqMDJrRUtVQ2E4QVRmeWdrNVZOSUN1?=
 =?utf-8?B?dlJ2Mmpab0NGNW9KTWlMQTNjem5LVVVlTEE3YWl5R1ZQUktKd00xZitjRTZ3?=
 =?utf-8?B?SzFBMFB3UlVOZnNySHpRYUN5WEhrcndCc1hDd3VqTDhCS1ZiVVpUZ1luK0R6?=
 =?utf-8?B?N0lsbWV6Wkd5QlVqcnoxaHJxV3ZQYVRxaUpER3BCWmoxMU1tazNRYm9QNDNj?=
 =?utf-8?B?bVJabkh0YTZuSjhzd3FjOVd1b2t0R1dqSEtaRTFCRjJzOCtneVJzWEJvQkhx?=
 =?utf-8?B?TGZUQ3JtWGIxdXpoT21Ta01wK2pBWjRkS3hTbEtZaVVUZVBLRnJOd3IzRi9a?=
 =?utf-8?B?SUdVQkFlSWN5R2tHclhFZVZzb21tMWJPQkxPemV3aGtrcGRGaG95TXgvMUxW?=
 =?utf-8?B?ckxCa0tJSXlQc1B4UlpiU0dkTmU5cllxbXBLdXlQMUJDODh3Z1F4TWt3Q2Z5?=
 =?utf-8?Q?eRBWApCFV/8=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(13003099007)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9045
X-CodeTwo-MessageID: 2cc06b48-d776-4e67-b431-c95af47cc381.20250822151700@westeu11-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b98754a4-eee6-4b87-2640-08dde18eef51
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|14060799003|35042699022|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWNyRnlWdkI1TDdSQXZlSXNwVHBOb2tUcHNxcTFuUGdJaVJoQnFJQ0ZreUxz?=
 =?utf-8?B?ZFNrRDFUeC90dVZYbnN4emtVOWN2YUQrNTBXUVlTVjdUdkkyaEFQcmhIYU5U?=
 =?utf-8?B?NnVMK0hDSXpObzdYNVNOUmtCUmR1TFRwS1llK0ZYYTVsQTgxYjRDbVJSdjZR?=
 =?utf-8?B?SnhlWkxXakduYVVVK2E0NmJOZU9ubmNkd1ZKeldEYWFhSm5mYUxTU1lydk03?=
 =?utf-8?B?RTZCV0dqeW1acGR4U1kwLzNZcVJCNG90RGg1SVlHY08wamZFY3ltdU01aEw5?=
 =?utf-8?B?MDhPejMrWkRJS2p3dVpTbWpuYnFsRGhaOEdLQzcvZTYxVzZTRWVaN1lSeUFV?=
 =?utf-8?B?Qmp2L21RaytHQXFNOW9uSWZySC95TFRpMHBydWE0MmZHOHJjWEF3bW0vTE1T?=
 =?utf-8?B?VnZ1c08xQTlzNkhHS2JQUVhqZENjREtBNGF4OXk3NVQzT2tQcjM5aS9helEx?=
 =?utf-8?B?dVErL1R6N01qV0NueUN0K0FJS2xzaHRRa3V4Mm04dmVzNFFyVTRlYU9SeWhl?=
 =?utf-8?B?NC9YaElPS2ZRN1UwUWZvMUVxSncydEozd3B0bEczWFFvc3ZiT05RcFhyT1dW?=
 =?utf-8?B?d01zZ2duRU81SVQ3OXBKUHpBMGdPcms0NHVIL21Gdk5pU3ZmWFM5YmRpOXBX?=
 =?utf-8?B?Y2JOSlhPYnZlem9aSmR2QjJ6QzhkY0p4WEYzM2JKOU4yV091Ynlka2FwQWg3?=
 =?utf-8?B?SXlFZFlnUjRvRnZsVWZpanNoc2N6akIxWVJmNVhKK05WYUJOQlpZdE5BYkE3?=
 =?utf-8?B?bmFZQXJYV0QwR1RGYWF6cTY5dkJvSTR3c1NXUUpqRlVhL2x6bDVYRUludlVs?=
 =?utf-8?B?VmMxeTRaWVAxWGJIYit6VWpoLzQ3NlJoamdwYkVpS1ZpMGtHcnBEZ09TOCtt?=
 =?utf-8?B?Mkd3VWEwL3d5ZGNXSHB1eWlYR1Exb1pxY2pmQlBUWkFmM1V3MEZNdk93ZDFi?=
 =?utf-8?B?enR5N3JIZDU3SUlMQTRHUEwrb3JaY2gzZFA3bGswN0MzMlZsZ1RPR2FiQVZN?=
 =?utf-8?B?RnVYY1I3c2pwNUVkNlhYcnIxZ0hqK3YvYjlrUzlrRXE4dmJYa1Z6VjJydjlq?=
 =?utf-8?B?UVY4dlptLzAvNXE0bStPTmhSZ2l0YktGMWpZTHlRYVpMa2lkamFScUsrTjkx?=
 =?utf-8?B?cUxmR2Ftei8wT0NnNEx6VkdCdmZxUHRIbm9kV2syaXd1OWQ4MGFxSXhsYlFU?=
 =?utf-8?B?NUxFZERURFEwU1BlNkdnQ3kvT2paSUM3a3h6TUZ4L0pCUi9HTmNlVHZhRVk3?=
 =?utf-8?B?bHV1TW1JeHU0aHRHYitLZk1mU3NISnQ0M3huWVN2Rk5mekZCYzJieUF1UjNR?=
 =?utf-8?B?S1NPUXJ0WFVkNWh4UDhHc0x5SVhnUTFQTjR5U010WTE5aHdOQ2lYZDVPTW1V?=
 =?utf-8?B?bVl4VjlodCtFVlpGVUQwS0c1YnRTdkppa1loZnBjK21jaFhmYTdGdlNsam9z?=
 =?utf-8?B?YVJ1THJaSmg3V1NaNTZZZnM5RWE1Sm1oaUY2aG1DLzRDWlE3dFpCb0FyYnZa?=
 =?utf-8?B?YmlwNEJrcFVWNnFJQ1VKRmZsQVN0eHBmdnk1ejZVMldYNTNIY3pwckZwa1dw?=
 =?utf-8?B?bm5jdGVyVnVKZEgvZlBrMFpUS24zZlkzTzhtNG1PZW9nVFVWeWF4cW5vdnN5?=
 =?utf-8?B?cUovYVlzRnZmeXcrbDBBYnpYOER0TkxmeUE2NitibjVMOHo0Z3JnWm1jdHNO?=
 =?utf-8?B?bGdpMlRuWkZRRTc4Q240R3I2R205V2JIemJsZ0ZOcXZTblFFa3FxT0MvY29v?=
 =?utf-8?B?VUtIZmtSdmFNZVk2STlYQ3BaSmlqbXpPQkdoQzREalk4ZThHVUFRV1Rha2J5?=
 =?utf-8?B?c3grcTVkODNsc05tMDNKcUtSMXJaQlpSdkk5MVI3QzF5T0h3aGpOZ0F6YThV?=
 =?utf-8?B?RG9taEZMNEhBUG5kdVpkQXV2RFplVmxyeHJvZlVnZklBejkrbmhkSTNKbzdJ?=
 =?utf-8?Q?dvezmTtPzyX1iPmo93mTc6uGShGXQpYH?=
X-Forefront-Antispam-Report: CIP:20.93.157.195; CTRY:NL; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:westeu11-emailsignatures-cloud.codetwo.com;
 PTR:westeu11-emailsignatures-cloud.codetwo.com; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(14060799003)(35042699022)(1800799024)(36860700013)(13003099007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 15:17:00.8475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0d53c5d-dc1e-4f67-6db8-08dde18ef172
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[20.93.157.195];
 Helo=[westeu11-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
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

On 21-08-2025 09:36, Krzysztof Kozlowski wrote:
> On Wed, Aug 20, 2025 at 04:40:35PM +0200, Mike Looijmans wrote:
>> The tmds181 and sn65dp159 are "retimers" and hence can be considered
>> HDMI-to-HDMI bridges. Typical usage is to convert the output of an
>> FPGA into a valid HDMI signal, and it will typically be inserted
>> between an encoder and hdmi-connector.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>>
>> Changes in v3:
>> Lower-case hex values and use defines for EYESCAN registers
>> Remove equalizer code (unlikely to be used)
>> Remove attributes (no longer useful, undocumented)
>> Fix build for 6.17 kernel
>> Use devm_drm_bridge_alloc
>> Sort includes and add linux/bitfield.h
>> Check chip type and complain on mismatch
>>
>> Changes in v2:
>> Use atomic_enable/disable
>> Use #defines for bit fields in registers
>> Allow HDMI 2 compliance
>> Filter modes on clock range
>> Use cross-over pixel frequency instead of manual overides
>> Devicetree bindings according to standards
>>
>>   drivers/gpu/drm/bridge/Kconfig      |  11 +
>>   drivers/gpu/drm/bridge/Makefile     |   1 +
>>   drivers/gpu/drm/bridge/ti-tmds181.c | 409 ++++++++++++++++++++++++++++
>>   3 files changed, 421 insertions(+)
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
>> index 000000000000..8ac3eb808d5b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/bridge/ti-tmds181.c
>> @@ -0,0 +1,409 @@
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
>> +#include <linux/bitfield.h>
>> +#include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/i2c.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/regmap.h>
>> +#include <linux/slab.h>
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
>> +#define TMDS181_REG_CTRLA	0xa
>> +#define TMDS181_REG_CTRLB	0xb
>> +#define TMDS181_REG_CTRLC	0xc
>> +#define TMDS181_REG_EQUALIZER	0xd
>> +/* EYESCAN registers don't appear to deserve separate names */
>> +#define TMDS181_REG_EYESCAN_E	0xe
>> +#define TMDS181_REG_EYESCAN_F	0xf
>> +#define TMDS181_REG_EYESCAN_15	0x15
>> +#define TMDS181_REG_EYESCAN_17	0x17
>> +#define TMDS181_REG_EYESCAN_1F	0x1f
>> +#define TMDS181_REG_AUX		0x20
>> +
>> +
>> +#define TMDS181_CTRL9_SIG_EN			BIT(4)
>> +#define TMDS181_CTRL9_PD_EN			BIT(3)
>> +#define TMDS181_CTRL9_HPD_AUTO_PWRDWN_DISABLE	BIT(2)
>> +#define TMDS181_CTRL9_I2C_DR_CTL		GENMASK(1, 0)
>> +
>> +#define TMDS181_CTRLA_MODE_SINK			BIT(7)
>> +#define TMDS181_CTRLA_HPDSNK_GATE_EN		BIT(6)
>> +#define TMDS181_CTRLA_EQ_ADA_EN			BIT(5)
>> +#define TMDS181_CTRLA_EQ_EN			BIT(4)
>> +#define TMDS181_CTRLA_AUX_BRG_EN		BIT(3)
>> +#define TMDS181_CTRLA_APPLY			BIT(2)
>> +#define TMDS181_CTRLA_DEV_FUNC_MODE		GENMASK(1, 0)
>> +
>> +#define TMDS181_CTRLB_SLEW_CTL			GENMASK(7, 6)
>> +#define TMDS181_CTRLB_HDMI_SEL_DVI		BIT(5)
>> +#define TMDS181_CTRLB_TX_TERM_CTL		GENMASK(4, 3)
>> +#define TMDS181_CTRLB_DDC_DR_SEL		BIT(2)
>> +#define TMDS181_CTRLB_TMDS_CLOCK_RATIO_STATUS	BIT(1)
>> +#define TMDS181_CTRLB_DDC_TRAIN_SET		BIT(0)
>> +
>> +#define TMDS181_CTRLB_TX_TERM_150_300_OHMS	1
>> +#define TMDS181_CTRLB_TX_TERM_75_150_OHMS	3
>> +
>> +#define TMDS181_CTRLC_VSWING_DATA		GENMASK(7, 5)
>> +#define TMDS181_CTRLC_VSWING_CLK		GENMASK(4, 2)
>> +#define TMDS181_CTRLC_HDMI_TWPST1		GENMASK(1, 0)
>> +
>> +#define TMDS181_EQ_DATA_LANE			GENMASK(5, 3)
>> +#define TMDS181_EQ_CLOCK_LANE			GENMASK(2, 1)
>> +#define TMDS181_EQ_DIS_HDMI2_SWG		BIT(0)
>> +
>> +/* Above this data rate HDMI2 standards apply (TX termination) */
>> +#define HDMI2_PIXEL_RATE_KHZ	340000
>> +
>> +enum tmds181_chip {
>> +	tmds181,
>> +	dp159,
>> +};
>> +
>> +struct tmds181_data {
>> +	struct i2c_client *client;
>> +	struct regmap *regmap;
>> +	struct drm_bridge *next_bridge;
>> +	struct drm_bridge bridge;
>> +	u32 retimer_threshold_khz;
>> +};
>> +
>> +static inline struct tmds181_data *
>> +drm_bridge_to_tmds181_data(struct drm_bridge *bridge)
>> +{
>> +	return container_of(bridge, struct tmds181_data, bridge);
>> +}
>> +
>> +static int tmds181_attach(struct drm_bridge *bridge, struct drm_encoder=
 *encoder,
>> +			  enum drm_bridge_attach_flags flags)
>> +{
>> +	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
>> +
>> +	return drm_bridge_attach(encoder, data->next_bridge, bridge, flags);
>> +}
>> +
>> +static enum drm_mode_status
>> +tmds181_mode_valid(struct drm_bridge *bridge, const struct drm_display_=
info *info,
>> +		   const struct drm_display_mode *mode)
>> +{
>> +	/* Clock limits: clk between 25 and 350 MHz, clk is 1/10 of bit clock =
*/
>> +	if (mode->clock < 25000)
>> +		return MODE_CLOCK_LOW;
>> +
>> +	/* The actual HDMI clock (if provided) cannot exceed 350MHz */
>> +	if (mode->crtc_clock > 350000)
>> +		return MODE_CLOCK_HIGH;
>> +
>> +	/*
>> +	 * When in HDMI 2 mode, the clock is 1/40th of the bitrate. The limit =
is
>> +	 * then the data rate of 6Gbps, which would use a 600MHz pixel clock.
>> +	 */
>> +	if (mode->clock > 600000)
>> +		return MODE_CLOCK_HIGH;
>> +
>> +	return MODE_OK;
>> +}
>> +
>> +static void tmds181_enable(struct drm_bridge *bridge, struct drm_atomic=
_state *state)
>> +{
>> +	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
>> +	const struct drm_crtc_state *crtc_state;
>> +	const struct drm_display_mode *mode;
>> +	struct drm_connector *connector;
>> +	struct drm_crtc *crtc;
>> +	unsigned int val;
>> +
>> +	/*
>> +	 * Retrieve the CRTC adjusted mode. This requires a little dance to go
>> +	 * from the bridge to the encoder, to the connector and to the CRTC.
>> +	 */
>> +	connector =3D drm_atomic_get_new_connector_for_encoder(state,
>> +							     bridge->encoder);
>> +	crtc =3D drm_atomic_get_new_connector_state(state, connector)->crtc;
>> +	crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
>> +	mode =3D &crtc_state->adjusted_mode;
>> +
>> +	/* Set retimer/redriver mode based on pixel clock */
>> +	val =3D mode->clock > data->retimer_threshold_khz ? TMDS181_CTRLA_DEV_=
FUNC_MODE : 0;
>> +	regmap_update_bits(data->regmap, TMDS181_REG_CTRLA,
>> +			   TMDS181_CTRLA_DEV_FUNC_MODE, val);
>> +
>> +	/* Configure TX termination based on pixel clock */
>> +	val =3D mode->clock > HDMI2_PIXEL_RATE_KHZ ?
>> +				TMDS181_CTRLB_TX_TERM_75_150_OHMS :
>> +				TMDS181_CTRLB_TX_TERM_150_300_OHMS;
>> +	regmap_update_bits(data->regmap, TMDS181_REG_CTRLB,
>> +			   TMDS181_CTRLB_TX_TERM_CTL,
>> +			   FIELD_PREP(TMDS181_CTRLB_TX_TERM_CTL, val));
>> +
>> +	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
>> +			   TMDS181_CTRL9_PD_EN, 0);
>> +}
>> +
>> +static void tmds181_disable(struct drm_bridge *bridge, struct drm_atomi=
c_state *state)
>> +{
>> +	struct tmds181_data *data =3D drm_bridge_to_tmds181_data(bridge);
>> +
>> +	/* Set the PD_EN bit */
>> +	regmap_update_bits(data->regmap, TMDS181_REG_CTRL9,
>> +			   TMDS181_CTRL9_PD_EN, TMDS181_CTRL9_PD_EN);
>> +}
>> +
>> +static const struct drm_bridge_funcs tmds181_bridge_funcs =3D {
>> +	.attach		=3D tmds181_attach,
>> +	.mode_valid	=3D tmds181_mode_valid,
>> +	.atomic_enable	=3D tmds181_enable,
>> +	.atomic_disable	=3D tmds181_disable,
>> +
>> +	.atomic_reset =3D drm_atomic_helper_bridge_reset,
>> +	.atomic_duplicate_state =3D drm_atomic_helper_bridge_duplicate_state,
>> +	.atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
>> +};
>> +
>> +static const u8 tmds181_id_tmds181[8] __nonstring =3D "TMDS181 ";
>> +static const u8 tmds181_id_dp159[8]   __nonstring =3D "DP159   ";
>> +
>> +static int tmds181_check_id(struct tmds181_data *data, enum tmds181_chi=
p *chip)
>> +{
>> +	int ret;
>> +	int retry;
>> +	u8 buffer[8];
>> +
>> +	for (retry =3D 0; retry < 20; ++retry) {
>> +		ret =3D regmap_bulk_read(data->regmap, TMDS181_REG_ID, buffer,
>> +				       sizeof(buffer));
>> +		if (!ret)
>> +			break;
>> +
>> +		/* Compensate for very long OE power-up delays due to the cap */
>> +		usleep_range(5000, 10000);
>> +	}
>> +
>> +	if (ret) {
>> +		dev_err(&data->client->dev, "I2C read ID failed\n");
>> +		return ret;
>> +	}
>> +
>> +	if (memcmp(buffer, tmds181_id_tmds181, sizeof(buffer)) =3D=3D 0) {
>> +		if (*chip !=3D tmds181) {
>> +			dev_warn(&data->client->dev, "Detected: TMDS181\n");
>> +			*chip =3D tmds181;
>> +		}
>> +		return 0;
>> +	}
>> +
>> +	if (memcmp(buffer, tmds181_id_dp159, sizeof(buffer)) =3D=3D 0) {
>> +		if (*chip !=3D dp159) {
>> +			dev_warn(&data->client->dev, "Detected: DP159\n");
>> +			*chip =3D dp159;
>> +		}
>> +		return 0;
>> +	}
>> +
>> +	dev_err(&data->client->dev, "Unknown ID: %*pE\n", (int)sizeof(buffer),=
 buffer);
>> +
>> +	return -ENODEV;
>> +}
>> +
>> +static bool tmds181_regmap_is_volatile(struct device *dev, unsigned int=
 reg)
>> +{
>> +	switch (reg) {
>> +	/* IBERT result and status registers, not used yet */
>> +	case TMDS181_REG_EYESCAN_15:
>> +	case TMDS181_REG_EYESCAN_17 ... TMDS181_REG_EYESCAN_1F:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +static const struct regmap_config tmds181_regmap_config =3D {
>> +	.reg_bits =3D 8,
>> +	.val_bits =3D 8,
>> +	.cache_type =3D REGCACHE_RBTREE,
>> +	.max_register =3D TMDS181_REG_AUX,
>> +	.volatile_reg =3D tmds181_regmap_is_volatile,
>> +};
>> +
>> +static int tmds181_probe(struct i2c_client *client)
>> +{
>> +	struct tmds181_data *data;
>> +	struct gpio_desc *oe_gpio;
>> +	enum tmds181_chip chip;
>> +	int ret;
>> +	u32 param;
>> +	u8 val;
>> +
>> +	/* Check if the adapter supports the needed features */
>> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA=
))
>> +		return -EIO;
>> +
>> +	data =3D devm_drm_bridge_alloc(&client->dev, struct tmds181_data, brid=
ge,
>> +				     &tmds181_bridge_funcs);
>> +	if (IS_ERR(data))
>> +		return PTR_ERR(data);
>> +
>> +	data->client =3D client;
>> +	i2c_set_clientdata(client, data);
>> +	data->regmap =3D devm_regmap_init_i2c(client, &tmds181_regmap_config);
>> +	if (IS_ERR(data->regmap))
>> +		return PTR_ERR(data->regmap);
>> +
>> +	/* The "OE" pin acts as a reset */
>> +	oe_gpio =3D devm_gpiod_get_optional(&client->dev, "oe", GPIOD_OUT_LOW)=
;
>> +	if (IS_ERR(oe_gpio)) {
>> +		ret =3D PTR_ERR(oe_gpio);
>> +		if (ret !=3D -EPROBE_DEFER)
>> +			dev_err(&client->dev, "failed to acquire 'oe' gpio\n");
> Heh, nice...

Glad to be of service, though it does make me feel old.


>
>> +		return ret;
>> +	}
> ...
>
>> +
>> +static const struct i2c_device_id tmds181_id[] =3D {
>> +	{ "tmds181", tmds181 },
>> +	{ "sn65dp159", dp159 },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, tmds181_id);
>> +
>> +#if IS_ENABLED(CONFIG_OF)
>> +static const struct of_device_id tmds181_of_match[] =3D {
>> +	{ .compatible =3D "ti,tmds181", .data =3D (void *)tmds181 },
>> +	{ .compatible =3D "ti,sn65dp159", .data =3D (void *)dp159 },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, tmds181_of_match);
>> +#endif
>> +
>> +static struct i2c_driver tmds181_driver =3D {
>> +	.driver =3D {
>> +		.owner =3D THIS_MODULE,
> Nice coincidence - this stars in one of my talks on OSSE
> (https://sched.co/25VoV) as my litmus test for crazy old, vendor code.
> Please come to the session if you are around or just check the slides
> afterwards.

Oh, Amsterdam this year. Hadn't spotted that in time, or I would have=20
been there!

I added coccinelle to my toolkit (would make a good addition to patman).=20
Indeed would have prevented the old-skool I2C stuff that I've been=20
lugging along in drivers for a decade...

I'll fix those in v4.

And yeah, the real issue is that I didn't submit this driver seven years=20
ago. In my defense, the other guys also didn't.

For your talk, maybe add a tip on how to avoid the verbose output.
make C=3D1 CHECK=3Dscripts/coccicheck drivers/gpu/drm/bridge/ti-tmds181.o
I get a gazillion lines of "/usr/bin/spatch -D report ..." and it's=20
difficult to spot the warnings. Tried adding "V=3D0" but that didn't make=20
a difference, piping through "grep :" helped a bundle.


> The open-coding dev_err_probe() is another great example.
>
> Best regards,
> Krzysztof
>

--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl




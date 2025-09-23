Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B955EB93EEB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 04:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD5E10E526;
	Tue, 23 Sep 2025 02:07:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YNdI3NTF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C278B10E524
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 02:07:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z7d/dANBbg3zNyieCfu7FyOd1c76k86iewT8PP9yilBR2FAwVmsGV8lfx8zuN66ORcYzqcUfG1oq1fJ+nxPepVe+rwXY8N7c9przCTCyW3aofEZ9SQGQpDBSzB5n4euMhBIBDrJhwxyzBRJXa+tRCW8/SNk97AvcQrSHhgmsR3+9MgMIxLR75eThnWnZy2DaH/fayz38zZ5HjSL9YI1ZQSGMxbUzdkcQl+8qHGn3n1+/vPnUcfxV23C/WeWNWYJtLy4HskZ9uoET4zNI+VV4fDdYqiBftztP5SwRbl1HF8LyNaLKJhaguIvf9wI0Gyy7DOMzPwOGZjtEw41ax1Zg8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YpyBcgT4tcXzbwtlQh0CkkgokUsPVk9FkmGCIgOanc=;
 b=vqSRRuN5QKePGWUrbDneWZxOHJGYthPbHgheuIFulVEL+A3rcBvE8TCDzWv/XPKIk92AjmF2atvNzNMWeSW9h8iWT4357d6e5Xsm+3kcwj1aQc5m13ufBfcV39KB/nBycGoZvZVlfc+xp57WaNhXIyvU7nHNN72lGlDDKm9f5vGfzxqaWkMx8NEO8Pme3b8jNUHoMlN+++b2ShlERi7hreDSwyQdzB58giTrpsysDzOc3dfd4z/1ynCO8HOpq9Cgb9Z3KLua5xadPUu2L+H8YNmB5H2+gG5/jFp7Ys87wrpGz3b6WH7eMkDUu++tkdUgHI4so9va032rg/PNf1t2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YpyBcgT4tcXzbwtlQh0CkkgokUsPVk9FkmGCIgOanc=;
 b=YNdI3NTFooTsSrK3gBFRliN/jaT7HlA2616spHnBfWIFLkMKpfCHWk4gJummcAf/gRMpK48O1/tTgLitO3fKtLcKizAk3JRGs/wDgB9HElQZW0inRqoJL8rIXTbILQqP+c3mRcr8eXRzhCPTcV8r7AL1FXa/GzqIJrEfZk5dXNjJoaGiE5A3ayxj6g8jgge0RIDnq6NalLlz2ZqxLXa4+DXArfCMa3wrlX6B4wfx8JGa/8+JHAzKar7J55To/nj/zwGwCogHKa8dEnW+jP5xyWpAVA172OIkHjq/0vkROCNcb7UquuEyae09uKRAt4Mvz3ULWherIHfDRgaUmKHzSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10854.eurprd04.prod.outlook.com (2603:10a6:800:25f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Tue, 23 Sep
 2025 02:07:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Tue, 23 Sep 2025
 02:07:09 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Tue, 23 Sep 2025 10:07:54 +0800
Subject: [PATCH v2 04/14] drm/imx: dc-fu: Fix dimensions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-imx8-dc-prefetch-v2-4-5d69dc9ac8b5@nxp.com>
References: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
In-Reply-To: <20250923-imx8-dc-prefetch-v2-0-5d69dc9ac8b5@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10854:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fecd928-c22d-4695-265c-08ddfa45e6ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|52116014|7416014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGxSMW9hbmpORTlFYm1OM3BNcjlOM2RYbTZTdDBUbmZ2cmx6cGYrMzF6elpY?=
 =?utf-8?B?ZmpFRE5kRk9uRXJUbDFiSEZjMnhyZzhLdDZ4N2loNHlqSE9TS2hHcGhOUlpo?=
 =?utf-8?B?L29kaGhFc2ZGL2pZTE15c09yOVFaQmpSVjNVQmpzUXJvR1lPK3NvaDMzZTg0?=
 =?utf-8?B?cWxsMFdpZzFXSEppc0RLNU9aZTNuTERtM0x4alY5cnZSM0YyQldSbXlndTk5?=
 =?utf-8?B?OHRJWGVJZjZuZWtPb0N6RTNoL0xWK1VPeFdZMHYycTVqVXY5QUVYNVV1SDRh?=
 =?utf-8?B?cDRzVFBpNUs4bWtIam9DdE95ZkJMbmlHMzJOUkNPR2VYWUhVQnpUL2RqZDlP?=
 =?utf-8?B?WkZRcHJ4UXFMK282c094TTFJZnRnd3dsS0lTalpQekRieEUrNmhpYlA0TE1B?=
 =?utf-8?B?MVlZNVNWbDNPN0pWRDhpbTlGNTVwKzJtemJlOGQxaXZrZG5XL1Z0a2UxbHF2?=
 =?utf-8?B?b0ZseXpRZHpRdjBpaE1lRWJub3crWEErbVh5bHNKUElKRE8wY0tnMDVpTmJp?=
 =?utf-8?B?VE90S1kwRkFIaXVMQWh6eWRNYWhsK3JmYU5sWGJqMDEwWExOa2JQSXJlcTR2?=
 =?utf-8?B?d09GOExZUlNiWHFnbWZFdUF2S1U1eTNkV2Z2UFBDa1NLS0lHVVJsSGwzTGl4?=
 =?utf-8?B?Qm5PYWFOcjczTW1IQndiMi90ZXI2SEkzOHFYbVlyTnhENkdMY3NlRVRVZEFK?=
 =?utf-8?B?eHFvSHlMRVhjRmNvaXBzK1dLZU81Y2hiYXQ1RStnMUZVcHVJQWZVTDVCQTR4?=
 =?utf-8?B?MWFLTUp4QzNFQnA1d0tjeEVjWEhjSVJ5Y2JmaW9KNTR5NDNCNkpCaEZlUjQy?=
 =?utf-8?B?MnRIbm9NblN1TmR5bS85QnVadWVlUXBlQnMzVnpsNFNPeDhwZmo3Nm9VQjRP?=
 =?utf-8?B?MTEvS0pxcmFaOGltV2tlRk1jWHBlaFVFMUN3SGJQKzJtTzVxSkpEQUE2MjJn?=
 =?utf-8?B?TzZ0ZnJPdlRvbUlIT09IQkxFdnBiWVhJMWNhWW93NTJnR1ozTGpSaDhCeGJw?=
 =?utf-8?B?QThPS1B0cWF2WWdBNkUwMHNwUEg0SndNSzB2dEg2MVdFNkVjR3g2bVpBOTRH?=
 =?utf-8?B?a0JZcCtoNTBVYjdXcnRjcThoZy9DdVo5bzFhK2V4WTJzMm1Ga0IxK1VBWEFo?=
 =?utf-8?B?cWZ3NitFRUk5SjFnanMvS3FFM1lFYzhHU2dZVlcyc2tqUFpkLzZrMHJhTXRO?=
 =?utf-8?B?M0toSlk3RFduT1htVUFiaUhwUHk5RjJZUjA0UkltUWxaUGgwWGFwblJpZEE4?=
 =?utf-8?B?ZnhZWVdaMmVsbk1md0I2aTgwcitsTzMzYnU5S0lVN2d1cy96WTBiV2M4NFUr?=
 =?utf-8?B?c1BadUxNMDhlRlNhSUx2b1N3eVBJRVYrMjBrTHhqYXc5bUJMYzBrVWUwaU1O?=
 =?utf-8?B?K2tBSzQzOXV6OGVTV3hTVCsxcFl2cVJ6WFNkWDFtK2dpMC9rb0l3bTNGUnR3?=
 =?utf-8?B?NzA4cGRKSzEzOGNOUDFmazlwSzlHWTJCQlpOaXJPTzVkOEdwOGg0cnh2NTZ6?=
 =?utf-8?B?cGVjV3NVOUswdWdONEthWWZlZENVbzhJTHJtQlBkYmkvSVhGMG5BTVZpODQw?=
 =?utf-8?B?ZWx6Wk1WUzczdVZJekdUZ2JGWjNYNjIwNmVPcXJUckxEODlLSW1UWUJhTEcr?=
 =?utf-8?B?cEluVG5LYXE3ZGJ6OW1GdTM5NGgvd3F6aDZzc01scG9UM0d4TGVKTVdKb3Rm?=
 =?utf-8?B?UUQ0Vms3NHEwOHZuVDd6V3QzaGRoZ3VVaFB4NStjNEovWUU5a1F1YndIU1Fy?=
 =?utf-8?B?WEM1T2NtYXFwR0N3V0ZnTDgvLzZpSE1JdkgycFFBSDRFR1lxa2FVakozNXZG?=
 =?utf-8?B?T3B4L2lzZDFhY2E4NjZ2bXZyVGVyY3psOStQL2Z6cFRRV1BkcTY1WHpqMmll?=
 =?utf-8?B?K0I0WlIvb3FhaXRuVGNBS2oyUlBKM244VStQaDJmZVg3eEV3cm9Na0J2bHBQ?=
 =?utf-8?B?eU9WNUJkd1lwRG1tWXZwbjA4Vks5eXFaWkVKTHM5cG1STjFkSGs3cWNsdDRw?=
 =?utf-8?Q?PNE/A0/tLP1qffBIqXVEHwUkrK8sfA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG9sK3pxKzRXc1YxWTV1TVVnaUhPVFJNSmJZcU82UkQrYkF0cGFFb2JyamVO?=
 =?utf-8?B?NC9Hd0JUZU9WM0ZhU0lXbFlRMVVHOXI3MjdRY3JqKy9VR1JHL0tmNDJETzFG?=
 =?utf-8?B?cExrSXB6Y0EvMTZmSGd4SDBNWmFaQXF5U1dsMGRvSHdhMjR3cDF5TzA1b2Z0?=
 =?utf-8?B?Wk13a283S0JqL3loNnJpMmk0WjFGZkhEMGpXZm9WbVh5YjZDWnVFL0RTVm10?=
 =?utf-8?B?RWhoZWJqREJOVWhQNENOaGxtT2cxZnVYTFltUVRueGNzaVlDbkpmYUdkeVpu?=
 =?utf-8?B?UGx3N1BINTlHQXhSS093d1lkWXhFOVI4Z1loMDRBVGpyd1JsVHVXQU9wMm5x?=
 =?utf-8?B?amtRcVFFOVZBSzJuYksrdGZjM1NhUXJnTG4wd05HZU91b25yNTAwVEpRMFhF?=
 =?utf-8?B?dGd1SlNTTkQwOWs1VG1QS0JIejdrQUd4aW03T2tqRTZScWI5NVJWdExlQXB5?=
 =?utf-8?B?Ry9WV1NXYmdlQ0RuNW4wRFVJbnp6UldLWVk5UWNjZVNnaUxyWWQwOFd0RCto?=
 =?utf-8?B?RlpqYzRsWkRNa1M4SUNvd21RWW9sK1k4dXlCZmRRVHA3NWJQSnNRZHFXNFUv?=
 =?utf-8?B?YklRSWxpditmelpwSnh6YXF0VE1qS3lmNUJZUXNwK3o3T1lPQWJrS00zUjBH?=
 =?utf-8?B?akpKQUFuM3JRb2VrZEpLUllROUQ5cE5LTmR1TkFOVW13Q0YzT3kvSzFBdEZE?=
 =?utf-8?B?SmZFdDFjcmNKU0N2ZGdTL3h0MmgzMDBMWlZSRjM2ayt0L3JpQmtpZ0dhVG1k?=
 =?utf-8?B?ZHpUSjhuMzY3cU5oeWRTeEZHSThZK0RmOXlOOXBlbjRPcERsTDdMR2FXcGtY?=
 =?utf-8?B?clF5MklCYjViN2pNRGJ3OE9tc2J5b283bU53MGhCMkVEMzdaWG5kQ2R5amFG?=
 =?utf-8?B?YlFzcktFSzlrRVB2RnUrL2w1WG4xYk9FeVJzVjU5WVdUUThEbE9qdk9rY2F0?=
 =?utf-8?B?bHVQTG9WZHNIeDc4ajEwRmo4Q0RLcGhLd0R0Ulc3YmtWeGZzYmxzNkQvT3B4?=
 =?utf-8?B?Z1B5Tm5HUC8waEhzQ1F1YU15Y295SE8rTkdxOGVKSzZYN1NKYVlNNDR1VTBW?=
 =?utf-8?B?WEFYeFl1aVNWS0dxNDdMNEt2ZkZvSnRTRGRBR1hlR1Q2RUdHbnloQXA1VVFk?=
 =?utf-8?B?YytrTzNCejVoMytGa2VqZ0VtNTkzNHN0c0VEY21PdkcvVXpHM3FMWG5kL2ZQ?=
 =?utf-8?B?T0pzVFJlY0Jsdno5ZnprNTJPaHY5Sno1RmVPeTNCVnE2cXNZS1UzbFQ1RDI1?=
 =?utf-8?B?QjZTRi83aTZTaG80Tm5Kc0FSMUxVNS9NZnArdm95TDFxb1RwZUdsZWxUOTlk?=
 =?utf-8?B?ZVk1aXJZemtIbTJpOG9PNzdzYzk4N1hxOVg5YW9URDV0VzFScWFWTjJ1TWlo?=
 =?utf-8?B?VmhYMVpvRjRPZWVGaE5zMlBvdzJqcm44MURQS1o1cWJrK2ZSNEc1eVZrYWNG?=
 =?utf-8?B?ZG93cGExWWovd3hYMHZJc21uZytwT0Uya0d6V1dGWThaeTZPL0NpcDhuMmpP?=
 =?utf-8?B?VTRvNmF0TnltcGVHR0ZBZTRjWFRQL1I0cmtXUWgrQ0ZxeU1DaEtvTkVsak5V?=
 =?utf-8?B?V2FmdGsrcWJGdGIrazBDWmdUWTFrdzdaRmNxTXFVRjc4TWw2blNtTUJ1cysz?=
 =?utf-8?B?aTd5bk03eGUySXNmdW11cktwUEZpWWhVUjVSSHBxeWNJdVQ3MnZ2YlBCbldE?=
 =?utf-8?B?Q3VzN091OE85bjZxSkg3bk91OW8xeE1iRjRNRHNVcEx5UEhRaXBET0pJWHA4?=
 =?utf-8?B?akZGZitvZlhzV3V1RFZnZ1dvZURZeS9HaVJUWHl0UEpKczRZZGZOYS9TZkVl?=
 =?utf-8?B?dGxIU2lLMGQvTzFJVnRDb3F1eXJsY1NndjdJaFhycTJqVTFVRW1TNms4azBH?=
 =?utf-8?B?TWozVmt5QmpHdUlWeWxsQnhaUkgvK2h5aXdvK2laUGxGWGsyTEdVbzVvbVpM?=
 =?utf-8?B?aUVPK2xEZE1xYURlVlNwdHB2ZmdOUHdBeEtCWmJBWnlSZDZMVDBZUklIclZW?=
 =?utf-8?B?b2V2Y1lVMkZSVGhCekQ5VzZ6Z2Rqa2hRWFVUU2NpSGh3Ni9TS055K2lGQ3Bw?=
 =?utf-8?B?SDhGdlFqMFd6MDRHV3RKWnZqcEJNM3dMcU55VU5taWFtQnE0WDFLejN6SWkx?=
 =?utf-8?Q?9tROyX3pmIWVHKo2mNkJbOKCe?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fecd928-c22d-4695-265c-08ddfa45e6ae
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 02:07:09.0609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Igcw3GDtc7ieh6wQZHzICc3K7q5Spq/wGvF6ExBOjGVRWq2T2JTdrKE0/gp4J+PE4zjFj82EUcqnwlhttIvaXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10854
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

Fix off-by-one issue in LINEWIDTH, LINECOUNT, FRAMEWIDTH and FRAMEHEIGHT
macro definitions.  The first two macros are used to set a fetchunit's
source buffer dimension and the other two are used to set a fetchunit's
frame dimension.  It appears that display controller itself works ok
without this fix, however, it enters panic mode when prefetch engine(DPRC
and PRGs) attaches to it without this fix.

Fixes: 0e177d5ce01c ("drm/imx: Add i.MX8qxp Display Controller pixel engine")
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Collect Alexander's and Frank's R-b tags.
---
 drivers/gpu/drm/imx/dc/dc-fu.c | 4 ++--
 drivers/gpu/drm/imx/dc/dc-fu.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index f94c591c815891468a5c2a940076963eeaa4d51c..b36d3034b8d5962eaab212b6b65ebbb5c29f978c 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -31,8 +31,8 @@
 #define STRIDE(x)			FIELD_PREP(STRIDE_MASK, (x) - 1)
 
 /* SOURCEBUFFERDIMENSION */
-#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
-#define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x))
+#define LINEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x) - 1)
+#define LINECOUNT(x)			FIELD_PREP(GENMASK(29, 16), (x) - 1)
 
 /* LAYEROFFSET */
 #define LAYERXOFFSET(x)			FIELD_PREP(GENMASK(14, 0), (x))
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
index e016e1ea5b4e0471cf6627782603e72d0475c4e8..518d1af49f5ae9d4f67da5e6c2e80abd7e962120 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.h
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -38,8 +38,8 @@
 #define SOURCEBUFFERENABLE		BIT(31)
 
 /* FRAMEDIMENSIONS */
-#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x))
-#define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x))
+#define FRAMEWIDTH(x)			FIELD_PREP(GENMASK(13, 0), (x) - 1)
+#define FRAMEHEIGHT(x)			FIELD_PREP(GENMASK(29, 16), (x) - 1)
 
 /* CONTROL */
 #define INPUTSELECT_MASK		GENMASK(4, 3)

-- 
2.34.1


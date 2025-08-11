Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72728B1FD9E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 04:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F68510E102;
	Mon, 11 Aug 2025 02:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="PD3i07AQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011022.outbound.protection.outlook.com [52.101.65.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2B710E102
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 02:14:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8ei4I0pxf6cO7R6GI6VmgLdRvQgeeSGy+3+Owj6XAOUDJ2NRv1iq7z3zVM2bypz1Dv2OMX3AYmnE0rSP8mINDe5tQEtktnDkGQ8fvRmxXcSrP5d3Wrh6IJVjNSyUuiaQVDnvws1fjbOM22/AdFjtbzbmJ0Z4oPW0lsOvaMDRGxIaVABJZSk+MfJqh2OP8Dhl7BLMkKVM8hyz9ZGw6g6k11pWhuhaE6PdPAALvDKC4OaCVW0gapRWclvXQm3zdM7vRGRqMvMLPwnuVq9EVkATXhcvycP9WDwRXyn5ulyT2xx0fbYpG53lsO9iP0f+lj921+4AAPhWtvkd4Wy5kS0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7c3/vKR98jKfYXsMfmrZewWyt7HAokGmujk3ZrUooo=;
 b=xBBEehU+SznjxjaepSGwquncm+GqR/E97X5p2EQ3oQSDQd/yPNM3u7o6ZvujPjB1xptutIXd010CfHVqdWT4GU1MidNnDz6uMo3ubCva3EkM9rApuoSiC45WuGsCiUmoOswHPTybdWNLMTaG+sHU+dUIHSeA40iL5h2r3bAfsriH6wpcGzUWTy58xI6tLjc7ngeuuDXiXkNycquaba/THW+gqwfD634tbbkKnULvWaauVx+hPowWIP/XqVNoqrmvokFXIFU5GfZtqfDPuP4ARuCwmqLQfFKlVyVHYiLboAlnbof93559d+1ZmxfVKHK6pHiT+pdhbvAmjTMbw9xsIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7c3/vKR98jKfYXsMfmrZewWyt7HAokGmujk3ZrUooo=;
 b=PD3i07AQutml5GFfSOBfqfczq1L1TF491PG80XWUQbsYzosfWNbB9BTHLjSuXb9VgBMg+r7ZHE8L5c2MI+c10zkt1s9+OW6IzW14P14PeVZWWfmaBCXQM9oHodJnIXq61M9vjMj5M/l49ikCLi99HXb80IWpSm184jyz6dYJuK9u5Sg98CcDE9BUtqLOsu7rwNTTb+7ZqcoNNKkiQ0ZsXNSv5626qFf4RQqXU4RgWH8K6YSLxpE6gZJIhJJuqn5Ew5AnkMctIIaxluTOREtG9i+u4hUSRbox4jpvquCF2OZM8Ym27pwOxkNzGM9Uc8YUjgSsGWpeSOx2JngvkmICVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS4PR04MB9484.eurprd04.prod.outlook.com (2603:10a6:20b:4ed::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.12; Mon, 11 Aug
 2025 02:14:20 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9031.011; Mon, 11 Aug 2025
 02:14:19 +0000
Message-ID: <3f780b9c-d670-4b67-94f9-e5b59bcee7da@nxp.com>
Date: Mon, 11 Aug 2025 10:15:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Frank Li <Frank.li@nxp.com>, Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org, cristian.ciocaltea@collabora.com,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, shengjiu.wang@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org
References: <20250808080617.2924184-1-shengjiu.wang@nxp.com>
 <20250808080617.2924184-6-shengjiu.wang@nxp.com>
 <aJZi5sLrcinh3FXX@lizhi-Precision-Tower-5810>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <aJZi5sLrcinh3FXX@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS4PR04MB9484:EE_
X-MS-Office365-Filtering-Correlation-Id: 916848c9-b1d5-46a4-e778-08ddd87cc7bf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|19092799006|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vk85eUVQUXdnRGd0TEZKcUF6YXd0RmpOWmJ3dFd2ZXNvaHdaUCthYmVNd3o5?=
 =?utf-8?B?NFdFanVyTWlndTRxWFM0ZmtEODJuZG9yc3ZGOTNlN1RVZTMvTXhZYWdBeHF2?=
 =?utf-8?B?UStjU1ptallxRTVBc0hxVjVTRTZZVGtSdVVDYVFPRlhFUlRoTFpiL1RJaHY1?=
 =?utf-8?B?UVRiQWdiUlk0bmgvNHU2V1paLzdJSDhrQUJUd3ZwZlg2UUF1TUovYXhvVk1n?=
 =?utf-8?B?NzV3b3lSekd5YUZWamMzbTBWbGNQZUl5TS9GTUQ3NlYyQlRBamFXcHpEbkJx?=
 =?utf-8?B?L3psVXNzQ2ZHUjUzdWwrZDhwQWdXSlJ6QWRBamV1Z2ExZHQ5STB1bUtBZm92?=
 =?utf-8?B?S1hIL2RMeEhjMjcxZmFQa3ZSSEZFRGw0RVNjYTJoNGYvMzRUcEZZSzhCOXk1?=
 =?utf-8?B?VGZXRlZkSmlhMUwrMi9CbWpvWmhlazVDeGlxR3cwRHhwRXJQVWNQUTgxUzNn?=
 =?utf-8?B?OHBCZm9RRlppdXFBWGd0eFgvbGVOTGpYcHlmTTYrbXNRa0FyczQzWllJM0x3?=
 =?utf-8?B?UFJOb2FmbDhTYk5VZUo1Z1BYblM2UGJIdGQ3QlVrTUxyZkw5dG1tZUZYbklv?=
 =?utf-8?B?MVhkMGxvUENZNlBhN05TTDM5YWoza29MUGZZbmhMU1FLa2lYbk9xRmJjWjAy?=
 =?utf-8?B?ZDBsSHIveDhnRWh2UC9wUWhOU3I1MnBCMlZ3ajhQdHNPazFaWDgvcC84TUVs?=
 =?utf-8?B?dGtmUmtjVVhic3VORWtzNGExUzNoRklhakhUQkdGUkZJK2I0SkZFNFFGdDlY?=
 =?utf-8?B?em4zczJFdE5xTWM4cmVoeUlOVHVhd0RETXVWUG1oaUdWRnZjYW5iUEpDcVpE?=
 =?utf-8?B?NUlGMXU4V0piYWZNOVhOTWcvMUpxYld5dE5vVitmanBjcVMyTWpqTFgwTnZD?=
 =?utf-8?B?TjJPaUNjWGJpUG1tME9DWXRuaktSdWp4TktNVXhwTlR0elQzMXE2cFZRMjNu?=
 =?utf-8?B?YW0yTWp6UjhWNjNKQythNFd4M0VIZVNtWlZyZzAvUVBOMUNLRWxlYnEzcEUr?=
 =?utf-8?B?MG5Vakp3b2dSMFYvSFFCbDBXdlQ0YlBaVGJQNHZQTUFxUDBHR0MzOHdyZ3Vh?=
 =?utf-8?B?TDRhcWVLQll4TnF1YzZqZDI3VUxxdkl3aTh1T0FBS0FXRERueTVGcEJvWXFD?=
 =?utf-8?B?NGpsVTdxOE9DaWhRZjIxdjF0QVRxTjh3UXhwMVBaeGNmV1NaN2NjcTJJYlZW?=
 =?utf-8?B?d3l2Q2dXTVQ3ODBOT0RIdGtkNStZdkNNWEVkU3hTdHM0c1JkOFU3eUQ4Rk5B?=
 =?utf-8?B?NEFDYjJUUytYT2RPN3VBSG9EOUFYRy9UbVpNdFdzQXpvbmdwczlrTmpvOE9y?=
 =?utf-8?B?aHE1ZmhENEhTL2Mzak5pazd6ZUhhd0pHYklaV0ZFL0x2K040aWJZekdiZ1FL?=
 =?utf-8?B?UE5adVpmbXRpeWY1OHZWbDgzS1JVWExVVy9BL1dJYjdMUzdtNGprNyt2TzBj?=
 =?utf-8?B?cyttZ1draHp6TXlwLy9YRTNlcmx4c3B5OVA0a2s5UmN1MkRNUUEvOXltZkhl?=
 =?utf-8?B?TzhsY1I1RXJlQnpoaXNzcUFoMlZUWDBsMGtrZ3lVUnpTTnJJd3RHZWRNNHdY?=
 =?utf-8?B?aXpVbjQ3SFVmamd3M3lYTGNnTVVjT0hWSGxuZzlXenNjYlJsRzhlcmwrQ1V5?=
 =?utf-8?B?amFCSUVvd1NKOHc5VlBtNTg2V29qWk1CRWUvOWRyTzE3cU16Y1dDTjJNajE3?=
 =?utf-8?B?OU4rNFRYSnBMYkhsKzN1djc4dVg2UmVVTlNuWkVOZDBkZ2xEMFZ2bW5VTmdi?=
 =?utf-8?B?b0JMeG1RMlh3WFZtbVowSHh1TDJCc3AxVzBYSmMxcUdQQko5Q0lRNGh2U0ta?=
 =?utf-8?B?MXU3TUVRQmRiTmpDTElRVzhCYThPZlIyM0dVUStNKzNqOHFnU3lyUDdJYVZu?=
 =?utf-8?B?aW12ZTJKdk1SYks0MzFFU3ZTQUJhcS95UDQxTVhzeXUyS29xcVVlN0w4MUNB?=
 =?utf-8?Q?QbNshCtgSiI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTdmWHFhRUZOZmlybG1HQzNtZU9Qd0M2d3lSWEVsc2FZMFY4MisxNmh6YzBQ?=
 =?utf-8?B?N2N5T3RoN0ZhOCtwdUs2a0Yxck5IcnowT2ZXUS8rd2lZMXVJRmNsd3JZOHIw?=
 =?utf-8?B?bTdKUFkxWFlRcmpLdFhTOGQrVjdodDFWV1J4Y0lwRDV2ZXdRWU1pN3dEeHlR?=
 =?utf-8?B?Y1d6SnhnUythb0s5Rzd3ZXdrMW5SV1JuWDB4clhpRElvWTRNYUR3VEJ6c21M?=
 =?utf-8?B?eHFOUGpYSTloTFlTWkFiNzF2Ukducjl2YTJQRDdVK0d5TUcxWFcwaERHc3l2?=
 =?utf-8?B?WjFtc2xtVm9YeXNQRkhuODdnNHVaa3Z0SUovYmZPU3NIRy9RUHhCU0RJdDAv?=
 =?utf-8?B?MTcrNnFiZUlGcUREZzg1MlBLNk5sY0dIYmhkVGZ2R01zanNpcFhNcVE4cUlE?=
 =?utf-8?B?di9mdkdoSUdMOXplbGJyWWN3bGFJTnVOUnpoTHFIazkxVzI3WXo0Y0dHQjdI?=
 =?utf-8?B?OTArYVFHNlZ4TkYxR0xXMS8ycGFad3dCRGxDWGlOMmdscEhyQWV2TnJjdjJo?=
 =?utf-8?B?L0RPSXJSZ3BPQ2p3b2xkSFd0WS9hQWdTTHI4SkY2L29MR2hPQ3h1bVBtNXls?=
 =?utf-8?B?UjVPUGNueTRjTkFSb3ZkV0xTY0dJcGxMdmNFWjJWT3BUSGkzN3pkd3FWeG9h?=
 =?utf-8?B?elV0cUFkOXJJS1RwR0FaQ0UwdkNmdEFob3VFRWpicDRmRWRxalBaMkI1OTVx?=
 =?utf-8?B?RUpwMjBiMGZRa2dqSWRPSlBTWUhYZWlDTm1iUlp3dU1TRGlqQnk4c1JRYVlX?=
 =?utf-8?B?ZFRBUzNQTkExYWdqQkxKbmlWeGl5ZzYrWHFweCsrUTVrenpodCs3bWRzck5U?=
 =?utf-8?B?NzhjLzdrL0dybmhjTXM5YlI4ZWZDOFdBQWV2bmRrUEhvbGdxZDlkYm9qTUNH?=
 =?utf-8?B?aWN2cU40Y0xnMEpHR3gzeTdrWmJVWkNuK3JwUGw0US9WQmxHNzNzcklGQ1VZ?=
 =?utf-8?B?MzNOOGtlT0lkbkNjWHkxZExjNTE4WU5rUGllUUI4UWtqblBmOHF2bWxtRHJw?=
 =?utf-8?B?M2UzWkhpQ0d4SnJTOXBSY2RqeFdLSFhiMnJjbnptWkdkRkZ0Lyttdnhxck5Q?=
 =?utf-8?B?c3hkMk4zc3pocEZrR0Jxa1lJaTRDSElLTHY2ZVlCYzRwL2VCdU1vSnk5aEht?=
 =?utf-8?B?cUFSVU0rOHZYNGlEcnBwckZlQjBIaFlvWmYvY09zMmJHNUJzU3I4OTJLQzBG?=
 =?utf-8?B?S2VEazNBcDZRWmc0bVQ3Mm81TUdEQUZ1MXBNR2QrMVBmQU1VRVduNk5Ueldl?=
 =?utf-8?B?Qk9uaEZZZlQ0MldIa2g1TTU1aHZJQm55ZTd2RWVRVGNKaFRjbFRlbjNUcFdo?=
 =?utf-8?B?MG9zUjVja1JBTEorNngzaDM5eGc2eVpCWFQ2RUZacFI2MmR3OEs2Z1lGdDlu?=
 =?utf-8?B?RkhXZkl5aDBxTk5PTFRQMXNaRjFFUno2OE5GMlJLTlNBT3l6U0VFSThVVmNv?=
 =?utf-8?B?UmhZNFdncllPM1lrdlVpd1BuMVVqUXhMRmFSK2R4dnF4NXlPSFVIaE1Vd293?=
 =?utf-8?B?TTRqZGZIWHJNNVRHcjd4bVM2Kzd5STZTVG9LY0JCUjFBbEZDdisvQkUydGsv?=
 =?utf-8?B?WTdkd3UrclhNWC9GaUszMDZiRkhJMnptMUdOS1pGeE1VT0tUL054dkpBUWI3?=
 =?utf-8?B?SkkrS3o3RWhDTVlaSXFYKzFXTXFqMXdoeDJway9yYVlnY3lxaVRVU0tmdE83?=
 =?utf-8?B?OWpnQWhQakM0SUdFakw3dkpGVUVGWU9DM21SazBidGI4T2lHdE11Y3ZQL2dv?=
 =?utf-8?B?dW5YbVV5dmJsSWVOYldjaGllSXIzbmd1RXBqN0tXdmRyVVA2Ym1rUWVQUnVU?=
 =?utf-8?B?VEsyTWluZDZoUWtublBscXFWNHJDTTI1NFFHbjN1eUUzWDc2VzdvVkZoQ0Vx?=
 =?utf-8?B?RlEzb1ZUejNkUWhMWVYwSC85d2NRVjVDcEd0ekVFc0Zabm9XZ1VQWitFVVJh?=
 =?utf-8?B?SStNWkJtMER0MmhGc2t3STk5TzRGcWdYd1VTQXhleGN5K3YyVDNnZ3ZtY2Vx?=
 =?utf-8?B?M2VMc3hZZitwWGR5YnJ5VWtKQm91RloyeWVHN0x1Q0lLTHRwV3d4NFhxS0h2?=
 =?utf-8?B?UjBrUFh2YURjY1RoSFZsVWRwakhlTEFOZXI3bTJvOFRwTW1ZYk5HbngyQXV5?=
 =?utf-8?Q?EOArflxmx/P4JNnbl9xNeMtGj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 916848c9-b1d5-46a4-e778-08ddd87cc7bf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 02:14:19.7969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jvvb0fpEUDmWSN7oyD34KRvzgelD/Wtwake3WrcbXFLljBI6T972sAjMAeyfJs7FISVj+NaaNYXzvL3EUHjvcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9484
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

On 08/08/2025, Frank Li wrote:
> On Fri, Aug 08, 2025 at 04:06:15PM +0800, Shengjiu Wang wrote:
>> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
>> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
>> This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
>>
>> Data received from the audio subsystem can have an arbitrary component
>> ordering. The HTX_PAI block has integrated muxing options to select which
>> sections of the 32-bit input data word will be mapped to each IEC60958
>> field. The HTX_PAI_FIELD_CTRL register contains mux selects to
>> individually select P,C,U,V,Data, and Preamble.
>>
>> Use component helper so that imx8mp-hdmi-tx will be aggregate driver,
>> imx8mp-hdmi-pai will be component driver, then imx8mp-hdmi-pai can use
>> bind() ops to get the plat_data from imx8mp-hdmi-tx device.
>>
>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>> ---
>>  drivers/gpu/drm/bridge/imx/Kconfig           |  11 ++
>>  drivers/gpu/drm/bridge/imx/Makefile          |   1 +
>>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c | 158 +++++++++++++++++++
>>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c  |  63 +++++++-
>>  include/drm/bridge/dw_hdmi.h                 |   6 +
>>  5 files changed, 234 insertions(+), 5 deletions(-)
>>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
>>
>> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
>> index 9a480c6abb85..b9028a5e5a06 100644
>> --- a/drivers/gpu/drm/bridge/imx/Kconfig
>> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
>> @@ -18,12 +18,23 @@ config DRM_IMX8MP_DW_HDMI_BRIDGE
>>  	depends on OF
>>  	depends on COMMON_CLK
>>  	select DRM_DW_HDMI
>> +	imply DRM_IMX8MP_HDMI_PAI
>>  	imply DRM_IMX8MP_HDMI_PVI
>>  	imply PHY_FSL_SAMSUNG_HDMI_PHY
>>  	help
>>  	  Choose this to enable support for the internal HDMI encoder found
>>  	  on the i.MX8MP SoC.
>>
>> +config DRM_IMX8MP_HDMI_PAI
>> +	tristate "Freescale i.MX8MP HDMI PAI bridge support"
>> +	depends on OF
>> +	select DRM_DW_HDMI
>> +	select REGMAP
>> +	select REGMAP_MMIO
>> +	help
>> +	  Choose this to enable support for the internal HDMI TX Parallel
>> +	  Audio Interface found on the Freescale i.MX8MP SoC.
>> +
>>  config DRM_IMX8MP_HDMI_PVI
>>  	tristate "Freescale i.MX8MP HDMI PVI bridge support"
>>  	depends on OF
>> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
>> index dd5d48584806..8d01fda25451 100644
>> --- a/drivers/gpu/drm/bridge/imx/Makefile
>> +++ b/drivers/gpu/drm/bridge/imx/Makefile
>> @@ -1,6 +1,7 @@
>>  obj-$(CONFIG_DRM_IMX_LDB_HELPER) += imx-ldb-helper.o
>>  obj-$(CONFIG_DRM_IMX_LEGACY_BRIDGE) += imx-legacy-bridge.o
>>  obj-$(CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE) += imx8mp-hdmi-tx.o
>> +obj-$(CONFIG_DRM_IMX8MP_HDMI_PAI) += imx8mp-hdmi-pai.o
>>  obj-$(CONFIG_DRM_IMX8MP_HDMI_PVI) += imx8mp-hdmi-pvi.o
>>  obj-$(CONFIG_DRM_IMX8QM_LDB) += imx8qm-ldb.o
>>  obj-$(CONFIG_DRM_IMX8QXP_LDB) += imx8qxp-ldb.o
>> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
>> new file mode 100644
>> index 000000000000..8d13a35b206a
>> --- /dev/null
>> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
>> @@ -0,0 +1,158 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2025 NXP
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/component.h>
>> +#include <linux/module.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <drm/bridge/dw_hdmi.h>
>> +#include <sound/asoundef.h>
>> +
>> +#define HTX_PAI_CTRL			0x00
>> +#define   ENABLE			BIT(0)
>> +
>> +#define HTX_PAI_CTRL_EXT		0x04
>> +#define   WTMK_HIGH_MASK		GENMASK(31, 24)
>> +#define   WTMK_LOW_MASK			GENMASK(23, 16)
>> +#define   NUM_CH_MASK			GENMASK(10, 8)
>> +#define   WTMK_HIGH(n)			FIELD_PREP(WTMK_HIGH_MASK, (n))
>> +#define   WTMK_LOW(n)			FIELD_PREP(WTMK_LOW_MASK, (n))
>> +#define   NUM_CH(n)			FIELD_PREP(NUM_CH_MASK, (n) - 1)
>> +
>> +#define HTX_PAI_FIELD_CTRL		0x08
>> +#define   PRE_SEL			GENMASK(28, 24)
>> +#define   D_SEL				GENMASK(23, 20)
>> +#define   V_SEL				GENMASK(19, 15)
>> +#define   U_SEL				GENMASK(14, 10)
>> +#define   C_SEL				GENMASK(9, 5)
>> +#define   P_SEL				GENMASK(4, 0)
>> +
>> +struct imx8mp_hdmi_pai {
>> +	struct regmap	*regmap;
>> +};
>> +
>> +static void imx8mp_hdmi_pai_enable(struct dw_hdmi *dw_hdmi, int channel,
>> +				   int width, int rate, int non_pcm,
>> +				   int iec958)
>> +{
>> +	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
>> +	struct imx8mp_hdmi_pai *hdmi_pai = pdata->priv_audio;
>> +	int val;
>> +
>> +	/* PAI set control extended */
>> +	val =  WTMK_HIGH(3) | WTMK_LOW(3);
>> +	val |= NUM_CH(channel);
>> +	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL_EXT, val);
>> +
>> +	/* IEC60958 format */
>> +	if (iec958) {
>> +		val = FIELD_PREP_CONST(P_SEL,
>> +				       __bf_shf(IEC958_SUBFRAME_PARITY));
>> +		val |= FIELD_PREP_CONST(C_SEL,
>> +					__bf_shf(IEC958_SUBFRAME_CHANNEL_STATUS));
>> +		val |= FIELD_PREP_CONST(U_SEL,
>> +					__bf_shf(IEC958_SUBFRAME_USER_DATA));
>> +		val |= FIELD_PREP_CONST(V_SEL,
>> +					__bf_shf(IEC958_SUBFRAME_VALIDITY));
>> +		val |= FIELD_PREP_CONST(D_SEL,
>> +					__bf_shf(IEC958_SUBFRAME_SAMPLE_24_MASK));
>> +		val |= FIELD_PREP_CONST(PRE_SEL,
>> +					__bf_shf(IEC958_SUBFRAME_PREAMBLE_MASK));
>> +	} else {
>> +		/*
>> +		 * The allowed PCM widths are 24bit and 32bit, as they are supported
>> +		 * by aud2htx module.
>> +		 * for 24bit, D_SEL = 0, select all the bits.
>> +		 * for 32bit, D_SEL = 8, select 24bit in MSB.
>> +		 */
>> +		val = FIELD_PREP(D_SEL, width - 24);
>> +	}
>> +
>> +	regmap_write(hdmi_pai->regmap, HTX_PAI_FIELD_CTRL, val);
>> +
>> +	/* PAI start running */
>> +	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, ENABLE);
>> +}
>> +
>> +static void imx8mp_hdmi_pai_disable(struct dw_hdmi *dw_hdmi)
>> +{
>> +	const struct dw_hdmi_plat_data *pdata = dw_hdmi_to_plat_data(dw_hdmi);
>> +	struct imx8mp_hdmi_pai *hdmi_pai = pdata->priv_audio;
>> +
>> +	/* Stop PAI */
>> +	regmap_write(hdmi_pai->regmap, HTX_PAI_CTRL, 0);
>> +}
>> +
>> +static const struct regmap_config imx8mp_hdmi_pai_regmap_config = {
>> +	.reg_bits = 32,
>> +	.reg_stride = 4,
>> +	.val_bits = 32,
>> +	.max_register = HTX_PAI_FIELD_CTRL,
>> +};
>> +
>> +static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void *data)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct dw_hdmi_plat_data *plat_data = data;
>> +	struct imx8mp_hdmi_pai *hdmi_pai;
>> +	struct resource *res;
>> +	void __iomem *base;
>> +
>> +	hdmi_pai = devm_kzalloc(dev, sizeof(*hdmi_pai), GFP_KERNEL);
>> +	if (!hdmi_pai)
>> +		return -ENOMEM;
> 
> I am not sure how bind/unbind work here. you use devm_ func here? does
> system auto free it at unbind()?

Component helper supports freeing resources allocated by device managed APIs.
The allocations are commonly used by bind callbacks in various drivers.

> 
> generally, free() happen and driver's remove if use devm_ func
> 
> Frank
>> +
>> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
>> +
>> +	hdmi_pai->regmap = devm_regmap_init_mmio_clk(dev, "apb", base,
>> +						     &imx8mp_hdmi_pai_regmap_config);
>> +	if (IS_ERR(hdmi_pai->regmap)) {
>> +		dev_err(dev, "regmap init failed\n");
>> +		return PTR_ERR(hdmi_pai->regmap);
>> +	}
>> +
>> +	plat_data->enable_audio = imx8mp_hdmi_pai_enable;
>> +	plat_data->disable_audio = imx8mp_hdmi_pai_disable;
>> +	plat_data->priv_audio = hdmi_pai;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct component_ops imx8mp_hdmi_pai_ops = {
>> +	.bind   = imx8mp_hdmi_pai_bind,
>> +};
>> +
>> +static int imx8mp_hdmi_pai_probe(struct platform_device *pdev)
>> +{
>> +	return component_add(&pdev->dev, &imx8mp_hdmi_pai_ops);
>> +}
>> +
>> +static void imx8mp_hdmi_pai_remove(struct platform_device *pdev)
>> +{
>> +	component_del(&pdev->dev, &imx8mp_hdmi_pai_ops);
>> +}
>> +
>> +static const struct of_device_id imx8mp_hdmi_pai_of_table[] = {
>> +	{ .compatible = "fsl,imx8mp-hdmi-pai" },
>> +	{ /* Sentinel */ }
>> +};
>> +MODULE_DEVICE_TABLE(of, imx8mp_hdmi_pai_of_table);
>> +
>> +static struct platform_driver imx8mp_hdmi_pai_platform_driver = {
>> +	.probe		= imx8mp_hdmi_pai_probe,
>> +	.remove		= imx8mp_hdmi_pai_remove,
>> +	.driver		= {
>> +		.name	= "imx8mp-hdmi-pai",
>> +		.of_match_table = imx8mp_hdmi_pai_of_table,
>> +	},
>> +};
>> +module_platform_driver(imx8mp_hdmi_pai_platform_driver);
>> +
>> +MODULE_DESCRIPTION("i.MX8MP HDMI PAI driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>> index 1e7a789ec289..c68896392a2d 100644
>> --- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
>> @@ -5,11 +5,13 @@
>>   */
>>
>>  #include <linux/clk.h>
>> +#include <linux/component.h>
>>  #include <linux/mod_devicetable.h>
>>  #include <linux/module.h>
>>  #include <linux/platform_device.h>
>>  #include <drm/bridge/dw_hdmi.h>
>>  #include <drm/drm_modes.h>
>> +#include <drm/drm_of.h>
>>
>>  struct imx8mp_hdmi {
>>  	struct dw_hdmi_plat_data plat_data;
>> @@ -79,10 +81,43 @@ static const struct dw_hdmi_phy_ops imx8mp_hdmi_phy_ops = {
>>  	.update_hpd	= dw_hdmi_phy_update_hpd,
>>  };
>>
>> +static int imx8mp_dw_hdmi_bind(struct device *dev)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct imx8mp_hdmi *hdmi = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = component_bind_all(dev, &hdmi->plat_data);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "component_bind_all failed!\n");
>> +
>> +	hdmi->dw_hdmi = dw_hdmi_probe(pdev, &hdmi->plat_data);
>> +	if (IS_ERR(hdmi->dw_hdmi))
>> +		return PTR_ERR(hdmi->dw_hdmi);
>> +
>> +	return 0;
>> +}
>> +
>> +static void imx8mp_dw_hdmi_unbind(struct device *dev)
>> +{
>> +	struct imx8mp_hdmi *hdmi = dev_get_drvdata(dev);
>> +
>> +	dw_hdmi_remove(hdmi->dw_hdmi);
>> +
>> +	component_unbind_all(dev, &hdmi->plat_data);
>> +}
>> +
>> +static const struct component_master_ops imx8mp_dw_hdmi_ops = {
>> +	.bind   = imx8mp_dw_hdmi_bind,
>> +	.unbind = imx8mp_dw_hdmi_unbind,
>> +};
>> +
>>  static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>>  {
>>  	struct device *dev = &pdev->dev;
>>  	struct dw_hdmi_plat_data *plat_data;
>> +	struct component_match *match = NULL;
>> +	struct device_node *remote;
>>  	struct imx8mp_hdmi *hdmi;
>>
>>  	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
>> @@ -102,20 +137,38 @@ static int imx8mp_dw_hdmi_probe(struct platform_device *pdev)
>>  	plat_data->priv_data = hdmi;
>>  	plat_data->phy_force_vendor = true;
>>
>> -	hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
>> -	if (IS_ERR(hdmi->dw_hdmi))
>> -		return PTR_ERR(hdmi->dw_hdmi);
>> -
>>  	platform_set_drvdata(pdev, hdmi);
>>
>> +	/* port@2 is for hdmi_pai device */
>> +	remote = of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
>> +	if (!remote) {
>> +		hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
>> +		if (IS_ERR(hdmi->dw_hdmi))
>> +			return PTR_ERR(hdmi->dw_hdmi);
>> +	} else {
>> +		drm_of_component_match_add(dev, &match, component_compare_of, remote);
>> +
>> +		of_node_put(remote);
>> +
>> +		return component_master_add_with_match(dev, &imx8mp_dw_hdmi_ops, match);
>> +	}
>> +
>>  	return 0;
>>  }
>>
>>  static void imx8mp_dw_hdmi_remove(struct platform_device *pdev)
>>  {
>>  	struct imx8mp_hdmi *hdmi = platform_get_drvdata(pdev);
>> +	struct device_node *remote;
>>
>> -	dw_hdmi_remove(hdmi->dw_hdmi);
>> +	remote = of_graph_get_remote_node(pdev->dev.of_node, 2, 0);
>> +	if (remote) {
>> +		of_node_put(remote);
>> +
>> +		component_master_del(&pdev->dev, &imx8mp_dw_hdmi_ops);
>> +	} else {
>> +		dw_hdmi_remove(hdmi->dw_hdmi);
>> +	}
>>  }
>>
>>  static int imx8mp_dw_hdmi_pm_suspend(struct device *dev)
>> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
>> index 095cdd9b7424..336f062e1f9d 100644
>> --- a/include/drm/bridge/dw_hdmi.h
>> +++ b/include/drm/bridge/dw_hdmi.h
>> @@ -143,6 +143,12 @@ struct dw_hdmi_plat_data {
>>  					   const struct drm_display_info *info,
>>  					   const struct drm_display_mode *mode);
>>
>> +	/*
>> +	 * priv_audio is specially used for additional audio device to get
>> +	 * driver data through this dw_hdmi_plat_data.
>> +	 */
>> +	void *priv_audio;
>> +
>>  	/* Platform-specific audio enable/disable (optional) */
>>  	void (*enable_audio)(struct dw_hdmi *hdmi, int channel,
>>  			     int width, int rate, int non_pcm, int iec958);
>> --
>> 2.34.1
>>


-- 
Regards,
Liu Ying

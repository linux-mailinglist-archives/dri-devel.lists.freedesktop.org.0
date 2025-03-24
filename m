Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E5CA6D319
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 03:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C819010E0A0;
	Mon, 24 Mar 2025 02:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="BbdGEfy2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011059.outbound.protection.outlook.com [52.101.65.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5103510E0A0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 02:38:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7B/ll4NdHH2xSKkU1SnYUq+9A5TXaNWOfgmu6Dbk7rIYWaj88UBP3dbf8GiCFOXXAaHVR6QJifWEHZJ9tg9vF69rNEBqz55wXtyNkzJm9tXdNAxbPJzcdfC6BLGFAGFkal8HS6cAiegJfi40OeZRjk5Zw1asL4tgYrO5pqs2HfCBe7FSLvJtVK1ExlPwuvOdhYb7ei6DNe2FTgIF9gGiKfjlC2LMroY4wN0jEpepROZz8UWB/we07rjUbo/JAQmsjLGEULThkjWX7SoNwk8ess0DQMoQEpaJ3SuxJszNVfBtaaXPDSpuWpvCtiQuF831zl3Ue8ZqorzL0iAn3vWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIEaDxuHaIwfK/7CMwteQEyjX7XpksFSMeJ0ucU49Wg=;
 b=Fj2OfFfmL5/v1rVOkd6K+UDEb7AibF006FGdz8Jq08HA/rcIerjJxw6wTaukK8+JwMp+S5X1OL/+hwtH+QNBZvTOeAjownzQM2zXSrs0Fa+pOgVr7q0pDhIuDwhGkEs3fdx1xFqVZb5A02N8zxJpmeLTvzoYpXLJSsrouDUU2No+MwRNah6ckTGJ45knVQGQonIj7tX0iQJvuR2+Smrzl+PErJNHJ+emFT3aEWJFFFPO9fjuQIpVn9wZdjWx5WVsBj6U/ilf9dzOLbmHEUbroNJgeLK8Fm+AWAVKZfvj9F5wjbpnVGZxQkNre6g1Cutc0Xvvxd3hEEc/zKdY9SOcdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIEaDxuHaIwfK/7CMwteQEyjX7XpksFSMeJ0ucU49Wg=;
 b=BbdGEfy2dOCJYTm3dfwtNWKTO8ut+C8X9Aa/I5jku9NZGgGxF26G1a5cJcc1Bd77kRbYCjCkbZI4vhoFvttwAHiUeiny7egaXMTZNhz/r/gVJRr2w4aMYOs4UJHAm3hOw0ikGlWOu1AErFkBIKX/g13TY/zAs5KX8/YHOPpW39YEIHYMq1VuLWGer+uKCETkJ8OCPSAp5+nPSWWqUAU8j7HShx4St+WNjy6bjJpArZUtQ0KKnkyW09yGHO1KqcPKoUGtJxo7vQ0TJ4AK5rJVj0D6VrUOdcUII8J8NF37siWK5IxYcD7P7oXHRSqQ/KNUi82H4bkMzNX+qi82AP96EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GVXPR04MB10899.eurprd04.prod.outlook.com (2603:10a6:150:225::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 02:38:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 02:38:09 +0000
Message-ID: <72b7caf2-5943-49b5-acb4-43b2353992e9@nxp.com>
Date: Mon, 24 Mar 2025 10:39:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/bridge: imx8qxp-ldb: cleanup return value
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250306-drm-two-ldb-improvements-v1-0-f139d768b92c@bootlin.com>
 <20250306-drm-two-ldb-improvements-v1-1-f139d768b92c@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250306-drm-two-ldb-improvements-v1-1-f139d768b92c@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GVXPR04MB10899:EE_
X-MS-Office365-Filtering-Correlation-Id: bb7b0b7a-9818-4484-150e-08dd6a7ce9e5
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXJUbGJWa2ZWdkMzUmwwOVkrZjh5amhGSklkYU5oV0F1MW1GcUpuK2xTZEtN?=
 =?utf-8?B?bnBzUmZBNFFieE1vWHcyVktDa0l6cjI1b2thQ1RMdTB6bDFvS0UvTm5OZXRS?=
 =?utf-8?B?WnNCRDRTei9vMmNlbGw0MCthNVUwM25IZUlyZWlOT2M4ZmtyRnpFZklSTk5Z?=
 =?utf-8?B?SG5xQmI2ZE1ObzBHZ0xGSG9tL01TWk5vTm8xOXY1NW9XRDNiQWZlNUFzUHF1?=
 =?utf-8?B?dXdQRGdZd0plenprTDludmQxNDhtVkQxVGIzVC9kOHA0eFBrcnkrVWlUUjFn?=
 =?utf-8?B?UVIrMktXMnVCQ2dvNm9CWkNsRmFubzBVcGEvMTFvWXd5cDIvUTNTZVBGV1gz?=
 =?utf-8?B?VCs1aSswcXJmZHFHRnNjeDhiM0xWSjVYTlBRbURXeW42cUMxRjI1aTUzbEMr?=
 =?utf-8?B?c21ZbXVsakpOWnc0T3NHVTRpT3R5S0Npd3pyai9PSmFYMTJ6WlpFellHZUF5?=
 =?utf-8?B?OU51ZXpyd2NlSWVVaUc4THBOSDdHYWtmamRsazI0RjlWT0J0YXBZYSszdjNF?=
 =?utf-8?B?dExiWk5JYmluanhPUEJVeVlGY2lUUEpiRDJRQ01HNUliMXQzdGhIWG8rK0po?=
 =?utf-8?B?Sit5S1NwRVpaNzN4dTBVUExNbXJrMENCWDVSZXBTSGxoZUQ0ZGRTT0NxcDBD?=
 =?utf-8?B?VERuTGxWTlRyODBJNWdsMVhRMHFyOU92dmhld3cyVDExODlKSFlEcDNLYkQ3?=
 =?utf-8?B?R0FYbVVDRUpCVHRIZnpUV0dLMzc4UEora1JCZjJ5ZVRhci9ZWlZIQTBjMXkv?=
 =?utf-8?B?ZmxPTzRMR3dQdldId25tQ01NcDMvemkvNHYvZkZ2Y2Z1akJvaWJmaXVFbnpX?=
 =?utf-8?B?eUFBSnlzWFRndjJXTFoyVHBiNlQwLzdrREFFWGo1eGo2M09VS2RFZUxRL01Y?=
 =?utf-8?B?VU9CenJmMXhadGlWR296YU9kSU5SYUVWTXU0eUYwVzJGRVhCR3k3Uy9pY3BE?=
 =?utf-8?B?RlRFakhPMXR5elI0Q0VoR1pxa3N3MkdxSklHYTluS3BjZTRYN3FERzI5T2R5?=
 =?utf-8?B?YjlYdUhqalM3cnFMYnhkWDdDbnZvMm1UYkM4bnNBRGpCcTA2WHJyZ0NyRzRi?=
 =?utf-8?B?K2h1OUhXOHQvVzVmZG9lYnFLcW9FUTAzVk84YVIxTkFyaWd2RjJqMVpRVmFN?=
 =?utf-8?B?dDQvdmh0bnIwTGc3bXVlMVlJdE1CdGJxa0hLNWJncnF1OHQ0eUg2UERUWkUy?=
 =?utf-8?B?cU5HN1JjYkFPYmlOaHlkZ0R2eVNFVEsxNnJHUXdFdTBORFR0YUwrL0tEbWxR?=
 =?utf-8?B?RE9wQ29SUW9CU00rNkE2WldhRGt3RjZGdmZiTVIxQXMrcG9SaVhQdWRqcEw2?=
 =?utf-8?B?TWYvdFg4dC9CTnpJZkxuM2lWS1Exa0ljSmhVVDdyNFExVFlJN0NyR3VzaUVu?=
 =?utf-8?B?U3FuYXlWcnNhNit1L2cwcFBsVUp2T3ptT1lyMFlZc3JUR2M0Y1BnZGVUaTdi?=
 =?utf-8?B?RVlTSzFySVZQQTVuVmIxaEFGSHZLdWsyYTFvVXRnTjNJRXJkNEg5WkpxTXNk?=
 =?utf-8?B?cTFOUHB4TDNtUzkwQThMQmQxWkxJN3doQytBTm9HWUNUWDlPdEhwMGVqNW1S?=
 =?utf-8?B?cjFjT2dseXVCaVY4S096SCs1ZDFVZVMzaWVoR1lMRmhIM1JYUGQzcFdBbHV2?=
 =?utf-8?B?K0lFWlR6U2JSVXJDNTVRNnNSZDBCdDByRUxwWHZRUWxRSWl6bzZmMzZYcDIy?=
 =?utf-8?B?RllaZ3NHSFBwNVVKZEltZlhrM25oYXJCcHNIaXBoVE5UTUZrVnZDRUFka3E4?=
 =?utf-8?B?RjM2VFpva2pFa1VUcXU3bWZtUnNOQXUwSTlxTnB3TmxsMDFNNEtBN3BJQ3Qx?=
 =?utf-8?B?ejRMWTJ4S3V2QnY0N1BQUFdVNGo3bTNBZ1RXdDlXTWhuK09oVDNNeXBpNCt1?=
 =?utf-8?B?QWt3eE9yckdZZUc3a3ZpNDRvOUVsK2FaOTZud1F2ZjdyRmYvTVJNZzRvVFBh?=
 =?utf-8?Q?oX5zSbmTKlQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0FuT2RhdG5ORTJSWktZdzBWTEpwdnNYcmc2YXhORnRRUjU2V3JIbG9HWmtC?=
 =?utf-8?B?cWFIUmQyRmdqdm9iZDhnODNIZ1pzZEVBSW9YVy9WZmJtckhFa3d0ZVU0MENO?=
 =?utf-8?B?aTdTdENMcXlUS2hDbnliYWx2SThMS2FaMnVDd09SMkJtZ0VtQU4rREpJL2s4?=
 =?utf-8?B?c1h5TG9QeFdjd0dKWjh5MXR1UkVqY091dWNPSS9ZNTZ3RTJTcFE0TFI1NVVO?=
 =?utf-8?B?anVaOW9oWXprRk1IM2V4MDhobVJad0FYT3hqN2pKUmZzc3BPNlBXNVJNZHh2?=
 =?utf-8?B?MFAxaHpmTEh6V0IveXhOWjlZd3QrblhuT0ZYNWswcEsrNW51UzIzUlFjT3Jm?=
 =?utf-8?B?MnpwUzk1VVBoZ2NmQk5zSTVVWHFxZ0NjRE5nTzl5SVFVcHlzUkJxUlNhcjd5?=
 =?utf-8?B?ekNZdEZLTFA1K1d0ZDlDZ0RSdng5Y25DclA1d29XWGVjS3ZQNUZ2cVlKSlN5?=
 =?utf-8?B?cXVyRmVUN0ZqOWZaSjgzVTZCM0MycDJaVjNKVWNaM0FCaFFXZjhRbjJYUmds?=
 =?utf-8?B?UTVoVGk5TE9HdnNrcitHQWF0aCtXNVdOQVI4dWg0MGEwYVRFN1J4V1ZYTzBQ?=
 =?utf-8?B?Ukk3ZTRKUldhc3U3VHlZbU4wdTJXN040S0xKekhDdU04NW1rTmtyWkRrR1FJ?=
 =?utf-8?B?UnphQmhYNXpHZ21Dc21GOU1WbVNqemVlUkFuVk1BTmJxVlVwdk9DR0dEdFRO?=
 =?utf-8?B?bW4wa2R4U0V3d29HZkQwdHR4ODIvSFhmcWp1Wm9nTEVnUHNVUjZUekpyaml3?=
 =?utf-8?B?bnRxYzZOOEZLYTlFZmF3RHIwVGR4aUZ0RmlkVUEzVm0rMkt4d2ZxaGRSajVL?=
 =?utf-8?B?R012U1Q4T1FhaVdXVDJHWkwxVjVtbHcwa3U3SmwwbXlBQmUwdkxGNXJZVit0?=
 =?utf-8?B?S0dMalI3YWlESFh3WDB6QzU2Q1VlaDl1RUZlSWdLcnZoWm9TYkp1aDlEQ0VE?=
 =?utf-8?B?OVZUUGpUQ01OOW5qMk1TdXhjMmQvMEFVOWxLL0tlNE9wWmhIUS84QlExbld0?=
 =?utf-8?B?OFU3Z2R4ejVFcUFsd0RuRHF5ZXBNSWNMQ1NUWEFzV1lGUlUrZ29EVGVsYnB0?=
 =?utf-8?B?MkFMUmk2Y0RTVXZQNDd2U1Q2eGN1ZFluMHNSTEYwRUpWem54VUhPTm5heldX?=
 =?utf-8?B?YlBUK01DTXhTNks4MnNYN0JFWVBaWG0wVHdtSTVRRFVBT0dJNENJeGJNQklL?=
 =?utf-8?B?QklGVXBKTmt5MG1iOVQyUHVUeGQ2NXJCMEN1UHZPMDBIWXhDQmZwQjg4cjhW?=
 =?utf-8?B?Y3FVQTJHeEZRSGpVaHdzWm9CTEVrdjRLM2V6VG4yTnJCSFg1VWJSbm83NW9O?=
 =?utf-8?B?N255VWdpbVBjQ3FVdkVJMjQ5K2ZrZ21SaWthemdEbjV0VHVOaXNpcWxCcUhh?=
 =?utf-8?B?dlhoUTN1R2p1Si9wZFFYUzhSRFhZV3BHNWhXckY3U0NVWkxnc0JCbHl3L0po?=
 =?utf-8?B?c1c2akcxWEFtYjYrNGlEaVNLV3Z3QjdDbVZVYzF4bGdLSUR5Yzl1VmNnODZB?=
 =?utf-8?B?VndYd1BJWUxjV0dqbTMvOEtkaGdzUEwzSmd3R3BGNHc3cTNjMjdkSllKRFJX?=
 =?utf-8?B?NEd4bmJGcHVzcjBxY2p1Q3hPR0VqeDI4Wm1VeWM3Zy94dTFJUzlOSlZpVDRU?=
 =?utf-8?B?YWRYL09IczZxZnY1TmNQUjBha25YekVKRkdPRDduRG5Yb3BjVWhCRU51ZlJ1?=
 =?utf-8?B?bDFWRG5jWmtwUEIrVU1sUzc3QStkQnBZRVQyZzgxYXBZWG9ZbVZyaHI5UXN4?=
 =?utf-8?B?ZkY2OEowcCtycVVCMUlNU0FJZUs1YnoyNlo1UHBvbHNDNlFQbjVRRFpDR2RH?=
 =?utf-8?B?WnRXZ3o4ZW5kaEtLMDVINTZqL0J0d204WG04WDBHL25UdjZlRTdxK2NBNnJr?=
 =?utf-8?B?Nmd6QUFXMlRvalRWaW51T0lEbkkrOVFOdVhYNm5sOXRDUkNuVHo4dS9ucWQ5?=
 =?utf-8?B?b1pXNWE1ak11MEZ0emcxQ0crcE5zRnhzU0dMMDNGZkx5ZWRMUC9FZnpYUEs2?=
 =?utf-8?B?YjZQMW90VnZmWVhRMGlWU1BIYWdHcGJCQnZtbFBVLzB4QUNjZEw4elpaanJs?=
 =?utf-8?B?TlZLQmFIb1JERXNvc0pRKzRmMHI0bEplaFlWQ1dUWUdGeU5zS3hQUnZ6alF4?=
 =?utf-8?Q?EkCFilib6qp5C6FouTzejV9xw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7b0b7a-9818-4484-150e-08dd6a7ce9e5
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 02:38:09.2703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4/Tqxnd8Su2yDNPrnmlnvzfjyADkGMgN9rcaHWXLlCvzCG6OHm5e9oduRwJHd1m4Vd8Rr3UclBcbXAt6wCAsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10899
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

On 03/07/2025, Luca Ceresoli wrote:
> 'ret' can only be 0 at this point, being preceded by a 'if (ret) return
> ret;'. So return 0 for clarity.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to misc/kernel.git (drm-misc-next).
Thanks!

-- 
Regards,
Liu Ying

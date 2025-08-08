Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EEDB1E259
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 08:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BADD10E4C2;
	Fri,  8 Aug 2025 06:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hxKsAUQW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013018.outbound.protection.outlook.com [52.101.72.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FDA810E4C2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Aug 2025 06:32:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWagjXgqJbUD7rjSqxw7a83ztTD0PJRveLbxGS/jt8BprbfE600YuDvbx5k84TGa9WnktcYZHm6o2M5k5tSK02aD5LLVrUqKi6IeY8qrnEuApIe9T3B6obnQMjv8Jfhd6GxgGi7gvsKbOcrRejm1FhKvpOwUoLc0VtHGIcAk0OIGE6lzPP5mEIXJG2Z0v3SC8D26hwCjW7iMx8ABlNJXxGulox12jPdAQA6JcSTBnxh/EwK5fqWRjEgD4Y1UzioE6loiIX7kH8qL6c1TfKVrxhmmx/1yXfgyk/WWSr5VoTiLMIaW0USbkIdzT1rMX/WgJ6t2ueVids4Y2xOosTBX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKrno0zM2CUa2Cvwiad9vevpbaBeDywmY1/+Yt/86qQ=;
 b=nJydgHOyVM3jHoTkmhMDOhSqi17gvaL9hVvUujJayWQqOfSVsoFjvtpxKp2l3egHV9tWszn0RRZhjiwYl0Ktk58+mS41qdAveqrfgs+IB+IeLon9A5RwG1+9APMbB0NxehZcnQh4m8KVT8eCtRoIHVRq5XbTokNruADHAzxafefsL/It8I4f1WgyBiO9dFjsMMdz56Ku8hgvvoWqA+pp8mq8hqX6QnlSKjXf+iIEZdCQZomlw8fA2U1PLS7VI7hRcOKfNUD+ZVNON2YC9oBiIpsMr0JK2SjWVsQF6g0OIz8hzLxi+c7w5pZTSZ9g/sQMRBYSIg47lIuYdeN+p+rqCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKrno0zM2CUa2Cvwiad9vevpbaBeDywmY1/+Yt/86qQ=;
 b=hxKsAUQW2cgpD2wPXEyntAQHVazmmR0TXVZ7Y5e9NW6GOFjAvpGyRry5E28EzprIzIh9G0q8d+3OJt4/C3l3KU3zS7jQkv7I9QnDqstY7VomNdvWwvEjLn1KmZMmMehOZLZ5sX3ou2fmwt8Fjdo929TmXPcd/gXYLSuMwiL/CLG7fA1hR8f6n4MvqWQumF5HPMgNo/ObF0TzjYWBoxrTqriNiksrLb7Gnx7PShUVuSGU7z3xcz8BHizVlAP4hgNS3luRYm44iwa0l/tvmUZQpn0p/o0mfB9m5c7xonIk9PcOaU948VJaZDogIAPOGmiTHyWgbYT9b4VACZxwPW62lA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS1PR04MB9630.eurprd04.prod.outlook.com (2603:10a6:20b:475::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 06:32:44 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 06:32:43 +0000
Message-ID: <481c4a38-e638-49ea-88d4-765e581afca7@nxp.com>
Date: Fri, 8 Aug 2025 14:34:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] drm/bridge: imx: add driver for HDMI TX Parallel
 Audio Interface
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 lumag@kernel.org, dianders@chromium.org, cristian.ciocaltea@collabora.com,
 luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, devicetree@vger.kernel.org,
 l.stach@pengutronix.de, perex@perex.cz, tiwai@suse.com,
 linux-sound@vger.kernel.org
References: <20250804104722.601440-1-shengjiu.wang@nxp.com>
 <20250804104722.601440-6-shengjiu.wang@nxp.com>
 <fa455148-a071-4433-8c9c-26add3872604@nxp.com>
 <CAA+D8AN4n0H6M_0EqX4z_37ViSCyThKbmtMgqPmipintJ8Wtwg@mail.gmail.com>
 <ba02693b-8ad2-4297-ab89-5b39d5c4315f@nxp.com>
 <CAA+D8AN3VzFx1g=8wyxJROw96xS2-qoVs3X4vUfFnJtUCqFj_w@mail.gmail.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <CAA+D8AN3VzFx1g=8wyxJROw96xS2-qoVs3X4vUfFnJtUCqFj_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS1PR04MB9630:EE_
X-MS-Office365-Filtering-Correlation-Id: a84b0d98-59a1-4613-3bf6-08ddd64561ae
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1ZTZUx4OXZLaVh2cVVIVklibW9iWmFjNk9KOVd0UytZWGN4cENpVGxFNWQ2?=
 =?utf-8?B?SCs2cmZUYnhMYmFPb0ZCdHlIR05YNEs4cUlSWDdBVERKcG5tR3ZlbVNEd2FH?=
 =?utf-8?B?aC9hamxXVU1GcGt5OVlwZGswMHoxTXpYejY4L01HSVZ1UHQzYlZNQ05BOEIv?=
 =?utf-8?B?L0JFam40MlNtdjRvVHdzZ0x4TGhZMXEyTFM1RFVKblRZVzVrK2NJUDJmcnd5?=
 =?utf-8?B?NWIyNlMxelNuVHI1bVBKOE8zUlc0YkxuRHpUZFdvdWU2MUl6ZnNiWFMyYW9O?=
 =?utf-8?B?clZBT1dFTTg0NDB4WU8veHArMEFhYUdNWWxSemxlRi96b2FQTkZkdE03STE0?=
 =?utf-8?B?Sko3bVplZ2phaGpKS2xzbEZJQWVFNTAvaml0Ky8xZk56TjJlaEZ4YWdsRFpq?=
 =?utf-8?B?WllWc05uaHM4WERSRlhqZUFWbXRDUks4SDBmeWpGQnJFbmYrckJuUHNxYUww?=
 =?utf-8?B?bkhsTXFxaGwreDNiaHdUSC9vQ1NBVHRUOFp5WEowU2kzRkNvMjVoWitSR1N6?=
 =?utf-8?B?VEFzclhjdUtlZnBWVXpFVGhBczNYK1loejJkblNCSVJwZVZZN0lqVEVmZXJ4?=
 =?utf-8?B?M3RzalVxd1pQUHVUNXdreHNVS2l5eXhweDBPTFpXUkxwckpDNUNPVFB3Qk5t?=
 =?utf-8?B?YmJTLzFUUUJac2FWVVZjMFVqaVA2dURhRklEejNEM21wY1JJalFQS1hjeGl4?=
 =?utf-8?B?Y1ZPQThEY1dwenF3ZzBoUDQ5V3hKUUl6SS9tNmt2TW9uaUw0RXk0SlJEU1lk?=
 =?utf-8?B?TnhpM1Nuc0daRzRqVmNxamwwTDhVcFRQcmYwbE9wSzVjWkoxc0tUbTlRUnl2?=
 =?utf-8?B?MEFBQlcwV0NYbldsZFI5T09JaEhHUjVxa2hlVHFCMHVUanRsVkJNcW9GcmZh?=
 =?utf-8?B?dGFGdVJaRXZVL1FkcEZ3TkpGVUNuVVQ3VFlvSnZ1NHRLZXhUQmY1RHRvdHBm?=
 =?utf-8?B?TkZSbkg5R3BnVGwrbFkzUWR0VE95elRwYVJrc3l0ZE83YmtNOGhVeHdoRGlw?=
 =?utf-8?B?UXdvSGdVSEhKa1FvcHEvcGY0cStPOGp3NVR0SDNSYXIyZjFHb2dJRW9KVzlj?=
 =?utf-8?B?T09MdVp1Nm94OVoraXZ2aUtna3p5N084d0c1aTFBVk5hS0FKZ3UyRkpsY3NE?=
 =?utf-8?B?Ulc3ME9JenFnZzVubFpDQzI5ZUtYWlJveEJuUTRXc2xIWTVNakx5R1FiOThw?=
 =?utf-8?B?cGRuSHprMXpFSy9zSE9XYWFVUUppV2tpYi9oZUl0Sm9iT1Z4M0hLTS9xblF2?=
 =?utf-8?B?V3ZHbVdER2ZUT1ZTbWV3K3hnb2pEUG56ZGFUWVg0bGIzZFowdUNMZUQ3YVFZ?=
 =?utf-8?B?aXZWMnZFaHJORW5JZUwwaVNLcU9ZeloxVUV4SXZYclZMZVh5cU41NVVDWTVi?=
 =?utf-8?B?blFuWTk5aEV3eUI0QlQwMEpFRjhuNU5NdndaRHJ2b3J0Z2kzcjJGdldyRkZ5?=
 =?utf-8?B?aXJaeHYzaUNEM1FqYmVuTHQ2Y1lGd2dhTFVsazMzbXRSMzNORHN4YkwvVndj?=
 =?utf-8?B?OVhsYkdsM09uT3paOHNhVEppNUo1WHhjbi9Eekl4clcyV3R5RHN5S05BUk96?=
 =?utf-8?B?cmFXT1J3dU05OUt3OUR3VzY0WjVoR3RPNE9kTlArOWE5QzV6ZDVEcHp0VTIw?=
 =?utf-8?B?S3M0Nm84RDM5bnFzcDIraGdncFNaMkt1OXlQUmRHY2xGTXRmeTBuU0dZOW9W?=
 =?utf-8?B?RzUwYTZza0lUYUVTNE1OakJLRFAzMnY2dkdTd1NlUVI3RzBWWlJWdlpsOFFx?=
 =?utf-8?B?TGNRR09NSG1SK0hmckh6Yy9OVkVZckVaQjl6WjhuWjF2UEo4UmowMUNkVlVU?=
 =?utf-8?B?dG5nckJ6QTJZUWcwVXRiZ05zaWxyZjNrTFVhUGh2WlJGRzFlUU1LOGtKSitU?=
 =?utf-8?B?QmJMYmoxTkkyUThucDdCQ294R0tRQnRHSmxmNzk3ZDlFYWU1TU10bHJkTmdm?=
 =?utf-8?Q?00mqXQ+tuHc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0JPQi9CcEpPTDI5bjNhYUxNMFFsNS91MEFkU3ZUU2NCWGJMRVV2YjNkem9o?=
 =?utf-8?B?UkdMRUQ2L3FONEM4clhKR29GdlhUWnJIeFlPRTFTMXJieXVyWVA1elNaY1F3?=
 =?utf-8?B?RG43YVpXUG1hYVFodEVBYVc4R1BaSWlOKzRBZVhiRGRpRWpsMTZ2NjE0UEll?=
 =?utf-8?B?dmc4cG1zQ2l4S3hEZXRlT0h2dTRDWUtTM0JOc3pGSkgwOEdLcEVoZnF1QXFq?=
 =?utf-8?B?a0tXa1ZpdGxScjhvWG05cFNxYk9FWTIrcC9lejd1TklwRjFQeFUxQkJHRDBZ?=
 =?utf-8?B?VWJFTFY1OVpOUHdiM2RzY2c0aWlMN3I3dXhjMlA4NVhkeStUL0ZsQ3dRT1h0?=
 =?utf-8?B?bmtJMUZqczFkdGxyMWhaWEY5aE01YzM3UTk3K2MzamswcVRlQ0c4SHY3UXls?=
 =?utf-8?B?cWhvNnlWOEhFMUZxY1Fzc1VGQUY1SlZzVnppUEY2MkJjK2YzbEdiS2FWNmF1?=
 =?utf-8?B?RTFuaDAzNlVIRG53dndJbGJXMEJEWE1TREdyZmdySFNPUmVFTk5uRGY0ZStB?=
 =?utf-8?B?NUQ1djRjZlc0cXo3aHRxSWxLWDNBSlhFcks0cnZXZzZSQlo1NTBPbldQKzRQ?=
 =?utf-8?B?L0oyMCtHK0tKcFBZcVhab2R2ejV1bzArT044TUNaODJNbFFZcmNiOTlpSkVq?=
 =?utf-8?B?YWVnWUVmMDljZ2xRckZhR3d5bDg3WlBKcElzMkhZR2hocWxLelN3QzJlK0hF?=
 =?utf-8?B?YVhraVVSUEc5bUZUMnl1YnViU1pPSExkcmVJVlptUUpQZW5sUFlGL09MNTZm?=
 =?utf-8?B?ZWdWMThDbHp0K3l6ZGY5dzE4dm5nTTJzeE5JanlSTXdWb21BclNLZzluSXdX?=
 =?utf-8?B?MUkxVjZELzl1L3V3eDhxU3FLenRKS2Mwb2hvYUdQNjZNbXVTbjhvbXZRd0h6?=
 =?utf-8?B?RWZyTkgzRTN6bHZ6ZlFzVWpUNlM2Nit2aGRoZmw5bitUa3JDTngxeXJBRzJL?=
 =?utf-8?B?cUpUL2QvQkZkVjRiNHZnQldYQTlObmI3ekZPeVVZVTJ6V1pBdUVHNGZIcm0r?=
 =?utf-8?B?VmhpZXR5T0VaTmNxYmlEdzhPL01YMzlFWU5kVkdBQkpDWS9mQWtXQjVsMTMw?=
 =?utf-8?B?dzkramU4enBYMkVUQUU1eEpEWUVoRWMrczRaYlJYT1FGZExsaWZiTmRCenhl?=
 =?utf-8?B?ajdSdEdIcE4rN3RQVk9vUEo1VjBRWFJSTUFpOFVpNmllbFU5dFRVeHBveDhQ?=
 =?utf-8?B?OXJMYmdQZWJtWHFOUmpyWWJoZnhJSEM1dGlqS0gwZ0NmOGtIRmgzbXN6UTB2?=
 =?utf-8?B?enpEUTZtU1NJL2EzR0pnRVUzMnJuVlFHVkFSVHVtNno2b0w3NmRoa2orSU9x?=
 =?utf-8?B?bWN5aTlsSFlwN3pydDNCWHd4ajF3SkQyOE9QRG5nVENhR2FnTWVRbHZqdTRY?=
 =?utf-8?B?UnU5UmorclYwT2RTdnp5Qk5IdWMzcjJyZzRnZlhkMWZhVXpBa1J0bklsemJB?=
 =?utf-8?B?WjdaLzh1bHVIMllNZHRBejBhRzZ6VTg2VzVLYk04bmRBelRBai9tQVI0NlpP?=
 =?utf-8?B?N3lrM2N1MTAybUhjMWtQUlQ0dXdIZzRReW9wQm5WdGdOMUVHMDAyQm1BQkQ0?=
 =?utf-8?B?bi9pVE1uUHdXZVN3SHh5SDI5WE1mSDJPbFJ3Lzk0eFBjc1FpT2lnRkc5ZkRp?=
 =?utf-8?B?UnlGekJRUVRDVkJWSEIyMzQ5eWozaWpnbTZBUHRuaHJrQVVSL1hjMWpoaHhw?=
 =?utf-8?B?ZjdMUUMreEx6TzdWZTFHRDQyMXRvR1hyZDNLZllsbDZ3dElSU3NWYzRwdG54?=
 =?utf-8?B?ZW5RYkdrbVVkOXFUZ1F0SytQQWF2eGpmcXZ3QWZpZlRtbTljMFVoZXRGSFJE?=
 =?utf-8?B?NnNvc2FUd25RcElTY3oxU2xIdTgwYXlTWFhjNmRjenR4RjZMd3lQTGVRbzh6?=
 =?utf-8?B?YU41dU5CT3VKZnFESUE4dENyV1lPTXVpOWpQaXhha2dWWEFaZzV3MVkwR3VX?=
 =?utf-8?B?MXNNRHBZQmNqbG84a3Z2aXJGbUdoU1o2RVZrSE5raEI3K2NYc3FmMkpCMWo4?=
 =?utf-8?B?dndtKzliZWx6Q2ZUNHViVmZHUzNhcUt4MGpCWi82N2hJa1ZzNXpsb0RTVm5u?=
 =?utf-8?B?b2s5YXc1NXhrZGdvdC9zTU1zT3Flem5SYzRPbndxT3UwZ1BVYzVlQmEvNzFr?=
 =?utf-8?Q?Sv07th52NXLR2E6tLMvOZGR7v?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a84b0d98-59a1-4613-3bf6-08ddd64561ae
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 06:32:43.8846 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OAAhUvlQelzsVZcEabBgmZGY9uNCrJQ38T75/Nm420IM/dSgWnK3QKPZK7qk/rzMVnpu01WI8CSixt9izrr3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9630
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

On 08/07/2025, Shengjiu Wang wrote:
> On Wed, Aug 6, 2025 at 2:52 PM Liu Ying <victor.liu@nxp.com> wrote:
>>
>> On 08/06/2025, Shengjiu Wang wrote:
>>> On Tue, Aug 5, 2025 at 4:55 PM Liu Ying <victor.liu@nxp.com> wrote:
>>>>
>>>> On 08/04/2025, Shengjiu Wang wrote:
>>
>> [...]
>>
>>>>> +static int imx8mp_hdmi_pai_bind(struct device *dev, struct device *master, void *data)
>>>>> +{
>>>>> +     struct dw_hdmi_plat_data *plat_data = (struct dw_hdmi_plat_data *)data;
>>>>> +     struct imx8mp_hdmi_pai *hdmi_pai;
>>>>> +
>>>>> +     hdmi_pai = dev_get_drvdata(dev);
>>>>> +
>>>>> +     plat_data->enable_audio = imx8mp_hdmi_pai_enable;
>>>>> +     plat_data->disable_audio = imx8mp_hdmi_pai_disable;
>>>>> +     plat_data->priv_audio = hdmi_pai;
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static void imx8mp_hdmi_pai_unbind(struct device *dev, struct device *master, void *data)
>>>>> +{
>>>>> +     struct dw_hdmi_plat_data *plat_data = (struct dw_hdmi_plat_data *)data;
>>>>> +
>>>>> +     plat_data->enable_audio = NULL;
>>>>> +     plat_data->disable_audio = NULL;
>>>>> +     plat_data->priv_audio = NULL;
>>>>
>>>> Do you really need to set these ptrs to NULL?
>>>
>>> yes.  below code in dw-hdmi.c use the pdata->enable_audio as condition.
>>
>> Note that this is all about tearing down components.
>> If this is done properly as the below snippet of pseudo-code, then
>> hdmi->{enable,disable}_audio() and pdata->{enable,disable}_audio() won't be
>> called after audio device is removed by dw_hdmi_remove().  So, it's unnecessary
>> to set these pointers to NULL here.
>>
>> imx8mp_dw_hdmi_unbind()
>> {
>>    dw_hdmi_remove(); // platform_device_unregister(hdmi->audio);
>>    component_unbind_all(); //imx8mp_hdmi_pai_unbind()
>> }
>>
>> BTW, I suggest the below snippet[1] to bind components.
>>
>> imx8mp_dw_hdmi_bind()
>> {
>>    component_bind_all(); // imx8mp_hdmi_pai_bind()
>>                          //   set pdata->{enable,disable}_audio
>>    dw_hdmi_probe(); // hdmi->audio = platform_device_register_full(&pdevinfo);
>> }
> 
> Looks like we should use dw_hdmi_bind() here to make unbind -> bind work.

I don't get your idea here.

What are you trying to make work?
Why dw_hdmi_probe() can't be used?
How does dw_hdmi_bind() help here?

> But can't get the encoder pointer.  the encoder pointer is from lcdif_drv.c,
> the probe sequence of lcdif, pvi, dw_hdmi should be dw_hdmi first, then pvi,
> then lcdif, because current implementation in lcdif and pvi driver.

We use deferral probe to make sure the probe sequence is
DW_HDMI -> PVI -> LCDIF.

LCDIF driver would call devm_drm_of_get_bridge() to get the next bridge PVI
and it defers probe if devm_drm_of_get_bridge() returns ERR_PTR(-EPROBE_DEFER).
Same to PVI driver, it would call of_drm_find_bridge() to get the next bridge
DW_HDMI and defers probe if needed.

> 
> Should the lcdif and pvi driver be modified to use component helper?

Why should they use component helper?

BTW, I've tried testing the snippets suggested by me on i.MX8MP EVK and
the components bind successfully:

cat /sys/kernel/debug/device_component/32fd8000.hdmi
aggregate_device name                                            status
-----------------------------------------------------------------------
32fd8000.hdmi                                                     bound

device name                                                      status
-----------------------------------------------------------------------
32fc4800.audio-bridge                                             bound

> This seems out of the scope of this patch set.
> 
> Best regards
> Shengjiu Wang

[...]

-- 
Regards,
Liu Ying

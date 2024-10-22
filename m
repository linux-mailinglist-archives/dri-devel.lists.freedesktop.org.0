Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DD99A9B2D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 09:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D1F810E5F2;
	Tue, 22 Oct 2024 07:36:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ZadBnF2a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2052.outbound.protection.outlook.com [40.107.249.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10C510E5F2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 07:36:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ICH0U1PZCmUhWBc3Va0gD45qYKGWbGrMMwJV79AzorxoxnFpwKKA+myecT3IVAUlQdVsX7uecZEz7e510Cvus3qOfm+tXcxeD8sS1gj/ZDPoeXnSBxGr5tCWexGtPw2Qz5vkUnByWfkROHL2G4l8U+m3X++ToA04ki4o6r7cibCcW/+nY1iniJuwaBNAqe+64968c1wCLRe3d4bJygtw7cSPB6w2lKWZznhYj1p7qAbH3I4fbmkXSrRDBkY6Gv37IZSrHx8KynO+1LkFLP67CB0H3un/XEyop+0ZavX/BJbtgqCxZYRGco0GbcYlXXQs0LRPeFHSpyx+I5rAlv7p8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0Egd241WvL4TxITsd0uBJdeuS+WSGW8PXd4tRm3Puk=;
 b=w/UplA1rMPxc3teY8rknpjtW/5Cl/jIoEAiBUQCyV7nB/DmkfvEG7GiCsGVGtuKWxS3v6oYX6BCKXqZv2AGmXrDlOAvh6PVcZB9TF53897ZMBtzcCfbslZGjVeuyZLDHX92OClWEDGMxmTVfFJsTov1K4CsTUPR6DBpNpDUVDyWZ0Usq0jCEBEypL1Wy9jLFMi3f4qS0idYsbI1ZXVU1NVQaHaB9kMptYXI9yvtvUyu85nECaDA8FHUtYObGyRommCE+6HJ0BAP37aIU9o2/pJwHpwEKSHzSpeq1h/x+xx0cMnNSZEeDrw9xb9rrMy2KYV+66E6y1hYSxpjHeEMBqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0Egd241WvL4TxITsd0uBJdeuS+WSGW8PXd4tRm3Puk=;
 b=ZadBnF2agbP0gfXLBWMtLngjHflJ7n2FqK4NB1tPFEFFO+3KjbMCR2JuviMwMBwvc/t6aeBcaaBN29kv3pHbPnVXoZlqMSF6o/Ci5rYrGHbVcj/RzUSOmTBHq4ZNlF0VBVyrrK2PRd0DgucNLpMOPG3H7etTb25NjeanzgCwEo6rAbsPsQZWdcHB1CJYSUO4X6Q7q6b1ALD5n8JehfpH8d1pBBR5bco4QsCU7h9OkZ0dAc84Xhwo1+BSny5V5Z5WgrfVvqjpoSKgWbWk0OrNivmHvETz0DMMGeAgaYSiYVxZiQ9Y3Fa4+hG4scP3xgG5U+Js71E7hld4T1dBDg95fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7295.eurprd04.prod.outlook.com (2603:10a6:800:1ac::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 07:36:26 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 07:36:26 +0000
Message-ID: <889594b9-e6cb-4d90-b959-cd0258b2f166@nxp.com>
Date: Tue, 22 Oct 2024 15:36:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/15] drm/bridge: Add ITE IT6263 LVDS to HDMI converter
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com,
 mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de,
 nfraprado@collabora.com, thierry.reding@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de,
 biju.das.jz@bp.renesas.com
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-13-victor.liu@nxp.com>
 <20241021-thick-cockle-of-popularity-c5e28c@houat>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241021-thick-cockle-of-popularity-c5e28c@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0005.APCP153.PROD.OUTLOOK.COM (2603:1096::15) To
 AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VE1PR04MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: dea4bbe5-254d-4a8a-b3fc-08dcf26c3c76
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFduOXZkK2NkQmxCb091alQvMm9xNm1Wa3RreXM3cE1oK0hxWStIbFh0K0JN?=
 =?utf-8?B?UEE5czdZQWYwbVB1UzN6bEdwMjlkNG1uV1NmTlAyMGt2U0RvVGIxNzJCeWU5?=
 =?utf-8?B?bmZmRDVWZWtHNWZYU2tZMjhEajk5QkRNakRKdG43NXUvekZUTFBpdzRNUVhG?=
 =?utf-8?B?b2JOQUxKWnoydjk0dVMxRzN4ZTZjbnJrWmhCSnlUQkNaTjJaSWd3SUowSUhV?=
 =?utf-8?B?Y25iS2VwTXA1MFQxdFU5N283UzN1RnplQ1g0dmVoQWllMjdNcU9TcGJRWTFO?=
 =?utf-8?B?VlhlNHdDWW5Mb1cvU01HeE5aNjZ0VDZpVG0yK3MxSWlJSEVSaTZXSi9qK2lW?=
 =?utf-8?B?c1B4YWlpRXRlVzhKVEZJbGliVlNKSi9reHROMWs4a29xbUN0UU9HbVl6N0Fn?=
 =?utf-8?B?aTVxUm90RFVFL01sbk5tNXBZZUpxNC9pTXJ3OGExT1RMdkFjalZCVGJNUDZU?=
 =?utf-8?B?dU5PWjVVd0JVejhwRTVwTlBuUENwS2hOK3U1SUM0OGxsQ3dLWUtXV2dManlr?=
 =?utf-8?B?a3Ztdi9SV3JZaVBZR2RYMmN1TXNyV0NFaTRYVlZpZFJkTlFJSXBhMXM4dFZF?=
 =?utf-8?B?S05nd3lGRDR4ZTdUNm44SC9GQ01sMVZOdGNnQ1VYdjRzeVZsdzhRc0NBa0o2?=
 =?utf-8?B?SFhqdGppa295eVFXM3prR2Y0RW5TSTVMOFVmWEFJYnFvVGRrS3RsMXRmeDhC?=
 =?utf-8?B?TXVLSW8yUkZkMldHWmVEazBVdlNOWUkrU2c3K3hWMTZ2d1IvSGtwRldaOWg3?=
 =?utf-8?B?ZFc5bHlJUk5samh3YW0vM0lDT1dFcjZ2YkpuN1JHOGtRdGRHVFhEZCtDUVJG?=
 =?utf-8?B?OUYzeUhnemh1dHhVNkl2OUpieHN6dUJYVUtLWVVHNTR4Vy80TlY1RFM2ODJa?=
 =?utf-8?B?TFJaa3VJQmlpSHUxZkJWallYRWw1REFnaWsvVzFDK2JtUmg1dHdIdFhyTlQv?=
 =?utf-8?B?QTZDaWRRZW53QXBiSmEvOWtYNGIybUFUV0VMTFRRenQzY1FqT2ZMTnJ3ekg3?=
 =?utf-8?B?bXNjR0RsbmRUdXRHYkZJamhSQ3gweFppUEsyQ2R0YTZjUi9sMnQ4MUlhSVBQ?=
 =?utf-8?B?Z2hwQ1VsbGZ1NTFGQlVpSDZsWXRVdHk3Y2h2cFl1OTJ1Tm1OUnIrdjU2QTU5?=
 =?utf-8?B?bklYTnlFYWM1QW9WSlF3ZXVYdW41T0paRVFKaEo3NTF4UjJlQ2twdVcxcHZJ?=
 =?utf-8?B?WXJmeHB5bGNlaVNjSEl1NjVQNkl6eE5ocHBtMzNCMFpyNGFhOTE3eVd6ZHBF?=
 =?utf-8?B?aFN3WTRtSHBId2NLYnNuZlhsTTUxTEN6ZXY5MUM2R3FFYmF3SHdmKzd6RDFM?=
 =?utf-8?B?TWVqeFhTekEyNnBpSjN0ZlNQak42Wno0Wml4UzVyeHU4N3FlaDhoR1VmcUVQ?=
 =?utf-8?B?VTVpSVhFYlhHL2Z3SVNEYTIrbDk1NW52ZVl5YzZXK3dkMUs2aThTSDBDb3NH?=
 =?utf-8?B?WnNmOERPbWpzRHZjSHI1YzF2SDFJRHVZTjN0Z1lnNXdUWUtpZDNsNXo3M0U3?=
 =?utf-8?B?cTdGTjFnakNCM0QxdTBramFodkxNRVF3bVQ2SkZhUHR0NklDOG9wQmtQbTVQ?=
 =?utf-8?B?TGRyeU5aT0I3cHh0LytTNUdGdXBvaGJVUUpLaEY1dENXdmNWcHM2dzFNWFdU?=
 =?utf-8?B?TkZBSFRPMDh2RGQxcjFjTThQTi9MSVNhWlk1eXRQV3ZKbUtrNFo4VGJ1ZDRl?=
 =?utf-8?B?YnFuQitDR08vTGkzc0IvWkd6ZDNiVnhPdXhQOTE3M3cvTkhQYXVLaUFtT2VE?=
 =?utf-8?Q?brV+J1SbYfVRMAS1tiALISTyWxPv5olbXwPq1N9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnRYMVlDQTVDUkdHWkdlUVBnWTRCZ0s0Um9ENzlNOGtiR0pQYUtIc1ZSU3NW?=
 =?utf-8?B?N2k2RzdzUTNqQkYvSnBTNTV1NHJhMVFCd3FYeEJ5ayt0VDFsYUZLcEQwcm4z?=
 =?utf-8?B?RFhtNUl5a2RaSVA5NHBDRFlSbmRsMDZLZnlEQXVZa2tIUGZnd1JuUEg5NTAx?=
 =?utf-8?B?VGZhRWZ4UEkyTWxiQVA1Z2hIaTlnWVhLSjNnMmJlUmp5bGFyVllSbkduVlNq?=
 =?utf-8?B?QXRaS2ZzaHdVYmVSYjE0ZkpmZDdCL2pjVkdKU2svZ3J3NTRGZFczdHJ6MUdr?=
 =?utf-8?B?eWU0aUNLTWwzZnRJV3JYRFVncFl0MnRPdzNpL2dJa2dIYjhXZit1enpoNFg3?=
 =?utf-8?B?ZUJ4c01MNmxraWJqUDFHZ2JHRFV5elBSczdNQkR4WVpXdDRzNHhFNGdOUG9M?=
 =?utf-8?B?VEJvTXR0QUxWb3JZa0g0dTRRM1N0UE1RMzZYT0xtY0tzRi9Ib0xoRkVuQVF1?=
 =?utf-8?B?RVhWcFlCdFYrZmFEall0Q0pLQ1lOMkZhcEZmYnpjQlJrRDdHZm5qY2lmaVJH?=
 =?utf-8?B?TWVoVzQxQk4xNjJZUC9PMlhWbm8xTy9nQXY0T3duU1pKRWNXb0Zmd3QwUGRm?=
 =?utf-8?B?Q3VLd3hybDlZeFUrZ2t5TVNQUmVKbCtHamhYVW1keG45b0RCa0xlTjNLT0pR?=
 =?utf-8?B?MVZDVTdJYk5aanJJb0dRWGpDODRTT2pUMEF5dW1ZRXRLT0prNzdOeSt3S0Ra?=
 =?utf-8?B?aFp4NkpGemRxWktQbWZJZmlQN3hXbms1ajVla2FkS3VhZFFGdlp1YWJMaVJZ?=
 =?utf-8?B?Z0NhYlhNZ0NUVVEzK2ZBSWZ5TkZSN01RSExPWmFkOHBNekVJSk9UQlpjSmVX?=
 =?utf-8?B?aTBTSTEvTmJrNGlCVy93WnRObEprMDBIWTNjZkhocnkrWjNTaWFpVkJqc2lX?=
 =?utf-8?B?SjRORTdXb2oxMisvMHVzOEh3bWp4S2dUc3ZydGYxK3FWbXkwMldBeU1qRXZM?=
 =?utf-8?B?ZDJPenp5QlMyU3Z2Q203ejUyeWdpZ2c4QkFwR3FzRW9Lck9rd1FGenRvTDAz?=
 =?utf-8?B?SS8vRVd0SVRqODAyUlBTRlMxZzM3UXQxbUhncjIyY1RkcEt4eVd2UExpMjZW?=
 =?utf-8?B?QlAzMjlPSy9nRUFLYWlxQ1hwTjVEWVJ0VUU2SmV3WFM0aHZ2eFZ2bmZhRnEz?=
 =?utf-8?B?cllkTTNkYkdYOWVQQ0VtWVRIbFY3alJ2L3RTejZ5d05vYkwxOGhBb1picTFI?=
 =?utf-8?B?UWxrTy9mWGNPUnh2Mm10REJJN0U2R09lbTVIeDgwbWZrVW9JWlI0TDBQeWw2?=
 =?utf-8?B?aGhRVk5EcFNPQWRKcFZoQmZsVDhqbWZmcnV0cUV1a2xZREtiWUx6SUcxSnE4?=
 =?utf-8?B?SU9WT2R4ZGVzVlNvSE85aFNGUUtxeFlaRXoxV2wxNGtkYzBpVFBHM2FQWXk0?=
 =?utf-8?B?L2F3WTBHYy8yR0wzVWlGMUxpWXdyZHFBNFZtS1VsR3VxRWtqK1FiQTh4S2dJ?=
 =?utf-8?B?cUdtRTZXQVkzc0ZRa0l0R04wck5UMVZHT0prUWU1MlhwZmh1cHNkOU95UTBs?=
 =?utf-8?B?eTd5UFpFMHZNNDJ5eGtpbUVGbEV4a01BdzZZaHFoYVVsbEVqS3R0czBJNktl?=
 =?utf-8?B?a0F2UTMvNGluVTQxdTg3VXBmQ2lnMk82a3p0blphRmtBV1F1bnY4UnIxUjd2?=
 =?utf-8?B?cDBZcGVkMGlOTis5MkVHM1NDb3daT0hteXR5SEllTVZ5aEFYV3c2S3JtZ3RZ?=
 =?utf-8?B?aHJDNzR0ZjVPdkZRTlZ1NXNHU2ZuVktrdUhKcThoN1BoOWtlem9HbzNSNUZN?=
 =?utf-8?B?NWNFVlZmOGY1OHpnV2w3SkJuMERFeGhSNmVDNnRVSjEyTXV4Qk8xc043aDUz?=
 =?utf-8?B?TVRXM214TDZickVha1A4c3A2Y0VDazhyWFJObnFMYXJobXIzNmhQOHBQVjdN?=
 =?utf-8?B?WTZkM09BNHJXZFM1NG9EZThlRkFyT1hkRnlCTExWMnRJQmx5ekJXazBtU3JW?=
 =?utf-8?B?WEkvMzJQVlNCRnZzMDNXcktzUFhSRUJFczY1d2RJQ3RCQldJcHJPVzE1YmJF?=
 =?utf-8?B?ZUlRSWE3ejZsdk41ZGdFeFFrdTA1akl5R0NpbmR2Z281Q0NqeFp4ckhySlJX?=
 =?utf-8?B?eEt5UHJUeThDNDdnb2RUU2NibngwZHdQNkhjc3NLamp5T2xOejdlWnBZS3Ew?=
 =?utf-8?Q?Nc+nlIXwKBtc9+GZc+/9C1mS8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dea4bbe5-254d-4a8a-b3fc-08dcf26c3c76
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 07:36:26.5785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKrlaG73meDR7Mt0SV13O0eawgh1iDJffVEn/EAeyyHY5QA+I5zJHqFM2MxC+tWnoJSDVuxlCmB+FtOcnCKAkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7295
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

Hi Maxime,

On 10/21/2024, Maxime Ripard wrote:
> On Mon, Oct 21, 2024 at 02:44:43PM +0800, Liu Ying wrote:
>> +static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
>> +				      struct drm_bridge_state *bridge_state,
>> +				      struct drm_crtc_state *crtc_state,
>> +				      struct drm_connector_state *conn_state)
>> +{
>> +	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>> +	int ret;
>> +
>> +	ret = drm_atomic_helper_connector_hdmi_check(conn_state->connector,
>> +						     conn_state->state);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? -EINVAL : 0;
> 
> drm_atomic_helper_connector_hdmi_check will already make that check, so
> it's redundant.

MAX_PIXEL_CLOCK_KHZ is 150MHz. With 150MHz pixel clock rate, we'll get
150MHz HDMI character rate for 8bpc and 187.5MHz HDMI character rate
for 10bpc, both are lower than MAX_HDMI_TMDS_CHAR_RATE_HZ = 225MHz.

So, it looks like pixel clock rate is the bottleneck.
Remove drm_atomic_helper_connector_hdmi_check() or keep this as-is?

> 
> Once fixed
> Acked-by: Maxime Ripard <mripard@kernel.org>
> 
> Maxime

-- 
Regards,
Liu Ying


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDCBB0FE8E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 04:00:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD7410E1B7;
	Thu, 24 Jul 2025 02:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gyrLj3om";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012055.outbound.protection.outlook.com [52.101.66.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE1E210E1B7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 02:00:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PU3ExuA/4KO7/2BYqkuzOrv3oTuXHywyBV0pyIifDGOslbuq9hLY/nGx6yChhCfWxm3GaY5wtpWabCn6PvyAOfy4M1XkGgsG4/U8nCqh0m+B3hDxm0WVWoxI7UN4L0Vh0eY2JvnSj0lXcsSstPPq2DO8FKNeTIf9cHDu+jXGcELtv7PwKIYwmans64/5LdbWRztwZeBvUA+njJanFJJ9GPMF8FNBJqES2mqbQfNUMK1Fo8eEE7psSx5V56WAJsaCNy486Esl/OgbxWnCMblCv0fUTEbcRvnPlVp7dj4KLKyWZE0JJHMjZr98jw2WYBeHiX1NiJ0tmB1PqJ31K/KckA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXFfoZfX0QnGrX7bpzgiGylXnsLtv/LORY5BJzp1Rx8=;
 b=sQ45Ttw0SWbGkUyq7gDZoTaqDrobeSO0GW9pH9T5yTjmeqnLm003qZTcgv6yin0cPBHpieoSo3oSCvEPkTsNVldLxkaQNHR3wWPFGaf+DVcLnBoxu1cnyHfNSd0PjPqwJOSZiNt/uWSIcN4fbuukHwNyg0HM4Bxq1/WmaCB5m9mG4zq6LoROwFABYQ+Q5Bkx5bDxc5Us6+CoNgsVKY6nvqVkOMMftn/plg3HagA7lNKIZ14E1XvTrapb22VU+qLoXrCODBA6h8MuI6COFQMo60FCuvxtstFW1u9QlNXiAEAmJ1vJ3MIBcvoo2SgSU58suDpJDVisTgryYNbj0b92Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXFfoZfX0QnGrX7bpzgiGylXnsLtv/LORY5BJzp1Rx8=;
 b=gyrLj3omT0HDPy1z3H6BiNZ8Tsp0uYxYt40+Tu5+lFR1UuoTbW977+fF4c7IlcyECVESXaLvoAjaKOgrx/s8cqHubfCChMNpSuvRcNGsN7IWbpaTD+i75V+YorXw+sB5m0FrBH1Uw5xQiK572GfbvLNXK+OeHZykdAdEcgIlWk8qzMN6fkuVFvOjfJ3jlc5/bJ+OFOyzG4y1Ymd4pNZU8Z4Aoe71oXiJoB/1p004/6vxRq0D+I2OLC7w1eyP4mVGkjO6E5qnHmj8PG4bp9LmIrPuse0mQ6z3/WzL+msXN2ZKfdQTl8tKKDJ319Afpm1Gp/YwBD2r+snwtVrcWJP8pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAWPR04MB9718.eurprd04.prod.outlook.com (2603:10a6:102:381::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Thu, 24 Jul
 2025 02:00:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 02:00:04 +0000
Message-ID: <97be55dc-c274-4836-bdac-25c3d2c23d24@oss.nxp.com>
Date: Thu, 24 Jul 2025 10:01:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: Add null pointer check for ITE IT6263
To: Chenyuan Yang <chenyuan0y@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: airlied@gmail.com, andrzej.hajda@intel.com, biju.das.jz@bp.renesas.com,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org,
 lumag@kernel.org, maarten.lankhorst@linux.intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, victor.liu@nxp.com
References: <20250722204114.3340516-1-chenyuan0y@gmail.com>
 <20250723-gigantic-wrasse-of-warranty-dc70d7@houat>
 <CALGdzuoprX2Q=vwOENrmAbPbJb+XeBjQqG90YEOApSbW9uKeZg@mail.gmail.com>
From: Liu Ying <victor.liu@oss.nxp.com>
Content-Language: en-US
In-Reply-To: <CALGdzuoprX2Q=vwOENrmAbPbJb+XeBjQqG90YEOApSbW9uKeZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAWPR04MB9718:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d68a45a-22a5-4d2d-fb3c-08ddca55cde3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|19092799006|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OSsyUStHc2VwTExhL1A1cFR4UFIyTXZMbWhHdGxBZWYxcHA1UnFudmtLYk9o?=
 =?utf-8?B?eTNUZmRDQUZ4N3IzMnRKN01oK1RjT0xqWFp2QjZ2akE5MVBiWVZZd3h4N1B3?=
 =?utf-8?B?MWw1V21LMWJxOXJvZGZEZE9SN010MVJKU2VDUzdnbHZwWDYrOWdYQzBxcUZ1?=
 =?utf-8?B?eVpERUgzOTZORW1JaEpRaHRlclpLQldOTWgzOTZ6emQ1SjVOY0hYZVJOQUxR?=
 =?utf-8?B?ZkkyVFMyNUFONStpVE9CNTI3YkV3azV1ZEFhbVplY2NqSm55SjNSMDIxSU1T?=
 =?utf-8?B?Ryt4Yk4vYWtZR1paOVpRcnVrRlFkbjRPUlhxOVB2V0taeWl2TWNqdzN5QXpa?=
 =?utf-8?B?OWhuYjZmVElySXhZNFpKQmpjdTFwcm9oU0JaeFZPRXlmNGV3NDJxWGl6Tnpv?=
 =?utf-8?B?Z3I0RWhWaFFGaEgrRnIxZ0NBTWRFWmZHODFDQkJRZmhRUGhacVFRcEpGR09h?=
 =?utf-8?B?NE91R1JSMElmbWtQbGwyTVdWbFoxVGxYbGFMTWtpUUJFTVFHb3NkV2QybDhW?=
 =?utf-8?B?eDRkL2dsMEhINDNGQ0dWZTY1SjFmcGVXRFNSYmEvbnpMNEluVnVLcmY0eERy?=
 =?utf-8?B?eWt1Z2dJZGlhRzZvbHFoUHhacHVod2FNanJxdDhtdUVPQzQ4WUF6N2lyNVRC?=
 =?utf-8?B?Um02anlBQXFZYmFTTzFEc2llZlBTSm96ckpxQVpCbnNkeDJUOU5sbzkzenhC?=
 =?utf-8?B?S2xDNDMyM1dmTitQaCswYmJPUC82T0ZOeXpFTU1WWnl4NnJoZTlSSzlhc0Rp?=
 =?utf-8?B?bm5wVnAzbmF1Y2V3K0dHZE5FY0t4QmtTNitZMXVPSDVuSy94RUdMTENRaWo5?=
 =?utf-8?B?ZG9KUnZ6ZVJZUWxsZll0VmU0VWpXS21EanRsT1E1REErMklaTjJBeERFR0ZT?=
 =?utf-8?B?UFpaY1lrU3FtWmtQcVZBMDhLQ0dMMmVJQ2R3eG1SOGNRNGhTNk5RNWxjRXRU?=
 =?utf-8?B?U3RFQ3laWVhENW1MTUIvN0pGRkt5TFFDWnV1MGZTeFlneGNLRnZmMy8wTWxi?=
 =?utf-8?B?OWQxaXZla1FVZTFVQVRuS2VVZ1RnaTk3OE9UWFFZd3BIcmNYWFNpSXRRcUd1?=
 =?utf-8?B?L2tEVnhBVG1sd0RDRG9TT0FrN2NJZ1hINnpOR2xGU3ZTY29nN3pHUk8waitP?=
 =?utf-8?B?NnlCUVRDd1lBbGQ2d2xTc1ZOZzhNb2ZZc3hCMHkxcFlRRGdvUzZ1S2llaTdJ?=
 =?utf-8?B?TjFTV0FZSjZ6YlRxR1lVTmQ4TkRFS3FHZjQ2cU1OV3V2cFFHL1NJOFFEYkdV?=
 =?utf-8?B?MFlhTUtMcko3YXF6KzRxZ2xGRlY4aFpHOGhmenRYcnBVMWZWTlloMUw3YlJU?=
 =?utf-8?B?V05SOHhsRHNLQktrcWlTbmJQdHhPa09EZ3RkdFAxU1JudmVCTDB4cjd3Zmd1?=
 =?utf-8?B?bm5wRjZGaEZ1OU02em5xQlpXR25ZTVY0NmJjOGFtU3E1aW5ob1hURzFVdTV5?=
 =?utf-8?B?RkoxY2NJMVduUHliNkc5cXc2ZjdLdDdrUnRpbzZDMTFOWThJeVY1eHFUclN2?=
 =?utf-8?B?RHJ2K1VLYVA3Sy9MWjFPeDZsK2hWZjFYakdoZ2VhYkkweDZ5VzNWYTVWT2NO?=
 =?utf-8?B?dVMwNXgyMTh4bjBtdHRGUm44cjlCZmNOTWZKWi9rYWFvbFNiQ2RWNkd6NjNM?=
 =?utf-8?B?d0JYZ0M1WHNrSHRkaC9sUlFDTUQ0TmY0akt4MTFsQ2VVRXl4MTdQWnZJQjZz?=
 =?utf-8?B?KzBiZFlQWTNRU3h4MkdZcUQ4TVdWcFFkT1lmMHhTNnBwNGYxelFmc0hIUGI0?=
 =?utf-8?B?WGx2ZDY1Y0JGc2xhQVpoenMrVm9uTXdvOGlsUCs1SGlETmxueEF6L0I2aERr?=
 =?utf-8?B?dHNHTkhWRmJlSkpwdVRiaEo2MzJTMEx2dHJ0ZVVZK0Y4OG9LTnE1WHk1ZnpM?=
 =?utf-8?B?UVY1YjN2Vjh1RFBQVG5aeWNoSzh4clVwTjlwWjRYL1crbFBNTmhLcG1aYUlh?=
 =?utf-8?Q?yAZYj9hWiXI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(19092799006)(7416014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djcvWGdLbHNpeVdXUFBZMzFSaHN2R1RvMk5DTHRZWTRQcnlVT0lQWFJKbmJq?=
 =?utf-8?B?T2I4Q2M4SE5Mc2RPSTdzRGNWcXQyZ1RCQm5GdzN6VGg4c3hKcml0K0R0YWJN?=
 =?utf-8?B?WXJLdnlBeTNWWUFpOUEyTElpQy9PeWxsSTREYkxtaSsyK2FmdXFhTlVKdUZT?=
 =?utf-8?B?c3QrQVIzNGU1TFZFa1Y0VDBUMGN2Y0dkSTNlU0hGS1Y5KzZxL2R0Rnd2Vi8r?=
 =?utf-8?B?MGI0b05zeXlXbDErb1YzL2Rya1Q0cGFaQUM1YUozMnYxNXFjTVdjNm1lUWtI?=
 =?utf-8?B?WXhpZVUxY1djdWNmWS9PeEpMc3hPNng2WForSGI1dkVTOW0rSDBaRWlhNVBP?=
 =?utf-8?B?MisrUk8wcm5LS3FWM1FVbE8rSkZyQ0JyTy9VS1M0Zm5hZDlSWTQvcjBFTWJP?=
 =?utf-8?B?SHZ5dzV6emw0Y2d1V0YwUStBeFdHVTBMN2JKMzFWakNBZlpRS1VSTmZURlJC?=
 =?utf-8?B?MWNXRWUxQ0ZLMFVYbGRnUUhqQUF4dUo4Umh6b3RyUnhLL2dFREo0dlE4Wnl0?=
 =?utf-8?B?SHEzdnR6bDlZME1aNTB4Q1l3Zm00Z3FkVG9rVWpnSGV3UWQzTTlFLzRjSmpr?=
 =?utf-8?B?TUhjTkIwZ1lEWWV5a1dqUmJpZG9ib1BkM2szY3lzK2g0TlgwcU9jOUo2ajdh?=
 =?utf-8?B?aWErQVg5ZmIramhxWG53VFJHU0hUZG5Ca1I5dUdIcWdHM211VkRUZWNrUk91?=
 =?utf-8?B?YjRwWVB6ZnpzRWNZR0wwUFlQWkNUYVZteXJ0anAyOEJiVjFwQlNLemdKMUtO?=
 =?utf-8?B?WFJkYW8wY0pLY3FMZFBBUXBod1p0SG96bXBXdUVFN1ZiQ3YwZzNtdEk1YWFq?=
 =?utf-8?B?QzhleTNaM0h2WXBDdDlkV2pGL3ZuYWdFRS84bURlSmlPVDMzcExEU0VpUlZ2?=
 =?utf-8?B?MUU3TU9ZTHJNQm9nN29qMGZIVlJCdWtRR3IwWlJMSnV0SkJzY1ErejA1TWdr?=
 =?utf-8?B?U1F6b0x4OGQ4Z3cyU25TZHkyWEVGUklvaUtLdDRBejNRVmtac1hudG9MeElm?=
 =?utf-8?B?cjdFTVdFQVRLbXB4eWVocnl5Vm0xVkRxU2MrMG5JMk40T1NIRlo2VW5ROGx5?=
 =?utf-8?B?TkdHeS9zdVVPV0tJZjkwdGk2aGVlOG5TeHo1V2QxM0ZnOVdlUnBMU0pxZUJH?=
 =?utf-8?B?aWF4akFYNmZ6VnN0Mks3ZVQxM2hhWEtiUHBvWmVTS1Npc3FkTFJ6RVNlYzl3?=
 =?utf-8?B?ZVJhMUNURGRwYUtVdURPc0lrNXBnRnFMOUNtYkJjUXNac3dZWmlOeFJUV0V5?=
 =?utf-8?B?b0NrcjRKblVHb3krdTBxM3QxTUN6d285aVRFQU5RcWw0aElRYXR2dFhYRG1z?=
 =?utf-8?B?dkQzQ2lJV3gwN0QxZld1RWhxV29OOFpoWnNMWDJabWFCRDFaMmpWTDFlRndS?=
 =?utf-8?B?Z3JiMDhUbWZyc0VxNVVobTlZcnNSUStmN1lxdjFvaktqMnpXb0tsMXZlenF3?=
 =?utf-8?B?RVpFMWpuVzRtemJycyt5US9ZZDBVbzlVWU9lWTJUUUVMdk5FRkdqTVcrUlk2?=
 =?utf-8?B?akVMNVp0NnBoVyt2NUw1LzNHcmsybTJDV1BGM25qYlI5Zit2K3Nib1U4QnZs?=
 =?utf-8?B?MXFQbHdSSTZ4dDBuOHBYZ1lrTUFjdGYzWFNDSjJTQ0hsL01kVlhDWlJMYzNS?=
 =?utf-8?B?aDBscm91c1NWclZpUGNZbEV5c3dQdyt0dktDOU9lTE5Ba1FhQkRsWkwramhP?=
 =?utf-8?B?NkxPRW5EK05URUNZaitJVzJzeXVnMVJMUE1oeWtKMXk4clNQZnZseTJiUXgv?=
 =?utf-8?B?VERXWGp5M0N6ZWQ2dEZ2T0hXdlg0SEFwVWZXMC9oZFVSSUFJNGNxWWgyVjRm?=
 =?utf-8?B?ZjlCVGZ2TTcrZ1pPbFJ5T2NDVDk4QllRcTZRaDdudGozdlEreXh2bXo0MS9S?=
 =?utf-8?B?SEZiZjdyTDUxUXEvOStDVUNhTGhIdFBlUFFVQ0RZU21WT3hHaW8wSzI4amF3?=
 =?utf-8?B?bG5PSHBzeHhzQTFZNTI3eXpDS3dLZjVsMGd1TnRFVWtnT1pmZmc4WEQ0UlpX?=
 =?utf-8?B?b0x2M3VROFBGQkJjZS93TmVrLzNSY2lyNVZJM3VSMWlVSnZIeUpZb1RsdUlE?=
 =?utf-8?B?ajVGcElkVEtGSnZydUNRanY0MG9SLysrcER2VVJ1R0J3dU41YzUxYU1GUnM5?=
 =?utf-8?Q?HGWMxkT5+OEKTPJDA9nYll7pS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d68a45a-22a5-4d2d-fb3c-08ddca55cde3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 02:00:04.2536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cUipayToNPcHzGg6w0U0RZJd3ZVSBIsJgC6d8LG0f4zvJZc8kbZ66j7yMc18wDDDd5YKP+r3q5cJZh6woxfD2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9718
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

Hi Chenyuan,

On 07/23/2025, Chenyuan Yang wrote:
> On Tue, Jul 22, 2025 at 23:57 Maxime Ripard <mripard@kernel.org> wrote:
> 
>> On Tue, Jul 22, 2025 at 03:41:14PM -0500, Chenyuan Yang wrote:
>>> drm_atomic_get_new_connector_for_encoder and
>>> drm_atomic_get_new_connector_state could return Null.
>>
>> They can, but not in that scenario. atomic_enable will never be called
>> if either would return NULL.
>>
>> In which situation did you trigger this bug?
> 
> 
> This is found by our static analysis tool based on the fact that
> drm_atomic_get_new_connector_state() could return NULL. We also noticed
> that under the same dir, ITE IT6505 transmitter has such checks. Thus, we
> assume it would be good to have similar checks here.

You need to properly triage the tool's report, which means if there is
no real case that could produce those NULL pointers, then the report
should be false-positive, otherwise show us any real case that could in
commit message.  Assuming the checks are needed is not good enough.
Please do your home work before sending the patch.

> 
> 
>>> Thus, add the null pointer check for them with a similar format with
>>> it6505_bridge_atomic_enable in ITE IT6505.
>>>
>>> Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
>>> Fixes: 049723628716 ("drm/bridge: Add ITE IT6263 LVDS to HDMI converter")
>>> ---
>>>  drivers/gpu/drm/bridge/ite-it6263.c | 15 ++++++++++++++-
>>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c
>> b/drivers/gpu/drm/bridge/ite-it6263.c
>>> index a3a63a977b0a..3a20b2088bf9 100644
>>> --- a/drivers/gpu/drm/bridge/ite-it6263.c
>>> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
>>> @@ -590,15 +590,28 @@ static void it6263_bridge_atomic_enable(struct
>> drm_bridge *bridge,
>>>       struct drm_connector *connector;
>>>       bool is_stable = false;
>>>       struct drm_crtc *crtc;
>>> +     struct drm_connector_state *conn_state;
>>>       unsigned int val;
>>>       bool pclk_high;
>>>       int i, ret;
>>>
>>>       connector = drm_atomic_get_new_connector_for_encoder(state,
>>>
>> bridge->encoder);
>>> -     crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
>>> +     if (WARN_ON(!connector))
>>> +             return;
>>> +
>>> +     conn_state = drm_atomic_get_new_connector_state(state, connector);
>>> +     if (WARN_ON(!conn_state))
>>> +             return;
>>> +
>>> +     crtc = conn_state->crtc;
>>>       crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>>> +     if (WARN_ON(!crtc_state))
>>> +             return;
>>> +
>>>       mode = &crtc_state->adjusted_mode;
>>> +     if (WARN_ON(!mode))
>>> +             return;
>>
>> And that condition can never be true.
>>
>> Maxime
>>
> 


-- 
Regards,
Liu Ying

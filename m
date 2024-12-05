Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4771C9E504D
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 09:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A6D10EDF6;
	Thu,  5 Dec 2024 08:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="BTH7NY9Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D758E10EDF6
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 08:53:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HGUT8XMdP2IOQujnJo6aURmXwjL01DVcUPaDPqRYumYxbW25y+yI+BOIvI5NRV7pzfOEULjjt55CPorX/N88WdawAtwlje9/gdb7wi8zAPdT2hU/lPuUAoTH5x7sSs/tIF7Yy1wyp9nYHlBfOZwn2e59xSgaWXlCp8uRK8/efWws8g4MH4biRhK428yVDkrZ5u2p+hlCuYwqumly3dx4F3dShqQKlW7U9IA3HepPdhK7XZwBX9+UmuwfdmZ7MqoJHAxyTxgHnMJeCO2QZTn/3OMMealpGsfOtItbgAZ6xc8NEjqpkt5klrrm+UExTXeKyGoJs9eT6NYNhXrCyGr5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=scdHSqXIUvOFqkWkxN6z0+RxF/Hug1fJSxsH4RJnAaw=;
 b=vHjAYFhI05XwuVLShIwvshx7mn8Awqjg6wP18dZdWLFsHrpZWlqKJRSIZ9F4JEL4vuUUqwhVFqkQ9cZ2p3lGWy0gVch2xdc5ANn32D5VezGe0qzMpe2ABnuyqvVqSi7oYmCUAsA6foLjPpFw8Cd3tTHWMPnySJxMC/TuXJpG1EqzJwtCu/qusTiDF48LsZayU9Plc7QBz8jQ0j1q+8ZLOZivmRL2uYBYd98aHVSf9hvA2hEp6YqI+0GAQYfjGDHDOhFv6hu69JeFNG7Dh1regnelXA/eAagtE6do3bPKtHBIHdLLyec8y+ECTTqx0yWHGoHaQre3MByL29YwikQnAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=scdHSqXIUvOFqkWkxN6z0+RxF/Hug1fJSxsH4RJnAaw=;
 b=BTH7NY9ZL1Mi3c1MimJwQ/Ba8mib5dQNir1/cWQpRPlb2C83cCBwu9PhSIO4ap5jRwVi5APdHV6BoIAapOY+cGkonirGiKCUavjbhodb25d+hHH/yvgulDGxlxg4UiFq7rNgz//WVObyqfrnby0+mnHvEVoJhQaJf/tEB50SbxvrD2vvccEoEzaYYR5SrHv8IcR8qsE+jDTya9FLctwzvsfzI1+HvVtkVD6PkFVTVURD4+t9OyN0jri4pwq0fijub9zAnndrzpQMrzkzE5BQc9sa7IGZ0q3F31b+mgbadF5lgTpSrDAPp+3OnUc2WmkNKnaO6jqBmKeZlknm1Ve5kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9473.eurprd04.prod.outlook.com (2603:10a6:10:369::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 08:53:35 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8230.010; Thu, 5 Dec 2024
 08:53:35 +0000
Message-ID: <3bab95ae-ba66-4aed-9cce-13498f2f50e6@nxp.com>
Date: Thu, 5 Dec 2024 16:54:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bridge: ite-it6263: Support VESA-24 input format
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <20241205080210.1285385-1-tommaso.merciai.xr@bp.renesas.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241205080210.1285385-1-tommaso.merciai.xr@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0194.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB9473:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fbb54e6-fa95-4510-b48a-08dd150a4d6f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1NyNzA1T1hwOG90TVdKM1lSVUZqbThQUS9Ja29IMnRFSGlGU3pEV2dublNt?=
 =?utf-8?B?WSt4dHFTTkZrUEx0RkdVcENJWG5iQ3dYTkdBRW44RFNZY1VVWk1VUnhZR1BL?=
 =?utf-8?B?UzI5cmtEaldha1Zhclh2Wm1qNkJTUkNXb21PaWxOQjVmbys5ejQwTk8rbExi?=
 =?utf-8?B?a2NZbDhPWVhFQ0xOU2RkWVJmdDBDUmdadStOTmJNcVk2b0xZMUJFMVRmYno5?=
 =?utf-8?B?clpzcFdhRUZPdkFRcTArWTBNY2dLankxZ094TWVuT1RJbWhJS0xFV1I2dVB1?=
 =?utf-8?B?NkFVS2FMUlFETnJIN0J0Mk11MExWK1BDelZ5d3J6c1g5akdOQWxIYlE0ZmRn?=
 =?utf-8?B?SGEwQnY4dXF6YlRLL0Z1UHlEVE1BZVBvekR0YXBiUS9QYXBXRjFBMU4vSUVV?=
 =?utf-8?B?ZlhJYU01N3pQOXhrakVaSmZxS3pQdWNidlNWcjhxNGxMZ0RRL1dhQTJ2WDJC?=
 =?utf-8?B?YzZ1VHZPSE1zZmdJM24vdVhJcnc3cFBiQkp6ejZXUURTVnZxeE4yNHVaNkhD?=
 =?utf-8?B?aENwNExzK1RsUStVK3NTd2lPaVRqNEFEZUpXaGFkbVJ6L09IY0RpV3dCL1dV?=
 =?utf-8?B?TDc3SWk4OS9FdSt2OGJvampNYTlwdlp6T3hNb2txY1RYQ2RzKytBdFZEcW9K?=
 =?utf-8?B?SHdKSUxVWTNSbFFFb0JrL0l6bUJGMmlPaTNQWEpGQ3Y3Zms5djIwdTkzRVRY?=
 =?utf-8?B?MkJuaWFac3hLbGJPRWxyNG04NGh3YnRmNEtPTTNoNmVjNGxsZitJVTBKQzFJ?=
 =?utf-8?B?VVJJVnNRZjJ2K1djSnBSb2xlb0NGWUZuOUZmNC9IUFE3MlRiODFPdHZYUVh4?=
 =?utf-8?B?UFd5OWVwMWUraURvQzYxdVB2N1J1eEtUTytlcnpFRWVHYWJ4NUZ2bmF5WWVN?=
 =?utf-8?B?N08rQUpNaHVucnNCZGp0YVgwVElGbi8vZCtOU3BZWlcwd2FmTVJhaVNub1h5?=
 =?utf-8?B?MmRVRVA4TnNER29ORzBmakwranpOSFlOZWprck5aYlNKSzB5RmQ5SEd2Wkpy?=
 =?utf-8?B?dFdDQkxYR2VKSFYvRlNMTVN1RXpzZENhVmUvUlhSRVdOY3hDRHlMWE9oZ3NM?=
 =?utf-8?B?Tlo4MlliMEdBN3lUY3ZDSEFGOFZlN213VG5ZT1RFV2RJbHgyZDlqUE5GaWUy?=
 =?utf-8?B?N2dvRXFuYVZyZ0E4S0FkaVRFT2xNWThFNS94Nlpzb01qNUttZGV1aVdKL3d1?=
 =?utf-8?B?d0toNVZMNTlTck56WElzdmRMb0dGZ25IL2JLVHkzelpkdnNwbGkvN2hXczRj?=
 =?utf-8?B?Q0VIZEdJaVNvdmRPQ3BxOWNZZGpPa3ZIVTlvdklWSDkvZTBVeWd2UHI2QWZ4?=
 =?utf-8?B?dEc2eW5IUFAzVnVkNzBQeVZaV3dGVGpuY0lwNFRVbmFKWFlpNG1uVEx3aXBE?=
 =?utf-8?B?dnFqQkNnYVZkUjhQVElodUZpZFZJbDlpeFNwZnJUQytZZ2IycnNyc1hGWnFO?=
 =?utf-8?B?ZkhYeDVvdUo4SnhFcmxaZU8vQVVwcnMwNzJTUVl2Qk9ZZ2JsRGlTT0ZpRVRK?=
 =?utf-8?B?RGYzNWhoYjFYeWdiRTErSWhSSWVGbllZaUNQQ3cwNm1NdTc0ZWpMdGN5OU1p?=
 =?utf-8?B?UGFOSGdiZzd0OVBndHB1emtic0U1UXhyY2FZcjBLZTR3QXFFUVNlRWoxTGNr?=
 =?utf-8?B?b3hxcEhxQm0ycnM1VFhjNDZnbDRVd1Jhd1NYYnhkNlhzV2J5aXVoVUhKYXdz?=
 =?utf-8?B?U1VUTWs4UnZ6OUc2OUhOY3R1OWRDQWpzUDlJbkJXVDNkKzBPUWMxTTBZZG1o?=
 =?utf-8?B?eGZ4dkF5M0NNTjdoRHdlK0IrZU54aVhSbCt4dnFaMlhoUGZyK1l0ODZCcFVz?=
 =?utf-8?B?bEJxTDhJbHBUak5iMmVxUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tm9DaE5wT094WndWSWtlMmx0dEpHWmg2K1piWEZMYzllaXh4ZFo5dzY4YlE2?=
 =?utf-8?B?djBxM0pBYUdKQ3lQaXRNOWJseUxFMG00dmliSEwzNFg3bGdNcGVBS1JxVjd4?=
 =?utf-8?B?aTBNMm9lQWlCekx2d1VaUm94bFFkOVlRaTlid2JtV21IZ0xERVhibEZ6WGpj?=
 =?utf-8?B?NmVOR0gwZEZVeldUdWliL2U3R1pFS1o4MGN5VEIybDlEdDBiVUZ0OThSQnJp?=
 =?utf-8?B?WE1Hc1RXOENtL0hSaHl6ZzVqakRBallOUE9rWGJwTkJWV2FUVlQzeHVtWTZ3?=
 =?utf-8?B?Mkl0bEwydnRIaG4vSkhpaGJDWTBlNGplaVNpQ3Q2Y2l2ZUc5OGRROFROQlB6?=
 =?utf-8?B?UEVEcUZtMTRqS3FDeHlLSC94U21PaTRBMEZpaGE5KytNc1RxNTEwellxRi8x?=
 =?utf-8?B?Z21JbmRWeUJmRjY3Q1ZZWEoxMGxjSERuMFV4SmU4aC9LM2tLZlAwcTlWcEFS?=
 =?utf-8?B?aWppWGNINXlCNlROK3dvZXVoTE1NQ1F3L293Smhxa1RESjE4M2xIazRpb2ha?=
 =?utf-8?B?RFJJbjVIQ1NnN1E1NjdGRDk0T1hlblY5LzRPK2ovdGl0MzRoUjNlY1VNMm1C?=
 =?utf-8?B?bnZzSlY2aHlSd3lDcDEvL2EycXJHTENXVGVhWUZaOGNmY1NvRTRZcm5tOG9r?=
 =?utf-8?B?bkRwWndpWkI3WlV4dEtpK28xdDljTWc4cURmWk01QVRoeXArc2JWQm82RUVw?=
 =?utf-8?B?WVQ1Qk8zY3NuMjhpOFd0MzYrTFI1L0NJbkJhVjVnTHY2ditlQisxdXoxeW9k?=
 =?utf-8?B?MTFWMytZOU9UOFplZjdUSXlVRCtkb1k2eG1vUjgzZkdVVENWd2NCZmJpc253?=
 =?utf-8?B?NW9tTlB3T2w3OStoRnFidTg4cVJxYzJuWmMxd3A2NjZMQlQxS2xBWkt1T0xr?=
 =?utf-8?B?ZGhRY3RnVUo0VVh0Ni9pWVhDdUY0WFY5NmdWSGlkNU1zMHpVeDVCQ01BbXA3?=
 =?utf-8?B?Q2c3NHM5em8yeUdEdWhkMFNBSzNMN09FaGM2Y2Z4eFA4dzdoZWZ1ZnpmSGRB?=
 =?utf-8?B?RmNoV3Roa3B2cHZ6bkx1Um96T2xnS0NJRG1BUWRxc0FhSndJMklrdEsrV2do?=
 =?utf-8?B?YUlydG1CR2V3S0lGQ1lKSENTbWVyQ201TUR5NjhvZHZ4VTRub0FseUZVR3Q4?=
 =?utf-8?B?WHhvL3J6YjdWSzJlTXdIOGhhUHdiQ1pOMkZZYnk0TjNGL1dMbThxUzRHSy9O?=
 =?utf-8?B?aXM0UFVLMStlRWNlM2ttYTB6WE9rZ0o2YVZnSERZeHd5RnduMWorNnZYUFdl?=
 =?utf-8?B?Nmh1Ui9ObXV1NW5mbCtvR0UvN1A3R3VtL1lpSWRXYlgzNG1RUmMvY243empy?=
 =?utf-8?B?ZHE2VXlOSzhlSDl1QWd6a3h0VjFhZGNRdy9rZEtwSE1LMW9BOG1GZmdsYVlG?=
 =?utf-8?B?OG0ybENEZkpVbHVrdGxRTEZ0dW5KazBJbFZzZVZ1YjZPRUliWnE1WDhIQkxX?=
 =?utf-8?B?N21GRkI3THRib3kzUmdHRE0waDVvTnJmQVovVUUwOXY1c1Y2ZGxrMU1OV1dn?=
 =?utf-8?B?YjFobTcwVldCVk9LNU1vTm10K2RoS01yUFZZQjJtZk50R0dlTU1Ed2sxcWZN?=
 =?utf-8?B?Y3lPSTNEYUJjWmp6d01wM0dxSEZvUVBXWUtSQVRFWk1GdkNaSGNEQ2JjaWFJ?=
 =?utf-8?B?UmRxQkx1Z0JMSlZDT3lGNi8zUkpOSlhBbVVyT1RjWm0rbnRiY2cwYytJMzJG?=
 =?utf-8?B?c3ZBbGhFOEFaWnRFa3hjeHA2QzlXT2ZnL2pCWGxHZFpSVmI0a1R5VnhXTElF?=
 =?utf-8?B?Y3pRMGtOb0FNeGZOYldheXhLbkVEbFFUZk1JQ1pyM0I2NUZhTXg5Unh4MG16?=
 =?utf-8?B?WXBXZWZMU2tKT0tmWFI4ZUFNZ2x1T0dWbTBjd1pxQ3NYb3VVZnpMSS9aREtC?=
 =?utf-8?B?WFJmU2hMT0xxZHBLV0JQU2poNmg5cGp3ZVljaHE2OVBZWHRaazVSbFhvVGMy?=
 =?utf-8?B?Tlp6UDNOOFNHWTgxZ29xaHBZNjR0UzFIaHIyWVZYUGh4emp4VFEvYUdlTVdL?=
 =?utf-8?B?NkZJcmFkbGsxN25ZaCtrMm1XTTNFZi96UTVNcE1Tc0tVQThhTU5HYUZPcml3?=
 =?utf-8?B?T1FDUFpBamx1Rm9kUFRybnBuczBtT2d6TlJ1eUZIdThqamsxWi9pNXNaNllz?=
 =?utf-8?Q?Ny98jodmDUBl76dk6MTT6knRz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbb54e6-fa95-4510-b48a-08dd150a4d6f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 08:53:35.2749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /or5P8G/rGI+VWrBWl6oGeHW9X0Apy9DNk++9D8guE7G6ls9HMxiGz7+5UxB7HQPWK11/yYhZh1hTeM++mMOFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9473
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

On 12/05/2024, tomm.merciai@gmail.com wrote:
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> 
> Introduce it6263_is_input_bus_fmt_valid() and refactor the
> it6263_bridge_atomic_get_input_bus_fmts() function to support VESA-24
> format by selecting the LVDS input format based on the LVDS data mapping
> and thereby support both JEIDA-24 and VESA-24 input formats.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> Changes since v1:
>  - Inline it6263_is_input_bus_fmt_valid() as suggested by LYing
>  - Fixed it6263_is_input_bus_fmt_valid() param from u32 to int as suggested by LYing
>  - Fixed commit msg as suggested by LYing
>  - Fixed commit body as suggested by LYing
>  - Collected DBaryshkov tag
> 
>  drivers/gpu/drm/bridge/ite-it6263.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>

Since I have no drm-misc push right, Neil, Robert, Laurent or
Dmitry, can you help push this?  Ofc, no rush. It's fine to wait
for a period of time for potential comments.

-- 
Regards,
Liu Ying


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8554AC43023
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 17:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF78910E10B;
	Sat,  8 Nov 2025 16:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11023123.outbound.protection.outlook.com [52.101.127.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E9F10E10B
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 16:53:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tiNw0OHUDx8LmVDGGU56yHkHkwE2gdrjdn9TJIWnN6nORuj//HGcbSkalK+hK1aY7q91l70lTxqmhZfeZFspUJP/YaKZCsA/KOEAvTlxGer69dqUZQcpor533Yut8mhWrSVV8J4RT3RQTueb2VoayOwxLdRsIWAFMMGUDrYLCZPkwQDKqyUeTJY+bQRMu2v6nt03iaCGfyCYGkI0cDZRZWEQtMvanDnGLG1OEHzKHHvXbkNTO4W1S0sm4wrxlQ1U+oxG+BIuy2Gz58EOY449uVSnjemLmUzBIAoODWQ6toaq8rODISZTdLnWpZR3CLZvPkq+Y0/k1NItyzZHUdRgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXmKLlrPXXAjRcz26NAezpUlMFhqM0e9L1ZGBb6T6sY=;
 b=IGQkBEeJJpbH8V3RrAcKcX8gdAytDSiNejTbCVWTkp7Wp202UqoT3ah0VPW4PdNzPAtniHazI0gUj7IUVOoWD5A/zwGgwW0pJZ+eNrLEwFLAU9aW9usRMicZoX/brqetgm2hdckNr+VUTZYdVVgzFvwaYtVirAhIN19oX2uaLCH6ApFwTNRe3u4oshcu6Zv7xnu/FWTeaXvl7VGIa/xUQSFCDr9+TnzkpNDnXxmDeANJjKhUHIzei9lEBOlSwjWlG+Z20Lm9ygIGBpu70D+hkqokxm4zrhZXznW1CAjqv8SP2mF0HptDYSNGVGT3gv2GvVjFIiQa6BczADKGzHA31w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by KUXPR06MB7997.apcprd06.prod.outlook.com (2603:1096:d10:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Sat, 8 Nov
 2025 16:53:51 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565%6]) with mapi id 15.20.9275.013; Sat, 8 Nov 2025
 16:53:48 +0000
Message-ID: <9e8784a2-7ab7-4b68-b928-b4f9e0e224c0@linumiz.com>
Date: Sat, 8 Nov 2025 17:53:27 +0100
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/5] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
To: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>,
 Paul Kocialkowski <paulk@sys-base.io>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::30) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|KUXPR06MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: bfed7b80-69bc-497b-4e69-08de1ee7631e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVJwTnhROHBDTGMxbUVZTXJCUGNGUU9sOG0zUzJaK2tJZFM3OXpORThBSklW?=
 =?utf-8?B?aWFSVHZieW00ck41ajNRUXN6TTdOK3RDUTN4TlorMVJBbTF5OTlaS0lBZU5l?=
 =?utf-8?B?K05CT3hxdWpqeWlySTN3TDZXWXFLcWlQeW1uUEFmeDZseVNIL1lkbkxZaG1w?=
 =?utf-8?B?eWtjMTFVcEs3RVZ3K3QybUZFcS9HOVFFMHdTMkFGTjVnVmdOWG10U1dmeDNj?=
 =?utf-8?B?bmM1VjM5U0NUYWdpeVoreXNxVlU1UlFOOHdJbjczaFRCSkFqTmQ2dVB6R0JN?=
 =?utf-8?B?a09kakREWEE3dlpIVFpnM2pjbmh5eSt6QnRybDRGcCtoejBzdzU0RUh2b0h4?=
 =?utf-8?B?WS9wMDdRTk1VQjhZaTFmT2M0bGpxYk9uKzlXQmpka2VtZWdONlVCRWlpMitZ?=
 =?utf-8?B?dm1GVEY3dkppWUY3a1ZRQTcvUGFDZk9PaTB5SUlUQjdIZEl3cVpXdW9kS2Zw?=
 =?utf-8?B?ankxbG4wM00wNkFKcXNkdG1UaGVzaUE1Tld0ekd5MVRCL2Zlay9hY014M1o2?=
 =?utf-8?B?QlN5NEJ5cTR6RSt1bWljYzdpWjd4aFRMYkIvbDJHTWRHb2VSZUVzanROeENC?=
 =?utf-8?B?cjZobXhjTktOTDliWGtzUWlKV0ZpU24vTFZtNFc4dEFBZjJoYyt3QlNXTHMx?=
 =?utf-8?B?MmZ0eUpTY3c0cllVc2kzbFRBdHNxSXdwZFJFU2x0NVFVTkl6V0lvRUJDRVlK?=
 =?utf-8?B?cHpNMFBMVlFQZDBrUVZidm9ERVg3SHlPcy9HMFlBUFNYbGNScUgwc3cvRDRu?=
 =?utf-8?B?Y215VllSSUpOb3FBNTdVZlBSVTN0Wi84aFZrRWMvMFpPYjQvY2hpbkFYLzUv?=
 =?utf-8?B?c1ZSTkdQQ0MyT0xGbCtGTFdhSUQwb1B1Ni9icTVYUjZWdUdKZnE2L3NZUDdF?=
 =?utf-8?B?WWY5MkdXcHhYU3JobEVhSzllQnhDWkFaejRyaU51dUZOeVRZakpnL1FxeGxN?=
 =?utf-8?B?SldZQXp4L2xGdlp4RlVrZWplSTJXdU41QU5Qa0I2dDEwZVNPbnpZMHRsd2da?=
 =?utf-8?B?Zk5XeEJUMExaY0lVN2oxWktxV0YzZGxQaStyamFSL0JqT2VnbnlreXBpRHdk?=
 =?utf-8?B?a0FjODFNQmFUdDlrZHZjNkFRckU0OGFxU1FYU09qdTJkRHJoOVJ1VVlxWjZz?=
 =?utf-8?B?M2hVblIwQU8yblV5T01VN0xvdFNFeFE0L20vL2lXZys1NGxMUlJvdFdyMkxD?=
 =?utf-8?B?ZGFKUUVtdkF2N0lsUERaa2xaNjRDbGZuOVBjUnZkdSt3TWhabW13aE4yNWRa?=
 =?utf-8?B?TGx0WTlrdXl6OXkzTW9zNHJtdVd3bW84dmJldzNFN0d2ZEdVbStqWUw2Y1NQ?=
 =?utf-8?B?aWRLYnpOU1BkQnhJdTdzN3lQd2JRRTFCTEdYNE9paDVJV2VjOVVjRWtoZjBH?=
 =?utf-8?B?cXY1UnV6YTZTYlhMam84a1k2RmVUQ0xzYUwwcXNqMDg3MGxOa3krSUFRV1Fr?=
 =?utf-8?B?N1VXL1ZuR2RNZGRFL2hXOFQybnZpVDNzeUd6N0VzczlPOFdHaDBmRk1FVFV0?=
 =?utf-8?B?SndWNmExNlRGV3FweWxuOFlSQ3R0WmhpdmhpMzA1VEhHcUhYblZuQUp2VWhZ?=
 =?utf-8?B?VGY5SHhxcVU1dmVscHExcEtNVFE4NVJwSzUwcEVqZ0VldHhMRDAyWW9XRWZL?=
 =?utf-8?B?aWxZY0lWNWVQc3N3ZGJIMFZQWmVabjR5NmZUM1psbjYwM3BqV0hieTJDT2tu?=
 =?utf-8?B?THZXUHp4N3VvVXFUajNOSVhveDZWOGdyNDVwR2lVbHhHcnZYMXRtQXRXOUxu?=
 =?utf-8?B?SGRvdzJVcmNZS0JjZmt5bWZER1NEbFhic3lqelNXeWFjekZ6YVovai90czlY?=
 =?utf-8?B?VDdoQzlRU1AvWXB6K0JWckhNckpqcHJvUkl2RXhHNks5QlFkaTJHbVhlekhy?=
 =?utf-8?B?ajV3WU9mTEhEVXlxMWRxb0ZkdktnaE9aU3NiYUE2MHhIeGhxWTRuV24vbDRD?=
 =?utf-8?Q?8Srq2Qy/UT87aakVwS0QQX9eknak+OpK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB6935.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1E5R2tzcEdwZURHOWRneVBQMXRmakF6KzVaMFpyK3B0bnQvem1uUTVBZ2gv?=
 =?utf-8?B?SXRkOXZraXBqNTg5cGRBWU83Qm93NnArbUNsSzFIWVhxN0RNcmZlK3lFS2t3?=
 =?utf-8?B?WmRNaHNBV2Naek9uOFVFSWxjbWlFbjhBYm9uUWU3ZlRFYmYrOUxhWVlnU3RV?=
 =?utf-8?B?TlVOWnFxblFiS1BXL3NMdHhXVGVSbnhlSjBpTGR5SmdrTVJna292UmtzREh5?=
 =?utf-8?B?SFVMRW9lMUZFVitVdWtyQmFUaWxCN0RFSXJWNnFTMU1nQ25RaUR4OGZtRjM4?=
 =?utf-8?B?eWhPWkZ1ZGhCVVNQWm9GdHlCZ2tzRy9jMDM1U2Z3TjZ3UUpjS2FabWFlbVZm?=
 =?utf-8?B?cU9YOFZXSEE1NTg3ZzJjcFR0NzkyRkxaeWVsdjZIemRTcE5iOXBnSVJsbndj?=
 =?utf-8?B?bWFxQW9FdUFVb2V5VFJObEZ0UGZHZUZiOE0xR0JxMXVFSUhMRi9EcDMvWFlD?=
 =?utf-8?B?TXhscUtLTHEvREJWaEFZbGxoY1ZEZWp1Vjlzamk2a0RyK0pFYU9vS2F0Ymhh?=
 =?utf-8?B?OEpOWDBvMG5MMDhyODAyM3BGdFVvaUllcDgyV2NWWkRtUDF5d3FuUGtGQ3pY?=
 =?utf-8?B?bjZjSzkzODRqejFMdEF0N0dQTHVQdjhHTUU4K3daWnpHVThucVBvVzd1NGVK?=
 =?utf-8?B?WVZnQ0JXNHpVNldlenpRQWYycFlvT2l0d2pTTWZEaHFFU0wvWlBwTC8rbWlu?=
 =?utf-8?B?cnFUYWo3MERsZERSVkxKcHJvZXpMNnVicXFPQTEwZXlaaTZrSUFCc0pNQlZM?=
 =?utf-8?B?SHVMMjhRd204NStOY3BVSHFhSmJkaHdTbTdUT2RSRGo5d3E3YnNLdGZWWkV3?=
 =?utf-8?B?ajYzcm5MaDN0L1J5NEZIK3FSUE9YeU9NU2xYaUExS0R1bjZsSGRZd3BXMDFW?=
 =?utf-8?B?NzI0Z2Y1dEJJMHNIbDd3RkZMNE1kcW9hdk9uM0ZIVnNmK2d3b3ZCVXozZlZv?=
 =?utf-8?B?M1lpYlBQNG5CNlRvYjJDSnEzWUFmbEQ2TGp1VldicjdkQyt1VU04eWNzbW5v?=
 =?utf-8?B?UzdoRVh1OWxhV2s2V0xJOVkyUXhaaGM0R3pmRUR6RVY3bnJ0S1ZKNkhPK0Yv?=
 =?utf-8?B?ZTFQUSthU0hIeGF5Uno5d0lEclB1TEU1ZG9mZFl0ZmVxNGdNaHhnRUJGUmZZ?=
 =?utf-8?B?cXFheG8zQmtYWHN2VTFXYm85VjFTdURkeW41SjdoVDRjNUNVV0NvNkUxVFcw?=
 =?utf-8?B?NDd1dHlFK0YyK2hBNHlqeWRwYXhzam10a1RqUlYyQnBsTC94eFFzVW80ZmVn?=
 =?utf-8?B?QjQ1Z05DSGlubkFHNGp3S1M0L0Jyd1VXRDlYaVZNQkNpTXpoTmlLNDdZVGpt?=
 =?utf-8?B?N1lFUE0zdkZ1QTVONEw4SjRjZ1krZXJ1UVBZZXpiMHdWWFNFNlBUM0xHVXlS?=
 =?utf-8?B?U3hZUHkzTGUrR0x0RWFHMWtxa0t5bE5CSkc5TDFBNnhOOHpXVmVUSGhjTHVq?=
 =?utf-8?B?NGhrYlVjbGlmNlp1QnhOQlNTQTVUTDlDRFhRZFZSc0d6MUhVT0FFcjBKVmZV?=
 =?utf-8?B?Y1VGR3RPV2ZPVWRBdFdtY01sUFRNeWp2WS9IV1NqYkNJOWdaemZpWlpzaVE1?=
 =?utf-8?B?MmE1dUE2YWF0dTlsdENXNDJaY0JuMGRVWTYrbHd5Y3pPWGRmSldqTmFZNHVW?=
 =?utf-8?B?TGYwSU1IVVltejNwUGVJRTBlRDhBV0xaeW9jRDRmOGhaV3IxaWw0Y2ZYdC9X?=
 =?utf-8?B?K1hJWnl1ZjhaRHNZK3BHQmhWUHdFWVJXZk4wRThXamhYdGp6eU9aUjhZc2ZT?=
 =?utf-8?B?WFVHSFpkRE5xbXJDKzVFVW1nUHF5QVBGWi9USTZiMjQxNmVyVGRCMm9iZ0Zu?=
 =?utf-8?B?azVYbXAxY2x4YisxUC94RjZCQUhmK0NhMVZmeCtmZWVQWHJzc0tnT3pvR0tX?=
 =?utf-8?B?RkNseUd6R1lORVZxSkxWWFhKZG5TalByazU1VjRFWjVxTTc2MTNreXpibDVx?=
 =?utf-8?B?MHk0NmhGNzBPSlVuMUlNaXQ1OERMaE03MTkwNEt5U0E1dHU4V3lRUVlya25J?=
 =?utf-8?B?WVc5aXROdS90anFlMFV0WCtKeGphdmk1SUx5dEdOWG55cHcxRUlQUVYybWYw?=
 =?utf-8?B?M3pmZmg0akdIN1o2aUwyZFZpQU9hRDdlY3NaNFVWL3hCQm1jaGdmNzkxdWpt?=
 =?utf-8?B?K3dVbWFQU0NhNEZKYXRZVDZFbkNmeXVwNk1lWHZyOVMrUzJPYTNLYll3U1Vj?=
 =?utf-8?B?dlE9PQ==?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfed7b80-69bc-497b-4e69-08de1ee7631e
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 16:53:48.7215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UKJAZ8yTg4FReizUXPChosJNQ/LPsRymgB1387yTDowip3N+ibEtYcu6MAVeZvBUlm6nfs/M8sqwF+NY2QPfLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB7997
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

Dear Kuba,

On 2/21/25 5:17 PM, Kuba Szczodrzyński wrote:
> Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
> MIPI DSI D-PHY" which is required when using single-link LVDS0. The same
> PD0..PD9 pins are used for either DSI or LVDS.
> 
> Other than having to use the combo D-PHY, LVDS output is configured in
> the same way as on older chips.
> 
> This series enables the sun6i MIPI D-PHY to also work in LVDS mode. It
> is then configured by the LCD TCON, which allows connecting a
> single-link LVDS display panel.

Thanks for your efforts. For the A133 patch series [1] with display engine
support, I have also tried addressing the Combo PHY, but your changes are
more clean and also addressing the missing pieces in my series.

Will you be able to address the comments for upstream and I can pick it
for A133? If not, am happy to pull your changes in my tree with comments
addressed and push for upstream if you are fine with it.

[1]: https://lore.kernel.org/linux-sunxi/20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com/

Thanks,
Parthiban
> 
> Kuba Szczodrzyński (5):
>   phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS in combo D-PHY
>   drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
>   drm/sun4i: Enable LVDS output on sun20i D1s/T113
>   riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
>   riscv: dts: allwinner: d1s-t113: Add LVDS0 pins
> 
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 10 +++
>  drivers/gpu/drm/sun4i/sun4i_tcon.c            | 40 ++++++++++++
>  drivers/gpu/drm/sun4i/sun4i_tcon.h            |  6 ++
>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 65 ++++++++++++++++++-
>  4 files changed, 119 insertions(+), 2 deletions(-)
> 


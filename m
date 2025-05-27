Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF95FAC4C0E
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 12:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434FD10E47F;
	Tue, 27 May 2025 10:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TNaPwpjI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 165F210E47D
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 10:12:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxRoAsGLKML4GjzP/B8ZFMYObWNI7oBCjP3U2oOsxo67/B3Mn0qyqIwVMd/cQnNdvYbdRwoABlUJS5ZmZYemOVfs53CZDRtYTjymsHX5jVI3Pkl/c/QqUrbiHvc8v6pcMCIWHNS9hMLCYrBWSAZV/YUmyLR2V2iDJuKlWw2235WRM0UsHZJy1QC6S3h9RGEgoETZGbCRJV8hghkpFIWlvi7yQk4SFKV92rL5d3Io6Gtg1XaFH5ZLCioY7xWScO/LhmQ3BYDxKv/fCuom9ByS/L0iudCcCa4X4IpeN9XGKVvfb4Q4bKyDl8OrJ31OtAY0UZMTAVnmsUqJLvzAkAR4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/Y13WAZnc6JF4SmYtkZbHL4MYdnc95iVYGUz9ORIfg=;
 b=RGlKrw0dChTRpM8XhKXfyMnGgx33AE/T0OaDUDqi+UFEFjHHkiHNkptmeeeH1sKm2nVImxJposjqBGfnWCJPSFuISB6DKLZaHjV++cUHgQBH6qeo8J5RomJr/h7X3BgtcrYYzcDouLT2bs7tSi4U1TfzsbUzAhPijDIUn7wlrzKrrCxYkkvz+uGfQd3t4q717mn7qIqNu/6QGzwe0UTWmxm0dlGcJ7wEZjf7xNiPYIkp6n9EDyTmWF4e04aouR8Ciy79657VRxrES0ocTfcx+dOVjCSRGs3sYWdYtNhuj1Be/Nd+oKyV5L7L4sEiwiQfg4A1WMQpuWLkY+PuomKo/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/Y13WAZnc6JF4SmYtkZbHL4MYdnc95iVYGUz9ORIfg=;
 b=TNaPwpjIlKQ7f7+27UxxPDN+IV11Q33IemNDFk8flInFTY5xjitfOu3hyNulXtMjacVhvABbWGNll0IYo1TpZntd6WJs3fda0wTU+TcfW14tUVDRpkUWAV71yS/tGFVvcE0HRyE7m/k2Y/ULUycUMpG6CR9eO8tUfhmea+IIm7c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TY3PR01MB9715.jpnprd01.prod.outlook.com (2603:1096:400:22a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 10:12:00 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 10:12:00 +0000
Message-ID: <daeae65e-7acc-4c33-a898-b5b3477beaa2@bp.renesas.com>
Date: Tue, 27 May 2025 12:11:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: adv7511: Do not merge adv7511_mode_set() with
 atomic_enable()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maxime Ripard <mripard@kernel.org>, tomm.merciai@gmail.com,
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Douglas Anderson <dianders@chromium.org>,
 Adam Ford <aford173@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250526085455.33371-1-tommaso.merciai.xr@bp.renesas.com>
 <20250526-cryptic-blue-mussel-ac57fe@houat>
 <91d8a288-1f2d-469c-a596-6265893584ae@bp.renesas.com>
 <20250526104902.GB17743@pendragon.ideasonboard.com>
 <209ddc02-01d2-4375-afcf-2c9a55fe8fc1@bp.renesas.com>
 <20250526-cherubic-ambitious-cobra-3c6a1e@houat>
 <7603c3b1-edff-4c02-a4a5-1d5f72720cad@oss.qualcomm.com>
 <aec5d09f-248b-4dcc-8536-89b4b9d47e9c@bp.renesas.com>
 <d695e04c-b2f1-41ff-8510-33529bf5f916@bp.renesas.com>
 <20250526142808.GR17743@pendragon.ideasonboard.com>
 <f93bb774-157c-4514-b7e3-d28d0866ad25@bp.renesas.com>
Content-Language: en-US
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <f93bb774-157c-4514-b7e3-d28d0866ad25@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::9) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TY3PR01MB9715:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc1f244-6458-4f87-b337-08dd9d06eb1f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2x3VldUd0ppWDdvTnFieWVseE1Sc09kNkhTZmhxUHR4UkdENkkwV3VDL2R5?=
 =?utf-8?B?dHdDSDhPaUN4K2dxZ2sybmhhalVCQ0F5VDYyQVdGb2dCc3NFT1ZQOWlGb29U?=
 =?utf-8?B?VUc3OE0vYTB0bVI1N01mWkR6SHhnblBFVElhNVRBUXREWjVZT2Y5MS9kS0ta?=
 =?utf-8?B?YlFRc2ZIbnBmRkNndFJlbFh4VDN3R1A2dUtGSmpCTkdWVldiWWVocDJFeHhv?=
 =?utf-8?B?UGlpTGNrQTYxalJQUUZDM2oweDRTdURXd0ZzYVAycDV0SDk1THVOeW9NUlUz?=
 =?utf-8?B?TUlocUZYUmYxcW5TMExVbHZueFpJc2VkNCtyTGhyZjFDV3V1Zll6ZWczU2xx?=
 =?utf-8?B?QUsvV2ZMWElxNXpiSzAxR0FTcDB3M3h0YXY1Z0IyVGh4UEV3RlVnRVJNQ1I1?=
 =?utf-8?B?MGpMcTZWWmpvMkJhUHlFUUxyMDNGQkZGWk0wSTFNakorMXhFSHVRLzEwaS9x?=
 =?utf-8?B?NmFkNWdJc1FJak82VmE2Q25sVW5yUGdpOW42bU1mbVNFbXk0dVROVmlISHFv?=
 =?utf-8?B?SERuY0oyZmZQY3lTampUWVZiZ0E4Q1hIeU43VVFZcGY1bFArS2twaWFoMVp0?=
 =?utf-8?B?d0VtYVlqR01oN2NaZjFtUUNZS2RUbS8yb3k3V3lRbyswMmR6TS9aQjd5L3RO?=
 =?utf-8?B?WUhhSHFtclZuR0dYc2x1RE56S2gvMmJNS1p3NW1GUmxjZDhoTGxVNDJxOTdD?=
 =?utf-8?B?KzdUdlR0ZjR1ZFZ6bjNKTjN4VUF3WVhFSTNiZkRoMUdrK2NUWjBBV1JTdnFn?=
 =?utf-8?B?bnYyT2I1Sm9STlJucm9IR3FBR1B0MWF1K3dYZjlQZE9WRDZJSUtZWmFzNEZZ?=
 =?utf-8?B?MkdGVDE2aWFoL0wxQVBRVVFGSGtKMHM3UFovL2dieDdBT2xDWWVrRTM5WFhT?=
 =?utf-8?B?T1FjZVdFckhpekswOENYb2lya1N4eExQWGxKanppMFZBamprRVJJSk1uUUNq?=
 =?utf-8?B?dCtVam1XWUZNRjlseklIVlRGWW5BMThMSUdRL0xxaC9MaDN1SVNFNG1TaE9l?=
 =?utf-8?B?ZHBzWkNaTG9hZTMyRTJxVndOUDdIRWRIR1VFVitiSm5JdGNFazE4QjE1OGpi?=
 =?utf-8?B?WEg4andHTjhLUjQ3bEJOZFBMam9jeUlPTVB3R0Fzam54MVNxdFQvYXYxVFI1?=
 =?utf-8?B?ZVRDZTRPMSt4VUlmTFk4b25taHpFQXRWTlBwNHBLcDJzT0ZyT2JiQmFpM3ly?=
 =?utf-8?B?NTdyekZSY2NVWmdlRXRIcWdGczNmMitVUE43YkVXSUJKQm03MDZsQjdVdGdK?=
 =?utf-8?B?ZGJSYUNQdXhMSDhLYlQxeXI2V2lVTFI1U05jRzFFbWpOSDJPcDFFdlpyYXNm?=
 =?utf-8?B?ZDRmcGU2WUd4ditxQjJia1FQQ1pqZVZEODlZZmFGZUt5ZUlEQVJjSlVuYVVw?=
 =?utf-8?B?YXJEbkpBSEtEN3ZScFFnS2dGMG5pRFJva2FDOUdqOG5sSmNpWHhhaGJ3c2hF?=
 =?utf-8?B?eTZlVnQvTklKQTFrTEdBMm9XSWZlV0Y0UE44ZjNSbWtPRXFGRitGMjF0S2Vu?=
 =?utf-8?B?cDlpMWJmbmhTTDROcXNmM3RBdFRVek9Hbzg2ZzRYOE9xWEQ5VEhaMWVDR21F?=
 =?utf-8?B?WmNWVHpRT1BxZ3VTcnBmR2krL2F1UHB2U2tzN1Zob1E0SEM3NWRpVURBS0hI?=
 =?utf-8?B?eWNvbDNzOTVvUlhGYXlUNzNTMUk5Q0RGS1UzVVR1R3ZDWS81TFRZVStyZDBr?=
 =?utf-8?B?ME5MM0VxaTVCaHhWQ250ZzZFdkdwUnI2ODlGeG04M0VaYWNBUHdtQ0pVaDVN?=
 =?utf-8?B?UXRWYmQ1K0ZnMTlqK0M3ektXVVdXK2RTeEROcituM0VEYTdDb1RrdS8zYUcz?=
 =?utf-8?B?REk2Q1VlcmxIZk5zWjVkcUVvdlJLS2ZIb0JJQ3c2TlgvbE5HODdkS0N3UmN3?=
 =?utf-8?B?dndXUFMwZVBORzdNT1dIMFk4UC82Z2ovOGh1WGNzR24zb1VtY1AzUElxbjVz?=
 =?utf-8?Q?7gNfuVnmC3A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2hoWks4S0tJUGRUOWI0VXk1bXpFaThxa0VzRDVVcDk1SytxajJGMVJrM2dS?=
 =?utf-8?B?RUUzbmNONENwRXpYRG56RGJPMEZMNFQvbUVhWlFFTVEyUncxSDJCZlE2VFRp?=
 =?utf-8?B?dG84a3FpNmJLWDlUUDZRYWxNb1AzRFFlMHZPelFZSmJVYzhVcVBidUJGMWNB?=
 =?utf-8?B?NDZmRXFad005K0NyeTQxQURydS9hUnlNWmZ6NVJNTnpYVGpwR0pHNjlYN3hN?=
 =?utf-8?B?cW1nVU1ZYm8yNTl6c3pYdFd4cm9WaTh1ZnNQSzNNeUMrTWduRTNqR1FBUm1G?=
 =?utf-8?B?M0NadHQzdW94S3pMUUZwak40NWFVQ3ZnbnVxSGtwMGh5ZGJiZCtZVmJFcG1B?=
 =?utf-8?B?UGU5M1o2dHdBNGZmTHlKVjF2SHVITWpxTGxDcjNVa0hTY1V4N0oxVWp6RXFD?=
 =?utf-8?B?VW1Jd2lVNkZCRWw3SmNSU2pSM1A3M0ZVQnliKzZ0Rm1Hci9nTGlWYlpRcnBI?=
 =?utf-8?B?cUtjdlloNzRTcjRDKzZBYzA3U1ZGckw0V2V5eGcxRlJkN1V0c3pEZW5KdXpy?=
 =?utf-8?B?OTNkZkVqRzF3NHpSNnlUakYyMzYva2xlWDZiNkN0UnN4UGhwSll1SkIxdEI5?=
 =?utf-8?B?NE5GKytISExITGJFaHdjNEV0d1loSEFDY2FJWkVVVzlEcFBUZjAxV3QzUmtz?=
 =?utf-8?B?K0hqTG9xcEp0cVZJcVROcE1FaE01TjJ3U0Z4YWUyb2kwUTJRczRqb3R1K3dv?=
 =?utf-8?B?TFRzeFgrcUl1UmcwTy9NcktmSEVwL1pkWURVZlhGMXlBSlZkTHRWakFFaGFa?=
 =?utf-8?B?bFI4TEFybUhneVhxcnVzWGxwTkc0NDk3MUVHSWIySC9vMW1BNEdnUU1sTStm?=
 =?utf-8?B?Vk16SjFqWXFrM3ljQXpoaWdVdVNxaXVrMEZzYVduQlBQcG81WXB0RGQzSVZr?=
 =?utf-8?B?M0doeFUxM1U3dTQyY1BEUmpNeUJEVC9OdEJja0tLWDJmcXJEeEwvT2h0QWEy?=
 =?utf-8?B?bDZ2bjEvZ3ZPcFh1WmIvNnBIL01rSGVmcG5JRUhmTjFtWG1pZ0pXTXNIT3ZD?=
 =?utf-8?B?WVlOdnhzS0RVTDAvN2hCTXY5WDY3WUFlS0xvc0xIMVptaUNxbTBhU2duR3pl?=
 =?utf-8?B?K1N6dW13TCtyRU43UkplZDNXVFdYMUZTRjc2akJwbEZ5STd4R2ZKZWpZOHNV?=
 =?utf-8?B?OUg3Y1h3elpUZ3lObWVwWmFkTFpwVXErcHNidDJYMjA2dXdYQ1VGR1dEbnVu?=
 =?utf-8?B?ZmhvNmEva1h2c0ExdC91ejE2ZEhKZDlyWFFXMjc5bTFNVmV0emtOSHkvcmt4?=
 =?utf-8?B?anRaTzFvT2Q1M1l5dnY5SDhZKzg4OGwvNFhYR0hPR3EzN3crRXpOWEhTYTJQ?=
 =?utf-8?B?Y3IrckZ1MUMvK0RGZnRhMmFyNi9Yd1dVV2V2OUJTMHZaZ0xudFhtNUloQU14?=
 =?utf-8?B?VkwyTmhqNVVkY3Jsc1Jad0J2NGdoNDh3eHFJQ3k3M2E4VzJ6ZDVMTVI3L1k5?=
 =?utf-8?B?bVhvNi9LWXlWT0ZTcTFaRFlDVEtrbjFjQlZFZVd0TXhsSDZZVk1pMmlDSEg2?=
 =?utf-8?B?RCtOWFB4Mkl3aEJaQ00rZ3Z0NUtYNWwzSG8wVVI3dERHQmxmYjdFQ0hmOXRx?=
 =?utf-8?B?c091aDl1VjQ0QnJsZnRnbGRwUXlwVUFUNHdyS25QOGRma3IvV0J3RE9pd1h2?=
 =?utf-8?B?aU44WTRDUFFha2lyNVpaNDRQbzFqZWRId2JYQTFhcXBDeENDakZscldhTnF6?=
 =?utf-8?B?QThxbVc5YUZGRkhuYnFCdTlqa3hvMnBXWVBFc3oxV1RpRDhhd1ZUYlJwRU8r?=
 =?utf-8?B?Y2RyRHNieGNIdjY5RjE2TTBtZTluS2JKLzdaUUhRYTY0OWNSeXp5dlR4U3pQ?=
 =?utf-8?B?RUw2RkdwTnFka2JCUEJTVVFLNWNveDg5UmdvTVkrNWhEUDE5azlsTm44blhl?=
 =?utf-8?B?bUgvM2NZRDlQRTA4T09HV0ZYLzhJSndOaEc5Y0lOOUNhOS9qMVkwMlJnYmQx?=
 =?utf-8?B?LzJoU0hQMWR5MVhMLzA3bkFLVGU5c1J0SUQzelJta0J2R2RnRytnbkl2U096?=
 =?utf-8?B?L2xXYm5WWUJKQlRaTUNWL3U1RXYvZUtuWHBRN1U2Vm9WQjYxOVk3blgwUzN2?=
 =?utf-8?B?aWgrelpwblNydlpwSGJseEdxbW1PLzJzNTNuTGxidURtNGxBbGE0UzZaOFBQ?=
 =?utf-8?B?VjBhbGwremxSREdrMGlOWWozY0xGTmN2dFdFWU9qd2FuZ01sWDRlYlNRbTNV?=
 =?utf-8?Q?gzfeIXmVHB6P8WAE6ZuyclU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc1f244-6458-4f87-b337-08dd9d06eb1f
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 10:12:00.0309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: alMqU3JZmwBr2LFymvj2dLm2vt0uJg5VnmLgJmGzYdXSBI1vS91Lh/cMXsqlXXGm0FUOSLx55OatbC5solL7oqaNnve5eqqMcmbdkdAx9vywaQE7jTpk4WcWUzRO99Pm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9715
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

Hi All,

On 26/05/25 18:43, Tommaso Merciai wrote:
> Hi All,
> 
> On 26/05/25 16:28, Laurent Pinchart wrote:
>> On Mon, May 26, 2025 at 04:13:23PM +0200, Tommaso Merciai wrote:
>>> On 26/05/25 16:02, Tommaso Merciai wrote:
>>>> On 26/05/25 15:18, Dmitry Baryshkov wrote:
>>>>> On 26/05/2025 14:40, Maxime Ripard wrote:
>>>>>> On Mon, May 26, 2025 at 01:19:23PM +0200, Tommaso Merciai wrote:
>>>>>>> On 26/05/25 12:49, Laurent Pinchart wrote:
>>>>>>>> On Mon, May 26, 2025 at 11:58:37AM +0200, Tommaso Merciai wrote:
>>>>>>>>> On 26/05/25 11:26, Maxime Ripard wrote:
>>>>>>>>>> On Mon, May 26, 2025 at 10:54:52AM +0200, Tommaso Merciai wrote:
>>>>>>>>>>> After adv7511_mode_set() was merged into .atomic_enable(), 
>>>>>>>>>>> only the
>>>>>>>>>>> native resolution is working when using modetest.
>>>>>>>>>>>
>>>>>>>>>>> This is caused by incorrect timings: adv7511_mode_set() must 
>>>>>>>>>>> not be
>>>>>>>>>>> merged into .atomic_enable().
>>>>>>>>>>>
>>>>>>>>>>> Move adv7511_mode_set() back to the .mode_set() callback in
>>>>>>>>>>> drm_bridge_funcs to restore correct behavior.
>>>>>>>>>>>
>>>>>>>>>>> Fixes: 0a9e2f0a6466 ("drm/bridge: adv7511: switch to the HDMI
>>>>>>>>>>> connector helpers")
>>>>>>>>>>> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>>>>>>>>> Closes: https://lore.kernel.org/all/aDB8bD6cF7qiSpKd@tom- 
>>>>>>>>>>> desktop/
>>>>>>>>>>> Signed-off-by: Tommaso Merciai 
>>>>>>>>>>> <tommaso.merciai.xr@bp.renesas.com>
>>>>>>>>>>
>>>>>>>>>> Explaining why, both in the commit log and the comments, would be
>>>>>>>>>> nice.
>>>>>>>>>> Because I can't think of any good reason it just can't work 
>>>>>>>>>> for that
>>>>>>>>>> bridge.
>>>>>>>>>
>>>>>>>>> Sorry, let me clarify and share with you some details:
>>>>>>>>>
>>>>>>>>> adv7511_mode_set:
>>>>>>>>>      - Is setting up timings registers for the DSI2HDMI bridge in
>>>>>>>>> our case
>>>>>>>>>        we are using ADV7535 bridge.
>>>>>>>>>
>>>>>>>>> rzg2l_mipi_dsi_atomic_enable:
>>>>>>>>>      - Is setting up the vclock for the DSI ip
>>>>>>>>>
>>>>>>>>> Testing new/old implementation a bit we found the following:
>>>>>>>>>
>>>>>>>>> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-
>>>>>>>>> A-1:800x600-56.25@XR24
>>>>>>>>> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
>>>>>>>>> [   49.273134] adv7511_mode_set_old: drm_mode_vrefresh(mode) = 56
>>>>>>>>> [   49.281006] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
>>>>>>>>>
>>>>>>>>> root@smarc-rzg3e:~# modetest -M rzg2l-du -d -s HDMI-
>>>>>>>>> A-1:800x600-56.25@XR24
>>>>>>>>> setting mode 800x600-56.25Hz on connectors HDMI-A-1, crtc 62
>>>>>>>>> [   74.076881] rzg2l_mipi_dsi_atomic_enable: mode->clock: 36000
>>>>>>>>> [   74.092130] adv7511_mode_set: drm_mode_vrefresh(adj_mode) = 56
>>>>>>>>>
>>>>>>>>> Same result but different timing (in function call perspective):
>>>>>>>>>
>>>>>>>>>      - old: adv7511_mode_set() is call before
>>>>>>>>> rzg2l_mipi_dsi_atomic_enable()
>>>>>>>>>      - new: adv7511_mode_set() is call after
>>>>>>>>> rzg2l_mipi_dsi_atomic_enable()
>>>>>>>>
>>>>>>>> What is "old" and "new" here ? Is it before and after Dmitry's
>>>>>>>> patch, or
>>>>>>>> before and after yours ? Please be precise when describing 
>>>>>>>> problems.
>>>>>>>
>>>>>>> Sorry, you are completely right:
>>>>>>>
>>>>>>>    - old --> before Dmitry's patch
>>>>>>>    - new --> after Dmitry's patch
>>>>>>>
>>>>>>>>
>>>>>>>>> What do you think? Thanks in advance.
>>>>>>>>
>>>>>>>> You're only explaining above what the "old" and "new" behaviours 
>>>>>>>> are,
>>>>>>>> and claiming one of them is causing an issue, but you're not
>>>>>>>> explaining
>>>>>>>> *why* it causes an issue. That's what your commit message is
>>>>>>>> expected to
>>>>>>>> detail.
>>>>>>>>
>>>>>>>
>>>>>>> Thanks for the clarification! :)
>>>>>>> I will send v2 explaining better this.
>>>>>>
>>>>>> In particular, if the driver needs to have mode_set called before
>>>>>> atomic_enable, you should say why moving the call to mode_set 
>>>>>> earlier in
>>>>>> the function wouldn't work.
>>>>>
>>>>> It might be the same thing as we had on PS8640: it had to be brought
>>>>> up before the host starts the DSI link, so that there is no clock
>>>>> input on the DSI clock lane.
>>>>>
>>>>
>>>> Some updates on my side:
>>>>
>>>> I'm not seeing any differences from a regs perspective when using the
>>>> old driver version (before Dmitry's patch) and the new driver version
>>>> (after Dmitry's patch).
>>>>
>>>> In particular, i2cdump -f -y 7 0x4c shows me the same result.
>>>
>>> Please ignore this (wrong address)
>>>
>>> The right test is: i2cdump -f -y 7 0x3d
>>>
>>> And I'm seeing the following differences:
>>>
>>> # WORK:
>>> reg | val
>>> 0x3d → 0x00
>>> 0x3e → 0x00
>>>
>>> # DON't WORK
>>> reg | val
>>> 0x3d → 0x10
>>> 0x3e → 0x40
>>>
>>>> Unfortunately, since I don't have the ADV7535 datasheet, I believe this
>>>> issue may be related to the functions call sequence.
>>
>> You could try to get the documentation from Analog Devices.
>>
>> This being said, the above registers are documented in the ADV7511
>> programming guide, which is publicly available. They may differ in the
>> ADV7535 though.
>>
>>>> I agree with Dmitry's theory.
>>>>
>>>> Let me gently know if you need some more test on my side. Thanks in
>>>> advance.
>>
> 
> FYI, I've tested the following pipeline:
> 
> DU1 (RGB Output) -> adv7513 -> HDMI Panel
> 
> All working fine on my side with the Dmitry's patch.
> Same driver, But broken on DSI interface(ADV7535)

Updating horizontal/vertical porch params after drm_mode_copy() into the 
adv7511_mode_set() fixes the issue.

In particular:

adv7511_bridge_atomic_enable() call adv7511_power_on(), then 
adv7511_dsi_config_timing_gen() that is responsible to update h/v porch 
params.

But during the adv7511_mode_set() adv7511->curr_mode change and this is 
not reflected into the h/v porch regs, then h/w porch regs are keeping 
the old values.

I will send fix in next version.

Thanks & Regards,
Tommaso

> 
> Thanks & Regards,
> Tommaso
> 
> 


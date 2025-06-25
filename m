Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 149ECAE7D67
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 11:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A5410E0FD;
	Wed, 25 Jun 2025 09:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11023137.outbound.protection.outlook.com [52.101.127.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F05210E0FD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 09:39:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3GWGk3o5lXEk4nO5KiIdeg592kj0KJXbeMv5znM332N+BBdkTVaxTfYae0Oze8Hd/ysQd5VhcKyl3hqpNOh73pbZk3kAM+XNPXny/eqcK2VSpASSt8LWB7mggF5MQfpADnbQX/Gu+75EiGDmQWBwMhQ4D6rkyuxZGk9ABrYPMcaykVYg+4XJAhc0N7gRf7vDOFFTP5b50wn4kedz2MboUmcTJoWu06+ajeeP0Ia6FjddS9hxQXeyhnc6OWS+7Ji8pC21g6Ehl5sMTqLYXFJzr7j0P73TVVZkWPIb5m8dlcbGuwmLI+hEyvLs5YRDHiDse80XKhwst6H5jf79y9SEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUbZ9IvPgkSJSTfY6J9UGAtOE6QoWmj0aUu7FoRkYt4=;
 b=Li8AEADWLhjnpE28Hl9VTgtWxR3413lWoG6OnBs5RcoU1yTW33R0DlJlaLKZAE6Tnci1FZqB1tkGBuuUqhwPcIlLeJV/rAV9Fc4uQwmX6rtMWaUpWsTT/hSbz0e1MjydjE2Czm/CoIwDQRy60DfE4JZCHH9dE4HqRQ6W1Ck5PrJxU9YoTr99my48JbawSreK3Uyim4xQQmyBnyCcwvpNxWWrpLUXRTW4cvD26EPQWTvQc+KHvb4VpJGTgfagr5XB0z240MKgxvB3RqRfuHngKCjCgtU/T3HIgNgkIDBmH1E45LyE+VXq8brYMr3N3sRxa5ueJTAcxERcDnvFp6Nv2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=linumiz.com; dmarc=pass action=none header.from=linumiz.com;
 dkim=pass header.d=linumiz.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=linumiz.com;
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com (2603:1096:405:3c::9)
 by SEYPR06MB5718.apcprd06.prod.outlook.com (2603:1096:101:ba::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Wed, 25 Jun
 2025 09:38:56 +0000
Received: from TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565]) by TYZPR06MB6935.apcprd06.prod.outlook.com
 ([fe80::9e42:3253:9a2e:b565%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 09:38:56 +0000
Message-ID: <98860c75-6899-4911-8298-f70e3eab5791@linumiz.com>
Date: Wed, 25 Jun 2025 15:08:48 +0530
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 17/22] phy: allwinner: phy-sun6i-mipi-dphy: add LVDS
 support
To: Paul Kocialkowski <paulk@sys-base.io>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-17-13b52f71fb14@linumiz.com>
 <aFu2VBhCIEdLIPv3@shepard>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <aFu2VBhCIEdLIPv3@shepard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::25) To TYZPR06MB6935.apcprd06.prod.outlook.com
 (2603:1096:405:3c::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6935:EE_|SEYPR06MB5718:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c28babd-ad35-4cd5-30f7-08ddb3cc1a90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elA0UWlEYk9maW1WQm5NTElpS2ZQQWwzcWp4aUt0NWlNYnhzRHR3Z3p2YmdQ?=
 =?utf-8?B?TUozSUUyWlZGSG5iVGhhSmphTU9od0tWYkZQd3NZUTVvNTdHVWFtMWpvamN1?=
 =?utf-8?B?ei9sanJ5UXNvYUNGWEFwSE93bWtVdjk4ckV0Q2FPMmlTbUlmQWRiYkNwZW0y?=
 =?utf-8?B?NmZDMWpNd0I4NG1YZldFNlF2ZzcvaEVic3JMZThTSUgvQU5mTkJ5MGM1WC96?=
 =?utf-8?B?V2JuWFhRbGNWdFVKR21WUGpsNklwUHU2TW5HMHJQbVpHN3RwaU1wZ3MrMEtK?=
 =?utf-8?B?UFhvWkVlMlJ2NTMzOFMwY0c0UjdTd0RSWEFOZWpNUEtnWUZ3RUpjNE1BSndW?=
 =?utf-8?B?VUhxSDV4OFBtWXBQcEhwS0ZBakUzTkZiSXFmSklKekNTZ3VHdmlseUY1OUxi?=
 =?utf-8?B?amNXN2VKd3BJcmFGTjRZOU05WHJjNWdBS2ZDN1ZrVFdqcVJlT09uMHdxRDJx?=
 =?utf-8?B?enhPaUdFSS91RHpDRUNSNGZiWFE4Mmk0VVAxQ0FjYmpoVWRZYUhUZ1FibGxN?=
 =?utf-8?B?eFhiTzJ0OWhYcy8rSEJUNXltTXBYN3QySzc3ZDBPL0JjWXBrTmpRU2FjN2lz?=
 =?utf-8?B?ZjVsU25MVnY2TzhSWlBHOFFWZFN0dEhNcW1NRmRwNWNGdE1uR1pCU2tUdVZS?=
 =?utf-8?B?bWRqVVVwWTJUb1hleTJpblFQV3MzdVhJNFVPWFZ2bm1Odm9YaHVDanFzU3pj?=
 =?utf-8?B?ajFaaDNmYTdURVAxdmc2V3BGWk9mS3IxMFRTb24zNzFnVW52aXFpb0E2bkhP?=
 =?utf-8?B?NkVQMkhqYXpWNXpKbUgxU1NtWVlpOEJBTTZIVFVpS1lmc3IvWTFCM0FweDUx?=
 =?utf-8?B?b09qSndOc0FnRlpUTStoY1hHaE5iSmFETzlYM1J6bXl4Z3RRTG1OVHFMS0t2?=
 =?utf-8?B?YjdCRFlKZ0tLT3ZQMVVZNUVDYlFBTE5UdWRETXludFlMSnhxZ2tpb2pJWThO?=
 =?utf-8?B?RmxaejFURG5KdGU5bjBMQjJtdUNyRHhzMG55aUJzZ1Vla3JSUU16L0F6RnVD?=
 =?utf-8?B?UVlBQWJubTRpR3FzYjVSdmtVcjZYL0VYeU5iZmE5WFJNdmV4REs0dHBmS05C?=
 =?utf-8?B?cWZCbURram0zSHIvV2dKcjUvdHpvM01lTk9MY0hXLzNxY01GajB3bDVEYzRo?=
 =?utf-8?B?UVE3QWdTRFQ1dmc2citMdHNmaUlrZ1lxWWVQQXpSWEp1dEpQSVpJc0VoQzIy?=
 =?utf-8?B?U1Q5YXhsWXkrdHNFYWQrdjc1YW5vaGt2L3lmM0VOdUd3Ry95U0FObCtEL1Iw?=
 =?utf-8?B?dDRWRUdrQlA3bXRsYkxRQkhKc1J3ZW1iUXNwNnY0R1Z0QlY5ck1wZkRLSG5D?=
 =?utf-8?B?R25sWFdLcDRkWmV0TkdwcnkvNWs2ZCtNdEs1aWZCU2NsQ0hlQVZHZUFKNmRB?=
 =?utf-8?B?Yjl0dTFZRWJPeTYxcitqWlNzUEd1cUUvUEt6ai92MlJkN3VZbzRrRVU5TVM3?=
 =?utf-8?B?VGZkd21rckIwMG9XUnphc2RmaElyaFh1LzA3Mk16RldhLzhnR3JBY1oxdy9N?=
 =?utf-8?B?MU81aVUvekJGOHV6bWFBdXM4dDZFWGNrYUFGbUowaVhpR0hycDV1L1lMOEhv?=
 =?utf-8?B?TU9xMU9rZS83bStmN1NqTmpCYytKY0JTRlZ3amZDM29ET2wvWnRVOWIzY3cx?=
 =?utf-8?B?UVZ2bWJ4V3VXTkkyalZDdzQ4NGNwTmEycFJsSnhmUW93UHRNN0lFNmo2dTFm?=
 =?utf-8?B?ek84blU5Q25LTFFIbWo0cGY1TkM4V1VrdCtvZWNmU3RsUlVpbTVwalk5US8y?=
 =?utf-8?B?Z2dwS1g5R2NQOTNPenVTbnZEYzlST2tFdE96LzNNVUpVNXZpZ1RjL3BUYWp1?=
 =?utf-8?Q?QzxJr8OB1I6tIOOR+zUsWuojD9UAImvEStm5U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB6935.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDY1OVZZODM1UjVEdWtzUG9yVVFNbFdSUmZJUVlEazRoV2lmWjBZL2dKZ00y?=
 =?utf-8?B?V1NucDNTamxZUGQvdGhQV0lNeTRwbmdZQzFIVElMbVZpa3VDVDZiNTZPcnky?=
 =?utf-8?B?V1JFQjlyR2hhQzcwTE1iVlB3K1FvbU1reWVSZEZwbnVaVlRycDkzUWZRN3l3?=
 =?utf-8?B?OGt1NGNMZjZDemkxZXJHams4MFl6bWFJbEpEL2JCSjFjdG96RmhMM3Bzcnh5?=
 =?utf-8?B?TFRnOXdOdVJ5T2FPWG5wSjRXSi8rdm1DcUFpcHdkVXZYKzFHMjhyaE0rcGox?=
 =?utf-8?B?WGdWb3EvK0FESExQV3UvZXpGUU1FSEozRHhYblByNTA1TmN0WnV3emx1WEo4?=
 =?utf-8?B?amVBMkEzdExpVmhZL3Y5UjJsT3o2U0VvZEVXdGVIYklKRU9IV0ZZdkVQMGVQ?=
 =?utf-8?B?dnVGRTQ5cFlqdkNBYUN1TGVIQlNiNmhTMlM4S2QxVy9pMGNPYVhtK2tISkJG?=
 =?utf-8?B?Q3FUNFVPWEpZR2xUelNONXU1M3hEUlRFUXZ5a2tGa1AyM2t6a3Y5dlMweS9l?=
 =?utf-8?B?eFN6QlNDVVdPZkQ3Vjg5dGN0WGswOUEvYU9taWgzV1BSYndBMVA1Q0d5K3c4?=
 =?utf-8?B?Z3J6QUhjZG1qNW5YQ09ma3JGa0RFZWY5TWhQUjJCUC9JTDZjVXB6V2RuOHE4?=
 =?utf-8?B?bDRWTVprdGxxc2JwMTBxOWpaZ3RqdVpYd1FkOWZ1aWFiWlpTekRzNGNpK0xH?=
 =?utf-8?B?aXhrTVlPYnIxWThKWVZjTDloOFI1TUVEVGhzOFJEVkI2QkdGM3g4TUlhK0pv?=
 =?utf-8?B?azFWM1ZuMVBwMlI1NFlRRHRLZnZZRHNBZlV4SDZ4dXZ5ZHh1VFFlblozWWhu?=
 =?utf-8?B?UkVhWGNudWxBMTlSWkpQSWdPeHppL0Y4LzhIRTR0THBhRVljc2RweWFub0hD?=
 =?utf-8?B?YUViQVpCL05rTVNwR1V6eVo2UXZhMm5SWjRNTHQyaWtRWXIxYkVoZTREQTdR?=
 =?utf-8?B?N1JiYnFTK3M3aEpBRFRPVkNDY21WRmltRHJ6QmNIay8rOGhOb1N3WEszdmR3?=
 =?utf-8?B?dmNnSngwQldMcnhxeUVBYmIyblNmcXp2MEFQZ1A5TjJtZ2d5ZDlXam5XTXFI?=
 =?utf-8?B?WHVSV21meGoreW03NmZhNUQrb0VuUjU1ZXhtZEpMMUMvb3E0OGc2YmtucHBt?=
 =?utf-8?B?N0hWeFZ6ZHVyeXRFRDUzZ0tsWlJYVDFlM1E3NExlb0JPdGF5ZHpGSElPZjRI?=
 =?utf-8?B?b2QwcXJEaWxZM1F3NDRISzJZT2U3cUptbmszQ3FwTzlSVS9yZzJFRmVmdmo3?=
 =?utf-8?B?Y2JOZWg0eVYrNGt4M2RRNEJ0N3lHaXBnWWhJbjk4WjNXb2NWaXU1cGR2RjNq?=
 =?utf-8?B?VFFDT0JJT0lMajFLTDQ4MzZSWXFqSTdhRUx5SHJxNUt5WmF3NWora0wrSEFP?=
 =?utf-8?B?REhvSFB0WVhBTjUvallwZXkxWnBZanB0VDRVc05PS21JNnR0SURyYmRKZE4x?=
 =?utf-8?B?SmllelFqZnhtZEo1VTJlRFhXNnkrVC8veXBKRUJmMEUzMHZyT0FlcEh6ZXlY?=
 =?utf-8?B?Ylk4NE42MTJ3dTdYTWw3N3JZcGwyRVZIVXRzZytkSzdPc0Vya0M4ZGs2TXVj?=
 =?utf-8?B?WjcrZXo2TmJUMXBvellJdGU2d3kzamwxck1pSEdHcXE0VHV5dFVWaXp1QXJD?=
 =?utf-8?B?S25iem42Yk9XdGFHd3ZwR3pzS0V1TlI0WEpiOUVsMk5TMVlKVTBxT1JzazJU?=
 =?utf-8?B?VU5xb1h4d3FGNDU5WE5EakE5cEdVVFpXbFNIMFVVVVdGb1YwTnpjckR2QTh4?=
 =?utf-8?B?TWlKcDlTU1NUWTUxdXdJbkdXeU9GRjluWGJxRUtiVjVkRWJBYXIraFZ0aTcx?=
 =?utf-8?B?YVlrQ2F2b3ZMSHN5S1U1Qmc3OEcwTWZ1QnluWWY0TTNMQWsyOGloM0RHS3JK?=
 =?utf-8?B?eHg5SEM2N2lzRnJIRStpaE8rM1lkWHAvZ0FXTkF2am93cDBFYlVtZGZld29k?=
 =?utf-8?B?ZnVrWUVCQzJpMEdBanZqbG1ETEVtOVVyZW9KMjI4MTJvS00wNHVCeFRvcnFj?=
 =?utf-8?B?TlNVVElFdVhlZlcvSUVPblVrUkRyNHhsdENWK0lXclROSHNPdGhLYlJGeXgr?=
 =?utf-8?B?eUJZRWw5NWVKMyt0SEtGR1FvajIrb3VmR3VZNEhXdzdlb0xJdzhwZ3pFZkhK?=
 =?utf-8?B?Z2dLS3VJejFLVXFROUV6cFd2VktMMnlMREt2YXdNTXNDWUZTeTkyM3pFVEFq?=
 =?utf-8?B?U1E9PQ==?=
X-OriginatorOrg: linumiz.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c28babd-ad35-4cd5-30f7-08ddb3cc1a90
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6935.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 09:38:55.9345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 808466aa-232a-41f4-ac23-289e3a6840d4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6V8ikuhCG03qNkqGnLHdwCVivxW8KN/5k2OIaXpCiHgPXH8LT6ldCR6XSkwLRvsynsBqDkuRlaweEjDTdyEYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5718
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

On 6/25/25 2:11 PM, Paul Kocialkowski wrote:
> Similar work was already submitted for D1/T113-S3 LVDS support, which seems to
> be the exact same situation as the A133.
> 
> See: https://patchwork.freedesktop.org/series/145276/
> 
> I just made a review of that series and find it more elegant in various ways
> (especially since configuring the registers in set_mode is not the right place).
> So you probably want to follow-up on that series instead.
> 
> Note that both D1/T113-S3 and A133 support a second LVDS output, LVDS1, which
> uses the traditional TCON0 LVDS PHY. It would be great to be able to support
> both outputs as well as dual-link modes!

Thanks for the inputs. Yes, am aware of that series in open. I couldn't find time
last weeks to clean this patch. Will do it in a week or two.

Thanks,
Parthiban

> 
> All the best,
> 
> Paul

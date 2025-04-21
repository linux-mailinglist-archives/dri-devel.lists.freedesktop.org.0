Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B995DA9501D
	for <lists+dri-devel@lfdr.de>; Mon, 21 Apr 2025 13:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E07E410E37C;
	Mon, 21 Apr 2025 11:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FlLcHrYB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C80110E37C
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Apr 2025 11:23:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTIIXjmrBtQuQveTErnOzoiUwk6kk3J4f+EvkVhP7e14EuPqU8lZNnCHjahuOkv1QXpqBZr9PjG6v+5IoAHfdPz3kVZoET98Z17Nz4KCao7xAtF76qYluMlL0D1+z/DrwM2XXjJjynGK4Pn6Utsm6xuBtFsPc0knGK29/vj2TwrgaOWpUKYTKuwwS1dru/kaJ2QIyDMPPL4lulhZzcMFtfAG3ebLg4RycncOFXDZXZF2Go29u77liNj7gMATgxJr0Ig2QiGBhA3oOxU1oNCQUkRFxLEDkRc7JyIhuVIA1O4tIbMwy3KIBrOuDU5PuU+vNNXNbv099G199GWsHGZCyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQAFjHR31wI8S1gYXP4BvkflWvKM6+IY569g+dh3zU4=;
 b=n+PDZTO54d4hKAmLMXmYi7yX9/9ii1tdTwL2OlLy1MFzswSRDU2Ry77tEJ79KaQ22IWP7Wa19Bc4GWNycZnDE2CBlZ/RHBNVyePyUZVz9VU2NM4uJE+vE8ezR5GM+e6TD7ufG8LctK2Rel693rjFz36c7nhr6IQylIG0aXyGVtgSEi6xYTz6uU/21vPBra00q8wccPtvL1Zq0QXH51N8W8fE/LkbFUzbEtWXSbA2RacFLZTRA52oq8bfWLHvAMF7T6xIUmCH4Z0sfW0uIytTHeZet537l/u6mL3FzWSsm9mSbClH7WqfDMP7jltAliOcF5lQ2x/bQW7zvpKM14dxcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQAFjHR31wI8S1gYXP4BvkflWvKM6+IY569g+dh3zU4=;
 b=FlLcHrYBODkh+hKmZXfn82v1sKzRYSCJoZSIlv4LPgIgZpuf61TnxYSWJy3ctn8dRb7XH9rifx/Ke/dMaJIBdlrJu/hjoi26dnpUaqI1gjTxkEM6fgj/F1Nzy9oESKUjSzoNPsiORc/J/i106P561ECzyfPOLdKsKdX3bL/JBcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by SJ0PR12MB5612.namprd12.prod.outlook.com (2603:10b6:a03:427::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 11:23:48 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.030; Mon, 21 Apr 2025
 11:23:48 +0000
Message-ID: <91f82c7b-26d7-44b3-8c11-1341c020c022@amd.com>
Date: Mon, 21 Apr 2025 16:53:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: fix the warning for hit_low and evict_low
To: Sunil Khatri <sunil.khatri@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <dev@lankhorst.se>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Maarten Lankhorst <dev@lankhorst.se>
References: <20250421111902.698287-1-sunil.khatri@amd.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <20250421111902.698287-1-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0157.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::12) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|SJ0PR12MB5612:EE_
X-MS-Office365-Filtering-Correlation-Id: d6e21aa5-f637-43c5-339f-08dd80c6fc8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3BIanF4S040enJOUWc2OHFKYXJycysyQmgvSFFObi9kdHcvdXA3Vm5NREwv?=
 =?utf-8?B?MDN2aTBuQ1pZbTQwaGtLbXpMcWZGR0taaUUzUnlvRG5aZUVRMGFRKzVzNnJz?=
 =?utf-8?B?eU5uTS9LRkJKYThIcmlhR29BeCtqUUZHaVd1U3lkY3ZLKyt1cDNvbG5CZVFn?=
 =?utf-8?B?ekRkb0ZuMVNJWmFrYjhFcDJCcytlMGl2aEQrbWtodlRnSGRSV01JVG1PQ3dF?=
 =?utf-8?B?SndlOUljZmtXQi9rT3ZBNFg5QnEwZFhsRFA4WVJxbzY3aDJsaEVNZm9aTEJz?=
 =?utf-8?B?ZHN5bS9YNktNSE1hZktpYmNsL1d6NTFaemUxd0lMRytENkcwYU9FUXRkTm1i?=
 =?utf-8?B?Z003VTQ0N1haUmhvdG0yRDFSOStWL1BwampVSFZicHFiRlAvejZkemg5OTN1?=
 =?utf-8?B?OVM2RElJS251TkxZcTJHancyRkJNbW55WVRTSlNhYmM5aGRCSUJWKzBuRm5s?=
 =?utf-8?B?dU5xUVhGalVsa3ZHN1VETjlKVUUvd0lMWW1JeWdLMnRYZ1NNZjFLVEFPY0Zn?=
 =?utf-8?B?ZW4rVVk3MHZxbXNMZXkzc1YzNHl4UWdLR0Y1N0NkZG84UGRWYUtMM0xMdVRl?=
 =?utf-8?B?NytQTTlRNGREMTJlREk2dks2REwxckZaWU5RdEsvVHQ3WE5aUWJjSjlxR3Zj?=
 =?utf-8?B?YitueWpHcE5zcTBxb0E2K3lPUm51NkVTNWJHOGVjRk1nUFVTb0h5NXhpSmZ6?=
 =?utf-8?B?YU0xanJTS2g1VlZoMm80NnpyVlYrcDcwYjlaL1RHWlZzUGlIcmM0T25WNW51?=
 =?utf-8?B?Rk92a1dxQkR4S3dORkZ3bmpLcXpOd2dSa1V0dHNZY0UzN0M3TDQ2MUg1OEVr?=
 =?utf-8?B?NTVMWnN2b1MwZkFJcVBKeDdCZW9RZUd6K0R0WkN4aG9OZWhuOVJsdzJPNlcv?=
 =?utf-8?B?RUNhaWFRK0hJYS9BZnFCWmM0YTFEMmlCRitaaDhzTVVIakdsWHFXWDV6ZkhK?=
 =?utf-8?B?RTJIR0MvYXlodXNyNzVrM2FMOXVTM3hCNVB4bTRUWW5FU3JQMlA2eVRmRFI1?=
 =?utf-8?B?aHJXYVdyLzR1a2pFT0pCQ25temJFcFFHTWE1T3ROcXV3OXpJMEg0MHpmTURl?=
 =?utf-8?B?MDNzdFNpYjl6N1JJOGtQcFB3c2pTd3d6Y1ZxYmNiTzRWekdHMFhvU2VxYTVJ?=
 =?utf-8?B?TDhzTCs2a1FMbnU2ZmlRQk4zenZpdWxFRnFoTnQrZVFtaHgvNTNhNW5BWml1?=
 =?utf-8?B?bWI4Zkd0WHpubTJVRFIrRFhzUWVTTFpDQlZncEVhTzI4enJkSW1NYVZxMXkz?=
 =?utf-8?B?QTljQ2Y5SEVEbm1xNGhLMjFhaFpoK0gxcUIwRXo1RDFpc2xydTZuVnBjdWJw?=
 =?utf-8?B?SGNGSVE2clQyRUozd0pCSUZnMlcvSFJ4YUhHcEpkbGkwWVR4YWdTNDhYSDho?=
 =?utf-8?B?b05oT1dRclBRcTNLQjZKQ2dDTktLVHNWZ2dHbGgxSE5mNk96UnlLbEU1VUpX?=
 =?utf-8?B?NmR4VktzbTcvb2k1RHlCNWJTbW90MFJZMkdLQzdIcU5YNGFHUldZTkErV3U3?=
 =?utf-8?B?aVJ1ZkliM2N2SlVzUWZFaEloTE1Ec2FSUGJHbC9MVHFXT3BkcExKMnMwZncy?=
 =?utf-8?B?amw2QW55SjZqbWptcmF4SmtKYit1R3VqSWt6OUE2TUE0c29sVEc4amppNjdV?=
 =?utf-8?B?Rm9DRVA3Q3I3OFZjZ0Y1N01YUnR0Rks0NHpCQkxLODFiblh4enprOFFHMlEw?=
 =?utf-8?B?dlJyaE8xdmp2Q1A3amtORmJkTnlwMENDenhQQmpLN1EwNmcrNnczeTZuNGta?=
 =?utf-8?B?WUIweStYVnlJdUlQcENENkFxa1M3T0pISWVzdXRQU3ZBQWRkTCtBUnZzS0xz?=
 =?utf-8?B?OXRzSUZFbzF2MzZCTldxc2ZWeXlhRDFhUS84ZDAyQUpIQkdwU3ErYklQNUlD?=
 =?utf-8?B?dGdVU2xnQ3lNYXc4MkkwdjJUREwzTmZtVURvOUhtMUVkcVNkWkZkMTVZWTN6?=
 =?utf-8?Q?oay9sOeB8C8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0tpczlPT1YrVzlKMXorUWJYTlNRNEF4dDZ0Qno5bCtjMFJUR0FRcmFlN29t?=
 =?utf-8?B?UysvbkZzZXk2cUtXRXNZOEsxeVlIK0laSFc5N3NOanFWQWM1U2ZSSFByS24y?=
 =?utf-8?B?QjhaajY3V3cwWmp2TjVmSTl5Q1NrV3ZkUzZ0bkpxQ3ZKbyttbW02L2FFRnF4?=
 =?utf-8?B?VzdLL0VyUlhKcFRNWkV2bXBxY1Y5RENpQ1RlYmxGZUxyc0srbmtReHRXTXRU?=
 =?utf-8?B?T21NWk1hRUFHanhNTlJpSlExTkF3anVaUkxKTDV2TWhxcGZCNE02eUU3cG1E?=
 =?utf-8?B?L3p3cjY0N0IrQVNXRVhsYXloOGZJajhNNUEwRFhEYklqbFVqdjFjZVlJZ0o3?=
 =?utf-8?B?U0JMRTd5M2RUSUl6QlRIWmpPWEpnd2VRcmNodVVjTWV0TGFpQU9SOWxtZkt6?=
 =?utf-8?B?RHZxQjRVZjFGekdud29kMXVQTTc0aXgvUFk4cHAvSzBueFptM1ZEaTJreWNS?=
 =?utf-8?B?NUR6V0FvYTJ2UVVxR24wWmZMSXZDbjBFV1F3OFR5blkvOVU4K3RZWUxka3ZO?=
 =?utf-8?B?dlRvN1RaN0YwYURDcnprT2l3c0pGRDVSWXpGTWNPQXZZVHoyRzQwaENYWlQ2?=
 =?utf-8?B?S1BBaHY4UnNrS0x1NWFjeG5vcWdlN0RoekR2WjYyZ3dwdGFHb2ZGVDl2V0Zn?=
 =?utf-8?B?K3RQK24zamxCbjFSMksvandUMnF6dFpYQWU2NjV4UTZhSHFEcWg4cjdBdnFO?=
 =?utf-8?B?WmRZYVQweTd0ZVBiYkpmWC94NkR1T2J0aU9CVytQYms0anZkcHg1NFFmcmQx?=
 =?utf-8?B?ZEIzNnNHa2hSVnloU25FVmxGbU9sOExBNnFYZVprcWZJUkxXOEFDRmg2blIz?=
 =?utf-8?B?RU5JZFNzc1JYeHg4Ukd4Vm12Y3I4T0hhdUxSZEdEQnlpdXp2UHZ3M3ZFampJ?=
 =?utf-8?B?SlJPdFQrQ3BvSFpIZzhJM1lhT2l5Z0I4djRMUFhDdjJ5TjBubXU0RWNkVEZi?=
 =?utf-8?B?bElqSWVXQ0R2TVJVWCs2WFhjN2JKbWxrVkdhbnlmeksrYWRDaGlqMy9oMUpj?=
 =?utf-8?B?ZGF3QnVjNGFDVVNCMTFqMnI0MTRIM0pRSDJUR1dueGI4WDJSQzFKeERzYmdj?=
 =?utf-8?B?ejZTdWZpL1VldkNRWEp1T2FrN3l1VE1VTmVIQnJGR0RLL2ZZSDdURklrVFpY?=
 =?utf-8?B?NytDMTBFQnFvRUNCQko4WkNlTG9LdWc2RmRWaTUrdnBNU2dwbW9iOVI3TXJ5?=
 =?utf-8?B?Qk5CaTd0L3ZUYWJJa1Mzc3N3RThRbXExVVJHb1RZU1hYbWNERmVpaGNkeHhH?=
 =?utf-8?B?TXlpd1FzaXIvaDN3R24wTXFqZUIrSVlvUllhaTFpZlBjUDdOM0FzZW41blA2?=
 =?utf-8?B?bEtjZ2FERGg4cFROYjV2OHp6eU1ld3paaE1GQ09vS3p6cUdhUFlsR3kyYWl5?=
 =?utf-8?B?UFRBVDJNZ2luTWpWVXFxWW5TUkhxTzZiNWdvMGU2K2VlVnp5Tk02bWtFUkxH?=
 =?utf-8?B?Z0JBUXVOVmpIQVNEOGhTOXVkK3IyZEs1a1kxbXFuVHQ0K21TQ2lWYm1LOStE?=
 =?utf-8?B?WnVIa1NsclU1OWlUaklOd3JmOXdrK3dPL0prcHB5U3F4M2VaSHJZYTdOMTNJ?=
 =?utf-8?B?ZkRSbGVlcllQVDNrUDNjMXVxaEhveWlsR0pOR0d1WTFiSi9PaXgwUHNXcG9G?=
 =?utf-8?B?NkluM1pqZlk0LzgxWUdrY1hqQzB1N1I0QkJ6QStXTUxXcW1vVEh4UTU0dEpB?=
 =?utf-8?B?TFozd3dyVTZETWpURTlyVXZLZ2RoV0N5ZHo3S1huR3RqZmtpK0Y3TjlQVDZL?=
 =?utf-8?B?d0hXOHRJZzlZd3ZQb3B5Skd4eDZvOGhjZFdPTFVSM1N6enZOQlZvS05oQjBN?=
 =?utf-8?B?TjFhd3BEUXJpaDRVN3N2a3FUeUJ3NFd0WXFhL0Fta2hjZDNDZmlBSTI3L0x5?=
 =?utf-8?B?ZU56b1BQaVZTcUxKMmlsYzJMMHhYSG9JbjlKcW5ZN015eTliaEwyblJQa095?=
 =?utf-8?B?QWlLT3F0Sm1pRmtJdXNvSENTUkhLTm42U3ovbGc4dVVPRHRMU0hkcEJuamFU?=
 =?utf-8?B?enhFRk5aOUNndStYVGdIS0hlaWFCY0JKSWVPelhRSW0xc05tZmw1WW5PWU1B?=
 =?utf-8?B?eHZUZDZjcmFnL1JuUW5hUjNHZVdKMFhERldHNVhqd1hwSm1iZ3lvK1FNR3Ey?=
 =?utf-8?Q?9FMombA5VyZclc94DDYoo/zBA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6e21aa5-f637-43c5-339f-08dd80c6fc8a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 11:23:48.8336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+QcjNKWOFoghDgH//7rP8efPfqqgdSNRE3A6pe/P4/aKYsnkKE2wEK0ifJbEdD1K1dppAkRU67tedQhAjd/dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5612
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

@Lankhorst
Does the comment sounds correct or could you please share what should be 
the right comment to add

Regards
Sunil Khatri

On 4/21/2025 4:49 PM, Sunil Khatri wrote:
> fix the below warning messages:
> ttm/ttm_bo.c:1098: warning: Function parameter or struct member 'hit_low' not described in 'ttm_bo_swapout_walk'
> ttm/ttm_bo.c:1098: warning: Function parameter or struct member 'evict_low' not described in 'ttm_bo_swapout_walk'
>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 95b86003c50d..5bf3c969907c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1093,7 +1093,8 @@ struct ttm_bo_swapout_walk {
>   	struct ttm_lru_walk walk;
>   	/** @gfp_flags: The gfp flags to use for ttm_tt_swapout() */
>   	gfp_t gfp_flags;
> -
> +	/** @hit_low: Whether we should attempt to swap BO's with low watermark threshold */
> +	/** @evict_low: If we cannot swap a bo when @try_low is false (first pass) */
>   	bool hit_low, evict_low;
>   };
>   

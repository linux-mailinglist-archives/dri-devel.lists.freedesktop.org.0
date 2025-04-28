Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12ADAA9F3AB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 16:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFDD10E5A2;
	Mon, 28 Apr 2025 14:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GTEnGecM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2059.outbound.protection.outlook.com [40.107.101.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF8510E1FA;
 Mon, 28 Apr 2025 14:43:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeNHcP1aSZ9Wqb8jn4N2K4E88MwvrIbklQL8eDRfXzHjiBt8ru9T9Yrr3f6T4fTMMQ+F2fTGnTkbRo3Olj49YGv6zwjl316bmKtrgNuNNuJqnPce8hiE+7d8MPEePp1pX0phSJjAgh9SxrppyfCwwx7GNh6uchTVN8Wa9LkVzOQcPjqJsfG4bRE/zABdcgRzeNDmWEN0bFYTAzpci4xCqrvtgeviaEGIK7pUTsamMvT50VK5XhtIzk113jdmpirKdxeVM/frdPIPi4YpLFvj6i/hOzcfM6kjdbCCY+TF/1+DQSrsldQFIZS0rGonC/djwFjUyxTEs0eGnbKNUHQu9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDXJCYgS8YhfzxJ84h155EjWB35oXMXc8zZx4Dizg/o=;
 b=r7DDkaZOUAD7C4Ou4K7r/vEIozu9qb2sei4ImSswir7xKj1880D8AqZNi+/+T+qLoZiKuRT++k6fvacdEKnYJemg3Z7CQOmNWNGw61KRY9p69PBB8aM/lIZDAHa3icNtJK2Fa0UleW7jThaYzW19vbRKIvp6q+LPmHBa916kbRABvztiW1QoTfASj/EUw17AC4FNe50Dm4s4zCoErw5MNkfBrCKoaZxn4RTUdCEeSapr/mWIShJuMxZlYOwVTzDsJePBW7RCQRX0ou2OmeK1ue0UFGBKL0PbATW5lUqls+X0gAOGGL+XxvZD1cMcWTyyW20g0Up9QAXzG2OfVPv1Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDXJCYgS8YhfzxJ84h155EjWB35oXMXc8zZx4Dizg/o=;
 b=GTEnGecMs7NuH+TuJXfpm1kRsOjJBA71y9/4AN7EoiPxzQXx9q+0eDVPFoex2P4/tLJEEvAXGuz5KXEgsyjpFHnzLPnmK9TTWrFZGsPDtT7dTrSfsOPRi6BFVQsFMbL4GkbrV1UDVeHoKyeB9Mz9bH9gYJdD7jHJAi9qpOtATR0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7755.namprd12.prod.outlook.com (2603:10b6:930:87::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 14:43:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 14:43:36 +0000
Message-ID: <346aca82-68c9-4572-9979-cd1e47c589a3@amd.com>
Date: Mon, 28 Apr 2025 16:43:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/nouveau: Simplify nouveau_fence_done()
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20250424130254.42046-2-phasta@kernel.org>
 <20250424130254.42046-5-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250424130254.42046-5-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: ff141f5e-f964-4e13-8a8f-08dd86630e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2x4RlUrYk1oeGVNU1E4b3BOR2VUM3g1aTIwSUYzeDNkZ1hubzAvNVJiQjhU?=
 =?utf-8?B?TnZna3NicndkVTJ1dUkxV2F6bUtIRjRiN056U2FBSGd6dFdqQVcrOUR3TTlq?=
 =?utf-8?B?dGNQZzQvVnF3M045SDhMNUpRM3dCMDNFYURhbHRPSmR3bXhneGQ0RHA5Mmpt?=
 =?utf-8?B?dWl6Q2RtcjNlNWs4SWVGYlBQSTY5NElVZXVlU2pzay9EcEVkWkw0MzZPb1lp?=
 =?utf-8?B?M2RkZXVHdkNYS2ZyaEJpR3d4NmIyZldSeUpkZUdZNEZBNGwxL3RzdjBpd2tm?=
 =?utf-8?B?SVBYN29tUWFBbWV6L04rNnJPN1NaK2FPcHdOditXL3BNZytZVWpVSWpCN2JC?=
 =?utf-8?B?U1pKZzRtTWZ2K0psQUxMUzF1VTlCcnZtL3lFSytMOGN0ZXFtVzZpQTJmM2sz?=
 =?utf-8?B?S3BVM1NUbE9wenUrQ2hDS2tQUCtmWWh5RE1WM2JTR3VWVUpzRlVVOVBoNEZU?=
 =?utf-8?B?dWR0ZzZsMWkxTVNKbERDek1DbXdCMzVrQjd4T3I5WEE4OC92VFFlMkswak5H?=
 =?utf-8?B?R2w4YUhoZ1lzMDdza0doMndLS21sWTEyZ05UY3lZeFM2Z2pMZXB6ZlZENU9a?=
 =?utf-8?B?eHZGTnJPYy9FWWV0RFV4eDQwVnJQRVUyeitLclNGTDdCSHJvZnEyMGZyalc2?=
 =?utf-8?B?bC81b0V0RDBVc1Y0MzNvWGFRN3BJZVQyeUVheVNCdk9McmpoVUgvSFRDYUQw?=
 =?utf-8?B?MWJGbkNKMkxHejB6VmNab092WUI5MHhhaDd6ak91QW94UVdNNlpFWjRuQXdt?=
 =?utf-8?B?ODViZGNKbzh3ZzJJcjNobmpxcFg2WHdrNXJZazlnU2NzSHdOaHVEZWk1ZW9Y?=
 =?utf-8?B?eTlQZ1ZkcjVabGhLZDhYdHd1SWJEaVNOZVVhMVRTbTFINEpsVitlMG13L1NO?=
 =?utf-8?B?OWU4N2RmVkxPbDNtY3pHK2x5MUxzR1ljckxIR2I0WWxGemVjMWU3alVZbFhk?=
 =?utf-8?B?akx3MndlbzVabmxSZnRyTEF2YWovaDhFZWp0MmJmTkNJKzBEc3NmaldLM0M3?=
 =?utf-8?B?V3psVTlJM2E3SStJQmw4bDNiUU5MREFEalNyTmtaRnZxMXN3OTF0bGVUSTBK?=
 =?utf-8?B?MVQrQncvakUwTWZGUk5KRHYwVCtWb3ZENDlNU2NJbUdySXZCSzRDOFA1VlVW?=
 =?utf-8?B?MXN4cEdCa1NQV2RwSEdjdDVzdVJaaTh3dlBzQllPSSt1OXJUdWNUcVByZ3JL?=
 =?utf-8?B?YWwzRHJkZERZeXRDUW1TSHVDNHpmVkRnRnJzYlRadUY2Szhhc2preVQxTVZq?=
 =?utf-8?B?M3ZUWmRLT3B3V1dvZTdVTVpaNzRUTkZHRG5lZEZYUm4wNjhKQ2JjZUtrb3dn?=
 =?utf-8?B?b3U4T3JzUk8xQURtWFZJR1cwNWlFaHkxOW5NZ2NzdzF3STBMTE1iaHV3UWll?=
 =?utf-8?B?ZmthZkpTdE5kNno1SCtmNWRWRzZWL3h5N3Z4VUh5c1VBQVJ3eDFBaUtNdXRa?=
 =?utf-8?B?c3psMk1vejB2RE5HWHY0ZzdLc3RZdTI3ZlRSN0V6VkNxb1NMb0xwM2lTTW9W?=
 =?utf-8?B?T0Jta2dyVjVKQXpkeW9USlY2QlhDUlhQSm1VYUhsN0UvcFFRb2RqWjZzOUQy?=
 =?utf-8?B?d2ZvK3BGQTAxWUdsVGRyc0h0TU41eVhSVW1rUGRGQWQyOUVBTk9lbmhPRHNB?=
 =?utf-8?B?TUEyKzZKSll5anJuaUIrWkJCQmhUc0FhK2RjSjExeHM5cEJqdy9CancrQ2d1?=
 =?utf-8?B?UEJ0ZHFVcDg3c1ZZNGFKQ0lxbmdadS9hOEtLbU5jMjdUQ1Z2dWpSRmVQUENZ?=
 =?utf-8?B?U2lnSTEyeEJ2RzVuVzF5ZWp3bDVRcFVTK1lWRkhveC9QNm1MUUxOVXAweGJD?=
 =?utf-8?B?dzFZdmI1a1N6bzJ4Q2piZlJ5eVVHbWg1dDVIUEE0SHpxTFIwM1FWUk53MElE?=
 =?utf-8?B?NmxEcHBheXRTalJxWGd2UmlJbUtudVJIdHQzWmQxc2ovcml3TEVERjRXK1Jl?=
 =?utf-8?Q?WkmXGf4wdFQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzE4T0t3WUpVUGdWdU1oSjdacHAvdmxNcXlOM0FBTndIWjR6S0piWnlvWEM3?=
 =?utf-8?B?OG05MSsrNXgzVzZpbjVncDhrcWFoSWpINEVCeGVjRnBBMmM0NUJTeHZwb2pG?=
 =?utf-8?B?ZCtsdkswUFIvb1k2ZWRRYmFuS0V6WFhaT0RLMmxQd1VHNWRCWTdZWUNqMzcz?=
 =?utf-8?B?NGpaSVJ5WDhNWFNVUEpid0pwN21uYk1sT0hva3VGMDhDN2wvbzFBaUFpanJJ?=
 =?utf-8?B?ZmJUYktSY3d2b0RvMWpKUFNKR3pVQWxIQ1hvaW8yL1ZhZnR2dUs3ZzJrcDRX?=
 =?utf-8?B?cDRsMnRYdVdldmVRZFp5YWl0aUp4QTdmVFVQWURpNk1nc3AzVkt2MmtndWtz?=
 =?utf-8?B?aWtMbkdFUDk2WGFWRjZ4TlVvM2ZJbzRvKzd2NGw3YmluOENXNk9TeDBRY1FL?=
 =?utf-8?B?Q0EyTjRwRnBSK0NwSjZFVVlNYkhDU0svOTI0MzFMVmxNODByR21CMDA2WnhZ?=
 =?utf-8?B?MUM4WWdIMjVSNFZUdXNjMVBhbEdSUWxpSy9aQ0x0aWYxQnRxUGN3TlhjVWhE?=
 =?utf-8?B?eFJSS1VsQjdHcFYvSERuMjJXRWVtcUZ2WXMvN3VTVVlBdnB0bG44NUtwbkxI?=
 =?utf-8?B?OW9QSldFN0VpejJPbzh2MW9TZUFiV3NIUFdOeE9BY1Noam5GeENyNFlVSnRr?=
 =?utf-8?B?OTMyRDBwcjhMbU9BYVlOeks1azlMZWJtb3VMYTNnYVN4NkZsL3hpVTVtQWRX?=
 =?utf-8?B?TGh2R0trUk5scy9admVwY2VSOVFsUjUwdkJ2UnhQN2VmMVRhTEJEbTlrTlFM?=
 =?utf-8?B?aHFCYUxKb0F5cVcrUjhOdm5jTXRzVjdScFBtYjJyd0RCdXMra1NlU2crV0NW?=
 =?utf-8?B?ZUxBcm16VzJMZEVJOGRtNnVBWUVTM2tqMHJYUjhBN0diVU9oSi8rRHZGYjY4?=
 =?utf-8?B?eW84UlRCMEpFWXBjZ204V3dKRE5MWmt6cDN1RUpzTENSd3A0eUhlNnM1V2kw?=
 =?utf-8?B?R3R5dldvWU42UWVpb1hGYUdBYTQ1MmphWXRpOXgxWGVhbjNsVTBXZFFkQWdW?=
 =?utf-8?B?cFVsSDZHRlpiL1p0Q3NJSGY0b2wrbzlNSnhQMjI5RU91dzBuZlp3NlNnT3ly?=
 =?utf-8?B?ZjNqd0hXYkFPVmx5eWYzakpINm9INlpBc3BEL2orQ1JiYkRENTNNRzloTGo4?=
 =?utf-8?B?YTRqWGNhOUZWSjlVV1pGSUJ0a3JvalM1UWl1VVVqMnBCUXo5OG1xTUFWVFpS?=
 =?utf-8?B?L3NDUkgya1dxYlpKUmprZ1cwY21wSkJkQUhCWktMVi95c0t6R2JNa3U5Wkk0?=
 =?utf-8?B?eHlnOG16UEtrWDI1S2txTkNJZHpnNVZFZTVxMWlVdkNkMTd6SGgvSVp4cmNW?=
 =?utf-8?B?YVJub1VNQ3BEeWxGK0xic0t2dUxNaUF3MFdjKy9qTzNndnBsVWJzY2VENzl1?=
 =?utf-8?B?UnRBOFd4SDJxeW9CNjFpamdzRXhoWHZreTAxUjd6RzAwMjAvSUZac1JHaVRh?=
 =?utf-8?B?NWhSS2k1dnJGcXRIMHdTSU16aDd1VEgxU0lTRWRyUWI2d0tsTm85TGlZb1hp?=
 =?utf-8?B?bkVraFdHbDRCc2IzMXhXaEoyaEVsMGRFbEM2VnRxOXU2bytpYWRwbHRtUXlW?=
 =?utf-8?B?OVF3S3hDbTdhZ0hCcmVkdUlEZ2pFQjZZVnh5Zy9qclNaa0VTUmk0S2pqMnZ1?=
 =?utf-8?B?bE8vZzJDN2VaRmxrY09BRUk0Z29kUHQwYzRKOXVuRzRLK2NQYjBNVjh6VkZO?=
 =?utf-8?B?NGZqZWNndkJqbVZUK0ppVmduQTlUdkxJdlZBUWplT25lTEdEQlZQS1JibnlJ?=
 =?utf-8?B?T0RuOW9YdDBWNkc0c0s1SGJncXErSDBGRm5YbkVPdytlUU1XbzZrd295UlpD?=
 =?utf-8?B?c1MydDIrSjNBYW9wSHhvbkwvNE5rTTI1cGtPV2ppTjJ6UThiUXhuL0JjYXov?=
 =?utf-8?B?eGtHUzk5WENVWXpDbWxGU3M3bFNOYno3bzhDcXQ1d0ExU2ZVN2JhVnRwaGpl?=
 =?utf-8?B?SzA1bm9WNEU2UmxJZlRObDcrY2RMOWp1ekpNNFM2YVVWb0RWV3FGVEgxL2Fq?=
 =?utf-8?B?SUhoTlIreXNXNnA0c0hCUmE0Y0dPU0JERGdsRFFXRStRVDc1ZVJydEU0OXpG?=
 =?utf-8?B?UThXVWJ5RXEwWHRBTTRvWW9ZOThxaVpwazFQYnRlb3FoZ2lpZ1RCcjNVZkZY?=
 =?utf-8?Q?pb9iZRhNNfYWRoEM/yygSKuGg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff141f5e-f964-4e13-8a8f-08dd86630e6e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 14:43:36.1437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYXYSgZLwRIDU3Q6dKO2jesrLfUeuADZVjTusz4E6Jq8k7doVJpzHfgmdxmQXL7K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7755
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

On 4/24/25 15:02, Philipp Stanner wrote:
> nouveau_fence_done() contains an if branch that checks whether a
> nouveau_fence has either of the two existing nouveau_fence backend ops,
> which will always evaluate to true.
> 
> Remove the surplus check.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>


Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/nouveau/nouveau_fence.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
> index 2b79bcb7da16..fb9811938c82 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
> @@ -249,21 +249,19 @@ nouveau_fence_emit(struct nouveau_fence *fence)
>  bool
>  nouveau_fence_done(struct nouveau_fence *fence)
>  {
> -	if (fence->base.ops == &nouveau_fence_ops_legacy ||
> -	    fence->base.ops == &nouveau_fence_ops_uevent) {
> -		struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
> -		struct nouveau_channel *chan;
> -		unsigned long flags;
> +	struct nouveau_fence_chan *fctx = nouveau_fctx(fence);
> +	struct nouveau_channel *chan;
> +	unsigned long flags;
>  
> -		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
> -			return true;
> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->base.flags))
> +		return true;
> +
> +	spin_lock_irqsave(&fctx->lock, flags);
> +	chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
> +	if (chan)
> +		nouveau_fence_update(chan, fctx);
> +	spin_unlock_irqrestore(&fctx->lock, flags);
>  
> -		spin_lock_irqsave(&fctx->lock, flags);
> -		chan = rcu_dereference_protected(fence->channel, lockdep_is_held(&fctx->lock));
> -		if (chan)
> -			nouveau_fence_update(chan, fctx);
> -		spin_unlock_irqrestore(&fctx->lock, flags);
> -	}
>  	return dma_fence_is_signaled(&fence->base);
>  }
>  


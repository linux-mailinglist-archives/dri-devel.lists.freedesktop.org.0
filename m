Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 915FBCB99B2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 19:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C9B10E0AA;
	Fri, 12 Dec 2025 18:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PduQpG9G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013034.outbound.protection.outlook.com
 [40.107.201.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4FCB10E0AA
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 18:56:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVHhLCsqm3gjioj+rYflkRjXJYLfsGXsvbvI9BVYMrw9RCxEho+EFPp77Npo3ugKJ0sEz1eNVvRLap8/nclxnxika4eRVsLU2/AB1G8dhv6fO5lT8qfidtJ8T8pxAvGgAS5iAglXp6EmYsjE44c+PyYGRoTKnIGEMHhHkpHXnrjkOS4d43/JADpb/IocXI04UXKpk0lgDUR1ZFZd7KJpQBBdrD2buraubJxtvtlFCc2STeaUNWwoVH7jj0F+/CeBi6l+c1WJZF8D0kxYrn0WckcsRSliHMXEmFwepPQ8dG7yg+LDX3ebmqUofaAan94dlclY5Rk1t7ywJnIrpdmKvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VoLzDdHD7pkE/lwSLN9UmhyA6Cv+roMhBoYoIKJF+sk=;
 b=qNxhabqjclvT3ed3SY7UD1LyE4bgncM9eTah68kce170MH6dbgy+s4pQBq/oKe/uRny2q5P/RHZldw9J1URrvVf6e0czkfrGyC8BqBw4dYwo5vdyzRa9whHroEhFfcNVWZ5rlgzwCTy7V85NYEnSgeXvri2FRhUNDdwX3qDO+zxFm1/4aCsc0fE/WQ70nJ9FmXji+FcBJs50GJ7/7hMlo4WpThjecbcbn8MHUoF27eqNu63M0OatxVAzsP50XabTEVcm6dnvN8CahaKUel0ogygAncnR7+uVGx0X6Wo8xEFanGVbNRPUc7h01YS92n4EZ2wQqpEolrdyrssESV7TeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VoLzDdHD7pkE/lwSLN9UmhyA6Cv+roMhBoYoIKJF+sk=;
 b=PduQpG9GzZbIT21zgMMm2dqTsfD4EpwOpX3hrEBQsaC6+2CWYZ0WgWUFQ0+aaw2shsELjRvnewBoJnwvmc3iIhOaOdTxjfBv+9OJODTIXCUKpiBtRh1KV13h025N+xf1QpEcNYgPYRZV9En9H0jfwOq+pV0yKqsLT/lGhIY7OGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS7PR12MB8289.namprd12.prod.outlook.com (2603:10b6:8:d8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.11; Fri, 12 Dec 2025 18:56:50 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 18:56:49 +0000
Message-ID: <71e8ea57-bc12-46b7-8361-c640b0dd65bb@amd.com>
Date: Fri, 12 Dec 2025 12:56:45 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Fix potential NULL pointer dereference
 in context cleanup
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 maciej.falkowski@linux.intel.com
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251212183244.1826318-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251212183244.1826318-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0152.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::20) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS7PR12MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: 80862de6-8a8a-4070-5b97-08de39b034cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejN3OUtLUW1DREN1QldkTHd4U1VhR0dQTW1WY1p2bG1SVFNJUzdCSWJhODZ0?=
 =?utf-8?B?WWVibVY5bmU2YmVNaUhkNEROZk1NcDZMS3FKNWliM1ZIQVZrVWo2WHhhRHJP?=
 =?utf-8?B?ZHZFQzB6WkVqU1paZ1dTMWgxS25pNXhpRU90SkhUM0IzYkovd2syNmdCYkNy?=
 =?utf-8?B?Q3pZSWFrZTFmWFlyTmZTZXlxYUd1OXZOZnI4d29ETzdCdmw0ZE1VeXA1QS9Q?=
 =?utf-8?B?NDJlOXFPdVVCM04xTStBcVdobEcvdmJqT1dxaThpWENDNkN0YUFYcCs1UUE4?=
 =?utf-8?B?U2RXbHE3VTNySkYzRmY0VEpxNEpVZFgzUVp5aFVIUlRqZkNibWpsMTdGZW8y?=
 =?utf-8?B?T1ZON2I0MEhjNGw3UU9RbkI3Nnl4KzVORFJoSEV0U1BBV2xEUFVJeGErdHFF?=
 =?utf-8?B?QXBheUxaYmtycytjdVJtaEVkRVhUK2lRc3dINmNtOUE2UVFZUkszSjc0dmNZ?=
 =?utf-8?B?WE9YVkd6NkdsL05zN1B3RkNZYWY3TjRoelNCaHBsbTBNZy95dkswUEI4cW5C?=
 =?utf-8?B?M2lPTWJHOGhMcmtkbzhmYlNHZ0h5MERGdWVFK3RsMmRSQXpMNjMweGJmMnZj?=
 =?utf-8?B?YnFHUUR0KzJaVHFyYUtuUGx2b0lYcnc1QVlwN1JYQnM0ejlKajNmSlZKeTZR?=
 =?utf-8?B?bzBXMXR0dUwwVXFTaUxpOFcrVDkxcTJKeWdTdmtlNXNUT05WU3JoMW5QTXZq?=
 =?utf-8?B?aWN4SmJnODJiYWpTNjRXVzhxMTRxL3o0QkZEQm82Ulc0UU4xcHg2MUZyR3B4?=
 =?utf-8?B?a3loK1lzRGs5R1NlVlRxeTNnc05zTnpsblpMdTE5aXV5YTVwVWM3Z3JGS3FV?=
 =?utf-8?B?Q0l5K1dFSU1rZTBnSnRxd1U5bHdmUXdvKzFwMDU2ODdPSE5ZRTYrdktJaEdu?=
 =?utf-8?B?NkJVampkMkZXVmU5a0ZyNWZjRWx6K0xnbWlIaXRRUHJ5TVpDNGNtWFduOEpv?=
 =?utf-8?B?Q3Y5aHQxeEVMN1YzMVZwRnVYMWlsSlNwN29KZFlzc25jT2p5b2hGcDBhRHlz?=
 =?utf-8?B?QzZPM1p5ZFhxUlFpYkxYVUpSQ3dwWWxuSlU0NkNNUVplMVZENy9mc3pKSnFm?=
 =?utf-8?B?VWpvSitCVFFvUmRIOTV5Wm9GdllqbWh5MVRZSS9MNkZiT2llUXdIMXcvdk56?=
 =?utf-8?B?d0RyeXA3SzlGM3Bvam90WENCTWZGYzVjK0dPcHZJbFZ5em00Y0pxOUZmcTl4?=
 =?utf-8?B?cTBBVGduU2dQK3ZPREJzNUw3VjdJeTkyQUloVmpyMWpJa1ltMTZWelNzNzNU?=
 =?utf-8?B?NTZvKzhtdzVZQ3d1OElUWWRaUTBFdDlpNG5BNG0zaE8vcVZnTnZEeFdEWVo1?=
 =?utf-8?B?K1FRRVhCTUVsU3kwZlUvM2ErUG5pL204cVhIRmVVWkhIeXVyYnN2THQyNG9U?=
 =?utf-8?B?S2lPd2txN2pTWFQ0VWxvN3dHZTVOTHA5NlpuajJVUDQyWm16Yi9odisrZGRr?=
 =?utf-8?B?Y21nazB0WW92TTBFSVpvcS83Q1RpUlpSenZiaEdKeG5tQ3A0VFpGM21KVUZ3?=
 =?utf-8?B?U0FDcU0yM1h5UWszYk8xS0IyTnZFQ2ZoODZEOUdMNjJsdjEybVJldm9zUmxE?=
 =?utf-8?B?aER6VlFxRXhpeUFEWTkwT0Zrc0FEbk5TbkloWElSWXlrV2NzUUNySmZFazJC?=
 =?utf-8?B?My9Tc1pDU2MrRGlkQ1N2ajVIMTR6bzlmZ3I0bG4zR21yNzl0dEpKMHpkbmNZ?=
 =?utf-8?B?ajhsRENGWFhXVnRjbGJGdkUyVWtMMzFxUVVnQlJQNFZSU3NVTm1XU2pTMVM3?=
 =?utf-8?B?ZzJJZUhaVzJkMVRCc21RMnZBcSt4ejdQMTZiTTdSMEQwNVptY1YzcktnOUFJ?=
 =?utf-8?B?QnVvZlFyVG8wcWtOSXlwTUJZTVFmcWUwRGZwVWlqam9xdEFBY1RSNE52NGpj?=
 =?utf-8?B?RGt1T3l2cGJ1cmQyaVZpK0I5cnY0RHVXNFdXMzBVZ0c2T3JIOGJEYkVRU0pT?=
 =?utf-8?Q?M/T9sCNil5/FUDVfkfsNVD4akxpFaCNn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzRIcHFKdC9SdC8vV1g3RFpwRGlTTTNkZkk0Skk4cTJnRWdSOEhwWktBL29V?=
 =?utf-8?B?WllhT0EyS0N3ZkNrYU90Qi9ON2xsYnMxMXpWQW9mcklLSE1lNjFNd3U3TlY5?=
 =?utf-8?B?bzZxbkdhTWlGQW9BanA4WGFhOGowTXM0VDQ3OFFHbXB0NWJIOTlySHhMMUU2?=
 =?utf-8?B?S04rcHRiNldMcVpFTXNhbWV2cnFCeWdEdklORU5NQmRFUjVTcEJESUM4dWtU?=
 =?utf-8?B?bkJHNmJDRG1ZcWRiNGpDK3BwZzhXOFpMMm5mWldyeXRyTVgyU1A2Vm9iUmdS?=
 =?utf-8?B?bGZpeVlZRzR5alhIeDBTMnlOZGFUUGQ4Yk5XR2pzQ000MGxlZ1FleUl1RXdB?=
 =?utf-8?B?K1QraUFreUdMdDVKTDBlOElPeXoxRExvVWIyMXd0UXJlZ3V4VVg5bVpYUjhV?=
 =?utf-8?B?Q2huNmlIMi8vcWlKMkRiZEVIN0JQbWxKUFdaK0FUQ09aSVlCNVpFa1FIR2JC?=
 =?utf-8?B?VWxvTXpqdTY3ODltNHdkYUMrT042L0xzSGtyaTVrc0MwMzgzVWlUT0N3dVc5?=
 =?utf-8?B?RFZveWZqekJYNnZYb2FMWm0wdCtyelB0c29wZStnME5PeUNoUEs2MkRoeE9Q?=
 =?utf-8?B?MFREa0FIN1A5Y3kwVGxWeU1PTE1Xc3hOa3RYdUhGZGI5Sm53UEVQMityajkv?=
 =?utf-8?B?dTBleEg0RCs4RjZXanY4TVJGNFkzMTZxcDJLVmdMR2p3aE1VTndraUNLcnh6?=
 =?utf-8?B?Q0RrQWFOVEp0Q09HVkRkRThnS1c5UXBvWFBCb0JQSTllUGtXNGZDY1NYenhN?=
 =?utf-8?B?LytyRFpUbE15Smoyd1FoUUk5dzFzUDN3cFNkQXRJczV4UUNTcU5PYm5vTnY3?=
 =?utf-8?B?L0hTcWNmTjVwM2s3SEI4c1ZheTlDV0dnWDVPT1I5S292dEZuWmlTNEtCR1Nm?=
 =?utf-8?B?S1AxdlVwK1NPeGI1em5QTWV6NGJVamtXd2ZuZENJUHRsTWo5b1NXOVg5SU95?=
 =?utf-8?B?U0RPTHNidUgzakJhdkI1UDFmTEthK2loSnRqRis4bWdkS0FIWURRS1JPMzVi?=
 =?utf-8?B?V3p3WmlNdjN2ODh5R05scmRvNTZCRG5ic2lLQndZNXl6Ym1iM3NQZmsyMnkw?=
 =?utf-8?B?TUsvUm9QQlY2NXBETVdTZythb25pdXlBUmRVYTYrSmlrR1VhbFQ0a1JjOTdD?=
 =?utf-8?B?RFNTZ1M5QkRXek1sRnBzRjg3YU9NeFQzWkZYSFJ3WWhDbm1DdGduR3NNLzRM?=
 =?utf-8?B?cVhjQWxKSXJGVkRCTW8vaE5BWm1JSFJxQ2N1YnVrU1JjdytDV1Y2SGx6UE14?=
 =?utf-8?B?K3NYcE94WnZ4bkYyQURhb1lXVmRqNmRBLzJHMkFyYW9iY3NOcHkxcTduUHdq?=
 =?utf-8?B?S2JDSGRSbXFHUFp6dnQ5amhPOXMvdUJNQnVaQU90Y3JUMGk1TFRCZExXMGRW?=
 =?utf-8?B?SkNHazVRQlJzL1dQOHJqMXhHRWVYZkl4STRtY0V4QXdFVmtvSWpJcVlvK3VW?=
 =?utf-8?B?czUybk5zWXVWS2pPOXUzTVdBSU9Tck5RaUVhSC9vbHFHcFZxUy9kY0VONkM3?=
 =?utf-8?B?VjIzbHBrQm9sWldYSXdOUzFDd25JaU5wWlNOT1A5cHVxSEV0cXZJdTFaVjFu?=
 =?utf-8?B?VUxSeG03NVcyaktyelJUVVErOUd4YXhicFFOdWFxSmVjbXNackdnL0hnYXho?=
 =?utf-8?B?MEFTSVRSNEpsLzQ2NjBVS0ZVU0ErTHh3dWJabkJRanRVc2Fkb0t2L0pIcnNr?=
 =?utf-8?B?ZlN0N2QrcGtlazduV0RVbzBQajk3TmNUUkszbkFwSkZ6L3VjckRua2tJNlR6?=
 =?utf-8?B?RnMwZTRnZUlLUE1rYzRLckZTTExBZnpSU2xRdGFkbTRLL29xa0dYTUdoNld5?=
 =?utf-8?B?c3R1L2JvRWJSOE9TVmI5ZDBnT1JxYXc2dzg4RUx0aUxBMVdwMXVUY3g2MHFB?=
 =?utf-8?B?MDV0WmpyU2ZEcnBBYmw3elp6WmZCRFc0V2cyTjJFYTA0dGpyZzI3dWRmbkVJ?=
 =?utf-8?B?ZzhRWDNMWjZISUxZQlYrZHc2N3h2YjV3Q3hSV3ZCMCs0ZTBpK3E5dEJXUGl2?=
 =?utf-8?B?UGtjVWdiR2ZEN0hOY3NuOGNkTHZWUHd3b1k5bkc4alQvZkh6bm9GTXoxY2Js?=
 =?utf-8?B?Rkc5SS9oRHo2ajMrcXZ6aFdRT0l5L29WVlNCa1BjZThkbEViSlRlbmpkY0VH?=
 =?utf-8?Q?5m+uy/lwV2RQdNk6RkqcNr9Uu?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80862de6-8a8a-4070-5b97-08de39b034cc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 18:56:49.8377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LR09+IBx30adPxpr2jpOJxoMb3GCFLz3MtiU5xiVMEunzlSxd6ii9imCjHMSQaq+3eBZrYlcRliu0cXa4V8BcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8289
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

On 12/12/25 12:32 PM, Lizhi Hou wrote:
> aie_destroy_context() is invoked during error handling in
> aie2_create_context(). However, aie_destroy_context() assumes that the
> context's mailbox channel pointer is non-NULL. If mailbox channel
> creation fails, the pointer remains NULL and calling aie_destroy_context()
> can lead to a NULL pointer dereference.
> 
> In aie2_create_context(), replace aie_destroy_context() with a function
> which request firmware to remove the context created previously.
> 
> Fixes: be462c97b7df ("accel/amdxdna: Add hardware context")
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
>   drivers/accel/amdxdna/aie2_message.c | 50 +++++++++++++++-------------
>   1 file changed, 26 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 03b75757a6e6..9ec973028221 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -192,6 +192,19 @@ int aie2_query_firmware_version(struct amdxdna_dev_hdl *ndev,
>   	return 0;
>   }
>   
> +static int aie2_destroy_context_req(struct amdxdna_dev_hdl *ndev, u32 id)
> +{
> +	DECLARE_AIE2_MSG(destroy_ctx, MSG_OP_DESTROY_CONTEXT);
> +	struct amdxdna_dev *xdna = ndev->xdna;
> +	int ret;
> +
> +	req.context_id = id;
> +	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
> +	if (ret)
> +		XDNA_WARN(xdna, "Destroy context failed, ret %d", ret);
> +
> +	return ret;
> +}
>   int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx)
>   {
>   	DECLARE_AIE2_MSG(create_ctx, MSG_OP_CREATE_CONTEXT);
> @@ -214,13 +227,14 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
>   		return ret;
>   
>   	hwctx->fw_ctx_id = resp.context_id;
> -	WARN_ONCE(hwctx->fw_ctx_id == -1, "Unexpected context id");
> +	if (WARN_ON_ONCE(hwctx->fw_ctx_id == -1))
> +		return -EINVAL;
>   
>   	if (ndev->force_preempt_enabled) {
>   		ret = aie2_runtime_cfg(ndev, AIE2_RT_CFG_FORCE_PREEMPT, &hwctx->fw_ctx_id);
>   		if (ret) {
>   			XDNA_ERR(xdna, "failed to enable force preempt %d", ret);
> -			return ret;
> +			goto del_ctx_req;
>   		}
>   	}
>   
> @@ -237,51 +251,39 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
>   
>   	ret = pci_irq_vector(to_pci_dev(xdna->ddev.dev), resp.msix_id);
>   	if (ret == -EINVAL) {
> -		XDNA_ERR(xdna, "not able to create channel");
> -		goto out_destroy_context;
> +		XDNA_ERR(xdna, "Alloc IRQ failed %d", ret);
> +		goto del_ctx_req;
>   	}
>   
>   	intr_reg = i2x.mb_head_ptr_reg + 4;
>   	hwctx->priv->mbox_chann = xdna_mailbox_create_channel(ndev->mbox, &x2i, &i2x,
>   							      intr_reg, ret);
>   	if (!hwctx->priv->mbox_chann) {
> -		XDNA_ERR(xdna, "not able to create channel");
> +		XDNA_ERR(xdna, "Not able to create channel");
>   		ret = -EINVAL;
> -		goto out_destroy_context;
> +		goto del_ctx_req;
>   	}
>   	ndev->hwctx_num++;
>   
> -	XDNA_DBG(xdna, "%s mailbox channel irq: %d, msix_id: %d",
> -		 hwctx->name, ret, resp.msix_id);
> -	XDNA_DBG(xdna, "%s created fw ctx %d pasid %d", hwctx->name,
> -		 hwctx->fw_ctx_id, hwctx->client->pasid);
> +	XDNA_DBG(xdna, "Mailbox channel irq: %d, msix_id: %d", ret, resp.msix_id);
> +	XDNA_DBG(xdna, "Created fw ctx %d pasid %d", hwctx->fw_ctx_id, hwctx->client->pasid);
>   
>   	return 0;
>   
> -out_destroy_context:
> -	aie2_destroy_context(ndev, hwctx);
> +del_ctx_req:
> +	aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
>   	return ret;
>   }
>   
>   int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx)
>   {
> -	DECLARE_AIE2_MSG(destroy_ctx, MSG_OP_DESTROY_CONTEXT);
>   	struct amdxdna_dev *xdna = ndev->xdna;
>   	int ret;
>   
> -	if (hwctx->fw_ctx_id == -1)
> -		return 0;
> -
>   	xdna_mailbox_stop_channel(hwctx->priv->mbox_chann);
> -
> -	req.context_id = hwctx->fw_ctx_id;
> -	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
> -	if (ret)
> -		XDNA_WARN(xdna, "%s destroy context failed, ret %d", hwctx->name, ret);
> -
> +	ret = aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
>   	xdna_mailbox_destroy_channel(hwctx->priv->mbox_chann);
> -	XDNA_DBG(xdna, "%s destroyed fw ctx %d", hwctx->name,
> -		 hwctx->fw_ctx_id);
> +	XDNA_DBG(xdna, "Destroyed fw ctx %d", hwctx->fw_ctx_id);
>   	hwctx->priv->mbox_chann = NULL;
>   	hwctx->fw_ctx_id = -1;
>   	ndev->hwctx_num--;


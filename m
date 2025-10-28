Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D1FC16A1C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 20:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287F710E64E;
	Tue, 28 Oct 2025 19:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E08grRoy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010004.outbound.protection.outlook.com [52.101.56.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBEC10E0A2;
 Tue, 28 Oct 2025 19:38:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yaA7bqBfZN9i+ee8jS/EnBPKvSeBL3WaLMsorbxPRjStIhtWC0UnmtbTxuTl6kSffRW+D+4W9zVHAE7366FFqyqbyQMHbuFf9Bm/Yt0vikBbDz5bLBEOEi/KXPZNSlJfxtbjD0bGfHbrKnNlF8ZcpkuHrCXTx4ScOYtSsAJLfUr6dOtrY1uZ7xj2uEz8uP4SPXwQKesZ2+IqaEUWLOnmu6Q4+bruPbb8Gi/NrnVOckLCCyCxPWo8XG+Dwjh++NGCTfiVIMYKrIFYIQUoUwHIqJnQCFyjfo/lqkiW3iOHgTM2Nm04k9ZWQl4+ojuOMoKhhKLE9Y6n4BX45G1StptseA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFPccC9Fp1JUY3AO6EhFU2a4xOlp+j27+8tSHGo+shE=;
 b=a5bgbyNeatY7LHRp0AYAOTRygR0DqskqkIydkicUgvSXbv7Zy9iIMnHIy90HAQbAHp/6bVYOLo0fxdXSlvaG1RihCyGcpItjkT6eemKx0Akd6efHBRNgSY6Y6lHpwEq/rtJaaTFXoXLp3XV2RctY7qnHdWQupFNYdiZgBkeHQ+y3vbufR8FRIHgCCqt0mDxAtn24qWnGTTXJYJiT01sJbUOo5lK5dO69DD6fp/jSYNcMFv4EchGxYD7S/nF6wW40VOfjkFk3o/Jk30INniFcJvxdHhmflU1wCSG2YgzAAhtd6RBElxEsX55LvmKjiUFvK/60FJRgAF/2qczLqIEPYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFPccC9Fp1JUY3AO6EhFU2a4xOlp+j27+8tSHGo+shE=;
 b=E08grRoyflhr49oTAi91qCLmoS/tF1fH/2dM4/1Xq8kFmolkCRoHP/quzS1U0cY2WUQPEA0UYAVvy8shhFECgdxCaEc/6br5opd/woVGNAokX4mJuS4j/cAW0vp8jaw3kjSVEfjfNeyKOn6mtfX73JOEfo7GlaTIw7ufQcIP0RtWa8EtQKLtBy7M41rEq980LY85j7thaHW5dvvricvHJYKE9dYMJa8R4M3bwRu/DiPxXmqVLtyEO111JdwMwqGdyJRFSmDnyI1SW2m7at9v5M0e+q2O/bnq884gW4cnDyI0LZ9YPGJ5X2BWNWIkC1L3bgdb9LEd8zC02PlbQp5/xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by SN7PR12MB8790.namprd12.prod.outlook.com (2603:10b6:806:34b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 19:38:00 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 19:38:00 +0000
Message-ID: <2a080bb7-7c61-4fd0-9d5f-495afdbebfe9@nvidia.com>
Date: Tue, 28 Oct 2025 12:37:55 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: nova: depend on CONFIG_64BIT
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com,
 acourbot@nvidia.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20251028110058.340320-1-dakr@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251028110058.340320-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0025.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::38) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|SN7PR12MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b09c67e-e566-4a2b-4db5-08de165980ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RURDdEdsKzlDZHRPd1kwczJPWGFJYTk0N1AvVStqRVp3QWhYLzNuMmVHU1dE?=
 =?utf-8?B?VkNKbStOYWRSSmJvalplaHljUzdCRDdrdTU5YktoQ2FtQ1pJUXdXYnhleURJ?=
 =?utf-8?B?bW1vNStKcG5jY01QUCtGWngvcWU1MFRabThwcXlwbjE5QUVCVW5XQ2JDV1Fy?=
 =?utf-8?B?Q0xsR2szdU9MMkkvd3dHWUpLSlFlellTMW1qVTIxY04welcwS2FpMTZqR1F5?=
 =?utf-8?B?TkZkSWllZGd3YnZXYndPQWt2WkRGbzlDdHp2Q2pMNUpoVHh2dVRCMlBCTXkx?=
 =?utf-8?B?TnUrd1BKcWtwSlhxVjZLV2RsbTZHNyt4M3NJYzRMcTdGYk0rMDg1Y3NITVBX?=
 =?utf-8?B?dXpIK0JuRHJrNXhjZFhNRXpFU2V2dVZVaVB1Y1B5a0NBcnByS3owOS95V2Z3?=
 =?utf-8?B?bWZYN1dVUHgwZ01wVUErMWNqa2tBVWJrbEt3dE9QdDNkTW9KQndlMFlTUi9w?=
 =?utf-8?B?NlVuVjVSQ1Y5ZEFlMll6L1JkcWg4c2VWZVR4aTFCYlNuMEdzKythU254UXlP?=
 =?utf-8?B?SG5VdWljUFJZOWVPalYxSG5Ld1FRQ2V0ZGtna2V1U1hUdlVUaFlwTW1HekNF?=
 =?utf-8?B?WXJjVmZUN0s2WEZOVi8wZm80OE0vRGdlSVF2YndpZDZkYW5oVFpFUmdGS1lh?=
 =?utf-8?B?RVNXM1h6aUk0MXJybU9qbVFmQXRtYjJGcmhSeXFmN045TkhLOWtEcTF4YWVw?=
 =?utf-8?B?dmprNmQ1NHhVRlhpSDNzQ1prRklFM1A1dXNtSHI4T29SZEM5bFcvQ1BTbkI2?=
 =?utf-8?B?TFRuUFNaT0kxdGFvSU9kandRQlZEZXVCMUJSWVNONFV3WkE5aXZ4NVVoUysy?=
 =?utf-8?B?N1FGM3d4eXZoZmxzT3VJM0pnMG05eDk1T3FxZVFPelBpWkpBK3ZYRHU0NnBB?=
 =?utf-8?B?bE04bC80anBrUW15VU1FK0pNZHBMeTh0K05iQ1BFa2ZremJRdWRvYU5xek0y?=
 =?utf-8?B?SWh1T01aOHB1eE9ZbVpGS0hqRUpHL2FtcnRUMHJvc2dOcndJY2VYNTVGak0y?=
 =?utf-8?B?dG5aQnFYamVxYk1NRDkzY0FqT2dJSU0weEZlWmhtV3Fhakp6WmdleWo4SDZY?=
 =?utf-8?B?WDlBVWd3SEpPWHVOaE1OWi9wV0s5UjJsZnRoS0dYSEcyYitlTGVubUtMRUdq?=
 =?utf-8?B?V2R5Mi9DVmhoa01qYWQ0NkNKSFlqbnFTQ3d3QkI5Vng5N1VHUjRwdkZlYUk0?=
 =?utf-8?B?d2drY3JQK2pqdjNUMjBBZVh1RWUza253QXZFQ24yWk05ZjlqdEltSXhLaVpV?=
 =?utf-8?B?MzRDMTYxelhiVTFRTEVObit6MHE2OVp4TDdCbVZMRDVoTDRhdnp1RHNwZGxO?=
 =?utf-8?B?RnpVd1lMcW5FSlVsU2Q3L2doRjVoNnNUaXJETk92YkJvaGNCeUJlWXJKNjdv?=
 =?utf-8?B?ZzF1WFJjNlJrVlE3cTZVaGZmNmorcmpyUnpNVThjc1NGVDU5TVZqSG9acE5m?=
 =?utf-8?B?dWcwMkhvbWtuSXQ4dy8rL1JhZkZRY1NGQmlJdFVrSk5HN1B4MXBnVzAyWVY4?=
 =?utf-8?B?UXlzZkpVZ2hiY1hUNXBvVTlBMGhpN0ZZTzk0bEV2MzVSRDVVSGpOd29UZlpS?=
 =?utf-8?B?T1Z6RWFza3QwQzNWdVE0Y0dnMEQvNm1UaUx4V1B0UXBMWXZqdlFOb29DVFlU?=
 =?utf-8?B?RkNLLzJCRnRxWDFNUFg2WUpNeFRKYkNnQ3hhYWxRRXBNbE40SW1KUi9HdDlr?=
 =?utf-8?B?d1VsdWNLT2JmaGdxUTA0UDR0UkRnZ2VMMmt4S0pWL05kWXIwY1JyZEN6VHky?=
 =?utf-8?B?Vk5vblpIQmcwRDdKNFVJMUNvYWFuR01BOTJYUUZITFM3Y1V0U0ZPeHhpTmdN?=
 =?utf-8?B?ZHo0T0ZHWHJnWk50V2ZkWFB1WUpkZlNrZlNDcGZITExnMVczRlRmSWpmai9s?=
 =?utf-8?B?VkJwYmgzdnJPY1g3UUV4cFUyZlJXcmdUMWJHb0VreWErblhlTk1GMkFHdk1D?=
 =?utf-8?Q?NmZv3mswn/SHT0THfPoJSSizYX3oi/l3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGFGdW5Vcm4vaEpoNE5DYVIxdkV4STBoTHlGVHlVWVJzUU13RmJwVGpVK2lz?=
 =?utf-8?B?QWtsTWFMZ2dUcFR5M0Z3Q21Pcyt2V2FnSncxTm1OcVpYN2RPVjYxb2ZLVXFZ?=
 =?utf-8?B?S2M2Q1BxakY4UDVKOHRuS1B5emFMSmgrQ1JLaXdDendpT1JGYkt2MU13OHBL?=
 =?utf-8?B?Tk1wTkVPTjM1YTZNc09xK09BT3NJNER1d1ZNbUhVNzdFSjZRODNJQnIyUy9B?=
 =?utf-8?B?YWhhSjRsMnJ2US9TaitObGdOOUlrVTZxOFlkaDRuNmREaEZGRTB0TjRkVFNW?=
 =?utf-8?B?WGNnVU11SXhsTktvRGFYSDE4NCtLRXFYVmNWZkpSWU5CcFEyczVyR2JHdk9i?=
 =?utf-8?B?dS8zVUhwL0lpaDNCT3hGMG1LRm5OYnlmS2pqTWNtMjZSR0FoOTEzajdzL2dj?=
 =?utf-8?B?Q1RRb2tMazUyajIvSkxMS1Ara3ZHcXQ3SFBia1kzQWlGaU9lTjMza1A5dXZO?=
 =?utf-8?B?blFQSTA5Q29yRE9pZzVuZnViNjdRZFJNN1JGK2xONmp6YUc2UWE0ZHVnbDIv?=
 =?utf-8?B?bzZjZnpYY3l0ZVphTm1HTzBjY2d5RTJabFF1YWNIVGk0MVBnRmt3NDF3UjFR?=
 =?utf-8?B?aXdwZDZ6NFEwSDJreE1maXUxbnFiSENma2JoYmJ4N1pmcmd6cXU4dHdKSFQv?=
 =?utf-8?B?M2F2R0pnK2lDdWdFNWJMVGdIMTRoSSs2MlJIZERDNmJURmQ2T2RucncxL0pa?=
 =?utf-8?B?L1NwaVhJK0ZKMldiYmdoaFlRYVJ4WHFHL2xza1JRYVdFVkM1aGFzdUVtTkpR?=
 =?utf-8?B?cmxnR09BYVFhZGVXelRBQ0VUQXVFc1B5WFdXaDlQekQzNzFPM1RTSlZuRUR5?=
 =?utf-8?B?dENFLzlRL3BhYTFiNTJCcUtvazlNK0RvNndEMDZMb3NBOXFIVS9Fbm12MWMy?=
 =?utf-8?B?YWt2TTdVaGRYS1htVlZIak1xOE1hOVN4aEMvR3d1ai83a2swd0kycXR1Yisz?=
 =?utf-8?B?VXVRK1NQbkpibU1LdzNJREJMajFtbnJYR0ZwYzZ0VEQ1QVg0MlN6Z0hDM2lW?=
 =?utf-8?B?dUlzZ2pwRTZLRkRGQTBPVkIzTmM4QUU3ZkhtSnY0ZEZ3S0hQWDlRMzNQTXN6?=
 =?utf-8?B?QlU1MDJkcThtV29DR1d4THlMckJYRFVuVU5KSU5obmc5b25iNzVFbDFIMkxF?=
 =?utf-8?B?WnRFU0ZkdlNPczJBZi9YNWFDTU5YSnR2L1l1QTFCdTNZMC80S2s4THlpbEUv?=
 =?utf-8?B?QnozbGU2ZCtRN1lSR3YzdTM3RWUvWWJWVk1VckdRdG9pczBBNWE0ZEFkTzRV?=
 =?utf-8?B?WXV0ZWpNdmRUZkRiZDZrZFJ0Rk94UHZaSGpwN1pkaFZTbkNZckRGbERNL3BG?=
 =?utf-8?B?WEs5VlFyeUV2MkJOMzhmRW40R0dRSFR5RVhwbFJmNS9KMjMzTjJPc241QXBV?=
 =?utf-8?B?WTFZUGI3aDlDWk5vWUl0eDVoRm8wUWVIM1VOa3lTeUFTMkhwR0JwbEFWeFpP?=
 =?utf-8?B?cXRYaUVyVWRDRkNBT0I1UTZXR2NwQm5ZellRZTZyeWNOa2cvSHY4RU9PSnRS?=
 =?utf-8?B?Sllra2piWlVBTWJRYWZWOGFUMGtkdzc2ZnNKNlRYZVBGQmI2d2hLMWp5aldM?=
 =?utf-8?B?ckVVTXo5R2xBaUlFYXdSVnVVRTdON0I1UCtkdi8veU5oTTM3MUtjNC9VUzBu?=
 =?utf-8?B?TXJWWGlBTmNMTzRhNUFIdFRvOEQwc29DRFZ0cG5UWGZDelpnOW5QMWtmVjdx?=
 =?utf-8?B?SWk1bFdkYnAwVUQzU1BSL2s4T3pSemtIcFZpdldXSUQvVXVTYk1lRjloQWlZ?=
 =?utf-8?B?eE16dEpBZFFQNm9FTG02aG9rWld1VnB1am1YT0dUK1hNbi93NENTb3F6bC9u?=
 =?utf-8?B?VmdhL3l2cmdhLzg3UlJ4S2xMVjliVjNCOXFCdEdZb25leng1dFFQYUl3NXE5?=
 =?utf-8?B?NGNoQjNxZ2oyVzlJZ3VlS1ZFQ0VVVkJBbms0ZFRkRURERXRRYU9RdHJmZDdF?=
 =?utf-8?B?ZmJ5VlVmeFlMdjFaeDFWQWRINm1MdHlWdmlPanl4QVZjaUNVZzgzWDVQQmsr?=
 =?utf-8?B?Z2xKcGsxN1hPMEo0MWhhNmUwcnUyQ00zMGs2K1RsTmZQWmNiTWdOMDJoNUpC?=
 =?utf-8?B?VVNFNXRHS2srUkNLRzIrdzA3aU1DREFkcWErSEIzemFWSDUxd1BKZFNYTWt3?=
 =?utf-8?Q?/Wls2c1gO+xcYBXRCJDTSh6vN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b09c67e-e566-4a2b-4db5-08de165980ce
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 19:38:00.3557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFWR3nwsL5/MxuPtK+VfGITZtbPGhIf71Qwk73VQgQREo8H5Y9m51GgjFQhI1pj1yIf3GC0zFXjTThBA+t5m3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8790
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

On 10/28/25 4:00 AM, Danilo Krummrich wrote:
> nova-core already depends on CONFIG_64BIT, hence also depend on
> CONFIG_64BIT for nova-drm.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/gpu/drm/nova/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
John Hubbard

> 
> diff --git a/drivers/gpu/drm/nova/Kconfig b/drivers/gpu/drm/nova/Kconfig
> index cca6a3fea879..2a70aac64d7e 100644
> --- a/drivers/gpu/drm/nova/Kconfig
> +++ b/drivers/gpu/drm/nova/Kconfig
> @@ -1,5 +1,6 @@
>  config DRM_NOVA
>  	tristate "Nova DRM driver"
> +	depends on 64BIT
>  	depends on DRM=y
>  	depends on PCI
>  	depends on RUST


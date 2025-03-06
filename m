Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C08A54E58
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1465D10E9D1;
	Thu,  6 Mar 2025 14:54:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="joX/HZym";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BB010E9C8;
 Thu,  6 Mar 2025 14:54:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2Y+TX3dlWHSYtXBp4TOsCt7DRUbx4nAD5E4IOc/bbaiBn1YZn5N35LQXoRj8s59jDLd85JqwMQBvXIm0M0a6nYRE0Yf1+kQwEPeuCenRpc2TkNNZLhxsLyF+1CCXmTFU4pemWjwAqr7eEErwOq1zbTVRTGiLc+p1A+SKfbquw9+4N9WsUXgKCFz8yjKD15yPr7rdl0LvGiqrG+A29oL4jO2wVFETSusKKYKoyrbKXQyykPFR63hWeCngiu39nMcVu2kGpzLLqepSWwh+63pMKc4i3TVEiyOZHlA22sWGdTWJY7wzVfd8NEn6pO3nJ8EPWHAsCs6E7AZ73ty/GSJDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k499Lf0dE91YvwbkWAZY3bu23Bq5mZLGX9aazxnuG1c=;
 b=xYzVMkX416rHLTvP/QM+GW2gvV44y6gXik/LWFYu9UrtdcrLJ67j/NoccKnx13HOJUexFpytelbzfsCbggLdkPdxwhv4tqVMwRn2GjiOuiDdFWN+2KRm4wqVFjAA5YMK8f0YAlsOjysiASJ8wEVkIWdKX7f4Q85D/jFZZ0oJcot9jG5ST0HGM+ZUSNg2HPXsZWc1MHnmlS5/RboTwqL5eezTi8pUEPSBc81N8oCc+y3ChsfYlMDzkYB2uoCo6XvqZ8cg3ssRkZfZhpDfeNunnbPYQ6r6ZZcrIHhQmz7SIDmh9DzJF0bRdN/nvNnaOteui6nWunJHffNZL4mICJKymw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k499Lf0dE91YvwbkWAZY3bu23Bq5mZLGX9aazxnuG1c=;
 b=joX/HZymk3WD/HxVzcB40XnwUsJcFzityZ4IcvUMVjkNoYp+7wZKsD+brMaVbs7C4aQzqYvXx1dNepVQlz8mZbQGXntzbWgbsPLI6tVTNA39TJhxYSsGiBD/u2cfVVYzVzpm6Rt5Ieoxji0i/xqdUgeoowvNnbvHwjIxB4lWPuU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB9030.namprd12.prod.outlook.com (2603:10b6:208:3f2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 14:54:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 14:54:21 +0000
Message-ID: <8ab51ed3-82dc-4c9e-86a1-c275c45af02e@amd.com>
Date: Thu, 6 Mar 2025 15:54:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: Take a breath during dma-fence-chain subtests
To: Nitin Gote <nitin.r.gote@intel.com>
Cc: intel-gfx@lists.freedesktop.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 chris.p.wilson@intel.com, andi.shyti@intel.com
References: <20250306151111.1405362-1-nitin.r.gote@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250306151111.1405362-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0212.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB9030:EE_
X-MS-Office365-Filtering-Correlation-Id: 71bc6470-c749-449b-318a-08dd5cbec729
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlB6Wk1COW5lZ3hyQ3BHei9rcDV5Wnh5bWhaNTBHSVVhUW4ybFljUEFZaWVs?=
 =?utf-8?B?cFdlK1Jyb2xJYWY3eU4rRVdYSk9tV0FLZ1k4RlIyQkk4ZXhoRzBjRGZLTUg0?=
 =?utf-8?B?eUNIK3JrdlJZSTBEMmNPNGdTMGhiQmUwS0xaM0l1VDNNM2dZZWpvL1EyVjdM?=
 =?utf-8?B?ODZIemFPWU01eEhqRXVrVkdvWExWMFRWbDZPc3VEL2xSb0FyR1ovUlZXeXpX?=
 =?utf-8?B?UmxCRVZsTHFhN3ZudW9IakVwY096YWNCanlaZW1GOTFEZW5sU2wzaTVtdlFO?=
 =?utf-8?B?SjZOTzRRc2dkSGhaU3VlTEZuTXEzTE1mWUMvT2hSSExvbnhiSVE1NlpsN1pn?=
 =?utf-8?B?NGVSMkhISVRBZHkydHdGck9aRnQxSnlmYWtEY2NmTTJBNTZ4YjBKZVliWlVs?=
 =?utf-8?B?S1UyWVRSWFBXZlhoalNqRXZxb3JHUEVqc0xkeEFVN2ZMMzJSaWsrN0lsblVM?=
 =?utf-8?B?WU1lV2NORXc4T0N5dVBQUmRKNlBmcEZzVUVYVFhDSG9XZkNTOGRUTVh0THRO?=
 =?utf-8?B?TGQ4T2ZWdjF3MWpGT1dOMElBTjdtT2NWOWx2bmVyVllUcnN2VlI0dzVIbzBN?=
 =?utf-8?B?akd0dlpuMTdCWlhNT1VMUDJVUjJHWVV6NFpOcFFJZWM0N24vOVVEM01vaVZT?=
 =?utf-8?B?NjE1dTVQUmFBVWVPKzVpTEVmSlZSaWpuVTg4MHhVekpJWkljSXVxNkliL0pG?=
 =?utf-8?B?eGhHc29CUGRxdGJEKzVsQ2pETVN2K1ByMDZBSWpYRzJtZUFwcWxjT1pReitP?=
 =?utf-8?B?bWo3QWpXZVFQL2VseWhYV3BmZlY4QklHbWVIKzZzdytoZUV4dlBOMzV2RHhl?=
 =?utf-8?B?anVoNmNCeUIvSE5oaENtb0gwWlV6cUR1bnM0L01GZWt6VlIxeWhaZlZ4WWZS?=
 =?utf-8?B?c3VpRTMwL3N1cnJWUHM1TWpXQUlLZlRQQTNUM1cyWmxaVnJtcktULzB0TjVp?=
 =?utf-8?B?dHJrM0V5VDJvSnIrOEFOVkZoa2ZobVZqcXJhS2NTTWZVaTBjV1MwSUNrVmJO?=
 =?utf-8?B?K3FKa0U3NHFCMjUvYjhnT0h6RVdiMUtZYjRvVC8zTkpLbGNvU2NEWTNvZTRl?=
 =?utf-8?B?ckJ0elp1cWxyN3l5Q3NSMEJpMVc4VXFmRFFWWkNLWmFHWnZ5dnhtcE8wT1o1?=
 =?utf-8?B?MGo4dzJ1Znh4WGYzOVlHck5JdWYyQzVtZnJROUdTcGNpYXBNd1g2RjB5aWxv?=
 =?utf-8?B?ZVgvNG5YRkx5Y0dvbHp0MVJFOGx6YlZnR0xCRDBWMEJFY2F5eURCR1h6dHlN?=
 =?utf-8?B?eGM2L2c4S09DajRjc3R5aE16WDFMZ3Q5YnQ0R3RiN3BIcXJKQVRnVEFlbnlt?=
 =?utf-8?B?VXBKS3duNHlIdlVTTlJmYVB0OUw2TUpnUHU2U2N4US9rZ1BxN29RYW5raVRQ?=
 =?utf-8?B?L3o1OTdrb0p5REtpTHRDSkgwSGswWW04OVcrREhXV20zaDhZSEt4S09aYS84?=
 =?utf-8?B?WTRRUFM5NnQ2NVQ5cHRKalZkMVFXNzZzR3BESUwrRGxXSVpPUHZsczVsbVg5?=
 =?utf-8?B?ZmNHQ29Za3pDbFhLemp2WGN0ZWlrNEIyeXhldXJONThlanQwZTdycU9TNWRS?=
 =?utf-8?B?YTlRT0daQ3gzVHcyYWJiV3lvbDJTK0ZIckNXcmZtYk52MjlZV3lWUi95STB3?=
 =?utf-8?B?MVBweituSmZ0THp4VEVCY2FwczRIemZ2YVAxd05JZVJMWlgxbTlFaEdKaFQ0?=
 =?utf-8?B?SFNzNkpTSXBkSjhFb1o2V2grdTRoZURtcytIcU5NMDZXL29BZlM0blhOL0FN?=
 =?utf-8?B?cHFoSVRDWkdUWGlBclhjN2pHYzNVeWZDT3NYOGYvbENtUitJQnBBMWdpM3BX?=
 =?utf-8?B?UTllbmNYWmlQNVRHTHgyQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzZPNmQxNjg0bDNpNXBKWmowMnZTL3EwTGVkWUVKazN0T2V4cDB1MGdUeFQ2?=
 =?utf-8?B?L3hqSU9tVHB0L2dlM1JuRVlrSUttdlg3Q2NHNjR6KzJWc1hhZ04wYSsyTWNC?=
 =?utf-8?B?U1hiYXpHVEE4K3FsRVV6b2VQYkdFYkNzSHBDcVRYc05vY0tneldzWWROcVNE?=
 =?utf-8?B?K2txd3g5L1N1QnB3b01vaHQwNFZCQy9ydmxTc3phU0w1N0I4ejN3bXM5bXA5?=
 =?utf-8?B?SGlSS0FLWitxV2RZcmQ0blYycXFWR3VmaEk4UFU1Q0JaVmxRck0yNUJFWFZE?=
 =?utf-8?B?MUlqRGwwYjFhbG9UVENuN1FWelZVdFRPazJvTVFLYkVkbStFdzlMcW5ObzBN?=
 =?utf-8?B?bmh4VkdlZEpTUmtRLzFna2ZTTWZiYVdXV0lOTjh3bEQ3c3ZUbzdwc3JxdEFY?=
 =?utf-8?B?ZTBqRmVKQVdpM2hmdkEwN0FJbDZWVm9oTEdUN2RxZmN5ZVBiUWdseW8xMFVv?=
 =?utf-8?B?V1J1b2VyVm1PU3FjYnBLTm1LYzJUdzFQeUNST1hxR2NjNEo0L0VySXU2SVlU?=
 =?utf-8?B?YlVneXpnZ3YxMmN3SGtiOFpxOW9ma1JBSXJqWVRuZ0QzaTV0NmNXWGowN0J0?=
 =?utf-8?B?NTVyaGZ0TmVCNGw4ODJtWWp2anFrM3k0T3l0clJVN2VPVnBvZXpPanFETVdq?=
 =?utf-8?B?MnQ0U2pQUDV3cTVWWjBsYXREN2NyaS96VDZHMUtrSzVleTN5TUQwMzdPYUQx?=
 =?utf-8?B?Tkh0WFE0cWIzSE1DWDRycHo5VXlia0VCUVkwOERYWVIwRU52cW01dHlKNkw0?=
 =?utf-8?B?VW53cHc5S1EyNkVJbEgzRnlkUmo3b3g4eUtpTmlwS2w0eVArNVVGSnd6dTVT?=
 =?utf-8?B?dUpERWZGTHFUUUVQL0hHY1YvKzczQ2VHS2p5Q2tCdTdGSnZBdGtMc2wvTXRu?=
 =?utf-8?B?NWYySDBHdWJYM2dDbjlIQ2tFR25teEVRSWQvOUQ3RUlMWGVYZ3dqWTJVOTBk?=
 =?utf-8?B?TDRjdDZHcmttazJma2lEZXNZRkdPUUFwV0dVRXpudjFPUkRYRFhwZnNXYktK?=
 =?utf-8?B?djN6dFNRamcrWEJFZWF4dWxCU2p3RmpPajRmc0o3dlR3U0ZwNDUydnk0WDZy?=
 =?utf-8?B?YjdtMDdOY0hMNnVZNEw5T2UyMW1sN05zVjdpY2h4enFmTisrZTZBYkIyK3BN?=
 =?utf-8?B?UzB6d0ZqcjllRWVhak8zWHg4Nmh5NTd3cXFpVnphZ1diYlJiL1JXQWJtRlB1?=
 =?utf-8?B?cXA4OVdTMDlOT21raXRGM0R2NkNIWXk1MlQ2YkpkNnVydWNBVXFXMEVGaE82?=
 =?utf-8?B?MW1CRjJsdlJidXF5ekxBUEprU3ZuRHNuSVlnMEQyS0VWSFlCQ2hnU3k4T015?=
 =?utf-8?B?UzlFZmdOdjA0NDgrL3pNd2RmeENKS3ErZk01bVRPQS9VeGpPRXU3SVFMWHB5?=
 =?utf-8?B?Vmw3V0RxUHdCNWNtbEFBc0hyTlM4TjdESW4vUjAzcUpXemhjMmZaaUlqWUZo?=
 =?utf-8?B?ZEQ4S1hOeDhwQVdsUXdmTmtYbnZqRERFK3MvdHY5MWlROVZCbVd3RlFmR2lI?=
 =?utf-8?B?djNVeGgvMkVGQmVQQkpqODFydkxvRHZUOC84Vmk5R1RxMVIzMmo1KzBxREdh?=
 =?utf-8?B?ZmgvK3BQclJZQTMzL0hXMTZvRVhocHlvdXNia2w5YUJ0VngxSEk1eTlNMnRh?=
 =?utf-8?B?cTk0aE50VElLaG5EVDh2cXBWOXlVaC9zcXlabDBIZEkwdWFwM3IwTnd2UHVF?=
 =?utf-8?B?Q25nMVhZY1JQK2VWeldoeHBZSDBUZDM2dlYrZTVickF3dk1ibFB3c0ZWRVA2?=
 =?utf-8?B?cU9WUkZkZGpGOW42T2ZKZUlLYXdkcERVdVZ5enpiVzNZWC9KOG4xQ1BTNzcw?=
 =?utf-8?B?Q3pGVFVqcWdobHoxK3VxamZiUTBaZ29ZclVCYzFkVG0zRldMR0kwWGx0ZW5R?=
 =?utf-8?B?S05LcFVvS1NMalJUdDlzRFRaRXVZZjlVL0ppNnRvL1ZWS3JLYm05WUx5L2oz?=
 =?utf-8?B?dHF0SVUzclVvZ1JSdmg4K3ZpNDY0WjlSYnNad1pKZzJxS2swZWFzYXZ4ZDdn?=
 =?utf-8?B?SytnY3JGeFNDb3pYL3Z3Q3lZUG1mU1lrcGFPTlRmMFUrYUpBMEhLWmxIQ09u?=
 =?utf-8?B?WENlTXVJRTJXNkdyK3pDNm9JdzdwZDUyOEpnZlpKd2xXYVJpVVBKeUdPL1NF?=
 =?utf-8?Q?5tQEeoa8F9fhdnzvmwFqp2c3i?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71bc6470-c749-449b-318a-08dd5cbec729
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 14:54:21.2738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfJauW7wQZfDbR4+qdpzv+iK84PkrY3pu6+gheXTPHf+5Bx3tmJbTRFQh7blEnk4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9030
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

Am 06.03.25 um 16:11 schrieb Nitin Gote:
> Give the scheduler a chance to breath by adding delay of 10ms
> as some of the loops may take some time on old machines (like apl/bsw/pnv),
> and so catch the attention of the watchdogs.
>
> v1: Instead of cond_resched(), use more generic call like
>     fsleep(). <Christian>

As far as I can see either the tests indeed takes to long, e.g. longer than 26 seconds, in which case we should probably reconsider what we do in that test.

Or (more likely) the test has some bug and this patch here just papers over the issue.

Either way I don't think that this patch here is acceptable, no matter what function is used.

Regards,
Christian.

>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
> Hi,
>
> For reviewer reference, adding here watchdog issue seen on old machines
> during dma-fence-chain subtests testing. This log is retrieved from device
> pstore log while testing dam-buf@all-tests:
>
> dma-buf: Running dma_fence_chain
> Panic#1 Part7
> <6> sizeof(dma_fence_chain)=184
> <6> dma-buf: Running dma_fence_chain/sanitycheck
> <6> dma-buf: Running dma_fence_chain/find_seqno
> <6> dma-buf: Running dma_fence_chain/find_signaled
> <6> dma-buf: Running dma_fence_chain/find_out_of_order
> <6> dma-buf: Running dma_fence_chain/find_gap
> <6> dma-buf: Running dma_fence_chain/find_race
> <6> Completed 4095 cycles
> <6> dma-buf: Running dma_fence_chain/signal_forward
> <6> dma-buf: Running dma_fence_chain/signal_backward
> <6> dma-buf: Running dma_fence_chain/wait_forward
> <6> dma-buf: Running dma_fence_chain/wait_backward
> <0> watchdog: BUG: soft lockup - CPU#2 stuck for 26s! [dmabuf:2263]
> Panic#1 Part6
> <4> irq event stamp: 415735
> <4> hardirqs last  enabled at (415734): [<ffffffff813d3a1b>] handle_softirqs+0xab/0x4d0
> <4> hardirqs last disabled at (415735): [<ffffffff827c7e31>] sysvec_apic_timer_interrupt+0x11/0xc0
> <4> softirqs last  enabled at (415728): [<ffffffff813d3f8f>] __irq_exit_rcu+0x13f/0x160
> <4> softirqs last disabled at (415733): [<ffffffff813d3f8f>] __irq_exit_rcu+0x13f/0x160
> <4> CPU: 2 UID: 0 PID: 2263 Comm: dmabuf Not tainted 6.14.0-rc2-drm-next_483-g7b91683e7de7+ #1
> <4> Hardware name: Intel corporation NUC6CAYS/NUC6CAYB, BIOS AYAPLCEL.86A.0056.2018.0926.1100 09/26/2018
> <4> RIP: 0010:handle_softirqs+0xb1/0x4d0
> <4> RSP: 0018:ffffc90000154f60 EFLAGS: 00000246
> <4> RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
> <4> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> <4> RBP: ffffc90000154fb8 R08: 0000000000000000 R09: 0000000000000000
> <4> R10: 0000000000000000 R11: 0000000000000000 R12: 000000000000000a
> <4> R13: 0000000000000200 R14: 0000000000000200 R15: 0000000000400100
> <4> FS:  000077521c5cd940(0000) GS:ffff888277900000(0000) knlGS:0000000000000000
> Panic#1 Part5
> <4> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4> CR2: 00005dbfee8c00c4 CR3: 0000000133d38000 CR4: 00000000003526f0
> <4> Call Trace:
> <4>  <IRQ>
> <4>  ? show_regs+0x6c/0x80
> <4>  ? watchdog_timer_fn+0x247/0x2d0
> <4>  ? __pfx_watchdog_timer_fn+0x10/0x10
> <4>  ? __hrtimer_run_queues+0x1d0/0x420
> <4>  ? hrtimer_interrupt+0x116/0x290
> <4>  ? __sysvec_apic_timer_interrupt+0x70/0x1e0
> <4>  ? sysvec_apic_timer_interrupt+0x47/0xc0
> <4>  ? asm_sysvec_apic_timer_interrupt+0x1b/0x20
> <4>  ? handle_softirqs+0xb1/0x4d0
> <4>  __irq_exit_rcu+0x13f/0x160
> <4>  irq_exit_rcu+0xe/0x20
> <4>  sysvec_irq_work+0xa0/0xc0
> <4>  </IRQ>
> <4>  <TASK>
> <4>  asm_sysvec_irq_work+0x1b/0x20
> <4> RIP: 0010:_raw_spin_unlock_irqrestore+0x57/0x80
> <4> RSP: 0018:ffffc9000292b8f0 EFLAGS: 00000246
> <4> RAX: 0000000000000000 RBX: ffff88810f235480 RCX: 0000000000000000
> <4> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> <4> RBP: ffffc9000292b900 R08: 0000000000000000 R09: 0000000000000000
> <4> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000246
> <4> R13: 0000000000000000 R14: 0000000000000246 R15: 000000000003828c
> Panic#1 Part4
> <4> dma_fence_signal+0x49/0xb0
> <4> wait_backward+0xf8/0x140 [dmabuf_selftests]
> <4> __subtests+0x75/0x1f0 [dmabuf_selftests]
> <4> dma_fence_chain+0x94/0xe0 [dmabuf_selftests]
> <4> st_init+0x6a/0xff0 [dmabuf_selftests]
> <4> ? __pfx_st_init+0x10/0x10 [dmabuf_selftests]
> <4> do_one_initcall+0x79/0x400
> <4> do_init_module+0x97/0x2a0
> <4> load_module+0x2c23/0x2f60
> <4> init_module_from_file+0x97/0xe0
> <4> ? init_module_from_file+0x97/0xe0
> <4> idempotent_init_module+0x134/0x350
> <4> __x64_sys_finit_module+0x77/0x100
> <4> x64_sys_call+0x1f37/0x2650
> <4> do_syscall_64+0x91/0x180
> <4> ? trace_hardirqs_off+0x5d/0xe0
> <4> ? syscall_exit_to_user_mode+0x95/0x260
> <4> ? do_syscall_64+0x9d/0x180
> <4> ? do_syscall_64+0x9d/0x180
> <4> ? irqentry_exit+0x77/0xb0
> <4> ? sysvec_apic_timer_interrupt+0x57/0xc0
> <4> entry_SYSCALL_64_after_hwframe+0x76/0x7e
> <4> RIP: 0033:0x77521e72725d
>
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  drivers/dma-buf/st-dma-fence-chain.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/st-dma-fence-chain.c b/drivers/dma-buf/st-dma-fence-chain.c
> index ed4b323886e4..12dfa245ab9a 100644
> --- a/drivers/dma-buf/st-dma-fence-chain.c
> +++ b/drivers/dma-buf/st-dma-fence-chain.c
> @@ -431,7 +431,7 @@ static int __find_race(void *arg)
>  signal:
>  		seqno = get_random_u32_below(data->fc.chain_length - 1);
>  		dma_fence_signal(data->fc.fences[seqno]);
> -		cond_resched();
> +		fsleep(10000);
>  	}
>  
>  	if (atomic_dec_and_test(&data->children))
> @@ -505,6 +505,7 @@ static int signal_forward(void *arg)
>  
>  	for (i = 0; i < fc.chain_length; i++) {
>  		dma_fence_signal(fc.fences[i]);
> +		fsleep(10000);
>  
>  		if (!dma_fence_is_signaled(fc.chains[i])) {
>  			pr_err("chain[%d] not signaled!\n", i);
> @@ -537,6 +538,7 @@ static int signal_backward(void *arg)
>  
>  	for (i = fc.chain_length; i--; ) {
>  		dma_fence_signal(fc.fences[i]);
> +		fsleep(10000);
>  
>  		if (i > 0 && dma_fence_is_signaled(fc.chains[i])) {
>  			pr_err("chain[%d] is signaled!\n", i);
> @@ -587,8 +589,10 @@ static int wait_forward(void *arg)
>  	get_task_struct(tsk);
>  	yield_to(tsk, true);
>  
> -	for (i = 0; i < fc.chain_length; i++)
> +	for (i = 0; i < fc.chain_length; i++) {
>  		dma_fence_signal(fc.fences[i]);
> +		fsleep(10000);
> +	}
>  
>  	err = kthread_stop_put(tsk);
>  
> @@ -616,8 +620,10 @@ static int wait_backward(void *arg)
>  	get_task_struct(tsk);
>  	yield_to(tsk, true);
>  
> -	for (i = fc.chain_length; i--; )
> +	for (i = fc.chain_length; i--; ) {
>  		dma_fence_signal(fc.fences[i]);
> +		fsleep(10000);
> +	}
>  
>  	err = kthread_stop_put(tsk);
>  
> @@ -663,8 +669,10 @@ static int wait_random(void *arg)
>  	get_task_struct(tsk);
>  	yield_to(tsk, true);
>  
> -	for (i = 0; i < fc.chain_length; i++)
> +	for (i = 0; i < fc.chain_length; i++) {
>  		dma_fence_signal(fc.fences[i]);
> +		fsleep(10000);
> +	}
>  
>  	err = kthread_stop_put(tsk);
>  


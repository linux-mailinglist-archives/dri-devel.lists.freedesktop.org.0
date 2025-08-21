Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82689B2F923
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 15:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF4810E150;
	Thu, 21 Aug 2025 13:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="atbnJ8L+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E029810E150
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:00:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIMgquCynQcAjvJ/woBfgyx9f2PosAYT6Q36LKSX/HH/Df5RJ4+R75ML661qYde/IxvcKhVBsnMDJfauXr93SGv7oJxPnueoWAgpNN+H16mMlOfDf5IPJpC9UTWjo6FkCjMM/Mfqutbd/E15yzFQcbgEmz9d8mhn9chD2S4FXj6Cs1XzekTtNjk6bkdG7a/zWnhWqjYQ1ASMCHqkogils2dhBHwJT1NvQexcG41wprOquYCocsGQ5OLMYDbAwu8Z3fKFYcFsJLekmLu1xsf1yz8HvL4YPGXJkq+fOm+Q43FtpB/r+Ft8QecMD5zJ2ARSYnZfHbyDIpv4csOawLZdxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1y0+0IPR2t1+yHopkvm5Q5AB90bOPWAC5J/PKEjSaQ=;
 b=a6RyhM+ekUZYh3ykCw/CzoHfa//8m+3GD66vB/uQYVF5G3OJzyx0gNnWjJFwYM/zL+X3HHodsFwoEYOQI9hMb+KwMiVnEDcESRWF9+/PMbjYES9f/eJWMceiGD+1LncHwVA9oOY6bXvlM6V4p8HKUr52b4IGVsLtmt6RxMTZ6xH/yyOoOtIx7f+QVAFkZ7sWJllvc66Or91OA8aXsxQHYaId0XgVXqod+ab+Az4sjOx9lnI4NxH62Dst/uy25B7lgoA9HYBOOPf5aleAmsJ8HJM7+t2X78Or60GlaRSn1boxtn0sz0ngYHvUFx63p7KlQBnRZHwrxhObCr56SuR7ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1y0+0IPR2t1+yHopkvm5Q5AB90bOPWAC5J/PKEjSaQ=;
 b=atbnJ8L+eI1P5aRxNex4qpEqw30bWL95MZxx9558i+HrSktpb9sy4xdupvXzoVacimjgh65ZoEJC8JXDHfec9+HSCjzKB2WUiDFJw7zjizYy+/V9gJf/pFM4rN2A4JXT6ZTbhiXkqlPWxkfl/oaEt8v7gK93IH9mvWrfz2rj8ts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB7984.namprd12.prod.outlook.com (2603:10b6:510:26f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.16; Thu, 21 Aug
 2025 13:00:29 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9052.014; Thu, 21 Aug 2025
 13:00:29 +0000
Message-ID: <7a193321-f9fa-43db-a495-594b1c586735@amd.com>
Date: Thu, 21 Aug 2025 15:00:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-buf: add warning when dma_fence is signaled from
 IOCTL
To: simona.vetter@ffwll.ch
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 ltp@lists.linux.it, tvrtko.ursulin@igalia.com, phasta@mailbox.org,
 airlied@gmail.com, dakr@kernel.org, sumit.semwal@linaro.org
References: <202508200843.8b006132-lkp@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <202508200843.8b006132-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ec77f82-b903-472b-1324-08dde0b2b44f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnBCdlVhc3hlS3ZqWGM4VWQ4VmpvTDBNSE0rTi85U25wNThrQUM4a0J5bVF0?=
 =?utf-8?B?SGorZHhuLzlOWGFDRHlDeElBeVA1V2NvSEdIZTBmSGdCWFY1dmx1UzhNS0tl?=
 =?utf-8?B?T3o2U3VjU2tobHR6c3NYUllOS3JaeUkzUW9CdFJISzJSdjBnMnRUMi9GTzBw?=
 =?utf-8?B?ZStuVzJXSlpTbjdxWDhVT1NMazRNVW93OU1ncXpaM3h1OEgzeG5Wd3pmdHhY?=
 =?utf-8?B?NjJwZUlZbjhYU0hiZXpjTERlazg1dFJZR2xKdG0yamVzY1dPQ09SRVQrZ29L?=
 =?utf-8?B?UGNvSlc5c3Myck8yMjZGdWhXZFBHZHF2ZnhnUjZnOWc2azFJSTQyTGN0WVY5?=
 =?utf-8?B?T3o0RTdZSURPVWRIQVN6RUJHTS93dXozNHQySW5nUkRzN1NhYnJqUEZyWmR0?=
 =?utf-8?B?emdFRnhxeGZLdmRaaS81dlI2SGMvbXNySnp6K0NINDJFbDFBRUllc3kvZi9W?=
 =?utf-8?B?cjNaNG8rL2VlaFdWT0FiVjRIdXVsRHFDYTBhS3ZaMWhJQkl3MFNMMEpndkpC?=
 =?utf-8?B?aXcyalVPR1RIS0V1c1lIVWRjdERXRG0vWjRvenJxWGEwV1RmSW9HN0ViR3lw?=
 =?utf-8?B?K0dJQTR5aW1odUVQRDd0Zit6N3Z0K0M0aTI3SjA0UWc2MFU2QkJxRjBiczNR?=
 =?utf-8?B?aDNocUJMTEZ6Y2p3NGZpLytRU1NYNWlaWEczQm9LN0p0Z0tyU2d0T3FZcVRx?=
 =?utf-8?B?WHdEa0JUU0Zpd0NDczhlRkw0R1VTYXZ2Mm9yS2UvOFB4N0dCOW1UQWtOUEJE?=
 =?utf-8?B?Mng0SzluRi9iRG5iaXJ4bEhKZzhYWnpoTngza1NWdGxwNCt4RUtxbFFERDd0?=
 =?utf-8?B?czFmMU1mMnYzWmV1V0JaV1BiQm9SbXl3a0l4RDE3dFVHL0xvdWVNeC9QQTU4?=
 =?utf-8?B?Z1lsQUorNURVOUVRTTZQM3VEb3p3eGdVSkc0anN3ZEFFNGQ1UnFGUmJnUk9j?=
 =?utf-8?B?WjdZVlExVllBK3R0SjVVWUxNOUR6bWRxMVFZU2xrNS9yMzR3d0FFTFBVZFNw?=
 =?utf-8?B?MzA5SVo1OEtPbFF1ZWlad0wxK01iOEZUUk9wT2R3M3JHbnQ3cWE3K0w1c0tH?=
 =?utf-8?B?S1NtUHZYL3U3OFBRdDlHL3pqSXpHbmVQd3IwbE9rWG1EcU4wbkxnMG1MZG5q?=
 =?utf-8?B?aml5WVRBNmc5RDMyV2VxYUxNKzBwZW9EaThIenFJcE1wZ2s3ZFBqdXl3NkRC?=
 =?utf-8?B?bVl0NkxjTy9tMHVkV3VJZkhBaXBKUC9mRWlnV3JuYTRXZXJVVlpuMlJ3bUZZ?=
 =?utf-8?B?bFNlQ2dHMXUyakdZZXlnNE5rOUpwWGwzR3VSb1hrVWZCSXVQcmNZdDhLMEJ1?=
 =?utf-8?B?WHZNL01TYjVKRFh3cjVuUUk0TUlKbjA1b1Y5UHVGUkNERHdIcnNqUDNLdXpk?=
 =?utf-8?B?Zi9HRUl2QVRKaUZPL25RcDFtNVlpVEd3Z1VxaGhlWSs5YUVsQlpxWVh0OSsw?=
 =?utf-8?B?UXFQNklQZHhBK2FTWnVpM094NklJcld3TmtsYWVjbTQrZ0JyUnhQU09Bc0pu?=
 =?utf-8?B?eGdNTlVTLy9GajlVYzJTWDhGUFdWeHlaVUFOa0g3Vy82bmo4eE9EZ1BmYzcr?=
 =?utf-8?B?TVNzMUw4R29qQVJYcGRIaE1UZlA1TzZ3czFyV0hsWEpST3VFRzdVUXU5Rk9P?=
 =?utf-8?B?K1YrQUFhdU5BTUdHbSsyYi9UcE5Cb1N2SWczNitWaE5BYUpySldvU1g5RWhl?=
 =?utf-8?B?WWFNeUFuNTVLUFdrMjlYdXdHUFJTTzh6UEM5RTQ4WlNvMmFldmFZSXRsTVJv?=
 =?utf-8?B?RGw4bHVOdkM0emFKVDFwYVFBUHR2MGVrM1NDWDhsUnRMTUF4b2ZFVTUxZjZq?=
 =?utf-8?B?c2dXaXYvUmZXZEQ0cDNUYUFhVG8zemhIZTRaMS83aGFKdmpBUFFMZ3NCdUZF?=
 =?utf-8?Q?04TeCuaQNqSbC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RExUWEpGSUhuMEQ3M25Zemc4d3ZCVWlxUnpyTWQ5V01qVU9oem1GbUdqYTJH?=
 =?utf-8?B?ZVNpNnoxQnEyZzV3UjZxc0ZLNXc0UkVlcWJtczhzalpLTEdQTTVlT3RTRlov?=
 =?utf-8?B?UmNlWHBCUm1NMkNyNmR5ektKeGszbVJPMDBzMFVsV1NNYjVsN0lUMHNLNERQ?=
 =?utf-8?B?V3NEZDRWdDVyMVFrdWw2YjRVRXUvM3ZFZ00yRlIyb3d1SDRxOGJRVDNiYTVa?=
 =?utf-8?B?N3dFdEVPRzRXQ3ZXNWhtSHdNSFkrTTZsdi9teUpadFJUZjcrc2JLVXFTSkc4?=
 =?utf-8?B?OVV2YlNNakVYdmE3RXJYTFk5eVlEbElPM3VtRUlWY1lWRHF4NmUzcVFHa1RC?=
 =?utf-8?B?WnRvRGlFSjRVd3AycThWNkZJVHNyK1JLcG82YlE4NnFhaVIzT0NVY0FzSmV6?=
 =?utf-8?B?Si82RWVzY1lFQVFXWlkwVUNSSmQ2M2VBeHhiVlpKTFB4UXUva3JoOWtodFVB?=
 =?utf-8?B?Wmp0Q1A4cXZ1UElVWDJxSU1Lem9PVGtjTk91cnc5T3l1TzZnNXQxSTRBeXFm?=
 =?utf-8?B?VGo1RG9MMDlySklpcU4xSDNOSEh0VXBlZlNmSmlQMzJvalBSVlVPUmNCbmxP?=
 =?utf-8?B?enVhU1JTUzcrblNHUE12eWF5Mzl3YmJsQTFaWVpMeE5BTXpTRFVTYlJkdnAv?=
 =?utf-8?B?Q3huVmgyUWZycGpBVHF5WXViYkl3UE8vamhaS1dEVFF4clprb3FzY2J1c29Y?=
 =?utf-8?B?SVVNRlZIc215aWFqeFpzWFVxcU9TajFia2VGelh3cHNxaTFJL0hDSUFCUk1y?=
 =?utf-8?B?ZHRadHk4b2FIM2JCVUo1bHc2ajRHU3JPK1FHUHA2dFBuMjRzckNqY1djUnFO?=
 =?utf-8?B?QjkydFJKelJPODBtdkoxT1Z0ZkFWMlFCVHdKMzhEK1l1SE96OWxpalMzeHpZ?=
 =?utf-8?B?dVFRcGRTYjN6QVZsQVZnd1M3b0tGZXpDeVAyUmxrcnBsK0JHUnNXSU9MOTZE?=
 =?utf-8?B?dkFubjNvK3dpbFhCTE1UUmpKUzVlMHI1aEFFZExUNUQwblpSbHlQWGtVd3Na?=
 =?utf-8?B?c29BSHRsdWN4aTUzYWFETGE0dzZ1UTBtZWlLT2tSY2xtejI5dVBYRUFFMVpm?=
 =?utf-8?B?T3Z4eGNwdXl2OGw5QkxCSWtZTkMzdWI3elU2eVY2K2JYV3lQRnBHd0F2Zy9v?=
 =?utf-8?B?a1RMU0FBcWhUNWJNWlVxM1ZpRG00dmxSL00vME9DekNrV0FsTXZDSTZDZjls?=
 =?utf-8?B?NHkxK0lBNG9vQXFKcnBNUVpOYWpqa0Q1NlFzdHRtZUtidTZqUDBjTnQyaWF1?=
 =?utf-8?B?WllZdmdYVExTRlhMa0dyNDBEWW9OblBVKzRveGtCbVB3Rk43Zmkwdi93TUJm?=
 =?utf-8?B?STB6YUsvZDRwcnRjTUhkU0JBQ2l0WWpZeVc5WXB5ckhZYytzZjg4YnNJVEth?=
 =?utf-8?B?YWFQS09iRysvSTJ4bVArYUk4WmNQc2IyZHE4Q3hkT2dQLzRZcW9Vby9KaGxG?=
 =?utf-8?B?V3JXczNNRzN5OGdhT2QzWG9aVVoyazNQMUFpdzV0ODVOdU1Ob0JGRmNjOVJE?=
 =?utf-8?B?aUdlWVgva3JJWFFUaUJVbjdueFhuWHNOOGUrSGdjaEhRL2xhcnd5Zlczem1s?=
 =?utf-8?B?blVKRVVna3BheFFEelZicFVaRTk3eFNXVVdmczJSUWM3SXZYR2lkU0NpcnFQ?=
 =?utf-8?B?bUZwcGlMQmJuZ1RaczFsR1BVV2ZzVnhPeWorc2FpNEJnamFHK08yaG9DZU9N?=
 =?utf-8?B?Vmk1UmNnVnUxc1c3RXVkSXVPdzk1YmdaSjMyUUhLY0llaFo2d09pSUVKRjFT?=
 =?utf-8?B?NkppOEYvNlRLYXQxK2p4T1oxcDVMUC9yZWtMWjJMUFRRMFpBc1dJYnE5dGs0?=
 =?utf-8?B?a3dSdm10RUFZbkludGRPNEpFcG1lMENxZzVSakNDNmQ3eWJyWGR4TEVGUzAv?=
 =?utf-8?B?cGQyQkFJeDZyZHhOUExlaTltZ3o5amI3RXdvWWY4OXhhWDl2QVJmaThKWWxM?=
 =?utf-8?B?TmZFeXRQWlJRUThwZzN1QnJPeWlVaUw0Z3N6Umpnb3luamdVVDc2dXQ0M2k1?=
 =?utf-8?B?bTFUcHFkVEZQam1IODV2SjBvUk9mRGtkd3RkRUMyWW1LS0ZRZHdFUVg2dmVV?=
 =?utf-8?B?eHJMamRhWEg0aTZJZ20yZVNBc01RL1kvSXdGbFVjeFdEYTdrRjB1dlJENFh3?=
 =?utf-8?Q?iB6qht33md2WsmHTGHeZf0pL+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec77f82-b903-472b-1324-08dde0b2b44f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 13:00:29.3024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfQNJBJ+wYvw9GB8/Sgjj5S9VpxtbfJe2odXb7kJvyumUC0oAL6Fvp3Pm84tkPRP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7984
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

Hi Sima,

I need your opinion on this here. Adding the warning to not signal a fence from IOCTL context yielded it's first victim.

Skimming through the code what i915 does here is to signal a dma_fence from an error handling path. E.g. the dma_fence was allocated, initialized, the vma code finds that something is wrong and signals the fence and frees it's reference.

The function which does that has the following comment:

/**
 * dma_fence_work_commit_imm: Commit the fence, and if possible execute locally.
 * @f: the fenced worker
 *
 * Instead of always scheduling a worker to execute the callback (see
 * dma_fence_work_commit()), we try to execute the callback immediately in
 * the local context. It is required that the fence be committed before it
 * is published, and that no other threads try to tamper with the number
 * of asynchronous waits on the fence (or else the callback will be
 * executed in the wrong context, i.e. not the callers).
 */

This works technically, but I would say that this is absolutely not the best practice.

We have some oportunity to unify dma_fence_work logic between i915 and amdgpu here, but I'm pretty sure I don't want to allow such stuff in amdgpu even if it saves a few of CPU cycles in an error cleanup path.

What's your opinion on that?

Thanks,
Christian.

On 20.08.25 09:27, kernel test robot wrote:
> 
> 
> Hello,
> 
> kernel test robot noticed "WARNING:at_drivers/dma-buf/dma-fence.c:#dma_fence_signal" on:
> 
> commit: 409db68e04bdf052bc03f620e70339764b598ade ("[PATCH 2/2] dma-buf: add warning when dma_fence is signaled from IOCTL")
> url: https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-add-warning-when-dma_fence-is-signaled-from-IOCTL/20250812-223543
> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git 53e760d8949895390e256e723e7ee46618310361
> patch link: https://lore.kernel.org/all/20250812143402.8619-2-christian.koenig@amd.com/
> patch subject: [PATCH 2/2] dma-buf: add warning when dma_fence is signaled from IOCTL
> 
> in testcase: ltp
> version: ltp-x86_64-9f512c1d8-1_20250809
> with following parameters:
> 
> 	test: syscalls-ipc-msgstress
> 
> 
> 
> config: x86_64-rhel-9.4-ltp
> compiler: gcc-12
> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 16G memory
> 
> (please refer to attached dmesg/kmsg for entire log/backtrace)
> 
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202508200843.8b006132-lkp@intel.com
> 
> 
> [   51.636268][  T218] ------------[ cut here ]------------
> [ 51.636273][ T218] WARNING: CPU: 3 PID: 218 at drivers/dma-buf/dma-fence.c:420 dma_fence_signal (drivers/dma-buf/dma-fence.c:420 drivers/dma-buf/dma-fence.c:502) 
> [   51.636292][  T218] Modules linked in: coretemp sd_mod snd_hda_codec_realtek_lib snd_hda_codec_generic sg ipmi_devintf kvm_intel snd_hda_intel ipmi_msghandler platform_profile i915(+) kvm snd_hda_codec intel_gtt dell_wmi snd_hda_core drm_buddy binfmt_misc dell_smbios snd_intel_dspcfg ttm dell_wmi_descriptor snd_intel_sdw_acpi snd_hwdep mei_wdt sparse_keymap irqbypass drm_display_helper ahci ghash_clmulni_intel snd_pcm libahci rfkill cec mei_me rapl intel_cstate dcdbas snd_timer drm_client_lib libata intel_uncore mei snd drm_kms_helper i2c_i801 i2c_smbus pcspkr lpc_ich soundcore video wmi fuse drm loop dm_mod
> [   51.636385][  T218] CPU: 3 UID: 0 PID: 218 Comm: (udev-worker) Not tainted 6.17.0-rc1-00006-g409db68e04bd #1 PREEMPT(voluntary)
> [   51.636395][  T218] Hardware name: Dell Inc. OptiPlex 9020/0DNKMN, BIOS A05 12/05/2013
> [ 51.636399][ T218] RIP: 0010:dma_fence_signal (drivers/dma-buf/dma-fence.c:420 drivers/dma-buf/dma-fence.c:502) 
> [ 51.636415][ T218] Code: 00 fc ff df 80 3c 02 00 75 36 48 8b 3b 4c 89 e6 e8 10 33 27 01 89 e8 5b 5d 41 5c c3 cc cc cc cc e8 b0 2e 77 fe 48 85 c0 75 bc <0f> 0b eb b8 0f 0b bd ea ff ff ff 5b 89 e8 5d 41 5c c3 cc cc cc cc
> All code
> ========
>    0:	00 fc                	add    %bh,%ah
>    2:	ff                   	(bad)
>    3:	df 80 3c 02 00 75    	filds  0x7500023c(%rax)
>    9:	36 48 8b 3b          	ss mov (%rbx),%rdi
>    d:	4c 89 e6             	mov    %r12,%rsi
>   10:	e8 10 33 27 01       	call   0x1273325
>   15:	89 e8                	mov    %ebp,%eax
>   17:	5b                   	pop    %rbx
>   18:	5d                   	pop    %rbp
>   19:	41 5c                	pop    %r12
>   1b:	c3                   	ret
>   1c:	cc                   	int3
>   1d:	cc                   	int3
>   1e:	cc                   	int3
>   1f:	cc                   	int3
>   20:	e8 b0 2e 77 fe       	call   0xfffffffffe772ed5
>   25:	48 85 c0             	test   %rax,%rax
>   28:	75 bc                	jne    0xffffffffffffffe6
>   2a:*	0f 0b                	ud2		<-- trapping instruction
>   2c:	eb b8                	jmp    0xffffffffffffffe6
>   2e:	0f 0b                	ud2
>   30:	bd ea ff ff ff       	mov    $0xffffffea,%ebp
>   35:	5b                   	pop    %rbx
>   36:	89 e8                	mov    %ebp,%eax
>   38:	5d                   	pop    %rbp
>   39:	41 5c                	pop    %r12
>   3b:	c3                   	ret
>   3c:	cc                   	int3
>   3d:	cc                   	int3
>   3e:	cc                   	int3
>   3f:	cc                   	int3
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	0f 0b                	ud2
>    2:	eb b8                	jmp    0xffffffffffffffbc
>    4:	0f 0b                	ud2
>    6:	bd ea ff ff ff       	mov    $0xffffffea,%ebp
>    b:	5b                   	pop    %rbx
>    c:	89 e8                	mov    %ebp,%eax
>    e:	5d                   	pop    %rbp
>    f:	41 5c                	pop    %r12
>   11:	c3                   	ret
>   12:	cc                   	int3
>   13:	cc                   	int3
>   14:	cc                   	int3
>   15:	cc                   	int3
> [   51.636420][  T218] RSP: 0018:ffffc90000a9ed30 EFLAGS: 00010046
> [   51.636428][  T218] RAX: 0000000000000000 RBX: ffff88811750fc00 RCX: 0000000000000018
> [   51.636437][  T218] RDX: 0000000000000000 RSI: 0000000000000004 RDI: ffff88810691512c
> [   51.636440][  T218] RBP: 0000000be56b1408 R08: 0000000000000001 R09: fffff52000153d9a
> [   51.636445][  T218] R10: 0000000000000003 R11: ffff888108145000 R12: 0000000000000246
> [   51.636452][  T218] R13: ffffffffc1c9b060 R14: ffff88810406ba0c R15: 1ffff92000153dc2
> [   51.636455][  T218] FS:  00007efd90c038c0(0000) GS:ffff8883e4077000(0000) knlGS:0000000000000000
> [   51.636459][  T218] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   51.636462][  T218] CR2: 00007f5bd8238c20 CR3: 000000040ed8a005 CR4: 00000000001726f0
> [   51.636466][  T218] Call Trace:
> [   51.636469][  T218]  <TASK>
> [ 51.636477][ T218] fence_work (include/linux/dma-fence.h:272 drivers/gpu/drm/i915/i915_sw_fence_work.c:23) i915 
> [ 51.637304][ T218] fence_notify (drivers/gpu/drm/i915/i915_sw_fence_work.c:39) i915 
> [ 51.637827][ T218] __i915_sw_fence_complete (drivers/gpu/drm/i915/i915_sw_fence.c:201) i915 
> [ 51.638300][ T218] i915_vma_pin_ww (drivers/gpu/drm/i915/i915_vma.c:1601) i915 
> [ 51.638763][ T218] ? __pfx_i915_vma_pin_ww (drivers/gpu/drm/i915/i915_vma.c:1434) i915 
> [ 51.639218][ T218] ? i915_gem_object_make_unshrinkable (include/linux/list.h:215 include/linux/list.h:287 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:500) i915 
> [ 51.639648][ T218] ? i915_vma_make_unshrinkable (drivers/gpu/drm/i915/i915_vma.c:2292) i915 
> [ 51.640091][ T218] ? intel_ring_pin (drivers/gpu/drm/i915/gt/intel_ring.c:73) i915 
> [ 51.640505][ T218] intel_ring_submission_setup (drivers/gpu/drm/i915/gt/intel_ring_submission.c:1290 drivers/gpu/drm/i915/gt/intel_ring_submission.c:1421) i915 
> [ 51.640918][ T218] ? __pfx_intel_ring_submission_setup (drivers/gpu/drm/i915/gt/intel_ring_submission.c:1349) i915 
> [   51.641232][   T65] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
> [ 51.641321][ T218] ? intel_engine_init_whitelist (drivers/gpu/drm/i915/gt/intel_workarounds.c:2104) i915 
> [ 51.641735][ T218] ? __intel_wakeref_init (arch/x86/include/asm/atomic.h:28 include/linux/atomic/atomic-arch-fallback.h:503 include/linux/atomic/atomic-instrumented.h:68 drivers/gpu/drm/i915/intel_wakeref.c:109) i915 
> [ 51.642126][ T218] intel_engines_init (drivers/gpu/drm/i915/gt/intel_engine_cs.c:1514) i915 
> [ 51.642521][ T218] ? i915_gem_object_make_unshrinkable (arch/x86/include/asm/atomic.h:93 include/linux/atomic/atomic-arch-fallback.h:667 include/linux/atomic/atomic-arch-fallback.h:1119 include/linux/atomic/atomic-instrumented.h:524 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c:498) i915 
> [ 51.642929][ T218] ? __pfx_intel_ring_submission_setup (drivers/gpu/drm/i915/gt/intel_ring_submission.c:1349) i915 
> [ 51.643331][ T218] intel_gt_init (drivers/gpu/drm/i915/gt/intel_gt.c:719) i915 
> [ 51.643728][ T218] i915_gem_init (drivers/gpu/drm/i915/i915_gem.c:1191) i915 
> [ 51.644140][ T218] i915_driver_probe (drivers/gpu/drm/i915/i915_driver.c:831) i915 
> [ 51.644524][ T218] ? __pfx_i915_driver_probe (drivers/gpu/drm/i915/i915_driver.c:780) i915 
> [ 51.644903][ T218] ? drm_privacy_screen_get (drivers/gpu/drm/drm_privacy_screen.c:169) drm 
> [ 51.645047][ T218] ? intel_display_driver_probe_defer (drivers/gpu/drm/i915/display/intel_display_driver.c:84) i915 
> [ 51.645483][ T218] ? i915_pci_probe (drivers/gpu/drm/i915/i915_pci.c:995) i915 
> [ 51.645876][ T218] ? __pfx_i915_pci_probe (drivers/gpu/drm/i915/i915_pci.c:956) i915 
> [ 51.646267][ T218] local_pci_probe (drivers/pci/pci-driver.c:324) 
> [ 51.646283][ T218] pci_call_probe (drivers/pci/pci-driver.c:392) 
> [ 51.646295][ T218] ? _raw_spin_lock (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154) 
> [ 51.646308][ T218] ? __pfx_pci_call_probe (drivers/pci/pci-driver.c:352) 
> [ 51.646321][ T218] ? kernfs_add_one (fs/kernfs/dir.c:834) 
> [ 51.646337][ T218] ? pci_assign_irq (drivers/pci/irq.c:149) 
> [ 51.646350][ T218] ? pci_match_device (drivers/pci/pci-driver.c:159 (discriminator 1)) 
> [ 51.646362][ T218] ? kernfs_put (arch/x86/include/asm/atomic.h:67 (discriminator 1) include/linux/atomic/atomic-arch-fallback.h:2278 (discriminator 1) include/linux/atomic/atomic-instrumented.h:1384 (discriminator 1) fs/kernfs/dir.c:569 (discriminator 1)) 
> [ 51.646368][ T218] pci_device_probe (drivers/pci/pci-driver.c:452) 
> [ 51.646377][ T218] really_probe (drivers/base/dd.c:581 drivers/base/dd.c:659) 
> [ 51.646391][ T218] __driver_probe_device (drivers/base/dd.c:801) 
> [ 51.646404][ T218] driver_probe_device (drivers/base/dd.c:831) 
> [ 51.646416][ T218] __driver_attach (drivers/base/dd.c:1218) 
> [ 51.646424][ T218] ? __pfx___driver_attach (drivers/base/dd.c:1158) 
> [ 51.646428][ T218] bus_for_each_dev (drivers/base/bus.c:369) 
> [ 51.646441][ T218] ? __pfx_bus_for_each_dev (drivers/base/bus.c:358) 
> [ 51.646444][ T218] ? __kmalloc_cache_noprof (arch/x86/include/asm/jump_label.h:46 include/linux/memcontrol.h:1714 mm/slub.c:2210 mm/slub.c:4190 mm/slub.c:4229 mm/slub.c:4391) 
> [ 51.646456][ T218] ? klist_add_tail (include/linux/list.h:150 include/linux/list.h:183 lib/klist.c:104 lib/klist.c:137) 
> [ 51.646468][ T218] bus_add_driver (drivers/base/bus.c:678) 
> [ 51.646482][ T218] driver_register (drivers/base/driver.c:249) 
> [ 51.646490][ T218] i915_init (drivers/gpu/drm/i915/i915_driver.c:1428) i915 
> [ 51.646891][ T218] ? __pfx_i915_init (drivers/gpu/drm/i915/i915_config.c:13) i915 
> [   51.647101][   T67] sd 2:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [ 51.647277][ T218] do_one_initcall (init/main.c:1269) 
> [ 51.647292][ T218] ? kfree (mm/slub.c:4680 mm/slub.c:4879) 
> [ 51.647304][ T218] ? __pfx_do_one_initcall (init/main.c:1260) 
> [ 51.647315][ T218] ? kasan_unpoison (mm/kasan/shadow.c:156 mm/kasan/shadow.c:182) 
> [ 51.647327][ T218] ? __kasan_slab_alloc (mm/kasan/common.c:329 mm/kasan/common.c:356) 
> [ 51.647340][ T218] ? __kmalloc_cache_noprof (mm/slub.c:4180 mm/slub.c:4229 mm/slub.c:4391) 
> [ 51.647352][ T218] ? kasan_save_track (arch/x86/include/asm/current.h:25 mm/kasan/common.c:60 mm/kasan/common.c:69) 
> [ 51.647365][ T218] ? kasan_unpoison (mm/kasan/shadow.c:156 mm/kasan/shadow.c:182) 
> [ 51.647377][ T218] do_init_module (kernel/module/main.c:3039) 
> [ 51.647388][ T218] ? __pfx_do_init_module (kernel/module/main.c:3011) 
> [ 51.647402][ T218] ? kfree (mm/slub.c:4680 mm/slub.c:4879) 
> [ 51.647414][ T218] ? klp_module_coming (kernel/livepatch/core.c:1317) 
> [ 51.647426][ T218] ? load_module (kernel/module/main.c:2468 kernel/module/main.c:2463 kernel/module/main.c:3504) 
> [ 51.647441][ T218] load_module (kernel/module/main.c:3509) 
> [ 51.647449][ T218] ? ima_post_read_file (security/integrity/ima/ima_main.c:896 security/integrity/ima/ima_main.c:878) 
> [ 51.647466][ T218] ? __pfx_load_module (kernel/module/main.c:3353) 
> [ 51.647478][ T218] ? __pfx_kernel_read_file (fs/kernel_read_file.c:38) 
> [ 51.647489][ T218] ? init_module_from_file (kernel/module/main.c:3701) 
> [ 51.647499][ T218] init_module_from_file (kernel/module/main.c:3701) 
> [ 51.647514][ T218] ? __pfx_init_module_from_file (kernel/module/main.c:3677) 
> [ 51.647525][ T218] ? mm_get_unmapped_area (arch/x86/include/asm/bitops.h:206 arch/x86/include/asm/bitops.h:238 include/asm-generic/bitops/instrumented-non-atomic.h:142 mm/mmap.c:805 mm/mmap.c:871) 
> [ 51.647540][ T218] ? _raw_spin_lock (arch/x86/include/asm/atomic.h:107 include/linux/atomic/atomic-arch-fallback.h:2170 include/linux/atomic/atomic-instrumented.h:1302 include/asm-generic/qspinlock.h:111 include/linux/spinlock.h:187 include/linux/spinlock_api_smp.h:134 kernel/locking/spinlock.c:154) 
> [ 51.647547][ T218] ? __pfx__raw_spin_lock (kernel/locking/spinlock.c:153) 
> [ 51.647560][ T218] idempotent_init_module (kernel/module/main.c:3713) 
> [ 51.647573][ T218] ? __pfx_idempotent_init_module (kernel/module/main.c:3705) 
> [ 51.647582][ T218] ? __pfx___seccomp_filter (kernel/seccomp.c:1244) 
> [ 51.647590][ T218] ? fdget (include/linux/atomic/atomic-arch-fallback.h:479 include/linux/atomic/atomic-instrumented.h:50 fs/file.c:1167 fs/file.c:1181) 
> [ 51.647607][ T218] ? security_capable (security/security.c:1142) 
> [ 51.647615][ T218] __x64_sys_finit_module (include/linux/file.h:62 include/linux/file.h:83 kernel/module/main.c:3736 kernel/module/main.c:3723 kernel/module/main.c:3723) 
> [ 51.647627][ T218] ? syscall_trace_enter (kernel/entry/syscall-common.c:44) 
> [ 51.647640][ T218] do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94) 
> [ 51.647657][ T218] ? fput (arch/x86/include/asm/atomic64_64.h:79 include/linux/atomic/atomic-arch-fallback.h:2913 include/linux/atomic/atomic-arch-fallback.h:3364 include/linux/atomic/atomic-long.h:698 include/linux/atomic/atomic-instrumented.h:3767 include/linux/file_ref.h:157 fs/file_table.c:544) 
> [ 51.647668][ T218] ? ksys_mmap_pgoff (mm/mmap.c:609) 
> [ 51.647682][ T218] ? do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94) 
> [ 51.647694][ T218] ? from_kgid_munged (kernel/user_namespace.c:535) 
> [ 51.647708][ T218] ? _copy_to_user (arch/x86/include/asm/uaccess_64.h:126 arch/x86/include/asm/uaccess_64.h:147 include/linux/uaccess.h:197 lib/usercopy.c:26) 
> [ 51.647722][ T218] ? cp_new_stat (fs/stat.c:471) 
> [ 51.647732][ T218] ? __pfx_cp_new_stat (fs/stat.c:471) 
> 
> 
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250820/202508200843.8b006132-lkp@intel.com
> 
> 
> 


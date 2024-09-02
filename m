Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BD3968590
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 13:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5DD10E292;
	Mon,  2 Sep 2024 11:01:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jW9owyTh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2062.outbound.protection.outlook.com [40.107.95.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A1710E291;
 Mon,  2 Sep 2024 11:01:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXNko3NXOOwIrJGS5w4/Sdb8IP1KM96aUB51uXOvk75Q9Swfj79dnNTcFvj3j+uWb5PIwZ8lZ3i3ECbNTgXyCoMhiCaC0MZYrve4FrOgw7ljoHSY0AjwSKFp7jy8IqFeJmexIosLDsgIiiipbVip1GNF5FZDT5kTD7Gofk9jI7hOFsuD/s8RQ7o2NJgpY30M6M6Z49a+vGJ8q/AAYPxbiX4hql3PeDl1xO+s1wkZeqshDl5HlDiy1TP7yhVegI8Qv5aAO/oDRRD604nPBs8zUSoneRz6Ee+DxcVYgganVBAGFn5I1c7v9vn/V7NmWvvMuIruj+pqDkzVggyureUFFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/TgEZMm+rNrIuHtyNOpFofbnGXrb/X1Pu5/I5PYxQk=;
 b=J8tJiA89aBc28Hb6mU/bk3A4WPBNBETsTbz2KG1moRe//s2PjaMTk2h2MKYr6i42XSx9zKFEJ7bUy31w500MDzlx1jGDao8sxQpV4MQmBsvU3CK5qvd00jvxaN0EQ9JqSgpfFLQHf/hKv/Su0uWblSz4wMxNjHSK/+5yicS0L+n9LAbEDU2WI+ARyg64fW1MPNdgONAF9mdMg/Jozvsl+pCNBWo7bzV5/zk5mHsh5x7IaVKd7dfzu3dXZcsdSAG4v5P2QDTxT8yjqpvTrEK9xuPwQVDKXvlpkR+Zg853q8ABz65ldHJK3fERKpmJopqNZM0ArfeSwKglndam3YD6JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/TgEZMm+rNrIuHtyNOpFofbnGXrb/X1Pu5/I5PYxQk=;
 b=jW9owyThv0+cteUWBTC09HicToqVLlriJPVkNhK3Y+cmNFBnP1BfrAjraEMF0t1rLOgV7fpr7cMhpxG+l66m6Tb9m9z8PyOZ4aLHnA8Cgahc1IMHTyQ++VvU7ftmPz4kTIARUYYPAHMHuJ3YRR4G7p0NxpcAI8g3g+/n1MzQDmA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN6PR12MB8541.namprd12.prod.outlook.com (2603:10b6:208:47a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Mon, 2 Sep
 2024 11:01:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 11:01:51 +0000
Message-ID: <5043c12a-e44a-416d-b2ce-70c07609f25e@amd.com>
Date: Mon, 2 Sep 2024 13:01:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 23/28] drm/xe: Add SVM VRAM migration
To: Matthew Brost <matthew.brost@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, matthew.auld@intel.com, daniel@ffwll.ch,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-24-matthew.brost@intel.com>
 <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
 <cbe8aebe-fcad-4ff0-8f56-146628183fd3@amd.com>
 <368ee71bd5e39d4e26947de9cc417f4abe8d1f3b.camel@linux.intel.com>
 <ZtBVXjNf1xAQOHHR@phenom.ffwll.local>
 <ZtDyZceN6asCzSHT@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZtDyZceN6asCzSHT@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0264.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN6PR12MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 68f2ef9b-68c7-4843-2d3e-08dccb3ea623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkptOUUzS0R3QXhXSENkM3NIUEZpRTdFNUdFS0NnUWdpNE1OYTJINU5leXhF?=
 =?utf-8?B?S1V4VHE1eEpUVGRCblZvYndON1RRVUVFL29FUVFqcjd5aVFmbnBxQXhhYzh5?=
 =?utf-8?B?SmJGVHhLZmtzMkVkMVpCYlBaNDJGL3BEa1RueVJSQ2RQbEZNNWE0MlhiVyty?=
 =?utf-8?B?RzFneVRTdG8zUHhuaWQ3RUdpckx0aEZUbmo1UExBNjhhRWxBblZLcmpyTUM4?=
 =?utf-8?B?VUtBTmN4UEFVUGRHZHQ4MHFvZWY5UVRvck1pVDk2cFBHckxhc0Nob2RTbkMv?=
 =?utf-8?B?NVhXVEk4V0JNSGZXNmlCanBiaE90TjlIakxHYTY0ZEdpbk82VXJoSnZaeWNS?=
 =?utf-8?B?TTVyWEN4UUV6VEpBWWNNTjBhVzhYQVJpSWVWb2x4cHhZU0VON3poOGRLWWpK?=
 =?utf-8?B?T3g1bmFCMUM1TmhSNlFkVGM2VGU3TDZ4Wk9IK2M1YW9BeU5IQkp5QzgzU0JT?=
 =?utf-8?B?cTNjRTRuQWlIMGxEeHFwZTZkK0F0M2UxMElQamdSNjY5bDdzWnZhUG5tOU1P?=
 =?utf-8?B?ckRYUGgraXUwaE82UDlYR1lCM2pkSUx5TkZZalZ4WFdsbXR4UjdnSzRaaHNz?=
 =?utf-8?B?OUZFTW0raGtNcUlPWFJSZTBQK2VrUFdCcDFlQWpST3d4Nzl4Mzl4OEh4R0Nl?=
 =?utf-8?B?NjhDRFRIMXB3bkQ4K1huSlJ6TGJvYXh4cFpQSXA1b1JCN2dRc0NLa3NBcWZv?=
 =?utf-8?B?MDlpNmNsRWhhM0Zkem9aeUFDQmxBWm9sUjhzR2xjMFJkL2RaaVhZSEU2dXJl?=
 =?utf-8?B?QmVEN1d0TUZqeWZpZlh5UUtTdGJlcWk1VWRhczVZL2YzMnkraFl1c0JROHor?=
 =?utf-8?B?elhoQ0habms4RHYzbkRVajZxR25UNTdzb0lMamVqdEZRMGI0ZTFUZno4UU9V?=
 =?utf-8?B?Z2dsdnpra3hWTVFPM1dlemc1bzhWSmxSRU9GWFFZRFVxYlhoYmZNUFFzYTFh?=
 =?utf-8?B?NGVEcG4wZEZPQnZwRWdxckl3TzlXQ3Mvbk1ZTmk0bFR3MytSQ0Y5ajdJSjVi?=
 =?utf-8?B?Sm9GdkVTSnFuVjdvUzJvLzU4ZmhCdWdFaVpIdnUrUGtkVmJHZEQzeVRUTTJ4?=
 =?utf-8?B?L2JJL282TWl2MXNvYkNubitGZnYrOWNFeDltclMzdVZhL1M3aHhrTk1ROWp1?=
 =?utf-8?B?a1V1VDhDUFZCOCs4cVZKMDRGODNTVzFyc1p1UzMwczI3QS9qREt1Qi9GOGI2?=
 =?utf-8?B?NCtNNEdNWHNyT2thQkJBbVZmdkFac2M2bFpvSjAxeTVoT2Q4aGxRSjhrSTh4?=
 =?utf-8?B?TCtUMTZJVGdlN3VVUVl1bDFnaUlzMHAzR2oreld1U25oeld2L3pHdFZEZWR2?=
 =?utf-8?B?VTdXT21IMzJXZzFBTi9aRko0ZHZuMTBPbVhIeENzb0VMQUFNb2NzN2p1YVo0?=
 =?utf-8?B?ZWhmRWtxOXVlL1hrZUdzYldFdWQwVGV4MWQyNGlSTCt0U2JDeXJKc1JUbXpp?=
 =?utf-8?B?UDNTQWVnd240OUtuT1grYmFCaHBjRTl3Nk5HaVRvQ2JYdVZRZnRXRmQzTUc4?=
 =?utf-8?B?SXlSdjF4TUlwbmpXL0dkT1RTQ3RCcVdnMmVRVmpQbmxQc1lvMmFOL3VtTnRW?=
 =?utf-8?B?MGFNUVlSd3lqZkFPTkNvQ24vVWJxeUd2cmJieTN3TVVXdHIrYlpWUy91ZURU?=
 =?utf-8?B?SkM3RUsvOFgyUHN5SndmeHJTNHNBQTEzbWNUZzI2dXJGNzBBMU1OWXJRdDk2?=
 =?utf-8?B?a1BJbFNMRTRNQUM3bzAwbDFRdCt2akpSYU5GYW1EbnpZNzV0azBPeGpQS3ZN?=
 =?utf-8?Q?IZLoh5sHNWRZToHyzg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmY3clViNVhHcUNOeHE1Q0t6dUlsTTdsa1F0MjNSaEJQblFDU2lqcFNwNXVk?=
 =?utf-8?B?ZUNnWWo5VVpkQnBIekVUSHR5WERlazNNdU9NblRVU3Fib0ljdGV2K2JHemlZ?=
 =?utf-8?B?M0VxVnlQMUI5cmFtQ0FUdzk3bTVZR29QMm5HbmMvMzdvSldMTjczenM2UC91?=
 =?utf-8?B?c2JjTVJoaTFDdDVybmVydjM0aTIxdEhvdVdLcXg3RHRNS1RoQTlpcTJ4eGta?=
 =?utf-8?B?aWZsc2UvWTJwcks3WDFmU0N6MCtoNlhTL3NnaldJVWIyak5wN2wwamtzMENw?=
 =?utf-8?B?ZzRvWXkvNm1Uc3FxN1ozT1ZKRm0wRG1ST3hPbmN2T2pMZ2R0ZG5uaDFUanFM?=
 =?utf-8?B?b3ZHeG05bzc5ZnpKZ094MzBKVzQ0L3FJNkI5Ly93ZnM2TTh1STRwWCtzQWta?=
 =?utf-8?B?b1hmdVZVRXZ2aitNZkQycDYrOHhYVFExT3BvWXl6bTFKZmFRdzdDU0Jjazlm?=
 =?utf-8?B?elQvUlVWelE4dmdMK2tSdDZ0cUVoOUp0TE9veWRYeU1hMW42d2FGeDVGendi?=
 =?utf-8?B?M3RxRTlsY2R6VzFZSGgxTmpHWUZaeDhUQjhFaHdqdDEzeWh2LytGdVRDRmkv?=
 =?utf-8?B?V2M5Y29pbFgrc0llenBmaVRtOFpvc2pPV3UzS2twRWRRb1BMZ21BVzN1cmM0?=
 =?utf-8?B?NzIxTXIycFBrUEtIeEIyRjNnQm44dHl6TTFyRHNYTzNIdVFEa0NRZDFOaFdV?=
 =?utf-8?B?Z1VYS0pBUGdzS3A4VGpBYm9TQzkzTlUvNVc2SnB0Y0dYMHRtVDBqYm5HbXo1?=
 =?utf-8?B?MDdGZDhyL1hjUVAySzR6Q1lpY01kelhwZ2s3VllOOWhHSnE0bkxzems5SGZD?=
 =?utf-8?B?bXk2QzgwTG51VElmRzJsUlNpOWFQeVZZaGNmT1BBcGhYMlJNbmZPR1ArM3k4?=
 =?utf-8?B?UklCc3lGajZrdXhzRmtXbW5TUWdMOHNRSmJHdnQ4NnRtYnVoazlPYXZLL2FT?=
 =?utf-8?B?cGZJY0k0UFAvQ3dWcE9lNWdkTUhoUGZUdThJNHR3SkVaeVZoY2RjaCt3ODN1?=
 =?utf-8?B?UkFiS2M0QTB4ZmFRT0puUUNvdWVaRU93cHQ4d3p1Vyt1M1JTMU9RbCs2eVk2?=
 =?utf-8?B?MGhoRmErdEd1RTBlZGNyNFJCM2N2WCtra1R3S2pDaW5IdE51Mlo3VjQvdGxk?=
 =?utf-8?B?TnAvVFZEQUlZWlZzVytYWkEraGgzQjZZUGFzVU9GbEtCcm1BdmsrMjNpSlB2?=
 =?utf-8?B?NXhJV3Y1SGcwNTBXMWZwV3pRTS9RQnpLNGQwRjErc2FLbVFSUTYzd2hQWXRT?=
 =?utf-8?B?Z3RvY28yenVLQ2xYVzc4TUtxOHdUam1mNlhEVjgza3VBZmNndlI4WUJSVys0?=
 =?utf-8?B?STlwcm5vNUxwVENvbmE4SWU4bUFOTUVCajhHSWxtSXNQWGF1SjRwb2pneEVK?=
 =?utf-8?B?VHROMjVwY1E3QkhrTnVKdU50ckdTZDhCZkFON0UxZjBNTnBsMjdxeFBqMElv?=
 =?utf-8?B?VWJOVlRnZ1pMOEhEZTBTRDUwTFIvc3I5bHZlNTBaU3BnNXU3Q29qaXlNQXE0?=
 =?utf-8?B?QUVOWWhUOUxwTmw0YWZLaTZpbENBd2tUNUpMYXNFZE5JWGhMcFNXckd0bEQx?=
 =?utf-8?B?Y21hNmtDcVdvdWZzN0RxS3FPVEx6V3BlbVdLR25Jbi91aTZ4QUZuaHR2Nm1i?=
 =?utf-8?B?T3dzTjZJV0hyZ2w5MUV5MHdwM3d4SkVLcXM1Y0tZMnNieDB6cC9PeG14TDd6?=
 =?utf-8?B?UlF0clI3cjZGSER6aFdKdlA4M1A2TVBDNlcyRVhYVm8wUCs2MHc0b1o1eHV4?=
 =?utf-8?B?am5nTXdkS2JVQk05UmZKbTlFNS9QNklkWkU5WnVhbTd0c09RZG5qUEVqZTdO?=
 =?utf-8?B?bVA3cWVncXlXY3JTdmlETENmQ3JwYks2dmR2MUUwOFZYT3lKbGt4c2t3K0hy?=
 =?utf-8?B?WE51ZDNVNlpaS3RBb09hNlZ4NE1rYVVieUFFZks5aTRPd3EyQUhxSVdLMUNS?=
 =?utf-8?B?TzlEdThaUEJlWThpaWNoQTRFb2JZUzl6bVZoalRBcENlSUVOR2lqSER4eDJs?=
 =?utf-8?B?SGUxeU1LMENZdVMrQ1RsbFJGZjMxYzNwNlZTWGJ4dldudWVYTWZrNGRJN0E5?=
 =?utf-8?B?MTFGQlAvMm9ybGhpaXJCUlBLNUpEamJlSzF0akVyUHFLaEpHZkEyeFZ6Nk9h?=
 =?utf-8?Q?EVphfHjg0I6qTZwPc5VoF3OEK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68f2ef9b-68c7-4843-2d3e-08dccb3ea623
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 11:01:51.7538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NXMvhgVk8OrnKy9Pxt8f7eHPrXDrjD/ZYe+C6qJe+KukUSzF4a7Tlc4O1vO/6EA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8541
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

Am 30.08.24 um 00:12 schrieb Matthew Brost:
> On Thu, Aug 29, 2024 at 01:02:54PM +0200, Daniel Vetter wrote:
>> On Thu, Aug 29, 2024 at 11:53:58AM +0200, Thomas Hellström wrote:
>>> But as Sima pointed out in private communication, exhaustive eviction
>>> is not really needed for faulting to make (crawling) progress.
>>> Watermarks and VRAM trylock shrinking should suffice, since we're
>>> strictly only required to service a single gpu page granule at a time.
>>>
>>> However, ordinary bo-based jobs would still like to be able to
>>> completely evict SVM vram. Whether that is important enough to strive
>>> for is ofc up for discussion.
>> My take is that you don't win anything for exhaustive eviction by having
>> the dma_resv somewhere in there for svm allocations. Roughly for split lru
>> world, where svm ignores bo/dma_resv:
>>
>> When evicting vram from the ttm side we'll fairly switch between selecting
>> bo and throwing out svm pages. With drm_exec/ww_acquire_ctx selecting bo
>> will eventually succeed in vacuuming up everything (with a few retries
>> perhaps, if we're not yet at the head of the ww ticket queue).
>>
>> svm pages we need to try to evict anyway - there's no guarantee, becaue
>> the core mm might be holding temporary page references (which block
> Yea, but think you can could kill the app then - not suggesting we
> should but could. To me this is akin to a CPU fault and not being able
> to migrate the device pages - the migration layer doc says when this
> happens kick this to user space and segfault the app.

That's most likely a bad idea. That the core holds a temporary page 
reference can happen any time without any bad doing from the 
application. E.g. for direct I/O, swapping etc...

So you can't punish the application with a segfault if you happen to not 
be able to migrate a page because it has a reference.

Regards,
Christian.

>
> My last patch in the series adds some asserts to see if this ever
> happens, thus far never. If it occurs we could gracefully handle it by
> aborting the migration I guess... I think the user really needs to
> something a bit crazy to trigger this condition - I don't think the core
> randomly grabs refs to device pages but could be wrong.
>
>> migration) or have the page locked (which also block the migration). But
>> as long as those two steps succeed, we'll win and get the pages. There
>> might be some thrashing against concurrent svm faults stealing them again,
>> but they have a disadvantage since they can't steal dma_resv_locked bo.
>> And if it's still too much we can stall them in the page allocator.
>>
>> So it's not entirely reliable, but should be close enough.
>>
>> Now for bo based svm the picture isn't any different, because holding
>> dma_resv is not actually enough to migrate svm mappings. We still need to
>> hope there's no temporary page references around, and we still need to
>> succeed at locking the page. And the migration code only does trylocks,
>> because that's it's deadlock prevent algorithm if different migrations
>> needing the same set of pages, but acquiring them in a different order. So
>> we win nothing.
> Ok, maybe my statement above is false...
>
> Wouldn't be the only time this falls is if another migration is in
> flight (e.g. CPU fault) and they race? Then the eviction will naturally
> happen via refcount being dropped from the other migration. I guess I
> likely need to update my eviction code to not free the TTM resource if
> all pages are not migrated.
>
>> Worse, if dma_resv does actually hold up svm migration and reclaim, then
>> we potentially deadlock because that lock is for a bigger range than
>> individual pages (or folios). And the core mm assumes that it can get out
>> of a deadlock bind by (at least stochastically) eventually succeeding in
>> acquiring/locking down a single page.
>>
>> This means we cannot use dma_resv tricks to give the ttm world an
>> advantage in exhaustive eviction against concurrent svm faults. Or at
>> least not more than we can do without by just stalling svm faults that
>> need to allocate gpu memory (but that must happen without holding locks or
>> we're busted).
>>
> I'm a little lost here on the deadlock case. Do you mean when we try to
> evict SVM BO we trigger reclaim by allocating system pages and can
> deadlock? Doesn't TTM already have this dependency when evicting non-SVM
> BOs?
>
>> So the only benefit I'm seeing is the unified lru, which I'm not sure is
>> worth it. There's also a bit a lru design tension here, because for the bo
> Well also not rewriting the world...
>
> Matt
>
>> world we want objects that are locked to stay on the lru, so that the
>> competing processes can figure out who has the winning ww ticket. The core
>> mm design otoh does isolate pages and remove them from the lru when
>> they're acquired, so that they don't gunk up other processes from trying
>> to make forward progress and are better hidden. Which reduces temporary
>> page references (from lru walk) preventing migration and stuff like that.
>>
>> Cheers, Sima
>> -- 
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch


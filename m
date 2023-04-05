Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4736D7CA4
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 14:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E87C10E92A;
	Wed,  5 Apr 2023 12:32:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40A410E928;
 Wed,  5 Apr 2023 12:32:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wfwf5x2SWhshewmlOy6ILQVw3Q20hcaC3K4gY7nGb/C/pnLHYDdQeaZ8eolyqEiSQ8ZFlwOIAIryhW+09JsIRhoZT4IU1OvPXwB1rMEqjYmtgky/TORJWat0gBhKUWR2fNHmXRKWh19WGpuKFH2FlhBbE79pfP5BUanbEwv0V/BhZk9sMYXh1bUnVp0Qe3KQO1RhaCMz5TssfUu3cDrdaA5RZ+ktSkTvgszgm1SxnnDTK3Ea6cbnhSgU+ImR7gxaa1O4IQZSaLJ798bEIWEDLkAgkFmd5q5PJUS6+ZxGWyCQLCjfPeBvllbOXYNhEYhmvJPpQ6Zi2xuPwxxzjgVOEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEkYttDbgweJtCmaZcEMo/1n5vxVEphiSNVcPBNMFhY=;
 b=DGRfDn8F3fFeh5bsgsHhWihBHd+z9ocxGXeQocFwAXkn6hRSaEv2lAEcKbbOvvF/BhH3jaIVBSvCnuRN6Jz2O0i840+evCNPMsgIpxgPw1UTeXrJe95HaDCF2wl3DKFsNxtZ+Y5vqLmUoFsf6hZtnhMLWTxOF10KXfilZYCLtO6LCjHWp51NEy5QdH6LbLxYPLOaXtimZs5euROx06FFDIM91McdZ6YBNK5nWF0fU3IzPXW7JtafhU+OsYAsaBviHnZkHjwXVopb9YjHmx05d71trUcO3oueEhAWTrw0iqyb4rGXh2F0IDuzkISOn7NjG1kQmLYiNb+a9ZUvThH+5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEkYttDbgweJtCmaZcEMo/1n5vxVEphiSNVcPBNMFhY=;
 b=b2ZoyDVVTF13kOpe1kpEZo6zT7jnutuhLamOFpzWAT8d8BIq9SwbHrpSEYB1T2tt1KLBAZ+gb2vrFyNMxmIkoKX/3QqR+vfmyI2xIY11YxHGg015V391Bb5nzk7fV1YCPRaV2y5VKWPFqR5eUkNB7C9zUolnC6RVcaJa9g09x4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 12:32:08 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4624:dc39:943e:6ae%5]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 12:32:08 +0000
Message-ID: <42f30a99-a259-91d6-8fb9-25eb85e7b2a1@amd.com>
Date: Wed, 5 Apr 2023 14:32:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RESEND v3 0/3] drm/ttm: Small fixes / cleanups in prep for
 shrinking
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230404200650.11043-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ0PR12MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: b3a4e9c3-4614-45f9-2fc0-08db35d1c53e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bEcmTaXiHWoc4RSW4dJJGByXRa3VOfp/BkT1rLVCB4K1fySnBSndZxOdy+tCLPMXfHotCM3KAgbTZIWN3VYWl+27G8cjRYUeYv3weGF8T+Aaahn2RAdUY7Mr5XIUW+Hz8BeW3UgJhysYvHyVU+hYLgCofhA1LxM+jFbsx7V4tWdsvUQfZu1hBw/ohaQ04ecbUg5Gd+TSOf+aIeADKcqbTSx3Kv1wXI4P08hHOzS54nYy3YOufQ9bu7TLHr31iwVzdrzipoAc/VK3qh9TLkKXhVWLimp0fo50Ry8MqymUbqKLV8Y2j5snC8RBM4nT+cs7dJJk0WFkcm6sQOOLoF2GuS45b79G+WHjVn/EQ3LEj3sv2DuJdtVZQ923kgBHNq8QA/nGW51ioHezTmDMY6MfrnazCZYKohcO85iVgWFzbRAC48KSmFpWF6Mo+H1wRwlEUtGlCw+lOi8YcaUbrkUxjJmhAAwNzUOJXlC0oqwy4QCSPo2Zi6z905Nr1W8gfpZ1X1EBusek3GPpmz9Z2kgLdrff7PVZW/63Afv30/zrOchETtdeyz4Ygh7oKAtdtuAlzxIKNduIJktF4YSSyPXkW3YxEKZ6u4NboB0R2PpGrN4+vQNRPof9qKYV9/Hj6ELS7ZXkn+oR67r/BTcjgNCHWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(66946007)(316002)(66556008)(478600001)(66476007)(8676002)(4326008)(2906002)(6666004)(6486002)(5660300002)(41300700001)(86362001)(38100700002)(8936002)(31696002)(2616005)(6512007)(6506007)(186003)(66574015)(83380400001)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjBNbVZTTFQ4ekl1bm90bFZBNlZGenFINk8wSGpMU3A5dlZRaW9LRUR2WFEy?=
 =?utf-8?B?Um03MUlzUEFxZysreWxEVnIyMFZORzJoUms1cHpYY0d6aFFDSy9TazNlTC80?=
 =?utf-8?B?UEd2eTJOdHhTTnNQSGU5aE9JTHhjTDdjRmpFM1BOM1duT0l5NlBPTWxjU1Bo?=
 =?utf-8?B?clVTRjZMTThGOEwrZkhIcGJTVDdycjA3bFZtZklVRmtvcjVSV3UxUVZ3eWJk?=
 =?utf-8?B?NFJreXNQYmNmcFNsK1NOaW9aQUVhREczc2JMMDVhSHZUM2E0RFA3VUVzcjVw?=
 =?utf-8?B?M3ViOFExUnJGSVRXb1V5cnV6ajMwektITksrdytaR1F1bDdzSTVpUkgyNitT?=
 =?utf-8?B?MlZGQzlTYlhDMHVBL2tMNHhXZUFHYmxtcUE2SFZ3Qjl4b1IyVXlxTnRPQmZk?=
 =?utf-8?B?UkJsaDJ2aVkwcW5YVVdSR1NCd283NXRyM0Q3eTBoMlpJYTJHUVA2Z0FjR2lq?=
 =?utf-8?B?VXB6YU1xMGhoVWY5VWF1bzJNVk4xT2c1eGowbHJSbktqb3dEcDhaV3BmMEdi?=
 =?utf-8?B?eHViNExWREhlWGFkaFoydTNrYzVQOVVWem9pVFZkb2NPcG5iVXIvL0QxTkZL?=
 =?utf-8?B?b1daU1ZFSXorTDluOGVLUlJhSVcreWdLVCs2WXdVZ3U3aWVzRWNYb0hxWU9l?=
 =?utf-8?B?aytQamw2YUhMdlBtZit1T0d1anJocW9ZWmRwakUwWHZNWDhlSHp4N1ZnTVJS?=
 =?utf-8?B?NkZBODFmZE5ic2t1R0VCR3lYR21HTGlsRVBVb25haTA0THJaZVVXSEc5SnBt?=
 =?utf-8?B?WGJWRkE4Y0dxcm9pUFZHSjFpaHA4Ly9VeDNLNThPQitqbTBGdW5WaDBUQzda?=
 =?utf-8?B?czgybDJaWEhwd3Y0S2ZaZ0JVY1UvWTVleGVTSzhjRW54YjVLVENaU0Z6Q0RH?=
 =?utf-8?B?cmFzb0E1c1NxVVJrc1lSUlFiQWo2K0pLektHL1RWSTBiclhGSDZsejRuQTBn?=
 =?utf-8?B?aGNQNWY2N0tkRHpaQ2RyenRLMWEzRGNCZEJ5R1pqZW1SL1VQUmNoZE9qZFM0?=
 =?utf-8?B?WXNxb3dWY1VOalE3N0VEbzQwdTdRc0R0Z280bTR1dmM3VEEyTEd2WnMrR1p1?=
 =?utf-8?B?UDdYVGxHSEtOcWVUZlQxYWZwbjh5RE1vblVrYm5Kc0R5ZUJxY1ZsT0c5YUZL?=
 =?utf-8?B?MTZkV2RFTXNwZUtQdHZIUno0VDhEQk1FQys2eDZFSG53SUxGWHY5bGp3c3ZE?=
 =?utf-8?B?Q0FCQUZWdkpuM1J3N0d1d3RCYTBPM1MrY2l0SWM3b0lJamNPcDV3RDV4SU9k?=
 =?utf-8?B?QlpOSzdlOGtFRkJYUjFDN1Y3Nkk0endtY2o2dkVFanE3dHVKcHRidnhDNG5v?=
 =?utf-8?B?aWhVK1VvRU9Ianl2dFpjZFRMQVppTTdJL2V6OVlpa1lEdFlnNnpwbldPK28x?=
 =?utf-8?B?cnlCSDU5ZUR6WkY5TGhiRkFWcTJkTXV3aGZIYXc5N25rbVgzVjM0bUx6eDh4?=
 =?utf-8?B?SHcxMlVXWVhSSDk5aC9rMkJxSngxWnhlRGo1TVdISnJNSzdZRXVPMHMveHBj?=
 =?utf-8?B?a29nb2xmem1wM253UjFtWjI3WkQ0U0hzSTJhSTFpbUkvVVBTb2dyZTdYbk00?=
 =?utf-8?B?bW0rV3g0Z2llR3drZVQrUzNjaXFEbmFCbkw1VzZ5M1RBblNGMFAzZ0drUUg3?=
 =?utf-8?B?a2xoWHJzZyszdC9BSlFobVBTSU0yOC9RYS92eGcvTUJYTzVXUGVtOEh3VXZ5?=
 =?utf-8?B?TXI3WVVwQk5kTDRWZmNQa2x5RGMxVnV2M0pDdCs0dS9hcHV6QnJjZVRLZzRx?=
 =?utf-8?B?bVlUSDAyWUpBZjJRQnIwVm9wRjRGNjhMcmNxRzJNVThXL2tlSS9Qa2JtcVhT?=
 =?utf-8?B?VTdzdXBaRHJ0bVlGdVJOZnJoUGxzdWRjRjR3UU9rZmE2L2s4SklJTnF4eFNZ?=
 =?utf-8?B?Z003TnAvM3h4U3c0VGNoSmE3ZFhyNnlHM01aMlJHck1YZVlwdVNWUmtyd1hH?=
 =?utf-8?B?eGtOcmZPS0ZobGp0eld1cDF4YTRsRXh2aU45amNRQmRrRTR4QWtlQW5nZ1Z1?=
 =?utf-8?B?elBMU0hUTzF4bFoxZWZqNW9xK3h1V0luTlBoVUJUQ2lCa3VOSG1hYThQOXRu?=
 =?utf-8?B?elBybUdJeC9rTW81TWwzZFBRbk96WTN2UkJURjhjZzJKdUF1SEtIN1JIMmZz?=
 =?utf-8?B?UUJ5eHdHNWtiaWxsa28rdGxIY0ljVGV2RlJRYXlIRkdBbzgxakdweHZhOWZE?=
 =?utf-8?Q?SEzT2JPvc2/24jWa5pDk15nkBn+F7T2fYrYY6mUwMo4U?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a4e9c3-4614-45f9-2fc0-08db35d1c53e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 12:32:07.9336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2g1x85CyYbq7LUFNbfBQNWRcNkL2vheqKY24wgVHd3RRm5oby25rnQLikG2ZhP28
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7473
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
Cc: intel-gfx@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.04.23 um 22:06 schrieb Thomas Hellström:
> I collected the, from my POW, uncontroversial patches from V1 of the TTM
> shrinker series, some corrected after the initial patch submission, one
> patch added from the Xe RFC ("drm/ttm: Don't print error message if
> eviction was interrupted"). It would be nice to have these reviewed and
> merged while reworking the rest.
>
> v2:
> - Simplify __ttm_pool_free().
> - Fix the TTM_TT_FLAG bit numbers.
> - Keep all allocation orders for TTM pages at or below PMD order
>
> v3:
> - Rename __tm_pool_free() to ttm_pool_free_range(). Document.
> - Compile-fix.

Reviewed-by: Christian König <christian.koenig@amd.com> for the series.

>
> Thomas Hellström (3):
>    drm/ttm/pool: Fix ttm_pool_alloc error path
>    drm/ttm: Reduce the number of used allocation orders for TTM pages
>    drm/ttm: Make the call to ttm_tt_populate() interruptible when
>      faulting
>
>   drivers/gpu/drm/ttm/ttm_bo_vm.c |  13 +++-
>   drivers/gpu/drm/ttm/ttm_pool.c  | 111 ++++++++++++++++++++------------
>   2 files changed, 80 insertions(+), 44 deletions(-)
>


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBC8A07868
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 15:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCC210EDF1;
	Thu,  9 Jan 2025 14:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s/j5gsfL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2870E10EDF1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 14:02:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnsQocUuNR9t29WP9ngsDzVEo1NLrJYzsQwUp7IkgiCKHWvN6GghrOH1z7zvlDxiT22aYnM0QDYrbR8aC8BKOXTd7oQ7qXavp0rrKMcyeNKUnVbxyh9rGkZRPfNhBuHLpNZ7ixdxiOtf5A+R6s6bBMF07Wb+PoO7tYNdXkHKzgW7RIuYmB7jHK5/i5Y10aais2BfjFS6bIhpaGBDNtReexPkiTc97OJ3RN7swk7igAUmo2h4u8kmChHqm4Uyp9aMfumrjAws9wjFL/tFPR04LVwpGA87SNoA9H2ojhnGo2dnMx4Z4WGxxCqBZa9LzwBDA3yl76hDjc2VFWmd+r7nnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKg1a7lJhVVLRXTkR+NNWnM+hjksSljw2HtNVuowqQc=;
 b=THjMMSxDkTd7koJ9kseZPiZg03vY4gI650cOC3ZWjVZt+ywsmvLS4XdRYWddeaKtdWk61EBN6pIIdXT1qnmCnEi2JcQpnHkQSogAZwd2i5crCVJzFfsjGjV3YRWe7vfbH4j+06ma+Y4po4QSkoTYm4lS8TevVo7OKPINQpofoE2FpLFPEFgzk9Pi4lTZ/zRCLFiDq+V/el1gAZzlDQ2sliVR3hWDF0fd3vDQ20zS99r4U+DcAoQbz7wf7RoLXjSHy/WVcm5jamcnTgXOJkFcFYSNSCn/fV8kl/3Y5e6/mI8k1eratn2pSqnRt5QZBdexOqpDqhMC8kLSqI6QIYHB0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKg1a7lJhVVLRXTkR+NNWnM+hjksSljw2HtNVuowqQc=;
 b=s/j5gsfLi3dG5F8tw7/HT4yutD8tj3KdqQFrjZAN1DWOJd7ypoIzZgMZFFRB/W0jdI6L4x1PGgwN9EybLGLaAhU8QixX9cpV+d+6f3zQRi4w7b4jJPjwTUchzRVXSGN3PfYU8f+p52kU6BPrtAaWBHLx/0u9aGtnZwTfGjP94xs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB6571.namprd12.prod.outlook.com (2603:10b6:208:38e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Thu, 9 Jan
 2025 14:02:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 14:02:03 +0000
Message-ID: <a52651d1-16c3-4038-bea8-c6ec1812eb3d@amd.com>
Date: Thu, 9 Jan 2025 15:01:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/sched: Document run_job() refcount hazard
To: Philipp Stanner <phasta@kernel.org>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <pstanner@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20250109133710.39404-2-phasta@kernel.org>
 <20250109133710.39404-4-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250109133710.39404-4-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0da7f4-7290-429b-f7ad-08dd30b631fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmJDMFRWT3M2bFd0SkdWamh5dEl4U1c0dmRXWUtZU2JnU2crQ25jbzU1YnMx?=
 =?utf-8?B?VmZSQncyQzUrUWZsQjJrUFN0SGw2ZU9xMEQ5MkRpa0dlYndvTTI0SDdTdWRW?=
 =?utf-8?B?WEVudVNLN3hOa3AydlcvaVc4ZUJiYU9sOGRzQ2VUdTNYRDhIYUh0Z2c4c2sv?=
 =?utf-8?B?ejAxUloyWjNoT2xkODRqeHpuK0ozemJSUzM1YndvVHdxdXM1ZmVqa3UwZ1Ev?=
 =?utf-8?B?WU5LM1NaS3Q0K253enlmWHZBV0xDOTM1NWUyTE1JQklTdUwweS9uZldrVjFi?=
 =?utf-8?B?R05naFZTTXhoMERSekhvVFFCMjcxVi9idTR4eHZpYVUvU0YxNDdUR24yU212?=
 =?utf-8?B?cStVZGEvWVFoTG9lNFhlYkpaT01nd3FDc2ZEQjd1QzJDd1NNaU5va0lYeDli?=
 =?utf-8?B?NjFIanEwb3dFU2toRkFCQTlQb2t3bmhJcDExdmZZUmRwUGNHRVNqdHZHNFNz?=
 =?utf-8?B?ckwrNEtXMjBXODV2ajFtWnpxbHkxd0EzS3lJeHpsYmdPd0VZTVB0Q0puaWx3?=
 =?utf-8?B?Y0FObWFib1NrNGhYbWJqaDZJTjE5dzVBSzZUMy83VEc2a1d1WTBoS2M5d0Zk?=
 =?utf-8?B?ZUwwWjRESXpuQmNBem10bklqTThLU05rU2sxZ0dJZWltd3BWaTNIbi92OXQv?=
 =?utf-8?B?cWNEejdwMzRDbDZGaEEyemRHNHQzVWFsSzQ0V2xSbkNVL21vOWF5a0k1QmRp?=
 =?utf-8?B?Z1E0M2dsU2VGTndTNjZIcEtXMGVEM2ZXL1lIaXdpelRVOVJ0OTdJODV3dGxv?=
 =?utf-8?B?ZDdiRUh6ZWJiUGk0VHYrakpDTjdOV2xQVVBad0JseGh5NThlcmhaWWdxSG05?=
 =?utf-8?B?OWlNUGNIbEtLTjJIdTZsMERRdWdSSmhTaExUWldDbWVjOERES1ZvY3IrTmgr?=
 =?utf-8?B?UDZUcHBFemlETXpSem5DRnNja2RaYno5ZHBoZFRZQmdQbnVjZkN4R3JrVVNP?=
 =?utf-8?B?N2xqYnRmNitsMkpRUEpWajVFS0tjMnhNTmtyY2R2MGhyWWtwcG1JTmJmb3Ni?=
 =?utf-8?B?cWtTdDZFMDJKYUNOYnBCUmtWR1FFai9FR2gyTm14NUtEK21vVnBleDRIY2pt?=
 =?utf-8?B?dlkrckxWWVRWMkNZS1U5R3JFL2Z4OG5JaUl2Yk1LWFI3LzZhLzBlNGxLeU1a?=
 =?utf-8?B?VmNWS2lGSU9xWkd6MDhNTGZIN2d4ODZ5Tk1pUEViTFNuYnFiTnYzK3k5RnlK?=
 =?utf-8?B?NUROU1o2OEZ2K2FWQXRhYm5oYVl0cURTbWZlVzJFbTlaT2lMaWRWQU1LS0gv?=
 =?utf-8?B?b1lFQkdQaTQ1dW5sY3h2STBJZkQrR0tSc3krWjdqTFVrQVJlclZEUVZVcTFH?=
 =?utf-8?B?U0VWU3JoS1hSRFFaMDMvd3pJV0NYeFE4OHNyckNvK2tZQ3dhd3lWeWdHWW02?=
 =?utf-8?B?NTQ5SG5VSy9ZMTFLeVNsakZvdnF5SmdpRnBhZW0rNDM1aUtZSm82djdER1Rl?=
 =?utf-8?B?UlI1dTJLWHFxUUNMSndZMi9LYSt6Y2FiRjc5MG11NUExY3grRWxaUFQ2cnRn?=
 =?utf-8?B?cHdGbjNJaGdpOGZKcXhVblAyRHAzSFFDQVNBUHd5OXRsbThjQld0ZnRRL1hD?=
 =?utf-8?B?OTNCOVhHaFIvdldKK0ZzWGNtWWNKQXkvN1VmUmozbnJMeFRiNGVOK3czSUlS?=
 =?utf-8?B?dXFyRSs3RkYvbGdlVzhoT1NCdy9xVFZ6bzdCY1ZCWlJlV0x0T3dmLzgwc1lW?=
 =?utf-8?B?Q3ZmV0xONDlINmtuVndiOUxvejdrd1hqZ0NJOEU4N0l6VndRZnlwNExqZHlr?=
 =?utf-8?B?TzJzcVd5blNubE4wTklPWDRMTFlNR2RZczJHK1VjalZJdmd5OGtLZC9xblgx?=
 =?utf-8?B?YUVkdnZRamVuRHh0cit2TE9HdXFub29QQ3dxT2ZyY3ByV2lkeFpxdklQc0Nt?=
 =?utf-8?B?OFhMRU9MaStoc1ludTUxODB0RnpyUk9rS282aHBITVQ2QUNZSVQrNHkydWdw?=
 =?utf-8?Q?yoAaunqCats=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dGprTENRZjI3cUNTSlRpMDU0enVETWpCbk1iN0xlUk15cXNvdGV1VEhrSGZW?=
 =?utf-8?B?RS93R2E5Wng1MkxVN0Q0RGNUYTFSZWsrbzNnV21DdW12cEwxdVVteVNpeUUx?=
 =?utf-8?B?MjFzOE05TUpiRzdBSGxvSVpmTXlMR0tYQWg4TEcrMGl1UmI2THUrb3hxQy90?=
 =?utf-8?B?L0dUMFh2QmlINXREMzROQ2E3WXlKZmpEeU5yNlpZcklsa3UydlAxT2grbnEr?=
 =?utf-8?B?S0pxZnZJVkZkUWdFSHI1NWlwajhzdzdnMWFBUkpMSTJ3djZKNUR1OVJNYjRM?=
 =?utf-8?B?T0hzRXFYTVMySk0xdi91WldVYXgyUnFOc1VlSVFqSUZNOUNMbkJ1d2crZzkz?=
 =?utf-8?B?L3Jxa2Roalc2V3F0REJPVms4QWlCSWJ4cGdzRmhVUnN4Y0ZJUlJGc3hBd3U1?=
 =?utf-8?B?V2hjUVFmaU9MRUJTc1ZJbzdSYWJZeitBWE43NU83bDdWaDNkU0pXYnZLNm4x?=
 =?utf-8?B?WEVZZVNsSnI1QXRXcVBabzRkZ3ZrMy9yQm9xVVY1UHBuSTRZQXZHTmoyVkwx?=
 =?utf-8?B?R2cvb3FUSVkvc3dTL0V0c1ZDWkZYb1FST09LOTArWi8zelYyNHhkejJxcGY3?=
 =?utf-8?B?azEzL2tYM1l4ZlVaNVJma0c4UzYrYm1pTXhjandPNWcvOThMMzFNS2tvZTNE?=
 =?utf-8?B?cTF6cTl2bkFtNS9DWG04cUpLOUt3a0pMeXdhcS96MDlNQnZRWGJ3SHFCbFg3?=
 =?utf-8?B?aDdKZEtKOWxXam5XTStXRlR6Z1ZzdmxYS2FlRmFVRDVIOXAwNjlMNGZoN2pL?=
 =?utf-8?B?WnNPaHg0bFVzZUVhWktrUXo4WW9QMU1hK0xUcjhJNlhYVzhiSThxTitJL0lS?=
 =?utf-8?B?Y21mbHRCeUhtYk8rZW4vWTNxdkJjeFZ1NCszQS9WSVhnOWRlT0JrMVB0cWVL?=
 =?utf-8?B?ZWpxM3c3MjJMek9yV1A0QnQwNlNscm1ia0htelErVWxTWTdmMktBKzNhRkY3?=
 =?utf-8?B?SFQyYSsvSE5UdERZUDMvdmlGR0p5anErWERvZ3VXOWYrWnF2TEtXczd4MzV6?=
 =?utf-8?B?ajhSRzdTTVU0V0JSQmJNb1JkL0Znb1hqOFdDQXZvQ0l2dzFDTVQ0bDFvWVhX?=
 =?utf-8?B?U1o5djZJODM1K3FpaUdudkdneXREL1Fnd1N5TzFzcmpuaTd1V1B4N21DSjRi?=
 =?utf-8?B?S0pHNzhtMGJ5OGZkbWlCS0U0T2xCRlQyMDVwb1E4V251RlEzSHI4R2FNUVZT?=
 =?utf-8?B?aVRmbDhRbVRSZStpUjRiM1BJdFYydTllV2FlREhEQUR4TWozeHBEMmgvT1hB?=
 =?utf-8?B?c0FhZXU4UTFhK2krdEgvYnh6SEJ6c1lTa2N1VjdDclB2K084eTVVVVBsYVNs?=
 =?utf-8?B?UkdINUdQemYvTEFBL3lNb1ZkTWdIUlZvMWJ1aTMrY0FVelhYUWk3ZDU3TmVl?=
 =?utf-8?B?eEg4V2Rud21QNWRVK1ZNMXJicklxRUZZMlJ2Z2oyWmE4TFNiS29IK2dHSlFv?=
 =?utf-8?B?U2lLQjZrdlhLYlB5c3JFZ1Z5MTFCa0xVOTRWNTJ4NlhRZ1JKbDF5VkROUXhz?=
 =?utf-8?B?MmxQQ1FmZVBDTUxhdTJVZi8yM0s2TVY5c3pGRFF4MUJ5eXVibDc1S2RxaGlU?=
 =?utf-8?B?MzlraHZSc1ZXa21KdTE3TWUyVlZUOXhoK1pmWDQ3Qm1hYmpmZm9lR0JKMmxZ?=
 =?utf-8?B?bDBhbjVxWUI5YXpqOUNoeWxqcnFCY29FUTBqK0U3eFN0c3hEait1eW5PN3NQ?=
 =?utf-8?B?enkvRThESDQ4LzZ1MS90S2FndzJJeHUzb1lHRlZJblZJYWxFRTYza1NnbFFy?=
 =?utf-8?B?SFpFNkZ1RUp2emVFRlZpdENoTk1sbW5KVGhYZHVWZWhuQkRHZnZWQWhLdmxt?=
 =?utf-8?B?SVV3bXdIcExlVWVOYUdOSG5xSzl3ck9wNy9tV2RWdGkzN3o0MDJtNXVSK1hz?=
 =?utf-8?B?UzRsTGxCL0tMdzNtTDB5QllPUDZwU0dTV1JhdkpYZnoxUEhBd0plTm1jK0hm?=
 =?utf-8?B?RVU5ek1tRmI1d2VvU1FkVU5HU0NnRHQ5bHJsWmN1cjFmKzFWaEhoZEFvN0Yv?=
 =?utf-8?B?aDdLQkg5Y2lISnFlYk9OS1BaVlNhNHpBeGFoZHp6UnJLZDB6eFFwQzNkeFFx?=
 =?utf-8?B?Z0lkQXRHOVVZM0NHMFBzYlNlTldsQUJMMUpaYTd5eHlyNUFLVmlNcmZUWVpJ?=
 =?utf-8?Q?mmd+QW0yC+4xjc43xw4KXnxL2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0da7f4-7290-429b-f7ad-08dd30b631fb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 14:02:03.8806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WA9TmdmLrgK1o2LpY8LfxJp6ce1BaFNDVYB9Yh1NJ9wxp6MRpsQOAjsnqhfxahNC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6571
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

Am 09.01.25 um 14:37 schrieb Philipp Stanner:
> From: Philipp Stanner <pstanner@redhat.com>
>
> drm_sched_backend_ops.run_job() returns a dma_fence for the scheduler.
> That fence is signalled by the driver once the hardware completed the
> associated job. The scheduler does not increment the reference count on
> that fence, but implicitly expects to inherit this fence from run_job().
>
> This is relatively subtle and prone to misunderstandings.
>
> This implies that, to keep a reference for itself, a driver needs to
> call dma_fence_get() in addition to dma_fence_init() in that callback.
>
> It's further complicated by the fact that the scheduler even decrements
> the refcount in drm_sched_run_job_work() since it created a new
> reference in drm_sched_fence_scheduled(). It does, however, still use
> its pointer to the fence after calling dma_fence_put() - which is safe
> because of the aforementioned new reference, but actually still violates
> the refcounting rules.
>
> Improve the explanatory comment for that decrement.
>
> Move the call to dma_fence_put() to the position behind the last usage
> of the fence.
>
> Document the necessity to increment the reference count in
> drm_sched_backend_ops.run_job().
>
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>   drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
>   include/drm/gpu_scheduler.h            | 19 +++++++++++++++----
>   2 files changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 57da84908752..5f46c01eb01e 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1218,15 +1218,19 @@ static void drm_sched_run_job_work(struct work_struct *w)
>   	drm_sched_fence_scheduled(s_fence, fence);
>   
>   	if (!IS_ERR_OR_NULL(fence)) {
> -		/* Drop for original kref_init of the fence */
> -		dma_fence_put(fence);
> -
>   		r = dma_fence_add_callback(fence, &sched_job->cb,
>   					   drm_sched_job_done_cb);
>   		if (r == -ENOENT)
>   			drm_sched_job_done(sched_job, fence->error);
>   		else if (r)
>   			DRM_DEV_ERROR(sched->dev, "fence add callback failed (%d)\n", r);
> +
> +		/*
> +		 * s_fence took a new reference to fence in the call to
> +		 * drm_sched_fence_scheduled() above. The reference passed by
> +		 * run_job() above is now not needed any longer. Drop it.
> +		 */
> +		dma_fence_put(fence);
>   	} else {
>   		drm_sched_job_done(sched_job, IS_ERR(fence) ?
>   				   PTR_ERR(fence) : 0);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 95e17504e46a..d5cd2a78f27c 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -420,10 +420,21 @@ struct drm_sched_backend_ops {
>   					 struct drm_sched_entity *s_entity);
>   
>   	/**
> -         * @run_job: Called to execute the job once all of the dependencies
> -         * have been resolved.  This may be called multiple times, if
> -	 * timedout_job() has happened and drm_sched_job_recovery()
> -	 * decides to try it again.
> +	 * @run_job: Called to execute the job once all of the dependencies
> +	 * have been resolved. This may be called multiple times, if
> +	 * timedout_job() has happened and drm_sched_job_recovery() decides to
> +	 * try it again.

I just came to realize that this hack with calling run_job multiple 
times won't work any more with this patch here.

The background is that you can't allocate memory for a newly returned 
fence and as far as I know no driver pre allocates multiple HW fences 
for a job.

So at least amdgpu used to re-use the same HW fence as return over and 
over again, just re-initialized the reference count. I removed that hack 
from amdgpu, but just FYI it could be that other driver did the same.

Apart from that concern I think that this patch is really the right 
thing and that driver hacks relying on the order of dropping references 
are fundamentally broken approaches.

So feel free to add Reviewed-by: Christian König <christian.koenig@amd.com>.

Regards,
Christian.

> +	 *
> +	 * @sched_job: the job to run
> +	 *
> +	 * Returns: dma_fence the driver must signal once the hardware has
> +	 *	completed the job ("hardware fence").
> +	 *
> +	 * Note that the scheduler expects to 'inherit' its own reference to
> +	 * this fence from the callback. It does not invoke an extra
> +	 * dma_fence_get() on it. Consequently, this callback must take a
> +	 * reference for the scheduler, and additional ones for the driver's
> +	 * respective needs.
>   	 */
>   	struct dma_fence *(*run_job)(struct drm_sched_job *sched_job);
>   


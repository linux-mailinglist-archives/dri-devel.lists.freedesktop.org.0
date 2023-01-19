Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D4A67373E
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 12:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD0510E90F;
	Thu, 19 Jan 2023 11:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from outbound.mail.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5AD10E90F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 11:44:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5gQAM4MHCKv4WTF1ORpjD6y2dBuKyLy4ZlJCpLSweovFK4BGIVhOnLVkcoB096p6BvAcVEPBusVKwg0wYdemxsLHJQEde/ThD+gI5Nfgezlg4DbrkvNDpaQW7ZZjY7eRKRd5Xti4mrP1k6AK7A1PDoaOs8XAIN7vqD+8yj1fHOCz5u0NlKvL2tSUjVYKbn/Fm/cEBHSQzErVVhbL8kimlEvjlozjtsGGqSX/hxPzhSghGkCjsyDqktAfKPVmANQkjcWBZUkPcggA1TNss6+RbWbsNBwcVg+hEkgFWpmnsiyCo9WaQrAtH/qqyOOdAE8wctJGrngzo8D1PcioYBz9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToLJaSRi/EOcP/EusyLd9hTZZHaHBEXVfIJZcjwiL0E=;
 b=EXtU9QpwU98rLTX5D1+IN9DFZaulwY+4TSU/zklIa1PVYHQO2piWB5LI7F+Hq4uf5f9Cvf40pn4k+DfcX89EmtdXnj4RVtE6YEm0KI09OJsAbpEherqbH+MX6UwDXIqmRd3HixQQmpFzdIWr+2ikEG5ZM5jFckMFOnZmPPTP1EqVaU+BfqSo/0I82iO0F+10w9VVbOSn8+BF9LUuXDMH4nM/0ZxKn2BMfxTsptP5A55pdWlyF1ea7lLAg0kEfDKAja0beqOSLPYOi6mBv9h98j8kES8/2X0L88+0dlb+s1Hd4a/LxCMaKsCXIcpbUmVjK1S5kO7nNKdJx3JAiacPjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToLJaSRi/EOcP/EusyLd9hTZZHaHBEXVfIJZcjwiL0E=;
 b=XDM+aJR3I1UhR97zvbs+NrhbRYbgSHtCsHUlSqMye81swGIa+nriJMHWYKkMQdvAwf5nX1Hrx7AuQ8Fua4XFfAPVBgzyhI6yqu6EJVVOH1BJYcZT+LtTs22CMiefl/LwJkh2Qdf7xAqmDkP0N0SgU/D0tmGqoXPE8ZF05M+OxJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4229.namprd12.prod.outlook.com (2603:10b6:610:a5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 11:44:40 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 11:44:40 +0000
Message-ID: <61349cff-c06c-3958-c1cf-9713e12bc313@amd.com>
Date: Thu, 19 Jan 2023 12:44:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: RFC: dma_resv_unlock() and ww_acquire_ctx scope
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <730e5a40874c0e5bf66ddcb9fe7b2e4f28e09b1a.camel@crapouillou.net>
 <33c2d360-31f9-da8b-127a-d473029192e6@linux.intel.com>
 <Y8kltaITYoTEl9SQ@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Y8kltaITYoTEl9SQ@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4229:EE_
X-MS-Office365-Filtering-Correlation-Id: c0ed6f6d-81f2-4f2d-3d4b-08dafa128c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3eFHsTFzBoDlfL0T7Drqm8vp0ywsL3oFhSWK5U4+9Xl49HWK4PuirXIoCTpmHKfhsLnE4HbSq6HHcXpThu9o4qcwNHSgftu5Baisu9PqEuwIueMpBnLJd1/kPRDlUUzauW4ij4ld+IyS3O072EWjLom+6Dn3KAEXluq2Rnbe1GAcal2is85BI3pX8UrouNSOdP7Xzxsg0WM0Wj+LxgGn+Rb0xx7Yp9W+YhYEUfwqZfxpHFUhOD9uHEK/XREUEOrvVfC42DU4fupRA1e/HZRhqn+yKJH18MD3atr21HY/9FKC2tywWyR7wVlfoxPeXE/3lsdqLEoJRaL74WbKSsuJNHL6uYo8w08RH1zJ89Onow5x42Qyb975VLRcETYyznCL8v+BlzjCMvvZ0sRVo4ZEmnf3J5mEyzP9EkJaE7JFc/OkPS338bUWu9EYdhwqsbBhF5K/NX2mGb7ZcerjBa7UemLY5xK6Jcn+QftGkd7ALhFSCEWGYWVEwSZ1OQumH9G/RV9iiFmP9LAANYUGaXPoMiWAgdDjV3mG87JEgMwEQSUOTirlMq1IpurUE4epBmDprcBWxXgm+99W0joXAk6lul2cdj1whN12ifkCAXwHLoxWtBC/IoYwM7lf0rBcmBzHpok5UNdPBYg7KfiM4xnRtCckfIoYn6cHaJUws9oK8KPNy305H4pzzYE54mCrAylYYZjU/4ceWhwBKIiOAWhxW2aGwVNRlR/AbvB9Jrgugfs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199015)(41300700001)(4326008)(31686004)(6666004)(8676002)(66476007)(8936002)(66556008)(66946007)(36756003)(2616005)(2906002)(5660300002)(54906003)(110136005)(316002)(26005)(6486002)(31696002)(86362001)(186003)(478600001)(6512007)(53546011)(6506007)(83380400001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2FYTHpvZ2sxZkx1VjRROTZ0WkJGd0ZwN2VYWW5zVlRqbW55NTVUc0hiTVYw?=
 =?utf-8?B?aDRmNFVVejNZSytvcDVhTFFBVnN4MVJRNnpSR2tzcGpMUXlaRUpFTUNvb2xk?=
 =?utf-8?B?Y0dxZ2wwV0FrUFczNVNwYjdVOVhmOUFLdGxJS0tIOWxRNFF0Tmw5Qm1UVDlB?=
 =?utf-8?B?ZUxBOFVuNEpMTTlvc2pCeEhtSWs1WVc2OGdqRWI0N1BBWTZCdHRyN3RwbnB2?=
 =?utf-8?B?RzZ5NHhDbGMyYlNLcXBwMWdla2VDQzRKbVFVanpzQUd4VHh3NXN4T2FCcEo5?=
 =?utf-8?B?SGRYMEM5UDBUNnVKQVVkU28yekpQbElxa2FGOURwWTk1Z1VTZVBOcFVCc0E2?=
 =?utf-8?B?NWNLejNlUm40aDZtSHo5Yk4yUjRsd3JZOTc2YTF0RG9jRHFhbXNxYzBlMnZt?=
 =?utf-8?B?KzNaMXFBNGFQWEZLUTlCT3B0T3YvYTRDVEtidkhiQ05JdDR6c3NjU1V4bzdq?=
 =?utf-8?B?NzJvb210djFyWEF6Zy9nNG9tQUVZTHFWbW9WRmRDR1JxNUNFOUhJUHBRdEQ2?=
 =?utf-8?B?cGNCU3dsMzNsYXc3Zko4MFJySG10VzRESm9FOXhwOHRESjFUYUJjSGsrRmJn?=
 =?utf-8?B?U1NPZXU3Y2orUVU2Z0xrUGRPeCt1YkFtYWVZclZnaERiZWdzcDh2QlAzdkNR?=
 =?utf-8?B?ZG1QdjY4MnlCak1LWkx2ckFXQjZ1T0x0cUZZYkZoTGV1cVA5Q2NYMUEvaDM3?=
 =?utf-8?B?S05lODVmOXhPZzEvUytDS3oxd0RKK1N0ZWR3anlQd2dFRVFzOWRmako3Sjhj?=
 =?utf-8?B?V25mdUN0V3dVUnkzanBTbXhaVmZEWFRNZXQ5VkYxVUxCb05aZ1p0QjJvazlp?=
 =?utf-8?B?amtjcGxaQkkrUmh5L0R0bVFvQWdLOElIY1FJSVY5Ym0yWWluaHNMYzJOUFN1?=
 =?utf-8?B?eDcrWFFueTZOVktXdlMxSTNyaTJsVXpXVS8weGo2eC9GeHJISnlJSGdsNjVD?=
 =?utf-8?B?QmJ4UVNnWlcxTy9iV2MvSE1DdGdDYjZZSEVVOFZnVGNWM1k2d1FCV1dEWk1q?=
 =?utf-8?B?ZDF4UE1rY1hDREovT0RYdHByazVSZWRYRnEzRDVYS2M1TmFKS1RjLzVBQXVT?=
 =?utf-8?B?YUZPYWRhd3BBZXVuc3J3U3d6OWh1SDcrRWRVU1YrWUcvWmt4TkRyZEx3V0h2?=
 =?utf-8?B?NnptV3pSSWp5aVBSa2lQZ3NCaE4zTVV2bEFpdXZhYzM4OXYzeW9GRGtBMk1y?=
 =?utf-8?B?bEsvRVdpK3k1Um1ja3lpSHNWNmlRcVlDdVRGOHdaYnRLK3M4NVNveldyUlFy?=
 =?utf-8?B?UmRiTWZwRGk2TFBBWWsrbFEzVXpwbSsvWE4rZUZkSTYyeFVaT1ZaNGdnRXl1?=
 =?utf-8?B?MCt4bWhMRDU2aFVkRGJJY2MzV2x5S3hHVVl5YkhuaEtDRTdDOFRjZGhJcFRR?=
 =?utf-8?B?NjFHNmRZNjZZWkFQNGd1UVRuWmRvR2hnYTlRZmprWHQ4dGwyckczWjh6SzBV?=
 =?utf-8?B?MDFicjF4aDllS1BwUGJDcy9NNW5LMGI2ODhJVDh4T1lNaUZHYmJKdHFtUFJn?=
 =?utf-8?B?SkRaNk5ISUp5eTUrdUxnNkR0RmgrWUdTaFUxWWVPVGttTjZjaW1YM0RtUUVQ?=
 =?utf-8?B?YlVlTjNkbDF2eDh0dEpudkgvVmMrcG8vSVVyQUozOVpsSzBHc3ZzSUlUOVA0?=
 =?utf-8?B?QU1FYlVQamptaW1YcHkwN251Q1pMYjl0MGJjQ1lnMlo3MlArQTd5cnRCak5p?=
 =?utf-8?B?dEtRaWRSdGFWTmdaVXBVcjlIQ0s0VTdEU1NobThkUkRCdmVMTDE3T0dMYW51?=
 =?utf-8?B?cjg1WmVpQ1B3Qk93dVUyZnlUSXZKWnY3cm9udDhKUDB2dXp6a2dGWGJtRUh1?=
 =?utf-8?B?VVNwM2tDTTFwYmlpdjExSVVKU21RdVFUVjlBN3hBVTlpSDE0RjJKVlZuaWtS?=
 =?utf-8?B?TnViQXRPYVppRG9Bcm9VVUU4djE3VU5yd01EOWpqMkM4WXppOGFOQURnQXow?=
 =?utf-8?B?cy9pVHZhc0dzREljeFZ4KzNzaWZ5d1ZMUi9tMFljREdseFJBZEdJRmNZVkg1?=
 =?utf-8?B?TVdpbGVJS3pYOUxJc1VUeGwvSk5tZTZMQkVIQVcxRDlIUHQ1MCttYUl0L1VI?=
 =?utf-8?B?TkRZT2xYSUg1cVlmSWtONm41UTdEdVVZOFdTYlBaTi9GenlQTE5EenlYN09j?=
 =?utf-8?Q?EaGrHBx3qp+xEz4CKJgCN5XQG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ed6f6d-81f2-4f2d-3d4b-08dafa128c61
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 11:44:39.9759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DveyUK7ud/Rz8oXqo1L30A5WmU6yEKNMnQC7m3r4MwNB+nGQwau+/4NT1EQlpCHW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4229
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 19.01.23 um 12:12 schrieb Daniel Vetter:
> On Thu, Jan 19, 2023 at 11:37:39AM +0100, Maarten Lankhorst wrote:
>> On 2023-01-19 11:24, Paul Cercueil wrote:
>>> Hi,
>>>
>>> Just a reflexion I have after an intensive (and intense) debugging
>>> session.
>>>
>>> I had the following code:
>>>
>>>
>>> int my_dma_resv_lock(struct dma_buf *dmabuf)
>>> {
>>> 	struct ww_acquire_ctx ctx;
>>> 	int ret;
>>>
>>> 	ww_acquire_init(&ctx, &reservation_ww_class);
>>>
>>> 	ret = dma_resv_lock_interruptible(dmabuf->resv, &ctx);
>>> 	if (ret) {
>>> 		if (ret != -EDEADLK)
>>> 			return ret;
>>>
>>> 		ret = dma_resv_lock_slow_interruptible(dmabuf->resv,
>>> 						       &ctx);
>>> 	}
>>>
>>> 	return ret;
>>> }
>>>
>>>
>>> Then I would eventually unlock the dma_resv object in the caller
>>> function. What made me think this was okay, was that the API itself
>>> suggests it's okay - as dma_resv_unlock() does not take the
>>> "ww_acquire_ctx" object as argument, my assumption was that after the
>>> dma_resv was locked, the variable could go out of scope.
>>>
>>> I wonder if it would be possible to change the API a little bit, so
>>> that it is less prone to errors like this. Maybe by doing a struct copy
>>> of the initialized ctx into the dma_resv object (if at all possible),
>>> so that the original can actually go out of scope, or maybe having
>>> dma_resv_unlock() take the ww_acquire_ctx as argument, even if it is
>>> not actually used in the function body - just to make it obvious that
>>> it is needed all the way to the point where the dma_resv is unlocked.
>>>
>>> This email doesn't have to result in anything, I just thought I'd share
>>> one point where I feel the API could be made less error-prone.
>> Hey,
>>
>> This example code will fail eventually. If you have DEBUG_LOCK_ALLOC
>> enabled, a fake lock is inited in ww_acquire_init. If you don't free it
>> using ww_acquire_fini(), lockdep will see that you free a live lock that was
>> never released. PROVE_LOCKING will also complain that you never unlocked the
>> ctx fake lock.
>>
>> If you do call ww_acquire_fini, you will get a loud complain if you never
>> released all locks, because ctx->acquired is non-zero.

The problem isn't that dma_resv_unlock() doesn't need the ctx, the 
problem is that in this example the ctx object isn't properly cleaned up 
and used.

As long as you only need to grab one lock the ctx should be NULL. Only 
when you grab multiple locks the ctx is used to make sure that you can 
detect and handle deadlocks between those different locks.

So using the ctx correctly also makes the lifetime of that object much 
more clear since it needs to stay around at least until all locks are taken.

>>
>> Try with PROVE_LOCKING, your example will receive a lockdep splat. :)
> Also CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y any time you change ww code please.
> Otherwise it's just not fully tested.

Yeah, completely agree to both.

Christian.

> -Daniel


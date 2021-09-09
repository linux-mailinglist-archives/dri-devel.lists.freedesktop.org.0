Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA024045F7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 09:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A283A6E44B;
	Thu,  9 Sep 2021 07:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2052.outbound.protection.outlook.com [40.107.100.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C350A6E44B;
 Thu,  9 Sep 2021 07:10:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ag5tFA83qJLeR0oobnlkPSn6y9jS4KR35xAFaqA4fAkiQ5NSQ2+FZ1jHKHBqPhkxjLq0apj4hUS0WnramLP12ksB1rkd1Q8rK5B6+7mwJRjklOtM3Km0IRJPwTdGS2V9DaHS3j2Jti4MPuvI4+GKTSpvNRpZYQZXSzoEmL0cGlBTALXXr/aL3DxgVh4bahxHprqUn+I0V9YvqptnkVYvWHEH8t/mBYg6/R/WOjFa3lPen7a9V/hWWloHGgwCArGiY49Zj5Z0/We8c424+O93606bzq3Pmr2QiGa+CUWLJRuZtZfvZTHT1QEGB8BwSdMODvoo8oLx/KJURkI05J6wPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Td9h2hKKLcm/q6/MaEBAZbNIQ9y6rWNoQ5JwCqpSWPs=;
 b=BlLUe+xRyNrVZ+50dteNhUT7EF+k+mgTP800rvZFsaIYFK85PWmsRFIb91myyYGy5JT2AZWPANmO9bO0pRJM9RA1vVZORK/IooF5udgCWO+O0dK6j9Fbizpi3eZwPyKzMtH3AvpS0c4Bfe6+WhxobF2oWdMpoyCdslJtA+1Lt2NQl5GYwKuNvTRhkElJaDmb/k/EZIzRFKklWe8UpQIPQ7KDZ8id/sjwTmTJ9RaZmb4goa/1oB6D6R4Tq+onxg6v4MIFPsENy315XZMWslx0YZCQbDbLwzOfMCug7eP6mG1ZVSbYoWWqPBDgK9ul28v5mxHH2GEerPzBRNOQNcHxcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Td9h2hKKLcm/q6/MaEBAZbNIQ9y6rWNoQ5JwCqpSWPs=;
 b=URYU9u4gVGck3mfNZF/0DMFaWgqYi9yVNnFLePgnOVBRuDzBoIPHPkrSWHnYOqyRxN3+azC2L3O7OxcsqArMF/O0paMSnb+ZuE7ig99iN5j2hIQV8zeywavCJ9DTHRP5maJagSXPp2VN5TgBRmYFgV+3Ks3FJWDI/p+S8KHqboI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4048.namprd12.prod.outlook.com (2603:10b6:208:1d5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 9 Sep
 2021 07:10:44 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4500.015; Thu, 9 Sep 2021
 07:10:43 +0000
Subject: Re: [resend PATCH] drm/ttm: Fix a deadlock if the target BO is not
 idle during swap
To: Daniel Vetter <daniel@ffwll.ch>
Cc: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210907040832.1107747-1-xinhui.pan@amd.com>
 <074efe24-db7a-df68-3624-05989596f44a@amd.com>
 <YTcrcw+hxWuyyl4C@phenom.ffwll.local>
 <37412f7e-9f6f-04bb-41b1-72931ea1381e@amd.com>
 <YTkAnDncKU7ewW+5@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <97ccbd16-ba3f-1b21-b6fb-5568d34f1af3@amd.com>
Date: Thu, 9 Sep 2021 09:10:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YTkAnDncKU7ewW+5@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0020.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::33) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:327b:a453:3daa:de36]
 (2a02:908:1252:fb60:327b:a453:3daa:de36) by
 AM0PR02CA0020.eurprd02.prod.outlook.com (2603:10a6:208:3e::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 07:10:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18e25e6c-bd09-4c23-3095-08d97360f052
X-MS-TrafficTypeDiagnostic: MN2PR12MB4048:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB40486D0D6997EDF2D5DA4C6F83D59@MN2PR12MB4048.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +gLNCoMPHYbosQixDp5fPCh3OXgYS8pOkQlvqzuFbKwy06iF2l5VcDTaEpyf4eEDFXKeK9iOTmMIw0D3hr3Y6aHjTZVid77PzZPZ6CAHV5BWovOhH2DZG9EEU6jPUYMSEFNVfiyfu2JUe3R9wt563WnFZgwFmuAlDvyrOqrI9m9Ybq8FzRJenD2ZWSZyX3WZ1nhlvJgLihv9U/IzdHxUtQiNYEGtPWJLUikzjT2pyri4KUGac6DTqUvW1DCVzF9Ijq71a9H/9qw3GOjJBdSWunN3PMmn3vDqCUbDRmCiYZ5ahbhuIxihuVuR7HE8jkCdKsNsayjNZxfokK7bNF+Q+moVnuA+bbuDTPEc3Vy1pXaBAjlgCaovAJ//fe2kqrUdwqQcKRfKZQ4Kbp7lUD/DalxMQmu5ZN7jZO81/LTMPga5tfph5pYpRxd4ZWarhSvFPhnaPog6EhofV6lBmavwx3QnNAEE7pqHgwS2T7PIyim0xgu7eLKOE+kWfkGsdS/NrUgG0HtsqTU+dlf4Bh4tH95dWXeto9iGCaMQ5VM4E3Qi4qYY+Ldlz8ASEoP7Zt9+kDitKgHi1U95AfBOpXG/6v2kj3gc+bAJFzsjBEWocwaJC3ZsLPFZlAK0NThfUlGFcflnYzrexhn6MEQCNyAVC1Ur8NSDPsqHoBPeEmBEqTEGXW6SGCkKTj6gEb2r6bAcAgeM0UiHcjMEmeFIxHH0V25LCEzIk7DM1oBAr7jeRon5RieB29/ugnDg4Omui/7d
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(2616005)(186003)(36756003)(83380400001)(316002)(2906002)(8676002)(6666004)(6486002)(66556008)(478600001)(5660300002)(4326008)(66476007)(66946007)(8936002)(31696002)(31686004)(86362001)(6916009)(38100700002)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmliYysyTXhGWWJKRm04UjdyaFIrRUpKdktTZG9SaVgvN1ZuZUZldlQ3UUdj?=
 =?utf-8?B?VTJ6Z21Jdm03eHNFSzZIenh4bmR1YW45SEVVSERpTzRjT1BjY3lzZkVlc0Rn?=
 =?utf-8?B?M0hpSzBFRkVSTFFxT2ozbFRkc09LdDlSVDJRU2FqdmZGaXp4azdhNVJLc2Vk?=
 =?utf-8?B?RUZtZkxYQWY0cVEwdTliY05ZVElXUi9YQ0NSU1Vha1JEc2loVUVqQXZnbVNH?=
 =?utf-8?B?b0cxenp6RVlETElIUmNPckNMb0tRYmZNZVJlM3ZLTGRONFJpcVdqVDBYTXNM?=
 =?utf-8?B?RFhVUEpnd2NmSldIdktULzVTdys5YmZVRWVPSUMxczE2ejhMZEdsWmtjRHQ5?=
 =?utf-8?B?VkY2dC9pVXU1OTMxNUx3TzlSS3AwenVaU2FwR2FranVOdXhjcGpNb2wvS2hX?=
 =?utf-8?B?cnJ0YkJxWkkrYmN4S3UvcWNGMHdPSmZ5TWNVQW93TC9xcjZxS0l1UlNBend1?=
 =?utf-8?B?a0JoYk1kcEhJMS9lVmVwMnpLbFR3RlJKVVc3WUYvVWZPS1V3cnJoODd6SGF4?=
 =?utf-8?B?N29JbWEvdEUzdXpvT3lvbVo5T0FmYjY3dnNNOTRCOTZDK2p3dEMwbjd1aVFB?=
 =?utf-8?B?OU1DY3VWa0c2ckY4dTA1NEpWVmRBaVMyOVQzWFNGSUpQM3hWSWdCS0pzQm90?=
 =?utf-8?B?SHVkMFJJb1pwTnJsOE56dkhxNVdxQkM2T3YxbTVJbEFkWjZPckJvODBTYUVQ?=
 =?utf-8?B?M2U1R2YxN2RsaGRnNUVxUCt3YXBUVzN5eTN6TDlkdjJONGVqaTBDR3BvcDN4?=
 =?utf-8?B?VEFMUk54YnlXemNhdkxEQ212WDdZejVneFJpRmRJYk9neHVYNEJQTTErMGx0?=
 =?utf-8?B?MG5JRHVXczNrcTQvNUp2S2x5MHQ4dVBtajA3MXpiWjBkcXBJRGxDckE2SmJS?=
 =?utf-8?B?bWkvbHJYdng0emg1RmRrQTdJNHBJcGtGQmxsNm1MS0RydEhBczdxRDdmMFJD?=
 =?utf-8?B?UmkzQlNkUnV2TWVnQmovQnNLblNSVFNiWnlWdXNBczl6dDk2NlZvOHd1Ri92?=
 =?utf-8?B?RjVoOGtCN294V3ZGNzE5ZkdvUWlpcGsxN3hXU0l6ZEJ5Y1h5ZFBtNUROV1JV?=
 =?utf-8?B?U3owOStsY1hzaXNvUVU0T3FGeC9vSG5jMW43VDJyeFJwcVQ5ZkZQOG9ERzZK?=
 =?utf-8?B?OXoydzFYWCt6cTI2OHRIdmU5TkJrQ0dBZWpsbXo2YUp6T3Y2ZnpOblA4eEFP?=
 =?utf-8?B?UFdDZUV6dU56MG0rUnV5OU5YTnpiR1kwaDZwNjNQam8vRlh1aGZTMU5yQVBm?=
 =?utf-8?B?TmgvbWV5cysxbUpmaGlSYUdkc3JUSXY1a0llc0t6aTh5SmU5dmd4VUJ2dFJr?=
 =?utf-8?B?YmphNzZmTUh1MHlwTlRNZytBTDQ4THFWUU92dWxJRlBRcW0xK3l5NU9nZngx?=
 =?utf-8?B?VXJudC9RZTlmSXV2ZnR5YWVHYkFtWEo3YldaMXROc0RiYjRvd016czlhTytq?=
 =?utf-8?B?bWJvV2pXM0orbW9tYk5oWDNNM0NSM1pkRDdrNC9GNTBzL1JyUUl2cVN2UnJn?=
 =?utf-8?B?NGlhTDhVQzdRdGpCTG5WUWkrN1VNeWloWDV1dzV1d0FkRGdXTUV6UTB2RmU1?=
 =?utf-8?B?U2NFTFluRSt0dC9wQVdrRGh0SXcyUVdlMVZQbXo5a25jMDhNNUFLZWYrMDVG?=
 =?utf-8?B?ZTlGRGd1SzRrdjhSeGpBbkVXNHlOK1NIRm0vR0dLZVJWWkY1THFHWEk1d2du?=
 =?utf-8?B?U0JXVU1KU2hpVFZEYzNNMUFYY0RCbWdUeFdMNXNvQWhLckpvN1Q5d092WGdn?=
 =?utf-8?B?ZGhPVXMyamE0RXlSa1JCOTZoN2c0NHc5LzJPWXhvQnNQUUNWUEJOb2RmNkIx?=
 =?utf-8?B?djZpWllhQklwbTFRMnZsTUIyaTJZdjVRVGZYTlJjbGg4UnRZWDRud2tHRWEw?=
 =?utf-8?Q?4AghdgbGz4N9L?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18e25e6c-bd09-4c23-3095-08d97360f052
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 07:10:43.7147 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUawUXScHPYJmWKPk1LdqbJf60F2GAbUdKlOX169oxiQig2DrSgkAXkPl6TbhQTA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4048
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

Am 08.09.21 um 20:27 schrieb Daniel Vetter:
> On Tue, Sep 07, 2021 at 11:28:23AM +0200, Christian König wrote:
>> Am 07.09.21 um 11:05 schrieb Daniel Vetter:
>>> On Tue, Sep 07, 2021 at 08:22:20AM +0200, Christian König wrote:
>>>> Added a Fixes tag and pushed this to drm-misc-fixes.
>>> We're in the merge window, this should have been drm-misc-next-fixes. I'll
>>> poke misc maintainers so it's not lost.
>> Hui? It's a fix for a problem in stable and not in drm-misc-next.
> Ah the flow chart is confusing. There is no current -rc, so it's always
> -next-fixes. Or you're running the risk that it's lost until after -rc1.
> Maybe we should clarify that "is the bug in current -rc?" only applies if
> there is a current -rc.

Yeah, I've noticed this as well.

But when there is no current -rc because we are in the merge window then 
the question is how do I submit patches to the current stable?

In other words this patch here is really for 5.14 and should then be 
backported to 5.13 and maybe even 5.10 as well.

The code was restructured for 5.15 and I even need to double check if 
that still applies there as well.

Or should I send patches like those directly to Greg?

Regards,
Christian.

>
> Anyway Thomas sent out a pr, so it's all good.
> -Daniel
>
>> Christian.
>>
>>> -Daniel
>>>
>>>> It will take a while until it cycles back into the development branches, so
>>>> feel free to push some version to amd-staging-drm-next as well. Just ping
>>>> Alex when you do this.
>>>>
>>>> Thanks,
>>>> Christian.
>>>>
>>>> Am 07.09.21 um 06:08 schrieb xinhui pan:
>>>>> The ret value might be -EBUSY, caller will think lru lock is still
>>>>> locked but actually NOT. So return -ENOSPC instead. Otherwise we hit
>>>>> list corruption.
>>>>>
>>>>> ttm_bo_cleanup_refs might fail too if BO is not idle. If we return 0,
>>>>> caller(ttm_tt_populate -> ttm_global_swapout ->ttm_device_swapout) will
>>>>> be stuck as we actually did not free any BO memory. This usually happens
>>>>> when the fence is not signaled for a long time.
>>>>>
>>>>> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>>> ---
>>>>>     drivers/gpu/drm/ttm/ttm_bo.c | 6 +++---
>>>>>     1 file changed, 3 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>> index 8d7fd65ccced..23f906941ac9 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>>>> @@ -1152,9 +1152,9 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>>>>>     	}
>>>>>     	if (bo->deleted) {
>>>>> -		ttm_bo_cleanup_refs(bo, false, false, locked);
>>>>> +		ret = ttm_bo_cleanup_refs(bo, false, false, locked);
>>>>>     		ttm_bo_put(bo);
>>>>> -		return 0;
>>>>> +		return ret == -EBUSY ? -ENOSPC : ret;
>>>>>     	}
>>>>>     	ttm_bo_del_from_lru(bo);
>>>>> @@ -1208,7 +1208,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>>>>>     	if (locked)
>>>>>     		dma_resv_unlock(bo->base.resv);
>>>>>     	ttm_bo_put(bo);
>>>>> -	return ret;
>>>>> +	return ret == -EBUSY ? -ENOSPC : ret;
>>>>>     }
>>>>>     void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)


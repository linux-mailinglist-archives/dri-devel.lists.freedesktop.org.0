Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AEC690835
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 13:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15AE210E0DB;
	Thu,  9 Feb 2023 12:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D39A10E0DB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 12:09:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9Gq3EFTaj5yziEWBsf5Ni9o0fUtsl206s4DG2OxgMGWE+zqEN43L335l80PzivRp0MhTp6Cvbe71Fb9IbFVYVQwvwf4abLPNAlJ8BF+gX5inDwYIDv3bV5mkBVWYrhQKqVTjELiTdc39uFWE8AAyqE0nJ99cdBXWSZlQMl5SqnLnJbAvxvTQ1w9nJaR3RZfWePhdF3GhaH9YGmfTNRMF07x2DrBY107RhAy6tSPEZz2CheSuemle2QGod0zRmbIpjoqFPtX+bxOxufTXYe8ijdZOOYRHjg5zv6JvQeKJet3swKYHBXcdQ6S7qWsisYYHb23NhEPPQaPyKU5fUeFXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QaWSjGIN4oiU82h365s/8kFgSKrtC3H9esQp1+TPgb8=;
 b=IzjUr8UJiVpsbcKt4ftI02C6HGfZMFqFUP05gQL5knY7u4aK2sQNHjJ+X4VQTG7nBKoG9jJ9PzkX5A1G43V272BksHQNtUxqsVXKAzaWCAp9UspldUqcv1jnr8dEwFJOj25p6GwNphPDJALtBTXdWUKf9TdRVfQfJ4xDuJSA83JwNlop76+MDK0Fi++E5tODqbdw826dg4DJDePDl7RNP2Wvfd6mU+i2p8s55Fw9CAAYG/DE++3SEa5z/heL4mKlHB0PZ/XhdN58GRO3O0tOXW9PjnKR3Oacxz6TxJ2yIE1c9ZTwvq1jUvu2YWJ+vb7eiQIoABWDpvcDgDfWqTc5/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QaWSjGIN4oiU82h365s/8kFgSKrtC3H9esQp1+TPgb8=;
 b=RqMK3jYYWtW498j/fTqCYcTpUT1tjP/Bg2qerAd6y2NdEmazjdrp+1bSYVLJrI066DF36Wo6XDvOXJG6R5jGLWoPTrs/kVzWP8AHH6JSqVvYVV768/DklJ0NGbQWSIulVynUuGZ5eHc11YOuYPKhYGAs/jLOPgyNr7AwjCNzVAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB7260.namprd12.prod.outlook.com (2603:10b6:510:208::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 12:09:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6086.019; Thu, 9 Feb 2023
 12:08:55 +0000
Message-ID: <df67ca19-5bfa-ba1f-3601-1218db2a0aa5@amd.com>
Date: Thu, 9 Feb 2023 13:08:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/5] drm/v3d: Use drm_sched_job_add_syncobj_dependency()
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mcanal@igalia.com>
References: <20230208194817.199932-1-mcanal@igalia.com>
 <20230208194817.199932-6-mcanal@igalia.com>
 <20230209112731.bzwlhwmimg5vvmhd@mail.igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230209112731.bzwlhwmimg5vvmhd@mail.igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: e6e92e66-f937-4ee0-fa77-08db0a966a14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vqHBfT0NhYkcVYrM5yj7rKR5HbBvG8yS3qfjivsif3ISzWjmBrwMX+iGmv98KdnwFufzVOY0k0d2GSBX71pYqWxt5Ug7DtGEQbzHLnjRYGfsWaOeM+HkVQUqsFeuXbyE1x5Bf4W592iColQqJZZYf2bhFaV4IWdPpL3R64NiIah6LsRCTVaytSZyrW8iZHn0/BDGa0dDzSc+D9Ov1tF8LrMxuVxNEI36kt6rZPuWR+9vhIvxXoqnrEoiQD+4aKnW4oMk2afngJsUo+vLqZZI/Y7rIJomQ7XxQmCNUMghFaDWdqPxPWnTbLC2jbtU5I19Kb6rzKEJ33t0clXQEfl0N/aof8K5xaEhPV72hQ0l+C5Ot5WZ17rBnWK7R30/t/z2seYXsG5J1GvvnA9lPyQ3zRwW1FTQygOQW41NFtIdevUo7S6wkEei6eUuymaDq3xNXHrkJLBtY3UcDqH+Sc7wkfqfsPz77Vlf27od5K6FRUBrD2jLseHuFxKx8IajTjPK2pQ5BLYO4TgPgE/3wgcrhtNgmyZrzjhHAC7LDAJfbC74zrQWG3H/d8uzaJRTGJnFoUkPX+vFceJcnbAzAENxKLHUWxQRfnT4Z47pHN52yjuJwmtR2/9nC9UkLWTzYbO9VVJkg2KyDgcF9/Hc0IDBrdwvLyuZoqUHsQWCHsyLjy+4m+RAkFYNOMOMnCYU/NFzIc0fIr4yy8KvhU0x19eB8PBABfgqH0VE1qwgirkpM1w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(396003)(366004)(39860400002)(346002)(451199018)(36756003)(6666004)(6506007)(31696002)(26005)(186003)(86362001)(6512007)(6486002)(478600001)(66574015)(83380400001)(2616005)(8936002)(5660300002)(41300700001)(4326008)(2906002)(7416002)(8676002)(54906003)(110136005)(66946007)(66476007)(66556008)(316002)(38100700002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkRTM21uYTUrN2NueldXSVZGME1XdTVuWDNQazgySGZaU0h5VVZkVVVDQkxh?=
 =?utf-8?B?Y3ZaK3BMS0EwV0lhRG5zaVFPZzJoRnBSOGJFc3J0d1hZZU96bFEzOTVCNllU?=
 =?utf-8?B?Yk4weVpYMkprRWYvMEFobituaGlBblZiRjlBUGl2RWFkSXFuS1pZdHFWUW9p?=
 =?utf-8?B?VnNhMFRMNEdkWUZQaUpvVkFpM3RkS3A4T3kwMStnV1UwdDY5c2ZmUmZoVy9X?=
 =?utf-8?B?c1ErekVVR1dFWFB1dGZ1bjVmUkFVNWNNRFpUT0pkME9FQ2t5VmZnQTFLZEZ6?=
 =?utf-8?B?NkFOM3pTK1ZaMVpWcEN5NHhCOWk4aGJtM3NDV2NoRnE1dExta3ZJckw2amxU?=
 =?utf-8?B?OGltc3dlVTNCQ2NzNXJieXY3dzkvWFdPNll6QXZtWGxvbnQ1QVRPaWhUMHhT?=
 =?utf-8?B?aWRzWHhiQTFoWjAyZEVzdmhZRzZFMCtOREtCUkV5LzdJZ3pyRnFIR0w2TktF?=
 =?utf-8?B?bEk0VE1JVDdIYXliL3pkYTBtL09YRFNvVnFIaWd3Z3l6SEdPdlBWKzVaZ2pO?=
 =?utf-8?B?eVdObVVHeTd5YVIrWVRrbU9ubXRKeWw0MGRVbGhtNXRFUTRzdWh3ZzJMSE14?=
 =?utf-8?B?ckE4bFhWc1J0OEZ4K1ZzZUNmb3cyQkVUMnoxakxWRTNVRkxkYldxTTIwYlR6?=
 =?utf-8?B?czFUT0dMdnpIdFVSRTJOOTVRbnk3cjAzK0JDQnBNeHljYllsZ0VkWkJoRGhX?=
 =?utf-8?B?RUtPSlRLUXh5dlUrVk8rc00vWHgvR1BmZ2F5VWR1aW5Ba0FrRUtXSkJpTXFL?=
 =?utf-8?B?QkRJcnRFRU5XbTlkQ0dSMUpCMk1uQ2ZSWExQYjVsUjIyd0FSbzlObjZvcGRa?=
 =?utf-8?B?Q3pRZytROW1hYnhIZ3RWeDFiVnhVWVIrZUtoQlhXS3FMY1RMMjgxaitIaG1q?=
 =?utf-8?B?YXFjZmdMRkJnYUdia3RTQ0JQeEkvSGJvNnZPc3dEUTVvaFc0Qzl6dDV2TjRN?=
 =?utf-8?B?N3AyL0xUQVJtQ2JZeDJDekkyZmZrR3hmL2ZnaGlnK2pMQm1xRzluTDlNMGVt?=
 =?utf-8?B?c2dGQ3BhbkRJMmsyTk5RNGE2MGpFbjVMczNHYUllMCtpRGpIK0xDNys2SDdu?=
 =?utf-8?B?R1FJeTBBS2NoS1RmK2V1SEpJcitwYWViUDYyRFR4NHVLaCt2cHVtamh2NGlr?=
 =?utf-8?B?eDNEVldVZEo2MHNSQ1NyNmRZWXpkRzVJcWM3TjRzSVBLZDlmYWRUWFJQbXI5?=
 =?utf-8?B?dml6bmprT1BmcnNxbzV0dTNCeGpVUkpMSEV4dEk1akdCUlNuVVhRWlJRUi91?=
 =?utf-8?B?VC92bVdhSldibWFRSitCVlRlQyttaXA5dDV2VGo5ZWdWVU8zTHM2RnpMYnRx?=
 =?utf-8?B?amRLWmt0RUVUS0FScFZEUFlQelp2VkQ2R1YzVjZtbFM1MlVyQVFtQUdkZ29n?=
 =?utf-8?B?bWhxVnRhcXpRKzJ4NndVcUppNGVPM050a0tPQTJhcVNWU0c5NWxJSXRuNGhI?=
 =?utf-8?B?a2NXelAvNjd2cUN4WE5OT3JrRzc1bld4ZHpNWWJzVThtOC95bG54MVl5aUFw?=
 =?utf-8?B?K2k4eEcxQVJwdCtuUUNUZW1WZVFiQndXMWkxUmVyWVA2cFArc09Ud1M3VTQx?=
 =?utf-8?B?WUhVcC82MlhYcnROWlNSNjFLMnhwRDRZdnZUQ0R0ZWVmb1Z5QTB4NGRaVk11?=
 =?utf-8?B?VFdTZEt1SkZsTVRsVXdwTmZJS2hNMEwwNnlTWDJndWZ0bjk1RDVqMWpLT2s4?=
 =?utf-8?B?K1d4RUxMaUpNZ3pWTXJ5UDloblF3YXZqS1BleTdUVU5wWE1ZUEk4UldxTW1V?=
 =?utf-8?B?V3F6NEgvdnpieVJIY04zbHdrSVRkSElvSE56OFhRRFI3SWVuN0t2M3FDZ0pB?=
 =?utf-8?B?YXhMMmRQM1NIdkN1c3lZS0k3c1U0SWg4bUduZ1lDbThmUE9EcDBudE9wclRv?=
 =?utf-8?B?blVKT2ZRVlM5cFpSaXJYb0F6bEdhNTRIWEt5VlZ5V3JxZnRrbDA2WXlXTE9z?=
 =?utf-8?B?dnlqRDI3K1BtSkVibVBDQThwekhMUTZzV0xMMlRrMUEybXFVV2NkYkJmUUVu?=
 =?utf-8?B?UTVLWjdHRFNYellaWVZhck0wRXpnaXFBWnlydFp3K05TYkhEUW5yZHNBcmdT?=
 =?utf-8?B?WWwwbGp4U3ZZV0lzaVhiL2dNSFdHQkJzcE5hbkI4WlFSRlhkYXVQNndkMjQz?=
 =?utf-8?Q?VojIsEudbT6BvrPmwJzp9ibwl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6e92e66-f937-4ee0-fa77-08db0a966a14
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 12:08:54.6845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYafOVeTKTm3/Jlj2WbhjID3w6jS2EKZdZZ6IAJE1AJakfLP1+PwxSlJATiNACw5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7260
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.02.23 um 12:27 schrieb Melissa Wen:
> On 02/08, Maíra Canal wrote:
>> As v3d_job_add_deps() performs the same steps as
>> drm_sched_job_add_syncobj_dependency(), replace the open-coded
>> implementation in v3d in order to simply, using the DRM function.
>>
>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>> ---
>>   drivers/gpu/drm/v3d/v3d_gem.c | 9 +--------
>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
>> index 5da1806f3969..f149526ec971 100644
>> --- a/drivers/gpu/drm/v3d/v3d_gem.c
>> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
>> @@ -400,14 +400,7 @@ static int
>>   v3d_job_add_deps(struct drm_file *file_priv, struct v3d_job *job,
>>   		 u32 in_sync, u32 point)
>>   {
>> -	struct dma_fence *in_fence = NULL;
>> -	int ret;
>> -
>> -	ret = drm_syncobj_find_fence(file_priv, in_sync, point, 0, &in_fence);
>> -	if (ret == -EINVAL)
>> -		return ret;
>> -
>> -	return drm_sched_job_add_dependency(&job->base, in_fence);
>> +	return drm_sched_job_add_syncobj_dependency(&job->base, file_priv, in_sync, point);
> Hi Maíra,
>
> First, thanks for making this function a common-code.
>
> There are two issues to address before moving v3d to the new
> drm_sche_job_add_syncobj_dependency():
>
> 1. We don't need the v3d_job_add_deps one line function just wrapping
> the new drm_sched_job_add_syncobj_dependency() with the same parameters.
> We can just replace all occurrences of v3d function with drm_sched
> function. Except if we use v3d_job_add_deps to address the second issue:
>
> 2. Currently, v3d_job_add_deps returns 0 (success) if
> drm_syncobj_find_fence() doesn't find the syncobj from handle (-ENOENT),
> but drm_sched_job_add_syncobj_dependency() returns a negative value on
> this case. If it happens, job submissions will fail (and may cause a
> regression). One way to solve it is checking the return value of
> drm_sched_job_add_syncobj_dependency in v3d_job_add_deps.  The second
> way is to replace v3d_job_add_deps by
> drm_sched_job_add_syncobj_dependency and check expected return values
> there.

Oh, wait a second. This behavior is most likely a bug in V3D.

When a syncobj can't find a timeline point aborting the IOCTL with 
-ENOENT is mandatory or otherwise you run into trouble with wait before 
signal handling for Vulkan.

This should be common behavior for all drivers which at some point want 
to support Vulkan.

Regards,
Christian.

>
> Melissa
>
>>   }
>>   
>>   static int
>> -- 
>> 2.39.1
>>


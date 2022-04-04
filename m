Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B23C4F15EA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 15:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0431F10EA9E;
	Mon,  4 Apr 2022 13:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B459710EA9E
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 13:31:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbphBmr3pWrmSlVUk2B2O7BvZOOyS1g4sZMPmgtVF0BlF7KGeiuExzlzJR5cImXRHj+ONJX6s1WqtQlttIpP971T3I52EDKnPKwJP1z0m6eLSoWdxQTYWAI2GRw3QVEItTyjdeeUvwKpp31ESQCjHynrZoUe/8FnPFkuBVVCL8U6/ObbAtrmNiYoEOoDkRRxMUhpx8hppWDkBQeI93dVPEbQ9McZi4xpckJlxXJtIBLlQJ7XzeaOjFda44i/BLXKY7WDZkQ7c0hrB57l8yYOrhmqULdz92E18Zx0OHaSd5+lRF60HEiI4UV6VSh3pfVhxYzSm5SchIt3NA1JhLUs2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwgN7zsZHbwpmmt6AS8PPy93KBkNvCYo46p/sMaMY7k=;
 b=CHiNcXcpCkw4VS+oQWPFlU9fSwpYXc82W0vaUrT03A9zDzHTFB7fRzMcs2ZUqaKPEQTscDj17cnnbRAx0mK669xc/Je42WTNnE8/kI1BC1rd4wOl+Q2w68ZJuXANd4J39J7OruEiDRhJVoXXj6xqOPo6hgAxafKGeV5y3RhzQjV5pGo9Z0CkRFWiTO59zqkd9Ycx+04LLcuVAqnDOKSt7Dum+PW0XF5h9bP6Zvcm5KX/aumuG5rDcbbMt+yZYwT2ZCk4aUMDd5JMNZkbLJlF4JoX9NL4n6qjBAuLNU9vk3ANd6ryymiAqJY2KvqsNHfpZoSrdUkxptPwXIMD4cGG3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwgN7zsZHbwpmmt6AS8PPy93KBkNvCYo46p/sMaMY7k=;
 b=VPdxDWwGpJd1OJb6Y7iXBggDRRTyI2zA1WjROb+HDs1w1saqC/OPgonLuJpC+/GQiCRWrdc5YO5+vcSf4XHI09O2KTty6CNZO2dpfAfH4vpt3OzU65FyfKL6FNvCUEs+2BAC/dsCcmsyeH4ek25QT88lX6qaaSX0z6xVMDSBj2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Mon, 4 Apr
 2022 13:31:06 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5123.031; Mon, 4 Apr 2022
 13:31:06 +0000
Message-ID: <724cb481-74cd-6611-df9c-12581e089acb@amd.com>
Date: Mon, 4 Apr 2022 15:30:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/4] drm/gem: Delete gem array fencing helpers
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220331204651.2699107-1-daniel.vetter@ffwll.ch>
 <20220331204651.2699107-3-daniel.vetter@ffwll.ch>
 <YkrvhG/ODfshvX+y@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YkrvhG/ODfshvX+y@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0284.eurprd06.prod.outlook.com
 (2603:10a6:20b:45a::27) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 431c36ed-b8f9-463d-3061-08da163f5f08
X-MS-TrafficTypeDiagnostic: BY5PR12MB4179:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB41797151294D085EE762F63E83E59@BY5PR12MB4179.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AusgN+DX/bXctcZHWwa9kyeoeq7n+qGb3qPon2xzC0FMTk81uTE38JNYmO2gZczDz6eQEDW4l5vWzsBQpXBwN+Px0CgfV+pk/Oy99bY4e/n1ZMSZ4gjt+RwyMaUCZRb/lvgMIXO+00ff1lv4Y1plZPvYJdm3M9R6J9PAhk/eNPeI7XKDl/EO8qULA5igqFWmMWZuxWXwcseOqlCrsbXouD4PmGP0xGuQ15MId02EJUzlxaHvCz0XC699b4WOdH/cgMA3KcG60uJRW9DXrabvPSP0LYVrDsWvTsVz4c1khD3dxA8XoEwVGoF66rFaKm8C+srwOioQrfk2E6XvGFmemkzLcLMdX0Hn698A6jZNQObvYthCNouxHESd1cVi1OiHfyu2BRHX2dmtqHxHeB6sSNqBZndf+Jv6cvz3p7TUNTUxDF5MULk6S6tqoTYWdAUYn2GiQ4xiP9PtpX/Qn04t06G/WX4T+P8JLeRwar6t+bc7+wFh+y//fs+juiiXWcsSSrCIDZKbS2NNq4gSI0CGZOKiFQr3Smr5GQvptKZA4V+GeH1Iat7tqK/qvPILUwfEJ7GiAQJc/PbHl36w42MWEqZmNRngK2aoToX+zrjNJ/TT66QUop1xRSroBAOZEgB5k1g2r81xqLFcawLHi6KXWbce/fOWgAg8ysvKjojCBK1UPB8ajYn+BugEgFJLmqtpdIpPYYcaqMO0UYBp5qqnnxdsvG/9IqEN1ti32IRST8QVtkCEvq81OLnEYqs+Tvbk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(36756003)(38100700002)(4326008)(66556008)(66946007)(66476007)(2616005)(26005)(66574015)(186003)(6512007)(31686004)(83380400001)(86362001)(110136005)(8936002)(6506007)(6666004)(508600001)(5660300002)(7416002)(2906002)(31696002)(54906003)(6486002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elJMRWlPVVpkRVcxV2c3OTM3WTJiWlBnM0pNMndJT0Y3KzdLOHRuaWVrRUxR?=
 =?utf-8?B?ckdqdTJFLzFJZ2RuOS93NjdwTm03TW1OdkVVV3AyWmphYW1RZXRheWtGM1lu?=
 =?utf-8?B?eFdKTXNSR2k0TFdPdjRTSC9UcmlwTHdpRGRXR2JqQVkrbVZ1cGpxcHplTnMz?=
 =?utf-8?B?c1VENEQwTjJPT1hDeGRxWjU0a3FxWVhDSlpGcnhCcHFyZG13VXRhMU11aUNa?=
 =?utf-8?B?WGJLa205RTN5K2tvT0ppM2lGSW1Dc0NMc2FiWDR1RU4zVzUwbkVkeTN3bHVw?=
 =?utf-8?B?bGt0YjZiUDlCMStnRTlYTldoZThWdlJ4QkQ1SDRQdytiMXd4RzlCcUlyVUxw?=
 =?utf-8?B?Y0tsaTV1VjVKTVVsL1BCU3RxUDdFd2RXcTVvRzFsbGtWL3pBNmNEWmhNekZF?=
 =?utf-8?B?eDRjRkJOb0c3QktSQVJob01lZEltdVJvb2liL3lQUm5SK0MzZnArcFdEVkxr?=
 =?utf-8?B?a3Y2WGpKR1lwYlhlRlNGd1psODFhN0FzWTRMYy9WaFE3TUVFc1RXMWVIZGlX?=
 =?utf-8?B?THAxYm1YVVY3OTRrNUh2ZVJYLy9DQ1BWYXlJeWtTOTQvTXBLN1E2Uzl4eFFR?=
 =?utf-8?B?OFUybmRKVkRXdm0xa0NwMnQzb2pjbis1VzVEdTY0ZlJmRzZ2V1lhSkpTOHU3?=
 =?utf-8?B?ekFWc2ZoMVFpRlNmV0dKMTNoREtPMzV6TEJEcHdxQUhQVEc3MW5rK3V2aGZo?=
 =?utf-8?B?NzhKNHZiOTBvclhHTmVJUjByZWFTbTU1Y201QkgxUUVzakIvZzVxSVZ2U2tG?=
 =?utf-8?B?cGtvNFFHK01HRTBxM3Fqa3RWcWtFR08wanV3VXpSV2pNNG5QQU9yM0pnak81?=
 =?utf-8?B?eVNIM09KT3FYWU53L2lUWTRkSmIvazVyNk1yWUdTMUhNNXM4bWlUZW5aZWdp?=
 =?utf-8?B?cVdDYW9FOThlS0lwMFExTUNHc09YRUs4WG9pd1kzNHhYcDRzQ3VyVGNJU2o4?=
 =?utf-8?B?ZkJzUVpBTDR4RE1zMDFuanViQTlpNEJLa3JwRi9kM3lXc0duNjNrT3dGVW03?=
 =?utf-8?B?UHpIY3NyVFMrOFFITlFaWEMvRTRDN29RR3JCZmZYWjVuY1U4Nk5lc05aSjBp?=
 =?utf-8?B?ZTAvUkhvVmZVT1lqYTRKZ3ZlZEFrbzYyTXRtaCtoMTNIdUwxazFsTkREVzBh?=
 =?utf-8?B?c2poeTRtWWdXck1DdDk5SjVyd3RQWDNKSTlxck9lYjZEZVhBZ3NuZC9NTGVv?=
 =?utf-8?B?OUppSW9aNmVhS25vTjdWNHNmLzhwZjl5Sk1nSTJhZTYyUkdTVjV6MWRkbVRK?=
 =?utf-8?B?TTRsNFExZWphUEtBckwrZkJjSDY2RTFEUHNVMktSeW9MSFZ4MjdpSTUvTlFN?=
 =?utf-8?B?d0VzSENaUTIvMzVuZWluUWhJYWdvbFJqN01pK2ZsR2xhU0JsQ25QZWE0MWVW?=
 =?utf-8?B?ejlXait6Yzdwa2dzOU52REFXTjFhcEsxaURmT3dFbm9sS1ZadWtwVDlKZk1o?=
 =?utf-8?B?V0xIN0VLdXBKTWVTaU9ucC81Z0tzc0JvNDN6TTVBRU4zSkpNYmxTSVlmaWZP?=
 =?utf-8?B?bDJQdWZJQVB5aEFNVTh0bEp3SXNUM055b1lLYjdoTTU4M0g4MXN3b1MxdlNE?=
 =?utf-8?B?WTF3UkZoa0tWUEVaTTJkSVo0WTZOalF3ejdjOUVoSnNQMDlCZmtoeEdRNGZ4?=
 =?utf-8?B?azVTSGppQlMxendMZzdsVjZZWnZ4eE8rUUZUQWJSQkYwSDg1Q1JUbStiSERT?=
 =?utf-8?B?K0QyYTVtVWJKR09UVWhqZWhHKzBjeDZmTXlvRkVpaDQwUUkxU0hRbjQ2WjRv?=
 =?utf-8?B?ZVh5M0ZPdStSS3c5NHNQekZqWlRsSnhXTE9YdE5veW4wdXJCMCtPNDMvTVdK?=
 =?utf-8?B?SXBFVFZ0K0ZXcVFoak1wNE8wTzlxY1YrdFY1OXByL0hXNWQwWUU4M3lwWnlQ?=
 =?utf-8?B?cWJlam4yU0Q0SHNXTEI2TDkrb25NbjBoM3pWaTVaSWZ2N3FRMDVCYjRHN3lw?=
 =?utf-8?B?aXZWQk00dGhMTUtWQ0lDQ0FvZlB6WEVWQWVjWGk0NE1RdWFqUGxCV0Rzc05J?=
 =?utf-8?B?UzA2bk91c24rZzFDc2JjVHRybEt2R3Bab1FsdmxzWUw2VWNNamhpZHl4b1NR?=
 =?utf-8?B?MlVFTTJlbThScTF0NlJYSVovaFNFb0dXRWZ4Y0hxd0ZvbkxVNHZkb3FYeWpu?=
 =?utf-8?B?M3dWbU5uZTFFaXJOYkU5ODVxUGxtSnZKYzlhanRJdEkxRzdZRFFjVWcwYXhs?=
 =?utf-8?B?MndiK2lQRUlMUkt2OU4zbEp3ZC9lK3F4MnJiaFFnSUw5Um00YzN1V3NlUEZh?=
 =?utf-8?B?R1hnOW1TR0UzUEVkWXpxQXQydDBGZm02bVJ5Nk5BUkIxbUQxejROeFNhWXM2?=
 =?utf-8?B?YnJLeU5UNFFUYnFXdGxEREwrbnZ4NXlLTkttREdsS002Z2syZ3hFdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 431c36ed-b8f9-463d-3061-08da163f5f08
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2022 13:31:06.1812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+0dIbVOvlTDUzv1RT1HpgZIPhqHUI0Mo6rboyZMR0MMqQfbAuA+Nk0Up4bv5D/b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linaro-mm-sig@lists.linaro.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.04.22 um 15:15 schrieb Daniel Vetter:
> On Thu, Mar 31, 2022 at 10:46:49PM +0200, Daniel Vetter wrote:
>> Integrated into the scheduler now and all users converted over.
>>
>> v2: Rebased over changes from König.
>>
>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Maxime Ripard <mripard@kernel.org>
>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>> Cc: "Christian König" <christian.koenig@amd.com>
>> Cc: linux-media@vger.kernel.org
>> Cc: linaro-mm-sig@lists.linaro.org
> Anyone up for an ack for this one here?

Acked-by: Christian König <christian.koenig@amd.com>

Please land that ASAP so that I can rebase on top.

Thanks,
Christian.

>
> Thanks, Daniel
>
>> ---
>>   drivers/gpu/drm/drm_gem.c | 80 ---------------------------------------
>>   include/drm/drm_gem.h     |  5 ---
>>   2 files changed, 85 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index 56fb87885146..133dfae06fab 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1273,83 +1273,3 @@ drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
>>   	ww_acquire_fini(acquire_ctx);
>>   }
>>   EXPORT_SYMBOL(drm_gem_unlock_reservations);
>> -
>> -/**
>> - * drm_gem_fence_array_add - Adds the fence to an array of fences to be
>> - * waited on, deduplicating fences from the same context.
>> - *
>> - * @fence_array: array of dma_fence * for the job to block on.
>> - * @fence: the dma_fence to add to the list of dependencies.
>> - *
>> - * This functions consumes the reference for @fence both on success and error
>> - * cases.
>> - *
>> - * Returns:
>> - * 0 on success, or an error on failing to expand the array.
>> - */
>> -int drm_gem_fence_array_add(struct xarray *fence_array,
>> -			    struct dma_fence *fence)
>> -{
>> -	struct dma_fence *entry;
>> -	unsigned long index;
>> -	u32 id = 0;
>> -	int ret;
>> -
>> -	if (!fence)
>> -		return 0;
>> -
>> -	/* Deduplicate if we already depend on a fence from the same context.
>> -	 * This lets the size of the array of deps scale with the number of
>> -	 * engines involved, rather than the number of BOs.
>> -	 */
>> -	xa_for_each(fence_array, index, entry) {
>> -		if (entry->context != fence->context)
>> -			continue;
>> -
>> -		if (dma_fence_is_later(fence, entry)) {
>> -			dma_fence_put(entry);
>> -			xa_store(fence_array, index, fence, GFP_KERNEL);
>> -		} else {
>> -			dma_fence_put(fence);
>> -		}
>> -		return 0;
>> -	}
>> -
>> -	ret = xa_alloc(fence_array, &id, fence, xa_limit_32b, GFP_KERNEL);
>> -	if (ret != 0)
>> -		dma_fence_put(fence);
>> -
>> -	return ret;
>> -}
>> -EXPORT_SYMBOL(drm_gem_fence_array_add);
>> -
>> -/**
>> - * drm_gem_fence_array_add_implicit - Adds the implicit dependencies tracked
>> - * in the GEM object's reservation object to an array of dma_fences for use in
>> - * scheduling a rendering job.
>> - *
>> - * This should be called after drm_gem_lock_reservations() on your array of
>> - * GEM objects used in the job but before updating the reservations with your
>> - * own fences.
>> - *
>> - * @fence_array: array of dma_fence * for the job to block on.
>> - * @obj: the gem object to add new dependencies from.
>> - * @write: whether the job might write the object (so we need to depend on
>> - * shared fences in the reservation object).
>> - */
>> -int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
>> -				     struct drm_gem_object *obj,
>> -				     bool write)
>> -{
>> -	struct dma_resv_iter cursor;
>> -	struct dma_fence *fence;
>> -	int ret = 0;
>> -
>> -	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
>> -		ret = drm_gem_fence_array_add(fence_array, fence);
>> -		if (ret)
>> -			break;
>> -	}
>> -	return ret;
>> -}
>> -EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>> index e2941cee14b6..9d7c61a122dc 100644
>> --- a/include/drm/drm_gem.h
>> +++ b/include/drm/drm_gem.h
>> @@ -407,11 +407,6 @@ int drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
>>   			      struct ww_acquire_ctx *acquire_ctx);
>>   void drm_gem_unlock_reservations(struct drm_gem_object **objs, int count,
>>   				 struct ww_acquire_ctx *acquire_ctx);
>> -int drm_gem_fence_array_add(struct xarray *fence_array,
>> -			    struct dma_fence *fence);
>> -int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
>> -				     struct drm_gem_object *obj,
>> -				     bool write);
>>   int drm_gem_dumb_map_offset(struct drm_file *file, struct drm_device *dev,
>>   			    u32 handle, u64 *offset);
>>   
>> -- 
>> 2.34.1
>>


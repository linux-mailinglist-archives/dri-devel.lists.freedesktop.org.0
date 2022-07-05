Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DEE5669C2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC71C11ABC4;
	Tue,  5 Jul 2022 11:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C268F2B9EE
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 11:34:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyNl3NtuGWwEeqjb2CHrABw6FuhdW9Y2GHmgRyq5zGmTFUsOaUqAS0P6tsMx3rjl3XTmB8SVS/eWJ97V+ZRDOl7/cOKxcw8jcm5M9celaRjKybk9Rc6cqBwnAwseIe/nJk7htuqTEIrKkKnlZjd+X5EeUYXmpCgMW9++lq8IwWwM2maP+hraqCGkCWDcViwHa9UmHFHovwszL+PS8EyxBlqxJh4ZjIAeTTd1F2RXVfkTOpU+yZScsN3QYIUr8IZAbU02mBj1FsNFDIvVwkGh2Rq1Egc5ZEipqcEaugqRQsH0JViOK3UBPZP9WqYTEohZoTu7w39b79J18iAWFEqENA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TXhxapzxVOZ4HEw3o7/f3/JBLUEle02467ayjlVvFs=;
 b=CTmAcJBoWIUwyuyP9W8szIDH+aH/SxdRa4AOb1ZOY7XxtjVOA1oZVouRuDXwjUs+dWH46oS0466T3mRlqrLPWmyRe+3Wg8pSCvRpVos/Mrv+0ZDMUCUlJoCE9Ge9/OIqPYSVL1Amt3HbpsKQAsrqRTueZRT71k0xxir1qbnSX4OcP1mv+ovDQKWXggLlifDw5c5NKM65fy9HcD14pRiSMxKVnbRl6ESMoynWWqewOnjdqDgDoBK1pFgo1kw1DzaUhoPSLsuUIpYNauNtFKV4xHnRxBP7E06/kiRFaigJ1u/5tzkftntLc2fF5KXUlAdCS4Q+CNAfXOehUhfZk2ZWxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TXhxapzxVOZ4HEw3o7/f3/JBLUEle02467ayjlVvFs=;
 b=y+g0RbdmutH7JcYbOA2J5ReFR+RZ6EctZK0Naltuk0cYaT5iQXYPCZ8PVyhyYLwtrLCa98KYOgRw8rJNdSzvf8gA5lLNsDWrZxU8usx07oqG46D4mFj2AUDF0w5TE52HpL3a7cPRvaf1q2efnB8OVgHqrOTvBxHM6tMDX0j6I7Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN8PR12MB3314.namprd12.prod.outlook.com (2603:10b6:408:45::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 11:33:59 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 11:33:59 +0000
Message-ID: <a42237c9-6304-4b06-cede-2175c7e7b87d@amd.com>
Date: Tue, 5 Jul 2022 13:33:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 1/2] drm/gem: Properly annotate WW context on
 drm_gem_lock_reservations() error
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <20220701090240.1896131-2-dmitry.osipenko@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220701090240.1896131-2-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0131.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cfd42e6-0da2-47da-555f-08da5e7a4078
X-MS-TrafficTypeDiagnostic: BN8PR12MB3314:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uh10KPZUPrS3d9rZjjif4aIxItaKYdv3du3AK2JdlsYi1TD93YtygxKP7BVSJeQe8AREmZB0VKzDjyyf9YrX/weFgrlt04kb4YiVS8mLbFyecqmPkgGNxK8OrM8O1Nw46Zpxz87IUeQFcf7uu11d13nt7mpwlIoXSD+5oplgoVT9ySRB5UJ3eiYGwEP15Ft14pkh2dFIXc9hlBtY3jNRuGjsUcfku2XrNwjJ5WJWBwIGLUFN9HW0jSGqX4DM8PWL9g6CvLpaDdBz+CY5YexFuMQVq8HGX8j9xuVdYT40JvI3AHj50j6octEKZNnAtgrGZxuTOXsLg8eLwgig0DNkWqg+XVmlJtpvrQHBG/ySTPSHnYq8EW77fq2gX9UCoeFnqaK68YxC/mDQSBlrWZQKwbiI+9H8SrYyWS5zcmN+djfYmGgo4sqHYbC0zWui9+0hWP1Tjl0fI3l2sx0GMyMJGhjk5NDH3Qze7cniGG2q53g9FHdXmZTJDK98UlIvinfSgD3V4qIYUPYs49IrHgpFeIAfEQwV+LLnDs2ioUj7nFGiHfXtFMG5MHkUI4Hqr7+U63LAeK+BwFmAxf8c3dBxrwjgG+BTl2/nlwIW3i77b1GuR3N13Q2C2RrmODdkfKBoKa6BVFZ9RU3S4wPTm58mVsJvhNebSxBXxGkDOKVOWWaz7OCLb9bqa9eXv4x0PUcmcvCQvhM05rvY95Q08C9CEYMYo5cW0mdiAdqfgGNJoqqCrpMSEZCpd/jfkOGted5VTtCQqReBA3NcRHIP3urZO6CjZ1HT8EpIjp4Itu+Uaq/cqn+Oi15BsTBKu6uRyXFht2/VMa7ceU+XEkXu6EK67wazXPF2nl+NQbR438/Txs4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(136003)(396003)(376002)(346002)(39860400002)(186003)(83380400001)(2616005)(66574015)(66476007)(8936002)(66946007)(36756003)(31686004)(5660300002)(4326008)(26005)(7416002)(6512007)(6666004)(86362001)(478600001)(8676002)(110136005)(41300700001)(316002)(6506007)(66556008)(38100700002)(6486002)(921005)(31696002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTlzWDdIWjRNbGhzeFZEYk4xWFZaVkU3MldESStSbHo5dkM5ODZFQkRMKzZo?=
 =?utf-8?B?Z2hHd2RQcE56ZUROdlZhK1d5ZzUwam5wMHZzY0tMOHVWbGEyRVMyTzlVWXhu?=
 =?utf-8?B?dEZrbjd2L1llb2JUWUl3Y2tPQUxBVDRKUUtTV3U3ZGgvdzl2NmRzdmYrYThZ?=
 =?utf-8?B?RHd5RE9xTHZsTFlvZGVwdjRrT2ZtQktxOTkzUWIvODdkK2d2ZXozcXdoT21n?=
 =?utf-8?B?RE1lUVRyQkxEV3NleXBkdzNSUDhacWlMVzZueTIzby90T09Pbm9aZ0Z5NU9m?=
 =?utf-8?B?SERMNE1RT29DbzBGd05YUldtM2pxVWlTZkpOTy9OT1pzYlZYZ3FZQlpZSytI?=
 =?utf-8?B?KytFaEE2ZDljSlp3a3VnVmc3MTNvdlE2TzROdVM5UmpMbWxSd0ttbFIyVjlD?=
 =?utf-8?B?N0Q5RVdaNFU0a3hBSlYydlFBUjBJQkIxL0pHMVBxV0VaT01iSURPRmhLUWQ5?=
 =?utf-8?B?Y29XZHp0c3dYN3VzUG5FUFRVVGh0YnlpblBKRDFpZStMWXVHRmFLMXBFMnNi?=
 =?utf-8?B?c0V0Ym9zRzJGbnAwS3FYRW1RSHpzMktYaW4yOTFKaXRHMVo4YWxNVmExY0Zz?=
 =?utf-8?B?L25BYjlCWEdjUXhQVEZOc2szTnYxUVB3My9YVzkyc1BqNm1EeVJBQjFOUDJF?=
 =?utf-8?B?YjczUnl0REcwY2pxWFBoNng4V0Z0SW45R21vMlI4Ri9KT1ZOUWlTWCtuYzBr?=
 =?utf-8?B?WDJXTkExZElKMGEyU3pnMTQxUkVveStjUjV2ZnZKak9LamtSOTZmTlBWWFVl?=
 =?utf-8?B?ZEFyK0VRelMzRHVNRStQbWljTS9mMG4wL1owNjcwRkc1d0hmOGRDbVN2aTZY?=
 =?utf-8?B?NU0vaStrRFhrd3crVXlwYkNtNGYvSzNvZ3VnYkZkbWRwbHhYWkNxSDBjdGVC?=
 =?utf-8?B?M3R3bnRqcVlPaUFQcXY4SWdRUUFpR1M5azRwS1VPYmZvYWltRGFRMzdOOGta?=
 =?utf-8?B?WWtKMDdIU25oSHpMM1pScWNUbFdGOXhjc0ltK0IvYTczRVRwZFZTVlFlWUQy?=
 =?utf-8?B?QlR3cVovQUJETGJxSEpnb01iVkcvR2NoRUh6YmM2aEoydnVYKzdmZDUwZVRV?=
 =?utf-8?B?RzBGZ1VHRFlpVm9CVDJydXJCWFlsWEc0cTZhV3IyWEJhSk1lUmdEVll2dm9E?=
 =?utf-8?B?NWQ3dU91bVkwbGljdnpnZGNUSW1aZWwrSDRsZW9YMkdYb2lZSjM3Ykl6cC9v?=
 =?utf-8?B?UkswOFVjUjZpMkhMTjhzdS9nclc5L0tob1lWZnp5VG1iTUtiRTFtYmlJMVBN?=
 =?utf-8?B?aWVmVWtyREw2Ry85VVRmN2VkTk82YjNuUDU5WW43UVA0cEkzbG5ITzZTK1My?=
 =?utf-8?B?Z2ZGbW5XZEhBeUIwRnJXOE5Oc3NCMTh3TTBzTGJOMi85V3Q3Q2pzd1Bmdzl1?=
 =?utf-8?B?OUxkS0Z1QllnZFBpZUo1MlpRVEJRK2FsWmVqSS9aampKM0FmdzVRdVZIcXh0?=
 =?utf-8?B?aU5YVkRsbHVuaWFnNWNoUEdCRzQ0ZU4yMllnSE11YmdodVdlMEgwNVkwbzdZ?=
 =?utf-8?B?QTNFWXdmbTlQRWxLQ1NMZm9xWEZRcW00dmcySXlwcmN5Rjh4ays3Q2gwQUFj?=
 =?utf-8?B?QXZPVkpiczI4dzduendCQnVjaENRdlRSdzMyaUpXRjZUVEI3Y281cy92aUZJ?=
 =?utf-8?B?VFgxRStIVzVsTnphMlo3YmFMdUx6dDhYZUk0ZUVlUlRUMmg1Q25uejVMNjZI?=
 =?utf-8?B?NXIveFhNRWttNFFkU1RtcE0rQkErWVBRYXpTd3ZJTWl1cW5tQ0hqYXZrZ2Jy?=
 =?utf-8?B?YUx0TmVWU0tJYmNsUysxZHZkMyswazZENDZoMEV1Y05RV2pPSENiNGpGZGVn?=
 =?utf-8?B?amQ1Q0JlMHpWRVdhb1hiSTUrbjU3WXVDTCtWMFd6bGNWOEVRcmVkN1VSYVoz?=
 =?utf-8?B?Vk1WOWhCclRYS242OGQ5MFhjZnphV21vT3hFeFlVdE9VQ3FSTnFFQnI3NWha?=
 =?utf-8?B?ZERBMGVqRm91NHdrVGo2WjlVQTlIc1h0WTN3eFdZNmVqMVJyS2dsbzlKNEVG?=
 =?utf-8?B?QkFaQVJuWk9tczlWUm9oc1hRd2Mrb01HT0crb1dKUGxUMkwxeU5uV0RZeVZw?=
 =?utf-8?B?dUl4R21oUTFIeDVzeDZLVEhjTVFPWjBzcFBIYmc5NUFiZFV0d2w5aTNsamE4?=
 =?utf-8?Q?WDRWGM/Xw5Jzc+RGH2xUTm3/H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfd42e6-0da2-47da-555f-08da5e7a4078
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 11:33:58.9964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4PQRWCPqIp8ku3dByaTcWRszQok7AR4OujmYczTFAoqdQdm9Y/WZIuDiBrlIdQa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3314
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.07.22 um 11:02 schrieb Dmitry Osipenko:
> Use ww_acquire_fini() in the error code paths. Otherwise lockdep
> thinks that lock is held when lock's memory is freed after the
> drm_gem_lock_reservations() error. The ww_acquire_context needs to be
> annotated as "released", which fixes the noisy "WARNING: held lock freed!"
> splat of VirtIO-GPU driver with CONFIG_DEBUG_MUTEXES=y and enabled lockdep.
>
> Cc: stable@vger.kernel.org
> Fixes: 7edc3e3b975b5 ("drm: Add helpers for locking an array of BO reservations.")
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/drm_gem.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index eb0c2d041f13..86d670c71286 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1226,7 +1226,7 @@ drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
>   		ret = dma_resv_lock_slow_interruptible(obj->resv,
>   								 acquire_ctx);
>   		if (ret) {
> -			ww_acquire_done(acquire_ctx);
> +			ww_acquire_fini(acquire_ctx);
>   			return ret;
>   		}
>   	}
> @@ -1251,7 +1251,7 @@ drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
>   				goto retry;
>   			}
>   
> -			ww_acquire_done(acquire_ctx);
> +			ww_acquire_fini(acquire_ctx);
>   			return ret;
>   		}
>   	}


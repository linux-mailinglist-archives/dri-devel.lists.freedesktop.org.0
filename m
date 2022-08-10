Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E0F58E76F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 08:53:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC73ED53B;
	Wed, 10 Aug 2022 06:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7176AED4F0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 06:52:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTu2qoMmwriVbMAsfgGNz3ggkV3BsENgQkbSK5cGKkgupP3VHWkOMr3IR3e2B5NT9BEnWmWYB4WPQJBMU02i0iygCRuB2Db2KXurdERHvJuQfAhriARKTaYL5cvZnKEgrcXNaAV+CJm8GWm8ulELPXsPep3lThwKvG01YloTT8Njr7fKpxCJrSZc9hD5BImoEzDbbhukn3iGbl12NYZJRjAGGK3odCGiJ8vcTEKAjxPLpyjEeHG/nsljh/eRCVXpDxiwYg//UcYNIxuVzmKyp2eHmXmVCiGZsHzN9s/eVjuK43YYfBab6FX/hS2Q+RHRGw6VL74R/ZX+E/PCzJIUGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pW8QHHhJdXKYyugvMMC0c9zhofnvetw52eixGeuJQGo=;
 b=fb8rozsaWMLmRVwhfCj5WcQBdSoIAgJSaEbSzfKB4+gJjWS4vKjgLiFRY1ho1qZz4u1sDY/MHQqOdL1+HR0/f+uSTY9QyakXI/IJpKUOAPzN6qYY7NzhZGnVQN4Jajmd5bFwtMwTYo4wqT+fCY6pYznMYrQThFCTbFfPp2XYWsHzZuzmLSlZ0OI/HZvIDlEtBcr+7cTirlrmXJ48zHRlWaM/6F1PtTYDfl2oPTwt0j6vJo/ZU/Rim/6CshCprhvNzl33hOKwMgHXRjGhQxjO95xkazBBotgVua9Y20I++V7/joD6U2Q3r7korP32DPu2neZjaICzQmb9yl2XHoEwlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pW8QHHhJdXKYyugvMMC0c9zhofnvetw52eixGeuJQGo=;
 b=paw+dIGVBNfpT7fsfnxO1nQxI3lOM3VKqbDgsZfqepKamey6S5Hy3gyTZCGtay9YBSS4PacuOSWK+7unscxCl7RVJi5btxNFSbqabSX0RDVgYPgsSBhhkelHclrgxs9QCAi7bITtDPeap89txnkOluHZ4gHizijJVWMBL5NsZq0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB3949.namprd12.prod.outlook.com (2603:10b6:208:167::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 10 Aug
 2022 06:52:25 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 06:52:24 +0000
Message-ID: <e760f555-7f2d-dea9-70b2-c0881adc3afc@amd.com>
Date: Wed, 10 Aug 2022 08:52:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v8 1/2] drm/gem: Properly annotate WW context on
 drm_gem_lock_reservations() error
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, linux-tegra@vger.kernel.org,
 kernel@collabora.com, virtualization@lists.linux-foundation.org
References: <20220701090240.1896131-1-dmitry.osipenko@collabora.com>
 <20220701090240.1896131-2-dmitry.osipenko@collabora.com>
 <a42237c9-6304-4b06-cede-2175c7e7b87d@amd.com>
 <YvKO5r5Sr56e9vBf@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YvKO5r5Sr56e9vBf@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6119e70-e45d-4947-d7b7-08da7a9ce1bb
X-MS-TrafficTypeDiagnostic: MN2PR12MB3949:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Czcmn5v65qZzh5q/yxbpDVoEtfWFxr+u+Wz3KFd4Ik3agM1iPhYSobWnJGj6nZ6CXG1uVlzn2fongMRw4aL2fjYwc6EoSZuRz1GmAKms7BA390z2kGkbWHSZa8cfeWK+FgBE8RQv9TBsf/vNygp0gf/funrBPdnOBX0jMOulwCsnXKrwRMdy6rOtwsK0AF2zMhVx+IBvH4fPEm/zPU4ph7ODKGcHk37nkTlmlwf4iXRjbS65AbtqjIl0AUvwP1D4yYnmf7bXeqvwRwXMvRGwwHiDzx8nqVzIkDKKsV8Bdn68b20mK4LliFFOoo/ezhQ0ACv3sy0oRzQ61UDGh23UR1Ha8A28OHE9oqFlHThUZ0U+6qxN2SeJcFk1517DbPk90jQRsKG2udTgO+4bkZT6qlb5+oWJgVt89njqwwYSqFVuGf+/XLNeyu4qX8nOyx562V9RPtBpkSYBg51KtQUH0nkcxJR1L5cAmIWcxjIUtpJ2AG5ECkIGh5gLkz97rTkg9kU0FzOoKIr6S6XcQ+J7UWmCvMI052RRE3nbzuIuIhMRspFUt/jYoKYkCFdoqe8Ko5kcRBuBFoqE3mEKSl4Yx2fyzdG1wMRSwof3eNREf+DUI9ruo1tXTnu1yMWEbtAj7a9z/uYiDXvuX2ZYYlLo0CcO5MXpt9Lq3D2MKJC+XR2r+QygCddHIwihzK7eqmjP+5NLK/EcftEfBiR/FDRysmv6xmaus1vOf488u0sbuGYx1W+zXVq/eIQKBqdydRSZRaSTCyijfj9u/90Au6EuX8gUDx7279EZ9ro+Nw0S0DGPHyTSjYRjI4l/RvGHq9QVStC5Snv3Ad7fZUQBYtG3oCjy6fDIHAKS68kMAg5xEPY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(6486002)(478600001)(2906002)(6666004)(41300700001)(31686004)(86362001)(36756003)(110136005)(316002)(186003)(2616005)(921005)(38100700002)(31696002)(6506007)(6512007)(83380400001)(66574015)(66946007)(8936002)(66476007)(66556008)(8676002)(7416002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3NMNmFsbkZFdlQyTHhZNXpncGlCZFRtRFUyWlJaaW8reUgxZ1hYZERBS1Y0?=
 =?utf-8?B?QkF2d09kVTZZbk9HdVlleVhtNzZ4VEc3cmlZRmpPSWpibUR4bzZlL3hRdzFy?=
 =?utf-8?B?R2RKNTdUS0ZtZWZZVDNTYTNaUkxmK1dRV1UyY2RwQmNvVnF5WjZDcXVLdDJX?=
 =?utf-8?B?dGhSdGpIUjJGTmRmdStrRFBLaTdzYnBzYTNLNG1RV2RTeUpSNWF4TGJOSHpE?=
 =?utf-8?B?OHZSZjdUQ3FrZzlka0I5eGZqT0JRWEJXbXFqbTMzWm1aYjlHWnUzR0E0TWNj?=
 =?utf-8?B?K3haZ25OUnJOeVJuNlpWT3A4dW4vakVZdVdiZlZQRlBiUUVZZlB1amcwWlZu?=
 =?utf-8?B?Q3lQenNGNHFBcDJiS1dVS2ZGNURwOFlmK2s2K2wxcDd3NDRrN1haTEt1clZj?=
 =?utf-8?B?ZWMyNHI4bVVIa2hYMGJjOEFBK0VmR2I4ait3WDlzQVRSclhLWkFrTWUxRHVY?=
 =?utf-8?B?cDg0YzRTU0dwdXJXaStwYVMvVmRHNDN0Y3NuNFpQMllnRklld2hCL0tKUkpm?=
 =?utf-8?B?akdxQnZpK0t1azhzSmI1SUFTbDQySWV0UzdDUmJvRkZsQ0RaVlR6bk1IaHdE?=
 =?utf-8?B?amZmemFnMDJZa000KzhqWmNEdlF2Wm9yc2svaHR6TUk2ODlHalJ0d1hReVBx?=
 =?utf-8?B?SjlWWE1sUFYveDY0SmxPN2pSN3NuQUlzdkZIUERsa1VOV2RlMVRWQXVJWDlG?=
 =?utf-8?B?V2lkajZjN3gvVnR2bk4vSitPMHRDdHV4eG1SMkxsT2U1RE91ZThNYUJVelVT?=
 =?utf-8?B?ei9FamdYTGR5YVVpeGRFOEZOSEVrMnJjekdRdk9mS2FpSG5wU0Yxb29UdWYy?=
 =?utf-8?B?RDA2bjhncWxZakJvRi9FTkc4WmVFWTlQQmFSa1p0aXJxV3JFZHlhUXpSUElL?=
 =?utf-8?B?ZS9QQ044dWJCNkttZXFsaUszelFhQ1E4MmdjSSt4bFN1YzhtUG5nK3NFaWQy?=
 =?utf-8?B?bU5KYkc3dmV4Y2V5dmV4V2gvQnJ4aXNTNm12cmh0dW5qOWk4TlQ0dk9TbjlY?=
 =?utf-8?B?UGxzbW9KOWFSVnVvL29sK2pmWVY4cWZLQkZMQjl2MHJ3TDNxZFhrQVhWVCt6?=
 =?utf-8?B?dXByaFNnRzQrbUMyd3BTTVZpeXR6MDErc2VnNkRUcTZRRGEvZDQ5NU9sVDNW?=
 =?utf-8?B?eGZNVGE0THc4UFpKRStkVk9UcFBrVlFKT09JNUV5d1JaQTlYOXhNd1hyaGVR?=
 =?utf-8?B?cldTNUFlckFZRVhoN1FHRXk1ZzA4RHB6cGYzRy9MQ3BXajIvdHo4M0lNU2VK?=
 =?utf-8?B?WkVSUmRWRGR4ck4yVFJzVGxuUVVaTTVhK3NJeWtBQVhWdk5NL1pLUDkyTWpm?=
 =?utf-8?B?RTNZMnBGc21QVVBzVHgyQWZQRTFvazljU2FzY0JNUXR5Z0tUVGJ1U2ZhMVd4?=
 =?utf-8?B?Mk1SQ1RRZldJRzIrRFdOYTNCTWNuQ3hScHhFNjlsODVNWnRSQUhtQ3N6ZTg5?=
 =?utf-8?B?YW0yZmZ0NGJxMDRtc0JLVi9UTWFPZFh4VmVneUg3b3p5Q2huN0JXZUoyemE5?=
 =?utf-8?B?USsrSUlIcTQ4bTE1NW1FZktZUTNBeUdkTGlHN2VqK3FYa1NBSXR2M1gwakRS?=
 =?utf-8?B?VER2THBBUm9mTXg2UGhlN0dod2RTb3VhVjRRMDlKd0I1UW5FTkpUbWJtN21G?=
 =?utf-8?B?dWNxa1dtZFpRS2pVMXlkVS9KYTIxaDlTbVpFZFFkQXZtVktHWEhIL2VONDZY?=
 =?utf-8?B?bWpNMWZNTUxaRERjcTJsc1hoeDZpcGNqNmo4cTl2aUdyWlRiWElJalE3MDYx?=
 =?utf-8?B?U2hnSGZpM3ZlQnFiQVIvSmZDQlg3Mms1eExKN0g4ZitEN2QyQzdwMlBsajhQ?=
 =?utf-8?B?WnJJNHYwTEtSekFScjZlYXhSNXFnOTdXT1lLVnBqMFdkZWx6anhZQlRlOFYz?=
 =?utf-8?B?Z2k4ZnB1NVQ4NFZ6Zk5rdXA1d1VZM3hSa2Erc1QwamhMdUdVZ2t4bWQ3N01T?=
 =?utf-8?B?aHJaMkoyUS9lVXBhNGl2Z01lRUhkbHFCcStrR1RIQWNWeVF2eVFkVDVrc1JX?=
 =?utf-8?B?c2M0c202cWVLVlo4clB6UXhIdHIwVTRNam05VzNzcVFmenp6MEh5ZHBsOEFB?=
 =?utf-8?B?SjRwTmw1aWZBcWIxSjF0RFA5REtBWkc2T3ozSFZxeGptS0xCYm5rYmJWYnNE?=
 =?utf-8?B?eVdaZlNRZlJ1RlhXZlp3SmhRZGlTVXZScDJRaG1sRzhuVlZMWWphQi9ub1Jj?=
 =?utf-8?Q?9tJDP2bJPRl9DIJj4HHi9eJS6lupkcMETVHOl/yg8QhY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6119e70-e45d-4947-d7b7-08da7a9ce1bb
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 06:52:24.8736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPQfi2SrtaNnq8J4QOt8liYR2AEh789K8KUUK+Ml7Kt9S80rSSXQIu+Wd0LfVgPO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3949
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

Am 09.08.22 um 18:44 schrieb Daniel Vetter:
> On Tue, Jul 05, 2022 at 01:33:51PM +0200, Christian König wrote:
>> Am 01.07.22 um 11:02 schrieb Dmitry Osipenko:
>>> Use ww_acquire_fini() in the error code paths. Otherwise lockdep
>>> thinks that lock is held when lock's memory is freed after the
>>> drm_gem_lock_reservations() error. The ww_acquire_context needs to be
>>> annotated as "released", which fixes the noisy "WARNING: held lock freed!"
>>> splat of VirtIO-GPU driver with CONFIG_DEBUG_MUTEXES=y and enabled lockdep.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 7edc3e3b975b5 ("drm: Add helpers for locking an array of BO reservations.")
>>> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> Also added this r-b tag when merging to drm-misc-next-fixes.

IIRC I've already pushed this to drm-misc-fixes with a CC stable tag 
about 2 weeks ago.

Please double check, it probably just hasn't come down the stream again yet.

Christian.

> -Daniel
>
>>> ---
>>>    drivers/gpu/drm/drm_gem.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index eb0c2d041f13..86d670c71286 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -1226,7 +1226,7 @@ drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
>>>    		ret = dma_resv_lock_slow_interruptible(obj->resv,
>>>    								 acquire_ctx);
>>>    		if (ret) {
>>> -			ww_acquire_done(acquire_ctx);
>>> +			ww_acquire_fini(acquire_ctx);
>>>    			return ret;
>>>    		}
>>>    	}
>>> @@ -1251,7 +1251,7 @@ drm_gem_lock_reservations(struct drm_gem_object **objs, int count,
>>>    				goto retry;
>>>    			}
>>> -			ww_acquire_done(acquire_ctx);
>>> +			ww_acquire_fini(acquire_ctx);
>>>    			return ret;
>>>    		}
>>>    	}


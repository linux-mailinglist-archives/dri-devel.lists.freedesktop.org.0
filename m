Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494F16063A1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 16:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F4710E1D6;
	Thu, 20 Oct 2022 14:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851E910E1DD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 14:57:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CC7bHLGZufbryWA7S3Knw6xyTfZlvdDFnG5qUo7/3EtJSjNnrHMV5w7x1F9vrUBTM0zbK8BW8JpGn/EG3mGzKLWXRZGNDwfPGxxZXykjRWOLCvkHnHEys2/bNe6HQHUxxMSl7SS5aLjAFKxxeI0zRALgE3MW3qY86cRpG244OhY6J5cU5O4nzLDO2gRADfdJ5zTMU8cAI5dJbM9n3l19ZFhg5bs335oXB8oxZ9eU2q9vHj4lrJF6S5DeFiTnxUXTUk2HZd/tbldtl/SmoNgANWkScL+8Kncg5GB5+qV4ya9tq/r0KfPyoi9bKitVVpnlI9Hi34rc3LHY9m9geZfesQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/qXeMnAleWqS2WS7am6VJr8CUa4IWkslQXdq0QcRfE=;
 b=RtfINS3m4HMki2DcCVdA3DOMHjb1yuXj7Na1Xeaym9e3rPS09RK3PGrHifwSN4dNqnXnHBUE/swCv0BjA3ao5OKAU93JXi4S2eFTYwmN3pnkZwaWs7aBpGfsGUwnplAibe1Gto7ktxM0Dp1OkhtCGiv+a35vqSLf6mn55TXg0Sj0sqdYYhLXTKLjB98ahDc6jJP3kPY6Ai9UC6iownr+GFyhnp3R7DM4J4aa9lxP0qPJFoGQKtsFMYSQ8ojoN2RDBzzbDw/uR39ha5AGAFVJwN0bMVOHUwu+5vlCZzuan1bbBJ+54I1y/w8LIVBOv0JlKd8h/9VCl2LdBbjDly8ERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R/qXeMnAleWqS2WS7am6VJr8CUa4IWkslQXdq0QcRfE=;
 b=vT0b4ifknNg6gtIsA8PzHxtk3D/Dy/QlGQw7pzy1JkNiXIuXZErioJsCXnUu30w0DQFwV72aYJzCZ1Vx/IZMb6pv+75KaKrl/+qxDu4UDkfIl5yS5EbXfLiY9qU69mIuXkDT5E4/QjmbV0loXTTF/FNvg+rJXBuebOxPY/ycZLI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by BY5PR12MB4115.namprd12.prod.outlook.com (2603:10b6:a03:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 14:57:05 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::e6a5:94b4:d855:14b3]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::e6a5:94b4:d855:14b3%7]) with mapi id 15.20.5723.035; Thu, 20 Oct 2022
 14:57:05 +0000
Message-ID: <fd168175-71ce-2a9e-f8f1-1cc66e052235@amd.com>
Date: Thu, 20 Oct 2022 16:56:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] drm/prime: set the dma_coherent flag for export
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <20221020121316.3946-3-christian.koenig@amd.com>
 <CAF6AEGsw=J6Y5jd0A5_hVg1A5BF87hz00Ggmbi8OtTjPJKMDGA@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGsw=J6Y5jd0A5_hVg1A5BF87hz00Ggmbi8OtTjPJKMDGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0094.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::7) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|BY5PR12MB4115:EE_
X-MS-Office365-Filtering-Correlation-Id: ced65d42-25ab-4a4e-8fc3-08dab2ab5a1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P9w/VgOQ5LxJM+iWEmY8Re+mo7BppguhojwgWrhGxPyPk6HA9EF0KXJJmdoC7sgySgOfz1zKkZ1s7xoV1JL9YeMRbHCrcpYakF1hm1WwhBqcWLU2F7hYEl3Sp6Lx2lHehsQbxirFTyUS0AzPeRhyiewVkFBM/mVkPUqsJooIoKZ9OQ4azC81TB36B3WQUKCvokl0G77OBbvR00nYPWhuYFRsFCniE7crUkbJe2appOaEgg0Qd66q6ShjXc2GNCFI7vluvfLABlOg12xljB8mOts7P94iWBfnhbYy1qkfZuzNG8avXCxVARY9wwjr+XgE0JI4NqWLV/ssXWSZJXoMMqWpmLDoezY3/sgsi/uc6N1lFZsrpalgqzvUJdeysivvft7VCzb3Xiceh6+LlLOOVOf2gjXq48D6eT/5YiXzFfVN4CAwyz7pFv5yGZaACeXiaCpqnTVe7sBdU/eVS2VthFiie5IHiBP8DOZWkWhwdFGboACjx1sFwj/FOlhZUJKnOt/C21kZ2vyvycyCUqQG+kGORvzp1htE6SMtVhX7h2zOLzIDO2GVgqLf4IKwmbs+Mh60rz8yav5MbtgKMLYQKjd4mrsDljpZMTBP3BxjDBK54hMgwCXMhXBGTxiZxqU79AUZkEkgWW36HS9cZgb8lf7pYp2vsMu1pQfm5dW9pJTiRXr51DsJ0sBIEhfnZnm8Iy5ZXdQN7ArOoLqp4hYWaRBbozCPe8Ez6hobmkGysbWAY+ub6xWyU5FauMT5lXzPeW/FnxNlSTq6fF8qxScvmHyzVn32eLGtv0vWdUBDFSA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199015)(316002)(110136005)(6666004)(66574015)(8936002)(6512007)(2616005)(186003)(2906002)(5660300002)(7416002)(4326008)(8676002)(66476007)(66946007)(66556008)(86362001)(31696002)(83380400001)(41300700001)(6506007)(36756003)(53546011)(38100700002)(478600001)(31686004)(6486002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVg0WkhCOS9iOXplZWFiSGdKelk0anl2cmhNWVZobCt1V0FLalAxNGZrRlpC?=
 =?utf-8?B?TVVVc2todTlkMW5neVN2ZEkyNlFxVElHYlBKS05jSUN5aGpkeDJpRXFYbEll?=
 =?utf-8?B?aDM5QkxVVmRZanRwRXA5OXNCdlJ2Tmt0ZXV0RlZ2aGZvaWxaMHlGUWlkVXJB?=
 =?utf-8?B?bWluQTBpWE13VXdaeCt5WDNDN1pKSktreUE1NnIxZklET09xTTBJTGcxUWpp?=
 =?utf-8?B?cXpST29oTWRyUEhRd001amt5a3B6MElNejlWUE5ZR0pjZm50WFJjVkFOK1hr?=
 =?utf-8?B?QkFQUW1Ka1FzRjdUa201TVB1cnFYVitYY0lmZDl5VWs0RW14cDYwUjR1SllY?=
 =?utf-8?B?TTJPc3YzTXFNZ0RBM3JTM3Nzck9GZHNQTzc1WGZ6LzhUWVhpMHdtV3FkZVU1?=
 =?utf-8?B?RkJZZnpNZTY5RGE0Q2poazg3d0REd0lWZDN4TEtSZHZjcTBpZ2pudEVBZHd1?=
 =?utf-8?B?bUlXQlRyV2daNjBJbFFNZjd1YWZJWlhkWUd4SlhJSDZXZncvdGVUZ0dMa1Q5?=
 =?utf-8?B?S3FiYUdCenIrM29GZ1FOQmpkQnA4RUxKbUxwYlNCTWZKOFAvUVpXZzRpWEJB?=
 =?utf-8?B?OGtBQzhEZ0xZT2daSUdhK1Bmc0p3RFFLSkhmRkpWVExsUUYyTHNmOVZ3OUVp?=
 =?utf-8?B?d1JORGU2bCs2b3lKaEF0TldwVE1IbG9jMHZDdTltTEpvbVdROVBjb1BzZU1G?=
 =?utf-8?B?dHhrejRvaFk2bUJCUzRFbXVqblNYOGFIeXJpVmwzQVF2a2VMQmZUd0h1N0N4?=
 =?utf-8?B?RUZiTFdhandDdjR2Sm85NDBta0RhZEFVMVRmdldlU3d5YzJ4QUtJakk2Y2Yx?=
 =?utf-8?B?L0txTUt4bzdZTTM1eWdaZzVjTkNpM3Jpa25heXdpU1U5QU44TmMrT0NkWlpT?=
 =?utf-8?B?b21QZ0ZVUkc3Nk9taldQK3FNcW5KYStYdkx4ZEREb1NHMXRNMkZqZnUzZTVR?=
 =?utf-8?B?UElOcTdEYkVYcm5weWRCOXhEaFRPWjVKeXlxVEdoL3lMLzM4eVJ6V0tYMWNB?=
 =?utf-8?B?QjNFeUpkMnZjUXdEYzUyT0R6d0JodjY3WTBOSUswTW9GQnlwSXF2WE8zM3NP?=
 =?utf-8?B?WjJncEVabEJXL2NsYWdoUlVqZFpyaE9OYVRvS3M5N3htREkyRGNlNFFvY2xL?=
 =?utf-8?B?M2NkZENZZitPdmN4RU83eUNTTG9pdnFVcElZL2xmaWlJSzVhbVM3ajVSR1h4?=
 =?utf-8?B?Z2FuMk1tSitLVysxQzRYT3ZjTU9TZDZ0R3ozN05QZGdnMDhwTWlnbXprNUIr?=
 =?utf-8?B?aWNzaTJLR3BjTjIwTk9qMVpJcUNlTzh1ZTJmMy9sNE9JQjBFVHBHMEp5K1Vp?=
 =?utf-8?B?SEV1ci9rUzErdVB1MHdWM2lHamZaWkpRaHNqK2VnZ1ZvaTVhK0krTUZrTjZY?=
 =?utf-8?B?MkN0Vzk4VDhPNUgzNEZPelM2dXZickp0aGU5SWtUQ0dVVmw0a2V2cnZlS1Bu?=
 =?utf-8?B?MkZiU1pjaDJLNE1oTVpKekppMjcvSDA2eWNRaGNOSVBLTFVOVjhFSE5MQzMy?=
 =?utf-8?B?WUZvQitrK2tGTll4b0x3bE1VK1ZhSXNIOFk4VlNNczd0V0drTEZWL3UrWmEr?=
 =?utf-8?B?dDhVYS83Rzg4YVBnQmZGbXhUU3pGR0h4cmpHUldyNE5NbDhEdWlPWFpVL0sx?=
 =?utf-8?B?Z25leGVLcFVKNU8vRHRsY0EvdFdCR2lDcmRBNjJ6aGNTeEJWamNlRmYrUUUv?=
 =?utf-8?B?Zi81QjBWN0JZTU83WjQ2THFibFlLMS9rMnV4RUwwNnFFVzdMK3J4QjhzZ0FP?=
 =?utf-8?B?Zy9xaGtxZXREMWtJdDd6aVJSdzZpSXhVc3p1Q3BEUExuYXZ0dU1OVWg3UVFQ?=
 =?utf-8?B?bmpYRHpTSVFodVZDQjVqZEFZL21aa1BOVmtHZXplRDhJUWpuckZiN3orYWZQ?=
 =?utf-8?B?K0QwbEtaazBmWlhMYlZxSnBzbk8yYXlxTzFQQmhPSVBIbldBZXJYb250aWtL?=
 =?utf-8?B?d0tKSXdGTFZSZDN0TzkvNlNQUGQvSkZXQVM2TXpMelhNMjVKdm1DSWRXWlRu?=
 =?utf-8?B?Z0M4U3BNRW01akZXWVI0cGhGNmZpWUxMMWxRUWIrSkdSdWF0YUlGMTVXdVo3?=
 =?utf-8?B?NTU0c1FwMHZqUlZKSDF4N2xYeUgyUkNHaTRMdDFBcHQ2dm9nRlBRT1VhV1NM?=
 =?utf-8?B?SzFMTFhFQU5CeUJxTmFZb0Jyd3o0OVVXUWYzdlE2TFVTeHQzeldhVWdsQVFh?=
 =?utf-8?Q?l1IW5TAgJV+0g5yx0xjTL7+ncBM5Lb+0AEI4QfE94s43?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced65d42-25ab-4a4e-8fc3-08dab2ab5a1e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 14:57:05.2450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PmAZjDjL7l6i25eV+xG4kLQcgDwJZIRY9/KgN/ZzK5CzRBdV/q/P/BqLCCXvpMA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4115
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
Cc: dri-devel@lists.freedesktop.org, nicolas@ndufresne.ca,
 linaro-mm-sig@lists.linaro.org, ppaalanen@gmail.com,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.10.22 um 16:43 schrieb Rob Clark:
> On Thu, Oct 20, 2022 at 5:13 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> When a device driver is snooping the CPU cache during access we assume
>> that all importers need to be able to snoop the CPU cache as well.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/drm_prime.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
>> index 20e109a802ae..d5c70b6fe8a4 100644
>> --- a/drivers/gpu/drm/drm_prime.c
>> +++ b/drivers/gpu/drm/drm_prime.c
>> @@ -28,6 +28,7 @@
>>
>>   #include <linux/export.h>
>>   #include <linux/dma-buf.h>
>> +#include <linux/dma-map-ops.h>
>>   #include <linux/rbtree.h>
>>   #include <linux/module.h>
>>
>> @@ -889,6 +890,7 @@ struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
>>                  .size = obj->size,
>>                  .flags = flags,
>>                  .priv = obj,
>> +               .coherent = dev_is_dma_coherent(dev->dev),
> To set the coherent flag correctly, I think I'd need a way to override
> on a per buffer basis, since coherency is a property of the gpu
> pgtables (which in the msm case is an immutable property of the gem
> object).  We also have some awkwardness that drm->dev isn't actually
> the GPU, thanks to the kernels device model seeing a collection of
> other small devices shoehorned into a single drm device to fit
> userspace's view of the world.  So relying on drm->dev isn't really
> going to give sensible results.

Yeah, I've the same problem for amdgpu where some buffers are snooped 
while others aren't.

But this should be unproblematic since the flag can always be cleared by 
the driver later on (it just can't be set).

Additional to that I've just noted that armada, i915, omap and tegra use 
their own DMA-buf export function. MSM could do the same as well if the 
device itself is marked as not coherent while some buffers are mapped 
cache coherent.

Regards,
Christian.

> I guess msm could just bury our heads in the sand and continue to do
> things the way we have been (buffers that are mapped cached-coherent
> are only self-shared) but would be nice to catch if userspace tried to
> import one into (for ex) v4l2..
>
> BR,
> -R
>
>>                  .resv = obj->resv,
>>          };
>>
>> --
>> 2.25.1
>>


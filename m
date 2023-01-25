Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A18A67B6AC
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 17:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33F910E013;
	Wed, 25 Jan 2023 16:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D4510E7F9;
 Wed, 25 Jan 2023 16:15:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DhKu+YG0v9LG32ZHsCEdMaeMkwx06syv9fOf1XupzOZrzfAx6Z9C7lX9+J3Df90Xe31jE/DTKmDrpcQrCdRcRgL78zY5Iel4oN8RWj5l4w9qrDqLh+997ttxaykP0nnnvJ7yFava4H05k10LRzr//g7IRzuOu2dCf2Ppd1RDNq1IAeDPdguYWrJhtRiVMmI92jEtIEe32Zfyt1Pj9I5TpeJE++xSj1lMZLN7xEl92OdH0XOaL0At8jN4ojmK11DzXZD6/7zUzQSdHwEBM231HWeCoRzg8P+doPDJAOCqiVjI+zgz0f2PhUL/reKLOpEZ8sRwwYhz3QlxuTSLC0qJXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1P/BwUd98XlN/Y/Vk4QzYI6cHPt97jmYf3590sy+RM=;
 b=S5olK5jRTjyssOQ0AAxUGIcSIu95o0REtZtXiNBtycFQbJCB60EEJKAc+bIvJ+ekCUCfxR/QfSSGh+XJDsHRKyPph9h8NnvZ7qfIOthHuKe+IAiZmIkQjKoPjs0mZDqVsrgnkEP6sk/PCNw920VVp+1FEOnwJ9gF8ZMJGgiCgDGN08tikWclf2ImC/vG6fy/Mcsauzl0HBGwTY2fI+16xYHo9OeCqIsoHYrkRj7YW2sggFulKEGp7OkceLfmGhHVwQA+l5fXnHJm7wjPQE9mAzMkA2p69xzWF2NGeyZUXZ9PsswH1wAuruXR3qFPDSklbqMum7KnCeMIegDwgaKLZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1P/BwUd98XlN/Y/Vk4QzYI6cHPt97jmYf3590sy+RM=;
 b=siDR0LalYz9PphVwLdKnAcNJcOr8lXCba9Y3ULIuYCQhKPQQMcYfYr7kJqhr6JxahCGaPy9QBPdueKFmiBmeHLcOnhyWFwzHClzHShQdhk+JKsjKWZAVVjvAW6YBldfh+BV9gE6dF+kfL3vmdsm5OcOqqYG3B+IOtT9Gr8UG0NE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB6466.namprd12.prod.outlook.com (2603:10b6:510:1f6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 16:15:46 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.017; Wed, 25 Jan 2023
 16:15:46 +0000
Message-ID: <8e247c51-7ff0-fb2b-e62c-bc7071248fa9@amd.com>
Date: Wed, 25 Jan 2023 17:15:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] drm/ttm: revert "stop allocating dummy resources
 during BO creation"
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230125155023.105584-1-christian.koenig@amd.com>
 <20230125155023.105584-2-christian.koenig@amd.com>
 <CAM0jSHPoXqLVCkC77JDURw-zSY6=ryDwA43xH9Y+D7uMiZOJVg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAM0jSHPoXqLVCkC77JDURw-zSY6=ryDwA43xH9Y+D7uMiZOJVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB6466:EE_
X-MS-Office365-Filtering-Correlation-Id: 27beeb31-bf02-48bd-1d0a-08dafeef6a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y+wHBKZf8TmNU8G/MYEz2I+U8wPrEwN1+X/Ce7XbD0VleWY/36KD2KfQ5Uus/pRpLQl0Z2N2W6902VN4eRXSwVAIRbGtQM5QPPOeGuGTJugcKbhXKS01pJfKR2b1IGDrDOu51C/EPh+Z+YIz1KkmgHYx6khYv8e2ADDGobbs+v9NFNjC445dqm4Ub1Md+3uxzjfUxnk2uncJLiXpZVGcvzoxDPa0MVrrNVLd/8XqxNzC7bD9YMOrHZG077PyjvOx2E7MbsMkMvK9yr+Cwyd71c0SOS3e/l9tMulnaesad3yvBm8KifjArvJhNqih99WuMnawI+0EV5uSVJcvPbTtiaerlwhcc/CGXnZ6WazCeA9Bj4pu3YNxlYiFmp26vpVBHO8pUtMpdCJUAg1mYEnKp2Oydavc9XhkbMeL9mgcAngOmCQZwMUFZt6ADvotESXH8D8VxC4SwGM90dF3yV387M+gNN8V9Jd38hMAypa1z/WO4a6ynk8D4wvIDyXEmSGYfQIUuDJf61MMdtsFKo3jqHVJZpLGhj6ntLYwewjKffwXSrFWAjyl1AAy+O0Hr+8U/1BQm3gK3wOIE3RYh0gXYEg4nUxw4xwcB3n7pMPu7uqsql5SmfRSupIVywS49NgVjukjBRKHjLyARs+DHIw2WX6lvODsTRvlXgnUudHq7Tyv3pyjnINW6tulj6GvQojhVo/UiElAnc0NX3SiQ6gvl7OdKDnFAJgs8j3aqXMZNfs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(451199018)(41300700001)(86362001)(316002)(110136005)(36756003)(31686004)(31696002)(478600001)(6486002)(6666004)(2616005)(186003)(8936002)(38100700002)(6506007)(83380400001)(6512007)(5660300002)(66476007)(66556008)(66574015)(2906002)(66946007)(4326008)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnVXckZEdDZUSVQ4M3VxU0hjVTFiVmJyYzlNM3lSOWxtMkQxNGJRWENJNjRG?=
 =?utf-8?B?cFJ4RENOUWltdTJFSVlPYkNhRGxTbk9pUUxJeU51dkNBVFJYNkhSWmpWN1B3?=
 =?utf-8?B?UWkxRm1TQkh0UUhJUzBZcnJQN2VRdXlBN3JMcWNWY3ZYVkxVd1pvWnV6MEhz?=
 =?utf-8?B?UGxsT1dsdTdLKy9CdTltTGU1YXA2QUNxMGZpTEdwMXZYUDhLS2doNi9SR3lO?=
 =?utf-8?B?RkhiNDFXdzM0WXJ1a0lGeDNIODhGV3pyTjZ0TEpzZXUrcGRPZXlXUDE5bXda?=
 =?utf-8?B?Z2lQL3RTdDdkWmM3SXE5UWxiS3JKZFVhL1NieGQvb0VtM2c0YU1rOXNvSXpW?=
 =?utf-8?B?M09yNUl0dWtwaWJ6Sk1BQVBzclgrZzA4TFEzeEtKczIrL1gxQ3BRdHdaZnhB?=
 =?utf-8?B?eFIzVkZpR1Vjc0s4cXY5M040RUg2djhDdzkwUWhTaWN0SWdoZE1QSHF2cy90?=
 =?utf-8?B?N2Jwd3haZkRSb2NYUitwNVF2UHJNdTd2cWdOeDJPT2RsMTNCTWpqcm8wRllG?=
 =?utf-8?B?dy90SlRkMG5Hdm1NV09PalZxY0pCVXVnMXdFTzk1SWp6ZWZZYkxrVTIvK0pX?=
 =?utf-8?B?U0gxbEFsSUJJQXcxaFFRbmsxTU8wZUQxZCt1RGZwcUZjTWhPUE1ZajlQQ2VI?=
 =?utf-8?B?MEoxeTFPZzRyTWZWTDdramFrdGIxdkd0NlgzWk5mbmJrN05yR3Z5NHJGd2sx?=
 =?utf-8?B?WEJFSlptNnBGcEQzMXNSMmc1Y2I2bk5SVjQ1L0xFMlN3RFh2ZnMzNjVJTEpF?=
 =?utf-8?B?QlkrVVUwYVFIRnlDVHk2UHJIQjYzc3JFY2tMYXNFR3VVbCtqaDhEbzJRN0Nl?=
 =?utf-8?B?Q3N0TFJJSVBKRW4xTXB0SUloaElBZmh1aXg1WktVbi9VcUJyc0c0S3l3OW9R?=
 =?utf-8?B?cXdVMjFrTHJKcXVKOXR0Z0dXdkJtZjQ2Z2p3c0tIQVZJMDVuSVFCbzJYVTc2?=
 =?utf-8?B?ZHE1SmpQWkpmdHlyVW16VndSZjJOdG5JT1Zta2RaM3VtZEplcWhqa281ZURI?=
 =?utf-8?B?SWFpWk9CeHVlNDl5VVlhMzRTeXhVT3pSVnN5amFTRXpxdmZFS0g3SXI2QkVX?=
 =?utf-8?B?ODl4WVFES2Z1TEhOVFNPMTdlUWdvZEUwS2I2c1VFMGJ1cFF4RWxGQzFhQkZy?=
 =?utf-8?B?YzMzWG91ZWI5ZVFIUm40M3U0THdIZG1iT1Z5U24wMFljK2VmZXRKekl0OVJ1?=
 =?utf-8?B?d3hrc3FNazlpUjc1eFNTUnM5amMya011Z1FtZEdoMkxDMmY0RFNaaWpBS0l4?=
 =?utf-8?B?WURiU2xLUDIrZWdsOUJwcVd4aE9tbllsVlMzUHYvSzAxd25yQmZHYnUvcWQx?=
 =?utf-8?B?TFpKdjViSi9BbGlDQzFqL3JpWm5CSnNpMStiL29QMmRiWkRzVnlRMklWUDU5?=
 =?utf-8?B?a3l5VVQzN1IwOUVRcTFSWHVZME1nTmkrU0ZsUkpYbitpOUtlYnhYRjVaTkhp?=
 =?utf-8?B?YXM0MW5TY2liMS9XdllIMU1uRUVwMzZ3QTAzYlVlTHJUMUFzcHhaSUZRZitp?=
 =?utf-8?B?ZkVVYUo5bVgvYXQxU1JSSjlJRHBaUEhkUlJDbUxlVHhMdWF5NzdJYUpaYU9W?=
 =?utf-8?B?aEc3L0dvVnlZNkN4OFJUMkFKczl0NG56cmJmdXU5Y2xudTlsdnVGenlteVlF?=
 =?utf-8?B?MS9oNDM3bW1PdVlVQ0Q2QWFFeVhJNzFNckNLVTNMTXFMWFFZQng0RTk2WGFm?=
 =?utf-8?B?VzFjcU9ERFpxa3FHMjVSMkNzM1BVbVF1YXh0R0FYeWw5dkJFMHNpVC9ucUpI?=
 =?utf-8?B?VkUyMFpleWNsdFhhSG5kaE5QSWx5WkNuYVpiSjMyQTZiSG1OVkpYZTJiVnl5?=
 =?utf-8?B?SE95ZS8zL1RkVXlnVWdteFBHWENsbDRJbHlRR3ZHM2xaRnpTVHkvaHkrMm1h?=
 =?utf-8?B?Z29nT0hkd3J6TWRnbXo3cG5ERkRqd055V2lIN2JrWkhDSk1EVmdUMGJncjVD?=
 =?utf-8?B?RUxLTVdxR1FkOVFtNWRHMkxwVmczaVNEbklrYkNyMC9lNmdESURiODhmU3RT?=
 =?utf-8?B?MnoxQ01YY3ZPd3ZpSEN6ZTZpWVFYVVZjT0o4b0NLa294Z2RJbHIyY2tyUlVT?=
 =?utf-8?B?VzZCR0RqV29xNkxQcXVONE1XNEdsV01VR2pXcUIzSjRrY3ZEY0tzODVVUm95?=
 =?utf-8?B?aVJhZkN1bHdmMzVQck4wWkR3ODFlaTFWY3NyMy9YWUhxMzBBQndLY0ZCOWJS?=
 =?utf-8?Q?rjjRY942F72MJDjwDzJW+8LYTBA6zEn5Z2nM8Aaua5Nr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27beeb31-bf02-48bd-1d0a-08dafeef6a25
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 16:15:45.9208 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W+V4/kNaVIWlBo+aDdgOCViyRIlPfVrWA2KnPTkcc3BGl/F9kamap6K+hghZww7o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6466
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.01.23 um 17:13 schrieb Matthew Auld:
> On Wed, 25 Jan 2023 at 15:50, Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> This reverts commit 00984ad39599bb2a1e6ec5d4e9c75a749f7f45c9.
>>
>> It seems to still breka i915.
> We also need to revert the third patch:
>
> b49323aa35d5 drm/ttm: prevent moving of pinned BOs
>
> It introduces the side effect of no longer calling tt_create(true) in
> ttm_bo_validate(), and I'm 99% sure that will break object clearing.
> We rely on having a ttm_tt for the initial dummy placement, with
> FLAG_ZERO_ALLOC set if clear is needed. Also I'm not sure who even
> creates the ttm_tt now, if ttm_bo_validate() doesn't, and we don't
> have the dummy move, like with this patch.

Oh, yes of course. Can I add your Acked-by to reverting all three?

Thanks,
Christian.

>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index 33471e363ff4..9baccb2f6e99 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -957,6 +957,7 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
>>                           struct sg_table *sg, struct dma_resv *resv,
>>                           void (*destroy) (struct ttm_buffer_object *))
>>   {
>> +       static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
>>          int ret;
>>
>>          kref_init(&bo->kref);
>> @@ -973,6 +974,12 @@ int ttm_bo_init_reserved(struct ttm_device *bdev, struct ttm_buffer_object *bo,
>>                  bo->base.resv = &bo->base._resv;
>>          atomic_inc(&ttm_glob.bo_count);
>>
>> +       ret = ttm_resource_alloc(bo, &sys_mem, &bo->resource);
>> +       if (unlikely(ret)) {
>> +               ttm_bo_put(bo);
>> +               return ret;
>> +       }
>> +
>>          /*
>>           * For ttm_bo_type_device buffers, allocate
>>           * address space from the device.
>> --
>> 2.34.1
>>


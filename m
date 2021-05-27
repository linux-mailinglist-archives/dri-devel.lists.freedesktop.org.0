Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AF4393241
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 17:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469796F40C;
	Thu, 27 May 2021 15:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941D86F40C;
 Thu, 27 May 2021 15:17:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AieqRCnZ/hgWpZyeLEM2W42s05wqVAbnuHg3/3V3U0LY2ciEV9Nl3SNWPgF0PnkxltGlUH7JytstyKMOp1KS0L7n8McWHmwPuThYg3cLEK8ZU3IkXxB0nupeTYvMxJfF98AeXt+V3z4jbeYssPNukAcK0Mq/XqlOUlP0r1r+5bBqE3D+/EXvVEqZl22IDRrjWe7X3+RIM7X7Jge6Ci5JuloD0V8okJTssOKK4whFGwHJvPXzfjUJs8VBp74j6BSiWd9oSB36DIAKpW8BFj/bnXV9avKdf8Lsacind/ijJDETLzZ2ZJEPzG1GCKqArBKKmgSIoJxbI6nba5gVFJezLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXFDzsxntW/NCn6GT3LG0gCFpT+w5Hij/KkQSGKsl6o=;
 b=goox7310KhehPLnQwmLRKtEzdx6I5QR6CpiF/ZPOnGFaoCgEqM83bzJBKWh2LKq+xHs2UUYRIS5N87C8caZFJ44y0+R59O3jKnnPkmmylwX3iOT3BCMhvamlf6OMiQRjEnazdBT2JgWFDFUf24uvcMwsUfvhhFJYFOwY6xUkd9osEpzLGj0JWXkE1pNRrtbSa0J3qCXAmG8NMF72Ly42lP6RqI6aOaat3/a66iRHwWBbL/3kEBiT8xHRkR49KWHRRopE/ydMBSGBJ8SHdIQaejoWVOMwKU477o5x8E1XWpwDRvYGzJS2CHwcgR2+46XyYVR9iqXVehJE3sc5pyFQoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXFDzsxntW/NCn6GT3LG0gCFpT+w5Hij/KkQSGKsl6o=;
 b=XGi0OglyZVtokh9F6Ot8hhQsQcX6qoIi91iHKl5Mbd6Dwq2jIYG97lNctH0lZ16PUG4n5pZsXvbrfXWJTJJpqZ2KJgQ5f1ZOdWC7gX0oayTxPCFoZJmo3qaMAgKd5q+H92TbUn/OA6ip9ndPIPiZZnIFp8/ticXTFp8sl4fj6DY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4237.namprd12.prod.outlook.com (2603:10b6:208:1d6::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Thu, 27 May
 2021 15:17:07 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.024; Thu, 27 May 2021
 15:17:07 +0000
Subject: Re: [RFC PATCH] drm/ttm: Fix swapping dereferences of freed memory
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210527141923.1962350-1-thomas.hellstrom@linux.intel.com>
 <883eab20-4326-d14a-2eb0-5e95f174a0d9@amd.com>
 <8b3382726763050334a6cb214f7ba560eebf8f28.camel@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <aa797cfe-cb48-6f8e-37fa-0e2f69b30e33@amd.com>
Date: Thu, 27 May 2021 17:17:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <8b3382726763050334a6cb214f7ba560eebf8f28.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:ffcf:5811:6cd5:8a3f]
X-ClientProxiedBy: PR3P193CA0023.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:ffcf:5811:6cd5:8a3f]
 (2a02:908:1252:fb60:ffcf:5811:6cd5:8a3f) by
 PR3P193CA0023.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.20 via Frontend Transport; Thu, 27 May 2021 15:17:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf241f62-cb4b-4b98-1ff5-08d921227dda
X-MS-TrafficTypeDiagnostic: MN2PR12MB4237:
X-Microsoft-Antispam-PRVS: <MN2PR12MB42378D8F3604C9AF5C1487B683239@MN2PR12MB4237.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ooep8O7AHfgvqseInnBUVIed7R/1jRr9OK7smWd1xfWunRWJRFTAMl/H+w9dEGzt8lHMzqZRAZ3VdAShiUTyiUj2fFmq6MvdCWv5bTxyC2t5jj+GXCruxIjSAKt4DWm78DvC9LDaoKXhdvGPimjMvTDgLBAw7uv8vyk3D3jvtgHGQV4dwtjGUiaq/4h3+cI+ZolKqHpWZpEOQVk83LZx85s8TuAHXE0tn9VbyKGECgHKtCBCkDxD4WaOTxgACMCkI42naSFCtTmC5pR/wDP8pMMi6ZUJfI38+ZwlyIrXTb7IvQsImLixkwgTMi4Vhh+P0qbWmVuoNyd0JkD1I+kCUYsvbP/YuL04lw5Yy8sBapLrYtuzJ4csGOAxaLbLpqZ71C7c3cbxR/oS5dmA7ZuFjJvzUk6VaVsc4cQnQnmaZP1/ALiAVCuEQIpIDy3uKQSGWajXsM/P0gDOWsQBTjukV+qbmc/apndc98kGcwWVNUmSnfGOsdeNWpaAHVL+hEfiwac9pokclHZJ9cxv3U6YNYOo6GSlsOdOlXMHBwkIRCF7ijzmWisOPt9ILrBSMNolbBbIlL4ZILPpiBr15LzJPCJXfljnRRoqy4Ago80W5V2bYU1QLGHMI9SH4gYeu2WLUtUv0PXLwxcWBTbWmhJID6FfjQd9YHp0oX+hFPndp/yZ4pug4HqyhvDYZ50Y7SMl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(86362001)(2906002)(38100700002)(83380400001)(31696002)(6486002)(31686004)(5660300002)(6666004)(316002)(36756003)(8676002)(52116002)(2616005)(66946007)(478600001)(66574015)(186003)(8936002)(16526019)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YmRZNUdNOHoveUtGL1JaZTJUK1QzcmtSem01Y0p4S0xWcjU5VFZ2NEloRm5W?=
 =?utf-8?B?eXlnYnJDOFJ5NU5XYTNHeGN2ZitONHZDZ1Fuam1rUE9IOUMzSmV1a1RYS1BY?=
 =?utf-8?B?K2xBcXlKZUxJbVkwdDQ5Q0dnbC9MeXhhTFVDVXVRazJYemE0OXZ4M1Jqa0hR?=
 =?utf-8?B?UHQ1azRBcXdPR2tuOFJoVkRrMDdSSjdha3J1Z25GeWZEM0NmWnpGRm5RMkZu?=
 =?utf-8?B?dy94eVh6dFpaMHQ1UTV4QWx6aFdNL0FmcnRWamM3M1k1aHNCaGJnaVhRVkhz?=
 =?utf-8?B?Um14ZXRubDdHZnRMZ1c2ZFZtaUR0ZHNxUWFGSjE3UHpiSzllSGVRbTl5TGhI?=
 =?utf-8?B?Mjk1cnBEdk9rdzFXSnhNak9iZjR0bENuUEZZU092WjdaVG9MeHB5L3dnNWZW?=
 =?utf-8?B?WVpZVktycjJLS2x0Sm1xMTBLa2xmNTFUZDQ0MktTTmRCVmdTTzh1R0JkMWtM?=
 =?utf-8?B?RjRMR2F6bVVjWXM4SXlJUVJscSszQUpRdXllMWtQUUxNcUxLZktuK2dzWGdE?=
 =?utf-8?B?YmY5KzloTEFCRnpuQnBoVVp1UWpDZ3QzUGw0UUpuZ1lWSkw0UUY1bXlFMzBX?=
 =?utf-8?B?UUNuaXY3MXpBU3hzSjdERXdML1o2b0hLd1FJQ3pORWNXU2RDWEZUSjc0L084?=
 =?utf-8?B?WldyWStRVVpycEJxZEk5QTBXRXJ5cWhrZnhRZ000N0krWjRxTmF5UTQweFhJ?=
 =?utf-8?B?VW1tcDJoaDFDVlkxd2Q2Njhsckhlek85UWxTdW9vSldmeVFDWDVSYTl6MWtl?=
 =?utf-8?B?Uk93bGIyWDkzbzNmOEZ1WHVQWTZBVXJpMEg0L3E4cnpXVTdQd2tzeitlM25p?=
 =?utf-8?B?Q0xVQkR1elpjaHlNUFgrdkhBM1YrM2lzRXgyajJraWZnUVpJRnlETHNaTjl1?=
 =?utf-8?B?ZXRadk1IaXNyb1dYc1NSRFpRcW95VWJtVStSTW96czZ6UXIxeXJLL2J0N01L?=
 =?utf-8?B?cE1IZXBVOUtqZXRxRG9FVnVCK3pJN0Y4RUJlQVRjUmx0OXhXaWZOWW4wK1hx?=
 =?utf-8?B?U3I4L2xHYnZDTGZTWXROVzBKbjA2Qzd4OTZJUjVmMXU2aUxKcDcvNW5RUnc0?=
 =?utf-8?B?bnRZcnc3WnhOZGNqMzg2cTZOUTZWSkhIZnU4cDZodklPK1FkaTVIWnVrRkdB?=
 =?utf-8?B?TzVpNkozUUxuZjY0SmFNK2ZRNGN4ZVdXS2IxUVR4YUdxdU9WNmtQem9Fanl1?=
 =?utf-8?B?UTl6a2QycFNOZ3pnNDhwMExtbndBRlRiUlNwOWp1WDZKMDhDcW1jWFNRbmVj?=
 =?utf-8?B?TW8yeEdLSWJTTlcwcnlYMW4zOTFRZXZnNnR0YURaaTh1aFJUeUR6bUVoOHdK?=
 =?utf-8?B?QTVpdzBySTNlUTVnSDkyTXJpR2VsRnJSVXdMRC9mUXVucUhITEFNUFZuRTN4?=
 =?utf-8?B?QUU2a2RDalM1c3A0TGVGcTVFMUtrcEZpR0lmakQ5bFJDZEFxSU85OE5NNkJv?=
 =?utf-8?B?dURoOE10Tyt5TXNqVGdSZ0pxbk92cUxQV2VSUWozZUVaUC9GdGc3NG9abjl5?=
 =?utf-8?B?a2xlOWhMSzJEcWdKVThCSWphZ1Joa2JsYUlJTzRISC8vdHgrZThVeFhwYjVk?=
 =?utf-8?B?SHl1N3VlZzFhVm5RUVpHc3lhbWNvWGNRaEZSTjREaExuUmVXcmVwYVplYmxp?=
 =?utf-8?B?SThUL0tKazRZMFpmMEVoaGhhM1prR3ptL1ZhZy9OckJCd25hYW5rWi9leTN2?=
 =?utf-8?B?RmN4WWlYMDkyOG9PR0gxQmM4eUgrN2ZCLzRmVkdicHgrcDErbTZoUy8wR1RH?=
 =?utf-8?B?YWJBZXY2UmVRSEVsOUxXeU1Wa1k2VEVIaGRpSmtWZFlpdTBMclZRYlVSVEZa?=
 =?utf-8?B?MGtVc3ZZZ3ZhODdZNk41QWZObmtmazBYdjM3VHhtVkRLSWFQWG9pSTEwc29Q?=
 =?utf-8?Q?HSLIU69syd2TO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf241f62-cb4b-4b98-1ff5-08d921227dda
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 15:17:07.4617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTvkprJxL+4Woby80doT+PONtjxk1vr+soH2xexY8BBxHEIXF9arRGma0cz0qUhi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4237
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

Am 27.05.21 um 17:01 schrieb Thomas Hellström:
> On Thu, 2021-05-27 at 16:54 +0200, Christian König wrote:
>> Am 27.05.21 um 16:19 schrieb Thomas Hellström:
>>> The swapping code was dereference bo->ttm pointers without having
>>> the
>>> dma-resv lock held. Also it might try to swap out unpopulated bos.
>>>
>>> Fix this by moving the bo->ttm dereference until we have the
>>> reservation
>>> lock. Check that the ttm_tt is populated after the swap_notify
>>> callback.
>>>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_bo.c     | 16 +++++++++++++++-
>>>    drivers/gpu/drm/ttm/ttm_device.c |  8 +++-----
>>>    2 files changed, 18 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index 9f53506a82fc..86213d37657b 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -1163,6 +1163,16 @@ int ttm_bo_swapout(struct ttm_buffer_object
>>> *bo, struct ttm_operation_ctx *ctx,
>>>          if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place,
>>> &locked, NULL))
>>>                  return -EBUSY;
>>>    
>>> +       dma_resv_assert_held(bo->base.resv);
>>> +
>>> +       if (!bo->ttm ||
>>> +           bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
>>> +           bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) {
>>> +               if (locked)
>>> +                       dma_resv_unlock(bo->base.resv);
>>> +               return -EBUSY;
>>> +       }
>>> +
>>>          if (!ttm_bo_get_unless_zero(bo)) {
>>>                  if (locked)
>>>                          dma_resv_unlock(bo->base.resv);
>>> @@ -1215,7 +1225,8 @@ int ttm_bo_swapout(struct ttm_buffer_object
>>> *bo, struct ttm_operation_ctx *ctx,
>>>          if (bo->bdev->funcs->swap_notify)
>>>                  bo->bdev->funcs->swap_notify(bo);
>>>    
>>> -       ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
>>> +       if (ttm_tt_is_populated(bo->ttm))
>>> +               ret = ttm_tt_swapout(bo->bdev, bo->ttm, gfp_flags);
>> Exactly that is what I won't recommend. We would try to swap out the
>> same BO over and over again with that.
> But we wouldn't since the BO is taken off the LRU and never re-added,

Well then that would be a bug in itself.

>> Why not move that to the check above as well?
> Because the BO may become unpopulated in swap_notify(), i915, like
> vmwgfx, sometimes sets up gpu bindings from system, and when we get a
> notification from user-space that those are purgeable, we don't want to
> purge immediately but wait for a potential swapout.

Uff, good point. But then we need to check that at both locations I think.

Because populating the TT object currently doesn't put the BO back on 
the LRU eventually.

Christian.

>
> /Thomas
>
>
>> Christian.
>>
>>>    out:
>>>    
>>>          /*
>>> @@ -1225,6 +1236,9 @@ int ttm_bo_swapout(struct ttm_buffer_object
>>> *bo, struct ttm_operation_ctx *ctx,
>>>          if (locked)
>>>                  dma_resv_unlock(bo->base.resv);
>>>          ttm_bo_put(bo);
>>> +
>>> +       /* Don't break locking rules. */
>>> +       WARN_ON(ret == -EBUSY);
>>>          return ret;
>>>    }
>>>    
>>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c
>>> b/drivers/gpu/drm/ttm/ttm_device.c
>>> index 460953dcad11..eaa7487ae404 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>> @@ -143,14 +143,12 @@ int ttm_device_swapout(struct ttm_device
>>> *bdev, struct ttm_operation_ctx *ctx,
>>>    
>>>                  for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>>>                          list_for_each_entry(bo, &man->lru[j], lru)
>>> {
>>> -                               uint32_t num_pages;
>>> +                               pgoff_t num_pages;
>>>    
>>> -                               if (!bo->ttm ||
>>> -                                   bo->ttm->page_flags &
>>> TTM_PAGE_FLAG_SG ||
>>> -                                   bo->ttm->page_flags &
>>> TTM_PAGE_FLAG_SWAPPED)
>>> +                               if (!READ_ONCE(bo->ttm))
>>>                                          continue;
>>>    
>>> -                               num_pages = bo->ttm->num_pages;
>>> +                               num_pages = bo->base.size >>
>>> PAGE_SHIFT;
>>>                                  ret = ttm_bo_swapout(bo, ctx,
>>> gfp_flags);
>>>                                  /* ttm_bo_swapout has dropped the
>>> lru_lock */
>>>                                  if (!ret)
>


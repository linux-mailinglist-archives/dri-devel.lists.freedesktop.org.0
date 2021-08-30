Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781AA3FB19A
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 09:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFA5897C8;
	Mon, 30 Aug 2021 07:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243BA897C8;
 Mon, 30 Aug 2021 07:08:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="215096120"
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; d="scan'208";a="215096120"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 00:08:39 -0700
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; d="scan'208";a="509462961"
Received: from ahashmi-mobl.ger.corp.intel.com (HELO [10.249.254.89])
 ([10.249.254.89])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2021 00:08:37 -0700
Subject: Re: [Intel-gfx] [PATCH v10 03/11] drm/ttm: Add a generic TTM memcpy
 move for page-based iomem
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>, Ben Skeggs <skeggsb@gmail.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <20210602083818.241793-1-thomas.hellstrom@linux.intel.com>
 <20210602083818.241793-4-thomas.hellstrom@linux.intel.com>
 <CAPM=9twjYTME6CPuNmn3S7A_ACUNhMOAY1QcpoOqAZ5RHM6JzA@mail.gmail.com>
 <1c8ee7b0-97ef-0c04-8e92-ec6bdc56bd40@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <2cf9f7f2-386c-b201-92af-e052bb1b02c5@linux.intel.com>
Date: Mon, 30 Aug 2021 09:08:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1c8ee7b0-97ef-0c04-8e92-ec6bdc56bd40@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Hi!

On 8/30/21 8:16 AM, Christian König wrote:
> Am 30.08.21 um 03:54 schrieb Dave Airlie:
>> I've just been talking with Ben about nouveau having some issues since
>> this path,
>>
>> ttm_resource can be subclassed by drivers, and the code below that
>> copies ttm_resources around pretty much seems to destroy that.
>>
>>
>>> +       struct ttm_resource *src_mem = &bo->mem;
>>> +       struct ttm_resource_manager *src_man =
>>> +               ttm_manager_type(bdev, src_mem->mem_type);
>>> +       struct ttm_resource src_copy = *src_mem;
>> This here ^^
>
> Mhm, that's most likely a rebase/merge conflict between my change to 
> subclass ttm_resource which came in through the drm-misc-next tree and 
> Thomas change here.
>
> Thomas can you take a look?


Sure.

/Thomas




>
> Thanks,
> Christian.
>
>>
>>> +       union {
>>> +               struct ttm_kmap_iter_tt tt;
>>> +               struct ttm_kmap_iter_linear_io io;
>>> +       } _dst_iter, _src_iter;
>>> +       struct ttm_kmap_iter *dst_iter, *src_iter;
>>> +       int ret = 0;
>>>
>>> -       /*
>>> -        * TTM might be null for moves within the same region.
>>> -        */
>>> -       if (ttm) {
>>> +       if (ttm && ((ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) ||
>>> +                   dst_man->use_tt)) {
>>>                  ret = ttm_tt_populate(bdev, ttm, ctx);
>>>                  if (ret)
>>> -                       goto out1;
>>> +                       return ret;
>>>          }
>>>
>>> -       for (i = 0; i < new_mem->num_pages; ++i) {
>>> -               if (old_iomap == NULL) {
>>> -                       pgprot_t prot = ttm_io_prot(bo, old_mem, 
>>> PAGE_KERNEL);
>>> -                       ret = ttm_copy_ttm_io_page(ttm, new_iomap, i,
>>> -                                                  prot);
>>> -               } else if (new_iomap == NULL) {
>>> -                       pgprot_t prot = ttm_io_prot(bo, new_mem, 
>>> PAGE_KERNEL);
>>> -                       ret = ttm_copy_io_ttm_page(ttm, old_iomap, i,
>>> -                                                  prot);
>>> -               } else {
>>> -                       ret = ttm_copy_io_page(new_iomap, old_iomap, 
>>> i);
>>> -               }
>>> -               if (ret)
>>> -                       goto out1;
>>> +       dst_iter = ttm_kmap_iter_linear_io_init(&_dst_iter.io, bdev, 
>>> dst_mem);
>>> +       if (PTR_ERR(dst_iter) == -EINVAL && dst_man->use_tt)
>>> +               dst_iter = ttm_kmap_iter_tt_init(&_dst_iter.tt, 
>>> bo->ttm);
>>> +       if (IS_ERR(dst_iter))
>>> +               return PTR_ERR(dst_iter);
>>> +
>>> +       src_iter = ttm_kmap_iter_linear_io_init(&_src_iter.io, bdev, 
>>> src_mem);
>>> +       if (PTR_ERR(src_iter) == -EINVAL && src_man->use_tt)
>>> +               src_iter = ttm_kmap_iter_tt_init(&_src_iter.tt, 
>>> bo->ttm);
>>> +       if (IS_ERR(src_iter)) {
>>> +               ret = PTR_ERR(src_iter);
>>> +               goto out_src_iter;
>>>          }
>>> -       mb();
>>> -out2:
>>> -       old_copy = *old_mem;
>>>
>>> -       ttm_bo_assign_mem(bo, new_mem);
>>> -
>>> -       if (!man->use_tt)
>>> -               ttm_bo_tt_destroy(bo);
>>> +       ttm_move_memcpy(bo, dst_mem->num_pages, dst_iter, src_iter);
>>> +       src_copy = *src_mem;
>>> +       ttm_bo_move_sync_cleanup(bo, dst_mem);
>>>
>>> -out1:
>>> -       ttm_resource_iounmap(bdev, old_mem, new_iomap);
>>> -out:
>>> -       ttm_resource_iounmap(bdev, &old_copy, old_iomap);
>>> +       if (!src_iter->ops->maps_tt)
>>> + ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, &src_copy);
>> passes a copy into linear_io_fini which calls the driver io_mem_free
>> without the subclass data.
>>
>> Dave.
>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF5293B04A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 13:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D4410E687;
	Wed, 24 Jul 2024 11:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UJkwOauZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B56B10E681;
 Wed, 24 Jul 2024 11:20:37 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-427cede1e86so48587505e9.0; 
 Wed, 24 Jul 2024 04:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721820036; x=1722424836; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nNdTamP9uJYwt2/i6GENN/k4SvDeY1rwECtq82eyQW8=;
 b=UJkwOauZubYZlvXCu9xSsSwhznO/g1on51ZDySVSNUgXyxQYuOrSBg9BA0HivVYjO8
 18XtZOqnNWDkRzk9J51H6wRMdXZiu9gw9h6qkiNYtAmmmZX802La2Mn+4wnN5g3WAYLD
 7ri7Agj/2DmDtjDBSUNbGhHSybUqYz/hvgoGKncWY5y4h6afwRfMoWldmSnYLRhfkygC
 9gkuP+ZOIJAD1RYbnY91PwjCX4lnlHprdcrTL5XLejdAcWo8ONXXYHddniMFoUAS/d78
 ++Rb3NOI+622GMgu/H98ZUDohgkZY+cYtkGG4xjFdlD6Hhuddgkp3n+7zRNfy+Jo2uxx
 hmeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721820036; x=1722424836;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nNdTamP9uJYwt2/i6GENN/k4SvDeY1rwECtq82eyQW8=;
 b=qnonP3KVHmkz4nwxRcQnhfehDN37/KxuemEJX4/vBUjp26cxDjYXxm+lskcJMJAGd+
 0hHWqbSFSZhxa01lqli1HkCDb1DxvNicKb+PM+67f0jjlJmvDjD90LIMq5YYakwyjWt5
 ZepNbD8niiRGco5ZxD9FR4FbsaJU1I1PubZJMEHLxnMED2VMxo6cCwOF2kk2EubrXATu
 nOCXtOX7yciLNY2HIMfBiwiGpYdCsfMGsigPWmOgth8Q+O9BAONKDXatZa5bHJLHVI4I
 y6DfKxpDB+MWs+KOQ89IIBeeThAQto/5ep96Af+hv6ZJv6tpr5IqGsvPucYjC4Dvlcp8
 7hDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvL7xdl9Y8qqFYC2WUHajioWMs9vy+OYTYla1m8QnCF9g9c0A3JMnKxLWAX4ImK+55kutLFMFPYzAle0zQwBAcac6cY/6BMyVxpe8Sscz0wtexZmXcooXdPNwZ6sq8sxuKw7WqAteXbkO1MUgocvwvvRdbw8A8z104qrFt5aQyczxbp0b/If2/S8gBowBzAw==
X-Gm-Message-State: AOJu0YzFzcawGZ527UDZOmDwTqEhKrpZ+yvs3IQLLSuxc/g2bYDpfgSx
 3sflKDgOhvCG2/hxvG/qFttuP5tqjoQofTk4qgFJqZhLeTYAkVKQ
X-Google-Smtp-Source: AGHT+IHlaz5FL7JOm1JJvHeehtML6Qz03BDK57S+Bama5lK0m9I3Rc/C2E5F2LGTln62iteaOtX6WA==
X-Received: by 2002:a05:600c:a41:b0:426:5fbe:bf75 with SMTP id
 5b1f17b1804b1-427e29d420emr83471095e9.23.1721820035416; 
 Wed, 24 Jul 2024 04:20:35 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f93594e7sm26047615e9.8.2024.07.24.04.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 04:20:35 -0700 (PDT)
Message-ID: <2896bb99-a39f-4e6f-8f73-10e36249d5c1@gmail.com>
Date: Wed, 24 Jul 2024 13:20:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] drm/buddy: Add start address support to trim
 function
To: Matthew Auld <matthew.auld@intel.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <maraeo@gmail.com>
Cc: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 "Min, Frank" <frank.min@amd.com>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <marek.olsak@amd.com>
References: <20240723132525.31294-1-Arunpravin.PaneerSelvam@amd.com>
 <0de0d6fa-64f0-4ada-89c3-c188a7ae36f8@amd.com>
 <f23ebf02-b67c-4bc6-9244-730edd49fa98@intel.com>
 <CAAxE2A57f0DwdzWF2qk1U2HA8d3pN=8CqQaKFVihcmxXdUu3Vw@mail.gmail.com>
 <62b7fbb7-e47b-411a-b554-73f5d82cb8d8@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <62b7fbb7-e47b-411a-b554-73f5d82cb8d8@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Am 24.07.24 um 11:37 schrieb Matthew Auld:
> On 24/07/2024 02:35, Marek Olšák wrote:
>> The reason is that our DCC requires 768K alignment in some cases. I 
>> haven't read this patch series, but one way to do that is to align to 
>> 256K, overallocate by 512K, and then not use either 0, 256K, or 512K 
>> at the beginning to get to 768K alignment.
>
> Ah, so we need a non power-of-two alignment. That makes sense, thanks.

Well actually the requirement is that memory reads for scanout needs to 
be distributed over the memory channels in a certain way.

Our hw guys just expressed that as a rather strange non-power of two 
alignment :)

Christian.

>
>>
>> Marek
>>
>> On Tue, Jul 23, 2024, 11:04 Matthew Auld <matthew.auld@intel.com 
>> <mailto:matthew.auld@intel.com>> wrote:
>>
>>     On 23/07/2024 14:43, Paneer Selvam, Arunpravin wrote:
>>      > Hi Matthew,
>>      >
>>      > Can we push this version for now as we need to mainline the DCC
>>     changes
>>      > ASAP,
>>      > while we continue our discussion and proceed to implement the
>>     permanent
>>      > solution
>>      > for address alignment?
>>
>>     Yeah, we can always merge now and circle back around later, if 
>> this for
>>     sure helps your usecase and is needed asap. I just didn't fully 
>> get the
>>     idea for needing this interface, but likely I am missing something.
>>
>>      >
>>      > Thanks,
>>      > Arun.
>>      >
>>      > On 7/23/2024 6:55 PM, Arunpravin Paneer Selvam wrote:
>>      >> - Add a new start parameter in trim function to specify exact
>>      >>    address from where to start the trimming. This would help us
>>      >>    in situations like if drivers would like to do address 
>> alignment
>>      >>    for specific requirements.
>>      >>
>>      >> - Add a new flag DRM_BUDDY_TRIM_DISABLE. Drivers can use this
>>      >>    flag to disable the allocator trimming part. This patch 
>> enables
>>      >>    the drivers control trimming and they can do it themselves
>>      >>    based on the application requirements.
>>      >>
>>      >> v1:(Matthew)
>>      >>    - check new_start alignment with min chunk_size
>>      >>    - use range_overflows()
>>      >>
>>      >> Signed-off-by: Arunpravin Paneer Selvam
>>     <Arunpravin.PaneerSelvam@amd.com
>>     <mailto:Arunpravin.PaneerSelvam@amd.com>>
>>      >> Acked-by: Alex Deucher <alexander.deucher@amd.com
>>     <mailto:alexander.deucher@amd.com>>
>>      >> Acked-by: Christian König <christian.koenig@amd.com
>>     <mailto:christian.koenig@amd.com>>
>>      >> ---
>>      >>   drivers/gpu/drm/drm_buddy.c          | 25
>>     +++++++++++++++++++++++--
>>      >>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  2 +-
>>      >>   include/drm/drm_buddy.h              |  2 ++
>>      >>   3 files changed, 26 insertions(+), 3 deletions(-)
>>      >>
>>      >> diff --git a/drivers/gpu/drm/drm_buddy.c
>>     b/drivers/gpu/drm/drm_buddy.c
>>      >> index 6a8e45e9d0ec..103c185bb1c8 100644
>>      >> --- a/drivers/gpu/drm/drm_buddy.c
>>      >> +++ b/drivers/gpu/drm/drm_buddy.c
>>      >> @@ -851,6 +851,7 @@ static int __alloc_contig_try_harder(struct
>>      >> drm_buddy *mm,
>>      >>    * drm_buddy_block_trim - free unused pages
>>      >>    *
>>      >>    * @mm: DRM buddy manager
>>      >> + * @start: start address to begin the trimming.
>>      >>    * @new_size: original size requested
>>      >>    * @blocks: Input and output list of allocated blocks.
>>      >>    * MUST contain single block as input to be trimmed.
>>      >> @@ -866,11 +867,13 @@ static int 
>> __alloc_contig_try_harder(struct
>>      >> drm_buddy *mm,
>>      >>    * 0 on success, error code on failure.
>>      >>    */
>>      >>   int drm_buddy_block_trim(struct drm_buddy *mm,
>>      >> +             u64 *start,
>>      >>                u64 new_size,
>>      >>                struct list_head *blocks)
>>      >>   {
>>      >>       struct drm_buddy_block *parent;
>>      >>       struct drm_buddy_block *block;
>>      >> +    u64 block_start, block_end;
>>      >>       LIST_HEAD(dfs);
>>      >>       u64 new_start;
>>      >>       int err;
>>      >> @@ -882,6 +885,9 @@ int drm_buddy_block_trim(struct drm_buddy 
>> *mm,
>>      >>                    struct drm_buddy_block,
>>      >>                    link);
>>      >> +    block_start = drm_buddy_block_offset(block);
>>      >> +    block_end = block_start + drm_buddy_block_size(mm, block);
>>      >> +
>>      >>       if (WARN_ON(!drm_buddy_block_is_allocated(block)))
>>      >>           return -EINVAL;
>>      >> @@ -894,6 +900,20 @@ int drm_buddy_block_trim(struct 
>> drm_buddy *mm,
>>      >>       if (new_size == drm_buddy_block_size(mm, block))
>>      >>           return 0;
>>      >> +    new_start = block_start;
>>      >> +    if (start) {
>>      >> +        new_start = *start;
>>      >> +
>>      >> +        if (new_start < block_start)
>>      >> +            return -EINVAL;
>>      >> +
>>      >> +        if (!IS_ALIGNED(new_start, mm->chunk_size))
>>      >> +            return -EINVAL;
>>      >> +
>>      >> +        if (range_overflows(new_start, new_size, block_end))
>>      >> +            return -EINVAL;
>>      >> +    }
>>      >> +
>>      >>       list_del(&block->link);
>>      >>       mark_free(mm, block);
>>      >>       mm->avail += drm_buddy_block_size(mm, block);
>>      >> @@ -904,7 +924,6 @@ int drm_buddy_block_trim(struct drm_buddy 
>> *mm,
>>      >>       parent = block->parent;
>>      >>       block->parent = NULL;
>>      >> -    new_start = drm_buddy_block_offset(block);
>>      >>       list_add(&block->tmp_link, &dfs);
>>      >>       err =  __alloc_range(mm, &dfs, new_start, new_size,
>>     blocks, NULL);
>>      >>       if (err) {
>>      >> @@ -1066,7 +1085,8 @@ int drm_buddy_alloc_blocks(struct
>>     drm_buddy *mm,
>>      >>       } while (1);
>>      >>       /* Trim the allocated block to the required size */
>>      >> -    if (original_size != size) {
>>      >> +    if (!(flags & DRM_BUDDY_TRIM_DISABLE) &&
>>      >> +        original_size != size) {
>>      >>           struct list_head *trim_list;
>>      >>           LIST_HEAD(temp);
>>      >>           u64 trim_size;
>>      >> @@ -1083,6 +1103,7 @@ int drm_buddy_alloc_blocks(struct
>>     drm_buddy *mm,
>>      >>           }
>>      >>           drm_buddy_block_trim(mm,
>>      >> +                     NULL,
>>      >>                        trim_size,
>>      >>                        trim_list);
>>      >> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>      >> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>      >> index fe3779fdba2c..423b261ea743 100644
>>      >> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>      >> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>      >> @@ -150,7 +150,7 @@ static int xe_ttm_vram_mgr_new(struct
>>      >> ttm_resource_manager *man,
>>      >>       } while (remaining_size);
>>      >>       if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>>      >> -        if (!drm_buddy_block_trim(mm, vres->base.size,
>>     &vres->blocks))
>>      >> +        if (!drm_buddy_block_trim(mm, NULL, vres->base.size,
>>      >> &vres->blocks))
>>      >>               size = vres->base.size;
>>      >>       }
>>      >> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>>      >> index 2a74fa9d0ce5..9689a7c5dd36 100644
>>      >> --- a/include/drm/drm_buddy.h
>>      >> +++ b/include/drm/drm_buddy.h
>>      >> @@ -27,6 +27,7 @@
>>      >>   #define DRM_BUDDY_CONTIGUOUS_ALLOCATION BIT(2)
>>      >>   #define DRM_BUDDY_CLEAR_ALLOCATION        BIT(3)
>>      >>   #define DRM_BUDDY_CLEARED            BIT(4)
>>      >> +#define DRM_BUDDY_TRIM_DISABLE            BIT(5)
>>      >>   struct drm_buddy_block {
>>      >>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>      >> @@ -155,6 +156,7 @@ int drm_buddy_alloc_blocks(struct 
>> drm_buddy *mm,
>>      >>                  unsigned long flags);
>>      >>   int drm_buddy_block_trim(struct drm_buddy *mm,
>>      >> +             u64 *start,
>>      >>                u64 new_size,
>>      >>                struct list_head *blocks);
>>      >>
>>      >> base-commit: b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b
>>      >
>>


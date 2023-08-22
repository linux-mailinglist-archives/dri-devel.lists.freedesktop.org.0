Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 425EF783B36
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 09:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE37F10E031;
	Tue, 22 Aug 2023 07:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F80A10E031
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 07:54:36 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-68781a69befso727252b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 00:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1692690876; x=1693295676;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=f4jgfORi8SmWQDQbZiOec8xn7xqyqjppzAhLAq8G/jM=;
 b=SOneL3NtXO9oBFlq98JcoX4t3EnesJboldSnWumz5DiUkBnpG7CqEL1eKt5K9rqcA2
 U3RRuLkwT/GCIUVInlzMYcDj50xv/uxs2qyBQzzhPTYMtkXg2PqKFlKcIAWegMjhGkJZ
 +fKZaiHC6mfcqYHxcipesaABAxYak2/MZ+QrJr3V6cvvZyagkXZ1QARSjdPbn3ezO8GR
 DM/xTyQvFqdpZfQWlB4kjX8ZI5jxXRK08bUzQm7S1Pr0J54SUbds0ZKp7eHCmdt5Dn0n
 NGugvmaAkNnFAW1NpNnaUcyir+eJIXKp9n7vk7+IuTaAiuOSGyKdmnu+jJCHneFWcinO
 cGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692690876; x=1693295676;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f4jgfORi8SmWQDQbZiOec8xn7xqyqjppzAhLAq8G/jM=;
 b=b9z0h2iSR01Ofb9WzNWSzbn7cKueQJQXfsWKtA3hpIOdOr5kVeHsYq3tu3IP+m5Z+I
 JWKtQSuwDEDw53fl08mBRsynTKxwOPINZ9WBYHHa9HRTKq/EkNCRG9JfqRqcTDCDG8HU
 9LUggcw3qDI7N1q9ch9ewaifXgjfYwKRwP3y+MhJV01ql4n0tmL/00EsGmuOH7Gqyl1L
 MPgX96169GmNgYllwJqkLTQVj7AiJiH75O1IQyb6QFoYyDaBfaSvhoUxt6PSGGUj2cid
 ZFYUd1eFPsC+5Y1X8zCsRRad1RZwLIwIAv8yKwWnT2ceOLSa+z4ij5cnihcFHJOFIeHp
 magQ==
X-Gm-Message-State: AOJu0YxGmYahvRG8vLU0ZbRiZ4losJ3tQa1+ATWzeigmay3vU2wGUxiM
 FtknLzWFbXr+OZuGFnc0TLr9sA==
X-Google-Smtp-Source: AGHT+IGcQ/Vaoo9QWtXIDxo0cmgc5wb+yjqs29/LxRS2cKLFil77dp/RF48DaAlmNeNv2ExX4nw11A==
X-Received: by 2002:a05:6a21:788a:b0:13a:3649:dc1a with SMTP id
 bf10-20020a056a21788a00b0013a3649dc1amr12492491pzc.0.1692690875899; 
 Tue, 22 Aug 2023 00:54:35 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a170902a3c600b001bbdd44bbb6sm8506831plb.136.2023.08.22.00.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 00:54:35 -0700 (PDT)
Message-ID: <c6f933ee-751f-def1-31f6-0940e2ee0108@bytedance.com>
Date: Tue, 22 Aug 2023 15:54:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH v2 0/5] use refcount+RCU method to implement lockless slab
 shrink (part 1)
Content-Language: en-US
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev, joel@joelfernandes.org,
 christian.koenig@amd.com
References: <20230817112402.77010-1-zhengqi.arch@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230817112402.77010-1-zhengqi.arch@bytedance.com>
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
Cc: linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 Qi Zheng <zhengqi.arch@bytedance.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023/8/17 19:23, Qi Zheng wrote:
> Hi all,
> 
> To make reviewing and updating easier, I've chosen to split the previous
> patchset[1] into the following three parts:
> 
> part 1: some cleanups and preparations
> part 2: introduce new APIs and convert all shrinnkers to use these
> part 3: implement lockless slab shrink
> 
> This series is the part 1 and is based on the next-20230815.
> 
> Comments and suggestions are welcome.
> 
> [1]. https://lore.kernel.org/lkml/20230807110936.21819-1-zhengqi.arch@bytedance.com/
> 
> Thanks,
> Qi
> 
> Changlog in part 1 v1 -> part 1 v2:
>   - fix compilation warning in [PATCH 1/5]
>   - rename synchronize_shrinkers() to ttm_pool_synchronize_shrinkers()
>     (pointed by Christian König)
>   - collect Reviewed-by
> 
> Changlog in v4 -> part 1 v1:
>   - split from the previous large patchset
>   - fix comment format in [PATCH v4 01/48] (pointed by Muchun Song)
>   - change to use kzalloc_node() and fix typo in [PATCH v4 44/48]
>     (pointed by Dave Chinner)
>   - collect Reviewed-bys
>   - rebase onto the next-20230815

Hi all,

Any more comments and suggestions for this part 1? Or can this part
be merged first (just some cleanups and preparations)? Or should I
post the part 2 and part 3 first for everyone to review together?

Either one is fine for me. :)

Thanks,
Qi

> 
> Qi Zheng (5):
>    mm: move some shrinker-related function declarations to mm/internal.h
>    mm: vmscan: move shrinker-related code into a separate file
>    mm: shrinker: remove redundant shrinker_rwsem in debugfs operations
>    drm/ttm: introduce pool_shrink_rwsem
>    mm: shrinker: add a secondary array for shrinker_info::{map,
>      nr_deferred}
> 
>   drivers/gpu/drm/ttm/ttm_pool.c |  17 +-
>   include/linux/memcontrol.h     |  12 +-
>   include/linux/shrinker.h       |  37 +-
>   mm/Makefile                    |   4 +-
>   mm/internal.h                  |  28 ++
>   mm/shrinker.c                  | 751 +++++++++++++++++++++++++++++++++
>   mm/shrinker_debug.c            |  18 +-
>   mm/vmscan.c                    | 701 ------------------------------
>   8 files changed, 818 insertions(+), 750 deletions(-)
>   create mode 100644 mm/shrinker.c
> 

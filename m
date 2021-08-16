Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A2A3ED1FE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 12:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA32789830;
	Mon, 16 Aug 2021 10:31:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B4D898CE;
 Mon, 16 Aug 2021 10:31:29 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 mq2-20020a17090b3802b0290178911d298bso26763944pjb.1; 
 Mon, 16 Aug 2021 03:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ccX+otJKzYiw7fTpASq5EiKmXI5wu1oM2Rkshyanugg=;
 b=nyTjql4kPU5b2tlliqQClzMia17+fqOan4LwezfDCn5/sGGbjPNeN6UdQ602MiLmVS
 yRdL5HwSNqxX3TLwsbGgi1lkq5yoZapTrurxpvYwULnFJ+gBBw23X3lri9m096BgDT//
 IKposJALqA9eUslVUf0jlBwS/RXtBzOUApWV+mV6x54TX3w2wIDBL8y/bixUv3TDGLkh
 ighUtLEpkT1PzcFgJuxUHLVrwA0kmYRY/yFPoIiNLH35qyj6sNMT+0/CWqALrtkrCkUF
 PoqiSd/WVIQT+61eYpyy7yVLmNbqV346PvlJ1Y3xjC52QVqGblfnU+7olmsm/vtjEadr
 qy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ccX+otJKzYiw7fTpASq5EiKmXI5wu1oM2Rkshyanugg=;
 b=d2uzAjV231RyQ8tbPCI5+Au389kbGa4PgXZoC+pUJrJ5tBxjI90hf2lA26q+MpNCLP
 trvazXJVGiUayC8051+TVzaj/CZ5G30WWuoxnZxZBCkr2CcePZLUF1vj5Dwsu9oIn1nD
 FACsSReSGsYQC6LbzlvgwNG+XyD8l0zDggGisC1ZQb/GgklQthAXzPk2JMJate2uwpEC
 decV2X2BE0hdYnHmCnkBPStoPqFcyiOUEw+c9sSJ+5Fxwjm+PM/IiqkDBlaFCaQRRYIT
 WbVk80eTTbM+mFY9wtL0z2uHz7ybJO32/fCT8Gll1U9qlKeZIBAixaCgasmf8Id4ylp/
 YVjw==
X-Gm-Message-State: AOAM530CXaUkRb9CR3ktuNenpHyKNZUzErnt5lK5cE73InWZA3oMNi3m
 B/WFlhZEKOqxcFjKzwTeJSk=
X-Google-Smtp-Source: ABdhPJw/StLL2fZrdUNp2CW5UwXdwfF+A7iXrh+hhQZgPdXKrA2dAk8JDe77PoSA4AlMAWZTB6qcTQ==
X-Received: by 2002:a63:111f:: with SMTP id g31mr15459522pgl.80.1629109888650; 
 Mon, 16 Aug 2021 03:31:28 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id f137sm10813481pfa.160.2021.08.16.03.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 03:31:28 -0700 (PDT)
Subject: Re: [PATCH v2] drm: avoid races with modesetting rights
To: Daniel Vetter <daniel@ffwll.ch>
Cc: kernel test robot <lkp@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@linux.ie>, kbuild-all@lists.01.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20210815153740.195330-1-desmondcheongzx@gmail.com>
 <202108160208.ONHHWxXy-lkp@intel.com>
 <f88fe698-b40c-b309-96c2-32b314280aad@gmail.com>
 <CAKMK7uEWMjaDEuMpc1__EwD5rpaouJ-dhahQBEQ5rsBz3VV=qg@mail.gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <3a5ffd83-3d91-73dc-0cae-e822ba381b2b@gmail.com>
Date: Mon, 16 Aug 2021 18:31:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEWMjaDEuMpc1__EwD5rpaouJ-dhahQBEQ5rsBz3VV=qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 16/8/21 5:04 pm, Daniel Vetter wrote:
> On Mon, Aug 16, 2021 at 10:53 AM Desmond Cheong Zhi Xi
> <desmondcheongzx@gmail.com> wrote:
>> On 16/8/21 2:47 am, kernel test robot wrote:
>>> Hi Desmond,
>>>
>>> Thank you for the patch! Yet something to improve:
>>>
>>> [auto build test ERROR on next-20210813]
>>> [also build test ERROR on v5.14-rc5]
>>> [cannot apply to linus/master v5.14-rc5 v5.14-rc4 v5.14-rc3]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch]
>>>
>>> url:    https://github.com/0day-ci/linux/commits/Desmond-Cheong-Zhi-Xi/drm-avoid-races-with-modesetting-rights/20210815-234145
>>> base:    4b358aabb93a2c654cd1dcab1a25a589f6e2b153
>>> config: i386-randconfig-a004-20210815 (attached as .config)
>>> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
>>> reproduce (this is a W=1 build):
>>>           # https://github.com/0day-ci/linux/commit/cf6d8354b7d7953cd866fad004cbb189adfa074f
>>>           git remote add linux-review https://github.com/0day-ci/linux
>>>           git fetch --no-tags linux-review Desmond-Cheong-Zhi-Xi/drm-avoid-races-with-modesetting-rights/20210815-234145
>>>           git checkout cf6d8354b7d7953cd866fad004cbb189adfa074f
>>>           # save the attached .config to linux build tree
>>>           make W=1 ARCH=i386
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>>
>>>>> ERROR: modpost: "task_work_add" [drivers/gpu/drm/drm.ko] undefined!
>>>
>>
>> I'm a bit uncertain about this. Looking into the .config used, this
>> error seems to happen because task_work_add isn't an exported symbol,
>> but DRM is being compiled as a loadable kernel module (CONFIG_DRM=m).
>>
>> One way to deal with this is to export the symbol, but there was a
>> proposed patch to do this a few months back that wasn't picked up [1],
>> so I'm not sure what to make of this.
>>
>> I'll export the symbol as part of a v3 series, and check in with the
>> task-work maintainers.
>>
>> Link:
>> https://lore.kernel.org/lkml/20210127150029.13766-3-joshi.k@samsung.com/ [1]
> 
> Yeah that sounds best. I have two more thoughts on the patch:
> - drm_master_flush isn't used by any modules outside of drm.ko, so we
> can unexport it and drop the kerneldoc (the comment is still good).
> These kind of internal functions have their declaration in
> drm-internal.h - there's already a few there from drm_auth.c
> 

Sounds good, I'll do that and move the declaration from drm_auth.h to 
drm_internal.h.

> - We know have 3 locks for master state, that feels a bit like
> overkill. The spinlock I think we need to keep due to lock inversions,
> but the master_mutex and master_rwsem look like we should be able to
> merge them? I.e. anywhere we currently grab the master_mutex we could
> instead grab the rwsem in either write mode (when we change stuff) or
> read mode (when we just check, like in master_internal_acquire).
> 
> Thoughts?
> -Daniel
> 

Using rwsem in the places where we currently hold the mutex seems pretty 
doable.

There are some tricky bits once we add rwsem read locks to the ioctl 
handler. Some ioctl functions like drm_authmagic need a write lock.

In this particular case, it might make sense to break master_mutex down 
into finer-grained locks, since the function doesn't change master 
permissions. It just needs to prevent concurrent writes to the 
drm_master.magic_map idr.

For other ioctls, I'll take a closer look on a case-by-case basis.

>>
>>> ---
>>> 0-DAY CI Kernel Test Service, Intel Corporation
>>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>>>
>>
> 
> 


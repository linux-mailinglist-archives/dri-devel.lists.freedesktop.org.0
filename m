Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 905CC3ED73A
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 15:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EF689EBD;
	Mon, 16 Aug 2021 13:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B2189EA6;
 Mon, 16 Aug 2021 13:30:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="215588162"
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="215588162"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 06:30:52 -0700
X-IronPort-AV: E=Sophos;i="5.84,326,1620716400"; d="scan'208";a="519655235"
Received: from yifeiren-mobl.ccr.corp.intel.com (HELO [10.249.254.101])
 ([10.249.254.101])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2021 06:30:51 -0700
Subject: Re: [PATCH] drm/i915: Ditch the i915_gem_ww_ctx loop member
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20210816084855.75586-1-thomas.hellstrom@linux.intel.com>
 <CAM0jSHPLAtyYofaLzMsrPsyLX=13UAfw3tzbAQoW+F5+XJgrfQ@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ffc6a66a-555f-9c39-4131-90dc33395f23@linux.intel.com>
Date: Mon, 16 Aug 2021 15:30:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAM0jSHPLAtyYofaLzMsrPsyLX=13UAfw3tzbAQoW+F5+XJgrfQ@mail.gmail.com>
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


On 8/16/21 3:25 PM, Matthew Auld wrote:
> On Mon, 16 Aug 2021 at 09:49, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> It's only used by the for_i915_gem_ww() macro and we can use
>> the (typically) on-stack _err variable in its place.
>>
>> While initially setting the _err variable to -EDEADLK to enter the
>> loop, we clear it before actually entering using fetch_and_zero() to
>> avoid empty loops or code not setting the _err variable running forever.
>>
>> Suggested-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_gem_ww.h | 23 ++++++++---------------
>>   1 file changed, 8 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_gem_ww.h b/drivers/gpu/drm/i915/i915_gem_ww.h
>> index f6b1a796667b..98348b1e6182 100644
>> --- a/drivers/gpu/drm/i915/i915_gem_ww.h
>> +++ b/drivers/gpu/drm/i915/i915_gem_ww.h
>> @@ -7,12 +7,13 @@
>>
>>   #include <drm/drm_drv.h>
>>
>> +#include "i915_utils.h"
>> +
>>   struct i915_gem_ww_ctx {
>>          struct ww_acquire_ctx ctx;
>>          struct list_head obj_list;
>>          struct drm_i915_gem_object *contended;
>> -       unsigned short intr;
>> -       unsigned short loop;
>> +       bool intr;
>>   };
>>
>>   void i915_gem_ww_ctx_init(struct i915_gem_ww_ctx *ctx, bool intr);
>> @@ -23,28 +24,20 @@ void i915_gem_ww_unlock_single(struct drm_i915_gem_object *obj);
>>   /* Internal functions used by the inlines! Don't use. */
>>   static inline int __i915_gem_ww_fini(struct i915_gem_ww_ctx *ww, int err)
>>   {
>> -       ww->loop = 0;
>>          if (err == -EDEADLK) {
>>                  err = i915_gem_ww_ctx_backoff(ww);
>>                  if (!err)
>> -                       ww->loop = 1;
>> +                       err = -EDEADLK;
>>          }
>>
>> -       if (!ww->loop)
>> +       if (err != -EDEADLK)
>>                  i915_gem_ww_ctx_fini(ww);
>>
>>          return err;
>>   }
>>
>> -static inline void
>> -__i915_gem_ww_init(struct i915_gem_ww_ctx *ww, bool intr)
>> -{
>> -       i915_gem_ww_ctx_init(ww, intr);
>> -       ww->loop = 1;
>> -}
>> -
>> -#define for_i915_gem_ww(_ww, _err, _intr)                      \
>> -       for (__i915_gem_ww_init(_ww, _intr); (_ww)->loop;       \
>> +#define for_i915_gem_ww(_ww, _err, _intr)                        \
>> +       for (i915_gem_ww_ctx_init(_ww, _intr), (_err) = -EDEADLK; \
>> +            fetch_and_zero(&_err) == -EDEADLK;                   \
> Doesn't this now hide "normal" errors, like say get_pages() returning
> -ENOSPC or so?

Yes, good catch. We should either just clear the -EDEADLK case, or not 
clear the error at all..

/Thomas




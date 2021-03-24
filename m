Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 720643474AE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 10:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 247F36E998;
	Wed, 24 Mar 2021 09:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A731E6E96F;
 Wed, 24 Mar 2021 09:31:30 +0000 (UTC)
IronPort-SDR: hd/hJc4lFZhqIx7TCKrOsJkfOE38LRhhLKrruHIm4ddJTFg2nGXD50h4unR2s2ro8jjO0SJkJp
 EG9k/M4xMYbg==
X-IronPort-AV: E=McAfee;i="6000,8403,9932"; a="190763690"
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="190763690"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 02:31:29 -0700
IronPort-SDR: osiqi2rKkXCRXZhXogspV95daKSdAijpnuKsZ+nz+s8FyR7oI2YV8z7WIlChCAqAdakOcpkCH1
 dPoFmCpsTDvw==
X-IronPort-AV: E=Sophos;i="5.81,274,1610438400"; d="scan'208";a="408759122"
Received: from gluca-mobl.ger.corp.intel.com (HELO [10.252.39.217])
 ([10.252.39.217])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2021 02:31:28 -0700
Subject: Re: [Intel-gfx] [PATCH v9 68/70] drm/i915: Pass ww ctx to pin_map
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
 <20210323155059.628690-69-maarten.lankhorst@linux.intel.com>
 <CAM0jSHPL44qRd7dybPmmEz-8pr8xS0d9VXhRYm8iNj3YyX7h-A@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <79e6f35b-0df6-0f45-e349-8f49529f7382@linux.intel.com>
Date: Wed, 24 Mar 2021 10:31:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAM0jSHPL44qRd7dybPmmEz-8pr8xS0d9VXhRYm8iNj3YyX7h-A@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 23-03-2021 om 18:30 schreef Matthew Auld:
> On Tue, 23 Mar 2021 at 15:51, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>> This will allow us to explicitly pass the ww to pin_pages,
>> when it starts taking it.
>>
>> This allows us to finally kill off the explicit passing of ww
>> by retrieving it from the obj.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  7 ++++---
>>  drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
>>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  1 +
>>  .../gpu/drm/i915/gem/i915_gem_object_blt.c    |  4 ++--
>>  drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 21 +++++++++++++++----
>>  .../drm/i915/gem/selftests/i915_gem_context.c |  8 ++++---
>>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  |  2 +-
>>  drivers/gpu/drm/i915/gt/gen7_renderclear.c    |  2 +-
>>  drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  2 +-
>>  drivers/gpu/drm/i915/gt/intel_engine_pm.c     |  2 +-
>>  drivers/gpu/drm/i915/gt/intel_lrc.c           |  4 ++--
>>  drivers/gpu/drm/i915/gt/intel_renderstate.c   |  2 +-
>>  drivers/gpu/drm/i915/gt/intel_ring.c          |  2 +-
>>  .../gpu/drm/i915/gt/intel_ring_submission.c   |  2 +-
>>  drivers/gpu/drm/i915/gt/intel_timeline.c      |  7 ++++---
>>  drivers/gpu/drm/i915/gt/intel_timeline.h      |  3 ++-
>>  drivers/gpu/drm/i915/gt/intel_workarounds.c   |  2 +-
>>  drivers/gpu/drm/i915/gt/mock_engine.c         |  2 +-
>>  drivers/gpu/drm/i915/gt/selftest_lrc.c        |  2 +-
>>  drivers/gpu/drm/i915/gt/selftest_rps.c        | 10 ++++-----
>>  .../gpu/drm/i915/gt/selftest_workarounds.c    |  6 +++---
>>  drivers/gpu/drm/i915/gvt/cmd_parser.c         |  4 ++--
>>  drivers/gpu/drm/i915/i915_perf.c              |  4 ++--
>>  drivers/gpu/drm/i915/selftests/igt_spinner.c  |  2 +-
>>  24 files changed, 60 insertions(+), 43 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> index dcfcae9c841b..73dd2a7673f5 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>> @@ -1340,7 +1340,7 @@ static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
>>         if (err)
>>                 goto err_pool;
>>
>> -       cmd = i915_gem_object_pin_map(pool->obj, pool->type);
>> +       cmd = i915_gem_object_pin_map(pool->obj, &eb->ww, pool->type);
>>         if (IS_ERR(cmd)) {
>>                 err = PTR_ERR(cmd);
>>                 goto err_pool;
>> @@ -2489,7 +2489,8 @@ static int eb_parse_pipeline(struct i915_execbuffer *eb,
>>                         goto err_shadow;
>>         }
>>
>> -       pw->shadow_map = i915_gem_object_pin_map(shadow->obj, I915_MAP_WB);
>> +       pw->shadow_map = i915_gem_object_pin_map(shadow->obj, &eb->ww,
>> +                                                I915_MAP_WB);
>>         if (IS_ERR(pw->shadow_map)) {
>>                 err = PTR_ERR(pw->shadow_map);
>>                 goto err_trampoline;
>> @@ -2500,7 +2501,7 @@ static int eb_parse_pipeline(struct i915_execbuffer *eb,
>>
>>         pw->batch_map = ERR_PTR(-ENODEV);
>>         if (needs_clflush && i915_has_memcpy_from_wc())
>> -               pw->batch_map = i915_gem_object_pin_map(batch, I915_MAP_WC);
>> +               pw->batch_map = i915_gem_object_pin_map(batch, &eb->ww, I915_MAP_WC);
>>
>>         if (IS_ERR(pw->batch_map)) {
>>                 err = i915_gem_object_pin_pages(batch);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> index 2561a2f1e54f..edac8ee3be9a 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
>> @@ -439,7 +439,7 @@ vm_access(struct vm_area_struct *area, unsigned long addr,
>>                 goto out;
>>
>>         /* As this is primarily for debugging, let's focus on simplicity */
>> -       vaddr = i915_gem_object_pin_map(obj, I915_MAP_FORCE_WC);
>> +       vaddr = i915_gem_object_pin_map(obj, &ww, I915_MAP_FORCE_WC);
>>         if (IS_ERR(vaddr)) {
>>                 err = PTR_ERR(vaddr);
>>                 goto out;
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> index 1a8ec4035112..9bd9b47dcc8d 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>> @@ -450,6 +450,7 @@ void i915_gem_object_writeback(struct drm_i915_gem_object *obj);
>>   * ERR_PTR() on error.
>>   */
>>  void *__must_check i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>> +                                          struct i915_gem_ww_ctx *ww,
>>                                            enum i915_map_type type);
>>
>>  void *__must_check i915_gem_object_pin_map_unlocked(struct drm_i915_gem_object *obj,
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c b/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
>> index df8e8c18c6c9..fae18622d2da 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
>> @@ -58,7 +58,7 @@ struct i915_vma *intel_emit_vma_fill_blt(struct intel_context *ce,
>>         /* we pinned the pool, mark it as such */
>>         intel_gt_buffer_pool_mark_used(pool);
>>
>> -       cmd = i915_gem_object_pin_map(pool->obj, pool->type);
>> +       cmd = i915_gem_object_pin_map(pool->obj, ww, pool->type);
>>         if (IS_ERR(cmd)) {
>>                 err = PTR_ERR(cmd);
>>                 goto out_unpin;
>> @@ -283,7 +283,7 @@ struct i915_vma *intel_emit_vma_copy_blt(struct intel_context *ce,
>>         /* we pinned the pool, mark it as such */
>>         intel_gt_buffer_pool_mark_used(pool);
>>
>> -       cmd = i915_gem_object_pin_map(pool->obj, pool->type);
>> +       cmd = i915_gem_object_pin_map(pool->obj, ww, pool->type);
>>         if (IS_ERR(cmd)) {
>>                 err = PTR_ERR(cmd);
>>                 goto out_unpin;
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> index 58e222030e10..232832398457 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
>> @@ -341,6 +341,7 @@ static void *i915_gem_object_map_pfn(struct drm_i915_gem_object *obj,
>>
>>  /* get, pin, and map the pages of the object into kernel space */
>>  void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>> +                             struct i915_gem_ww_ctx *ww,
>>                               enum i915_map_type type)
>>  {
>>         enum i915_map_type has_type;
>> @@ -408,13 +409,25 @@ void *i915_gem_object_pin_map(struct drm_i915_gem_object *obj,
>>  void *i915_gem_object_pin_map_unlocked(struct drm_i915_gem_object *obj,
>>                                        enum i915_map_type type)
>>  {
>> +       struct i915_gem_ww_ctx ww;
>>         void *ret;
>> +       int err;
>>
>> -       i915_gem_object_lock(obj, NULL);
>> -       ret = i915_gem_object_pin_map(obj, type);
>> -       i915_gem_object_unlock(obj);
>> +       i915_gem_ww_ctx_init(&ww, true);
>> +retry:
>> +       err = i915_gem_object_lock(obj, &ww);
>> +       if (!err)
>> +               ret = i915_gem_object_pin_map(obj, &ww, type);
>> +       if (IS_ERR(ret))
> This looks a little dodgy, since ret might not be initialized here,
> say if we encounter an error when grabbing the lock?
>
> Also maybe s/ret/ptr/? Seeing ret makes me think it's a plain integer.

Ack, good catch!

Will send a new version to fix it.

~Maarten

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

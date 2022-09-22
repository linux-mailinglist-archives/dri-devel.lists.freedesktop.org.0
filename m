Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FFB5E64DB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC6C10EB39;
	Thu, 22 Sep 2022 14:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40CA410EB3B;
 Thu, 22 Sep 2022 14:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663856008; x=1695392008;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=akMJERrXOCidgzqbk9mKVvY5qrTvNVsK91PeKs5W8/s=;
 b=B531uLNKsenlc204qF6wArg38+CpsEzM46NHt8W8aRILYJ7wPJ66xHKn
 aGUfMV4g0N/7ya5gnESJMiN30rUD4mfsREKmz//BGTw5XeYDQYmlrWz1Z
 duKT/6PCD2YX4/p2XC2uukJU8PGw8zBHQDXWdFbaCW8QdZgiNG0B1duLi
 9x9qrs53Hi4915M9hIDdqqPZoFKzATECVcj6bRlMYEgSqpzMQTUBZw4fO
 1ho1DletcdrCrATyLx4+iLkv1h9xCRdcvtoJcwuTUd576vx0DOrK/cQP1
 tMFE4B4YqoLjXHvUxpt01rXWQFfR3cV0APJ8Iuoc7/FKvEWDJQrY7zWdU g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="300289266"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="300289266"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 07:12:33 -0700
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="619805663"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 07:12:33 -0700
Date: Thu, 22 Sep 2022 07:12:11 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [RFC v4 08/14] drm/i915/vm_bind: Abstract out common
 execbuf functions
Message-ID: <20220922141210.GG28263@nvishwa1-DESK>
References: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
 <20220921070945.27764-9-niranjana.vishwanathapura@intel.com>
 <f14f142b-c382-9592-ff3d-af9e69028f75@linux.intel.com>
 <20220921181734.GE28263@nvishwa1-DESK>
 <06ba58f8-c86d-1a75-4e25-2108224a32f7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06ba58f8-c86d-1a75-4e25-2108224a32f7@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: paulo.r.zanoni@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 10:05:34AM +0100, Tvrtko Ursulin wrote:
>
>On 21/09/2022 19:17, Niranjana Vishwanathapura wrote:
>>On Wed, Sep 21, 2022 at 11:18:53AM +0100, Tvrtko Ursulin wrote:
>>>
>>>On 21/09/2022 08:09, Niranjana Vishwanathapura wrote:

<snip>

>>>
>>>Two things:
>>>
>>>1)
>>>
>>>Is there enough commonality to maybe avoid multiple arguments and 
>>>have like
>>>
>>>struct i915_execbuffer {
>>>
>>>};
>>>
>>>struct i915_execbuffer2 {
>>>    struct i915_execbuffer eb;
>>>    .. eb2 specific fields ..
>>>};
>>>
>>>struct i915_execbuffer3 {
>>>    struct i915_execbuffer eb;
>>>    .. eb3 specific fields ..
>>>};
>>>
>>>And then have the common helpers take the pointer to the common struct?
>>>
>>
>>...
>>This requires updating legacy execbuf path everywhere which doesn't look
>>like a good idea to me. As discussed during vm_bind rfc, I think it is
>>better to keep execbuf3 to itself and keep it leaner.
>
>To be clear the amount of almost the same duplicated code worries me 
>from the maintenance burden angle. I don't think we have any such 
>precedent in the driver. And AFAIR during RFC conclusion was keep the 
>ioctls separate and share code where it makes sense.
>

But if we make a common functions that tries to cater to all with lot
of 'if/else' statements, that also doesn't look good.
What I took from RFC discussion was that code should be duplicated
and only share code where is a 100% match.

>For instance eb_fences_add - could you have a common helper which 
>takes in_fence and out_fence as parameters. Passing in -1/-1 from eb3 
>and end up with even more sharing? Same approach like you did in this 
>patch by making helpers take arguments they need instead of struct eb.
>
>Eb_requests_create? Again same code if you make eb->batch_pool a 
>standalone argument passed in.
>

I am trying to avoid those things. The legacy execbuf and execbuf3 are
very different here. ie., execbuf3 doesn't support in/out fences,
the handling of batches are different and there is no batch_pool etc.
So, it would be good to have those two paths handle it separately.
Why should execbuf3 send dummy '-1 or NULL' etc when the point of
execbuf3 is to move away from legacy things?

Niranjana

>Haven't looked at more than those in this round..
>




>Regards,
>
>Tvrtko
>
>>>2)
>>>
>>>Should we prefix with i915_ everything that is now no longer static?
>>>
>>
>>Yah, makes sense, will update.
>>
>>Niranjana
>>
>>>Regards,
>>>
>>>Tvrtko
>>>
>>>>+
>>>>+struct intel_context *
>>>>+eb_find_context(struct intel_context *context, unsigned int 
>>>>context_number);
>>>>+
>>>>+int add_timeline_fence(struct drm_file *file, u32 handle, u64 point,
>>>>+               struct eb_fence *f, bool wait, bool signal);
>>>>+void put_fence_array(struct eb_fence *fences, u64 num_fences);
>>>>+int await_fence_array(struct eb_fence *fences, u64 num_fences,
>>>>+              struct i915_request *rq);
>>>>+void signal_fence_array(struct eb_fence *fences, u64 num_fences,
>>>>+            struct dma_fence * const fence);
>>>>+
>>>>+int eb_requests_add(struct i915_request **requests, unsigned 
>>>>int num_batches,
>>>>+            struct intel_context *context, struct 
>>>>i915_sched_attr sched,
>>>>+            int err);
>>>>+void eb_requests_get(struct i915_request **requests, unsigned 
>>>>int num_batches);
>>>>+void eb_requests_put(struct i915_request **requests, unsigned 
>>>>int num_batches);
>>>>+
>>>>+struct dma_fence *__eb_composite_fence_create(struct 
>>>>i915_request **requests,
>>>>+                          unsigned int num_batches,
>>>>+                          struct intel_context *context);
>>>>+
>>>>+#endif /* __I915_GEM_EXECBUFFER_COMMON_H */

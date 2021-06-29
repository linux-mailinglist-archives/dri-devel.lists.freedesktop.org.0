Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8D73B7026
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 11:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE156E834;
	Tue, 29 Jun 2021 09:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC346E83C;
 Tue, 29 Jun 2021 09:36:24 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10029"; a="195267082"
X-IronPort-AV: E=Sophos;i="5.83,308,1616482800"; d="scan'208";a="195267082"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 02:36:23 -0700
X-IronPort-AV: E=Sophos;i="5.83,308,1616482800"; d="scan'208";a="641245960"
Received: from ettammin-mobl1.ger.corp.intel.com (HELO [10.249.254.141])
 ([10.249.254.141])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2021 02:36:21 -0700
Subject: Re: [PATCH v3 4/5] drm/i915/gem: Fix same-driver-another-instance
 dma-buf export
To: Daniel Vetter <daniel@ffwll.ch>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>
References: <20210628144626.76126-1-thomas.hellstrom@linux.intel.com>
 <20210628144626.76126-5-thomas.hellstrom@linux.intel.com>
 <cf307e287b904ed6bdaeb3f3c9d34095@intel.com>
 <YNrdP3+pq9GlBIIR@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ce2d0759-358e-7c9d-4fa1-c501f4270925@linux.intel.com>
Date: Tue, 29 Jun 2021 11:36:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YNrdP3+pq9GlBIIR@phenom.ffwll.local>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/29/21 10:43 AM, Daniel Vetter wrote:
> On Mon, Jun 28, 2021 at 07:45:31PM +0000, Ruhl, Michael J wrote:
>>> -----Original Message-----
>>> From: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Sent: Monday, June 28, 2021 10:46 AM
>>> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>>> Cc: Auld, Matthew <matthew.auld@intel.com>;
>>> maarten.lankhorst@linux.intel.com; Thomas Hellström
>>> <thomas.hellstrom@linux.intel.com>; Ruhl; Ruhl, Michael J
>>> <michael.j.ruhl@intel.com>
>>> Subject: [PATCH v3 4/5] drm/i915/gem: Fix same-driver-another-instance
>>> dma-buf export
>>>
>>> If our exported dma-bufs are imported by another instance of our driver,
>>> that instance will typically have the imported dma-bufs locked during
>>> map_attachment(). But the exporter also locks the same reservation
>>> object in the map_dma_buf() callback, which leads to recursive locking.
>>>
>>> Add a live selftest to catch this case, and as a workaround until
>>> we fully support dynamic import and export, declare the exporter dynamic
>>> by providing NOP pin() and unpin() functions. This means our map_dma_buf()
>>> callback will *always* get called locked, and by pinning unconditionally
>>> in i915_gem_map_dma_buf() we make sure we don't need to use the
>>> move_notify() functionality which is not yet implemented.
>> An interesting abuse of the interface, but it seems reasonable (for now) to me.
> Hm I'm not sure this is the best interface abuse, since if we combine this
> with amdgpu it goes boom. Also I thought the dynamic stuff is optional (or
> is that only for the importer).

I'm not sure what would go wrong here when combined with amdgpu? I 
figure an amdgpu importer being dynamic, would expect to get notified 
using move_notify() on move, but that never happens since the exported 
bo is pinned. If it matters for interface abuse then I could add real 
implementations of pin() and unpin(). But choosing to not evict a mapped 
dma-buf must remain at the exporter's discretion and is not an interface 
abuse IMO.

Could you point me to a case that would not work with this code?

> What I discussed a bit with Maarten on irc is to essentially emulate the
> rules of what a dynamic exporter would end up with with a non-dynamic
> importer: pin/unpin the buffer at attach/detach time. We could fake this
> in our attach/detach callbacks.

Yes, but that would only reimplement what's already in the dma-buf core? 
Since we're about to add a real and correct implementation of this, that 
sounds like a waste of time IMHO.

>
> At least I don't think it's the locking changes that saves us here, but
> the caching of the sgt list in attach/detach.
Yes that saves us for the case of a non-locking non-dynamic importer, 
but for same-driver-another-instance, it's indeed the locking changes.
>   As long as we hand-roll that
> we should be fine. So hand-rolling that feels like the best option to make
> sure we're not making this worse, as long as we haven't fully validated
> the true dynamic importer _and_ exporter case.

/Thomas


>
> Cheers, Daniel
>
>> Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>>
>> Mike
>>
>>> Reported-by: Ruhl, Michael J <michael.j.ruhl@intel.com>
>>> Cc: Ruhl, Michael J <michael.j.ruhl@intel.com>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>> drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 31 ++++++-
>>> .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 81
>>> ++++++++++++++++++-
>>> 2 files changed, 108 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>> index 616c3a2f1baf..1d1eeb167d28 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>> @@ -12,6 +12,8 @@
>>> #include "i915_gem_object.h"
>>> #include "i915_scatterlist.h"
>>>
>>> +I915_SELFTEST_DECLARE(static bool force_different_devices;)
>>> +
>>> static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)
>>> {
>>> 	return to_intel_bo(buf->priv);
>>> @@ -25,7 +27,9 @@ static struct sg_table *i915_gem_map_dma_buf(struct
>>> dma_buf_attachment *attachme
>>> 	struct scatterlist *src, *dst;
>>> 	int ret, i;
>>>
>>> -	ret = i915_gem_object_pin_pages_unlocked(obj);
>>> +	assert_object_held(obj);
>>> +
>>> +	ret = i915_gem_object_pin_pages(obj);
>>> 	if (ret)
>>> 		goto err;
>>>
>>> @@ -168,6 +172,26 @@ static int i915_gem_end_cpu_access(struct dma_buf
>>> *dma_buf, enum dma_data_direct
>>> 	return err;
>>> }
>>>
>>> +/*
>>> + * As a workaround until we fully support dynamic import and export,
>>> + * declare the exporter dynamic by providing NOP pin() and unpin()
>>> functions.
>>> + * This means our i915_gem_map_dma_buf() callback will *always* get
>>> called
>>> + * locked, and by pinning unconditionally in i915_gem_map_dma_buf() we
>>> make
>>> + * sure we don't need to use the move_notify() functionality which is
>>> + * not yet implemented. Typically for the same-driver-another-instance case,
>>> + * i915_gem_map_dma_buf() will be called at importer attach time and the
>>> + * mapped sg_list will be cached by the dma-buf core for the
>>> + * duration of the attachment.
>>> + */
>>> +static int i915_gem_dmabuf_pin(struct dma_buf_attachment *attach)
>>> +{
>>> +	return 0;
>>> +}
>>> +
>>> +static void i915_gem_dmabuf_unpin(struct dma_buf_attachment *attach)
>>> +{
>>> +}
>>> +
>>> static const struct dma_buf_ops i915_dmabuf_ops =  {
>>> 	.map_dma_buf = i915_gem_map_dma_buf,
>>> 	.unmap_dma_buf = i915_gem_unmap_dma_buf,
>>> @@ -177,6 +201,8 @@ static const struct dma_buf_ops i915_dmabuf_ops =  {
>>> 	.vunmap = i915_gem_dmabuf_vunmap,
>>> 	.begin_cpu_access = i915_gem_begin_cpu_access,
>>> 	.end_cpu_access = i915_gem_end_cpu_access,
>>> +	.pin = i915_gem_dmabuf_pin,
>>> +	.unpin = i915_gem_dmabuf_unpin,
>>> };
>>>
>>> struct dma_buf *i915_gem_prime_export(struct drm_gem_object
>>> *gem_obj, int flags)
>>> @@ -241,7 +267,8 @@ struct drm_gem_object
>>> *i915_gem_prime_import(struct drm_device *dev,
>>> 	if (dma_buf->ops == &i915_dmabuf_ops) {
>>> 		obj = dma_buf_to_obj(dma_buf);
>>> 		/* is it from our device? */
>>> -		if (obj->base.dev == dev) {
>>> +		if (obj->base.dev == dev &&
>>> +		    !I915_SELFTEST_ONLY(force_different_devices)) {
>>> 			/*
>>> 			 * Importing dmabuf exported from out own gem
>>> increases
>>> 			 * refcount on gem itself instead of f_count of
>>> dmabuf.
>>> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>>> b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>>> index dd74bc09ec88..24735d6c12a2 100644
>>> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>>> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
>>> @@ -35,7 +35,7 @@ static int igt_dmabuf_export(void *arg)
>>> static int igt_dmabuf_import_self(void *arg)
>>> {
>>> 	struct drm_i915_private *i915 = arg;
>>> -	struct drm_i915_gem_object *obj;
>>> +	struct drm_i915_gem_object *obj, *import_obj;
>>> 	struct drm_gem_object *import;
>>> 	struct dma_buf *dmabuf;
>>> 	int err;
>>> @@ -65,14 +65,90 @@ static int igt_dmabuf_import_self(void *arg)
>>> 		err = -EINVAL;
>>> 		goto out_import;
>>> 	}
>>> +	import_obj = to_intel_bo(import);
>>> +
>>> +	i915_gem_object_lock(import_obj, NULL);
>>> +	err = ____i915_gem_object_get_pages(import_obj);
>>> +	i915_gem_object_unlock(import_obj);
>>> +	if (err) {
>>> +		pr_err("Same object dma-buf get_pages failed!\n");
>>> +		goto out_import;
>>> +	}
>>>
>>> 	err = 0;
>>> out_import:
>>> -	i915_gem_object_put(to_intel_bo(import));
>>> +	i915_gem_object_put(import_obj);
>>> +out_dmabuf:
>>> +	dma_buf_put(dmabuf);
>>> +out:
>>> +	i915_gem_object_put(obj);
>>> +	return err;
>>> +}
>>> +
>>> +static int igt_dmabuf_import_same_driver(void *arg)
>>> +{
>>> +	struct drm_i915_private *i915 = arg;
>>> +	struct drm_i915_gem_object *obj, *import_obj;
>>> +	struct drm_gem_object *import;
>>> +	struct dma_buf *dmabuf;
>>> +	int err;
>>> +
>>> +	force_different_devices = true;
>>> +	obj = i915_gem_object_create_shmem(i915, PAGE_SIZE);
>>> +	if (IS_ERR(obj))
>>> +		goto out_ret;
>>> +
>>> +	dmabuf = i915_gem_prime_export(&obj->base, 0);
>>> +	if (IS_ERR(dmabuf)) {
>>> +		pr_err("i915_gem_prime_export failed with err=%d\n",
>>> +		       (int)PTR_ERR(dmabuf));
>>> +		err = PTR_ERR(dmabuf);
>>> +		goto out;
>>> +	}
>>> +
>>> +	import = i915_gem_prime_import(&i915->drm, dmabuf);
>>> +	if (IS_ERR(import)) {
>>> +		pr_err("i915_gem_prime_import failed with err=%d\n",
>>> +		       (int)PTR_ERR(import));
>>> +		err = PTR_ERR(import);
>>> +		goto out_dmabuf;
>>> +	}
>>> +
>>> +	if (import == &obj->base) {
>>> +		pr_err("i915_gem_prime_import reused gem object!\n");
>>> +		err = -EINVAL;
>>> +		goto out_import;
>>> +	}
>>> +
>>> +	import_obj = to_intel_bo(import);
>>> +
>>> +	i915_gem_object_lock(import_obj, NULL);
>>> +	err = ____i915_gem_object_get_pages(import_obj);
>>> +	if (err) {
>>> +		pr_err("Different objects dma-buf get_pages failed!\n");
>>> +		i915_gem_object_unlock(import_obj);
>>> +		goto out_import;
>>> +	}
>>> +
>>> +	/*
>>> +	 * If the exported object is not in system memory, something
>>> +	 * weird is going on. TODO: When p2p is supported, this is no
>>> +	 * longer considered weird.
>>> +	 */
>>> +	if (obj->mm.region != i915->mm.regions[INTEL_REGION_SMEM]) {
>>> +		pr_err("Exported dma-buf is not in system memory\n");
>>> +		err = -EINVAL;
>>> +	}
>>> +	i915_gem_object_unlock(import_obj);
>>> +
>>> +out_import:
>>> +	i915_gem_object_put(import_obj);
>>> out_dmabuf:
>>> 	dma_buf_put(dmabuf);
>>> out:
>>> 	i915_gem_object_put(obj);
>>> +out_ret:
>>> +	force_different_devices = false;
>>> 	return err;
>>> }
>>>
>>> @@ -286,6 +362,7 @@ int i915_gem_dmabuf_live_selftests(struct
>>> drm_i915_private *i915)
>>> {
>>> 	static const struct i915_subtest tests[] = {
>>> 		SUBTEST(igt_dmabuf_export),
>>> +		SUBTEST(igt_dmabuf_import_same_driver),
>>> 	};
>>>
>>> 	return i915_subtests(tests, i915);
>>> --
>>> 2.31.1

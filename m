Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD336E0DDC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 14:58:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A2E10E345;
	Thu, 13 Apr 2023 12:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DF110E342;
 Thu, 13 Apr 2023 12:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681390721; x=1712926721;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=atKxIHpULToXQdQCDiM2k2VwriGvzhW5bZrh9vQzplk=;
 b=hsRdk1NVHvIGAUHM2MB6fad89tb+gd/7R07iobBSBA2OjkMaDet/oQ09
 kIBpOI36R0nSTAKw39ipsN/1IWAuTx7qc0RQADwz4iqQpiGHOkUrznqDM
 3O3X9268E9jdWWkb8JhUiW79+Od/90XyC03mLsiTs7ZvnvxrcB9Sqa/E4
 xop4NoXx7cLcNE2IekgA1Qs/95HouSKopDMn0diA2h6tzEXiwJdBfbk5n
 bH7vDUgQT9N6y3ySVymXHXEMU06wBd1l1vQb6qs+eHeEd1qvZ/HSgy+KA
 65J0q71b5ocdYll88zuK5/fjhyQLtzUFnb41bQKin3sQejHJMfcMVr/yI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="332884852"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="332884852"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 05:58:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="758685116"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="758685116"
Received: from mmcgar2x-mobl1.ger.corp.intel.com (HELO [10.213.231.135])
 ([10.213.231.135])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 05:58:36 -0700
Message-ID: <c82fd8fa-9f4b-f62f-83be-25853f9ecf5e@linux.intel.com>
Date: Thu, 13 Apr 2023 13:58:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 6/7] drm: Add fdinfo memory stats
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christopher Healy <healych@amazon.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Rob Clark <robdclark@chromium.org>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20230411225725.2032862-1-robdclark@gmail.com>
 <20230411225725.2032862-7-robdclark@gmail.com>
 <29a8d9aa-c6ea-873f-ce0b-fb8199b13068@linux.intel.com>
 <CAF6AEGsZsMx+Vy+4UQSx3X7w_QNvvjLqWxx=PnCLAOC9f-X2CQ@mail.gmail.com>
 <ZDb1phnddSne79iN@phenom.ffwll.local>
 <CAF6AEGvBeDVM12ac0j_PKSdcY83hNDhyrQs9-=h=dx_7AoMXLw@mail.gmail.com>
 <ZDcEGoSPGr/oRLas@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <ZDcEGoSPGr/oRLas@phenom.ffwll.local>
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


On 12/04/2023 20:18, Daniel Vetter wrote:
> On Wed, Apr 12, 2023 at 11:42:07AM -0700, Rob Clark wrote:
>> On Wed, Apr 12, 2023 at 11:17 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>
>>> On Wed, Apr 12, 2023 at 10:59:54AM -0700, Rob Clark wrote:
>>>> On Wed, Apr 12, 2023 at 7:42 AM Tvrtko Ursulin
>>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>>
>>>>>
>>>>> On 11/04/2023 23:56, Rob Clark wrote:
>>>>>> From: Rob Clark <robdclark@chromium.org>
>>>>>>
>>>>>> Add support to dump GEM stats to fdinfo.
>>>>>>
>>>>>> v2: Fix typos, change size units to match docs, use div_u64
>>>>>> v3: Do it in core
>>>>>>
>>>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>>>>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>>>>>> ---
>>>>>>    Documentation/gpu/drm-usage-stats.rst | 21 ++++++++
>>>>>>    drivers/gpu/drm/drm_file.c            | 76 +++++++++++++++++++++++++++
>>>>>>    include/drm/drm_file.h                |  1 +
>>>>>>    include/drm/drm_gem.h                 | 19 +++++++
>>>>>>    4 files changed, 117 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
>>>>>> index b46327356e80..b5e7802532ed 100644
>>>>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>>>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>>>>> @@ -105,6 +105,27 @@ object belong to this client, in the respective memory region.
>>>>>>    Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>>>>>>    indicating kibi- or mebi-bytes.
>>>>>>
>>>>>> +- drm-shared-memory: <uint> [KiB|MiB]
>>>>>> +
>>>>>> +The total size of buffers that are shared with another file (ie. have more
>>>>>> +than a single handle).
>>>>>> +
>>>>>> +- drm-private-memory: <uint> [KiB|MiB]
>>>>>> +
>>>>>> +The total size of buffers that are not shared with another file.
>>>>>> +
>>>>>> +- drm-resident-memory: <uint> [KiB|MiB]
>>>>>> +
>>>>>> +The total size of buffers that are resident in system memory.
>>>>>
>>>>> I think this naming maybe does not work best with the existing
>>>>> drm-memory-<region> keys.
>>>>
>>>> Actually, it was very deliberate not to conflict with the existing
>>>> drm-memory-<region> keys ;-)
>>>>
>>>> I wouldn't have preferred drm-memory-{active,resident,...} but it
>>>> could be mis-parsed by existing userspace so my hands were a bit tied.
>>>>
>>>>> How about introduce the concept of a memory region from the start and
>>>>> use naming similar like we do for engines?
>>>>>
>>>>> drm-memory-$CATEGORY-$REGION: ...
>>>>>
>>>>> Then we document a bunch of categories and their semantics, for instance:
>>>>>
>>>>> 'size' - All reachable objects
>>>>> 'shared' - Subset of 'size' with handle_count > 1
>>>>> 'resident' - Objects with backing store
>>>>> 'active' - Objects in use, subset of resident
>>>>> 'purgeable' - Or inactive? Subset of resident.
>>>>>
>>>>> We keep the same semantics as with process memory accounting (if I got
>>>>> it right) which could be desirable for a simplified mental model.
>>>>>
>>>>> (AMD needs to remind me of their 'drm-memory-...' keys semantics. If we
>>>>> correctly captured this in the first round it should be equivalent to
>>>>> 'resident' above. In any case we can document no category is equal to
>>>>> which category, and at most one of the two must be output.)
>>>>>
>>>>> Region names we at most partially standardize. Like we could say
>>>>> 'system' is to be used where backing store is system RAM and others are
>>>>> driver defined.
>>>>>
>>>>> Then discrete GPUs could emit N sets of key-values, one for each memory
>>>>> region they support.
>>>>>
>>>>> I think this all also works for objects which can be migrated between
>>>>> memory regions. 'Size' accounts them against all regions while for
>>>>> 'resident' they only appear in the region of their current placement, etc.
>>>>
>>>> I'm not too sure how to rectify different memory regions with this,
>>>> since drm core doesn't really know about the driver's memory regions.
>>>> Perhaps we can go back to this being a helper and drivers with vram
>>>> just don't use the helper?  Or??
>>>
>>> I think if you flip it around to drm-$CATEGORY-memory{-$REGION}: then it
>>> all works out reasonably consistently?
>>
>> That is basically what we have now.  I could append -system to each to
>> make things easier to add vram/etc (from a uabi standpoint)..
> 
> What you have isn't really -system, but everything. So doesn't really make
> sense to me to mark this -system, it's only really true for integrated (if
> they don't have stolen or something like that).
> 
> Also my comment was more in reply to Tvrtko's suggestion.

Right so my proposal was drm-memory-$CATEGORY-$REGION which I think 
aligns with the current drm-memory-$REGION by extending, rather than 
creating confusion with different order of key name components.

AMD currently has (among others) drm-memory-vram, which we could define 
in the spec maps to category X, if category component is not present.

Some examples:

drm-memory-resident-system:
drm-memory-size-lmem0:
drm-memory-active-vram:

Etc.. I think it creates a consistent story.

Other than this, my two I think significant opens which haven't been 
addressed yet are:

1)

Why do we want totals (not per region) when userspace can trivially 
aggregate if they want. What is the use case?

2)

Current proposal limits the value to whole objects and fixates that by 
having it in the common code. If/when some driver is able to support 
sub-BO granularity they will need to opt out of the common printer at 
which point it may be less churn to start with a helper rather than 
mid-layer. Or maybe some drivers already support this, I don't know. 
Given how important VM BIND is I wouldn't be surprised.

Regards,

Tvrtko

>>> And ttm could/should perhaps provide a helper to dump the region specific
>>> version of this. Or we lift the concept of regions out of ttm a bit
>>> higher, that's kinda needed for cgroups eventually anyway I think.
>>> -Daniel
>>>
>>>>
>>>> BR,
>>>> -R
>>>>
>>>>> Userspace can aggregate if it wishes to do so but kernel side should not.
>>>>>
>>>>>> +
>>>>>> +- drm-purgeable-memory: <uint> [KiB|MiB]
>>>>>> +
>>>>>> +The total size of buffers that are purgeable.
>>>>>> +
>>>>>> +- drm-active-memory: <uint> [KiB|MiB]
>>>>>> +
>>>>>> +The total size of buffers that are active on one or more rings.
>>>>>> +
>>>>>>    - drm-cycles-<str> <uint>
>>>>>>
>>>>>>    Engine identifier string must be the same as the one specified in the
>>>>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>>>>> index 37dfaa6be560..46fdd843bb3a 100644
>>>>>> --- a/drivers/gpu/drm/drm_file.c
>>>>>> +++ b/drivers/gpu/drm/drm_file.c
>>>>>> @@ -42,6 +42,7 @@
>>>>>>    #include <drm/drm_client.h>
>>>>>>    #include <drm/drm_drv.h>
>>>>>>    #include <drm/drm_file.h>
>>>>>> +#include <drm/drm_gem.h>
>>>>>>    #include <drm/drm_print.h>
>>>>>>
>>>>>>    #include "drm_crtc_internal.h"
>>>>>> @@ -871,6 +872,79 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
>>>>>>    }
>>>>>>    EXPORT_SYMBOL(drm_send_event);
>>>>>>
>>>>>> +static void print_size(struct drm_printer *p, const char *stat, size_t sz)
>>>>>> +{
>>>>>> +     const char *units[] = {"", " KiB", " MiB"};
>>>>>> +     unsigned u;
>>>>>> +
>>>>>> +     for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
>>>>>> +             if (sz < SZ_1K)
>>>>>> +                     break;
>>>>>> +             sz = div_u64(sz, SZ_1K);
>>>>>> +     }
>>>>>> +
>>>>>> +     drm_printf(p, "%s:\t%zu%s\n", stat, sz, units[u]);
>>>>>> +}
>>>>>> +
>>>>>> +static void print_memory_stats(struct drm_printer *p, struct drm_file *file)
>>>>>> +{
>>>>>> +     struct drm_gem_object *obj;
>>>>>> +     struct {
>>>>>> +             size_t shared;
>>>>>> +             size_t private;
>>>>>> +             size_t resident;
>>>>>> +             size_t purgeable;
>>>>>> +             size_t active;
>>>>>> +     } size = {0};
>>>>>> +     bool has_status = false;
>>>>>> +     int id;
>>>>>> +
>>>>>> +     spin_lock(&file->table_lock);
>>>>>> +     idr_for_each_entry (&file->object_idr, obj, id) {
>>>>>> +             enum drm_gem_object_status s = 0;
>>>>>> +
>>>>>> +             if (obj->funcs && obj->funcs->status) {
>>>>>> +                     s = obj->funcs->status(obj);
>>>>>> +                     has_status = true;
>>>>>> +             }
>>>>>> +
>>>>>> +             if (obj->handle_count > 1) {
>>>>>> +                     size.shared += obj->size;
>>>>>> +             } else {
>>>>>> +                     size.private += obj->size;
>>>>>> +             }
>>>>>> +
>>>>>> +             if (s & DRM_GEM_OBJECT_RESIDENT) {
>>>>>> +                     size.resident += obj->size;
>>>>>> +             } else {
>>>>>> +                     /* If already purged or not yet backed by pages, don't
>>>>>> +                      * count it as purgeable:
>>>>>> +                      */
>>>>>> +                     s &= ~DRM_GEM_OBJECT_PURGEABLE;
>>>>>
>>>>> Side question - why couldn't resident buffers be purgeable? Did you mean
>>>>> for the if branch check to be active here? But then it wouldn't make
>>>>> sense for a driver to report active _and_ purgeable..
>>>>>
>>>>>> +             }
>>>>>> +
>>>>>> +             if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
>>>>>> +                     size.active += obj->size;
>>>>>> +
>>>>>> +                     /* If still active, don't count as purgeable: */
>>>>>> +                     s &= ~DRM_GEM_OBJECT_PURGEABLE;
>>>>>
>>>>> Another side question - I guess this tidies a race in reporting? If so
>>>>> not sure it matters given the stats are all rather approximate.
>>>>>
>>>>>> +             }
>>>>>> +
>>>>>> +             if (s & DRM_GEM_OBJECT_PURGEABLE)
>>>>>> +                     size.purgeable += obj->size;
>>>>>> +     }
>>>>>
>>>>> One concern I have here is that it is all based on obj->size. That is,
>>>>> there is no provision for drivers to implement page level granularity.
>>>>> So correct reporting in use cases such as VM BIND in the future wouldn't
>>>>> work unless it was a driver hook to get almost all of the info above. At
>>>>> which point common code is just a loop. TBF I don't know if any drivers
>>>>> do sub obj->size backing store granularity today, but I think it is
>>>>> sometimes to be sure of before proceeding.
>>>>>
>>>>> Second concern is what I touched upon in the first reply block - if the
>>>>> common code blindly loops over all objects then on discrete GPUs it
>>>>> seems we get an 'aggregate' value here which is not what I think we
>>>>> want. We rather want to have the ability for drivers to list stats per
>>>>> individual memory region.
>>>>>
>>>>>> +     spin_unlock(&file->table_lock);
>>>>>> +
>>>>>> +     print_size(p, "drm-shared-memory", size.shared);
>>>>>> +     print_size(p, "drm-private-memory", size.private);
>>>>>> +     print_size(p, "drm-active-memory", size.active);
>>>>>> +
>>>>>> +     if (has_status) {
>>>>>> +             print_size(p, "drm-resident-memory", size.resident);
>>>>>> +             print_size(p, "drm-purgeable-memory", size.purgeable);
>>>>>> +     }
>>>>>> +}
>>>>>> +
>>>>>>    /**
>>>>>>     * drm_fop_show_fdinfo - helper for drm file fops
>>>>>>     * @seq_file: output stream
>>>>>> @@ -904,6 +978,8 @@ void drm_fop_show_fdinfo(struct seq_file *m, struct file *f)
>>>>>>
>>>>>>        if (dev->driver->show_fdinfo)
>>>>>>                dev->driver->show_fdinfo(&p, file);
>>>>>> +
>>>>>> +     print_memory_stats(&p, file);
>>>>>>    }
>>>>>>    EXPORT_SYMBOL(drm_fop_show_fdinfo);
>>>>>>
>>>>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>>>>> index dfa995b787e1..e5b40084538f 100644
>>>>>> --- a/include/drm/drm_file.h
>>>>>> +++ b/include/drm/drm_file.h
>>>>>> @@ -41,6 +41,7 @@
>>>>>>    struct dma_fence;
>>>>>>    struct drm_file;
>>>>>>    struct drm_device;
>>>>>> +struct drm_printer;
>>>>>>    struct device;
>>>>>>    struct file;
>>>>>>
>>>>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>>>>> index 189fd618ca65..213917bb6b11 100644
>>>>>> --- a/include/drm/drm_gem.h
>>>>>> +++ b/include/drm/drm_gem.h
>>>>>> @@ -42,6 +42,14 @@
>>>>>>    struct iosys_map;
>>>>>>    struct drm_gem_object;
>>>>>>
>>>>>> +/**
>>>>>> + * enum drm_gem_object_status - bitmask of object state for fdinfo reporting
>>>>>> + */
>>>>>> +enum drm_gem_object_status {
>>>>>> +     DRM_GEM_OBJECT_RESIDENT  = BIT(0),
>>>>>> +     DRM_GEM_OBJECT_PURGEABLE = BIT(1),
>>>>>> +};
>>>>>> +
>>>>>>    /**
>>>>>>     * struct drm_gem_object_funcs - GEM object functions
>>>>>>     */
>>>>>> @@ -174,6 +182,17 @@ struct drm_gem_object_funcs {
>>>>>>         */
>>>>>>        int (*evict)(struct drm_gem_object *obj);
>>>>>>
>>>>>> +     /**
>>>>>> +      * @status:
>>>>>> +      *
>>>>>> +      * The optional status callback can return additional object state
>>>>>> +      * which determines which stats the object is counted against.  The
>>>>>> +      * callback is called under table_lock.  Racing against object status
>>>>>> +      * change is "harmless", and the callback can expect to not race
>>>>>> +      * against object destruction.
>>>>>> +      */
>>>>>> +     enum drm_gem_object_status (*status)(struct drm_gem_object *obj);
>>>>>
>>>>> Does this needs to be in object funcs and couldn't be consolidated to
>>>>> driver level?
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>> +
>>>>>>        /**
>>>>>>         * @vm_ops:
>>>>>>         *
>>>
>>> --
>>> Daniel Vetter
>>> Software Engineer, Intel Corporation
>>> http://blog.ffwll.ch
> 

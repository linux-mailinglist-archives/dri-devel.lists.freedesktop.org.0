Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E1D6E66F7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 16:19:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5E6C10E7C6;
	Tue, 18 Apr 2023 14:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DD510E7C3;
 Tue, 18 Apr 2023 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681827558; x=1713363558;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ajI7j6uD8qrJusA6X1R5PQB9KJiVt4sKsNOgb4G31v4=;
 b=bZL88NlG9FIU+88MbNvrYItZjMXWBIFePsfzOCQB4ML7rLiXBLnp948N
 qFq8K+YvUGs+Ja2ls3Yj+sTwigPySMcbaoMGFoMBpMkR+hMi5E9TmBySZ
 o+OSs3taLBKeM07WnNcXmyfG6EwA2akYk2nGg47jR8F8x1H9JYbtYL/3U
 9y8xE1YRKoZECO6CYANIvD8GFFpyuZhcL5EWqu2KZMKwNM93f1KqYNtS6
 K0AAWI3wIVXlqIfuSNJa0qBX2SeYTmoNLgQ727F6IMIkpl0GD0+3dGoJI
 K7hm0EIys+liR19Kx3PCrwWyMrHficI8MX7AW3MudbOt1zKFqCGcdz/VH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="324800243"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="324800243"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 07:18:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="937268171"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; d="scan'208";a="937268171"
Received: from dilipban-mobl.ger.corp.intel.com (HELO [10.213.234.43])
 ([10.213.234.43])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 07:18:48 -0700
Message-ID: <0faa3b0f-342c-87e0-9587-f8c11131689e@linux.intel.com>
Date: Tue, 18 Apr 2023 15:18:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC 3/6] drm: Add fdinfo memory stats
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-4-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGu3oagVYqBcgqKFO6-gbLbVdFn51fKeV7CfWTJXJjTNYA@mail.gmail.com>
 <fca966cf-df17-a937-8330-b2353f1a352c@linux.intel.com>
 <CAF6AEGswZZZxwRTOXbCVKmhUYwz8BSu-GDVCJ=FfyJ-w=e4dLQ@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGswZZZxwRTOXbCVKmhUYwz8BSu-GDVCJ=FfyJ-w=e4dLQ@mail.gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/04/2023 14:49, Rob Clark wrote:
> On Tue, Apr 18, 2023 at 2:00 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 17/04/2023 20:39, Rob Clark wrote:
>>> On Mon, Apr 17, 2023 at 8:56 AM Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> Add support to dump GEM stats to fdinfo.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> ---
>>>>    Documentation/gpu/drm-usage-stats.rst | 12 +++++++
>>>>    drivers/gpu/drm/drm_file.c            | 52 +++++++++++++++++++++++++++
>>>>    include/drm/drm_drv.h                 |  7 ++++
>>>>    include/drm/drm_file.h                |  8 +++++
>>>>    4 files changed, 79 insertions(+)
>>>>
>>>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
>>>> index 2ab32c40e93c..8273a41b2fb0 100644
>>>> --- a/Documentation/gpu/drm-usage-stats.rst
>>>> +++ b/Documentation/gpu/drm-usage-stats.rst
>>>> @@ -21,6 +21,7 @@ File format specification
>>>>
>>>>    - File shall contain one key value pair per one line of text.
>>>>    - Colon character (`:`) must be used to delimit keys and values.
>>>> +- Caret (`^`) is also a reserved character.
>>>
>>> this doesn't solve the problem that led me to drm-$CATEGORY-memory... ;-)
>>
>> Could you explain or remind me with a link to a previous explanation?
> 
> How is userspace supposed to know that "drm-memory-foo" is a memory
> type "foo" but drm-memory-foo^size is not memory type "foo^size"?

Are you referring to nvtop?

Indeed that one hardcodes:

   static const char drm_amdgpu_vram[] = "drm-memory-vram";

And does brute strcmp on it:

   } else if (!strcmp(key, drm_amdgpu_vram_old) || !strcmp(key, drm_amdgpu_vram)) {

So okay for that one, if we need to keep it working I just change this in my RFC:

"""
Resident category is identical to the drm-memory-<str> key and two should be
mutually exclusive.
"""

Into this:

"""
Resident category is identical to the drm-memory-<str> key and where the categorized one is present the legacy one must be too in order to preserve backward compatibility.
"""

Addition to my RFC:

...
	for (i = 0; i < num; i++) {
		if (!regions[i]) /* Allow sparse name arrays. */
			continue;

		print_stat(p, "size", regions[i], stats[i].size);
		print_stat(p, "shared", regions[i], stats[i].shared);
+		print_stat(p, "", regions[i], stats[i].resident);
		print_stat(p, "resident", regions[i], stats[i].resident);
		print_stat(p, "purgeable", regions[i], stats[i].purgeable);
		print_stat(p, "active", regions[i], stats[i].active);
	}
...

Results in output like this (in theory, if/when amdgpu takes on the extended format):

drm-memory-vram-size: ... KiB
drm-memory-vram: $same KiB
drm-memory-vram-resident: $same KiB
drm-memory-vram-...:

Regards,

Tvrtko

P.S. Would a slash instead of a caret be prettier?

>> What tool barfs on it and how? Spirit of drm-usage-stats.pl is that for
>> both drm-engine-<str>: and drm-memory-<str>: generic userspace is
>> supposed to take the whole <std> as opaque and just enumerate all it finds.
>>
>> Gputop manages to do that with engines names it knows _nothing_ about.
>> If it worked with memory regions it would just show the list of new
>> regions as for example "system^resident", "system^active". Then tools
>> can be extended to understand it better and provide a sub-breakdown if
>> wanted.
>>
>> Ugly not, we can change from caret to something nicer, unless I am
>> missing something it works, no?
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> (also, it is IMHO rather ugly)
>>>
>>> BR,
>>> -R
>>>
>>>>    - All keys shall be prefixed with `drm-`.
>>>>    - Whitespace between the delimiter and first non-whitespace character shall be
>>>>      ignored when parsing.
>>>> @@ -105,6 +106,17 @@ object belong to this client, in the respective memory region.
>>>>    Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>>>>    indicating kibi- or mebi-bytes.
>>>>
>>>> +- drm-memory-<str>^size:      <uint> [KiB|MiB]
>>>> +- drm-memory-<str>^shared:    <uint> [KiB|MiB]
>>>> +- drm-memory-<str>^resident:  <uint> [KiB|MiB]
>>>> +- drm-memory-<str>^purgeable: <uint> [KiB|MiB]
>>>> +- drm-memory-<str>^active:    <uint> [KiB|MiB]
>>>> +
>>>> +Resident category is identical to the drm-memory-<str> key and two should be
>>>> +mutually exclusive.
>>>> +
>>>> +TODO more description text...
>>>> +
>>>>    - drm-cycles-<str> <uint>
>>>>
>>>>    Engine identifier string must be the same as the one specified in the
>>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>>> index 37b4f76a5191..e202f79e816d 100644
>>>> --- a/drivers/gpu/drm/drm_file.c
>>>> +++ b/drivers/gpu/drm/drm_file.c
>>>> @@ -42,6 +42,7 @@
>>>>    #include <drm/drm_client.h>
>>>>    #include <drm/drm_drv.h>
>>>>    #include <drm/drm_file.h>
>>>> +#include <drm/drm_gem.h>
>>>>    #include <drm/drm_print.h>
>>>>
>>>>    #include "drm_crtc_internal.h"
>>>> @@ -871,6 +872,54 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
>>>>    }
>>>>    EXPORT_SYMBOL(drm_send_event);
>>>>
>>>> +static void
>>>> +print_stat(struct drm_printer *p, const char *stat, const char *region, u64 sz)
>>>> +{
>>>> +       const char *units[] = {"", " KiB", " MiB"};
>>>> +       unsigned int u;
>>>> +
>>>> +       if (sz == ~0ull) /* Not supported by the driver. */
>>>> +               return;
>>>> +
>>>> +       for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
>>>> +               if (sz < SZ_1K)
>>>> +                       break;
>>>> +               sz = div_u64(sz, SZ_1K);
>>>> +       }
>>>> +
>>>> +       drm_printf(p, "drm-memory-%s^%s:\t%llu%s\n",
>>>> +                  region, stat, sz, units[u]);
>>>> +}
>>>> +
>>>> +static void print_memory_stats(struct drm_printer *p, struct drm_file *file)
>>>> +{
>>>> +       struct drm_device *dev = file->minor->dev;
>>>> +       struct drm_fdinfo_memory_stat *stats;
>>>> +       unsigned int num, i;
>>>> +       char **regions;
>>>> +
>>>> +       regions = dev->driver->query_fdinfo_memory_regions(dev, &num);
>>>> +
>>>> +       stats = kcalloc(num, sizeof(*stats), GFP_KERNEL);
>>>> +       if (!stats)
>>>> +               return;
>>>> +
>>>> +       dev->driver->query_fdinfo_memory_stats(file, stats);
>>>> +
>>>> +       for (i = 0; i < num; i++) {
>>>> +               if (!regions[i]) /* Allow sparse name arrays. */
>>>> +                       continue;
>>>> +
>>>> +               print_stat(p, "size", regions[i], stats[i].size);
>>>> +               print_stat(p, "shared", regions[i], stats[i].shared);
>>>> +               print_stat(p, "resident", regions[i], stats[i].resident);
>>>> +               print_stat(p, "purgeable", regions[i], stats[i].purgeable);
>>>> +               print_stat(p, "active", regions[i], stats[i].active);
>>>> +       }
>>>> +
>>>> +       kfree(stats);
>>>> +}
>>>> +
>>>>    /**
>>>>     * drm_show_fdinfo - helper for drm file fops
>>>>     * @seq_file: output stream
>>>> @@ -900,6 +949,9 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>>>>
>>>>           if (dev->driver->show_fdinfo)
>>>>                   dev->driver->show_fdinfo(&p, file);
>>>> +
>>>> +       if (dev->driver->query_fdinfo_memory_regions)
>>>> +               print_memory_stats(&p, file);
>>>>    }
>>>>    EXPORT_SYMBOL(drm_show_fdinfo);
>>>>
>>>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>>>> index 89e2706cac56..ccc1cd98d2aa 100644
>>>> --- a/include/drm/drm_drv.h
>>>> +++ b/include/drm/drm_drv.h
>>>> @@ -35,6 +35,7 @@
>>>>    #include <drm/drm_device.h>
>>>>
>>>>    struct drm_file;
>>>> +struct drm_fdinfo_memory_stat;
>>>>    struct drm_gem_object;
>>>>    struct drm_master;
>>>>    struct drm_minor;
>>>> @@ -408,6 +409,12 @@ struct drm_driver {
>>>>            */
>>>>           void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
>>>>
>>>> +       char ** (*query_fdinfo_memory_regions)(struct drm_device *dev,
>>>> +                                              unsigned int *num);
>>>> +
>>>> +       void (*query_fdinfo_memory_stats)(struct drm_file *f,
>>>> +                                         struct drm_fdinfo_memory_stat *stat);
>>>> +
>>>>           /** @major: driver major number */
>>>>           int major;
>>>>           /** @minor: driver minor number */
>>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>>> index 7d9b3c65cbc1..00d48beeac5c 100644
>>>> --- a/include/drm/drm_file.h
>>>> +++ b/include/drm/drm_file.h
>>>> @@ -375,6 +375,14 @@ struct drm_file {
>>>>    #endif
>>>>    };
>>>>
>>>> +struct drm_fdinfo_memory_stat {
>>>> +       u64 size;
>>>> +       u64 shared;
>>>> +       u64 resident;
>>>> +       u64 purgeable;
>>>> +       u64 active;
>>>> +};
>>>> +
>>>>    /**
>>>>     * drm_is_primary_client - is this an open file of the primary node
>>>>     * @file_priv: DRM file
>>>> --
>>>> 2.37.2
>>>>

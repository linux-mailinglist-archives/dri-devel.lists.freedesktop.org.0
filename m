Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C9B6E5CB5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 11:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA9110E710;
	Tue, 18 Apr 2023 09:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BAED10E11E;
 Tue, 18 Apr 2023 09:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681808400; x=1713344400;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=FAjg3KGZq9JiLh4XmKmOapIZb/A2jChLXjWQdxXY8TY=;
 b=O4fAeQDYLXc0vPuXHVeVszk3MwFDX0qWVpuJ88UC5POF0lOII/ghJOGI
 AXa8aK5M2jzEX0OBFYGGD5LkpMgsmVba6t98Vz43ajh507jW7vGpsvV0N
 PBAufVfddSOKgvw98drIlYcjYUXHw3KV+Gtu9PYzo1PzMg6nXBYYxGgL4
 eG70tWJsSbiHTmfhUXZh7ZNkU+vh0/ZwmdCRLnraB5nESz2sk6PmxCIJI
 9IBYxTKszrkd2fk3Ac+owHtKD8CmBKBEAYq4DOQloomCjZtBmUq8nAXX2
 jzUM8QG+ts6xFfvm8zXzB/99YqagDHj+joNgEnWOepTXc7n9nDr2fHlD3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="346963171"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="346963171"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 01:59:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="641304659"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; d="scan'208";a="641304659"
Received: from dilipban-mobl.ger.corp.intel.com (HELO [10.213.234.43])
 ([10.213.234.43])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2023 01:59:57 -0700
Message-ID: <fca966cf-df17-a937-8330-b2353f1a352c@linux.intel.com>
Date: Tue, 18 Apr 2023 09:59:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC 3/6] drm: Add fdinfo memory stats
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-4-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGu3oagVYqBcgqKFO6-gbLbVdFn51fKeV7CfWTJXJjTNYA@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGu3oagVYqBcgqKFO6-gbLbVdFn51fKeV7CfWTJXJjTNYA@mail.gmail.com>
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


On 17/04/2023 20:39, Rob Clark wrote:
> On Mon, Apr 17, 2023 at 8:56 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Add support to dump GEM stats to fdinfo.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   Documentation/gpu/drm-usage-stats.rst | 12 +++++++
>>   drivers/gpu/drm/drm_file.c            | 52 +++++++++++++++++++++++++++
>>   include/drm/drm_drv.h                 |  7 ++++
>>   include/drm/drm_file.h                |  8 +++++
>>   4 files changed, 79 insertions(+)
>>
>> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
>> index 2ab32c40e93c..8273a41b2fb0 100644
>> --- a/Documentation/gpu/drm-usage-stats.rst
>> +++ b/Documentation/gpu/drm-usage-stats.rst
>> @@ -21,6 +21,7 @@ File format specification
>>
>>   - File shall contain one key value pair per one line of text.
>>   - Colon character (`:`) must be used to delimit keys and values.
>> +- Caret (`^`) is also a reserved character.
> 
> this doesn't solve the problem that led me to drm-$CATEGORY-memory... ;-)

Could you explain or remind me with a link to a previous explanation?

What tool barfs on it and how? Spirit of drm-usage-stats.pl is that for 
both drm-engine-<str>: and drm-memory-<str>: generic userspace is 
supposed to take the whole <std> as opaque and just enumerate all it finds.

Gputop manages to do that with engines names it knows _nothing_ about. 
If it worked with memory regions it would just show the list of new 
regions as for example "system^resident", "system^active". Then tools 
can be extended to understand it better and provide a sub-breakdown if 
wanted.

Ugly not, we can change from caret to something nicer, unless I am 
missing something it works, no?

Regards,

Tvrtko

> 
> (also, it is IMHO rather ugly)
> 
> BR,
> -R
> 
>>   - All keys shall be prefixed with `drm-`.
>>   - Whitespace between the delimiter and first non-whitespace character shall be
>>     ignored when parsing.
>> @@ -105,6 +106,17 @@ object belong to this client, in the respective memory region.
>>   Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>>   indicating kibi- or mebi-bytes.
>>
>> +- drm-memory-<str>^size:      <uint> [KiB|MiB]
>> +- drm-memory-<str>^shared:    <uint> [KiB|MiB]
>> +- drm-memory-<str>^resident:  <uint> [KiB|MiB]
>> +- drm-memory-<str>^purgeable: <uint> [KiB|MiB]
>> +- drm-memory-<str>^active:    <uint> [KiB|MiB]
>> +
>> +Resident category is identical to the drm-memory-<str> key and two should be
>> +mutually exclusive.
>> +
>> +TODO more description text...
>> +
>>   - drm-cycles-<str> <uint>
>>
>>   Engine identifier string must be the same as the one specified in the
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index 37b4f76a5191..e202f79e816d 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -42,6 +42,7 @@
>>   #include <drm/drm_client.h>
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_file.h>
>> +#include <drm/drm_gem.h>
>>   #include <drm/drm_print.h>
>>
>>   #include "drm_crtc_internal.h"
>> @@ -871,6 +872,54 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
>>   }
>>   EXPORT_SYMBOL(drm_send_event);
>>
>> +static void
>> +print_stat(struct drm_printer *p, const char *stat, const char *region, u64 sz)
>> +{
>> +       const char *units[] = {"", " KiB", " MiB"};
>> +       unsigned int u;
>> +
>> +       if (sz == ~0ull) /* Not supported by the driver. */
>> +               return;
>> +
>> +       for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
>> +               if (sz < SZ_1K)
>> +                       break;
>> +               sz = div_u64(sz, SZ_1K);
>> +       }
>> +
>> +       drm_printf(p, "drm-memory-%s^%s:\t%llu%s\n",
>> +                  region, stat, sz, units[u]);
>> +}
>> +
>> +static void print_memory_stats(struct drm_printer *p, struct drm_file *file)
>> +{
>> +       struct drm_device *dev = file->minor->dev;
>> +       struct drm_fdinfo_memory_stat *stats;
>> +       unsigned int num, i;
>> +       char **regions;
>> +
>> +       regions = dev->driver->query_fdinfo_memory_regions(dev, &num);
>> +
>> +       stats = kcalloc(num, sizeof(*stats), GFP_KERNEL);
>> +       if (!stats)
>> +               return;
>> +
>> +       dev->driver->query_fdinfo_memory_stats(file, stats);
>> +
>> +       for (i = 0; i < num; i++) {
>> +               if (!regions[i]) /* Allow sparse name arrays. */
>> +                       continue;
>> +
>> +               print_stat(p, "size", regions[i], stats[i].size);
>> +               print_stat(p, "shared", regions[i], stats[i].shared);
>> +               print_stat(p, "resident", regions[i], stats[i].resident);
>> +               print_stat(p, "purgeable", regions[i], stats[i].purgeable);
>> +               print_stat(p, "active", regions[i], stats[i].active);
>> +       }
>> +
>> +       kfree(stats);
>> +}
>> +
>>   /**
>>    * drm_show_fdinfo - helper for drm file fops
>>    * @seq_file: output stream
>> @@ -900,6 +949,9 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
>>
>>          if (dev->driver->show_fdinfo)
>>                  dev->driver->show_fdinfo(&p, file);
>> +
>> +       if (dev->driver->query_fdinfo_memory_regions)
>> +               print_memory_stats(&p, file);
>>   }
>>   EXPORT_SYMBOL(drm_show_fdinfo);
>>
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index 89e2706cac56..ccc1cd98d2aa 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -35,6 +35,7 @@
>>   #include <drm/drm_device.h>
>>
>>   struct drm_file;
>> +struct drm_fdinfo_memory_stat;
>>   struct drm_gem_object;
>>   struct drm_master;
>>   struct drm_minor;
>> @@ -408,6 +409,12 @@ struct drm_driver {
>>           */
>>          void (*show_fdinfo)(struct drm_printer *p, struct drm_file *f);
>>
>> +       char ** (*query_fdinfo_memory_regions)(struct drm_device *dev,
>> +                                              unsigned int *num);
>> +
>> +       void (*query_fdinfo_memory_stats)(struct drm_file *f,
>> +                                         struct drm_fdinfo_memory_stat *stat);
>> +
>>          /** @major: driver major number */
>>          int major;
>>          /** @minor: driver minor number */
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 7d9b3c65cbc1..00d48beeac5c 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -375,6 +375,14 @@ struct drm_file {
>>   #endif
>>   };
>>
>> +struct drm_fdinfo_memory_stat {
>> +       u64 size;
>> +       u64 shared;
>> +       u64 resident;
>> +       u64 purgeable;
>> +       u64 active;
>> +};
>> +
>>   /**
>>    * drm_is_primary_client - is this an open file of the primary node
>>    * @file_priv: DRM file
>> --
>> 2.37.2
>>

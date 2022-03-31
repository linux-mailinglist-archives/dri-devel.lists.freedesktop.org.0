Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBDB4EDA6C
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 15:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B4810F38E;
	Thu, 31 Mar 2022 13:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB9510F38E;
 Thu, 31 Mar 2022 13:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648732960; x=1680268960;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JgOUf7eTSNi1SNhVrlXi0i9yeQOriMHLGXh4M1j3ITs=;
 b=Pr6w6x0pw39gRRhYjyqGTmxNqqbnxKYzbhDFBIz+fTJW+oI3luf7T9OU
 JpEIE4KxMEs0riWEAGZ4gGoSWz3C2cWG1OEOxaM2Et6bgGpxb/pfBIwKL
 mJy6VSuG7MyL5c0i2Vd3mqVje42sWm1guqGftPP38ntCYqSfUKKHbAzSZ
 2U4ckwUXpEtCYLd/bVtm0+MHviY1+q0lbiAM6Vwd8NxNwiQu6wmsBdLSc
 hWP00ZqrQyPgvcAsedQ3BloI3wGfkfkOckFtb81gSXXDCTSmM71nqyE9g
 shMA0COW86KVmmA6HlYmjxm9rp0WzBa7fB7JXObSusNQMI2Us95aWLjFY A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="258667741"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="258667741"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:22:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="654743693"
Received: from juanniex-mobl.ger.corp.intel.com (HELO [10.213.215.247])
 ([10.213.215.247])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:22:38 -0700
Message-ID: <580836e7-0ed9-6d1e-c3ff-a0798009293b@linux.intel.com>
Date: Thu, 31 Mar 2022 14:22:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH i-g-t 01/11] lib: Helper library for parsing
 i915 fdinfo output
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20220222135605.1120767-1-tvrtko.ursulin@linux.intel.com>
 <20220222135605.1120767-2-tvrtko.ursulin@linux.intel.com>
 <20220330195229.GD59408@unerlige-ril-10.165.21.154>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220330195229.GD59408@unerlige-ril-10.165.21.154>
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
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 30/03/2022 20:52, Umesh Nerlige Ramappa wrote:
> On Tue, Feb 22, 2022 at 01:55:55PM +0000, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Tests and intel_gpu_top will share common code for parsing this file.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>> lib/igt_drm_fdinfo.c | 183 +++++++++++++++++++++++++++++++++++++++++++
>> lib/igt_drm_fdinfo.h |  48 ++++++++++++
>> lib/meson.build      |   7 ++
>> 3 files changed, 238 insertions(+)
>> create mode 100644 lib/igt_drm_fdinfo.c
>> create mode 100644 lib/igt_drm_fdinfo.h
>>
>> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>> new file mode 100644
>> index 000000000000..28c1bdbda08e
>> --- /dev/null
>> +++ b/lib/igt_drm_fdinfo.c
>> @@ -0,0 +1,183 @@
>> +/*
>> + * Copyright © 2022 Intel Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> + * copy of this software and associated documentation files (the 
>> "Software"),
>> + * to deal in the Software without restriction, including without 
>> limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, 
>> sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice (including 
>> the next
>> + * paragraph) shall be included in all copies or substantial portions 
>> of the
>> + * Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT 
>> SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES 
>> OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
>> ARISING
>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
>> OTHER DEALINGS
>> + * IN THE SOFTWARE.
>> + *
>> + */
>> +
>> +#include <ctype.h>
>> +#include <sys/types.h>
>> +#include <sys/stat.h>
>> +#include <fcntl.h>
>> +#include <stdio.h>
>> +#include <string.h>
>> +#include <stdlib.h>
>> +#include <unistd.h>
>> +
>> +#include "drmtest.h"
>> +
>> +#include "igt_drm_fdinfo.h"
>> +
>> +static size_t read_fdinfo(char *buf, const size_t sz, int at, const 
>> char *name)
>> +{
>> +    size_t count;
>> +    int fd;
>> +
>> +    fd = openat(at, name, O_RDONLY);
>> +    if (fd < 0)
>> +        return 0;
>> +
>> +    buf[sz - 1] = 0;
> 
> Wondering if this ^ should be after the read() in case 4096 bytes are read.

Yes, I guess even before and after so it's guaranteed to be null 
terminated no matter what.

> 
>> +    count = read(fd, buf, sz);
>> +    close(fd);
>> +
>> +    return count;
>> +}
>> +
>> +static int parse_engine(char *line, struct drm_client_fdinfo *info,
>> +            size_t prefix_len, uint64_t *val)
>> +{
>> +    static const char *e2class[] = {
>> +        "render",
>> +        "copy",
>> +        "video",
>> +        "video-enhance",
>> +    };
>> +    ssize_t name_len;
>> +    char *name, *p;
>> +    int found = -1;
>> +    unsigned int i;
>> +
>> +    p = index(line, ':');
>> +    if (!p || p == line)
>> +        return -1;
>> +
>> +    name_len = p - line - prefix_len;
>> +    if (name_len < 1)
>> +        return -1;
>> +
>> +    name = line + prefix_len;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(e2class); i++) {
>> +        if (!strncmp(name, e2class[i], name_len)) {
>> +            found = i;
>> +            break;
>> +        }
>> +    }
>> +
>> +    if (found >= 0) {
>> +        while (*++p && isspace(*p));
>> +        *val = strtoull(p, NULL, 10);
>> +    }
>> +
>> +    return found;
>> +}
>> +
>> +static const char *find_kv(const char *buf, const char *key, size_t 
>> keylen)
>> +{
>> +    const char *p = buf;
>> +
>> +    p = index(buf, ':');
>> +    if (!p || p == buf)
>> +        return NULL;
>> +
>> +    if ((p - buf) != keylen)
>> +        return NULL;
>> +
>> +    while (*++p && isspace(*p));
>> +    if (*p && !strncmp(buf, key, keylen))
> 
> nit: why not just do the strncmp early in this function since buf, key, 
> keylen have not changed?

I see what you mean, first check that the key/prefix matches and do the 
other checks, right?

I honestly don't remember if there was a special reason why I laid it 
out like it is. I know it is an annoyingly hot path and I did do many 
tweaks to bring the CPU utilisation low.

But thinking about it now, the strncmp at the start should indeed be 
more efficient so I will change it.

> 
>> +        return p;
>> +
>> +    return NULL;
>> +}
>> +
>> +bool
>> +__igt_parse_drm_fdinfo(int dir, const char *fd, struct 
>> drm_client_fdinfo *info)
>> +{
>> +    char buf[4096], *_buf = buf;
>> +    char *l, *ctx = NULL;
>> +    unsigned int good = 0;
>> +    size_t count;
>> +
> 
> Should buf be zeroed out here?

Right, either here or in read_fdinfo as mentioned above.

>> +    count = read_fdinfo(buf, sizeof(buf), dir, fd);
>> +    if (!count)
>> +        return false;
>> +
>> +    while ((l = strtok_r(_buf, "\n", &ctx))) {
>> +        uint64_t val = 0;
>> +        const char *v;
>> +        int idx;
>> +
>> +        _buf = NULL;
>> +
>> +        if ((v = find_kv(l, "drm-driver", strlen("drm-driver")))) {
>> +            strncpy(info->driver, v, sizeof(info->driver) - 1);
>> +            good++;
>> +        } else if ((v = find_kv(l, "drm-pdev", strlen("drm-pdev")))) {
>> +            strncpy(info->pdev, v, sizeof(info->pdev) - 1);
>> +        }  else if ((v = find_kv(l, "drm-client-id",
>> +                     strlen("drm-client-id")))) {
>> +            info->id = atol(v);
>> +            good++;
>> +        } else if (!strncmp(l, "drm-engine-", 11) &&
>> +               strncmp(l, "drm-engine-capacity-", 20)) {
>> +            idx = parse_engine(l, info, strlen("drm-engine-"),
>> +                       &val);
>> +            if (idx >= 0) {
>> +                if (!info->capacity[idx])
>> +                    info->capacity[idx] = 1;
>> +                info->busy[idx] = val;
>> +                info->num_engines++;
>> +            }
>> +        } else if (!strncmp(l, "drm-engine-capacity-", 20)) {
>> +            idx = parse_engine(l, info,
>> +                       strlen("drm-engine-capacity-"),
>> +                       &val);
>> +            if (idx >= 0)
>> +                info->capacity[idx] = val;
>> +        }
>> +    }
>> +
>> +    if (good < 2 || !info->num_engines)
>> +        return false; /* fdinfo format not as expected */
>> +
>> +    return true;
>> +}
>> +
>> +bool igt_parse_drm_fdinfo(int drm_fd, struct drm_client_fdinfo *info)
>> +{
>> +    char fd[64];
>> +    int dir, ret;
>> +    bool res;
>> +
>> +    ret = snprintf(fd, sizeof(fd), "%u", drm_fd);
>> +    if (ret < 0 || ret == sizeof(fd))
>> +        return false;
>> +
>> +    dir = open("/proc/self/fdinfo", O_DIRECTORY | O_RDONLY);
>> +    if (dir < 0)
>> +        return false;
>> +
>> +    res = __igt_parse_drm_fdinfo(dir, fd, info);
>> +
>> +    close(dir);
>> +
>> +    return res;
>> +}
>> diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
>> new file mode 100644
>> index 000000000000..c527bab9a204
>> --- /dev/null
>> +++ b/lib/igt_drm_fdinfo.h
>> @@ -0,0 +1,48 @@
>> +/*
>> + * Copyright © 2022 Intel Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person 
>> obtaining a
>> + * copy of this software and associated documentation files (the 
>> "Software"),
>> + * to deal in the Software without restriction, including without 
>> limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, 
>> sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice (including 
>> the next
>> + * paragraph) shall be included in all copies or substantial portions 
>> of the
>> + * Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
>> EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
>> MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT 
>> SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES 
>> OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
>> ARISING
>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR 
>> OTHER DEALINGS
>> + * IN THE SOFTWARE.
>> + *
>> + */
>> +
>> +#ifndef IGT_DRM_FDINFO_H
>> +#define IGT_DRM_FDINFO_H
>> +
>> +#include <sys/types.h>
>> +#include <dirent.h>
>> +#include <stdint.h>
>> +#include <stdbool.h>
>> +
>> +struct drm_client_fdinfo {
>> +    char driver[128];
>> +    char pdev[128];
>> +    unsigned long id;
>> +
>> +    unsigned int num_engines;
>> +    unsigned int capacity[16];
>> +    uint64_t busy[16];
> 
> I see 16 in a lot of places, wondering if it could use a #define?

I can see them here and one mention in igt_drm_clients. The latter it 
looks I can un-export igt_drm_client_update and make it take struct 
drm_client_fdinfo to better hide this.

And for here I will add a define like DRM_CLIENT_FDINFO_MAX_ENGINES.

Regards,

Tvrtko

> 
> Thanks,
> Umesh
> 
>> +};
>> +
>> +bool igt_parse_drm_fdinfo(int drm_fd, struct drm_client_fdinfo *info);
>> +
>> +bool __igt_parse_drm_fdinfo(int dir, const char *fd,
>> +                struct drm_client_fdinfo *info);
>> +
>> +#endif /* IGT_DRM_FDINFO_H */
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 3e43316d1e36..d00817dc58bc 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -16,6 +16,7 @@ lib_sources = [
>>     'igt_debugfs.c',
>>     'igt_device.c',
>>     'igt_device_scan.c',
>> +    'igt_drm_fdinfo.c',
>>     'igt_aux.c',
>>     'igt_gt.c',
>>     'igt_halffloat.c',
>> @@ -216,6 +217,12 @@ lib_igt_device_scan_build = 
>> static_library('igt_device_scan',
>> lib_igt_device_scan = declare_dependency(link_with : 
>> lib_igt_device_scan_build,
>>                   include_directories : inc)
>>
>> +lib_igt_drm_fdinfo_build = static_library('igt_drm_fdinfo',
>> +    ['igt_drm_fdinfo.c'],
>> +    include_directories : inc)
>> +
>> +lib_igt_drm_fdinfo = declare_dependency(link_with : 
>> lib_igt_drm_fdinfo_build,
>> +                  include_directories : inc)
>> i915_perf_files = [
>>   'igt_list.c',
>>   'i915/perf.c',
>> -- 
>> 2.32.0
>>

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E301537FBB2
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 18:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4245A6ED6B;
	Thu, 13 May 2021 16:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486626E0AA;
 Thu, 13 May 2021 16:41:01 +0000 (UTC)
IronPort-SDR: qqQgFYGuxfJV3qUVBuktYk5mgb7Wmq+44RUJ6g+T7Jgzq8Ir1qcxfuNgf8ZAUMZxdcSnj0E5p+
 PvH/4CkmwkJQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9983"; a="179582978"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="179582978"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 09:40:56 -0700
IronPort-SDR: zvpeWm9M9E54Zx0UAYT2cNnoDN6hVFBdMwaa+uLa7oDM2bP4B6zJSZ9sx46WEtDvdOyYh++dzK
 hsW6Ggpbj2gw==
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="626297750"
Received: from hcadcock-mobl1.ger.corp.intel.com (HELO [10.213.209.166])
 ([10.213.209.166])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 09:40:55 -0700
Subject: Re: [PATCH 0/7] Per client engine busyness
To: Alex Deucher <alexdeucher@gmail.com>
References: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
 <CADnq5_NEg4s2AWBTkjW7NXoBe+WB=qQUHCMPP6DcpGSLbBF-rg@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
Date: Thu, 13 May 2021 17:40:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CADnq5_NEg4s2AWBTkjW7NXoBe+WB=qQUHCMPP6DcpGSLbBF-rg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

On 13/05/2021 16:48, Alex Deucher wrote:
> On Thu, May 13, 2021 at 7:00 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Resurrect of the previosuly merged per client engine busyness patches. In a
>> nutshell it enables intel_gpu_top to be more top(1) like useful and show not
>> only physical GPU engine usage but per process view as well.
>>
>> Example screen capture:
>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> intel-gpu-top -  906/ 955 MHz;    0% RC6;  5.30 Watts;      933 irqs/s
>>
>>        IMC reads:     4414 MiB/s
>>       IMC writes:     3805 MiB/s
>>
>>            ENGINE      BUSY                                      MI_SEMA MI_WAIT
>>       Render/3D/0   93.46% |████████████████████████████████▋  |      0%      0%
>>         Blitter/0    0.00% |                                   |      0%      0%
>>           Video/0    0.00% |                                   |      0%      0%
>>    VideoEnhance/0    0.00% |                                   |      0%      0%
>>
>>    PID            NAME  Render/3D      Blitter        Video      VideoEnhance
>>   2733       neverball |██████▌     ||            ||            ||            |
>>   2047            Xorg |███▊        ||            ||            ||            |
>>   2737        glxgears |█▍          ||            ||            ||            |
>>   2128           xfwm4 |            ||            ||            ||            |
>>   2047            Xorg |            ||            ||            ||            |
>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
>> Internally we track time spent on engines for each struct intel_context, both
>> for current and past contexts belonging to each open DRM file.
>>
>> This can serve as a building block for several features from the wanted list:
>> smarter scheduler decisions, getrusage(2)-like per-GEM-context functionality
>> wanted by some customers, setrlimit(2) like controls, cgroups controller,
>> dynamic SSEU tuning, ...
>>
>> To enable userspace access to the tracked data, we expose time spent on GPU per
>> client and per engine class in sysfs with a hierarchy like the below:
>>
>>          # cd /sys/class/drm/card0/clients/
>>          # tree
>>          .
>>          ├── 7
>>          │   ├── busy
>>          │   │   ├── 0
>>          │   │   ├── 1
>>          │   │   ├── 2
>>          │   │   └── 3
>>          │   ├── name
>>          │   └── pid
>>          ├── 8
>>          │   ├── busy
>>          │   │   ├── 0
>>          │   │   ├── 1
>>          │   │   ├── 2
>>          │   │   └── 3
>>          │   ├── name
>>          │   └── pid
>>          └── 9
>>              ├── busy
>>              │   ├── 0
>>              │   ├── 1
>>              │   ├── 2
>>              │   └── 3
>>              ├── name
>>              └── pid
>>
>> Files in 'busy' directories are numbered using the engine class ABI values and
>> they contain accumulated nanoseconds each client spent on engines of a
>> respective class.
> 
> We did something similar in amdgpu using the gpu scheduler.  We then
> expose the data via fdinfo.  See
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=1774baa64f9395fa884ea9ed494bcb043f3b83f5
> https://cgit.freedesktop.org/drm/drm-misc/commit/?id=874442541133f78c78b6880b8cc495bab5c61704

Interesting!

Is yours wall time or actual GPU time taking preemption and such into 
account? Do you have some userspace tools parsing this data and how to 
do you client discovery? Presumably there has to be a better way that 
going through all open file descriptors?

Our implementation was merged in January but Daniel took it out recently 
because he wanted to have discussion about a common vendor framework for 
this whole story on dri-devel. I think. +Daniel to comment.

I couldn't find the patch you pasted on the mailing list to see if there 
was any such discussion around your version.

Regards,

Tvrtko

> 
> Alex
> 
> 
>>
>> Tvrtko Ursulin (7):
>>    drm/i915: Expose list of clients in sysfs
>>    drm/i915: Update client name on context create
>>    drm/i915: Make GEM contexts track DRM clients
>>    drm/i915: Track runtime spent in closed and unreachable GEM contexts
>>    drm/i915: Track all user contexts per client
>>    drm/i915: Track context current active time
>>    drm/i915: Expose per-engine client busyness
>>
>>   drivers/gpu/drm/i915/Makefile                 |   5 +-
>>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  61 ++-
>>   .../gpu/drm/i915/gem/i915_gem_context_types.h |  16 +-
>>   drivers/gpu/drm/i915/gt/intel_context.c       |  27 +-
>>   drivers/gpu/drm/i915/gt/intel_context.h       |  15 +-
>>   drivers/gpu/drm/i915/gt/intel_context_types.h |  24 +-
>>   .../drm/i915/gt/intel_execlists_submission.c  |  23 +-
>>   .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |   4 +
>>   drivers/gpu/drm/i915/gt/intel_lrc.c           |  27 +-
>>   drivers/gpu/drm/i915/gt/intel_lrc.h           |  24 ++
>>   drivers/gpu/drm/i915/gt/selftest_lrc.c        |  10 +-
>>   drivers/gpu/drm/i915/i915_drm_client.c        | 365 ++++++++++++++++++
>>   drivers/gpu/drm/i915/i915_drm_client.h        | 123 ++++++
>>   drivers/gpu/drm/i915/i915_drv.c               |   6 +
>>   drivers/gpu/drm/i915/i915_drv.h               |   5 +
>>   drivers/gpu/drm/i915/i915_gem.c               |  21 +-
>>   drivers/gpu/drm/i915/i915_gpu_error.c         |  31 +-
>>   drivers/gpu/drm/i915/i915_gpu_error.h         |   2 +-
>>   drivers/gpu/drm/i915/i915_sysfs.c             |   8 +
>>   19 files changed, 716 insertions(+), 81 deletions(-)
>>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
>>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h
>>
>> --
>> 2.30.2
>>

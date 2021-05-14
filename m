Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F88380A80
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 15:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843C26EE81;
	Fri, 14 May 2021 13:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286DD6EE80;
 Fri, 14 May 2021 13:42:16 +0000 (UTC)
IronPort-SDR: ei5KfmqN+Hmdg7IGKUrzb8m1sB5ni0XBu0vAOZo2nydXH2KyHvEj5Ce4ZAJ+WH52MxLOhcQ7Va
 J9bn9u2n3odA==
X-IronPort-AV: E=McAfee;i="6200,9189,9983"; a="264099805"
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; d="scan'208";a="264099805"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 06:42:14 -0700
IronPort-SDR: YpfR5AXkYzCYms6Uv/DpXNrhGSh9Y0HdnR6v+c520rgYLPa2D9dZZ5lhINAHDti7h/lFDWI4x5
 RwOurSPlms/w==
X-IronPort-AV: E=Sophos;i="5.82,299,1613462400"; d="scan'208";a="393640795"
Received: from ankitsi2-mobl.ger.corp.intel.com (HELO [10.213.242.91])
 ([10.213.242.91])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2021 06:42:12 -0700
Subject: Re: [PATCH 0/7] Per client engine busyness
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Nieto, David M" <David.Nieto@amd.com>, Alex Deucher <alexdeucher@gmail.com>
References: <20210513110002.3641705-1-tvrtko.ursulin@linux.intel.com>
 <CADnq5_NEg4s2AWBTkjW7NXoBe+WB=qQUHCMPP6DcpGSLbBF-rg@mail.gmail.com>
 <c6c61179-5b4b-4e0b-6e57-ec4839ca3268@linux.intel.com>
 <CADnq5_N03pz6GmptzhRnCRQH=qkd4eWuAbuUysHp-A9NZHQMHg@mail.gmail.com>
 <BYAPR12MB2840AA68BCAEBD9279C6184FF4509@BYAPR12MB2840.namprd12.prod.outlook.com>
 <39ccc2ef-05d1-d9f0-0639-ea86bef58b80@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <7d6d09fe-ec85-6aaf-9834-37a49ec7d6c5@linux.intel.com>
Date: Fri, 14 May 2021 14:42:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <39ccc2ef-05d1-d9f0-0639-ea86bef58b80@amd.com>
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


On 14/05/2021 09:04, Christian König wrote:
> Well in my opinion exposing it through fdinfo turned out to be a really 
> clean approach.
> 
> It describes exactly the per file descriptor information we need.

Yeah fdinfo certainly is mostly simple and neat.

I say mostly because main problem I see with it is discoverability. Alex 
commented in another sub-thread - "If you know the process, you can
look it up in procfs." - so that's fine for introspection but a bit 
challenging for a top(1) like tool.

David also said that you considered sysfs but were wary of exposing 
process info in there. To clarify, my patch is not exposing sysfs entry 
per process, but one per open drm fd.

Top level hierarchy is under /sys/class/drm/card0/clients/ and each 
opened drm fd gets a directory in there. Process data I expose there are 
the name and pid, but these are for convenience, not as a primary 
information.

But yes, I agree this part of the approach is definitely questionable. 
(As a side note, I am not sure if I could put a symlink to proc in 
there. I think sysfs and symlinks did not really work.)

Another data point is that this "client root" we think would be useful 
for adding other stuff in the future. For instance per client debug log 
stream is occasionally talked about.

> Making that device driver independent is potentially useful as well.

Alternative to my sysfs approach, the idea of exposing this in proc was 
floated by Chris in this series 
https://patchwork.freedesktop.org/series/86692/.

That would be generic enough so any GPU vendor can slot in, and common 
enough that GPU agnostic tools should be able to use it. Modulo some 
discussion around naming the "channels" (GPU engines) or not.

It wouldn't be able to support things like the before mentioned per 
client debug log stream but I guess that's not the most important thing. 
Most important would be allowing GPU usage to be wired to top(1) like 
tools which is probably even overdue given the modern computing landscape.

Would you guys be interested to give a more detailed look over both 
proposals and see if any would interest you?

Regards,

Tvrtko

> Regards,
> Christian.
> 
> Am 14.05.21 um 09:22 schrieb Nieto, David M:
>>
>> [AMD Official Use Only - Internal Distribution Only]
>>
>>
>> We had entertained the idea of exposing the processes as sysfs nodes 
>> as you proposed, but we had concerns about exposing process info in 
>> there, especially since /proc already exists for that purpose.
>>
>> I think if you were to follow that approach, we could have tools like 
>> top that support exposing GPU engine usage.
>> ------------------------------------------------------------------------
>> *From:* Alex Deucher <alexdeucher@gmail.com>
>> *Sent:* Thursday, May 13, 2021 10:58 PM
>> *To:* Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; Nieto, David M 
>> <David.Nieto@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
>> *Cc:* Intel Graphics Development <Intel-gfx@lists.freedesktop.org>; 
>> Maling list - DRI developers <dri-devel@lists.freedesktop.org>; Daniel 
>> Vetter <daniel@ffwll.ch>
>> *Subject:* Re: [PATCH 0/7] Per client engine busyness
>> + David, Christian
>>
>> On Thu, May 13, 2021 at 12:41 PM Tvrtko Ursulin
>> <tvrtko.ursulin@linux.intel.com> wrote:
>> >
>> >
>> > Hi,
>> >
>> > On 13/05/2021 16:48, Alex Deucher wrote:
>> > > On Thu, May 13, 2021 at 7:00 AM Tvrtko Ursulin
>> > > <tvrtko.ursulin@linux.intel.com> wrote:
>> > >>
>> > >> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> > >>
>> > >> Resurrect of the previosuly merged per client engine busyness 
>> patches. In a
>> > >> nutshell it enables intel_gpu_top to be more top(1) like useful 
>> and show not
>> > >> only physical GPU engine usage but per process view as well.
>> > >>
>> > >> Example screen capture:
>> > >> 
>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> > >> intel-gpu-top -  906/ 955 MHz;    0% RC6; 5.30 Watts;      933 irqs/s
>> > >>
>> > >>        IMC reads:     4414 MiB/s
>> > >>       IMC writes:     3805 MiB/s
>> > >>
>> > >>            ENGINE BUSY                                      
>> MI_SEMA MI_WAIT
>> > >>       Render/3D/0   93.46% |████████████████████████████████▋  
>> |      0%      0%
>> > >>         Blitter/0    0.00% |                                   
>> |      0%      0%
>> > >>           Video/0    0.00% |                                   
>> |      0%      0%
>> > >>    VideoEnhance/0    0.00% |                                   
>> |      0%      0%
>> > >>
>> > >>    PID            NAME  Render/3D Blitter        Video      
>> VideoEnhance
>> > >>   2733       neverball |██████▌ ||            ||            
>> ||            |
>> > >>   2047            Xorg |███▊ ||            ||            
>> ||            |
>> > >>   2737        glxgears |█▍ ||            ||            
>> ||            |
>> > >>   2128           xfwm4 | ||            ||            ||            |
>> > >>   2047            Xorg | ||            ||            ||            |
>> > >> 
>> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> > >>
>> > >> Internally we track time spent on engines for each struct 
>> intel_context, both
>> > >> for current and past contexts belonging to each open DRM file.
>> > >>
>> > >> This can serve as a building block for several features from the 
>> wanted list:
>> > >> smarter scheduler decisions, getrusage(2)-like per-GEM-context 
>> functionality
>> > >> wanted by some customers, setrlimit(2) like controls, cgroups 
>> controller,
>> > >> dynamic SSEU tuning, ...
>> > >>
>> > >> To enable userspace access to the tracked data, we expose time 
>> spent on GPU per
>> > >> client and per engine class in sysfs with a hierarchy like the below:
>> > >>
>> > >>          # cd /sys/class/drm/card0/clients/
>> > >>          # tree
>> > >>          .
>> > >>          ├── 7
>> > >>          │   ├── busy
>> > >>          │   │   ├── 0
>> > >>          │   │   ├── 1
>> > >>          │   │   ├── 2
>> > >>          │   │   └── 3
>> > >>          │   ├── name
>> > >>          │   └── pid
>> > >>          ├── 8
>> > >>          │   ├── busy
>> > >>          │   │   ├── 0
>> > >>          │   │   ├── 1
>> > >>          │   │   ├── 2
>> > >>          │   │   └── 3
>> > >>          │   ├── name
>> > >>          │   └── pid
>> > >>          └── 9
>> > >>              ├── busy
>> > >>              │   ├── 0
>> > >>              │   ├── 1
>> > >>              │   ├── 2
>> > >>              │   └── 3
>> > >>              ├── name
>> > >>              └── pid
>> > >>
>> > >> Files in 'busy' directories are numbered using the engine class 
>> ABI values and
>> > >> they contain accumulated nanoseconds each client spent on engines 
>> of a
>> > >> respective class.
>> > >
>> > > We did something similar in amdgpu using the gpu scheduler.  We then
>> > > expose the data via fdinfo.  See
>> > > 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D1774baa64f9395fa884ea9ed494bcb043f3b83f5&amp;data=04%7C01%7CDavid.Nieto%40amd.com%7C5e3c05578ef14be3692508d9169d55bf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637565687273144615%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=mt1EIL%2Fc9pHCXR%2FYSd%2BTr1e64XHoeYcdQ2cYufJ%2FcYQ%3D&amp;reserved=0 
>> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D1774baa64f9395fa884ea9ed494bcb043f3b83f5&amp;data=04%7C01%7CDavid.Nieto%40amd.com%7C5e3c05578ef14be3692508d9169d55bf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637565687273144615%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=mt1EIL%2Fc9pHCXR%2FYSd%2BTr1e64XHoeYcdQ2cYufJ%2FcYQ%3D&amp;reserved=0>
>> > > 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D874442541133f78c78b6880b8cc495bab5c61704&amp;data=04%7C01%7CDavid.Nieto%40amd.com%7C5e3c05578ef14be3692508d9169d55bf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637565687273144615%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2F3zMGw0LPTC1kG4NebTwUPTx7QCtEyw%2B4JToXDK5QXI%3D&amp;reserved=0 
>> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fcgit.freedesktop.org%2Fdrm%2Fdrm-misc%2Fcommit%2F%3Fid%3D874442541133f78c78b6880b8cc495bab5c61704&amp;data=04%7C01%7CDavid.Nieto%40amd.com%7C5e3c05578ef14be3692508d9169d55bf%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637565687273144615%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=%2F3zMGw0LPTC1kG4NebTwUPTx7QCtEyw%2B4JToXDK5QXI%3D&amp;reserved=0>
>> >
>> > Interesting!
>> >
>> > Is yours wall time or actual GPU time taking preemption and such into
>> > account? Do you have some userspace tools parsing this data and how to
>> > do you client discovery? Presumably there has to be a better way that
>> > going through all open file descriptors?
>>
>> Wall time.  It uses the fences in the scheduler to calculate engine
>> time.  We have some python scripts to make it look pretty, but mainly
>> just reading the files directly.  If you know the process, you can
>> look it up in procfs.
>>
>> >
>> > Our implementation was merged in January but Daniel took it out recently
>> > because he wanted to have discussion about a common vendor framework for
>> > this whole story on dri-devel. I think. +Daniel to comment.
>> >
>> > I couldn't find the patch you pasted on the mailing list to see if there
>> > was any such discussion around your version.
>>
>> It was on the amd-gfx mailing list.
>>
>> Alex
>>
>> >
>> > Regards,
>> >
>> > Tvrtko
>> >
>> > >
>> > > Alex
>> > >
>> > >
>> > >>
>> > >> Tvrtko Ursulin (7):
>> > >>    drm/i915: Expose list of clients in sysfs
>> > >>    drm/i915: Update client name on context create
>> > >>    drm/i915: Make GEM contexts track DRM clients
>> > >>    drm/i915: Track runtime spent in closed and unreachable GEM 
>> contexts
>> > >>    drm/i915: Track all user contexts per client
>> > >>    drm/i915: Track context current active time
>> > >>    drm/i915: Expose per-engine client busyness
>> > >>
>> > >> drivers/gpu/drm/i915/Makefile                 |   5 +-
>> > >> drivers/gpu/drm/i915/gem/i915_gem_context.c   |  61 ++-
>> > >> .../gpu/drm/i915/gem/i915_gem_context_types.h |  16 +-
>> > >> drivers/gpu/drm/i915/gt/intel_context.c       |  27 +-
>> > >> drivers/gpu/drm/i915/gt/intel_context.h       |  15 +-
>> > >> drivers/gpu/drm/i915/gt/intel_context_types.h |  24 +-
>> > >> .../drm/i915/gt/intel_execlists_submission.c  |  23 +-
>> > >> .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |   4 +
>> > >> drivers/gpu/drm/i915/gt/intel_lrc.c           |  27 +-
>> > >> drivers/gpu/drm/i915/gt/intel_lrc.h           |  24 ++
>> > >> drivers/gpu/drm/i915/gt/selftest_lrc.c        |  10 +-
>> > >> drivers/gpu/drm/i915/i915_drm_client.c        | 365 
>> ++++++++++++++++++
>> > >> drivers/gpu/drm/i915/i915_drm_client.h        | 123 ++++++
>> > >> drivers/gpu/drm/i915/i915_drv.c               |   6 +
>> > >> drivers/gpu/drm/i915/i915_drv.h               |   5 +
>> > >> drivers/gpu/drm/i915/i915_gem.c               |  21 +-
>> > >> drivers/gpu/drm/i915/i915_gpu_error.c         |  31 +-
>> > >> drivers/gpu/drm/i915/i915_gpu_error.h         |   2 +-
>> > >> drivers/gpu/drm/i915/i915_sysfs.c             |   8 +
>> > >>   19 files changed, 716 insertions(+), 81 deletions(-)
>> > >>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.c
>> > >>   create mode 100644 drivers/gpu/drm/i915/i915_drm_client.h
>> > >>
>> > >> --
>> > >> 2.30.2
>> > >>
> 

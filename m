Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2B23D5605
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 11:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DEC56E8D6;
	Mon, 26 Jul 2021 09:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531F06E8D6;
 Mon, 26 Jul 2021 09:01:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10056"; a="210300581"
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="210300581"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 02:01:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; d="scan'208";a="436704713"
Received: from jdonohue-mobl.ger.corp.intel.com (HELO [10.213.215.117])
 ([10.213.215.117])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 02:01:27 -0700
Subject: Re: [RFC 6/8] drm: Document fdinfo format specification
To: "Nieto, David M" <David.Nieto@amd.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>
References: <20210715091820.1613726-1-tvrtko.ursulin@linux.intel.com>
 <20210715091820.1613726-7-tvrtko.ursulin@linux.intel.com>
 <CAPj87rMxvq2c9uQ-ArvsLo2M7rXq=7LiJZ_XJwST=1VDhhNXRA@mail.gmail.com>
 <YPryorSobmlnGT1b@phenom.ffwll.local>
 <DM6PR12MB2841BE4BD79C3CFAED57029DF4E59@DM6PR12MB2841.namprd12.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <203f6a84-010c-354c-e82a-fc984cca8f66@linux.intel.com>
Date: Mon, 26 Jul 2021 10:01:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB2841BE4BD79C3CFAED57029DF4E59@DM6PR12MB2841.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: intel-gfx <Intel-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/07/2021 18:45, Nieto, David M wrote:
> [AMD Official Use Only]
> 
> 
> I just want to make a comment that with this approach (the ns) 
> calculating the percentage will take at least two reads of the fdinfo 
> per pid over some time. Some engines may be able to provide a single 
> shot percentage usage over an internal integration period. That is, for 
> example, what we currently have implemented for that exact reason.
> 
> I'd like to propose that we add an optional set of fields for this. 

Yes it is already like that in the text I've sent out. Because I was unclear how the amdgpu accounting works I called out for you guys to fill in the blanks in the last patch:

"""
Opens:
  * Does it work for AMD?
  * What are the semantics of AMD engine utilisation reported in percents?
    Can it align with what i915 does or needs to document the alternative
    in the specification document?

"""

"""
-- drm-engine-<str>: <uint> ns
+- drm-engine-<str>: <uint> [ns|%]
...
+Where time unit is given as a percentage...[AMD folks to fill the semantics
+and interpretation of that]...
"""

So if cumulative nanoseconds definitely do not work for you, could you please fill in those blanks?

> Also, I may have missed a message, but why did we remove the timstamp? 
> It is needed for accurate measurements of engine usage.

Hm I did not remove anything - I only renamed some of the fields output from amdgpu fdinfo.

Regards,

Tvrtko
  
> David
> ------------------------------------------------------------------------
> *From:* Daniel Vetter <daniel@ffwll.ch>
> *Sent:* Friday, July 23, 2021 9:47 AM
> *To:* Daniel Stone <daniel@fooishbar.org>
> *Cc:* Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>; intel-gfx 
> <Intel-gfx@lists.freedesktop.org>; Tvrtko Ursulin 
> <tvrtko.ursulin@intel.com>; Koenig, Christian 
> <Christian.Koenig@amd.com>; dri-devel <dri-devel@lists.freedesktop.org>; 
> Nieto, David M <David.Nieto@amd.com>
> *Subject:* Re: [RFC 6/8] drm: Document fdinfo format specification
> On Fri, Jul 23, 2021 at 05:43:01PM +0100, Daniel Stone wrote:
>> Hi Tvrtko,
>> Thanks for typing this up!
>> 
>> On Thu, 15 Jul 2021 at 10:18, Tvrtko Ursulin
>> <tvrtko.ursulin@linux.intel.com> wrote:
>> > +Mandatory fully standardised keys
>> > +---------------------------------
>> > +
>> > +- drm-driver: <str>
>> > +
>> > +String shall contain a fixed string uniquely identified the driver handling
>> > +the device in question. For example name of the respective kernel module.
>> 
>> I think let's be more prescriptive and just say that it is the module name.
> 
> Just a quick comment on this one.
> 
> drm_driver.name is already uapi, so let's please not invent a new one. The
> shared code should probably make sure drivers don't get this wrong. Maybe
> good if we document the getverion ioctl, which also exposes this, and then
> link between the two.
> -Daniel
> 
>> 
>> > +Optional fully standardised keys
>> > +--------------------------------
>> > +
>> > +- drm-pdev: <aaaa:bb.cc.d>
>> > +
>> > +For PCI devices this should contain the PCI slot address of the device in
>> > +question.
>> 
>> How about just major:minor of the DRM render node device it's attached to?
>> 
>> > +- drm-client-id: <uint>
>> > +
>> > +Unique value relating to the open DRM file descriptor used to distinguish
>> > +duplicated and shared file descriptors. Conceptually the value should map 1:1
>> > +to the in kernel representation of `struct drm_file` instances.
>> > +
>> > +Uniqueness of the value shall be either globally unique, or unique within the
>> > +scope of each device, in which case `drm-pdev` shall be present as well.
>> > +
>> > +Userspace should make sure to not double account any usage statistics by using
>> > +the above described criteria in order to associate data to individual clients.
>> > +
>> > +- drm-engine-<str>: <uint> ns
>> > +
>> > +GPUs usually contain multiple execution engines. Each shall be given a stable
>> > +and unique name (str), with possible values documented in the driver specific
>> > +documentation.
>> > +
>> > +Value shall be in specified time units which the respective GPU engine spent
>> > +busy executing workloads belonging to this client.
>> > +
>> > +Values are not required to be constantly monotonic if it makes the driver
>> > +implementation easier, but are required to catch up with the previously reported
>> > +larger value within a reasonable period. Upon observing a value lower than what
>> > +was previously read, userspace is expected to stay with that larger previous
>> > +value until a monotonic update is seen.
>> 
>> Yeah, that would work well for Mali/Panfrost. We can queue multiple
>> jobs in the hardware, which can either be striped across multiple
>> cores with an affinity mask (e.g. 3 cores for your client and 1 for
>> your compositor), or picked according to priority, or ...
>> 
>> The fine-grained performance counters (e.g. time spent waiting for
>> sampler) are only GPU-global. So if you have two jobs running
>> simultaneously, you have no idea who's responsible for what.
>> 
>> But it does give us coarse-grained counters which are accounted
>> per-job-slot, including exactly this metric: amount of 'GPU time'
>> (whatever that means) occupied by that job slot during the sampling
>> period. So we could support that nicely if we fenced job-slot updates
>> with register reads/writes.
>> 
>> Something I'm missing though is how we enable this information. Seems
>> like it would be best to either only do it whilst fdinfo is open (and
>> re-read it whenever you need an update), or on a per-driver sysfs
>> toggle, or ... ?
>> 
>> > +- drm-memory-<str>: <uint> [KiB|MiB]
>> > +
>> > +Each possible memory type which can be used to store buffer objects by the
>> > +GPU in question shall be given a stable and unique name to be returned as the
>> > +string here.
>> > +
>> > +Value shall reflect the amount of storage currently consumed by the buffer
>> > +object belong to this client, in the respective memory region.
>> > +
>> > +Default unit shall be bytes with optional unit specifiers of 'KiB' or 'MiB'
>> > +indicating kibi- or mebi-bytes.
>> 
>> I'm a bit wary of the accounting here. Is it buffer allocations
>> originating from the client, in which case it conceptually clashes
>> with gralloc? Is it the client which last wrote to the buffer? The
>> client with the oldest open handle to the buffer? Other?
>> 
>> Cheers,
>> Daniel
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7CDavid.Nieto%40amd.com%7Cda2d9f95ced44d09f66c08d94df991da%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637626556571460650%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=GrjAYg9tG2QX7z4BDaqa4wMPj2nFcvGo4xCmD8OzwNE%3D&amp;reserved=0 
> <https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fblog.ffwll.ch%2F&amp;data=04%7C01%7CDavid.Nieto%40amd.com%7Cda2d9f95ced44d09f66c08d94df991da%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637626556571460650%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=GrjAYg9tG2QX7z4BDaqa4wMPj2nFcvGo4xCmD8OzwNE%3D&amp;reserved=0>

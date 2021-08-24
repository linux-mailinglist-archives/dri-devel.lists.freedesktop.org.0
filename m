Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 651C13F5AFA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 11:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA2389FA5;
	Tue, 24 Aug 2021 09:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3314289FA5;
 Tue, 24 Aug 2021 09:26:04 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="204409108"
X-IronPort-AV: E=Sophos;i="5.84,346,1620716400"; d="scan'208";a="204409108"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 02:26:03 -0700
X-IronPort-AV: E=Sophos;i="5.84,346,1620716400"; d="scan'208";a="535719471"
Received: from smaji-mobl.ger.corp.intel.com (HELO [10.213.223.159])
 ([10.213.223.159])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 02:26:01 -0700
Subject: Re: [RFC 6/8] drm: Document fdinfo format specification
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>, David M Nieto <David.Nieto@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
References: <20210823112859.103561-1-tvrtko.ursulin@linux.intel.com>
 <20210823112859.103561-7-tvrtko.ursulin@linux.intel.com>
 <52ba613b-be4b-b9f4-5a9e-91c772b810cd@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <337f3b5d-f903-1eb4-9597-d00191dc8788@linux.intel.com>
Date: Tue, 24 Aug 2021 10:25:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <52ba613b-be4b-b9f4-5a9e-91c772b810cd@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 23/08/2021 14:32, Christian König wrote:
> Am 23.08.21 um 13:28 schrieb Tvrtko Ursulin:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Proposal to standardise the fdinfo text format as optionally output by 
>> DRM
>> drivers.
>>
>> Idea is that a simple but, well defined, spec will enable generic
>> userspace tools to be written while at the same time avoiding a more 
>> heavy
>> handed approach of adding a mid-layer to DRM.
>>
>> i915 implements a subset of the spec, everything apart from the memory
>> stats currently, and a matching intel_gpu_top tool exists.
>>
>> Open is to see if AMD can migrate to using the proposed GPU utilisation
>> key-value pairs, or if they are not workable to see whether to go
>> vendor specific, or if a standardised  alternative can be found which is
>> workable for both drivers.
>>
>> Same for the memory utilisation key-value pairs proposal.
>>
>> v2:
>>   * Update for removal of name and pid.
>>
>> v3:
>>   * 'Drm-driver' tag will be obtained from struct drm_driver.name. 
>> (Daniel)
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Cc: David M Nieto <David.Nieto@amd.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Daniel Stone <daniel@fooishbar.org>
> 
> I'm not an expert on that stuff, but as far as I can see this totally 
> makes sense to me.

Thanks!

> Feel free to add an Acked-by: Christian König <christian.koenig@amd.com> 
> to those three patches.

However note that the last one is full of TODO markers, including the 
commit message, where I was hoping to nudge the feature owners of the 
amdgpu side to fill in the blanks in my understanding of how things work 
over there. At least the different semantics need to be documented so 
random userspace can interpret the amdgpu values correctly.

Or alternatively I drop the last patch and if someone is interested they 
can resurrect and complete it at their leisure.

Just not sure how Daniel would accept this since his push was to gate 
i915 addition behind a drive for common solution.

Regards,

Tvrtko

>> ---
>>   Documentation/gpu/drm-usage-stats.rst | 97 +++++++++++++++++++++++++++
>>   Documentation/gpu/index.rst           |  1 +
>>   2 files changed, 98 insertions(+)
>>   create mode 100644 Documentation/gpu/drm-usage-stats.rst
>>
>> diff --git a/Documentation/gpu/drm-usage-stats.rst 
>> b/Documentation/gpu/drm-usage-stats.rst
>> new file mode 100644
>> index 000000000000..c669026be244
>> --- /dev/null
>> +++ b/Documentation/gpu/drm-usage-stats.rst
>> @@ -0,0 +1,97 @@
>> +.. _drm-client-usage-stats:
>> +
>> +======================
>> +DRM client usage stats
>> +======================
>> +
>> +DRM drivers can choose to export partly standardised text output via the
>> +`fops->show_fdinfo()` as part of the driver specific file operations 
>> registered
>> +in the `struct drm_driver` object registered with the DRM core.
>> +
>> +One purpose of this output is to enable writing as generic as practicaly
>> +feasible `top(1)` like userspace monitoring tools.
>> +
>> +Given the differences between various DRM drivers the specification 
>> of the
>> +output is split between common and driver specific parts. Having said 
>> that,
>> +wherever possible effort should still be made to standardise as much as
>> +possible.
>> +
>> +File format specification
>> +=========================
>> +
>> +- File shall contain one key value pair per one line of text.
>> +- Colon character (`:`) must be used to delimit keys and values.
>> +- All keys shall be prefixed with `drm-`.
>> +- Whitespace between the delimiter and first non-whitespace character 
>> shall be
>> +  ignored when parsing.
>> +- Neither keys or values are allowed to contain whitespace characters.
>> +- Numerical key value pairs can end with optional unit string.
>> +- Data type of the value is fixed as defined in the specification.
>> +
>> +Key types
>> +---------
>> +
>> +1. Mandatory, fully standardised.
>> +2. Optional, fully standardised.
>> +3. Driver specific.
>> +
>> +Data types
>> +----------
>> +
>> +- <uint> - Unsigned integer without defining the maximum value.
>> +- <str> - String excluding any above defined reserved characters or 
>> whitespace.
>> +
>> +Mandatory fully standardised keys
>> +---------------------------------
>> +
>> +- drm-driver: <str>
>> +
>> +String shall contain the name this driver registered as via the 
>> respective
>> +`struct drm_driver` data structure.
>> +
>> +Optional fully standardised keys
>> +--------------------------------
>> +
>> +- drm-pdev: <aaaa:bb.cc.d>
>> +
>> +For PCI devices this should contain the PCI slot address of the 
>> device in
>> +question.
>> +
>> +- drm-client-id: <uint>
>> +
>> +Unique value relating to the open DRM file descriptor used to 
>> distinguish
>> +duplicated and shared file descriptors. Conceptually the value should 
>> map 1:1
>> +to the in kernel representation of `struct drm_file` instances.
>> +
>> +Uniqueness of the value shall be either globally unique, or unique 
>> within the
>> +scope of each device, in which case `drm-pdev` shall be present as well.
>> +
>> +Userspace should make sure to not double account any usage statistics 
>> by using
>> +the above described criteria in order to associate data to individual 
>> clients.
>> +
>> +- drm-engine-<str>: <uint> ns
>> +
>> +GPUs usually contain multiple execution engines. Each shall be given 
>> a stable
>> +and unique name (str), with possible values documented in the driver 
>> specific
>> +documentation.
>> +
>> +Value shall be in specified time units which the respective GPU 
>> engine spent
>> +busy executing workloads belonging to this client.
>> +
>> +Values are not required to be constantly monotonic if it makes the 
>> driver
>> +implementation easier, but are required to catch up with the 
>> previously reported
>> +larger value within a reasonable period. Upon observing a value lower 
>> than what
>> +was previously read, userspace is expected to stay with that larger 
>> previous
>> +value until a monotonic update is seen.
>> +
>> +- drm-memory-<str>: <uint> [KiB|MiB]
>> +
>> +Each possible memory type which can be used to store buffer objects 
>> by the
>> +GPU in question shall be given a stable and unique name to be 
>> returned as the
>> +string here.
>> +
>> +Value shall reflect the amount of storage currently consumed by the 
>> buffer
>> +object belong to this client, in the respective memory region.
>> +
>> +Default unit shall be bytes with optional unit specifiers of 'KiB' or 
>> 'MiB'
>> +indicating kibi- or mebi-bytes.
>> diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
>> index b9c1214d8f23..b99dede9a5b1 100644
>> --- a/Documentation/gpu/index.rst
>> +++ b/Documentation/gpu/index.rst
>> @@ -10,6 +10,7 @@ Linux GPU Driver Developer's Guide
>>      drm-kms
>>      drm-kms-helpers
>>      drm-uapi
>> +   drm-usage-stats
>>      driver-uapi
>>      drm-client
>>      drivers
> 

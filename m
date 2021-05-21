Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E618A38C67A
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 14:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE836E4AA;
	Fri, 21 May 2021 12:27:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44436E4AA;
 Fri, 21 May 2021 12:26:59 +0000 (UTC)
IronPort-SDR: rfX4sT2/U0fecP0QtjTnx4tARn+rRIV/ePwsMXxxl7D3NTI+eezE3QqQxt/fdXXNHtYor6d6BH
 ZM2+Q/aD7qrA==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="199528914"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="199528914"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 05:26:59 -0700
IronPort-SDR: rECR73jZIUZT5rcch2f7cc7udzLP/T4zNg5LznAyHE5XQx9R8oUS2HoNhZtkdLyvRgxZHFdgyU
 GFhwJu7exXMw==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; d="scan'208";a="474503425"
Received: from damienpo-mobl.ger.corp.intel.com (HELO [10.213.241.253])
 ([10.213.241.253])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2021 05:26:57 -0700
Subject: Re: [RFC 7/7] drm/i915: Expose client engine utilisation via fdinfo
To: Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210520151254.959958-1-tvrtko.ursulin@linux.intel.com>
 <20210520151254.959958-8-tvrtko.ursulin@linux.intel.com>
 <BYAPR12MB28401B22CACDC249926C0A19F42A9@BYAPR12MB2840.namprd12.prod.outlook.com>
 <38a6d339-bca5-13f0-1cc8-db96f1b587bb@amd.com>
 <CAKMK7uEKwWhfMDrBUh394U99bXipHrAb+YUCOryOV-FU4k07Eg@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <1159220c-1a40-3e38-5885-2c8c72408da0@linux.intel.com>
Date: Fri, 21 May 2021 13:26:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uEKwWhfMDrBUh394U99bXipHrAb+YUCOryOV-FU4k07Eg@mail.gmail.com>
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
Cc: "Intel-gfx@lists.freedesktop.org" <Intel-gfx@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Nieto,
 David M" <David.Nieto@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 20/05/2021 18:47, Daniel Vetter wrote:
> On Thu, May 20, 2021 at 6:31 PM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> Yeah, having the timestamp is a good idea as well.
>>
>>    drm-driver: i915
>>
>> I think we should rather add something like printing file_operations->owner->name to the common fdinfo code.
>>
>> This way we would have something common for all drivers in the system. I'm just not sure if that also works if they are compiled into the kernel.
> 
> Yeah common code could print driver name, busid and all that stuff. I
> think the common code should also provide some helpers for the key:
> value pair formatting (and maybe check for all lower-case and stuff
> like that) because if we don't then this is going to be a complete
> mess that's not parseable.

I see we could have a few options here, non exhaustive list (especially 
omitting some sub-options):

1)
DRM core implements fdinfo, which emits the common parts, calling into 
the driver to do the rest.

2)
DRM adds helpers for driver to emit common parts of fdinfo.

3)
DRM core establishes a "spec" defining the common fields, the optional 
ones, and formats.

I was trending towards 3) because it is most lightweight and feeling is 
there isn't that much value in extracting a tiny bit of commonality in 
code. Proof in the pudding is how short the fdinfo vfunc is in this patch.

> And value should be real semantic stuff, not "here's a string". So
> accumulated time as a struct ktime as the example.

Ideally yes, but I have a feeling the ways how amdgpu and i915 track 
things are so different so first lets learn more about that.

>> Am 20.05.21 um 18:26 schrieb Nieto, David M:
>>
>> [AMD Official Use Only]
>>
>>
>> i would like to add a unit marker for the stats that we monitor in the fd, as we discussed currently we are displaying the usage percentage, because we wanted to to provide single query percentages, but this may evolve with time.
>>
>> May I suggest to add two new fields
>>
>> drm-stat-interval: <64 bit> ns
>> drm-stat-timestamp: <64 bit> ns
>>
>> If interval is set, engine utilization is calculated by doing <perc render> = 100*<drm_engine_render>/<drm_stat_interval>
>> if interval is not set, two reads are needed : <perc render> = 100*<drm_engine_render1 - drm_engine_render0> / <drm-stat-timestamp1 - drm-stat-timestamp0>

I would like to understand how admgpu tracks GPU time since I am not 
getting these fields yet.

1)
You suggest to have a timestamp because of different clock domains?

2)
With the interval option - you actually have a restarting counter? Do 
you keep that in the driver or get it from hw itself?

Regards,

Tvrtko

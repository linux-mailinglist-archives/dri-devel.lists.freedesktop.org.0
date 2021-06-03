Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FE6399D20
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 10:51:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0604F6F454;
	Thu,  3 Jun 2021 08:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38786F454;
 Thu,  3 Jun 2021 08:51:28 +0000 (UTC)
IronPort-SDR: zeB2LUt1EFgAQ0InMK8+raCDENDCBCcPFP4vEU4NH5oPhlXyjW0acGZ9Z0MWzwXvigXNmi3Oaq
 q/s/l9/hlyQA==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="265172766"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="265172766"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 01:51:23 -0700
IronPort-SDR: dgNoywGgpDz8gy+jvgdiOhZv3LOLFHWHVBmuH+4NOvneBaU6KcOyvqJtNBgHuZycLbPKnHoAPA
 JaC3I8BJjkvw==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="483390583"
Received: from aburk3x-mobl2.ger.corp.intel.com (HELO [10.213.243.139])
 ([10.213.243.139])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 01:51:21 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 00/97] Basic GuC submission support in the
 i915
To: Matthew Brost <matthew.brost@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <de3965d8-d997-5685-0399-646d8823a27f@linux.intel.com>
 <20210525164504.GA9971@sdutt-i7>
 <d76ab0ec-4f0c-19ed-adaa-ed227af63c0e@linux.intel.com>
 <20210603041020.GA10469@sdutt-i7>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <0e95011d-2b68-d215-c2aa-2c95c4e4c466@linux.intel.com>
Date: Thu, 3 Jun 2021 09:51:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603041020.GA10469@sdutt-i7>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: jason.ekstrand@intel.com, daniel.vetter@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/06/2021 05:10, Matthew Brost wrote:
> On Wed, Jun 02, 2021 at 04:27:18PM +0100, Tvrtko Ursulin wrote:
>>
>> On 25/05/2021 17:45, Matthew Brost wrote:

[snip]

>>>>    * Kludgy way of interfacing with rest of the driver instead of refactoring
>>>> to fit (idling, breadcrumbs, scheduler, tasklets, ...).
>>>>
>>>
>>> Idling and breadcrumbs seem clean to me. Scheduler + tasklet are going
>>> away once the DRM scheduler lands. No need rework those as we are just
>>> going to rework this again.
>>
>> Well today I read the breadcrumbs patch and there is no way that's clean. It
>> goes and creates one object per engine, then deletes them, replacing with
>> GuC special one. All in the same engine setup. The same pattern of bolting
>> on the GuC repeats too much for my taste.
>>
> 
> I don't think creating a default object /w a ref count then decrementing
> the ref count + replacing it with a new object is that hard to
> understand. IMO that is way better than how things worked previously

It's not about it being hard to understand, although it certainly is far 
from the usual patterns, but about it being lazy design which in normal 
times would never be allowed. Because reduced and flattened to highlight 
the principal complaint it looks like this:

engine_setup_for_each_engine:
    engine->breadcrumbs = create_breadcrumbs();
    if (guc) {
       if (!first_class_engine) {
         kfree(engine->breadcrumbs);
         engine->breadcrumbs = first_class_engine->breadcrumbs;
       } else {
         first_class_engine->breadcrumbs->vfuncs = guc_vfuncs;
       }
    }

What I suggested is that patch should not break and hack the object 
oriented design and instead could do along the lines:

gt_guc_setup:
    for_each_class:
       gt->uc.breadcrumbs[class] = create_guc_breadcrumbs();

engine_setup_for_each_engine:
    if (guc)
       engine->breadcrumbs = get(gt->uc.breadcrumbs[class]);
    else
       engine->breadcrumbs = create_breadcrumbs();

> where we just made implicit assumptions all over the driver of the
> execlists backend behavior. If this was done properly in the current
> i915 code base this really wouldn't be an issue.

Don't really follow you here but it probably goes back to how upstream 
code was there available to be refactored all this time.

Regards,

Tvrtko

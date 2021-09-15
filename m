Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE5C40C1A7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 10:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627E46E8E7;
	Wed, 15 Sep 2021 08:24:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD5F6E8E5;
 Wed, 15 Sep 2021 08:24:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="307806045"
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; d="scan'208";a="307806045"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 01:24:18 -0700
X-IronPort-AV: E=Sophos;i="5.85,294,1624345200"; d="scan'208";a="544740938"
Received: from emurray1-mobl1.ger.corp.intel.com (HELO [10.213.236.35])
 ([10.213.236.35])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 01:24:17 -0700
Subject: Re: [Intel-gfx] [PATCH 08/27] drm/i915: Add logical engine mapping
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-9-matthew.brost@intel.com>
 <c599bfef-418f-9a25-9e90-c20117dc4665@linux.intel.com>
 <20210910194955.GA24003@jons-linux-dev-box>
 <d95ee5e5-7118-cd98-49c0-964f22ade45d@linux.intel.com>
 <20210913165029.GA8526@jons-linux-dev-box>
 <68b40289-b8c6-9740-b1a6-f37ea4ffc2f7@linux.intel.com>
 <20210914180436.GA11006@jons-linux-dev-box>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <04d062aa-1978-ec0d-5905-a9914fd5e2f9@linux.intel.com>
Date: Wed, 15 Sep 2021 09:24:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914180436.GA11006@jons-linux-dev-box>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 14/09/2021 19:04, Matthew Brost wrote:
> On Tue, Sep 14, 2021 at 09:34:08AM +0100, Tvrtko Ursulin wrote:
>>

8<

>> Today we have:
>>
>> for_each intel_engines: // intel_engines is a flat list of all engines
>> 	intel_engine_setup()
>>
>> You propose to change it to:
>>
>> for_each engine_class:
>>     for 0..max_global_engine_instance:
>>        for_each intel_engines:
>>           skip engine not present
>>           skip class not matching
>>
>>           count logical instance
>>
>>     for_each intel_engines:
>>        skip engine not present
>>        skip wrong class
>>
>>        intel_engine_setup()
>>
>>
>> I propose:
>>
>> // Leave as is:
>>
>> for_each intel_engines:
>>     intel_engine_setup()
>>
>> // Add:
>>
>> for_each engine_class:
>>     logical = 0
>>     for_each gt->engine_class[class]:
>>        skip engine not present
>>
>>        engine->logical_instance = logical++
>>
>>
>> When code which actually needs a preturbed "map" arrives you add that in to
>> this second loop.
>>
> 
> See above, why introduce an algorithm that doesn't work for future parts
> + future patches are land imminently? It makes zero sense whatsoever.
> With your proposal we would literally land code to just throw it away a
> couple of months from now + break patches we intend to land soon. This

It sure works, it just walks the per class list instead of walking the 
flat list skipping one class at the time.

Just add the map based transformation to the second pass later, when it 
becomes required.

> algorithm works and has no reason whatsoever to be optimal as it a one
> time setup call. I really don't understand why we are still talking
> about this paint color.

I don't think bike shedding is not an appropriate term when complaint is 
how proposed algorithm is needlessly complicated.

Regards,

Tvrtko

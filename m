Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B699351485
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 13:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC276EC90;
	Thu,  1 Apr 2021 11:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F226E175;
 Thu,  1 Apr 2021 11:38:19 +0000 (UTC)
IronPort-SDR: dgpZbv4/eabFt+TEiC+tH/Qp0+M42DBnTHyRcCdxcHkajTgLE5TrGLvKjiGVoi48vpRrpYLrfi
 g1YcViBLl4jQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="277412152"
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="277412152"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 04:38:19 -0700
IronPort-SDR: cXAAwLBPety1yVNKU0RUlCjQl8np80M95+7XNmPmC4da4bm8MkM+tuUTcXLnpVJ2rlrnUCtnO0
 kMtwtXvruMWg==
X-IronPort-AV: E=Sophos;i="5.81,296,1610438400"; d="scan'208";a="455949863"
Received: from shaneken-mobl.ger.corp.intel.com (HELO [10.213.202.146])
 ([10.213.202.146])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2021 04:38:17 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915/pmu: Check actual RC6 status
To: "Tamminen, Eero T" <eero.t.tamminen@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
References: <20210331101850.2582027-1-tvrtko.ursulin@linux.intel.com>
 <YGWQB+8gWgmZ/6Mg@intel.com>
 <2c813fb2-6836-1888-f606-25ef1321a366@linux.intel.com>
 <YGWYZffWGb6zPvzj@intel.com>
 <a6d8cdfca6c642ef441c6ec104c8cf74b378bc02.camel@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <09ef3e30-4ca0-144f-af0a-358691f2fedb@linux.intel.com>
Date: Thu, 1 Apr 2021 12:38:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a6d8cdfca6c642ef441c6ec104c8cf74b378bc02.camel@intel.com>
Content-Language: en-US
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 01/04/2021 11:24, Tamminen, Eero T wrote:
> Hi,
> 
> On Thu, 2021-04-01 at 05:54 -0400, Rodrigo Vivi wrote:
>> On Thu, Apr 01, 2021 at 10:38:11AM +0100, Tvrtko Ursulin wrote:
> ...
>>> I think it is possible to argue both ways.
>>>
>>> 1)
>>> HAS_RC6 means hardware has RC6 so if we view PMU as very low level
>>> we can
>>> say always export it.
>>>
>>> If i915 had to turn it off (rc6->supported == false) due firmware or
>>> GVT-g,
>>> then we could say reporting zero RC6 is accurate in that sense. Only
>>> the
>>> reason "why it is zero" is missing for PMU users.
>>>
>>> 2)
>>> Or if we go with this patch we could say that presence of the PMU
>>> metric
>>> means RC6 is active and enabled, while absence means it is either
>>> not
>>> supported due platform (or firmware) or how the platform is getting
>>> used
>>> (GVT-g).
>>>
>>
>> yeap, these 2 cases described well my mental conflict...
>>
>>> So I think patch is a bit better. I don't see it is adding more
>>> confusion.
>>
>> As I said on the other patch I have no strong position on which is
>> better,
>> but if you and Eero feel that this works better for the current case,
>> let's do it...
> 
> IMHO seeing case 1) i.e. zero RC6 could be slightly better from user
> point of view than not seeing RC6 at all, because:
> 
> A) user then knows that GPU is not entering RC6, and
> 
> B) then the question is why it's not going to RC6 => one can see from
> sysfs that it has been disabled
> 
> 
> Whereas in case 2), the question is why there's no RC6 info, and user
> doesn't know whether GPU is suspended or not (i.e. why GPU power
> consumption is higher than expected).  It would help if i-g-t could show
> e.g. "RC6 OFF" in that case.

So many options.. :)

It can be handle on the "presentation" layer (intel_gpu_top). If we go 
with this patch but different errnos it could indeed distinguish and 
either not show RC6 or say "RC6 OFF".

If we go with the other patch 
(https://patchwork.freedesktop.org/patch/426589/?series=88580&rev=1) 
then intel_gpu_top could really still do the same by looking at 
/sys/class/drm/card0/power/rc6_enable.

So strictly no i915 patch is even needed to provide clarity in 
intel_gpu_top.

But still one of those two i915 patches is required to improve how 
low-level Perf/PMU RC6 counter gets exposed (or not exposed). I don't 
have a strong preference which one to take either. :)

Regards,

Tvrtko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

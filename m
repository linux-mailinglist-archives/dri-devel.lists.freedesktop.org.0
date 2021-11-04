Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AAA445087
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 09:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC9736EC25;
	Thu,  4 Nov 2021 08:44:02 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21EA6EC11;
 Thu,  4 Nov 2021 08:44:00 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="295114850"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="295114850"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 01:44:00 -0700
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="501442008"
Received: from knallape-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.209.89.98])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 01:43:59 -0700
From: Jordan Justen <jordan.l.justen@intel.com>
To: John Harrison <john.c.harrison@intel.com>, Intel-GFX@Lists.FreeDesktop.Org
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915/uapi: Add query for
 hwconfig table
In-Reply-To: <0ece155d-3d35-5fd4-f449-87c2a8de0f55@intel.com>
References: <20210916184012.2642295-1-John.C.Harrison@Intel.com>
 <20210916184012.2642295-3-John.C.Harrison@Intel.com>
 <877ddr51i5.fsf@jljusten-skl>
 <e2aff696-917c-e57d-f4ef-dafd90b669db@intel.com>
 <871r3w5383.fsf@jljusten-skl>
 <0ece155d-3d35-5fd4-f449-87c2a8de0f55@intel.com>
Date: Thu, 04 Nov 2021 01:43:59 -0700
Message-ID: <87tugs2tv4.fsf@jljusten-skl>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Kenneth Graunke <kenneth.w.graunke@intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Slawomir Milczarek <slawomir.milczarek@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

John Harrison <john.c.harrison@intel.com> writes:

> On 11/3/2021 14:38, Jordan Justen wrote:
>> So, i915 wants to wash it's hands completely of the format? There is
>> obviously a difference between hardware features and a blob coming from
>> closed source software. (Which i915 just happens to be passing along.)
>> The hardware is a lot more difficult to change...
> Actually, no. The table is not "coming from closed source software". The 
> table is defined by hardware specs. It is a table of hardware specific 
> values.

So, guc literally reads this info from the hardware verbatim? Then gives
it to i915 so i915 can give it to UMDs? Otherwise, it seems like a table
in software. Anyway...

>> It seems like these details should be dropped from the i915 patch commit
>> message since i915 wants nothing to do with it.
> Sure. Can remove comments.

Obviously not what should be done, but apparently all i915 is willing to
do.

>> I would think it'd be preferable for i915 to stand behind the basic blob
>> format as is (even if the keys/values can't be defined), and make a new
>> query item if the closed source software changes the format.
> Close source software is not allowed to change the format because closed 
> source software has no say in defining the format.

So, why can't i915 define this extremely simple (apparently
unchangeable) blob format, and thereby guarantee that it will have to
insulate UMDs if the format changes by making a different query item? It
ought to be made painful for everyone if this blob format changes.
Hopefully the format will basically never change. (Even if new
keys/values might be added.)

Further, it seems there is an implication that the keys will always be
backward compatible. Is that true, and if so, how can there be harm in
i915 enumerating the "known" ones?

>> Of course, it'd be even better if i915 could define some keys/values as
>> well. (Or if a spec could be released to help document / tie down the
>> format.)
> See the corresponding IGT test that details all the currently defined keys.

i915 can't/won't say anything about it, but look at this unmerged IGT
test? In the next sentence you'll say, but don't count on that because
IGT really has no control over it. :)

>>>>> The attribute ids are defined in a hardware spec.
>>>> Which spec?
>>> Unfortunately, it is not one that is currently public. We are pushing
>>> the relevant people to get it included in the public bspec / HRM. It is
>>> a slow process :(.
>>>
>> Right. I take it no progress has been made in the 1.5 months since you
>> posted this, so it'll probably finally be documented 6~12 months after
>> hardware is available? :)

Apparently all the data for this spec is "available" (in an unmerged IGT
patch), but am I correct in assuming that no actual spec timeframe is
defined?

-Jordan

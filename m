Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFA43876F1
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 12:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FB16E86E;
	Tue, 18 May 2021 10:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B466E86D;
 Tue, 18 May 2021 10:51:33 +0000 (UTC)
IronPort-SDR: T3y7i5T3Yo+6eb4xCcFpQ3QyDi12QgjE+LBn7lpLYLWghMkvK2SgLHXHhDsl9Cmo4yStr5ZWJE
 DBlfhQoGwOCg==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="180284290"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="180284290"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 03:51:33 -0700
IronPort-SDR: RrXmQEPiQ70JcTEf575KxteBSRICRbOCKfskXyJkqv4NurxWrNDR/eAwYbGmBe75p5krTYWi6p
 bCekGYseySLQ==
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="472892846"
Received: from lmrad-mobl.ger.corp.intel.com (HELO localhost) ([10.252.52.115])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 03:51:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 19/27] drm/i915/gem: Use the proto-context to handle
 create parameters
In-Reply-To: <CAKMK7uE47sVtZ+JrVkVd+DqdaG+zxAR4xbC1C4ctTrJXT+mEgA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210503155748.1961781-1-jason@jlekstrand.net>
 <20210503155748.1961781-20-jason@jlekstrand.net>
 <YJGvhfiKTILPsAG/@phenom.ffwll.local>
 <CAOFGe96JZqVxN4btQdqHvrMUm+bgRmSTiNBvQ9fXX36JUnDM=A@mail.gmail.com>
 <YKJyUhkvtq9k9DU0@phenom.ffwll.local>
 <CAOFGe97dM5H8nKvHxamm2mzMvzipLKCK-p1VR+WVeZBWzEk9QA@mail.gmail.com>
 <CAKMK7uE47sVtZ+JrVkVd+DqdaG+zxAR4xbC1C4ctTrJXT+mEgA@mail.gmail.com>
Date: Tue, 18 May 2021 13:51:27 +0300
Message-ID: <878s4cfh74.fsf@intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 May 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Mon, May 17, 2021 at 7:05 PM Jason Ekstrand <jason@jlekstrand.net> wrote:
>>
>> On Mon, May 17, 2021 at 8:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>> >
>> > On Fri, May 14, 2021 at 02:13:57PM -0500, Jason Ekstrand wrote:
>> > > I can add those.  I just don't know where to put it.  We don't have an
>> > > i915_gem_vm.h.  Suggestions?
>> >
>> > gt/intel_gtt.h seems to be the header for i915_address_space stuff. Also
>> > contains the i915_vma_ops but not i915_vma.
>> >
>> > It's a pretty good mess, but probably the best place for now for these :-/
>>
>> The one for contexts is in i915_drv.h so I put the VM one there too.
>> Feel free to tell me to move it.  I don't care where it goes.
>
> i915_drv.h is the og dumping ground and needs to die. Everything in
> there needs to be moved out/split/whatever for better code
> organization. If we have a place already that fits better (even if
> maybe misnamed) it's better to put it there.

I haven't really codified this anywhere, but this is what I've been
trying to drive:

* All functions in a .c file are declared in the corresponding .h
  file. 1:1 relationship.

* Have _types.h headers separately for defining types that lead to deep
  include chains. (We have this in part because we have absolutely
  everything in struct drm_i915_private, and everything needs everything
  else to look inside i915.)

* Minimize includes from headers. Prefer forward declarations where
  possible. Prefer specific includes over generic includes.

* Each header is self-contained (this is build-tested with
  CONFIG_DRM_I915_WERROR=y).

* Avoid static inlines unless you have a performance need.

* Don't have any externs. Interfaces over data; data is not an
  interface.

* Prefix functions in a file according to the filename. intel_foo.[ch]
  would have functions intel_foo_*(). Ditto i915_bar.[ch] and
  i915_bar_*(). (Avoid non-static platform specific functions, but if
  you have them, you'd name them e.g. skl_foo_*().)

Basically the rationale is to have more order in the chaos that we've
had for a long time. It's not so much about being pedantic about the
naming, but rather the secondary effect of making people think about
where they put stuff and how it's all grouped together.

IMO it's also easier to add file.[ch] and nuke it later than add stuff
to some of our huge files and then clean it up later.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C78254206BC
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 09:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0DC6E938;
	Mon,  4 Oct 2021 07:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CB06E937;
 Mon,  4 Oct 2021 07:39:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10126"; a="248576636"
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="248576636"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 00:39:39 -0700
X-IronPort-AV: E=Sophos;i="5.85,345,1624345200"; d="scan'208";a="712309343"
Received: from pmittal1-mobl.gar.corp.intel.com (HELO localhost)
 ([10.251.223.27])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 00:39:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hugh Dickins <hughd@google.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Hugh Dickins <hughd@google.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Caz Yokoyama <caz.yokoyama@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [BUG 5.15-rc3] kernel BUG at
 drivers/gpu/drm/i915/i915_sw_fence.c:245!
In-Reply-To: <7bad278d-ff81-21aa-48a-b46b9453b2b@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211002020257.34a0e882@oasis.local.home>
 <259ff554-76b8-8523-033-9e996f549c70@google.com>
 <20211002081750.7eec92dd@oasis.local.home>
 <CAHk-=whJsD3RaqpmAMv7yjpnQqrEuXvibXZZDY7f-nzO+PvULg@mail.gmail.com>
 <7bad278d-ff81-21aa-48a-b46b9453b2b@google.com>
Date: Mon, 04 Oct 2021 10:39:29 +0300
Message-ID: <87mtnp2q8e.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 02 Oct 2021, Hugh Dickins <hughd@google.com> wrote:
> On Sat, 2 Oct 2021, Linus Torvalds wrote:
>> On Sat, Oct 2, 2021 at 5:17 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>> > On Sat, 2 Oct 2021 03:17:29 -0700 (PDT)
>> > Hugh Dickins <hughd@google.com> wrote:
>> >
>> > > Yes (though bisection doesn't work right on this one): the fix
>> >
>> > Interesting, as it appeared to be very reliable. But I didn't do the
>> > "try before / after" on the patch.
>> 
>> Well, even the before/after might well have worked, since the problem
>> depended on how that sw_fence_dummy_notify() function ended up
>> aligned. So random unrelated changes could re-align it just by
>> mistake.
>
> Yup.
>
>> 
>> Patch applied directly.
>
> Great, thanks a lot.

Thanks & sorry, really looks like we managed to drop this between the
cracks. :(

>
>> 
>> I'd also like to point out how that BUG_ON() actually made things
>> worse, and made this harder to debug. If it had been a WARN_ON_ONCE(),
>> this would presumably not even have needed bisecting, it would have
>> been obvious.
>> 
>> BUG_ON() really is pretty much *always* the wrong thing to do. It
>> onl;y results in problems being harder to see because you end up with
>> a dead machine and the message is often hidden.
>
> Jani made the same point. But I guess they then went off into the weeds
> of how to recover when warning, that the fix itself did not progress.

Yes. That, as well as removing the entire alignment thing to reuse a
couple of bits for flags. Too fragile for its own good.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center

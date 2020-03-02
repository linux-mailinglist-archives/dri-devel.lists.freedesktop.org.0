Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1861756DA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 10:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEDA26E1E6;
	Mon,  2 Mar 2020 09:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAF76E192;
 Mon,  2 Mar 2020 09:22:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 01:22:06 -0800
X-IronPort-AV: E=Sophos;i="5.70,506,1574150400"; d="scan'208";a="233098829"
Received: from unknown (HELO localhost) ([10.252.41.100])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Mar 2020 01:22:03 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 03/51] drm: add managed resources tied to drm_device
In-Reply-To: <CAKMK7uEYxM8BAsp+DHUxw+qdE_B3J+ePAxC-j0V+v+J6trffgw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
 <20200227181522.2711142-4-daniel.vetter@ffwll.ch>
 <20200228224504.GA23961@ravnborg.org>
 <CAKMK7uHPWZ=F2EyqnM7x1GpXY_SGu3e_jGXX4cg0OGyx_+C8ig@mail.gmail.com>
 <20200229111710.GB3674@ravnborg.org>
 <CAKMK7uEYxM8BAsp+DHUxw+qdE_B3J+ePAxC-j0V+v+J6trffgw@mail.gmail.com>
Date: Mon, 02 Mar 2020 11:22:34 +0200
Message-ID: <87blpfqffp.fsf@intel.com>
MIME-Version: 1.0
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Marco Felsch <m.felsch@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 29 Feb 2020, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Sat, Feb 29, 2020 at 12:17 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>> The header-check infrastructure was dropped again - see:
>> fcbb8461fd2376ba3782b5b8bd440c929b8e4980
>
> Uh I'm disappoint :-/

To say the least. I thought it was a good *opt-in* feature for whoever
wanted it. But the part that got the backlash was applying it to
absolutely everything under include/. And then it got removed
altogether. From one extreme to the other. Nuts.

> Adding Jani in case he missed this too. I guess maybe we should
> resurrect it for drm again (and with a file pattern starting in a
> .dot).

We have a local implementation in i915/Makefile again. It uses 'find' to
find the headers which is fine in i915, but the parameters need to be
adjusted for drm to not be recursive. -maxdepth 1 or something. Also
need to add another local config option. Sad trombone.

>> > > > +     /**
>> > > > +      * @managed:
>> > > > +      *
>> > > > +      * Managed resources linked to the lifetime of this &drm_device as
>> > > > +      * tracked by @ref.
>> > > > +      */
>> > > > +     struct {
>> > > > +             struct list_head resources;
>> > > > +             void *final_kfree;
>> > > > +             spinlock_t lock;
>> > > > +     } managed;
>> > >
>> > > I am missing kernel-doc here.
>> > > At least document that lock is used to guard access to resources.
>> > > (s/lock/lock_resources/ ?)
>> >
>> > Dunno why, but the support for name sub-structures seems to have
>> > broken in kerneldoc. So I can type it, but it's not showing up, so I
>> > didn't bother. Well I had it, but deleted it again. It's still
>> > documented to work, but I have no idea what I'm doing wrong.
>>
>> Most readers prefer the .c files as the source.
>> I personally read the generated kernel doc when I google
>> and when I check that my own stuff looks good in kernel-doc format.
>> So comments are still valueable despite not being picked up by
>> kernel-doc.
>> You know this - but I just wanted to encourage you to write the few
>> lines that may help me and others :-)
>
> Hm I thought way back this actually worked. Again ping for Jani, he's
> better on top of what's happening in kernel-doc land.

I haven't really been all that active lately, but I think the syntax
here would be e.g. "@managed.resources:".

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

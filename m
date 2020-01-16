Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F0A140511
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 09:14:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137576F433;
	Fri, 17 Jan 2020 08:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 374 seconds by postgrey-1.36 at gabe;
 Thu, 16 Jan 2020 12:33:05 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FFCC6ECD7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 12:33:05 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-140-XHznUHIJPea1EeGEH4eIuQ-1; Thu, 16 Jan 2020 12:26:45 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 16 Jan 2020 12:26:45 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 16 Jan 2020 12:26:45 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Chris Wilson' <chris@chris-wilson.co.uk>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH] drm: Inject a cond_resched() into long drm_clflush_sg()
Thread-Topic: [PATCH] drm: Inject a cond_resched() into long drm_clflush_sg()
Thread-Index: AQHVy+gMprmlNntzX0qJh6CaHCkwb6fs20gAgAANToCAAEszQA==
Date: Thu, 16 Jan 2020 12:26:45 +0000
Message-ID: <8f6b9daa2af342a79137064203255242@AcuMS.aculab.com>
References: <20200115205245.2772800-1-chris@chris-wilson.co.uk>
 <20200116065242.GC8400@dvetter-linux.ger.corp.intel.com>
 <157916041994.14122.8524532515240369595@skylake-alporthouse-com>
In-Reply-To: <157916041994.14122.8524532515240369595@skylake-alporthouse-com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: XHznUHIJPea1EeGEH4eIuQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Fri, 17 Jan 2020 08:13:08 +0000
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>
> Sent: 16 January 2020 07:40
> Quoting Daniel Vetter (2020-01-16 06:52:42)
> > On Wed, Jan 15, 2020 at 08:52:45PM +0000, Chris Wilson wrote:
> > > Since we may try and flush the cachelines associated with large buffers
> > > (an 8K framebuffer is about 128MiB, even before we try HDR), this leads
> > > to unacceptably long latencies (when using a voluntary CONFIG_PREEMPT).
> > > If we call cond_resched() between each sg chunk, that it about every 128
> > > pages, we have a natural break point in which to check if the process
> > > needs to be rescheduled. Naturally, this means that drm_clflush_sg() can
> > > only be called from process context -- which is true at the moment. The
> > > other clflush routines remain usable from atomic context.
> > >
> > > Even though flushing large objects takes a demonstrable amount to time
> > > to flush all the cachelines, clflush is still preferred over a
> > > system-wide wbinvd as the latter has unpredictable latencies affecting
> > > the whole system not just the local task.
> > >
> > > Reported-by: David Laight <David.Laight@ACULAB.COM>
> > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > Cc: David Laight <David.Laight@ACULAB.COM>
> >
> > The original bug report is complaining about latencies for SCHED_RT
> > threads, on a system that doesn't even use CONFIG_PREEMPT. I'm not sure
> > it's terribly valid to cater to that use-case - all the desktop distros
> > seem a lot more reasonable. So firmly *shrug* from my side ...
> 
> Yeah, I had the same immediate response to the complaint), but otoh we've
> inserted cond_resched() before when it looks like may consume entire
> jiffies inside a loop. At the very minimum, we should have a
> might_sleep() here and a reminder that this can be very slow (remember
> byt?).

I'm using RT to get more deterministic scheduling to look for long
scheduling delays, rather than because we need very tight scheduling.
Delays of several 100us aren't a real problem.

The problem with CONFIG_PREEMPT is that the distros don't
enable it and it isn't a command line option.
So it is really useless unless you are able/willing to build your
own kernel.

I could run the code under the normal scheduler with 'nice -19'.
I stlll wouldn't expect to have all but one cpu idle when I've just
done a cv_broadcast() to wake up a lot of threads.

I've added 'if (!(++i & 31)) cond_resched();' after the drm_clfulsh_page()
call in drm_cflush_sg().
In my case that it 3600/32 reschedules in 3.3ms - plenty.

However there is a call from __i915_gem_objet_set_pages() that
is preceded by a lockdep_assert_held() check - so mustn't sleep.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

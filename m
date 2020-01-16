Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09591140501
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 09:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CFC6F413;
	Fri, 17 Jan 2020 08:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [146.101.78.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FF56ED1B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 13:58:51 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-209-ou66e3WJN7O-0cN6rIdmfw-1; Thu, 16 Jan 2020 13:58:44 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 16 Jan 2020 13:58:44 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 16 Jan 2020 13:58:44 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Chris Wilson' <chris@chris-wilson.co.uk>, Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH] drm: Inject a cond_resched() into long drm_clflush_sg()
Thread-Topic: [PATCH] drm: Inject a cond_resched() into long drm_clflush_sg()
Thread-Index: AQHVy+gMprmlNntzX0qJh6CaHCkwb6fs20gAgAANToCAAEszQIAABVIAgAAWQUA=
Date: Thu, 16 Jan 2020 13:58:44 +0000
Message-ID: <90de9ae911dc481f9c2c62e196b2bacf@AcuMS.aculab.com>
References: <20200115205245.2772800-1-chris@chris-wilson.co.uk>
 <20200116065242.GC8400@dvetter-linux.ger.corp.intel.com>
 <157916041994.14122.8524532515240369595@skylake-alporthouse-com>
 <8f6b9daa2af342a79137064203255242@AcuMS.aculab.com>
 <157917771007.2795.953028640868055754@skylake-alporthouse-com>
In-Reply-To: <157917771007.2795.953028640868055754@skylake-alporthouse-com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: ou66e3WJN7O-0cN6rIdmfw-1
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
> Sent: 16 January 2020 12:29
> 
> Quoting David Laight (2020-01-16 12:26:45)
> > However there is a call from __i915_gem_objet_set_pages() that
> > is preceded by a lockdep_assert_held() check - so mustn't sleep.
> 
> That is a mutex; it's allowed to sleep. The might_sleep() here should
> help assuage your fears.

Gah. Having a mutex called mm.lock isn't entirely obvious when quickly
reading code.

From what I was reading earlier it seems that clflush() (and cflushopt)
are fast (well not stupidly slow) for buffers under 4k.
I suspect then can do a 'mark pending', but for larger buffers have to
wait for earlier requests to complete (although the graph carries on
increasing to the 16k RH margin.

If may well be that adding a cond_resched() after every 4k page
will have ~0 performance impact because the first few clflush
will be a bit faster (less slow).

I'll do some measurements later this afternoon.

FWIW does this code need to actually invalidate the cache lines?
Or is it just forcing a writeback?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

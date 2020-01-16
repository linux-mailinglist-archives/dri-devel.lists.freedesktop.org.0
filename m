Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6685140509
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 09:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548326F42A;
	Fri, 17 Jan 2020 08:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [146.101.78.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F9F76ED53
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 14:40:47 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-171-fDFVhRh3N8mnBNjnwpGscQ-1; Thu, 16 Jan 2020 14:40:44 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 16 Jan 2020 14:40:44 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 16 Jan 2020 14:40:44 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Chris Wilson' <chris@chris-wilson.co.uk>, 'Daniel Vetter'
 <daniel@ffwll.ch>
Subject: RE: [PATCH] drm: Inject a cond_resched() into long drm_clflush_sg()
Thread-Topic: [PATCH] drm: Inject a cond_resched() into long drm_clflush_sg()
Thread-Index: AQHVy+gMprmlNntzX0qJh6CaHCkwb6fs20gAgAANToCAAEszQIAABVIAgAAWQUCAAAyNcA==
Date: Thu, 16 Jan 2020 14:40:43 +0000
Message-ID: <fbc24dd0f61e4fb8b777777d1de46ab3@AcuMS.aculab.com>
References: <20200115205245.2772800-1-chris@chris-wilson.co.uk>
 <20200116065242.GC8400@dvetter-linux.ger.corp.intel.com>
 <157916041994.14122.8524532515240369595@skylake-alporthouse-com>
 <8f6b9daa2af342a79137064203255242@AcuMS.aculab.com>
 <157917771007.2795.953028640868055754@skylake-alporthouse-com>
 <90de9ae911dc481f9c2c62e196b2bacf@AcuMS.aculab.com>
In-Reply-To: <90de9ae911dc481f9c2c62e196b2bacf@AcuMS.aculab.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: fDFVhRh3N8mnBNjnwpGscQ-1
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
Cc: "'intel-gfx@lists.freedesktop.org'" <intel-gfx@lists.freedesktop.org>,
 "'dri-devel@lists.freedesktop.org'" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> I'll do some measurements later this afternoon.

This is an Ivy bridge cpu, so clflush (not clflushopt).
With a cond_resched for every page I get:
(Note these calls are every 10 seconds....)

# tracer: function_graph
#
# CPU  DURATION                  FUNCTION CALLS
# |     |   |                     |   |   |   |
 0) # 3155.126 us |  drm_clflush_sg [drm]();
 1) # 3067.382 us |  drm_clflush_sg [drm]();
 2) # 3063.766 us |  drm_clflush_sg [drm]();
 3) # 3092.302 us |  drm_clflush_sg [drm]();
 0) # 3209.486 us |  drm_clflush_sg [drm]();
 ------------------------------------------
 0)   kworker-7    =>  kworker-319
 ------------------------------------------

 0) # 3633.803 us |  drm_clflush_sg [drm]();
 ------------------------------------------
 1)   kworker-7    =>  kworker-319
 ------------------------------------------

 1) # 3090.278 us |  drm_clflush_sg [drm]();
 2) # 3828.108 us |  drm_clflush_sg [drm]();
 3) # 3049.836 us |  drm_clflush_sg [drm]();
 ------------------------------------------
 3)  kworker-319   =>   kworker-7
 ------------------------------------------

 3) # 3295.017 us |  drm_clflush_sg [drm]();
 3) # 3064.077 us |  drm_clflush_sg [drm]();
 ------------------------------------------
 0)  kworker-319   =>   kworker-7
 ------------------------------------------

 0) # 3182.034 us |  drm_clflush_sg [drm]();
 ------------------------------------------
 3)   kworker-7    =>  kworker-319
 ------------------------------------------

 3) # 3065.754 us |  drm_clflush_sg [drm]();
 ------------------------------------------
 2)  kworker-319   =>   kworker-7
 ------------------------------------------

 2) # 3562.513 us |  drm_clflush_sg [drm]();
 ------------------------------------------
 3)  kworker-319   =>   kworker-7
 ------------------------------------------

 3) # 3048.914 us |  drm_clflush_sg [drm]();
 3) # 3062.469 us |  drm_clflush_sg [drm]();
 3) # 3055.727 us |  drm_clflush_sg [drm]();
 ------------------------------------------
 0)   kworker-7    =>  kworker-319
 ------------------------------------------

Without the cond_sched I suspect more of them are 3.0ms.
Not really a significant difference.
I guess the longer times are the scheduler looking for work?
I don't understand the extra traces - I'm guessing they are process switch related.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

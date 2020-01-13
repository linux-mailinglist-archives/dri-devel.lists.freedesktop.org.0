Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3324A13A2D5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 09:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075FB6E303;
	Tue, 14 Jan 2020 08:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [146.101.78.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6405E6E120
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 17:39:40 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-87-OVcAHFbZNfGd3NpnjlTZng-1; Mon, 13 Jan 2020 17:39:36 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 13 Jan 2020 17:39:35 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 13 Jan 2020 17:39:35 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: David Laight <David.Laight@ACULAB.COM>,
 "'maarten.lankhorst@linux.intel.com'" <maarten.lankhorst@linux.intel.com>,
 "'mripard@kernel.org'" <mripard@kernel.org>, "'sean@poorly.run'"
 <sean@poorly.run>, "'airlied@linux.ie'" <airlied@linux.ie>,
 "'daniel@ffwll.ch'" <daniel@ffwll.ch>, "'dri-devel@lists.freedesktop.org'"
 <dri-devel@lists.freedesktop.org>, "'linux-kernel@vger.kernel.org'"
 <linux-kernel@vger.kernel.org>
Subject: RE: drm_cflush_sg() loops for over 3ms - scheduler not running tasks.
Thread-Topic: drm_cflush_sg() loops for over 3ms - scheduler not running tasks.
Thread-Index: AdXKOCs2ei3pAorRT3aL4kNbmbVxww==
Date: Mon, 13 Jan 2020 17:39:35 +0000
Message-ID: <9451c48fd66b4df0a5ede5391c4e64ef@AcuMS.aculab.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: OVcAHFbZNfGd3NpnjlTZng-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Tue, 14 Jan 2020 08:19:25 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Laight
> Sent: 13 January 2020 14:35
> 
> I've been looking at why some RT processes don't get scheduled promptly.
> In my test the RT process's affinity ties it to a single cpu (this may not be such
> a good idea as it seems).
> 
> What I've found is that the Intel i915 graphics driver uses the 'events_unbound'
> kernel worker thread to periodically execute drm_cflush_sg().
> (see https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/drm_cache.c)
...
> This loop takes about 1us per iteration split fairly evenly between whatever is in
> for_each_sg_page() and drm_cflush_page().
> With a 2560x1440 display the loop count is 3600 (4 bytes/pixel) and the whole
> function takes around 3.3ms.

Actually not setting the cpu affinity makes no difference.
The process is woken up on the cpu it last ran on and sits 'waiting' until
drm_cflush_sg() finishes - even though the other cpu become idle.
No sign of sched_migrate_task event 'stealing' the process.

Even worse, because 'ticket locks' are used no other user processes can
acquire the same (user) mutex or be woken from cv_wait() until the
process actually runs.

This is a 5.4.0-rc7 kernel.
I think I saw some recent scheduler patches, I can try them until I can't build
with gcc 4.7.3 :-)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

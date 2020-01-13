Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2FE13A2D8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 09:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1785C6E30D;
	Tue, 14 Jan 2020 08:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [146.101.78.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396D86E0D8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 14:36:03 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-140-AwUQH5QOP_e8J5DRSiGalQ-1; Mon, 13 Jan 2020 14:34:43 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 13 Jan 2020 14:34:42 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 13 Jan 2020 14:34:42 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'maarten.lankhorst@linux.intel.com'" <maarten.lankhorst@linux.intel.com>, 
 "'mripard@kernel.org'" <mripard@kernel.org>, "'sean@poorly.run'"
 <sean@poorly.run>, "'airlied@linux.ie'" <airlied@linux.ie>,
 "'daniel@ffwll.ch'" <daniel@ffwll.ch>, "'dri-devel@lists.freedesktop.org'"
 <dri-devel@lists.freedesktop.org>, "'linux-kernel@vger.kernel.org'"
 <linux-kernel@vger.kernel.org>
Subject: drm_cflush_sg() loops for over 3ms
Thread-Topic: drm_cflush_sg() loops for over 3ms
Thread-Index: AdXKGWEIeE2T2qdBRV+WPmYW5zRi/w==
Date: Mon, 13 Jan 2020 14:34:42 +0000
Message-ID: <e2498e2794ab421bb27982b4c863e87f@AcuMS.aculab.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: AwUQH5QOP_e8J5DRSiGalQ-1
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

I've been looking at why some RT processes don't get scheduled promptly.
In my test the RT process's affinity ties it to a single cpu (this may not be such
a good idea as it seems).

What I've found is that the Intel i915 graphics driver uses the 'events_unbound'
kernel worker thread to periodically execute drm_cflush_sg().
(see https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/drm_cache.c)

I'm guessing this is to ensure that any writes to graphics memory become
visible is a semi-timely manner.

This loop takes about 1us per iteration split fairly evenly between whatever is in
for_each_sg_page() and drm_cflush_page().
With a 2560x1440 display the loop count is 3600 (4 bytes/pixel) and the whole
function takes around 3.3ms.

Since the kernel isn't pre-emptive (I though that wasn't much harder than SMP)
nothing else can run on that cpu until the loop finishes.

Adding a cond_resched() to the loop (maybe every 64 iterations) will
allow higher priority processes to run.
But really the code needs to be a lot faster.

I actually suspect that the (I assume IPI based) wbinv_on_all_cpus() would be
a lot faster - especially done by a per-cpu work queue?

I had moderate difficulty getting from the process (kworker/u8:3) to the
name of the worker thread pool, never mind the actual work.
Fortunately it runs so long that some of the output from 'echo t >/proc/sysrq-trigger'
still linked the pid (which I knew from ftrace scheduler events (and schedviz))
to the actual work item name.
(Oh, after I'd written a program to tidy up the raw ftrace output so schedviz
didn't barf on a trace that had wrapped.)

Is there anything in /proc (etc) that shows all the work queues and their current
work?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

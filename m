Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B359278123
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:09:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA026EBFF;
	Fri, 25 Sep 2020 07:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 371 seconds by postgrey-1.36 at gabe;
 Thu, 24 Sep 2020 14:48:38 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD3F6E045
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 14:48:38 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-263-piLz1VFuP7WR1Dja3TezJQ-1; Thu, 24 Sep 2020 15:42:19 +0100
X-MC-Unique: piLz1VFuP7WR1Dja3TezJQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 24 Sep 2020 15:42:18 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 24 Sep 2020 15:42:18 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, Peilin Ye
 <yepeilin.cs@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: RE: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Thread-Topic: [PATCH 0/3] Prevent out-of-bounds access for built-in font data
 buffers
Thread-Index: AQHWknxPKqK+ilVBT0etUz37fvqXO6l33I9A
Date: Thu, 24 Sep 2020 14:42:18 +0000
Message-ID: <394733ab6fae47488d078cb22f22a85b@AcuMS.aculab.com>
References: <0000000000006b9e8d059952095e@google.com>
 <cover.1600953813.git.yepeilin.cs@gmail.com>
 <20200924140937.GA749208@kroah.com>
In-Reply-To: <20200924140937.GA749208@kroah.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Sep 2020 07:09:24 +0000
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> On Thu, Sep 24, 2020 at 09:38:22AM -0400, Peilin Ye wrote:
> > Hi all,
> >
> > syzbot has reported [1] a global out-of-bounds read issue in
> > fbcon_get_font(). A malicious user may resize `vc_font.height` to a large
> > value in vt_ioctl(), causing fbcon_get_font() to overflow our built-in
> > font data buffers, declared in lib/fonts/font_*.c:
...
> > (drivers/video/fbdev/core/fbcon.c)
> >  	if (font->width <= 8) {
> >  		j = vc->vc_font.height;
> > +		if (font->charcount * j > FNTSIZE(fontdata))
> > +			return -EINVAL;

Can that still go wrong because the multiply wraps?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

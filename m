Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 298401FEC46
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 09:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAB46EB0D;
	Thu, 18 Jun 2020 07:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 311 seconds by postgrey-1.36 at gabe;
 Wed, 17 Jun 2020 08:28:14 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A2F6E13B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 08:28:14 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-151-NNVoDzt9NdeCYy0h9mSXPw-1; Wed, 17 Jun 2020 09:21:29 +0100
X-MC-Unique: NNVoDzt9NdeCYy0h9mSXPw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 17 Jun 2020 09:21:28 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Wed, 17 Jun 2020 09:21:28 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Charan Teja Kalla' <charante@codeaurora.org>, "Ruhl, Michael J"
 <michael.j.ruhl@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, "open
 list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>, "DRI
 mailing list" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] dmabuf: use spinlock to access dmabuf->name
Thread-Topic: [PATCH] dmabuf: use spinlock to access dmabuf->name
Thread-Index: AQHWRHCUCFGeEhsHd0uEJ3SlJWBlmajcdwBw
Date: Wed, 17 Jun 2020 08:21:28 +0000
Message-ID: <b686a288cff640acaea1111fed650b02@AcuMS.aculab.com>
References: <316a5cf9-ca71-6506-bf8b-e79ded9055b2@codeaurora.org>
 <14063C7AD467DE4B82DEDB5C278E8663010F365EF5@fmsmsx107.amr.corp.intel.com>
 <14063C7AD467DE4B82DEDB5C278E8663010F365F7D@fmsmsx107.amr.corp.intel.com>
 <5b960c9a-ef9d-b43d-716d-113efc793fe5@codeaurora.org>
In-Reply-To: <5b960c9a-ef9d-b43d-716d-113efc793fe5@codeaurora.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
X-Mailman-Approved-At: Thu, 18 Jun 2020 07:17:31 +0000
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
Cc: Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
 "vinmenon@codeaurora.org" <vinmenon@codeaurora.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Charan Teja Kalla
> Sent: 17 June 2020 07:29
...
> >> If name is freed you will copy garbage, but the only way
> >> for that to happen is that _set_name or _release have to be called
> >> at just the right time.
> >>
> >> And the above would probably only be an issue if the set_name
> >> was called, so you will get NULL or a real name.
> 
> And there exists a use-after-free to avoid which requires the lock. Say
> that memcpy() in dmabuffs_dname is in progress and in parallel _set_name
> will free the same buffer that memcpy is operating on.

If the name is being looked at while the item is being freed
you almost certainly have much bigger problems that just
the name being a 'junk' pointer.

	David.

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

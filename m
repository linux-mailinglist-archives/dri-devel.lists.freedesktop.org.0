Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5A82FFE85
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4496E9D0;
	Fri, 22 Jan 2021 08:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 900 seconds by postgrey-1.36 at gabe;
 Thu, 21 Jan 2021 18:01:08 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234366E8D9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 18:01:08 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id uk-mta-7-70jJZbebO02FvmwaO8iuwQ-1;
 Thu, 21 Jan 2021 17:44:57 +0000
X-MC-Unique: 70jJZbebO02FvmwaO8iuwQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 21 Jan 2021 17:44:55 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 21 Jan 2021 17:44:55 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: RE: [PATCH 02/13] module: add a module_loaded helper
Thread-Topic: [PATCH 02/13] module: add a module_loaded helper
Thread-Index: AQHW8BhvE0+Qt/OaHkK/jwqI2nu4BKoyViXg
Date: Thu, 21 Jan 2021 17:44:55 +0000
Message-ID: <8d59f11971764db2a104c87937e1d3ab@AcuMS.aculab.com>
References: <20210121074959.313333-1-hch@lst.de>
 <20210121074959.313333-3-hch@lst.de>
 <844a7fc3-2cba-46d2-fd4e-e5fe16b08573@csgroup.eu>
 <20210121171119.GA29916@lst.de>
In-Reply-To: <20210121171119.GA29916@lst.de>
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
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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
Cc: Petr Mladek <pmladek@suse.com>, Michal Marek <michal.lkml@markovi.net>,
 Andrew Donnellan <ajd@linux.ibm.com>, Jessica Yu <jeyu@kernel.org>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Masahiro
 Yamada <masahiroy@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 Miroslav Benes <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> 
> On Thu, Jan 21, 2021 at 11:00:20AM +0100, Christophe Leroy wrote:
> > > +bool module_loaded(const char *name);
> >
> > Maybe module_is_loaded() would be a better name.
> 
> Fine with me.

It does look like both callers aren't 'unsafe'.
But it is a bit strange returning a stale value.

It did make be look a bit more deeply at try_module_get().
For THIS_MODULE (eg to get an extra reference for a kthread)
I doubt it can ever fail.

But the other cases require a 'module' structure be passed in.
ISTM that unloading the module could invalidate the pointer
that has just been read from some other structure.

I'm guessing that some other lock must always be held.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

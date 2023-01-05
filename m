Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B74865ED51
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A2F10E72F;
	Thu,  5 Jan 2023 13:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 387 seconds by postgrey-1.36 at gabe;
 Thu, 05 Jan 2023 13:41:04 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4B210E73C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 13:41:04 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-76-LkZmLSiwP3mo41Bkd9-7GA-1; Thu, 05 Jan 2023 13:34:34 +0000
X-MC-Unique: LkZmLSiwP3mo41Bkd9-7GA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 5 Jan
 2023 13:34:33 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.044; Thu, 5 Jan 2023 13:34:33 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Jani Nikula' <jani.nikula@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: RE: [Intel-gfx] [PATCH 1/5] linux/minmax.h: add non-atomic version of
 xchg
Thread-Topic: [Intel-gfx] [PATCH 1/5] linux/minmax.h: add non-atomic version
 of xchg
Thread-Index: AQHZC+X/n2yHksRnF0Csd/+tl8P8Ka5qAX6ggCX6JSGAAADCAA==
Date: Thu, 5 Jan 2023 13:34:33 +0000
Message-ID: <733cd0037bd14a269b54d701e1b80323@AcuMS.aculab.com>
References: <20221209154843.4162814-1-andrzej.hajda@intel.com>
 <f58ab17e5c6c4a4e8b0d687b44618c51@AcuMS.aculab.com>
 <Y7bK8drngH/NIlOa@phenom.ffwll.local> <875ydlw1p4.fsf@intel.com>
In-Reply-To: <875ydlw1p4.fsf@intel.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 'Andrzej Hajda' <andrzej.hajda@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jani Nikula
> Sent: 05 January 2023 13:28
>=20
> On Thu, 05 Jan 2023, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Mon, Dec 12, 2022 at 09:38:12AM +0000, David Laight wrote:
> >> From: Andrzej Hajda <andrzej.hajda@intel.com>
> >> > Sent: 09 December 2022 15:49
> >> >
> >> > The pattern of setting variable with new value and returning old
> >> > one is very common in kernel. Usually atomicity of the operation
> >> > is not required, so xchg seems to be suboptimal and confusing in
> >> > such cases. Since name xchg is already in use and __xchg is used
> >> > in architecture code, proposition is to name the macro exchange.
> >>
> >> Dunno, if it is non-atomic then two separate assignment statements
> >> is decidedly more obvious and needs less brain cells to process.
> >> Otherwise someone will assume 'something clever' is going on
> >> and the operation is atomic.
> >
> > Yes, this also my take. The i915 code that uses this to excess is decid=
ely
> > unreadable imo, and the macro should simply be replaced by open-coded
> > versions.
> >
> > Not moved into shared headers where even more people can play funny gam=
es
> > with it.
>=20
> My stand in i915 has been that the local fetch_and_zero() needs to
> go. Either replaced by a common helper in core kernel headers, or open
> coded, I personally don't care, but the local version can't stay.
>=20
> My rationale has been that fetch_and_zero() looks atomic and looks like
> it comes from shared headers, but it's neither. It's deceptive. It
> started small and harmless, but things like this just proliferate and
> get copy-pasted all over the place.
>=20
> So here we are, with Andrzej looking to add the common helper. And the
> same concerns crop up. What should it be called to make it clear that
> it's not atomic? Is that possible?

old_value =3D read_write(variable, new_value);

But two statements are much clearer.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC865868BC1
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 10:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E79E10F29C;
	Tue, 27 Feb 2024 09:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8896810F29C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 09:10:14 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-128-E934HnI0OCyPXoda2PTIuw-1; Tue, 27 Feb 2024 09:10:11 +0000
X-MC-Unique: E934HnI0OCyPXoda2PTIuw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 27 Feb
 2024 09:10:09 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 27 Feb 2024 09:10:09 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'kernel test robot' <lkp@intel.com>, "'linux-kernel@vger.kernel.org'"
 <linux-kernel@vger.kernel.org>, 'Linus Torvalds'
 <torvalds@linux-foundation.org>, 'Netdev' <netdev@vger.kernel.org>,
 "'dri-devel@lists.freedesktop.org'" <dri-devel@lists.freedesktop.org>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, "'Jens
 Axboe'" <axboe@kernel.dk>, "'Matthew Wilcox (Oracle)'" <willy@infradead.org>, 
 'Christoph Hellwig' <hch@infradead.org>, "'linux-btrfs@vger.kernel.org'"
 <linux-btrfs@vger.kernel.org>, 'Andrew Morton' <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>, 'Andy Shevchenko'
 <andriy.shevchenko@linux.intel.com>, "'David S . Miller'"
 <davem@davemloft.net>, 'Dan Carpenter' <dan.carpenter@linaro.org>, "'Jani
 Nikula'" <jani.nikula@linux.intel.com>
Subject: RE: [PATCH next v2 03/11] minmax: Simplify signedness check
Thread-Topic: [PATCH next v2 03/11] minmax: Simplify signedness check
Thread-Index: AdpoCqfCgp/0gHjwSqumBl0qZkMqdgBEnDuAAA9N+TA=
Date: Tue, 27 Feb 2024 09:10:09 +0000
Message-ID: <291975e1412548daa70abfe747dfd893@AcuMS.aculab.com>
References: <8657dd5c2264456f8a005520a3b90e2b@AcuMS.aculab.com>
 <202402270937.9kmO5PFt-lkp@intel.com>
In-Reply-To: <202402270937.9kmO5PFt-lkp@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: kernel test robot
> Sent: 27 February 2024 01:34
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on drm-misc/drm-misc-next]
> [also build test WARNING on linux/master mkl-can-next/testing kdave/for-n=
ext akpm-mm/mm-nonmm-unstable
> axboe-block/for-next linus/master v6.8-rc6 next-20240226]
> [cannot apply to next-20240223 dtor-input/next dtor-input/for-linus horms=
-ipvs/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minma=
x-Put-all-the-clamp-
> definitions-together/20240226-005902
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/8657dd5c2264456f8a005520a3b90e2b=
%40AcuMS.aculab.com
> patch subject: [PATCH next v2 03/11] minmax: Simplify signedness check
> config: alpha-defconfig (https://download.01.org/0day-ci/archive/20240227=
/202402270937.9kmO5PFt-
> lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-
> ci/archive/20240227/202402270937.9kmO5PFt-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402270937.9kmO5PFt-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
>    In file included from include/linux/kernel.h:28,
>                     from include/linux/cpumask.h:10,
>                     from include/linux/smp.h:13,
>                     from include/linux/lockdep.h:14,
>                     from include/linux/spinlock.h:63,
>                     from include/linux/swait.h:7,
>                     from include/linux/completion.h:12,
>                     from include/linux/crypto.h:15,
>                     from include/crypto/aead.h:13,
>                     from include/crypto/internal/aead.h:11,
>                     from crypto/skcipher.c:12:
>    crypto/skcipher.c: In function 'skcipher_get_spot':
> >> include/linux/minmax.h:31:70: warning: ordered comparison of pointer w=
ith integer zero [-Wextra]
>       31 |         (is_unsigned_type(typeof(x)) || (__is_constexpr(x) ? (=
x) + 0 >=3D 0 : 0))

Hmmm -Wextra isn't normally set.
But I do wish the compiler would do dead code elimination before
these warnings.

Apart from stopping code using min()/max() for pointer types
(all the type checking is pointless) I think that __is_constextr()
can be implemented using _Generic (instead of sizeof(type)) and then the
true/false return values can be specified and need not be the same types.
That test can then be:
=09(__if_constexpr(x, x, -1) >=3D 0)
(The '+ 0' is there to convert bool to int and won't be needed
for non-constant bool.)

I may drop the last few patches until MIN/MAX have been removed
from everywhere else to free up the names.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


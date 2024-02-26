Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02728867052
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 11:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33A6710E6B1;
	Mon, 26 Feb 2024 10:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBB2B10E6B1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 10:16:05 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-91-CfTYQ5CAOY6_UOUoiheBlQ-1; Mon, 26 Feb 2024 10:16:02 +0000
X-MC-Unique: CfTYQ5CAOY6_UOUoiheBlQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 26 Feb
 2024 10:16:01 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 26 Feb 2024 10:16:01 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'kernel test robot' <lkp@intel.com>, "'linux-kernel@vger.kernel.org'"
 <linux-kernel@vger.kernel.org>, 'Linus Torvalds'
 <torvalds@linux-foundation.org>, 'Netdev' <netdev@vger.kernel.org>,
 "'dri-devel@lists.freedesktop.org'" <dri-devel@lists.freedesktop.org>
CC: "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, 'Jens Axboe'
 <axboe@kernel.dk>, "'Matthew Wilcox (Oracle)'" <willy@infradead.org>,
 'Christoph Hellwig' <hch@infradead.org>, "'linux-btrfs@vger.kernel.org'"
 <linux-btrfs@vger.kernel.org>, 'Andrew Morton' <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>, 'Andy Shevchenko'
 <andriy.shevchenko@linux.intel.com>, "'David S . Miller'"
 <davem@davemloft.net>, 'Dan Carpenter' <dan.carpenter@linaro.org>, "'Jani
 Nikula'" <jani.nikula@linux.intel.com>
Subject: RE: [PATCH next v2 11/11] minmax: min() and max() don't need to
 return constant expressions
Thread-Topic: [PATCH next v2 11/11] minmax: min() and max() don't need to
 return constant expressions
Thread-Index: AdpoC6KUHy5Z1N7yRkiaBkc7ZdEdRQAjHDKAAAEYtvA=
Date: Mon, 26 Feb 2024 10:16:01 +0000
Message-ID: <bd7321effdf24d11aa16098bb40869ce@AcuMS.aculab.com>
References: <a18dcae310f74dcb9c6fc01d5bdc0568@AcuMS.aculab.com>
 <202402261720.EAMC0eHM-lkp@intel.com>
In-Reply-To: <202402261720.EAMC0eHM-lkp@intel.com>
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

From: kernel test robot <lkp@intel.com>
> Sent: 26 February 2024 09:42
....
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402261720.EAMC0eHM-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
> >> arch/x86/mm/pgtable.c:437:14: warning: variable length array used [-Wv=
la]
>      437 |         pmd_t *pmds[MAX_PREALLOCATED_PMDS];

Not surprisingly I missed X86_CONFIG_PAE builds :-)

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


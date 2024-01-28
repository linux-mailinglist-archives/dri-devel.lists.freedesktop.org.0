Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB6F83F968
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jan 2024 20:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424FF10E4A4;
	Sun, 28 Jan 2024 19:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C27710E4A4
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jan 2024 19:32:01 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-155-TMmSv8-RPQmEDi-VJtAU0w-1; Sun, 28 Jan 2024 19:24:28 +0000
X-MC-Unique: TMmSv8-RPQmEDi-VJtAU0w-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 28 Jan
 2024 19:24:03 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 28 Jan 2024 19:24:03 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "'Linus
 Torvalds'" <torvalds@linux-foundation.org>, Netdev <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH next 00/11] minmax: Optimise to reduce .i line length.
Thread-Topic: [PATCH next 00/11] minmax: Optimise to reduce .i line length.
Thread-Index: AdpSH3AbqTsF4YRmSE2KNmeAVHpUdw==
Date: Sun, 28 Jan 2024 19:24:03 +0000
Message-ID: <0ca26166dd2a4ff5a674b84704ff1517@AcuMS.aculab.com>
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
Cc: 'Jens Axboe' <axboe@kernel.dk>,
 "'Matthew Wilcox \(Oracle\)'" <willy@infradead.org>,
 'Christoph Hellwig' <hch@infradead.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 'Andrew Morton' <akpm@linux-foundation.org>,
 'Andy Shevchenko' <andriy.shevchenko@linux.intel.com>,
 "David S . Miller" <davem@davemloft.net>, 'Dan
 Carpenter' <dan.carpenter@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The changes to minmax.h that changed the type check to a signedness
check significantly increased the length of the expansion.
In some cases it has also significantly increased compile type.
This is particularly noticeable for nested expansions.

The fact that _Static_assert() only requires a compile time constant
not a constant expression allows a lot of simplification.

The other thing that complicates the expansion is the necessity of
returning a constant expression from constant arguments (for VLA).
I can only find a handful of places this is done.
Penalising most of the code for these few cases seems 'suboptimal'.
Instead I've added min_const() and max_const() for VLA and static
initialisers, these check the arguments are constant to avoid misuse.

Patch [9] is dependent on the earlier patches.
Patch [10] isn't dependant on them.
Patch [11] depends on both 9 and 10.

David Laight (11):
  [1] minmax: Put all the clamp() definitions together
  [2] minmax: Use _Static_assert() instead of static_assert()
  [3] minmax: Simplify signedness check
  [4] minmax: Replace multiple __UNIQUE_ID() by directly using __COUNTER__
  [5] minmax: Move the signedness check out of __cmp_once() and
    __clamp_once()
  [6] minmax: Remove 'constexpr' check from __careful_clamp()
  [7] minmax: minmax: Add __types_ok3() and optimise defines with 3
    arguments
  [8] minmax: Add min_const() and max_const()
  [9] tree-wide: minmax: Replace all the uses of max() for array sizes with
    max_const().
  [10] block: Use a boolean expression instead of max() on booleans
  [11] minmax: min() and max() don't need to return constant expressions

 block/blk-settings.c                          |   2 +-
 drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c        |   2 +-
 drivers/gpu/drm/drm_color_mgmt.c              |   4 +-
 drivers/input/touchscreen/cyttsp4_core.c      |   2 +-
 .../net/can/usb/etas_es58x/es58x_devlink.c    |   2 +-
 fs/btrfs/tree-checker.c                       |   2 +-
 include/linux/minmax.h                        | 211 ++++++++++--------
 lib/vsprintf.c                                |   4 +-
 net/ipv4/proc.c                               |   2 +-
 net/ipv6/proc.c                               |   2 +-
 10 files changed, 127 insertions(+), 106 deletions(-)

--=20
2.17.1

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


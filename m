Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B798BC36E
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2024 22:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8468112DC0;
	Sun,  5 May 2024 20:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 346 seconds by postgrey-1.36 at gabe;
 Sun, 05 May 2024 20:09:02 UTC
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2C4112DC1
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2024 20:09:02 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-214-jGM-Qg1LN-mdByA-tf6CNA-1; Sun, 05 May 2024 21:02:07 +0100
X-MC-Unique: jGM-Qg1LN-mdByA-tf6CNA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 5 May
 2024 21:01:32 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 5 May 2024 21:01:32 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Linus Torvalds' <torvalds@linux-foundation.org>
CC: "axboe@kernel.dk" <axboe@kernel.dk>, "brauner@kernel.org"
 <brauner@kernel.org>, "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>, "jack@suse.cz"
 <jack@suse.cz>, "keescook@chromium.org" <keescook@chromium.org>,
 "laura@labbott.name" <laura@labbott.name>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-fsdevel@vger.kernel.org"
 <linux-fsdevel@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "minhquangbui99@gmail.com"
 <minhquangbui99@gmail.com>, "sumit.semwal@linaro.org"
 <sumit.semwal@linaro.org>,
 "syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com"
 <syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com>,
 "syzkaller-bugs@googlegroups.com" <syzkaller-bugs@googlegroups.com>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>
Subject: RE: [PATCH v2] epoll: be better about file lifetimes
Thread-Topic: [PATCH v2] epoll: be better about file lifetimes
Thread-Index: AQHanxYFUxCiqg1u6ES4w5URbGMRFrGJB6+A
Date: Sun, 5 May 2024 20:01:32 +0000
Message-ID: <12120faf79614fc1b9df272394a71550@AcuMS.aculab.com>
References: <CAHk-=wgMzzfPwKc=8yBdXwSkxoZMZroTCiLZTYESYD3BC_7rhQ@mail.gmail.com>
 <20240505175556.1213266-2-torvalds@linux-foundation.org>
In-Reply-To: <20240505175556.1213266-2-torvalds@linux-foundation.org>
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

From: Linus Torvalds
> Sent: 05 May 2024 18:56
>=20
> epoll can call out to vfs_poll() with a file pointer that may race with
> the last 'fput()'. That would make f_count go down to zero, and while
> the ep->mtx locking means that the resulting file pointer tear-down will
> be blocked until the poll returns, it means that f_count is already
> dead, and any use of it won't actually get a reference to the file any
> more: it's dead regardless.
>=20
> Make sure we have a valid ref on the file pointer before we call down to
> vfs_poll() from the epoll routines.

How much is the extra pair of atomics going to hurt performance?
IIRC a lot of work was done to (try to) make epoll lockless.

Perhaps the 'hook' into epoll (usually) from sys_close should be
done before any of the references are removed?
(Which is different from Q6/A6 in man epoll - but that seems to be
documenting a bug!)
Then the ->poll() callback can't happen (assuming it is properly
locked) after the ->release() one.

It seems better to add extra atomics to the close/final-fput path
rather than ever ->poll() call epoll makes.

I can get extra references to a driver by dup() open("/dev/fd/n")
and mmap() - but epoll is definitely fd based.
(Which may be why it has the fd number in its data.)

Is there another race between EPOLL_CTL_ADD and close() (from a
different thread)?

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


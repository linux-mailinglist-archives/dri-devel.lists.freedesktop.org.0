Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31E08BF8FE
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 10:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC4710F915;
	Wed,  8 May 2024 08:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB1A10F915
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 08:47:46 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-29-05uJX4YSMKKtp074SKxZbg-1; Wed, 08 May 2024 09:47:43 +0100
X-MC-Unique: 05uJX4YSMKKtp074SKxZbg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 8 May
 2024 09:47:12 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 8 May 2024 09:47:12 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Linus Torvalds' <torvalds@linux-foundation.org>, Stefan Metzmacher
 <metze@samba.org>
CC: Al Viro <viro@zeniv.linux.org.uk>, Kees Cook <keescook@chromium.org>,
 "Jens Axboe" <axboe@kernel.dk>, Bui Quang Minh <minhquangbui99@gmail.com>,
 "Christian Brauner" <brauner@kernel.org>, syzbot
 <syzbot+045b454ab35fd82a35fb@syzkaller.appspotmail.com>,
 "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>, "jack@suse.cz"
 <jack@suse.cz>, "linux-fsdevel@vger.kernel.org"
 <linux-fsdevel@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "syzkaller-bugs@googlegroups.com"
 <syzkaller-bugs@googlegroups.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "Laura
 Abbott" <laura@labbott.name>
Subject: RE: get_file() unsafe under epoll (was Re: [syzbot] [fs?] [io-uring?]
 general protection fault in __ep_remove)
Thread-Topic: get_file() unsafe under epoll (was Re: [syzbot] [fs?]
 [io-uring?] general protection fault in __ep_remove)
Thread-Index: AQHan+G0osQPVpGyjEu2UGFetalDzbGNBmXA
Date: Wed, 8 May 2024 08:47:12 +0000
Message-ID: <e9d29d433fde4ebba38830010597f642@AcuMS.aculab.com>
References: <0000000000002d631f0615918f1e@google.com>
 <7c41cf3c-2a71-4dbb-8f34-0337890906fc@gmail.com>
 <202405031110.6F47982593@keescook>
 <64b51cc5-9f5b-4160-83f2-6d62175418a2@kernel.dk>
 <202405031207.9D62DA4973@keescook>
 <d6285f19-01aa-49c8-8fef-4b5842136215@kernel.dk>
 <202405031237.B6B8379@keescook> <202405031325.B8979870B@keescook>
 <20240503211109.GX2118490@ZenIV>
 <CAHk-=wj0de-P2Q=Gz2uyrWBHagT25arLbN0Lyg=U6fT7psKnQA@mail.gmail.com>
 <501ead34-d79f-442e-9b9a-ecd694b3015c@samba.org>
 <CAHk-=whBVkwFryz5-DOAxNKYOy5RwPpQkZHQSs1Oe806Xo6yeg@mail.gmail.com>
In-Reply-To: <CAHk-=whBVkwFryz5-DOAxNKYOy5RwPpQkZHQSs1Oe806Xo6yeg@mail.gmail.com>
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
Content-Transfer-Encoding: base64
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

RnJvbTogTGludXMgVG9ydmFsZHMNCj4gU2VudDogMDYgTWF5IDIwMjQgMTk6MTgNCi4uLg0KPiBX
aGljaCBpcyB3aHkgSSBhcHBsaWVkIHRoZSBtaW5pbWFsIHBhdGNoIGZvciBqdXN0ICJyZWZjb3Vu
dCBvdmVyDQo+IHZmc19wb2xsKCkiLCBhbmQgYW0ganVzdCBtZW50aW9uaW5nIG15IHN1Z2dlc3Rp
b24gaW4gdGhlIGhvcGUgdGhhdA0KPiBzb21lIGVhZ2VyIGJlYXZlciB3b3VsZCBsaWtlIHRvIHNl
ZSBob3cgcGFpbmZ1bCBpdCB3b3VsZCBkbyB0byBtYWtlDQo+IHRoZSBiaWdnZXIgc3VyZ2VyeS4u
Lg0KDQpJIHdvbmRlciBpZiBJIGNhbiB3b3JrIG91dCBob3cgaXQgKGRvZXNuJ3QpIGN1cnJlbnRs
eSB3b3JrLi4uDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJy
YW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lz
dHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=


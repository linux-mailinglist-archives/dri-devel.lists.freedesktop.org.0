Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB481AB8EA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 08:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDDD6EAD8;
	Thu, 16 Apr 2020 06:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08656E0A5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 09:39:34 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-26-3LtwRS6zPnGStZcChf9l-A-1; Wed, 15 Apr 2020 10:39:30 +0100
X-MC-Unique: 3LtwRS6zPnGStZcChf9l-A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 15 Apr 2020 10:39:30 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Wed, 15 Apr 2020 10:39:30 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: =?utf-8?B?J0NocmlzdGlhbiBLw7ZuaWcn?= <christian.koenig@amd.com>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Alex Deucher <alexdeucher@gmail.com>,
 Bernard Zhao <bernard@vivo.com>
Subject: RE: [PATCH] Optimized division operation to shift operation
Thread-Topic: [PATCH] Optimized division operation to shift operation
Thread-Index: AQHWEvuQwS1rXduVrE2yfaZDBTuKn6h57U6g
Date: Wed, 15 Apr 2020 09:39:29 +0000
Message-ID: <e891ca9944774cbdba577982f0bc7738@AcuMS.aculab.com>
References: <1586864113-30682-1-git-send-email-bernard@vivo.com>
 <CADnq5_Phca3L-HGOQz0DPBoARHgwcJRK_a7-WmeFMPkrPWeOeg@mail.gmail.com>
 <87lfmx5h72.fsf@intel.com> <b5ffc6b7-bfa5-0827-a267-4e8c20027982@amd.com>
In-Reply-To: <b5ffc6b7-bfa5-0827-a267-4e8c20027982@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
X-Mailman-Approved-At: Thu, 16 Apr 2020 06:59:07 +0000
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
Cc: Alex Sierra <alex.sierra@amd.com>, David Airlie <airlied@linux.ie>,
 Oak Zeng <Oak.Zeng@amd.com>, LKML <linux-kernel@vger.kernel.org>, Maling
 list - DRI developers <dri-devel@lists.freedesktop.org>,
 "kernel@vivo.com" <kernel@vivo.com>, Huang Rui <ray.huang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Felix Kuehling <Felix.Kuehling@amd.com>, Kent
 Russell <kent.russell@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZw0KPiBTZW50OiAxNSBBcHJpbCAyMDIwIDA4OjU3DQo+IEFt
IDE1LjA0LjIwIHVtIDA5OjQxIHNjaHJpZWIgSmFuaSBOaWt1bGE6DQo+ID4gT24gVHVlLCAxNCBB
cHIgMjAyMCwgQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFpbC5jb20+IHdyb3RlOg0KPiA+
PiBPbiBUdWUsIEFwciAxNCwgMjAyMCBhdCA5OjA1IEFNIEJlcm5hcmQgWmhhbyA8YmVybmFyZEB2
aXZvLmNvbT4gd3JvdGU6DQo+ID4+PiBPbiBzb21lIHByb2Nlc3NvcnMsIHRoZSAvIG9wZXJhdGUg
d2lsbCBjYWxsIHRoZSBjb21waWxlcmBzIGRpdiBsaWIsDQo+ID4+PiB3aGljaCBpcyBsb3cgZWZm
aWNpZW50LCBXZSBjYW4gcmVwbGFjZSB0aGUgLyBvcGVyYXRpb24gd2l0aCBzaGlmdCwNCj4gPj4+
IHNvIHRoYXQgd2UgY2FuIHJlcGxhY2UgdGhlIGNhbGwgb2YgdGhlIGRpdmlzaW9uIGxpYnJhcnkg
d2l0aCBvbmUNCj4gPj4+IHNoaWZ0IGFzc2VtYmx5IGluc3RydWN0aW9uLg0KPiA+IFRoaXMgd2Fz
IGFwcGxpZWQgYWxyZWFkeSwgYW5kIGl0J3Mgbm90IGluIGEgZHJpdmVyIEkgbG9vayBhZnRlci4u
LiBidXQNCj4gPiB0byBtZSB0aGlzIGZlZWxzIGxpa2Ugc29tZXRoaW5nIHRoYXQgcmVhbGx5IHNo
b3VsZCBiZQ0KPiA+IGp1c3RpZmllZC4gVXNpbmcgPj4gaW5zdGVhZCBvZiAvIGZvciBtdWx0aXBs
ZXMgb2YgMiBkaXZpc2lvbiBtYXR0ZXJlZCAyMA0KPiA+IHllYXJzIGFnbywgSSdkIGJlIHN1cnBy
aXNlZCBpZiBpdCBzdGlsbCBkaWQgb24gbW9kZXJuIGNvbXBpbGVycy4NCj4gDQo+IEkgaGF2ZSBz
aW1pbGFyIHdvcnJpZXMsIGVzcGVjaWFsbHkgc2luY2Ugd2UgcmVwbGFjZSB0aGUgIi8gKDQgKiAy
KSIgd2l0aA0KPiAiPj4gMyIgaXQncyBtYWtpbmcgdGhlIGNvZGUganVzdCBhIGJpdCBsZXNzIHJl
YWRhYmxlLg0KPiANCj4gQW5kIHRoYXQgdGhlIGNvZGUgcnVucyBleGFjdGx5IG9uY2Ugd2hpbGUg
bG9hZGluZyB0aGUgZHJpdmVyIGFuZCBwdXNoaW5nDQo+IHRoZSBmaXJtd2FyZSBpbnRvIHRoZSBo
YXJkd2FyZS4gU28gcGVyZm9ybWFuY2UgaXMgY29tcGxldGVseSBpcnJlbGV2YW50DQo+IGhlcmUu
DQoNCkZvcmNlIHRoZSBkaXZpc2lvbiB0byBiZSB1bnNpZ25lZCBhbmQgdGhlIGNvbXBpbGVyIHdp
bGwgdXNlIGEgc2hpZnQuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNp
ZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsN
ClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

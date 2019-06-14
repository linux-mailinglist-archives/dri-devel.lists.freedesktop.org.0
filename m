Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049F847503
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60298891B7;
	Sun, 16 Jun 2019 14:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3829D89A4B
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 15:16:47 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-68-X-FdWeQ3PqmiCOAg4_EgNg-1; Fri, 14 Jun 2019 16:16:44 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 14 Jun 2019 16:16:43 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Fri, 14 Jun 2019 16:16:43 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Robin Murphy' <robin.murphy@arm.com>, 'Christoph Hellwig' <hch@lst.de>
Subject: RE: [PATCH 16/16] dma-mapping: use exact allocation in
 dma_alloc_contiguous
Thread-Topic: [PATCH 16/16] dma-mapping: use exact allocation in
 dma_alloc_contiguous
Thread-Index: AQHVIrfpTFjppS25RkWUhwqPPyqZ4qabLzdwgAAQm/2AAAIJEA==
Date: Fri, 14 Jun 2019 15:16:43 +0000
Message-ID: <d8009432a10549bbbda802021562a28b@AcuMS.aculab.com>
References: <20190614134726.3827-1-hch@lst.de>
 <20190614134726.3827-17-hch@lst.de>
 <a90cf7ec5f1c4166b53c40e06d4d832a@AcuMS.aculab.com>
 <20190614145001.GB9088@lst.de> <4113cd5f-5c13-e9c7-bc5e-dcf0b60e7054@arm.com>
In-Reply-To: <4113cd5f-5c13-e9c7-bc5e-dcf0b60e7054@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: X-FdWeQ3PqmiCOAg4_EgNg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Intel Linux Wireless <linuxwifi@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Ian Abbott <abbotti@mev.co.uk>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, "moderated list:ARM
 PORT" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 H Hartley Sweeten <hsweeten@visionengravers.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iaW4gTXVycGh5DQo+IFNlbnQ6IDE0IEp1bmUgMjAxOSAxNjowNg0KLi4uDQo+IFdl
bGwsIGFwYXJ0IGZyb20gdGhlIGJpdCBpbiBETUEtQVBJLUhPV1RPIHdoaWNoIGhhcyBzYWlkIHRo
aXMgc2luY2UNCj4gZm9yZXZlciAod2VsbCwgYmVmb3JlIEdpdCBoaXN0b3J5LCBhdCBsZWFzdCk6
DQo+IA0KPiAiVGhlIENQVSB2aXJ0dWFsIGFkZHJlc3MgYW5kIHRoZSBETUEgYWRkcmVzcyBhcmUg
Ym90aA0KPiBndWFyYW50ZWVkIHRvIGJlIGFsaWduZWQgdG8gdGhlIHNtYWxsZXN0IFBBR0VfU0la
RSBvcmRlciB3aGljaA0KPiBpcyBncmVhdGVyIHRoYW4gb3IgZXF1YWwgdG8gdGhlIHJlcXVlc3Rl
ZCBzaXplLiAgVGhpcyBpbnZhcmlhbnQNCj4gZXhpc3RzIChmb3IgZXhhbXBsZSkgdG8gZ3VhcmFu
dGVlIHRoYXQgaWYgeW91IGFsbG9jYXRlIGEgY2h1bmsNCj4gd2hpY2ggaXMgc21hbGxlciB0aGFu
IG9yIGVxdWFsIHRvIDY0IGtpbG9ieXRlcywgdGhlIGV4dGVudCBvZiB0aGUNCj4gYnVmZmVyIHlv
dSByZWNlaXZlIHdpbGwgbm90IGNyb3NzIGEgNjRLIGJvdW5kYXJ5LiINCg0KSSBrbmV3IGl0IHdh
cyBzb21ld2hlcmUgOi0pDQpJbnRlcmVzdGluZ2x5IHRoYXQgYWxzbyBpbXBsaWVzIHRoYXQgdGhl
IGFkZHJlc3MgcmV0dXJuZWQgZm9yIGEgc2l6ZQ0Kb2YgKHNheSkgMTI4IHdpbGwgYWxzbyBiZSBw
YWdlIGFsaWduZWQuDQpJbiB0aGF0IGNhc2UgMTI4IGJ5dGUgYWxpZ25tZW50IHNob3VsZCBwcm9i
YWJseSBiZSBvayAtIGJ1dCBpdCBpcyBzdGlsbA0KYW4gQVBJIGNoYW5nZSB0aGF0IGNvdWxkIGhh
dmUgaG9ycmlkIGNvbnNlcXVlbmNlcy4NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVz
cyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEg
MVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

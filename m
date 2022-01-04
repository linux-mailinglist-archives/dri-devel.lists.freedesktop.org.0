Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B06D8483E65
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 09:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AB110E4F4;
	Tue,  4 Jan 2022 08:44:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F2710E4F5
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jan 2022 08:43:59 +0000 (UTC)
X-UUID: 18e07e3da8ab4b538092027fbb9838c0-20220104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=brhqIFFMdcfEWAvou5K8NfEO+QOlRwYJuECfooyXFss=; 
 b=mn9ELV+fjBtVpkrrS7AFKO4+61PWCKOBXnDLzxkF+kLenKMfoPOhtyoZ5ceTwHvkh+vN8vyCsP4Hb38AagFtd+Z+j6XSKM/Q1zGfoFdt9hQlOsn8mW4nitisc4JVJIFFQw+FOqIF4ExMGZ4SXSmBG+GVpv0a7sXpnbbBQe4AeKA=;
X-UUID: 18e07e3da8ab4b538092027fbb9838c0-20220104
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <guangming.cao@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1052074197; Tue, 04 Jan 2022 16:43:57 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 4 Jan 2022 16:43:56 +0800
Received: from mszswglt01 (10.16.20.20) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Jan 2022 16:43:55 +0800
Message-ID: <ae7c424a02b5b0ef30239ca65bd58086f13bc42b.camel@mediatek.com>
Subject: Re: [PATCH v2] dma-buf: dma-heap: Add a size check for allocation
From: Guangming.Cao <guangming.cao@mediatek.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "John
 Stultz" <john.stultz@linaro.org>
Date: Tue, 4 Jan 2022 16:44:45 +0800
In-Reply-To: <c05749d0-4c24-8763-a459-27257b2524ed@amd.com>
References: <20211217094104.24977-1-guangming.cao@mediatek.com>
 <20211227095102.6054-1-guangming.cao@mediatek.com>
 <CALAqxLVA4jUk-2o28RZobrPDUnuXfV1xN77Pt8Pu1o27V3aUQQ@mail.gmail.com>
 <c05749d0-4c24-8763-a459-27257b2524ed@amd.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
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
Cc: jianjiao zeng <jianjiao.zeng@mediatek.com>, wsd_upstream@mediatek.com,
 Libo Kang <libo.kang@mediatek.com>, open list <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>,
 "moderated list:DMA-BUF HEAPS FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Yunfei Wang <yf.wang@mediatek.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 "open list:DMA-BUF HEAPS FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Bo Song <bo.song@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 mingyuan ma <mingyuan.ma@mediatek.com>, Laura Abbott <labbott@redhat.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "open list:DMA-BUF HEAPS
 FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIyLTAxLTA0IGF0IDA4OjQ3ICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiBBbSAwMy4wMS4yMiB1bSAxOTo1NyBzY2hyaWViIEpvaG4gU3R1bHR6Og0KPiA+IE9uIE1v
biwgRGVjIDI3LCAyMDIxIGF0IDE6NTIgQU0gPGd1YW5nbWluZy5jYW9AbWVkaWF0ZWsuY29tPiB3
cm90ZToNCj4gPiA+IEZyb206IEd1YW5nbWluZyA8R3VhbmdtaW5nLkNhb0BtZWRpYXRlay5jb20+
DQo+ID4gPiANCj4gPiANCj4gPiBUaGFua3MgZm9yIHN1Ym1pdHRpbmcgdGhpcyENCj4gPiANCj4g
PiA+IEFkZCBhIHNpemUgY2hlY2sgZm9yIGFsbGNhdGlvbiBzaW5jZSB0aGUgYWxsb2NhdGlvbiBz
aXplIGlzDQo+ID4gDQo+ID4gbml0OiAiYWxsb2NhdGlvbiIgYWJvdmUuDQo+ID4gDQo+ID4gPiBh
bHdheXMgbGVzcyB0aGFuIHRoZSB0b3RhbCBEUkFNIHNpemUuDQo+ID4gDQo+ID4gSW4gZ2VuZXJh
bCwgaXQgbWlnaHQgYmUgZ29vZCB0byBhZGQgbW9yZSBjb250ZXh0IHRvIHRoZSBjb21taXQNCj4g
PiBtZXNzYWdlDQo+ID4gdG8gYmV0dGVyIGFuc3dlciAqd2h5KiB0aGlzIGNoYW5nZSBpcyBuZWVk
ZWQgcmF0aGVyIHRoYW4gd2hhdCB0aGUNCj4gPiBjaGFuZ2UgaXMgZG9pbmcuICBpZTogV2hhdCBu
ZWdhdGl2ZSB0aGluZyBoYXBwZW5zIHdpdGhvdXQgdGhpcw0KPiA+IGNoYW5nZT8NCj4gPiBBbmQg
c28gaG93IGRvZXMgdGhpcyBjaGFuZ2UgYXZvaWQgb3IgaW1wcm92ZSB0aGluZ3M/DQo+IA0KPiBD
b21wbGV0ZWx5IGFncmVlLCBqdXN0IG9uZSBsaXR0bGUgYWRkaXRpb246IENvdWxkIHlvdSBhbHNv
IGFkZCB0aGlzDQo+IHdoeSANCj4gYXMgY29tbWVudCB0byB0aGUgY29kZT8NCj4gDQo+IFdoZW4g
d2Ugc3R1bWJsZSBvdmVyIHRoaXMgZml2ZSB5ZWFycyBmcm9tIG5vdyBpdCBpcyBhYnNvbHV0ZWx5
IG5vdCANCj4gb2J2aW91cyB3aHkgd2UgZG8gdGhpcy4NClRoYW5rcyBmb3IgeW91ciByZXBseSEN
Ckkgd2lsbCB1cGRhdGUgdGhlIHJlbGF0ZWQgcmVhc29uIGluIHRoZSBwYXRjaCBsYXRlci4NCg0K
VGhlIHJlYXNvbiBmb3IgYWRkaW5nIHRoaXMgY2hlY2sgaXMgdGhhdCB3ZSBtZXQgYSBjYXNlIHRo
YXQgdGhlIHVzZXINCnNlbnQgYW4gaW52YWxpZCBzaXplKEl0IHNlZW1zIGl0J3MgYSBuZWdhdGl2
ZSB2YWx1ZSwgTVNCIGlzIDB4ZmYsIGl0J3MNCmxhcmdlciB0aGFuIERSQU0gc2l6ZSBhZnRlciBj
b252ZXJ0IGl0IHRvIHNpemVfdCkgdG8gZG1hLWhlYXAgdG8gYWxsb2MNCm1lbW9yeSwgYW5kIHRo
aXMgYWxsb2NhdGlvbiB3YXMgcnVubmluZyBvbiBhIHByb2Nlc3Moc3VjaCBhcyAiZ3JhbGxvYyIN
Cm9uIEFuZHJvaWQgZGV2aWNlKSBjYW4ndCBiZSBraWxsZWQgYnkgT09NIGZsb3csIGFuZCB3ZSBh
bHNvIGNvdWxkbid0DQpmaW5kIHRoZSByZWxhdGVkIGRtYWJ1ZiBpbiAiZG1hX2J1Zl9kZWJ1Z19z
aG93IiBiZWNhdXNlIHRoZSByZWxhdGVkDQpkbWFidWYgd2FzIG5vdCBleHBvcnRlZCB5ZXQgc2lu
Y2UgdGhlIGFsbG9jYXRpb24gaXMgc3RpbGwgb24gZ29pbmcuDQoNClNpbmNlIHRoaXMgaW52YWxp
ZCBhcmd1bWVudCBjYXNlIGNhbiBiZSBwcmV2ZW50ZWQgYXQgZG1hLWhlYXAgc2lkZSwgc28sDQpJ
IGFkZGVkIHRoaXMgc2l6ZSBjaGVjaywgYW5kIG1vcmVvdmVyLCB0byBsZXQgZGVidWcgaXQgZWFz
aWx5LCBJIGFsc28NCmFkZGVkIGxvZ3Mgd2hlbiBzaXplIGlzIGJpZ2dlciB0aGFuIGEgdGhyZXNo
b2xkIHdlIHNldCBpbiBtdGsgc3lzdGVtDQpoZWFwLg0KSWYgeW91IHRoaW5rIHRoYXQgcHJpbnQg
bG9ncyBpbiBkbWEtaGVhcCBmcmFtZXdvcmsgaXMgYmV0dGVyLCBJIHdpbGwNCnVwZGF0ZSBpdCBp
biBuZXh0IHZlcnNpb24uDQoNCklmIHlvdSBoYXZlIGJldHRlciBzb2x1dGlvbihzdWNoIGFzIGR1
bXAgdGhlIHNpemUgdW5kZXIgYWxsb2NhdGluZw0KaW4gImRtYV9idWZfZGVidWdfc2hvdyIsIHdo
aWNoIG1heWJlIG5lZWQgYWRkIGdsb2JhbCB2YXJpYWJsZSB0byByZWNvcmQNCml0KSwgcGxlYXNl
IGtpbmRseSBsZXQgbWUga25vdywgdGhhbmtzIDopDQoNCj4gDQo+IFRoYW5rcywNCj4gQ2hyaXN0
aWFuLg0KPiANCj4gPiANCj4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1YW5nbWluZyA8R3Vh
bmdtaW5nLkNhb0BtZWRpYXRlay5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBqaWFuamlhbyB6
ZW5nIDxqaWFuamlhby56ZW5nQG1lZGlhdGVrLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gdjI6IDEu
IHVwZGF0ZSBzaXplIGxpbWl0YXRpb24gYXMgdG90YWxfZHJhbSBwYWdlIHNpemUuDQo+ID4gPiAg
ICAgIDIuIHVwZGF0ZSBjb21taXQgbWVzc2FnZQ0KPiA+ID4gLS0tDQo+ID4gPiAgIGRyaXZlcnMv
ZG1hLWJ1Zi9kbWEtaGVhcC5jIHwgMiArKw0KPiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1h
LWhlYXAuYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtDQo+ID4gPiBoZWFwLmMNCj4gPiA+IGluZGV4
IDU2YmY1YWQwMWFkNS4uZTM5ZDJiZTk4ZDY5IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9k
bWEtYnVmL2RtYS1oZWFwLmMNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtaGVhcC5j
DQo+ID4gPiBAQCAtNTUsNiArNTUsOCBAQCBzdGF0aWMgaW50IGRtYV9oZWFwX2J1ZmZlcl9hbGxv
YyhzdHJ1Y3QNCj4gPiA+IGRtYV9oZWFwICpoZWFwLCBzaXplX3QgbGVuLA0KPiA+ID4gICAgICAg
ICAgc3RydWN0IGRtYV9idWYgKmRtYWJ1ZjsNCj4gPiA+ICAgICAgICAgIGludCBmZDsNCj4gPiA+
IA0KPiA+ID4gKyAgICAgICBpZiAobGVuIC8gUEFHRV9TSVpFID4gdG90YWxyYW1fcGFnZXMoKSkN
Cj4gPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiANCj4gPiBUaGlzIHNl
ZW1zIHNhbmUuIEkga25vdyBJT04gdXNlZCB0byBoYXZlIHNvbWUgMS8yIG9mIG1lbW9yeSBjYXAg
dG8NCj4gPiBhdm9pZCB1bm5lY2Vzc2FyeSBtZW1vcnkgcHJlc3N1cmUgb24gY3JhenkgYWxsb2Nh
dGlvbnMuDQo+ID4gDQo+ID4gQ291bGQgeW91IHNlbmQgYWdhaW4gd2l0aCBhbiBpbXByb3ZlZCBj
b21taXQgbWVzc2FnZT8NCj4gPiANCj4gPiB0aGFua3MNCj4gPiAtam9obg0KPiANCj4gDQo=


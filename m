Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D43424BF9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 04:57:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA4D26E811;
	Thu,  7 Oct 2021 02:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1ACD6E811
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Oct 2021 02:57:07 +0000 (UTC)
X-UUID: 23a9fe624ca14001ac777cca9e1593f6-20211007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=puAeYVHv80gaLD3QPUVP0U9ZlM4HRv166FTTO6hr2Lk=; 
 b=LqzMu5O1Ak1GXXXZIGexmWg/0ZCTwsSG5We2XLOH6iO7Ba4RPqZF5ht9oZZ69+uMg+JklvO1wEOXebFap0K1/ydqHp0no/CJKw0h7AA/w2OoRanFVNXcLOl70D13Lna3urZ/5YBRsjcFc+CPP8WM5CE1JtRZPqAeGH5mq87dze0=;
X-UUID: 23a9fe624ca14001ac777cca9e1593f6-20211007
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 722450187; Thu, 07 Oct 2021 10:57:01 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 7 Oct 2021 10:57:00 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Oct 2021 10:56:58 +0800
Message-ID: <7703076927822fc31d1af37f8fd3bfe5e0513d29.camel@mediatek.com>
Subject: Re: [PATCH v8 09/12] media: mtk-vcodec: Get rid of
 mtk_smi_larb_get/put
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <youlin.pei@mediatek.com>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <yi.kuo@mediatek.com>, <acourbot@chromium.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Daniel
 Vetter" <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 <anthony.huang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>,
 Irui Wang <irui.wang@mediatek.com>
Date: Thu, 7 Oct 2021 10:57:01 +0800
In-Reply-To: <f9829a5a-984c-bced-0286-53f9edc8ae3d@collabora.com>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
 <20210929013719.25120-10-yong.wu@mediatek.com>
 <02f444d5-9633-3f9c-2d1f-97ce073d1180@collabora.com>
 <79cbf64491273797f218f417234b8c95936bd3b1.camel@mediatek.com>
 <f9829a5a-984c-bced-0286-53f9edc8ae3d@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIxLTA5LTMwIGF0IDEyOjU3ICswMjAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3Rl
Og0KPiANCj4gT24gMzAuMDkuMjEgMDU6MjgsIFlvbmcgV3Ugd3JvdGU6DQo+ID4gSGkgRGFmbmEs
DQo+ID4gDQo+ID4gVGhhbmtzIHZlcnkgbXVjaCBmb3IgdGhlIHJldmlldy4NCj4gPiANCj4gPiBP
biBXZWQsIDIwMjEtMDktMjkgYXQgMTQ6MTMgKzAyMDAsIERhZm5hIEhpcnNjaGZlbGQgd3JvdGU6
DQo+ID4gPiANCj4gPiA+IE9uIDI5LjA5LjIxIDAzOjM3LCBZb25nIFd1IHdyb3RlOg0KPiA+ID4g
PiBNZWRpYVRlayBJT01NVSBoYXMgYWxyZWFkeSBhZGRlZCB0aGUgZGV2aWNlX2xpbmsgYmV0d2Vl
biB0aGUNCj4gPiA+ID4gY29uc3VtZXINCj4gPiA+ID4gYW5kIHNtaS1sYXJiIGRldmljZS4gSWYg
dGhlIHZjb2RlYyBkZXZpY2UgY2FsbCB0aGUNCj4gPiA+ID4gcG1fcnVudGltZV9nZXRfc3luYywN
Cj4gPiA+ID4gdGhlIHNtaS1sYXJiJ3MgcG1fcnVudGltZV9nZXRfc3luYyBhbHNvIGJlIGNhbGxl
ZA0KPiA+ID4gPiBhdXRvbWF0aWNhbGx5Lg0KPiA+ID4gPiANCj4gPiA+ID4gQ0M6IFRpZmZhbnkg
TGluIDx0aWZmYW55LmxpbkBtZWRpYXRlay5jb20+DQo+ID4gPiA+IENDOiBJcnVpIFdhbmcgPGly
dWkud2FuZ0BtZWRpYXRlay5jb20+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmcgV3UgPHlv
bmcud3VAbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiBSZXZpZXdlZC1ieTogRXZhbiBHcmVlbiA8ZXZn
cmVlbkBjaHJvbWl1bS5vcmc+DQo+ID4gPiA+IEFja2VkLWJ5OiBUaWZmYW55IExpbiA8dGlmZmFu
eS5saW5AbWVkaWF0ZWsuY29tPg0KPiA+ID4gPiBSZXZpZXdlZC1ieTogRGFmbmEgSGlyc2NoZmVs
ZCA8ZGFmbmEuaGlyc2NoZmVsZEBjb2xsYWJvcmEuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4g
ICAgLi4uL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19kZWNfcG0uYyAgIHwgMzcgKysr
LS0tLQ0KPiA+ID4gPiAtLS0tLS0tDQo+ID4gPiA+IC0tDQo+ID4gPiA+ICAgIC4uLi9wbGF0Zm9y
bS9tdGstdmNvZGVjL210a192Y29kZWNfZHJ2LmggICAgICB8ICAzIC0tDQo+ID4gPiA+ICAgIC4u
Li9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNfZW5jLmMgICAgICB8ICAxIC0NCj4gPiA+
ID4gICAgLi4uL3BsYXRmb3JtL210ay12Y29kZWMvbXRrX3Zjb2RlY19lbmNfcG0uYyAgIHwgNDQg
KysrLS0tLQ0KPiA+ID4gPiAtLS0tLS0tDQoNCltzbmlwXQ0KDQo+ID4gPiA+ICAgIHZvaWQgbXRr
X3Zjb2RlY19yZWxlYXNlX2RlY19wbShzdHJ1Y3QgbXRrX3Zjb2RlY19kZXYgKmRldikNCj4gPiA+
ID4gICAgew0KPiA+ID4gPiAgICAJcG1fcnVudGltZV9kaXNhYmxlKGRldi0+cG0uZGV2KTsNCj4g
PiA+ID4gLQlwdXRfZGV2aWNlKGRldi0+cG0ubGFyYnZkZWMpOw0KPiA+ID4gPiAgICB9DQo+ID4g
PiANCj4gPiA+IE5vdyB0aGF0IGZ1bmN0aW9ucyBvbmx5IGRvICAncG1fcnVudGltZV9kaXNhYmxl
KGRldi0+cG0uZGV2KTsnIHNvDQo+ID4gPiBpdA0KPiA+ID4gd2lsbCBiZSBtb3JlDQo+ID4gPiBy
ZWFkYWJsZSB0byByZW1vdmUgdGhlIGZ1bmN0aW9uIG10a192Y29kZWNfcmVsZWFzZV9kZWNfcG0N
Cj4gPiA+IGFuZCByZXBsYWNlIHdpdGggcG1fcnVudGltZV9kaXNhYmxlKGRldi0+cG0uZGV2KTsN
Cj4gPiA+IFNhbWUgZm9yIHRoZSAnZW5jJyBlcXVpdmFsZW50Lg0KPiA+IA0KPiA+IE1ha2Ugc2Vu
c2UuIEJ1dCBJdCBtYXkgYmUgbm90IHByb3BlciBpZiB1c2luZyBwbV9ydW50aW1lX2Rpc2FibGUN
Cj4gPiBhcyB0aGUgc3ltbWV0cnkgd2l0aCBtdGtfdmNvZGVjX2luaXRfZGVjX3BtIGluIHRoZQ0K
PiA+IG10a192Y29kZWNfcHJvYmUuDQo+ID4gDQo+ID4gTWF5YmUgd2Ugc2hvdWxkIG1vdmUgcG1f
cnVudGltZV9lbmFibGUgb3V0IGZyb20NCj4gPiBtdGtfdmNvZGVjX2luaXRfZGVjX3BtDQo+ID4g
aW50byBtdGtfdmNvZGVjX3Byb2JlLiBJIGNvdWxkIGRvIGEgbmV3IHBhdGNoIGZvciB0aGlzLiBJ
cyB0aGlzIG9rDQo+ID4gZm9yDQo+ID4geW91Pw0KPiANCj4geWVzLCB0aGVyZSBpcyBhbHNvIGFz
eW1ldHRyeSB3aGVuIGNhbGxpbmcgcG1fcnVudGltZSogaW4gZ2VuZXJhbCwNCj4gSSBzZWUgaW4g
dGhlIGRlY29kZXIgaXQgaXMgY2FsbGVkIGZyb20gbXRrX3Zjb2RlY19kZWNfcG0uYw0KPiBidXQg
aW4gdGhlIGVuY29kZXIgaXQgaXMgY2FsbGVkIGZyb20gbXRrX3Zjb2RlY19lbmMuYywNCj4gDQo+
IEkgdGhpbmsgYWxsIGNhbGxzIHRvIHBtX3J1bnRpbWUqIHNob3VsZCBiZSBvdXQgb2YgdGhlICpf
cG0uYyBmaWxlcw0KDQpPSy4gSSB3aWxsIHRyeSB0aGlzLg0KDQo+IHNpbmNlIGZvciBleGFtcGxl
ICdtdGtfdmNvZGVjX2RlY19wd19vbicgYWxzbyBkbyBqdXN0IG9uZSBjYWxsIHRvDQo+IHBtX3J1
bnRpbWVfcmVzdW1lX2FuZF9nZXQgc28gdGhpcyBmdW5jdGlvbiBjYW4gYWxzbyBiZSByZW1vdmVk
Lg0KDQpJIGd1ZXNzIHRoaXMgb25lIHNob3VsZCBiZSByZXNlcnZlZCB0byB2Y29kZWMgZ3V5cy4g
SSBzZWUgdGhpcyBmdW5jdGlvbg0KaXMgY2hhbmdlZCBhdCBbMV0uIExldCdzIGtlZXAgdGhpcyBw
YXRjaHNldCBjbGVhbi4NCg0KWzFdIA0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9q
ZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjEwOTAxMDgzMjE1LjI1OTg0LTEwLXl1bmZlaS5k
b25nQG1lZGlhdGVrLmNvbS8NCg0KPiANCj4gdGhhbmtzLA0KPiBEYWZuYQ0KPiANCj4gPiANCj4g
PiA+IA0KPiA+ID4gVGhhbmtzLA0KPiA+ID4gRGFmbmENCj4gPiANCj4gPiBbc25pcF0NCj4gPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IExpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdA0KPiA+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrDQo+ID4gDQo=


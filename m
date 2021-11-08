Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6666F447E5A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 11:57:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55726EE6E;
	Mon,  8 Nov 2021 10:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D55D16EC4C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 10:56:58 +0000 (UTC)
X-UUID: dfd8505877e44054adb44e1a8b583d8b-20211108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3laS0JHHL832/8yzhfTLVWJNHfc0+i8xtdcoryLDcz8=; 
 b=K2wBrmMBUK6Xs8vK0WCgAFQ/ofjldVPmtju5BDzVQZ6CJS5GVrUSemNfFa1bmA30eXdqKn/HVmNMooCSsR/Py974SZWtBFKtuSs0N7jX7QebkPekw3VnoqYjoUWOq8J0Nd0AOUQNE6vNAxfLZ916KShyevJVEZzt6eTOy32Ki50=;
X-UUID: dfd8505877e44054adb44e1a8b583d8b-20211108
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2089110348; Mon, 08 Nov 2021 18:56:52 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Nov 2021 18:56:51 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 8 Nov 2021 18:56:50 +0800
Message-ID: <d08bcbc965c1f8c929cdecf66e8567cd9eca6d41.camel@mediatek.com>
Subject: Re: [PATCH v10, 4/5] soc: mediatek: add mtk mutex support for MT8192
From: yongqiang.niu <yongqiang.niu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
Date: Mon, 8 Nov 2021 18:56:50 +0800
In-Reply-To: <1ec3cefb-12cd-86e8-fff2-1ab0d10034b6@gmail.com>
References: <20210930155222.5861-1-yongqiang.niu@mediatek.com>
 <20210930155222.5861-5-yongqiang.niu@mediatek.com>
 <1ec3cefb-12cd-86e8-fff2-1ab0d10034b6@gmail.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIxLTEwLTA4IGF0IDEzOjI3ICswMjAwLCBNYXR0aGlhcyBCcnVnZ2VyIHdyb3Rl
Og0KPiANCj4gT24gMzAvMDkvMjAyMSAxNzo1MiwgWW9uZ3FpYW5nIE5pdSB3cm90ZToNCj4gPiBB
ZGQgbXRrIG11dGV4IHN1cHBvcnQgZm9yIE1UODE5MiBTb0MuDQo+ID4gDQo+ID4gU2lnbmVkLW9m
Zi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+DQo+ID4gU2ln
bmVkLW9mZi1ieTogSHNpbi1ZaSBXYW5nIDxoc2lueWlAY2hyb21pdW0ub3JnPg0KPiA+IFJldmll
d2VkLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29tPg0KPiANCj4gQXBwbGllZCB0byB2NS4x
NS1uZXh0L3NvYw0KPiANCj4gVGhhbmtzIQ0KDQpwbGVhc2UgaGVscCByZXZpZXcgb3RoZXIgcGF0
Y2hlcyBvZiB0aGlzIHNlcmlhbCwgdGtzDQoNCg0KDQo+IA0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbXRrLW11dGV4LmMgfCAzNQ0KPiA+ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKQ0KPiA+
IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstbXV0ZXguYw0KPiA+
IGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLW11dGV4LmMNCj4gPiBpbmRleCAyZTRiY2MzMDA1
NzYuLjJjYTU1YmI1YThiZSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9t
dGstbXV0ZXguYw0KPiA+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1tdXRleC5jDQo+
ID4gQEAgLTM5LDYgKzM5LDE4IEBADQo+ID4gICAjZGVmaW5lIE1UODE2N19NVVRFWF9NT0RfRElT
UF9ESVRIRVIJCTE1DQo+ID4gICAjZGVmaW5lIE1UODE2N19NVVRFWF9NT0RfRElTUF9VRk9FCQkx
Ng0KPiA+ICAgDQo+ID4gKyNkZWZpbmUgTVQ4MTkyX01VVEVYX01PRF9ESVNQX09WTDAJCTANCj4g
PiArI2RlZmluZSBNVDgxOTJfTVVURVhfTU9EX0RJU1BfT1ZMMF8yTAkJMQ0KPiA+ICsjZGVmaW5l
IE1UODE5Ml9NVVRFWF9NT0RfRElTUF9SRE1BMAkJMg0KPiA+ICsjZGVmaW5lIE1UODE5Ml9NVVRF
WF9NT0RfRElTUF9DT0xPUjAJCTQNCj4gPiArI2RlZmluZSBNVDgxOTJfTVVURVhfTU9EX0RJU1Bf
Q0NPUlIwCQk1DQo+ID4gKyNkZWZpbmUgTVQ4MTkyX01VVEVYX01PRF9ESVNQX0FBTDAJCTYNCj4g
PiArI2RlZmluZSBNVDgxOTJfTVVURVhfTU9EX0RJU1BfR0FNTUEwCQk3DQo+ID4gKyNkZWZpbmUg
TVQ4MTkyX01VVEVYX01PRF9ESVNQX1BPU1RNQVNLMAkJOA0KPiA+ICsjZGVmaW5lIE1UODE5Ml9N
VVRFWF9NT0RfRElTUF9ESVRIRVIwCQk5DQo+ID4gKyNkZWZpbmUgTVQ4MTkyX01VVEVYX01PRF9E
SVNQX09WTDJfMkwJCTE2DQo+ID4gKyNkZWZpbmUgTVQ4MTkyX01VVEVYX01PRF9ESVNQX1JETUE0
CQkxNw0KPiA+ICsNCj4gPiAgICNkZWZpbmUgTVQ4MTgzX01VVEVYX01PRF9ESVNQX1JETUEwCQkw
DQo+ID4gICAjZGVmaW5lIE1UODE4M19NVVRFWF9NT0RfRElTUF9SRE1BMQkJMQ0KPiA+ICAgI2Rl
ZmluZSBNVDgxODNfTVVURVhfTU9EX0RJU1BfT1ZMMAkJOQ0KPiA+IEBAIC0yMTQsNiArMjI2LDIw
IEBAIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQNCj4gPiBtdDgxODNfbXV0ZXhfbW9kW0REUF9D
T01QT05FTlRfSURfTUFYXSA9IHsNCj4gPiAgIAlbRERQX0NPTVBPTkVOVF9XRE1BMF0gPSBNVDgx
ODNfTVVURVhfTU9EX0RJU1BfV0RNQTAsDQo+ID4gICB9Ow0KPiA+ICAgDQo+ID4gK3N0YXRpYyBj
b25zdCB1bnNpZ25lZCBpbnQgbXQ4MTkyX211dGV4X21vZFtERFBfQ09NUE9ORU5UX0lEX01BWF0g
PQ0KPiA+IHsNCj4gPiArCVtERFBfQ09NUE9ORU5UX0FBTDBdID0gTVQ4MTkyX01VVEVYX01PRF9E
SVNQX0FBTDAsDQo+ID4gKwlbRERQX0NPTVBPTkVOVF9DQ09SUl0gPSBNVDgxOTJfTVVURVhfTU9E
X0RJU1BfQ0NPUlIwLA0KPiA+ICsJW0REUF9DT01QT05FTlRfQ09MT1IwXSA9IE1UODE5Ml9NVVRF
WF9NT0RfRElTUF9DT0xPUjAsDQo+ID4gKwlbRERQX0NPTVBPTkVOVF9ESVRIRVJdID0gTVQ4MTky
X01VVEVYX01PRF9ESVNQX0RJVEhFUjAsDQo+ID4gKwlbRERQX0NPTVBPTkVOVF9HQU1NQV0gPSBN
VDgxOTJfTVVURVhfTU9EX0RJU1BfR0FNTUEwLA0KPiA+ICsJW0REUF9DT01QT05FTlRfUE9TVE1B
U0swXSA9IE1UODE5Ml9NVVRFWF9NT0RfRElTUF9QT1NUTUFTSzAsDQo+ID4gKwlbRERQX0NPTVBP
TkVOVF9PVkwwXSA9IE1UODE5Ml9NVVRFWF9NT0RfRElTUF9PVkwwLA0KPiA+ICsJW0REUF9DT01Q
T05FTlRfT1ZMXzJMMF0gPSBNVDgxOTJfTVVURVhfTU9EX0RJU1BfT1ZMMF8yTCwNCj4gPiArCVtE
RFBfQ09NUE9ORU5UX09WTF8yTDJdID0gTVQ4MTkyX01VVEVYX01PRF9ESVNQX09WTDJfMkwsDQo+
ID4gKwlbRERQX0NPTVBPTkVOVF9SRE1BMF0gPSBNVDgxOTJfTVVURVhfTU9EX0RJU1BfUkRNQTAs
DQo+ID4gKwlbRERQX0NPTVBPTkVOVF9SRE1BNF0gPSBNVDgxOTJfTVVURVhfTU9EX0RJU1BfUkRN
QTQsDQo+ID4gK307DQo+ID4gKw0KPiA+ICAgc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCBtdDI3
MTJfbXV0ZXhfc29mW01VVEVYX1NPRl9EU0kzICsgMV0gPQ0KPiA+IHsNCj4gPiAgIAlbTVVURVhf
U09GX1NJTkdMRV9NT0RFXSA9IE1VVEVYX1NPRl9TSU5HTEVfTU9ERSwNCj4gPiAgIAlbTVVURVhf
U09GX0RTSTBdID0gTVVURVhfU09GX0RTSTAsDQo+ID4gQEAgLTI3NSw2ICszMDEsMTMgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBtdGtfbXV0ZXhfZGF0YQ0KPiA+IG10ODE4M19tdXRleF9kcml2ZXJf
ZGF0YSA9IHsNCj4gPiAgIAkubm9fY2xrID0gdHJ1ZSwNCj4gPiAgIH07DQo+ID4gICANCj4gPiAr
c3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfbXV0ZXhfZGF0YSBtdDgxOTJfbXV0ZXhfZHJpdmVyX2Rh
dGEgPSB7DQo+ID4gKwkubXV0ZXhfbW9kID0gbXQ4MTkyX211dGV4X21vZCwNCj4gPiArCS5tdXRl
eF9zb2YgPSBtdDgxODNfbXV0ZXhfc29mLA0KPiA+ICsJLm11dGV4X21vZF9yZWcgPSBNVDgxODNf
TVVURVgwX01PRDAsDQo+ID4gKwkubXV0ZXhfc29mX3JlZyA9IE1UODE4M19NVVRFWDBfU09GMCwN
Cj4gPiArfTsNCj4gPiArDQo+ID4gICBzdHJ1Y3QgbXRrX211dGV4ICptdGtfbXV0ZXhfZ2V0KHN0
cnVjdCBkZXZpY2UgKmRldikNCj4gPiAgIHsNCj4gPiAgIAlzdHJ1Y3QgbXRrX211dGV4X2N0eCAq
bXR4ID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gQEAgLTUwNyw2ICs1NDAsOCBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZA0KPiA+IG11dGV4X2RyaXZlcl9kdF9tYXRjaFtd
ID0gew0KPiA+ICAgCSAgLmRhdGEgPSAmbXQ4MTczX211dGV4X2RyaXZlcl9kYXRhfSwNCj4gPiAg
IAl7IC5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4My1kaXNwLW11dGV4IiwNCj4gPiAgIAkg
IC5kYXRhID0gJm10ODE4M19tdXRleF9kcml2ZXJfZGF0YX0sDQo+ID4gKwl7IC5jb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE5Mi1kaXNwLW11dGV4IiwNCj4gPiArCSAgLmRhdGEgPSAmbXQ4MTky
X211dGV4X2RyaXZlcl9kYXRhfSwNCj4gPiAgIAl7fSwNCj4gPiAgIH07DQo+ID4gICBNT0RVTEVf
REVWSUNFX1RBQkxFKG9mLCBtdXRleF9kcml2ZXJfZHRfbWF0Y2gpOw0KPiA+IA0K


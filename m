Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1024943C0FA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 05:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057C089CDD;
	Wed, 27 Oct 2021 03:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B45389CDD
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 03:47:40 +0000 (UTC)
X-UUID: dd5a00d41c7d4fb6b744d9301026df6c-20211027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9eSb7qn3/LPscD1cplmBdJDI7Pw9AFl6IDdS5bPuJvA=; 
 b=jnt67Z3XJo7LEPdTOJKjqD6v0bb6TijQeF7gzN9v6Sk62AV9HaSPYhze1+HJbpZ294041neRffpfzbdSqGYOhTciQ9UNtYWGqkjRKnCKL2leH1r6a5ji0h0JToNOnirA15EFM/yk3XisFGHte67fmUJ1JStZ0H/TRtvH3KKdVFE=;
X-UUID: dd5a00d41c7d4fb6b744d9301026df6c-20211027
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 637495341; Wed, 27 Oct 2021 11:47:35 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 27 Oct 2021 11:47:34 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Oct 2021 11:47:33 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Oct 2021 11:47:31 +0800
Message-ID: <f72354d3d99c22fd02cbcc2894fee2716934e180.camel@mediatek.com>
Subject: Re: [PATCH v7, 11/15] media: mtk-vcodec: Add core thread
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 27 Oct 2021 11:47:31 +0800
In-Reply-To: <3b7084d4-e530-9a55-11f4-d67c37f8f5fa@collabora.com>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <20211011070247.792-12-yunfei.dong@mediatek.com>
 <3b7084d4-e530-9a55-11f4-d67c37f8f5fa@collabora.com>
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

SGkgQW5nZWxvR2lvYWNjaGlubywNCg0KVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uDQpPbiBU
aHUsIDIwMjEtMTAtMTQgYXQgMTI6NTYgKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25v
IHdyb3RlOg0KPiA+IENvcmUgdGhyZWFkOg0KPiA+IDEuIEdldHMgbGF0X2J1ZiBmcm9tIGNvcmUg
bXNnIHF1ZXVlLg0KPiA+IDIuIFByb2NlZWRzIGNvcmUgZGVjb2RlLg0KPiA+IDMuIFB1dHMgdGhl
IGxhdF9idWYgYmFjayB0byBsYXQgbXNnIHF1ZXVlLg0KPiA+IA0KPiA+IEJvdGggSDI2NCBhbmQg
VlA5IHJlbHkgb24gdGhlIGNvcmUgdGhyZWFkLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1
bmZlaSBEb25nIDx5dW5mZWkuZG9uZ0BtZWRpYXRlay5jb20+DQo+IA0KPiBJIHdvdWxkIGJlIGhh
cHBpZXIgdG8gc2VlIGEgYmV0dGVyIGNvbW1pdCBtZXNzYWdlLCBmb3IgZXhhbXBsZToNCj4gIklu
dHJvZHVjZSBhIGNvcmUgdGhyZWFkLCByZXNwb25zaWJsZSBmb3IuLi4gZ2V0dGluZyBsYXRfYnVm
IGZyb20gLi4uDQo+IHdoaWNoIHRoZW4gcHJvY2VlZHMgY29yZSBkZWNvZGUgYnkgLi4uIGFuZCBm
aW5hbGx5LCBwdXRzIHRoZSBsYXRfYnVmDQo+IGJhY2sgdG8gdGhlIGxhdCBtZXNzYWdlIHF1ZXVl
Ig0KPiANCj4gPiAtLS0NCj4gPiAgIC4uLi9wbGF0Zm9ybS9tdGstdmNvZGVjL210a192Y29kZWNf
ZGVjX2Rydi5jICB8IDEyICsrKysrKysNCj4gPiAgIC4uLi9wbGF0Zm9ybS9tdGstdmNvZGVjL210
a192Y29kZWNfZHJ2LmggICAgICB8ICA3ICsrKysNCj4gPiAgIC4uLi9wbGF0Zm9ybS9tdGstdmNv
ZGVjL3ZkZWNfbXNnX3F1ZXVlLmMgICAgICB8IDMyDQo+ID4gKysrKysrKysrKysrKysrKysrKw0K
PiA+ICAgLi4uL3BsYXRmb3JtL210ay12Y29kZWMvdmRlY19tc2dfcXVldWUuaCAgICAgIHwgIDYg
KysrKw0KPiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNvZGVj
X2RlY19kcnYuYyANCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtf
dmNvZGVjX2RlY19kcnYuYw0KPiA+IGluZGV4IGUyMWUwYzRiY2Q4Ni4uZGU4M2UzYjgyMWI0IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2RlYy9tdGtfdmNv
ZGVjX2RlY19kcnYuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZjb2Rl
Yy9tdGtfdmNvZGVjX2RlY19kcnYuYw0KPiA+IEBAIC0zNjQsNiArMzY0LDE4IEBAIHN0YXRpYyBp
bnQgbXRrX3Zjb2RlY19wcm9iZShzdHJ1Y3QNCj4gPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+
ID4gICAJCWdvdG8gZXJyX2RlY19wbTsNCj4gPiAgIAl9DQo+ID4gICANCj4gPiArCWlmIChWREVD
X0xBVF9BUkNIKGRldi0+dmRlY19wZGF0YS0+aHdfYXJjaCkpIHsNCj4gPiArCQl2ZGVjX21zZ19x
dWV1ZV9pbml0X2N0eCgmZGV2LT5tc2dfcXVldWVfY29yZV9jdHgsDQo+ID4gKwkJCU1US19WREVD
X0NPUkUpOw0KPiANCj4gTm8gbmVlZCB0byBicmVhayB0aGlzIGxpbmUuDQo+IA0KRml4IGluIHY4
Lg0KPiA+ICsJCWRldi0+a3RocmVhZF9jb3JlID0NCj4gPiBrdGhyZWFkX3J1bih2ZGVjX21zZ19x
dWV1ZV9jb3JlX3RoZWFkLCBkZXYsDQo+ID4gKwkJCSJtdGstJXMiLCAiY29yZSIpOw0KPiANCj4g
UGxlYXNlIGZpeCBpbmRlbnRhdGlvbiwgbGlrZSBzbzoNCj4gCQlkZXYtPmt0aHJlYWRfY29yZSA9
DQo+IGt0aHJlYWRfcnVuKHZkZWNfbXNnX3F1ZXVlX2NvcmVfdGhlYWQsIGRldiwNCj4gDQo+IAkJ
CQkJCSJtdGstJXMiLCAiY29yZSIpOw0KPiANCj4gPiArCQlpZiAoSVNfRVJSKGRldi0+a3RocmVh
ZF9jb3JlKSkgew0KPiA+ICsJCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJGYWlsZWQgdG8gY3JlYXRl
IGNvcmUNCj4gPiB0aHJlYWQiKTsNCj4gPiArCQkJcmV0ID0gUFRSX0VSUihkZXYtPmt0aHJlYWRf
Y29yZSk7DQo+ID4gKwkJCWdvdG8gZXJyX3JlczsNCj4gPiArCQl9DQo+ID4gKwl9DQo+ID4gKw0K
PiA+ICAgCWZvciAoaSA9IDA7IGkgPCBNVEtfVkRFQ19IV19NQVg7IGkrKykNCj4gPiAgIAkJbXV0
ZXhfaW5pdCgmZGV2LT5kZWNfbXV0ZXhbaV0pOw0KPiA+ICAgCXNwaW5fbG9ja19pbml0KCZkZXYt
PmlycWxvY2spOw0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12
Y29kZWMvbXRrX3Zjb2RlY19kcnYuaA0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGst
dmNvZGVjL210a192Y29kZWNfZHJ2LmgNCj4gPiBpbmRleCA5ZDA3MmMwODJmNzMuLjY4YTliMWEy
ZDNiMyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29kZWMv
bXRrX3Zjb2RlY19kcnYuaA0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZj
b2RlYy9tdGtfdmNvZGVjX2Rydi5oDQo+ID4gQEAgLTI3LDYgKzI3LDcgQEANCj4gPiAgICNkZWZp
bmUgTVRLX1ZDT0RFQ19NQVhfUExBTkVTCTMNCj4gPiAgICNkZWZpbmUgTVRLX1Y0TDJfQkVOQ0hN
QVJLCTANCj4gPiAgICNkZWZpbmUgV0FJVF9JTlRSX1RJTUVPVVRfTVMJMTAwMA0KPiA+ICsjZGVm
aW5lIFZERUNfTEFUX0FSQ0goaHdfYXJjaCkgKChod19hcmNoKSA+PQ0KPiA+IE1US19WREVDX0xB
VF9TSU5HTEVfQ09SRSkNCj4gDQo+IEknZCBwcm9wb3NlIHRvIGNoYW5nZSB0aGlzIHRvIElTX1ZE
RUNfTEFUX0FSQ0goaHdfYXJjaCk6IHRoYXQgd291bGQNCj4gaW5jcmVhc2UgaHVtYW4NCj4gcmVh
ZGFiaWxpdHkgd2hlbiB1c2luZyB0aGlzIG1hY3JvLg0KPiANCkZpeCBpbiB2OC4NCj4gPiAgIA0K
PiA+ICAgLyoNCj4gPiAgICAqIGVudW0gbXRrX2h3X3JlZ19pZHggLSBNVEsgaHcgcmVnaXN0ZXIg
YmFzZSBpbmRleA0KPiA+IEBAIC00NjYsNiArNDY3LDkgQEAgc3RydWN0IG10a192Y29kZWNfZW5j
X3BkYXRhIHsNCj4gPiAgICAqIEBjb21wX2RldjogY29tcG9uZW50IGhhcmR3YXJlIGRldmljZQ0K
PiA+ICAgICogQGNvbXBvbmVudF9ub2RlOiBjb21wb25lbnQgbm9kZQ0KPiA+ICAgICoNCj4gPiAr
ICogQGt0aHJlYWRfY29yZTogdGhyZWFkIHVzZWQgZm9yIGNvcmUgaGFyZHdhcmUgZGVjb2RlDQo+
ID4gKyAqIEBtc2dfcXVldWVfY29yZV9jdHg6IG1zZyBxdWV1ZSBjb250ZXh0IHVzZWQgZm9yIGNv
cmUgdGhyZWFkDQo+ID4gKyAqDQo+ID4gICAgKiBAaGFyZHdhcmVfYml0bWFwOiB1c2VkIHRvIHJl
Y29yZCBoYXJkd2FyZSBpcyByZWFkeSBvciBub3QNCj4gPiAgICAqLw0KPiA+ICAgc3RydWN0IG10
a192Y29kZWNfZGV2IHsNCj4gPiBAQCAtNTA4LDYgKzUxMiw5IEBAIHN0cnVjdCBtdGtfdmNvZGVj
X2RldiB7DQo+ID4gICAJdm9pZCAqY29tcF9kZXZbTVRLX1ZERUNfSFdfTUFYXTsNCj4gPiAgIAlz
dHJ1Y3QgZGV2aWNlX25vZGUgKmNvbXBvbmVudF9ub2RlW01US19WREVDX0hXX01BWF07DQo+ID4g
ICANCj4gPiArCXN0cnVjdCB0YXNrX3N0cnVjdCAqa3RocmVhZF9jb3JlOw0KPiA+ICsJc3RydWN0
IHZkZWNfbXNnX3F1ZXVlX2N0eCBtc2dfcXVldWVfY29yZV9jdHg7DQo+ID4gKw0KPiA+ICAgCURF
Q0xBUkVfQklUTUFQKGhhcmR3YXJlX2JpdG1hcCwgTVRLX1ZERUNfSFdfTUFYKTsNCj4gPiAgIH07
DQo+ID4gICANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNv
ZGVjL3ZkZWNfbXNnX3F1ZXVlLmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLXZj
b2RlYy92ZGVjX21zZ19xdWV1ZS5jDQo+ID4gaW5kZXggZDY2ZWQ5OGM3OWE5Li42NjVmNTcxZWFi
NGIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstdmNvZGVjL3Zk
ZWNfbXNnX3F1ZXVlLmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay12Y29k
ZWMvdmRlY19tc2dfcXVldWUuYw0KPiA+IEBAIC0yNTYsMyArMjU2LDM1IEBAIHZvaWQgdmRlY19t
c2dfcXVldWVfZGVpbml0KA0KPiA+ICAgCQkJa2ZyZWUobGF0X2J1Zi0+cHJpdmF0ZV9kYXRhKTsN
Cj4gPiAgIAl9DQo+ID4gICB9DQo+ID4gKw0KPiA+ICtpbnQgdmRlY19tc2dfcXVldWVfY29yZV90
aGVhZCh2b2lkICpkYXRhKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgbXRrX3Zjb2RlY19kZXYgKmRl
diA9IGRhdGE7DQo+ID4gKwlzdHJ1Y3QgdmRlY19sYXRfYnVmICpsYXRfYnVmOw0KPiA+ICsJc3Ry
dWN0IG10a192Y29kZWNfY3R4ICpjdHg7DQo+ID4gKw0KPiA+ICsJc2V0X2ZyZWV6YWJsZSgpOw0K
PiA+ICsJZm9yICg7Oykgew0KPiA+ICsJCXRyeV90b19mcmVlemUoKTsNCj4gPiArCQlpZiAoa3Ro
cmVhZF9zaG91bGRfc3RvcCgpKQ0KPiA+ICsJCQlicmVhazsNCj4gPiArDQo+ID4gKwkJbGF0X2J1
ZiA9IHZkZWNfbXNnX3F1ZXVlX2RxYnVmKCZkZXYtDQo+ID4gPm1zZ19xdWV1ZV9jb3JlX2N0eCk7
DQo+ID4gKwkJaWYgKCFsYXRfYnVmKQ0KPiA+ICsJCQljb250aW51ZTsNCj4gPiArDQo+ID4gKwkJ
Y3R4ID0gbGF0X2J1Zi0+Y3R4Ow0KPiA+ICsJCW10a192Y29kZWNfc2V0X2N1cnJfY3R4KGRldiwg
Y3R4LCBNVEtfVkRFQ19DT1JFKTsNCj4gPiArDQo+ID4gKwkJaWYgKCFsYXRfYnVmLT5jb3JlX2Rl
Y29kZSkNCj4gPiArCQkJbXRrX3Y0bDJfZXJyKCJDb3JlIGRlY29kZSBjYWxsYmFjayBmdW5jIGlz
DQo+ID4gTlVMTCIpOw0KPiANCj4gSXMgdGhpcyBzdXBwb3NlZCB0byByZWFsbHkgaGFwcGVuPw0K
PiBJIHNlZSB0aGF0IHRoaXMgaXMgYWx3YXlzIGluaXRpYWxpemVkIGluIGZ1bmN0aW9uDQo+IHZk
ZWNfbXNnX3F1ZXVlX2luaXQoKS4NCkZpeCBpbiB2OCwgdXNpbmcgd29yayBxdWV1ZSBpbnN0ZWFk
IG9mIGNyZWF0ZSB0aHJlYWQuDQoNClRoYW5rcw0KWXVuZmVpIERvbmcNCj4gDQo+IFJlZ2FyZHMs
DQo+IC0gQW5nZWxvDQo+IA0KPiANCg==


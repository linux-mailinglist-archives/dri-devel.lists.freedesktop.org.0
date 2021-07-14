Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BA93C9AC8
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 10:44:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD0789B48;
	Thu, 15 Jul 2021 08:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1CDC86E216
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 11:22:25 +0000 (UTC)
X-UUID: 37b55c57c3454cd8b103485dbf769f8b-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Q6LzrYoLA5I8zE2H4Wb3+h6SVEZjseCiEm0eHzHqVVY=; 
 b=Y1vmKf1JjW7fRct618pV5oa5Z4kb7hgjD2TkcFjjj+p9/1ijs5I3S///bHnVdVC6E+/uh2bQgRjZwz9zBBWjc1A0gdm55I+yH1AmUv0OD9WlpoMtFWZcXajNzBTq+rTYerQnF/NKoW7HZIHuWMiF6mOIwa7HpXBtE7zudMjUugo=;
X-UUID: 37b55c57c3454cd8b103485dbf769f8b-20210714
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1517682039; Wed, 14 Jul 2021 19:17:19 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 14 Jul 2021 19:17:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Jul 2021 19:17:13 +0800
Message-ID: <1626261434.14352.14.camel@mhfsdcap03>
Subject: Re: [PATCH v6 06/11] drm/mediatek: Add pm runtime support for ovl
 and rdma
From: Yong Wu <yong.wu@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Date: Wed, 14 Jul 2021 19:17:14 +0800
In-Reply-To: <61aa5aa9-5bd2-e99c-02ef-f5d13526eb43@collabora.com>
References: <20210714025626.5528-1-yong.wu@mediatek.com>
 <20210714025626.5528-7-yong.wu@mediatek.com>
 <61aa5aa9-5bd2-e99c-02ef-f5d13526eb43@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 71B93BC55DBF796D54EF11802D7AD481B3722F9B783DF86A1B40DE94AAC8E5FC2000:8
X-MTK: N
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Thu, 15 Jul 2021 08:44:52 +0000
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
Cc: Xia Jiang <xia.jiang@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, Will
 Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Joerg Roedel <joro@8bytes.org>, Evan Green <evgreen@chromium.org>, Eizan
 Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 yongqiang.niu@mediatek.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>,
 yi.kuo@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com, Mauro
 Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org,
 anan.sun@mediatek.com, acourbot@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIxLTA3LTE0IGF0IDEwOjQ0ICswMjAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3Rl
Og0KPiANCj4gT24gMTQuMDcuMjEgMDQ6NTYsIFlvbmcgV3Ugd3JvdGU6DQo+ID4gRnJvbTogWW9u
Z3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+DQo+ID4gDQo+ID4gUHJlcGFy
ZSBmb3Igc21pIGNsZWFuaW5nIHVwICJtZWRpYXRlayxsYXJiIi4NCj4gPiANCj4gPiBEaXNwbGF5
IHVzZSB0aGUgZGlzcHN5cyBkZXZpY2UgdG8gY2FsbCBwbV9ydW10aW1lX2dldF9zeW5jIGJlZm9y
ZS4NCj4gPiBUaGlzIHBhdGNoIGFkZCBwbV9ydW50aW1lX3h4IHdpdGggb3ZsIGFuZCByZG1hIGRl
dmljZSB3aG9zZSBub2RlcyBoYXMNCj4gPiAiaW9tbXVzIiBwcm9wZXJ0eSwgdGhlbiBkaXNwbGF5
IGNvdWxkIGhlbHAgcG1fcnVudGltZV9nZXQgZm9yIHNtaSB2aWENCj4gPiBvdmwgb3IgcmRtYSBk
ZXZpY2UuDQo+ID4gDQo+ID4gQ0M6IENLIEh1IDxjay5odUBtZWRpYXRlay5jb20+DQo+ID4gU2ln
bmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+DQo+
ID4gU2lnbmVkLW9mZi1ieTogWW9uZyBXdSA8eW9uZy53dUBtZWRpYXRlay5jb20+DQo+ID4gKFlv
bmc6IFVzZSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0IGluc3RlYWQgb2YgcG1fcnVudGltZV9n
ZXRfc3luYykNCj4gPiBBY2tlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5l
bC5vcmc+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bf
b3ZsLmMgIHwgIDkgKysrKysrKystDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2Rpc3BfcmRtYS5jIHwgIDkgKysrKysrKystDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9jcnRjLmMgIHwgMTIgKysrKysrKysrKystDQo+ID4gICAzIGZpbGVzIGNoYW5n
ZWQsIDI3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZGlzcF9vdmwuYw0KPiA+IGluZGV4IGZhOWQ3OTk2M2NkMy4uZWE1
NzYwZjg1NmVjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZGlzcF9vdmwuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9v
dmwuYw0KPiA+IEBAIC0xMSw2ICsxMSw3IEBADQo+ID4gICAjaW5jbHVkZSA8bGludXgvb2ZfZGV2
aWNlLmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+DQo+ID4gICAjaW5jbHVkZSA8
bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9wbV9ydW50aW1l
Lmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvc29jL21lZGlhdGVrL210ay1jbWRxLmg+DQo+ID4g
ICANCj4gPiAgICNpbmNsdWRlICJtdGtfZGlzcF9kcnYuaCINCj4gPiBAQCAtNDE0LDE1ICs0MTUs
MjEgQEAgc3RhdGljIGludCBtdGtfZGlzcF9vdmxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikNCj4gPiAgIAkJcmV0dXJuIHJldDsNCj4gPiAgIAl9DQo+ID4gICANCj4gPiArCXBt
X3J1bnRpbWVfZW5hYmxlKGRldik7DQo+ID4gKw0KPiA+ICAgCXJldCA9IGNvbXBvbmVudF9hZGQo
ZGV2LCAmbXRrX2Rpc3Bfb3ZsX2NvbXBvbmVudF9vcHMpOw0KPiA+IC0JaWYgKHJldCkNCj4gPiAr
CWlmIChyZXQpIHsNCj4gPiArCQlwbV9ydW50aW1lX2Rpc2FibGUoZGV2KTsNCj4gPiAgIAkJZGV2
X2VycihkZXYsICJGYWlsZWQgdG8gYWRkIGNvbXBvbmVudDogJWRcbiIsIHJldCk7DQo+ID4gKwl9
DQo+ID4gICANCj4gPiAgIAlyZXR1cm4gcmV0Ow0KPiA+ICAgfQ0KPiA+ICAgDQo+ID4gICBzdGF0
aWMgaW50IG10a19kaXNwX292bF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4gPiAgIHsNCj4gPiArCXBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsNCj4gPiArDQo+
ID4gICAJcmV0dXJuIDA7DQo+ID4gICB9DQo+ID4gICANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZGlzcF9yZG1hLmMNCj4gPiBpbmRleCA3MDVmMjhjZWI0ZGQuLjBmMzFkMWM4ZTM3
YyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRt
YS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYw0K
PiA+IEBAIC05LDYgKzksNyBAQA0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPg0K
PiA+ICAgI2luY2x1ZGUgPGxpbnV4L29mX2lycS5oPg0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3Bs
YXRmb3JtX2RldmljZS5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPiA+
ICAgI2luY2x1ZGUgPGxpbnV4L3NvYy9tZWRpYXRlay9tdGstY21kcS5oPg0KPiA+ICAgDQo+ID4g
ICAjaW5jbHVkZSAibXRrX2Rpc3BfZHJ2LmgiDQo+ID4gQEAgLTMyNyw5ICszMjgsMTMgQEAgc3Rh
dGljIGludCBtdGtfZGlzcF9yZG1hX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
DQo+ID4gICANCj4gPiAgIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwcml2KTsNCj4gPiAg
IA0KPiA+ICsJcG1fcnVudGltZV9lbmFibGUoZGV2KTsNCj4gPiArDQo+ID4gICAJcmV0ID0gY29t
cG9uZW50X2FkZChkZXYsICZtdGtfZGlzcF9yZG1hX2NvbXBvbmVudF9vcHMpOw0KPiA+IC0JaWYg
KHJldCkNCj4gPiArCWlmIChyZXQpIHsNCj4gPiArCQlwbV9ydW50aW1lX2Rpc2FibGUoZGV2KTsN
Cj4gPiAgIAkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gYWRkIGNvbXBvbmVudDogJWRcbiIsIHJl
dCk7DQo+ID4gKwl9DQo+ID4gICANCj4gPiAgIAlyZXR1cm4gcmV0Ow0KPiA+ICAgfQ0KPiA+IEBA
IC0zMzgsNiArMzQzLDggQEAgc3RhdGljIGludCBtdGtfZGlzcF9yZG1hX3JlbW92ZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgew0KPiA+ICAgCWNvbXBvbmVudF9kZWwoJnBk
ZXYtPmRldiwgJm10a19kaXNwX3JkbWFfY29tcG9uZW50X29wcyk7DQo+ID4gICANCj4gPiArCXBt
X3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2KTsNCj4gPiArDQo+ID4gICAJcmV0dXJuIDA7DQo+
ID4gICB9DQo+ID4gICANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5j
DQo+ID4gaW5kZXggNDc0ZWZiODQ0MjQ5Li4wOGUzZjM1MjM3N2QgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQo+ID4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fY3J0Yy5jDQo+ID4gQEAgLTU1Nyw5ICs1NTcsMTUg
QEAgc3RhdGljIHZvaWQgbXRrX2RybV9jcnRjX2F0b21pY19lbmFibGUoc3RydWN0IGRybV9jcnRj
ICpjcnRjLA0KPiA+ICAgCQlyZXR1cm47DQo+ID4gICAJfQ0KPiA+ICAgDQo+ID4gKwlyZXQgPSBw
bV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGNvbXAtPmRldik7DQo+ID4gKwlpZiAocmV0IDwgMCkN
Cj4gPiArCQlEUk1fREVWX0VSUk9SKGNvbXAtPmRldiwgIkZhaWxlZCB0byBlbmFibGUgcG93ZXIg
ZG9tYWluOiAlZFxuIiwNCj4gPiArCQkJICAgICAgcmV0KTsNCj4gDQo+IHNob3VsZG4ndCB0aGUg
Y29kZSByZXR1cm4gaW4gY2FzZSBvZiBmYWlsdXJlIGhlcmU/DQoNCkFmdGVyIGNvbmZpcm0gd2l0
aCB5b25ncWlhbmcsIFdlIHdpbGwgZml4IHRoaXMgaW4gbmV4dCB2ZXJzaW9uLg0KDQpUaGFua3Mu
DQoNCj4gDQo+IFRoYW5rcywNCj4gRGFmbmENCj4gDQo+ID4gKw0KPiA+ICAgCXJldCA9IG10a19j
cnRjX2RkcF9od19pbml0KG10a19jcnRjKTsNCj4gPiAgIAlpZiAocmV0KSB7DQo+ID4gICAJCW10
a19zbWlfbGFyYl9wdXQoY29tcC0+bGFyYl9kZXYpOw0KPiA+ICsJCXBtX3J1bnRpbWVfcHV0KGNv
bXAtPmRldik7DQo+ID4gICAJCXJldHVybjsNCj4gPiAgIAl9DQo+ID4gICANCj4gPiBAQCAtNTcy
LDcgKzU3OCw3IEBAIHN0YXRpYyB2b2lkIG10a19kcm1fY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1
Y3QgZHJtX2NydGMgKmNydGMsDQo+ID4gICB7DQo+ID4gICAJc3RydWN0IG10a19kcm1fY3J0YyAq
bXRrX2NydGMgPSB0b19tdGtfY3J0YyhjcnRjKTsNCj4gPiAgIAlzdHJ1Y3QgbXRrX2RkcF9jb21w
ICpjb21wID0gbXRrX2NydGMtPmRkcF9jb21wWzBdOw0KPiA+IC0JaW50IGk7DQo+ID4gKwlpbnQg
aSwgcmV0Ow0KPiA+ICAgDQo+ID4gICAJRFJNX0RFQlVHX0RSSVZFUigiJXMgJWRcbiIsIF9fZnVu
Y19fLCBjcnRjLT5iYXNlLmlkKTsNCj4gPiAgIAlpZiAoIW10a19jcnRjLT5lbmFibGVkKQ0KPiA+
IEBAIC01OTYsNiArNjAyLDEwIEBAIHN0YXRpYyB2b2lkIG10a19kcm1fY3J0Y19hdG9taWNfZGlz
YWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsDQo+ID4gICAJZHJtX2NydGNfdmJsYW5rX29mZihj
cnRjKTsNCj4gPiAgIAltdGtfY3J0Y19kZHBfaHdfZmluaShtdGtfY3J0Yyk7DQo+ID4gICAJbXRr
X3NtaV9sYXJiX3B1dChjb21wLT5sYXJiX2Rldik7DQo+ID4gKwlyZXQgPSBwbV9ydW50aW1lX3B1
dChjb21wLT5kZXYpOw0KPiA+ICsJaWYgKHJldCA8IDApDQo+ID4gKwkJRFJNX0RFVl9FUlJPUihj
b21wLT5kZXYsICJGYWlsZWQgdG8gZGlzYWJsZSBwb3dlciBkb21haW46ICVkXG4iLA0KPiA+ICsJ
CQkgICAgICByZXQpOw0KPiA+ICAgDQo+ID4gICAJbXRrX2NydGMtPmVuYWJsZWQgPSBmYWxzZTsN
Cj4gPiAgIH0NCj4gPiANCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fDQo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdA0KPiBMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnDQo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsNCg0K


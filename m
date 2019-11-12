Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4147BF94C7
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 16:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7952D6EB6D;
	Tue, 12 Nov 2019 15:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 985 seconds by postgrey-1.36 at gabe;
 Tue, 12 Nov 2019 15:53:55 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957856EB67
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 15:53:55 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xACFRtdl018129; Tue, 12 Nov 2019 16:37:20 +0100
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2w7psf2yec-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 16:37:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F1EDF10003A;
 Tue, 12 Nov 2019 16:37:17 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B65FD2FF5E8;
 Tue, 12 Nov 2019 16:37:17 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 12 Nov
 2019 16:37:17 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 12 Nov 2019 16:37:17 +0100
From: Philippe CORNU <philippe.cornu@st.com>
To: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>
Subject: Re: [PATCH v2 1/5] drm/bridge/synopsys: dsi: move phy_ops callbacks
 around panel enablement
Thread-Topic: [PATCH v2 1/5] drm/bridge/synopsys: dsi: move phy_ops callbacks
 around panel enablement
Thread-Index: AQHVlcfsJMoaERwdz0+0Ar27W0nWUqeHocsA
Date: Tue, 12 Nov 2019 15:37:17 +0000
Message-ID: <49f6386b-30c8-a181-5785-2ecdf5f95d2a@st.com>
References: <20191108000253.8560-1-heiko.stuebner@theobroma-systems.com>
 <20191108000253.8560-2-heiko.stuebner@theobroma-systems.com>
In-Reply-To: <20191108000253.8560-2-heiko.stuebner@theobroma-systems.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <9B4E026D2A0B2A4BAC8B6BBE5F14BEA6@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-12_05:2019-11-11,2019-11-12 signatures=0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=st.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=kaFjGOKCQM/FJHZr1FNHSIjQAeAuSTc0Kd4hNmaNfVo=;
 b=n8SC89Aj8wVgWFJsfYhHOiepQeSYjmLEK89tFRAgoBYBq2LXLSMu+dphIY9qkNyO3HwR
 TEbbeGtEfU+/qBQYbpi4VxFId5zQc8aVKiOR4GFAmLvLEK0yg39DISmoiTiukgsZkXbQ
 XE+nQyzUmTmm2h8E8D6qK+CDxisKR623e8Ilh13z+WO6THp2CoBj5j6dom5jkynW/RDh
 440JJGOAEVN+GFSvyQZ/4cy4zPYZgVG2vnq3qlwwH2dkRXzpbJfoUSWSsUN7sbOO00GC
 axxB9X8uP7ltkSsthF7eev0aMrHSn8W+DohV4ziL87Co4yEqpMnGSLm0OPTCS78Rrnr8 JQ== 
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "christoph.muellner@theobroma-systems.com"
 <christoph.muellner@theobroma-systems.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGVpa28sDQoNCk9uIDExLzgvMTkgMTowMiBBTSwgSGVpa28gU3R1ZWJuZXIgd3JvdGU6DQo+
IElmIGltcGxlbWVudGF0aW9uLXNwZWNpZmljIHBoeV9vcHMgbmVlZCB0byBiZSBkZWZpbmVkIHRo
ZXkgcHJvYmFibHkNCj4gc2hvdWxkIGJlIGVuYWJsZWQgYmVmb3JlIHRyeWluZyB0byB0YWxrIHRv
IHRoZSBwYW5lbCBhbmQgZGlzYWJsZWQgb25seQ0KPiBhZnRlciB0aGUgcGFuZWwgd2FzIGRpc2Fi
bGVkLg0KPiANCj4gUmlnaHQgbm93IHRoZXkgYXJlIGVuYWJsZWQgbGFzdCBhbmQgZGlzYWJsZWQg
Zmlyc3QsIHNvIG1pZ2h0IG1ha2UgaXQNCj4gaW1wb3NzaWJsZSB0byB0YWxrIHRvIHNvbWUgcGFu
ZWxzIC0gZXhhbXBsZSBmb3IgdGhpcyBiZWluZyB0aGUgcHgzMA0KPiB3aXRoIGFuIGV4dGVybmFs
IElubm9zaWxpY29uIGRwaHkgdGhhdCBuZWVkcyB0aGUgcGh5IHRvIGJlIGVuYWJsZWQNCj4gdG8g
dHJhbnNmZXIgY29tbWFuZHMgdG8gdGhlIHBhbmVsLg0KPiANCj4gU28gbW92ZSB0aGUgY2FsbHMg
YXBwcm9wcmlhdGVseS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlr
by5zdHVlYm5lckB0aGVvYnJvbWEtc3lzdGVtcy5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYyB8IDEzICsrKysrKy0tLS0tLS0NCj4g
ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2ku
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYw0KPiBpbmRl
eCA2NzU0NDJiZmMxYmQuLjQ5ZjU2MDBhMWRlYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc3lub3BzeXMvZHctbWlwaS1kc2kuYw0KPiBAQCAtNzk3LDkgKzc5Nyw2IEBAIHN0
YXRpYyB2b2lkIGR3X21pcGlfZHNpX2JyaWRnZV9wb3N0X2Rpc2FibGUoc3RydWN0IGRybV9icmlk
Z2UgKmJyaWRnZSkNCj4gICAJc3RydWN0IGR3X21pcGlfZHNpICpkc2kgPSBicmlkZ2VfdG9fZHNp
KGJyaWRnZSk7DQo+ICAgCWNvbnN0IHN0cnVjdCBkd19taXBpX2RzaV9waHlfb3BzICpwaHlfb3Bz
ID0gZHNpLT5wbGF0X2RhdGEtPnBoeV9vcHM7DQo+ICAgDQo+IC0JaWYgKHBoeV9vcHMtPnBvd2Vy
X29mZikNCj4gLQkJcGh5X29wcy0+cG93ZXJfb2ZmKGRzaS0+cGxhdF9kYXRhLT5wcml2X2RhdGEp
Ow0KPiAtDQo+ICAgCS8qDQo+ICAgCSAqIFN3aXRjaCB0byBjb21tYW5kIG1vZGUgYmVmb3JlIHBh
bmVsLWJyaWRnZSBwb3N0X2Rpc2FibGUgJg0KPiAgIAkgKiBwYW5lbCB1bnByZXBhcmUuDQo+IEBA
IC04MTYsNiArODEzLDkgQEAgc3RhdGljIHZvaWQgZHdfbWlwaV9kc2lfYnJpZGdlX3Bvc3RfZGlz
YWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQ0KPiAgIAkgKi8NCj4gICAJZHNpLT5wYW5l
bF9icmlkZ2UtPmZ1bmNzLT5wb3N0X2Rpc2FibGUoZHNpLT5wYW5lbF9icmlkZ2UpOw0KPiAgIA0K
PiArCWlmIChwaHlfb3BzLT5wb3dlcl9vZmYpDQo+ICsJCXBoeV9vcHMtPnBvd2VyX29mZihkc2kt
PnBsYXRfZGF0YS0+cHJpdl9kYXRhKTsNCj4gKw0KPiAgIAlpZiAoZHNpLT5zbGF2ZSkgew0KPiAg
IAkJZHdfbWlwaV9kc2lfZGlzYWJsZShkc2ktPnNsYXZlKTsNCj4gICAJCWNsa19kaXNhYmxlX3Vu
cHJlcGFyZShkc2ktPnNsYXZlLT5wY2xrKTsNCj4gQEAgLTg4Miw2ICs4ODIsOSBAQCBzdGF0aWMg
dm9pZCBkd19taXBpX2RzaV9tb2RlX3NldChzdHJ1Y3QgZHdfbWlwaV9kc2kgKmRzaSwNCj4gICAN
Cj4gICAJLyogU3dpdGNoIHRvIGNtZCBtb2RlIGZvciBwYW5lbC1icmlkZ2UgcHJlX2VuYWJsZSAm
IHBhbmVsIHByZXBhcmUgKi8NCj4gICAJZHdfbWlwaV9kc2lfc2V0X21vZGUoZHNpLCAwKTsNCj4g
Kw0KPiArCWlmIChwaHlfb3BzLT5wb3dlcl9vbikNCj4gKwkJcGh5X29wcy0+cG93ZXJfb24oZHNp
LT5wbGF0X2RhdGEtPnByaXZfZGF0YSk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkIGR3
X21pcGlfZHNpX2JyaWRnZV9tb2RlX3NldChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0KPiBA
QCAtODk4LDE1ICs5MDEsMTEgQEAgc3RhdGljIHZvaWQgZHdfbWlwaV9kc2lfYnJpZGdlX21vZGVf
c2V0KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsDQo+ICAgc3RhdGljIHZvaWQgZHdfbWlwaV9k
c2lfYnJpZGdlX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQ0KPiAgIHsNCj4gICAJ
c3RydWN0IGR3X21pcGlfZHNpICpkc2kgPSBicmlkZ2VfdG9fZHNpKGJyaWRnZSk7DQo+IC0JY29u
c3Qgc3RydWN0IGR3X21pcGlfZHNpX3BoeV9vcHMgKnBoeV9vcHMgPSBkc2ktPnBsYXRfZGF0YS0+
cGh5X29wczsNCj4gICANCj4gICAJLyogU3dpdGNoIHRvIHZpZGVvIG1vZGUgZm9yIHBhbmVsLWJy
aWRnZSBlbmFibGUgJiBwYW5lbCBlbmFibGUgKi8NCj4gICAJZHdfbWlwaV9kc2lfc2V0X21vZGUo
ZHNpLCBNSVBJX0RTSV9NT0RFX1ZJREVPKTsNCj4gICAJaWYgKGRzaS0+c2xhdmUpDQo+ICAgCQlk
d19taXBpX2RzaV9zZXRfbW9kZShkc2ktPnNsYXZlLCBNSVBJX0RTSV9NT0RFX1ZJREVPKTsNCj4g
LQ0KPiAtCWlmIChwaHlfb3BzLT5wb3dlcl9vbikNCj4gLQkJcGh5X29wcy0+cG93ZXJfb24oZHNp
LT5wbGF0X2RhdGEtPnByaXZfZGF0YSk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyBlbnVtIGRy
bV9tb2RlX3N0YXR1cw0KPiANCg0KVGVzdGVkLWJ5OiBZYW5uaWNrIEZlcnRyZSA8eWFubmljay5m
ZXJ0cmVAc3QuY29tPg0KUmV2aWV3ZWQtYnk6IFBoaWxpcHBlIENvcm51IDxwaGlsaXBwZS5jb3Ju
dUBzdC5jb20+DQoNCk1hbnkgdGhhbmtzLA0KUGhpbGlwcGUgOi0pCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

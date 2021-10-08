Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343C6426227
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 03:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402646E06D;
	Fri,  8 Oct 2021 01:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4076E06D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 01:49:38 +0000 (UTC)
X-UUID: 6f2a6e591c5e4d4bad62c6adc1bee568-20211008
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RXg5SyzGWaODYUYPctmtd3WXwSdZOkNg8UWT/TCg6JQ=; 
 b=S2hm3VaZ5iQxaI++FjAJ886APA9nu1IRGmWO+Ap5uyk+yznTe+Z37RVA5T3xGpdzRizMrmKyCdzBDfSZHy/zSDigh7OsQhWFqOUwdCO+mWynSAYcRfwnPwPOPTQL/C4P88E2E4+6c30ffCIa4eLQZF9yfwmDRkwmy8srm4KG9N0=;
X-UUID: 6f2a6e591c5e4d4bad62c6adc1bee568-20211008
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yongqiang.niu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1632394636; Fri, 08 Oct 2021 09:49:34 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Oct 2021 09:49:33 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 8 Oct 2021 09:49:33 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Oct 2021 09:49:32 +0800
Message-ID: <ffe2d4aaf4f884c4de2d2a157d08087cef3e6a0f.camel@mediatek.com>
Subject: Re: [PATCH v2, 1/1] mailbox: cmdq: add instruction time-out
 interrupt support
From: yongqiang.niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Fabien Parent <fparent@baylibre.com>, "Dennis YC
 Hsieh" <dennis-yc.hsieh@mediatek.com>, DTML <devicetree@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, DRI Development
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>
Date: Fri, 8 Oct 2021 09:49:35 +0800
In-Reply-To: <CAAOTY_82OaLAz0o6BUcogQ=xgYTsFJSov=J72UzMwwq3YtkPdg@mail.gmail.com>
References: <20210930131850.21202-1-yongqiang.niu@mediatek.com>
 <20210930131850.21202-2-yongqiang.niu@mediatek.com>
 <CAAOTY_82OaLAz0o6BUcogQ=xgYTsFJSov=J72UzMwwq3YtkPdg@mail.gmail.com>
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

T24gVHVlLCAyMDIxLTEwLTA1IGF0IDA3OjQxICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIx5bm0OeaciDMw5pelIOmAseWbmyDkuIvljYg5OjE45a+r6YGT77ya
DQo+ID4gDQo+ID4gYWRkIHRpbWUtb3V0IGN5Y2xlIHNldHRpbmcgdG8gbWFrZSBzdXJlIHRpbWUt
b3V0IGludGVycnVwdCBpcnENCj4gPiB3aWxsIGhhcHBlbmVkIHdoZW4gaW5zdHJ1Y3Rpb24gdGlt
ZS1vdXQgZm9yIHdhaXQgYW5kIHBvbGwNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlh
bmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVy
cy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYyB8IDExICsrKysrKysrKysrDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWFpbGJveC9tdGstY21kcS1tYWlsYm94LmMNCj4gPiBiL2RyaXZlcnMvbWFpbGJveC9tdGst
Y21kcS1tYWlsYm94LmMNCj4gPiBpbmRleCA2NDE3NWE4OTMzMTIuLjE5N2IwMzIyMmY5NCAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21haWxib3gvbXRrLWNtZHEtbWFpbGJveC5jDQo+ID4gKysr
IGIvZHJpdmVycy9tYWlsYm94L210ay1jbWRxLW1haWxib3guYw0KPiA+IEBAIC0zNiw2ICszNiw3
IEBADQo+ID4gICNkZWZpbmUgQ01EUV9USFJfRU5EX0FERFIgICAgICAgICAgICAgIDB4MjQNCj4g
PiAgI2RlZmluZSBDTURRX1RIUl9XQUlUX1RPS0VOICAgICAgICAgICAgMHgzMA0KPiA+ICAjZGVm
aW5lIENNRFFfVEhSX1BSSU9SSVRZICAgICAgICAgICAgICAweDQwDQo+ID4gKyNkZWZpbmUgQ01E
UV9USFJfSU5TVE5fVElNRU9VVF9DWUNMRVMgIDB4NTANCj4gPiANCj4gPiAgI2RlZmluZSBHQ0Vf
R0NUTF9WQUxVRSAgICAgICAgICAgICAgICAgMHg0OA0KPiA+IA0KPiA+IEBAIC01NCw2ICs1NSwx
NSBAQA0KPiA+ICAjZGVmaW5lIENNRFFfSlVNUF9CWV9PRkZTRVQgICAgICAgICAgICAweDEwMDAw
MDAwDQo+ID4gICNkZWZpbmUgQ01EUV9KVU1QX0JZX1BBICAgICAgICAgICAgICAgICAgICAgICAg
MHgxMDAwMDAwMQ0KPiA+IA0KPiA+ICsvKg0KPiA+ICsgKiBpbnN0cnVjdGlvbiB0aW1lLW91dA0K
PiA+ICsgKiBjeWNsZXMgdG8gaXNzdWUgaW5zdHJ1Y3Rpb24gdGltZS1vdXQgaW50ZXJydXB0IGZv
ciB3YWl0IGFuZA0KPiA+IHBvbGwgaW5zdHJ1Y3Rpb25zDQo+ID4gKyAqIEdDRSBheGlfY2xvY2sg
MTU2TUh6DQo+ID4gKyAqIDEgY3ljbGUgPSA2LjQxbnMNCj4gPiArICogaW5zdHJ1Y3Rpb24gdGlt
ZSBvdXQgMl4yMioyKjYuNDFucyA9IDUzbXMNCj4gDQo+IEZvciBkaWZmZXJlbnQgY2xpZW50cywg
dGhlIHRpbWVvdXQgdmFsdWUgd291bGQgYmUgZGlmZmVyZW50LCBhbmQgZWFjaA0KPiBjbGllbnQg
Y291bGQgdXNlIHRpbWVyIHRvIGRldGVjdCB0aW1lb3V0LCBzbyBpdCdzIG5vdCBuZWNlc3Nhcnkg
dG8NCj4gZW5hYmxlIHRpbWVvdXQgaW4gY21kcSBkcml2ZXIuDQo+IA0KPiBSZWdhcmRzLA0KPiBD
aHVuLUt1YW5nLg0KDQppZiB3ZSBkbyBub3Qgc2V0IGNtZHEgaGFyZHdhcmUgdGltZW91dCwgdGhp
cyBjb25kaXRpb24gd2lsbCBuZXZlcg0KaGFwcGVuDQpjbWRxX3RocmVhZF9pcnFfaGFuZGxlcg0K
aWYgKGlycV9mbGFnICYgQ01EUV9USFJfSVJRX0VSUk9SKQ0KCQllcnIgPSB0cnVlOw0KDQphbmQg
bm8gZXJyb3IgY2FsbGJhY2sgDQplbHNlIGlmIChlcnIpIHsNCgkJCWNtZHFfdGFza19leGVjX2Rv
bmUodGFzaywgLUVOT0VYRUMpOw0KCQkJY21kcV90YXNrX2hhbmRsZV9lcnJvcihjdXJyX3Rhc2sp
Ow0KCQkJa2ZyZWUodGFzayk7DQoJCX0NCnRoZSBjbGllbnQgd2lsbCBuZXZlciByZWNlaXZlZCB0
aGUgZXJyb3IgY2FsbGJhY2ssIGNtZHEgaGFyZHdhcmUgd2lsbA0KcG9sbCB0aGUgZXZlbnQgZm9y
IGV2ZXIgYW5kIG5vIHJlcG9ydCB0aW1lb3V0IA0KPiANCj4gPiArICovDQo+ID4gKyNkZWZpbmUg
Q01EUV9JTlNUTl9USU1FT1VUX0NZQ0xFUyAgICAgIDIyDQo+ID4gKw0KPiA+ICBzdHJ1Y3QgY21k
cV90aHJlYWQgew0KPiA+ICAgICAgICAgc3RydWN0IG1ib3hfY2hhbiAgICAgICAgKmNoYW47DQo+
ID4gICAgICAgICB2b2lkIF9faW9tZW0gICAgICAgICAgICAqYmFzZTsNCj4gPiBAQCAtMzc2LDYg
KzM4Niw3IEBAIHN0YXRpYyBpbnQgY21kcV9tYm94X3NlbmRfZGF0YShzdHJ1Y3QgbWJveF9jaGFu
DQo+ID4gKmNoYW4sIHZvaWQgKmRhdGEpDQo+ID4gICAgICAgICAgICAgICAgIHdyaXRlbCgodGFz
ay0+cGFfYmFzZSArIHBrdC0+Y21kX2J1Zl9zaXplKSA+PiBjbWRxLQ0KPiA+ID5zaGlmdF9wYSwN
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgIHRocmVhZC0+YmFzZSArIENNRFFfVEhSX0VORF9B
RERSKTsNCj4gPiANCj4gPiArICAgICAgICAgICAgICAgd3JpdGVsKENNRFFfSU5TVE5fVElNRU9V
VF9DWUNMRVMsIHRocmVhZC0+YmFzZSArDQo+ID4gQ01EUV9USFJfSU5TVE5fVElNRU9VVF9DWUNM
RVMpOw0KPiA+ICAgICAgICAgICAgICAgICB3cml0ZWwodGhyZWFkLT5wcmlvcml0eSwgdGhyZWFk
LT5iYXNlICsNCj4gPiBDTURRX1RIUl9QUklPUklUWSk7DQo+ID4gICAgICAgICAgICAgICAgIHdy
aXRlbChDTURRX1RIUl9JUlFfRU4sIHRocmVhZC0+YmFzZSArDQo+ID4gQ01EUV9USFJfSVJRX0VO
QUJMRSk7DQo+ID4gICAgICAgICAgICAgICAgIHdyaXRlbChDTURRX1RIUl9FTkFCTEVELCB0aHJl
YWQtPmJhc2UgKw0KPiA+IENNRFFfVEhSX0VOQUJMRV9UQVNLKTsNCj4gPiAtLQ0KPiA+IDIuMjUu
MQ0KPiA+IA0K


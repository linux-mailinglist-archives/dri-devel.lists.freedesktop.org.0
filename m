Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B58823C98C2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 08:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E56A76E52F;
	Thu, 15 Jul 2021 06:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7F9496E52F
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 06:24:14 +0000 (UTC)
X-UUID: 0a5205d548114b71bf449392ac64c6d6-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FdJEfNIhRevGn/F/LNRstNPMVmwpSKWT+XSRG+RptUo=; 
 b=XwcGYvS5eBEW2tM7yKQuXk4RNV6DmpPFDWGENSlPuFnEwQSJXNoRyAOCwMMeYXtRYceq1lpEl36aLbSJSBpnvnuru//JIBbV0w3pt04fCU3tTl5FdEgEkWfDHVNhEtI7E0bEIe2vTgoOK97xYsA1o1YhDZiXATIDr8zLsEFJvy8=;
X-UUID: 0a5205d548114b71bf449392ac64c6d6-20210715
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <guangming.cao@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 149916070; Thu, 15 Jul 2021 14:24:11 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS33N2.mediatek.inc (172.27.4.76) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 14:24:08 +0800
Received: from mszswglt01.gcn.mediatek.inc (10.16.20.20) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 15 Jul 2021 14:24:07 +0800
From: <guangming.cao@mediatek.com>
To: <guangming.cao@mediatek.com>
Subject: [PATCH] dma-heap: Let dma heap use dma_map_attrs to map & unmap iova
Date: Thu, 15 Jul 2021 14:24:05 +0800
Message-ID: <20210715062405.98932-1-guangming.cao@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210708101421.9101-1-guangming.cao@mediatek.com>
References: <20210708101421.9101-1-guangming.cao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: D20BB1BADB131EDFEA63427CEE31F7C3446A8B841868204EDF379FDAF8A9A92E2000:8
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
Cc: Guangming Cao <Guangming.Cao@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, lmark@codeaurora.org,
 benjamin.gaignard@linaro.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, labbott@redhat.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR3VhbmdtaW5nIENhbyA8R3VhbmdtaW5nLkNhb0BtZWRpYXRlay5jb20+DQoNCk9uIFRo
dSwgMjAyMS0wNy0wOCBhdCAxODoxNCArMDgwMCwgZ3VhbmdtaW5nLmNhb0BtZWRpYXRlay5jb20g
d3JvdGU6DQoNCkhpIFN1bWl0LCBDaHJpc3RpYW4sIE1hdHRoaWFzLA0KDQpnZW50bGUgcGluZyBm
b3IgdGhpcyBwYXRjaCA6KQ0KDQpCUnMhDQpHdWFuZ21pbmcNCg0KPiBGcm9tOiBHdWFuZ21pbmcg
Q2FvIDxHdWFuZ21pbmcuQ2FvQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEZvciBkbWEtaGVhcCB1c2Vy
cywgdGhleSBjYW4ndCBieXBhc3MgY2FjaGUgc3luYyB3aGVuIG1hcC91bm1hcCBpb3ZhDQo+IHdp
dGggZG1hIGhlYXAuIEJ1dCB0aGV5IGNhbiBkbyBpdCBieSBhZGRpbmcgRE1BX0FUVFJfU0tJUF9D
UFVfU1lOQw0KPiBpbnRvIGRtYV9hbGxvY19hdHRycy4NCj4gDQo+IFRvIGtlZXAgYWxpZ25tZW50
LCBhdCBkbWFfaGVhcCBzaWRlLCBhbHNvIHVzZQ0KPiBkbWFfYnVmX2F0dGFjaG1lbnQuZG1hX21h
cF9hdHRycyB0byBkbyBpb3ZhIG1hcCAmIHVubWFwLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR3Vh
bmdtaW5nIENhbyA8R3VhbmdtaW5nLkNhb0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMgICAgfCA2ICsrKystLQ0KPiAgZHJpdmVycy9kbWEt
YnVmL2hlYXBzL3N5c3RlbV9oZWFwLmMgfCA2ICsrKystLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9kbWEtYnVmL2hlYXBzL2NtYV9oZWFwLmMgYi9kcml2ZXJzL2RtYS0NCj4gYnVmL2hlYXBzL2Nt
YV9oZWFwLmMNCj4gaW5kZXggMGMwNWI3OTg3MGY5Li4yYzlmZWIzYmZjM2UgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZG1hLWJ1Zi9oZWFwcy9jbWFfaGVhcC5jDQo+ICsrKyBiL2RyaXZlcnMvZG1h
LWJ1Zi9oZWFwcy9jbWFfaGVhcC5jDQo+IEBAIC05OSw5ICs5OSwxMCBAQCBzdGF0aWMgc3RydWN0
IHNnX3RhYmxlDQo+ICpjbWFfaGVhcF9tYXBfZG1hX2J1ZihzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2ht
ZW50ICphdHRhY2htZQ0KPiAgew0KPiAgCXN0cnVjdCBkbWFfaGVhcF9hdHRhY2htZW50ICphID0g
YXR0YWNobWVudC0+cHJpdjsNCj4gIAlzdHJ1Y3Qgc2dfdGFibGUgKnRhYmxlID0gJmEtPnRhYmxl
Ow0KPiArCWludCBhdHRycyA9IGF0dGFjaG1lbnQtPmRtYV9tYXBfYXR0cnM7DQo+ICAJaW50IHJl
dDsNCj4gIA0KPiAtCXJldCA9IGRtYV9tYXBfc2d0YWJsZShhdHRhY2htZW50LT5kZXYsIHRhYmxl
LCBkaXJlY3Rpb24sIDApOw0KPiArCXJldCA9IGRtYV9tYXBfc2d0YWJsZShhdHRhY2htZW50LT5k
ZXYsIHRhYmxlLCBkaXJlY3Rpb24sDQo+IGF0dHJzKTsNCj4gIAlpZiAocmV0KQ0KPiAgCQlyZXR1
cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4gIAlhLT5tYXBwZWQgPSB0cnVlOw0KPiBAQCAtMTEzLDkg
KzExNCwxMCBAQCBzdGF0aWMgdm9pZCBjbWFfaGVhcF91bm1hcF9kbWFfYnVmKHN0cnVjdA0KPiBk
bWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaG1lbnQsDQo+ICAJCQkJICAgZW51bSBkbWFfZGF0YV9k
aXJlY3Rpb24gZGlyZWN0aW9uKQ0KPiAgew0KPiAgCXN0cnVjdCBkbWFfaGVhcF9hdHRhY2htZW50
ICphID0gYXR0YWNobWVudC0+cHJpdjsNCj4gKwlpbnQgYXR0cnMgPSBhdHRhY2htZW50LT5kbWFf
bWFwX2F0dHJzOw0KPiAgDQo+ICAJYS0+bWFwcGVkID0gZmFsc2U7DQo+IC0JZG1hX3VubWFwX3Nn
dGFibGUoYXR0YWNobWVudC0+ZGV2LCB0YWJsZSwgZGlyZWN0aW9uLCAwKTsNCj4gKwlkbWFfdW5t
YXBfc2d0YWJsZShhdHRhY2htZW50LT5kZXYsIHRhYmxlLCBkaXJlY3Rpb24sIGF0dHJzKTsNCj4g
IH0NCj4gIA0KPiAgc3RhdGljIGludCBjbWFfaGVhcF9kbWFfYnVmX2JlZ2luX2NwdV9hY2Nlc3Mo
c3RydWN0IGRtYV9idWYgKmRtYWJ1ZiwNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9o
ZWFwcy9zeXN0ZW1faGVhcC5jIGIvZHJpdmVycy9kbWEtDQo+IGJ1Zi9oZWFwcy9zeXN0ZW1faGVh
cC5jDQo+IGluZGV4IDIzYTdlNzRlZjk2Ni4uZmM3YjFlMDI5ODhlIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2RtYS1idWYvaGVhcHMvc3lzdGVtX2hlYXAuYw0KPiArKysgYi9kcml2ZXJzL2RtYS1i
dWYvaGVhcHMvc3lzdGVtX2hlYXAuYw0KPiBAQCAtMTMwLDkgKzEzMCwxMCBAQCBzdGF0aWMgc3Ry
dWN0IHNnX3RhYmxlDQo+ICpzeXN0ZW1faGVhcF9tYXBfZG1hX2J1ZihzdHJ1Y3QgZG1hX2J1Zl9h
dHRhY2htZW50ICphdHRhYw0KPiAgew0KPiAgCXN0cnVjdCBkbWFfaGVhcF9hdHRhY2htZW50ICph
ID0gYXR0YWNobWVudC0+cHJpdjsNCj4gIAlzdHJ1Y3Qgc2dfdGFibGUgKnRhYmxlID0gYS0+dGFi
bGU7DQo+ICsJaW50IGF0dHJzID0gYXR0YWNobWVudC0+ZG1hX21hcF9hdHRyczsNCj4gIAlpbnQg
cmV0Ow0KPiAgDQo+IC0JcmV0ID0gZG1hX21hcF9zZ3RhYmxlKGF0dGFjaG1lbnQtPmRldiwgdGFi
bGUsIGRpcmVjdGlvbiwgMCk7DQo+ICsJcmV0ID0gZG1hX21hcF9zZ3RhYmxlKGF0dGFjaG1lbnQt
PmRldiwgdGFibGUsIGRpcmVjdGlvbiwNCj4gYXR0cnMpOw0KPiAgCWlmIChyZXQpDQo+ICAJCXJl
dHVybiBFUlJfUFRSKHJldCk7DQo+ICANCj4gQEAgLTE0NSw5ICsxNDYsMTAgQEAgc3RhdGljIHZv
aWQgc3lzdGVtX2hlYXBfdW5tYXBfZG1hX2J1ZihzdHJ1Y3QNCj4gZG1hX2J1Zl9hdHRhY2htZW50
ICphdHRhY2htZW50LA0KPiAgCQkJCSAgICAgIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uDQo+IGRp
cmVjdGlvbikNCj4gIHsNCj4gIAlzdHJ1Y3QgZG1hX2hlYXBfYXR0YWNobWVudCAqYSA9IGF0dGFj
aG1lbnQtPnByaXY7DQo+ICsJaW50IGF0dHJzID0gYXR0YWNobWVudC0+ZG1hX21hcF9hdHRyczsN
Cj4gIA0KPiAgCWEtPm1hcHBlZCA9IGZhbHNlOw0KPiAtCWRtYV91bm1hcF9zZ3RhYmxlKGF0dGFj
aG1lbnQtPmRldiwgdGFibGUsIGRpcmVjdGlvbiwgMCk7DQo+ICsJZG1hX3VubWFwX3NndGFibGUo
YXR0YWNobWVudC0+ZGV2LCB0YWJsZSwgZGlyZWN0aW9uLCBhdHRycyk7DQo+ICB9DQo+ICANCj4g
IHN0YXRpYyBpbnQgc3lzdGVtX2hlYXBfZG1hX2J1Zl9iZWdpbl9jcHVfYWNjZXNzKHN0cnVjdCBk
bWFfYnVmDQo+ICpkbWFidWYsDQo+IC0tIA0KPiAyLjE3LjENCj4g


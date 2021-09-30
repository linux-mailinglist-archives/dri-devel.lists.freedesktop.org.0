Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6771E41D44A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 09:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931176E30D;
	Thu, 30 Sep 2021 07:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5C2F6E30D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 07:14:48 +0000 (UTC)
X-UUID: 02bdd3d43917428486059ffb84059693-20210930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=W+gAqULzOpfc/ivXZHGg1RcECraPP+WX8duBqllWiWg=; 
 b=q6efus+v6mX5SugaKB9oDbvpcDX3wweSD7qtPf2IR45WzvSCiPikm9UkP3QVbvTgTgLPZDSnAT7wHVIQ2xQIp7xdgzrJmimFYB9auLntLAhrici9R0V3DC6TqxrDFvuFZJtlP6xPLCacUIEC/WOzXMzfNySweY7gwtEkUXD715U=;
X-UUID: 02bdd3d43917428486059ffb84059693-20210930
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1808720043; Thu, 30 Sep 2021 15:14:45 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 30 Sep 2021 15:14:44 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Sep 2021 15:14:42 +0800
Message-ID: <d3ed2bdef81ce1822b20da9570b5245cc0df6330.camel@mediatek.com>
Subject: Re: [PATCH v8 03/12] iommu/mediatek: Add probe_defer for smi-larb
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
 <anthony.huang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>
Date: Thu, 30 Sep 2021 15:14:45 +0800
In-Reply-To: <33a8b313-ad1b-d307-7e8c-2fdebdc6f1a7@collabora.com>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
 <20210929013719.25120-4-yong.wu@mediatek.com>
 <33a8b313-ad1b-d307-7e8c-2fdebdc6f1a7@collabora.com>
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

T24gV2VkLCAyMDIxLTA5LTI5IGF0IDE4OjMzICswMjAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3Rl
Og0KPiANCj4gT24gMjkuMDkuMjEgMDM6MzcsIFlvbmcgV3Ugd3JvdGU6DQo+ID4gUHJlcGFyZSBm
b3IgYWRkaW5nIGRldmljZV9saW5rLg0KPiA+IA0KPiA+IFRoZSBpb21tdSBjb25zdW1lciBzaG91
bGQgdXNlIGRldmljZV9saW5rIHRvIGNvbm5lY3Qgd2l0aCB0aGUNCj4gPiBzbWktbGFyYihzdXBw
bGllcikuIHRoZW4gdGhlIHNtaS1sYXJiIHNob3VsZCBydW4gYmVmb3JlIHRoZSBpb21tdQ0KPiA+
IGNvbnN1bWVyLiBIZXJlIHdlIGRlbGF5IHRoZSBpb21tdSBkcml2ZXIgdW50aWwgdGhlIHNtaSBk
cml2ZXIgaXMNCj4gPiByZWFkeSwNCj4gPiB0aGVuIGFsbCB0aGUgaW9tbXUgY29uc3VtZXJzIGFs
d2F5cyBhcmUgYWZ0ZXIgdGhlIHNtaSBkcml2ZXIuDQo+ID4gDQo+ID4gV2hlbiB0aGVyZSBpcyBu
byB0aGlzIHBhdGNoLCBpZiBzb21lIGNvbnN1bWVyIGRyaXZlcnMgcnVuIGJlZm9yZQ0KPiA+IHNt
aS1sYXJiLCB0aGUgc3VwcGxpZXIgbGlua19zdGF0dXMgaXMgRExfREVWX05PX0RSSVZFUigwKSBp
biB0aGUNCj4gPiBkZXZpY2VfbGlua19hZGQsIHRoZW4gZGV2aWNlX2xpbmtzX2RyaXZlcl9ib3Vu
ZCB3aWxsIHVzZSBXQVJOX09ODQo+ID4gdG8gY29tcGxhaW4gdGhhdCB0aGUgbGlua19zdGF0dXMg
b2Ygc3VwcGxpZXIgaXMgbm90IHJpZ2h0Lg0KPiA+IA0KPiA+IGRldmljZV9pc19ib3VuZCBtYXkg
YmUgbW9yZSBlbGVnYW50IGhlcmUuIGJ1dCBpdCBpcyBub3QgYWxsb3dlZCB0bw0KPiA+IEVYUE9S
VCBmcm9tIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC8xMzM0NjcwLy4N
Cj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb25nIFd1IDx5b25nLnd1QG1lZGlhdGVrLmNvbT4N
Cj4gPiBUZXN0ZWQtYnk6IEZyYW5rIFd1bmRlcmxpY2ggPGZyYW5rLXdAcHVibGljLWZpbGVzLmRl
PiAjIEJQSS0NCj4gPiBSMi9NVDc2MjMNCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvaW9tbXUvbXRr
X2lvbW11LmMgICAgfCAyICstDQo+ID4gICBkcml2ZXJzL2lvbW11L210a19pb21tdV92MS5jIHwg
MiArLQ0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvbXRrX2lvbW11LmMgYi9k
cml2ZXJzL2lvbW11L210a19pb21tdS5jDQo+ID4gaW5kZXggZDgzN2FkZmQxZGE1Li5kNTg0OGY3
OGE2NzcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pb21tdS9tdGtfaW9tbXUuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvaW9tbXUvbXRrX2lvbW11LmMNCj4gPiBAQCAtODQ0LDcgKzg0NCw3IEBAIHN0
YXRpYyBpbnQgbXRrX2lvbW11X3Byb2JlKHN0cnVjdA0KPiA+IHBsYXRmb3JtX2RldmljZSAqcGRl
dikNCj4gPiAgIAkJCWlkID0gaTsNCj4gPiAgIA0KPiA+ICAgCQlwbGFyYmRldiA9IG9mX2ZpbmRf
ZGV2aWNlX2J5X25vZGUobGFyYm5vZGUpOw0KPiA+IC0JCWlmICghcGxhcmJkZXYpIHsNCj4gPiAr
CQlpZiAoIXBsYXJiZGV2IHx8ICFwbGFyYmRldi0+ZGV2LmRyaXZlcikgew0KPiA+ICAgCQkJb2Zf
bm9kZV9wdXQobGFyYm5vZGUpOw0KPiA+ICAgCQkJcmV0dXJuIC1FUFJPQkVfREVGRVI7DQo+IA0K
PiBpZiBwbGFyYmRldiBpcyBudWxsIGRvZXNuJ3QgdGhhdCBtZWFuIHRoYXQgdGhlIGRldmljZSBk
b2VzIG5vdCBleGlzdD8NCg0KVGhpcyBpcyBwcm9iZSBmdW5jdGlvbiwgSXMgaXQgcG9zc2libGUg
dGhlIHBsYXRmb3JtIGRldmljZSBpcyBub3QgcmVhZHkNCmF0IHRoaXMgdGltZT8NCg0KSSBjaGVj
a2VkIHRoZSBwbGF0Zm9ybSBkZXZpY2Ugc2hvdWxkIGJlIGNyZWF0ZWQgYXQ6DQoNCm9mX3BsYXRm
b3JtX2RlZmF1bHRfcG9wdWxhdGVfaW5pdDogIGFyY2hfaW5pdGNhbGxfc3luYw0KICAtPm9mX3Bs
YXRmb3JtX3BvcHVsYXRlDQogICAgICAtPm9mX3BsYXRmb3JtX2RldmljZV9jcmVhdGVfcGRhdGEN
Cg0KTm90IHN1cmUgaWYgdGhpcyBtYXkgYmUgZGVsYXllZCBmb3Igc29tZSBkZXZpY2UuIElmIG5v
dCwgaXQgc2hvdWxkIGJlDQpFTk9ERVYgaGVyZS4NCg0KPiBzbyB3ZSBzaG91bGQgcmV0dXJuIC1F
Tk9ERVYgaW4gdGhhdCBjYXNlPw0KPiANCj4gdGhhbmtzLA0KPiBEYWZuYQ0KPiANCj4gPiAgIAkJ
fQ0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L210a19pb21tdV92MS5jDQo+ID4gYi9k
cml2ZXJzL2lvbW11L210a19pb21tdV92MS5jDQo+ID4gaW5kZXggMTQ2N2JhMWU0NDE3Li40ZDc4
MDk0MzIyMzkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pb21tdS9tdGtfaW9tbXVfdjEuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvaW9tbXUvbXRrX2lvbW11X3YxLmMNCj4gPiBAQCAtNjAyLDcgKzYw
Miw3IEBAIHN0YXRpYyBpbnQgbXRrX2lvbW11X3Byb2JlKHN0cnVjdA0KPiA+IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4gPiAgIAkJfQ0KPiA+ICAgDQo+ID4gICAJCXBsYXJiZGV2ID0gb2ZfZmlu
ZF9kZXZpY2VfYnlfbm9kZShsYXJibm9kZSk7DQo+ID4gLQkJaWYgKCFwbGFyYmRldikgew0KPiA+
ICsJCWlmICghcGxhcmJkZXYgfHwgIXBsYXJiZGV2LT5kZXYuZHJpdmVyKSB7DQo+ID4gICAJCQlv
Zl9ub2RlX3B1dChsYXJibm9kZSk7DQo+ID4gICAJCQlyZXR1cm4gLUVQUk9CRV9ERUZFUjsNCj4g
PiAgIAkJfQ0KPiA+IA0KPiANCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCj4gTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0DQo+IExpbnV4LW1lZGlh
dGVrQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlaw0K


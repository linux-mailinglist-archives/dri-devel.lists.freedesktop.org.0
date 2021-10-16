Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF6542FFB7
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 04:23:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6FC6E3D8;
	Sat, 16 Oct 2021 02:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0226E3D8
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 02:23:36 +0000 (UTC)
X-UUID: 7a68abb896e64edbbeb56cd2c621ec1d-20211016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gpCAjs3PTP2pnFObJBoM1HpsrUqmuM8h33+4tQMr9Fg=; 
 b=f37Cri4kRTZnAg8vcCnQg3UJTmJ+wXWad9EI/peDZuGOd14fWPr96VujvlDDfYrxfTimhpVivvoVgZGg2Hm1ayFXlM14XZxF60gMtJ9zjcUJyv65OJSoGlgQfjzWuj6YrXmn7mM4vWYaXllHZNMnTYzutgaOOAtBG6Ttorzxbsw=;
X-UUID: 7a68abb896e64edbbeb56cd2c621ec1d-20211016
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1174071897; Sat, 16 Oct 2021 10:23:30 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 16 Oct 2021 10:23:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 16 Oct 2021 10:23:27 +0800
Message-ID: <e4c98036dd73b91b8352a162f80240171e2b3f0f.camel@mediatek.com>
Subject: Re: [PATCH v8 04/12] iommu/mediatek: Add device_link between the
 consumer and the larb devices
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
Date: Sat, 16 Oct 2021 10:23:27 +0800
In-Reply-To: <e00b92db-0562-27ca-2f96-1f03ff824988@collabora.com>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
 <20210929013719.25120-5-yong.wu@mediatek.com>
 <e00b92db-0562-27ca-2f96-1f03ff824988@collabora.com>
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

T24gTW9uLCAyMDIxLTEwLTExIGF0IDE0OjM2ICswMjAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3Rl
Og0KPiANCj4gT24gMjkuMDkuMjEgMDM6MzcsIFlvbmcgV3Ugd3JvdGU6DQo+ID4gTWVkaWFUZWsg
SU9NTVUtU01JIGRpYWdyYW0gaXMgbGlrZSBiZWxvdy4gYWxsIHRoZSBjb25zdW1lciBjb25uZWN0
DQo+ID4gd2l0aA0KPiA+IHNtaS1sYXJiLCB0aGVuIGNvbm5lY3Qgd2l0aCBzbWktY29tbW9uLg0K
PiA+IA0KPiA+ICAgICAgICAgIE00VQ0KPiA+ICAgICAgICAgICB8DQo+ID4gICAgICBzbWktY29t
bW9uDQo+ID4gICAgICAgICAgIHwNCj4gPiAgICAtLS0tLS0tLS0tLS0tDQo+ID4gICAgfCAgICAg
ICAgIHwgICAgLi4uDQo+ID4gICAgfCAgICAgICAgIHwNCj4gPiBsYXJiMSAgICAgbGFyYjINCj4g
PiAgICB8ICAgICAgICAgfA0KPiA+IHZkZWMgICAgICAgdmVuYw0KPiA+IA0KPiA+IFdoZW4gdGhl
IGNvbnN1bWVyIHdvcmtzLCBpdCBzaG91bGQgZW5hYmxlIHRoZSBzbWktbGFyYidzIHBvd2VyDQo+
ID4gd2hpY2gNCj4gPiBhbHNvIG5lZWQgZW5hYmxlIHRoZSBzbWktY29tbW9uJ3MgcG93ZXIgZmly
c3RseS4NCj4gPiANCj4gPiBUaHVzLCBGaXJzdCBvZiBhbGwsIHVzZSB0aGUgZGV2aWNlIGxpbmsg
Y29ubmVjdCB0aGUgY29uc3VtZXIgYW5kDQo+ID4gdGhlDQo+ID4gc21pLWxhcmJzLiB0aGVuIGFk
ZCBkZXZpY2UgbGluayBiZXR3ZWVuIHRoZSBzbWktbGFyYiBhbmQgc21pLQ0KPiA+IGNvbW1vbi4N
Cj4gPiANCj4gPiBUaGlzIHBhdGNoIGFkZHMgZGV2aWNlX2xpbmsgYmV0d2VlbiB0aGUgY29uc3Vt
ZXIgYW5kIHRoZSBsYXJicy4NCj4gPiANCj4gPiBXaGVuIGRldmljZV9saW5rX2FkZCwgSSBhZGQg
dGhlIGZsYWcgRExfRkxBR19TVEFURUxFU1MgdG8gYXZvaWQNCj4gPiBjYWxsaW5nDQo+ID4gcG1f
cnVudGltZV94eCB0byBrZWVwIHRoZSBvcmlnaW5hbCBzdGF0dXMgb2YgY2xvY2tzLiBJdCBjYW4g
YXZvaWQNCj4gPiB0d28NCj4gPiBpc3N1ZXM6DQo+ID4gMSkgRGlzcGxheSBIVyBzaG93IGZhc3Rs
b2dvIGFibm9ybWFsbHkgcmVwb3J0ZWQgaW4gWzFdLiBBdCB0aGUNCj4gPiBiZWdnaW5pbmcsDQo+
ID4gYWxsIHRoZSBjbG9ja3MgYXJlIGVuYWJsZWQgYmVmb3JlIGVudGVyaW5nIGtlcm5lbCwgYnV0
IHRoZSBjbG9ja3MNCj4gPiBmb3INCj4gPiBkaXNwbGF5IEhXKGFsd2F5cyBpbiBsYXJiMCkgd2ls
bCBiZSBnYXRlZCBhZnRlciBjbGtfZW5hYmxlIGFuZA0KPiA+IGNsa19kaXNhYmxlDQo+ID4gY2Fs
bGVkIGZyb20gZGV2aWNlX2xpbmtfYWRkKC0+cG1fcnVudGltZV9yZXN1bWUpIGFuZCBycG1faWRs
ZS4gVGhlDQo+ID4gY2xvY2sNCj4gPiBvcGVyYXRpb24gaGFwcGVuZWQgYmVmb3JlIGRpc3BsYXkg
ZHJpdmVyIHByb2JlLiBBdCB0aGF0IHRpbWUsIHRoZQ0KPiA+IGRpc3BsYXkNCj4gPiBIVyB3aWxs
IGJlIGFibm9ybWFsLg0KPiA+IA0KPiA+IDIpIEEgZGVhZGxvY2sgaXNzdWUgcmVwb3J0ZWQgaW4g
WzJdLiBVc2UgRExfRkxBR19TVEFURUxFU1MgdG8gc2tpcA0KPiA+IHBtX3J1bnRpbWVfeHggdG8g
YXZvaWQgdGhlIGRlYWRsb2NrLg0KPiA+IA0KPiA+IENvcnJlc3BvbmRpbmcsIERMX0ZMQUdfQVVU
T1JFTU9WRV9DT05TVU1FUiBjYW4ndCBiZSBhZGRlZCwgdGhlbg0KPiA+IGRldmljZV9saW5rX3Jl
bW92ZWQgc2hvdWxkIGJlIGFkZGVkIGV4cGxpY2l0bHkuDQo+ID4gDQo+ID4gWzFdIA0KPiA+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW1lZGlhdGVrLzE1NjQyMTM4ODguMjI5MDguNC5j
YW1lbEBtaGZzZGNhcDAzLw0KPiA+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdv
cmsvcGF0Y2gvMTA4NjU2OS8NCj4gPiANCj4gPiBTdWdnZXN0ZWQtYnk6IFRvbWFzeiBGaWdhIDx0
ZmlnYUBjaHJvbWl1bS5vcmc+DQo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZyBXdSA8eW9uZy53dUBt
ZWRpYXRlay5jb20+DQo+ID4gVGVzdGVkLWJ5OiBGcmFuayBXdW5kZXJsaWNoIDxmcmFuay13QHB1
YmxpYy1maWxlcy5kZT4gIyBCUEktDQo+ID4gUjIvTVQ3NjIzDQo+ID4gLS0tDQo+ID4gICBkcml2
ZXJzL2lvbW11L210a19pb21tdS5jICAgIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKw0KPiA+
ICAgZHJpdmVycy9pb21tdS9tdGtfaW9tbXVfdjEuYyB8IDIwICsrKysrKysrKysrKysrKysrKyst
DQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9tdGtfaW9tbXUuYyBiL2RyaXZl
cnMvaW9tbXUvbXRrX2lvbW11LmMNCj4gPiBpbmRleCBkNTg0OGY3OGE2NzcuLmEyZmE1NTg5OTQz
NCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2lvbW11L210a19pb21tdS5jDQo+ID4gKysrIGIv
ZHJpdmVycy9pb21tdS9tdGtfaW9tbXUuYw0KPiA+IEBAIC01NjAsMjIgKzU2MCw0NCBAQCBzdGF0
aWMgc3RydWN0IGlvbW11X2RldmljZQ0KPiA+ICptdGtfaW9tbXVfcHJvYmVfZGV2aWNlKHN0cnVj
dCBkZXZpY2UgKmRldikNCj4gPiAgIHsNCj4gPiAgIAlzdHJ1Y3QgaW9tbXVfZndzcGVjICpmd3Nw
ZWMgPSBkZXZfaW9tbXVfZndzcGVjX2dldChkZXYpOw0KPiA+ICAgCXN0cnVjdCBtdGtfaW9tbXVf
ZGF0YSAqZGF0YTsNCj4gPiArCXN0cnVjdCBkZXZpY2VfbGluayAqbGluazsNCj4gPiArCXN0cnVj
dCBkZXZpY2UgKmxhcmJkZXY7DQo+ID4gKwl1bnNpZ25lZCBpbnQgbGFyYmlkOw0KPiA+ICAgDQo+
ID4gICAJaWYgKCFmd3NwZWMgfHwgZndzcGVjLT5vcHMgIT0gJm10a19pb21tdV9vcHMpDQo+ID4g
ICAJCXJldHVybiBFUlJfUFRSKC1FTk9ERVYpOyAvKiBOb3QgYSBpb21tdSBjbGllbnQgZGV2aWNl
DQo+ID4gKi8NCj4gPiAgIA0KPiA+ICAgCWRhdGEgPSBkZXZfaW9tbXVfcHJpdl9nZXQoZGV2KTsN
Cj4gPiAgIA0KPiA+ICsJLyoNCj4gPiArCSAqIExpbmsgdGhlIGNvbnN1bWVyIGRldmljZSB3aXRo
IHRoZSBzbWktbGFyYiBkZXZpY2Uoc3VwcGxpZXIpDQo+ID4gKwkgKiBUaGUgZGV2aWNlIGluIGVh
Y2ggYSBsYXJiIGlzIGEgaW5kZXBlbmRlbnQgSFcuIHRodXMgb25seQ0KPiA+IGxpbmsNCj4gPiAr
CSAqIG9uZSBsYXJiIGhlcmUuDQo+ID4gKwkgKi8NCj4gPiArCWxhcmJpZCA9IE1US19NNFVfVE9f
TEFSQihmd3NwZWMtPmlkc1swXSk7DQo+IA0KPiBzbyBsYXJiaWQgaXMgYWx3YXlzIHRoZSBzYW1l
IGZvciBhbGwgdGhlIGlkcyBvZiBhIGRldmljZT8gDQoNClllcy4gRm9yIG1lLCBlYWNoIGEgZHRz
aSBub2RlIHNob3VsZCByZXByZXNlbnQgYSBIVyB1bml0IHdoaWNoIGNhbiBvbmx5DQpjb25uZWN0
IG9uZSBsYXJiLg0KDQo+IElmIHNvIG1heWJlIGl0IHdvcnRoIHRlc3RpbmcgaXQgYW5kIHJldHVy
biBlcnJvciBpZiB0aGlzIGlzIG5vdCB0aGUNCj4gY2FzZS4NCg0KVGhhbmtzIGZvciB0aGUgc3Vn
Z2VzdGlvbi4gVGhpcyBpcyB2ZXJ5IGhlbHBmdWwuIEkgZGlkIHNlZSBzb21lb25lIHB1dA0KdGhl
IGRpZmZlcmVudCBsYXJicyBpbiBvbmUgbm9kZS4gSSB3aWxsIGNoZWNrIHRoaXMsIGFuZCBhZGQg
cmV0dXJuDQpFSU5WQUwgZm9yIHRoaXMgY2FzZS4NCg0KPiANCj4gVGhhbmtzLA0KPiBEYWZuYQ0K
IA0KPiA+IA0K


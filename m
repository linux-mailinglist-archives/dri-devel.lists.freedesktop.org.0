Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEA4438DEE
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 05:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78F2896DD;
	Mon, 25 Oct 2021 03:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C884F896DD
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 03:57:45 +0000 (UTC)
X-UUID: 6cf5dab4038e407b895180c1d1649248-20211025
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=cV6dg7PsYHB6+UKop/Sg0rROLJ+oreSSfppKhlC8xGE=; 
 b=nBkGbQeC+Sa3c4WFbs6Ky01mc0hcpUC1VdMIVgp0Ci+nREwXGSXct8xkBhX2s3ToXb8z7bOAWuCxF6sm2/w1ZbvpyLWXSZSkGdcufbA7YrxHi4qeoC1Ri9RoqAAxoOpOmRoxjwmLJ+sjifSy3adpDDGLiZMJznJ7HwbTckMDANs=;
X-UUID: 6cf5dab4038e407b895180c1d1649248-20211025
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 77251011; Mon, 25 Oct 2021 11:57:42 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 25 Oct 2021 11:57:40 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Oct 2021 11:57:39 +0800
Message-ID: <15d4ccb984f9e3919d6d7535d05aec0332dbe301.camel@mediatek.com>
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
Date: Mon, 25 Oct 2021 11:57:39 +0800
In-Reply-To: <da5934de-65ad-4bac-c510-eb0d40d96d70@collabora.com>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
 <20210929013719.25120-5-yong.wu@mediatek.com>
 <e00b92db-0562-27ca-2f96-1f03ff824988@collabora.com>
 <e4c98036dd73b91b8352a162f80240171e2b3f0f.camel@mediatek.com>
 <da5934de-65ad-4bac-c510-eb0d40d96d70@collabora.com>
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

T24gTW9uLCAyMDIxLTEwLTE4IGF0IDA5OjEzICswMjAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3Rl
Og0KPiANCj4gT24gMTYuMTAuMjEgMDQ6MjMsIFlvbmcgV3Ugd3JvdGU6DQo+ID4gT24gTW9uLCAy
MDIxLTEwLTExIGF0IDE0OjM2ICswMjAwLCBEYWZuYSBIaXJzY2hmZWxkIHdyb3RlOg0KPiA+ID4g
DQo+ID4gPiBPbiAyOS4wOS4yMSAwMzozNywgWW9uZyBXdSB3cm90ZToNCj4gPiA+ID4gTWVkaWFU
ZWsgSU9NTVUtU01JIGRpYWdyYW0gaXMgbGlrZSBiZWxvdy4gYWxsIHRoZSBjb25zdW1lcg0KPiA+
ID4gPiBjb25uZWN0DQo+ID4gPiA+IHdpdGgNCj4gPiA+ID4gc21pLWxhcmIsIHRoZW4gY29ubmVj
dCB3aXRoIHNtaS1jb21tb24uDQo+ID4gPiA+IA0KPiA+ID4gPiAgICAgICAgICAgTTRVDQo+ID4g
PiA+ICAgICAgICAgICAgfA0KPiA+ID4gPiAgICAgICBzbWktY29tbW9uDQo+ID4gPiA+ICAgICAg
ICAgICAgfA0KPiA+ID4gPiAgICAgLS0tLS0tLS0tLS0tLQ0KPiA+ID4gPiAgICAgfCAgICAgICAg
IHwgICAgLi4uDQo+ID4gPiA+ICAgICB8ICAgICAgICAgfA0KPiA+ID4gPiBsYXJiMSAgICAgbGFy
YjINCj4gPiA+ID4gICAgIHwgICAgICAgICB8DQo+ID4gPiA+IHZkZWMgICAgICAgdmVuYw0KPiA+
ID4gPiANCj4gPiA+ID4gV2hlbiB0aGUgY29uc3VtZXIgd29ya3MsIGl0IHNob3VsZCBlbmFibGUg
dGhlIHNtaS1sYXJiJ3MgcG93ZXINCj4gPiA+ID4gd2hpY2gNCj4gPiA+ID4gYWxzbyBuZWVkIGVu
YWJsZSB0aGUgc21pLWNvbW1vbidzIHBvd2VyIGZpcnN0bHkuDQo+ID4gPiA+IA0KPiA+ID4gPiBU
aHVzLCBGaXJzdCBvZiBhbGwsIHVzZSB0aGUgZGV2aWNlIGxpbmsgY29ubmVjdCB0aGUgY29uc3Vt
ZXINCj4gPiA+ID4gYW5kDQo+ID4gPiA+IHRoZQ0KPiA+ID4gPiBzbWktbGFyYnMuIHRoZW4gYWRk
IGRldmljZSBsaW5rIGJldHdlZW4gdGhlIHNtaS1sYXJiIGFuZCBzbWktDQo+ID4gPiA+IGNvbW1v
bi4NCj4gPiA+ID4gDQo+ID4gPiA+IFRoaXMgcGF0Y2ggYWRkcyBkZXZpY2VfbGluayBiZXR3ZWVu
IHRoZSBjb25zdW1lciBhbmQgdGhlIGxhcmJzLg0KPiA+ID4gPiANCj4gPiA+ID4gV2hlbiBkZXZp
Y2VfbGlua19hZGQsIEkgYWRkIHRoZSBmbGFnIERMX0ZMQUdfU1RBVEVMRVNTIHRvIGF2b2lkDQo+
ID4gPiA+IGNhbGxpbmcNCj4gPiA+ID4gcG1fcnVudGltZV94eCB0byBrZWVwIHRoZSBvcmlnaW5h
bCBzdGF0dXMgb2YgY2xvY2tzLiBJdCBjYW4NCj4gPiA+ID4gYXZvaWQNCj4gPiA+ID4gdHdvDQo+
ID4gPiA+IGlzc3VlczoNCj4gPiA+ID4gMSkgRGlzcGxheSBIVyBzaG93IGZhc3Rsb2dvIGFibm9y
bWFsbHkgcmVwb3J0ZWQgaW4gWzFdLiBBdCB0aGUNCj4gPiA+ID4gYmVnZ2luaW5nLA0KPiA+ID4g
PiBhbGwgdGhlIGNsb2NrcyBhcmUgZW5hYmxlZCBiZWZvcmUgZW50ZXJpbmcga2VybmVsLCBidXQg
dGhlDQo+ID4gPiA+IGNsb2Nrcw0KPiA+ID4gPiBmb3INCj4gPiA+ID4gZGlzcGxheSBIVyhhbHdh
eXMgaW4gbGFyYjApIHdpbGwgYmUgZ2F0ZWQgYWZ0ZXIgY2xrX2VuYWJsZSBhbmQNCj4gPiA+ID4g
Y2xrX2Rpc2FibGUNCj4gPiA+ID4gY2FsbGVkIGZyb20gZGV2aWNlX2xpbmtfYWRkKC0+cG1fcnVu
dGltZV9yZXN1bWUpIGFuZCBycG1faWRsZS4NCj4gPiA+ID4gVGhlDQo+ID4gPiA+IGNsb2NrDQo+
ID4gPiA+IG9wZXJhdGlvbiBoYXBwZW5lZCBiZWZvcmUgZGlzcGxheSBkcml2ZXIgcHJvYmUuIEF0
IHRoYXQgdGltZSwNCj4gPiA+ID4gdGhlDQo+ID4gPiA+IGRpc3BsYXkNCj4gPiA+ID4gSFcgd2ls
bCBiZSBhYm5vcm1hbC4NCj4gPiA+ID4gDQo+ID4gPiA+IDIpIEEgZGVhZGxvY2sgaXNzdWUgcmVw
b3J0ZWQgaW4gWzJdLiBVc2UgRExfRkxBR19TVEFURUxFU1MgdG8NCj4gPiA+ID4gc2tpcA0KPiA+
ID4gPiBwbV9ydW50aW1lX3h4IHRvIGF2b2lkIHRoZSBkZWFkbG9jay4NCj4gPiA+ID4gDQo+ID4g
PiA+IENvcnJlc3BvbmRpbmcsIERMX0ZMQUdfQVVUT1JFTU9WRV9DT05TVU1FUiBjYW4ndCBiZSBh
ZGRlZCwgdGhlbg0KPiA+ID4gPiBkZXZpY2VfbGlua19yZW1vdmVkIHNob3VsZCBiZSBhZGRlZCBl
eHBsaWNpdGx5Lg0KPiA+ID4gPiANCj4gPiA+ID4gWzFdDQo+ID4gPiA+IA0KaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtbWVkaWF0ZWsvMTU2NDIxMzg4OC4yMjkwOC40LmNhbWVsQG1oZnNk
Y2FwMDMvDQo+ID4gPiA+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0
Y2gvMTA4NjU2OS8NCj4gPiA+ID4gDQo+ID4gPiA+IFN1Z2dlc3RlZC1ieTogVG9tYXN6IEZpZ2Eg
PHRmaWdhQGNocm9taXVtLm9yZz4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWW9uZyBXdSA8eW9u
Zy53dUBtZWRpYXRlay5jb20+DQo+ID4gPiA+IFRlc3RlZC1ieTogRnJhbmsgV3VuZGVybGljaCA8
ZnJhbmstd0BwdWJsaWMtZmlsZXMuZGU+ICMgQlBJLQ0KPiA+ID4gPiBSMi9NVDc2MjMNCj4gPiA+
ID4gLS0tDQo+ID4gPiA+ICAgIGRyaXZlcnMvaW9tbXUvbXRrX2lvbW11LmMgICAgfCAyMiArKysr
KysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICAgIGRyaXZlcnMvaW9tbXUvbXRrX2lvbW11X3Yx
LmMgfCAyMCArKysrKysrKysrKysrKysrKysrLQ0KPiA+ID4gPiAgICAyIGZpbGVzIGNoYW5nZWQs
IDQxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4gDQo+ID4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2lvbW11L210a19pb21tdS5jDQo+ID4gPiA+IGIvZHJpdmVycy9pb21t
dS9tdGtfaW9tbXUuYw0KPiA+ID4gPiBpbmRleCBkNTg0OGY3OGE2NzcuLmEyZmE1NTg5OTQzNCAx
MDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9pb21tdS9tdGtfaW9tbXUuYw0KPiA+ID4gPiAr
KysgYi9kcml2ZXJzL2lvbW11L210a19pb21tdS5jDQo+ID4gPiA+IEBAIC01NjAsMjIgKzU2MCw0
NCBAQCBzdGF0aWMgc3RydWN0IGlvbW11X2RldmljZQ0KPiA+ID4gPiAqbXRrX2lvbW11X3Byb2Jl
X2RldmljZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gPiA+ICAgIHsNCj4gPiA+ID4gICAgCXN0
cnVjdCBpb21tdV9md3NwZWMgKmZ3c3BlYyA9DQo+ID4gPiA+IGRldl9pb21tdV9md3NwZWNfZ2V0
KGRldik7DQo+ID4gPiA+ICAgIAlzdHJ1Y3QgbXRrX2lvbW11X2RhdGEgKmRhdGE7DQo+ID4gPiA+
ICsJc3RydWN0IGRldmljZV9saW5rICpsaW5rOw0KPiA+ID4gPiArCXN0cnVjdCBkZXZpY2UgKmxh
cmJkZXY7DQo+ID4gPiA+ICsJdW5zaWduZWQgaW50IGxhcmJpZDsNCj4gPiA+ID4gICAgDQo+ID4g
PiA+ICAgIAlpZiAoIWZ3c3BlYyB8fCBmd3NwZWMtPm9wcyAhPSAmbXRrX2lvbW11X29wcykNCj4g
PiA+ID4gICAgCQlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsgLyogTm90IGEgaW9tbXUgY2xpZW50
DQo+ID4gPiA+IGRldmljZQ0KPiA+ID4gPiAqLw0KPiA+ID4gPiAgICANCj4gPiA+ID4gICAgCWRh
dGEgPSBkZXZfaW9tbXVfcHJpdl9nZXQoZGV2KTsNCj4gPiA+ID4gICAgDQo+ID4gPiA+ICsJLyoN
Cj4gPiA+ID4gKwkgKiBMaW5rIHRoZSBjb25zdW1lciBkZXZpY2Ugd2l0aCB0aGUgc21pLWxhcmIN
Cj4gPiA+ID4gZGV2aWNlKHN1cHBsaWVyKQ0KPiA+ID4gPiArCSAqIFRoZSBkZXZpY2UgaW4gZWFj
aCBhIGxhcmIgaXMgYSBpbmRlcGVuZGVudCBIVy4gdGh1cw0KPiA+ID4gPiBvbmx5DQo+ID4gPiA+
IGxpbmsNCj4gPiA+ID4gKwkgKiBvbmUgbGFyYiBoZXJlLg0KPiA+ID4gPiArCSAqLw0KPiA+ID4g
PiArCWxhcmJpZCA9IE1US19NNFVfVE9fTEFSQihmd3NwZWMtPmlkc1swXSk7DQo+ID4gPiANCj4g
PiA+IHNvIGxhcmJpZCBpcyBhbHdheXMgdGhlIHNhbWUgZm9yIGFsbCB0aGUgaWRzIG9mIGEgZGV2
aWNlPw0KPiA+IA0KPiA+IFllcy4gRm9yIG1lLCBlYWNoIGEgZHRzaSBub2RlIHNob3VsZCByZXBy
ZXNlbnQgYSBIVyB1bml0IHdoaWNoIGNhbg0KPiA+IG9ubHkNCj4gPiBjb25uZWN0IG9uZSBsYXJi
Lg0KPiA+IA0KPiA+ID4gSWYgc28gbWF5YmUgaXQgd29ydGggdGVzdGluZyBpdCBhbmQgcmV0dXJu
IGVycm9yIGlmIHRoaXMgaXMgbm90DQo+ID4gPiB0aGUNCj4gPiA+IGNhc2UuDQo+ID4gDQo+ID4g
VGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4gVGhpcyBpcyB2ZXJ5IGhlbHBmdWwuIEkgZGlkIHNl
ZSBzb21lb25lDQo+ID4gcHV0DQo+ID4gdGhlIGRpZmZlcmVudCBsYXJicyBpbiBvbmUgbm9kZS4g
SSB3aWxsIGNoZWNrIHRoaXMsIGFuZCBhZGQgcmV0dXJuDQo+IA0KPiBJIGFtIHdvcmtpbmcgb24g
YnVncyBmb3VuZCBvbiBtZWRpYSBkcml2ZXJzLCBjb3VsZCB5b3UgcGxlYXNlIHBvaW50DQo+IG1l
IHRvDQo+IHRoYXQgd3Jvbmcgbm9kZT8NCj4gV2lsbCB5b3Ugc2VuZCBhIGZpeCB0byB0aGF0IG5v
ZGUgaW4gdGhlIGR0c2k/DQoNCnNvcnJ5LiBJIG1lYW4gaXQgaGFwcGVuZWQgaW4gdGhlIGludGVy
bmFsIGJyYW5jaCBhbmQgaXQgaGFzIGFscmVhZHkNCmJlZW4gZml4ZWQgaW50ZXJuYWxseSwgIGFs
bCB0aGUgdXBzdHJlYW0gbm9kZXMgYXJlIG9rIGZvciB0aGlzLg0KDQpUaGFua3MNCj4gDQo+IA0K
PiBUaGFua3MsDQo+IERhZm5hDQo+IA0KPiA+IEVJTlZBTCBmb3IgdGhpcyBjYXNlLg0KPiANCj4g
DQo+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiBUaGFua3MsDQo+ID4gPiBEYWZuYQ0KPiA+IA0KPiA+
ICAgDQo+ID4gPiA+IA0K


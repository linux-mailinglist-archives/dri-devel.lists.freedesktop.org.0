Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A27DFF902
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5511F6E320;
	Sun, 17 Nov 2019 11:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150079.outbound.protection.outlook.com [40.107.15.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1A2B6E42E;
 Fri, 15 Nov 2019 10:33:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6Z18BRz1KAje0tdUoYULQnp9QqztilSrU7cZ57G143B2cONRLqsE8MksykkFGm3ITqHp5dBzCeUafMQEEz0yQ3ZdKyk9d0X5yttNWwY83Zh1yW/vMTy+Cuk5ZIeoJZuC+VynHla65HoqSZgkhvjoo2oar1Q5OLofGYWRjtSVaiz9XzC5faxlwxM2A2p4jYaenCl2uBBdq6YSd9TtopOqVwMNxbZJVCa2OW3ojJZFpPhyzpEDpDK57rOfRZIcWODZLeXBNDGu5STC0TshTKk6/cAeS68ZvHvExlmy37Q4DGUDnYW+KpP84YAnS6L5vU6yh7VPz5OWSCPLfFC4UtA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybCY7oHapiVMvASTAAxLGFJfDGMHPFlo3BBq954xbDA=;
 b=Ztp/eUN9PfMbPr7KBhNqxZXFWO8b8FFUeuaXkuXGuSnedHBLJlPyfMGxCLdL7U90NiLe+SAnM3CwZrpdw2Syyf097VhVKw1AFIEsS42wVwb9p/z54uxj0IOMPkuvKw/EliMjxIcXz7ggyn944uDiA03I2MtWBqMXSArc1koQdm0KuR4aVJo2qn6gT71Z8ky0rxh3W2dxwqf9e+/dJitWj2dzZ3cHCh+w/fHIAm50A8IECdyRmNF7K4aYstZO15a0hmwk8bSkgRO+G86U1ffb58GgcnydnoejmLAn/pmReppUW1pEQhD3dcoLivvEzQW9dnU35ue2M6ad9H6IjWXyyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
Received: from AM6PR03MB5958.eurprd03.prod.outlook.com (10.255.122.93) by
 AM6PR03MB3544.eurprd03.prod.outlook.com (52.134.114.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Fri, 15 Nov 2019 10:33:24 +0000
Received: from AM6PR03MB5958.eurprd03.prod.outlook.com
 ([fe80::b9b5:1dc6:f34f:a290]) by AM6PR03MB5958.eurprd03.prod.outlook.com
 ([fe80::b9b5:1dc6:f34f:a290%5]) with mapi id 15.20.2430.028; Fri, 15 Nov 2019
 10:33:24 +0000
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 6/8] drm/xen: Simplify fb_create
Thread-Topic: [PATCH 6/8] drm/xen: Simplify fb_create
Thread-Index: AQHVm5YWDOtNCFfLp0y2mm7AksoDXqeMCQqA
Date: Fri, 15 Nov 2019 10:33:24 +0000
Message-ID: <4042b233-c219-5e72-adfd-8108b13e9a71@epam.com>
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
 <20191115092120.4445-7-daniel.vetter@ffwll.ch>
In-Reply-To: <20191115092120.4445-7-daniel.vetter@ffwll.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [176.36.245.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f579d2f-3de3-4ea3-8e5b-08d769b73e8f
x-ms-traffictypediagnostic: AM6PR03MB3544:
x-microsoft-antispam-prvs: <AM6PR03MB3544DF6C7DC3D57E71A5D043E7700@AM6PR03MB3544.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02229A4115
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(189003)(199004)(11346002)(446003)(486006)(2616005)(81166006)(2906002)(8676002)(476003)(186003)(6506007)(478600001)(305945005)(76176011)(53546011)(14454004)(102836004)(55236004)(26005)(7736002)(110136005)(31696002)(25786009)(36756003)(81156014)(5660300002)(316002)(99286004)(66476007)(64756008)(229853002)(80792005)(66446008)(66556008)(5024004)(256004)(14444005)(66946007)(8936002)(3846002)(6116002)(71200400001)(6436002)(71190400001)(76116006)(6486002)(91956017)(6512007)(66066001)(31686004)(54906003)(6246003)(86362001)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR03MB3544;
 H:AM6PR03MB5958.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H1nU9GEkrHkaF0+B0tCBzuugStQF1lD11PHf4W3OIOKTYM7WBYxx6z8LVqKd7yDrkF4iifthrITNFX0Yn5bSoF+T3aiiBJctbEW/OwVNpY8/wTAAW5uwdALDy+tKo8X1cU+sE/QjMW8ev+D/d3ptvFw2s7C0jmZXd8CC4TUWVQ9SQT6aCqWAmQP1W1n09zbddUhHA6oCZi/tYjpOr72uM4puIZopZm7ZJvcTqNO5tDQ1Jzc7siac9e+6hfEXEFlsESL7D1jx3iIVFuZRvbuhRLQzdh4c1kP7z9Ywh1hgkO1vc6nFn/mp+8oINz3ytprOCgcHiO5pOk23QIzxhUSFRsRF2OWTalYhqp2Vom9RExa1rykwR2oDYTa/FZ216G3k9/8m+ov9RUTqD7Q/KTiV45J3UpKhN8dw/GKV0HUMjou/7IWs7loXb0+WQ+bl+wlW
x-ms-exchange-transport-forked: True
Content-ID: <61C1A4140FF3CD43B772A27A4B105511@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f579d2f-3de3-4ea3-8e5b-08d769b73e8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2019 10:33:24.3932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jGXnbzB6nMnPBpuh3I9XwOkDmfUpB5tsHILsA4FgOTlDneitparInaPQ/nG+xB+rftH7tdzYjyGgL8ndaXgJc5q4y3CK/i2q7q52JA2OvAjUtjN/DrWdiGhdsSbIk2ob
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB3544
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybCY7oHapiVMvASTAAxLGFJfDGMHPFlo3BBq954xbDA=;
 b=qswlF4uJQCLAHgxl9QfKtnpMPGadwGMrgTBDForOqrMs+eHMwK1Giu2J4Mk4sa8kYWloCcbqlxBxpWNsIe/PN2Z0XnQ5Mou+ghRBH03DysNV7taO3PLxgclZpkRCR9NxLiGzEeIZ3cmcdwqsqfguF93xJPOlTgPrm/d+t7REuZA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Oleksandr_Andrushchenko@epam.com; 
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTUvMTkgMTE6MjEgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+IFRoZSBjdXJyZW50
IGNvZGUgaXMgYSBwcmV0dHkgZ29vZCB3dGYgbW9tZW50LCBzaW5jZSB3ZSBkcm9wIHRoZQ0KPiBy
ZWZlcmVuY2UgYmVmb3JlIHdlIHVzZSBpdC4gSXQncyBub3QgYSBiaWcgZGVhbCwgYmVjYXVzZSBh
KSB3ZSBvbmx5DQo+IHVzZSB0aGUgcG9pbnRlciwgc28gZG9lc24ndCBibG93IHVwIGFuZCB0aGUg
cmVhbCByZWFzb24gYikgZmItPm9ialswXQ0KPiBhbHJlYWR5IGhvbGRzIGEgZnVsbCByZWZlcmVu
Y2UgZm9yIHVzLg0KPg0KPiBNaWdodCBhcyB3ZWxsIHRha2UgdGhlIHJlYWwgcG9pbnRlciBpbnMn
dCBvZiBjb21wbGljYXRlZCBnYW1lcyB0aGF0DQo+IGJhZmZsZS4NCj4NCj4gU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+DQo+IENjOiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+IENj
OiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNClJldmlld2VkLWJ5OiBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9rbXMuYyB8IDkgKy0tLS0tLS0t
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA4IGRlbGV0aW9ucygtKQ0KPg0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jIGIv
ZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2ttcy5jDQo+IGluZGV4IGZmNTA2YmM5
OTQxNC4uNGYzNGM1MjA4MTgwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hl
bl9kcm1fZnJvbnRfa21zLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zy
b250X2ttcy5jDQo+IEBAIC02MywxNCArNjMsNyBAQCBmYl9jcmVhdGUoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwgc3RydWN0IGRybV9maWxlICpmaWxwLA0KPiAgIAlpZiAoSVNfRVJSX09SX05VTEwo
ZmIpKQ0KPiAgIAkJcmV0dXJuIGZiOw0KPiAgIA0KPiAtCWdlbV9vYmogPSBkcm1fZ2VtX29iamVj
dF9sb29rdXAoZmlscCwgbW9kZV9jbWQtPmhhbmRsZXNbMF0pOw0KPiAtCWlmICghZ2VtX29iaikg
ew0KPiAtCQlEUk1fRVJST1IoIkZhaWxlZCB0byBsb29rdXAgR0VNIG9iamVjdFxuIik7DQo+IC0J
CXJldCA9IC1FTk9FTlQ7DQo+IC0JCWdvdG8gZmFpbDsNCj4gLQl9DQo+IC0NCj4gLQlkcm1fZ2Vt
X29iamVjdF9wdXRfdW5sb2NrZWQoZ2VtX29iaik7DQo+ICsJZ2VtX29iaiA9IGZiLT5vYmpbMF07
DQo+ICAgDQo+ICAgCXJldCA9IHhlbl9kcm1fZnJvbnRfZmJfYXR0YWNoKGRybV9pbmZvLT5mcm9u
dF9pbmZvLA0KPiAgIAkJCQkgICAgICB4ZW5fZHJtX2Zyb250X2RidWZfdG9fY29va2llKGdlbV9v
YmopLA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9ECF9002
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 13:53:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99FB89DA5;
	Tue, 12 Nov 2019 12:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680051.outbound.protection.outlook.com [40.107.68.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289BA89DA5
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 12:53:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIVD628PM38aD9fTiFKEC8HY2IMrp6xAuk7tXx+zbD9azLsIl3L9SjSdluwEoh+27o57baMgIR+agXaHcO5fIfwQhjybNvlAwaulIZCit5+X1V+epw2HN5WZ1ZUCO2rj/GpI/rAEG31WgLSe/Duiepomk2hFS9iK4hIhZCz7eyebLa+T33wSEdzQeweaXLJ3NGoB/Bsb4iVrrReRvOUwSztVcz1OcdI5NKaG2jwnwnPJ2Um0pU0v5/DW+029VnOJoXwl9wya3FbOOwQ2T9gYn/LqObosRyRcRGh9tqEIfuwoZh8s4YMaax7O1vAfL2nv3tyRS6klh5RWJCFEEuSa2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fu6Gg26GsvYTNxOFvbovAtWHSkXBZ9dhQLr2/LahuxY=;
 b=ftAodY9UF2T/33CBiZUyaRnpEzlF0VDNXb3wuz0cCLzY+aR5LdEkIZ7MReDALizxr8mqnGWwJbii7G128f5ukgqIXxHtXS/xge6p9LBimYx0TX0cd1/h4NyPyHuAnCpLrRve5MJfqh+tR17ZQOysh+sDUXXD/IH9nDLUTZz1XVL7ta4zOW+jGkj6ww3P1WmiHcWQwmiHH8OVL1aQn/Rv43meiVKRMsmu29wxSJfjNwY+5hWWm8FqO7Sld9TeRUHJHoX2EqAXN5dL4Iq7EYBt7nP+fhE5xs1au/NzQbPSOEfn959CbqsNwChi97Hrw0mGR7v7aTQWqpwroyK+uc+geQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB7024.namprd05.prod.outlook.com (52.135.37.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.16; Tue, 12 Nov 2019 12:53:12 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::fc6c:1ed8:d63d:4dc8]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::fc6c:1ed8:d63d:4dc8%5]) with mapi id 15.20.2451.023; Tue, 12 Nov 2019
 12:53:12 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/vmwgfx: check master authentication in
 surface_ref ioctls
Thread-Topic: [PATCH 2/5] drm/vmwgfx: check master authentication in
 surface_ref ioctls
Thread-Index: AQHVkLT+4h9txJSLLkSe5V9HQjB5FQ==
Date: Tue, 12 Nov 2019 12:53:12 +0000
Message-ID: <MN2PR05MB614128E9115A47424F35C67EA1770@MN2PR05MB6141.namprd05.prod.outlook.com>
References: <20191101130313.8862-1-emil.l.velikov@gmail.com>
 <20191101130313.8862-2-emil.l.velikov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 579b6278-391f-46c0-74f1-08d7676f46e7
x-ms-traffictypediagnostic: MN2PR05MB7024:|MN2PR05MB7024:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB7024567631B4D274EEF7D4B1A1770@MN2PR05MB7024.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(189003)(199004)(2906002)(478600001)(446003)(6116002)(3846002)(8676002)(91956017)(76116006)(99286004)(66476007)(66556008)(66946007)(186003)(64756008)(486006)(74316002)(66446008)(55016002)(2501003)(305945005)(7736002)(9686003)(476003)(33656002)(25786009)(14454004)(107886003)(26005)(6246003)(76176011)(86362001)(6506007)(52536014)(110136005)(316002)(102836004)(81166006)(4326008)(7696005)(8936002)(81156014)(66066001)(71200400001)(71190400001)(6436002)(53546011)(229853002)(5660300002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB7024;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KwZUHK1Y5nWDHuHUA1K5z90UbHEKaYAtxpL5HO6pgAe8hksBATp2NgzRSzFc5DHBrW/dfO0mhNwZdCS79PM3I4NlQga6+K2FYfFcWnCiI6Kv/gx2IPauM4du/fVE3JKanwWIRSVpdHZjqfb/fp1aw3bduoq/Z6KgtLty5OXeAev+ERCp8cJM3BFeuHgJyumXKjaJl8pS47B0yQul3NmnjpDyznnA2QyzpSaKod49cXzh4ajnuZTDtSRRTsq+PJN9wEmBIeJq1HjbPDiZfSfC62eX8+cIPOJG7Uz45cvjaU9fIS38lLy/RLHW697rDC3/5I3O2fi7cFkiX6+/CAL5BpEgA4l4YpUgLMbPrb51/6OOMBSCZNE25Om2irKJQtYqkyRvOpGPxd7hXNlFhorwj2hnRXjNnLr1BkINcv2HWfl9EgFxh9r9GosFo3GyD5U1
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 579b6278-391f-46c0-74f1-08d7676f46e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 12:53:12.3879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oe3x8gnDbT3P4jjeEXL3T5Vt4WZrx5pnd+RHY7emQfdzeOLvHjpsHQ/uY8vU1PG/6WgcrZT1TwoRyOk6OXF3Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB7024
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fu6Gg26GsvYTNxOFvbovAtWHSkXBZ9dhQLr2/LahuxY=;
 b=aSjsU8j6TlEPPZQQy6MAY9fi+lXX6XlgCAxQs3JM84eKX8gqWsyXBJ4Em3ogYdkoItHaSB/v+YVz1Hfk5BLkfUEcIOe0RddGqLAUs3XwInm+UePYDbRvhx3vNbwRbRzopIJm5srNOWB0L+pRDJ2zdpAkLsaqkwrB3EK6Vca5vO0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=thellstrom@vmware.com; 
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMS8xOSAyOjA1IFBNLCBFbWlsIFZlbGlrb3Ygd3JvdGU6Cj4gRnJvbTogRW1pbCBWZWxp
a292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPgo+IFdpdGggbGF0ZXIgY29tbWl0IHdl
J2xsIHJld29yayBEUk0gYXV0aGVudGljYXRpb24gaGFuZGxpbmcuIE5hbWVseQo+IERSTV9BVVRI
IHdpbGwgbm90IGJlIGEgcmVxdWlyZW1lbnQgZm9yIERSTV9SRU5ERVJfQUxMT1cgaW9jdGxzLgo+
Cj4gU2luY2Ugdm13Z2Z4IGRvZXMgaXNvbGF0aW9uIGZvciBwcmltYXJ5IGNsaWVudHMgaW4gZGlm
ZmVyZW50IG1hc3Rlcgo+IHJlYWxtcywgdGhlIERSTV9BVVRIIGNhbiBiZSBkcm9wcGVkLgo+Cj4g
VGhlIG9ubHkgcGxhY2Ugd2hlcmUgYXV0aGVudGljYXRpb24gbWF0dGVycywgaXMgc3VyZmFjZV9y
ZWZlcmVuY2UgaW9jdGxzCj4gd2hlbmV2ZXIgYSBsZWdhY3kgKG5vbi1wcmltZSkgaGFuZGxlIGlz
IHVzZWQuIEZvciB0aG9zZSBpb2N0bHMgd2UgY2FsbAo+IHZtd19zdXJmYWNlX2hhbmRsZV9yZWZl
cmVuY2UoKSwgd2hlcmUgd2UgZXhwbGljaXRseSBjaGVjayBpZiB0aGUgY2xpZW50Cj4gaXMgYm90
aCBhKSBtYXN0ZXIgYW5kIGIpIHVuYXV0aGVudGljYXRlZCAtIGJhaWxpbmcgb3V0IGFzIHJlc3Vs
dC4KPgo+IE90aGVyd2lzZSB0aGUgdXN1YWwgaXNvbGF0aW9uIHBhdGgga2lja3MgaW4gYW5kIHdl
J3JlIGFsbCBnb29kLgo+Cj4gdjI6IFJld29yZCBjb21taXQgbWVzc2FnZSwgc2luY2UgdGhlIGlz
b2xhdGlvbiB3b3JrIGhhcyBsYW5kZWQuCj4KPiBDYzogVk13YXJlIEdyYXBoaWNzIDxsaW51eC1n
cmFwaGljcy1tYWludGFpbmVyQHZtd2FyZS5jb20+Cj4gQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRo
ZWxsc3Ryb21Adm13YXJlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwu
dmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9zdXJmYWNlLmMgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZh
Y2UuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYwo+IGluZGV4IDFm
OTg5ZjM2MDVjOC4uNTk2ZTVjMWJjMmMxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92
bXdnZngvdm13Z2Z4X3N1cmZhY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X3N1cmZhY2UuYwo+IEBAIC05MzYsNiArOTM2LDEzIEBAIHZtd19zdXJmYWNlX2hhbmRsZV9y
ZWZlcmVuY2Uoc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdiwKPiAgCQl1c2VyX3NyZiA9IGNv
bnRhaW5lcl9vZihiYXNlLCBzdHJ1Y3Qgdm13X3VzZXJfc3VyZmFjZSwKPiAgCQkJCQlwcmltZS5i
YXNlKTsKPiAgCj4gKwkJLyogRXJyb3Igb3V0IGlmIHdlIGFyZSB1bmF1dGhlbnRpY2F0ZWQgbWFz
dGVyICovCgpTaG91bGRuJ3QgdGhpcyBiZSAiRXJyb3Igb3V0IGlmIHdlIGFyZSB1bmF1dGhlbnRp
Y2F0ZWQgcHJpbWFyeSIgPwoKT3RoZXJ3aXNlCgpSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHJv
bSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKCj4gKwkJaWYgKGRybV9pc19wcmltYXJ5X2NsaWVu
dChmaWxlX3ByaXYpICYmCj4gKwkJICAgICFmaWxlX3ByaXYtPmF1dGhlbnRpY2F0ZWQpIHsKPiAr
CQkJcmV0ID0gLUVBQ0NFUzsKPiArCQkJZ290byBvdXRfYmFkX3Jlc291cmNlOwo+ICsJCX0KPiAr
Cj4gIAkJLyoKPiAgCQkgKiBNYWtlIHN1cmUgdGhlIHN1cmZhY2UgY3JlYXRvciBoYXMgdGhlIHNh
bWUKPiAgCQkgKiBhdXRoZW50aWNhdGluZyBtYXN0ZXIsIG9yIGlzIGFscmVhZHkgcmVnaXN0ZXJl
ZCB3aXRoIHVzLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==

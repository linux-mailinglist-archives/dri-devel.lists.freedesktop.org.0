Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13F7F4F63
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 16:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10F26E0DF;
	Fri,  8 Nov 2019 15:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750070.outbound.protection.outlook.com [40.107.75.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AFF6E0DF
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 15:22:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjmeLq4yDeb7VLtMatIzY6eOiUqicsyyI5Ahcz0l4DV60kDoCV5sq/ZfD9kDJf0Nmos7EIKRExUXWoC8eDm07+sZHP4rg2PMWl93jgmNxhOAGJkxnG5Op0coQsn/yp1pWuDrSELukvogIOBLYa5LKVoyseNTY5dc4ly8CK/GFKYD/s3lHSPEsvhn/xcbfU1+D1uIlWoNCmqoTeXhB4YvXAbzA99ayxDxweruWY9yTmrW/3zyPnSKGcjvQifbJ5fWiEzpSBWBjuPGojKngy+u6KbTEVd9XXXAfnDUWbwZYLv0lFWHynouTw//XKRV57Geo7HrmK3MTsC1KSavh1ruiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxNEfINHnY+T7Yb0uy+jRB0LmMJHFOSZSAXqnKn2iYc=;
 b=nT/eOBZZOCF9ftKighgmzWSIamHkt8jZeli2kZCmBRXb5M4XkR0gnuUcBm5pKWyUAJoxPEVwdKJ9PLII+ehus0l5Z+MdZ/1L1ZIQR2v6qN8mKo+bM1pwA7m5BNU2psQRctAxE5pB9xmf4ySY3YpdSkid2mYQyYmo8zslFpReAy5Iwc7rinkPbcQ5qhvMUlaNghZekGYJIaCEFZwBEf1+9Juj9LLZC+93+JsMAddQRsXlyREmlsZQRmbVrdFMejImJyI2lOQPQ2tDLPhghXMh2sgYEd20kJGWa+0hPemuLgzxVG46dkZMD6qXF21Tt0iLCv2eglHBl2HCHaMprx5xRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6383.namprd05.prod.outlook.com (20.178.245.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.17; Fri, 8 Nov 2019 15:22:02 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::fc6c:1ed8:d63d:4dc8]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::fc6c:1ed8:d63d:4dc8%5]) with mapi id 15.20.2430.023; Fri, 8 Nov 2019
 15:22:02 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, ML dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/vmwgfx: move the require_exist handling together
Thread-Topic: [PATCH 1/5] drm/vmwgfx: move the require_exist handling together
Thread-Index: AQHVkLT+kOwTgFFLGEu4haQ76rpHjw==
Date: Fri, 8 Nov 2019 15:22:01 +0000
Message-ID: <MN2PR05MB6141523C5D058B3AC345408CA17B0@MN2PR05MB6141.namprd05.prod.outlook.com>
References: <20191101130313.8862-1-emil.l.velikov@gmail.com>
 <CACvgo53BpkBLVic3v7UbcLS94PKyd8a+9cSd+4ttdRJD8+i99A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9474d9b8-7fd1-4877-2ea9-08d7645f67b0
x-ms-traffictypediagnostic: MN2PR05MB6383:|MN2PR05MB6383:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB638365300BF46F89445EFB5CA17B0@MN2PR05MB6383.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0215D7173F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(376002)(39860400002)(366004)(396003)(136003)(346002)(199004)(189003)(476003)(25786009)(6436002)(91956017)(26005)(110136005)(9686003)(55016002)(52536014)(33656002)(186003)(76116006)(66066001)(53546011)(6116002)(3846002)(71200400001)(71190400001)(6506007)(8676002)(2906002)(256004)(7696005)(316002)(305945005)(8936002)(102836004)(86362001)(76176011)(486006)(5660300002)(14454004)(6246003)(229853002)(81156014)(99286004)(107886003)(66946007)(478600001)(446003)(81166006)(74316002)(66556008)(64756008)(66476007)(66446008)(4326008)(7736002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6383;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WmHRDiYkQADoei+OtotBvHDSZqb1PaezNEhQPw+0wCvLNT+fHWnDShFS7Mos3oUp6cyPGARf8i+OmmC5vCbbwXCE8nAMLkA4pAnWuaAiN2Dn4XP/wxWxcNQjd+zkuNO+HqGyo+ZqLD2uS4vdFrhIMC4dwfr3aaUoDuS2xCqpu1IRJySOdjEhoTGp90lcZZmurdPa7eSTlTaBiNNoEhrkhZPKp2lDCavsJ3wieXI8p9L8az5u42qVBGRHvOeRRBALh+y7gOpuVY2UKcwwnNnp/VkyWfVw4PuDD1Wd/SYGc4fbu2YyCGpCkgqu+TIbPJwE+DFUQyYFqqOk+PbB448HWhqBFgy5Y25joMcPr2/m+qeYVejDKKB5ppjUtZjCdOySspyvqxEbWHWvMFTQVvXZs/BkJUx3Quft36TwD2Vhi/XWQuIXO5sT30Ha9mibHF8N
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9474d9b8-7fd1-4877-2ea9-08d7645f67b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2019 15:22:01.8445 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XbCXU8pT22aPFCzTSKX9dry/LvDNr3mqmKJ3Q1hfOuqQOZb2NnFAkZX7GUrr3I6fz9/AasIheir4e+fyfbzG2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6383
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxNEfINHnY+T7Yb0uy+jRB0LmMJHFOSZSAXqnKn2iYc=;
 b=LVGaCCkmR6G0jLd6tp7KoRhD59Ffh6aTpiDJOkykyZE+u4jpELEKaTLJ39e9CLZ9fK98VUEP8P1UUMrHelYv1dNstKYNnZ5PHMHZpR+AQyp06CpWUR/Zi131mUvBhg6CX5Rz7cE1JmnsJIJKl0IKRZhOUNtj0DxTfQZgpPAQAhI=
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

SGksIEVtaWwhCgpPbiAxMS84LzE5IDI6MTQgUE0sIEVtaWwgVmVsaWtvdiB3cm90ZToKPiBPbiBG
cmksIDEgTm92IDIwMTkgYXQgMTM6MDUsIEVtaWwgVmVsaWtvdiA8ZW1pbC5sLnZlbGlrb3ZAZ21h
aWwuY29tPiB3cm90ZToKPj4gRnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFi
b3JhLmNvbT4KPj4KPj4gTW92ZSB0aGUgcmVuZGVyX2NsaWVudCBodW5rIGZvciByZXF1aXJlX2V4
aXN0IGFsb25nc2lkZSB0aGUgcmVzdC4KPj4gS2VlcGluZyBhbGwgdGhlIHJlYXNvbnMgd2h5IGFu
IGV4aXN0aW5nIG9iamVjdCBpcyBuZWVkZWQsIGluIGEgc2luZ2xlCj4+IHBsYWNlIG1ha2VzIGl0
IGVhc2llciB0byBmb2xsb3cuCj4+Cj4+IENjOiBWTXdhcmUgR3JhcGhpY3MgPGxpbnV4LWdyYXBo
aWNzLW1haW50YWluZXJAdm13YXJlLmNvbT4KPj4gQ2M6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxs
c3Ryb21Adm13YXJlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZl
bGlrb3ZAY29sbGFib3JhLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9zdXJmYWNlLmMgfCA5ICsrKysrLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X3N1cmZhY2UuYwo+PiBpbmRleCAyOWQ4Nzk0ZjA0MjEuLjFmOTg5ZjM2MDVjOCAxMDA2NDQKPj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3VyZmFjZS5jCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYwo+PiBAQCAtOTA5LDE2ICs5MDks
MTIgQEAgdm13X3N1cmZhY2VfaGFuZGxlX3JlZmVyZW5jZShzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRl
dl9wcml2LAo+PiAgICAgICAgIHVpbnQzMl90IGhhbmRsZTsKPj4gICAgICAgICBzdHJ1Y3QgdHRt
X2Jhc2Vfb2JqZWN0ICpiYXNlOwo+PiAgICAgICAgIGludCByZXQ7Cj4+IC0gICAgICAgYm9vbCBy
ZXF1aXJlX2V4aXN0ID0gZmFsc2U7Cj4+Cj4+ICAgICAgICAgaWYgKGhhbmRsZV90eXBlID09IERS
TV9WTVdfSEFORExFX1BSSU1FKSB7Cj4+ICAgICAgICAgICAgICAgICByZXQgPSB0dG1fcHJpbWVf
ZmRfdG9faGFuZGxlKHRmaWxlLCB1X2hhbmRsZSwgJmhhbmRsZSk7Cj4+ICAgICAgICAgICAgICAg
ICBpZiAodW5saWtlbHkocmV0ICE9IDApKQo+PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gcmV0Owo+PiAgICAgICAgIH0gZWxzZSB7Cj4+IC0gICAgICAgICAgICAgICBpZiAodW5saWtl
bHkoZHJtX2lzX3JlbmRlcl9jbGllbnQoZmlsZV9wcml2KSkpCj4+IC0gICAgICAgICAgICAgICAg
ICAgICAgIHJlcXVpcmVfZXhpc3QgPSB0cnVlOwo+PiAtCj4+ICAgICAgICAgICAgICAgICBoYW5k
bGUgPSB1X2hhbmRsZTsKPj4gICAgICAgICB9Cj4+Cj4+IEBAIC05MzUsNiArOTMxLDggQEAgdm13
X3N1cmZhY2VfaGFuZGxlX3JlZmVyZW5jZShzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9wcml2LAo+
PiAgICAgICAgIH0KPj4KPj4gICAgICAgICBpZiAoaGFuZGxlX3R5cGUgIT0gRFJNX1ZNV19IQU5E
TEVfUFJJTUUpIHsKPj4gKyAgICAgICAgICAgICAgIGJvb2wgcmVxdWlyZV9leGlzdCA9IGZhbHNl
Owo+PiArCj4+ICAgICAgICAgICAgICAgICB1c2VyX3NyZiA9IGNvbnRhaW5lcl9vZihiYXNlLCBz
dHJ1Y3Qgdm13X3VzZXJfc3VyZmFjZSwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHByaW1lLmJhc2UpOwo+Pgo+PiBAQCAtOTQ2LDYgKzk0NCw5IEBAIHZtd19zdXJm
YWNlX2hhbmRsZV9yZWZlcmVuY2Uoc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdiwKPj4gICAg
ICAgICAgICAgICAgICAgICB1c2VyX3NyZi0+bWFzdGVyICE9IGZpbGVfcHJpdi0+bWFzdGVyKQo+
PiAgICAgICAgICAgICAgICAgICAgICAgICByZXF1aXJlX2V4aXN0ID0gdHJ1ZTsKPj4KPj4gKyAg
ICAgICAgICAgICAgIGlmICh1bmxpa2VseShkcm1faXNfcmVuZGVyX2NsaWVudChmaWxlX3ByaXYp
KSkKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVxdWlyZV9leGlzdCA9IHRydWU7Cj4+ICsK
Pj4gICAgICAgICAgICAgICAgIHJldCA9IHR0bV9yZWZfb2JqZWN0X2FkZCh0ZmlsZSwgYmFzZSwg
VFRNX1JFRl9VU0FHRSwgTlVMTCwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICByZXF1aXJlX2V4aXN0KTsKPj4gICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseShy
ZXQgIT0gMCkpIHsKPj4gLS0KPiBUaG9tYXMsIFZNd2FyZSBkZXZzLCBodW1ibGUgcG9rZT8KPiBB
bnkgY29tbWVudHMgYW5kIHJldmlldyB3b3VsZCBiZSBhcHByZWNpYXRlZC4KPgo+IFRoYW5rcwo+
IEVtaWwKPgpTb3JyeSwgSSdsbCBsb29rIGF0IHRoaXMgZWFybHkgbW9uZGF5LgoKVGhhbmtzLAoK
VGhvbWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

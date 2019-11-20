Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E2E103B9E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 14:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EDA76E96B;
	Wed, 20 Nov 2019 13:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820081.outbound.protection.outlook.com [40.107.82.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F319F6E96B
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2019 13:36:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UzF1G0sKH7WxzRD1yOHrVXVBJc2S986t/2FSOtjXWnk5gfyl/ZkJqygunnwnz9lt5bJxIlrTa0OzqcfkpygOA9nF5V+VCI99ld9sxHAjzfdf29BytNlXDghBUCzjjsOvfC4Ys/z6Dl7npB5ewZeBBecQO/zZ2di0CS6V9ZjAjBS6vC+IWf1ZqjjDOd8+YhgNUgID/iWpLycHKHlzrBHBj3PUJIVogkiAKu0qgi9BxoF2YB6OFr5pzYnoDApZat0k/j3FvOKgTYYXBBLohsVyxC3aGaYnzoVckwrgbJAKS0jKg/0RvgCjqfEze0+RqFspMzujdBCkuhV08pi2N3FOtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40fZqnsExyKgQk4ihHJcFUOk6x3jDcBvQ0M32NHCNXI=;
 b=R/PwhqjeiLCfWDpJtgn4q5mRgDR3K7JxRAcmiwHb9aZOrVd6NF/Ain0C2Extj0xuABUXeUlbQLGEq8yJCHUlESZMFpm0K+spSJ6nZ7QUSgf6Y7Y+k9aQtabMQSM0bWEacwdhvnrC3GupDYUAJ+IJeqx6suQaGMaA6W03L8McXCz3X2gk/K7Lab2UdB80v/3CKqGQVcUcaFfDl1Re2WC3U0psi7Z7teR0Cv33xWRNsh8GvFer0JUZ9fAtxzGVz5qT3i1e75YMWZB9857e2NGjWlQnlntr86AAq1OInoqfChtCNufhuED9SDiT/4Hn766f0Kq7w1OTwTzF9yYm7j5+2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6446.namprd05.prod.outlook.com (20.178.247.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.13; Wed, 20 Nov 2019 13:36:05 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::fc6c:1ed8:d63d:4dc8]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::fc6c:1ed8:d63d:4dc8%5]) with mapi id 15.20.2474.018; Wed, 20 Nov 2019
 13:36:04 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Daniel
 Vetter <daniel.vetter@ffwll.ch>
Subject: Re: locking&resource refcounting for ttm_bo_kmap/dma_buf_vmap
Thread-Topic: locking&resource refcounting for ttm_bo_kmap/dma_buf_vmap
Thread-Index: AQHVn5hb28iD/bZSdE2i+kjxV6kMdA==
Date: Wed, 20 Nov 2019 13:36:03 +0000
Message-ID: <MN2PR05MB6141D43F409C10C24DDEC6B7A14F0@MN2PR05MB6141.namprd05.prod.outlook.com>
References: <CAKMK7uHagBk6nGKenWZfd-ufb0h=WjzDVhctJyZ7g0Pi+H0+5Q@mail.gmail.com>
 <6540938e-b555-82c9-28e5-bbef3741863a@amd.com>
 <CAKMK7uEB9AqObaURdi8KdVBnwi8bWsmzZZ1WnSugutd4Zo0L0Q@mail.gmail.com>
 <CAKMK7uG5FXtVqMoDZPd_MwLpONgxeSEudnCM_zdTLmqz1bJtDw@mail.gmail.com>
 <151e7f35-6e47-ca6e-7ca3-9f617c1addbe@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5783e005-6026-44e2-78d4-08d76dbe9714
x-ms-traffictypediagnostic: MN2PR05MB6446:
x-microsoft-antispam-prvs: <MN2PR05MB6446FF0F88B6536398022E49A14F0@MN2PR05MB6446.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02272225C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(189003)(199004)(486006)(6506007)(99286004)(66574012)(53546011)(7696005)(256004)(14444005)(76176011)(478600001)(71200400001)(71190400001)(5024004)(54906003)(110136005)(5660300002)(26005)(316002)(446003)(102836004)(6116002)(3846002)(186003)(476003)(52536014)(6246003)(6436002)(14454004)(55016002)(9686003)(2906002)(74316002)(86362001)(33656002)(25786009)(66066001)(66946007)(64756008)(76116006)(66556008)(66476007)(66446008)(91956017)(305945005)(7736002)(81156014)(81166006)(8676002)(8936002)(4326008)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6446;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bd4/RL+RHa4iXi8KE6dlugR7bMzNnjSPI7lDvZcSo1reMY7TR+BWxPO5Wim42DnNxp8YWCzJAhdn9CwSVkOfGTxdskMh5keywrciyIAO2ss40s7FP9m4A25KDZrAMu9Uy0lZOszAQbKG5my8z2BbvlDokDRX6K1pXFrg3A4Mwj3t+AibwcDSEXFsvcUpMXWwe5M7amt1s6Zqgf8Ik0OMgscsVBLcS0Qh7lzkNnHjm0RQ5BhZZZG0rWhJlTNIJ+19xeBbVEmXnnA6YOD40lEJRgNmTZdC4EEnlyCwZ6LBb5Rmu3FKKF+3P5DBNxhJjMpIOZLOBUt/Hc249JSsrCTSeeY9Z8hz4aAWSl2yhSR8DBJfUf8uyLXinpxdtpSTJaBglepvgwXbfTfDBAnbZPbSt+ftpdLWoq08QiD6CxLewZv6SgFwH2ziMrQpAAtnH814
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5783e005-6026-44e2-78d4-08d76dbe9714
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2019 13:36:03.9790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7WIWgwJBJ6JCR+d+fEr+a8S+X8YuKeeoTYHaO5742raSjaSmFUYL/hta04pNO13urXdglscvu/eticoiRBxarQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6446
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=40fZqnsExyKgQk4ihHJcFUOk6x3jDcBvQ0M32NHCNXI=;
 b=F2wSL4LYI9KxVnzOvnH0Ij2IWjoPEKn/32ssxm6nLm+yssDgSmX//eDocZAPGM8d4u2CJSEwYR+A33yNGElKikh3KK6q4J6XjrViMtPV+VWBxl+4VLsMMEK7NOTTzs89slFm3m8YnGWoeGmMyjytcgBSwPZdw4k68X3MtjattPE=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMjAvMTkgMToyNCBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAyMC4xMS4x
OSB1bSAxMzoxOSBzY2hyaWViIERhbmllbCBWZXR0ZXI6Cj4+IE9uIFdlZCwgTm92IDIwLCAyMDE5
IGF0IDE6MDkgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4gd3JvdGU6
Cj4+PiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAxOjAyIFBNIENocmlzdGlhbiBLw7ZuaWcKPj4+
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+IHdyb3RlOgo+Pj4+PiBXaGF0IGFtIEkgbWlzc2lu
Zz8KPj4+PiBUaGUgYXNzdW1wdGlvbiBpcyB0aGF0IHdoZW4geW91IHdhbnQgdG8gY3JlYXRlIGEg
dm1hcCBvZiBhIERNQS1idWYKPj4+PiBidWZmZXIgdGhlIGJ1ZmZlciBuZWVkcyB0byBiZSBwaW5u
ZWQgc29tZWhvdy4KPj4+Pgo+Pj4+IEUuZy4gd2l0aG91dCBkeW5hbWljIGRtYS1idWYgaGFuZGxp
bmcgeW91IHdvdWxkIG5lZWQgdG8gaGF2ZSBhbiBhY3RpdmUKPj4+PiBhdHRhY2htZW50LiBXaXRo
IGR5bmFtaWMgaGFuZGxpbmcgdGhlIHJlcXVpcmVtZW50cyBjb3VsZCBiZSBsb3dlcmVkIHRvCj4+
Pj4gdXNpbmcgdGhlIHBpbigpL3VucGluKCkgY2FsbGJhY2tzLgo+Pj4gWWVhaCByaWdodCBub3cg
ZXZlcnlvbmUgc2VlbXMgdG8gaGF2ZSBhbiBhdHRhY2htZW50LCBhbmQgdGhhdCdzIGhvdyB3ZQo+
Pj4gZ2V0IGF3YXkgd2l0aCBhbGwgdGhpcy4gQnV0IHRoZSBpbnRlcmZhY2UgaXNuJ3Qgc3VwcG9z
ZWQgdG8gd29yayBsaWtlCj4+PiB0aGF0LCBkbWFfYnVmX3ZtYXAvdW5tYXAgaXMgc3VwcG9zZWQg
dG8gYmUgYSBzdGFuZC1hbG9uZSB0aGluZyAoeW91Cj4+PiBjYW4gY2FsbCBpdCBkaXJlY3RseSBv
biB0aGUgc3RydWN0IGRtYV9idWYsIG5vIG5lZWQgZm9yIGFuCj4+PiBhdHRhY2htZW50KS4gQWxz
byBJIGRvbid0IHRoaW5rIG5vbi1keW5hbWljIGRyaXZlcnMgc2hvdWxkIGV2ZXIgY2FsbAo+Pj4g
cGluL3VucGluLCBub3QgdGhlaXIgam9iLCBob2xkaW5nIG9udG8gYSBtYXBwaW5nIHNob3VsZCBi
ZSBlbm91Z2ggdG8KPj4+IGdldCB0aGluZ3MgcGlubmVkLgo+Pj4KPj4+PiBZb3UgYWxzbyBjYW4n
dCBsb2NrL3VubG9jayBpbnNpZGUgeW91ciB2bWFwIGNhbGxiYWNrIGJlY2F1c2UgeW91IGRvbid0
Cj4+Pj4gaGF2ZSBhbnkgZ3VhcmFudGVlIHRoYXQgdGhlIHBvaW50ZXIgc3RheXMgdmFsaWQgYXMg
c29vbiBhcyB5b3VyIGRyb3AKPj4+PiB5b3VyIGxvY2suCj4+PiBXZWxsIHRoYXQncyB3aHkgSSBh
c2tlZCB3aGVyZSB0aGUgcGluL3VucGluIHBhaXIgaXMuIElmIHlvdSBsb2NrJnBpbiwKPj4+IHRo
ZW4geW91IGRvIGtub3cgdGhhdCB0aGUgcG9pbnRlciB3aWxsIHN0YXkgYXJvdW5kLiBCdXQgbG9v
a3MgbGlrZSB0aGUKPj4+IG9yaWdpbmFsIHBhdGNoIGZyb20gRGF2ZSBmb3IgdHRtIGJhc2VkIGRy
aXZlcnMgcGxheWVkIGZhc3QmbG9vc2UgaGVyZQo+Pj4gd2l0aCB3aGF0IHNob3VsZCBiZSBkb25l
Lgo+Pj4KPj4+PiBCVFc6IFdoYXQgaXMgdm1hcCgpIHN0aWxsIHVzZWQgZm9yPwo+Pj4gdWRsLCBi
dW5jaCBvZiBvdGhlciB0aGluZ3MgKGUuZy4gYnVuY2ggb2YgdGlueSBkcml2ZXJzKS4gTm90IG11
Y2gsIGJ1dAo+Pj4gbm90IHN0dWZmIHdlIGNhbiBkcm9wLgo+PiBJZiB3ZSdyZSB1bmx1Y2t5IHdl
J2xsIGFjdHVhbGx5IGhhdmUgYSBwcm9ibGVtIHdpdGggdGhlc2Ugbm93LiBGb3IKPj4gc29tZSBv
ZiB0aGVzZSB0aGUgYXR0YWNoZWQgZGV2aWNlIGlzIG5vdCBkbWEtY2FwYWJsZSwgc28gZG1hX21h
cF9zZwo+PiB3aWxsIGdvIGJvb20uIFdpdGggdGhlIGNhY2hlZCBtYXBwaW5nIGxvZ2ljIHdlIG5v
dyBoYXZlIHRoaXMgbWlnaHQgZ28KPj4gc2lkZXdheXMgZm9yIGR5bmFtaWMgZXhwb3J0ZXJzLiBE
aWQgeW91IHRlc3QgeW91ciBkeW5hbWljIGRtYS1idWYKPj4gc3VwcG9ydCBmb3IgYW1kZ3B1IHdp
dGggdWRsPwo+IFNob3J0IGFuc3dlciBubywgbm90IGF0IGFsbC4gTG9uZyBvbmU6IFdoYXQgdGhl
IGhlY2sgaXMgdWRsPyBBbmQgaG93IGlzIAo+IGl0IG5vdCBkbWEtY2FwYWJsZT8KPgo+PiBXb3Jz
dCBjYXNlIHdlIG5lZWQgdG8gZ2V0IHJpZCBvZiB0aGUgZmFrZQo+PiBhdHRhY2htZW50LCBmaXgg
dGhlIHZtYXAgbG9ja2luZy9waW5uaW5nLCBhbmQgbWF5YmUgc29tZSBtb3JlCj4+IGhlYWRhY2hl
cyB0byBzb3J0IHRoaXMgb3V0Lgo+IFdlbGwgb2YgaGFuZCB3ZSBjb3VsZCByZXF1aXJlIHRoYXQg
dm1hcCB3aWxsIGFsc28gcGluIGEgRE1BLWJ1ZiBhbmQgCj4gc3RhcnQgZml4aW5nIGFtZ3B1L25v
dXZlYXUvcmFkZW9uL3F4bC4KClBlcmhhcHMgd2l0aCBkeW5hbWljIGRtYS1idWZzIGl0IG1pZ2h0
IGJlIHBvc3NpYmxlIHRvIGRvIHNvbWV0aGluZwpzaW1pbGFyIHRvIHZtd2dmeCAoYW5kIHJlY2Vu
dGx5IG90aGVyPykgZmJkZXY6CgpUaGUgbWFwIGlzIGNhY2hlZCwgYnV0IG1heSBiZSBpbnZhbGlk
YXRlZCBhcyBzb29uIGFzIHdlIHJlbGVhc2UgZG1hX3Jlc3YKLyB1bnBpbi4gKG1vdmVfbm90aWZ5
KCkgdW5tYXBzIGlmIG5lZWRlZCkuCgpTbyBlYWNoIHRpbWUgaXQncyBuZWVkZWQgd2UgbWFrZSBz
dXJlIHdlJ3JlIGxvY2tlZCAvIHBpbm5lZCBhbmQgdGhlbgpjYWxsIGEgbWFwX3ZhbGlkYXRlKCkg
ZnVuY3Rpb24uIFR5cGljYWxseSB0aGUgbWFwIGlzIHN0aWxsIGFyb3VuZC4gSWYgaXQKaXNuJ3Qs
IHRoZSBtYXBfdmFsaWRhdGUoKSBmdW5jdGlvbiBzZXRzIGl0IHVwIGFnYWluLgoKU2F2ZXMgYSBi
dW5jaCBvZiB2bWFwKCkgY2FsbHMgb3IgdGhlIG5lZWQgZm9yIHBlcnNpc3RlbnQgcGlubmluZyBm
b3IKcGVyZm9ybWFuY2UgcmVhc29ucy4KCi9UaG9tYXMKCgoKCj4KPiBDaHJpc3RpYW4uCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

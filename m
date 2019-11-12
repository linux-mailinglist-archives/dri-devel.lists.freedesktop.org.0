Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C11DFF8FF0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 13:50:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EA5B6E462;
	Tue, 12 Nov 2019 12:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750054.outbound.protection.outlook.com [40.107.75.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183EA6E425
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 12:50:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtgOk4jlr4f8FFyCAm3xdgrzFkCQkw9wE19furydi/SR0Ai1AXJINSTUup2KhzHUVrmGJAIWAWVL53f+ZSz9ATmBoZWy2tzDhblmWHFxSvzFWZntfCm2iHI8LSw2MFQ70Z5MKlaTrRLtgd919OypJ2rT4UWk5SEiW0puSbRDmr/ylmhRllr6w79fuqawkmhjxuRweS7JgbcVFJsG0Po+FByPRjBOJKlUmBHeJM9RkAZCs2SwQMdwa38B2uAyCqfRD92QnUEhyYkH+vBQqvYllESmadf7VEKlQrlRD9OENrm1D1x0H1EDoS5Kpr4wRYADNMqwKZ6NCDzefWBGgXO/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bctQQ4kXFCm+LiIbhJWaBBcG4d3YWmGWCGi8vXWW5nA=;
 b=Yk66Ik9ezkEmp4yJlS7bpd1WsmPDpKLDshIo4ngn00EW7fn8kK3niXJ3mqR6QgLIRRRBtnAgO+MnxtJ+yrlfHXUgMSMAK5ChCcSWZ7/+svECIyx8QnEOGo04amhTLEFkJCWOamRmGu5h1LelSd5bN1RG8r16zEbehS68xLd2Ka4Qc/wIvjhcgxkndig59QZ/JP/013KhVEZpS1VP2FqJJ7VJ5TUg3GKTqSrUiIbjtdO9hBp9bRDxhotYR9TtcHXM7OQ7QYMMDauPa8Q+fV0EwCFDS/7OK/nYEVWbyRbpvUfJdT9SDlyLid/0IZOedQOfp1KkzYVUaOcAK0PhZ7TnPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6622.namprd05.prod.outlook.com (20.178.246.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.21; Tue, 12 Nov 2019 12:50:08 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::fc6c:1ed8:d63d:4dc8]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::fc6c:1ed8:d63d:4dc8%5]) with mapi id 15.20.2451.023; Tue, 12 Nov 2019
 12:50:08 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: Emil Velikov <emil.l.velikov@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/5] drm/vmwgfx: move the require_exist handling together
Thread-Topic: [PATCH 1/5] drm/vmwgfx: move the require_exist handling together
Thread-Index: AQHVkLT+kOwTgFFLGEu4haQ76rpHjw==
Date: Tue, 12 Nov 2019 12:50:08 +0000
Message-ID: <MN2PR05MB6141CD79A8030FBEC9A8A472A1770@MN2PR05MB6141.namprd05.prod.outlook.com>
References: <20191101130313.8862-1-emil.l.velikov@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22ab4374-8300-4b94-b96c-08d7676ed922
x-ms-traffictypediagnostic: MN2PR05MB6622:|MN2PR05MB6622:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR05MB66220A417F6ADBA1C3F447A6A1770@MN2PR05MB6622.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(366004)(39860400002)(199004)(189003)(81166006)(86362001)(305945005)(66476007)(74316002)(7736002)(3846002)(66066001)(110136005)(14454004)(316002)(446003)(2501003)(81156014)(486006)(6116002)(8936002)(478600001)(2906002)(476003)(71190400001)(71200400001)(4326008)(8676002)(66446008)(25786009)(186003)(107886003)(256004)(64756008)(102836004)(6246003)(99286004)(33656002)(229853002)(52536014)(91956017)(76116006)(9686003)(5660300002)(26005)(76176011)(66556008)(6436002)(66946007)(53546011)(7696005)(6506007)(55016002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6622;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VNOLpYl7wa+V4nln9pSytfQ3RRPc7Zau7IC+KQmO1CMbpiyB+AdDcTDEQ571d6rSW+m79TOlhRqF46XRg0qE61DgQO+6nC5cZURIfRs9kP/TXaNvdZpTPUh+EiBS3qSGUw1WSSK1hufZc/4MhjgHnr0VJHJ3WuMVpmn114CNTN+Gy1MqAWELMaFR/sbvjGCpQ+v9woyTK/L0piEs0QrAHeWtX43xJzG8i01wSQZCVUHHVWFYX9DK4PO+1ZO+9FazMD9Q3u1SfTzcTxO50aWKyYb7QNHtbJHJEgSeRdZ1ynIwWaoicVi3EyxOaHda89nfnzmOQhme3OlPZm2XR2SohJZnWkthEa9cLDbX+bZVcB9ha37T3ykAA7H4UHYzi9omkHEZYinSKNDIM9lwSbkqOVtTeN5HMq8+hAdlu2XFHeslEpJYOGSIasL0oZLKnSmH
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ab4374-8300-4b94-b96c-08d7676ed922
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 12:50:08.1920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mut1VsefKgJwsJHVzjYbEzOGedGH74G+9BbWBUIFUNg41xcfG+1EPG1qDr9j1oUixNjokrx/sGIr1/L/OFKzUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6622
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bctQQ4kXFCm+LiIbhJWaBBcG4d3YWmGWCGi8vXWW5nA=;
 b=0oJl1SppXmKTquAU2i1jqXj72F7iOCm1zXII5xCoDE0E4DSdB5Fs+wHmkp2O0hVGyIaWgMEolZ7TnEOC0VImtpPIipMEiaiBHSxk7oKFVng0HJG2Yuzp3IZWYj/PD0+tHvVcx2g+bOzdEZMqaDNa3mnhP0HTXbJq1egVUIZwMVs=
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
a292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPgo+IE1vdmUgdGhlIHJlbmRlcl9jbGll
bnQgaHVuayBmb3IgcmVxdWlyZV9leGlzdCBhbG9uZ3NpZGUgdGhlIHJlc3QuCj4gS2VlcGluZyBh
bGwgdGhlIHJlYXNvbnMgd2h5IGFuIGV4aXN0aW5nIG9iamVjdCBpcyBuZWVkZWQsIGluIGEgc2lu
Z2xlCj4gcGxhY2UgbWFrZXMgaXQgZWFzaWVyIHRvIGZvbGxvdy4KPgo+IENjOiBWTXdhcmUgR3Jh
cGhpY3MgPGxpbnV4LWdyYXBoaWNzLW1haW50YWluZXJAdm13YXJlLmNvbT4KPiBDYzogVGhvbWFz
IEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEVtaWwg
VmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS92bXdnZngvdm13Z2Z4X3N1cmZhY2UuYyB8IDkgKysrKystLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3VyZmFjZS5jIGIvZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfc3VyZmFjZS5jCj4gaW5kZXggMjlkODc5NGYwNDIxLi4xZjk4OWYzNjA1Yzgg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3VyZmFjZS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfc3VyZmFjZS5jCj4gQEAgLTkwOSwx
NiArOTA5LDEyIEBAIHZtd19zdXJmYWNlX2hhbmRsZV9yZWZlcmVuY2Uoc3RydWN0IHZtd19wcml2
YXRlICpkZXZfcHJpdiwKPiAgCXVpbnQzMl90IGhhbmRsZTsKPiAgCXN0cnVjdCB0dG1fYmFzZV9v
YmplY3QgKmJhc2U7Cj4gIAlpbnQgcmV0Owo+IC0JYm9vbCByZXF1aXJlX2V4aXN0ID0gZmFsc2U7
Cj4gIAo+ICAJaWYgKGhhbmRsZV90eXBlID09IERSTV9WTVdfSEFORExFX1BSSU1FKSB7Cj4gIAkJ
cmV0ID0gdHRtX3ByaW1lX2ZkX3RvX2hhbmRsZSh0ZmlsZSwgdV9oYW5kbGUsICZoYW5kbGUpOwo+
ICAJCWlmICh1bmxpa2VseShyZXQgIT0gMCkpCj4gIAkJCXJldHVybiByZXQ7Cj4gIAl9IGVsc2Ug
ewo+IC0JCWlmICh1bmxpa2VseShkcm1faXNfcmVuZGVyX2NsaWVudChmaWxlX3ByaXYpKSkKPiAt
CQkJcmVxdWlyZV9leGlzdCA9IHRydWU7Cj4gLQo+ICAJCWhhbmRsZSA9IHVfaGFuZGxlOwo+ICAJ
fQo+ICAKPiBAQCAtOTM1LDYgKzkzMSw4IEBAIHZtd19zdXJmYWNlX2hhbmRsZV9yZWZlcmVuY2Uo
c3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdiwKPiAgCX0KPiAgCj4gIAlpZiAoaGFuZGxlX3R5
cGUgIT0gRFJNX1ZNV19IQU5ETEVfUFJJTUUpIHsKPiArCQlib29sIHJlcXVpcmVfZXhpc3QgPSBm
YWxzZTsKPiArCj4gIAkJdXNlcl9zcmYgPSBjb250YWluZXJfb2YoYmFzZSwgc3RydWN0IHZtd191
c2VyX3N1cmZhY2UsCj4gIAkJCQkJcHJpbWUuYmFzZSk7Cj4gIAo+IEBAIC05NDYsNiArOTQ0LDkg
QEAgdm13X3N1cmZhY2VfaGFuZGxlX3JlZmVyZW5jZShzdHJ1Y3Qgdm13X3ByaXZhdGUgKmRldl9w
cml2LAo+ICAJCSAgICB1c2VyX3NyZi0+bWFzdGVyICE9IGZpbGVfcHJpdi0+bWFzdGVyKQo+ICAJ
CQlyZXF1aXJlX2V4aXN0ID0gdHJ1ZTsKPiAgCj4gKwkJaWYgKHVubGlrZWx5KGRybV9pc19yZW5k
ZXJfY2xpZW50KGZpbGVfcHJpdikpKQo+ICsJCQlyZXF1aXJlX2V4aXN0ID0gdHJ1ZTsKPiArCj4g
IAkJcmV0ID0gdHRtX3JlZl9vYmplY3RfYWRkKHRmaWxlLCBiYXNlLCBUVE1fUkVGX1VTQUdFLCBO
VUxMLAo+ICAJCQkJCSByZXF1aXJlX2V4aXN0KTsKPiAgCQlpZiAodW5saWtlbHkocmV0ICE9IDAp
KSB7CgpSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29t
PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7340518F7BF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B8D89CAF;
	Mon, 23 Mar 2020 14:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90E9A89CAF
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:53:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRksn1ATYp4BFGgZpIZff3jzfTzzXwlfU+tsbaLVVjpZUw1H8VAIuu+XAoHjJ8obqRkTes5xH91bQFYNQH/m/iYIdzASv9AQx1ONOEU0/yiwhFHo2iIojy6cMk29zsGZuoOwmbnXUKQiV+5QDMxcQTebXaMvTn8oAEKfvaKZjajflU1hYNnCUD6QoHTNwrpCpQStZHgpMSGr6y2QmbDJcvMluSUYl5xJuXyNJM8kovPHqXm7DASDJ8aUOX7BLb7IKaX6mGPTw6U0yYbZQI60YxJidUexvs/53uk5RLmEsUmLUeSiOI5cP2iSX+LXuq4vIRsn9CXUNAjW0qk8CiaUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqeyF0W1XzHeUhvsRqLHj2G3FEm1oMV2/dRi3QKRvbM=;
 b=QmxhVRUwv0SKjtCIy6qp1oUP5iufwArKjdRUdRE7wrGvkxiZz7lu+a8jll0lyAg/VuiJLPJs8BRX6yqbnwpUVbdcAXDGrnScRs72qmvSv2V4u1teJAKdIsiB7V7t7YxMG1kKPTHXIOKUxvVYkYF0LCSpyoyS4pudKW6rwpxZz6xj6D5uQHzAIoffGW4pRYUOGX4vT5FaqXOVvfG8bqleQxNno11CyMmNcH/4LLQTL1K7MeB0cPtnBe39cq1PwE4JRwtfteoDRJv/ij3b4tyAbrsSLGnIePCRJmoNSSN2XHZ1ja+15MXLUZ9Pkl8CibwK3uVjzGy0KiufrZrJtyAx1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqeyF0W1XzHeUhvsRqLHj2G3FEm1oMV2/dRi3QKRvbM=;
 b=WaHQLvM4AU5iA2zTaBeV60uezLm7X4DxywNjQDs40RTWLtWI2nxUJ60TzhGeg4I4FdMjqXU6v7yDQQtkkHJJhQFdaog3sPeJ2xpOeXFQCcVPYWZQEkinwZ6QkfN4jgIQQIoj4G+7RcwiuPbvC23Xnm26l6/CTOucJRpWWLeaUE8=
Received: from MN2PR12MB3039.namprd12.prod.outlook.com (2603:10b6:208:c9::27)
 by MN2PR12MB3629.namprd12.prod.outlook.com (2603:10b6:208:cb::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Mon, 23 Mar
 2020 14:53:52 +0000
Received: from MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::c1c:df2d:4316:d9d8]) by MN2PR12MB3039.namprd12.prod.outlook.com
 ([fe80::c1c:df2d:4316:d9d8%7]) with mapi id 15.20.2814.025; Mon, 23 Mar 2020
 14:53:52 +0000
From: "Tao, Yintian" <Yintian.Tao@amd.com>
To: "Tao, Yintian" <Yintian.Tao@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>
Subject: RE: [PATCH] drm/scheduler: fix rare NULL ptr race
Thread-Topic: [PATCH] drm/scheduler: fix rare NULL ptr race
Thread-Index: AQHWASDgx/ZNN9iHbke9hnIuM9ZJWqhWQzsA
Date: Mon, 23 Mar 2020 14:53:52 +0000
Message-ID: <MN2PR12MB3039B56EAA141D2748EB0BF7E5F00@MN2PR12MB3039.namprd12.prod.outlook.com>
References: <20200323143931.3931-1-yttao@amd.com>
In-Reply-To: <20200323143931.3931-1-yttao@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Yintian.Tao@amd.com; 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 711ba232-f88c-4c6a-955f-08d7cf3a009f
x-ms-traffictypediagnostic: MN2PR12MB3629:|MN2PR12MB3629:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB36293C343F3BE529E37D50DEE5F00@MN2PR12MB3629.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:357;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(199004)(81166006)(6636002)(71200400001)(81156014)(76116006)(66556008)(55016002)(8676002)(66476007)(5660300002)(66946007)(2906002)(498600001)(26005)(186003)(64756008)(8936002)(7696005)(52536014)(53546011)(6506007)(33656002)(66574012)(9686003)(66446008)(86362001)(110136005)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3629;
 H:MN2PR12MB3039.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n6nVEWJR8TiP87pbEo3+YGAogBtSt8vLZe5Rh3kBLsS+v0J4y1sw3FdKEWhUBiNtAXR1epHL59wErj6uyxJj0SJRCTM2oT2w07sCwQSRahaUsf4joGWamCZ1VHKm5SvmRaFDbQraxliy34JOUO4NnPLaTbbNPzqBfgd0GgHTo2xT8U5wzbQQwULmwnFjLBcy/QofJCDVfVABYHPugmHzEK0MWAeDuozYc/y+mKUNVCC38liF6RmFYeffW6apHDVdQNWfO9tg6TNEk2bj3agOogt9sMUd31IIK+twwG48vNB938oHfyp7V6GQijJa36bw+twY7QyOAKM4kQbSBBRdh5oCQBkrnRpki98RYFglBR8BtsF2QUJ4avcYwyxlLc7+QwwBdgt6Rq2ou0oUPxUEEU/Ua2xDig6KIU3Rn9SnfsdkD1DfQhG5wiMiOk9s9qnHS+foiftSx66TFx87FzphgDTbQKID4prshZouo25udawAG81tq8evMp/IYqtm/sh/
x-ms-exchange-antispam-messagedata: G3Sznmua22iQqzy0tFb25eJTEk4wCD0jf5b0cMmImge6WjFvqd/dIH3ww6MOWsaWrkBFpYrfD3WmtJT69yiEOyLPuIQ6oK1ioK9nszXC7XxAhQr1V3TuhYl3vGvaTZk07qufTwh1LEd32v1OoWkQCA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 711ba232-f88c-4c6a-955f-08d7cf3a009f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 14:53:52.0346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LRV1ij4ymDWHlyYhy+42alUtbEgVQ7hKJl4TT6OGvvjFh1Q14tEU2cNsIXL3Z2lR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3629
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIERhdmlkLCBDaHJpc3RpYW4sIEFsZXggYW5kIEZlbGl4DQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBZaW50aWFuIFRhbyA8eXR0YW9AYW1kLmNvbT4gDQpTZW50OiAyMDIw
5bm0M+aciDIz5pelIDIyOjQwDQpUbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
Q2M6IFRhbywgWWludGlhbiA8WWludGlhbi5UYW9AYW1kLmNvbT4NClN1YmplY3Q6IFtQQVRDSF0g
ZHJtL3NjaGVkdWxlcjogZml4IHJhcmUgTlVMTCBwdHIgcmFjZQ0KDQpUaGVyZSBpcyBvbmUgb25l
IGNvcm5lciBjYXNlIGF0IGRtYV9mZW5jZV9zaWduYWxfbG9ja2VkIHdoaWNoIHdpbGwgcmFpc2Ug
dGhlIE5VTEwgcG9pbnRlciBwcm9ibGVtIGp1c3QgbGlrZSBiZWxvdy4NCi0+ZG1hX2ZlbmNlX3Np
Z25hbA0KICAgIC0+ZG1hX2ZlbmNlX3NpZ25hbF9sb2NrZWQNCgktPnRlc3RfYW5kX3NldF9iaXQN
CmhlcmUgdHJpZ2dlciBkbWFfZmVuY2VfcmVsZWFzZSBoYXBwZW4gZHVlIHRvIHRoZSB6ZXJvIG9m
IGZlbmNlIHJlZmNvdW50Lg0KDQotPmRtYV9mZW5jZV9wdXQNCiAgICAtPmRtYV9mZW5jZV9yZWxl
YXNlDQoJLT5kcm1fc2NoZWRfZmVuY2VfcmVsZWFzZV9zY2hlZHVsZWQNCgkgICAgLT5jYWxsX3Jj
dQ0KaGVyZSBtYWtlIHRoZSB1bmlvbiBmbGVkIOKAnGNiX2xpc3TigJ0gYXQgZmluaXNoZWQgZmVu
Y2UgdG8gTlVMTCBiZWNhdXNlIHN0cnVjdCByY3VfaGVhZCBjb250YWlucyB0d28gcG9pbnRlciB3
aGljaCBpcyBzYW1lIGFzIHN0cnVjdCBsaXN0X2hlYWQgY2JfbGlzdA0KDQpUaGVyZWZvcmUsIHRv
IGhvbGQgdGhlIHJlZmVyZW5jZSBvZiBmaW5pc2hlZCBmZW5jZSBhdCBkcm1fc2NoZWRfcHJvY2Vz
c19qb2IgdG8gcHJldmVudCB0aGUgbnVsbCBwb2ludGVyIGR1cmluZyBmaW5pc2hlZCBmZW5jZSBk
bWFfZmVuY2Vfc2lnbmFsDQoNClsgIDczMi45MTI4NjddIEJVRzoga2VybmVsIE5VTEwgcG9pbnRl
ciBkZXJlZmVyZW5jZSwgYWRkcmVzczogMDAwMDAwMDAwMDAwMDAwOCBbICA3MzIuOTE0ODE1XSAj
UEY6IHN1cGVydmlzb3Igd3JpdGUgYWNjZXNzIGluIGtlcm5lbCBtb2RlIFsgIDczMi45MTU3MzFd
ICNQRjogZXJyb3JfY29kZSgweDAwMDIpIC0gbm90LXByZXNlbnQgcGFnZSBbICA3MzIuOTE2NjIx
XSBQR0QgMCBQNEQgMCBbICA3MzIuOTE3MDcyXSBPb3BzOiAwMDAyIFsjMV0gU01QIFBUSQ0KWyAg
NzMyLjkxNzY4Ml0gQ1BVOiA3IFBJRDogMCBDb21tOiBzd2FwcGVyLzcgVGFpbnRlZDogRyAgICAg
ICAgICAgT0UgICAgIDUuNC4wLXJjNyAjMQ0KWyAgNzMyLjkxODk4MF0gSGFyZHdhcmUgbmFtZTog
UUVNVSBTdGFuZGFyZCBQQyAoaTQ0MEZYICsgUElJWCwgMTk5NiksIEJJT1MgcmVsLTEuOC4yLTAt
ZzMzZmJlMTMgYnkgcWVtdS1wcm9qZWN0Lm9yZyAwNC8wMS8yMDE0IFsgIDczMi45MjA5MDZdIFJJ
UDogMDAxMDpkbWFfZmVuY2Vfc2lnbmFsX2xvY2tlZCsweDNlLzB4MTAwDQpbICA3MzIuOTM4NTY5
XSBDYWxsIFRyYWNlOg0KWyAgNzMyLjkzOTAwM10gIDxJUlE+DQpbICA3MzIuOTM5MzY0XSAgZG1h
X2ZlbmNlX3NpZ25hbCsweDI5LzB4NTAgWyAgNzMyLjk0MDAzNl0gIGRybV9zY2hlZF9mZW5jZV9m
aW5pc2hlZCsweDEyLzB4MjAgW2dwdV9zY2hlZF0gWyAgNzMyLjk0MDk5Nl0gIGRybV9zY2hlZF9w
cm9jZXNzX2pvYisweDM0LzB4YTAgW2dwdV9zY2hlZF0gWyAgNzMyLjk0MTkxMF0gIGRtYV9mZW5j
ZV9zaWduYWxfbG9ja2VkKzB4ODUvMHgxMDANClsgIDczMi45NDI2OTJdICBkbWFfZmVuY2Vfc2ln
bmFsKzB4MjkvMHg1MCBbICA3MzIuOTQzNDU3XSAgYW1kZ3B1X2ZlbmNlX3Byb2Nlc3MrMHg5OS8w
eDEyMCBbYW1kZ3B1XSBbICA3MzIuOTQ0MzkzXSAgc2RtYV92NF8wX3Byb2Nlc3NfdHJhcF9pcnEr
MHg4MS8weGEwIFthbWRncHVdDQoNCnYyOiBob2xkIHRoZSBmaW5pc2hlZCBmZW5jZSBhdCBkcm1f
c2NoZWRfcHJvY2Vzc19qb2IgaW5zdGVhZCBvZg0KICAgIGFtZGdwdV9mZW5jZV9wcm9jZXNzDQp2
MzogcmVzdW1lIHRoZSBibGFuayBsaW5lDQoNClNpZ25lZC1vZmYtYnk6IFlpbnRpYW4gVGFvIDx5
dHRhb0BhbWQuY29tPg0KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFp
bi5jIHwgMiArKw0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIGIvZHJpdmVycy9ncHUv
ZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMNCmluZGV4IGExOGVhYmY2OTJlNC4uOGU3MzFlZDBk
OWQ5IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMN
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQpAQCAtNjUxLDcg
KzY1MSw5IEBAIHN0YXRpYyB2b2lkIGRybV9zY2hlZF9wcm9jZXNzX2pvYihzdHJ1Y3QgZG1hX2Zl
bmNlICpmLCBzdHJ1Y3QgZG1hX2ZlbmNlX2NiICpjYikNCiANCiAJdHJhY2VfZHJtX3NjaGVkX3By
b2Nlc3Nfam9iKHNfZmVuY2UpOw0KIA0KKwlkbWFfZmVuY2VfZ2V0KCZzX2ZlbmNlLT5maW5pc2hl
ZCk7DQogCWRybV9zY2hlZF9mZW5jZV9maW5pc2hlZChzX2ZlbmNlKTsNCisJZG1hX2ZlbmNlX3B1
dCgmc19mZW5jZS0+ZmluaXNoZWQpOw0KIAl3YWtlX3VwX2ludGVycnVwdGlibGUoJnNjaGVkLT53
YWtlX3VwX3dvcmtlcik7DQogfQ0KIA0KLS0NCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

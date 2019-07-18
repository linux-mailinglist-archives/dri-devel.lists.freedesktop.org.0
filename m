Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5681E6CA61
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 09:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195E86E31D;
	Thu, 18 Jul 2019 07:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760072.outbound.protection.outlook.com [40.107.76.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7666E31D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 07:56:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlcbEIsJ75i0k/XxUTNdqG64ki31t5wTF63tF4lKqG/IAP0nTaZKP0AvKWYL9EtJJ/esI8NtCTbJcrv3SUsRF0s3m2+uNfWWUfs4+Rg7BSHveDL85nKX+lsgzF5Pz0OJK9H5u/nZgDctdNVAvXncBo/tP5Eq4FO7qBpv9OdV3grXFEy45sp1HoT/dFr5zX8YWxVDSREHUMggBogPnOY1sLfMoj+xTCAIRKrLJIizWik5upj0Mf3Y5kBtfVLpBanQWasiZ++z6x2hejTw1F0B/oIt7TUztGMQ6ghmLq2QhmQ7DdfBlCtCJxu4Qx8L6l41tihzGO2o/rby67jcaFvOWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7BBIHva0GPHQXmfWVgbGd7wGzNHB4I9LQ5sq6MrwQc=;
 b=mPzUA5KmdvLUI7uByp79W/BkuccSmyhdRCK5Z2310DZHZp7ViXX08zcXWJQTdNxMveWHXIgpyRKFppAYrIU/eKiOX5+PMLk3u+1r+AA9HqZGwotvCTLnKF+uJxtbaildPjcUuobbKbI6/hhTFgH+CXgU8j3CKm0lvBnGI5e3sj1sb8HRgKgu1cGREQkn9NlhujCShmI2EzW79a32UeSLbM6Xt1AoXR+K5P2PeDeocWcuvGbc5xHJ07x208IGGLAFgfNnFYReXJqNQ/ET05LKTtGrTiet4WEiWo2aVWlIdsKt13RYPX9FZa3kQglLLDQ+2mwTn2yBdVbanXwrG+Khrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1674.namprd12.prod.outlook.com (10.172.40.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Thu, 18 Jul 2019 07:56:02 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.011; Thu, 18 Jul
 2019 07:56:02 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Fuqian Huang <huangfq.daxian@gmail.com>
Subject: Re: [PATCH 1/2] drm/ttm: use the same attributes when freeing
 d_page->vaddr
Thread-Topic: [PATCH 1/2] drm/ttm: use the same attributes when freeing
 d_page->vaddr
Thread-Index: AQHVN5Y0gU5bZ/aSkkGOeZrSFOx//KbNSFwAgAK7TYCAAAmegA==
Date: Thu, 18 Jul 2019 07:56:02 +0000
Message-ID: <cdeb0dfb-0237-58d6-be6e-b2499c95966c@amd.com>
References: <20190711031021.23512-1-huangfq.daxian@gmail.com>
 <6f28e750-02e4-438a-3680-a4697014689d@amd.com>
 <CABXRUiTG4=isYUHkoha9dYX0P=k6AuQAnrZkcWHT=-Yf2gk6Vg@mail.gmail.com>
In-Reply-To: <CABXRUiTG4=isYUHkoha9dYX0P=k6AuQAnrZkcWHT=-Yf2gk6Vg@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6PR06CA0016.eurprd06.prod.outlook.com
 (2603:10a6:20b:14::29) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a059e73f-e7ad-4905-6321-08d70b5560cc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1674; 
x-ms-traffictypediagnostic: DM5PR12MB1674:
x-microsoft-antispam-prvs: <DM5PR12MB16748EBCEC67C21494B2853B83C80@DM5PR12MB1674.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(199004)(189003)(14454004)(6116002)(5660300002)(66476007)(305945005)(65806001)(25786009)(52116002)(68736007)(36756003)(65956001)(256004)(58126008)(14444005)(446003)(11346002)(7736002)(6916009)(64756008)(229853002)(66556008)(76176011)(6506007)(66446008)(31686004)(386003)(2616005)(6436002)(486006)(102836004)(186003)(65826007)(6512007)(54906003)(99286004)(81166006)(478600001)(53936002)(81156014)(8936002)(71190400001)(2906002)(64126003)(71200400001)(316002)(6246003)(6486002)(476003)(66574012)(31696002)(66946007)(46003)(4326008)(8676002)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1674;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FmfeWX2293PWUuZhDlv/ODgH/iRh9bPdaEeI/uHOrSzmYOYzcXq2273wFNgOC4dOC56ltI57uDTkaCJU1vKx7BMGyrLJYnLlV8bpikCSOLg2BnWmhhykwTzedt6IesI6SQezO+5nHGg0nCX+DXdlAz8C3WBFGuCFyTzZigZ1Z7d26QlLj7ZiONK+b4I3M3VxTQO1gicet5OMH6pIMfuCHIWAJ9UfG9oLdOijqHki95Z8WnGSNwoG8RDZmEPAvfjnC95BWo+bOOMeDJ5jxCm4pwIlh438GF/S5cEncCIO6eqK5SdGNlVMQHcGpy1PsOUBK1YkLHN+qD96agMiE3tiB2PaIzW41hGVhPJsx72KaI9HGzCcKEjbWHBwkIRaZ9UZdefX9DzCv8TTwi90Wfdq3fCCqTNSJhisTzVqjXkpwjQ=
Content-ID: <98599117E31E824194EFDBC0994B673C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a059e73f-e7ad-4905-6321-08d70b5560cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 07:56:02.3730 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1674
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k7BBIHva0GPHQXmfWVgbGd7wGzNHB4I9LQ5sq6MrwQc=;
 b=OXI/XTW6HypGdd6SasZXhFStjkIpqFGUVVRWmY3yJP9cpLmpQNAmTm/j6GNt2vWWFVvr097z0IvjualGEBe+UmXX2idXYXLxpXyHyPvG1sFkfzN2GixM9dOzXx946qlC+hmc5XRcf6mPoNurFmn8VIhZdtRsWG6PxnEYn/Mv8nI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: David Airlie <airlied@linux.ie>, "Huang, Ray" <Ray.Huang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTguMDcuMTkgdW0gMDk6MjEgc2NocmllYiBGdXFpYW4gSHVhbmc6DQo+IEtvZW5pZywgQ2hy
aXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+IOaWvCAyMDE55bm0N+aciDE25pel6YCx
5LqMIOS4i+WNiDk6Mzjlr6vpgZPvvJoNCj4+IEFtIDExLjA3LjE5IHVtIDA1OjEwIHNjaHJpZWIg
RnVxaWFuIEh1YW5nOg0KPj4+IEluIGZ1bmN0aW9uIF9fdHRtX2RtYV9hbGxvY19wYWdlKCksIGRf
cGFnZS0+YWRkciBpcyBhbGxvY2F0ZWQNCj4+PiBieSBkbWFfYWxsb2NfYXR0cnMoKSBidXQgZnJl
ZWQgd2l0aCB1c2UgZG1hX2ZyZWVfY29oZXJlbnQoKSBpbg0KPj4+IF9fdHRtX2RtYV9mcmVlX3Bh
Z2UoKS4NCj4+PiBVc2UgdGhlIGNvcnJlY3QgZG1hX2ZyZWVfYXR0cnMoKSB0byBmcmVlIGRfcGFn
ZS0+dmFkZHIuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBGdXFpYW4gSHVhbmcgPGh1YW5nZnEu
ZGF4aWFuQGdtYWlsLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+DQo+Pg0KPj4gSG93IGRvIHlvdSB3YW50IHRvIHVwc3RyZWFt
IHRoYXQ/IFNob3VsZCBJIHB1bGwgaXQgaW50byBvdXIgdHJlZT8NCj4gSSBqdXN0IGNhbWUgYWNy
b3NzIHRoaXMgbWlzdXNlIGNhc2UgYWNjaWRlbnRhbGx5Lg0KPiBJIGFtIG5vdCB2ZXJ5IGNsZWFy
IGFib3V0ICdIb3cgdG8gdXBzdHJlYW0gdGhhdCcuDQo+IEFyZSB0aGVyZSBtb3JlIHRoYW4gb25l
IHdheSB0byB1cHN0cmVhbSB0aGUgY29kZSBhbmQgZml4IHRoZSBwcm9ibGVtPw0KDQpXZWxsIEkg
Y2FuIGFkZCBpdCB0byB0aGUgVFRNIHRyZWUgd2hpY2ggc2VuZCB0byBEYXZpZCBvciBpdCBjb3Vs
ZCBiZSANCnB1bGxlZCB0aHJvdWdoIHNvbWUgb3RoZXIgd2F5IHRvd2FyZHMgTGludXMuDQoNCj4g
IEZyb20gbXkgc2lkZSwgaXQgaXMgb2sgdGhhdCB5b3UgcHVsbCBpdCBpbnRvIHlvdXIgdHJlZSBh
bmQgZml4IGl0IG9yDQo+IGZpeCBpdCBpbiBvdGhlciB3YXkuDQo+IDopIEl0IHdpbGwgYmUgZmlu
ZSBpZiB0aGUgcHJvYmxlbSBpcyBmaXhlZC4NCg0KT2ssIGZpbmUgd2l0aCBtZSA6KQ0KDQpDaHJp
c3RpYW4uDQoNCj4NCj4gVGhhbmtzLg0KPg0KPj4gVGhhbmtzLA0KPj4gQ2hyaXN0aWFuLg0KPj4N
Cj4+PiAtLS0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5j
IHwgNiArKysrKy0NCj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
cGFnZV9hbGxvY19kbWEuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1h
LmMNCj4+PiBpbmRleCBkNTk0Zjc1MjBiN2IuLjdkNzhlNmRlYWM4OSAxMDA2NDQNCj4+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5jDQo+Pj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fcGFnZV9hbGxvY19kbWEuYw0KPj4+IEBAIC0yODUsOSArMjg1
LDEzIEBAIHN0YXRpYyBpbnQgdHRtX3NldF9wYWdlc19jYWNoaW5nKHN0cnVjdCBkbWFfcG9vbCAq
cG9vbCwNCj4+Pg0KPj4+ICAgIHN0YXRpYyB2b2lkIF9fdHRtX2RtYV9mcmVlX3BhZ2Uoc3RydWN0
IGRtYV9wb29sICpwb29sLCBzdHJ1Y3QgZG1hX3BhZ2UgKmRfcGFnZSkNCj4+PiAgICB7DQo+Pj4g
KyAgICAgdW5zaWduZWQgbG9uZyBhdHRycyA9IDA7DQo+Pj4gICAgICAgIGRtYV9hZGRyX3QgZG1h
ID0gZF9wYWdlLT5kbWE7DQo+Pj4gICAgICAgIGRfcGFnZS0+dmFkZHIgJj0gflZBRERSX0ZMQUdf
SFVHRV9QT09MOw0KPj4+IC0gICAgIGRtYV9mcmVlX2NvaGVyZW50KHBvb2wtPmRldiwgcG9vbC0+
c2l6ZSwgKHZvaWQgKilkX3BhZ2UtPnZhZGRyLCBkbWEpOw0KPj4+ICsgICAgIGlmIChwb29sLT50
eXBlICYgSVNfSFVHRSkNCj4+PiArICAgICAgICAgICAgIGF0dHJzID0gRE1BX0FUVFJfTk9fV0FS
TjsNCj4+PiArDQo+Pj4gKyAgICAgZG1hX2ZyZWVfYXR0cnMocG9vbC0+ZGV2LCBwb29sLT5zaXpl
LCAodm9pZCAqKWRfcGFnZS0+dmFkZHIsIGRtYSwgYXR0cnMpOw0KPj4+DQo+Pj4gICAgICAgIGtm
cmVlKGRfcGFnZSk7DQo+Pj4gICAgICAgIGRfcGFnZSA9IE5VTEw7DQoNCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

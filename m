Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B01F169784
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2020 13:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BFE6E17E;
	Sun, 23 Feb 2020 12:21:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CFD6E17E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 12:21:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPjfrCSNRzuK5fI65vy26daCgRtllH3Xejwpq2g5Ps3iEAx2Cb1tGZ2sHpi1I9Fj0x4x7CPsosPMbwX66K+xReEiDxFY/+gqz2DB3ZzZaVFL+hu24kmIPKK8QCE6zaX1fBTfHlRBjgVI2r62rH2UEkYyYyRszeBsS2XqEYltZIbQWvc7qh0g/qnLcg7EjW1AMAmoBGgFMR7Hlto62CMEbU90Futk4H7GTiPn7MJIVFWYm41GQU0HE68ABJ0BySvLchIyI9gHsF4caj8E/MDwtghoByXQfR/sjIHzd3XUc+ca1M4UYSKe2Fv8jGEIeR5mpXDkguqbvoOQ9nnwaHWVNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqL30WLfD79Z2bFSAmH6YUZeMW6je4onjV91Z8ux+/Q=;
 b=PBya04+vy2QkxFNeYkivzWHrHEDjgievAcFhZQS9I78nGkUVMHdh6e5BJNSnn6U2iN8dvgT1KfUmWbCNTdf8bqAKNbc2Oulir2ldNZyyjzEK9Aa6Y/JIw23KmqqP8pcLDUdoISY0dkbszIHkXH8dSvAHvtPTg4Y7JyBIePTvnFqfrUBU/JRURsn2lDjkjUdXGiu29tThANMbqSUfEz7dXkI0FCViDM9p0kOSXgsPCI41ji2qFjRQ9xP6oc7SJLI6TyJOTMrt1jMzpO5uCLjbItUOmqbpFvZ8SQQZr1eKyWdC7vjw9DBMtAXPytpgaZTuqoxscOvIi1v7dXMyfC7ijQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqL30WLfD79Z2bFSAmH6YUZeMW6je4onjV91Z8ux+/Q=;
 b=o5tvQ6Y6uT77IM2mA/TFxumzVx8NvNsoNPbxQhoO1QPl0hK9hds0OfSNAgQmlS9xqyRkPLoiugsgEf0ENAWMVankWNhpluJoCLKq9Lq/B/ZXRyeeT6tcCIgB2XZrVUapOLJ+JJFh0/8hfHSyVCEE1vzetDIxLMSqYkk0BbXwtTM=
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (52.135.101.138) by
 SN6PR12MB2654.namprd12.prod.outlook.com (52.135.105.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Sun, 23 Feb 2020 12:21:03 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::b99c:18c0:8685:1c10]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::b99c:18c0:8685:1c10%5]) with mapi id 15.20.2729.033; Sun, 23 Feb 2020
 12:21:02 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH] dma-buf: Fix missing excl fence waiting
Thread-Topic: [PATCH] dma-buf: Fix missing excl fence waiting
Thread-Index: AQHV6kBAT438z6UDCka2fB4S+SGlWagorjuAgAAEr4A=
Date: Sun, 23 Feb 2020 12:21:02 +0000
Message-ID: <3B6ADD37-8287-4180-B99B-C747DBACC6F4@amd.com>
References: <B737F1D5-292E-4FE2-89A5-6EF72CB3EED1@amd.com>
 <7a2eb42a-2dd9-4303-3947-6bbb4de7a888@amd.com>
In-Reply-To: <7a2eb42a-2dd9-4303-3947-6bbb4de7a888@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
x-originating-ip: [101.88.215.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3a7413f0-74d8-4f15-cd15-08d7b85ad962
x-ms-traffictypediagnostic: SN6PR12MB2654:|SN6PR12MB2654:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB2654EF7B349FF21542337E4B87EF0@SN6PR12MB2654.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0322B4EDE1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(199004)(189003)(54906003)(71200400001)(36756003)(66446008)(37006003)(64756008)(66556008)(186003)(86362001)(6506007)(26005)(316002)(76116006)(66946007)(91956017)(66476007)(2616005)(8936002)(8676002)(81166006)(478600001)(81156014)(6636002)(4326008)(6512007)(5660300002)(33656002)(6486002)(6862004)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2654;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: thLNQ7EuS14XRT1NF0e4x3w+kwsMFLJDAltFMSUIhMJ2k9cmD6q/91URpR1gUqREr7wH3UzS4eEt8N0nHJBFMGQeJoEYVwoB+UxkzRTvUcl/xNNxFTBGN3V51oEvmLnBsph+ZmQKbIKZYpJa2IVgLZx9Li/nysw2baHdPUN+Hdc2FQJzWPAQngeprNuoF2tHHv/JYHFu2UFx4Rvn3izBV4ZeOmj2CRUf4z6pHNWCyKMMEkuXIgMU8f7duUIYDN8n7+HKZrMwg2ZGPQ2QTaB8/1n2xaiG65TLDIOGRUy6+KjU4t2CuXmhaa2w61jRICWxJP059ERSn+DtxXHz3CNtjZWEHGMmNdQWREKvx8pcPvRU6/g1EdCYLyjNtp1KMhn7bnVHfKjkVRY6qZT5rvZg+NsEwt1yJmyvwhV9K1EAa9jd7zdC0WLnHUEIEBWfVy3l
x-ms-exchange-antispam-messagedata: jqScHDHTnDrmZ0xU7IXs/koWh7Dc6oXLz6zLe4Q2ROzOiMKV5duMNxnkRp3qZqAJ4qOYkRU9bn5gakpNjBYpsor3e92mTxvAycQHdp5SE4qfGQdQ2bRNVSx5luh3BDhMvx1Dso7ELkGU/J6kP9zjKA==
Content-ID: <DBFCDC536B558D4C890DF720A46FCF6E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7413f0-74d8-4f15-cd15-08d7b85ad962
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2020 12:21:02.8773 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2G+qyxRYekt7/GKKTwlKYHViVtqowVx54A/NamS4oVGLdlRK3KzoJ8jSlEmKnRQU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2654
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gMjAyMOW5tDLmnIgyM+aXpSAyMDowNO+8jEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3Rp
YW4uS29lbmlnQGFtZC5jb20+IOWGmemBk++8mg0KPiANCj4gQW0gMjMuMDIuMjAgdW0gMTI6NTYg
c2NocmllYiBQYW4sIFhpbmh1aToNCj4+IElmIHNoYXJlZCBmZW5jZSBsaXN0IGlzIG5vdCBlbXB0
eSwgZXZlbiB3ZSB3YW50IHRvIHRlc3QgYWxsIGZlbmNlcywgZXhjbCBmZW5jZSBpcyBpZ25vcmVk
Lg0KPj4gVGhhdCBpcyBhYnZpb3VzbHkgd3JvbmcsIHNvIGZpeCBpdC4NCj4gDQo+IFllYWggdGhh
dCBpcyBhIGtub3duIGlzc3VlIGFuZCBJIGNvbXBsZXRlbHkgYWdyZWUgd2l0aCB5b3UsIGJ1dCBv
dGhlciBkaXNhZ3JlZS4NCj4gDQo+IFNlZSB0aGUgc2hhcmVkIGZlbmNlcyBhcmUgbWVhbnQgdG8g
ZGVwZW5kIG9uIHRoZSBleGNsdXNpdmUgZmVuY2UuIFNvIGFsbCBzaGFyZWQgZmVuY2VzIG11c3Qg
ZmluaXNoIG9ubHkgYWZ0ZXIgdGhlIGV4Y2x1c2l2ZSBvbmUgaGFzIGZpbmlzaGVkIGFzIHdlbGwu
DQpmYWlyIGVub3VnaC4NCg0KPiBUaGUgcHJvYmxlbSBub3cgaXMgdGhhdCBmb3IgZXJyb3IgaGFu
ZGxpbmcgdGhpcyBpc24ndCBuZWNlc3NhcnkgdHJ1ZS4gSW4gb3RoZXIgd29yZHMgd2hlbiBhIHNo
YXJlZCBmZW5jZSBjb21wbGV0ZXMgd2l0aCBhbiBlcnJvciBpdCBpcyBwZXJmZWN0bHkgcG9zc2li
bGUgdGhhdCBoZSBkb2VzIHRoaXMgYmVmb3JlIHRoZSBleGNsdXNpdmUgZmVuY2UgaXMgZmluaXNo
ZWQuDQo+IA0KPiBJJ20gdHJ5aW5nIHRvIGNvbnZpbmNlIERhbmllbCB0aGF0IHRoaXMgaXMgYSBw
cm9ibGVtIGZvciB5ZWFycyA6KQ0KPiANCg0KSSBoYXZlIG1ldCBwcm9ibGVtcywgZXZpY3Rpb24g
aGFzIHJhY2Ugd2l0aCBibyByZWxhc2UuICBzeXN0ZW0gbWVtb3J5IGlzIG92ZXJ3cmllZCBieSBz
RE1BLiB0aGUga2VybmVsIGlzIDQuMTksIHN0YWJsZSBvbmUsIExPTC4NCg0KYW1kZ3B1IGFkZCBl
eGNsIGZlbmNlIHRvIGJvIHRvIG1vdmUgc3lzdGVtIG1lbW9yeSB3aGljaCBpcyBkb25lIGJ5IHRo
ZSBkcm0gc2NoZWR1bGVyLg0KYWZ0ZXIgc0RNQSBmaW5pc2ggdGhlIG1vdmluZyBqb2IsICB0aGUg
bWVtb3J5IG1pZ2h0IGhhdmUgYWxyZWFkeSBiZWVuIHJlbGVhc2VkIGFzIGRtYV9yZXN2X3Rlc3Rf
c2lnbmFsZWRfcmN1IGRpZCBub3QgY2hlY2sgZXhjbCBmZW5jZS4NCg0KT3VyIGxvY2FsIGN1c3Rv
bWVyIHJlcG9ydCB0aGlzIGlzc3VlLiBJIHRvb2sgNCBkYXlzIGludG8gaXQuIHNpZ2gNCg0KdGhh
bmtzDQp4aW5odWkNCg0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+IA0KPj4gDQo+PiBTaWdu
ZWQtb2ZmLWJ5OiB4aW5odWkgcGFuIDx4aW5odWkucGFuQGFtZC5jb20+DQo+PiAtLS0NCj4+ICBk
cml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYyB8IDkgKysrKystLS0tDQo+PiAgMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMN
Cj4+IGluZGV4IDQyNjRlNjQ3ODhjNC4uNDRkYzY0YzU0N2M2IDEwMDY0NA0KPj4gLS0tIGEvZHJp
dmVycy9kbWEtYnVmL2RtYS1yZXN2LmMNCj4+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVz
di5jDQo+PiBAQCAtNjMyLDE0ICs2MzIsMTQgQEAgc3RhdGljIGlubGluZSBpbnQgZG1hX3Jlc3Zf
dGVzdF9zaWduYWxlZF9zaW5nbGUoc3RydWN0IGRtYV9mZW5jZSAqcGFzc2VkX2ZlbmNlKQ0KPj4g
ICAqLw0KPj4gIGJvb2wgZG1hX3Jlc3ZfdGVzdF9zaWduYWxlZF9yY3Uoc3RydWN0IGRtYV9yZXN2
ICpvYmosIGJvb2wgdGVzdF9hbGwpDQo+PiAgew0KPj4gLQl1bnNpZ25lZCBzZXEsIHNoYXJlZF9j
b3VudDsNCj4+ICsJdW5zaWduZWQgaW50IHNlcSwgc2hhcmVkX2NvdW50LCBsZWZ0Ow0KPj4gIAlp
bnQgcmV0Ow0KPj4gICAgCXJjdV9yZWFkX2xvY2soKTsNCj4+ICByZXRyeToNCj4+ICAJcmV0ID0g
dHJ1ZTsNCj4+ICAJc2hhcmVkX2NvdW50ID0gMDsNCj4+IC0Jc2VxID0gcmVhZF9zZXFjb3VudF9i
ZWdpbigmb2JqLT5zZXEpOw0KPj4gKwlsZWZ0ID0gc2VxID0gcmVhZF9zZXFjb3VudF9iZWdpbigm
b2JqLT5zZXEpOw0KPj4gICAgCWlmICh0ZXN0X2FsbCkgew0KPj4gIAkJdW5zaWduZWQgaTsNCj4+
IEBAIC02NDcsNyArNjQ3LDcgQEAgYm9vbCBkbWFfcmVzdl90ZXN0X3NpZ25hbGVkX3JjdShzdHJ1
Y3QgZG1hX3Jlc3YgKm9iaiwgYm9vbCB0ZXN0X2FsbCkNCj4+ICAJCXN0cnVjdCBkbWFfcmVzdl9s
aXN0ICpmb2JqID0gcmN1X2RlcmVmZXJlbmNlKG9iai0+ZmVuY2UpOw0KPj4gICAgCQlpZiAoZm9i
aikNCj4+IC0JCQlzaGFyZWRfY291bnQgPSBmb2JqLT5zaGFyZWRfY291bnQ7DQo+PiArCQkJbGVm
dCA9IHNoYXJlZF9jb3VudCA9IGZvYmotPnNoYXJlZF9jb3VudDsNCj4+ICAgIAkJZm9yIChpID0g
MDsgaSA8IHNoYXJlZF9jb3VudDsgKytpKSB7DQo+PiAgCQkJc3RydWN0IGRtYV9mZW5jZSAqZmVu
Y2UgPSByY3VfZGVyZWZlcmVuY2UoZm9iai0+c2hhcmVkW2ldKTsNCj4+IEBAIC02NTcsMTMgKzY1
NywxNCBAQCBib29sIGRtYV9yZXN2X3Rlc3Rfc2lnbmFsZWRfcmN1KHN0cnVjdCBkbWFfcmVzdiAq
b2JqLCBib29sIHRlc3RfYWxsKQ0KPj4gIAkJCQlnb3RvIHJldHJ5Ow0KPj4gIAkJCWVsc2UgaWYg
KCFyZXQpDQo+PiAgCQkJCWJyZWFrOw0KPj4gKwkJCWxlZnQtLTsNCj4+ICAJCX0NCj4+ICAgIAkJ
aWYgKHJlYWRfc2VxY291bnRfcmV0cnkoJm9iai0+c2VxLCBzZXEpKQ0KPj4gIAkJCWdvdG8gcmV0
cnk7DQo+PiAgCX0NCj4+ICAtCWlmICghc2hhcmVkX2NvdW50KSB7DQo+PiArCWlmICghbGVmdCkg
ew0KPj4gIAkJc3RydWN0IGRtYV9mZW5jZSAqZmVuY2VfZXhjbCA9IHJjdV9kZXJlZmVyZW5jZShv
YmotPmZlbmNlX2V4Y2wpOw0KPj4gICAgCQlpZiAoZmVuY2VfZXhjbCkgew0KPiANCg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

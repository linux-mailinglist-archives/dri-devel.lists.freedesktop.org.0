Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9969CC1D85
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 10:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C78F6E219;
	Mon, 30 Sep 2019 08:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4986E1F9;
 Mon, 30 Sep 2019 08:57:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUr1hSvFbDPkaaQbu9VdTEISpLpAIXQwoVDLdy1IvwCqY7UCeVCI1zhZ2elPuXytumlyS81KLG9D5AZPV0FA8r83ZvI82Ec6VIe2dKzXbpWc9mh4J6bi+TXpW2UPvOFM9a3asRUSFJXhVaXxMXfV4UcKj8bdLU7baDA9uop1zs4ud+1PHUCefh1tmS/ROfzI1OcPJ3J1NP4okKsjjG7/OZnrt1DnQZuZlFEEBoIxrx7ugCFGkirVoS2PfmjiYHVGh7ntqtLWjyIuDnwcpRDjajnZK7vbv3oB8tvuL6yZvJjIwB6SCkdYjj6xFp3XawKyQ5rRQLWUqJB1YOGxYj5snQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieBIyZkigZ98fnTi9fedivP437wolZezW46/zSdRa6o=;
 b=LQU9l4vx3sDiVFG11KPYxZQIM7IDM2NOevpn/KgeYJ2i0MRIWXWUE2Ip7TBu935BGGXKeOK9hFClYAneNhqaiNdRQoAYxvgSOKlP8bYxn8EZxfL6OXqG5Gq/npBVsMgA6jxiC2zVGnkuZzSXnDxosmLsgq4hQh66S0df2T5KSBo90DKjun2slfUQsjaIMJv1ItJiCHi80mLx0FiQ5C4FSZd6bYQzpLZq10Rvk9t5XzXxDNPwIoiFWzgshg/UT4At9eiZh2BziVmC/286pTvGGGND4+nyzFKDk2U29WpBtnKmkujQf35sXf/pL3RaPEfMYmpe4vHiRFwul+8tYsq+jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1699.namprd12.prod.outlook.com (10.175.97.148) by
 BN6PR12MB1537.namprd12.prod.outlook.com (10.172.18.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 30 Sep 2019 08:57:33 +0000
Received: from BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::7d62:3e74:d0f0:be92]) by BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::7d62:3e74:d0f0:be92%3]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 08:57:32 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, Qiang Yu <yuq825@gmail.com>
Subject: Re: [PATCH] dma-buf/resv: fix exclusive fence get
Thread-Topic: [PATCH] dma-buf/resv: fix exclusive fence get
Thread-Index: AQHVcRpRudsfv3x2/0ig8l9P5ZHZ2qdD3U6AgAAap4A=
Date: Mon, 30 Sep 2019 08:57:32 +0000
Message-ID: <910b33a2-36ec-1ed3-e487-adfa61b5ec0e@amd.com>
References: <20190922074900.853-1-yuq825@gmail.com>
 <CAKMK7uHro9W8GqvuVf0Ruji691U7Trc_jmS3U-OEacLFDH6P1A@mail.gmail.com>
In-Reply-To: <CAKMK7uHro9W8GqvuVf0Ruji691U7Trc_jmS3U-OEacLFDH6P1A@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR0402CA0005.eurprd04.prod.outlook.com
 (2603:10a6:208:15::18) To BN6PR12MB1699.namprd12.prod.outlook.com
 (2603:10b6:404:ff::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e9aa5d99-4a03-45f1-1af3-08d745843b24
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BN6PR12MB1537:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB1537DF1A7194D6B4CE71F13083820@BN6PR12MB1537.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(366004)(189003)(199004)(46003)(81166006)(8676002)(14454004)(99286004)(86362001)(6246003)(476003)(54906003)(31696002)(81156014)(6116002)(110136005)(7736002)(76176011)(31686004)(486006)(8936002)(316002)(4326008)(2616005)(52116002)(58126008)(305945005)(5660300002)(11346002)(229853002)(66556008)(66476007)(6486002)(66446008)(64756008)(66946007)(71200400001)(102836004)(36756003)(966005)(478600001)(53546011)(14444005)(25786009)(386003)(6506007)(256004)(66574012)(71190400001)(6306002)(446003)(6512007)(2906002)(6436002)(65956001)(186003)(65806001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1537;
 H:BN6PR12MB1699.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bFXOuutXQ8Acr/56ZGCIFgWwRshdBtHZE3xCedsph63R68tKd4HQ/9WGl9XdkektFLJXnmi2EqNMyEpSMcouNFKW5S7c3ek4VxAgn0m3foL+0CCkO8g3kScPF5V1bJdDVuwqRaVSJcJfLea3obfrvAOjn1AhFjItKXMsWxD4E0cmXWt4nUPI8qjsSyWkF8ZedWHnvMUfGHzZzO8ZODg8t9qtNzjcUn8IRI4P/Dr6M/Ai3mExOZgyMZat4goIqizd84oTPaq3gZiG73iv9O4/2zUwsrvpSN7KiMOB2gkMNQFb0gJKeSnk/vZiCTTDBRSF5ULoiAsCrh64W9yb7pPmYrOaguFNJWFtIrUqYWjil4/QAuvDcQZ5cvaw7Euha8rELgEgzDAGoCpFsS3d8tcYbCU4DErfWKpJZc+XpKvqdxy8ryWAGPUPV7Jg2lvDqXVhI1NwYMSC8xpJbnpGEjHeZQ==
x-ms-exchange-transport-forked: True
Content-ID: <6A7F6644E76C9B4B98F6A181BB08F617@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9aa5d99-4a03-45f1-1af3-08d745843b24
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 08:57:32.7815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VTcj1FiZpTTh6mFUOc0tDXN0jbT56ks4k0qZbeF+C4Inm59bVSiW9NHHb4Hq99/q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1537
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieBIyZkigZ98fnTi9fedivP437wolZezW46/zSdRa6o=;
 b=WBVQEEl810RXjdtyTDVtdGQCjT4KqUFkFB4slUz9VXMRFhfM+X25OYO6vzkqU5z+D3UHZ+H0JRgyGVJpjOdVXWAU3G0l0MtlGUw8LGpSI9F8v7kSeYLzC6ElDvhKGdIDmoDgaix33xtX1hV1iOC+Gh1qlNbG0fSG+3bKua8rF+I=
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
Cc: "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>,
 "lima@lists.freedesktop.org" <lima@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDkuMTkgdW0gMDk6MjIgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBPbiBTdW4sIFNl
cCAyMiwgMjAxOSBhdCAyOjA4IFBNIFFpYW5nIFl1IDx5dXE4MjVAZ21haWwuY29tPiB3cm90ZToN
Cj4+IFRoaXMgY2F1c2VzIGtlcm5lbCBjcmFzaCB3aGVuIHRlc3RpbmcgbGltYSBkcml2ZXIuDQo+
Pg0KPj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4+
IEZpeGVzOiBiOGMwMzZkZmM2NmYgKCJkbWEtYnVmOiBzaW1wbGlmeSByZXNlcnZhdGlvbl9vYmpl
Y3RfZ2V0X2ZlbmNlc19yY3UgYSBiaXQiKQ0KPj4gU2lnbmVkLW9mZi1ieTogUWlhbmcgWXUgPHl1
cTgyNUBnbWFpbC5jb20+DQo+IFNlbGZ0ZXN0IGZvciB0aGlzIHdvdWxkIGJlIGxvdmVseSwgbm93
IHRoYXQgdGhlIGJhc2ljIGluZnJhc3RydWN0dXJlDQo+IGlzIGluIHBsYWNlIC4uLg0KDQpXaGF0
IGRvIHlvdSBoYXZlIGluIG1pbmQ/IEkgd291bGRuJ3QgZXZlbiBrbm93IHdoZXJlIHRvIHN0YXJ0
IHRvIHdyaXRlIA0KYW4gdW5pdCB0ZXN0IGZvciB0aGlzLg0KDQpDaHJpc3RpYW4uDQoNCj4gLURh
bmllbA0KPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtcmVzdi5jIHwgMiArLQ0K
Pj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1yZXN2LmMgYi9kcml2ZXJzL2RtYS1i
dWYvZG1hLXJlc3YuYw0KPj4gaW5kZXggNDJhOGYzZjExNjgxLi43MDkwMDI1MTU1NTAgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYw0KPj4gKysrIGIvZHJpdmVycy9k
bWEtYnVmL2RtYS1yZXN2LmMNCj4+IEBAIC00NzEsNyArNDcxLDcgQEAgaW50IGRtYV9yZXN2X2dl
dF9mZW5jZXNfcmN1KHN0cnVjdCBkbWFfcmVzdiAqb2JqLA0KPj4gICAgICAgICAgaWYgKHBmZW5j
ZV9leGNsKQ0KPj4gICAgICAgICAgICAgICAgICAqcGZlbmNlX2V4Y2wgPSBmZW5jZV9leGNsOw0K
Pj4gICAgICAgICAgZWxzZSBpZiAoZmVuY2VfZXhjbCkNCj4+IC0gICAgICAgICAgICAgICBzaGFy
ZWRbKytzaGFyZWRfY291bnRdID0gZmVuY2VfZXhjbDsNCj4+ICsgICAgICAgICAgICAgICBzaGFy
ZWRbc2hhcmVkX2NvdW50KytdID0gZmVuY2VfZXhjbDsNCj4+DQo+PiAgICAgICAgICBpZiAoIXNo
YXJlZF9jb3VudCkgew0KPj4gICAgICAgICAgICAgICAgICBrZnJlZShzaGFyZWQpOw0KPj4gLS0N
Cj4+IDIuMTcuMQ0KPj4NCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+PiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA0KPg0KPg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=

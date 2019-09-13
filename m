Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF88B1BC5
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 12:53:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D88A6EF10;
	Fri, 13 Sep 2019 10:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800072.outbound.protection.outlook.com [40.107.80.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71046EF10
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 10:53:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EI9FOmqkG0tMQ9BLMIDYykrG3Ubu6M530yXoUTQ++3E2d3xKlh5ZwL8gQyqPJNC00iHvmB2M9taj2Ide14eAjiOzfveNUYfYdeuAu6nACB98Z839500ugyteP1h5uV3bneTBWY6IfeOR5722VdbifGUr7REeR9T8vQFzXD1RZGyBxnF32+fdZJO3yBLo9B1TKvVnDhWgOOJTAEM6O7s/D6a+iW81NOzXtli746Uurb1V+icr/Tqf/CHMGhJJjZ47ZcCyjy3Y0s4YRgnYFuH2VcNAyDJN9AQByA6XubcLsiDx5YGnfJkI9dP4u6JIkPWH4G9wkn2DHi0M6x2GiIuolg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnIcowE4FKJP24uJRS+HcgIS8UFxiKR7eiXNMgOC8As=;
 b=PxFWTOAGXALofqS6isLw8aeO+E0HUryHH8vTzKo5CiQVZXQEAl5M72hED9xxRUetCclx8QjSa8M+I4Uyl3lEQaeslYrVuosstKMRxvCV111fYsvSrA3SFUcU5h96ANZclJaaOHr8sbeze2+q8G99pk05Ci51sEctgaWv7tzhhcPacGc0IEykyDae3zqZClNtuh0rzOQ+bI/EfxOTnF5Op/bonObgtqTNlCDWEw5KvpV2ad8xb+K+SUHN1sKqa5DwZzpKEMTWOQzZGnPEBkEgR7KvM8+cRYi2pqCcz7/SnLYQNliErdbFZCkSU1E83Spw130d1nuOJ9G2dGngk8Lz6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1642.namprd12.prod.outlook.com (10.172.35.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Fri, 13 Sep 2019 10:53:07 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2241.022; Fri, 13 Sep 2019
 10:53:07 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk=?= <thomas_os@shipmail.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: Restore ttm prefaulting
Thread-Topic: [PATCH] drm/ttm: Restore ttm prefaulting
Thread-Index: AQHVaZllC5mEYnEjvkKjhlVosNMZ2qcpb6AA
Date: Fri, 13 Sep 2019 10:53:06 +0000
Message-ID: <0b4ef153-535d-593f-48ef-b0fb90b85096@amd.com>
References: <20190912183854.28194-1-thomas_os@shipmail.org>
In-Reply-To: <20190912183854.28194-1-thomas_os@shipmail.org>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR02CA0044.eurprd02.prod.outlook.com
 (2603:10a6:208:d2::21) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d70b5a3-458b-49cb-04d3-08d738388f1f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1642; 
x-ms-traffictypediagnostic: DM5PR12MB1642:
x-microsoft-antispam-prvs: <DM5PR12MB1642CE6B2BFA1D6B381A6F4B83B30@DM5PR12MB1642.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0159AC2B97
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(39860400002)(346002)(136003)(396003)(199004)(189003)(8676002)(58126008)(31696002)(54906003)(229853002)(478600001)(6116002)(110136005)(81166006)(14454004)(81156014)(6506007)(386003)(86362001)(4326008)(36756003)(446003)(8936002)(65806001)(65956001)(11346002)(2906002)(2616005)(316002)(102836004)(71190400001)(71200400001)(14444005)(99286004)(256004)(6246003)(76176011)(305945005)(25786009)(7736002)(52116002)(66446008)(64756008)(66556008)(476003)(5660300002)(53936002)(6486002)(66476007)(66574012)(6512007)(186003)(66946007)(486006)(46003)(31686004)(2501003)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1642;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aUoE4XHR+OU/7O7d7dSD8hyVyesa8z/5FRfEDY6oqp80nwdU8UW0bTRbIsN03dgIee5kJqBEh24E2fb3gjLnhwoKQ/OZ7YskUQtlhJUEzeanYOJ1ve9qpGbkdjI6RkE8TIzUX0hOu5aMaykOe+FXHKT/oiWz3tdz4xZyfDDLEdExDmyOXVj3MSmdB/gbNdioANyFNvyQ9sXyalMadRoKrjQIu8lSrqUn4bagG52V6brcuLMe5qJtuGkWCM0nUNyeRiTR8bVmPSKpzLSfwIHn5wkNryIL2+r2CcMNIVJhGYSazaLtb/jfI2RTf1nC/0brQVL7skjOG++2WawYLkiA5+DhdJmXGbolithJi3nReiX8T71sOsR1W00ILTutVt3KaMR8BttqAv76bHjMGs97cxNACU47VjEMxjSFaMlkX5c=
x-ms-exchange-transport-forked: True
Content-ID: <C6C186B1B09F7747A9958872625A273E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d70b5a3-458b-49cb-04d3-08d738388f1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2019 10:53:06.9382 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D7UNhphPvNlXauhAefYyZPGMM4Lx9xScMZAnMfc2OaKEZLt2/WrUPH7Twn7abvA8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1642
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JnIcowE4FKJP24uJRS+HcgIS8UFxiKR7eiXNMgOC8As=;
 b=p12kcDJqoPaCThhUO8HRZSLoMldswNWgwIeu6X9QES2ndwCtB+6JSbWZA/JUBVD7aQlqVHtZ1wuJsjZmSNG8vtQygNA1E0M8HsHWw2mrJ4WX1bmoXWlry8SE18IhMAjLTo3xfMvmOJUxM8yn7u9nhPr1hy3MAnNKD3Buk8KbQNo=
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
Cc: "pv-drivers@vmware.com" <pv-drivers@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 "linux-graphics-maintainer@vmware.com" <linux-graphics-maintainer@vmware.com>,
 Souptick Joarder <jrdr.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDkuMTkgdW0gMjA6Mzggc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToN
Cj4gRnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPg0KPg0KPiBD
b21taXQgNGRhYTRmYmEzYTM4ICgiZ3B1OiBkcm06IHR0bTogQWRkaW5nIG5ldyByZXR1cm4gdHlw
ZSB2bV9mYXVsdF90IikNCj4gYnJva2UgVFRNIHByZWZhdWx0aW5nLiBTaW5jZSB2bWZfaW5zZXJ0
X21peGVkKCkgdHlwaWNhbGx5IGFsd2F5cyByZXR1cm5zDQo+IFZNX0ZBVUxUX05PUEFHRSwgcHJl
ZmF1bHRpbmcgc3RvcHMgYWZ0ZXIgdGhlIHNlY29uZCBQVEUuDQo+DQo+IFJlc3RvcmUgKGFsbW9z
dCkgdGhlIG9yaWdpbmFsIGJlaGF2aW91ci4gVW5mb3J0dW5hdGVseSB3ZSBjYW4gbm8gbG9uZ2Vy
DQo+IHdpdGggdGhlIG5ldyB2bV9mYXVsdF90IHJldHVybiB0eXBlIGRldGVybWluZSB3aGV0aGVy
IGEgcHJlZmF1bHRpbmcNCj4gUFRFIGluc2VydGlvbiBoaXQgYW4gYWxyZWFkeSBwb3B1bGF0ZWQg
UFRFLCBhbmQgdGVybWluYXRlIHRoZSBpbnNlcnRpb24NCj4gbG9vcC4gSW5zdGVhZCB3ZSBjb250
aW51ZSB3aXRoIHRoZSBwcmUtZGV0ZXJtaW5lZCBudW1iZXIgb2YgcHJlZmF1bHRzLg0KPg0KPiBG
aXhlczogNGRhYTRmYmEzYTM4ICgiZ3B1OiBkcm06IHR0bTogQWRkaW5nIG5ldyByZXR1cm4gdHlw
ZSB2bV9mYXVsdF90IikNCj4gQ2M6IFNvdXB0aWNrIEpvYXJkZXIgPGpyZHIubGludXhAZ21haWwu
Y29tPg0KPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0K
PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+
DQoNClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+DQoNCkdvaW5nIHRvIHBpY2sgdGhhdCB1cCB3aGVuIEFsZXggcmViYXNlcyBvdXIgdXBzdHJl
YW0gYnJhbmNoLg0KDQpDaHJpc3RpYW4uDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm9fdm0uYyB8IDE2ICsrKysrKystLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3Zt
LmMNCj4gaW5kZXggNWE1ODBhZGViOWQxLi5hYTE4ZThhNTM3MjcgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm9fdm0uYw0KPiBAQCAtMjkwLDE1ICsyOTAsMTMgQEAgdm1fZmF1bHRfdCB0dG1fYm9f
dm1fZmF1bHRfcmVzZXJ2ZWQoc3RydWN0IHZtX2ZhdWx0ICp2bWYsDQo+ICAgCQllbHNlDQo+ICAg
CQkJcmV0ID0gdm1mX2luc2VydF9wZm4oJmN2bWEsIGFkZHJlc3MsIHBmbik7DQo+ICAgDQo+IC0J
CS8qDQo+IC0JCSAqIFNvbWVib2R5IGJlYXQgdXMgdG8gdGhpcyBQVEUgb3IgcHJlZmF1bHRpbmcg
dG8NCj4gLQkJICogYW4gYWxyZWFkeSBwb3B1bGF0ZWQgUFRFLCBvciBwcmVmYXVsdGluZyBlcnJv
ci4NCj4gLQkJICovDQo+IC0NCj4gLQkJaWYgKHVubGlrZWx5KChyZXQgPT0gVk1fRkFVTFRfTk9Q
QUdFICYmIGkgPiAwKSkpDQo+IC0JCQlicmVhazsNCj4gLQkJZWxzZSBpZiAodW5saWtlbHkocmV0
ICYgVk1fRkFVTFRfRVJST1IpKQ0KPiAtCQkJZ290byBvdXRfaW9fdW5sb2NrOw0KPiArCQkvKiBO
ZXZlciBlcnJvciBvbiBwcmVmYXVsdGVkIFBURXMgKi8NCj4gKwkJaWYgKHVubGlrZWx5KChyZXQg
JiBWTV9GQVVMVF9FUlJPUikpKSB7DQo+ICsJCQlpZiAoaSA9PSAwKQ0KPiArCQkJCWdvdG8gb3V0
X2lvX3VubG9jazsNCj4gKwkJCWVsc2UNCj4gKwkJCQlicmVhazsNCj4gKwkJfQ0KPiAgIA0KPiAg
IAkJYWRkcmVzcyArPSBQQUdFX1NJWkU7DQo+ICAgCQlpZiAodW5saWtlbHkoKytwYWdlX29mZnNl
dCA+PSBwYWdlX2xhc3QpKQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916F7562BA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 08:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A766E24E;
	Wed, 26 Jun 2019 06:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790087.outbound.protection.outlook.com [40.107.79.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3B66E24E;
 Wed, 26 Jun 2019 06:54:50 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1674.namprd12.prod.outlook.com (10.172.40.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Wed, 26 Jun 2019 06:54:48 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.2008.017; Wed, 26 Jun 2019
 06:54:48 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/1] drm/ttm: return -EBUSY if waiting for busy BO fails
Thread-Topic: [PATCH 1/1] drm/ttm: return -EBUSY if waiting for busy BO fails
Thread-Index: AQHVK+oDNe/OvjJJB0qJniNoSHCIOaatgDsA
Date: Wed, 26 Jun 2019 06:54:48 +0000
Message-ID: <410e8232-4edc-78ea-dc5b-4385cda01266@amd.com>
References: <20190626063958.19941-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190626063958.19941-1-Felix.Kuehling@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR1PR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::29) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 098de224-ce9d-4f58-12b0-08d6fa032dc8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1674; 
x-ms-traffictypediagnostic: DM5PR12MB1674:
x-microsoft-antispam-prvs: <DM5PR12MB1674384AF6DE3BBE00B3AC1583E20@DM5PR12MB1674.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(396003)(136003)(346002)(366004)(199004)(189003)(450100002)(76176011)(25786009)(14454004)(72206003)(8676002)(486006)(6246003)(5660300002)(81156014)(8936002)(65826007)(110136005)(36756003)(2906002)(6116002)(316002)(7736002)(31686004)(478600001)(6506007)(229853002)(2201001)(31696002)(305945005)(6436002)(2616005)(6486002)(2501003)(476003)(66574012)(68736007)(58126008)(53936002)(81166006)(6512007)(386003)(65956001)(65806001)(86362001)(446003)(11346002)(64126003)(64756008)(66476007)(73956011)(66446008)(66946007)(66556008)(186003)(99286004)(52116002)(71200400001)(71190400001)(14444005)(256004)(102836004)(46003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1674;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0kEqvuwcLV7Rr4PtBOree4kniU6km1g1UPzIomrTkjQPkViBknlTYlbY4ln2TEfLQAb1QBpCRcVwCWkN4WNdgInetscXeLlOMgNccat25ZI3VfcnNF17hsbxZhk1U0Bud5t6ac/Q0+NWwnKI7HgO8Q/ID8AcAsA1OTnIN2FeYouBb4ZeTYZttBNs04e7GGJMiY/4UUybECQ9tNCSRUvfpn2zanuro0of8thkFItg3UcP29aShul4djZv6PU+SldKHP4MN3I6V7eH+QOl1VjAMBeoyr7lj2qvfC2wms4Ta8edq135hXMzRbJVveU/nSYJdm8OgBFpyjLINGFeULTZumhxsOjFv4gMckXYz46cKyQCeG/bH4EAse4fU8C461B9sY45oi6qofqJ/rSvQ67UAjzoqpgr2H5KLzyj55yuJjA=
Content-ID: <5BC7B41B80C19743BF959CB7E9254276@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 098de224-ce9d-4f58-12b0-08d6fa032dc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 06:54:48.5861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1674
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLn7Vp5TqIn3X/zlCttNEvksITXgev+J2aeOUQaIITk=;
 b=PUdB/ssy9Ub5B2dsfj68NqVSpXOFDQSabcZTKsAQDWxmbFr7EyP+rJ8z1wLrlA3SWwCZXSdUigPuDZ3cL5Ahe/eMY4DmnakTlTdXqgccP/jMUjtiT8DheNWYVh4Sj6LRt7DHGtjyRDXkJEIRhkDZKd4uewSxEB4tQCShOdnbY7w=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjYuMDYuMTkgdW0gMDg6NDAgc2NocmllYiBLdWVobGluZywgRmVsaXg6DQo+IFJldHVybmlu
ZyAtRUFHQUlOIHByZXZlbnRzIHR0bV9ib19tZW1fc3BhY2UgZnJvbSB0cnlpbmcgYWx0ZXJuYXRl
DQo+IHBsYWNlbWVudHMgYW5kIGNhbiBsZWFkIHRvIGxpdmUtbG9ja3MgaW4gYW1kZ3B1X2NzLCBy
ZXRyeWluZw0KPiBpbmRlZmluaXRlbHkgYW5kIG5ldmVyIHN1Y2NlZWRpbmcuDQo+DQo+IEZpeGVz
OiBjZmNjNTJlNDc3ZTQgKCJkcm0vdHRtOiBmaXggYnVzeSBtZW1vcnkgdG8gZmFpbCBvdGhlciB1
c2VyIHYxMCIpDQo+IENDOiBDaHJpc3RpYW4gS29lbmlnIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5j
b20+DQo+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQu
Y29tPg0KDQpDcmFwLCBJIGZlYXJlZCB0aGF0IHRoaXMgY291bGQgbGl2ZS1sb2NrIHVuZGVyIHNv
bWUgY2lyY3Vtc3RhbmNlcywgYnV0IA0KaG9wZWQgdGhhdCB0aGlzIHdvdWxkIGJlIGEgcmF0aGVy
IHJhcmUgY2FzZS4NCg0KSG93IGRpZCB5b3UgcmVwcm9kdWNlIHRoaXM/DQoNCkFueXdheSBwYXRj
aCBpcyBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPiANCmZvciBub3cuDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8u
YyB8IDIgKy0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+IGluZGV4IGM3ZGU2NjdkNDgyYS4uNThjNDAzZWRh
MDRlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMNCj4gQEAgLTgyNyw3ICs4MjcsNyBAQCBzdGF0
aWMgaW50IHR0bV9tZW1fZXZpY3Rfd2FpdF9idXN5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
YnVzeV9ibywNCj4gICAJaWYgKCFyKQ0KPiAgIAkJcmVzZXJ2YXRpb25fb2JqZWN0X3VubG9jayhi
dXN5X2JvLT5yZXN2KTsNCj4gICANCj4gLQlyZXR1cm4gciA9PSAtRURFQURMSyA/IC1FQUdBSU4g
OiByOw0KPiArCXJldHVybiByID09IC1FREVBRExLID8gLUVCVVNZIDogcjsNCj4gICB9DQo+ICAg
DQo+ICAgc3RhdGljIGludCB0dG1fbWVtX2V2aWN0X2ZpcnN0KHN0cnVjdCB0dG1fYm9fZGV2aWNl
ICpiZGV2LA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

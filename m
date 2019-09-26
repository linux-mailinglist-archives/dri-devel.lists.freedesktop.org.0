Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F47BEC62
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 09:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BE36EDF3;
	Thu, 26 Sep 2019 07:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710051.outbound.protection.outlook.com [40.107.71.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7126EDF3;
 Thu, 26 Sep 2019 07:12:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SzzpHppHKlFvPO/Nw+2q8Q1YPml3NRxgI1bfnyV2ComyMLL3Yz8uPdyyslO4Ienk65xQw3ERhL4iK2Ktskl9A7hZoKx2SLR1by/qdMqDlo3fgVGg97wBOPytup/HCiO91MLEEkfoK4Y2RK6C4AHb9sl2zN/BVu+c8IzwJstQTjX+wZCZTjVqEupOty4vqW2a64irwQ5sjC7CoxGAsE/zdrTt6k0pPUbDhe4Qvst8ISCAuF0tI9zGKJ63GWh6OE2kdmyw29dC/oG+VQcV84b0HFgX4NmS4qK5wLhLJm2c/v9zxJ1+oB05W9pQWU925HT5fAysXdqXomg02PxLSq7rHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYuck+EfQLhtQnnS/WY/LCdWDo+ZR/D+3/cDqFHZ3uQ=;
 b=Vx3NOJWs32R5iBiy9PTbxT9SgPxED+4A7ubYohFRwRw+lVMVPDe9CkfCAIfsuAb/aRHY1q5OJfvUkwie9qo1Y23Zpe5nHMk43gUYsTF3MFoAo0iq1IcUQhLFaf1zbhzx3SVfZ+ST3M5Z6Hnr1ItkHAduFG6kZ17FsfkiCCmB0PbxvXqpttX+T2fB/3W5wvouU+zU9GmKkDRcA1xBFIynXnOiVYQsWAmliqu+6EFftE3gfsGhvLPRLv0CqQsYx2C+o/RAY4glb2uiTyS+LLOuV5hID1LDYHehZb3M8NmuUJOBgUpoWFKwjyc/KEkPXmF6DLTrQ/U16lBDdmoVjRYBJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1579.namprd12.prod.outlook.com (10.172.38.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Thu, 26 Sep 2019 07:12:51 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2284.028; Thu, 26 Sep 2019
 07:12:51 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v3 10/11] drm/amdgpu: job is secure iff CS is secure (v4)
Thread-Topic: [PATCH v3 10/11] drm/amdgpu: job is secure iff CS is secure (v4)
Thread-Index: AQHVc67eAOP3HjJHn0i9QUAnxAtta6c8eLkAgAAA+ECAARKJAA==
Date: Thu, 26 Sep 2019 07:12:51 +0000
Message-ID: <51436784-ed76-b326-534a-86301382fc59@amd.com>
References: <1569422279-6609-1-git-send-email-ray.huang@amd.com>
 <e04af4ef-aa3b-534b-8c5b-e6ee11f677a5@amd.com>
 <MN2PR12MB3309B9F92121C846639C87ECEC870@MN2PR12MB3309.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3309B9F92121C846639C87ECEC870@MN2PR12MB3309.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0107.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::23) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6edcc79e-88ff-49b0-a35d-08d74250f180
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1579; 
x-ms-traffictypediagnostic: DM5PR12MB1579:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1579878F98243FE6868E1B6183860@DM5PR12MB1579.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(396003)(366004)(39860400002)(13464003)(189003)(199004)(478600001)(81166006)(81156014)(6246003)(4326008)(186003)(6116002)(2616005)(316002)(486006)(25786009)(65956001)(65806001)(58126008)(476003)(54906003)(110136005)(256004)(36756003)(86362001)(31696002)(7736002)(6636002)(52116002)(305945005)(99286004)(5660300002)(102836004)(53546011)(2201001)(71190400001)(71200400001)(6506007)(386003)(76176011)(2906002)(66946007)(66476007)(66446008)(14454004)(66556008)(64756008)(46003)(229853002)(6436002)(6486002)(11346002)(31686004)(6512007)(450100002)(446003)(8936002)(8676002)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1579;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: y4gegd40jAGZ4MbzN6HYesWJFk5ku3BzUiBP3G4cQ04TA9Vl8IGwyvHbzh7yrxRkZV8Hf8BQFFmeehlkSbVVnBwBRr+MgAY51JySSvz3qO/U0pic69vCFmnj087/1D4fc0crVDMAr8Gxwc4f9QXXS8Qba/w4ccQh71OaWQj85Ztt6uqiNPKoeY92GRHEq/2yMK3nGhXnw9W7cuTsLpgy0aEj6TnDw8afg6WtOdqx37oTw6XI0yLO9w6GDlolgH4sn1TeAz1F9VXzy8/YvtgVe2/8/HgIqDe9use/tWV40t7yyqX2yJfpmblyrRHWZIupymH/j7NgyVOOfXllw9+XCxewXJCTYhKxYZrwXfg4K5CmlIB6xNFqOh5iNcbtEl2WMgXzsvY10/fJrBta0urUA/RefuNb9bhZXv2hpm1v7zo=
Content-ID: <D56155050BD1204B8769AE67372B0A44@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6edcc79e-88ff-49b0-a35d-08d74250f180
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2019 07:12:51.4999 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LT9eNiaaZRXAEIxiRD3lLNSDVy22CxrCdldJvzPhvTfPfXEwaqe6QsXiCnQyQClD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1579
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iYuck+EfQLhtQnnS/WY/LCdWDo+ZR/D+3/cDqFHZ3uQ=;
 b=o7sZcfZvyKB/gTIrPFpBVy/jcOFnGiiRHxFILXtvhUAKKAblSfLdTgX3t7qFvUx2xW8YoeeuPOZRekwaiBaPlA2myIxZJMUl0ds5kq57NDo73nLjO+u87lWcfrEWb7dpG0aATE7YRy8c5MwbsCAxKnerDMsIVwZsWi+EKXTSL2k=
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
Cc: "Tuikov, Luben" <Luben.Tuikov@amd.com>, "Liu, Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDkuMTkgdW0gMTY6NTQgc2NocmllYiBIdWFuZywgUmF5Og0KPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29l
bmlnQGFtZC5jb20+DQo+PiBTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAyNSwgMjAxOSAxMDo0
NyBQTQ0KPj4gVG86IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc7IGRyaS0NCj4+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
RGV1Y2hlciwgQWxleGFuZGVyDQo+PiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NCj4+IENj
OiBUdWlrb3YsIEx1YmVuIDxMdWJlbi5UdWlrb3ZAYW1kLmNvbT47IExpdSwgQWFyb24NCj4+IDxB
YXJvbi5MaXVAYW1kLmNvbT4NCj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMTAvMTFdIGRybS9h
bWRncHU6IGpvYiBpcyBzZWN1cmUgaWZmIENTIGlzIHNlY3VyZSAodjQpDQo+Pg0KPj4gQW0gMjUu
MDkuMTkgdW0gMTY6Mzggc2NocmllYiBIdWFuZywgUmF5Og0KPj4+IE1hcmsgYSBqb2IgYXMgc2Vj
dXJlLCBpZiBhbmQgb25seSBpZiB0aGUgY29tbWFuZCBzdWJtaXNzaW9uIGZsYWcgaGFzDQo+Pj4g
dGhlIHNlY3VyZSBmbGFnIHNldC4NCj4+Pg0KPj4+IHYyOiBmaXggdGhlIG51bGwgam9iIHBvaW50
ZXIgd2hpbGUgaW4gdm1pZCAwIHN1Ym1pc3Npb24uDQo+Pj4gdjM6IENvbnRleHQgLS0+IENvbW1h
bmQgc3VibWlzc2lvbi4NCj4+PiB2NDogZmlsbGluZyBjcyBwYXJzZXIgd2l0aCBjcy0+aW4uZmxh
Z3MNCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+
DQo+Pj4gQ28tZGV2ZWxvcGVkLWJ5OiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29t
Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+
DQo+Pj4gUmV2aWV3ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4NCj4+PiAtLS0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCAg
ICAgfCAgMyArKysNCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3Mu
YyAgfCAxMSArKysrKysrKysrLQ0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9pYi5jICB8ICA0ICsrLS0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfam9iLmggfCAgMiArKw0KPj4+ICAgIDQgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHUuaA0KPj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1LmgNCj4+PiBpbmRleCA2OTdlOGU1Li5mZDYwNjk1IDEwMDY0NA0KPj4+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCj4+PiBAQCAtNDg1LDYgKzQ4NSw5IEBAIHN0cnVjdCBh
bWRncHVfY3NfcGFyc2VyIHsNCj4+PiAgICAJdWludDY0X3QJCQlieXRlc19tb3ZlZDsNCj4+PiAg
ICAJdWludDY0X3QJCQlieXRlc19tb3ZlZF92aXM7DQo+Pj4NCj4+PiArCS8qIHNlY3VyZSBjcyAq
Lw0KPj4+ICsJYm9vbAkJCQlpc19zZWN1cmU7DQo+Pj4gKw0KPj4+ICAgIAkvKiB1c2VyIGZlbmNl
ICovDQo+Pj4gICAgCXN0cnVjdCBhbWRncHVfYm9fbGlzdF9lbnRyeQl1Zl9lbnRyeTsNCj4+Pg0K
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYw0K
Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMNCj4+PiBpbmRleCA1
MWYzZGIwLi45MDM4ZGMxIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9jcy5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2NzLmMNCj4+PiBAQCAtMTMzLDYgKzEzMywxNCBAQCBzdGF0aWMgaW50IGFtZGdwdV9jc19w
YXJzZXJfaW5pdChzdHJ1Y3QNCj4+IGFtZGdwdV9jc19wYXJzZXIgKnAsIHVuaW9uIGRybV9hbWRn
cHVfY3MNCj4+PiAgICAJCWdvdG8gZnJlZV9jaHVuazsNCj4+PiAgICAJfQ0KPj4+DQo+Pj4gKwkv
KioNCj4+PiArCSAqIFRoZSBjb21tYW5kIHN1Ym1pc3Npb24gKGNzKSBpcyBhIHVuaW9uLCBzbyBh
biBhc3NpZ25tZW50IHRvDQo+Pj4gKwkgKiAnb3V0JyBpcyBkZXN0cnVjdGl2ZSB0byB0aGUgY3Mg
KGF0IGxlYXN0IHRoZSBmaXJzdCA4DQo+Pj4gKwkgKiBieXRlcykuIEZvciB0aGlzIHJlYXNvbiwg
aW5xdWlyZSBhYm91dCB0aGUgZmxhZ3MgYmVmb3JlIHRoZQ0KPj4+ICsJICogYXNzaWdubWVudCB0
byAnb3V0Jy4NCj4+PiArCSAqLw0KPj4+ICsJcC0+aXNfc2VjdXJlID0gY3MtPmluLmZsYWdzICYg
QU1ER1BVX0NTX0ZMQUdTX1NFQ1VSRTsNCj4+PiArDQo+Pj4gICAgCS8qIGdldCBjaHVua3MgKi8N
Cj4+PiAgICAJY2h1bmtfYXJyYXlfdXNlciA9IHU2NF90b191c2VyX3B0cihjcy0+aW4uY2h1bmtz
KTsNCj4+PiAgICAJaWYgKGNvcHlfZnJvbV91c2VyKGNodW5rX2FycmF5LCBjaHVua19hcnJheV91
c2VyLCBAQCAtMTI1Miw4DQo+Pj4gKzEyNjAsOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9jc19zdWJt
aXQoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsDQo+Pj4gICAgCQlwLT5jdHgtPnByZWFtYmxl
X3ByZXNlbnRlZCA9IHRydWU7DQo+Pj4gICAgCX0NCj4+Pg0KPj4+IC0JY3MtPm91dC5oYW5kbGUg
PSBzZXE7DQo+Pj4gKwlqb2ItPnNlY3VyZSA9IHAtPmlzX3NlY3VyZTsNCj4+PiAgICAJam9iLT51
Zl9zZXF1ZW5jZSA9IHNlcTsNCj4+PiArCWNzLT5vdXQuaGFuZGxlID0gc2VxOw0KPj4gQXQgbGVh
c3QgaXQgaXMgbm8gbG9uZ2VyIGFjY2Vzc2luZyBjcy0+aW4sIGJ1dCB0aGF0IHN0aWxsIGxvb2tz
IGxpa2UgdGhlIHdyb25nIHBsYWNlDQo+PiB0byBpbml0aWFsaXplIHRoZSBqb2IuDQo+Pg0KPj4g
V2h5IGNhbid0IHdlIGZpbGwgdGhhdCBpbiBkaXJlY3RseSBhZnRlciBhbWRncHVfam9iX2FsbG9j
KCkgPw0KPiBUaGVyZSBpcyBub3QgaW5wdXQgbWVtYmVyIHRoYXQgaXMgc2VjdXJlIHJlbGF0ZWQg
aW4gYW1kZ3B1X2pvYl9hbGxvYygpIGV4Y2VwdCBhZGQgYW4gb25lOg0KPiAgIA0KPiBhbWRncHVf
am9iX2FsbG9jKGFkZXYsIG51bV9pYnMsIGpvYiwgdm0sIHNlY3VyZSkNCj4NCj4gSXQgbG9va3Mg
dG9vIG11Y2gsIGlzbid0IGl0Pw0KDQpZb3Ugc2hvdWxkIG5vdCBhZGQgYSBuZXcgcGFyYW1ldGVy
LCBidXQgcmF0aGVyIHNldCB0aGUgbWVtYmVyIGluIA0KYW1kZ3B1X2NzX3BhcnNlcl9pbml0KCkg
YWZ0ZXIgYW1kZ3B1X2pvYl9hbGxvYygpLg0KDQpPciBtYXliZSBldmVuIGJldHRlciBhZGQgdGhh
dCBpbnRvIGFtZGdwdV9jc19pYl9maWxsKCksIGNhdXNlIGhlcmUgaXMgDQp3aGVyZSB3ZSBmaWxs
IGluIG1vc3Qgb2YgdGhlIGpvYiBkZXNjcmlwdGlvbi4NCg0KUmVnYXJkcywNCkNocmlzdGlhbi4N
Cg0KPg0KPiBUaGFua3MsDQo+IFJheQ0KPg0KPj4gUmVnYXJkcywNCj4+IENocmlzdGlhbi4NCj4+
DQo+Pj4gICAgCWFtZGdwdV9qb2JfZnJlZV9yZXNvdXJjZXMoam9iKTsNCj4+Pg0KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYw0KPj4+IGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMNCj4+PiBpbmRleCBlMWRjMjI5Li5j
YjliNjUwIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9pYi5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMN
Cj4+PiBAQCAtMjEwLDcgKzIxMCw3IEBAIGludCBhbWRncHVfaWJfc2NoZWR1bGUoc3RydWN0IGFt
ZGdwdV9yaW5nICpyaW5nLA0KPj4gdW5zaWduZWQgbnVtX2licywNCj4+PiAgICAJaWYgKGpvYiAm
JiByaW5nLT5mdW5jcy0+ZW1pdF9jbnR4Y250bCkgew0KPj4+ICAgIAkJc3RhdHVzIHw9IGpvYi0+
cHJlYW1ibGVfc3RhdHVzOw0KPj4+ICAgIAkJc3RhdHVzIHw9IGpvYi0+cHJlZW1wdGlvbl9zdGF0
dXM7DQo+Pj4gLQkJYW1kZ3B1X3JpbmdfZW1pdF9jbnR4Y250bChyaW5nLCBzdGF0dXMsIGZhbHNl
KTsNCj4+PiArCQlhbWRncHVfcmluZ19lbWl0X2NudHhjbnRsKHJpbmcsIHN0YXR1cywgam9iLT5z
ZWN1cmUpOw0KPj4+ICAgIAl9DQo+Pj4NCj4+PiAgICAJZm9yIChpID0gMDsgaSA8IG51bV9pYnM7
ICsraSkgew0KPj4+IEBAIC0yMjksNyArMjI5LDcgQEAgaW50IGFtZGdwdV9pYl9zY2hlZHVsZShz
dHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsDQo+PiB1bnNpZ25lZCBudW1faWJzLA0KPj4+ICAgIAl9
DQo+Pj4NCj4+PiAgICAJaWYgKHJpbmctPmZ1bmNzLT5lbWl0X3RteikNCj4+PiAtCQlhbWRncHVf
cmluZ19lbWl0X3RteihyaW5nLCBmYWxzZSwgZmFsc2UpOw0KPj4+ICsJCWFtZGdwdV9yaW5nX2Vt
aXRfdG16KHJpbmcsIGZhbHNlLCBqb2IgPyBqb2ItPnNlY3VyZSA6IGZhbHNlKTsNCj4+Pg0KPj4+
ICAgICNpZmRlZiBDT05GSUdfWDg2XzY0DQo+Pj4gICAgCWlmICghKGFkZXYtPmZsYWdzICYgQU1E
X0lTX0FQVSkpDQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9qb2IuaA0KPj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5o
DQo+Pj4gaW5kZXggZGM3ZWU5My4uYWEwZTM3NSAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmgNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfam9iLmgNCj4+PiBAQCAtNjMsNiArNjMsOCBAQCBzdHJ1Y3QgYW1k
Z3B1X2pvYiB7DQo+Pj4gICAgCXVpbnQ2NF90CQl1Zl9hZGRyOw0KPj4+ICAgIAl1aW50NjRfdAkJ
dWZfc2VxdWVuY2U7DQo+Pj4NCj4+PiArCS8qIHRoZSBqb2IgaXMgZHVlIHRvIGEgc2VjdXJlIGNv
bW1hbmQgc3VibWlzc2lvbiAqLw0KPj4+ICsJYm9vbAkJCXNlY3VyZTsNCj4+PiAgICB9Ow0KPj4+
DQo+Pj4gICAgaW50IGFtZGdwdV9qb2JfYWxsb2Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYs
IHVuc2lnbmVkIG51bV9pYnMsDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==

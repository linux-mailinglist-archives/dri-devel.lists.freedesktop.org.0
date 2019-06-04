Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 333DB34735
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 14:46:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCAE89709;
	Tue,  4 Jun 2019 12:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760079.outbound.protection.outlook.com [40.107.76.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D3E89709;
 Tue,  4 Jun 2019 12:46:27 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1580.namprd12.prod.outlook.com (10.172.40.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 12:46:26 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 12:46:26 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] dma-buf: Discard old fence_excl on retrying
 get_fences_rcu for realloc
Thread-Topic: [PATCH] dma-buf: Discard old fence_excl on retrying
 get_fences_rcu for realloc
Thread-Index: AQHVGtKiqGqv0rm5DkKfrun9ePGddKaLcVwA
Date: Tue, 4 Jun 2019 12:46:25 +0000
Message-ID: <1580f188-3685-cb74-c78b-440f35c32794@amd.com>
References: <20190604123947.20713-1-chris@chris-wilson.co.uk>
In-Reply-To: <20190604123947.20713-1-chris@chris-wilson.co.uk>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6P195CA0072.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::49) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53a6af90-2026-411e-bece-08d6e8eaa7e1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1580; 
x-ms-traffictypediagnostic: DM5PR12MB1580:
x-microsoft-antispam-prvs: <DM5PR12MB1580B5482EDACA85404177DC83150@DM5PR12MB1580.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(376002)(396003)(346002)(366004)(199004)(189003)(52116002)(5660300002)(81156014)(99286004)(81166006)(2501003)(71190400001)(71200400001)(6116002)(476003)(66574012)(58126008)(8676002)(8936002)(486006)(7736002)(36756003)(305945005)(14444005)(256004)(11346002)(2616005)(76176011)(64126003)(102836004)(6506007)(86362001)(446003)(31696002)(6436002)(6246003)(31686004)(65806001)(65956001)(386003)(4326008)(6486002)(478600001)(316002)(46003)(2906002)(25786009)(66946007)(53936002)(68736007)(54906003)(229853002)(66556008)(64756008)(73956011)(72206003)(65826007)(14454004)(66476007)(66446008)(186003)(6512007)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1580;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xr7Yx/i44NtzjFQ+bkk6742CCVifG9PnIDZZUHYGgJFBOubJ420XaG0PrVzdwskSiGiz+yu5iQ5S8aBH4b2O6t1Jj8Or3RBvKrSobVqzltCs6CMU8OfdfobK+bVAnLos/wc4UOShFKWsZkzOQ8t/TUwY2I1P5VnaBwM2t/CNGqAucMxT6D9chOCGQtQ2YsuHrJbHmMUlJHKzAIDJgLqirJBynsRtaWVJe3sMHLFX8idf+yhcOip3d4StACDbpJvtLJbwB0HWI9XF+MAvS04dVxRF0P4he4M8hqfW+dVIVrle2OLvVAl/2indUYGtTGFKynmFDmXm2Hs32YqVrM1/VHBkxyb82ovC992vbKBKTEKENvPkZg1kXgRt3l1d0F5voRrGCiNHMkDIPo7K3dnkiWC+pMq3SW0iObt3M506Qy4=
Content-ID: <F9A8CE21112CB741AC949B3971226EFB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53a6af90-2026-411e-bece-08d6e8eaa7e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 12:46:25.9737 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1580
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cY7jatO0BMFHz/xemuKNTu2IWYp9Y3qET6VTfSp8CoM=;
 b=pH5iZ8jGWp1utfW3DM4AdTqWrdezlFkxhocdWx7Vf1bzRyG2bBT/05MMG4AnKGGzEqsTpWrNg6bd6wQ+/VifO5qFDJLmUpX5nKlYBVaOBKotmGQlUmTGLVXXKP00tH+dKlikUjFLgxMov1pgOqMjv5RqICWXs7sdbU5Y6R7A2tA=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDYuMTkgdW0gMTQ6Mzkgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IElmIHdlIGhhdmUg
dG8gZHJvcCB0aGUgc2VxY291bnQgJiByY3UgbG9jayB0byBwZXJmb3JtIGEga3JlYWxsb2MsIHdl
DQo+IGhhdmUgdG8gcmVzdGFydCB0aGUgbG9vcC4gSW4gZG9pbmcgc28sIGJlIGNhcmVmdWwgbm90
IHRvIGxvc2UgdHJhY2sgb2YNCj4gdGhlIGFscmVhZHkgYWNxdWlyZWQgZXhjbHVzaXZlIGZlbmNl
Lg0KPg0KPiBGaXhlczogZmVkZjU0MTMyZDI0ICgiZG1hLWJ1ZjogUmVzdGFydCByZXNlcnZhdGlv
bl9vYmplY3RfZ2V0X2ZlbmNlc19yY3UoKSBhZnRlciB3cml0ZXMiKSAjdjQuMTANCj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+DQo+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPg0KPiBDYzogTWFhcnRlbiBMYW5r
aG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gQ2M6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gQ2M6IFN1bWl0IFNlbXdhbCA8c3VtaXQuc2Vt
d2FsQGxpbmFyby5vcmc+DQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IC0tLQ0KPiAg
IGRyaXZlcnMvZG1hLWJ1Zi9yZXNlcnZhdGlvbi5jIHwgNiArKysrKysNCj4gICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYv
cmVzZXJ2YXRpb24uYyBiL2RyaXZlcnMvZG1hLWJ1Zi9yZXNlcnZhdGlvbi5jDQo+IGluZGV4IDRk
MzJlMmM2Nzg2Mi4uNzA0NTAzZGY0ODkyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2RtYS1idWYv
cmVzZXJ2YXRpb24uYw0KPiArKysgYi9kcml2ZXJzL2RtYS1idWYvcmVzZXJ2YXRpb24uYw0KPiBA
QCAtMzY1LDYgKzM2NSwxMiBAQCBpbnQgcmVzZXJ2YXRpb25fb2JqZWN0X2dldF9mZW5jZXNfcmN1
KHN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgKm9iaiwNCj4gICAJCQkJCSAgIEdGUF9OT1dBSVQg
fCBfX0dGUF9OT1dBUk4pOw0KPiAgIAkJCWlmICghbnNoYXJlZCkgew0KPiAgIAkJCQlyY3VfcmVh
ZF91bmxvY2soKTsNCj4gKw0KPiArCQkJCWlmIChmZW5jZV9leGNsKSB7DQo+ICsJCQkJCWRtYV9m
ZW5jZV9wdXQoZmVuY2VfZXhjbCk7DQo+ICsJCQkJCWZlbmNlX2V4Y2wgPSBOVUxMOw0KPiArCQkJ
CX0NCj4gKw0KDQpkbWFfZmVuY2VfcHV0IGlzIE5VTEwgc2F2ZSwgc28gbm8gbmVlZCBmb3IgdGhl
IGlmLg0KDQpCdXQgYXBhcnQgZnJvbSB0aGF0IGEgZ29vZCBjYXRjaCwNCkNocmlzdGlhbi4NCg0K
PiAgIAkJCQluc2hhcmVkID0ga3JlYWxsb2Moc2hhcmVkLCBzeiwgR0ZQX0tFUk5FTCk7DQo+ICAg
CQkJCWlmIChuc2hhcmVkKSB7DQo+ICAgCQkJCQlzaGFyZWQgPSBuc2hhcmVkOw0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

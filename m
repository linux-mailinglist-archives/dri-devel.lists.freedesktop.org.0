Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F24A1435AD
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 13:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB7B89296;
	Thu, 13 Jun 2019 11:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780085.outbound.protection.outlook.com [40.107.78.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F9089296
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 11:50:04 +0000 (UTC)
Received: from MN2PR05MB6141.namprd05.prod.outlook.com (20.178.241.217) by
 MN2PR05MB6799.namprd05.prod.outlook.com (52.132.172.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.8; Thu, 13 Jun 2019 11:49:54 +0000
Received: from MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::5088:14e2:252d:98d0]) by MN2PR05MB6141.namprd05.prod.outlook.com
 ([fe80::5088:14e2:252d:98d0%6]) with mapi id 15.20.2008.002; Thu, 13 Jun 2019
 11:49:54 +0000
From: Thomas Hellstrom <thellstrom@vmware.com>
To: "hdanton@sina.com" <hdanton@sina.com>
Subject: Re: [PATCH v5 5/9] drm/ttm: TTM fault handler helpers
Thread-Topic: [PATCH v5 5/9] drm/ttm: TTM fault handler helpers
Thread-Index: AQHVIaAR3N+c1IitxUex/Yj7ZwM4Q6aZePmA
Date: Thu, 13 Jun 2019 11:49:54 +0000
Message-ID: <28b5337b668808eff51e5af9c8ab7f0a4c5340fc.camel@vmware.com>
References: <20190613042526.12028-1-hdanton@sina.com>
In-Reply-To: <20190613042526.12028-1-hdanton@sina.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [155.4.205.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2084c71c-a2f9-47ca-51bb-08d6eff54050
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR05MB6799; 
x-ms-traffictypediagnostic: MN2PR05MB6799:
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-microsoft-antispam-prvs: <MN2PR05MB679994B2DC1397335D93A92BA1EF0@MN2PR05MB6799.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(376002)(39860400002)(346002)(396003)(136003)(199004)(189003)(7736002)(64756008)(2906002)(2616005)(6486002)(14454004)(66066001)(476003)(1730700003)(68736007)(76176011)(446003)(99286004)(8676002)(4326008)(305945005)(8936002)(81166006)(478600001)(6436002)(6246003)(6512007)(91956017)(53936002)(5640700003)(73956011)(81156014)(11346002)(66446008)(66946007)(2351001)(66556008)(66476007)(25786009)(486006)(14444005)(6916009)(229853002)(2501003)(5660300002)(54906003)(256004)(3846002)(6116002)(102836004)(71190400001)(36756003)(71200400001)(66574012)(118296001)(186003)(86362001)(6506007)(76116006)(26005)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR05MB6799;
 H:MN2PR05MB6141.namprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ukOBnGF5in9pVUnEb8jMh//f3x5MZxsVn3J40CNLezfaDCQGUUZIvnTJJNE7SGs8LA7+g5SNw2YT8CxoLWqIyWNcvwCHJoWuU7SJMDbn0zzRt2gyJeZau/Wia7P3d5nw/E0xvaaY93BsBnwX0S78y3BGgYdwKc4dWpqGgIuHxjJYGYCYy1aF5jySrnRyygBLueg3GcCvnotEuKltVENFs2lexKpyOaMjt779qR1eyEjEXrF5sN0StqgCCDjoeKPErf8/uH5XSnNHOUnSt3DndXcJdg4tD6S3/x78V/mghryIt7L0rsAIrHywocTfy2KAsM2SC3lhnhEStO4vXDJgMNAke24/34fnqCVD2W47ShuhzMkRN6vUS5Bg/zxZXTJEJI05pw5tbuTq7IeGyTlvxM5ZWvC56739/AHZ04/Z9g0=
Content-ID: <7CFB67E5B78AB3408CF54DC05DEBD4FF@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2084c71c-a2f9-47ca-51bb-08d6eff54050
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 11:49:54.3266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: thellstrom@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6799
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vmware.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nErbvXHmxE8QN1LwHycZIfp1JvRfxW+d/32FhRPXshE=;
 b=AMPdTC5gtAwrEoUQ6kqa4Yw04eX4rw9VGi7Kpus+j3z0NeGjlg+q0TtwBBvmbAhlrim70TOq+EPgtNMkcCJ9fDkJ/eKHgT8X8kaTjCKCFmj2oVMa0v4kJrmNRK5nnylK3LcsW4eJyj/Kg60fRxE2YY8CzViliX2mv905aXUynzw=
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
Cc: Pv-drivers <Pv-drivers@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "nadav.amit@gmail.com" <nadav.amit@gmail.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhDQoNCk9uIFRodSwgMjAxOS0wNi0xMyBhdCAxMjoyNSArMDgwMCwgSGlsbGYgRGFudG9uIHdy
b3RlOg0KPiBIZWxsbyBUaG9tYXMNCj4gDQo+IE9uIFdlZCwgMTIgSnVuIDIwMTkgMDg6NDI6Mzkg
KzAyMDAgVGhvbWFzIEhlbGxzdHJvbSB3cm90ZToNCj4gPiBGcm9tOiBUaG9tYXMgSGVsbHN0cm9t
IDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+DQo+ID4gDQo+ID4gV2l0aCB0aGUgdm13Z2Z4IGRpcnR5
IHRyYWNraW5nLCB0aGUgZGVmYXVsdCBUVE0gZmF1bHQgaGFuZGxlciBpcw0KPiA+IG5vdA0KPiA+
IGNvbXBsZXRlbHkgc3VmZmljaWVudCAodm13Z2Z4IG5lZWQgdG8gbW9kaWZ5IHRoZSB2bWEtPnZt
X2ZsYWdzDQo+ID4gbWVtYmVyLA0KPiA+IGFuZCBhbHNvIG5lZWRzIHRvIHJlc3RyaWN0IHRoZSBu
dW1iZXIgb2YgcHJlZmF1bHRzKS4NCj4gPiANCj4gPiBXZSBhbHNvIHdhbnQgdG8gcmVwbGljYXRl
IHRoZSBuZXcgdHRtX2JvX3ZtX3Jlc2VydmUoKSBmdW5jdGlvbmFsaXR5DQo+ID4gDQo+ID4gU28g
c3RhcnQgdHVybmluZyB0aGUgVFRNIHZtIGNvZGUgaW50byBoZWxwZXJzOg0KPiA+IHR0bV9ib192
bV9mYXVsdF9yZXNlcnZlZCgpDQo+ID4gYW5kIHR0bV9ib192bV9yZXNlcnZlKCksIGFuZCBwcm92
aWRlIGEgZGVmYXVsdCBUVE0gZmF1bHQgaGFuZGxlcg0KPiA+IGZvciBvdGhlcg0KPiA+IGRyaXZl
cnMgdG8gdXNlLg0KPiA+IA0KPiA+IENjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5r
b2VuaWdAYW1kLmNvbT4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9t
IDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6ICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiAjdjENCj4gPiAtLS0NCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyB8IDE3NSArKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tDQo+ID4gLS0tLQ0KPiA+ICBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oICAgIHwgIDEw
ICsrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTEzIGluc2VydGlvbnMoKyksIDcyIGRlbGV0aW9u
cygtKQ0KPiA+IA0KPiA+IA0KDQouLi4NCg0KDQo+ID4gLQkvKg0KPiA+IC0JICogV29yayBhcm91
bmQgbG9ja2luZyBvcmRlciByZXZlcnNhbCBpbiBmYXVsdCAvIG5vcGZuDQo+ID4gLQkgKiBiZXR3
ZWVuIG1tYXBfc2VtIGFuZCBib19yZXNlcnZlOiBQZXJmb3JtIGEgdHJ5bG9jayBvcGVyYXRpb24N
Cj4gPiAtCSAqIGZvciByZXNlcnZlLCBhbmQgaWYgaXQgZmFpbHMsIHJldHJ5IHRoZSBmYXVsdCBh
ZnRlciB3YWl0aW5nDQo+ID4gLQkgKiBmb3IgdGhlIGJ1ZmZlciB0byBiZWNvbWUgdW5yZXNlcnZl
ZC4NCj4gPiAtCSAqLw0KPiBJcyBpdCBsaWtlbHkgdG8gbm90IGN1dCB0aGUgY29tbWVudCBhcyB0
aGUgdHJ5bG9jayBpcyBzdGlsbCB0aGVyZT8NCg0KWWVzLCBJJ2xsIHJlLWFkZCB0aGF0LiBJdCB3
YXMgcmVtb3ZlZCBpbiBhbiBlYXJseSB2ZXJzaW9uIG9mIHRoZSBwYXRjaA0Kd2hlbiBJIGFjdHVh
bGx5IHJlbW92ZWQgdGhlIHRyeWxvY2sgYXMgd2VsbCwgYnV0IEkgY2hhbmdlZCBteSBtaW5kIG9u
DQp0aGF0Lg0KDQo+IA0KPiA+ICAJaWYgKHVubGlrZWx5KCFyZXNlcnZhdGlvbl9vYmplY3RfdHJ5
bG9jayhiby0+cmVzdikpKSB7DQo+ID4gIAkJaWYgKHZtZi0+ZmxhZ3MgJiBGQVVMVF9GTEFHX0FM
TE9XX1JFVFJZKSB7DQo+ID4gIAkJCWlmICghKHZtZi0+ZmxhZ3MgJiBGQVVMVF9GTEFHX1JFVFJZ
X05PV0FJVCkpIHsNCj4gPiBAQCAtMTUxLDE0ICsxNDgsNTUgQEAgc3RhdGljIHZtX2ZhdWx0X3Qg
dHRtX2JvX3ZtX2ZhdWx0KHN0cnVjdA0KPiA+IHZtX2ZhdWx0ICp2bWYpDQo+ID4gIAkJcmV0dXJu
IFZNX0ZBVUxUX05PUEFHRTsNCj4gPiAgCX0NCj4gPiAgDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiAr
fQ0KPiA+ICtFWFBPUlRfU1lNQk9MKHR0bV9ib192bV9yZXNlcnZlKTsNCg0KLi4uDQoNCg0KPiA+
IA0KPiA+IC0JaWYgKHVubGlrZWx5KGVyciAhPSAwKSkgew0KPiA+IC0JCXJldCA9IFZNX0ZBVUxU
X1NJR0JVUzsNCj4gPiAtCQlnb3RvIG91dF9pb191bmxvY2s7DQo+ID4gLQl9DQo+ID4gKwlpZiAo
dW5saWtlbHkoZXJyICE9IDApKQ0KPiA+ICsJCXJldHVybiBWTV9GQVVMVF9TSUdCVVM7DQo+ID4g
IA0KPiBJcyBpdCBsaWtlbHkgYSB0eXBvIHRvIHNraXAgdGhlIGlvX3VubG9jaz8NCj4gDQo+IC0t
DQo+IEhpbGxmDQoNCg0KWWVzLiBHb29kIGNhdGNoLiBUaGF0IGlvX3VubG9jayBzaG91bGQgZGVm
aW5pdGVseSByZW1haW4uDQoNCkknbGwgcmVzcGluIGFuZCByZXNlbmQgdG8gZHJpLWRldmVsIGFu
ZCBsa21sIG9ubHkuDQoNClRoYW5rcywNClRob21hcw0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

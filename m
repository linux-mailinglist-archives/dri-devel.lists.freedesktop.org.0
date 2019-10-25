Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6F2E48A0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 12:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32226E92A;
	Fri, 25 Oct 2019 10:34:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr800078.outbound.protection.outlook.com [40.107.80.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 378C66E92A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 10:34:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4bHzkR3IViX7H2yHG91gSygmK0sVbhs9ubJQdgf8uA0bZNnUN577SrQFYVKzCmX99eT5HLGB072nymWjjZexGj2eaupuK2TMjTWD7G/jeguICgxPIayywKG96ngiA13X6XCKLnRTTlMalK6eEOeqffmGS0l/IFXzIa7JO4pXTazNLK5jJImFwKOPhqhfSpm/aKnFVKXaWJB6mKdCukBmRbCtuXawhk07v31+JsBLMkA1iKVxWp5B7D87oIW5+9jNPn5Cfe/gPJuWb5dUnN16bjA08DTGDZsd3x9FeMCrGy94anpyl73CqiSQanNaWTsTOYMYTXqxRUJYBrZB87OIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SComKLtQjpuNMeXa6WRzQlaWeDY0C4UQcKo06oI7xeg=;
 b=NMn3RPBsxBZNCAuHsiQjMNpfIq/aefyT+bo3kUaIalNFfSQpHyg0wvGHbdJp89vnPk4JNMGC+SCvu9Av0twkp5oKCUk+ZdMA39O/XxkzZXfO3j/g0p/oNi3Z0/SXKpD5kJ4bvUkE6KyTfLiNetfOHmz//e86MT7+yB9Wv36i5zbNsQ0HPUwLKLRCao2bLRNaTw9odM8dT9tUnKEFTGzcGo0YqdElKwcUY+rf/ehouuhB3DJQvLuCIXBftVhXU4dXSxwGVCYhn7//uAgRjxY92Ne1bBdnv+3EJZ4Y8j1Fseh1jr/jG2v2XpfNiekeen0PVUziYVhfYaRA9iel9b6cuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1699.namprd12.prod.outlook.com (10.175.97.148) by
 BN6PR12MB1201.namprd12.prod.outlook.com (10.168.229.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Fri, 25 Oct 2019 10:34:49 +0000
Received: from BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::bde7:9044:dcdb:4b67]) by BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::bde7:9044:dcdb:4b67%7]) with mapi id 15.20.2347.029; Fri, 25 Oct 2019
 10:34:49 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
Subject: Re: [RESEND PATCH v4] drm: Don't free jobs in
 wait_event_interruptible()
Thread-Topic: [RESEND PATCH v4] drm: Don't free jobs in
 wait_event_interruptible()
Thread-Index: AQHVioeeWUPlfPdq20eM0BhRAkUxUKdrHcsAgAAKlYCAAAIxgA==
Date: Fri, 25 Oct 2019 10:34:49 +0000
Message-ID: <4ca8b788-57b6-92e9-ab94-a39057320ee2@amd.com>
References: <20191024162424.38548-1-steven.price@arm.com>
 <02be6c7e-eda9-2a5b-f553-8d82fcd84b47@amd.com>
 <fdaebd89-ddc5-83da-687e-acf295007f31@arm.com>
In-Reply-To: <fdaebd89-ddc5-83da-687e-acf295007f31@arm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM4PR0902CA0022.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::32) To BN6PR12MB1699.namprd12.prod.outlook.com
 (2603:10b6:404:ff::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 628d9d27-3ba6-46c8-c75f-08d75936f64a
x-ms-traffictypediagnostic: BN6PR12MB1201:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB120173F9B7FACBAE51E7997B83650@BN6PR12MB1201.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(199004)(189003)(81166006)(81156014)(6512007)(6486002)(8936002)(7736002)(8676002)(186003)(14454004)(31686004)(65806001)(65956001)(446003)(11346002)(46003)(476003)(6246003)(4326008)(6436002)(305945005)(486006)(2616005)(229853002)(6306002)(86362001)(6116002)(2906002)(386003)(31696002)(52116002)(71190400001)(71200400001)(478600001)(102836004)(6506007)(53546011)(5660300002)(76176011)(316002)(66556008)(58126008)(66476007)(64756008)(66446008)(36756003)(66946007)(99286004)(966005)(256004)(14444005)(110136005)(54906003)(25786009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1201;
 H:BN6PR12MB1699.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: leci9ZAGMcqj2Qe6ZGqx+VmMYkwU5gVGLu6DbbTKCKrq7aZwCH1f9PXXYjHk3K3r0Y8C29L+gQeXPZly9Z9N4Rd/VYrMYwsJ6Ijya/sZEx5w5bGMxTSDPWxwhCcoPbuKGKSlT86VSYZggi54JuAnf2lWukvnswVEX3l77tpZzuWtteolyUdn4+wzBKdjyWGe/5ZWJXxzu8jr1fJJw5ARR4ZTZtj7tYwvzX97CFPDNgy8oWn/yz9uogOiZntjVr1V/w64uyPA+q+Dii5H/GXTURuzk6V0q0MziVWoMGxmWYrMQuQ3BXYrT9V9AG3ZaF+HJ0ziTiBKbvdh48qFuXDjoE9E69btsLWl4ONiRy5m4NYkIS5HaEz5pNXM2dT+9RLoR9ZaXSDxL7sM3Pc53aZMYPjLntnOLvjLPfBwa6FCZhbjpsn4INITLus+6fmKWPUOYuU8vx1pbsZs+16kwNRFJRlGWKsZYFtQ1Ox5GNerZlY=
Content-ID: <FD0AA77C3A5DB9439F04731CBE08862B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 628d9d27-3ba6-46c8-c75f-08d75936f64a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 10:34:49.3850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xlLvLEBLm60M4eRKrLGKZdJAf0TVJXPP4uH0Lk8uTlL1RcRtYslolwM3bduBUm6V
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1201
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SComKLtQjpuNMeXa6WRzQlaWeDY0C4UQcKo06oI7xeg=;
 b=U0yk0JYWl6cJxczxjxXb7GRg4xz8WENScnwJgFaiuFN9ii6v7ftnDjXwuJw+OgBMRaWdBtZut7bASD1S7ebUsx3/M4TFmtgE6UAYC47pLWNmBnEqD4FcPWdyjEtVHP1nn9KYZE5wODPfcoqR9amm7zllEwWYVAdIeDK4BMapmNQ=
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
Cc: Sharat Masetty <smasetty@codeaurora.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Erico Nunes <nunes.erico@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMTAuMTkgdW0gMTI6MjYgc2NocmllYiBTdGV2ZW4gUHJpY2U6DQo+IE9uIDI1LzEwLzIw
MTkgMTA6NDksIEtvZW5pZywgQ2hyaXN0aWFuIHdyb3RlOg0KPj4gQW0gMjQuMTAuMTkgdW0gMTg6
MjQgc2NocmllYiBTdGV2ZW4gUHJpY2U6DQo+Pj4gZHJtX3NjaGVkX2NsZWFudXBfam9icygpIGF0
dGVtcHRzIHRvIGZyZWUgZmluaXNoZWQgam9icywgaG93ZXZlciBiZWNhdXNlDQo+Pj4gaXQgaXMg
Y2FsbGVkIGFzIHRoZSBjb25kaXRpb24gb2Ygd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkgaXQg
bXVzdCBub3QNCj4+PiBzbGVlcC4gVW5mb3J0dWFudGx5IHNvbWUgZnJlZSBjYWxsYmFja3MgKG5v
dGlibHkgZm9yIFBhbmZyb3N0KSBkbyBzbGVlcC4NCj4+Pg0KPj4+IEluc3RlYWQgbGV0J3MgcmVu
YW1lIGRybV9zY2hlZF9jbGVhbnVwX2pvYnMoKSB0bw0KPj4+IGRybV9zY2hlZF9nZXRfY2xlYW51
cF9qb2IoKSBhbmQgc2ltcGx5IHJldHVybiBhIGpvYiBmb3IgcHJvY2Vzc2luZyBpZg0KPj4+IHRo
ZXJlIGlzIG9uZS4gVGhlIGNhbGxlciBjYW4gdGhlbiBjYWxsIHRoZSBmcmVlX2pvYigpIGNhbGxi
YWNrIG91dHNpZGUNCj4+PiB0aGUgd2FpdF9ldmVudF9pbnRlcnJ1cHRpYmxlKCkgd2hlcmUgc2xl
ZXBpbmcgaXMgcG9zc2libGUgYmVmb3JlDQo+Pj4gcmUtY2hlY2tpbmcgYW5kIHJldHVybmluZyB0
byBzbGVlcCBpZiBuZWNlc3NhcnkuDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBTdGV2ZW4gUHJp
Y2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPg0KPj4+IC0tLQ0KPj4+IFByZXZpb3VzIHBvc3Rpbmc6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA5MjYxNDE2MzAuMTQyNTgtMS1zdGV2
ZW4ucHJpY2VAYXJtLmNvbS8NCj4+Pg0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIv
c2NoZWRfbWFpbi5jIHwgNDUgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0NCj4+PiAgICAxIGZp
bGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgYi9kcml2
ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYw0KPj4+IGluZGV4IDlhMGVlNzRkODJk
Yy4uMTQ4NDY4NDQ3YmE5IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVs
ZXIvc2NoZWRfbWFpbi5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hl
ZF9tYWluLmMNCj4+PiBAQCAtNjIyLDQzICs2MjIsNDEgQEAgc3RhdGljIHZvaWQgZHJtX3NjaGVk
X3Byb2Nlc3Nfam9iKHN0cnVjdCBkbWFfZmVuY2UgKmYsIHN0cnVjdCBkbWFfZmVuY2VfY2IgKmNi
KQ0KPj4+ICAgIH0NCj4+PiAgICANCj4+PiAgICAvKioNCj4+PiAtICogZHJtX3NjaGVkX2NsZWFu
dXBfam9icyAtIGRlc3Ryb3kgZmluaXNoZWQgam9icw0KPj4+ICsgKiBkcm1fc2NoZWRfZ2V0X2Ns
ZWFudXBfam9iIC0gZmV0Y2ggdGhlIG5leHQgZmluaXNoZWQgam9iIHRvIGJlIGRlc3Ryb3llZA0K
Pj4+ICAgICAqDQo+Pj4gICAgICogQHNjaGVkOiBzY2hlZHVsZXIgaW5zdGFuY2UNCj4+PiAgICAg
Kg0KPj4+IC0gKiBSZW1vdmUgYWxsIGZpbmlzaGVkIGpvYnMgZnJvbSB0aGUgbWlycm9yIGxpc3Qg
YW5kIGRlc3Ryb3kgdGhlbS4NCj4+PiArICogUmV0dXJucyB0aGUgbmV4dCBmaW5pc2hlZCBqb2Ig
ZnJvbSB0aGUgbWlycm9yIGxpc3QgKGlmIHRoZXJlIGlzIG9uZSkNCj4+PiArICogcmVhZHkgZm9y
IGl0IHRvIGJlIGRlc3Ryb3llZC4NCj4+PiAgICAgKi8NCj4+PiAtc3RhdGljIHZvaWQgZHJtX3Nj
aGVkX2NsZWFudXBfam9icyhzdHJ1Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQ0KPj4+ICtz
dGF0aWMgc3RydWN0IGRybV9zY2hlZF9qb2IgKg0KPj4+ICtkcm1fc2NoZWRfZ2V0X2NsZWFudXBf
am9iKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpDQo+Pj4gICAgew0KPj4+ICsJc3Ry
dWN0IGRybV9zY2hlZF9qb2IgKmpvYiA9IE5VTEw7DQo+PiBQbGVhc2UgZG9uJ3QgaW5pdGlhbGl6
ZSBqb2IgaGVyZS4NCj4gR29vZCBzcG90LCB3aWxsIGZpeC4NCj4NCj4+PiAgICAJdW5zaWduZWQg
bG9uZyBmbGFnczsNCj4+PiAgICANCj4+PiAgICAJLyogRG9uJ3QgZGVzdHJveSBqb2JzIHdoaWxl
IHRoZSB0aW1lb3V0IHdvcmtlciBpcyBydW5uaW5nICovDQo+Pj4gICAgCWlmIChzY2hlZC0+dGlt
ZW91dCAhPSBNQVhfU0NIRURVTEVfVElNRU9VVCAmJg0KPj4+ICAgIAkgICAgIWNhbmNlbF9kZWxh
eWVkX3dvcmsoJnNjaGVkLT53b3JrX3RkcikpDQo+Pj4gLQkJcmV0dXJuOw0KPj4+IC0NCj4+PiAr
CQlyZXR1cm4gTlVMTDsNCj4+PiAgICANCj4+PiAtCXdoaWxlICghbGlzdF9lbXB0eSgmc2NoZWQt
PnJpbmdfbWlycm9yX2xpc3QpKSB7DQo+Pj4gLQkJc3RydWN0IGRybV9zY2hlZF9qb2IgKmpvYjsN
Cj4+PiArCXNwaW5fbG9ja19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0K
Pj4+ICAgIA0KPj4+IC0JCWpvYiA9IGxpc3RfZmlyc3RfZW50cnkoJnNjaGVkLT5yaW5nX21pcnJv
cl9saXN0LA0KPj4+ICsJam9iID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZzY2hlZC0+cmlu
Z19taXJyb3JfbGlzdCwNCj4+PiAgICAJCQkJICAgICAgIHN0cnVjdCBkcm1fc2NoZWRfam9iLCBu
b2RlKTsNCj4+PiAtCQlpZiAoIWRtYV9mZW5jZV9pc19zaWduYWxlZCgmam9iLT5zX2ZlbmNlLT5m
aW5pc2hlZCkpDQo+Pj4gLQkJCWJyZWFrOw0KPj4+ICAgIA0KPj4+IC0JCXNwaW5fbG9ja19pcnFz
YXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPj4+ICsJaWYgKGpvYiAmJiBkbWFf
ZmVuY2VfaXNfc2lnbmFsZWQoJmpvYi0+c19mZW5jZS0+ZmluaXNoZWQpKSB7DQo+Pj4gICAgCQkv
KiByZW1vdmUgam9iIGZyb20gcmluZ19taXJyb3JfbGlzdCAqLw0KPj4+ICAgIAkJbGlzdF9kZWxf
aW5pdCgmam9iLT5ub2RlKTsNCj4+PiAtCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZzY2hlZC0+
am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPj4+IC0NCj4+PiAtCQlzY2hlZC0+b3BzLT5mcmVlX2pv
Yihqb2IpOw0KPj4+ICsJfSBlbHNlIHsNCj4+PiArCQlqb2IgPSBOVUxMOw0KPj4+ICsJCS8qIHF1
ZXVlIHRpbWVvdXQgZm9yIG5leHQgam9iICovDQo+Pj4gKwkJZHJtX3NjaGVkX3N0YXJ0X3RpbWVv
dXQoc2NoZWQpOw0KPj4+ICAgIAl9DQo+Pj4gICAgDQo+Pj4gLQkvKiBxdWV1ZSB0aW1lb3V0IGZv
ciBuZXh0IGpvYiAqLw0KPj4+IC0Jc3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVkLT5qb2JfbGlzdF9s
b2NrLCBmbGFncyk7DQo+Pj4gLQlkcm1fc2NoZWRfc3RhcnRfdGltZW91dChzY2hlZCk7DQo+Pj4g
ICAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFncyk7
DQo+Pj4gICAgDQo+Pj4gKwlyZXR1cm4gam9iOw0KPj4+ICAgIH0NCj4+PiAgICANCj4+PiAgICAv
KioNCj4+PiBAQCAtNjk4LDEyICs2OTYsMjEgQEAgc3RhdGljIGludCBkcm1fc2NoZWRfbWFpbih2
b2lkICpwYXJhbSkNCj4+PiAgICAJCXN0cnVjdCBkcm1fc2NoZWRfZmVuY2UgKnNfZmVuY2U7DQo+
Pj4gICAgCQlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2NoZWRfam9iOw0KPj4+ICAgIAkJc3RydWN0
IGRtYV9mZW5jZSAqZmVuY2U7DQo+Pj4gKwkJc3RydWN0IGRybV9zY2hlZF9qb2IgKmNsZWFudXBf
am9iID0gTlVMTDsNCj4+PiAgICANCj4+PiAgICAJCXdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZShz
Y2hlZC0+d2FrZV91cF93b3JrZXIsDQo+Pj4gLQkJCQkJIChkcm1fc2NoZWRfY2xlYW51cF9qb2Jz
KHNjaGVkKSwNCj4+PiArCQkJCQkgKGNsZWFudXBfam9iID0gZHJtX3NjaGVkX2dldF9jbGVhbnVw
X2pvYihzY2hlZCkpIHx8DQo+Pj4gICAgCQkJCQkgKCFkcm1fc2NoZWRfYmxvY2tlZChzY2hlZCkg
JiYNCj4+PiAgICAJCQkJCSAgKGVudGl0eSA9IGRybV9zY2hlZF9zZWxlY3RfZW50aXR5KHNjaGVk
KSkpIHx8DQo+Pj4gLQkJCQkJIGt0aHJlYWRfc2hvdWxkX3N0b3AoKSkpOw0KPj4+ICsJCQkJCSBr
dGhyZWFkX3Nob3VsZF9zdG9wKCkpOw0KPj4+ICsNCj4+PiArCQl3aGlsZSAoY2xlYW51cF9qb2Ip
IHsNCj4+IEJldHRlciBtYWtlIHRoaXMganVzdCAiaWYgKGNsZWFudXBfam9iKSIuLi4gdG8gbWFr
ZSBzdXJlIHRoYXQgd2Ugc3RvcA0KPj4gaW1tZWRpYXRlbHkgd2hlbiB0aGUgdGhyZWFkIHNob3Vs
ZCBzdG9wLg0KPiBPaywgbm8gcHJvYmxlbS4gTm90ZSB0aGF0IHRoaXMgaXMgYSBjaGFuZ2UgaW4g
YmVoYXZpb3VyIChwcmV2aW91c2x5DQo+IGRybV9zY2hlZF9jbGVhbnVwX2pvYnMoKSB3YXMgY2Fs
bGVkICpiZWZvcmUqIGNoZWNraW5nDQo+IGt0aHJlYWRfc2hvdWxkX3N0b3AoKSkuIEJ1dCBJIGNh
bid0IHNlZSB0aGUgaGFybS4NCg0KWWVhaCwgYnV0IHRoaXMgaXMgYWN0dWFsbHkgYSByYXRoZXIg
bmljZSBpbXByb3ZlbWVudC4NCg0KV2hlbiB3ZSBzYXkgdGhhdCB0aGUgdGhyZWFkIHNob3VsZCBz
dG9wIHRoZW4gdGhhdCBzaG91bGQgaGFwcGVuIA0KaW1tZWRpYXRlbHkgYW5kIG5vdCBjbGVhbnVw
IHRoZSBqb2JzIGZpcnN0Lg0KDQpDaHJpc3RpYW4uDQoNCj4NCj4gU3RldmUNCj4NCj4+IEFwYXJ0
IGZyb20gdGhhdCBsb29rcyBnb29kIHRvIG1lIG5vdywNCj4+IENocmlzdGlhbi4NCj4+DQo+Pj4g
KwkJCXNjaGVkLT5vcHMtPmZyZWVfam9iKGNsZWFudXBfam9iKTsNCj4+PiArCQkJLyogcXVldWUg
dGltZW91dCBmb3IgbmV4dCBqb2IgKi8NCj4+PiArCQkJZHJtX3NjaGVkX3N0YXJ0X3RpbWVvdXQo
c2NoZWQpOw0KPj4+ICsNCj4+PiArCQkJY2xlYW51cF9qb2IgPSBkcm1fc2NoZWRfZ2V0X2NsZWFu
dXBfam9iKHNjaGVkKTsNCj4+PiArCQl9DQo+Pj4gICAgDQo+Pj4gICAgCQlpZiAoIWVudGl0eSkN
Cj4+PiAgICAJCQljb250aW51ZTsNCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+PiBkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KPj4NCg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35336963EE
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 17:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BB7989A4B;
	Tue, 20 Aug 2019 15:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690072.outbound.protection.outlook.com [40.107.69.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC5E89760;
 Tue, 20 Aug 2019 15:16:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ovs+52tZACTbT+5BnNRs2MLRHmZBwS76YeMA7QZB+kiqywACXdfaqSrTdgA4mHwR4foVuNSS881FqXahy4K23iEB9CLwN2yE24L7LM1vJrkRGJF3TNqYnC1qAyI5/DAPSiBv+FI/fv5TwIjrnLBJFKAxLTWuEbvxwTYZo56itc044fC34lJGpTebxTQ0KqZq8hC8ij5NYGoKtxNXCRcjIDLz4pGUTJtvtzCVngDEXyBfEVv0hppCihjE2sLWLQc7U2zgxP7Bk+vmHKnQqvXzytzBLmDLRsxWPTZckyXhOHz1LIkQY9ZRR54A2/hRg9Bs/AOqbV/d24piumtaAbTEdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhH1bl06bizq3VqZ0F4XhAtZN/MUT3Sgt8aoMtWbKUg=;
 b=OSxYnWabrYLRY5pcKkg/6GzrVIAzGDdLoXdn234jS7JFqJiLvJu98EDqhT1QUQOnKs896Vsytg3BiHAGHcJGkbZcZyRD3nZUIJSol/7oLlaJljcbXVkPFfTIwgxROX4ynroUQkrzZj1gLVCL6wHCRZ5ApzLAOjsZYcC05lhzG9rZGniVP23amMSJ77ikbt9e4R7gy79iLAGu5+671cZ/18C1ORDtWntOf7LRWzffINpSeiDn77OsdFWf477QfbEyo3y3aBPAYtDVIwLdbBvG+GN/751LfpwClhH8RXssMz4lL7LhBPHwp0kFVVhzOZQMenlpT5uQ2RcNHZXabKlxgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1433.namprd12.prod.outlook.com (10.168.236.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Tue, 20 Aug 2019 15:16:31 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2178.018; Tue, 20 Aug 2019
 15:16:31 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/ttm: remove ttm_bo_wait_unreserved
Thread-Topic: [PATCH 3/3] drm/ttm: remove ttm_bo_wait_unreserved
Thread-Index: AQHVV2cW/tKRttrRtkmgCalTUTQrEacEJaiA
Date: Tue, 20 Aug 2019 15:16:30 +0000
Message-ID: <38dc4dfe-88f4-ec16-b075-4bd0566c117d@amd.com>
References: <20190820145336.15649-1-daniel.vetter@ffwll.ch>
 <20190820145336.15649-4-daniel.vetter@ffwll.ch>
In-Reply-To: <20190820145336.15649-4-daniel.vetter@ffwll.ch>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: MR2P264CA0084.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:32::24) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed2a75b4-7859-4938-3dd7-08d725816127
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1433; 
x-ms-traffictypediagnostic: DM5PR12MB1433:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB14339E9B1F36DF32F7B6F32983AB0@DM5PR12MB1433.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(199004)(189003)(478600001)(65826007)(14454004)(65956001)(305945005)(66574012)(7736002)(65806001)(64126003)(5660300002)(6486002)(6436002)(81156014)(81166006)(66446008)(64756008)(66556008)(66476007)(66946007)(71200400001)(8936002)(229853002)(6512007)(4326008)(256004)(53936002)(31686004)(14444005)(6246003)(8676002)(71190400001)(25786009)(486006)(6506007)(386003)(31696002)(52116002)(186003)(36756003)(46003)(446003)(11346002)(2616005)(6116002)(476003)(86362001)(76176011)(58126008)(2906002)(316002)(54906003)(110136005)(102836004)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1433;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kq3n38dWrTCOl3wPtCl9kSmpYEqjiz/f9LxRLUMFtc4X1f9+12rgAyHChG3hnfVdl06Q8RMUoAz0EFtGX7NxGB727hvcd8ykk3jWWNKwAiS9gCZ+tBrMFMdthuBf/B28Nh6ouWxjQNOZ9eoaRBbMSX0Ya/yJ0itS/LnQlPOE49CJablvLNKrremZfdaSWKtJPdPmY0x2SOwbUEJrTAur4jz28QOuwxN65imZ9nlOnEcIkJeFjsev26Q5+NORp7JS8vLqMzXW1KDyDN1h0awaTvL3cpNRRFQ/3iMfVYl/W1QrLeZsfxvjX7dIQKR7Uqfbv/SmQMf/v4+9eTxcGVmcA2pPiHh+xQNJj6PFoJLhyFnkDCPQDIxBO/vt9r5v6RHvbxWNyKYeEgshXl4iE4dwt9i7LAIInFI9JqJ1b16AS/g=
Content-ID: <DF438C4E80F4A949B1F749A9D544A937@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2a75b4-7859-4938-3dd7-08d725816127
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 15:16:30.8584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sPAkCHMaWIOXBFFqwKvs/Raz5jKscQTnxpLOGv3sEEEjOKWVEmjaWoP+Q4n8QKSR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1433
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhH1bl06bizq3VqZ0F4XhAtZN/MUT3Sgt8aoMtWbKUg=;
 b=2WadsY0BrkqWQEfrvJe9lGhibU2L/yQ5HHr1Qqy6mIpcaKIkLUhHoICOAK3ndvuBYsKQlASDnNM1dal2NpV5MEldkh+1VVwPN9PSQst2oqZ+/y/V8NISHZP/ZnJoAGFdyk1Qma2Cz5HCu+jcEwaBZm7cJj7XkAYO9fK2YOBV+Ho=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAuMDguMTkgdW0gMTY6NTMgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBXaXRoIG5vdXZl
YXUgZml4ZWQgYWxsIHR0bS11c2luZyBkcml2ZXMgaGF2ZSB0aGUgY29ycmVjdCBuZXN0aW5nIG9m
DQo+IG1tYXBfc2VtIHZzIGRtYV9yZXN2LCBhbmQgd2UgY2FuIGp1c3QgbG9jayB0aGUgYnVmZmVy
Lg0KPg0KPiBBc3N1bWluZyBJIGRpZG4ndCBzY3JldyB1cCBhbnl0aGluZyB3aXRoIG15IGF1ZGl0
IG9mIGNvdXJzZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZl
dHRlckBpbnRlbC5jb20+DQo+IENjOiBDaHJpc3RpYW4gS29lbmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+DQo+IENjOiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPg0KPiBDYzogR2Vy
ZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+DQo+IENjOiAiVk13YXJlIEdyYXBoaWNzIiA8
bGludXgtZ3JhcGhpY3MtbWFpbnRhaW5lckB2bXdhcmUuY29tPg0KPiBDYzogVGhvbWFzIEhlbGxz
dHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPg0KDQpZZXMsIHBsZWFzZS4gQnV0IG9uZSBtb3Jl
IHBvaW50OiB5b3UgY2FuIG5vdyByZW1vdmUgYm8tPnd1X211dGV4IGFzIHdlbGwhDQoNCkFwYXJ0
IGZyb20gdGhhdCBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgICAg
fCAzNCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9ib192bS5jIHwgMjYgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIGlu
Y2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmggICAgfCAgMSAtDQo+ICAgMyBmaWxlcyBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgNjAgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0K
PiBpbmRleCAyMGZmNTZmMjdhYTQuLmE5NTJkZDYyNGIwNiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9i
by5jDQo+IEBAIC0xOTU0LDM3ICsxOTU0LDMgQEAgdm9pZCB0dG1fYm9fc3dhcG91dF9hbGwoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYpDQo+ICAgCQk7DQo+ICAgfQ0KPiAgIEVYUE9SVF9TWU1C
T0wodHRtX2JvX3N3YXBvdXRfYWxsKTsNCj4gLQ0KPiAtLyoqDQo+IC0gKiB0dG1fYm9fd2FpdF91
bnJlc2VydmVkIC0gaW50ZXJydXB0aWJsZSB3YWl0IGZvciBhIGJ1ZmZlciBvYmplY3QgdG8gYmVj
b21lDQo+IC0gKiB1bnJlc2VydmVkDQo+IC0gKg0KPiAtICogQGJvOiBQb2ludGVyIHRvIGJ1ZmZl
cg0KPiAtICovDQo+IC1pbnQgdHRtX2JvX3dhaXRfdW5yZXNlcnZlZChzdHJ1Y3QgdHRtX2J1ZmZl
cl9vYmplY3QgKmJvKQ0KPiAtew0KPiAtCWludCByZXQ7DQo+IC0NCj4gLQkvKg0KPiAtCSAqIElu
IHRoZSBhYnNlbnNlIG9mIGEgd2FpdF91bmxvY2tlZCBBUEksDQo+IC0JICogVXNlIHRoZSBibzo6
d3VfbXV0ZXggdG8gYXZvaWQgdHJpZ2dlcmluZyBsaXZlbG9ja3MgZHVlIHRvDQo+IC0JICogY29u
Y3VycmVudCB1c2Ugb2YgdGhpcyBmdW5jdGlvbi4gTm90ZSB0aGF0IHRoaXMgdXNlIG9mDQo+IC0J
ICogYm86Ond1X211dGV4IGNhbiBnbyBhd2F5IGlmIHdlIGNoYW5nZSBsb2NraW5nIG9yZGVyIHRv
DQo+IC0JICogbW1hcF9zZW0gLT4gYm86OnJlc2VydmUuDQo+IC0JICovDQo+IC0JcmV0ID0gbXV0
ZXhfbG9ja19pbnRlcnJ1cHRpYmxlKCZiby0+d3VfbXV0ZXgpOw0KPiAtCWlmICh1bmxpa2VseShy
ZXQgIT0gMCkpDQo+IC0JCXJldHVybiAtRVJFU1RBUlRTWVM7DQo+IC0JaWYgKCFkbWFfcmVzdl9p
c19sb2NrZWQoYm8tPmJhc2UucmVzdikpDQo+IC0JCWdvdG8gb3V0X3VubG9jazsNCj4gLQlyZXQg
PSBkbWFfcmVzdl9sb2NrX2ludGVycnVwdGlibGUoYm8tPmJhc2UucmVzdiwgTlVMTCk7DQo+IC0J
aWYgKHJldCA9PSAtRUlOVFIpDQo+IC0JCXJldCA9IC1FUkVTVEFSVFNZUzsNCj4gLQlpZiAodW5s
aWtlbHkocmV0ICE9IDApKQ0KPiAtCQlnb3RvIG91dF91bmxvY2s7DQo+IC0JZG1hX3Jlc3ZfdW5s
b2NrKGJvLT5iYXNlLnJlc3YpOw0KPiAtDQo+IC1vdXRfdW5sb2NrOg0KPiAtCW11dGV4X3VubG9j
aygmYm8tPnd1X211dGV4KTsNCj4gLQlyZXR1cm4gcmV0Ow0KPiAtfQ0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvX3ZtLmMNCj4gaW5kZXggNzZlZWRiOTYzNjkzLi41MDVlMTc4N2FlZWEgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fdm0uYw0KPiBAQCAtMTI1LDMxICsxMjUsNyBAQCBzdGF0aWMgdm1fZmF1
bHRfdCB0dG1fYm9fdm1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpDQo+ICAgCQkmYmRldi0+
bWFuW2JvLT5tZW0ubWVtX3R5cGVdOw0KPiAgIAlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgY3ZtYTsN
Cj4gICANCj4gLQkvKg0KPiAtCSAqIFdvcmsgYXJvdW5kIGxvY2tpbmcgb3JkZXIgcmV2ZXJzYWwg
aW4gZmF1bHQgLyBub3Bmbg0KPiAtCSAqIGJldHdlZW4gbW1hcF9zZW0gYW5kIGJvX3Jlc2VydmU6
IFBlcmZvcm0gYSB0cnlsb2NrIG9wZXJhdGlvbg0KPiAtCSAqIGZvciByZXNlcnZlLCBhbmQgaWYg
aXQgZmFpbHMsIHJldHJ5IHRoZSBmYXVsdCBhZnRlciB3YWl0aW5nDQo+IC0JICogZm9yIHRoZSBi
dWZmZXIgdG8gYmVjb21lIHVucmVzZXJ2ZWQuDQo+IC0JICovDQo+IC0JaWYgKHVubGlrZWx5KCFk
bWFfcmVzdl90cnlsb2NrKGJvLT5iYXNlLnJlc3YpKSkgew0KPiAtCQlpZiAodm1mLT5mbGFncyAm
IEZBVUxUX0ZMQUdfQUxMT1dfUkVUUlkpIHsNCj4gLQkJCWlmICghKHZtZi0+ZmxhZ3MgJiBGQVVM
VF9GTEFHX1JFVFJZX05PV0FJVCkpIHsNCj4gLQkJCQl0dG1fYm9fZ2V0KGJvKTsNCj4gLQkJCQl1
cF9yZWFkKCZ2bWYtPnZtYS0+dm1fbW0tPm1tYXBfc2VtKTsNCj4gLQkJCQkodm9pZCkgdHRtX2Jv
X3dhaXRfdW5yZXNlcnZlZChibyk7DQo+IC0JCQkJdHRtX2JvX3B1dChibyk7DQo+IC0JCQl9DQo+
IC0NCj4gLQkJCXJldHVybiBWTV9GQVVMVF9SRVRSWTsNCj4gLQkJfQ0KPiAtDQo+IC0JCS8qDQo+
IC0JCSAqIElmIHdlJ2Qgd2FudCB0byBjaGFuZ2UgbG9ja2luZyBvcmRlciB0bw0KPiAtCQkgKiBt
bWFwX3NlbSAtPiBibzo6cmVzZXJ2ZSwgd2UnZCB1c2UgYSBibG9ja2luZyByZXNlcnZlIGhlcmUN
Cj4gLQkJICogaW5zdGVhZCBvZiByZXRyeWluZyB0aGUgZmF1bHQuLi4NCj4gLQkJICovDQo+IC0J
CXJldHVybiBWTV9GQVVMVF9OT1BBR0U7DQo+IC0JfQ0KPiArCWRtYV9yZXN2X2xvY2soYm8tPmJh
c2UucmVzdiwgTlVMTCk7DQo+ICAgDQo+ICAgCS8qDQo+ICAgCSAqIFJlZnVzZSB0byBmYXVsdCBp
bXBvcnRlZCBwYWdlcy4gVGhpcyBzaG91bGQgYmUgaGFuZGxlZA0KPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgN
Cj4gaW5kZXggNDNjNDkyOWEyMTcxLi42YjUwZTYyNGUzZTIgMTAwNjQ0DQo+IC0tLSBhL2luY2x1
ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19h
cGkuaA0KPiBAQCAtNzY1LDcgKzc2NSw2IEBAIHNzaXplX3QgdHRtX2JvX2lvKHN0cnVjdCB0dG1f
Ym9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgZmlsZSAqZmlscCwNCj4gICBpbnQgdHRtX2JvX3N3YXBv
dXQoc3RydWN0IHR0bV9ib19nbG9iYWwgKmdsb2IsDQo+ICAgCQkJc3RydWN0IHR0bV9vcGVyYXRp
b25fY3R4ICpjdHgpOw0KPiAgIHZvaWQgdHRtX2JvX3N3YXBvdXRfYWxsKHN0cnVjdCB0dG1fYm9f
ZGV2aWNlICpiZGV2KTsNCj4gLWludCB0dG1fYm9fd2FpdF91bnJlc2VydmVkKHN0cnVjdCB0dG1f
YnVmZmVyX29iamVjdCAqYm8pOw0KPiAgIA0KPiAgIC8qKg0KPiAgICAqIHR0bV9ib191c2VzX2Vt
YmVkZGVkX2dlbV9vYmplY3QgLSBjaGVjayBpZiB0aGUgZ2l2ZW4gYm8gdXNlcyB0aGUNCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FEAE47C0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 11:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4B56E94E;
	Fri, 25 Oct 2019 09:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760081.outbound.protection.outlook.com [40.107.76.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD786E94E
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2019 09:49:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biZ2nG7ZBXtlRQfrdR8P4f8Z+KUEOcDHkBOSJUt2QnNgdGwA2aMzFY4xiEPIEqKcpnK2mbv2b2FVujsGJ7u5fs3+r7y/7aQKdkHNq1oPyolp78lwahSRDn0XL7Yv8BPreoGpfDhXh2oVBnrs23ovEGSydEHHXqUOCrD2L14MOS84utrShdk9J+RlaZJgufAx0xIWlcLkrBPuz4Qx2bhqyM9o92kJNa0duNtEDA6Z3hhCuzv0O+XLpBTh7qOKRtoJWEEVccyMAF4icY9ORM1I51Rs9J66P+jgmfn0NTjbBUkfuU1KjXHxI3OJ7bhGlfTA+vZlkdV0bj3q7rHSjVjm+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aatj2bPrZ7Dh+1zoBwuwoD2k6QqC5Xa1z2IExk5suc4=;
 b=ZDC8tAAAvkykxKP0aqNDrZAMlA1nvL7GEv3O5nZd2ibZkoEfw1C7emAdXaxyo7NJkqTY9YHSY3VfIz6NdGuEAZ6y4xQCQNI2xU1XVyI81QPVg5NkQwBqNitnv/RuovZ2eMy3Qdg6epI4p06YA6iNFamVAWrKZDN7KkdQOHPdqu+zuLUxMmnVDoGheQj38hBBYpzSN1VS5bnB6I7aEc8qQ5FI0M3vxLAd2jV8z45tLNX1j7P57RXdJ+l5neXFOdymgFxmWXwKyM+x3kpm+t9FxVAHELH/lc7x7oOR2LKAyJWOQJC8PecaIeRN+T+sWjobV1iQGMBFa4ozWxy9VWsnyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1699.namprd12.prod.outlook.com (10.175.97.148) by
 BN6PR12MB1618.namprd12.prod.outlook.com (10.172.21.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Fri, 25 Oct 2019 09:49:06 +0000
Received: from BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::bde7:9044:dcdb:4b67]) by BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::bde7:9044:dcdb:4b67%7]) with mapi id 15.20.2347.029; Fri, 25 Oct 2019
 09:49:06 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Steven Price <steven.price@arm.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>
Subject: Re: [RESEND PATCH v4] drm: Don't free jobs in
 wait_event_interruptible()
Thread-Topic: [RESEND PATCH v4] drm: Don't free jobs in
 wait_event_interruptible()
Thread-Index: AQHVioeeWUPlfPdq20eM0BhRAkUxUKdrHcsA
Date: Fri, 25 Oct 2019 09:49:06 +0000
Message-ID: <02be6c7e-eda9-2a5b-f553-8d82fcd84b47@amd.com>
References: <20191024162424.38548-1-steven.price@arm.com>
In-Reply-To: <20191024162424.38548-1-steven.price@arm.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM3PR07CA0126.eurprd07.prod.outlook.com
 (2603:10a6:207:8::12) To BN6PR12MB1699.namprd12.prod.outlook.com
 (2603:10b6:404:ff::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 45b65520-3bd4-4a38-e582-08d75930933a
x-ms-traffictypediagnostic: BN6PR12MB1618:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB16188209677E582AB554672D83650@BN6PR12MB1618.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(39860400002)(396003)(189003)(199004)(99286004)(102836004)(81166006)(81156014)(76176011)(8676002)(386003)(36756003)(6506007)(52116002)(4326008)(71190400001)(71200400001)(256004)(14444005)(6306002)(6512007)(6486002)(6436002)(11346002)(6246003)(46003)(446003)(8936002)(486006)(476003)(2616005)(110136005)(58126008)(316002)(54906003)(5660300002)(65806001)(65956001)(966005)(186003)(31686004)(25786009)(14454004)(86362001)(305945005)(7736002)(478600001)(66476007)(66556008)(64756008)(66446008)(66946007)(2906002)(6116002)(31696002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1618;
 H:BN6PR12MB1699.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZGBJP6x/juvXiqFxyIxR9sP3CvH4Ktf0rrKdfP9ouRw0mmu+1xw+yrOnAZkygKHDvoGLm+Ys8OnmWLqk+ZoaDaiPBS04VySPeVlFkIFI650WZQyTPnbyHosZi0HpJ64uebFmLpXosj/gRG1FFKoZHKhjc3oXdZEKsxdEyc2BG8/lFP8Pw75NdCny8decYfpA0fiXWymUlXzI0vR19httxFb4oXw87EH8XJQG3DbKsUwjZTd4ooW1JuR5DXkuEZYJXRcTKPVVMM1d23OOdDZD6A4u3K4SMnzow2DDvWLPDm31yHTfId80HyjyVmbQivvCZmrf4U0oTfwb/+P792FmFOMsDt5arIxhMPsNcvwtN4Lu5NmbbAwc95HLuwO0Up4kq3yxzNThmtsS3HBXW09RPJ3tXSuyao0VzADKe+TSjkFp6cq80kJ1gNwhaIjoCmUBHPn5CPwFbRolTOUVFkoes7oL+6oAzdxnOJ6t6cTf7Yk=
Content-ID: <289044DF0303D74097CD3478214BF3D1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b65520-3bd4-4a38-e582-08d75930933a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 09:49:06.3465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: stdNCgKpG8XpHRR32+XQNEquVjtYb6JlMLyLlHiy2//nGnC/8iQFPNuvAPRohYht
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1618
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aatj2bPrZ7Dh+1zoBwuwoD2k6QqC5Xa1z2IExk5suc4=;
 b=3TCAbCgMYvqr1jgK/vp3uhYuwSpYG0PQNVJArs+Em2/XNFxlmRLlkLUXo0dT8vzdpbLHZZ+s86WJ7bxN1hdMttXRZdzAzHCB8iDPuNBYl+fg0Hb5QiDwbmGimewvB1XcbjSIn1CJWeZznefL5T0uhmprDPAZk5UmaTLjLrZZ0pw=
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

QW0gMjQuMTAuMTkgdW0gMTg6MjQgc2NocmllYiBTdGV2ZW4gUHJpY2U6DQo+IGRybV9zY2hlZF9j
bGVhbnVwX2pvYnMoKSBhdHRlbXB0cyB0byBmcmVlIGZpbmlzaGVkIGpvYnMsIGhvd2V2ZXIgYmVj
YXVzZQ0KPiBpdCBpcyBjYWxsZWQgYXMgdGhlIGNvbmRpdGlvbiBvZiB3YWl0X2V2ZW50X2ludGVy
cnVwdGlibGUoKSBpdCBtdXN0IG5vdA0KPiBzbGVlcC4gVW5mb3J0dWFudGx5IHNvbWUgZnJlZSBj
YWxsYmFja3MgKG5vdGlibHkgZm9yIFBhbmZyb3N0KSBkbyBzbGVlcC4NCj4NCj4gSW5zdGVhZCBs
ZXQncyByZW5hbWUgZHJtX3NjaGVkX2NsZWFudXBfam9icygpIHRvDQo+IGRybV9zY2hlZF9nZXRf
Y2xlYW51cF9qb2IoKSBhbmQgc2ltcGx5IHJldHVybiBhIGpvYiBmb3IgcHJvY2Vzc2luZyBpZg0K
PiB0aGVyZSBpcyBvbmUuIFRoZSBjYWxsZXIgY2FuIHRoZW4gY2FsbCB0aGUgZnJlZV9qb2IoKSBj
YWxsYmFjayBvdXRzaWRlDQo+IHRoZSB3YWl0X2V2ZW50X2ludGVycnVwdGlibGUoKSB3aGVyZSBz
bGVlcGluZyBpcyBwb3NzaWJsZSBiZWZvcmUNCj4gcmUtY2hlY2tpbmcgYW5kIHJldHVybmluZyB0
byBzbGVlcCBpZiBuZWNlc3NhcnkuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFN0ZXZlbiBQcmljZSA8
c3RldmVuLnByaWNlQGFybS5jb20+DQo+IC0tLQ0KPiBQcmV2aW91cyBwb3N0aW5nOiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkwOTI2MTQxNjMwLjE0MjU4LTEtc3RldmVuLnByaWNl
QGFybS5jb20vDQo+DQo+ICAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMg
fCA0NSArKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyNiBp
bnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxl
ci9zY2hlZF9tYWluLmMNCj4gaW5kZXggOWEwZWU3NGQ4MmRjLi4xNDg0Njg0NDdiYTkgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+IEBAIC02MjIsNDMgKzYy
Miw0MSBAQCBzdGF0aWMgdm9pZCBkcm1fc2NoZWRfcHJvY2Vzc19qb2Ioc3RydWN0IGRtYV9mZW5j
ZSAqZiwgc3RydWN0IGRtYV9mZW5jZV9jYiAqY2IpDQo+ICAgfQ0KPiAgIA0KPiAgIC8qKg0KPiAt
ICogZHJtX3NjaGVkX2NsZWFudXBfam9icyAtIGRlc3Ryb3kgZmluaXNoZWQgam9icw0KPiArICog
ZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYiAtIGZldGNoIHRoZSBuZXh0IGZpbmlzaGVkIGpvYiB0
byBiZSBkZXN0cm95ZWQNCj4gICAgKg0KPiAgICAqIEBzY2hlZDogc2NoZWR1bGVyIGluc3RhbmNl
DQo+ICAgICoNCj4gLSAqIFJlbW92ZSBhbGwgZmluaXNoZWQgam9icyBmcm9tIHRoZSBtaXJyb3Ig
bGlzdCBhbmQgZGVzdHJveSB0aGVtLg0KPiArICogUmV0dXJucyB0aGUgbmV4dCBmaW5pc2hlZCBq
b2IgZnJvbSB0aGUgbWlycm9yIGxpc3QgKGlmIHRoZXJlIGlzIG9uZSkNCj4gKyAqIHJlYWR5IGZv
ciBpdCB0byBiZSBkZXN0cm95ZWQuDQo+ICAgICovDQo+IC1zdGF0aWMgdm9pZCBkcm1fc2NoZWRf
Y2xlYW51cF9qb2JzKHN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQpDQo+ICtzdGF0aWMg
c3RydWN0IGRybV9zY2hlZF9qb2IgKg0KPiArZHJtX3NjaGVkX2dldF9jbGVhbnVwX2pvYihzdHJ1
Y3QgZHJtX2dwdV9zY2hlZHVsZXIgKnNjaGVkKQ0KPiAgIHsNCj4gKwlzdHJ1Y3QgZHJtX3NjaGVk
X2pvYiAqam9iID0gTlVMTDsNCg0KUGxlYXNlIGRvbid0IGluaXRpYWxpemUgam9iIGhlcmUuDQoN
Cj4gICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gICANCj4gICAJLyogRG9uJ3QgZGVzdHJveSBq
b2JzIHdoaWxlIHRoZSB0aW1lb3V0IHdvcmtlciBpcyBydW5uaW5nICovDQo+ICAgCWlmIChzY2hl
ZC0+dGltZW91dCAhPSBNQVhfU0NIRURVTEVfVElNRU9VVCAmJg0KPiAgIAkgICAgIWNhbmNlbF9k
ZWxheWVkX3dvcmsoJnNjaGVkLT53b3JrX3RkcikpDQo+IC0JCXJldHVybjsNCj4gLQ0KPiArCQly
ZXR1cm4gTlVMTDsNCj4gICANCj4gLQl3aGlsZSAoIWxpc3RfZW1wdHkoJnNjaGVkLT5yaW5nX21p
cnJvcl9saXN0KSkgew0KPiAtCQlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqam9iOw0KPiArCXNwaW5f
bG9ja19pcnFzYXZlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPiAgIA0KPiAtCQlq
b2IgPSBsaXN0X2ZpcnN0X2VudHJ5KCZzY2hlZC0+cmluZ19taXJyb3JfbGlzdCwNCj4gKwlqb2Ig
PSBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwoJnNjaGVkLT5yaW5nX21pcnJvcl9saXN0LA0KPiAg
IAkJCQkgICAgICAgc3RydWN0IGRybV9zY2hlZF9qb2IsIG5vZGUpOw0KPiAtCQlpZiAoIWRtYV9m
ZW5jZV9pc19zaWduYWxlZCgmam9iLT5zX2ZlbmNlLT5maW5pc2hlZCkpDQo+IC0JCQlicmVhazsN
Cj4gICANCj4gLQkJc3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBmbGFn
cyk7DQo+ICsJaWYgKGpvYiAmJiBkbWFfZmVuY2VfaXNfc2lnbmFsZWQoJmpvYi0+c19mZW5jZS0+
ZmluaXNoZWQpKSB7DQo+ICAgCQkvKiByZW1vdmUgam9iIGZyb20gcmluZ19taXJyb3JfbGlzdCAq
Lw0KPiAgIAkJbGlzdF9kZWxfaW5pdCgmam9iLT5ub2RlKTsNCj4gLQkJc3Bpbl91bmxvY2tfaXJx
cmVzdG9yZSgmc2NoZWQtPmpvYl9saXN0X2xvY2ssIGZsYWdzKTsNCj4gLQ0KPiAtCQlzY2hlZC0+
b3BzLT5mcmVlX2pvYihqb2IpOw0KPiArCX0gZWxzZSB7DQo+ICsJCWpvYiA9IE5VTEw7DQo+ICsJ
CS8qIHF1ZXVlIHRpbWVvdXQgZm9yIG5leHQgam9iICovDQo+ICsJCWRybV9zY2hlZF9zdGFydF90
aW1lb3V0KHNjaGVkKTsNCj4gICAJfQ0KPiAgIA0KPiAtCS8qIHF1ZXVlIHRpbWVvdXQgZm9yIG5l
eHQgam9iICovDQo+IC0Jc3Bpbl9sb2NrX2lycXNhdmUoJnNjaGVkLT5qb2JfbGlzdF9sb2NrLCBm
bGFncyk7DQo+IC0JZHJtX3NjaGVkX3N0YXJ0X3RpbWVvdXQoc2NoZWQpOw0KPiAgIAlzcGluX3Vu
bG9ja19pcnFyZXN0b3JlKCZzY2hlZC0+am9iX2xpc3RfbG9jaywgZmxhZ3MpOw0KPiAgIA0KPiAr
CXJldHVybiBqb2I7DQo+ICAgfQ0KPiAgIA0KPiAgIC8qKg0KPiBAQCAtNjk4LDEyICs2OTYsMjEg
QEAgc3RhdGljIGludCBkcm1fc2NoZWRfbWFpbih2b2lkICpwYXJhbSkNCj4gICAJCXN0cnVjdCBk
cm1fc2NoZWRfZmVuY2UgKnNfZmVuY2U7DQo+ICAgCQlzdHJ1Y3QgZHJtX3NjaGVkX2pvYiAqc2No
ZWRfam9iOw0KPiAgIAkJc3RydWN0IGRtYV9mZW5jZSAqZmVuY2U7DQo+ICsJCXN0cnVjdCBkcm1f
c2NoZWRfam9iICpjbGVhbnVwX2pvYiA9IE5VTEw7DQo+ICAgDQo+ICAgCQl3YWl0X2V2ZW50X2lu
dGVycnVwdGlibGUoc2NoZWQtPndha2VfdXBfd29ya2VyLA0KPiAtCQkJCQkgKGRybV9zY2hlZF9j
bGVhbnVwX2pvYnMoc2NoZWQpLA0KPiArCQkJCQkgKGNsZWFudXBfam9iID0gZHJtX3NjaGVkX2dl
dF9jbGVhbnVwX2pvYihzY2hlZCkpIHx8DQo+ICAgCQkJCQkgKCFkcm1fc2NoZWRfYmxvY2tlZChz
Y2hlZCkgJiYNCj4gICAJCQkJCSAgKGVudGl0eSA9IGRybV9zY2hlZF9zZWxlY3RfZW50aXR5KHNj
aGVkKSkpIHx8DQo+IC0JCQkJCSBrdGhyZWFkX3Nob3VsZF9zdG9wKCkpKTsNCj4gKwkJCQkJIGt0
aHJlYWRfc2hvdWxkX3N0b3AoKSk7DQo+ICsNCj4gKwkJd2hpbGUgKGNsZWFudXBfam9iKSB7DQoN
CkJldHRlciBtYWtlIHRoaXMganVzdCAiaWYgKGNsZWFudXBfam9iKSIuLi4gdG8gbWFrZSBzdXJl
IHRoYXQgd2Ugc3RvcCANCmltbWVkaWF0ZWx5IHdoZW4gdGhlIHRocmVhZCBzaG91bGQgc3RvcC4N
Cg0KQXBhcnQgZnJvbSB0aGF0IGxvb2tzIGdvb2QgdG8gbWUgbm93LA0KQ2hyaXN0aWFuLg0KDQo+
ICsJCQlzY2hlZC0+b3BzLT5mcmVlX2pvYihjbGVhbnVwX2pvYik7DQo+ICsJCQkvKiBxdWV1ZSB0
aW1lb3V0IGZvciBuZXh0IGpvYiAqLw0KPiArCQkJZHJtX3NjaGVkX3N0YXJ0X3RpbWVvdXQoc2No
ZWQpOw0KPiArDQo+ICsJCQljbGVhbnVwX2pvYiA9IGRybV9zY2hlZF9nZXRfY2xlYW51cF9qb2Io
c2NoZWQpOw0KPiArCQl9DQo+ICAgDQo+ICAgCQlpZiAoIWVudGl0eSkNCj4gICAJCQljb250aW51
ZTsNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

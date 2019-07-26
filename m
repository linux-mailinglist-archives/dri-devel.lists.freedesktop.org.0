Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0F775F5B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 08:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C816E894;
	Fri, 26 Jul 2019 06:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810077.outbound.protection.outlook.com [40.107.81.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AB316E88E;
 Fri, 26 Jul 2019 06:56:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDbVjb1h1JXbiszPLb2rfoMfjH5RfMT/UkoCmRZMUsX/3BdmfsIGDsdHgJFBALPdyZZfpJhUhfioNG137+AMfIHSEcaMHUTUfDde8qMH0IA1Sce1Ko5S/+lm1YScj0Jxz2/+cyCzEBYNXL/16UosKvD8uRbybo8vctL0QMWBpCdebEClhgip31hOY1z7necmmh9vrtZeiT4rENULjASFCc/qoqv0GzRS4sZnZViqhAqXFJ6qyyKxAP4RzVhHLDDlX8uA2lXTV9sHp4sCVVqBEzXwKyejmGqeSS9ieo1oDAYDX1M+g2KKl7EC3BUmknxYAKwZlPstUvKiyKsMFKbaaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yyabBsOzno0nHoco5V9k5J2ZMUG6+gbfTSYbkrZRsw=;
 b=PSdsQbUISSVbqVvFudFLJt8rYYEK4UnrUQUytrSVxiycjcbxeNX3uIl//2Fp79e4aruYyCoZf74qsGfGufFrk5L2iR/jNcy6gNx1JGMhBkktoL1gc8BPg9m+8fmY79rapS1lktei/oBd4TQHoPXlf+/GZqbTA+XBtp2yDrslgFt9DuOX6YTA43WsKGujRgprtjOTouXNN7mW6N3RL3ibomMiN75wkAn++YeaVkwUoIPu4Kdf27O3FhvxDw0HQM38gK/VrXPE0uLxiYIuuVl8tYdnQB0l+vJYXBFRj4afOxOdt5k9e7uVzhFfcwEKZrHCDhf+B5D0JbTivf0L5hSdrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1786.namprd12.prod.outlook.com (10.175.91.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Fri, 26 Jul 2019 06:56:41 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::cda7:cfc1:ce62:bcb7%10]) with mapi id 15.20.2094.013; Fri, 26 Jul
 2019 06:56:41 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/radeon: Fill out gem_object->resv
Thread-Topic: [PATCH 1/4] drm/radeon: Fill out gem_object->resv
Thread-Index: AQHVQuzCfP2kimPs7ECL0QzYx1kx0abceK2A
Date: Fri, 26 Jul 2019 06:56:41 +0000
Message-ID: <290dbddd-3bc9-e485-d88f-91b4dd46320d@amd.com>
References: <20190725132655.11951-1-daniel.vetter@ffwll.ch>
 <20190725132655.11951-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20190725132655.11951-2-daniel.vetter@ffwll.ch>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0054.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::18) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 643c5388-f5e6-46ab-73a8-08d7119669e0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1786; 
x-ms-traffictypediagnostic: DM5PR12MB1786:
x-microsoft-antispam-prvs: <DM5PR12MB1786070B6A76A743086E05F683C00@DM5PR12MB1786.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(199004)(189003)(81156014)(66476007)(446003)(52116002)(86362001)(66946007)(66556008)(66446008)(65826007)(11346002)(305945005)(65806001)(76176011)(478600001)(65956001)(4326008)(31696002)(64756008)(66574012)(25786009)(476003)(5660300002)(36756003)(68736007)(71200400001)(6116002)(6486002)(71190400001)(2616005)(7736002)(14444005)(110136005)(256004)(58126008)(53936002)(6506007)(386003)(99286004)(46003)(2906002)(102836004)(31686004)(6246003)(8676002)(64126003)(316002)(8936002)(229853002)(54906003)(486006)(186003)(6436002)(81166006)(14454004)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1786;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6tunv0n7e+OIGt4iUxErQhx6HKHzjg9WqvcUqyriaySmR2/yZBmSed0sGvExYt2eHXSn5b1fFDAtf+qBbNIGbFb1soZTeJtNBSTpDEUSA5WIdPChgmsd+iRNL9xKjgmRxo5uh32751OnKmsDOytm7nqXvAf3h6gym2DIMkd4lfIyif8GGxnMbf9wmXkzvVyaDrhgmU0EpF5PRHIanp7Aqpg1yi7JqtsWf8i1J24NfEZmtfr2+EKi3z7rKUf1cPnQt0HgGf4IBf3kJdUS8vYt9EwZ5YbaVMLgfJFLfeJfz1uZ0PE7weVkQBwoR+t6RfxiQYNlEQkZzEO190XciTkanlsgw01qOjg3a0ITnXlMW4Mp4X9GC7Q9x4dUcDWpzogG1wbHXbAfl3FPq0EQd1/NY/CdLjHK+n/o37q2atK0HC8=
Content-ID: <C83D806A9E8EF447953295A79739973C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 643c5388-f5e6-46ab-73a8-08d7119669e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 06:56:41.7059 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1786
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yyabBsOzno0nHoco5V9k5J2ZMUG6+gbfTSYbkrZRsw=;
 b=bPSJ2qASz6hCBYw/DReDjRjW9ZKJAHMTcFKOMs28YTVPeDLGqCbmECjVWS1DaRByCOv1QKZSX2OQqF13POjAyAuGFbL99LXDly/eyQxK6dRZehKnim0zwBlcWi1iFHBm8L9inClP2hpA4XeovHeXtG2JYLOc8V0hBTtsE6uKxLw=
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDcuMTkgdW0gMTU6MjYgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBUaGF0IHdheSB3
ZSBjYW4gZGl0Y2ggb3VyIGdlbV9wcmltZV9yZXNfb2JqIGltcGxlbWVudGF0aW9uLiBTaW5jZSB0
dG0NCj4gYWJzb2x1dGVseSBuZWVkcyB0aGUgcmlnaHQgcmVzZXJ2YXRpb24gb2JqZWN0IGFsbCB0
aGUgYm9pbGVycGxhdGUgaXMNCj4gYWxyZWFkeSB0aGVyZSBhbmQgd2UganVzdCBoYXZlIHRvIHdp
cmUgaXQgdXAgY29ycmVjdGx5Lg0KPg0KPiBOb3RlIHRoYXQgZ2VtL3ByaW1lIGRvZXNuJ3QgY2Fy
ZSB3aGVuIHdlIGRvIHRoaXMsIGFzIGxvbmcgYXMgd2UgZG8gaXQNCj4gYmVmb3JlIHRoZSBibyBp
cyByZWdpc3RlcmVkIGFuZCBzb21lb25lIGNhbiBjYWxsIHRoZSBoYW5kbGUyZmQgaW9jdGwNCj4g
b24gaXQuDQo+DQo+IEFzaWRlOiB0dG1fYnVmZmVyX29iamVjdC50dG1fcmVzdiBjb3VsZCBwcm9i
YWJseSBiZSBkaXRjaGVkIGluIGZhdm91cg0KPiBvZiBhbHdheXMgcGFzc2luZyBhIG5vbi1OVUxM
IHJlc3YgdG8gdHRtX2JvX2luaXQoKS4gQXQgbGVhc3QgZm9yIGdlbQ0KPiBkcml2ZXJzIHRoYXQg
d291bGQgYXZvaWQgaGF2aW5nIHR3byBvZiB0aGVzZSwgb24gaW4gdHRtX2J1ZmZlcl9vYmplY3QN
Cj4gYW5kIHRoZSBvdGhlciBpbiBkcm1fZ2VtX29iamVjdCwgb25lIGp1c3QgdGhlcmUgZm9yIGNv
bmZ1c2lvbi4NCj4NCj4gQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29t
Pg0KPiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+DQo+IFJldmlld2VkLWJ5
OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4NCj4gQ2M6IEFsZXgg
RGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gQ2M6ICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBDYzogIkRhdmlkIChDaHVuTWluZykg
WmhvdSIgPERhdmlkMS5aaG91QGFtZC5jb20+DQo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Ry
di5jICAgIHwgMiAtLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX29iamVjdC5j
IHwgMSArDQo+ICAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fcHJpbWUuYyAgfCA3IC0t
LS0tLS0NCj4gICAzIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA5IGRlbGV0aW9ucygt
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYw0KPiBpbmRleCA0NDAzZTc2ZTFh
ZTAuLmE0YTc4ZGZkZWYzNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMN
Cj4gQEAgLTE1Miw3ICsxNTIsNiBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKnJhZGVvbl9nZW1f
cHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICAgCQkJCQkJ
CXN0cnVjdCBzZ190YWJsZSAqc2cpOw0KPiAgIGludCByYWRlb25fZ2VtX3ByaW1lX3BpbihzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm9iaik7DQo+ICAgdm9pZCByYWRlb25fZ2VtX3ByaW1lX3VucGlu
KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsNCj4gLXN0cnVjdCByZXNlcnZhdGlvbl9vYmpl
Y3QgKnJhZGVvbl9nZW1fcHJpbWVfcmVzX29iaihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKik7DQo+
ICAgdm9pZCAqcmFkZW9uX2dlbV9wcmltZV92bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
KTsNCj4gICB2b2lkIHJhZGVvbl9nZW1fcHJpbWVfdnVubWFwKHN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqb2JqLCB2b2lkICp2YWRkcik7DQo+ICAgDQo+IEBAIC01NjYsNyArNTY1LDYgQEAgc3RhdGlj
IHN0cnVjdCBkcm1fZHJpdmVyIGttc19kcml2ZXIgPSB7DQo+ICAgCS5nZW1fcHJpbWVfZXhwb3J0
ID0gcmFkZW9uX2dlbV9wcmltZV9leHBvcnQsDQo+ICAgCS5nZW1fcHJpbWVfcGluID0gcmFkZW9u
X2dlbV9wcmltZV9waW4sDQo+ICAgCS5nZW1fcHJpbWVfdW5waW4gPSByYWRlb25fZ2VtX3ByaW1l
X3VucGluLA0KPiAtCS5nZW1fcHJpbWVfcmVzX29iaiA9IHJhZGVvbl9nZW1fcHJpbWVfcmVzX29i
aiwNCj4gICAJLmdlbV9wcmltZV9nZXRfc2dfdGFibGUgPSByYWRlb25fZ2VtX3ByaW1lX2dldF9z
Z190YWJsZSwNCj4gICAJLmdlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUgPSByYWRlb25fZ2VtX3By
aW1lX2ltcG9ydF9zZ190YWJsZSwNCj4gICAJLmdlbV9wcmltZV92bWFwID0gcmFkZW9uX2dlbV9w
cmltZV92bWFwLA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
b2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYw0KPiBpbmRl
eCAyMWY3M2ZjODZmMzguLjdhMmJhZDg0M2Y4YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fb2JqZWN0LmMNCj4gQEAgLTI2Miw2ICsyNjIsNyBAQCBpbnQgcmFkZW9uX2JvX2Ny
ZWF0ZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwNCj4gICAJciA9IHR0bV9ib19pbml0KCZy
ZGV2LT5tbWFuLmJkZXYsICZiby0+dGJvLCBzaXplLCB0eXBlLA0KPiAgIAkJCSZiby0+cGxhY2Vt
ZW50LCBwYWdlX2FsaWduLCAha2VybmVsLCBhY2Nfc2l6ZSwNCj4gICAJCQlzZywgcmVzdiwgJnJh
ZGVvbl90dG1fYm9fZGVzdHJveSk7DQo+ICsJYm8tPmdlbV9iYXNlLnJlc3YgPSBiby0+dGJvLnJl
c3Y7DQo+ICAgCXVwX3JlYWQoJnJkZXYtPnBtLm1jbGtfbG9jayk7DQo+ICAgCWlmICh1bmxpa2Vs
eShyICE9IDApKSB7DQo+ICAgCQlyZXR1cm4gcjsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9wcmltZS5jDQo+IGluZGV4IGRlYWZmY2U1MGEyZS4uOGNlM2U4MDQ1ZDQyIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9wcmltZS5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3ByaW1lLmMNCj4gQEAgLTExNywxMyArMTE3LDYgQEAg
dm9pZCByYWRlb25fZ2VtX3ByaW1lX3VucGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQ0K
PiAgIH0NCj4gICANCj4gICANCj4gLXN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgKnJhZGVvbl9n
ZW1fcHJpbWVfcmVzX29iaihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikNCj4gLXsNCj4gLQlz
dHJ1Y3QgcmFkZW9uX2JvICpibyA9IGdlbV90b19yYWRlb25fYm8ob2JqKTsNCj4gLQ0KPiAtCXJl
dHVybiBiby0+dGJvLnJlc3Y7DQo+IC19DQo+IC0NCj4gICBzdHJ1Y3QgZG1hX2J1ZiAqcmFkZW9u
X2dlbV9wcmltZV9leHBvcnQoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpnb2JqLA0KPiAgIAkJCQkJ
aW50IGZsYWdzKQ0KPiAgIHsNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs

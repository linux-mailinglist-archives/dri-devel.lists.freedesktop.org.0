Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 902DDBE07A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 16:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B7616EBDD;
	Wed, 25 Sep 2019 14:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam03on0625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe48::625])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A00666EBD5;
 Wed, 25 Sep 2019 14:46:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRVA7f6qh26BY9LNldMEnvJS2KnzW3fSn87X4D39yX4zJRjq6PGOIw766FqYQhu03xhEfG1ZyRyXbju/7YXp0dEjIgkDeGoRdTTyBFoEn6Lle4X02CqktGADA8T+d0m3O/kXSjdFW+Lj9FL9JHzH40hbXC5gUyM73YGxHfyZf4z80cdiMXUF7RFtZGTZbKz/yT+9wjASWHH6myce3ZN+BbpekjzghLKUlh6zIl/ZunYRp8ap/osCHdcL6HcshnIubKAO0j6OR4UEHT8gIqDQzC58wHHIvjcXR42J7ZZaCpTaY0urRKpEhib6d0HJVTL0f1tDMCulO+suATvNosuJCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fvu8sBJLNxFoOTHrcahz0ssO8QOI9T2WPnK8P1fW/14=;
 b=eq+MLpYCEJuWFmEmdNd5nX6nvv95pmzqrtIt125l2is8gsNo/rC5mAZYuYVbC6qYZaibCcLnbNrPhRFHUI+2jgZpUpk+fJGZqV3b/RRtPXmt0SPKYFJiPJdGXSSEyagqA7Gf2rYWom1JHOSysF8R81NLP/peVQ6ACih5yx3l8aSmOIL9BEwNsuvj9KVOpz+ft0QJsr0F8wWEq1gee0hn0b3NWGcX6aS9mQtoHvFELIC+WSE6kOMPu8V0prG58+pf4O/3T3tSbs9DP9rfHc2A8JVPx/gqUIwiwFX+n91sik3z9+UC4/0IW+fIkU0QI3HFEq/GH6sAzBq75/kEubt5+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1899.namprd12.prod.outlook.com (10.175.91.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Wed, 25 Sep 2019 14:46:50 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 14:46:49 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v3 10/11] drm/amdgpu: job is secure iff CS is secure (v4)
Thread-Topic: [PATCH v3 10/11] drm/amdgpu: job is secure iff CS is secure (v4)
Thread-Index: AQHVc67eAOP3HjJHn0i9QUAnxAtta6c8eLkA
Date: Wed, 25 Sep 2019 14:46:49 +0000
Message-ID: <e04af4ef-aa3b-534b-8c5b-e6ee11f677a5@amd.com>
References: <1569422279-6609-1-git-send-email-ray.huang@amd.com>
In-Reply-To: <1569422279-6609-1-git-send-email-ray.huang@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: MRXP264CA0023.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::35) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4551dfbe-1922-46f7-dab0-08d741c73239
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1899; 
x-ms-traffictypediagnostic: DM5PR12MB1899:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1899655B78FFF7962A9F395883870@DM5PR12MB1899.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(199004)(189003)(8936002)(65806001)(4326008)(66556008)(66476007)(450100002)(478600001)(110136005)(6116002)(31686004)(99286004)(58126008)(2201001)(256004)(14454004)(36756003)(316002)(64756008)(86362001)(66446008)(2501003)(25786009)(66946007)(54906003)(6246003)(71200400001)(5660300002)(2906002)(71190400001)(7736002)(81156014)(31696002)(6636002)(52116002)(386003)(305945005)(6512007)(8676002)(76176011)(81166006)(6506007)(102836004)(186003)(11346002)(6486002)(6436002)(2616005)(476003)(446003)(486006)(46003)(229853002)(65956001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1899;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: k5e6wnvdK9WW3CRktb33piVXsDebywi8Onsc9REiV871p6ECDkWhujMrVt4xSVmhkZfP+/0l6FCYXq4UGJuf6I1X/r2sErWXn5WDykfUdNgDPFC5zlUNFU5Zzp1vOmVr8PyjqZqB8lhB7DvXFIUtslecLCo5KunGqkqpK5GgPuUIOUxWn958XyGsZrHobw/hI+s3KKw69//Shw+T6MWYwWDdC9PwUb1wRjw1pq+719GSEzsc+932Qm+HtoD1ZfwxzH8XuNrlH7WezBx2TjoRr+HxcFR2rzzjIEOuxFhoDPbmr/D70BSzY5HhfgroQmnSNjJfFiQfkEBDhvz/e+fFpofsBVArFhiPaOHMrB/sR7JznCHc2uYaZWWJB2SET7Gd5SXR3w3GXCLlsjyJYnLJphFy0IgGZXM8ImXBqkrnNrA=
Content-ID: <C0B46D216121F243AE972DAC23E63763@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4551dfbe-1922-46f7-dab0-08d741c73239
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 14:46:49.5493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ChKZf62i6GKBwPMzbNoA+ynaEY0XFK5v06JffQjZxAuE4ouLTefWeRRtZ/qVIAs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1899
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fvu8sBJLNxFoOTHrcahz0ssO8QOI9T2WPnK8P1fW/14=;
 b=eyroxFIqaYwRgA1oo1f6Op2qL/uWoDEZWTEMId/u1DaZnyMpUXVr7inkCL33hPa0htsM9IBK3DTdwcmUILbxhvu7fKP/qven+B7jWybGllgeSIzM26P8t2DMrTqRinwrVu4rxKVGznJ7MgFtBghgsL+l4x23Gy7zQ/w2ADiAyoM=
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

QW0gMjUuMDkuMTkgdW0gMTY6Mzggc2NocmllYiBIdWFuZywgUmF5Og0KPiBNYXJrIGEgam9iIGFz
IHNlY3VyZSwgaWYgYW5kIG9ubHkgaWYgdGhlIGNvbW1hbmQNCj4gc3VibWlzc2lvbiBmbGFnIGhh
cyB0aGUgc2VjdXJlIGZsYWcgc2V0Lg0KPg0KPiB2MjogZml4IHRoZSBudWxsIGpvYiBwb2ludGVy
IHdoaWxlIGluIHZtaWQgMA0KPiBzdWJtaXNzaW9uLg0KPiB2MzogQ29udGV4dCAtLT4gQ29tbWFu
ZCBzdWJtaXNzaW9uLg0KPiB2NDogZmlsbGluZyBjcyBwYXJzZXIgd2l0aCBjcy0+aW4uZmxhZ3MN
Cj4NCj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCj4gQ28t
ZGV2ZWxvcGVkLWJ5OiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPg0KPiBSZXZpZXdl
ZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiAtLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCAgICAgfCAgMyArKysNCj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyAgfCAxMSArKysrKysrKysrLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jICB8ICA0ICsrLS0NCj4g
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmggfCAgMiArKw0KPiAgIDQg
ZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4NCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCj4gaW5kZXggNjk3ZThlNS4uZmQ2MDY5NSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgNCj4gQEAgLTQ4NSw2ICs0ODUsOSBA
QCBzdHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciB7DQo+ICAgCXVpbnQ2NF90CQkJYnl0ZXNfbW92ZWQ7
DQo+ICAgCXVpbnQ2NF90CQkJYnl0ZXNfbW92ZWRfdmlzOw0KPiAgIA0KPiArCS8qIHNlY3VyZSBj
cyAqLw0KPiArCWJvb2wJCQkJaXNfc2VjdXJlOw0KPiArDQo+ICAgCS8qIHVzZXIgZmVuY2UgKi8N
Cj4gICAJc3RydWN0IGFtZGdwdV9ib19saXN0X2VudHJ5CXVmX2VudHJ5Ow0KPiAgIA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2NzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYw0KPiBpbmRleCA1MWYzZGIwLi45MDM4ZGMx
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYw0KPiBAQCAtMTMz
LDYgKzEzMywxNCBAQCBzdGF0aWMgaW50IGFtZGdwdV9jc19wYXJzZXJfaW5pdChzdHJ1Y3QgYW1k
Z3B1X2NzX3BhcnNlciAqcCwgdW5pb24gZHJtX2FtZGdwdV9jcw0KPiAgIAkJZ290byBmcmVlX2No
dW5rOw0KPiAgIAl9DQo+ICAgDQo+ICsJLyoqDQo+ICsJICogVGhlIGNvbW1hbmQgc3VibWlzc2lv
biAoY3MpIGlzIGEgdW5pb24sIHNvIGFuIGFzc2lnbm1lbnQgdG8NCj4gKwkgKiAnb3V0JyBpcyBk
ZXN0cnVjdGl2ZSB0byB0aGUgY3MgKGF0IGxlYXN0IHRoZSBmaXJzdCA4DQo+ICsJICogYnl0ZXMp
LiBGb3IgdGhpcyByZWFzb24sIGlucXVpcmUgYWJvdXQgdGhlIGZsYWdzIGJlZm9yZSB0aGUNCj4g
KwkgKiBhc3NpZ25tZW50IHRvICdvdXQnLg0KPiArCSAqLw0KPiArCXAtPmlzX3NlY3VyZSA9IGNz
LT5pbi5mbGFncyAmIEFNREdQVV9DU19GTEFHU19TRUNVUkU7DQo+ICsNCj4gICAJLyogZ2V0IGNo
dW5rcyAqLw0KPiAgIAljaHVua19hcnJheV91c2VyID0gdTY0X3RvX3VzZXJfcHRyKGNzLT5pbi5j
aHVua3MpOw0KPiAgIAlpZiAoY29weV9mcm9tX3VzZXIoY2h1bmtfYXJyYXksIGNodW5rX2FycmF5
X3VzZXIsDQo+IEBAIC0xMjUyLDggKzEyNjAsOSBAQCBzdGF0aWMgaW50IGFtZGdwdV9jc19zdWJt
aXQoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsDQo+ICAgCQlwLT5jdHgtPnByZWFtYmxlX3By
ZXNlbnRlZCA9IHRydWU7DQo+ICAgCX0NCj4gICANCj4gLQljcy0+b3V0LmhhbmRsZSA9IHNlcTsN
Cj4gKwlqb2ItPnNlY3VyZSA9IHAtPmlzX3NlY3VyZTsNCj4gICAJam9iLT51Zl9zZXF1ZW5jZSA9
IHNlcTsNCj4gKwljcy0+b3V0LmhhbmRsZSA9IHNlcTsNCg0KQXQgbGVhc3QgaXQgaXMgbm8gbG9u
Z2VyIGFjY2Vzc2luZyBjcy0+aW4sIGJ1dCB0aGF0IHN0aWxsIGxvb2tzIGxpa2UgdGhlIA0Kd3Jv
bmcgcGxhY2UgdG8gaW5pdGlhbGl6ZSB0aGUgam9iLg0KDQpXaHkgY2FuJ3Qgd2UgZmlsbCB0aGF0
IGluIGRpcmVjdGx5IGFmdGVyIGFtZGdwdV9qb2JfYWxsb2MoKSA/DQoNClJlZ2FyZHMsDQpDaHJp
c3RpYW4uDQoNCj4gICANCj4gICAJYW1kZ3B1X2pvYl9mcmVlX3Jlc291cmNlcyhqb2IpOw0KPiAg
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYw0KPiBpbmRleCBlMWRjMjI5
Li5jYjliNjUwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfaWIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYw0K
PiBAQCAtMjEwLDcgKzIxMCw3IEBAIGludCBhbWRncHVfaWJfc2NoZWR1bGUoc3RydWN0IGFtZGdw
dV9yaW5nICpyaW5nLCB1bnNpZ25lZCBudW1faWJzLA0KPiAgIAlpZiAoam9iICYmIHJpbmctPmZ1
bmNzLT5lbWl0X2NudHhjbnRsKSB7DQo+ICAgCQlzdGF0dXMgfD0gam9iLT5wcmVhbWJsZV9zdGF0
dXM7DQo+ICAgCQlzdGF0dXMgfD0gam9iLT5wcmVlbXB0aW9uX3N0YXR1czsNCj4gLQkJYW1kZ3B1
X3JpbmdfZW1pdF9jbnR4Y250bChyaW5nLCBzdGF0dXMsIGZhbHNlKTsNCj4gKwkJYW1kZ3B1X3Jp
bmdfZW1pdF9jbnR4Y250bChyaW5nLCBzdGF0dXMsIGpvYi0+c2VjdXJlKTsNCj4gICAJfQ0KPiAg
IA0KPiAgIAlmb3IgKGkgPSAwOyBpIDwgbnVtX2liczsgKytpKSB7DQo+IEBAIC0yMjksNyArMjI5
LDcgQEAgaW50IGFtZGdwdV9pYl9zY2hlZHVsZShzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIHVu
c2lnbmVkIG51bV9pYnMsDQo+ICAgCX0NCj4gICANCj4gICAJaWYgKHJpbmctPmZ1bmNzLT5lbWl0
X3RteikNCj4gLQkJYW1kZ3B1X3JpbmdfZW1pdF90bXoocmluZywgZmFsc2UsIGZhbHNlKTsNCj4g
KwkJYW1kZ3B1X3JpbmdfZW1pdF90bXoocmluZywgZmFsc2UsIGpvYiA/IGpvYi0+c2VjdXJlIDog
ZmFsc2UpOw0KPiAgIA0KPiAgICNpZmRlZiBDT05GSUdfWDg2XzY0DQo+ICAgCWlmICghKGFkZXYt
PmZsYWdzICYgQU1EX0lTX0FQVSkpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfam9iLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
am9iLmgNCj4gaW5kZXggZGM3ZWU5My4uYWEwZTM3NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9qb2IuaA0KPiBAQCAtNjMsNiArNjMsOCBAQCBzdHJ1Y3QgYW1kZ3B1
X2pvYiB7DQo+ICAgCXVpbnQ2NF90CQl1Zl9hZGRyOw0KPiAgIAl1aW50NjRfdAkJdWZfc2VxdWVu
Y2U7DQo+ICAgDQo+ICsJLyogdGhlIGpvYiBpcyBkdWUgdG8gYSBzZWN1cmUgY29tbWFuZCBzdWJt
aXNzaW9uICovDQo+ICsJYm9vbAkJCXNlY3VyZTsNCj4gICB9Ow0KPiAgIA0KPiAgIGludCBhbWRn
cHVfam9iX2FsbG9jKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1bnNpZ25lZCBudW1faWJz
LA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

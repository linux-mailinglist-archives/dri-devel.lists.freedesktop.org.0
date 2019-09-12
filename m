Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83314B0E3F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 13:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D66F06ECEB;
	Thu, 12 Sep 2019 11:48:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780049.outbound.protection.outlook.com [40.107.78.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F53F6ECEC;
 Thu, 12 Sep 2019 11:48:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGVbkYKsVB+a2XlVR8QkOBwrkN1qraUk/EVjLUz5mlHLLIy57hE0dbK3J2eHTXX1J1mxDk6RtrO/khKkUUhYWW9LnfqriSPfhG60NIKCnz0xok05u5HbQBMNUdWZvp2gApu0CVtqJIx6dQ4qja/1rWYulL1sT5B05pCQXBfa1nhoLBu5lbDJnPIpdVxeFAdAmEtyCL1ZOMeQORcIytuHWxYFOcwuzrPsIv9I/3ue72q0UaGoP7DBlT2HVWOaWUSiNH0thokdslSclth2RoMyWU4VAf9bUU2xSwbK6sQeoTVEoLzwh9hyq6BTSdgOCkB7azHpQD2TAs9VRkyYn039qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz0NaajsSLXs690JMSKQLqbBfegUvZjNfZ7QgmzSSmo=;
 b=hrBVb3bYuQQw0Zup/89rZpdVu7//EXbX/oMeg+L7hHUAaa8LulRmLZsJ9rxLqxbNsfc4AIv/j9CJA9OHEMFUNg3aTKgGgG7qTT98yD6w61kDvOUSdiLRc5OuA8Y35uCpFAN4EQgy+TZEbKtsVXG+MRv9c/6qfC7ee9m8HPCvnRDmFgrcyqj45XVyDOzuv217j7REItRCLfONgCagwen2c9vg8tFSD8crXzR1bC1Pp+OechDe9Kn/BO4YnfZ6KO7wiwa6M87DBnWUk47ZQss+LAuZjSUMmX8L4iim9muaT3R5kPDaExuRxILa/i/mL2tGBRGE30OrO1m7ksPWdu4Gfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1529.namprd12.prod.outlook.com (10.172.33.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Thu, 12 Sep 2019 11:48:30 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2241.018; Thu, 12 Sep 2019
 11:48:30 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH 14/14] drm/amdgpu: set TMZ bits in PTEs for secure bo (v2)
Thread-Topic: [PATCH 14/14] drm/amdgpu: set TMZ bits in PTEs for secure bo (v2)
Thread-Index: AQHVaJcoxE5tDnLT8kO2X76kLSCUPqcmY2CAgAF0vQCAABaogA==
Date: Thu, 12 Sep 2019 11:48:30 +0000
Message-ID: <26355f8a-d16b-e406-8cfc-b30742419121@amd.com>
References: <1568202584-14471-1-git-send-email-ray.huang@amd.com>
 <1568202584-14471-15-git-send-email-ray.huang@amd.com>
 <5704cdc8-754e-538e-9547-738ef81efa7c@amd.com>
 <MN2PR12MB3309544896408F62494EC8B3ECB00@MN2PR12MB3309.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB3309544896408F62494EC8B3ECB00@MN2PR12MB3309.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM3PR03CA0065.eurprd03.prod.outlook.com
 (2603:10a6:207:5::23) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94608c47-9ba9-445d-f95a-08d73777216f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1529; 
x-ms-traffictypediagnostic: DM5PR12MB1529:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB15297815049DFC098BF3BDDF83B00@DM5PR12MB1529.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(396003)(136003)(366004)(376002)(346002)(199004)(189003)(8936002)(25786009)(66476007)(64756008)(66946007)(66446008)(6862004)(66556008)(71190400001)(14454004)(37006003)(446003)(305945005)(58126008)(6246003)(11346002)(316002)(53936002)(486006)(6116002)(71200400001)(6506007)(81166006)(81156014)(386003)(450100002)(8676002)(6636002)(31686004)(6436002)(76176011)(6486002)(52116002)(476003)(2616005)(102836004)(99286004)(4326008)(2906002)(31696002)(86362001)(65806001)(229853002)(14444005)(256004)(65956001)(36756003)(186003)(54906003)(478600001)(5660300002)(7736002)(46003)(6512007)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1529;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: X0J+8cpk7GySbn5x+hNXgx32eKDs3pIICrB5RMFITyFsBhpyhLhwvykPW71yqeFiCa91A0xDfyZdFX3oRSqiGNMNLdbFksCJEgljUMcuwvPhXg2WMuYrKMDOXTwsFe3PHMPFfXi60WvOlavzAkwiPqITPa4aotiFWb+nLC8mj4udwieomEW9RW0XnEEJ8SPg7RyzMxh3rRx+msDIbOkBVuEhIKYAQOi11dZs2PbforVfi68QuSrNTmwNB4gnfnE+LRe0aTvD6LC+T2PXAj1N8PtmdvKn8e2S3NZ7l9w8zPkyGA8EC2oVynD7zet6WqC33Zt4Pp5VzNrrtwXo+Lwlgvs6GB09COyV5UzXhto2oqFKscJadPiEn3NUUxGlbnUqpBCPjIdOBSTIMh1v2OVOQ5JKgPKm/jN1HYQDUhLp2Nw=
Content-ID: <7543AE53771BB84A8B95D608D6EAC4D7@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94608c47-9ba9-445d-f95a-08d73777216f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 11:48:30.0515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x+eGCK/MXAMEutauR5XqtL7qVGImTM72XvuKcpLcIMUnzpWsDV3QWq3fBg+5APOP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1529
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oz0NaajsSLXs690JMSKQLqbBfegUvZjNfZ7QgmzSSmo=;
 b=hXe8uFBnxGF1DnmRawD5MrgkGPepqSo/8OnTTL2qsmzZgYJe0UHzkb5Ewnq4TvFBA4T1mbyjrgvBtDvr+FNpMNAo5sSLYeLDxFXcmnb3wa6UN/iFa72+Y/eUMsZ6WgJF5pTemqkbvzd+e3kr5xGI84DMDUd7RK9PUEqfcA1N9Cc=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTIuMDkuMTkgdW0gMTI6Mjcgc2NocmllYiBIdWFuZywgUmF5Og0KPiBPbiBXZWQsIFNlcCAx
MSwgMjAxOSBhdCAwODoxMzoxOVBNICswODAwLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4+
IEFtIDExLjA5LjE5IHVtIDEzOjUwIHNjaHJpZWIgSHVhbmcsIFJheToNCj4+PiBGcm9tOiBBbGV4
IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+Pj4NCj4+PiBJZiBvbmUgYm8g
aXMgc2VjdXJlIChjcmVhdGVkIHdpdGggQU1ER1BVX0dFTV9DUkVBVEVfRU5DUllQVEVEKSwgdGhl
IFRNWiBiaXRzIG9mDQo+Pj4gUFRFcyB0aGF0IGJlbG9uZ3MgdGhhdCBibyBzaG91bGQgYmUgc2V0
LiBUaGVuIHBzcCBpcyBhYmxlIHRvIHByb3RlY3QgdGhlIHBhZ2VzDQo+Pj4gb2YgdGhpcyBibyB0
byBhdm9pZCB0aGUgYWNjZXNzIGZyb20gYW4gInVudHJ1c3QiIGRvbWFpbiBzdWNoIGFzIENQVS4N
Cj4+Pg0KPj4+IHYxOiBkZXNpZ24gYW5kIGRyYWZ0IHRoZSBza2VsZXRpb24gb2YgdG16IGJpdHMg
c2V0dGluZyBvbiBQVEVzIChBbGV4KQ0KPj4+IHYyOiByZXR1cm4gZmFpbHVyZSBvbmNlIGNyZWF0
ZSBzZWN1cmUgYm8gb24gbm8tdG16IHBsYXRmb3JtICAoUmF5KQ0KPj4+DQo+Pj4gU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPj4+IFJldmll
d2VkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPg0KPj4+IFNpZ25lZC1vZmYtYnk6
IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+Pj4gLS0tDQo+Pj4gICAgZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jICAgIHwgMTIgKysrKysrKysrKystDQo+Pj4g
ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oIHwgMTAgKysrKysr
KysrKw0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyAgICB8
ICA1ICsrKysrDQo+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5j
DQo+Pj4gaW5kZXggMjJlYWI3NC4uNTMzMjEwNCAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMNCj4+PiBAQCAtMjIyLDcgKzIyMiw4IEBAIGludCBhbWRn
cHVfZ2VtX2NyZWF0ZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLA0K
Pj4+ICAgIAkJICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIHwNCj4+PiAgICAJ
CSAgICAgIEFNREdQVV9HRU1fQ1JFQVRFX1ZSQU1fQ0xFQVJFRCB8DQo+Pj4gICAgCQkgICAgICBB
TURHUFVfR0VNX0NSRUFURV9WTV9BTFdBWVNfVkFMSUQgfA0KPj4+IC0JCSAgICAgIEFNREdQVV9H
RU1fQ1JFQVRFX0VYUExJQ0lUX1NZTkMpKQ0KPj4+ICsJCSAgICAgIEFNREdQVV9HRU1fQ1JFQVRF
X0VYUExJQ0lUX1NZTkMgfA0KPj4+ICsJCSAgICAgIEFNREdQVV9HRU1fQ1JFQVRFX0VOQ1JZUFRF
RCkpDQo+Pj4gICAgDQo+Pj4gICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4+PiAgICANCj4+PiBAQCAt
MjMwLDYgKzIzMSwxMSBAQCBpbnQgYW1kZ3B1X2dlbV9jcmVhdGVfaW9jdGwoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwNCj4+PiAgICAJaWYgKGFyZ3MtPmluLmRvbWFpbnMgJiB+
QU1ER1BVX0dFTV9ET01BSU5fTUFTSykNCj4+PiAgICAJCXJldHVybiAtRUlOVkFMOw0KPj4+ICAg
IA0KPj4+ICsJaWYgKCFhZGV2LT50bXouZW5hYmxlZCAmJiAoZmxhZ3MgJiBBTURHUFVfR0VNX0NS
RUFURV9FTkNSWVBURUQpKSB7DQo+Pj4gKwkJRFJNX0VSUk9SKCJDYW5ub3QgYWxsb2NhdGUgc2Vj
dXJlIGJ1ZmZlciB3aGlsZSB0bXogaXMgZGlzYWJsZWRcbiIpOw0KPj4+ICsJCXJldHVybiAtRUlO
VkFMOw0KPj4+ICsJfQ0KPj4+ICsNCj4+PiAgICAJLyogY3JlYXRlIGEgZ2VtIG9iamVjdCB0byBj
b250YWluIHRoaXMgb2JqZWN0IGluICovDQo+Pj4gICAgCWlmIChhcmdzLT5pbi5kb21haW5zICYg
KEFNREdQVV9HRU1fRE9NQUlOX0dEUyB8DQo+Pj4gICAgCSAgICBBTURHUFVfR0VNX0RPTUFJTl9H
V1MgfCBBTURHUFVfR0VNX0RPTUFJTl9PQSkpIHsNCj4+PiBAQCAtMjUxLDYgKzI1NywxMCBAQCBp
bnQgYW1kZ3B1X2dlbV9jcmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAq
ZGF0YSwNCj4+PiAgICAJCXJlc3YgPSB2bS0+cm9vdC5iYXNlLmJvLT50Ym8ucmVzdjsNCj4+PiAg
ICAJfQ0KPj4+ICAgIA0KPj4+ICsJaWYgKGZsYWdzICYgQU1ER1BVX0dFTV9DUkVBVEVfRU5DUllQ
VEVEKSB7DQo+Pj4gKwkJLyogWFhYOiBwYWQgb3V0IGFsaWdubWVudCB0byBtZWV0IFRNWiByZXF1
aXJlbWVudHMgKi8NCj4+PiArCX0NCj4+PiArDQo+Pj4gICAgCXIgPSBhbWRncHVfZ2VtX29iamVj
dF9jcmVhdGUoYWRldiwgc2l6ZSwgYXJncy0+aW4uYWxpZ25tZW50LA0KPj4+ICAgIAkJCQkgICAg
ICh1MzIpKDB4ZmZmZmZmZmYgJiBhcmdzLT5pbi5kb21haW5zKSwNCj4+PiAgICAJCQkJICAgICBm
bGFncywgdHRtX2JvX3R5cGVfZGV2aWNlLCByZXN2LCAmZ29iaik7DQo+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaCBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaA0KPj4+IGluZGV4IDVhM2MxNzcuLjI4NmUy
ZTIgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29i
amVjdC5oDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVj
dC5oDQo+Pj4gQEAgLTIyNCw2ICsyMjQsMTYgQEAgc3RhdGljIGlubGluZSBib29sIGFtZGdwdV9i
b19leHBsaWNpdF9zeW5jKHN0cnVjdCBhbWRncHVfYm8gKmJvKQ0KPj4+ICAgIAlyZXR1cm4gYm8t
PmZsYWdzICYgQU1ER1BVX0dFTV9DUkVBVEVfRVhQTElDSVRfU1lOQzsNCj4+PiAgICB9DQo+Pj4g
ICAgDQo+Pj4gKy8qKg0KPj4+ICsgKiBhbWRncHVfYm9fZW5jcnlwdGVkIC0gcmV0dXJuIHdoZXRo
ZXIgdGhlIGJvIGlzIGVuY3J5cHRlZA0KPj4+ICsgKi8NCj4+PiArc3RhdGljIGlubGluZSBib29s
IGFtZGdwdV9ib19lbmNyeXB0ZWQoc3RydWN0IGFtZGdwdV9ibyAqYm8pDQo+Pj4gK3sNCj4+PiAr
CXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KGJvLT50Ym8uYmRl
dik7DQo+Pj4gKw0KPj4+ICsJcmV0dXJuIGFkZXYtPnRtei5lbmFibGVkICYmIChiby0+ZmxhZ3Mg
JiBBTURHUFVfR0VNX0NSRUFURV9FTkNSWVBURUQpOw0KPj4gQ2hlY2tpbmcgdGhlIGFkZXYtPnRt
ei5lbmFibGVkIGZsYWdzIHNob3VsZCBiZSBkcm9wcGVkIGhlcmUuDQo+Pg0KPiBUaGF0J3MgZmlu
ZS4gQk8gc2hvdWxkIGJlIHZhbGlkYXRlZCB3aGlsZSBpdCBpcyBjcmVhdGVkLg0KPg0KPiBCdXQg
aWYgdGhlIEJPIGlzIGNyZWF0ZWQgYnkgdm1pZCAwLCBpcyB0aGlzIGNoZWNraW5nIG5lZWRlZD8N
Cj4NCj4+PiArfQ0KPj4+ICsNCj4+PiAgICBib29sIGFtZGdwdV9ib19pc19hbWRncHVfYm8oc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyk7DQo+Pj4gICAgdm9pZCBhbWRncHVfYm9fcGxhY2Vt
ZW50X2Zyb21fZG9tYWluKHN0cnVjdCBhbWRncHVfYm8gKmFibywgdTMyIGRvbWFpbik7DQo+Pj4g
ICAgDQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPj4+IGluZGV4
IDM2NjM2NTUuLjhmMDBiYjIgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3R0bS5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jDQo+Pj4gQEAgLTE0MzQsNiArMTQzNCw4IEBAIGJvb2wgYW1kZ3B1X3R0bV90
dF9pc19yZWFkb25seShzdHJ1Y3QgdHRtX3R0ICp0dG0pDQo+Pj4gICAgdWludDY0X3QgYW1kZ3B1
X3R0bV90dF9wZGVfZmxhZ3Moc3RydWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QgdHRtX21lbV9yZWcg
Km1lbSkNCj4+PiAgICB7DQo+Pj4gICAgCXVpbnQ2NF90IGZsYWdzID0gMDsNCj4+PiArCXN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCAqdGJvID0gdHRtX21lbV9yZWdfdG9fYm8obWVtKTsNCj4+PiAr
CXN0cnVjdCBhbWRncHVfYm8gKmFibyA9IHR0bV90b19hbWRncHVfYm8odGJvKTsNCj4+IFRoYXQn
cyBhIGNsZWFyIE5BSy4gVGhlIGZ1bmN0aW9uIGlzIG5vdCBuZWNlc3NhcmlseSBjYWxsZWQgd2l0
aA0KPj4gJmJvLT5tZW0sIHdoaWNoIGlzIGFsc28gdGhlIHJlYXNvbiB3aHkgdGhpcyBmdW5jdGlv
biBkb2Vzbid0IGdldHMgdGhlIEJPDQo+PiBhcyBwYXJhbWV0ZXIuDQo+Pg0KPiBEbyB5b3UgbWVh
biB3ZSBjYW4gcmV2aXNlIHRoZSBiZWxvdyBmdW5jdGlvbnMgdG8gdXNlIGJvIGFzIHRoZSBwYXJh
bWV0ZXINCj4gaW5zdGVhZD8NCj4NCj4gdWludDY0X3QgYW1kZ3B1X3R0bV90dF9wZGVfZmxhZ3Mo
c3RydWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QgYW1kZ3B1X2JvICpibykNCj4gdWludDY0X3QgYW1k
Z3B1X3R0bV90dF9wdGVfZmxhZ3Moc3RydWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QgYW1kZ3B1X2Jv
ICpibykNCg0KSWYgdGhhdCBpcyBwb3NzaWJsZSB0aGVuIHRoaXMgd291bGQgaW5kZWVkIGJlIGEg
c29sdXRpb24gZm9yIHRoZSBwcm9ibGVtLg0KDQpDaHJpc3RpYW4uDQoNCj4NCj4gVGhhbmtzLA0K
PiBSYXkNCj4NCj4+IENocmlzdGlhbi4NCj4+DQo+Pj4gICAgDQo+Pj4gICAgCWlmIChtZW0gJiYg
bWVtLT5tZW1fdHlwZSAhPSBUVE1fUExfU1lTVEVNKQ0KPj4+ICAgIAkJZmxhZ3MgfD0gQU1ER1BV
X1BURV9WQUxJRDsNCj4+PiBAQCAtMTQ0NCw2ICsxNDQ2LDkgQEAgdWludDY0X3QgYW1kZ3B1X3R0
bV90dF9wZGVfZmxhZ3Moc3RydWN0IHR0bV90dCAqdHRtLCBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1l
bSkNCj4+PiAgICAJCWlmICh0dG0tPmNhY2hpbmdfc3RhdGUgPT0gdHRfY2FjaGVkKQ0KPj4+ICAg
IAkJCWZsYWdzIHw9IEFNREdQVV9QVEVfU05PT1BFRDsNCj4+PiAgICAJfQ0KPj4+ICsJaWYgKGFt
ZGdwdV9ib19lbmNyeXB0ZWQoYWJvKSkgew0KPj4+ICsJCWZsYWdzIHw9IEFNREdQVV9QVEVfVE1a
Ow0KPj4+ICsJfQ0KPj4+ICAgIA0KPj4+ICAgIAlyZXR1cm4gZmxhZ3M7DQo+Pj4gICAgfQ0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

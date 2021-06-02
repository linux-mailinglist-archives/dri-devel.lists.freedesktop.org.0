Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC0C397E0E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 03:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171C96EB41;
	Wed,  2 Jun 2021 01:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB54E6EB41
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 01:30:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YlfOodc5V2K7yv/X+SyRLk/qma8qH3M+h+EqN+pVRw3HdCTvr6H8xQY+fQe9kSRCW8TLZHv8rzmcgftHYR2RJh0PKnQ7zG+OjchqmSqDsYYzhwVjbBBGZbptzcaunQ7y8jAjqJjKHt2uSj0NhJNE9JvxivQBZ9e3EF3EXYku1Vx7pSgICJcyOTsbuug+QwkuDhx4ss95OdJtX1LZG0RTqe9Z1gSV7+7gDQLuEBI1e1aEokr9lX5uZW94CPxtiM44Zxs8qPwpc1qKQVYIrhUenqzHTEOXHo4JEUh73eVcRIvqzWfzIIvXMucpcm3XywPKU+5t8cb9NMNUYAjcFBVnSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujc9ujX2zMysUNAopWHi+7nQd1ZE/9qRHG9d/d7I/jc=;
 b=D1TquJ3bRDBr7lWCaJWTuX/QiKX5412OnoVYyTG3aB0V5KnzrvU+jMi4BxjJceR6/3fGv4Hrd0ABLB2sy++InRZ4sTi4mouIz0DMIjDGqVCE6087OEDMx/6BSLvosi8lfBXiA4RCmftdNXvSNFeWIgXiXS4ZmlZM4T2CfpO6+nfzR+/r9+xbQBrhGP+c9iSpxOLQuKwiP1PS+xER8icVp3Hikv05eTRfSl7Vvjw3HCueXtGoXpNUvHaS+IfMWj5tRlgctRD7kY866xbCNhqM+fCInckBMjsjVJ/XpvkaPsYrOIA6r/PS6wQD7+fhVfS2atqP1TYDhgxvJ2GlAnKDWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujc9ujX2zMysUNAopWHi+7nQd1ZE/9qRHG9d/d7I/jc=;
 b=Nit81/MyrUxW7P1rvxs9vZ0/zj9w9hdChpzdaePWGNLK/uTABGjDWMzhJGqqpfdGb/ASaKLyIyyvi+SMnbYNLW/sIISyINKkHt7clhGbe65JtbmnIjerGnjPOz5Qv2DHynk6uUIhxgTGQIprYvKpfaa/fYq7dxzUS+Bdn4K1TgM=
Received: from MN2PR12MB4256.namprd12.prod.outlook.com (2603:10b6:208:1d2::14)
 by MN2PR12MB4584.namprd12.prod.outlook.com (2603:10b6:208:24e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.26; Wed, 2 Jun
 2021 01:30:47 +0000
Received: from MN2PR12MB4256.namprd12.prod.outlook.com
 ([fe80::1db1:3b07:d73d:bdde]) by MN2PR12MB4256.namprd12.prod.outlook.com
 ([fe80::1db1:3b07:d73d:bdde%3]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 01:30:47 +0000
From: "Yu, Lang" <Lang.Yu@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "thomas_os@shipmail.org" <thomas_os@shipmail.org>
Subject: RE: [PATCH 3/4] drm/amdgpu: always allow evicting to SYSTEM domain
Thread-Topic: [PATCH 3/4] drm/amdgpu: always allow evicting to SYSTEM domain
Thread-Index: AQHXVuE4ODLLhYGv9UWufEPu75dMV6r/7txw
Date: Wed, 2 Jun 2021 01:30:47 +0000
Message-ID: <MN2PR12MB42568DC3EC6619E1E546E488FB3D9@MN2PR12MB4256.namprd12.prod.outlook.com>
References: <20210601122528.1643-1-christian.koenig@amd.com>
 <20210601122528.1643-3-christian.koenig@amd.com>
In-Reply-To: <20210601122528.1643-3-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.134.244]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e28d4f82-f278-4b31-9154-08d925660c3c
x-ms-traffictypediagnostic: MN2PR12MB4584:
x-microsoft-antispam-prvs: <MN2PR12MB458474BF2CD56030782E89E6FB3D9@MN2PR12MB4584.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MNAtNfGHbt6OxPSYe+M5KRe1pO5c3rj9QXHm/qTiicsBnyHNHDYh+p9ILrXuCs+PLV/pWDDdTjc6knTpLnFOfScBM1mVfWpR0bbl+tkoWILrOsfVOI3tN6JSRf9WOv+lDVftajpUEl/KoHaGBrPRVTAC+2aFCBqu/AsV0Y6bXwEvYYedfuOcF1zslzUMXIKHH5mMerWr4cqq3oydf4qpiPS674vljl0Fi9y9ZqJnBKXNhYKYexKvqww7HzfLBYnmIU9nVxzan+DLsgH2+FpRr9sCCu1ZnscAnHM9jFyGraaafxjy4VDe2FJkEWWawThWPcHLyUpkfLhoqhpcuhCgZiizjkYnkG3ulosyv7px1h8tjwCi/Q8JVfQ8A43Ab+3ijtWCV0wXqI5WeoorFd822Xs8lXnCf49LEEMJHZDdcev8fSNEVKRX2Ge9g3egsnvRt++B9uv35H3ls4Q3qLlSgScBOHEkK+BI1/EgWWP4i0HZMJiY7hFURGyV8tIrSZ0IA/F1n4VqytbcXmUbskpZjCstZv3lJfq0jqm5kUrpR/fiO5l/qR6lLBGc3Pugw1QgU7CqF2+sQjuHNH3OVnbHHcJU8Z5uKsKAJCxA3tIIXto=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4256.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(39850400004)(396003)(316002)(7696005)(86362001)(6506007)(83380400001)(4326008)(26005)(71200400001)(110136005)(2906002)(8676002)(66556008)(9686003)(478600001)(52536014)(5660300002)(33656002)(76116006)(66946007)(122000001)(8936002)(186003)(66476007)(66446008)(55016002)(64756008)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Qkw0Q1c5YXlsK1NmbXNiVlpnbHpWWkUzU1hCNHVINWNsUEVpZW9zM3JsM2FR?=
 =?utf-8?B?U2FadFRMTnJTV3lvVXNSOFc0MjdINE1qMGVpV2x4OE9Vek9ERW90SEJ3TkZR?=
 =?utf-8?B?OVUwUkNxMmtHT0dKeVJwVWdham5SdnBOY0VhU3BFRjRHWEJwdGZKQitoRWM2?=
 =?utf-8?B?Y0x3aEFCOHgrb1pXSGlyclFlN2tTTTNQVi9vZ0ZMeHJyNVNqdGlkQjNpODk4?=
 =?utf-8?B?bzNuSW9tUWcxeEhNbXZ6Um5yUzFwT2V1TmVHUDM1cDZEOGl2UCtzMVJzenZk?=
 =?utf-8?B?YytrbFgvZ1Q0WWlWOVNaQ0U0RzRYeEhoOEVtTzlXRGJrczhRcGh3N0xsZUh6?=
 =?utf-8?B?bHY4WnJDLzRYZ2ZlVGlyTFNFRjRReFIxbkFlNEdFMU10S2lwdkFkemRWWTNh?=
 =?utf-8?B?WEZCRHZFV2NQTUZ1Wjc3WEs3dTRhRmY5S2RjNVFwUjFmTjFxMmNhdmJPNEJm?=
 =?utf-8?B?K2ZrQzNCMW10dXJ4SXJqWWZtSDRUWVpKa2dFNm1qUDI1YzQzUlM5Tjlzb2Zr?=
 =?utf-8?B?dWxJczRmRXBMV05GSS9JbnZTVk9ka0d4NEpnbzBLM3JVc0k5RDl6VGU3L1gz?=
 =?utf-8?B?M210NGsvOGRHaXk3Y1JGK090b0N3ZE1ZY3o3WFVhMmQzek9uVzlucW1aMXVV?=
 =?utf-8?B?aXJHeFl3bGtITkhBUEpzd0Z4dWpWcFhwZDBlL09zR0Y4TlpENkFoRjhGYVlJ?=
 =?utf-8?B?S0pxUFlRMXQvcy9NWEErRmYzZ2Rwc1Q4Y0RNZmNDUklsWWpTRUFLUlE2WFo4?=
 =?utf-8?B?RFZWSmF4Tnk3ZHgrRWFhUW9YdGE2QmwyWjB6dVhDRTJndEdTblBYRDVXelBF?=
 =?utf-8?B?SEVLcnpHV2pUQW9GQmwwQVFKL0lXalJsdFc3TU52L2g4MS9NemREYTAyaUtG?=
 =?utf-8?B?S3hpakMxbmc5ZitoQzNLbGN4YWNTOGE2b3Q4cEpRejUzb0ttalZBOFQwdUVR?=
 =?utf-8?B?RlVnTCtPSEdpMXc5cUFYaGxoQjJZZ1hLZ1RmUk56N3p6TTJvOStHVGU0MGJo?=
 =?utf-8?B?TXA2a2hSN2ZsK0JMWC9PSVluUzRxbjFKV3hISEJ0MGxNY3oyQTFjeTZQNTJr?=
 =?utf-8?B?em96Mkx3NC9UclBxbjhJNlVDeUdTVElXMDA0ZDE0QTh6aFpnRTNoZHliaVRt?=
 =?utf-8?B?L3VUQkgwYU9SYnFUbGxyTVNNTXRzdUh3Yit2bFg2a09LUzZUd2RzQ3JZNDFI?=
 =?utf-8?B?dUhHeFY0SS9GdEM2ZGdTaWIxVE8rcXZaeFFWU0dUSElMb2tHWDE1VUJ2UVBL?=
 =?utf-8?B?dXh3eTEyVVRlb2lOTW85TlU3d0thYThKZjR2ZFBEelBJYVVFMmo4YUZLVE9L?=
 =?utf-8?B?bTZ6cFlTSnFpK2Fnend2Q1B6UTJSRjhoaW1vSlVWZTlGUEwvZnlDUDlIaDFG?=
 =?utf-8?B?YWdUVjlYVkswbE00VUZrd2ltSFZFU0Q3NFhlYnZydjkvcmNPcHhRTW1abGQz?=
 =?utf-8?B?UGVYM0VqaDAzNXQyQTRHem84TCtRZ2JwanpDTW1KVHVlZHNRVlBPUzl3WGxt?=
 =?utf-8?B?RVJEblJudXR2OFZva01HN29rRkRoelg0djdDTC9uTHh1YzIxRUU3RWRkV2R4?=
 =?utf-8?B?dVF0VXNUSW40VjcxWHZrcXJQUVc4ZkFnbVNtc216TFU3U1BodmZVNTNpZ3hG?=
 =?utf-8?B?aWtoODlMb0lqNWtRekppS0tKZ3U2clpGSDl1SmRWVWFzeDl2ek9oTDlMaC9Z?=
 =?utf-8?B?WXpmNjQ0TG5rbUN5ZXRkeU9qMmhrRzlKR3oyMWdGQW5ZckQ1U2h1MGJqZ1gy?=
 =?utf-8?Q?HUjL0NcgfjqRcFXgEuX45nZDzyhFrg0WdWaNTgD?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4256.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28d4f82-f278-4b31-9154-08d925660c3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 01:30:47.0270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RoyG3FBiyi3JMOVgyXXz+4b2pjfhVqNd/5pIV1qpm7nSAG/xtdU+tYjMw8w1+YpZwVulnrFntQ9VAOPJZdsiYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4584
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IENocmlzdGlhbiBLw7ZuaWcg
PGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPg0KPlNlbnQ6IFR1ZXNkYXksIEp1bmUg
MSwgMjAyMSA4OjI1IFBNDQo+VG86IFl1LCBMYW5nIDxMYW5nLll1QGFtZC5jb20+OyB0aG9tYXNf
b3NAc2hpcG1haWwub3JnDQo+Q2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj5T
dWJqZWN0OiBbUEFUQ0ggMy80XSBkcm0vYW1kZ3B1OiBhbHdheXMgYWxsb3cgZXZpY3RpbmcgdG8g
U1lTVEVNIGRvbWFpbg0KPg0KPldoZW4gd2UgcnVuIG91dCBvZiBHVFQgd2Ugc2hvdWxkIHN0aWxs
IGJlIGFibGUgdG8gZXZpY3QgVlJBTS0+U1lTVEVNIHdpdGggYQ0KPmJvdW5jZSBidWZmZXJkcm0v
YW1kZ3B1OiBhbHdheXMgYWxsb3cgZXZpY3RpbmcgdG8gU1lTVEVNIGRvbWFpbg0KPg0KPlNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4t
LS0NCj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgNiArKysrLS0N
Cj4gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4NCj5k
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+Yi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj5pbmRleCA2YmRmZjkwMDVh
NDcuLjBmYWY5NzY1ZWY0MSAxMDA2NDQNCj4tLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdHRtLmMNCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dHRtLmMNCj5AQCAtMTQ3LDE0ICsxNDcsMTYgQEAgc3RhdGljIHZvaWQgYW1kZ3B1X2V2aWN0X2Zs
YWdzKHN0cnVjdA0KPnR0bV9idWZmZXJfb2JqZWN0ICpibywNCj4gCQkJICogQk9zIHRvIGJlIGV2
aWN0ZWQgZnJvbSBWUkFNDQo+IAkJCSAqLw0KPiAJCQlhbWRncHVfYm9fcGxhY2VtZW50X2Zyb21f
ZG9tYWluKGFibywNCj5BTURHUFVfR0VNX0RPTUFJTl9WUkFNIHwNCj4tDQo+QU1ER1BVX0dFTV9E
T01BSU5fR1RUKTsNCj4rDQo+CUFNREdQVV9HRU1fRE9NQUlOX0dUVCB8DQo+Kw0KPglBTURHUFVf
R0VNX0RPTUFJTl9DUFUpOw0KPiAJCQlhYm8tPnBsYWNlbWVudHNbMF0uZnBmbiA9IGFkZXYtDQo+
PmdtYy52aXNpYmxlX3ZyYW1fc2l6ZSA+PiBQQUdFX1NISUZUOw0KPiAJCQlhYm8tPnBsYWNlbWVu
dHNbMF0ubHBmbiA9IDA7DQo+IAkJCWFiby0+cGxhY2VtZW50LmJ1c3lfcGxhY2VtZW50ID0gJmFi
by0NCj4+cGxhY2VtZW50c1sxXTsNCj4gCQkJYWJvLT5wbGFjZW1lbnQubnVtX2J1c3lfcGxhY2Vt
ZW50ID0gMTsNCj4gCQl9IGVsc2Ugew0KPiAJCQkvKiBNb3ZlIHRvIEdUVCBtZW1vcnkgKi8NCj4t
CQkJYW1kZ3B1X2JvX3BsYWNlbWVudF9mcm9tX2RvbWFpbihhYm8sDQo+QU1ER1BVX0dFTV9ET01B
SU5fR1RUKTsNCj4rCQkJYW1kZ3B1X2JvX3BsYWNlbWVudF9mcm9tX2RvbWFpbihhYm8sDQo+QU1E
R1BVX0dFTV9ET01BSU5fR1RUIHwNCj4rDQo+CUFNREdQVV9HRU1fRE9NQUlOX0NQVSk7DQo+IAkJ
fQ0KPiAJCWJyZWFrOw0KPiAJY2FzZSBUVE1fUExfVFQ6DQo+LS0NCj4yLjI1LjENCg0KW1l1LCBM
YW5nXSANClllYWgsIHRoYXQncyBpdC4NCg0K

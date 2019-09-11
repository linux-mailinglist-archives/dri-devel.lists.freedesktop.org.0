Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B45C9AFC4C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 14:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8576EADF;
	Wed, 11 Sep 2019 12:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790070.outbound.protection.outlook.com [40.107.79.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE876EADE;
 Wed, 11 Sep 2019 12:13:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjaYrWtzR3F2W/SqtRwVv+/NCiLTKCmvzlWytF0N4a/s91r2l4eLpGfTD7MYM0PE4oqSzgptjsNY6fmkjTUlLdG/+QAjEs2Ui9gd40wEZDZKSDx0o31eII5tGLed0TaLOEztZ3I2cp5fq8Fb1Nz40a0WfbmVgUSlfQQKodChdMo00HdYVYTcRk26CoMTSzW5jDcGwieb13/XvIplDdABdUimkYpFIqSDOAaJTwvv2NLm7+zR4OUG5VSS2OFjWaQlgjS2NNQ01rMOjR100PZpjlk0bbk+HpoeQw6oEQeacBamZwC1Hq85CJKS3AcyidMn0XHQUsrPCfC86FxfGTLCPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKsN8c3Xd4rqQpOyfdeBZQpAgFXzudf+AiqaZmQ5In8=;
 b=YN3+aTWmBlc4Rq7Dn/AduXs6IM30dshn0uxvVQSH+72/D9GDj2nSlrlfQjCa6ZOnWjtkgFvkkEtULV2upCrmcvqWsoDSjPuLwpFPDR6MY5Q3FcSyHlm6+lohgR/QlFSUpZIVmLKkJsBeft9EL3GaURwoa940NiO6T3sgds6qdvdtFgAaO08EBxBb6Rv5Llz1bjDUestbH2WMs5B2cpcULE484YDvECoOUxzBkJ2+Or9bYDMkpBdKLNhNGqqSGZAAkAOBDEdaREsQvCZqNRoUMZVGGkFb4c/o9TkJTajn2GzeteyoKR8dYdxaK1G+Unl3QqUbcvb5Mm9yk30Q72NI9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1596.namprd12.prod.outlook.com (10.172.38.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.20; Wed, 11 Sep 2019 12:13:19 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 12:13:19 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH 14/14] drm/amdgpu: set TMZ bits in PTEs for secure bo (v2)
Thread-Topic: [PATCH 14/14] drm/amdgpu: set TMZ bits in PTEs for secure bo (v2)
Thread-Index: AQHVaJcoxE5tDnLT8kO2X76kLSCUPqcmY2CA
Date: Wed, 11 Sep 2019 12:13:19 +0000
Message-ID: <5704cdc8-754e-538e-9547-738ef81efa7c@amd.com>
References: <1568202584-14471-1-git-send-email-ray.huang@amd.com>
 <1568202584-14471-15-git-send-email-ray.huang@amd.com>
In-Reply-To: <1568202584-14471-15-git-send-email-ray.huang@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0104.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::20) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 51f3b2be-2c84-4633-5eb9-08d736b16ead
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM5PR12MB1596; 
x-ms-traffictypediagnostic: DM5PR12MB1596:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1596F579053F57D34876606883B10@DM5PR12MB1596.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(199004)(189003)(81156014)(478600001)(6486002)(229853002)(4326008)(31686004)(8676002)(186003)(71190400001)(71200400001)(450100002)(2501003)(8936002)(2906002)(6246003)(386003)(2201001)(6512007)(86362001)(53936002)(256004)(81166006)(14444005)(31696002)(102836004)(76176011)(486006)(58126008)(110136005)(36756003)(316002)(6506007)(6116002)(14454004)(6436002)(476003)(66946007)(25786009)(7736002)(65956001)(65806001)(54906003)(11346002)(99286004)(305945005)(446003)(66476007)(66446008)(2616005)(5660300002)(46003)(52116002)(64756008)(66556008)(6636002)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1596;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: wmmGbt+ax/duTc7ahAconWfDRTgnoVuAgw45TMGWkEZZmnrZKOoYPd6+Lr4/yx0c3/b2MTUOePuH9x/EDS64HpCTgMTQoveFaLsr+R51AupZCfjdEZ/HFRNmsT816Zx6ABpnWhW51jrIhFe5ig3nVpycBnVuQIqhPiLgaJCb7bvf+vIf+/Mn1qWz/EcckwvuvH/fpe8xsQ1nvBOaJBx/xjbBO6gh0ZB30h0OnVMUy3Qdt+4UzPXkIhWEFgb+IrQ7j04w0qsHS/RZgZJT3g9lLCXtv0SWK7RmyZ2ybQCehGt8YHg8dnXaLHfybUfTI6GTvNR34bHoFdiw41r1Q1kgONQj4HAHG/ii06Te6FsN3i1v5b4l7W4bH5J6PraUFh+cLAJZeldVAPnxk1DxSDmO40MWxoluIPoFqVfyhHlIRtU=
Content-ID: <B9C5D26C47A3544BB102B810F68B3AB3@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51f3b2be-2c84-4633-5eb9-08d736b16ead
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 12:13:19.1500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qnJCav9YZGqgupfmDci6DOFbwWFMsCWfQGFET5O9rZE4A/QjnUBPuuZrnvo8eECI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1596
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKsN8c3Xd4rqQpOyfdeBZQpAgFXzudf+AiqaZmQ5In8=;
 b=ktQhmwx8xGvJJfqJVwoOlZAmrPaTSBuZ7NpXqxq/6hexFQr3tH8d3Tt5FnUwbhOgXqxCGNG+SCOO1L5GmepXg38w6fMQcwGIyJkOu4e1PBDK+1RtGfudCf1zjnOEn+bJA5EscgUB812Pmkn7AamoCx6peXE4vzDbwbKyzKnumn8=
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

QW0gMTEuMDkuMTkgdW0gMTM6NTAgc2NocmllYiBIdWFuZywgUmF5Og0KPiBGcm9tOiBBbGV4IERl
dWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+DQo+IElmIG9uZSBibyBpcyBzZWN1
cmUgKGNyZWF0ZWQgd2l0aCBBTURHUFVfR0VNX0NSRUFURV9FTkNSWVBURUQpLCB0aGUgVE1aIGJp
dHMgb2YNCj4gUFRFcyB0aGF0IGJlbG9uZ3MgdGhhdCBibyBzaG91bGQgYmUgc2V0LiBUaGVuIHBz
cCBpcyBhYmxlIHRvIHByb3RlY3QgdGhlIHBhZ2VzDQo+IG9mIHRoaXMgYm8gdG8gYXZvaWQgdGhl
IGFjY2VzcyBmcm9tIGFuICJ1bnRydXN0IiBkb21haW4gc3VjaCBhcyBDUFUuDQo+DQo+IHYxOiBk
ZXNpZ24gYW5kIGRyYWZ0IHRoZSBza2VsZXRpb24gb2YgdG16IGJpdHMgc2V0dGluZyBvbiBQVEVz
IChBbGV4KQ0KPiB2MjogcmV0dXJuIGZhaWx1cmUgb25jZSBjcmVhdGUgc2VjdXJlIGJvIG9uIG5v
LXRteiBwbGF0Zm9ybSAgKFJheSkNCj4NCj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiBSZXZpZXdlZC1ieTogSHVhbmcgUnVpIDxyYXku
aHVhbmdAYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1k
LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5j
ICAgIHwgMTIgKysrKysrKysrKystDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X29iamVjdC5oIHwgMTAgKysrKysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYyAgICB8ICA1ICsrKysrDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyNiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZ2VtLmMNCj4gaW5kZXggMjJlYWI3NC4uNTMzMjEwNCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYw0KPiBAQCAtMjIyLDcgKzIyMiw4IEBAIGlu
dCBhbWRncHVfZ2VtX2NyZWF0ZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpk
YXRhLA0KPiAgIAkJICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfQ1BVX0dUVF9VU1dDIHwNCj4gICAJ
CSAgICAgIEFNREdQVV9HRU1fQ1JFQVRFX1ZSQU1fQ0xFQVJFRCB8DQo+ICAgCQkgICAgICBBTURH
UFVfR0VNX0NSRUFURV9WTV9BTFdBWVNfVkFMSUQgfA0KPiAtCQkgICAgICBBTURHUFVfR0VNX0NS
RUFURV9FWFBMSUNJVF9TWU5DKSkNCj4gKwkJICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfRVhQTElD
SVRfU1lOQyB8DQo+ICsJCSAgICAgIEFNREdQVV9HRU1fQ1JFQVRFX0VOQ1JZUFRFRCkpDQo+ICAg
DQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gICANCj4gQEAgLTIzMCw2ICsyMzEsMTEgQEAgaW50
IGFtZGdwdV9nZW1fY3JlYXRlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRh
dGEsDQo+ICAgCWlmIChhcmdzLT5pbi5kb21haW5zICYgfkFNREdQVV9HRU1fRE9NQUlOX01BU0sp
DQo+ICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gICANCj4gKwlpZiAoIWFkZXYtPnRtei5lbmFibGVk
ICYmIChmbGFncyAmIEFNREdQVV9HRU1fQ1JFQVRFX0VOQ1JZUFRFRCkpIHsNCj4gKwkJRFJNX0VS
Uk9SKCJDYW5ub3QgYWxsb2NhdGUgc2VjdXJlIGJ1ZmZlciB3aGlsZSB0bXogaXMgZGlzYWJsZWRc
biIpOw0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gICAJLyogY3JlYXRlIGEg
Z2VtIG9iamVjdCB0byBjb250YWluIHRoaXMgb2JqZWN0IGluICovDQo+ICAgCWlmIChhcmdzLT5p
bi5kb21haW5zICYgKEFNREdQVV9HRU1fRE9NQUlOX0dEUyB8DQo+ICAgCSAgICBBTURHUFVfR0VN
X0RPTUFJTl9HV1MgfCBBTURHUFVfR0VNX0RPTUFJTl9PQSkpIHsNCj4gQEAgLTI1MSw2ICsyNTcs
MTAgQEAgaW50IGFtZGdwdV9nZW1fY3JlYXRlX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
IHZvaWQgKmRhdGEsDQo+ICAgCQlyZXN2ID0gdm0tPnJvb3QuYmFzZS5iby0+dGJvLnJlc3Y7DQo+
ICAgCX0NCj4gICANCj4gKwlpZiAoZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9FTkNSWVBURUQp
IHsNCj4gKwkJLyogWFhYOiBwYWQgb3V0IGFsaWdubWVudCB0byBtZWV0IFRNWiByZXF1aXJlbWVu
dHMgKi8NCj4gKwl9DQo+ICsNCj4gICAJciA9IGFtZGdwdV9nZW1fb2JqZWN0X2NyZWF0ZShhZGV2
LCBzaXplLCBhcmdzLT5pbi5hbGlnbm1lbnQsDQo+ICAgCQkJCSAgICAgKHUzMikoMHhmZmZmZmZm
ZiAmIGFyZ3MtPmluLmRvbWFpbnMpLA0KPiAgIAkJCQkgICAgIGZsYWdzLCB0dG1fYm9fdHlwZV9k
ZXZpY2UsIHJlc3YsICZnb2JqKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9vYmplY3QuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9vYmplY3QuaA0KPiBpbmRleCA1YTNjMTc3Li4yODZlMmUyIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oDQo+IEBAIC0yMjQsNiArMjI0LDE2IEBA
IHN0YXRpYyBpbmxpbmUgYm9vbCBhbWRncHVfYm9fZXhwbGljaXRfc3luYyhzdHJ1Y3QgYW1kZ3B1
X2JvICpibykNCj4gICAJcmV0dXJuIGJvLT5mbGFncyAmIEFNREdQVV9HRU1fQ1JFQVRFX0VYUExJ
Q0lUX1NZTkM7DQo+ICAgfQ0KPiAgIA0KPiArLyoqDQo+ICsgKiBhbWRncHVfYm9fZW5jcnlwdGVk
IC0gcmV0dXJuIHdoZXRoZXIgdGhlIGJvIGlzIGVuY3J5cHRlZA0KPiArICovDQo+ICtzdGF0aWMg
aW5saW5lIGJvb2wgYW1kZ3B1X2JvX2VuY3J5cHRlZChzdHJ1Y3QgYW1kZ3B1X2JvICpibykNCj4g
K3sNCj4gKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGFtZGdwdV90dG1fYWRldihiby0+
dGJvLmJkZXYpOw0KPiArDQo+ICsJcmV0dXJuIGFkZXYtPnRtei5lbmFibGVkICYmIChiby0+Zmxh
Z3MgJiBBTURHUFVfR0VNX0NSRUFURV9FTkNSWVBURUQpOw0KDQpDaGVja2luZyB0aGUgYWRldi0+
dG16LmVuYWJsZWQgZmxhZ3Mgc2hvdWxkIGJlIGRyb3BwZWQgaGVyZS4NCg0KPiArfQ0KPiArDQo+
ICAgYm9vbCBhbWRncHVfYm9faXNfYW1kZ3B1X2JvKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
Ym8pOw0KPiAgIHZvaWQgYW1kZ3B1X2JvX3BsYWNlbWVudF9mcm9tX2RvbWFpbihzdHJ1Y3QgYW1k
Z3B1X2JvICphYm8sIHUzMiBkb21haW4pOw0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jDQo+IGluZGV4IDM2NjM2NTUuLjhmMDBiYjIgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4gQEAgLTE0MzQsNiArMTQzNCw4IEBA
IGJvb2wgYW1kZ3B1X3R0bV90dF9pc19yZWFkb25seShzdHJ1Y3QgdHRtX3R0ICp0dG0pDQo+ICAg
dWludDY0X3QgYW1kZ3B1X3R0bV90dF9wZGVfZmxhZ3Moc3RydWN0IHR0bV90dCAqdHRtLCBzdHJ1
Y3QgdHRtX21lbV9yZWcgKm1lbSkNCj4gICB7DQo+ICAgCXVpbnQ2NF90IGZsYWdzID0gMDsNCj4g
KwlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKnRibyA9IHR0bV9tZW1fcmVnX3RvX2JvKG1lbSk7
DQo+ICsJc3RydWN0IGFtZGdwdV9ibyAqYWJvID0gdHRtX3RvX2FtZGdwdV9ibyh0Ym8pOw0KDQpU
aGF0J3MgYSBjbGVhciBOQUsuIFRoZSBmdW5jdGlvbiBpcyBub3QgbmVjZXNzYXJpbHkgY2FsbGVk
IHdpdGggDQomYm8tPm1lbSwgd2hpY2ggaXMgYWxzbyB0aGUgcmVhc29uIHdoeSB0aGlzIGZ1bmN0
aW9uIGRvZXNuJ3QgZ2V0cyB0aGUgQk8gDQphcyBwYXJhbWV0ZXIuDQoNCkNocmlzdGlhbi4NCg0K
PiAgIA0KPiAgIAlpZiAobWVtICYmIG1lbS0+bWVtX3R5cGUgIT0gVFRNX1BMX1NZU1RFTSkNCj4g
ICAJCWZsYWdzIHw9IEFNREdQVV9QVEVfVkFMSUQ7DQo+IEBAIC0xNDQ0LDYgKzE0NDYsOSBAQCB1
aW50NjRfdCBhbWRncHVfdHRtX3R0X3BkZV9mbGFncyhzdHJ1Y3QgdHRtX3R0ICp0dG0sIHN0cnVj
dCB0dG1fbWVtX3JlZyAqbWVtKQ0KPiAgIAkJaWYgKHR0bS0+Y2FjaGluZ19zdGF0ZSA9PSB0dF9j
YWNoZWQpDQo+ICAgCQkJZmxhZ3MgfD0gQU1ER1BVX1BURV9TTk9PUEVEOw0KPiAgIAl9DQo+ICsJ
aWYgKGFtZGdwdV9ib19lbmNyeXB0ZWQoYWJvKSkgew0KPiArCQlmbGFncyB8PSBBTURHUFVfUFRF
X1RNWjsNCj4gKwl9DQo+ICAgDQo+ICAgCXJldHVybiBmbGFnczsNCj4gICB9DQoNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

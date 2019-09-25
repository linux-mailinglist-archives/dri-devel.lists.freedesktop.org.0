Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF0EBDF8A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F52F6EBB1;
	Wed, 25 Sep 2019 13:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740047.outbound.protection.outlook.com [40.107.74.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF886EBB1;
 Wed, 25 Sep 2019 13:56:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q2SdO+DOZmavQAoT39xB/1ok+Sp29sx/6MNQYgvXPlt/sbE3bTnI0KBYn1MndEtMkxtXSmm4NxKjl9n5/+7u+XBwr7eWLdQPr92q/iLTLPgRioYjaQBkwO448+oZtp+gab+XXTMvqZpK3Szr17fzejx3aBHuVZ/xb/dVelpvNFeT4y9sxvRRHzDxOIF35LEJ+O5nP1l7zmlgUMJ6TxBYETz1UHmgHDlC7j+Jz5PxlFgRaKBTdErMYh7usMghR3LR07b2ta4FdpgBSIUtaUwm62X1fxKjVFxHqucI1b14BBBzqiwZT6h/1sPaTgK/9PIQ/carpAJEytu8K3mfjrZ1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tn3BGya1FtZR9q844eHoMSghkBaC1fkQc7oMaQxx8Ic=;
 b=RVF/emIP8fbQuT/XeTcV1bt54522tgKcVlwFYl8QJjGIHc9FZs8Rc3/1xLPXaiGQB5SkyM/gifHv8dsQdXUSIvoaDy0C+hrou4wWIqIYFpPHYjqSjrTgQRiZ6GbAoCmChZoD9HfQytwv6eWD7zivRm87og/vBRUU6gO2c4ELWziEBFTAhDcEFavNyrYzGCYOZB+yIC2gQd9fxXsZ+/76jP6RzskIZHKuRoxCHNR++dHnvGpwrNX4CyOZynWswuRoFigsOjPpUVrOzKrXcL/HjOuxdg3GA+XDE5rhborg0jL3iY7R9pATjMWArsMS8DYI0DGDn0q6aIZ9nDn03C+fGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1627.namprd12.prod.outlook.com (10.172.40.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Wed, 25 Sep 2019 13:56:34 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 13:56:34 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v2 10/11] drm/amdgpu: job is secure iff CS is secure (v3)
Thread-Topic: [PATCH v2 10/11] drm/amdgpu: job is secure iff CS is secure (v3)
Thread-Index: AQHVc6eGmXNB1iqTbUS2Z4s7jte3FKc8ar4A
Date: Wed, 25 Sep 2019 13:56:34 +0000
Message-ID: <4fe388d8-869e-c741-56b8-f5151cf55d00@amd.com>
References: <1569419090-5304-1-git-send-email-ray.huang@amd.com>
 <1569419090-5304-11-git-send-email-ray.huang@amd.com>
In-Reply-To: <1569419090-5304-11-git-send-email-ray.huang@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100::16)
 To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b894f0a3-ae66-428a-75cc-08d741c02d38
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1627; 
x-ms-traffictypediagnostic: DM5PR12MB1627:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB162729966768F9637CF29BD383870@DM5PR12MB1627.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(189003)(199004)(6116002)(7736002)(2906002)(256004)(186003)(386003)(6506007)(102836004)(5660300002)(476003)(46003)(478600001)(2616005)(446003)(11346002)(486006)(52116002)(99286004)(76176011)(14454004)(36756003)(450100002)(71190400001)(71200400001)(25786009)(4326008)(8936002)(66556008)(64756008)(66446008)(66476007)(66946007)(81166006)(81156014)(6512007)(6636002)(6246003)(2201001)(2501003)(31686004)(65806001)(65956001)(6486002)(6436002)(229853002)(110136005)(54906003)(316002)(31696002)(305945005)(86362001)(8676002)(58126008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1627;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: x3VF9dBp+VcJzkio0orBFSvQhL4faasfXRFspZVfOZt5PIDx9FxEJO67fJ7AxyQpQEQk/bmkSYgcZVj1h6/6YaetRc4Np6LmTHhwogT+ALf5SkD/f5c3PSEAL5m/tjAfOKPDMN2CN5AHUhMkbQGFMPhdKmUr4rAS+qH1gEaC2pVq7URTGLKDOjPQtZBZfiRpBj8n55CVdV1MUAuG7g4bQI27aSTRKXDKFneU3mx189rsmUzUSoaBYW/APSkw8fKy3MkyyukC7hwFqWgP3NhDuZ95kkWPigtbPIPiIXblvxjCAZAmLfypLUF7xpbBhjNOcSZCzfjF2+l5mJRFMfxzOaL70R+YJOHJE2BDKepeqgynPnKcHkYwM8MpKdlb5c2Aidj8cnxsaohvWLPXlRhE0GmgycA2BgiapxC/+GEIUuI=
Content-ID: <856D53E74D45D24BA184A9C52ACC46F2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b894f0a3-ae66-428a-75cc-08d741c02d38
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 13:56:34.7394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k9MuqhpPrnJdMVITqcZ/wBLbBFA/J88QACL8e1EIQoMRCuDXFCRCQtYgQjxo8GcW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1627
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tn3BGya1FtZR9q844eHoMSghkBaC1fkQc7oMaQxx8Ic=;
 b=3FwB8U4/luE87nGwrDflppATcZBTqqTH9UFpLQ7eWuiMAOmTtxS+u09xX2iOkis483ExMl4Cjpkyj4YnAFUca6Jq+fVb9cngrMD+BTR/B9PM0pz5qkiqUHBu8p7oiRzP5zxELHiSBMHjTEwSV5iCleCOrJkdAIv10sNytbH1wKQ=
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

QW0gMjUuMDkuMTkgdW0gMTU6NDUgc2NocmllYiBIdWFuZywgUmF5Og0KPiBNYXJrIGEgam9iIGFz
IHNlY3VyZSwgaWYgYW5kIG9ubHkgaWYgdGhlIGNvbW1hbmQNCj4gc3VibWlzc2lvbiBmbGFnIGhh
cyB0aGUgc2VjdXJlIGZsYWcgc2V0Lg0KPg0KPiB2MjogZml4IHRoZSBudWxsIGpvYiBwb2ludGVy
IHdoaWxlIGluIHZtaWQgMA0KPiBzdWJtaXNzaW9uLg0KPiB2MzogQ29udGV4dCAtLT4gQ29tbWFu
ZCBzdWJtaXNzaW9uLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0Bh
bWQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFt
ZC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEx1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5j
b20+DQo+IFJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jICB8
IDggKysrKysrKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYyAg
fCA0ICsrLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmggfCAy
ICsrDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Nz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYw0KPiBpbmRleCA1MWYz
ZGIwLi4wMDc3YmIzIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfY3MuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3Mu
Yw0KPiBAQCAtMTI1Miw4ICsxMjUyLDE0IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3N1Ym1pdChz
dHJ1Y3QgYW1kZ3B1X2NzX3BhcnNlciAqcCwNCj4gICAJCXAtPmN0eC0+cHJlYW1ibGVfcHJlc2Vu
dGVkID0gdHJ1ZTsNCj4gICAJfQ0KPiAgIA0KPiAtCWNzLT5vdXQuaGFuZGxlID0gc2VxOw0KPiAr
CS8qIFRoZSBjb21tYW5kIHN1Ym1pc3Npb24gKGNzKSBpcyBhIHVuaW9uLCBzbyBhbiBhc3NpZ25t
ZW50IHRvDQo+ICsJICogJ291dCcgaXMgZGVzdHJ1Y3RpdmUgdG8gdGhlIGNzIChhdCBsZWFzdCB0
aGUgZmlyc3QgOA0KPiArCSAqIGJ5dGVzKS4gRm9yIHRoaXMgcmVhc29uLCBpbnF1aXJlIGFib3V0
IHRoZSBmbGFncyBiZWZvcmUgdGhlDQo+ICsJICogYXNzaWdubWVudCB0byAnb3V0Jy4NCj4gKwkg
Ki8NCj4gKwlqb2ItPnNlY3VyZSA9IGNzLT5pbi5mbGFncyAmIEFNREdQVV9DU19GTEFHU19TRUNV
UkU7DQoNCk5BSyBhY2Nlc3NpbmcgY3MtPmluLmZsYWdzIGluIHRoZSBzdWJtaXNzaW9uIGZ1bmN0
aW9uIGlzIGEgbm8tZ28gaGVyZS4NCg0KWW91IG5lZWQgdG8gZmlsbCB0aG9zZSB0aGluZ3MgdXAg
ZHVyaW5nIGpvYiBjcmVhdGlvbiwgc2VlIA0KYW1kZ3B1X2NzX3BhcnNlcl9pbml0KCkuDQoNClJl
Z2FyZHMsDQpDaHJpc3RpYW4uDQoNCj4gICAJam9iLT51Zl9zZXF1ZW5jZSA9IHNlcTsNCj4gKwlj
cy0+b3V0LmhhbmRsZSA9IHNlcTsNCj4gICANCj4gICAJYW1kZ3B1X2pvYl9mcmVlX3Jlc291cmNl
cyhqb2IpOw0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2liLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaWIuYw0KPiBp
bmRleCBlMWRjMjI5Li5jYjliNjUwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfaWIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfaWIuYw0KPiBAQCAtMjEwLDcgKzIxMCw3IEBAIGludCBhbWRncHVfaWJfc2NoZWR1bGUo
c3RydWN0IGFtZGdwdV9yaW5nICpyaW5nLCB1bnNpZ25lZCBudW1faWJzLA0KPiAgIAlpZiAoam9i
ICYmIHJpbmctPmZ1bmNzLT5lbWl0X2NudHhjbnRsKSB7DQo+ICAgCQlzdGF0dXMgfD0gam9iLT5w
cmVhbWJsZV9zdGF0dXM7DQo+ICAgCQlzdGF0dXMgfD0gam9iLT5wcmVlbXB0aW9uX3N0YXR1czsN
Cj4gLQkJYW1kZ3B1X3JpbmdfZW1pdF9jbnR4Y250bChyaW5nLCBzdGF0dXMsIGZhbHNlKTsNCj4g
KwkJYW1kZ3B1X3JpbmdfZW1pdF9jbnR4Y250bChyaW5nLCBzdGF0dXMsIGpvYi0+c2VjdXJlKTsN
Cj4gICAJfQ0KPiAgIA0KPiAgIAlmb3IgKGkgPSAwOyBpIDwgbnVtX2liczsgKytpKSB7DQo+IEBA
IC0yMjksNyArMjI5LDcgQEAgaW50IGFtZGdwdV9pYl9zY2hlZHVsZShzdHJ1Y3QgYW1kZ3B1X3Jp
bmcgKnJpbmcsIHVuc2lnbmVkIG51bV9pYnMsDQo+ICAgCX0NCj4gICANCj4gICAJaWYgKHJpbmct
PmZ1bmNzLT5lbWl0X3RteikNCj4gLQkJYW1kZ3B1X3JpbmdfZW1pdF90bXoocmluZywgZmFsc2Us
IGZhbHNlKTsNCj4gKwkJYW1kZ3B1X3JpbmdfZW1pdF90bXoocmluZywgZmFsc2UsIGpvYiA/IGpv
Yi0+c2VjdXJlIDogZmFsc2UpOw0KPiAgIA0KPiAgICNpZmRlZiBDT05GSUdfWDg2XzY0DQo+ICAg
CWlmICghKGFkZXYtPmZsYWdzICYgQU1EX0lTX0FQVSkpDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfam9iLmgNCj4gaW5kZXggZGM3ZWU5My4uYWEwZTM3NSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5oDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9qb2IuaA0KPiBAQCAtNjMsNiArNjMsOCBAQCBz
dHJ1Y3QgYW1kZ3B1X2pvYiB7DQo+ICAgCXVpbnQ2NF90CQl1Zl9hZGRyOw0KPiAgIAl1aW50NjRf
dAkJdWZfc2VxdWVuY2U7DQo+ICAgDQo+ICsJLyogdGhlIGpvYiBpcyBkdWUgdG8gYSBzZWN1cmUg
Y29tbWFuZCBzdWJtaXNzaW9uICovDQo+ICsJYm9vbAkJCXNlY3VyZTsNCj4gICB9Ow0KPiAgIA0K
PiAgIGludCBhbWRncHVfam9iX2FsbG9jKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1bnNp
Z25lZCBudW1faWJzLA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2B4DAAD0
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 13:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A0C6EA55;
	Thu, 17 Oct 2019 11:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680056.outbound.protection.outlook.com [40.107.68.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B466EA50
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2019 11:06:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACkhIZ57VyOJwzNXOrebIG0HDDJNAcPzNbzLW1bJ2lCAfwCwVhoJTj4NTCsNia3NX3zfQMpACuVfpaIFV5xAN8r2PUD2NcEhnwUY7GAZInpeelVWTs3rQCCr5XZVggqabKTCbH92pLaqV73K0T3+aFywUszon1YRB4r3AIdC/ouJIP7a82cZQRElvqzuMW3MC0rT/t52v2Wf2GnA49yfzhwwS/nrAj1LsP4U2nQXFs/MhekIWlZ6d3+kxWQE/gsR5LVV52eS+bx+wOcqb8PqjoeDqzazZA7ZqhR2F/2Y5vbtebyItWG3yjn3mCIW6WWirTaqEkQRBE6rHaIrGxkkCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFtRLAqTxcDHyccRn7r4owTBh9+BhPH8TSUSJmKRees=;
 b=E6m6ifdkkaCPLSaMgJlPXjJ/f/xp/p4qCqO5RYfCMCgFgPlF5oxV/LhcWlhmWopLvAnetrXWL8WyVNdBYRlg/kUKgEFSZKbayk9SdzWAwrjWGT77yRN6GZx2mc3fmpVP419AHiUuQAFwsyxpuR3zSQNvxbrrPfSCdY2OaUDL9hxqUKKm1Q/HJtsINkjKZGz+n6WzQOCsD0Lf0mR+Yn7sWFJC7Y44gOOhhckxD9W0UFO+5H+Nnx4pEDd00PfiuXjuYcael1fxTsioxPUs3VbT+tRsBg9DkXMNXv5M2ej7j2VgqoVPegTuNpgz1T6rbzUVslmCT/nlAMd0LmM5bEVMOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB2343.namprd12.prod.outlook.com (52.132.140.166) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Thu, 17 Oct 2019 11:06:33 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::7428:f6b3:a0b1:a02e%10]) with mapi id 15.20.2347.023; Thu, 17 Oct
 2019 11:06:33 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Gerd Hoffmann <kraxel@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 06/11] drm/ttm: factor out ttm_bo_mmap_vma_setup
Thread-Topic: [PATCH v4 06/11] drm/ttm: factor out ttm_bo_mmap_vma_setup
Thread-Index: AQHVhBgm8b1N9k1O9kyDrY9pK+JLoqddL1qAgAF+TYA=
Date: Thu, 17 Oct 2019 11:06:33 +0000
Message-ID: <398f5818-296d-67cc-2447-d3075187bf0c@amd.com>
References: <20191016115203.20095-1-kraxel@redhat.com>
 <20191016115203.20095-7-kraxel@redhat.com>
 <c08921f8-8ae9-55aa-c472-6b660b96576b@amd.com>
In-Reply-To: <c08921f8-8ae9-55aa-c472-6b660b96576b@amd.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR07CA0025.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::38) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cf3ac56a-386e-460f-f7a1-08d752f211eb
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM5PR12MB2343:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB234346DF4E7AF2C0D15A70B8836D0@DM5PR12MB2343.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(396003)(136003)(366004)(189003)(199004)(478600001)(14454004)(66446008)(64756008)(66574012)(65806001)(2906002)(66946007)(5660300002)(71190400001)(65956001)(31696002)(71200400001)(66476007)(66556008)(2501003)(6116002)(6512007)(6486002)(6436002)(316002)(229853002)(110136005)(58126008)(46003)(476003)(8936002)(446003)(102836004)(2616005)(11346002)(486006)(386003)(6506007)(54906003)(81156014)(81166006)(7736002)(86362001)(186003)(8676002)(31686004)(25786009)(36756003)(4326008)(256004)(14444005)(305945005)(76176011)(52116002)(99286004)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2343;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: i5Q7ex4F2UezX5Zls+5y6+VKEHJYCwNPrxzWg8CJVixSfNjP3byGtdnbrWJg55LldNahEWaivbgfuKDRNZZpyy2AvDGq2REtJL9LFTYzHxGv2FfztxJqXQdoQaMV7kekrt4Qb/ej2CpoxLwf1Fsw0nVjE6ujBx9vP7ezeEUx+y97QWBXhB5qGF/jMgg1IZFpLZ48lIyosUJzkBMRXjiX2WbuOYLk1AwBl5RJv9L2dDFAREjPmN2QmSWimdhi/RWthHwfBlyY+QOPlhSwysFPYye/Uza03m1Q13nzru5qkU6ucgJm28sM04dQX+Cg/cAfr0IMsQRog4kt08YcKyOCpyOVT/Z2D8zqzOceZHBNXZ2Y4Gl5vWQ68644S7WP8CqQD4l7KYHb5Cc227bqJQ/3tLQEkFDe9DyhyyaCGTpwnJU=
Content-ID: <C1B6EAC41A8CB04AB0B4A140EA169B22@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf3ac56a-386e-460f-f7a1-08d752f211eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 11:06:33.5443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hE8bvg4izSKMa4dAwVMLfqiIfgYoMdG7qz76/4NYLUH8snba2prd22mPNQW1LMYO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2343
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFtRLAqTxcDHyccRn7r4owTBh9+BhPH8TSUSJmKRees=;
 b=vtSfUMKKuPSCgKOxIk8C8pC07fYEi42Il3cRpAarOXPQZgMbJHDiyGRbvTRLGBEiaTbgOQO3h/l4UhSGnIgvjClJoiIdfTsczRyDKJd7AgIPrsZrqDct3BBybBgLuZidTSW7i9M5D4dqoKqanyegy0IXEXYrj/RK0+X0meUHFME=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, "Huang, Ray" <Ray.Huang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMTAuMTkgdW0gMTQ6MTggc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0KPiBBbSAxNi4x
MC4xOSB1bSAxMzo1MSBzY2hyaWViIEdlcmQgSG9mZm1hbm46DQo+PiBGYWN0b3Igb3V0IHR0bSB2
bWEgc2V0dXAgdG8gYSBuZXcgZnVuY3Rpb24uDQo+PiBSZWR1Y2VzIGNvZGUgZHVwbGljYXRpb24g
YSBiaXQuDQo+Pg0KPj4gdjI6IGRvbid0IGNoYW5nZSB2bV9mbGFncyAobW92ZWQgdG8gc2VwYXJh
dGUgcGF0Y2gpLg0KPj4gdjQ6IG1ha2UgdHRtX2JvX21tYXBfdm1hX3NldHVwIHN0YXRpYy4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4NCj4N
Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4gZm9yIHRoaXMgb25lIA0KPiBhbmQgIzcgaW4gdGhlIHNlcmllcy4NCg0KQW55IG9iamVjdGlv
bnMgdGhhdCBJIGFkZCB0aGVzZSB0d28gdG8gbXkgZHJtLXR0bS1uZXh0IHB1bGwgcmVxdWVzdCBv
ciANCmRpZCB5b3Ugd2FudGVkIHRvIG1lcmdlIHRoYXQgdGhyb3VnaCBzb21lIG90aGVyIHRyZWU/
DQoNClRoYW5rcywNCkNocmlzdGlhbi4NCg0KPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9ib192bS5jIHwgNDYgKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
DQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMgDQo+
PiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMNCj4+IGluZGV4IDRhYTAwN2VkZmZi
MC4uNTMzNDVjMDg1NGQ1IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym9fdm0uYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYw0KPj4gQEAg
LTQyNiw2ICs0MjYsMjggQEAgc3RhdGljIHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCANCj4+ICp0
dG1fYm9fdm1fbG9va3VwKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LA0KPj4gwqDCoMKgwqDC
oCByZXR1cm4gYm87DQo+PiDCoCB9DQo+PiDCoCArc3RhdGljIHZvaWQgdHRtX2JvX21tYXBfdm1h
X3NldHVwKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIA0KPj4gc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWEpDQo+PiArew0KPj4gK8KgwqDCoCB2bWEtPnZtX29wcyA9ICZ0dG1fYm9fdm1f
b3BzOw0KPj4gKw0KPj4gK8KgwqDCoCAvKg0KPj4gK8KgwqDCoMKgICogTm90ZTogV2UncmUgdHJh
bnNmZXJyaW5nIHRoZSBibyByZWZlcmVuY2UgdG8NCj4+ICvCoMKgwqDCoCAqIHZtYS0+dm1fcHJp
dmF0ZV9kYXRhIGhlcmUuDQo+PiArwqDCoMKgwqAgKi8NCj4+ICsNCj4+ICvCoMKgwqAgdm1hLT52
bV9wcml2YXRlX2RhdGEgPSBibzsNCj4+ICsNCj4+ICvCoMKgwqAgLyoNCj4+ICvCoMKgwqDCoCAq
IFdlJ2QgbGlrZSB0byB1c2UgVk1fUEZOTUFQIG9uIHNoYXJlZCBtYXBwaW5ncywgd2hlcmUNCj4+
ICvCoMKgwqDCoCAqICh2bWEtPnZtX2ZsYWdzICYgVk1fU0hBUkVEKSAhPSAwLCBmb3IgcGVyZm9y
bWFuY2UgcmVhc29ucywNCj4+ICvCoMKgwqDCoCAqIGJ1dCBmb3Igc29tZSByZWFzb24gVk1fUEZO
TUFQICsgeDg2IFBBVCArIHdyaXRlLWNvbWJpbmUgaXMgdmVyeQ0KPj4gK8KgwqDCoMKgICogYmFk
IGZvciBwZXJmb3JtYW5jZS4gVW50aWwgdGhhdCBoYXMgYmVlbiBzb3J0ZWQgb3V0LCB1c2UNCj4+
ICvCoMKgwqDCoCAqIFZNX01JWEVETUFQIG9uIGFsbCBtYXBwaW5ncy4gU2VlIGZyZWVkZXNrdG9w
Lm9yZyBidWcgIzc1NzE5DQo+PiArwqDCoMKgwqAgKi8NCj4+ICvCoMKgwqAgdm1hLT52bV9mbGFn
cyB8PSBWTV9NSVhFRE1BUDsNCj4+ICvCoMKgwqAgdm1hLT52bV9mbGFncyB8PSBWTV9JTyB8IFZN
X0RPTlRFWFBBTkQgfCBWTV9ET05URFVNUDsNCj4+ICt9DQo+PiArDQo+PiDCoCBpbnQgdHRtX2Jv
X21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2KQ0KPj4gwqAgew0K
Pj4gQEAgLTQ0OSwyNCArNDcxLDcgQEAgaW50IHR0bV9ib19tbWFwKHN0cnVjdCBmaWxlICpmaWxw
LCBzdHJ1Y3QgDQo+PiB2bV9hcmVhX3N0cnVjdCAqdm1hLA0KPj4gwqDCoMKgwqDCoCBpZiAodW5s
aWtlbHkocmV0ICE9IDApKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X3VucmVmOw0K
Pj4gwqAgLcKgwqDCoCB2bWEtPnZtX29wcyA9ICZ0dG1fYm9fdm1fb3BzOw0KPj4gLQ0KPj4gLcKg
wqDCoCAvKg0KPj4gLcKgwqDCoMKgICogTm90ZTogV2UncmUgdHJhbnNmZXJyaW5nIHRoZSBibyBy
ZWZlcmVuY2UgdG8NCj4+IC3CoMKgwqDCoCAqIHZtYS0+dm1fcHJpdmF0ZV9kYXRhIGhlcmUuDQo+
PiAtwqDCoMKgwqAgKi8NCj4+IC0NCj4+IC3CoMKgwqAgdm1hLT52bV9wcml2YXRlX2RhdGEgPSBi
bzsNCj4+IC0NCj4+IC3CoMKgwqAgLyoNCj4+IC3CoMKgwqDCoCAqIFdlJ2QgbGlrZSB0byB1c2Ug
Vk1fUEZOTUFQIG9uIHNoYXJlZCBtYXBwaW5ncywgd2hlcmUNCj4+IC3CoMKgwqDCoCAqICh2bWEt
PnZtX2ZsYWdzICYgVk1fU0hBUkVEKSAhPSAwLCBmb3IgcGVyZm9ybWFuY2UgcmVhc29ucywNCj4+
IC3CoMKgwqDCoCAqIGJ1dCBmb3Igc29tZSByZWFzb24gVk1fUEZOTUFQICsgeDg2IFBBVCArIHdy
aXRlLWNvbWJpbmUgaXMgdmVyeQ0KPj4gLcKgwqDCoMKgICogYmFkIGZvciBwZXJmb3JtYW5jZS4g
VW50aWwgdGhhdCBoYXMgYmVlbiBzb3J0ZWQgb3V0LCB1c2UNCj4+IC3CoMKgwqDCoCAqIFZNX01J
WEVETUFQIG9uIGFsbCBtYXBwaW5ncy4gU2VlIGZyZWVkZXNrdG9wLm9yZyBidWcgIzc1NzE5DQo+
PiAtwqDCoMKgwqAgKi8NCj4+IC3CoMKgwqAgdm1hLT52bV9mbGFncyB8PSBWTV9NSVhFRE1BUDsN
Cj4+IC3CoMKgwqAgdm1hLT52bV9mbGFncyB8PSBWTV9JTyB8IFZNX0RPTlRFWFBBTkQgfCBWTV9E
T05URFVNUDsNCj4+ICvCoMKgwqAgdHRtX2JvX21tYXBfdm1hX3NldHVwKGJvLCB2bWEpOw0KPj4g
wqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+IMKgIG91dF91bnJlZjoNCj4+IMKgwqDCoMKgwqAgdHRt
X2JvX3B1dChibyk7DQo+PiBAQCAtNDgxLDEwICs0ODYsNyBAQCBpbnQgdHRtX2ZiZGV2X21tYXAo
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIA0KPj4gc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0
ICpibykNCj4+IMKgIMKgwqDCoMKgwqAgdHRtX2JvX2dldChibyk7DQo+PiDCoCAtwqDCoMKgIHZt
YS0+dm1fb3BzID0gJnR0bV9ib192bV9vcHM7DQo+PiAtwqDCoMKgIHZtYS0+dm1fcHJpdmF0ZV9k
YXRhID0gYm87DQo+PiAtwqDCoMKgIHZtYS0+dm1fZmxhZ3MgfD0gVk1fTUlYRURNQVA7DQo+PiAt
wqDCoMKgIHZtYS0+dm1fZmxhZ3MgfD0gVk1fSU8gfCBWTV9ET05URVhQQU5EOw0KPj4gK8KgwqDC
oCB0dG1fYm9fbW1hcF92bWFfc2V0dXAoYm8sIHZtYSk7DQo+PiDCoMKgwqDCoMKgIHJldHVybiAw
Ow0KPj4gwqAgfQ0KPj4gwqAgRVhQT1JUX1NZTUJPTCh0dG1fZmJkZXZfbW1hcCk7DQo+DQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

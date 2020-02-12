Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CEC15A13D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 07:23:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214706E885;
	Wed, 12 Feb 2020 06:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76526E885;
 Wed, 12 Feb 2020 06:23:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JB2UUFQCCdDpV0WJOeXsU0yNOMPZF6Ff19/NO46Y+VU7PkiTyc7Hr4Vn4gzQrAX9w9/k9Pc8aq8CYiYseGSeO7NySy3dllv4/8zmdx/wW5xx9nB+HLaGhsWq0D9YfTFMUHHYL2W7qlTOcZpvSfp9gfhE6T16k3BwDsbD9ogv4viJRfcFlPUTCAyKryD5LNyq3eawhQwi6Ku72icw2UWt4U2uczEqhcRfzrAV5kNISh/0Qu6yyqEFsqqeL5a3IackqWpvUZh8SE9qn021POEo3EuX8qLmGIdNl5UTXxoRICCpy5jmO7L1pT+4JbraQtDdvRE2LXuvlj/Fvl0UsByQCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+sZwgkGTExMU8YYhQwRhIbJUSowd3lSE1GI+P0WeF8=;
 b=MaMS941/YH1opa4HBPh3H11JQHS2nX0dlSnJfWGc5CFXwzGcHVGEHz6s8cTa55jTrE8jZF2GMBP1ADH3OYiUZ541hgj5WRnwTwhNHSOdVnxPD+oNyP8qfJQgYpD669psCamnheCtLSSCzdultXNVpNzyPCT7DuocTH734/fCyGUO/EIsG8lhQHBx7HH4QiE0/2mXeWvsm4bSNRh+NYaWUQzoy94sA6yftpxOzpjoDAUk9YhrsW0R3PC8SieDPOxRuv8LFGj7JIKpwDQTnXlrE5WXTPmMuscQGohR+WjN3El7gJwuaw6fYBBmSlin2ltPkEWLMguNSlpiAx0vyx/5mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+sZwgkGTExMU8YYhQwRhIbJUSowd3lSE1GI+P0WeF8=;
 b=fWJR7iZTUoPPmEr9ycYq/hYnLUvYeTW1pSEyEPfcP6Tu/nDVvIC80Hd66x/DDzXwohn+jUVh6zbuZgsiyJN1sctqZFL5F6DBI/PK45IVVm2tJ1xpLjX4BY9FCymOfMDvhTzr5tDk+1bWI27yDbEc58eyBKSKDxBWpjLQIHlME+o=
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (52.135.101.138) by
 SN6PR12MB2623.namprd12.prod.outlook.com (52.135.103.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.28; Wed, 12 Feb 2020 06:23:33 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::b99c:18c0:8685:1c10]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::b99c:18c0:8685:1c10%5]) with mapi id 15.20.2729.021; Wed, 12 Feb 2020
 06:23:33 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: replace dma_resv object on deleted BOs v3
Thread-Topic: [PATCH] drm/ttm: replace dma_resv object on deleted BOs v3
Thread-Index: AQHV4PII7pnHj7xVP0SEefuQGARHq6gXGAEA
Date: Wed, 12 Feb 2020 06:23:33 +0000
Message-ID: <4DECE5E0-0C4A-4F13-89FC-8AC9A5873D04@amd.com>
References: <20200211154326.83858-1-christian.koenig@amd.com>
In-Reply-To: <20200211154326.83858-1-christian.koenig@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: af8e348a-ff62-4acd-2e1e-08d7af8415e8
x-ms-traffictypediagnostic: SN6PR12MB2623:|SN6PR12MB2623:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB2623FCD115D34F3170335FE2871B0@SN6PR12MB2623.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0311124FA9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(199004)(189003)(8676002)(6486002)(2906002)(66556008)(66446008)(64756008)(66946007)(66476007)(71200400001)(81156014)(81166006)(33656002)(6512007)(8936002)(2616005)(76116006)(91956017)(66574012)(86362001)(6916009)(45080400002)(36756003)(54906003)(478600001)(316002)(186003)(6506007)(4326008)(966005)(26005)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2623;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TgPd+1CUWfcJ6/ToG7wJbs/q+ORvmrYxB2aKvP7fSFhMsNg6VKmNmx1IjALhKyansbjC351mJN2dNw7EO7rvpfgnQwFFCeXeDtVVMJuVAv0FIG90NcdbhWXiFHL5kPnoUawxoLg4RKbAp37nzeigcCimfYE/XFxsqeSDFmlD+VnjzVQ9p5TzYO6o0Kzc1zHBdi0nGUrQqi66h3GMKNsn6jbfYNfa9LybolozVaR8Fk17zixy94DtJfkbvaaMxn8idhpnq36PQRVMsG5R+wqfsrBAV2w4LW+9gDksXLbQsOHcYcVuAsJlc7zpnEsIPFX3aguy/lEt8cUiYqQn1aABLW15uwD9bGisXkZA4VP+SxBDg6beK+lBtPJM+dhul79MePV9zcMIxLEk/SJ0KNiN7xbjV82CWHoQ/qtzZEvnvvhQFY7xxbVfokq7Rb4QNAii5SrWKUN9qEbXAq4ZCzyDmrXXVJk29mjYPBcy96bu3/A7CGYjqQaWhxEoc6tD/Gi96054FJ2RLqyvnF8sr+swFw==
x-ms-exchange-antispam-messagedata: 2yKQUlB1O4fG182b9rJPKItYu/W85A5yProM1F9LIPseYpir1PoVyN7iRRiNtavZXTLOzwJphxKPXrHeg31XUKPIEuEX15ZX2ziBzhsoMaZZoJ+EbUM3K7wp/wTcqVeGAg4GzAxF/SQ/Ei0KYLTvaw==
Content-ID: <06A6D998AA83964EB5234FF075BEDCBB@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af8e348a-ff62-4acd-2e1e-08d7af8415e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2020 06:23:33.3196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JFOmcdj03NDHXP843Ne1LvEneeNY9R64OZf03nfCDGRzd5rBdn9LxrTJhg4bd/8M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2623
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gMjAyMOW5tDLmnIgxMeaXpSAyMzo0M++8jENocmlzdGlhbiBLw7ZuaWcgPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiDlhpnpgZPvvJoNCj4gDQo+IFdoZW4gbm9uLWltcG9y
dGVkIEJPcyBhcmUgcmVzdXJyZWN0ZWQgZm9yIGRlbGF5ZWQgZGVsZXRlIHdlIHJlcGxhY2UNCj4g
dGhlIGRtYV9yZXN2IG9iamVjdCB0byBhbGxvdyBmb3IgZWFzeSByZWNsYWltaW5nIG9mIHRoZSBy
ZXNvdXJjZXMuDQo+IA0KPiB2MjogbW92ZSB0aGF0IHRvIHR0bV9ib19pbmRpdmlkdWFsaXplX3Jl
c3YNCj4gdjM6IGFkZCBhIGNvbW1lbnQgdG8gZXhwbGFpbiB3aGF0J3MgZ29pbmcgb24NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4NCj4gUmV2aWV3ZWQtYnk6IHhpbmh1aSBwYW4gPHhpbmh1aS5wYW5AYW1kLmNvbT4NCj4gLS0t
DQo+IGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCAxNCArKysrKysrKysrKysrLQ0KPiAx
IGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jDQo+IGluZGV4IGJmYzQyYTllNGZiNC4uODE3NDYwM2QzOTBmIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMNCj4gQEAgLTM5Myw2ICszOTMsMTggQEAgc3RhdGljIGludCB0dG1f
Ym9faW5kaXZpZHVhbGl6ZV9yZXN2KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pDQo+IA0K
PiAJciA9IGRtYV9yZXN2X2NvcHlfZmVuY2VzKCZiby0+YmFzZS5fcmVzdiwgYm8tPmJhc2UucmVz
dik7DQo+IAlkbWFfcmVzdl91bmxvY2soJmJvLT5iYXNlLl9yZXN2KTsNCj4gKwlpZiAocikNCj4g
KwkJcmV0dXJuIHI7DQo+ICsNCj4gKwlpZiAoYm8tPnR5cGUgIT0gdHRtX2JvX3R5cGVfc2cpIHsN
Cj4gKwkJLyogVGhpcyB3b3JrcyBiZWNhdXNlIHRoZSBCTyBpcyBhYm91dCB0byBiZSBkZXN0cm95
ZWQgYW5kIG5vYm9keQ0KPiArCQkgKiByZWZlcmVuY2UgaXQgYW55IG1vcmUuIFRoZSBvbmx5IHRy
aWNreSBjYXNlIGlzIHRoZSB0cnlsb2NrIG9uDQo+ICsJCSAqIHRoZSByZXN2IG9iamVjdCB3aGls
ZSBob2xkaW5nIHRoZSBscnVfbG9jay4NCj4gKwkJICovDQo+ICsJCXNwaW5fbG9jaygmdHRtX2Jv
X2dsb2IubHJ1X2xvY2spOw0KPiArCQliby0+YmFzZS5yZXN2ID0gJmJvLT5iYXNlLl9yZXN2Ow0K
PiArCQlzcGluX3VubG9jaygmdHRtX2JvX2dsb2IubHJ1X2xvY2spOw0KPiArCX0NCj4gDQoNCmhv
dyBhYm91dCBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KdGhlIGJhc2ljIGlkZWEgaXMgdG8gZG8gdGhl
IGJvIGNsZWFudXAgd29yayBpbiBibyByZWxlYXNlIGZpcnN0IGFuZCBhdm9pZCBhbnkgcmFjZSB3
aXRoIGV2aWN0Lg0KQXMgaW4gYm8gZGllaW5nIHByb2dyZXNzLCBldmljdCBhbHNvIGp1c3QgZG8g
Ym8gY2xlYW51cCB3b3JrLg0KDQpJZiBibyBpcyBidXN5LCBuZWl0aGVyIGJvX3JlbGVhc2Ugbm9y
IGV2aWN0ICBjYW4gZG8gY2xlYW51cHdvcmsgIG9uIGl0LiBGb3IgdGhlIGJvIHJlbGVhc2UgY2Fz
ZSwgd2UganVzdCBhZGQgYm8gYmFjayB0byBscnUgbGlzdC4NClNvIHdlIGNhbiBjbGVhbiBpdCB1
cCAgYm90aCBpbiB3b3JrcXVldWUgYW5kIHNocmlua2VyIGFzIHRoZSBwYXN0IHdheSAgZGlkLg0K
DQpAQCAtNDA1LDggKzQwNSw5IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2luZGl2aWR1YWxpemVfcmVz
dihzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQ0KIA0KICAgIGlmIChiby0+dHlwZSAhPSB0
dG1fYm9fdHlwZV9zZykgew0KICAgICAgICBzcGluX2xvY2soJnR0bV9ib19nbG9iLmxydV9sb2Nr
KTsNCi0gICAgICAgYm8tPmJhc2UucmVzdiA9ICZiby0+YmFzZS5fcmVzdjsNCisgICAgICAgdHRt
X2JvX2RlbF9mcm9tX2xydShibyk7DQogICAgICAgIHNwaW5fdW5sb2NrKCZ0dG1fYm9fZ2xvYi5s
cnVfbG9jayk7DQorICAgICAgIGJvLT5iYXNlLnJlc3YgPSAmYm8tPmJhc2UuX3Jlc3Y7DQogICAg
fSAgIA0KIA0KICAgIHJldHVybiByOw0KQEAgLTYwNiwxMCArNjA3LDkgQEAgc3RhdGljIHZvaWQg
dHRtX2JvX3JlbGVhc2Uoc3RydWN0IGtyZWYgKmtyZWYpDQogICAgICAgICAqIHNocmlua2Vycywg
bm93IHRoYXQgdGhleSBhcmUgcXVldWVkIGZvciANCiAgICAgICAgICogZGVzdHJ1Y3Rpb24uDQog
ICAgICAgICAqLyAgDQotICAgICAgIGlmIChiby0+bWVtLnBsYWNlbWVudCAmIFRUTV9QTF9GTEFH
X05PX0VWSUNUKSB7DQorICAgICAgIGlmIChiby0+bWVtLnBsYWNlbWVudCAmIFRUTV9QTF9GTEFH
X05PX0VWSUNUKQ0KICAgICAgICAgICAgYm8tPm1lbS5wbGFjZW1lbnQgJj0gflRUTV9QTF9GTEFH
X05PX0VWSUNUOw0KLSAgICAgICAgICAgdHRtX2JvX21vdmVfdG9fbHJ1X3RhaWwoYm8sIE5VTEwp
Ow0KLSAgICAgICB9DQorICAgICAgIHR0bV9ib19hZGRfbWVtX3RvX2xydShibywgJmJvLT5tZW0p
Ow0KIA0KICAgICAgICBrcmVmX2luaXQoJmJvLT5rcmVmKTsNCiAgICAgICAgbGlzdF9hZGRfdGFp
bCgmYm8tPmRkZXN0cm95LCAmYmRldi0+ZGRlc3Ryb3kpOw0KDQp0aGFua3MNCnhpbmh1aQ0KDQoN
Cj4gCXJldHVybiByOw0KPiB9DQo+IEBAIC03MjQsNyArNzM2LDcgQEAgc3RhdGljIGJvb2wgdHRt
X2JvX2V2aWN0X3N3YXBvdXRfYWxsb3dhYmxlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8s
DQo+IA0KPiAJaWYgKGJvLT5iYXNlLnJlc3YgPT0gY3R4LT5yZXN2KSB7DQo+IAkJZG1hX3Jlc3Zf
YXNzZXJ0X2hlbGQoYm8tPmJhc2UucmVzdik7DQo+IC0JCWlmIChjdHgtPmZsYWdzICYgVFRNX09Q
VF9GTEFHX0FMTE9XX1JFU19FVklDVCB8fCBiby0+ZGVsZXRlZCkNCj4gKwkJaWYgKGN0eC0+Zmxh
Z3MgJiBUVE1fT1BUX0ZMQUdfQUxMT1dfUkVTX0VWSUNUKQ0KPiAJCQlyZXQgPSB0cnVlOw0KPiAJ
CSpsb2NrZWQgPSBmYWxzZTsNCj4gCQlpZiAoYnVzeSkNCj4gLS0gDQo+IDIuMTcuMQ0KPiANCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gYW1kLWdm
eCBtYWlsaW5nIGxpc3QNCj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6
Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJG
JTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1kLWdmeCZh
bXA7ZGF0YT0wMiU3QzAxJTdDeGluaHVpLnBhbiU0MGFtZC5jb20lN0NiMTg0ZGZmNWFhZjM0OWUy
MjEwMDA4ZDdhZjA5MjYzNyU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3
QzAlN0M2MzcxNzAzMjYyMDQ5NjYzNzUmYW1wO3NkYXRhPUtkWk4xbCUyRmtEWW9kWHhQUWdhWGFT
WFV2TXoyUkh4eXNTU0Y5a3JRUmdwSSUzRCZhbXA7cmVzZXJ2ZWQ9MA0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

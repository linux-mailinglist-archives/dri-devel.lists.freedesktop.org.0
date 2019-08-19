Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB30394DCC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 21:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47A6E6E272;
	Mon, 19 Aug 2019 19:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790078.outbound.protection.outlook.com [40.107.79.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD0E6E272;
 Mon, 19 Aug 2019 19:21:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0o6atN0nP1L3OII8pu4SSRW6noudQLZKzxW+q2jy1NGVfCV7KFG/n82j35wkGH1K3aaKzxhW4d8v6vMICD4niBK5B2OpWe24dMXiTkc6G3h2brYBFrM8sEQNdVI4skkT56ZdPcpwg98kFAXIGfVlfygE0RXvFyMmz3+S5wnFBwveqjlf5w1OHjB92eGern7Rc36FfzHG2ek9Pcq9EJDU2hmIudWkCpt7Hf0oBzYHaxgLjY3ZPXjsnPie5Bs+H72GmkNRrGKVdEakh/b/Zsc5vQ551Z4wxvZqaL919Gn3YRJWr0Fz63mtOdZmf/U+63fBmjKdlx8z6T/MocZq0OkcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7/zFrMnSkVknZ4Ucb9Ed22wbS/h70XpCk4J5cI7riQ=;
 b=d4o/pWIGYiVIEBUyUnQCpXY/UETQOsdR47ZrB61L9DMl1b62eZiWjPEpjM/POsJxeoeR6mn6Lqpq+OVK8dAZAimYXp+Fg59rIJWavo608W3fXbnjdAtqL61xN5UhBmY7jsvvgoq9K81/ptiWJ95FwytUcZ9Cy/TMWGEb8yJTxpFHRH4/OpPnAvDgG0l6NGUxqzmuf1hyUeI/bIZ8z9BOzh3TyuU9aGhiTGvK6KqrJ0WZibfX+T5AJPNtlybqFrvVIFNhPe4VnZCYhL60N5o3zzRMOBNIpqEYXjL9PJHhAxofjE+chku4gyAz3SIYjJ95e4luZXnLopUM5hFlRgLR/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3174.namprd12.prod.outlook.com (20.179.92.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 19:21:22 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82%5]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 19:21:22 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Francis, David" <David.Francis@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 06/14] drm/amd/display: Use dc helpers to compute timeslot
 distribution
Thread-Topic: [PATCH 06/14] drm/amd/display: Use dc helpers to compute
 timeslot distribution
Thread-Index: AQHVVqXorL7YQNP8GEevFPbLB6vAHacC2UKA
Date: Mon, 19 Aug 2019 19:21:22 +0000
Message-ID: <0e577846-dd67-5d77-e579-0f69700c86ad@amd.com>
References: <20190819155038.1771-1-David.Francis@amd.com>
 <20190819155038.1771-7-David.Francis@amd.com>
In-Reply-To: <20190819155038.1771-7-David.Francis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::24) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1314d4d-a89a-4c74-1391-08d724da6b53
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3174; 
x-ms-traffictypediagnostic: BYAPR12MB3174:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3174A7B96F4C79A82E8E4853ECA80@BYAPR12MB3174.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(189003)(199004)(6436002)(2501003)(86362001)(6246003)(31696002)(476003)(66556008)(66946007)(6116002)(11346002)(6512007)(2616005)(53936002)(446003)(26005)(229853002)(71200400001)(7736002)(3846002)(66476007)(25786009)(305945005)(8936002)(8676002)(31686004)(66446008)(81166006)(4326008)(2201001)(5660300002)(2906002)(64756008)(450100002)(52116002)(76176011)(386003)(6506007)(478600001)(66066001)(81156014)(102836004)(53546011)(316002)(14444005)(256004)(99286004)(71190400001)(186003)(14454004)(110136005)(6486002)(486006)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3174;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n0+ca4r1elOP/wvULmbIgnmOMU1nj/lHdFyVRthx2aBOAhDTwE3qqUIKEBOLTk0l5MvVP+f3ZxrBvT6nUN6bRzVtV455WX6wlxnjg607e+xrPTKYNVvmDmJHIPfGW42xL2Do+3GkaVFxZvmM3xoPAznpFtQEFjvOu6tRoKae5D/wGVSMzTmgUh5iocai8bX3lt1ncZiGoLMdzvC8h/7PjQbyyNSYeWrRWlmLodiF4vur4fyjUjZXlGIwdbS9f7IC3rZDG22YnJhsdinDqHKwqid7SF4RBAJ8Z49RQTIS+qk0pW2XzYG1yT/rq9s/NLdl1FggaYS4y4q4WjwAPcKUlEasjwVFJVDquVflI6eyOy1I811k20bTr8vYTto9/I4buZQeo7/C/tcd1hw+BTzwag36aPyx0wHvxED3zhjD/+E=
Content-ID: <03A3323E6C89C241BE819838B58E49FF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1314d4d-a89a-4c74-1391-08d724da6b53
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 19:21:22.1349 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1NRPjOhKYXDGWjpLifwevdnqmWHJubGeLRZf6yRciPdUaVYPLu15qQ2WjRXatMaAHlauq9UNIWB7q+M2aa1AcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3174
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7/zFrMnSkVknZ4Ucb9Ed22wbS/h70XpCk4J5cI7riQ=;
 b=ulXEnwPjJsfP1TctMHEY/cmzf43HBa9k6nqCdkdtlLOJrl9XXfzH+XowcBbdrLY+aN6PeeCGLfF5NGR8UNyObEpm6ZyttPTWmamEZ3hZSanYF9OISNqmpCXyMW16d2rwq3OvpYxNWDO8bYJnMMwE/FEobxHFXykuOOU1PFqi3XE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Cc: "Zuo, Jerry" <Jerry.Zuo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xOS8xOSAxMTo1MCBBTSwgRGF2aWQgRnJhbmNpcyB3cm90ZToNCj4gV2Ugd2VyZSB1c2lu
ZyBkcm0gaGVscGVycyB0byBjb252ZXJ0IGEgdGltaW5nIGludG8gaXRzDQo+IGJhbmR3aWR0aCwg
aXRzIGJhbmR3aWR0aCBpbnRvIHBibiwgYW5kIGl0cyBwYm4gaW50byB0aW1lc2xvdHMNCj4gDQo+
IFRoZXNlIGhlbHBlcnMNCj4gLURpZCBub3QgdGFrZSBEU0MgdGltaW5ncyBpbnRvIGFjY291bnQN
Cj4gLVVzZWQgdGhlIGxpbmsgcmF0ZSBhbmQgbGFuZSBjb3VudCBvZiB0aGUgbGluaydzIGF1eCBk
ZXZpY2UsDQo+ICAgd2hpY2ggYXJlIG5vdCB0aGUgc2FtZSBhcyB0aGUgbGluaydzIGN1cnJlbnQg
Y2FwDQo+IC1EaWQgbm90IHRha2UgRkVDIGludG8gYWNjb3VudCAoRkVDIHJlZHVjZXMgdGhlIFBC
TiBwZXIgdGltZXNsb3QpDQo+IA0KPiBVc2UgdGhlIERDIGhlbHBlcnMgKGRjX2JhbmR3aWR0aF9p
bl9rYnBzX2Zyb21fdGltaW5nLA0KPiBkY19saW5rX2JhbmR3aWR0aF9rYnBzKSBpbnN0ZWFkDQo+
IA0KPiBDYzogSmVycnkgWnVvIDxKZXJyeS5adW9AYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
RGF2aWQgRnJhbmNpcyA8RGF2aWQuRnJhbmNpc0BhbWQuY29tPg0KDQpXb3VsZG4ndCB0aGlzIGJl
IGEgZ29vZCBjYW5kaWRhdGUgZm9yIHNoYXJlZCBEUk0gaGVscGVycyBvciB0byBtb2RpZnkgDQp0
aGUgZXhpc3Rpbmcgb25lcyB0byBzdXBwb3J0IHRoaXMgdXNlY2FzZT8NCg0KU2VlbXMgbGlrZSB0
aGlzIHdvdWxkIGJlIHNoYXJlZCBhY3Jvc3MgZHJpdmVycy4NCg0KTmljaG9sYXMgS2F6bGF1c2th
cw0KDQo+IC0tLQ0KPiAgIC4uLi9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBl
cnMuYyB8IDQxICsrKystLS0tLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNl
cnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMNCj4gaW5k
ZXggNWYyYzMxNWIxOGJhLi5iMzJjMDc5MDM5OWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYw0KPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9oZWxwZXJzLmMN
Cj4gQEAgLTE4OSw4ICsxODksOCBAQCBib29sIGRtX2hlbHBlcnNfZHBfbXN0X3dyaXRlX3BheWxv
YWRfYWxsb2NhdGlvbl90YWJsZSgNCj4gICAJaW50IHNsb3RzID0gMDsNCj4gICAJYm9vbCByZXQ7
DQo+ICAgCWludCBjbG9jazsNCj4gLQlpbnQgYnBwID0gMDsNCj4gICAJaW50IHBibiA9IDA7DQo+
ICsJaW50IHBibl9wZXJfdGltZXNsb3Q7DQo+ICAgDQo+ICAgCWFjb25uZWN0b3IgPSAoc3RydWN0
IGFtZGdwdV9kbV9jb25uZWN0b3IgKilzdHJlYW0tPmRtX3N0cmVhbV9jb250ZXh0Ow0KPiAgIA0K
PiBAQCAtMjA1LDQwICsyMDUsMTUgQEAgYm9vbCBkbV9oZWxwZXJzX2RwX21zdF93cml0ZV9wYXls
b2FkX2FsbG9jYXRpb25fdGFibGUoDQo+ICAgCW1zdF9wb3J0ID0gYWNvbm5lY3Rvci0+cG9ydDsN
Cj4gICANCj4gICAJaWYgKGVuYWJsZSkgew0KPiAtCQljbG9jayA9IHN0cmVhbS0+dGltaW5nLnBp
eF9jbGtfMTAwaHogLyAxMDsNCj4gLQ0KPiAtCQlzd2l0Y2ggKHN0cmVhbS0+dGltaW5nLmRpc3Bs
YXlfY29sb3JfZGVwdGgpIHsNCj4gLQ0KPiAtCQljYXNlIENPTE9SX0RFUFRIXzY2NjoNCj4gLQkJ
CWJwcCA9IDY7DQo+IC0JCQlicmVhazsNCj4gLQkJY2FzZSBDT0xPUl9ERVBUSF84ODg6DQo+IC0J
CQlicHAgPSA4Ow0KPiAtCQkJYnJlYWs7DQo+IC0JCWNhc2UgQ09MT1JfREVQVEhfMTAxMDEwOg0K
PiAtCQkJYnBwID0gMTA7DQo+IC0JCQlicmVhazsNCj4gLQkJY2FzZSBDT0xPUl9ERVBUSF8xMjEy
MTI6DQo+IC0JCQlicHAgPSAxMjsNCj4gLQkJCWJyZWFrOw0KPiAtCQljYXNlIENPTE9SX0RFUFRI
XzE0MTQxNDoNCj4gLQkJCWJwcCA9IDE0Ow0KPiAtCQkJYnJlYWs7DQo+IC0JCWNhc2UgQ09MT1Jf
REVQVEhfMTYxNjE2Og0KPiAtCQkJYnBwID0gMTY7DQo+IC0JCQlicmVhazsNCj4gLQkJZGVmYXVs
dDoNCj4gLQkJCUFTU0VSVChicHAgIT0gMCk7DQo+IC0JCQlicmVhazsNCj4gLQkJfQ0KPiAtDQo+
IC0JCWJwcCA9IGJwcCAqIDM7DQo+IC0NCj4gLQkJLyogVE9ETyBuZWVkIHRvIGtub3cgbGluayBy
YXRlICovDQo+ICsJCWNsb2NrID0gZGNfYmFuZHdpZHRoX2luX2ticHNfZnJvbV90aW1pbmcoJnN0
cmVhbS0+dGltaW5nKTsNCj4gICANCj4gLQkJcGJuID0gZHJtX2RwX2NhbGNfcGJuX21vZGUoY2xv
Y2ssIGJwcCk7DQo+ICsJCS8qIGRjX2JhbmR3aWR0aF9pbl9rYnBzX2Zyb21fdGltaW5nIGFscmVh
ZHkgdGFrZXMgYnBwIGludG8gYWNjb3VudCAqLw0KPiArCQlwYm4gPSBkcm1fZHBfY2FsY19wYm5f
bW9kZShjbG9jaywgMSk7DQo+ICAgDQo+IC0JCXNsb3RzID0gZHJtX2RwX2ZpbmRfdmNwaV9zbG90
cyhtc3RfbWdyLCBwYm4pOw0KPiArCQkvKiBDb252ZXJ0IGtpbG9iaXRzIHBlciBzZWNvbmQgLyA2
NCAoZm9yIDY0IHRpbWVzbG90cykgdG8gcGJuICg1NC82NCBtZWdhYnl0ZXMgcGVyIHNlY29uZCkg
Ki8NCj4gKwkJcGJuX3Blcl90aW1lc2xvdCA9IGRjX2xpbmtfYmFuZHdpZHRoX2ticHMoDQo+ICsJ
CQkJc3RyZWFtLT5saW5rLCBkY19saW5rX2dldF9saW5rX2NhcChzdHJlYW0tPmxpbmspKSAvICg4
ICogMTAwMCAqIDU0KTsNCj4gKwkJc2xvdHMgPSBESVZfUk9VTkRfVVAocGJuLCBwYm5fcGVyX3Rp
bWVzbG90KTsNCj4gICAJCXJldCA9IGRybV9kcF9tc3RfYWxsb2NhdGVfdmNwaShtc3RfbWdyLCBt
c3RfcG9ydCwgcGJuLCBzbG90cyk7DQo+ICAgDQo+ICAgCQlpZiAoIXJldCkNCj4gDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

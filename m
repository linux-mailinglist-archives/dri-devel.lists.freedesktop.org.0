Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB00089277
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 18:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8803C6E362;
	Sun, 11 Aug 2019 16:08:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700043.outbound.protection.outlook.com [40.107.70.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468386E35B;
 Sun, 11 Aug 2019 16:08:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3GessAQVmQM0TAuQsYsZx5ORUThWurfhMDymhHn/RCM/LML4X3KS6uXLHJrwsx6M45roGEUuk2aAAdxB3+hwiz/ctzNX4bqKgav9njl8GFn9F5V3tsd8BwP5TJ6aOVzMvISdYOVe8Amm/tHPWv4LsQqbZYjXfGvMbbOrx3MKQzZQUovsK4coW69RPkvrFfXQ3EPvh0EipROH1tW3elssMVDl8NsNIm6ktNjSCIq+3Bz6aKdAaFeQXTnVmudb2lJKH2UhScxXtr9VzrM2vHcqCU1wz8c2FkvoXHuUXyS1P/ScsdQiZlEWTy5s5Ai4Mw3Pbg4D3P2CxOfX+CerPnZ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjyOYbGRu2oGAmk6tO2TWWAMJpXt6Ag4nIVFbLGysis=;
 b=bgcfcDWn99TsxCnmR2le1K0oVuNYru3Jhr4UhZaMuwk7oxUqAmGBN6/X8+x8DEYYFbuoerQNsVj+/sBP+0GfDT/zgZ/mqzH67ESwTd3W1cEPWBIVxdAM9ZpSoaJ898G8axhXZXXP3oy9QKA6aUkEUDufxP2Ek73PNe+l8AFIFS4gAFEfKDmuxTJulAEqjgo7oBd+q7uIP48Kkbcy42WUsbo6N2Aq9V0cAdVEw9H5kA25TgHd2FiZ3bsZ+jePo6fwpvNnARsWWt0yoOYntsbQ4TD6zgCfpdvyd1omfoGhdwNaqtNsCR4pUc6NQQ2klUugogsq7MfziTE4F5gzcLOuPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB2567.namprd12.prod.outlook.com (52.132.141.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Sun, 11 Aug 2019 16:08:48 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.022; Sun, 11 Aug
 2019 16:08:48 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4] dma-fence: Propagate errors to dma-fence-array
 container
Thread-Topic: [PATCH v4] dma-fence: Propagate errors to dma-fence-array
 container
Thread-Index: AQHVUD9WKcqG8If3LUeTyg9swUBtjKb2HZaA
Date: Sun, 11 Aug 2019 16:08:47 +0000
Message-ID: <61c7693c-497f-5d89-362f-b37c30c7a8da@amd.com>
References: <20190810153430.30636-1-chris@chris-wilson.co.uk>
 <20190811122134.21419-1-chris@chris-wilson.co.uk>
In-Reply-To: <20190811122134.21419-1-chris@chris-wilson.co.uk>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0165.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::33) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 613cb0e8-1c78-48f5-c049-08d71e7630ff
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB2567; 
x-ms-traffictypediagnostic: DM5PR12MB2567:
x-microsoft-antispam-prvs: <DM5PR12MB2567127CBC2FA47ABEF9B3BC83D00@DM5PR12MB2567.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0126A32F74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(189003)(199004)(5660300002)(476003)(110136005)(7736002)(14454004)(14444005)(2501003)(86362001)(446003)(58126008)(6512007)(11346002)(229853002)(54906003)(2616005)(316002)(31696002)(53936002)(8936002)(25786009)(36756003)(65806001)(6246003)(65956001)(2906002)(256004)(66446008)(66556008)(4326008)(65826007)(71200400001)(186003)(71190400001)(8676002)(66946007)(64756008)(66476007)(99286004)(102836004)(81166006)(478600001)(31686004)(386003)(6506007)(64126003)(76176011)(6486002)(66574012)(52116002)(6116002)(305945005)(486006)(46003)(81156014)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB2567;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eTbbnyUyPtRy1O0fp7Ou+rPjIgY+WsnB3onL5zA1Yc+zC+E+aRZjLQcmAuyohYady/Y68VF/rvmqx1HKTinN0q0kVmthlismkFajdzEKc/Tt3mS9XsBft+39AWg9lPgszrDmPd9KAnHqzvtAkEfLoXBTpyN98LXtchNMXvy0AGD3z8lQM39E9zEHgWBSRDtF0UZZTRhHeDi0E4622eWcdPPouO8CggNTuEE8tAM36I0M7RYeRo+WnhNKQ0UMZOxs5KjaOmuOroPF1FFY/fTwmAqIoN5i3lz7h9LnpAHFt2ldhfTyJ+nd3QmD7yYlId102hOSjQZZYtArxj5T86jRV+QprsLFoZ308qMYd6QmmFGr/kM8yTQcE9fbDBiQJMRPhlk9ROiMDDcvSubFFpPyPVJHOS21PxB8qfZ6Vv/ftDY=
x-ms-exchange-transport-forked: True
Content-ID: <D93D4FEFFBF60342A6C5FD6EB9FFC418@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 613cb0e8-1c78-48f5-c049-08d71e7630ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2019 16:08:47.9013 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q6DPULUYEdceefxR3243ohCWcA5BjOgZPY73RsCi4JoM5xt0gtK6tas0/u4AbjSQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2567
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CjyOYbGRu2oGAmk6tO2TWWAMJpXt6Ag4nIVFbLGysis=;
 b=npXoewZ6FFBgZmFU8eNI7jvk53T56I9wMQCau4jNSWzdks9g4NsU9qRW7sB7wxod9X4KrGlu0aQWyEU+Wqlhk0a++NwVTaPFTIRqKOWoiMSbny3WYJGsw5oAM72numSt6+/C2SuHHx1to8Y8PM8WobZM9LOIy9U1VT2d0kQpJnA=
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
Cc: Gustavo Padovan <gustavo@padovan.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SG93IGFib3V0IHRoaXMgaW5zdGVhZDoNCg0KU2V0dGluZyBhcnJheS0+YmFzZS5lcnJvciA9IDEg
ZHVyaW5nIGluaXRpYWxpemF0aW9uLg0KDQpUaGVuIGNtcHhjaGcoYXJyYXktPmJhc2UuZXJyb3Is
IDEsIGVycm9yKSB3aGVuZXZlciBhIGZlbmNlIGluIHRoZSBhcnJheSANCnNpZ25hbHMuDQoNCkFu
ZCB0aGVuIGZpbmFsbHkgY21weGNoZyhhcnJheS0+YmFzZS5lcnJvciwgMSwgMCkgd2hlbiB0aGUg
YXJyYXkgaXRzZWxmIA0Kc2lnbmFscy4NCg0KQ2hyaXN0aWFuLg0KDQpBbSAxMS4wOC4xOSB1bSAx
NDoyMSBzY2hyaWViIENocmlzIFdpbHNvbjoNCj4gV2hlbiBvbmUgb2YgdGhlIGFycmF5IG9mIGZl
bmNlcyBpcyBzaWduYWxlZCwgcHJvcGFnYXRlIGl0cyBlcnJvcnMgdG8gdGhlDQo+IHBhcmVudCBm
ZW5jZS1hcnJheSAoa2VlcGluZyB0aGUgZmlyc3QgZXJyb3IgdG8gYmUgcmFpc2VkKS4NCj4NCj4g
djI6IE9wZW5jb2RlIGNtcHhjaGdfbG9jYWwgdG8gYXZvaWQgY29tcGlsZXIgZnJlYWtvdXQuDQo+
IHYzOiBCZSBjYXJlZnVsIG5vdCB0byBmbGFnIGFuIGVycm9yIGlmIHdlIHJhY2UgYWdhaW5zdCBz
aWduYWwtb24tYW55Lg0KPiB2NDogU2FtZSBhcHBsaWVzIHRvIGluc3RhbGxpbmcgdGhlIHNpZ25h
bCBjYi4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+DQo+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPg0K
PiBDYzogR3VzdGF2byBQYWRvdmFuIDxndXN0YXZvQHBhZG92YW4ub3JnPg0KPiBDYzogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJz
L2RtYS1idWYvZG1hLWZlbmNlLWFycmF5LmMgfCAzNyArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystDQo+ICAgaW5jbHVkZS9saW51eC9kbWEtZmVuY2UtYXJyYXkuaCAgIHwgIDIgKysNCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYyBiL2RyaXZlcnMv
ZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYw0KPiBpbmRleCAxMmM2ZjY0YzBiYzIuLjRkNTc0ZGZm
MGJhOSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS1hcnJheS5jDQo+
ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYw0KPiBAQCAtMjMsMTAgKzIz
LDM3IEBAIHN0YXRpYyBjb25zdCBjaGFyICpkbWFfZmVuY2VfYXJyYXlfZ2V0X3RpbWVsaW5lX25h
bWUoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpDQo+ICAgCXJldHVybiAidW5ib3VuZCI7DQo+ICAg
fQ0KPiAgIA0KPiArc3RhdGljIHZvaWQgZG1hX2ZlbmNlX2FycmF5X3NldF9lcnJvcihzdHJ1Y3Qg
ZG1hX2ZlbmNlX2FycmF5ICphcnJheSkNCj4gK3sNCj4gKwlpbnQgZXJyb3IgPSBSRUFEX09OQ0Uo
YXJyYXktPnBlbmRpbmdfZXJyb3IpOw0KPiArDQo+ICsJaWYgKCFhcnJheS0+YmFzZS5lcnJvciAm
JiBlcnJvcikNCj4gKwkJZG1hX2ZlbmNlX3NldF9lcnJvcigmYXJyYXktPmJhc2UsIGVycm9yKTsN
Cj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgZG1hX2ZlbmNlX2FycmF5X3NldF9wZW5kaW5nX2Vy
cm9yKHN0cnVjdCBkbWFfZmVuY2VfYXJyYXkgKmFycmF5LA0KPiArCQkJCQkgICAgICBpbnQgZXJy
b3IpDQo+ICt7DQo+ICsJLyoNCj4gKwkgKiBQcm9wYWdhdGUgdGhlIGZpcnN0IGVycm9yIHJlcG9y
dGVkIGJ5IGFueSBvZiBvdXIgZmVuY2VzLCBidXQgb25seQ0KPiArCSAqIGJlZm9yZSB3ZSBvdXJz
ZWx2ZXMgYXJlIHNpZ25hbGVkLg0KPiArCSAqDQo+ICsJICogTm90ZSB0aGF0IHRoaXMgbWF5IHJh
Y2Ugd2l0aCBtdWx0aXBsZSBmZW5jZXMgY29tcGxldGluZw0KPiArCSAqIHNpbXVsdGFuZW91c2x5
IGluIGVycm9yLCBidXQgb25seSBvbmUgZXJyb3Igd2lsbCBiZSBrZXB0LCBub3QNCj4gKwkgKiBu
ZWNlc3NhcmlseSB0aGUgZmlyc3QuIFNvIGxvbmcgYXMgd2UgcHJvcGFnYXRlIGFuIGVycm9yIGlm
IGFueQ0KPiArCSAqIGZlbmNlcyB3ZXJlIGluIGVycm9yIGJlZm9yZSB3ZSBhcmUgc2lnbmFsZWQg
d2Ugc2hvdWxkIGJlIHRlbGxpbmcNCj4gKwkgKiBhbiBhY2NlcHRhYmxlIHRydXRoLg0KPiArCSAq
Lw0KPiArCWlmIChlcnJvciAmJiAhYXJyYXktPnBlbmRpbmdfZXJyb3IpDQo+ICsJCVdSSVRFX09O
Q0UoYXJyYXktPnBlbmRpbmdfZXJyb3IsIGVycm9yKTsNCj4gK30NCj4gKw0KPiAgIHN0YXRpYyB2
b2lkIGlycV9kbWFfZmVuY2VfYXJyYXlfd29yayhzdHJ1Y3QgaXJxX3dvcmsgKndyaykNCj4gICB7
DQo+ICAgCXN0cnVjdCBkbWFfZmVuY2VfYXJyYXkgKmFycmF5ID0gY29udGFpbmVyX29mKHdyaywg
dHlwZW9mKCphcnJheSksIHdvcmspOw0KPiAgIA0KPiArCWRtYV9mZW5jZV9hcnJheV9zZXRfZXJy
b3IoYXJyYXkpOw0KPiArDQo+ICAgCWRtYV9mZW5jZV9zaWduYWwoJmFycmF5LT5iYXNlKTsNCj4g
ICAJZG1hX2ZlbmNlX3B1dCgmYXJyYXktPmJhc2UpOw0KPiAgIH0NCj4gQEAgLTM4LDYgKzY1LDgg
QEAgc3RhdGljIHZvaWQgZG1hX2ZlbmNlX2FycmF5X2NiX2Z1bmMoc3RydWN0IGRtYV9mZW5jZSAq
ZiwNCj4gICAJCWNvbnRhaW5lcl9vZihjYiwgc3RydWN0IGRtYV9mZW5jZV9hcnJheV9jYiwgY2Ip
Ow0KPiAgIAlzdHJ1Y3QgZG1hX2ZlbmNlX2FycmF5ICphcnJheSA9IGFycmF5X2NiLT5hcnJheTsN
Cj4gICANCj4gKwlkbWFfZmVuY2VfYXJyYXlfc2V0X3BlbmRpbmdfZXJyb3IoYXJyYXksIGYtPmVy
cm9yKTsNCj4gKw0KPiAgIAlpZiAoYXRvbWljX2RlY19hbmRfdGVzdCgmYXJyYXktPm51bV9wZW5k
aW5nKSkNCj4gICAJCWlycV93b3JrX3F1ZXVlKCZhcnJheS0+d29yayk7DQo+ICAgCWVsc2UNCj4g
QEAgLTYzLDkgKzkyLDE0IEBAIHN0YXRpYyBib29sIGRtYV9mZW5jZV9hcnJheV9lbmFibGVfc2ln
bmFsaW5nKHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKQ0KPiAgIAkJZG1hX2ZlbmNlX2dldCgmYXJy
YXktPmJhc2UpOw0KPiAgIAkJaWYgKGRtYV9mZW5jZV9hZGRfY2FsbGJhY2soYXJyYXktPmZlbmNl
c1tpXSwgJmNiW2ldLmNiLA0KPiAgIAkJCQkJICAgZG1hX2ZlbmNlX2FycmF5X2NiX2Z1bmMpKSB7
DQo+ICsJCQlpbnQgZXJyb3IgPSBhcnJheS0+ZmVuY2VzW2ldLT5lcnJvcjsNCj4gKw0KPiArCQkJ
ZG1hX2ZlbmNlX2FycmF5X3NldF9wZW5kaW5nX2Vycm9yKGFycmF5LCBlcnJvcik7DQo+ICAgCQkJ
ZG1hX2ZlbmNlX3B1dCgmYXJyYXktPmJhc2UpOw0KPiAtCQkJaWYgKGF0b21pY19kZWNfYW5kX3Rl
c3QoJmFycmF5LT5udW1fcGVuZGluZykpDQo+ICsJCQlpZiAoYXRvbWljX2RlY19hbmRfdGVzdCgm
YXJyYXktPm51bV9wZW5kaW5nKSkgew0KPiArCQkJCWRtYV9mZW5jZV9hcnJheV9zZXRfZXJyb3Io
YXJyYXkpOw0KPiAgIAkJCQlyZXR1cm4gZmFsc2U7DQo+ICsJCQl9DQo+ICAgCQl9DQo+ICAgCX0N
Cj4gICANCj4gQEAgLTE0MSw2ICsxNzUsNyBAQCBzdHJ1Y3QgZG1hX2ZlbmNlX2FycmF5ICpkbWFf
ZmVuY2VfYXJyYXlfY3JlYXRlKGludCBudW1fZmVuY2VzLA0KPiAgIAlhcnJheS0+bnVtX2ZlbmNl
cyA9IG51bV9mZW5jZXM7DQo+ICAgCWF0b21pY19zZXQoJmFycmF5LT5udW1fcGVuZGluZywgc2ln
bmFsX29uX2FueSA/IDEgOiBudW1fZmVuY2VzKTsNCj4gICAJYXJyYXktPmZlbmNlcyA9IGZlbmNl
czsNCj4gKwlhcnJheS0+cGVuZGluZ19lcnJvciA9IDA7DQo+ICAgDQo+ICAgCXJldHVybiBhcnJh
eTsNCj4gICB9DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS1hcnJheS5o
IGIvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UtYXJyYXkuaA0KPiBpbmRleCAzMDNkZDcxMjIyMGYu
LmZhYWY3MGM1MjRhZSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UtYXJy
YXkuaA0KPiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS1hcnJheS5oDQo+IEBAIC00Miw2
ICs0Miw4IEBAIHN0cnVjdCBkbWFfZmVuY2VfYXJyYXkgew0KPiAgIAlhdG9taWNfdCBudW1fcGVu
ZGluZzsNCj4gICAJc3RydWN0IGRtYV9mZW5jZSAqKmZlbmNlczsNCj4gICANCj4gKwlpbnQgcGVu
ZGluZ19lcnJvcjsNCj4gKw0KPiAgIAlzdHJ1Y3QgaXJxX3dvcmsgd29yazsNCj4gICB9Ow0KPiAg
IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

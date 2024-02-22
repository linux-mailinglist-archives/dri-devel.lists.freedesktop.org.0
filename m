Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC4385F415
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 10:16:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41D2D10E8C5;
	Thu, 22 Feb 2024 09:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Yx/NFRSU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2052.outbound.protection.outlook.com [40.107.113.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E907410E8C5;
 Thu, 22 Feb 2024 09:16:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cZUV5kOZ+Yw3NHYCCQsSd7yoRpnYEvrNLjj1fFpooTKQf9CnhG+1GOChAceVqZhY9VBH9KwvZ6n1f7JPRUEGE3Ikl9uyTb7YbMLCBmQkGZg8yp8nvO36IBcAOw2nvgpGuFhHONdOES1BZCog1yQw3w26BIM8aqP4NZlVikFyalctE+vB20RdXsOwb6zxQwgf2mVC6rb19tzpMnoj+wGorAc7ROB7ZRWgGHDKrq0n4kMaSi274+YCgNfPLbABwq4DKOnuVqlEhjY5JE76KJjs0lZugyzbxs0lIBXNJRSrV8GTB1PvGjkuC3MeSr+Ao8dh+z4r2isWFyPt9Or9OU4WDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBxd50a1ZK6+FSx/CfBgU961y8eGgos5qOqwALWbLkg=;
 b=k0Lth9z0yY/ifMXf5Nz6lsRQ+N+Ti6izs2nThgjJPmVHbcTyjhZtjzgUIGZR/totCxyvkNGJ6vfKElRm4A93KXZAn7QOpAH1kQft6u58eHxMEKP4Iu3X0gRDP1m/KbX3jAwSNWDZD0hGGwzLAAtJ5OLIBsZB31CRyxtoo+LE4fbhlwrKhovqU9pL93U5rZ21pJ3HL7q3b6HA79YJ2c5a94Q66jioJdOk+P2uuEEvgZNZIOwo5j8J8N3u+pTb3OgNW5LrC9tFqhWEHZtjV4Kf2IudipCTUf8ziwDq4AqnpUCI7TY9n3UHwloMmWig8OhwSZCHBqJnAC7YBiVeOMkv/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dBxd50a1ZK6+FSx/CfBgU961y8eGgos5qOqwALWbLkg=;
 b=Yx/NFRSUkiCOGRNwlNyMmrrL6iRO1ifFDaV5lR/CryXAbKRxD8Nh/zYIbDcKU1BS2EPDKFBGs9C2sf2Ydqv7w6bwtRE4V7o662WrRerJ5xeTX/u5TDARM4xhK3E73CclGXa3iYKvJpwMGbA7rlmscYy1L52sYELWGingAnyIRqs=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYAPR01MB5994.jpnprd01.prod.outlook.com
 (2603:1096:402:31::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 09:16:25 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 09:16:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Maxime Ripard <mripard@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing
 List <linux-next@vger.kernel.org>
Subject: RE: linux-next: build failure after merge of the drm-misc tree
Thread-Topic: linux-next: build failure after merge of the drm-misc tree
Thread-Index: AQHaZTDuEl5j7jpCP0Wkfk+nxl48zbEV+sGwgAANQACAAAziUA==
Date: Thu, 22 Feb 2024 09:16:24 +0000
Message-ID: <TYCPR01MB1126907CD419582B11F21FE4886562@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240222124610.383e1ce3@canb.auug.org.au>
 <TYCPR01MB11269B83A59650E230F4DD97F86562@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <CAMuHMdV0nftTZ6WuEkcS9h0d1bx_haR==roB1gwbaS2fzooO_A@mail.gmail.com>
In-Reply-To: <CAMuHMdV0nftTZ6WuEkcS9h0d1bx_haR==roB1gwbaS2fzooO_A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYAPR01MB5994:EE_
x-ms-office365-filtering-correlation-id: 55c5dcdf-a6b4-42d3-7232-08dc3386f17c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O6pX1SDprRMLLxGE/htcihvoigpqu0H6NnXOE8GMwM28Qo43xfaMZLCLe2yyBXZuv9kMdN00qOXHxU5wEfvg+zFUGaKX/QT0cN+674fpmXG4Zp7RJU0oIpOiRdwhcCyK1ty57efCaOc2Xhel8P96M0o+3NmzTDipG7A96jSYqxa1sGo03HIr9CJZcSb/pMBRjGk2hkgDu8nTfVLXPxmRMDp1aIhmYEPsHVuzFOakUMbOA+kP6z/H46i2PWDqKo8wwKTECsP2XxTpscnDUiZy/NjA4F/YA6oZmvjexZx0YJYvCK+V7HYueSjfghmcNzZxQv3tL1h8SaLKhtlFbJs7LJrgct2R4LfUcQ9vCejP5gpWtUMcwi+C3FihnRccGEhC9EYDwomhDYorGI27X3R8zQ/RPVIKcy+dvPHflU7m8tlfL0Xbx14kPiYHBcl5KbKrIHGNw5iSY3QycFuCV1EhBP66FI9YM5cbm7I3ydCVkVe+Aus9tf3b5P+RX7czVA+p/xO4JY87WIGD1A5O47T9/l/A6XM0zXa31s2RgoLCfejZHwbTMdNQb9TkhBeo4oHf4COoYjBuX3Al42WJ9b/svkfkF/f2zA00L9L5re2urlNbuZARkQ0rBx58+NWsGY2x
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11269.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZGhaOTBnbHl6WjFQY0h3UjBXZllpUFR6Ump6cUlDcmFpZ1JaOVdiTFdXaXNs?=
 =?utf-8?B?Q0YxNk1PS1VyUEowWUVlellJVDRNVWwxWnJWMkVsdExCUnV0OERJeU44OXU2?=
 =?utf-8?B?SHBwanpVRUdyZVNFK3phb0hQZ05sSG1pQ1pLdjNrQmtFQ29RVUU2Unc4R2FR?=
 =?utf-8?B?VVRXcllobndxdnRIVW1nM3J2Ukh6ODJ3ZlpMdlBobUNPazUwZGR4bnl5aUdz?=
 =?utf-8?B?SDRPRWZSSnliK2xYTnhvelkzM3I3ZDJ5cnNZcmY0R29JQmpHd3dUZVBxeDJn?=
 =?utf-8?B?WWtWeUhmR01ENE42WFcwbnQ5R295TWlzQTg3QVc5T3FlYnlSY1J2aW5nbS9D?=
 =?utf-8?B?Ri9yZnJGenhGMDhGOUVlNnJ5dnliN0E2dkhxeVNZU0h3N1RyQjFiSU1kTzM3?=
 =?utf-8?B?ZUNGc282V3NCL1o4WEVhdGdveEFvRlBueENyeFd6SHpLSGh4bWg3WHBSanEx?=
 =?utf-8?B?ZmVHZDJiczExMlhEd3JXQkdtL0FWeGgweDJvYmxNczM5bjNFbUVhQ2dSR2lL?=
 =?utf-8?B?Z3B0d1JMemljZ25ndzhxN0VvUmRkeGI1VEtJQTk4NkFBZDRoQUxFbVVWaGxp?=
 =?utf-8?B?QVhXOWkxcEVtbStTMUp1alQ5bTJObHFlYm1ySFpJZDBYTy9oeG01YkRmOFRj?=
 =?utf-8?B?emJCUFRjaE01LzYva3c4SllDbE5BQXdGdEJrbnBtaENRbTdENHI3QXdFVjhh?=
 =?utf-8?B?cUdCL3ltdHdXYUZ0SERZek5KYU13czV2MHp0OTF0eUJwMkJLcG9wekJYczVG?=
 =?utf-8?B?T1VET3BwTXR5QjhYQ1ZGNHJXK0lLRzNHVHdzWTZCTVg1Ly95OGJ5aXRDVWt1?=
 =?utf-8?B?T0lhY3YrLzJMcUNyRTQ3QnE4Ly9obVNrOGtlN3huY2hydms0dkRxWVQrczRz?=
 =?utf-8?B?VExQTFFsZ3JmZGs4bmdUQWJmL3d1aWpwSGk5K1Q4SjQwVXZxVENJVHhYZklq?=
 =?utf-8?B?VnpXVFlYQU1RWC9UcGpBbVE0MDZFczY3cnAyWWxobXFoMHdzai9PRzJ6Wnhz?=
 =?utf-8?B?ZWcxWjBtRHk5Qmlxc2lvZzFTeEVEcndpSjFSSjNaZG9icHlTbmpSeVF4SHVh?=
 =?utf-8?B?RlBQUllmeEFTK0I3d0JBamhmMzFDT2ZkQVYwWHVkTEwxcXlnbTMrV0crYUV4?=
 =?utf-8?B?TXZMR29pZy9TNzNOOVdYcmJtejlxNDZ0ZzRIazdhaXhMS1BHVFNCSzljODg5?=
 =?utf-8?B?QjJqR3JPM1NFNkVmSkV3bGdveXZCb0U0ODNjYXg3d2F5VDMzR2k5aTZFU2lD?=
 =?utf-8?B?RFFjK2tCanZLajlXdlVXemlobnFKZTI5Vzh4Nm9UYkNIT3B1WVlBNWRxM0RN?=
 =?utf-8?B?aEhSQjdKc3FvU3BpNlBoSWMwZVZCajVPQmRhNG1TNHR3Ti9BVmY2THYxdFhQ?=
 =?utf-8?B?YmY4Y1NIa3Q2MkNzMUMrK0pUU0ZEVXNHcXdGRnRCZWdFOHVVMnFPK1VNWTRT?=
 =?utf-8?B?U2xEQlFycUlkQ2szM3c1VlZIa2ZkTVBMdG15ajAyay9BajhuZG5jajBYZzNQ?=
 =?utf-8?B?SWJ0UEJnakRCRXBTQ0pNWXhhUUhOTzhmYWNUZWtzdDJMaTQ1YWpQVW52QWpK?=
 =?utf-8?B?WllyZnRxT0MyVVZpWitNTmQ5cUtZWGtTWUkyNytpcy9aSVVReUhDRlpOdkEy?=
 =?utf-8?B?WmpjWjhURmxQUWdzK2lWS2tUdmJ5Qi9aandJckdKVW9rM3h6NlRZUU9tTkg2?=
 =?utf-8?B?dm4zK0ZZam9BNGRNMkx2Y0huQkdHMkxEeW9QVXBLMk1JcW9ZRjRIWEJWTDRL?=
 =?utf-8?B?MEl0Ym1RWU1aOXpITnk2OTVIcHVseEM3bEVaYnJJT3I5K2dJR3VZOUM2NjZJ?=
 =?utf-8?B?Qkg1ZVYweXdCQ3V5eDJHTCsxVWxoaFdmeHhTclpLTm1jbVFsdnY2WUhzWEdE?=
 =?utf-8?B?K0dkbnRXWnJyYmdJMjhWdFAzSkd2Sk5sbDBMMlpKYnhhcGxyUSs2djhJc20x?=
 =?utf-8?B?WXhWNnFtaGxDaUthUHQzWWQxRWR4RFlUeFdkYi9hMUhuRkpaZDRSTkRwNWdq?=
 =?utf-8?B?WDdYdVk0NGFVUnQ2Ylh6RkhhaTlZRGtlRlFwdmhvOFdlcjBUamVIZFJ5a081?=
 =?utf-8?B?bHE0YTZOdkdpQ1MxTk9FcE1JSWJFNnpUcGk1ak96cU9RSXFUdys0dVVaTkQw?=
 =?utf-8?B?aFc3R1U1bmlpVERkTmJjU1Evc2NvYys1aXBCUkd6bDlQYU1SS2dRcHEwK1Rv?=
 =?utf-8?B?QWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c5dcdf-a6b4-42d3-7232-08dc3386f17c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 09:16:24.9328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HP+VyWjzIMa5wW+DK4N1eZinju4BNUmNeGjl6EGwylUNYdAPIzufsxCP69wXY5KFa7/j8whbMLSv+rdyHG9bV/r+hC4KkCsp8l0rmoIKNzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5994
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBGZWJydWFyeSAyMiwgMjAyNCA4OjI5IEFNDQo+IFN1
YmplY3Q6IFJlOiBsaW51eC1uZXh0OiBidWlsZCBmYWlsdXJlIGFmdGVyIG1lcmdlIG9mIHRoZSBk
cm0tbWlzYyB0cmVlDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBGZWIgMjIsIDIwMjQg
YXQgOToxNOKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3Jv
dGU6DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogU3RlcGhl
biBSb3Rod2VsbCA8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+DQo+ID4gPiBTZW50OiBUaHVyc2RheSwg
RmVicnVhcnkgMjIsIDIwMjQgMTo0NiBBTQ0KPiA+ID4gU3ViamVjdDogbGludXgtbmV4dDogYnVp
bGQgZmFpbHVyZSBhZnRlciBtZXJnZSBvZiB0aGUgZHJtLW1pc2MgdHJlZQ0KPiA+ID4NCj4gPiA+
IEFmdGVyIG1lcmdpbmcgdGhlIGRybS1taXNjIHRyZWUsIHRvZGF5J3MgbGludXgtbmV4dCBidWls
ZCAoeDg2XzY0DQo+ID4gPiBhbGxtb2Rjb25maWcpIGZhaWxlZCBsaWtlIHRoaXM6DQo+ID4gPg0K
PiA+ID4gZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfdnNwLmM6NDc6Njog
ZXJyb3I6DQo+ID4gPiByZWRlZmluaXRpb24gb2YgJ3J6ZzJsX2R1X3ZzcF9lbmFibGUnDQo+ID4g
PiAgICA0NyB8IHZvaWQgcnpnMmxfZHVfdnNwX2VuYWJsZShzdHJ1Y3QgcnpnMmxfZHVfY3J0YyAq
Y3J0YykNCj4gPiA+ICAgICAgIHwgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+DQo+ID4gPiBJbiBm
aWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVf
ZHJ2Lmg6MTgsDQo+ID4gPiAgICAgICAgICAgICAgICAgIGZyb20gZHJpdmVycy9ncHUvZHJtL3Jl
bmVzYXMvcnotZHUvcnpnMmxfZHVfdnNwLmM6MzA6DQo+ID4gPiBkcml2ZXJzL2dwdS9kcm0vcmVu
ZXNhcy9yei1kdS9yemcybF9kdV92c3AuaDo3MjoyMDogbm90ZTogcHJldmlvdXMNCj4gPiA+IGRl
ZmluaXRpb24gb2YgJ3J6ZzJsX2R1X3ZzcF9lbmFibGUnIHdpdGggdHlwZSAndm9pZChzdHJ1Y3QN
Cj4gPiA+IHJ6ZzJsX2R1X2NydGMgKiknDQo+ID4gPiAgICA3MiB8IHN0YXRpYyBpbmxpbmUgdm9p
ZCByemcybF9kdV92c3BfZW5hYmxlKHN0cnVjdCByemcybF9kdV9jcnRjDQo+ID4gPiAqY3J0Yykg
eyB9Ow0KPiA+ID4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fg0KPiA+ID4gZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfZHVfdnNwLmM6NjE6
NjogZXJyb3I6DQo+ID4gPiByZWRlZmluaXRpb24gb2YgJ3J6ZzJsX2R1X3ZzcF9kaXNhYmxlJw0K
PiA+ID4gICAgNjEgfCB2b2lkIHJ6ZzJsX2R1X3ZzcF9kaXNhYmxlKHN0cnVjdCByemcybF9kdV9j
cnRjICpjcnRjKQ0KPiA+ID4gICAgICAgfCAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+ID4g
PiBkcml2ZXJzL2dwdS9kcm0vcmVuZXNhcy9yei1kdS9yemcybF9kdV92c3AuaDo3MzoyMDogbm90
ZTogcHJldmlvdXMNCj4gPiA+IGRlZmluaXRpb24gb2YgJ3J6ZzJsX2R1X3ZzcF9kaXNhYmxlJyB3
aXRoIHR5cGUgJ3ZvaWQoc3RydWN0DQo+ID4gPiByemcybF9kdV9jcnRjICopJw0KPiA+ID4gICAg
NzMgfCBzdGF0aWMgaW5saW5lIHZvaWQgcnpnMmxfZHVfdnNwX2Rpc2FibGUoc3RydWN0IHJ6ZzJs
X2R1X2NydGMNCj4gPiA+ICpjcnRjKSB7IH07DQo+ID4gPiAgICAgICB8ICAgICAgICAgICAgICAg
ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fg0KPiA+ID4gZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMv
cnotZHUvcnpnMmxfZHVfdnNwLmM6NjY6NjogZXJyb3I6DQo+ID4gPiByZWRlZmluaXRpb24gb2Yg
J3J6ZzJsX2R1X3ZzcF9hdG9taWNfZmx1c2gnDQo+ID4gPiAgICA2NiB8IHZvaWQgcnpnMmxfZHVf
dnNwX2F0b21pY19mbHVzaChzdHJ1Y3QgcnpnMmxfZHVfY3J0YyAqY3J0YykNCj4gPiA+ICAgICAg
IHwgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+ID4gPiBkcml2ZXJzL2dwdS9kcm0v
cmVuZXNhcy9yei1kdS9yemcybF9kdV92c3AuaDo3NDoyMDogbm90ZTogcHJldmlvdXMNCj4gPiA+
IGRlZmluaXRpb24gb2YgJ3J6ZzJsX2R1X3ZzcF9hdG9taWNfZmx1c2gnIHdpdGggdHlwZSAndm9p
ZChzdHJ1Y3QNCj4gPiA+IHJ6ZzJsX2R1X2NydGMgKiknDQo+ID4gPiAgICA3NCB8IHN0YXRpYyBp
bmxpbmUgdm9pZCByemcybF9kdV92c3BfYXRvbWljX2ZsdXNoKHN0cnVjdA0KPiA+ID4gcnpnMmxf
ZHVfY3J0Yw0KPiA+ID4gKmNydGMpIHsgfTsNCj4gPiA+ICAgICAgIHwgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gPiA+IGRyaXZlcnMvZ3B1L2RybS9yZW5l
c2FzL3J6LWR1L3J6ZzJsX2R1X3ZzcC5jOjc2OjE5OiBlcnJvcjoNCj4gPiA+IHJlZGVmaW5pdGlv
biBvZiAncnpnMmxfZHVfdnNwX2dldF9kcm1fcGxhbmUnDQo+ID4gPiAgICA3NiB8IHN0cnVjdCBk
cm1fcGxhbmUgKnJ6ZzJsX2R1X3ZzcF9nZXRfZHJtX3BsYW5lKHN0cnVjdA0KPiA+ID4gcnpnMmxf
ZHVfY3J0YyAqY3J0YywNCj4gPiA+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4NCj4gPiA+IGRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6
ZzJsX2R1X3ZzcC5oOjc1OjMzOiBub3RlOiBwcmV2aW91cw0KPiA+ID4gZGVmaW5pdGlvbiBvZiAn
cnpnMmxfZHVfdnNwX2dldF9kcm1fcGxhbmUnIHdpdGggdHlwZSAnc3RydWN0DQo+ID4gPiBkcm1f
cGxhbmUgKihzdHJ1Y3QgcnpnMmxfZHVfY3J0YyAqLCB1bnNpZ25lZCBpbnQpJw0KPiA+ID4gICAg
NzUgfCBzdGF0aWMgaW5saW5lIHN0cnVjdCBkcm1fcGxhbmUNCj4gPiA+ICpyemcybF9kdV92c3Bf
Z2V0X2RybV9wbGFuZShzdHJ1Y3QNCj4gPiA+IHJ6ZzJsX2R1X2NydGMgKmNydGMsDQo+ID4gPiAg
ICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4NCj4gPiA+IGRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X3Zz
cC5jOjMwMjo1OiBlcnJvcjoNCj4gPiA+IHJlZGVmaW5pdGlvbiBvZiAncnpnMmxfZHVfdnNwX2lu
aXQnDQo+ID4gPiAgIDMwMiB8IGludCByemcybF9kdV92c3BfaW5pdChzdHJ1Y3QgcnpnMmxfZHVf
dnNwICp2c3AsIHN0cnVjdA0KPiA+ID4gZGV2aWNlX25vZGUgKm5wLA0KPiA+ID4gICAgICAgfCAg
ICAgXn5+fn5+fn5+fn5+fn5+fn4NCj4gPiA+IGRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1
L3J6ZzJsX2R1X3ZzcC5oOjY2OjE5OiBub3RlOiBwcmV2aW91cw0KPiA+ID4gZGVmaW5pdGlvbiBv
ZiAncnpnMmxfZHVfdnNwX2luaXQnIHdpdGggdHlwZSAnaW50KHN0cnVjdCByemcybF9kdV92c3AN
Cj4gPiA+ICosIHN0cnVjdCBkZXZpY2Vfbm9kZSAqLCB1bnNpZ25lZCBpbnQpJw0KPiA+ID4gICAg
NjYgfCBzdGF0aWMgaW5saW5lIGludCByemcybF9kdV92c3BfaW5pdChzdHJ1Y3QgcnpnMmxfZHVf
dnNwDQo+ID4gPiAqdnNwLCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wLA0KPiA+ID4gICAgICAgfCAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fg0KPiA+ID4NCj4gPiA+IENhdXNlZCBi
eSBjb21taXQNCj4gPiA+DQo+ID4gPiAgIDc2OGU5ZTYxYjNiOSAoImRybTogcmVuZXNhczogQWRk
IFJaL0cyTCBEVSBTdXBwb3J0IikNCj4gPiA+DQo+ID4gPiBJIGhhdmUgdXNlZCB0aGUgZHJtLW1p
c2MgdHJlZSBmcm9tIG5leHQtMjAyNDAyMjEgZm9yIHRvZGF5Lg0KPiA+DQo+ID4gSSB3aWxsIHNl
bmQgYW4gaW5jcmVtZW50YWwgcGF0Y2ggdG8gZml4IHRoaXMgYnVpbGQgZXJyb3Igd2l0aCB4ODYg
b24NCj4gZHJtLW5leHQuDQo+ID4NCj4gPiBJIG5lZWQgdG8gdXNlIHRoZSBtYWNybyAjaWYgSVNf
RU5BQkxFRChDT05GSUdfVklERU9fUkVORVNBU19WU1AxKQ0KPiA+IGluIGRyaXZlcnMvZ3B1L2Ry
bS9yZW5lc2FzL3J6LWR1L3J6ZzJsX2R1X3ZzcC5oIHRvIGZpeCB0aGlzIGVycm9yLg0KPiANCj4g
TG9va3MgbGlrZSB5b3UncmUgYWxzbyBtaXNzaW5nIGFuIEVYUE9SVF9TWU1CT0xfR1BMKHJ6ZzJs
X2R1X3ZzcF9lbmFibGUpPw0KDQpZZXMsIFdpbGwgYWRkIHRoaXMgYXN3ZWxsLCBhcyBDT05GSUdf
VklERU9fUkVORVNBU19WU1AxPW0gZm9yIHg4Ni4NCg0KQ2hlZXJzLA0KQmlqdQ0K

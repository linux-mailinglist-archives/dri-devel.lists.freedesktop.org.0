Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA634117B4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 16:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623FF89F49;
	Mon, 20 Sep 2021 14:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2079.outbound.protection.outlook.com [40.107.244.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FF889F49
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 14:59:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SSqCh8nUM5TYptJdx35nzkxHCD6PjYX+kf7yFnu6HKbwa/fcruvAlJydyghQos71SeGXkgMwmr3cKzGXj1bAfQcsVuwhD76xkSAuTZBvK/Q0cYf+i3GPFASa4VvwRZiJdAWkaKeld1EU1VVCGxORyh72ZhkOMvPjBKOFSfkBoTPySZb5mCAXF6FrJt6BuI4yqiP5q2GOaLUET2QXZD9mEDRBrpBoM/cPbyVg9POqt1OqKQCDE9G6wxFLZLLBZ9OAG6YbHoPMdbJbGwrVj0/uHsCVVXbrG9kddacND+MaEbPx5gn8drcOMEDqIBO+qQLeXNbjDyetAKglStXTIV0bgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ocvcAVmC8ZCJsnkCbGbSIc0zFT9kX0K7BsA7+YG9YqI=;
 b=ZVo7n2hCNn3WVpOou9e/patUQtbmKhybaO7cwFPI3uBVZPcWIgZy2nu2eUG7+irrAQxzlAIZAqunnH2n6V2GOvZ9ADKusD/lkov4zOYWD20l/tzb+41fdLCaGwypS2Fq0hpKp8NWSjwOPOUPtCr4tzL5nQrC6a2Wv3ap/3pIEH9YNDcb59gtJfh48dgrC1A4aU5aGjUCHkH9uewK6OV287hHnCJwFjpCwx23CaDZfXBiyMzlTLbEHrWcKhR85VWqtvQv47vDpDY1NESJhbAXdkyHJM77kUk2oIeiMq3L4KMIcxKJbCj0bGO3gmTWPjVECwyEhToQ3N+zPm7X41Ekqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocvcAVmC8ZCJsnkCbGbSIc0zFT9kX0K7BsA7+YG9YqI=;
 b=RRC6r5wyRaftHKTlzcQN9n6m6nL2ZkAkfF08zJhDOrTHgRz+3cjmoROmXFZ0WvMytQPrcB32QgCsN2Wgv9EeWn1j1mOmT3V/tThU2Cpeam0Z701mDMx9kbb6QICBo3DslHsr2Y4T9AjAfl1ZAZo3uTl1DAslebK5tc0NtSsWwGw=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6367.namprd05.prod.outlook.com (2603:10b6:208:d9::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.6; Mon, 20 Sep
 2021 14:59:41 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::90e1:1a8:297e:a0be]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::90e1:1a8:297e:a0be%7]) with mapi id 15.20.4544.013; Mon, 20 Sep 2021
 14:59:41 +0000
From: Zack Rusin <zackr@vmware.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
CC: DRI Development <dri-devel@lists.freedesktop.org>, Huang Rui
 <ray.huang@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/ttm: Don't delete the system manager before the
 delayed delete
Thread-Topic: [PATCH] drm/ttm: Don't delete the system manager before the
 delayed delete
Thread-Index: AQHXq+8Oas11ngreF0GPmQecMD3qwKusejgAgACOLIA=
Date: Mon, 20 Sep 2021 14:59:41 +0000
Message-ID: <6F174F23-797F-4106-BE54-E208FA7571B5@vmware.com>
References: <20210917175328.694429-1-zackr@vmware.com>
 <e9848031-39c9-235e-b811-3735bdf89689@amd.com>
In-Reply-To: <e9848031-39c9-235e-b811-3735bdf89689@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.100.0.2.22)
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e245e86c-d007-457e-3514-08d97c474653
x-ms-traffictypediagnostic: MN2PR05MB6367:
x-microsoft-antispam-prvs: <MN2PR05MB6367B26941C28F4816E57553CEA09@MN2PR05MB6367.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Hik6MWjhC0RQmLYh6XLOER3AVklmXdABdCbTnsNxmCL95EIQ/6mPnepas19QO+sja18/hxR9AdiGuZUpYO7lf72uCpDoN7ejrUnsX37vhvweFRFkRPVW5tOrNWpJQ3LVTNmH3pQTJgBmsqNIl0gP8VZK1a0Q+e6BqdVjSpwT/pIegLXEyNoLnoUae/hLRI0asPWx+ELVp79ggJIXVOq05VokpoYwhfq0kPiVN6LOpt4uuUAx2LBUrCRs+ipTakZ820YENXX1R6b5Cq0GYSJ8J/lhY4AEcWvWUXuvrzh0LKWsIrCEnRfa8g+OMVo8ICs7y6EgOGBETL9385T7Fm87R552WSRtAHQ4x5L3QL7HOuZ6eehvQ437rZtbsfgpHxKssp5V1NwDa4jYUfR+udfUEN5VPX3cn4iiJV14pbORl8YWpqeSnE11TppuUvxB5tDaC7DpZKxW8gPa/605I+hjKSJg4RKUJsOl3dIHeL/R3o8IakYRtL9V/810fFSUGl/ej+CJlketcEr4bXozpPdTpizw0Z1lP5FcW/NZuN+aAMcIfBZ7K6qQkgywNuha0KhtUq4upkZnk2vlIaXCqCb+xhUfznZh6YOMHgpAZ4g4nsQHr8YNnwRhBS0FDRyCbjv7pULK3L0UeeXZ7FY4VwLf/yFRCK1rj5yeSloZuZzglDpuSLvrpoZIOCkbJTBCpoaEv/I739O668ay/A6FaOmXWdEBjOTQuKNItb+RE6Y1tjY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(316002)(36756003)(86362001)(6512007)(122000001)(186003)(66574015)(8676002)(76116006)(66946007)(2906002)(53546011)(6506007)(71200400001)(38100700002)(38070700005)(33656002)(66446008)(54906003)(66476007)(66556008)(6916009)(64756008)(83380400001)(4326008)(8936002)(2616005)(26005)(5660300002)(508600001)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WHZSdytXem5SYU5ZZXVNSDlMRXlwV2VtSHZ0ZDJEbHkra2xxNVM5MnlDcE05?=
 =?utf-8?B?WC9waUVvZElwbTc1ZjZ0VzBSUElIdVZKOG8yQVU4YTIzZmJsam53cFRqMHo2?=
 =?utf-8?B?TEQyc3Fhb3EyVGRVOEhvK2Z4TnpVQzZOMTZvZGZybE1aUGpaYnl5NklXbW9B?=
 =?utf-8?B?bmNPenBlRGFXcXRHd3VOWitHUlF4M3h3TEYvOGNVdmdHZXBvZUxEaGlDYnFu?=
 =?utf-8?B?QmdIejExd1czU0FTQW5zTkhQeUI4OFphUk8xMStLT2RLbDA2MWZQb0xlRE9z?=
 =?utf-8?B?eXEzcFRQb2w0SHl0NGNJekh6UXJ4NytCR2hCTmVvWWJQNmUzQjRYNURCWTNt?=
 =?utf-8?B?bEthVklCd2h3L2tPMktEZ0E2UUZBSmFRZ052QXBuYlNEb2ZXT0wzTlA5aEYv?=
 =?utf-8?B?VDRXT3pnQTVmWVFRcVh4WFJ5N1hRYmc2c0hvYUJ0bFBFVnlmcmJ6a3lXSjJR?=
 =?utf-8?B?R3hvTUFNd3BGQ0JJSzhoZHlkS0JGaTl5clJ2bWZuaElDZy9uRWFJQkhLZDFZ?=
 =?utf-8?B?dkxyWDhzdlpEZzRRMTk1MDdDV1JlT3JPK013V1Y4YW5OaklscjBmaSsraS8x?=
 =?utf-8?B?OThuR3dKUkpHb0tzNjRSdE9JcVdVSWlTNjBxOThHei83aUJmYUVvdkNJZEVj?=
 =?utf-8?B?OFJGeTJVTkVPazJQWkh3bjVXdnp6dk1Bdy9JOTdOZlRka2FOTUd6VndFaE5h?=
 =?utf-8?B?WVdTODlITnloQ2tiSVFGR2hlZzE5WlVXUnFrYkg1dTJxYncrd2pMa0s4Y1Fi?=
 =?utf-8?B?QTZ3bm1yRDR1WXJhU0pOZ2FJalJGMjJhYWVWUmlieGlSc2JjM001L0JpUmR2?=
 =?utf-8?B?YnNqbVJCa0Jydm9pUjZERVVmaUQwODlndDR0dUQyd3pNNktjaUJUMjFMRVdw?=
 =?utf-8?B?ZWh1ZElRMzU4S01STXhWazU3RFNyRW84SE5JMUhvVHNXQ0NaUmhtYkUwTVYv?=
 =?utf-8?B?TkNnd21qS1VBRnpDMjdvNmJWN1VZVW1WRU9SMktmTElva2FkaGNZbGEyV3VO?=
 =?utf-8?B?TU9EcU1YRWhYNE5OY1dnaWF2eXlZdW9HOVI0bVBLSUFLZGtPS0N6S25manh5?=
 =?utf-8?B?YkFBVHhtNURXSXhEdWhDZzR3b244N29vRERYUGRkZzlkRFROZnZTbUZJVDNH?=
 =?utf-8?B?QzV0WnhQNHlOR2ZkQ0xqRE4rUS8yeEc1UXgrVFJ2V2FZTERKQ05XckNua3Y5?=
 =?utf-8?B?akJxdEIvV1JWU0pIMTBZdWFtUWh4eERyVXNGRmJvTkRUUlhtSDFTTzFsOWFD?=
 =?utf-8?B?bVUvSmJxQXZHbzB1dlVnbEErelk4bEttL2xUYlBkNXVDSGdSQnVHaUFDd3dE?=
 =?utf-8?B?UEtsWDBMVEdPSFl2Mk1oTEcrdjJhcGVtaUI2aDVQR25ucldsZ1Fya1A5WGQ5?=
 =?utf-8?B?T1gzMHBtRGhyVFNrVE80T2Z5dTkrZ3FwdnZrVGFvZlE3YTVKWWhUUHVSdVpl?=
 =?utf-8?B?RlhFT0VLWWFVVldJM0M5TTNvT1AxUU91aVg0WjVIb2tPTDNKazlrWXFCRndT?=
 =?utf-8?B?d1kreXJpNWZnYm8yelk1Rk1vNzdzYmlXK3Y1K0tXYW5rMXFsUGM0Z2kzSWg0?=
 =?utf-8?B?VGI1TkxDdEsxTDdhWWlWTzhMRzMyeFB2UmZ6YS8yTWEzMGh2d3h6ZXVPWmpt?=
 =?utf-8?B?czJKdUIvVC90cGtNR3k2ZExRTWJUbWZ0MFI4eG54WTNaVzVUU0ZMOE9vTXMx?=
 =?utf-8?B?Y29sRnRhMWZrOGdWNU12MXd6ZzJySUtTRXlGQlNWQkg0MnJaRTNwSmMyMHpL?=
 =?utf-8?Q?vjx04ohXN8ggN8vSesc3tQkc/y1bOZVxE8OmBxj?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3530637D490334FBC7BDE26777EF474@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e245e86c-d007-457e-3514-08d97c474653
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2021 14:59:41.2717 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xF0DTk9DhRYzusZmaVlxNxoH5rDNfauEFG99rdscNM+TrktuqHE2xrraHG8XX4YQ4+rkVCmnapFYliLbMpvrtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6367
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

DQoNCj4gT24gU2VwIDIwLCAyMDIxLCBhdCAwMjozMCwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToNCj4gDQo+IEFtIDE3LjA5LjIxIHVtIDE5OjUzIHNj
aHJpZWIgWmFjayBSdXNpbjoNCj4+IE9uIHNvbWUgaGFyZHdhcmUsIGluIHBhcnRpY3VsYXIgaW4g
dmlydHVhbGl6ZWQgZW52aXJvbm1lbnRzLCB0aGUNCj4+IHN5c3RlbSBtZW1vcnkgY2FuIGJlIHNo
YXJlZCB3aXRoIHRoZSAiaGFyZHdhcmUiLiBJbiB0aG9zZSBjYXNlcw0KPj4gdGhlIEJPJ3MgYWxs
b2NhdGVkIHRocm91Z2ggdGhlIHR0bSBzeXN0ZW0gbWFuYWdlciBtaWdodCBiZQ0KPj4gYnVzeSBk
dXJpbmcgdHRtX2JvX3B1dCB3aGljaCByZXN1bHRzIGluIHRoZW0gYmVpbmcgc2NoZWR1bGVkDQo+
PiBmb3IgYSBkZWxheWVkIGRlbGV0aW9uLg0KPiANCj4gV2hpbGUgdGhlIHBhdGNoIGl0c2VsZiBp
cyBwcm9iYWJseSBmaW5lIHRoZSByZWFzb25pbmcgaGVyZSBpcyBhIGNsZWFyIE5BSy4NCj4gDQo+
IEJ1ZmZlcnMgaW4gdGhlIHN5c3RlbSBkb21haW4gYXJlIG5vdCBHUFUgYWNjZXNzaWJsZSBieSBk
ZWZpbml0aW9uLCBldmVuIGluIGEgc2hhcmVkIGVudmlyb25tZW50IGFuZCBzbyAqbXVzdCogYmUg
aWRsZS4NCg0KSeKAmW0gYXNzdW1pbmcgdGhhdCBtZWFucyB0aGV5IGFyZSBub3QgYWxsb3dlZCB0
byBiZSBldmVyIGZlbmNlZCB0aGVuLCB5ZXM/DQoNCj4gT3RoZXJ3aXNlIHlvdSBicmVhayBxdWl0
ZSBhIG51bWJlciBvZiBhc3N1bXB0aW9ucyBpbiB0aGUgY29kZS4NCg0KQXJlIHRoZXJlIG1vcmUg
YXNzdW1wdGlvbnMgbGlrZSB0aGF0IG9yIGRvIHlvdSBtZWFuIHRoZXJl4oCZcyBtb3JlIHBsYWNl
cyB0aGF0IGRlcGVuZCBvbiB0aGUgYXNzdW1wdGlvbiB0aGF0IHN5c3RlbSBkb21haW4gYm/igJlz
IGFyZSBhbHdheXMgaWRsZT8gSWYgdGhlcmXigJlzIG1vcmUgYXNzdW1wdGlvbnMgbGlrZSB0aGF0
IGluIFRUTSB0aGF0IHdvdWxkIGJlIGluY3JlZGlibHkgdmFsdWFibGUgdG8ga25vdy4gSSBoYXZl
buKAmXQgYmVlbiBwYXlpbmcgbXVjaCBhdHRlbnRpb24gdG8gdGhlIGtlcm5lbCBjb2RlIGluIHll
YXJzIGFuZCBjb21pbmcgYmFjayBub3cgYW5kIGxvb2tpbmcgYXQgYSBmZXcgeWVhcnMgb2xkIHZt
d2dmeCBjb2RlIGl04oCZcyBhbG1vc3QgaW1wb3NzaWJsZSB0byB0ZWxsIHRoZSBkaWZmZXJlbmNl
IGJldHdlZW46IOKAnHRoaXMgYXNzdW1wdGlvbiBicmVha3MgdGhlIGRyaXZlcuKAnSBhbmQg4oCc
dGhpcyBkcml2ZXIgYnJlYWtzIHRoaXMgYXNzdW1wdGlvbuKAnS4NCg0Keg0KDQo=

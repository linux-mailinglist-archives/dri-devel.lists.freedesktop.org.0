Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A792FE545
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:42:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C946E516;
	Thu, 21 Jan 2021 08:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300111.outbound.protection.outlook.com [40.107.130.111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7064F6E516
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 08:42:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjmcgtHnM9Q1DCsnJxAN9UbldzwBLkJONkmzihkMqiTJTaWAVO6frx/HV4eemFNUEGkX08rPiNNsqYf+faDMlVw3FP4I8pWo9pK/VFSiKFgdMTODXSd8ERimQg2lTD0+Xy0WebfpXfL8Fa0v3WamvRDEhUAh/V4k1F89UmY6R7fZcQnJCPkUaTyIVKXZblAVTCoo22hg9qnl8x4T48c85r/elCFM2HhohUImz6wpAHcbh98imjEh8FDBnRLQqcBuvS1/ADd29knzjEaCWXR9sBsq//Q5BhXeCNDsiT+32t19LXBBDqWXBbjBG7hAeokNh2zYIef+c2Hc8bTg7bF2Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zePaaB2R6r5Y6e/QBYGBirYuUZXQzvjTerC7tgKaEOw=;
 b=mPcsy9KHhPh0IWy55nz04y/qzss+QXuo585LTkn8+n1j574OoVXMjEbB6ZL7JfT45O9uP+k3PWMEfPJLEJigK4Nw0IY3a8xF+eF/F37UoNDbyEKQw4np0085r/21aXExuocKJluRvRNw8r1T2JohTKRfYxf9KWzQfijj9LlXss9eVtv/gCq8I1YHggV3h/2F1sBCZxs9dgTb4myHE5VgcPkXP+p85ikoLvRG+oDfuQlgPTy99l1rZVE6xtasCRUsV3+OYmixtzvhTkW38BdlZBSYW72Alx4jTmrXtbBQS/rOeb6po3GZyW2SCACsHUI5/ntGQaAvKH4Hn0Gz9/Aerw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com (2603:1096:202:34::18)
 by HK0PR06MB2228.apcprd06.prod.outlook.com (2603:1096:203:4c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Thu, 21 Jan
 2021 08:42:46 +0000
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::2d0a:e180:a73a:a9e9]) by HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::2d0a:e180:a73a:a9e9%3]) with mapi id 15.20.3784.012; Thu, 21 Jan 2021
 08:42:46 +0000
From: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drm/ast: Update the sequence of Clearing Fast-reset
Thread-Topic: [PATCH] drm/ast: Update the sequence of Clearing Fast-reset
Thread-Index: AQHW7XgIyFc+kGolT0S52qyxPa7PVKoxusIAgAAIG8A=
Date: Thu, 21 Jan 2021 08:42:46 +0000
Message-ID: <HK2PR06MB330087DBCD724A93EBACC17C8CA10@HK2PR06MB3300.apcprd06.prod.outlook.com>
References: <20210118085755.107804-1-kuohsiang_chou@aspeedtech.com>
 <fe524173-058a-1e6b-503a-6c2294e7594a@suse.de>
In-Reply-To: <fe524173-058a-1e6b-503a-6c2294e7594a@suse.de>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7698464b-4fea-42b5-a5f2-08d8bde886bf
x-ms-traffictypediagnostic: HK0PR06MB2228:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR06MB222820CE8F82661433D36ABA8CA10@HK0PR06MB2228.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tfnqJUEbBcqKc32J5rq20YMzvB8YZpFmhFGxfcxYRf1TOc3mx4OGj5vGx/aj3e78i+ZR0L7nNANTrqEr7oUU6msI5QkEVZuOpuZoDji6ysSjukuXoPVGFmcgUTQEtWilw7NrQ5X2KTy1RDM2DOF4PLiZ1UQhRAFdDPGUyHD696I3IdsUQ+mWHt/VrQ6rvCBiEPIJWsx88o/QhdR3XnxEkh87hRf+IBMmc3wsL0/j74DpRfXV6G85hVf4u3NExHvMg/FRHcNs914aL5Tv6CDZ4TsQSHvriOKyTPKZ4iBFC/woLqDqQzppJvPxfhRaHRQCXXC0ncYnIhCfDxgC4PS8OYc+O45qZZTyEucvXlTGW3SWT55e8/JreE1DQVHttJMklbp7M6W+dNpzG1NO9SxBGWl7WeNBLJC5V43U+ZRBjQBFjc8juIh3CghwdeJcT288oa+yxqtrxNe1l56njUkDsA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3300.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(366004)(346002)(136003)(396003)(39850400004)(8936002)(6506007)(53546011)(55236004)(8676002)(186003)(54906003)(71200400001)(86362001)(110136005)(5660300002)(26005)(83380400001)(316002)(107886003)(478600001)(66556008)(66574015)(66946007)(64756008)(15650500001)(2906002)(33656002)(9686003)(7696005)(66446008)(66476007)(52536014)(4326008)(966005)(55016002)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bVlZZ1VINU5TdDJGTXNhQlV5eUlLRnh1Y2ZadDdCTGJTY0hmaXYvREtQNW1w?=
 =?utf-8?B?blBLK2FqWXgrQVZLdU5DTDBOdmpSL0pZekN3Yk83WW1UVFRBbWs0TllHRkFZ?=
 =?utf-8?B?UHMweXpBS1JOYUg2Z2k2NlMyWVdOYTR4QzFjYVNVOEZ5NGI4b1hEZnZwWFRU?=
 =?utf-8?B?TElDdysrSlJ5S2lseUtKYkQ1T1NVTWV4OGxkZk1obmU5b1YxaFV2b3RQbmoz?=
 =?utf-8?B?WVorTUc4VnZVS2pmQk5uVUs4RzMwNlV2bGQ1NXk4YVlaMmNsMHQxcUxZbUdM?=
 =?utf-8?B?MEU0UG1uUmFQZTRDdGdHMzBwTlZLYlprWjlNQVRNVnlocDlyZGRrbzA3djBO?=
 =?utf-8?B?ckt6T01hV2Vid2hLUWhtOGE0ZmFQblR4VElmemhZNmlZSTB5U2ZXQkpOYTVQ?=
 =?utf-8?B?Q09GWitZYkFUc3NrSjdiMzJ4OVRGbjV1MUd2R1FlaE9DcjNvUEVHOHNXeHM4?=
 =?utf-8?B?bm9rY3o3UW50TnRkNmZWblQvWlRINkd6a0ZwVVFObks1MlhBb2Vqak4rVERW?=
 =?utf-8?B?b0hVZGNjb0hwNkRNOUF0WUw1WGtyMFhMTm0xcllzd1ROSVJGVC9xQ3llRElx?=
 =?utf-8?B?VnI1cU8yRXU1LzRJZ1ZTVUpCOGFubnd6dkFRZ0tPWTdTV1RISnVTc3NBSXk2?=
 =?utf-8?B?a0Flckl4aTNleVpIK3VCVC9zbDFwU2hWai92Z21MTkNtS3FFT2wreVBzQUZl?=
 =?utf-8?B?cmVzck1hdHloWjB2dFp3SEozTEx1ZW5sR2I0ZGVIeXZySldENlBONXVmNEdw?=
 =?utf-8?B?ZWtIR0xNQnc3TG5FWW1QZmJ3dTZERFFwd0NPUjlpUU9nK3gwYmoxejdJQmxH?=
 =?utf-8?B?TW95K3VUMXAwdmJ0VTB3R1NPY2cwUXczTkU2bVhZd1llWmgrbjdKcmYyODQ2?=
 =?utf-8?B?RHoyS0pmeTJhUWlDOE8zNm5RZTErU0R0K3FjK2JhYW5OYXdXYTg0allTTXZR?=
 =?utf-8?B?SmcyYjFQeUpLcW1xakF0RXJaazJSZVVsSFlDVDkzS25GR2dhVHUyZUNzWTc2?=
 =?utf-8?B?NDNCN1llQnpZWEh5NVhxUkkrV1NQNWpROXIxTU41TjVQN2o4c0ZuUFRlcTJU?=
 =?utf-8?B?UmtwQVRhOGsyZUhKNjhteDBOMk1WcjExZEFyblNWNzFwV1pieWxWU1NqYVFw?=
 =?utf-8?B?cTQ1TVFJT24zM1Z1VDZVZUtsZjRidlUxQzFjcEFHOVNMVGJWdnEvTnMxTzdm?=
 =?utf-8?B?eVVQWlBINS9teFNna3ZMZjVxUmRZMDBzVHdkbHdmNW9HOXdmditndWNaZUQv?=
 =?utf-8?B?dEJGYk9YKzZ5cFIrYkRUMWlhUVZQNTI5am9EcnlyVW1TejZsbjhCY2dLTUM2?=
 =?utf-8?Q?zl8si/sT1eW0o=3D?=
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3300.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7698464b-4fea-42b5-a5f2-08d8bde886bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 08:42:46.2245 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xwsVtBNFY8mTFp/IFmeAu0E+7H/j74bBSxV3h0syZ1I9ZpEF/O2t5+eXlz6LfFid1lwKB/Um59snXqSeQmMbmn/pANROxwyQVwLWcxudXQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2228
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 Jenmin Yuan <jenmin_yuan@aspeedtech.com>,
 Tommy Huang <tommy_huang@aspeedtech.com>, Arc Sung <arc_sung@aspeedtech.com>,
 "airlied@redhat.com" <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFRob21hcyBaaW1tZXJtYW5uIFttYWls
dG86dHppbW1lcm1hbm5Ac3VzZS5kZV0gDQpTZW50OiBUaHVyc2RheSwgSmFudWFyeSAyMSwgMjAy
MSAzOjU2IFBNDQpUbzogS3VvLUhzaWFuZyBDaG91IDxrdW9oc2lhbmdfY2hvdUBhc3BlZWR0ZWNo
LmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hc3Q6IFVwZGF0ZSB0aGUgc2Vx
dWVuY2Ugb2YgQ2xlYXJpbmcgRmFzdC1yZXNldA0KDQpIaQ0KDQpBbSAxOC4wMS4yMSB1bSAwOTo1
NyBzY2hyaWViIEt1b0hzaWFuZyBDaG91Og0KPiBbQnVnXVtBU1QyNTAwXQ0KPiBJZiBTQ1UwMCBp
cyBub3QgdW5sb2NrZWQsIGp1c3QgZW50ZXIgaXRzIHBhc3N3b3JkIGFnYWluLg0KPiBJdCBpcyB1
bm5lY2Vzc2FyeSB0byBjbGVhciBBSEIgbG9jayBjb25kaXRpb24gYW5kIHJlc3RvcmUgV0RUIGRl
ZmF1bHQgDQo+IHNldHRpbmcgYWdhaW4sIGJlZm9yZSBGYXN0LXJlc2V0IGNsZWFyaW5nLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogS3VvSHNpYW5nIENob3UgPGt1b2hzaWFuZ19jaG91QGFzcGVlZHRl
Y2guY29tPg0KDQpJcyB0aGlzIGEgc2VwYXJhdGUgaXNzdWU/IFRoaXMgcGF0Y2ggbG9va3MgbGlr
ZSBhIGZpeCBmb3IgdGhlIHByZXZpb3VzIHBhdGNoLiBbMV0gQ2FuIHlvdSBhZGQgdGhpcyBjaGFu
Z2UgdG8gdjMgb2YgdGhlIG90aGVyIHBhdGNoPw0KDQpIaSwgDQpCYXNlZCBvbiB0aGUgcmVzdWx0
IG9mIGRyaXZlciByZWxlYXNlZCwgdGhpcyBwYXRjaCBpcyBhIGZpeCBmb3IgcHJldmlvdXMgb25l
IFsxXSwgc28gdGhhdCBJIHdpbGwgbWVyZ2UgdGhpcyB0d28gcGF0Y2hlcyBpbnRvIGEgc2luZ2xl
IG9uZSBhcyB2MyBvZiBbMV0uIFRoYW5rcyENCg0KUmVnYXJkcywNCglLdW8tSHNpYW5nIENob3UN
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KWzFdDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9k
cmktZGV2ZWwvMjAyMTAxMTIwNzU4MTEuOTM1NC0xLWt1b2hzaWFuZ19jaG91QGFzcGVlZHRlY2gu
Y29tLw0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3Bvc3QuYyB8IDUgKy0t
LS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfcG9zdC5jIA0KPiBiL2Ry
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X3Bvc3QuYyBpbmRleCAxZjAwMDdkYWEwMDUuLjRmMTk0YzVm
ZDJjMiANCj4gMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3Bvc3QuYw0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9wb3N0LmMNCj4gQEAgLTIwMzAsNyArMjAz
MCw2IEBAIHZvaWQgYXN0X3BhdGNoX2FoYl8yNTAwKHN0cnVjdCBhc3RfcHJpdmF0ZSAqYXN0KQ0K
PiAgIHsNCj4gICAJdTMyCWRhdGE7DQo+IA0KPiAtcGF0Y2hfYWhiX2xvY2s6DQo+ICAgCS8qIENs
ZWFyIGJ1cyBsb2NrIGNvbmRpdGlvbiAqLw0KPiAgIAlhc3RfbW91dGR3bShhc3QsIDB4MWU2MDAw
MDAsIDB4QUVFRDFBMDMpOw0KPiAgIAlhc3RfbW91dGR3bShhc3QsIDB4MWU2MDAwODQsIDB4MDAw
MTAwMDApOyBAQCAtMjA0NCwxMSArMjA0Myw5IEBAIA0KPiB2b2lkIGFzdF9wYXRjaF9haGJfMjUw
MChzdHJ1Y3QgYXN0X3ByaXZhdGUgKmFzdCkNCj4gICAJCWFzdF9tb3V0ZHdtKGFzdCwgMHgxRTc4
NTAwYywgMHgwMDAwMDAzMyk7DQo+ICAgCQl1ZGVsYXkoMTAwMCk7DQo+ICAgCX0NCj4gLQlhc3Rf
bW91dGR3bShhc3QsIDB4MWU2ZTIwMDAsIDB4MTY4OEE4QTgpOw0KPiAgIAlkbyB7DQo+ICsJCWFz
dF9tb3V0ZHdtKGFzdCwgMHgxZTZlMjAwMCwgMHgxNjg4QThBOCk7DQo+ICAgCQlkYXRhID0gYXN0
X21pbmR3bShhc3QsIDB4MWU2ZTIwMDApOw0KPiAtCQlpZiAoZGF0YSA9PSAweGZmZmZmZmZmKQ0K
PiAtCQkJZ290byBwYXRjaF9haGJfbG9jazsNCj4gICAJfQl3aGlsZSAoZGF0YSAhPSAxKTsNCj4g
ICAJYXN0X21vdXRkd20oYXN0LCAweDFlNmUyMDdjLCAweDA4MDAwMDAwKTsJLyogY2xlYXIgZmFz
dCByZXNldCAqLw0KPiAgIH0NCj4gLS0NCj4gMi4xOC40DQo+IA0KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
DQo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCj4gDQoNCi0tDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJ
bWVuZMO2cmZmZXINCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7063DEE3A5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 16:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1084A6E563;
	Mon,  4 Nov 2019 15:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790080.outbound.protection.outlook.com [40.107.79.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAB56E563;
 Mon,  4 Nov 2019 15:23:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNsEKiLMK6hqrtIM12g9jojUGOgfXBEWQdl1t1SmNqO2xJHObIco0pxB8By52PKa1YSrRVHI9kB4sh2JZ6YTA76lhZ9zO+wOCBXIMR2TctSEmTqDBaAMi3ZPl1vlMNVKvLKsq0SyeMasS/6qoBXlicFPZMZiTDZSepoVBbrQd5SlvW+HoOt2tTiitH5ck+CT/5b/AqAFPHjMye8jk27SXW9fFfARA27y4yXUptjWg2CRks3NnP91shzvtetjhvt0EALq1hVVeoipBjnBUvIVtU6h2rNbU7Zk6SNU/6XFWNRrBq1ynwj1C1jIwT923BTQP/I68CCBOYCrdOwU7PogCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iy661gAnXARqpJAwUlaUZr3ygNwwjVCYkPwTjKvvBxM=;
 b=NZKbh0jT5KFJox7PufRR2c2kCcDRYEHjSUrHnAsbi71/+9A/OJ3qsVPP5FoVkbRRYgOVwMacnJzNJzNYUAFGdC0pYO/dO5rdVJXthxLVc4lwfeNCpHUhDhn2+XoF8K70j++H6SsjkM6yNlbOTLcO9cIGnF+EXsvsaP2riY61MZSzJrP++FJoIDQYfp09g8NV/B6bAzByyXcIfhfFKFzj/iFXr3qbP8F9Gj9qOnWU4+dTIRUKTCPVs8j/oZbLEW8om4t/slZrgl7SD8A7fIeGRggYRBg+4MBKQm6Vi8MqyW4cg2EcPImC9eWZpuyctQM/zhV3vBSCup1rUxqrTdcqgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB2469.namprd12.prod.outlook.com (10.172.118.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Mon, 4 Nov 2019 15:23:09 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::449d:52a8:2761:9195]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::449d:52a8:2761:9195%5]) with mapi id 15.20.2408.024; Mon, 4 Nov 2019
 15:23:09 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, "Lakha, Bhawanpreet"
 <Bhawanpreet.Lakha@amd.com>
Subject: Re: drm/amd/display: Add HDCP module - static analysis bug report
Thread-Topic: drm/amd/display: Add HDCP module - static analysis bug report
Thread-Index: AQHVejcKu6zIikeYPUy9tenpH2XnMKdSieGAgAAe+QCAAAW8AIAAIk+AgAADVYCAKDNugIAAS26A
Date: Mon, 4 Nov 2019 15:23:09 +0000
Message-ID: <53bf910b-5f9c-946b-17ee-602c24c0fa96@amd.com>
References: <951eb7dc-bebe-5049-4998-f199e18b0bf3@canonical.com>
 <20191009163235.GT16989@phenom.ffwll.local>
 <a0d5f3a3-a2b3-5367-42f9-bde514571e25@amd.com>
 <CAKMK7uEtJRDhibWDv2TB2WrFzFooMWPSbveDD2N-rudAwvzVFA@mail.gmail.com>
 <c8f96b46-e81e-1e41-aafc-5f6ec236d66f@amd.com>
 <CAKMK7uHr3aeJRqJAscDDfsuBBnVXCeN9SS36-1UGuK84NyOD5Q@mail.gmail.com>
 <CAKMK7uH6EoY9MkzjSjU+Fe=E-XB4Tf9d2VsW=Tr=tFy1J-dJgg@mail.gmail.com>
In-Reply-To: <CAKMK7uH6EoY9MkzjSjU+Fe=E-XB4Tf9d2VsW=Tr=tFy1J-dJgg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
x-clientproxiedby: YTBPR01CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::20) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ad978148-3700-4330-15ce-08d7613ae636
x-ms-traffictypediagnostic: CY4PR1201MB2469:
x-ms-exchange-purlcount: 2
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB24692BD21D6B2F8C4803F4B08C7F0@CY4PR1201MB2469.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0211965D06
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(189003)(199004)(26005)(66066001)(2906002)(186003)(25786009)(229853002)(53546011)(6506007)(386003)(102836004)(54906003)(7736002)(256004)(14444005)(305945005)(587094005)(486006)(4326008)(8676002)(3846002)(6116002)(5660300002)(11346002)(476003)(65956001)(31696002)(65806001)(81156014)(36756003)(71200400001)(14454004)(2616005)(71190400001)(446003)(58126008)(6246003)(110136005)(966005)(99286004)(31686004)(6512007)(6436002)(6636002)(81166006)(6306002)(66946007)(316002)(66446008)(66556008)(478600001)(76176011)(52116002)(64756008)(66476007)(8936002)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB2469;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EUwHdkPfVJ+N3ssbMRrM8PLXGAaA8b/AOwSpuYIGoUoCa30HcptZXSDRr1UoQ8Gv6JZhUh3XUs1mrlOyHqO+jDxN9Ul5EjckZXVw9BCmYIcW9oixXFrIIsJxV/OpZqEliNPA2WJ3qduwdbK6RNmUIpsDeEvFR82xB9BQ1BFXcLDGZJ1Ft+WfZ3AWWRc+n15C+KsaJX07RXMZeGOWx2TbOqPI0hT1I13br/lWVY1vDO7Lat7/xwOjSGTxSzV/KJvsO2kWvuLe9ebpRgmYzPP3X+mCOQcZVLqCht86HPPmluaxdLCGUZ6whfc0lnnl5B3opvaoOh1x+mWYBw8grhmwtPiMOiL84nDec8RyP7gsq2vYx2Sq/lna+0FzX+ow2SzezfjMTtcdhZxrabSEiYBHKBHAl/tLd4nOjIPi0im44dNQ3Io+x+xVark+z0SPWf6waLdyDMxVQrXtbhoDHFmjm6gdiTAtH+kLyc7m8KAHo2o=
Content-ID: <60042CDD2E3E434184EEF216C700AFF1@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad978148-3700-4330-15ce-08d7613ae636
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2019 15:23:09.6975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TgVUfqNbY1vEf9v+XSRgM/RQlTHDWb7krI9OGPkLB6VHGqRtnoYBfX25iyMkW77u1qmO5NRyLfncJ08QuJM6aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2469
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iy661gAnXARqpJAwUlaUZr3ygNwwjVCYkPwTjKvvBxM=;
 b=uIJripke2VQZAshlojIjJlRZnqvib6shpLTK6fScc5oSD0UP0xpc8enqDZm8eLutknuhepSuDQwb27MRF9K9NDLJr4fsmUH2ndc+dnAJOSTnfTR4XpRggXAjO6H6r5Nx33TQAj48oBbjWTxiqKvI+2SJ31AOvwNvMCs3bT9ZIws=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Harry.Wentland@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMS0wNCA1OjUzIGEubS4sIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+IE9uIFdlZCwg
T2N0IDksIDIwMTkgYXQgMTA6NTggUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3
cm90ZToNCj4+IE9uIFdlZCwgT2N0IDksIDIwMTkgYXQgMTA6NDYgUE0gTGFraGEsIEJoYXdhbnBy
ZWV0DQo+PiA8Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4gd3JvdGU6DQo+Pj4NCj4+PiBJIG1p
c3VuZGVyc3Rvb2QgYW5kIHdhcyB0YWxraW5nIGFib3V0IHRoZSBrc3YgdmFsaWRhdGlvbiBzcGVj
aWZpY2FsbHkNCj4+PiAodXNhZ2Ugb2YgZHJtX2hkY3BfY2hlY2tfa3N2c19yZXZva2VkKCkpLg0K
Pj4NCj4+IEhtIGZvciB0aGF0IHNwZWNpZmljYWxseSBJIHRoaW5rIHlvdSB3YW50IHRvIGRvIGJv
dGgsIGkuZS4gYm90aA0KPj4gY29uc3VsdCB5b3VyIHBzcCwgYnV0IGFsc28gY2hlY2sgZm9yIHJl
dm9rZWQga3N2cyB3aXRoIHRoZSBjb3JlDQo+PiBoZWxwZXIuIEF0IGxlYXN0IG9uIHNvbWUgcGxh
dGZvcm1zIG9ubHkgdGhlIGNvcmUgaGVscGVyIG1pZ2h0IGhhdmUgdGhlDQo+PiB1cGRhdGVkIHJl
dm9rZSBsaXN0Lg0KPj4NCg0KSSB0aGluayBpdCdzIGFuIGVpdGhlci9vci4gRWl0aGVyIHdlIHVz
ZSBhbiBIRENQIGltcGxlbWVudGF0aW9uIHRoYXQncw0KZnVsbHkgcnVubmluZyBpbiB4ODYga2Vy
bmVsIHNwYWNlIChzdGlsbCBub3Qgc3VyZSBob3cgdGhhdCdzIGNvbXBsaWFudCkNCm9yIHdlIGZ1
bGx5IHJlbHkgb24gb3VyIFBTUCBGVyB0byBkbyB3aGF0IGl0J3MgZGVzaWduZWQgdG8gZG8uIEkg
ZG9uJ3QNCnRoaW5rIGl0IG1ha2VzIHNlbnNlIHRvIG1peCBhbmQgbWF0Y2ggaGVyZS4NCg0KPj4+
IEZvciB0aGUgZGVmaW5lcyBJIHdpbGwgY3JlYXRlIHBhdGNoZXMgdG8gdXNlIGRybV9oZGNwIHdo
ZXJlIGl0IGlzIHVzYWJsZS4NCj4+DQo+PiBUaGFua3MgYSBsb3QuIEltZSBvbmNlIHdlIGhhdmUg
c2hhcmVkIGRlZmluaXRpb25zIGl0J3MgbXVjaCBlYXNpZXIgdG8NCj4+IGFsc28gc2hhcmUgc29t
ZSBoZWxwZXJzLCB3aGVyZSBpdCBtYWtlcyBzZW5zZS4NCj4+DQo+PiBBc2lkZSBJIHRoaW5rIHRo
ZSBoZGNwIGNvZGUgY291bGQgYWxzbyB1c2UgYSBiaXQgb2YgZGVtaWRsYXllcmluZy4gQXQNCj4+
IGxlYXN0IEknbSBub3QgdW5kZXJzdGFuZGluZyB3aHkgeW91IGFkZCBhIDJuZCBhYnN0cmFjdGlv
biBsYXllciBmb3INCj4+IGkyYy9kcGNkLCBkbV9oZWxwZXIgYWxyZWFkeSBoYXMgdGhhdC4gVGhh
dCBzZWVtcyBsaWtlIG9uZSBhYnN0cmFjdGlvbg0KPj4gbGF5ZXIgdG9vIG11Y2guDQo+IA0KPiBJ
IGhhdmVuJ3Qgc2VlbiBhbnl0aGluZyBmbHkgYnkgb3IgaW4gdGhlIGxhdGVzdCBwdWxsIHJlcXVl
c3QgLi4uIHlvdQ0KPiBmb2xrcyBzdGlsbCB3b3JraW5nIG9uIHRoaXMgb3IgbW9yZSBwdXQgb24g
dGhlICJtYXliZSwgcHJvYmFibHkgbmV2ZXIiDQo+IHBpbGU/DQo+IA0KDQpGb2xsb3dpbmcgdXAg
d2l0aCBCaGF3YW4uDQoNCkhhcnJ5DQoNCj4gLURhbmllbA0KPiANCj4gDQo+PiAtRGFuaWVsDQo+
Pg0KPj4+DQo+Pj4NCj4+PiBCaGF3YW4NCj4+Pg0KPj4+IE9uIDIwMTktMTAtMDkgMjo0MyBwLm0u
LCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPj4+PiBPbiBXZWQsIE9jdCA5LCAyMDE5IGF0IDg6MjMg
UE0gTGFraGEsIEJoYXdhbnByZWV0DQo+Pj4+IDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPiB3
cm90ZToNCj4+Pj4+IEhpLA0KPj4+Pj4NCj4+Pj4+IFRoZSByZWFzb24gd2UgZG9uJ3QgdXNlIGRy
bV9oZGNwIGlzIGJlY2F1c2Ugb3VyIHBvbGljeSBpcyB0byBkbyBoZGNwDQo+Pj4+PiB2ZXJpZmlj
YXRpb24gdXNpbmcgUFNQL0hXIChvbmJvYXJkIHNlY3VyZSBwcm9jZXNzb3IpLg0KPj4+PiBpOTE1
IGFsc28gdXNlcyBodyB0byBhdXRoLCB3ZSBzdGlsbCB1c2UgdGhlIHBhcnRzIGZyb20gZHJtX2hk
Y3AgLi4uDQo+Pj4+IERpZCB5b3UgYWN0dWFsbHkgbG9vayBhdCB3aGF0J3MgaW4gdGhlcmU/IEl0
J3MgZXNzZW50aWFsbHkganVzdCBzaGFyZWQNCj4+Pj4gZGVmaW5lcyBhbmQgZGF0YSBzdHJ1Y3R1
cmVzIGZyb20gdGhlIHN0YW5kYXJkLCBwbHVzIGEgZmV3IG1pbmltYWwNCj4+Pj4gaGVscGVycyB0
byBlbi9kZWNvZGUgc29tZSBiaXRzLiBKdXN0IGZyb20gYSBxdWljayByZWFkIHRoZSBlbnRpcmUN
Cj4+Pj4gcGF0Y2ggdmVyeSBtdWNoIGxvb2tzIGxpa2UgbWlkbGF5ZXIgZXZlcnl3aGVyZSBkZXNp
Z24gdGhhdCB3ZQ0KPj4+PiBkaXNjdXNzZWQgYmFjayB3aGVuIERDIGxhbmRlZCAuLi4NCj4+Pj4g
LURhbmllbA0KPj4+Pg0KPj4+Pj4gQmhhd2FuDQo+Pj4+Pg0KPj4+Pj4gT24gMjAxOS0xMC0wOSAx
MjozMiBwLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPj4+Pj4+IE9uIFRodSwgT2N0IDAzLCAy
MDE5IGF0IDExOjA4OjAzUE0gKzAxMDAsIENvbGluIElhbiBLaW5nIHdyb3RlOg0KPj4+Pj4+PiBI
aSwNCj4+Pj4+Pj4NCj4+Pj4+Pj4gU3RhdGljIGFuYWx5c2lzIHdpdGggQ292ZXJpdHkgaGFzIGRl
dGVjdGVkIGEgcG90ZW50aWFsIGlzc3VlIHdpdGgNCj4+Pj4+Pj4gZnVuY3Rpb24gdmFsaWRhdGVf
YmtzdiBpbg0KPj4+Pj4+PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNw
L2hkY3AxX2V4ZWN1dGlvbi5jIHdpdGggcmVjZW50DQo+Pj4+Pj4+IGNvbW1pdDoNCj4+Pj4+Pj4N
Cj4+Pj4+Pj4gY29tbWl0IGVkOWQ4ZTJiY2IwMDNlYzk0NjU4Y2FmZTliMWJiMzk2MGUyMTM5ZWMN
Cj4+Pj4+Pj4gQXV0aG9yOiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFAYW1k
LmNvbT4NCj4+Pj4+Pj4gRGF0ZTogICBUdWUgQXVnIDYgMTc6NTI6MDEgMjAxOSAtMDQwMA0KPj4+
Pj4+Pg0KPj4+Pj4+PiAgICAgICBkcm0vYW1kL2Rpc3BsYXk6IEFkZCBIRENQIG1vZHVsZQ0KPj4+
Pj4+IEkgdGhpbmsgdGhlIHJlYWwgcXVlc3Rpb24gaGVyZSBpcyAuLi4gd2h5IGlzIHRoaXMgbm90
IHVzaW5nIGRybV9oZGNwPw0KPj4+Pj4+IC1EYW5pZWwNCj4+Pj4+Pg0KPj4+Pj4+PiBUaGUgYW5h
bHlzaXMgaXMgYXMgZm9sbG93czoNCj4+Pj4+Pj4NCj4+Pj4+Pj4gICAgMjggc3RhdGljIGlubGlu
ZSBlbnVtIG1vZF9oZGNwX3N0YXR1cyB2YWxpZGF0ZV9ia3N2KHN0cnVjdCBtb2RfaGRjcCAqaGRj
cCkNCj4+Pj4+Pj4gICAgMjkgew0KPj4+Pj4+Pg0KPj4+Pj4+PiBDSUQgODk4NTIgKCMxIG9mIDEp
OiBPdXQtb2YtYm91bmRzIHJlYWQgKE9WRVJSVU4pDQo+Pj4+Pj4+DQo+Pj4+Pj4+IDEuIG92ZXJy
dW4tbG9jYWw6DQo+Pj4+Pj4+IE92ZXJydW5uaW5nIGFycmF5IG9mIDUgYnl0ZXMgYXQgYnl0ZSBv
ZmZzZXQgNyBieSBkZXJlZmVyZW5jaW5nIHBvaW50ZXINCj4+Pj4+Pj4gKHVpbnQ2NF90ICopaGRj
cC0+YXV0aC5tc2cuaGRjcDEuYmtzdi4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gICAgMzAgICAgICAgIHVp
bnQ2NF90IG4gPSAqKHVpbnQ2NF90ICopaGRjcC0+YXV0aC5tc2cuaGRjcDEuYmtzdjsNCj4+Pj4+
Pj4gICAgMzEgICAgICAgIHVpbnQ4X3QgY291bnQgPSAwOw0KPj4+Pj4+PiAgICAzMg0KPj4+Pj4+
PiAgICAzMyAgICAgICAgd2hpbGUgKG4pIHsNCj4+Pj4+Pj4gICAgMzQgICAgICAgICAgICAgICAg
Y291bnQrKzsNCj4+Pj4+Pj4gICAgMzUgICAgICAgICAgICAgICAgbiAmPSAobiAtIDEpOw0KPj4+
Pj4+PiAgICAzNiAgICAgICAgfQ0KPj4+Pj4+Pg0KPj4+Pj4+PiBoZGNwLT5hdXRoLm1zZy5oZGNw
MS5ia3N2IGlzIGFuIGFycmF5IG9mIDUgdWludDhfdCBhcyBkZWZpbmVkIGluDQo+Pj4+Pj4+IGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcC5oIGFzIGZvbGxvd3M6
DQo+Pj4+Pj4+DQo+Pj4+Pj4+IHN0cnVjdCBtb2RfaGRjcF9tZXNzYWdlX2hkY3AxIHsNCj4+Pj4+
Pj4gICAgICAgICAgIHVpbnQ4X3QgICAgICAgICBhbls4XTsNCj4+Pj4+Pj4gICAgICAgICAgIHVp
bnQ4X3QgICAgICAgICBha3N2WzVdOw0KPj4+Pj4+PiAgICAgICAgICAgdWludDhfdCAgICAgICAg
IGFpbmZvOw0KPj4+Pj4+PiAgICAgICAgICAgdWludDhfdCAgICAgICAgIGJrc3ZbNV07DQo+Pj4+
Pj4+ICAgICAgICAgICB1aW50MTZfdCAgICAgICAgcjBwOw0KPj4+Pj4+PiAgICAgICAgICAgdWlu
dDhfdCAgICAgICAgIGJjYXBzOw0KPj4+Pj4+PiAgICAgICAgICAgdWludDE2X3QgICAgICAgIGJz
dGF0dXM7DQo+Pj4+Pj4+ICAgICAgICAgICB1aW50OF90ICAgICAgICAga3N2bGlzdFs2MzVdOw0K
Pj4+Pj4+PiAgICAgICAgICAgdWludDE2X3QgICAgICAgIGtzdmxpc3Rfc2l6ZTsNCj4+Pj4+Pj4g
ICAgICAgICAgIHVpbnQ4X3QgICAgICAgICB2cFsyMF07DQo+Pj4+Pj4+DQo+Pj4+Pj4+ICAgICAg
ICAgICB1aW50MTZfdCAgICAgICAgYmluZm9fZHA7DQo+Pj4+Pj4+IH07DQo+Pj4+Pj4+DQo+Pj4+
Pj4+IHZhcmlhYmxlIG4gaXMgZ29pbmcgdG8gY29udGFpbiB0aGUgY29udGFpbnMgb2YgcjBwIGFu
ZCBiY2Fwcy4gSSdtIG5vdA0KPj4+Pj4+PiBzdXJlIGlmIHRoYXQgaXMgaW50ZW50aW9uYWwuIElm
IG5vdCwgdGhlbiB0aGUgY291bnQgaXMgZ29pbmcgdG8gYmUNCj4+Pj4+Pj4gaW5jb3JyZWN0IGlm
IHRoZXNlIGFyZSBub24temVyby4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gQ29saW4NCj4+Pj4+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+Pj4+PiBkcmktZGV2
ZWwgbWFpbGluZyBsaXN0DQo+Pj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+
Pj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA0KPj4+Pg0KPj4+Pg0KPj4NCj4+DQo+Pg0KPj4gLS0NCj4+IERhbmllbCBWZXR0ZXINCj4+
IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbg0KPj4gKzQxICgwKSA3OSAzNjUg
NTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaA0KPiANCj4gDQo+IA0KPiAtLQ0KPiBEYW5pZWwg
VmV0dGVyDQo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbg0KPiArNDEgKDAp
IDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoDQo+IA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

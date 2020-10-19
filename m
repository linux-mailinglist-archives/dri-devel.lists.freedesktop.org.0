Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F368B2922EB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 09:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164836E8DE;
	Mon, 19 Oct 2020 07:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310135.outbound.protection.outlook.com [40.107.131.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300266E8DE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 07:21:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oakym9bjR2ZjdliIdSRJNvVn5UUdMtdBIuHWvWfFQaVTrMMxJt8W5OqxuuYuUDSJfn2cZQAGeYtK4WxBu5FX2hNg/NESG27pyKAkz05qcxoK8hRWVhVpBuGhqLowTq6Mymn1i4sj2ow3lUPonM8ZCTsEF1biM5R96KBliHf0SRDa7yV/oHU5z5+av/bjdNweFQh+UNoPe2c6DaDocaNlmkpXWR5Z6FHMGvXaH9ea4z12BiveVp6VMgdcn6ePBU/VqwWeE6uz3puE/ClifUtSSY9HRuEb6PbZrzSisnByxT43DwemyitwAulVbiBCOxpD+lBPjl+TNxmnmRrRM5bAFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQI11epW5hKiO9t+QD8ZVYiHRDd+hfgmqoLLztkgSJ4=;
 b=Tjr5hI+XR+OYTDPzkj6o+kYktPibCHaxphlyl/xtH3oGe+DscLVSfJC5AB8EXjVI1ndUXdQmrcXDoXbCTHwkfUH2KTpMfvzc+18h0SNBDHqFB1Q+QNxKc4eMKF4J5CBMLZ/RhRcHjVU0txqyvktIqaBOuxU6i3CWs89GLuU/O0Ub8Kh1OlH1ufKaPbF6U7X24HqJI5ymfltxUCjHDc9k2GjsJm2gNamlhhncr+tXkcHU0LjloVE1PBW6y7iQR11MwbkbRBpV4t9GB6DFfi3WzGpnXESEJQSeGZYciVSq2oNyZwWYSqlwppWZ4boJCsyPvCk61hiblmHRMQqxwUNJOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com (2603:1096:202:34::18)
 by HK2PR06MB3298.apcprd06.prod.outlook.com (2603:1096:202:3b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Mon, 19 Oct
 2020 07:21:51 +0000
Received: from HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::9cad:b9a:3e32:d1f1]) by HK2PR06MB3300.apcprd06.prod.outlook.com
 ([fe80::9cad:b9a:3e32:d1f1%5]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 07:21:51 +0000
From: Kuo-Hsiang Chou <kuohsiang_chou@aspeedtech.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@redhat.com>
Subject: RE: [PATCH] drm/ast: Avoid to access BMC addressing when P2A is
 disabled
Thread-Topic: [PATCH] drm/ast: Avoid to access BMC addressing when P2A is
 disabled
Thread-Index: AQHWo4/Emgk+3gVG5kKcyo8g0118Hamehio0gAAAPYA=
Date: Mon, 19 Oct 2020 07:21:50 +0000
Message-ID: <HK2PR06MB330072A7FA01A098050E5B5C8C1E0@HK2PR06MB3300.apcprd06.prod.outlook.com>
References: <1602834078-1700-1-git-send-email-kuohsiang_chou@aspeedtech.com>
 <CAMwc25oC596560WUJjh8f2jfcnHjfUTW+cgf=maSMsAc83TcrQ@mail.gmail.com>
 <b1b67662-ef49-9dae-ad7c-ea5e3d58fb97@suse.de>
In-Reply-To: <b1b67662-ef49-9dae-ad7c-ea5e3d58fb97@suse.de>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=aspeedtech.com;
x-originating-ip: [211.20.114.70]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a158e16-5da6-4e1d-527e-08d873ffa5f9
x-ms-traffictypediagnostic: HK2PR06MB3298:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK2PR06MB329897A87DC807201BF7B93E8C1E0@HK2PR06MB3298.apcprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iOlgMgw+3WuR10aoGgI2vai+v+U08RyBi58dQc3WTaafhIUpnslsSFs+ifuO0R8QLsrF8eDffGy0PNHFrSQjtpfLAqmanoR0HV3F9xHyR3/E094gleZfD5jVcWPFOiqlFr2eoBF7PnNfmPLc7mwNL6wlyV+yqi7sthn9o8kPyHkaDZYbkQn5btkHlm3if6Gl/TRoEtuTq3ZgB6M6lJZcSPhmUE7on2BlzF1QyFUuFKRG2+fkaT26kaWbVFLxOi7FAMcPjAIAdJS0yHkObUfDLfU5QZhnsu2o5kt0auVl+te8DGuuOq+/jRab+8f7+FtKbYoYYS8Leszoa9NLZ8c8+Ur3RrLp6hYRFGT7Iv57W5f/rxqMfUpXIyZav3ezInGbjFRY+aUW4sdTyi55qUv3kg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3300.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(346002)(376002)(396003)(39840400004)(66574015)(71200400001)(107886003)(66446008)(66946007)(83380400001)(64756008)(55016002)(2906002)(7696005)(9686003)(76116006)(66476007)(66556008)(6506007)(53546011)(55236004)(33656002)(186003)(316002)(5660300002)(26005)(8936002)(966005)(8676002)(4326008)(478600001)(52536014)(86362001)(110136005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: JamLvuE2di8CcewhP7Nr6D5Vz6z50DzIKQfsrQ9s4lUHvWvf4oVEQVg5/L1GpXAJjcgfTRxqZbZUsAxD4Mk6X82nCgl9JwtFFVw1oBQnSHFt4DzaxY1dF6I1L6OPAybth37ymkrtj8REbKg/7OSIVXsORVpQzVHhcY54wWlOy800Kh9UjAtMMN4sIVnZLc9kue61UfEAUt0qrDt5AfmV6/KNGm7hBqFLc0bZGLuNp7EKl/XwMC5CLt4ugHuMKgVuNUoZyIA+gbuvzAPhW4lKzmkNnV8dXAidiKZVo9/2+HqoRAlYR+DZh8IkkHX3p82GCCnfdLmkcjQUvgpwI27+02IY5keJSN+GqaEUit3GUfrcv0OUx2Q6YjlbzUFb7QFgo1OPZ6wy34Usdto57huIt/+EL1jPv9l739wB+pt88C2q2WDXGhrRsPyOrFvToVPVB2nrVIm1pmN8uhMSg04+tTtdR78rvw/uLVBt7PSI9gfkXzuXNaUT/kvjW5AXwh2mg2rAW/c+CpnEmbFAv7NDgyfOml0t2l0/hvUSkv8Gii8jSQjhsb48VXD/1UR3yHNZ9gDpthqTm4RRPrmsK7qUtir7j+c9RW+c1aQBhrrpeRl5IdqxCrSg/63/8PUgXOb+OHAJlKSlTShjddws99QDJw==
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3300.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a158e16-5da6-4e1d-527e-08d873ffa5f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2020 07:21:51.0100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 53ARLSdePhOO6Rjm0U3gus/u+4e7/VQEF7u+0EHAQolX2MsABfGGZzI7f5E63WZ/lNAJ2ZobU1TOsGDgI1iftoG3qFQ1V+aV3tGaTsfCE8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR06MB3298
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
Cc: Jenmin Yuan <jenmin_yuan@aspeedtech.com>, "eich@suse.com" <eich@suse.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Arc Sung <arc_sung@aspeedtech.com>, Tommy Huang <tommy_huang@aspeedtech.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gU2lycywgDQoNClRoYW5rcyBmb3IgeW91ciBhbnN3ZXJzIGFib3V0IHRoZSBwYXRjaCBhbmQg
bmV4dCB1cHN0cmVhbSB0byBrZXJuZWwtNS45IG11c3QgZm9sbG93IHRoZXNlIHJ1bGVzLg0KDQpU
aGlzIHBhdGNoIGJhc2VkIG9uIGtlcm5lbC00LjkuMjM3IGlzIHJlcXVpcmVkIGJ5IG91ciBjdXN0
b21lcnMsIGJlY2F1c2UgbXkgY3VzdG9tZXJzIHNhaWQgdGhlIG5hdGl2ZSBrZXJuZWwgb2YgUkhF
TC9DZW50T1MgNy54IGlzIDMuMTAgYW5kIGlzIHJlcXVpcmVkIHRvIHVwZGF0ZSB0byA0LjkuDQoN
CkJUVywgaG93IHRvIHZlcmlmeSB0aGUgY29ycmVjdG5lc3MgYmVmb3JlIHVwc3RyZWFtIG15IHBh
dGNoIC4gQXMgSSBrbm93biwgdGhlIGtlcm5lbCB2ZXJzaW9uIG9mIFJIRUw4LjIgaXMgdjQuMTgs
IHNvIEkgbmVlZCB0byB1cGRhdGUgdGhlIGtlcm5lbCB0byB2NS45IGJ5IG15c2VsZiwgcmlnaHQ/
DQpPciBzaG91bGQgSSB0ZXN0IG15IHBhdGNoIG9uIEZlZG9yYS1yYXdoaWRlIHdob3NlIGtlcm5l
bCBpcyB2NS4xMC4wPw0KDQpSZWdhcmRzIGFuZCBoYXZlIGEgZ29vZCBkYXksDQoJS3VvLUhzaWFu
ZyBDaG91DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBUaG9tYXMgWmltbWVy
bWFubiBbbWFpbHRvOnR6aW1tZXJtYW5uQHN1c2UuZGVdIA0KU2VudDogTW9uZGF5LCBPY3RvYmVy
IDE5LCAyMDIwIDM6MDggUE0NClRvOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT47
IEt1by1Ic2lhbmcgQ2hvdSA8a3VvaHNpYW5nX2Nob3VAYXNwZWVkdGVjaC5jb20+DQpDYzogSmVu
bWluIFl1YW4gPGplbm1pbl95dWFuQGFzcGVlZHRlY2guY29tPjsgZWljaEBzdXNlLmNvbTsgQXJj
IFN1bmcgPGFyY19zdW5nQGFzcGVlZHRlY2guY29tPjsgZHJpLWRldmVsIDxkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnPjsgVG9tbXkgSHVhbmcgPHRvbW15X2h1YW5nQGFzcGVlZHRlY2gu
Y29tPg0KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FzdDogQXZvaWQgdG8gYWNjZXNzIEJNQyBh
ZGRyZXNzaW5nIHdoZW4gUDJBIGlzIGRpc2FibGVkDQoNCkhpDQoNCk9uIDE2LjEwLjIwIDIzOjAx
LCBEYXZpZCBBaXJsaWUgd3JvdGU6DQo+IE9uIEZyaSwgT2N0IDE2LCAyMDIwIGF0IDY6MDMgUE0g
S3VvSHNpYW5nIENob3UgDQo+IDxrdW9oc2lhbmdfY2hvdUBhc3BlZWR0ZWNoLmNvbT4gd3JvdGU6
DQo+Pg0KPj4gVGhlIHBhdGNoIGlzIHVwc3RyZWFtZWQNCj4+IDEuIEZvciBSSEVMNy54LCBiZWNh
dXNlIGl0cyBuYXRpdmUga2VybmVsIGlzIHN1Z2dlc3RlZCB0byB1cGRhdGUNCj4+ICAgIGZyb20g
My4xMCB0byA0Ljkgb24gMiBPRE0ncyBwbGF0Zm9ybS4NCj4+IDIuIEZvciBBU1QyNjAwLg0KPj4g
My4gRm9yIEFTVERQLg0KPj4gNC4gdjEuMTENCj4gDQo+IEhpLA0KPiANCj4gSSd2ZSBjYydlZCBU
aG9tYXMgd2hvIGlzIG1haW50YWluaW5nIHRoaXMgdXBzdHJlYW0sIGJ1dCB0aGlzIHBhdGNoIGlu
IA0KPiBpdCdzIGN1cnJlbnQgZm9ybSBpc24ndCBhY2NlcHRhYmxlLCBNYXliZSBUaG9tYXMgY2Fu
IHByb3ZpZGUgbW9yZSANCj4gZGV0YWlsZWQgaW5mbywgYnV0IHRoZSBiYXNpYyBydWxlcyBhcmUN
Cj4gDQo+IE9uZSBwYXRjaCBzaG91bGQgZG8gb25lIHRoaW5nLg0KPiBQYXRjaGVzIHNob3VsZCBi
ZSBiaXNlY3RhYmxlIHNvIGFueSBpc3N1ZXMgY2FuIGJlIHRyYWNrZWQgZG93biBlYXNpZXIuDQo+
IEZpeGVzIHNob3VsZCBiZSBzZXBhcmF0ZWQgZnJvbSBuZXcgY29kZS4NCj4gTmV3IGZlYXR1cmVz
IGFuZCBjaGlwIHN1cHBvcnQgc2hvdWxkIGJlIHNlcGFyYXRlLg0KPiANCj4gaHR0cHM6Ly93d3cu
a2VybmVsLm9yZy9kb2MvaHRtbC92NS45L3Byb2Nlc3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWwN
Cg0KUGxlYXNlIGZvbGxvdyB0aGlzIGRvY3VtZW50IHdoZW4gc3VibWl0dGluZyBwYXRjaGVzLg0K
DQo+IA0KPiBQbGVhc2UgbWF5YmUgd29yayB3aXRoIFRob21hcyBvbiBoYXZpbmcgYSBiZXR0ZXIg
dXBzdHJlYW0gZGV2ZWxvcG1lbnQgDQo+IHByb2Nlc3MgZm9yIGFzdCBjaGlwc2V0cy4NCg0KSSdk
IHdlbGNvbWUgbW9yZSBzdXBwb3J0IGFuZCBjb250cmlidXRpb25zIGZyb20gQXNwZWVkIGRldmVs
b3BlcnMuIEJ1dCBpbiBpdHMgY3VycmVudCBmb3JtLCB0aGUgcGF0Y2ggaXMgbm90IGFjY2VwdGFi
bGUuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFRoYW5rcywNCj4gRGF2ZS4NCj4g
DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA0KPiANCg0KLS0NClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jD
pGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==

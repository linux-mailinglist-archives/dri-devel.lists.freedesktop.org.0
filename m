Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED9BEFF81
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 15:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC6896E082;
	Tue,  5 Nov 2019 14:17:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720051.outbound.protection.outlook.com [40.107.72.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96C7C6E082;
 Tue,  5 Nov 2019 14:17:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vg3ZbR0pLTdV2dzbXJGzJEBxQoZNq+43In3DPHwarT89m2TJ7r3aGLzQARsuNo8sPzSTy78ugWSlk/qreDpHR5cEGtUxBT8M3HMMNIouePPeKBqdeO8yjRsPQI6doCjR9+pK7vMtZnwn1ZnmYH2Q2MR0rTRS7gZDKXdIphFmszcE2+S85OMiw68s4xsbF0ha76Q0W5Izsf7/ClTWPSZHVHV8A54a2vsvk2cGqd8z8V5PT0Vhqb/aLg4J3ELcj+YLbhqSk6pHLRGSm43tdH9NSrr4+HALgdG5qXJVMsjdTS2zBrIFeqS67fwnjwOs89rW7Ok1PrxK9SqJ0j5rSK8zEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itT3CKCM5EvTp57Ko8PVHE34w5Te4Y/NH1LqEgLAziA=;
 b=KxrhoNeXFmlEKAQ4cKHWyj2qquS6cfw48p5z0q04X3bVVlbn3vPCwtAm8CkuB6i4L5/CdLGRdCaZlpwEhIDhr4A2Ws9xbvgB61Xiqy0qw/tkvg1/dSlZ6Px0ZRR6ds5Ac/tPAQCDOEux8xpWSPNggzAd9s/AZnVXSc7/ellGWJam3CJlpCRSkkqXzcHE0KBHN9mP7A4NLCXCeHxtm+wX0POknlM8RwiL4N/fknT3h5hjSwDZVE4Jb99dkO0IccY1+l46PmrwTqliSnczTUFC0J/Yi+sNp19hSorLyxy6LRSXvWXIcLY0woKi9hGfz7qAGOmQemiEVEuubRznr2KIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com (10.172.79.7) by
 CY4PR1201MB0006.namprd12.prod.outlook.com (10.172.117.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Tue, 5 Nov 2019 14:17:44 +0000
Received: from CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::449d:52a8:2761:9195]) by CY4PR1201MB0230.namprd12.prod.outlook.com
 ([fe80::449d:52a8:2761:9195%5]) with mapi id 15.20.2430.020; Tue, 5 Nov 2019
 14:17:44 +0000
From: Harry Wentland <hwentlan@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexdeucher@gmail.com>
Subject: Re: drm/amd/display: Add HDCP module - static analysis bug report
Thread-Topic: drm/amd/display: Add HDCP module - static analysis bug report
Thread-Index: AQHVejcKu6zIikeYPUy9tenpH2XnMKdSieGAgAAe+QCAAAW8AIAAIk+AgAADVYCAKDNugIAAS26AgAAZqICAAAL/AIAABUgAgAFGJYCAAAZZAIAAEaEA
Date: Tue, 5 Nov 2019 14:17:44 +0000
Message-ID: <75a77843-7c2d-9e74-b508-5df000a9b646@amd.com>
References: <951eb7dc-bebe-5049-4998-f199e18b0bf3@canonical.com>
 <20191009163235.GT16989@phenom.ffwll.local>
 <a0d5f3a3-a2b3-5367-42f9-bde514571e25@amd.com>
 <CAKMK7uEtJRDhibWDv2TB2WrFzFooMWPSbveDD2N-rudAwvzVFA@mail.gmail.com>
 <c8f96b46-e81e-1e41-aafc-5f6ec236d66f@amd.com>
 <CAKMK7uHr3aeJRqJAscDDfsuBBnVXCeN9SS36-1UGuK84NyOD5Q@mail.gmail.com>
 <CAKMK7uH6EoY9MkzjSjU+Fe=E-XB4Tf9d2VsW=Tr=tFy1J-dJgg@mail.gmail.com>
 <53bf910b-5f9c-946b-17ee-602c24c0fa96@amd.com>
 <20191104165457.GH10326@phenom.ffwll.local>
 <CADnq5_PxMQ_AkBCHXU_YUAMWaPcH-nkOJNGNKnUOJWSTYV6X+A@mail.gmail.com>
 <20191104172434.GJ10326@phenom.ffwll.local>
 <CADnq5_NUAfeWscsnj07MpReM3LNwHPSPq3pQDe0waMi4OCatUg@mail.gmail.com>
 <CAKMK7uGPuYcPf+e_AL1PrH8Croydg3JcBNORCNAFgj4E72EtZQ@mail.gmail.com>
In-Reply-To: <CAKMK7uGPuYcPf+e_AL1PrH8Croydg3JcBNORCNAFgj4E72EtZQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
x-clientproxiedby: YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::29) To CY4PR1201MB0230.namprd12.prod.outlook.com
 (2603:10b6:910:1e::7)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d4beedd3-ad83-45ec-235b-08d761faecf4
x-ms-traffictypediagnostic: CY4PR1201MB0006:
x-ms-exchange-purlcount: 3
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR1201MB00064095205C42E4DE72F4AE8C7E0@CY4PR1201MB0006.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(189003)(199004)(8676002)(81166006)(66446008)(66946007)(2616005)(36756003)(6506007)(316002)(587094005)(26005)(31696002)(478600001)(256004)(305945005)(11346002)(64756008)(6486002)(3846002)(6306002)(6116002)(4326008)(14454004)(7736002)(31686004)(66066001)(53546011)(25786009)(8936002)(6246003)(65956001)(71190400001)(386003)(186003)(99286004)(14444005)(81156014)(102836004)(66556008)(110136005)(5660300002)(58126008)(54906003)(966005)(486006)(52116002)(65806001)(476003)(2906002)(71200400001)(6512007)(229853002)(6436002)(76176011)(446003)(66476007)(66574012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR1201MB0006;
 H:CY4PR1201MB0230.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JpuPwpXn7MGbZ+q/VZ4AjE4yD9oaheRHm4N5VuyMI/bHyIU8DiahRSto81zRDpINXDNvS3OVUuMqL1q9WgZ2ipEJBteNOLp/mYcD1Xx0EgIFyLtm0Ojdu8bitV8wEs0r40Zcs7Gk4UPhQkQGi7m5rOx2yvYlH9Z34OCurDxp/K8jwvN5NJPFxzCnHY+uJGcCKEwywxgZBm5Lw3kmTPU+I0QdkkTz+9+CLhjNn8wlXABx+M8XCP7y2uOwYqFu05GgBkFZFfITfmyJbbFzYR/KXMWD7AO+i/QiEGbIFphWy0l8McSmUISSYZIQged7j59E9/Ln+ZL87qEYuq4n7007T/u+z6q1RSK3hibJn/kIjAJh/WHrM/mh5nGC5jd1/wjpafdXgzUDBtRbR3/SRv52+ilwvsvSsHHMKhZhNKXByhpRZ3kFL/IpeSkxEv2Zbo3vK+l2Ga8GeuJCGQU33QlBP4wzg6Ds90QDVtxGkYKXM0M=
Content-ID: <536B5E0FBF030547AB98BF89EC672C5C@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4beedd3-ad83-45ec-235b-08d761faecf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 14:17:44.4384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MGIEur4DLIUruXQBmL+SWxCt5AAErUxDCo59wPGqPrYvImPvoEf4f5J4o6IE+rpDX5yoCntR2pPcqS0bJ/httw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0006
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itT3CKCM5EvTp57Ko8PVHE34w5Te4Y/NH1LqEgLAziA=;
 b=tucQSq6S0PXHW+ErkdzdZJGZ1VsrM/1phc9iVf0cBhkyxmIYw1lVpXzCU+BJdMBpgpb0p2fAzMaPXC+3BYoV7UExMIZw1GkqIqZTEm5fKEYxuWCPOEnqAgSK70R9kbldqcMo8l6OdO3xzW6+JYbqdJNccmPbFW/XbvmXSiZryVs=
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
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

DQoNCk9uIDIwMTktMTEtMDUgODoxNCBhLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPiBPbiBU
dWUsIE5vdiA1LCAyMDE5IGF0IDE6NTIgUE0gQWxleCBEZXVjaGVyIDxhbGV4ZGV1Y2hlckBnbWFp
bC5jb20+IHdyb3RlOg0KPj4NCj4+IE9uIE1vbiwgTm92IDQsIDIwMTkgYXQgMTI6MjQgUE0gRGFu
aWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90ZToNCj4+Pg0KPj4+IE9uIE1vbiwgTm92
IDA0LCAyMDE5IGF0IDEyOjA1OjQwUE0gLTA1MDAsIEFsZXggRGV1Y2hlciB3cm90ZToNCj4+Pj4g
T24gTW9uLCBOb3YgNCwgMjAxOSBhdCAxMTo1NSBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOg0KPj4+Pj4NCj4+Pj4+IE9uIE1vbiwgTm92IDA0LCAyMDE5IGF0IDAzOjIz
OjA5UE0gKzAwMDAsIEhhcnJ5IFdlbnRsYW5kIHdyb3RlOg0KPj4+Pj4+IE9uIDIwMTktMTEtMDQg
NTo1MyBhLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPj4+Pj4+PiBPbiBXZWQsIE9jdCA5LCAy
MDE5IGF0IDEwOjU4IFBNIERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4gd3JvdGU6DQo+
Pj4+Pj4+PiBPbiBXZWQsIE9jdCA5LCAyMDE5IGF0IDEwOjQ2IFBNIExha2hhLCBCaGF3YW5wcmVl
dA0KPj4+Pj4+Pj4gPEJoYXdhbnByZWV0Lkxha2hhQGFtZC5jb20+IHdyb3RlOg0KPj4+Pj4+Pj4+
DQo+Pj4+Pj4+Pj4gSSBtaXN1bmRlcnN0b29kIGFuZCB3YXMgdGFsa2luZyBhYm91dCB0aGUga3N2
IHZhbGlkYXRpb24gc3BlY2lmaWNhbGx5DQo+Pj4+Pj4+Pj4gKHVzYWdlIG9mIGRybV9oZGNwX2No
ZWNrX2tzdnNfcmV2b2tlZCgpKS4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBIbSBmb3IgdGhhdCBzcGVj
aWZpY2FsbHkgSSB0aGluayB5b3Ugd2FudCB0byBkbyBib3RoLCBpLmUuIGJvdGgNCj4+Pj4+Pj4+
IGNvbnN1bHQgeW91ciBwc3AsIGJ1dCBhbHNvIGNoZWNrIGZvciByZXZva2VkIGtzdnMgd2l0aCB0
aGUgY29yZQ0KPj4+Pj4+Pj4gaGVscGVyLiBBdCBsZWFzdCBvbiBzb21lIHBsYXRmb3JtcyBvbmx5
IHRoZSBjb3JlIGhlbHBlciBtaWdodCBoYXZlIHRoZQ0KPj4+Pj4+Pj4gdXBkYXRlZCByZXZva2Ug
bGlzdC4NCj4+Pj4+Pj4+DQo+Pj4+Pj4NCj4+Pj4+PiBJIHRoaW5rIGl0J3MgYW4gZWl0aGVyL29y
LiBFaXRoZXIgd2UgdXNlIGFuIEhEQ1AgaW1wbGVtZW50YXRpb24gdGhhdCdzDQo+Pj4+Pj4gZnVs
bHkgcnVubmluZyBpbiB4ODYga2VybmVsIHNwYWNlIChzdGlsbCBub3Qgc3VyZSBob3cgdGhhdCdz
IGNvbXBsaWFudCkNCj4+Pj4+PiBvciB3ZSBmdWxseSByZWx5IG9uIG91ciBQU1AgRlcgdG8gZG8g
d2hhdCBpdCdzIGRlc2lnbmVkIHRvIGRvLiBJIGRvbid0DQo+Pj4+Pj4gdGhpbmsgaXQgbWFrZXMg
c2Vuc2UgdG8gbWl4IGFuZCBtYXRjaCBoZXJlLg0KPj4+Pj4NCj4+Pj4+IFRoZW4geW91IG5lZWQg
dG8gc29tZWhvdyB0aWUgdGhlIHJldm9rZSBsaXN0IHRoYXQncyBpbiB0aGUgcHNwIHRvIHRoZQ0K
Pj4+Pj4gcmV2b2tlIGxpc3QgdXBkYXRlIGxvZ2ljIHdlIGhhdmUuIFRoYXQncyB3aGF0IHdlJ3Zl
IGRvbmUgZm9yIGhkY3AyICh3aGljaA0KPj4+Pj4gaXMgc2ltaWxhcmx5IHRvIHlvdXJzIGltcGxl
bWVudGVkIGluIGh3KS4gVGhlIHBvaW50IGlzIHRoYXQgb24gbGludXggd2UNCj4+Pj4+IG5vdyBo
YXZlIGEgc3RhbmRhcmQgd2F5IHRvIGdldCB0aGVzZSByZXZva2UgbGlzdHMgdXBkYXRlZC9oYW5k
bGVkLg0KPj4+Pj4NCj4+Pj4+IEkgZ3Vlc3MgaXQgd2Fzbid0IGNsZWFyIGhvdyBleGFjdGx5IEkg
dGhpbmsgeW91J3JlIHN1cHBvc2VkIHRvIGNvbWJpbmUNCj4+Pj4+IHRoZW0/DQo+Pj4+DQo+Pj4+
IFRoZXJlJ3Mgbm8gZHJpdmVyIHN3IHJlcXVpcmVkIGF0IGFsbCBmb3Igb3VyIGltcGxlbWVudGF0
aW9uIGFuZCBhcyBmYXINCj4+Pj4gYXMgSSBrbm93LCBIRENQIDIueCByZXF1aXJlcyB0aGF0IGFs
bCBvZiB0aGUga2V5IHJldm9rZSBoYW5kbGluZyBiZQ0KPj4+PiBoYW5kbGVkIGluIGEgc2VjdXJl
IHByb2Nlc3NvciByYXRoZXIgdGhhbiB0aGFuIG9uIHRoZSBob3N0IHByb2Nlc3NvciwNCj4+Pj4g
c28gSSdtIG5vdCBzdXJlIGhvdyB3ZSBtYWtlIHVzZSBpZiBpdC4gIEFsbCB0aGUgZHJpdmVyIHN3
IGlzDQo+Pj4+IHJlc3BvbnNpYmxlIGZvciBkb2luZyBpcyBzYXZpbmcvcmVzdG9yaW5nIHRoZSBw
b3RlbnRpYWxseSB1cGRhdGVkIHNybQ0KPj4+PiBhdCBzdXNwZW5kL3Jlc3VtZS9ldGMuDQo+Pj4N
Cj4+PiBVaCwgeW91IGRvbid0IGhhdmUgYSBwZXJtYW5lbnQgc3RvcmUgb24gdGhlIGNoaXA/IEkg
dGhvdWdodCBhbm90aGVyDQo+Pj4gcmVxdWlyZW1lbnQgaXMgdGhhdCB5b3UgY2FuJ3QgZG93bmdy
YWRlLg0KPj4NCj4+IFJpZ2h0LiAgVGhhdCdzIHdoeSB0aGUgZHJpdmVyIGhhcyB0byBzYXZlIGFu
ZCByZXN0b3JlIHRoZSBzcm0gd2hlbiB0aGUNCj4+IEdQVSBpcyBwb3dlcmVkIGRvd24uICBJIGd1
ZXNzIHRoYXQgcGFydCBjYW4gYmUgZG9uZSBieSB0aGUgaG9zdA0KPj4gcHJvY2Vzc29yIGFzIGxv
bmcgYXMgdGhlIHNybSBpcyBzaWduZWQgcHJvcGVybHkuDQo+Pg0KPj4+DQo+Pj4gQW5kIGZvciBo
dyBzb2x1dGlvbnMgYWxsIHlvdSBkbyB3aXRoIHRoZSB1cGRhdGVkIHJldm9rZSBjZXJ0IGlzIHN0
dWZmIGl0DQo+Pj4gaW50byB0aGUgaHcsIGl0J3MgcHVyZWx5IGZvciB1cGRhdGluZyBpdC4gQW5k
IHRob3NlIHVwZGF0ZXMgbmVlZCB0byBjb21lDQo+Pj4gZnJvbSBzb21ld2hlcmUgZWxzZSAodXN1
YWxseSBpbiB0aGUgbWVkaWEgeW91IHBsYXkpLCB0aGUga2VybmVsIGNhbid0DQo+Pj4gZmV0Y2gg
dGhlbSBvdmVyIHRoZSBpbnRlcm5ldCBpdHNlbGYuIEkgdGhvdWdodCB3ZSBhbHJlYWR5IGhhZCB0
aGUgZnVuY3Rpb24NCj4+PiB0byBnaXZlIHlvdSB0aGUgc3JtIGRpcmVjdGx5IHNvIHlvdSBjYW4g
c3R1ZmYgaXQgaW50byB0aGUgaHcsIGJ1dCBsb29rcw0KPj4+IGxpa2UgdGhhdCBwYXJ0IGlzbid0
IHRoZXJlICh5ZXQpLg0KPj4NCj4+IElJUkMsIHRoZSByZXZva2Ugc3R1ZmYgZ2V0cyBnbGVhbmVk
IGZyb20gdGhlIHN0cmVhbSBieSB0aGUgc2VjdXJlDQo+PiBwcm9jZXNzb3Igc29tZWhvdyB3aGVu
IHlvdSBwbGF5IGJhY2sgc2VjdXJlIGNvbnRlbnQuICBJJ20gbm90IGVudGlyZWx5DQo+PiBjbGVh
ciBvbiB0aGUgZGV0YWlscywgYnV0IGZyb20gdGhlIGRlc2lnbiwgdGhlIGRyaXZlciBkb2Vzbid0
IGhhdmUgdG8NCj4+IGRvIGFueXRoaW5nIGluIG91ciBjYXNlIG90aGVyIHRoYW4gc2F2aW5nIGFu
ZCByZXN0b3JpbmcgdGhlIHNybSBmcm9tDQo+PiB0aGUgc2VjdXJlIHByb2Nlc3Nvci4NCj4gDQo+
IEhtLCBpcyB0aGF0IGltcGxlbWVudGVkIGluIG9wZW4gdXNlcnNwYWNlIHNvbWV3aGVyZT8gdGJo
IEkgZG9uJ3Qga25vdw0KPiB3aGV0aGVyIHRoZSBzcm0gaXMgaW4gdGhlIGJpdHN0cmVhbSBvciBz
b21ld2hlcmUgZWxzZSBpbiB0aGUgZmlsZQ0KPiAodGhleSdyZSBhbGwgY29udGFpbmVycyB3aXRo
IGxvdHMgb2Ygc3R1ZmYpLCBidXQgdGhlIGN1cnJlbnQgdXBzdHJlYW0NCj4gaGRjcCBzdHVmZiBp
cyBkb25lIHVuZGVyIHRoZSBhc3N1bXB0aW9uIHRoYXQgdXNlcnNwYWNlIHN0aWxsIGRvZXMgdGhl
DQo+IGRlY3J5cHRpbmcgKHNvIG9ubHkgdGhlIGxvd2VzdCBjb250ZW50IHByb3RlY3Rpb24gbGV2
ZWwgc3VwcG9ydGVkDQo+IHJpZ2h0IG5vdykuIEhlbmNlIHRoZSBleHBsaWNpdCBzdGVwIHRvIHVw
ZGF0ZSB0aGUga2VybmVsIG9uIHRoZSBsYXRlc3QNCj4gc3JtLCB3aGljaCB0aGUga2VybmVsIGNh
biB0aGVuIHVzZSB0byBlaXRoZXIgY2hlY2sgZm9yIHJldm9rZXMgb3IgaGFuZA0KPiB0byB0aGUg
aGFyZHdhcmUuDQo+IC1EYW5pZWwNCj4gDQoNCk5vdCBzdXJlIEkgZm9sbG93IHlvdXIgcXVlc3Rp
b25zIGFib3V0IHdoZXRoZXIgdGhpcyBpcyBpbXBsZW1lbnRlZCBpbg0Kb3BlbiB1c2Vyc3BhY2Uu
DQoNClRoZSBTUk0gaXMgcHJvdmlkZWQgdG8gUFNQIChvdXIgc2VjdXJlIHByb2Nlc3NvcikgdGhy
b3VnaCBvdGhlcg0KaW50ZXJmYWNlcy4gSSdtIGN1cnJlbnRseSBub3Qgc3VyZSB3aGV0aGVyIHRo
YXQncyBkaXJlY3RseSBmcm9tIHRoZQ0KYml0c3RyZWFtIG9yIGFub3RoZXIgaW50ZXJmYWNlIGZy
b20gdGhlIHNlY3VyZSB1c2Vyc3BhY2UgdGhhdCdzIGhhbmRsaW5nDQpjb250ZW50IHByb3RlY3Rp
b24gKGUuZy4gT0VNQ3J5cHRvIG9yIHNpbWlsYXIpLg0KDQpUaGUga2V5IGZvciBIRENQIFNSTSBo
YW5kbGluZyBpcyB0aGF0IFBTUCBkb2Vzbid0IGhhdmUgYSBwZXJtYW5lbnQgc3RvcmUNCm9uIHRo
ZSBjaGlwIGFuZCBuZWVkcyB1cyB0byBoYW5kbGUgdGhlIHNhdmUgYW5kIHJlc3RvcmUgYXQNCmJv
b3Qvc2h1dGRvd24vc3VzcGVuZC9yZXN1bWUuIFRoaW5rIG9mIGl0IGFzIGFuIGluaXRpYWxpemF0
aW9uIGFuZA0KdGVhcmRvd24gc3RlcCBvZiBQU1AuDQoNClRoZSBpZGVhIGlzIHRvIHByb3ZpZGUg
YW4gYW1kZ3B1IGRldmljZS1zcGVjaWZpYyBzeXNmcyB0aGF0J3MgdXNlZCB0bw0Kc2F2ZS9yZXN0
b3JlIHRoZSBTUk0gd2l0aG91dCBhbnkgaGFuZGxpbmcgaW4gdGhlIGtlcm5lbCAodW5saWtlIHRo
ZSB3b3JrDQpkb25lIGJ5IFJhbWFsaW5nYW0gdG8gZG8gdGhlIHJldm9jYXRpb24gY2hlY2sgaW4g
RFJNKS4gVGhpcyBzeXNmcyB3aWxsDQpiZSBjYWxsZWQgYnkgYSBzaW1wbGUgaW5pdCBzY3JpcHQg
dG8gc3RvcmUgYW5kIHJlYWQgdGhlIFNSTSBmcm9tIGRpc2suDQoNCkhhcnJ5DQoNCj4+IEFsZXgN
Cj4+DQo+Pj4gLURhbmllbA0KPj4+DQo+Pj4+DQo+Pj4+IEFsZXgNCj4+Pj4NCj4+Pj4+IC1EYW5p
ZWwNCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4+DQo+Pj4+Pj4+Pj4gRm9yIHRoZSBkZWZpbmVzIEkgd2ls
bCBjcmVhdGUgcGF0Y2hlcyB0byB1c2UgZHJtX2hkY3Agd2hlcmUgaXQgaXMgdXNhYmxlLg0KPj4+
Pj4+Pj4NCj4+Pj4+Pj4+IFRoYW5rcyBhIGxvdC4gSW1lIG9uY2Ugd2UgaGF2ZSBzaGFyZWQgZGVm
aW5pdGlvbnMgaXQncyBtdWNoIGVhc2llciB0bw0KPj4+Pj4+Pj4gYWxzbyBzaGFyZSBzb21lIGhl
bHBlcnMsIHdoZXJlIGl0IG1ha2VzIHNlbnNlLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEFzaWRlIEkg
dGhpbmsgdGhlIGhkY3AgY29kZSBjb3VsZCBhbHNvIHVzZSBhIGJpdCBvZiBkZW1pZGxheWVyaW5n
LiBBdA0KPj4+Pj4+Pj4gbGVhc3QgSSdtIG5vdCB1bmRlcnN0YW5kaW5nIHdoeSB5b3UgYWRkIGEg
Mm5kIGFic3RyYWN0aW9uIGxheWVyIGZvcg0KPj4+Pj4+Pj4gaTJjL2RwY2QsIGRtX2hlbHBlciBh
bHJlYWR5IGhhcyB0aGF0LiBUaGF0IHNlZW1zIGxpa2Ugb25lIGFic3RyYWN0aW9uDQo+Pj4+Pj4+
PiBsYXllciB0b28gbXVjaC4NCj4+Pj4+Pj4NCj4+Pj4+Pj4gSSBoYXZlbid0IHNlZW4gYW55dGhp
bmcgZmx5IGJ5IG9yIGluIHRoZSBsYXRlc3QgcHVsbCByZXF1ZXN0IC4uLiB5b3UNCj4+Pj4+Pj4g
Zm9sa3Mgc3RpbGwgd29ya2luZyBvbiB0aGlzIG9yIG1vcmUgcHV0IG9uIHRoZSAibWF5YmUsIHBy
b2JhYmx5IG5ldmVyIg0KPj4+Pj4+PiBwaWxlPw0KPj4+Pj4+Pg0KPj4+Pj4+DQo+Pj4+Pj4gRm9s
bG93aW5nIHVwIHdpdGggQmhhd2FuLg0KPj4+Pj4+DQo+Pj4+Pj4gSGFycnkNCj4+Pj4+Pg0KPj4+
Pj4+PiAtRGFuaWVsDQo+Pj4+Pj4+DQo+Pj4+Pj4+DQo+Pj4+Pj4+PiAtRGFuaWVsDQo+Pj4+Pj4+
Pg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBCaGF3YW4NCj4+Pj4+Pj4+Pg0KPj4+
Pj4+Pj4+IE9uIDIwMTktMTAtMDkgMjo0MyBwLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPj4+
Pj4+Pj4+PiBPbiBXZWQsIE9jdCA5LCAyMDE5IGF0IDg6MjMgUE0gTGFraGEsIEJoYXdhbnByZWV0
DQo+Pj4+Pj4+Pj4+IDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29tPiB3cm90ZToNCj4+Pj4+Pj4+
Pj4+IEhpLA0KPj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+IFRoZSByZWFzb24gd2UgZG9uJ3QgdXNl
IGRybV9oZGNwIGlzIGJlY2F1c2Ugb3VyIHBvbGljeSBpcyB0byBkbyBoZGNwDQo+Pj4+Pj4+Pj4+
PiB2ZXJpZmljYXRpb24gdXNpbmcgUFNQL0hXIChvbmJvYXJkIHNlY3VyZSBwcm9jZXNzb3IpLg0K
Pj4+Pj4+Pj4+PiBpOTE1IGFsc28gdXNlcyBodyB0byBhdXRoLCB3ZSBzdGlsbCB1c2UgdGhlIHBh
cnRzIGZyb20gZHJtX2hkY3AgLi4uDQo+Pj4+Pj4+Pj4+IERpZCB5b3UgYWN0dWFsbHkgbG9vayBh
dCB3aGF0J3MgaW4gdGhlcmU/IEl0J3MgZXNzZW50aWFsbHkganVzdCBzaGFyZWQNCj4+Pj4+Pj4+
Pj4gZGVmaW5lcyBhbmQgZGF0YSBzdHJ1Y3R1cmVzIGZyb20gdGhlIHN0YW5kYXJkLCBwbHVzIGEg
ZmV3IG1pbmltYWwNCj4+Pj4+Pj4+Pj4gaGVscGVycyB0byBlbi9kZWNvZGUgc29tZSBiaXRzLiBK
dXN0IGZyb20gYSBxdWljayByZWFkIHRoZSBlbnRpcmUNCj4+Pj4+Pj4+Pj4gcGF0Y2ggdmVyeSBt
dWNoIGxvb2tzIGxpa2UgbWlkbGF5ZXIgZXZlcnl3aGVyZSBkZXNpZ24gdGhhdCB3ZQ0KPj4+Pj4+
Pj4+PiBkaXNjdXNzZWQgYmFjayB3aGVuIERDIGxhbmRlZCAuLi4NCj4+Pj4+Pj4+Pj4gLURhbmll
bA0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4gQmhhd2FuDQo+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+
Pj4gT24gMjAxOS0xMC0wOSAxMjozMiBwLm0uLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0KPj4+Pj4+
Pj4+Pj4+IE9uIFRodSwgT2N0IDAzLCAyMDE5IGF0IDExOjA4OjAzUE0gKzAxMDAsIENvbGluIElh
biBLaW5nIHdyb3RlOg0KPj4+Pj4+Pj4+Pj4+PiBIaSwNCj4+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+
Pj4+Pj4gU3RhdGljIGFuYWx5c2lzIHdpdGggQ292ZXJpdHkgaGFzIGRldGVjdGVkIGEgcG90ZW50
aWFsIGlzc3VlIHdpdGgNCj4+Pj4+Pj4+Pj4+Pj4gZnVuY3Rpb24gdmFsaWRhdGVfYmtzdiBpbg0K
Pj4+Pj4+Pj4+Pj4+PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvbW9kdWxlcy9oZGNwL2hk
Y3AxX2V4ZWN1dGlvbi5jIHdpdGggcmVjZW50DQo+Pj4+Pj4+Pj4+Pj4+IGNvbW1pdDoNCj4+Pj4+
Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+Pj4gY29tbWl0IGVkOWQ4ZTJiY2IwMDNlYzk0NjU4Y2FmZTli
MWJiMzk2MGUyMTM5ZWMNCj4+Pj4+Pj4+Pj4+Pj4gQXV0aG9yOiBCaGF3YW5wcmVldCBMYWtoYSA8
Qmhhd2FucHJlZXQuTGFraGFAYW1kLmNvbT4NCj4+Pj4+Pj4+Pj4+Pj4gRGF0ZTogICBUdWUgQXVn
IDYgMTc6NTI6MDEgMjAxOSAtMDQwMA0KPj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+PiAgICAg
ICBkcm0vYW1kL2Rpc3BsYXk6IEFkZCBIRENQIG1vZHVsZQ0KPj4+Pj4+Pj4+Pj4+IEkgdGhpbmsg
dGhlIHJlYWwgcXVlc3Rpb24gaGVyZSBpcyAuLi4gd2h5IGlzIHRoaXMgbm90IHVzaW5nIGRybV9o
ZGNwPw0KPj4+Pj4+Pj4+Pj4+IC1EYW5pZWwNCj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+PiBU
aGUgYW5hbHlzaXMgaXMgYXMgZm9sbG93czoNCj4+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+Pj4g
ICAgMjggc3RhdGljIGlubGluZSBlbnVtIG1vZF9oZGNwX3N0YXR1cyB2YWxpZGF0ZV9ia3N2KHN0
cnVjdCBtb2RfaGRjcCAqaGRjcCkNCj4+Pj4+Pj4+Pj4+Pj4gICAgMjkgew0KPj4+Pj4+Pj4+Pj4+
Pg0KPj4+Pj4+Pj4+Pj4+PiBDSUQgODk4NTIgKCMxIG9mIDEpOiBPdXQtb2YtYm91bmRzIHJlYWQg
KE9WRVJSVU4pDQo+Pj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4+IDEuIG92ZXJydW4tbG9jYWw6
DQo+Pj4+Pj4+Pj4+Pj4+IE92ZXJydW5uaW5nIGFycmF5IG9mIDUgYnl0ZXMgYXQgYnl0ZSBvZmZz
ZXQgNyBieSBkZXJlZmVyZW5jaW5nIHBvaW50ZXINCj4+Pj4+Pj4+Pj4+Pj4gKHVpbnQ2NF90ICop
aGRjcC0+YXV0aC5tc2cuaGRjcDEuYmtzdi4NCj4+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+Pj4g
ICAgMzAgICAgICAgIHVpbnQ2NF90IG4gPSAqKHVpbnQ2NF90ICopaGRjcC0+YXV0aC5tc2cuaGRj
cDEuYmtzdjsNCj4+Pj4+Pj4+Pj4+Pj4gICAgMzEgICAgICAgIHVpbnQ4X3QgY291bnQgPSAwOw0K
Pj4+Pj4+Pj4+Pj4+PiAgICAzMg0KPj4+Pj4+Pj4+Pj4+PiAgICAzMyAgICAgICAgd2hpbGUgKG4p
IHsNCj4+Pj4+Pj4+Pj4+Pj4gICAgMzQgICAgICAgICAgICAgICAgY291bnQrKzsNCj4+Pj4+Pj4+
Pj4+Pj4gICAgMzUgICAgICAgICAgICAgICAgbiAmPSAobiAtIDEpOw0KPj4+Pj4+Pj4+Pj4+PiAg
ICAzNiAgICAgICAgfQ0KPj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+PiBoZGNwLT5hdXRoLm1z
Zy5oZGNwMS5ia3N2IGlzIGFuIGFycmF5IG9mIDUgdWludDhfdCBhcyBkZWZpbmVkIGluDQo+Pj4+
Pj4+Pj4+Pj4+IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcC5o
IGFzIGZvbGxvd3M6DQo+Pj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4+IHN0cnVjdCBtb2RfaGRj
cF9tZXNzYWdlX2hkY3AxIHsNCj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgIHVpbnQ4X3QgICAgICAg
ICBhbls4XTsNCj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgIHVpbnQ4X3QgICAgICAgICBha3N2WzVd
Ow0KPj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgdWludDhfdCAgICAgICAgIGFpbmZvOw0KPj4+Pj4+
Pj4+Pj4+PiAgICAgICAgICAgdWludDhfdCAgICAgICAgIGJrc3ZbNV07DQo+Pj4+Pj4+Pj4+Pj4+
ICAgICAgICAgICB1aW50MTZfdCAgICAgICAgcjBwOw0KPj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAg
dWludDhfdCAgICAgICAgIGJjYXBzOw0KPj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgdWludDE2X3Qg
ICAgICAgIGJzdGF0dXM7DQo+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgICB1aW50OF90ICAgICAgICAg
a3N2bGlzdFs2MzVdOw0KPj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgdWludDE2X3QgICAgICAgIGtz
dmxpc3Rfc2l6ZTsNCj4+Pj4+Pj4+Pj4+Pj4gICAgICAgICAgIHVpbnQ4X3QgICAgICAgICB2cFsy
MF07DQo+Pj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4+ICAgICAgICAgICB1aW50MTZfdCAgICAg
ICAgYmluZm9fZHA7DQo+Pj4+Pj4+Pj4+Pj4+IH07DQo+Pj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+
Pj4+IHZhcmlhYmxlIG4gaXMgZ29pbmcgdG8gY29udGFpbiB0aGUgY29udGFpbnMgb2YgcjBwIGFu
ZCBiY2Fwcy4gSSdtIG5vdA0KPj4+Pj4+Pj4+Pj4+PiBzdXJlIGlmIHRoYXQgaXMgaW50ZW50aW9u
YWwuIElmIG5vdCwgdGhlbiB0aGUgY291bnQgaXMgZ29pbmcgdG8gYmUNCj4+Pj4+Pj4+Pj4+Pj4g
aW5jb3JyZWN0IGlmIHRoZXNlIGFyZSBub24temVyby4NCj4+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+
Pj4+Pj4gQ29saW4NCj4+Pj4+Pj4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+Pj4+Pj4+Pj4+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+Pj4+
Pj4+Pj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4+Pj4+Pj4+PiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KPj4+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+DQo+Pj4+Pj4+Pg0KPj4+Pj4+
Pj4gLS0NCj4+Pj4+Pj4+IERhbmllbCBWZXR0ZXINCj4+Pj4+Pj4+IFNvZnR3YXJlIEVuZ2luZWVy
LCBJbnRlbCBDb3Jwb3JhdGlvbg0KPj4+Pj4+Pj4gKzQxICgwKSA3OSAzNjUgNTcgNDggLSBodHRw
Oi8vYmxvZy5mZndsbC5jaA0KPj4+Pj4+Pg0KPj4+Pj4+Pg0KPj4+Pj4+Pg0KPj4+Pj4+PiAtLQ0K
Pj4+Pj4+PiBEYW5pZWwgVmV0dGVyDQo+Pj4+Pj4+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbg0KPj4+Pj4+PiArNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZm
d2xsLmNoDQo+Pj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4gLS0NCj4+Pj4+IERhbmllbCBWZXR0ZXINCj4+
Pj4+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbg0KPj4+Pj4gaHR0cDovL2Js
b2cuZmZ3bGwuY2gNCj4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQo+Pj4+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPj4+Pj4gYW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcNCj4+Pj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vYW1kLWdmeA0KPj4+DQo+Pj4gLS0NCj4+PiBEYW5pZWwgVmV0dGVyDQo+
Pj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uDQo+Pj4gaHR0cDovL2Jsb2cu
ZmZ3bGwuY2gNCj4gDQo+IA0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==

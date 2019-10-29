Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21940E97E3
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 09:15:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F20F6ECAA;
	Wed, 30 Oct 2019 08:14:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130041.outbound.protection.outlook.com [40.107.13.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3C36EC50;
 Tue, 29 Oct 2019 17:19:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0LIkzAOS7RTMYIfPqZkOT0GvP6bJK5fex+S6+xEfUQYWP0u9pYaskofuBgV71d3n6wKs2YvACLG03S63vuFbs2QljGKn4pvjzYwrp4hh9Zl08HbRUGaYZdi9whPJ0SwZFPAR6x0aE/q3dYVRfIV3cPkNkukGtP6sSN9S3nEqGKHSZFI+45S7K0cgPuoJHlmDCoxcieTUlHfBsdysSutqw3YWLQafwOoSTcw9uEeJIxb7EdeKjFT7pQ2p30P3gWxPcB2ytqBqLCvRFltswc8dfiXEDTNtI6ozul9uxjDAMCvVwVmBqDf7Dq+AUuZWuaCi26Mwn9VWyW+1LdoUTb0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/qgL0bl7dg+4y5e/mAqEdEW7YBsQZfwM+2mOuRHUMI=;
 b=anebADrLGBJqvrmgA/L3gWSieekWXcaVOPPY1munf3C3NESi/qDfch74wwIanBA/6egRtgcRflIbWsBWjHEqrAOIPrinYZ/8Hc+HfI3aLNcGMhGZRYZDneOk+lPCi/bNg9Yj3vkX53+TU26z3vLwx1J9F3yAj29+HzasJJCapWyQaaRXPuDFGlV6lMC9qD3UeUbtoWcND4rBHBx3IhaJ305eMqY0c/wBiTMHiTB4ChDDgJQX6Iu9lS5iccE17m/3ZiN2PInhTiFVYvzh7KEvVNq94ljyX2AJG9zALmhmPA0Km4+BbnGQRTnx0pq7+hqZ2zXnAnMnncYPDAXfNrgD8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB6560.eurprd05.prod.outlook.com (20.179.26.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Tue, 29 Oct 2019 17:19:12 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2387.027; Tue, 29 Oct 2019
 17:19:12 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH v2 12/15] drm/amdgpu: Call find_vma under mmap_sem
Thread-Topic: [PATCH v2 12/15] drm/amdgpu: Call find_vma under mmap_sem
Thread-Index: AQHVjcvNgH3lYhAFh0mCgESIR0L8Yadx0ESAgAAOFgA=
Date: Tue, 29 Oct 2019 17:19:12 +0000
Message-ID: <20191029171908.GP22766@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-13-jgg@ziepe.ca>
 <a368d1bf-ba69-bb63-2bfd-b674acc2f19b@amd.com>
In-Reply-To: <a368d1bf-ba69-bb63-2bfd-b674acc2f19b@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:404:10::33) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5f4bea97-bd31-4a9c-826b-08d75c941da8
x-ms-traffictypediagnostic: VI1PR05MB6560:
x-microsoft-antispam-prvs: <VI1PR05MB6560D903D2D4CC93E5222741CF610@VI1PR05MB6560.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(39860400002)(376002)(136003)(396003)(189003)(199004)(66556008)(6506007)(6436002)(53546011)(54906003)(476003)(6916009)(6486002)(4001150100001)(2616005)(486006)(26005)(229853002)(71190400001)(71200400001)(446003)(186003)(52116002)(76176011)(99286004)(3846002)(478600001)(86362001)(386003)(316002)(6116002)(14454004)(5660300002)(6512007)(66946007)(66446008)(36756003)(11346002)(102836004)(64756008)(8676002)(256004)(66476007)(25786009)(14444005)(81166006)(81156014)(1076003)(6246003)(4326008)(33656002)(66574012)(2906002)(8936002)(66066001)(305945005)(7416002)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6560;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r5LaMpYOf/Fg4LRQPT8dJLgWYzRRpP3t0puwQkCxwAjbOuGN/iY0v++0E2cBV8ySqJ9UBMA69ThWCRQSr+KRMWrmViXTkZjJ7imxzcvfHpJWS4MJWdGRppRWcZfmisfxuv5HiOCQDrZ7HRV8NV+KSIZw5y1ZviNEr7iKo7WsxNJocDTdOL2Lz5EiqklwbYahBvwQVjfe2F9dbO+7kRpUQ4FMyyt8bAGpi2JOPp4KOw9kCu4Z9ngxpTwOzdHkoE3Ok1l9/avtH1phYyl1nG8jWnoGhD46e6cCKlKUoejdra8461wTG8vFdM7Ftz1nidfHJlGZXHG/uzZVLM8vgBkQDYu78ma66Z2EP2AhehYf72/AA0zC7hOF0V2ACOOiwtILr57sACUVh/C21e4PVgX96enFkclnLYRl+wVy8Y9KhX8VvsLhSanAOQ1dQYKAoK1W
x-ms-exchange-transport-forked: True
Content-ID: <6FA6F83EC32F6D43900E231F1B9C948D@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4bea97-bd31-4a9c-826b-08d75c941da8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 17:19:12.1011 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B/hq0A/v0yoycVTKZCGGjbu11marRKSjtxwZolzlk4EMVtpZ9TH1cj+z9gzH3hC2luZpgQvqONz3TWVqbbIH4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6560
X-Mailman-Approved-At: Wed, 30 Oct 2019 08:14:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/qgL0bl7dg+4y5e/mAqEdEW7YBsQZfwM+2mOuRHUMI=;
 b=PmjVGrsXo597NSyf/FqkHAz7lpFHpfIPOqu7/mkTFGxg9cuijrAXJI0xqRBqbhB2roXqDSKfjO81HE0YBaa0dw6QIAmFVFVXnSQ7KmjfCTOne1GOFOpRO1xaR/qBYj/pPB+50iVoXciPMelssfo2pRQMpEJMfa/zIMOinw+B0QU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
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
Cc: Juergen Gross <jgross@suse.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMjksIDIwMTkgYXQgMDQ6Mjg6NDNQTSArMDAwMCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOg0KPiBPbiAyMDE5LTEwLTI4IDQ6MTAgcC5tLiwgSmFzb24gR3VudGhvcnBlIHdyb3Rl
Og0KPiA+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4NCj4gPg0KPiA+
IGZpbmRfdm1hKCkgbXVzdCBiZSBjYWxsZWQgdW5kZXIgdGhlIG1tYXBfc2VtLCByZW9yZ2FuaXpl
IHRoaXMgY29kZSB0bw0KPiA+IGRvIHRoZSB2bWEgY2hlY2sgYWZ0ZXIgZW50ZXJpbmcgdGhlIGxv
Y2suDQo+ID4NCj4gPiBGdXJ0aGVyLCBmaXggdGhlIHVubG9ja2VkIHVzZSBvZiBzdHJ1Y3QgdGFz
a19zdHJ1Y3QncyBtbSwgaW5zdGVhZCB1c2UNCj4gPiB0aGUgbW0gZnJvbSBobW1fbWlycm9yIHdo
aWNoIGhhcyBhbiBhY3RpdmUgbW1fZ3JhYi4gQWxzbyB0aGUgbW1fZ3JhYg0KPiA+IG11c3QgYmUg
Y29udmVydGVkIHRvIGEgbW1fZ2V0IGJlZm9yZSBhY3F1aXJpbmcgbW1hcF9zZW0gb3IgY2FsbGlu
Zw0KPiA+IGZpbmRfdm1hKCkuDQo+ID4NCj4gPiBGaXhlczogNjZjNDU1MDBiZmRjICgiZHJtL2Ft
ZGdwdTogdXNlIG5ldyBITU0gQVBJcyBhbmQgaGVscGVycyIpDQo+ID4gRml4ZXM6IDA5MTkxOTVm
MmIwZCAoImRybS9hbWRncHU6IEVuYWJsZSBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzIGlu
IHdvcmtlciB0aHJlYWRzIikNCj4gPiBDYzogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hl
ckBhbWQuY29tPg0KPiA+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+DQo+ID4gQ2M6IERhdmlkIChDaHVuTWluZykgWmhvdSA8RGF2aWQxLlpob3VAYW1kLmNv
bT4NCj4gPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBTaWduZWQtb2Zm
LWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+DQo+IA0KPiBPbmUgcXVlc3Rp
b24gaW5saW5lIHRvIGNvbmZpcm0gbXkgdW5kZXJzdGFuZGluZy4gT3RoZXJ3aXNlIHRoaXMgcGF0
Y2ggaXMNCj4gDQo+IFJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdA
YW1kLmNvbT4NCg0KVGhhbmtzDQoNCj4gPiAtCWlmICh1bmxpa2VseSgoZ3R0LT51c2VyZmxhZ3Mg
JiBBTURHUFVfR0VNX1VTRVJQVFJfQU5PTk9OTFkpICYmDQo+ID4gLQkJdm1hLT52bV9maWxlKSkg
ew0KPiA+IC0JCXIgPSAtRVBFUk07DQo+ID4gLQkJZ290byBvdXQ7DQo+ID4gLQl9DQo+ID4gKwlt
bSA9IG1pcnJvci0+aG1tLT5tbXVfbm90aWZpZXIubW07DQo+ID4gKwlpZiAoIW1tZ2V0X25vdF96
ZXJvKG1tKSkgLyogSGFwcGVucyBkdXJpbmcgcHJvY2VzcyBzaHV0ZG93biAqLw0KPiANCj4gVGhp
cyB3b3JrcyBiZWNhdXNlIG1pcnJvci0+aG1tLT5tbXVfbm90aWZpZXIgaG9sZHMgYW4gbW1ncmFi
IHJlZmVyZW5jZSANCj4gdG8gdGhlIG1tPw0KDQpZZXMsIHRoaXMgbWFrZXMgc3VyZSB0aGUgbW0g
cG9pbnRlciByZW1haW5zIHZhbGlkDQoNCj4gU28gdGhlIE1NIHdpbGwgbm90IGp1c3QgZ28gYXdh
eSwgYnV0IGlmIHRoZSBtbWdldCByZWZjb3VudCBpcyAwLCBpdA0KPiBtZWFucyB0aGUgbW0gaXMg
bWFya2VkIGZvciBkZXN0cnVjdGlvbiBhbmQgc2hvdWxkbid0IGJlIHVzZWQgYW55DQo+IG1vcmUu
DQoNCk5vdCBqdXN0IG1hcmtlZCBmb3IgZGVzdHJ1Y3Rpb24sIGJ1dCB0aGF0IGFub3RoZXIgdGhy
ZWFkIGlzDQpwcm9ncmVzc2luZyBvciBmaW5pc2hlZCByZWxlYXNlKCkuDQoNClRoZSBvdGhlciBk
ZXRhaWwgaGVyZSBpcyB0aGF0IGluIGdlbmVyYWwgeW91IGNhbid0IGdldCB0aGUgbW1hcF9zZW0N
CndpdGhvdXQgYWxzbyBoYXZpbmcgYSBtbWdldCBhcyBleGl0X21tYXAoKSBkb2VzIG5vdCBsb2Nr
IHRoZSBtbWFwX3NlbQ0KaW4gc29tZSBwbGFjZXMgd2hlcmUgaXQgYWx0ZXJzIHRoZSBkYXRhc3Ry
dWN0dXJlcy4gaWUgcmFjaW5nDQpmaW5kX3ZtYSgpIHdpdGggZXhpdF9tbWFwKCkgaXMgbm90IGFs
bG93ZWQuDQoNClRoaXMgbWVhbnMgd2UgaGF2ZSB0byBob2xkIHRoZSBtbWdldCBhY3Jvc3MgdGhl
IGhtbV9yYW5nZV9mYXVsdCgpLCBidXQNCndlIGNhbiBkcm9wIHRoZSBtbWdldCBhbmQgdGhlbiB0
ZXN0IG1tdV9yYW5nZV9yZWFkX3JldHJ5KCkgdW5kZXIgdGhlDQpkcml2ZXIgbG9jay4gSXQgd2ls
bCByZXR1cm4gdHJ1ZSBpZiB0aGUgbW1nZXQgcmVmY291bnQgaGFzIGdvbmUgdG8NCnplcm8gaW4g
dGhlIG1lYW4gdGltZS4NCg0KQnV0IEkgdGhpbmsgdGhpcyBpcyBwcm9iYWJseSBhIHBvb3IgZHJp
dmVyIGRlc2lnbiwgYSBkcml2ZXIgc2hvdWxkDQpqdXN0IGhvbGQgdGhlIG1tZ2V0KCkgdW50aWwg
aXQgaGFzIGNvbXBsZXRlZCBlc3RhYmxpc2hpbmcgdGhlIHNoYWRvdw0KUFRFcywgYXMgaXQgaXMg
aGFyZCB0byBzZWUgYSByZWFzb24gbm90IHRvLi4NCg0KSmFzb24NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

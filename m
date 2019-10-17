Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7256FDB24C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2019 18:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7606EAD2;
	Thu, 17 Oct 2019 16:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-bl2nam02on0630.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe46::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7ABB6EAD2;
 Thu, 17 Oct 2019 16:26:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPPI/KdpV1ySMjuE8xMysGj5BxqJTn39qsgJBhvcsfDW9Nb87uQ9G+5JGF1vTLB5aA/OCAxRIT32fyL4Fkkt12OU9m+YZpJdnJcwA+ZCI5656sQlqrtbBcVzWrirF+HLTEuC3TKKK2B07L+e0mzC2J65vuXRYSYZDtOz5PsnCsb9O0vvgX8luLYhfmQwT6ISl9govTMaEJExdVYFZh29FiBU0ousWkSatgcZ3eSWACwPbbOx4ZQUzr7yZeIKoIq+SSUMTMSVIHM/R4opXdYn+QIlclBNIBL5KclDyqjHtnsCYQyVSanCuXZouPZup2EIfA/eqh4Xwa27p1PDT7P8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2kD6baPL/03oaq3mGRnEx2SY9ZU9CpCQSquQSo1pRE=;
 b=oHeVLXbTY+ai94CGQVNY867hBgiXpdwL0LMZdIqrjYdxCBjmb2KYKAJhsdHAX1O7URmDvrmHmYKCb3i/3madiy+MUJN7/gKnnk1pz3oDSu/ULG2vuaB3qRcOGOkKX6/6n7gBBxNxfwRq1N1UlrnPGDaSL2bVGgBsltEGYXTUAHYtEAYnrJNwW8R2ZtbLAHJ9f/SKdr/lEKnPTmXuGSRZ3tL15Fto9nNjvgmVPme41DmtuUTt48F643pUu0Ec0eI+8GKOienh8axC58JKT9+adcAC7lGDNAqOfCCCAyUMrL6I9Rjyn/kSn4oqe8orWajpNZJLie7LRz/WcTyrtZHytA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB4030.namprd12.prod.outlook.com (10.255.86.25) by
 MN2PR12MB4318.namprd12.prod.outlook.com (52.135.49.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.23; Thu, 17 Oct 2019 16:26:15 +0000
Received: from MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9]) by MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9%5]) with mapi id 15.20.2347.024; Thu, 17 Oct 2019
 16:26:14 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Jason Gunthorpe
 <jgg@mellanox.com>
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Topic: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Index: AQHVg4TZ/Ef2jouLL0SYZs11ha9wvadc+JcAgAB3QgCAARomgIAAfiUA
Date: Thu, 17 Oct 2019 16:26:14 +0000
Message-ID: <2046e0b4-ba05-0683-5804-e9bbf903658d@amd.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <bc954d29-388b-9e29-f960-115ccc6b9fea@gmail.com>
 <20191016160444.GB3430@mellanox.com>
 <2df298e2-ee91-ef40-5da9-2bc1af3a17be@gmail.com>
In-Reply-To: <2df298e2-ee91-ef40-5da9-2bc1af3a17be@gmail.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::48)
 To MN2PR12MB4030.namprd12.prod.outlook.com
 (2603:10b6:208:159::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d79b2197-ea8a-4126-6886-08d7531ebade
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB4318:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB431841F447954084CED9F678E66D0@MN2PR12MB4318.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 01930B2BA8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(199004)(189003)(6486002)(66946007)(7416002)(4326008)(66476007)(6436002)(81156014)(81166006)(6246003)(66574012)(2906002)(66556008)(64756008)(66446008)(229853002)(14444005)(6306002)(256004)(14454004)(6512007)(26005)(3846002)(71190400001)(66066001)(71200400001)(186003)(2616005)(25786009)(8936002)(11346002)(486006)(966005)(4001150100001)(305945005)(110136005)(6116002)(478600001)(7736002)(76176011)(31696002)(36756003)(52116002)(102836004)(8676002)(446003)(54906003)(86362001)(53546011)(6506007)(31686004)(316002)(5660300002)(386003)(99286004)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4318;
 H:MN2PR12MB4030.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 15Ij+Oxjr5SYyStxv7N70Yt2/DgYaensU6+daUZlmFTnLJkzsJKx27a2gZnfdEf42+7mlwA/+Ve8juiCI9Ygs6ZlXV0PR+Wss8JAoGWvnnXsuUJoritOhDGKYqz4TOM+jUER/qWfnX5/68i/ZPt/x10CkRs9nEOB6PMrcVLs+FZFi1vxZichx+SyYsP+dZy7FFP+NNQxAMvalYE4y4xFvAKlgFWvQw6ViblGdx0YjiPt6fw1cAgM1AVgfvFBJSfW7ho1AS49Pk0AUJWTHwGG7YyWs1/x2RA0OQFOEPONdUj9Fk32kilmk5b3tXw53BdorQPCfN2zUb9JNZpRGDwouSc8DxSh5AtowrHH43JIWDOkR3F7EdPjdYv0YASuvkyNGUkodPquY6QKjB9KeI0urqMWD18WdJgE9swZD8Ycko8s+jjapLTNg1R+QUX3h17PAttDYbx9Bqz6RiskxpaIVQ==
Content-ID: <651BA46246152D49990824226C166BFF@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d79b2197-ea8a-4126-6886-08d7531ebade
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2019 16:26:14.7485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vU17H1IcGAzJ6l0n5+b6Xlxz/QgSu/S7mrYbYM5unbaeF66UXHc6VyX0ap3vk3wh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4318
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2kD6baPL/03oaq3mGRnEx2SY9ZU9CpCQSquQSo1pRE=;
 b=umS3t80kRizwGBb8bLvT805Dn31h0s8RvCssXbowBFLYeGsEACyzlX6sCrbqFFrsBg3eSNXwYv2zQ9E84UXpJvgVE9/PbpQp57LmSgdM8DyGYoH264bX1czzcSlWgQrN7atubgshFEZQZwc2EMgnWmXy/whHq0LY1rjJaPrjwK4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Philip.Yang@amd.com; 
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, 
 Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDIwMTktMTAtMTcgNDo1NCBhLm0uLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPiBB
bSAxNi4xMC4xOSB1bSAxODowNCBzY2hyaWViIEphc29uIEd1bnRob3JwZToNCj4+IE9uIFdlZCwg
T2N0IDE2LCAyMDE5IGF0IDEwOjU4OjAyQU0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6
DQo+Pj4gQW0gMTUuMTAuMTkgdW0gMjA6MTIgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6DQo+Pj4+
IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4NCj4+Pj4NCj4+Pj4gOCBv
ZiB0aGUgbW11X25vdGlmaWVyIHVzaW5nIGRyaXZlcnMgKGk5MTVfZ2VtLCByYWRlb25fbW4sIHVt
ZW1fb2RwLCANCj4+Pj4gaGZpMSwNCj4+Pj4gc2NpZl9kbWEsIHZob3N0LCBnbnRkZXYsIGhtbSkg
ZHJpdmVycyBhcmUgdXNpbmcgYSBjb21tb24gcGF0dGVybiB3aGVyZQ0KPj4+PiB0aGV5IG9ubHkg
dXNlIGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQvZW5kIGFuZCBpbW1lZGlhdGVseSBjaGVjayB0aGUN
Cj4+Pj4gaW52YWxpZGF0aW5nIHJhbmdlIGFnYWluc3Qgc29tZSBkcml2ZXIgZGF0YSBzdHJ1Y3R1
cmUgdG8gdGVsbCBpZiB0aGUNCj4+Pj4gZHJpdmVyIGlzIGludGVyZXN0ZWQuIEhhbGYgb2YgdGhl
bSB1c2UgYW4gaW50ZXJ2YWxfdHJlZSwgdGhlIG90aGVycyBhcmUNCj4+Pj4gc2ltcGxlIGxpbmVh
ciBzZWFyY2ggbGlzdHMuDQo+Pj4+DQo+Pj4+IE9mIHRoZSBvbmVzIEkgY2hlY2tlZCB0aGV5IGxh
cmdlbHkgc2VlbSB0byBoYXZlIHZhcmlvdXMga2luZHMgb2YgcmFjZXMsDQo+Pj4+IGJ1Z3MgYW5k
IHBvb3IgaW1wbGVtZW50YXRpb24uIFRoaXMgaXMgYSByZXN1bHQgb2YgdGhlIGNvbXBsZXhpdHkg
aW4gaG93DQo+Pj4+IHRoZSBub3RpZmllciBpbnRlcmFjdHMgd2l0aCBnZXRfdXNlcl9wYWdlcygp
LiBJdCBpcyBleHRyZW1lbHkgDQo+Pj4+IGRpZmZpY3VsdCB0bw0KPj4+PiB1c2UgaXQgY29ycmVj
dGx5Lg0KPj4+Pg0KPj4+PiBDb25zb2xpZGF0ZSBhbGwgb2YgdGhpcyBjb2RlIHRvZ2V0aGVyIGlu
dG8gdGhlIGNvcmUgbW11X25vdGlmaWVyIGFuZA0KPj4+PiBwcm92aWRlIGEgbG9ja2luZyBzY2hl
bWUgc2ltaWxhciB0byBobW1fbWlycm9yIHRoYXQgYWxsb3dzIHRoZSB1c2VyIHRvDQo+Pj4+IHNh
ZmVseSB1c2UgZ2V0X3VzZXJfcGFnZXMoKSBhbmQgcmVsaWFibHkga25vdyBpZiB0aGUgcGFnZSBs
aXN0IHN0aWxsDQo+Pj4+IG1hdGNoZXMgdGhlIG1tLg0KPj4+IFRoYXQgc291bmRzIHJlYWxseSBn
b29kLCBidXQgY291bGQgeW91IG91dGxpbmUgZm9yIGEgbW9tZW50IGhvdyB0aGF0IGlzDQo+Pj4g
YXJjaGl2ZWQ/DQo+PiBJdCB1c2VzIHRoZSBzYW1lIGJhc2ljIHNjaGVtZSBhcyBobW0gYW5kIHJk
bWEgb2RwLCBvdXRsaW5lZCBpbiB0aGUNCj4+IHJldmlzaW9ucyB0byBobW0ucnN0IGxhdGVyIG9u
Lg0KPj4NCj4+IEJhc2ljYWxseSwNCj4+DQo+PiDCoCBzZXEgPSBtbXVfcmFuZ2VfcmVhZF9iZWdp
bigmbXJuKTsNCj4+DQo+PiDCoCAvLyBUaGlzIGlzIGEgc3BlY3VsYXRpdmUgcmVnaW9uDQo+PiDC
oCAuLiBnZXRfdXNlcl9wYWdlcygpL2htbV9yYW5nZV9mYXVsdCgpIC4uDQo+IA0KPiBIb3cgZG8g
d2UgZW5mb3JjZSB0aGF0IHRoaXMgZ2V0X3VzZXJfcGFnZXMoKS9obW1fcmFuZ2VfZmF1bHQoKSBk
b2Vzbid0IA0KPiBzZWUgb3V0ZGF0ZWQgcGFnZSB0YWJsZSBpbmZvcm1hdGlvbj8NCj4gDQo+IElu
IG90aGVyIHdvcmRzIGhvdyB0aGUgdGhlIGZvbGxvd2luZyByYWNlIHByZXZlbnRlZDoNCj4gDQo+
IENQVSBBIENQVSBCDQo+IGludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoKQ0KPiAgwqDCoMKgIMKgIG1t
dV9yYW5nZV9yZWFkX2JlZ2luKCkNCj4gIMKgwqDCoCDCoCBnZXRfdXNlcl9wYWdlcygpL2htbV9y
YW5nZV9mYXVsdCgpDQo+IFVwZGF0aW5nIHRoZSBwdGVzDQo+IGludmFsaWRhdGVfcmFuZ2VfZW5k
KCkNCj4gDQo+IA0KPiBJIG1lYW4gZ2V0X3VzZXJfcGFnZXMoKSB0cmllcyB0byBjaXJjdW12ZW50
IHRoaXMgaXNzdWUgYnkgZ3JhYmJpbmcgYSANCj4gcmVmZXJlbmNlIHRvIHRoZSBwYWdlcyBpbiBx
dWVzdGlvbiwgYnV0IHRoYXQgaXNuJ3Qgc3VmZmljaWVudCBmb3IgdGhlIA0KPiBTVk0gdXNlIGNh
c2UuDQo+IA0KPiBUaGF0J3MgdGhlIHJlYXNvbiB3aHkgd2UgaGFkIHRoaXMgaG9ycmlibGUgc29s
dXRpb24gd2l0aCBhIHIvdyBsb2NrIGFuZCANCj4gYSBsaW5rZWQgbGlzdCBvZiBCT3MgaW4gYW4g
aW50ZXJ2YWwgdHJlZS4NCj4gDQo+IFJlZ2FyZHMsDQo+IENocmlzdGlhbi4NCmdldF91c2VyX3Bh
Z2VzL2htbV9yYW5nZV9mYXVsdCgpIGFuZCBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KCkgYm90aCBh
cmUgDQpjYWxsZWQgd2hpbGUgaG9sZGluZyBtbS0+bWFwX3NlbSwgc28gdGhleSBhcmUgYWx3YXlz
IHNlcmlhbGl6ZWQuDQoNClBoaWxpcA0KPiANCj4+IMKgIC8vIFJlc3VsdCBjYW5ub3QgYmUgZGVy
ZmVyZW5jZWQNCj4+DQo+PiDCoCB0YWtlX2xvY2soZHJpdmVyLT51cGRhdGUpOw0KPj4gwqAgaWYg
KG1tdV9yYW5nZV9yZWFkX3JldHJ5KCZtcm4sIHJhbmdlLm5vdGlmaWVyX3NlcSkgew0KPj4gwqDC
oMKgwqAgLy8gY29sbGlzaW9uISBUaGUgcmVzdWx0cyBhcmUgbm90IGNvcnJlY3QNCj4+IMKgwqDC
oMKgIGdvdG8gYWdhaW4NCj4+IMKgIH0NCj4+DQo+PiDCoCAvLyBubyBjb2xsaXNpb24sIGFuZCBu
b3cgdW5kZXIgbG9jay4gTm93IHdlIGNhbiBkZS1yZWZlcmVuY2UgdGhlIA0KPj4gcGFnZXMvZXRj
DQo+PiDCoCAvLyBwcm9ncmFtIEhXDQo+PiDCoCAvLyBOb3cgdGhlIGludmFsaWRhdGUgY2FsbGJh
Y2sgaXMgcmVzcG9uc2libGUgdG8gc3luY2hyb25pemUgYWdhaW5zdCANCj4+IGNoYW5nZXMNCj4+
IMKgIHVubG9jayhkcml2ZXItPnVwZGF0ZSkNCj4+DQo+PiBCYXNpY2FsbHksIGFueXRoaW5nIHRo
YXQgd2FzIHVzaW5nIGhtbV9taXJyb3IgY29ycmVjdGx5IHRyYW5zaXNpb25zDQo+PiBvdmVyIGZh
aXJseSB0cml2aWFsbHksIGp1c3Qgd2l0aCB0aGUgbW9kaWZpY2F0aW9uIHRvIHN0b3JlIGEgc2Vx
dWVuY2UNCj4+IG51bWJlciB0byBjbG9zZSB0aGF0IHJhY2UgZGVzY3JpYmVkIGluIHRoZSBobW0g
Y29tbWl0Lg0KPj4NCj4+IEZvciBzb21ldGhpbmcgbGlrZSBBTUQgZ3B1IEkgZXhwZWN0IGl0IHRv
IHRyYW5zaXRpb24gdG8gdXNlIGRtYV9mZW5jZQ0KPj4gZnJvbSB0aGUgbm90aWZpZXIgZm9yIGNv
aGVyZW5jeSByaWdodCBiZWZvcmUgaXQgdW5sb2NrcyBkcml2ZXItPnVwZGF0ZS4NCj4+DQo+PiBK
YXNvbg0KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQt
Z2Z4DQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1n
ZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

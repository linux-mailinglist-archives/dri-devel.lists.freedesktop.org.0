Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC5BEC93C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 20:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 816566E2EF;
	Fri,  1 Nov 2019 19:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820058.outbound.protection.outlook.com [40.107.82.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B806E2EF;
 Fri,  1 Nov 2019 19:50:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfjvCecqyNYTSrGOR7r+WU9X1bqUQ5sETr1BgzOXUP323A118cNjNXHuKyR/ZDQVzM/6RMVtFoC8p9BKyCk86mfrdlCz2aroibuImRTUWWE9bd59aAQKhfNYqOntO1Xo+1JETFfejHIb240OrqIPZISTt9vNP17gsgSeU4c4ZFDr4nmJryVkDH19IciW3USzqorAd7bQcCDs9UQ2emsajaaOfOfiFA/uOiBi0Y5W0TZ1B0cxzsfH+Kb8ZDlf7YiKAPpWcupj+bz53+m/FUWgb3CowpdtlC3+CLf9LRA0Sht+UPb2xrQt07lQPpJCUyBcgnmgV6Ue2aoV+3vtvYzcKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQALmFaHQBj9ABueXcOPRpdPf8j9bN5xAcp8z2adgQA=;
 b=QPOpIaPRpf7jVoDzZzT91QH7MJovKJmeTwDVWUUzXW5fL0VysXawA9SHVGev7FHTMMSR1UjKaxufYsYAcQYZVcVr8iEmGdGQhW9OX7FDoDHvKbMJCFeDfzQqmbG5p0mA7phK73fFDfpyZVpoYg/fnJGUHfw+b1D5dcN7L/Xk+ZINNX4mTz2/NPQFiTFBejJHDOtSVuayju1Wm1lMjETOZQJwbkoSc+FJKa3mHNxfzeiPfxGst5lkV+a1yrvyyZtA6kMiGAr0/zRIzV5NvqCxkgCx4a4/i8VLEZUJmwJuZDtxlUNy5kSQcChEu5tclZauxNic+LIWj3OJ7GkMWiOv9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB4030.namprd12.prod.outlook.com (10.255.86.25) by
 MN2PR12MB3421.namprd12.prod.outlook.com (20.178.243.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.20; Fri, 1 Nov 2019 19:50:16 +0000
Received: from MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9]) by MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9%5]) with mapi id 15.20.2387.027; Fri, 1 Nov 2019
 19:50:15 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Topic: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Index: AQHVjcy5krMagvVO3k2ER8a03a+2l6dyANaAgAAA5gCABGh8AIAAB7mAgAANHgCAABzRAIAAIk6AgAABX4A=
Date: Fri, 1 Nov 2019 19:50:15 +0000
Message-ID: <186c8fae-9f3c-cc07-4790-9cc316a3179f@amd.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-15-jgg@ziepe.ca>
 <a456ebd0-28cf-997b-31ff-72d9077a9b8e@amd.com>
 <20191029192544.GU22766@mellanox.com>
 <30b2f569-bf7a-5166-c98d-4a4a13d1351f@amd.com>
 <20191101151222.GN22766@mellanox.com>
 <8280fb65-a897-3d71-79f9-9f80d9e474e9@amd.com>
 <20191101174221.GO22766@mellanox.com>
 <fc6ded68-287b-5257-db79-42c92458a5f6@amd.com>
In-Reply-To: <fc6ded68-287b-5257-db79-42c92458a5f6@amd.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::31) To MN2PR12MB4030.namprd12.prod.outlook.com
 (2603:10b6:208:159::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 48f31fd1-f2b5-4088-fb9d-08d75f04b73d
x-ms-traffictypediagnostic: MN2PR12MB3421:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB342127E6889A0B09A5DF3A47E6620@MN2PR12MB3421.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(39860400002)(346002)(396003)(199004)(189003)(102836004)(186003)(446003)(6916009)(66446008)(31696002)(5660300002)(6506007)(36756003)(6436002)(6246003)(26005)(229853002)(7416002)(305945005)(81166006)(7736002)(99286004)(476003)(6486002)(53546011)(6116002)(66066001)(81156014)(8676002)(8936002)(14454004)(486006)(3846002)(966005)(386003)(71190400001)(71200400001)(54906003)(64756008)(66476007)(31686004)(66556008)(256004)(14444005)(76176011)(2616005)(478600001)(52116002)(11346002)(86362001)(316002)(4326008)(25786009)(66946007)(6512007)(2906002)(6306002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3421;
 H:MN2PR12MB4030.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cR/vteXymTTmw/7wb0pGhm1haHCOZeRPKAI/n/r1zHjgkx9HTbOVQs3HTNYY6BiILYoYC1+cMkJ7RRqE3UO15VkVwU8FC8bRVNN8DjpOtdl/1Bv0zwEB0m+wjeEM0pKm7GuNAy+0/mwFM7JXyTK2Q1ynTOw56bj20hCMfERs/FnW0UI1FJJfciIAPL63AGk5QhWcqCYIN2FA+Fy1nwsvwrsk0EdYW7et7noJ/W/hDyP04hMdUuxeY2ZMdwad8tGySVoCBknUwKfV1bcBKdetaxkcpS05ZODQ+/diptmbEV686DaDsUldRgoznMsU/Ra2XPn3y9G7BmHAFmUbT5agFFNaH7Vo5YwSwAlukLOaPhQg+yHIUXTjVJvo4VFDGWaRKQmsu+mT/VRK4vjh5L/zJAx9bSGRsFtK9uUtAOudmlLOHiZkxuZDs9CPVNhUqFMCw+CLtcjInc0OL3QMYYLjUvOpqXd4B4bimLtfMi3NW6w=
Content-ID: <DF30FFCD4D45424EB71F97A4EB49559A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f31fd1-f2b5-4088-fb9d-08d75f04b73d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 19:50:15.7813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9coEdTasHRdBaU1stJgvZQFP8uHoSq3mxTemofYyuL8xZMYJY5CnJsqWD+IoxKiy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3421
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQALmFaHQBj9ABueXcOPRpdPf8j9bN5xAcp8z2adgQA=;
 b=lM65ZTXeNm7GCJ4Qe1uPxePQOjMK/iHVUJdSAZOlMLb4EAvnSDpeZew/xnzbVbpt3ki5egwr4cOkFNoUB0gAsRXjDlB0MQK+XBACxV53WEOwAM8Vbq9UgqVYufMaGoyTD/i7fLe9RZXu5lCsa+NM+PSpMWZNj2H0YIienLHAhpg=
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Jerome Glisse <jglisse@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29ycnksIHJlc2VuZCBwYXRjaCwgdGhlIG9uZSBpbiBwcmV2aW91cyBlbWFpbCBtaXNzZWQgY291
cGxlIG9mIGxpbmVzIA0KZHVvIHRvIGNvcHkvcGFzdGUuDQoNCk9uIDIwMTktMTEtMDEgMzo0NSBw
Lm0uLCBZYW5nLCBQaGlsaXAgd3JvdGU6DQo+IA0KPiANCj4gT24gMjAxOS0xMS0wMSAxOjQyIHAu
bS4sIEphc29uIEd1bnRob3JwZSB3cm90ZToNCj4+IE9uIEZyaSwgTm92IDAxLCAyMDE5IGF0IDAz
OjU5OjI2UE0gKzAwMDAsIFlhbmcsIFBoaWxpcCB3cm90ZToNCj4+Pj4gVGhpcyB0ZXN0IGZvciBy
YW5nZV9ibG9ja2FibGUgc2hvdWxkIGJlIGJlZm9yZSBtdXRleF9sb2NrLCBJIGNhbiBtb3ZlDQo+
Pj4+IGl0IHVwDQo+Pj4+DQo+Pj4geWVzLCB0aGFua3MuDQo+Pg0KPj4gT2theSwgSSB3cm90ZSBp
dCBsaWtlIHRoaXM6DQo+Pg0KPj4gCWlmIChtbXVfbm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHJh
bmdlKSkNCj4+IAkJbXV0ZXhfbG9jaygmYWRldi0+bm90aWZpZXJfbG9jayk7DQo+PiAJZWxzZSBp
ZiAoIW11dGV4X3RyeWxvY2soJmFkZXYtPm5vdGlmaWVyX2xvY2spKQ0KPj4gCQlyZXR1cm4gZmFs
c2U7DQo+Pg0KPj4+PiBBbHNvLCBkbyB5b3Uga25vdyBpZiBub3RpZmllcl9sb2NrIGlzIGhlbGQg
d2hpbGUgY2FsbGluZw0KPj4+PiBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzX2RvbmUoKT8g
Q2FuIHdlIGFkZCBhICdsb2NrIGFzc2VydCBoZWxkJw0KPj4+PiB0byBhbWRncHVfdHRtX3R0X2dl
dF91c2VyX3BhZ2VzX2RvbmUoKT8NCj4+Pg0KPj4+IGdwdSBzaWRlIGhvbGQgbm90aWZpZXJfbG9j
ayBidXQga2ZkIHNpZGUgZG9lc24ndC4ga2ZkIHNpZGUgZG9lc24ndCBjaGVjaw0KPj4+IGFtZGdw
dV90dG1fdHRfZ2V0X3VzZXJfcGFnZXNfZG9uZS9tbXVfcmFuZ2VfcmVhZF9yZXRyeSByZXR1cm4g
dmFsdWUgYnV0DQo+Pj4gY2hlY2sgbWVtLT5pbnZhbGlkIGZsYWcgd2hpY2ggaXMgdXBkYXRlZCBm
cm9tIGludmFsaWRhdGUgY2FsbGJhY2suIEl0DQo+Pj4gdGFrZXMgbW9yZSB0aW1lIHRvIGNoYW5n
ZSwgSSB3aWxsIGNvbWUgdG8gYW5vdGhlciBwYXRjaCB0byBmaXggaXQgbGF0ZXIuDQo+Pg0KPj4g
QWguLiBjb25mdXNpbmcsIE9LLCBJJ2xsIGxldCB5b3Ugc29ydCB0aGF0DQo+Pg0KPj4+PiBIb3dl
dmVyLCB0aGlzIGlzIGFsbCBwcmUtZXhpc3RpbmcgYnVncywgc28gSSdtIE9LIGdvIGFoZWFkIHdp
dGggdGhpcw0KPj4+PiBwYXRjaCBhcyBtb2RpZmllZC4gSSBhZHZpc2UgQU1EIHRvIG1ha2UgYSBm
b2xsb3d1cCBwYXRjaCAuLg0KPj4+Pg0KPj4+IHllcywgSSB3aWxsLg0KPj4NCj4+IFdoaWxlIHlv
dSBhcmUgaGVyZSwgdGhpcyBpcyBhbHNvIHdyb25nOg0KPj4NCj4+IGludCBhbWRncHVfdHRtX3R0
X2dldF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRncHVfYm8gKmJvLCBzdHJ1Y3QgcGFnZSAqKnBhZ2Vz
KQ0KPj4gew0KPj4gCWRvd25fcmVhZCgmbW0tPm1tYXBfc2VtKTsNCj4+IAlyID0gaG1tX3Jhbmdl
X2ZhdWx0KHJhbmdlLCAwKTsNCj4+IAl1cF9yZWFkKCZtbS0+bW1hcF9zZW0pOw0KPj4gCWlmICh1
bmxpa2VseShyIDw9IDApKSB7DQo+PiAJCWlmICgociA9PSAwIHx8IHIgPT0gLUVCVVNZKSAmJiAh
dGltZV9hZnRlcihqaWZmaWVzLCB0aW1lb3V0KSkNCj4+IAkJCWdvdG8gcmV0cnk7DQo+PiAJCWdv
dG8gb3V0X2ZyZWVfcGZuczsNCj4+IAl9DQo+Pg0KPj4gCWZvciAoaSA9IDA7IGkgPCB0dG0tPm51
bV9wYWdlczsgaSsrKSB7DQo+PiAJCXBhZ2VzW2ldID0gaG1tX2RldmljZV9lbnRyeV90b19wYWdl
KHJhbmdlLCByYW5nZS0+cGZuc1tpXSk7DQo+Pg0KPj4gSXQgaXMgbm90IGFsbG93ZWQgdG8gcmVh
ZCB0aGUgcmVzdWx0cyBvZiBobW1fcmFuZ2VfZmF1bHQoKSBvdXRzaWRlDQo+PiBsb2NraW5nLCBh
bmQgaW4gcGFydGljdWxhciwgd2UgY2FuJ3QgY29udmVydCB0byBhIHN0cnVjdCBwYWdlLg0KPj4N
Cj4+IFRoaXMgbXVzdCBiZSBkb25lIGluc2lkZSB0aGUgbm90aWZpZXJfbG9jaywgYWZ0ZXIgY2hl
Y2tpbmcNCj4+IG1tdV9yYW5nZV9yZWFkX3JldHJ5KCksIGFsbCBoYW5kbGluZyBvZiB0aGUgc3Ry
dWN0IHBhZ2UgbXVzdCBiZQ0KPj4gc3RydWN0dXJlZCBsaWtlIHRoYXQuDQo+Pg0KPiBCZWxvdyBj
aGFuZ2Ugd2lsbCBmaXggdGhpcywgdGhlbiBkcml2ZXIgd2lsbCBjYWxsIG1tdV9yYW5nZV9yZWFk
X3JldHJ5DQo+IHNlY29uZCB0aW1lIHVzaW5nIHNhbWUgcmFuZ2UtPm5vdGlmaWVyX3NlcSB0byBj
aGVjayBpZiByYW5nZSBpcw0KPiBpbnZhbGlkYXRlZCBpbnNpZGUgYW1kZ3B1X2NzX3N1Ym1pdCwg
dGhpcyBsb29rcyBvayBmb3IgbWUuDQo+IA0KQEAgLTc5Nyw2ICs3OTcsNyBAQCBzdGF0aWMgY29u
c3QgdWludDY0X3QgDQpobW1fcmFuZ2VfdmFsdWVzW0hNTV9QRk5fVkFMVUVfTUFYXSA9IHsNCiAg
ICovDQogIGludCBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRncHVfYm8g
KmJvLCBzdHJ1Y3QgcGFnZSANCioqcGFnZXMpDQogIHsNCisgICAgICAgc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYoYm8tPnRiby5iZGV2KTsNCiAgICAgICAgIHN0
cnVjdCB0dG1fdHQgKnR0bSA9IGJvLT50Ym8udHRtOw0KICAgICAgICAgc3RydWN0IGFtZGdwdV90
dG1fdHQgKmd0dCA9ICh2b2lkICopdHRtOw0KICAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCA9
IGd0dC0+dXNlcnB0cjsNCkBAIC04NjgsNiArODY5LDEzIEBAIGludCBhbWRncHVfdHRtX3R0X2dl
dF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRncHVfYm8gDQoqYm8sIHN0cnVjdCBwYWdlICoqcGFnZXMp
DQogICAgICAgICAgICAgICAgIGdvdG8gb3V0X2ZyZWVfcGZuczsNCiAgICAgICAgIH0NCg0KKyAg
ICAgICBtdXRleF9sb2NrKCZhZGV2LT5ub3RpZmllcl9sb2NrKTsNCisNCisgICAgICAgaWYgKG1t
dV9yYW5nZV9yZWFkX3JldHJ5KCZiby0+bm90aWZpZXIsIHJhbmdlLT5ub3RpZmllcl9zZXEpKSB7
DQorICAgICAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZhZGV2LT5ub3RpZmllcl9sb2NrKTsNCisg
ICAgICAgICAgICAgICBnb3RvIHJldHJ5Ow0KKyAgICAgICB9DQorDQogICAgICAgICBmb3IgKGkg
PSAwOyBpIDwgdHRtLT5udW1fcGFnZXM7IGkrKykgew0KICAgICAgICAgICAgICAgICBwYWdlc1tp
XSA9IGhtbV9kZXZpY2VfZW50cnlfdG9fcGFnZShyYW5nZSwgcmFuZ2UtPnBmbnNbaV0pOw0KICAg
ICAgICAgICAgICAgICBpZiAodW5saWtlbHkoIXBhZ2VzW2ldKSkgew0KQEAgLTg3NSwxMCArODgz
LDEyIEBAIGludCBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRncHVfYm8g
DQoqYm8sIHN0cnVjdCBwYWdlICoqcGFnZXMpDQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGksIHJhbmdlLT5wZm5zW2ldKTsNCiAgICAgICAgICAgICAgICAgICAgICAgICByID0gLUVO
T01FTTsNCg0KKyAgICAgICAgICAgICAgICAgICAgICAgbXV0ZXhfdW5sb2NrKCZhZGV2LT5ub3Rp
Zmllcl9sb2NrKTsNCiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dF9mcmVlX3BmbnM7
DQogICAgICAgICAgICAgICAgIH0NCiAgICAgICAgIH0NCg0KKyAgICAgICBtdXRleF91bmxvY2so
JmFkZXYtPm5vdGlmaWVyX2xvY2spOw0KICAgICAgICAgZ3R0LT5yYW5nZSA9IHJhbmdlOw0KICAg
ICAgICAgbW1wdXQobW0pOw0KDQo+IA0KPiBQaGlsaXANCj4gDQo+Pj4+PiBAQCAtOTk3LDEwICsx
MDA0LDE4IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV90dG1fdHRfdW5waW5fdXNlcnB0cihzdHJ1Y3Qg
dHRtX3R0ICp0dG0pDQo+Pj4+PiAgICAgCXNnX2ZyZWVfdGFibGUodHRtLT5zZyk7DQo+Pj4+PiAg
ICAgDQo+Pj4+PiAgICAgI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9BTURHUFVfVVNFUlBUUikN
Cj4+Pj4+IC0JaWYgKGd0dC0+cmFuZ2UgJiYNCj4+Pj4+IC0JICAgIHR0bS0+cGFnZXNbMF0gPT0g
aG1tX2RldmljZV9lbnRyeV90b19wYWdlKGd0dC0+cmFuZ2UsDQo+Pj4+PiAtCQkJCQkJICAgICAg
Z3R0LT5yYW5nZS0+cGZuc1swXSkpDQo+Pj4+PiAtCQlXQVJOX09OQ0UoMSwgIk1pc3NpbmcgZ2V0
X3VzZXJfcGFnZV9kb25lXG4iKTsNCj4+Pj4+ICsJaWYgKGd0dC0+cmFuZ2UpIHsNCj4+Pj4+ICsJ
CXVuc2lnbmVkIGxvbmcgaTsNCj4+Pj4+ICsNCj4+Pj4+ICsJCWZvciAoaSA9IDA7IGkgPCB0dG0t
Pm51bV9wYWdlczsgaSsrKSB7DQo+Pj4+PiArCQkJaWYgKHR0bS0+cGFnZXNbaV0gIT0NCj4+Pj4+
ICsJCQkJaG1tX2RldmljZV9lbnRyeV90b19wYWdlKGd0dC0+cmFuZ2UsDQo+Pj4+PiArCQkJCQkg
ICAgICBndHQtPnJhbmdlLT5wZm5zW2ldKSkNCj4+Pj4+ICsJCQkJYnJlYWs7DQo+Pj4+PiArCQl9
DQo+Pj4+PiArDQo+Pj4+PiArCQlXQVJOKChpID09IHR0bS0+bnVtX3BhZ2VzKSwgIk1pc3Npbmcg
Z2V0X3VzZXJfcGFnZV9kb25lXG4iKTsNCj4+Pj4+ICsJfQ0KPj4+Pg0KPj4+PiBJcyB0aGlzIHJl
bGF0ZWQvbmVjZXNzYXJ5PyBJIGNhbiBwdXQgaXQgaW4gYW5vdGhlciBwYXRjaCBpZiBpdCBpcyBq
dXN0DQo+Pj4+IGRlYnVnZ2luZyBpbXByb3ZlbWVudD8gUGxlYXNlIGFkdmlzZQ0KPj4+Pg0KPj4+
IEkgc2VlIHRoaXMgV0FSTiBiYWNrdHJhY2Ugbm93LCBidXQgSSBkaWRuJ3Qgc2VlIGl0IGJlZm9y
ZS4gVGhpcyBpcw0KPj4+IHNvbWVob3cgcmVsYXRlZC4NCj4+DQo+PiBIbSwgbWlnaHQgYmUgaW5z
dHJ1Y3RpdmUgdG8gbGVhcm4gd2hhdCBpcyBnb2luZyBvbi4uDQo+Pg0KPj4gVGhhbmtzLA0KPj4g
SmFzb24NCj4+DQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA0KPiANCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

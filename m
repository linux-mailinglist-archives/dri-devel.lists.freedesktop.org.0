Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3443EC4ED
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 15:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A00E6F818;
	Fri,  1 Nov 2019 14:44:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750054.outbound.protection.outlook.com [40.107.75.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B825D6F818;
 Fri,  1 Nov 2019 14:44:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVsQ3+vAvWEvNg/20qysyCpuBr6TWXgdI/Z95sb7EBJpNFu0h+8n5otHtiN6lxqN7RF38R2W3LUCRoJ90Tm2rXyY9KctqstPkIpTOndThtGCJbK4ZLTcOPbFOrFUPikQEYXrTR8DuUsW7wSLBQkcYpoRmTbKRp9XKdLQ0853CMc0XjEd4Z6x41rWdQaJTILMopHwchDeWCrjQtA539rTamfTCNOM8jzLJ6ROTDm/tMvVVuN2rB09xBcVDpB5e4YYTYyoIj/sagPdsiJVIKZOIS4NOxdN3LpdV0pMarF4d++5PfgqMO7XzTFi6WL4cscw4PoD6MY2ok3yaDazWN/PiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/gYdaOI8x2bX1dIrOP77CnRKCRPFsrVkyEXAJteFIg=;
 b=JfhkkbwAPVqmCTDJzzRr5cY+B33fCXgWYMxL8ih52LZG8b/4oD6Tj/ngXwexk78FoKS3zUAWWsoBgoBp8rXkMkZqSpHxwpZv+lrfYuhgdLNgdn9/ydmbebqcbjfIelLwhj0ANweAQviyOQLIfkr5PtdkNOY+iDx7B9PBZzebaa3GrsVmE3++0eP1jqlpS1xJUjDYdCu+2G7w+zuyk0eAMTMimkGRhNpsvL0/qpCN/0BTigpjOagRsfRuPOP4rPuLcxUcybMjR3rjKPUqH2SsIpopiI6OrAFL955NrFdjZ0VNWlaw1tGEg25KYdHXevIZ88KLfatX+Z2sW9QuEMF/9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB4030.namprd12.prod.outlook.com (10.255.86.25) by
 MN2PR12MB3342.namprd12.prod.outlook.com (20.178.240.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Fri, 1 Nov 2019 14:44:51 +0000
Received: from MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9]) by MN2PR12MB4030.namprd12.prod.outlook.com
 ([fe80::1ee:c734:15e5:d8b9%5]) with mapi id 15.20.2387.027; Fri, 1 Nov 2019
 14:44:51 +0000
From: "Yang, Philip" <Philip.Yang@amd.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Topic: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Index: AQHVjcy5krMagvVO3k2ER8a03a+2l6dyANaAgAAA5gCABGh8AA==
Date: Fri, 1 Nov 2019 14:44:51 +0000
Message-ID: <30b2f569-bf7a-5166-c98d-4a4a13d1351f@amd.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-15-jgg@ziepe.ca>
 <a456ebd0-28cf-997b-31ff-72d9077a9b8e@amd.com>
 <20191029192544.GU22766@mellanox.com>
In-Reply-To: <20191029192544.GU22766@mellanox.com>
Accept-Language: en-ZA, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::47) To MN2PR12MB4030.namprd12.prod.outlook.com
 (2603:10b6:208:159::25)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1e84a755-144c-46ba-08a3-08d75eda0d22
x-ms-traffictypediagnostic: MN2PR12MB3342:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3342C5C26DA97994E45ED02DE6620@MN2PR12MB3342.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(189003)(199004)(4326008)(99286004)(316002)(2616005)(476003)(2906002)(229853002)(6512007)(3846002)(53546011)(31686004)(14454004)(25786009)(36756003)(66446008)(6116002)(66946007)(54906003)(66066001)(66476007)(66616009)(66556008)(64756008)(4744005)(486006)(11346002)(446003)(4001150100001)(81156014)(6916009)(76176011)(7416002)(305945005)(7736002)(86362001)(26005)(99936001)(6506007)(31696002)(386003)(102836004)(5660300002)(81166006)(6436002)(71200400001)(71190400001)(6246003)(6486002)(478600001)(256004)(8936002)(5024004)(8676002)(186003)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3342;
 H:MN2PR12MB4030.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VGDoQB5SWI1dnEqCrKNTaBPVuwOPOs4xKyjrmjCuZecHXxW+bHJfwvKzWHsR5H4NITm72kh/2dDSYEPuggMn5PdtUkVQ51ewEk1xibdA8xGO+oLDceqqhc73Lfxww3StuElw2CDctdN78TCFLWJSdNMIxe0i3MuQY9Xs2QMy8gj9BGKxCI0oQDzNVTGS6J7Anm3FQqqi+u37gF7Wk88QRc9aAI6akRYMTySg+Cc8PUvB7i1fjJohJJDOCE65APiSW7VXwopmxhB0aKx8s+y805P+cyAKTRCEIrQVZUt8GBdx8nlpEhNVnBGIfvmIK9NWRQWfDQFsvFaMP7/KxD7wO7a+AzkjEw7mgaatEY9T/KNcfxsXZHJGu8VRcb7vKRev5ow0paXZ2shhkoUal94/3VBoF4gyjtgzfMFriFUfXkqjWqXsdrZMCoaAql8gwW1f
Content-Type: multipart/mixed;
 boundary="_002_30b2f569bf7a5166c98d4a4a13d1351famdcom_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e84a755-144c-46ba-08a3-08d75eda0d22
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 14:44:51.4878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CKQ7c71vRiI+FvQgBL3GLjt2Qjl7mKen8t6YK+ysETD/CZd3kiTUwdb9rOgJXs0/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3342
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/gYdaOI8x2bX1dIrOP77CnRKCRPFsrVkyEXAJteFIg=;
 b=iNhMWRLZfgriKhRVHFHrrOsGiv56NajvZqkVmtfNdnvFvlRL9CW0P0TBnJvBq16SinGGfITf2EDGJmOYTuQGw90k0+HsRBlEZqJMR3Y4rRc9AJAq8lyK920PIy2iIBFYajsG2cROpC+Q62+sPmebePvvE/usb0QEKYtFd4g5XHg=
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Ben Skeggs <bskeggs@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Jerome Glisse <jglisse@redhat.com>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 Juergen Gross <jgross@suse.com>, Mike Marciniszyn <mike.marciniszyn@intel.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_002_30b2f569bf7a5166c98d4a4a13d1351famdcom_
Content-Type: text/plain; charset="utf-8"
Content-ID: <C03A7A635863A34A87DE1F3224C32099@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

DQoNCk9uIDIwMTktMTAtMjkgMzoyNSBwLm0uLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6DQo+IE9u
IFR1ZSwgT2N0IDI5LCAyMDE5IGF0IDA3OjIyOjM3UE0gKzAwMDAsIFlhbmcsIFBoaWxpcCB3cm90
ZToNCj4+IEhpIEphc29uLA0KPj4NCj4+IEkgZGlkIHF1aWNrIHRlc3QgYWZ0ZXIgbWVyZ2luZyBh
bWQtc3RhZ2luZy1kcm0tbmV4dCB3aXRoIHRoZQ0KPj4gbW11X25vdGlmaWVyIGJyYW5jaCwgd2hp
Y2ggaW5jbHVkZXMgdGhpcyBzZXQgY2hhbmdlcy4gVGhlIHRlc3QgcmVzdWx0DQo+PiBoYXMgZGlm
ZmVyZW50IGZhaWx1cmVzLCBhcHAgc3R1Y2sgaW50ZXJtaXR0ZW50bHksIEdVSSBubyBkaXNwbGF5
IGV0Yy4gSQ0KPj4gYW0gdW5kZXJzdGFuZGluZyB0aGUgY2hhbmdlcyBhbmQgd2lsbCB0cnkgdG8g
ZmlndXJlIG91dCB0aGUgY2F1c2UuDQo+IA0KPiBUaGFua3MhIEknbSBub3Qgc3VycHJpc2VkIGJ5
IHRoaXMgZ2l2ZW4gaG93IGRpZmZpY3VsdCB0aGlzIHBhdGNoIHdhcw0KPiB0byBtYWtlLiBMZXQg
bWUga25vdyBpZiBJIGNhbiBhc3Npc3QgaW4gYW55IHdheQ0KPiANCj4gUGxlYXNlIGVuc3VyZSB0
byBydW4gd2l0aCBsb2NrZGVwIGVuYWJsZWQuLiBZb3VyIHN5bXB0b3BzIHNvdW5kcyBzb3J0DQo+
IG9mIGxpa2UgZGVhZGxvY2tpbmc/DQo+IA0KSGkgSmFzb24sDQoNCkF0dGFjaGVkIHBhdGNoIGZp
eCBzZXZlcmFsIGlzc3VlcyBpbiBhbWRncHUgZHJpdmVyLCBtYXliZSB5b3UgY2FuIHNxdWFzaCAN
CnRoaXMgaW50byBwYXRjaCAxNC4gV2l0aCB0aGlzIGlzIGRvbmUsIHBhdGNoIDEyLCAxMywgMTQg
aXMgUmV2aWV3ZWQtYnkgDQphbmQgVGVzdGVkLWJ5IFBoaWxpcCBZYW5nIDxwaGlsaXAueWFuZ0Bh
bWQuY29tPg0KDQpSZWdhcmRzLA0KUGhpbGlwDQoNCj4gUmVnYXJkcywNCj4gSmFzb24NCj4gDQo=

--_002_30b2f569bf7a5166c98d4a4a13d1351famdcom_
Content-Type: text/x-patch;
	name="0001-drm-amdgpu-issues-with-new-mmu_range_notifier-api.patch"
Content-Description:  0001-drm-amdgpu-issues-with-new-mmu_range_notifier-api.patch
Content-Disposition: attachment;
	filename="0001-drm-amdgpu-issues-with-new-mmu_range_notifier-api.patch";
	size=5274; creation-date="Fri, 01 Nov 2019 14:44:51 GMT";
	modification-date="Fri, 01 Nov 2019 14:44:51 GMT"
Content-ID: <E67811A1EA16E145B2E72546F8F70301@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

RnJvbSA1YTBiZDRkOGNlZjg0NzJmZTI5MDQ1NTAxNDJkMjg4ZmVlZDhjZDgxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+DQpE
YXRlOiBUaHUsIDMxIE9jdCAyMDE5IDA5OjEwOjMwIC0wNDAwDQpTdWJqZWN0OiBbUEFUQ0hdIGRy
bS9hbWRncHU6IGlzc3VlcyB3aXRoIG5ldyBtbXVfcmFuZ2Vfbm90aWZpZXIgYXBpDQoNCnB1dCBt
bXVfcmFuZ2Vfc2V0X3NlcSB1bmRlciB0aGUgc2FtZSBsb2NrIHdoaWNoIGlzIHVzZWQgdG8gY2Fs
bA0KbW11X3JhbmdlX3JlYWRfcmV0cnkuDQoNCmZpeCBhbWRncHVfdHRtX3R0X2dldF91c2VyX3Bh
Z2VzX2RvbmUgcmV0dXJuIHZhbHVlLCBiZWNhdXNlDQptbXVfcmFuZ2VfcmVhZF9yZXRyeSBtZWFu
cyAhaG1tX3JhbmdlX3ZhbGlkDQoNCnJldHJ5IGlmIGhtbV9yYW5nZV9mYXVsdCByZXR1cm4gLUVC
VVNZDQoNCmZpeCBmYWxzZSBXQVJOIGZvciBtaXNzaW5nIGdldF91c2VyX3BhZ2VfZG9uZSwgd2Ug
c2hvdWxkIGNoZWNrIGFsbA0KcGFnZXMgbm90IGp1c3QgdGhlIGZpcnN0IHBhZ2UsIGRvbid0IHVu
ZGVyc3RhbmQgd2h5IHRoaXMgaXNzdWUgaXMNCnRyaWdnZXJlZCBieSB0aGlzIGNoYW5nZS4NCg0K
U2lnbmVkLW9mZi1ieTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+DQotLS0NCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYyAgfCAzMiArKysrKysrLS0tLS0t
LS0tLS0tLS0NCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgfCAzNyAr
KysrKysrKysrKysrKysrKy0tLS0tLS0tDQogMiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25z
KCspLCAzMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9tbi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21u
LmMNCmluZGV4IGNiNzE4YTA2NGViNC4uYzhiYmQwNmYxMDA5IDEwMDY0NA0KLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMNCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9tbi5jDQpAQCAtNjcsMjEgKzY3LDE1IEBAIHN0YXRpYyBib29sIGFt
ZGdwdV9tbl9pbnZhbGlkYXRlX2dmeChzdHJ1Y3QgbW11X3JhbmdlX25vdGlmaWVyICptcm4sDQog
CXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KGJvLT50Ym8uYmRl
dik7DQogCWxvbmcgcjsNCiANCi0JLyoNCi0JICogRklYTUU6IE11c3QgaG9sZCBzb21lIGxvY2sg
c2hhcmVkIHdpdGgNCi0JICogYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlc19kb25lKCkNCi0J
ICovDQotCW1tdV9yYW5nZV9zZXRfc2VxKG1ybiwgY3VyX3NlcSk7DQorCW11dGV4X2xvY2soJmFk
ZXYtPm5vdGlmaWVyX2xvY2spOw0KIA0KLQkvKiBGSVhNRTogSXMgdGhpcyBuZWNlc3Nhcnk/ICov
DQotCWlmICghYW1kZ3B1X3R0bV90dF9hZmZlY3RfdXNlcnB0cihiby0+dGJvLnR0bSwgcmFuZ2Ut
PnN0YXJ0LA0KLQkJCQkJICByYW5nZS0+ZW5kKSkNCi0JCXJldHVybiB0cnVlOw0KKwltbXVfcmFu
Z2Vfc2V0X3NlcShtcm4sIGN1cl9zZXEpOw0KIA0KLQlpZiAoIW1tdV9ub3RpZmllcl9yYW5nZV9i
bG9ja2FibGUocmFuZ2UpKQ0KKwlpZiAoIW1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2FibGUocmFu
Z2UpKSB7DQorCQltdXRleF91bmxvY2soJmFkZXYtPm5vdGlmaWVyX2xvY2spOw0KIAkJcmV0dXJu
IGZhbHNlOw0KKwl9DQogDQotCW11dGV4X2xvY2soJmFkZXYtPm5vdGlmaWVyX2xvY2spOw0KIAly
ID0gZG1hX3Jlc3Zfd2FpdF90aW1lb3V0X3JjdShiby0+dGJvLmJhc2UucmVzdiwgdHJ1ZSwgZmFs
c2UsDQogCQkJCSAgICAgIE1BWF9TQ0hFRFVMRV9USU1FT1VUKTsNCiAJbXV0ZXhfdW5sb2NrKCZh
ZGV2LT5ub3RpZmllcl9sb2NrKTsNCkBAIC0xMTAsMjEgKzEwNCwxNSBAQCBzdGF0aWMgYm9vbCBh
bWRncHVfbW5faW52YWxpZGF0ZV9oc2Eoc3RydWN0IG1tdV9yYW5nZV9ub3RpZmllciAqbXJuLA0K
IAlzdHJ1Y3QgYW1kZ3B1X2JvICpibyA9IGNvbnRhaW5lcl9vZihtcm4sIHN0cnVjdCBhbWRncHVf
Ym8sIG5vdGlmaWVyKTsNCiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRt
X2FkZXYoYm8tPnRiby5iZGV2KTsNCiANCi0JLyoNCi0JICogRklYTUU6IE11c3QgaG9sZCBzb21l
IGxvY2sgc2hhcmVkIHdpdGgNCi0JICogYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlc19kb25l
KCkNCi0JICovDQotCW1tdV9yYW5nZV9zZXRfc2VxKG1ybiwgY3VyX3NlcSk7DQorCW11dGV4X2xv
Y2soJmFkZXYtPm5vdGlmaWVyX2xvY2spOw0KIA0KLQkvKiBGSVhNRTogSXMgdGhpcyBuZWNlc3Nh
cnk/ICovDQotCWlmICghYW1kZ3B1X3R0bV90dF9hZmZlY3RfdXNlcnB0cihiby0+dGJvLnR0bSwg
cmFuZ2UtPnN0YXJ0LA0KLQkJCQkJICByYW5nZS0+ZW5kKSkNCi0JCXJldHVybiB0cnVlOw0KKwlt
bXVfcmFuZ2Vfc2V0X3NlcShtcm4sIGN1cl9zZXEpOw0KIA0KLQlpZiAoIW1tdV9ub3RpZmllcl9y
YW5nZV9ibG9ja2FibGUocmFuZ2UpKQ0KKwlpZiAoIW1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2Fi
bGUocmFuZ2UpKSB7DQorCQltdXRleF91bmxvY2soJmFkZXYtPm5vdGlmaWVyX2xvY2spOw0KIAkJ
cmV0dXJuIGZhbHNlOw0KKwl9DQogDQotCW11dGV4X2xvY2soJmFkZXYtPm5vdGlmaWVyX2xvY2sp
Ow0KIAlhbWRncHVfYW1ka2ZkX2V2aWN0X3VzZXJwdHIoYm8tPmtmZF9ibywgYm8tPm5vdGlmaWVy
Lm1tKTsNCiAJbXV0ZXhfdW5sb2NrKCZhZGV2LT5ub3RpZmllcl9sb2NrKTsNCiANCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCmluZGV4IGEzODQzN2ZkMjkwYS4uNTZmZGU0
M2Q1ZWZhIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCkBAIC03
OTksMTAgKzc5OSwxMSBAQCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3Qg
YW1kZ3B1X2JvICpibywgc3RydWN0IHBhZ2UgKipwYWdlcykNCiB7DQogCXN0cnVjdCB0dG1fdHQg
KnR0bSA9IGJvLT50Ym8udHRtOw0KIAlzdHJ1Y3QgYW1kZ3B1X3R0bV90dCAqZ3R0ID0gKHZvaWQg
Kil0dG07DQotCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tOw0KLQlzdHJ1Y3QgaG1tX3JhbmdlICpyYW5n
ZTsNCiAJdW5zaWduZWQgbG9uZyBzdGFydCA9IGd0dC0+dXNlcnB0cjsNCiAJc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWE7DQorCXN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlOw0KKwl1bnNpZ25lZCBs
b25nIHRpbWVvdXQ7DQorCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tOw0KIAl1bnNpZ25lZCBsb25nIGk7
DQogCWludCByID0gMDsNCiANCkBAIC04NDEsOCArODQyLDYgQEAgaW50IGFtZGdwdV90dG1fdHRf
Z2V0X3VzZXJfcGFnZXMoc3RydWN0IGFtZGdwdV9ibyAqYm8sIHN0cnVjdCBwYWdlICoqcGFnZXMp
DQogCQlnb3RvIG91dF9mcmVlX3JhbmdlczsNCiAJfQ0KIA0KLQlyYW5nZS0+bm90aWZpZXJfc2Vx
ID0gbW11X3JhbmdlX3JlYWRfYmVnaW4oJmJvLT5ub3RpZmllcik7DQotDQogCWRvd25fcmVhZCgm
bW0tPm1tYXBfc2VtKTsNCiAJdm1hID0gZmluZF92bWEobW0sIHN0YXJ0KTsNCiAJaWYgKHVubGlr
ZWx5KCF2bWEgfHwgc3RhcnQgPCB2bWEtPnZtX3N0YXJ0KSkgew0KQEAgLTg1NCwxMiArODUzLDIw
IEBAIGludCBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRncHVfYm8gKmJv
LCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKQ0KIAkJciA9IC1FUEVSTTsNCiAJCWdvdG8gb3V0X3VubG9j
azsNCiAJfQ0KKwl1cF9yZWFkKCZtbS0+bW1hcF9zZW0pOw0KKwl0aW1lb3V0ID0gamlmZmllcyAr
IG1zZWNzX3RvX2ppZmZpZXMoSE1NX1JBTkdFX0RFRkFVTFRfVElNRU9VVCk7DQorDQorcmV0cnk6
DQorCXJhbmdlLT5ub3RpZmllcl9zZXEgPSBtbXVfcmFuZ2VfcmVhZF9iZWdpbigmYm8tPm5vdGlm
aWVyKTsNCiANCisJZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOw0KIAlyID0gaG1tX3JhbmdlX2Zh
dWx0KHJhbmdlLCAwKTsNCiAJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsNCi0NCi0JaWYgKHVubGlr
ZWx5KHIgPCAwKSkNCisJaWYgKHVubGlrZWx5KHIgPD0gMCkpIHsNCisJCWlmICgociA9PSAwIHx8
IHIgPT0gLUVCVVNZKSAmJiAhdGltZV9hZnRlcihqaWZmaWVzLCB0aW1lb3V0KSkNCisJCQlnb3Rv
IHJldHJ5Ow0KIAkJZ290byBvdXRfZnJlZV9wZm5zOw0KKwl9DQogDQogCWZvciAoaSA9IDA7IGkg
PCB0dG0tPm51bV9wYWdlczsgaSsrKSB7DQogCQlwYWdlc1tpXSA9IGhtbV9kZXZpY2VfZW50cnlf
dG9fcGFnZShyYW5nZSwgcmFuZ2UtPnBmbnNbaV0pOw0KQEAgLTkxNiw3ICs5MjMsNyBAQCBib29s
IGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXNfZG9uZShzdHJ1Y3QgdHRtX3R0ICp0dG0pDQog
CQlndHQtPnJhbmdlID0gTlVMTDsNCiAJfQ0KIA0KLQlyZXR1cm4gcjsNCisJcmV0dXJuICFyOw0K
IH0NCiAjZW5kaWYNCiANCkBAIC05OTcsMTAgKzEwMDQsMTggQEAgc3RhdGljIHZvaWQgYW1kZ3B1
X3R0bV90dF91bnBpbl91c2VycHRyKHN0cnVjdCB0dG1fdHQgKnR0bSkNCiAJc2dfZnJlZV90YWJs
ZSh0dG0tPnNnKTsNCiANCiAjaWYgSVNfRU5BQkxFRChDT05GSUdfRFJNX0FNREdQVV9VU0VSUFRS
KQ0KLQlpZiAoZ3R0LT5yYW5nZSAmJg0KLQkgICAgdHRtLT5wYWdlc1swXSA9PSBobW1fZGV2aWNl
X2VudHJ5X3RvX3BhZ2UoZ3R0LT5yYW5nZSwNCi0JCQkJCQkgICAgICBndHQtPnJhbmdlLT5wZm5z
WzBdKSkNCi0JCVdBUk5fT05DRSgxLCAiTWlzc2luZyBnZXRfdXNlcl9wYWdlX2RvbmVcbiIpOw0K
KwlpZiAoZ3R0LT5yYW5nZSkgew0KKwkJdW5zaWduZWQgbG9uZyBpOw0KKw0KKwkJZm9yIChpID0g
MDsgaSA8IHR0bS0+bnVtX3BhZ2VzOyBpKyspIHsNCisJCQlpZiAodHRtLT5wYWdlc1tpXSAhPQ0K
KwkJCQlobW1fZGV2aWNlX2VudHJ5X3RvX3BhZ2UoZ3R0LT5yYW5nZSwNCisJCQkJCSAgICAgIGd0
dC0+cmFuZ2UtPnBmbnNbaV0pKQ0KKwkJCQlicmVhazsNCisJCX0NCisNCisJCVdBUk4oKGkgPT0g
dHRtLT5udW1fcGFnZXMpLCAiTWlzc2luZyBnZXRfdXNlcl9wYWdlX2RvbmVcbiIpOw0KKwl9DQog
I2VuZGlmDQogfQ0KIA0KLS0gDQoyLjE3LjENCg0K

--_002_30b2f569bf7a5166c98d4a4a13d1351famdcom_
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--_002_30b2f569bf7a5166c98d4a4a13d1351famdcom_--

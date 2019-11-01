Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C564ECBAD
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 23:49:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717806F88A;
	Fri,  1 Nov 2019 22:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140049.outbound.protection.outlook.com [40.107.14.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2CD6E293;
 Fri,  1 Nov 2019 17:42:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bchm8DeQlCNYOXY/lj/ITNFi3RY6Y70l0brs3Kgf0Z/cj+5pqKYdzdx8gFxUpMoITPb+uwgELlQx5fH99P3HHv58Ydpu1x31aPK6gOA83rDB+tsQ9kJ9SpOszIszFOS945IWFcMba1fwVUIp/86rUqiAMJQnjHnm2DURV8iqUlY5QdIFhQKDEChKVAQpSyC5cfteDBXaq9ilrULSonXLv/DDTOAeKNrtvtYn3FEZOMTdvE9bsxMPZzU14eIOldheB/VZNddCO05NGoYF2G/5zbx5S/CjOQhm0Lxsq85BIaZJabjxFfSdzrwhCutWF4souHGuJMSs+VfYURlcbsVeAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWZJ+xeas6XhzceIPpCCcy37V5dyZk91GfPxboiHBZQ=;
 b=PNWAr0aEOsXfbuvKGQjuqjggCkMd1+b+Tw0EGDc3x4DvpoZzBti3ycOrU1KeyzxCO9+Ka6zwBLi6TUwF5hmvtwkj534NqxeCcn4e7Qi6tF+CZVaxWiAsTd4myadfrih36/tVIXrNjslhrJyvZDZXR1FVaDChPXC+W0O6Mqx40YlEJKNXYYlftOxGuEvymmhQLJotgeZ6shFZdT1SxRhRIDwNIAN7MCw8gIoWiKl835un6Zt2vHgx1CKBuA724qMkcsMLRdE3OkJDuFPxBAob9Rj+NyvYitKkzMpDG/Y4GtDyg780vAgb/GK0TfYuNC0f+1qMF65dmxgXvVFL6BhsNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5437.eurprd05.prod.outlook.com (20.177.201.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.17; Fri, 1 Nov 2019 17:42:32 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2387.028; Fri, 1 Nov 2019
 17:42:32 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Yang, Philip" <Philip.Yang@amd.com>
Subject: Re: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Topic: [PATCH v2 14/15] drm/amdgpu: Use mmu_range_notifier instead of
 hmm_mirror
Thread-Index: AQHVjcvOUfhzqykxXkO0v7SQaQq3BKdyANqAgAAA3wCABGiEgIAAB7AAgAANJwCAABzBgA==
Date: Fri, 1 Nov 2019 17:42:32 +0000
Message-ID: <20191101174221.GO22766@mellanox.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-15-jgg@ziepe.ca>
 <a456ebd0-28cf-997b-31ff-72d9077a9b8e@amd.com>
 <20191029192544.GU22766@mellanox.com>
 <30b2f569-bf7a-5166-c98d-4a4a13d1351f@amd.com>
 <20191101151222.GN22766@mellanox.com>
 <8280fb65-a897-3d71-79f9-9f80d9e474e9@amd.com>
In-Reply-To: <8280fb65-a897-3d71-79f9-9f80d9e474e9@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR19CA0059.namprd19.prod.outlook.com
 (2603:10b6:208:19b::36) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 40141626-f1db-484e-9c1c-08d75ef2df5c
x-ms-traffictypediagnostic: VI1PR05MB5437:
x-microsoft-antispam-prvs: <VI1PR05MB543752CC8542C603489894ADCF620@VI1PR05MB5437.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 020877E0CB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(189003)(199004)(305945005)(66066001)(64756008)(316002)(1076003)(71200400001)(2906002)(99286004)(6436002)(76176011)(6486002)(52116002)(14454004)(478600001)(4326008)(81166006)(8936002)(8676002)(5660300002)(229853002)(186003)(26005)(54906003)(486006)(36756003)(66446008)(66556008)(66476007)(256004)(14444005)(81156014)(2616005)(6512007)(7416002)(6916009)(476003)(446003)(11346002)(86362001)(25786009)(71190400001)(386003)(102836004)(3846002)(6506007)(6116002)(7736002)(33656002)(6246003)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5437;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JHnX+mDnhQTEJ/8vRWmTqF5EqhjM5XCJczY0EKJOY8Aea4SmymXL7wo8LP9BXPuzMhvpPeVb+VyLcV+dHlQD39hwg7dvtyII/VwYvLaWnLQoJ0W+YEFopQdipxASU8gSgdRnq2zydilrKwKK7ZbWQ7qQf8LTCMZjeNYdbMuynq5b9JXbJ0fyOa+ElStvpVreC2F2DB2yqI4S5JmRoDRJ+Tw1k5HeUDB99hZwOLh0Kndy40ZFbOGIEKk2LKjfHif/Q9LA/PVz2uTk49XhcC0CqpHLWbPItX5218240Uw++tHVPv1I2te15kaQ7NhB1g9setU/+isjWN2Ka0mgoxweiaRDEidEw3JsiLsjlwwdxDf+ArueQ+HPdaHlQ3y8u5S7OKQkLnEyvQRZg50+hoRgkwiR4Q+nLMIv8Wk0lYLTrZzMnTLVtjOPHbPo403KYH1+
x-ms-exchange-transport-forked: True
Content-ID: <AF9CCF2DA50D054FAB60B8932C09BE36@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40141626-f1db-484e-9c1c-08d75ef2df5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2019 17:42:32.2827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YX05WhGl/n9htcVT65uicoOpgdBYa3GCY1qv0+ia3D0HZbLhgadtvSD/dPNmwJPfCmu9fZ70dAanlqIa+EwjIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5437
X-Mailman-Approved-At: Fri, 01 Nov 2019 22:49:38 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWZJ+xeas6XhzceIPpCCcy37V5dyZk91GfPxboiHBZQ=;
 b=IBxSd8QnIBB29Fi945yOI//0OVLntYEAPyc8sdnJ79/SJkYbWuLz6YtSBh1G5ATrClJexcDK5IGRfv3x4aHWbRhmqdk9BehtIgieWxpnK7zt16VYvsIKsLbVHNoS1LJ9BQcZlVkHUEuk3/Fhf73cbi1m6zoQV1goZyexjVKpO50=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDEsIDIwMTkgYXQgMDM6NTk6MjZQTSArMDAwMCwgWWFuZywgUGhpbGlwIHdy
b3RlOgo+ID4gVGhpcyB0ZXN0IGZvciByYW5nZV9ibG9ja2FibGUgc2hvdWxkIGJlIGJlZm9yZSBt
dXRleF9sb2NrLCBJIGNhbiBtb3ZlCj4gPiBpdCB1cAo+ID4gCj4geWVzLCB0aGFua3MuCgpPa2F5
LCBJIHdyb3RlIGl0IGxpa2UgdGhpczoKCglpZiAobW11X25vdGlmaWVyX3JhbmdlX2Jsb2NrYWJs
ZShyYW5nZSkpCgkJbXV0ZXhfbG9jaygmYWRldi0+bm90aWZpZXJfbG9jayk7CgllbHNlIGlmICgh
bXV0ZXhfdHJ5bG9jaygmYWRldi0+bm90aWZpZXJfbG9jaykpCgkJcmV0dXJuIGZhbHNlOwoKPiA+
IEFsc28sIGRvIHlvdSBrbm93IGlmIG5vdGlmaWVyX2xvY2sgaXMgaGVsZCB3aGlsZSBjYWxsaW5n
Cj4gPiBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzX2RvbmUoKT8gQ2FuIHdlIGFkZCBhICds
b2NrIGFzc2VydCBoZWxkJwo+ID4gdG8gYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlc19kb25l
KCk/Cj4gCj4gZ3B1IHNpZGUgaG9sZCBub3RpZmllcl9sb2NrIGJ1dCBrZmQgc2lkZSBkb2Vzbid0
LiBrZmQgc2lkZSBkb2Vzbid0IGNoZWNrIAo+IGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXNf
ZG9uZS9tbXVfcmFuZ2VfcmVhZF9yZXRyeSByZXR1cm4gdmFsdWUgYnV0IAo+IGNoZWNrIG1lbS0+
aW52YWxpZCBmbGFnIHdoaWNoIGlzIHVwZGF0ZWQgZnJvbSBpbnZhbGlkYXRlIGNhbGxiYWNrLiBJ
dCAKPiB0YWtlcyBtb3JlIHRpbWUgdG8gY2hhbmdlLCBJIHdpbGwgY29tZSB0byBhbm90aGVyIHBh
dGNoIHRvIGZpeCBpdCBsYXRlci4KCkFoLi4gY29uZnVzaW5nLCBPSywgSSdsbCBsZXQgeW91IHNv
cnQgdGhhdAoKPiA+IEhvd2V2ZXIsIHRoaXMgaXMgYWxsIHByZS1leGlzdGluZyBidWdzLCBzbyBJ
J20gT0sgZ28gYWhlYWQgd2l0aCB0aGlzCj4gPiBwYXRjaCBhcyBtb2RpZmllZC4gSSBhZHZpc2Ug
QU1EIHRvIG1ha2UgYSBmb2xsb3d1cCBwYXRjaCAuLgo+ID4gCj4geWVzLCBJIHdpbGwuCgpXaGls
ZSB5b3UgYXJlIGhlcmUsIHRoaXMgaXMgYWxzbyB3cm9uZzoKCmludCBhbWRncHVfdHRtX3R0X2dl
dF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRncHVfYm8gKmJvLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKQp7
Cglkb3duX3JlYWQoJm1tLT5tbWFwX3NlbSk7CglyID0gaG1tX3JhbmdlX2ZhdWx0KHJhbmdlLCAw
KTsKCXVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7CglpZiAodW5saWtlbHkociA8PSAwKSkgewoJCWlm
ICgociA9PSAwIHx8IHIgPT0gLUVCVVNZKSAmJiAhdGltZV9hZnRlcihqaWZmaWVzLCB0aW1lb3V0
KSkKCQkJZ290byByZXRyeTsKCQlnb3RvIG91dF9mcmVlX3BmbnM7Cgl9CgoJZm9yIChpID0gMDsg
aSA8IHR0bS0+bnVtX3BhZ2VzOyBpKyspIHsKCQlwYWdlc1tpXSA9IGhtbV9kZXZpY2VfZW50cnlf
dG9fcGFnZShyYW5nZSwgcmFuZ2UtPnBmbnNbaV0pOwoKSXQgaXMgbm90IGFsbG93ZWQgdG8gcmVh
ZCB0aGUgcmVzdWx0cyBvZiBobW1fcmFuZ2VfZmF1bHQoKSBvdXRzaWRlCmxvY2tpbmcsIGFuZCBp
biBwYXJ0aWN1bGFyLCB3ZSBjYW4ndCBjb252ZXJ0IHRvIGEgc3RydWN0IHBhZ2UuCgpUaGlzIG11
c3QgYmUgZG9uZSBpbnNpZGUgdGhlIG5vdGlmaWVyX2xvY2ssIGFmdGVyIGNoZWNraW5nCm1tdV9y
YW5nZV9yZWFkX3JldHJ5KCksIGFsbCBoYW5kbGluZyBvZiB0aGUgc3RydWN0IHBhZ2UgbXVzdCBi
ZQpzdHJ1Y3R1cmVkIGxpa2UgdGhhdC4KCj4gPj4gQEAgLTk5NywxMCArMTAwNCwxOCBAQCBzdGF0
aWMgdm9pZCBhbWRncHVfdHRtX3R0X3VucGluX3VzZXJwdHIoc3RydWN0IHR0bV90dCAqdHRtKQo+
ID4+ICAgCXNnX2ZyZWVfdGFibGUodHRtLT5zZyk7Cj4gPj4gICAKPiA+PiAgICNpZiBJU19FTkFC
TEVEKENPTkZJR19EUk1fQU1ER1BVX1VTRVJQVFIpCj4gPj4gLQlpZiAoZ3R0LT5yYW5nZSAmJgo+
ID4+IC0JICAgIHR0bS0+cGFnZXNbMF0gPT0gaG1tX2RldmljZV9lbnRyeV90b19wYWdlKGd0dC0+
cmFuZ2UsCj4gPj4gLQkJCQkJCSAgICAgIGd0dC0+cmFuZ2UtPnBmbnNbMF0pKQo+ID4+IC0JCVdB
Uk5fT05DRSgxLCAiTWlzc2luZyBnZXRfdXNlcl9wYWdlX2RvbmVcbiIpOwo+ID4+ICsJaWYgKGd0
dC0+cmFuZ2UpIHsKPiA+PiArCQl1bnNpZ25lZCBsb25nIGk7Cj4gPj4gKwo+ID4+ICsJCWZvciAo
aSA9IDA7IGkgPCB0dG0tPm51bV9wYWdlczsgaSsrKSB7Cj4gPj4gKwkJCWlmICh0dG0tPnBhZ2Vz
W2ldICE9Cj4gPj4gKwkJCQlobW1fZGV2aWNlX2VudHJ5X3RvX3BhZ2UoZ3R0LT5yYW5nZSwKPiA+
PiArCQkJCQkgICAgICBndHQtPnJhbmdlLT5wZm5zW2ldKSkKPiA+PiArCQkJCWJyZWFrOwo+ID4+
ICsJCX0KPiA+PiArCj4gPj4gKwkJV0FSTigoaSA9PSB0dG0tPm51bV9wYWdlcyksICJNaXNzaW5n
IGdldF91c2VyX3BhZ2VfZG9uZVxuIik7Cj4gPj4gKwl9Cj4gPiAKPiA+IElzIHRoaXMgcmVsYXRl
ZC9uZWNlc3Nhcnk/IEkgY2FuIHB1dCBpdCBpbiBhbm90aGVyIHBhdGNoIGlmIGl0IGlzIGp1c3QK
PiA+IGRlYnVnZ2luZyBpbXByb3ZlbWVudD8gUGxlYXNlIGFkdmlzZQo+ID4gCj4gSSBzZWUgdGhp
cyBXQVJOIGJhY2t0cmFjZSBub3csIGJ1dCBJIGRpZG4ndCBzZWUgaXQgYmVmb3JlLiBUaGlzIGlz
IAo+IHNvbWVob3cgcmVsYXRlZC4KCkhtLCBtaWdodCBiZSBpbnN0cnVjdGl2ZSB0byBsZWFybiB3
aGF0IGlzIGdvaW5nIG9uLi4KClRoYW5rcywKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs

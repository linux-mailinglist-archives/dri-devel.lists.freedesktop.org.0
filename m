Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4CBE8CAC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 17:28:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344F46EC49;
	Tue, 29 Oct 2019 16:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750048.outbound.protection.outlook.com [40.107.75.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EE96E45C;
 Tue, 29 Oct 2019 16:28:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAsxBL69KGXzOPw5D7mDsLsCqqs5Q1rxSttdkwRoZuA65FJZuXPyJ1HeJvPnU+n/tBLLnqZq8thMGsFCSiVZGEHIeSqJ7vZhUzAhqjZIoGN1gQqb1czvi4Qz3LU8tFU36z+y1H1GF16rrJKCW2mAFZLBMa0QsnIEcUlXV0SuF5afhFPASaHLR7X4B7xDyKle+0830KgWWtwteLDnvUrQPPbQPQdn+3m4IYvvP+9j7CxgXwZXWAIr7hz6Sw7ORP+/n7DrqvFRquo3JqM0cqHnkA309FGcP6pwFRNnb0OaCi5kdgnXnnhnYgp/B82umQm270FvGk/ipCiMmwKF0eBbIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM4HQGFf5jwhxw53/ZbfRiCS0dODZvzRRONe8Bd2gR4=;
 b=TExJhqQbakxzFhA511WAXPTlP/Kv9FwbaAkyhDXYo0ZTcbZnxPKgK8lfasIypyhun1rg1Hy7ty/+RD5r7mS7/FQfRxjLa8M53SPS1jRZVfmQtJ5prLZJDldwFBkhBVP+ij0ffYr9KuEoxleFyomLxPDP0wt71K+Olkf6Zi6DEqx52ZhVncfK6dNZzMg8p2JfrJF+jlCp2YeBMdvlCdfyWe3VmIo/m44bS2zGM4q7H6fjjY+7qpODum0GqG6LWgdmypNT/nTSx5B9mRaRdpkZCZDP4hIGBDZSWHgUqmyfMl7rAfVrUV0CS53Iod6gFuHViOGk7LXtITAE9PRPUcPhoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB4204.namprd12.prod.outlook.com (10.141.184.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Tue, 29 Oct 2019 16:28:43 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::288c:66ec:203d:aede]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::288c:66ec:203d:aede%4]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 16:28:43 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 12/15] drm/amdgpu: Call find_vma under mmap_sem
Thread-Topic: [PATCH v2 12/15] drm/amdgpu: Call find_vma under mmap_sem
Thread-Index: AQHVjcvMsdGOdpRiX0m2MY8nHQRFKKdx0EAA
Date: Tue, 29 Oct 2019 16:28:43 +0000
Message-ID: <a368d1bf-ba69-bb63-2bfd-b674acc2f19b@amd.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-13-jgg@ziepe.ca>
In-Reply-To: <20191028201032.6352-13-jgg@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: YTBPR01CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::47) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d58d7527-6913-4eb7-0689-08d75c8d1042
x-ms-traffictypediagnostic: DM6PR12MB4204:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4204577115B45A7E5C3C937C92610@DM6PR12MB4204.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(189003)(199004)(65806001)(66066001)(99286004)(25786009)(65956001)(53546011)(6506007)(386003)(31696002)(186003)(14454004)(81166006)(81156014)(71190400001)(66574012)(71200400001)(102836004)(5660300002)(26005)(8936002)(316002)(58126008)(36756003)(6246003)(4326008)(54906003)(6116002)(3846002)(8676002)(256004)(478600001)(7736002)(14444005)(31686004)(2906002)(229853002)(110136005)(305945005)(6486002)(11346002)(446003)(2616005)(52116002)(76176011)(66446008)(64756008)(66556008)(66476007)(2501003)(66946007)(6436002)(476003)(486006)(6512007)(4001150100001)(86362001)(7416002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4204;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JX0Hhdw/PtF6MwtRUMdVX5O3FG1pCuBucETdlV3IllL4E9qQ7yOGVRdWPU7rFX2JpqA30XH5Hiq0kv1wjASITMLtW0XwB0VCiIZw/jCUayYxEfUPa+ghhhEXvlw0igKS95vyuqu4+jTG0fCplMo/m4Hy5+7wP/x1th1lXcTJk2pGKANiSEUbyV4UuIlx6u4bM25/4KDIWmuu7wvmj7/ghlUePYJiiaaNwa9m5Fe3Fhfb5KkFz7B4Mvfk8HzaVG8/nNFEqw11MJTNL6nOpD2ubHHg+u1N+RVsDpIPrluPBoQXnqGFOJCqhrr+0X3pEKXwTt/gVJi62pxAKwtHyqhzYN897vxkMi+37bUMsQVGttv+3Azkbxwnjd23hk4hNPplhbQcatr+BvyLmW1y3y+7prMnG6A7qiHefL5+L009cipy1w52Wq2pT8AQYpkll8zI
Content-ID: <8802A5E1B165854F856C0D7491F04952@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d58d7527-6913-4eb7-0689-08d75c8d1042
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 16:28:43.0620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R3C5J/8hc9ATQsgOD7nwlswh1nSkLYU5mGuLHFyyQVXWhM3s6x7VMw9g0b6KH7A1c57rNEFG/ZFaoCUYChx18Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4204
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VM4HQGFf5jwhxw53/ZbfRiCS0dODZvzRRONe8Bd2gR4=;
 b=B880JVNcl+ffmI6mtIfsxV4tXmxpniKm3CHytwSY4eu3gYtunfon8tVvVS9k8hZPfXqHOf+V8KKF2hQgewdYVhYjFr9MYVOpNkeI7PdDK2Stv32nW710hS+YmbUMfIp7tXBSrq7aldZI0usBvzqiH7BoDq7OCogn9BsHwrx6G/E=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Felix.Kuehling@amd.com; 
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
Cc: Juergen Gross <jgross@suse.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@mellanox.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0yOCA0OjEwIHAubS4sIEphc29uIEd1bnRob3JwZSB3cm90ZToNCj4gRnJvbTog
SmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPg0KPg0KPiBmaW5kX3ZtYSgpIG11c3Qg
YmUgY2FsbGVkIHVuZGVyIHRoZSBtbWFwX3NlbSwgcmVvcmdhbml6ZSB0aGlzIGNvZGUgdG8NCj4g
ZG8gdGhlIHZtYSBjaGVjayBhZnRlciBlbnRlcmluZyB0aGUgbG9jay4NCj4NCj4gRnVydGhlciwg
Zml4IHRoZSB1bmxvY2tlZCB1c2Ugb2Ygc3RydWN0IHRhc2tfc3RydWN0J3MgbW0sIGluc3RlYWQg
dXNlDQo+IHRoZSBtbSBmcm9tIGhtbV9taXJyb3Igd2hpY2ggaGFzIGFuIGFjdGl2ZSBtbV9ncmFi
LiBBbHNvIHRoZSBtbV9ncmFiDQo+IG11c3QgYmUgY29udmVydGVkIHRvIGEgbW1fZ2V0IGJlZm9y
ZSBhY3F1aXJpbmcgbW1hcF9zZW0gb3IgY2FsbGluZw0KPiBmaW5kX3ZtYSgpLg0KPg0KPiBGaXhl
czogNjZjNDU1MDBiZmRjICgiZHJtL2FtZGdwdTogdXNlIG5ldyBITU0gQVBJcyBhbmQgaGVscGVy
cyIpDQo+IEZpeGVzOiAwOTE5MTk1ZjJiMGQgKCJkcm0vYW1kZ3B1OiBFbmFibGUgYW1kZ3B1X3R0
bV90dF9nZXRfdXNlcl9wYWdlcyBpbiB3b3JrZXIgdGhyZWFkcyIpDQo+IENjOiBBbGV4IERldWNo
ZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IENjOiBEYXZpZCAoQ2h1bk1pbmcpIFpob3UgPERh
dmlkMS5aaG91QGFtZC5jb20+DQo+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBTaWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+DQoNCk9u
ZSBxdWVzdGlvbiBpbmxpbmUgdG8gY29uZmlybSBteSB1bmRlcnN0YW5kaW5nLiBPdGhlcndpc2Ug
dGhpcyBwYXRjaCBpcw0KDQpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhs
aW5nQGFtZC5jb20+DQoNCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMgfCAzNyArKysrKysrKysrKysrKy0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+IGluZGV4IGRmZjQxZDBhODVmZTk2Li5jMGU0
MWYxZjBjMjM2NSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3R0bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
Yw0KPiBAQCAtMzUsNiArMzUsNyBAQA0KPiAgICNpbmNsdWRlIDxsaW51eC9obW0uaD4NCj4gICAj
aW5jbHVkZSA8bGludXgvcGFnZW1hcC5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9zY2hlZC90YXNr
Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgvc2NoZWQvbW0uaD4NCj4gICAjaW5jbHVkZSA8bGludXgv
c2VxX2ZpbGUuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPiAgICNpbmNsdWRlIDxs
aW51eC9zd2FwLmg+DQo+IEBAIC03ODgsNyArNzg5LDcgQEAgaW50IGFtZGdwdV90dG1fdHRfZ2V0
X3VzZXJfcGFnZXMoc3RydWN0IGFtZGdwdV9ibyAqYm8sIHN0cnVjdCBwYWdlICoqcGFnZXMpDQo+
ICAgCXN0cnVjdCBobW1fbWlycm9yICptaXJyb3IgPSBiby0+bW4gPyAmYm8tPm1uLT5taXJyb3Ig
OiBOVUxMOw0KPiAgIAlzdHJ1Y3QgdHRtX3R0ICp0dG0gPSBiby0+dGJvLnR0bTsNCj4gICAJc3Ry
dWN0IGFtZGdwdV90dG1fdHQgKmd0dCA9ICh2b2lkICopdHRtOw0KPiAtCXN0cnVjdCBtbV9zdHJ1
Y3QgKm1tID0gZ3R0LT51c2VydGFzay0+bW07DQo+ICsJc3RydWN0IG1tX3N0cnVjdCAqbW07DQo+
ICAgCXVuc2lnbmVkIGxvbmcgc3RhcnQgPSBndHQtPnVzZXJwdHI7DQo+ICAgCXN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hOw0KPiAgIAlzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZTsNCj4gQEAgLTc5
NiwyNSArNzk3LDE0IEBAIGludCBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzKHN0cnVjdCBh
bWRncHVfYm8gKmJvLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKQ0KPiAgIAl1aW50NjRfdCAqcGZuczsN
Cj4gICAJaW50IHIgPSAwOw0KPiAgIA0KPiAtCWlmICghbW0pIC8qIEhhcHBlbnMgZHVyaW5nIHBy
b2Nlc3Mgc2h1dGRvd24gKi8NCj4gLQkJcmV0dXJuIC1FU1JDSDsNCj4gLQ0KPiAgIAlpZiAodW5s
aWtlbHkoIW1pcnJvcikpIHsNCj4gICAJCURSTV9ERUJVR19EUklWRVIoIkZhaWxlZCB0byBnZXQg
aG1tX21pcnJvclxuIik7DQo+IC0JCXIgPSAtRUZBVUxUOw0KPiAtCQlnb3RvIG91dDsNCj4gKwkJ
cmV0dXJuIC1FRkFVTFQ7DQo+ICAgCX0NCj4gICANCj4gLQl2bWEgPSBmaW5kX3ZtYShtbSwgc3Rh
cnQpOw0KPiAtCWlmICh1bmxpa2VseSghdm1hIHx8IHN0YXJ0IDwgdm1hLT52bV9zdGFydCkpIHsN
Cj4gLQkJciA9IC1FRkFVTFQ7DQo+IC0JCWdvdG8gb3V0Ow0KPiAtCX0NCj4gLQlpZiAodW5saWtl
bHkoKGd0dC0+dXNlcmZsYWdzICYgQU1ER1BVX0dFTV9VU0VSUFRSX0FOT05PTkxZKSAmJg0KPiAt
CQl2bWEtPnZtX2ZpbGUpKSB7DQo+IC0JCXIgPSAtRVBFUk07DQo+IC0JCWdvdG8gb3V0Ow0KPiAt
CX0NCj4gKwltbSA9IG1pcnJvci0+aG1tLT5tbXVfbm90aWZpZXIubW07DQo+ICsJaWYgKCFtbWdl
dF9ub3RfemVybyhtbSkpIC8qIEhhcHBlbnMgZHVyaW5nIHByb2Nlc3Mgc2h1dGRvd24gKi8NCg0K
VGhpcyB3b3JrcyBiZWNhdXNlIG1pcnJvci0+aG1tLT5tbXVfbm90aWZpZXIgaG9sZHMgYW4gbW1n
cmFiIHJlZmVyZW5jZSANCnRvIHRoZSBtbT8gU28gdGhlIE1NIHdpbGwgbm90IGp1c3QgZ28gYXdh
eSwgYnV0IGlmIHRoZSBtbWdldCByZWZjb3VudCBpcyANCjAsIGl0IG1lYW5zIHRoZSBtbSBpcyBt
YXJrZWQgZm9yIGRlc3RydWN0aW9uIGFuZCBzaG91bGRuJ3QgYmUgdXNlZCBhbnkgbW9yZS4NCg0K
DQo+ICsJCXJldHVybiAtRVNSQ0g7DQo+ICAgDQo+ICAgCXJhbmdlID0ga3phbGxvYyhzaXplb2Yo
KnJhbmdlKSwgR0ZQX0tFUk5FTCk7DQo+ICAgCWlmICh1bmxpa2VseSghcmFuZ2UpKSB7DQo+IEBA
IC04NDcsNiArODM3LDE3IEBAIGludCBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzKHN0cnVj
dCBhbWRncHVfYm8gKmJvLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKQ0KPiAgIAlobW1fcmFuZ2Vfd2Fp
dF91bnRpbF92YWxpZChyYW5nZSwgSE1NX1JBTkdFX0RFRkFVTFRfVElNRU9VVCk7DQo+ICAgDQo+
ICAgCWRvd25fcmVhZCgmbW0tPm1tYXBfc2VtKTsNCj4gKwl2bWEgPSBmaW5kX3ZtYShtbSwgc3Rh
cnQpOw0KPiArCWlmICh1bmxpa2VseSghdm1hIHx8IHN0YXJ0IDwgdm1hLT52bV9zdGFydCkpIHsN
Cj4gKwkJciA9IC1FRkFVTFQ7DQo+ICsJCWdvdG8gb3V0X3VubG9jazsNCj4gKwl9DQo+ICsJaWYg
KHVubGlrZWx5KChndHQtPnVzZXJmbGFncyAmIEFNREdQVV9HRU1fVVNFUlBUUl9BTk9OT05MWSkg
JiYNCj4gKwkJdm1hLT52bV9maWxlKSkgew0KPiArCQlyID0gLUVQRVJNOw0KPiArCQlnb3RvIG91
dF91bmxvY2s7DQo+ICsJfQ0KPiArDQo+ICAgCXIgPSBobW1fcmFuZ2VfZmF1bHQocmFuZ2UsIDAp
Ow0KPiAgIAl1cF9yZWFkKCZtbS0+bW1hcF9zZW0pOw0KPiAgIA0KPiBAQCAtODY1LDE1ICs4NjYs
MTkgQEAgaW50IGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoc3RydWN0IGFtZGdwdV9ibyAq
Ym8sIHN0cnVjdCBwYWdlICoqcGFnZXMpDQo+ICAgCX0NCj4gICANCj4gICAJZ3R0LT5yYW5nZSA9
IHJhbmdlOw0KPiArCW1tcHV0KG1tKTsNCj4gICANCj4gICAJcmV0dXJuIDA7DQo+ICAgDQo+ICtv
dXRfdW5sb2NrOg0KPiArCXVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7DQo+ICAgb3V0X2ZyZWVfcGZu
czoNCj4gICAJaG1tX3JhbmdlX3VucmVnaXN0ZXIocmFuZ2UpOw0KPiAgIAlrdmZyZWUocGZucyk7
DQo+ICAgb3V0X2ZyZWVfcmFuZ2VzOg0KPiAgIAlrZnJlZShyYW5nZSk7DQo+ICAgb3V0Og0KPiAr
CW1tcHV0KG1tKTsNCj4gICAJcmV0dXJuIHI7DQo+ICAgfQ0KPiAgIA0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E213E82BD
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 08:49:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 020756E104;
	Tue, 29 Oct 2019 07:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB066E0FE;
 Tue, 29 Oct 2019 07:49:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A83dcZ1m//PLjaacElyTDxgsFPVgmKRWJwrXG9faenHX1VB0YXGwM2dYC9bZVf6wIXAY6pgItFADW3PvAqeljWQD/8q4fTUIKTkb9htT2Qsty7M+vf4D6EFltA9Z2R+LWZdQ1kJapMFXn7r/Yj4aFSRbD0CncZ/o4hrWu1etNAtQxMKnKRvzVMCvrECbD3MuAvH9yBGjwfPJT10P9bBwx7TdIzazlxFv5Dryrm/xHkmWdeK/S85fQ/e9vRy4DH/xAOcjbxECRTRlAsuBlKklvUqNWBe32TZJfbM7UUOBucXDzleaffP9HLD1aiS2lX1eS7g13tOQYjkgShKLSVxZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxIRLbtuCYnwIPAcQF6yoX3zayddZOYNGKXwRUKHHMw=;
 b=NC6mK1nOZVz78BI+9inWcuzeO7NPXHCYP6g1Vs92I5PBI6k6REBzT2EAI5cwc/U54mlrpI+EJA2FpTesKECIjZ2N/gExOgwHR39+vFNK7D/aFVSIEnBE8ZB9c0CHi7qgunNQwhb0QCSx8+UqJLi87Mmy9FRXQpeBEaaquifm/Dyceqd8niXtE42j24DJlJIKfm77+qZ1E9RCt3aigTRo/IVYzdyyuEFsq93ZCAUnsRicIZAPDq1wGV1+mpuW22f70+TRgcdHVqstn/u0P7eCllw08HA0SZbzcMMq7SjmL3bhQxD8xjmm5HOEwKJl2kI2bwt9KTTbJW4iISW/Np9ygw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1699.namprd12.prod.outlook.com (10.175.97.148) by
 BN6PR12MB1281.namprd12.prod.outlook.com (10.168.226.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.25; Tue, 29 Oct 2019 07:49:25 +0000
Received: from BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::68e1:ddf5:df4c:b554]) by BN6PR12MB1699.namprd12.prod.outlook.com
 ([fe80::68e1:ddf5:df4c:b554%9]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 07:49:25 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, Felix"
 <Felix.Kuehling@amd.com>
Subject: Re: [PATCH v2 12/15] drm/amdgpu: Call find_vma under mmap_sem
Thread-Topic: [PATCH v2 12/15] drm/amdgpu: Call find_vma under mmap_sem
Thread-Index: AQHVjcvNpIK/GGx8kkCFLgNdNvZ37adxPyOA
Date: Tue, 29 Oct 2019 07:49:25 +0000
Message-ID: <8aa1682f-1a9d-2238-9b9c-a850bf953634@amd.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-13-jgg@ziepe.ca>
In-Reply-To: <20191028201032.6352-13-jgg@ziepe.ca>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM0PR01CA0035.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:69::48) To BN6PR12MB1699.namprd12.prod.outlook.com
 (2603:10b6:404:ff::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d628ccaa-fa8b-4c07-b81d-08d75c448497
x-ms-traffictypediagnostic: BN6PR12MB1281:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB12815C42AD1072D6C335DD9483610@BN6PR12MB1281.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(199004)(189003)(186003)(2501003)(305945005)(66556008)(66446008)(316002)(64756008)(14444005)(66476007)(6436002)(66946007)(110136005)(8936002)(256004)(4326008)(478600001)(6246003)(65956001)(31696002)(65806001)(14454004)(71200400001)(54906003)(58126008)(71190400001)(2906002)(486006)(476003)(31686004)(6512007)(36756003)(81166006)(6116002)(66574012)(11346002)(8676002)(7416002)(46003)(86362001)(7736002)(76176011)(386003)(52116002)(102836004)(229853002)(446003)(99286004)(6486002)(5660300002)(2616005)(6636002)(81156014)(25786009)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1281;
 H:BN6PR12MB1699.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: b6y3Fbfd5AjgtHuGb9oRSCqxg4wMDlYZnLKA+5yzObXWqdrJYfX+i3n4Dp4PrAmFOwy9lYSy/kjR+RwWUumcvh5xLlr13fdr6HrnL74/lJPqkC4wXATFC/YChPJBT2UiJr46oinDJE6+QxPA5Pktdj4Uyq+sChxIac2DMRoPbU4uB0RchP7+oQwSC/w5OC5K/wihAiAxiQ5CUwVZsrj8ADwXBnmM4MgUptf3baYQwUNoiAsLYzWjEAeCac7mvee54eBWdsZIQAQ9Msq4PK3dxj/4l+bsNkk1TlNKC6IjT01uTsYFyKf1QL/N29OR2wPWQhZmIkFtpp7NAQ+vO6F3pFawmF9Juj9IHOhRPdYEnZIojNA7bXEMBV0gPKSIRPF426luOmH+/L9dDNY0oY8v14HDBZyoKbd2/SD4x21W36NPW8ojARD0G8A5rKvOIVI+
Content-ID: <E0AC9AA87A93EC4CADA7312414DC5090@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d628ccaa-fa8b-4c07-b81d-08d75c448497
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 07:49:25.0900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KX6bi4LhqdAIQZFhyqzNmsxurc8IG9iKb0UBl9V9NYqdkhBjygDr6xkmGTXm15nk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1281
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxIRLbtuCYnwIPAcQF6yoX3zayddZOYNGKXwRUKHHMw=;
 b=dlc1iDSiiwuTJv3AqFvruOKXl7uGeREqMZ/2+6/1XyFED00dHYDobklNp1m0gZZfnOp7OzOyx7DfggGYn/oSnreClXtTD7d+hThVAdWBQe3oAdQ6CjmVPqGd/ISSLUhnp95h3R2OM+2U86jr9RvGUPZkSaz22Ci/IPKEzBWRvHE=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjguMTAuMTkgdW0gMjE6MTAgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6DQo+IEZyb206IEph
c29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4NCj4NCj4gZmluZF92bWEoKSBtdXN0IGJl
IGNhbGxlZCB1bmRlciB0aGUgbW1hcF9zZW0sIHJlb3JnYW5pemUgdGhpcyBjb2RlIHRvDQo+IGRv
IHRoZSB2bWEgY2hlY2sgYWZ0ZXIgZW50ZXJpbmcgdGhlIGxvY2suDQo+DQo+IEZ1cnRoZXIsIGZp
eCB0aGUgdW5sb2NrZWQgdXNlIG9mIHN0cnVjdCB0YXNrX3N0cnVjdCdzIG1tLCBpbnN0ZWFkIHVz
ZQ0KPiB0aGUgbW0gZnJvbSBobW1fbWlycm9yIHdoaWNoIGhhcyBhbiBhY3RpdmUgbW1fZ3JhYi4g
QWxzbyB0aGUgbW1fZ3JhYg0KPiBtdXN0IGJlIGNvbnZlcnRlZCB0byBhIG1tX2dldCBiZWZvcmUg
YWNxdWlyaW5nIG1tYXBfc2VtIG9yIGNhbGxpbmcNCj4gZmluZF92bWEoKS4NCj4NCj4gRml4ZXM6
IDY2YzQ1NTAwYmZkYyAoImRybS9hbWRncHU6IHVzZSBuZXcgSE1NIEFQSXMgYW5kIGhlbHBlcnMi
KQ0KPiBGaXhlczogMDkxOTE5NWYyYjBkICgiZHJtL2FtZGdwdTogRW5hYmxlIGFtZGdwdV90dG1f
dHRfZ2V0X3VzZXJfcGFnZXMgaW4gd29ya2VyIHRocmVhZHMiKQ0KPiBDYzogQWxleCBEZXVjaGVy
IDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBDYzogRGF2aWQgKENodW5NaW5nKSBaaG91IDxEYXZp
ZDEuWmhvdUBhbWQuY29tPg0KPiBDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
U2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPg0KDQpBY2tl
ZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KDQo+IC0t
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8IDM3ICsrKysr
KysrKysrKysrLS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygr
KSwgMTYgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dHRtLmMNCj4gaW5kZXggZGZmNDFkMGE4NWZlOTYuLmMwZTQxZjFmMGMyMzY1IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+IEBAIC0zNSw2ICszNSw3IEBA
DQo+ICAgI2luY2x1ZGUgPGxpbnV4L2htbS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9wYWdlbWFw
Lmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3NjaGVkL3Rhc2suaD4NCj4gKyNpbmNsdWRlIDxsaW51
eC9zY2hlZC9tbS5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9zZXFfZmlsZS5oPg0KPiAgICNpbmNs
dWRlIDxsaW51eC9zbGFiLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L3N3YXAuaD4NCj4gQEAgLTc4
OCw3ICs3ODksNyBAQCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1k
Z3B1X2JvICpibywgc3RydWN0IHBhZ2UgKipwYWdlcykNCj4gICAJc3RydWN0IGhtbV9taXJyb3Ig
Km1pcnJvciA9IGJvLT5tbiA/ICZiby0+bW4tPm1pcnJvciA6IE5VTEw7DQo+ICAgCXN0cnVjdCB0
dG1fdHQgKnR0bSA9IGJvLT50Ym8udHRtOw0KPiAgIAlzdHJ1Y3QgYW1kZ3B1X3R0bV90dCAqZ3R0
ID0gKHZvaWQgKil0dG07DQo+IC0Jc3RydWN0IG1tX3N0cnVjdCAqbW0gPSBndHQtPnVzZXJ0YXNr
LT5tbTsNCj4gKwlzdHJ1Y3QgbW1fc3RydWN0ICptbTsNCj4gICAJdW5zaWduZWQgbG9uZyBzdGFy
dCA9IGd0dC0+dXNlcnB0cjsNCj4gICAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7DQo+ICAg
CXN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlOw0KPiBAQCAtNzk2LDI1ICs3OTcsMTQgQEAgaW50IGFt
ZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoc3RydWN0IGFtZGdwdV9ibyAqYm8sIHN0cnVjdCBw
YWdlICoqcGFnZXMpDQo+ICAgCXVpbnQ2NF90ICpwZm5zOw0KPiAgIAlpbnQgciA9IDA7DQo+ICAg
DQo+IC0JaWYgKCFtbSkgLyogSGFwcGVucyBkdXJpbmcgcHJvY2VzcyBzaHV0ZG93biAqLw0KPiAt
CQlyZXR1cm4gLUVTUkNIOw0KPiAtDQo+ICAgCWlmICh1bmxpa2VseSghbWlycm9yKSkgew0KPiAg
IAkJRFJNX0RFQlVHX0RSSVZFUigiRmFpbGVkIHRvIGdldCBobW1fbWlycm9yXG4iKTsNCj4gLQkJ
ciA9IC1FRkFVTFQ7DQo+IC0JCWdvdG8gb3V0Ow0KPiArCQlyZXR1cm4gLUVGQVVMVDsNCj4gICAJ
fQ0KPiAgIA0KPiAtCXZtYSA9IGZpbmRfdm1hKG1tLCBzdGFydCk7DQo+IC0JaWYgKHVubGlrZWx5
KCF2bWEgfHwgc3RhcnQgPCB2bWEtPnZtX3N0YXJ0KSkgew0KPiAtCQlyID0gLUVGQVVMVDsNCj4g
LQkJZ290byBvdXQ7DQo+IC0JfQ0KPiAtCWlmICh1bmxpa2VseSgoZ3R0LT51c2VyZmxhZ3MgJiBB
TURHUFVfR0VNX1VTRVJQVFJfQU5PTk9OTFkpICYmDQo+IC0JCXZtYS0+dm1fZmlsZSkpIHsNCj4g
LQkJciA9IC1FUEVSTTsNCj4gLQkJZ290byBvdXQ7DQo+IC0JfQ0KPiArCW1tID0gbWlycm9yLT5o
bW0tPm1tdV9ub3RpZmllci5tbTsNCj4gKwlpZiAoIW1tZ2V0X25vdF96ZXJvKG1tKSkgLyogSGFw
cGVucyBkdXJpbmcgcHJvY2VzcyBzaHV0ZG93biAqLw0KPiArCQlyZXR1cm4gLUVTUkNIOw0KPiAg
IA0KPiAgIAlyYW5nZSA9IGt6YWxsb2Moc2l6ZW9mKCpyYW5nZSksIEdGUF9LRVJORUwpOw0KPiAg
IAlpZiAodW5saWtlbHkoIXJhbmdlKSkgew0KPiBAQCAtODQ3LDYgKzgzNywxNyBAQCBpbnQgYW1k
Z3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywgc3RydWN0IHBh
Z2UgKipwYWdlcykNCj4gICAJaG1tX3JhbmdlX3dhaXRfdW50aWxfdmFsaWQocmFuZ2UsIEhNTV9S
QU5HRV9ERUZBVUxUX1RJTUVPVVQpOw0KPiAgIA0KPiAgIAlkb3duX3JlYWQoJm1tLT5tbWFwX3Nl
bSk7DQo+ICsJdm1hID0gZmluZF92bWEobW0sIHN0YXJ0KTsNCj4gKwlpZiAodW5saWtlbHkoIXZt
YSB8fCBzdGFydCA8IHZtYS0+dm1fc3RhcnQpKSB7DQo+ICsJCXIgPSAtRUZBVUxUOw0KPiArCQln
b3RvIG91dF91bmxvY2s7DQo+ICsJfQ0KPiArCWlmICh1bmxpa2VseSgoZ3R0LT51c2VyZmxhZ3Mg
JiBBTURHUFVfR0VNX1VTRVJQVFJfQU5PTk9OTFkpICYmDQo+ICsJCXZtYS0+dm1fZmlsZSkpIHsN
Cj4gKwkJciA9IC1FUEVSTTsNCj4gKwkJZ290byBvdXRfdW5sb2NrOw0KPiArCX0NCj4gKw0KPiAg
IAlyID0gaG1tX3JhbmdlX2ZhdWx0KHJhbmdlLCAwKTsNCj4gICAJdXBfcmVhZCgmbW0tPm1tYXBf
c2VtKTsNCj4gICANCj4gQEAgLTg2NSwxNSArODY2LDE5IEBAIGludCBhbWRncHVfdHRtX3R0X2dl
dF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRncHVfYm8gKmJvLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKQ0K
PiAgIAl9DQo+ICAgDQo+ICAgCWd0dC0+cmFuZ2UgPSByYW5nZTsNCj4gKwltbXB1dChtbSk7DQo+
ICAgDQo+ICAgCXJldHVybiAwOw0KPiAgIA0KPiArb3V0X3VubG9jazoNCj4gKwl1cF9yZWFkKCZt
bS0+bW1hcF9zZW0pOw0KPiAgIG91dF9mcmVlX3BmbnM6DQo+ICAgCWhtbV9yYW5nZV91bnJlZ2lz
dGVyKHJhbmdlKTsNCj4gICAJa3ZmcmVlKHBmbnMpOw0KPiAgIG91dF9mcmVlX3JhbmdlczoNCj4g
ICAJa2ZyZWUocmFuZ2UpOw0KPiAgIG91dDoNCj4gKwltbXB1dChtbSk7DQo+ICAgCXJldHVybiBy
Ow0KPiAgIH0NCj4gICANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs

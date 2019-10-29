Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD643E9287
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 23:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFC2389B42;
	Tue, 29 Oct 2019 22:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820045.outbound.protection.outlook.com [40.107.82.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C727D89B42;
 Tue, 29 Oct 2019 22:04:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HL6TCL77yX35tR/tiOoP/P/6cMJDAXGmoo11RxSp+cGVqfVYEtkhK+j4/Xa0A8LLzDHNh54yKrY1odGl+/0QdcAAVtWufvKh+FTBwmI3e6J5mrnw/NmhMz6H1VTC1ZB+pSi1rRG3u2q/VdXNml8TL5T5YoVy6VhXluazdLEv/4Wwss9NyBemC2F0wXIWK1Ktrx21nZzxgdaUvho8dyCAozfyA36XAMNclAO/m50ZjZZR/XFWS7SVEfj5D74P9HSrS2mVsrWQ5WHYNWTF7gbZ8Re9nmt052ugMenvzakx8Yi7IBg6Nbeb0k2ZcCx42TjyNXZku8nBpmmCNStYikv8Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JD7KFkKHp5fyK1k331LGUR/1WWjmJqNA6hU7v+mEUs=;
 b=MV14xJxP9wGka43UZEOQY9hWpsCEOGPdCY0JgQ1IWYLVxfhN99mHFUX5JiK6ToX3ccAfMGD5q8dXGp4umpvggSTuI6zRTZ4i92wDbOdO+L6LXPjoN1BH2jTtUEL1HLm1ocbW55LmQtCsoJj128gCTI3iBTp2BZhVoAro37blTQ3a5hDUUfEDpVc68OBd1d4T52/NKApGt/GQTtODGXYGJKTZ1fu2DILhT5SKEmqVff3s5kAdVculvGP1GHrAOhgFCvY3mcof+yCX1BUr6t6YkayckrTz+wbXcFunB7UuK6sr9eXPDYEhZm1/E/qS6brnga/kCy2p/HfzKB4dIgMdIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB3916.namprd12.prod.outlook.com (10.255.174.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.22; Tue, 29 Oct 2019 22:04:45 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::288c:66ec:203d:aede]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::288c:66ec:203d:aede%4]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 22:04:45 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 02/15] mm/mmu_notifier: add an interval tree notifier
Thread-Topic: [PATCH v2 02/15] mm/mmu_notifier: add an interval tree notifier
Thread-Index: AQHVjcvKdJlZAglZt0CRWZTjlOmCL6dyLiSA
Date: Tue, 29 Oct 2019 22:04:45 +0000
Message-ID: <786ee79d-00a6-9147-f410-d8856da35511@amd.com>
References: <20191028201032.6352-1-jgg@ziepe.ca>
 <20191028201032.6352-3-jgg@ziepe.ca>
In-Reply-To: <20191028201032.6352-3-jgg@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: YTXPR0101CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::47) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 23417fa4-e959-450c-8abf-08d75cbc01f9
x-ms-traffictypediagnostic: DM6PR12MB3916:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3916AAEAD8859F526A130EF192610@DM6PR12MB3916.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(346002)(136003)(366004)(189003)(199004)(66946007)(81166006)(6486002)(81156014)(8676002)(86362001)(14454004)(6116002)(6246003)(8936002)(3846002)(31696002)(229853002)(486006)(4326008)(6436002)(36756003)(2906002)(66476007)(66556008)(64756008)(66446008)(6512007)(446003)(14444005)(256004)(476003)(2616005)(11346002)(25786009)(7416002)(6506007)(53546011)(386003)(66574012)(316002)(26005)(102836004)(31686004)(2501003)(76176011)(52116002)(71200400001)(71190400001)(58126008)(66066001)(110136005)(65806001)(65956001)(54906003)(7736002)(5660300002)(99286004)(186003)(4001150100001)(305945005)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3916;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TyL45NAnDsinCP+o8LulRyY0kcc8qAVxZYljNtKTam3m7rIru8CiVmrcnowGAkDDcTb050JhhP8JcCXAGSG6hweNsYJht8bAP5kZrqFYEZ7HN4LFigI15ZcW4bqCX6XG2qC2q6SwA+99IG1RUpFJkGxzdB0P1P6dNqIHk6mLuJo73mvVXWquVHWO96G3zpxs7M71r337vLHfaytiQHixy8Xt04GGc2uEUscHKKyMXgKcL3Ibhh4NdtPGDtS5MzMifW2f4JHDlgh9uF9Evymy2YRGtWXptoRQwglMEyOGhhYF70nKDufx4arEBrT4PhWrGqF+LIpXublBBVb6/iyj8K4F+FEFpvhI04g5GICfupa5xh/4rhTFpOpc1pnqmpVMoN8Z/ZpA83u4tX6Ix4CjxdYZofltNogkc6FuzcLHxPc+z0Qqzhk0IyUSU3BFQMrP
Content-ID: <25A6FC5824E58843B9E20A0973B7665E@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23417fa4-e959-450c-8abf-08d75cbc01f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 22:04:45.6400 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WGXdJod+oKbtq4YQeQnc8UKTA/F/RcVSvdRGR+/fPoXLUkDdfEpZp4XZRLfM/FMshwzruh73X1SrUnWMAI4iEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3916
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JD7KFkKHp5fyK1k331LGUR/1WWjmJqNA6hU7v+mEUs=;
 b=nlXPL5gcis1aUHowIOIh+F30WUqWTNsS9EaDFGodshoudRMtfR1FHXl+AA2XCKrSp94f0FIxOhjmguN1kUKRT557zytMGiQFxPPAdB+TU68SyaUUMjRxXJEvQ8Nhg7H8aISsdV9jXLQTar4Sp/m5jg08XBv1cGBvTcwpL4hfa94=
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
 Andrea Arcangeli <aarcange@redhat.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@mellanox.com>,
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

SSBoYXZlbid0IGhhZCBlbm91Z2ggdGltZSB0byBmdWxseSB1bmRlcnN0YW5kIHRoZSBkZWZlcnJl
ZCBsb2dpYyBpbiB0aGlzIA0KY2hhbmdlLiBJIHNwb3R0ZWQgb25lIHByb2JsZW0sIHNlZSBjb21t
ZW50cyBpbmxpbmUuDQoNCk9uIDIwMTktMTAtMjggNDoxMCBwLm0uLCBKYXNvbiBHdW50aG9ycGUg
d3JvdGU6DQo+IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4NCj4NCj4g
T2YgdGhlIDEzIHVzZXJzIG9mIG1tdV9ub3RpZmllcnMsIDggb2YgdGhlbSB1c2Ugb25seQ0KPiBp
bnZhbGlkYXRlX3JhbmdlX3N0YXJ0L2VuZCgpIGFuZCBpbW1lZGlhdGVseSBpbnRlcnNlY3QgdGhl
DQo+IG1tdV9ub3RpZmllcl9yYW5nZSB3aXRoIHNvbWUga2luZCBvZiBpbnRlcm5hbCBsaXN0IG9m
IFZBcy4gIDQgdXNlIGFuDQo+IGludGVydmFsIHRyZWUgKGk5MTVfZ2VtLCByYWRlb25fbW4sIHVt
ZW1fb2RwLCBoZmkxKS4gNCB1c2UgYSBsaW5rZWQgbGlzdA0KPiBvZiBzb21lIGtpbmQgKHNjaWZf
ZG1hLCB2aG9zdCwgZ250ZGV2LCBobW0pDQo+DQo+IEFuZCB0aGUgcmVtYWluaW5nIDUgZWl0aGVy
IGRvbid0IHVzZSBpbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KCkgb3IgZG8gc29tZQ0KPiBzcGVjaWFs
IHRoaW5nIHdpdGggaXQuDQo+DQo+IEl0IHR1cm5zIG91dCB0aGF0IGJ1aWxkaW5nIGEgY29ycmVj
dCBzY2hlbWUgd2l0aCBhbiBpbnRlcnZhbCB0cmVlIGlzDQo+IHByZXR0eSBjb21wbGljYXRlZCwg
cGFydGljdWxhcmx5IGlmIHRoZSB1c2UgY2FzZSBpcyBzeW5jaHJvbml6aW5nIGFnYWluc3QNCj4g
YW5vdGhlciB0aHJlYWQgZG9pbmcgZ2V0X3VzZXJfcGFnZXMoKS4gIE1hbnkgb2YgdGhlc2UgaW1w
bGVtZW50YXRpb25zIGhhdmUNCj4gdmFyaW91cyBzdWJ0bGUgYW5kIGRpZmZpY3VsdCB0byBmaXgg
cmFjZXMuDQo+DQo+IFRoaXMgYXBwcm9hY2ggcHV0cyB0aGUgaW50ZXJ2YWwgdHJlZSBhcyBjb21t
b24gY29kZSBhdCB0aGUgdG9wIG9mIHRoZSBtbXUNCj4gbm90aWZpZXIgY2FsbCB0cmVlIGFuZCBp
bXBsZW1lbnRzIGEgc2hhcmVhYmxlIGxvY2tpbmcgc2NoZW1lLg0KPg0KPiBJdCBpbmNsdWRlczoN
Cj4gICAtIEFuIGludGVydmFsIHRyZWUgdHJhY2tpbmcgVkEgcmFuZ2VzLCB3aXRoIHBlci1yYW5n
ZSBjYWxsYmFja3MNCj4gICAtIEEgcmVhZC93cml0ZSBsb2NraW5nIHNjaGVtZSBmb3IgdGhlIGlu
dGVydmFsIHRyZWUgdGhhdCBhdm9pZHMNCj4gICAgIHNsZWVwaW5nIGluIHRoZSBub3RpZmllciBw
YXRoIChmb3IgT09NIGtpbGxlcikNCj4gICAtIEEgc2VxdWVuY2UgY291bnRlciBiYXNlZCBjb2xs
aXNpb24tcmV0cnkgbG9ja2luZyBzY2hlbWUgdG8gdGVsbA0KPiAgICAgZGV2aWNlIHBhZ2UgZmF1
bHQgdGhhdCBhIFZBIHJhbmdlIGlzIGJlaW5nIGNvbmN1cnJlbnRseSBpbnZhbGlkYXRlZC4NCj4N
Cj4gVGhpcyBpcyBiYXNlZCBvbiB2YXJpb3VzIGlkZWFzOg0KPiAtIGhtbSBhY2N1bXVsYXRlcyBp
bnZhbGlkYXRlZCBWQSByYW5nZXMgYW5kIHJlbGVhc2VzIHRoZW0gd2hlbiBhbGwNCj4gICAgaW52
YWxpZGF0ZXMgYXJlIGRvbmUsIHZpYSBhY3RpdmVfaW52YWxpZGF0ZV9yYW5nZXMgY291bnQuDQo+
ICAgIFRoaXMgYXBwcm9hY2ggYXZvaWRzIGhhdmluZyB0byBpbnRlcnNlY3QgdGhlIGludGVydmFs
IHRyZWUgdHdpY2UgKGFzDQo+ICAgIHVtZW1fb2RwIGRvZXMpIGF0IHRoZSBwb3RlbnRpYWwgY29z
dCBvZiBhIGxvbmdlciBkZXZpY2UgcGFnZSBmYXVsdC4NCj4NCj4gLSBrdm0vdW1lbV9vZHAgdXNl
IGEgc2VxdWVuY2UgY291bnRlciB0byBkcml2ZSB0aGUgY29sbGlzaW9uIHJldHJ5LA0KPiAgICB2
aWEgaW52YWxpZGF0ZV9zZXENCj4NCj4gLSBhIGRlZmVycmVkIHdvcmsgdG9kbyBsaXN0IG9uIHVu
bG9jayBzY2hlbWUgbGlrZSBSVE5MLCB2aWEgZGVmZXJyZWRfbGlzdC4NCj4gICAgVGhpcyBtYWtl
cyBhZGRpbmcvcmVtb3ZpbmcgaW50ZXJ2YWwgdHJlZSBtZW1iZXJzIG1vcmUgZGV0ZXJtaW5pc3Rp
Yw0KPg0KPiAtIHNlcWxvY2ssIGV4Y2VwdCB0aGlzIHZlcnNpb24gbWFrZXMgdGhlIHNlcWxvY2sg
aWRlYSBtdWx0aS1ob2xkZXIgb24gdGhlDQo+ICAgIHdyaXRlIHNpZGUgYnkgcHJvdGVjdGluZyBp
dCB3aXRoIGFjdGl2ZV9pbnZhbGlkYXRlX3JhbmdlcyBhbmQgYSBzcGlubG9jaw0KPg0KPiBUbyBt
aW5pbWl6ZSBNTSBvdmVyaGVhZCB3aGVuIG9ubHkgdGhlIGludGVydmFsIHRyZWUgaXMgYmVpbmcg
dXNlZCwgdGhlDQo+IGVudGlyZSBTUkNVIGFuZCBobGlzdCBvdmVyaGVhZHMgYXJlIGRyb3BwZWQg
dXNpbmcgc29tZSBzaW1wbGUNCj4gYnJhbmNoZXMuIFNpbWlsYXJseSB0aGUgaW50ZXJ2YWwgdHJl
ZSBvdmVyaGVhZCBpcyBkcm9wcGVkIHdoZW4gaW4gaGxpc3QNCj4gbW9kZS4NCj4NCj4gVGhlIG92
ZXJoZWFkIGZyb20gdGhlIG1hbmRhdG9yeSBzcGlubG9jayBpcyBicm9hZGx5IHRoZSBzYW1lIGFz
IG1vc3Qgb2YNCj4gZXhpc3RpbmcgdXNlcnMgd2hpY2ggYWxyZWFkeSBoYWQgYSBsb2NrIChvciB0
d28pIG9mIHNvbWUgc29ydCBvbiB0aGUNCj4gaW52YWxpZGF0aW9uIHBhdGguDQo+DQo+IENjOiBB
bmRyZWEgQXJjYW5nZWxpIDxhYXJjYW5nZUByZWRoYXQuY29tPg0KPiBDYzogTWljaGFsIEhvY2tv
IDxtaG9ja29Aa2VybmVsLm9yZz4NCj4gQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxq
Z2dAbWVsbGFub3guY29tPg0KPiAtLS0NCj4gICBpbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5o
IHwgIDk4ICsrKysrKysNCj4gICBtbS9LY29uZmlnICAgICAgICAgICAgICAgICAgIHwgICAxICsN
Cj4gICBtbS9tbXVfbm90aWZpZXIuYyAgICAgICAgICAgIHwgNTMzICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0tDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA2MDcgaW5zZXJ0aW9ucygr
KSwgMjUgZGVsZXRpb25zKC0pDQo+DQpbc25pcF0NCj4gZGlmZiAtLWdpdCBhL21tL21tdV9ub3Rp
Zmllci5jIGIvbW0vbW11X25vdGlmaWVyLmMNCj4gaW5kZXggMzY3NjcwY2ZkMDJiN2IuLmQwMmQz
YzhjMjIzZWI3IDEwMDY0NA0KPiAtLS0gYS9tbS9tbXVfbm90aWZpZXIuYw0KPiArKysgYi9tbS9t
bXVfbm90aWZpZXIuYw0KW3NuaXBdDQo+ICAgICogYmVjYXVzZSBtbS0+bW1fdXNlcnMgPiAwIGR1
cmluZyBtbXVfbm90aWZpZXJfcmVnaXN0ZXIgYW5kIGV4aXRfbW1hcA0KPiBAQCAtNTIsMTcgKzI4
NiwyNCBAQCBzdHJ1Y3QgbW11X25vdGlmaWVyX21tIHsNCj4gICAgKiBjYW4ndCBnbyBhd2F5IGZy
b20gdW5kZXIgdXMgYXMgZXhpdF9tbWFwIGhvbGRzIGFuIG1tX2NvdW50IHBpbg0KPiAgICAqIGl0
c2VsZi4NCj4gICAgKi8NCj4gLXZvaWQgX19tbXVfbm90aWZpZXJfcmVsZWFzZShzdHJ1Y3QgbW1f
c3RydWN0ICptbSkNCj4gK3N0YXRpYyB2b2lkIG1uX2hsaXN0X3JlbGVhc2Uoc3RydWN0IG1tdV9u
b3RpZmllcl9tbSAqbW1uX21tLA0KPiArCQkJICAgICBzdHJ1Y3QgbW1fc3RydWN0ICptbSkNCj4g
ICB7DQo+ICAgCXN0cnVjdCBtbXVfbm90aWZpZXIgKm1uOw0KPiAgIAlpbnQgaWQ7DQo+ICAgDQo+
ICsJaWYgKG1tbl9tbS0+aGFzX2ludGVydmFsKQ0KPiArCQltbl9pdHJlZV9yZWxlYXNlKG1tbl9t
bSwgbW0pOw0KPiArDQo+ICsJaWYgKGhsaXN0X2VtcHR5KCZtbW5fbW0tPmxpc3QpKQ0KPiArCQly
ZXR1cm47DQoNClRoaXMgc2VlbXMgdG8gZHVwbGljYXRlIHRoZSBjb25kaXRpb25zIGluIF9fbW11
X25vdGlmaWVyX3JlbGVhc2UuIFNlZSBteSANCmNvbW1lbnRzIGJlbG93LCBJIHRoaW5rIG9uZSBv
ZiB0aGVtIGlzIHdyb25nLiBJIHN1c3BlY3QgdGhpcyBvbmUsIA0KYmVjYXVzZSBfX21tdV9ub3Rp
Zmllcl9yZWxlYXNlIGZvbGxvd3MgdGhlIHNhbWUgcGF0dGVybiBhcyB0aGUgb3RoZXIgDQpub3Rp
ZmllcnMuDQoNCg0KPiArDQo+ICAgCS8qDQo+ICAgCSAqIFNSQ1UgaGVyZSB3aWxsIGJsb2NrIG1t
dV9ub3RpZmllcl91bnJlZ2lzdGVyIHVudGlsDQo+ICAgCSAqIC0+cmVsZWFzZSByZXR1cm5zLg0K
PiAgIAkgKi8NCj4gICAJaWQgPSBzcmN1X3JlYWRfbG9jaygmc3JjdSk7DQo+IC0JaGxpc3RfZm9y
X2VhY2hfZW50cnlfcmN1KG1uLCAmbW0tPm1tdV9ub3RpZmllcl9tbS0+bGlzdCwgaGxpc3QpDQo+
ICsJaGxpc3RfZm9yX2VhY2hfZW50cnlfcmN1KG1uLCAmbW1uX21tLT5saXN0LCBobGlzdCkNCj4g
ICAJCS8qDQo+ICAgCQkgKiBJZiAtPnJlbGVhc2UgcnVucyBiZWZvcmUgbW11X25vdGlmaWVyX3Vu
cmVnaXN0ZXIgaXQgbXVzdCBiZQ0KPiAgIAkJICogaGFuZGxlZCwgYXMgaXQncyB0aGUgb25seSB3
YXkgZm9yIHRoZSBkcml2ZXIgdG8gZmx1c2ggYWxsDQo+IEBAIC03Miw5ICszMTMsOSBAQCB2b2lk
IF9fbW11X25vdGlmaWVyX3JlbGVhc2Uoc3RydWN0IG1tX3N0cnVjdCAqbW0pDQo+ICAgCQlpZiAo
bW4tPm9wcy0+cmVsZWFzZSkNCj4gICAJCQltbi0+b3BzLT5yZWxlYXNlKG1uLCBtbSk7DQo+ICAg
DQo+IC0Jc3Bpbl9sb2NrKCZtbS0+bW11X25vdGlmaWVyX21tLT5sb2NrKTsNCj4gLQl3aGlsZSAo
dW5saWtlbHkoIWhsaXN0X2VtcHR5KCZtbS0+bW11X25vdGlmaWVyX21tLT5saXN0KSkpIHsNCj4g
LQkJbW4gPSBobGlzdF9lbnRyeShtbS0+bW11X25vdGlmaWVyX21tLT5saXN0LmZpcnN0LA0KPiAr
CXNwaW5fbG9jaygmbW1uX21tLT5sb2NrKTsNCj4gKwl3aGlsZSAodW5saWtlbHkoIWhsaXN0X2Vt
cHR5KCZtbW5fbW0tPmxpc3QpKSkgew0KPiArCQltbiA9IGhsaXN0X2VudHJ5KG1tbl9tbS0+bGlz
dC5maXJzdCwNCj4gICAJCQkJIHN0cnVjdCBtbXVfbm90aWZpZXIsDQo+ICAgCQkJCSBobGlzdCk7
DQo+ICAgCQkvKg0KPiBAQCAtODUsNyArMzI2LDcgQEAgdm9pZCBfX21tdV9ub3RpZmllcl9yZWxl
YXNlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQ0KPiAgIAkJICovDQo+ICAgCQlobGlzdF9kZWxfaW5p
dF9yY3UoJm1uLT5obGlzdCk7DQo+ICAgCX0NCj4gLQlzcGluX3VubG9jaygmbW0tPm1tdV9ub3Rp
Zmllcl9tbS0+bG9jayk7DQo+ICsJc3Bpbl91bmxvY2soJm1tbl9tbS0+bG9jayk7DQo+ICAgCXNy
Y3VfcmVhZF91bmxvY2soJnNyY3UsIGlkKTsNCj4gICANCj4gICAJLyoNCj4gQEAgLTEwMCw2ICsz
NDEsMTcgQEAgdm9pZCBfX21tdV9ub3RpZmllcl9yZWxlYXNlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1t
KQ0KPiAgIAlzeW5jaHJvbml6ZV9zcmN1KCZzcmN1KTsNCj4gICB9DQo+ICAgDQo+ICt2b2lkIF9f
bW11X25vdGlmaWVyX3JlbGVhc2Uoc3RydWN0IG1tX3N0cnVjdCAqbW0pDQo+ICt7DQo+ICsJc3Ry
dWN0IG1tdV9ub3RpZmllcl9tbSAqbW1uX21tID0gbW0tPm1tdV9ub3RpZmllcl9tbTsNCj4gKw0K
PiArCWlmIChtbW5fbW0tPmhhc19pbnRlcnZhbCkNCj4gKwkJbW5faXRyZWVfcmVsZWFzZShtbW5f
bW0sIG1tKTsNCg0KSWYgbW1uX21tLT5saXN0IGlzIG5vdCBlbXB0eSwgdGhpcyB3aWxsIGJlIGRv
bmUgdHdpY2UgYmVjYXVzZSANCm1uX2hsaXN0X3JlbGVhc2UgZHVwbGljYXRlcyB0aGlzLg0KDQoN
Cj4gKw0KPiArCWlmICghaGxpc3RfZW1wdHkoJm1tbl9tbS0+bGlzdCkpDQo+ICsJCW1uX2hsaXN0
X3JlbGVhc2UobW1uX21tLCBtbSk7DQoNCm1uX2hsaXN0X3JlbGVhc2UgY2hlY2tzIHRoZSBzYW1l
IGNvbmRpdGlvbiBpdHNlbGYuDQoNCg0KPiArfQ0KPiArDQo+ICAgLyoNCj4gICAgKiBJZiBubyB5
b3VuZyBiaXRmbGFnIGlzIHN1cHBvcnRlZCBieSB0aGUgaGFyZHdhcmUsIC0+Y2xlYXJfZmx1c2hf
eW91bmcgY2FuDQo+ICAgICogdW5tYXAgdGhlIGFkZHJlc3MgYW5kIHJldHVybiAxIG9yIDAgZGVw
ZW5kaW5nIGlmIHRoZSBtYXBwaW5nIHByZXZpb3VzbHkNCltzbmlwXQ0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

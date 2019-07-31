Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D155B7C367
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 15:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3552B89DFB;
	Wed, 31 Jul 2019 13:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750084.outbound.protection.outlook.com [40.107.75.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B95989DC0;
 Wed, 31 Jul 2019 13:25:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/JcJKaFWPUEM4H2ZOvBU90YUi2eRvooIVaryVDsubWo6B9NZ97jItXa8TGrIvJW5afFG65CxUiJYZD+aw8bvxN2v7HUVdl+zr/LvPwQ0HYw2OT39mTNNd7aWdPWL/6FMU1sdgqjMCeMLASeHPZEnVyWAaFnlTHBVlnfLaJd3xqc5ksD0yXSGijqtUxRNcsvU1KyirwzYZfRfPUTlo+r5vq9VMD3K31TMYvkTDJj8hAjkQQVIsx61SOxB8aP/IQvJ7oa3aI0NoQzqaymRSf3tdP0tRQHq4W7bYFUFttsmPla3BTPTYc2JTNEqIbE+/e++djKT2DzxoeDOg4oE9TPwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwtYT+vExfOzc5xjfQzi4BcYbfZJ4FnCtkseS7N+gHw=;
 b=PRU5ydywvIMODfzvFLIsdq39N0ar6ho2SkD8TsgHOtSRM8qQeiYBnlaUew0i+A1KAfIDRncjeDi7SrwHXUp1y+mA4So5YhwLj2AdUg8dq6BIdTiK+rRep8cMWGBE3rvN+SHl/LLlFcnPyCK6lbq3f0y/1YBQS01d/G9W6c9HpwQxaPygIJR8dsSBKE3VDOR/X5pEy3J4LPVYm4JuzMFVtDxzzN3unEfGUnqlnOkMvj7N+lqhIlovzLowfrGeCeU+C06zYGCNG0hgLCHum+JYDInvIO54Czy6QxIxRekuGOEHUvoAGYSlEioD6WM1DvCB3vaVq5B2CDjbXsIQCrcgyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from DM6PR12MB3947.namprd12.prod.outlook.com (10.255.174.156) by
 DM6PR12MB2876.namprd12.prod.outlook.com (20.179.71.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Wed, 31 Jul 2019 13:25:06 +0000
Received: from DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c]) by DM6PR12MB3947.namprd12.prod.outlook.com
 ([fe80::1c82:54e7:589b:539c%5]) with mapi id 15.20.2136.010; Wed, 31 Jul 2019
 13:25:06 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Christoph Hellwig <hch@lst.de>, =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs
 <bskeggs@redhat.com>
Subject: Re: [PATCH 02/13] amdgpu: don't initialize range->list in
 amdgpu_hmm_init_range
Thread-Topic: [PATCH 02/13] amdgpu: don't initialize range->list in
 amdgpu_hmm_init_range
Thread-Index: AQHVRpr3HdRnKcDwD0mPobnQ4k0PuKbkuYMA
Date: Wed, 31 Jul 2019 13:25:06 +0000
Message-ID: <a4586f5c-0ae4-8cbd-65ff-dfe70d34f99b@amd.com>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-3-hch@lst.de>
In-Reply-To: <20190730055203.28467-3-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-clientproxiedby: YTXPR0101CA0033.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::46) To DM6PR12MB3947.namprd12.prod.outlook.com
 (2603:10b6:5:1cb::28)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e463aa9-abd8-4fb2-a4d5-08d715ba808a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2876; 
x-ms-traffictypediagnostic: DM6PR12MB2876:
x-microsoft-antispam-prvs: <DM6PR12MB2876EAF33AADC444B63CE45F92DF0@DM6PR12MB2876.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(199004)(189003)(81166006)(305945005)(52116002)(8936002)(71190400001)(476003)(68736007)(53546011)(71200400001)(26005)(66066001)(6486002)(65956001)(66556008)(102836004)(66476007)(7736002)(54906003)(76176011)(6506007)(3846002)(65806001)(31686004)(7416002)(6116002)(6436002)(386003)(186003)(66446008)(99286004)(8676002)(64756008)(66946007)(486006)(25786009)(6512007)(4326008)(6246003)(81156014)(5660300002)(65826007)(11346002)(229853002)(36756003)(2616005)(110136005)(446003)(86362001)(14444005)(316002)(478600001)(31696002)(256004)(58126008)(14454004)(53936002)(2906002)(64126003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2876;
 H:DM6PR12MB3947.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XbHN2c+hkdJkN0z1kpd66GW9de9nlr4qQ7jjDRoL5R2ld6KS8MeVSVJhA4wSqEhfkMRrU3Od58fhHBD9pzRJbQkOeL0IvBGdO3X8WAAzv2lwEHfiz0zBc2XPoZyQZVJBg/hLRaiJXHXAGT41ghery7SbtvyOGb8bWfRvexCDr77xvX7qYqcGebdmk8os8nOIUl1Hze/Dp7lFaThxfGt/CzOF8dGbZY2pQZkPBsgR6nr49zTTbSKRGtCnnIH8Fy4pbXlvCGT1cqvp14qeODRBt6OQeI8WHV9c/jNn5eSzRdFvxwYeG4pCSsz/mtmvaEdiPrVIvLXsIN4UhjKtbBN4wOjVce5Ac8Bv8t4e97rdzm+w70Y9iNHahZH59TAORheDdyUTIKeQ0C7UzxleLdSjvknXaeB4BY296xihvCxsVGE=
Content-ID: <5232542593C7E848A01B5283F83332DC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e463aa9-abd8-4fb2-a4d5-08d715ba808a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 13:25:06.2473 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fkuehlin@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2876
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwtYT+vExfOzc5xjfQzi4BcYbfZJ4FnCtkseS7N+gHw=;
 b=JLt78RVxjDKaBy2RyPh4AGG+8V99jcvymtgBFGQ2env4G8iglH3qiqspw1OEIMdlAUf2TDtxoPDq4xuUt7TUi+J4DZ8phTRkMRGdEv7bLhScr15h/MMWad47Y/4QZdorrZtacefJegss2b4pDGMO4RAyTUpSetUYr9eEeTGmevc=
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNy0zMCAxOjUxIGEubS4sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOg0KPiBUaGUg
bGlzdCBpcyB1c2VkIHRvIGFkZCB0aGUgcmFuZ2UgdG8gYW5vdGhlciBsaXN0IGFzIGFuIGVudHJ5
IGluIHRoZQ0KPiBjb3JlIGhtbSBjb2RlLCBzbyB0aGVyZSBpcyBubyBuZWVkIHRvIGluaXRpYWxp
emUgaXQgaW4gYSBkcml2ZXIuDQoNCkkndmUgc2VlbiBjb2RlIHRoYXQgdXNlcyBsaXN0X2VtcHR5
IHRvIGNoZWNrIHdoZXRoZXIgYSBsaXN0IGhlYWQgaGFzIA0KYmVlbiBhZGRlZCB0byBhIGxpc3Qg
b3Igbm90LiBGb3IgdGhhdCB0byB3b3JrLCB0aGUgbGlzdCBoZWFkIG5lZWRzIHRvIGJlIA0KaW5p
dGlhbGl6ZWQsIGFuZCBpdCBoYXMgdG8gYmUgcmVtb3ZlZCB3aXRoIGxpc3RfZGVsX2luaXQuIElm
IEhNTSBkb2Vzbid0IA0KZXZlciBkbyB0aGF0IHdpdGggcmFuZ2UtPmxpc3QsIHRoZW4gdGhpcyBw
YXRjaCBpcyBSZXZpZXdlZC1ieTogRmVsaXggDQpLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1k
LmNvbT4NCg0KDQo+DQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0
LmRlPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYyB8
IDEgLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5jDQo+IGluZGV4IGI2OThiNDIzYjI1ZC4uNjBiOWZjOTU2
MWQ3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4u
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYw0KPiBAQCAt
NDg0LDYgKzQ4NCw1IEBAIHZvaWQgYW1kZ3B1X2htbV9pbml0X3JhbmdlKHN0cnVjdCBobW1fcmFu
Z2UgKnJhbmdlKQ0KPiAgIAkJcmFuZ2UtPmZsYWdzID0gaG1tX3JhbmdlX2ZsYWdzOw0KPiAgIAkJ
cmFuZ2UtPnZhbHVlcyA9IGhtbV9yYW5nZV92YWx1ZXM7DQo+ICAgCQlyYW5nZS0+cGZuX3NoaWZ0
ID0gUEFHRV9TSElGVDsNCj4gLQkJSU5JVF9MSVNUX0hFQUQoJnJhbmdlLT5saXN0KTsNCj4gICAJ
fQ0KPiAgIH0NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

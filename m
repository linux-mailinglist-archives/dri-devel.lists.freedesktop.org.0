Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0096F85BDF
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 09:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6B76E7AC;
	Thu,  8 Aug 2019 07:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140052.outbound.protection.outlook.com [40.107.14.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3435E6E6B4;
 Wed,  7 Aug 2019 11:42:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVr3jfMo76HyKmLduAUrKb8WFb6ymaUtSVWaW1IhKEtpy+EnHcFtfOwM3BEjFy3nmrloTq+dGyxZ3TxU+xix8ehL5gleoF6nfuJc7krGZNNbYw7kB7xSttsSej+ZppUJk5glVGhyHgLAiBzAdijUrdsFlwqH60QHJxaM4CT4xR1Ye8X4TYrngu74IXmCqpiK87picL0qIwdISMpM5OnWFAImnIeEcgKuboRP/zL4nMZYacgfg2RsSaYzlan20Dld9vTLp1WvxgvH4XHc8P/LWmWDhehP2ICeYZpW976YC7Jo6mbk8bvLnCFYT6p+/+urIY91h4uG6zzb4C0RS6sW1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aL+citF68CAxs6Y8RXNOO5t8vu7g/fcgeL4uoy5a6ZE=;
 b=IszXDIPi99jN2PerFFVxuRT76q/+SWjdvGDhsl4K/S3g4elKx9DYWt6gGMCtFLMEnQ8Iz7qZ8vtbZ3MD0XRYOqrqsFPKujEd6/Km3buCJR3m17CcT6kllPwO/5QH/KsiZIcmmGa+7lTQuU5wThPvkLUrgvqJcBHB2pT09p6XDO+oOsXHKNumg1c8t3GerfoCIB0CVv8eHPVuTn+LXctEqALLCASxMDzY4LrYn4YNEQZG4FvyU/yuZ3UiyqAFVYA5IHq+R3SXyyGLIw2RUv/cQ20XTMf/pzuU3nMN7tYUWt1zIn5OtnvOio65y1lqXI7QVsWV1DPCMQATnUz50ltTpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4224.eurprd05.prod.outlook.com (52.133.12.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Wed, 7 Aug 2019 11:42:05 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2136.018; Wed, 7 Aug 2019
 11:42:05 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH v3 hmm 10/11] drm/amdkfd: use mmu_notifier_put
Thread-Topic: [PATCH v3 hmm 10/11] drm/amdkfd: use mmu_notifier_put
Thread-Index: AQHVTKz0LjDSzhEB4EaA22+m0WS24abuyVUAgADHj4A=
Date: Wed, 7 Aug 2019 11:42:05 +0000
Message-ID: <20190807114159.GA1571@mellanox.com>
References: <20190806231548.25242-1-jgg@ziepe.ca>
 <20190806231548.25242-11-jgg@ziepe.ca>
 <d58a1a8f-f80c-edfe-4b57-6fde9c0ca180@amd.com>
In-Reply-To: <d58a1a8f-f80c-edfe-4b57-6fde9c0ca180@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::20)
 To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1087a58d-cdab-450f-eed7-08d71b2c4559
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR05MB4224; 
x-ms-traffictypediagnostic: VI1PR05MB4224:
x-microsoft-antispam-prvs: <VI1PR05MB42240F0964A805F21C3C18CECFD40@VI1PR05MB4224.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(199004)(189003)(186003)(446003)(478600001)(11346002)(7736002)(14444005)(316002)(6246003)(33656002)(2616005)(476003)(71200400001)(71190400001)(4326008)(8676002)(256004)(2906002)(486006)(386003)(8936002)(6916009)(7416002)(102836004)(6486002)(68736007)(99286004)(52116002)(305945005)(229853002)(26005)(54906003)(6506007)(53546011)(3846002)(6116002)(81156014)(6512007)(66556008)(14454004)(36756003)(66066001)(1076003)(53936002)(81166006)(66476007)(76176011)(25786009)(5660300002)(6436002)(64756008)(66446008)(86362001)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4224;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IgSPmRJlcx5V/wGT4V9R6qOKgkgatfYgsL3FNjghYwzUEfezLy17OMRBs0OLS1AEpzQMLrIeMb4FmHDcS6BVivZf99xzE08ks276NRr4Z2vz7zSyVNi/dibZowxwQPcXCs3/1DH7tyLjc53VdBy+Vq30x1L+pT/WopWnLZxOIFgTLShW/o/kN9FSSqckMwK5jVKt28X34Z/T/oRe3CXyYFgXq1u+kQP0vr4KorDAIXQQKQ43kmQvmDtY8xVzn4+77l54rLKVRcmWfLJ1JcwxDtXTq45K9fOY7cjlA6Qh5+nvCQkLYc4I/hMSr1oWxVwJluom/aQvzZaqYEk2rfws6uGHlc24pD74d8UvjGQEcF3pU5ZdQxmHs3AEQBpgJ/uDKBFDuAynhLq+kBCGkJK1whhSyI+3j+qC0V5XDgb3iNM=
Content-ID: <FEC4B53D5BFE794F897559B0282A7946@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1087a58d-cdab-450f-eed7-08d71b2c4559
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 11:42:05.4715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4224
X-Mailman-Approved-At: Thu, 08 Aug 2019 07:46:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aL+citF68CAxs6Y8RXNOO5t8vu7g/fcgeL4uoy5a6ZE=;
 b=mKYy+2iHsozehJuxnw2Y8sf/QMwxnQla+qM2hpFCgrK84l2hGEG7x8dV1TShUhZACyb8JgBO40qZOXA6fAM9GJTdhr8DWRuLBCmDYb0HkiDsVzSp2YBcLWOjz3N0B6FqRu1UDADmhKFMWLxeluH+jJrbtMgf0N0p3EZLy+M7doY=
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Dimitri Sivanich <sivanich@sgi.com>,
 Gavin Shan <shangw@linux.vnet.ibm.com>, Andrea Righi <andrea@betterlinux.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMTE6NDc6NDRQTSArMDAwMCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOgo+IE9uIDIwMTktMDgtMDYgMTk6MTUsIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiA+
IEZyb206IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPiA+Cj4gPiBUaGUgc2Vx
dWVuY2Ugb2YgbW11X25vdGlmaWVyX3VucmVnaXN0ZXJfbm9fcmVsZWFzZSgpLAo+ID4gbW11X25v
dGlmaWVyX2NhbGxfc3JjdSgpIGlzIGlkZW50aWNhbCB0byBtbXVfbm90aWZpZXJfcHV0KCkgd2l0
aCB0aGUKPiA+IGZyZWVfbm90aWZpZXIgY2FsbGJhY2suCj4gPgo+ID4gQXMgdGhpcyBpcyB0aGUg
bGFzdCB1c2VyIG9mIHRob3NlIEFQSXMsIGNvbnZlcnRpbmcgaXQgbWVhbnMgd2UgY2FuIGRyb3AK
PiA+IHRoZW0uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVs
bGFub3guY29tPgo+IAo+IFJldmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxp
bmdAYW1kLmNvbT4KPiAKPiA+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYu
aCAgICB8ICAzIC0tLQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vz
cy5jIHwgMTAgKysrKy0tLS0tLQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBJJ20gcmVhbGx5IG5vdCBzdXJlIHdoYXQgdGhpcyBp
cyBkb2luZywgYnV0IGl0IGlzIHZlcnkgc3RyYW5nZSB0byBoYXZlIGEKPiA+IHJlbGVhc2Ugd2l0
aCBubyBvdGhlciBjYWxsYmFjay4gSXQgd291bGQgYmUgZ29vZCBpZiB0aGlzIHdvdWxkIGNoYW5n
ZSB0byB1c2UKPiA+IGdldCBhcyB3ZWxsLgo+IEtGRCB1c2VzIHRoZSBNTVUgbm90aWZpZXIgdG8g
ZGV0ZWN0IHByb2Nlc3MgdGVybWluYXRpb24gYW5kIGZyZWUgYWxsIHRoZSAKPiByZXNvdXJjZXMg
YXNzb2NpYXRlZCB3aXRoIHRoZSBwcm9jZXNzLiBUaGlzIHdhcyBmaXJzdCBhZGRlZCBmb3IgQVBV
cyAKPiB3aGVyZSB0aGUgSU9NTVV2MiBpcyBzZXQgdXAgdG8gcGVyZm9ybSBhZGRyZXNzIHRyYW5z
bGF0aW9ucyB1c2luZyB0aGUgCj4gQ1BVIHBhZ2UgdGFibGUgZm9yIGRldmljZSBtZW1vcnkgYWNj
ZXNzLiBUaGF0J3Mgd2hlcmUgdGhlIGFzc29jaWF0aW9uIG9mIAo+IEtGRCBwcm9jZXNzIHJlc291
cmNlcyB3aXRoIHRoZSBsaWZldGltZSBvZiB0aGUgbW1fc3RydWN0IGNvbWVzIGZyb20uCgpXaGVu
IGFsbCB0aGUgSFcgb2JqZWN0cyB0aGF0IGNvdWxkIGRvIERNQSB0byB0aGlzIHByb2Nlc3MgYXJl
CmRlc3Ryb3llZCB0aGVuIHRoZSBtbXUgbm90aWZpZmVyIHNob3VsZCBiZSB0b3JuIGRvd24uIFRo
ZSBtb2R1bGUKc2hvdWxkIHJlbWFpbiBsb2NrZWQgdW50aWwgdGhlIERNQSBvYmplY3RzIGFyZSBk
ZXN0cm95ZWQuCgpJJ20gc3RpbGwgdW5jbGVhciB3aHkgdGhpcyBpcyBuZWVkZWQsIHRoZSBJT01N
VSBmb3IgUEFTSUQgYWxyZWFkeSBoYXMKbm90aWZpZmVycywgYW5kIGFscmVhZHkgYmxvY2tzIGFj
Y2VzcyB3aGVuIHRoZSBtbV9zdHJ1Y3QgZ29lcyBhd2F5LAp3aHkgYWRkIGEgc2Vjb25kIGxheWVy
IG9mIHRyYWNraW5nPwoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs

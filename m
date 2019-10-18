Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6DDDDB9C
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D1489CD4;
	Sun, 20 Oct 2019 00:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130048.outbound.protection.outlook.com [40.107.13.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE3489DD3;
 Fri, 18 Oct 2019 20:36:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXS8vb2Jzqod84MSa1ewYRUvPkNE9WagpIfBGh8EST9TAuHU0oWl4dsgUxiiNvRpmzRi0RZ1+nVpS+uKkb/tmFbmLW2oL8u4TyskF/dRq/yBhG7UWEebdOJUbJB4oE4AV9ITzjvPiXE+a/C9TNX+0Oc8YDrJ8HDsx0wcrrrvP3NL8/6QVtTAPUJbNJ0okv36ZpLVn/nBU2DSRybcVOJXpD+b5HLaVXGabVsMJLYa7flTa2YgpRoGimCRRgavkwqDFjFpURwpIvtNXQPaLSBjkz+PMD5RC9DTUibFbORaEmif30fxiGLyeDHntwHbdVhc5+cyCkhStujZVgOvTKmC0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smXqpb9251kp69aNvxZPS9Z8+1UgwbybVdHvLUJQFGY=;
 b=RUEOQJMm5z9iEAFJzsgot+pOk8m2g0pXa8G2s6BJ18y/FzAAGPJgpyO86UXFkSVqmo12zxbJrOiOXBOJMtwlakymxnFq1VhJg9UJ5TTey9ryZEQ5KOkJePEXraSLTYWlBHajvspDzsyNgKFPT5r650JnBxXPyVQS45Ko5MKkaCtkzW/2E/wAjdowrzxwRimT9aZsRjpri3KwLxPydrf0dbLKn7SxDgDKcR0bjt0ofTdAFo5g0pGEvg4kXFYbbgsQfGM/yQbfBXdNOPkEhIUEln/HxWNKlvQlxpo95Ac+u8nNLVffxPnZM1mwI30lTxzS6LpMAoWgH51sqeBqZeujdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4973.eurprd05.prod.outlook.com (20.177.52.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Fri, 18 Oct 2019 20:36:19 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::75ae:b00b:69d8:3db0%7]) with mapi id 15.20.2347.023; Fri, 18 Oct 2019
 20:36:18 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Topic: [PATCH hmm 00/15] Consolidate the mmu notifier interval_tree and
 locking
Thread-Index: AQHVg4Sqa7CCxCToXEeTrrYAqVQVhqdc+JgAgAB3OACAARovgIAAficAgAAF3YCAAdJKAA==
Date: Fri, 18 Oct 2019 20:36:18 +0000
Message-ID: <20191018203608.GA5670@mellanox.com>
References: <20191015181242.8343-1-jgg@ziepe.ca>
 <bc954d29-388b-9e29-f960-115ccc6b9fea@gmail.com>
 <20191016160444.GB3430@mellanox.com>
 <2df298e2-ee91-ef40-5da9-2bc1af3a17be@gmail.com>
 <2046e0b4-ba05-0683-5804-e9bbf903658d@amd.com>
 <d6bcbd2a-2519-8945-eaf5-4f4e738c7fa9@amd.com>
In-Reply-To: <d6bcbd2a-2519-8945-eaf5-4f4e738c7fa9@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MWHPR20CA0044.namprd20.prod.outlook.com
 (2603:10b6:300:ed::30) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [66.51.117.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69e9ab54-0717-40b2-861b-08d7540ad427
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: VI1PR05MB4973:
x-microsoft-antispam-prvs: <VI1PR05MB4973E5D04B92642A40EEE0E6CF6C0@VI1PR05MB4973.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01949FE337
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(189003)(199004)(186003)(66066001)(305945005)(33656002)(3846002)(7736002)(71190400001)(486006)(4326008)(6116002)(229853002)(86362001)(6436002)(6486002)(7416002)(14444005)(71200400001)(81166006)(2616005)(8676002)(256004)(81156014)(8936002)(6916009)(54906003)(66946007)(476003)(64756008)(66556008)(66476007)(446003)(316002)(6506007)(11346002)(52116002)(6246003)(5660300002)(478600001)(76176011)(36756003)(1076003)(14454004)(102836004)(386003)(99286004)(25786009)(26005)(2906002)(66446008)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4973;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UPF+keoznRhlCBtOJNRn0zkttxRh9aDiR7740wSN6aP5QvRQduueDoET4X5x1pwWC7iubmR6zTWcChzGQhe2+MVD4KJDI75s1atMhJKtopvkCy0Bj5vfXOijthH8T+dAWcrzr+WZ8VgxWMj75A6sOUH2aoxwkET7So1hRNBhguEw6JCSDNdu1dA+K79onggltu8YTaZ0vij34iu+tQ5S6Ej2jEn8QnHfKAPgQ2KByQWyTF5gbNMLdHSFvO85QEfrxJcVmKifL9eDGOEFGKcPipCbWU6CgN57IFuTAehoFPGphofEOPr9hnganzBPOWic9c/wwdQY80SYTRqIdq/LS2KhpMtFMx592ESJtoDUFToHWtu8rM+ZofpGwtZvspYRUa0ZqaUKx98FCH8zcCYsYxf9j1HOLHBTrYC7Ml7otTY=
x-ms-exchange-transport-forked: True
Content-ID: <C97D0CFCD1F5B645A1B272BD732EBC74@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e9ab54-0717-40b2-861b-08d7540ad427
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2019 20:36:18.5468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: whpnjBYJtkeFOwuFODiM58DUvsXdve63q0hhi7+SAmJNW+ERnWAS13rlOE/iRUgkf4ZNSY7A4Px29zedbec9uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4973
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smXqpb9251kp69aNvxZPS9Z8+1UgwbybVdHvLUJQFGY=;
 b=r53Jgk999IoxDUKHtfa7EIQ8UnoLc3R0e6RXPbys46Obfs/5j9L5s+yXrWt5Gg46/UeUF2kIUxfWeKlnXYka/+swCuQHxAEMQb/RgnXbksWLe5WjOoKUNsESOEUww8T/oD+0dQO2Z/HQqGJKTODinbGLXXJ9n34+GD3nE+MNVYc=
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, "Yang,
 Philip" <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDQ6NDc6MjBQTSArMDAwMCwgS29lbmlnLCBDaHJpc3Rp
YW4gd3JvdGU6Cgo+ID4gZ2V0X3VzZXJfcGFnZXMvaG1tX3JhbmdlX2ZhdWx0KCkgYW5kIGludmFs
aWRhdGVfcmFuZ2Vfc3RhcnQoKSBib3RoIGFyZQo+ID4gY2FsbGVkIHdoaWxlIGhvbGRpbmcgbW0t
Pm1hcF9zZW0sIHNvIHRoZXkgYXJlIGFsd2F5cyBzZXJpYWxpemVkLgo+IAo+IE5vdCBldmVuIHJl
bW90ZWx5Lgo+IAo+IEZvciBjYWxsaW5nIGdldF91c2VyX3BhZ2VzKCkvaG1tX3JhbmdlX2ZhdWx0
KCkgeW91IG9ubHkgbmVlZCB0byBob2xkIHRoZSAKPiBtbWFwX3NlbSBpbiByZWFkIG1vZGUuCgpS
aWdodAogCj4gQW5kIElJUkMgaW52YWxpZGF0ZV9yYW5nZV9zdGFydCgpIGlzIHNvbWV0aW1lcyBj
YWxsZWQgd2l0aG91dCBob2xkaW5nIAo+IHRoZSBtbWFwX3NlbSBhdCBhbGwuCgpZZXAKIAo+IFNv
IGFnYWluIGhvdyBhcmUgdGhleSBzZXJpYWxpemVkPwoKVGhlICdkcml2ZXIgbG9jaycgdGhpbmcg
ZG9lcyBpdCwgcmVhZCB0aGUgaG1tIGRvY3VtZW50YXRpb24sIHRoZSBobW0KYXBwcm9hY2ggaXMg
YmFzaWNhbGx5IHRoZSBvbmx5IGFwcHJvYWNoIHRoYXQgd2FzIGNvcnJlY3Qgb2YgYWxsIHRoZQpk
cml2ZXJzLi4KClNvIGxvbmcgYXMgdGhlICdkcml2ZXIgbG9jaycgaXMgaGVsZCB0aGUgcmFuZ2Ug
Y2Fubm90IGJlY29tZQppbnZhbGlkYXRlZCBhcyB0aGUgJ2RyaXZlciBsb2NrJyBwcmV2ZW50cyBw
cm9ncmVzcyBvZiBpbnZhbGlkYXRpb24uCgpIb2xkaW5nIHRoZSBkcml2ZXIgbG9jayBhbmQgdXNp
bmcgdGhlIHNlcSBiYXNlZCBtbXVfcmFuZ2VfcmVhZF9yZXRyeSgpCnRlbGxzIGlmIHRoZSBwcmV2
aW91cyB1bmxvY2tlZCBnZXRfdXNlcl9wYWdlcygpIGlzIHN0aWxsIHZhbGlkIG9yCm5lZWRzIHRv
IGJlIGRpc2NhcmQuCgpTbyBpdCBkb2Vzbid0IG1hdHRlciBpZiBnZXRfdXNlcl9wYWdlcygpIHJh
Y2VzIG9yIG5vdCwgdGhlIHJlc3VsdCBpcyBub3QKdG8gYmUgdXNlZCB1bnRpbCB0aGUgZHJpdmVy
IGxvY2sgaXMgaGVsZCBhbmQgbW11X3JhbmdlX3JlYWRfcmV0cnkoKQpjYWxsZWQsIHdoaWNoIHBy
b3ZpZGVzIHRoZSBjb2hlcmVuY2UuCgpJdCBpcyB0aGUgdXN1YWwgc2VxbG9jayBwYXR0ZXJuLgoK
SmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

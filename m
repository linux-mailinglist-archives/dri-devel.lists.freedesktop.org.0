Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E431D123
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 23:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3759B892FB;
	Tue, 14 May 2019 21:14:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680057.outbound.protection.outlook.com [40.107.68.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CF0892FB;
 Tue, 14 May 2019 21:14:44 +0000 (UTC)
Received: from MN2PR12MB3949.namprd12.prod.outlook.com (10.255.238.150) by
 MN2PR12MB2989.namprd12.prod.outlook.com (20.178.241.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Tue, 14 May 2019 21:14:42 +0000
Received: from MN2PR12MB3949.namprd12.prod.outlook.com
 ([fe80::b9af:29f1:fcab:6f6f]) by MN2PR12MB3949.namprd12.prod.outlook.com
 ([fe80::b9af:29f1:fcab:6f6f%4]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 21:14:42 +0000
From: "Kuehling, Felix" <Felix.Kuehling@amd.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 1/2] mm/hmm: support automatic NUMA balancing
Thread-Topic: [PATCH 1/2] mm/hmm: support automatic NUMA balancing
Thread-Index: AQHVB2oGxdqwfWjT3keZMPNyIuFBZ6ZplnYAgAGOzIA=
Date: Tue, 14 May 2019 21:14:42 +0000
Message-ID: <180dbdaf-3ca4-07be-b549-08757e2ef105@amd.com>
References: <20190510195258.9930-1-Felix.Kuehling@amd.com>
 <20190510195258.9930-2-Felix.Kuehling@amd.com>
 <20190513142720.3334a98cbabaae67b4ffbb5a@linux-foundation.org>
In-Reply-To: <20190513142720.3334a98cbabaae67b4ffbb5a@linux-foundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-clientproxiedby: YTXPR0101CA0042.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::19) To MN2PR12MB3949.namprd12.prod.outlook.com
 (2603:10b6:208:16b::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ead95ba-1d79-484c-ead8-08d6d8b12ecb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2989; 
x-ms-traffictypediagnostic: MN2PR12MB2989:
x-microsoft-antispam-prvs: <MN2PR12MB2989011921D6100FB62179C392080@MN2PR12MB2989.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(376002)(346002)(39860400002)(396003)(199004)(189003)(99286004)(66946007)(71190400001)(71200400001)(52116002)(6512007)(76176011)(31696002)(86362001)(66476007)(66556008)(73956011)(256004)(14444005)(64756008)(66446008)(26005)(446003)(478600001)(6436002)(72206003)(36756003)(25786009)(54906003)(58126008)(6116002)(3846002)(66066001)(4326008)(65956001)(65806001)(6506007)(386003)(53546011)(4744005)(102836004)(316002)(2906002)(64126003)(6486002)(31686004)(486006)(476003)(305945005)(14454004)(53936002)(81156014)(81166006)(229853002)(6916009)(186003)(2616005)(7736002)(11346002)(5660300002)(8936002)(6246003)(65826007)(8676002)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2989;
 H:MN2PR12MB3949.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vZh2Laa8AtjRPNVAWHtiCkM6DX5wAO8Q40kRfgd1V70gP7KM67CE1PBNa7ox0dIChQvHRbz+wQtOF79Au89V/lZqej5uF3tk8MF6pL+kmjgReJZDmn55+VSdBBWX3uAj7SfeWewtFe1pJfHr3VfU9olGvjt8xC20E7wtpBKqxcrvsZk5G2GyDcCGS/IMWcqeEioEMtJsuVFf0MMOE4LhrJ4jPUaYD44Gq6l+qGeMusI1xRGm5nFwC7sHXoka+eTNQRmdE0yutx3xxEnvT9AJHCYuVW1I3cxzS1QKQgl7lc3wPWPCtS7g+QKZanLKIzSkO128Xfu8aXlrjmIVvgCqdeBXelDTWuhFWQ8NQR8IvGOGouHuZUs/W8IuiqohAHxcFWweWb2zOqOqhKmj02eLUCwhZzBPZyps2ZJ/ODlzHQU=
Content-ID: <37BFBE354B9EE042991B3828B0383237@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ead95ba-1d79-484c-ead8-08d6d8b12ecb
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 21:14:42.8392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2989
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKwa8E3jh5+W/cbcaoZsR2eB0KxE0u7jRbZGOEH9u1Q=;
 b=OgbI2k2ICcIgK33ij62KLuzOm94yL+XouJDOOB8Ox0OoUALQBrgJRcUD7oR95D6VsW4QK7qTQZbMCl3bLzqWLWZmQmFJCRmuhFr+wMPXdLnqTMsGrb6uKx6yeLlJfVvKqZrL916/rtdMdJgfZXGXyfeXcmmetRSRqJAqfxzZdZA=
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
Cc: "Yang, Philip" <Philip.Yang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0wNS0xMyA1OjI3IHAubS4sIEFuZHJldyBNb3J0b24gd3JvdGU6DQo+IFtDQVVUSU9O
OiBFeHRlcm5hbCBFbWFpbF0NCj4NCj4gT24gRnJpLCAxMCBNYXkgMjAxOSAxOTo1MzoyMyArMDAw
MCAiS3VlaGxpbmcsIEZlbGl4IiA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4gd3JvdGU6DQo+DQo+
PiBGcm9tOiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4NCj4+DQo+PiBXaGlsZSB0
aGUgcGFnZSBpcyBtaWdyYXRpbmcgYnkgTlVNQSBiYWxhbmNpbmcsIEhNTSBmYWlsZWQgdG8gZGV0
ZWN0IHRoaXMNCj4+IGNvbmRpdGlvbiBhbmQgc3RpbGwgcmV0dXJuIHRoZSBvbGQgcGFnZS4gQXBw
bGljYXRpb24gd2lsbCB1c2UgdGhlIG5ldw0KPj4gcGFnZSBtaWdyYXRlZCwgYnV0IGRyaXZlciBw
YXNzIHRoZSBvbGQgcGFnZSBwaHlzaWNhbCBhZGRyZXNzIHRvIEdQVSwNCj4+IHRoaXMgY3Jhc2gg
dGhlIGFwcGxpY2F0aW9uIGxhdGVyLg0KPj4NCj4+IFVzZSBwdGVfcHJvdG5vbmUocHRlKSB0byBy
ZXR1cm4gdGhpcyBjb25kaXRpb24gYW5kIHRoZW4gaG1tX3ZtYV9kb19mYXVsdA0KPj4gd2lsbCBh
bGxvY2F0ZSBuZXcgcGFnZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBQaGlsaXAgWWFuZyA8UGhp
bGlwLllhbmdAYW1kLmNvbT4NCj4gVGhpcyBzaG91bGQgaGF2ZSBpbmNsdWRlZCB5b3VyIHNpZ25l
ZC1vZmYtYnk6LCBzaW5jZSB5b3Ugd2VyZSBvbiB0aGUNCj4gcGF0Y2ggZGVsaXZlcnkgcGF0aC4g
IEknbGwgbWFrZSB0aGF0IGNoYW5nZSB0byBteSBjb3B5IG9mIHRoZSBwYXRjaCwNCj4gT0s/DQo+
DQpZZXMuIFRoYW5rcyENCg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=

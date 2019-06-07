Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF783A597
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9761B892E4;
	Sun,  9 Jun 2019 12:54:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30088.outbound.protection.outlook.com [40.107.3.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10F489DA5;
 Fri,  7 Jun 2019 18:51:22 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5869.eurprd05.prod.outlook.com (20.178.125.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Fri, 7 Jun 2019 18:51:18 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::c16d:129:4a40:9ba1%6]) with mapi id 15.20.1965.011; Fri, 7 Jun 2019
 18:51:18 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2 hmm 03/11] mm/hmm: Hold a mmgrab from hmm to mm
Thread-Topic: [PATCH v2 hmm 03/11] mm/hmm: Hold a mmgrab from hmm to mm
Thread-Index: AQHVHJfsjve3VpvfK0iKvy9k76PyJKaQiAIAgAACw4A=
Date: Fri, 7 Jun 2019 18:51:18 +0000
Message-ID: <20190607185113.GF14771@mellanox.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-4-jgg@ziepe.ca>
 <605172dc-5c66-123f-61a3-8e6880678aef@nvidia.com>
In-Reply-To: <605172dc-5c66-123f-61a3-8e6880678aef@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:208:160::33) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c00a4373-03ca-4166-2866-08d6eb791ffd
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR05MB5869; 
x-ms-traffictypediagnostic: VI1PR05MB5869:
x-microsoft-antispam-prvs: <VI1PR05MB58695D751D5C3702EDDA94DECF100@VI1PR05MB5869.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-forefront-prvs: 0061C35778
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(396003)(366004)(39860400002)(136003)(189003)(199004)(3846002)(558084003)(86362001)(316002)(52116002)(6246003)(11346002)(8676002)(8936002)(66556008)(71200400001)(81166006)(6506007)(305945005)(54906003)(6116002)(229853002)(71190400001)(6486002)(66066001)(64756008)(66446008)(7736002)(66946007)(102836004)(99286004)(6916009)(478600001)(73956011)(6512007)(1076003)(53936002)(14454004)(6436002)(66476007)(256004)(25786009)(76176011)(33656002)(81156014)(68736007)(5660300002)(446003)(486006)(2616005)(2906002)(53546011)(186003)(4326008)(36756003)(26005)(386003)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5869;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n+stqAix+Tn0aLVPjWDW2vTKorm3d9SSzs9OhKDw4dqDsSeXwX5pqh7XhCG+hEeu7uLmRAQQdgUkJx5jj6fJHFkqBhzOi7ruFWDWqVsdYduWB6PbvrD2HcrvA+iM+FRcffuJuScRsxqKBUtTNrpTzTVcxd7hWvi1f6xtWJ+HAur5Bv0lds+VdQ6ykex7wCpddULcIHAhNQJW9ToR9TH18kHVWRe8Xcz+BWN6B5zt3De66vZGAP8QOgu+R0QaoIiRDy5YvJIQRfnv5M/rILFVkMJWncMZauZIxEOoLwDoXEJnQ+4bwWvY69fOyC8DjOaZ/bLkN6zkhbbDgY253SI2RvlUJRTKGHRseCfmhJOpamCSZWCRxLf0ieqKU7KgzPOwoXUEGou7u8tJaJF6IEDkLOpTDIt9cuRrWqcfKrnX1Dg=
Content-ID: <0ED1D20CB91BB94C8ED721D38322F396@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c00a4373-03ca-4166-2866-08d6eb791ffd
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2019 18:51:18.4066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5869
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRw/IJJcG2eME8/d+ka6VpE5+lGTha4ZmhExxxxr+Oc=;
 b=owwp0k7AsULPqOBGpTrCpr/hPuxURHvaHf8Yx9ICyohivwEOklO9ywX+Qh4bcUG08fJeqRxjh8L1tV0qIVdBQhjkvAl1ndf6DttEAkBjyj037lvf/+ycsIFIK2MESxOA/2lSz6ql5BZmSsdeq70zLUmjYULHN1gYwWthB91OQi8=
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
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 John Hubbard <jhubbard@nvidia.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMDcsIDIwMTkgYXQgMTE6NDE6MjBBTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gCj4gT24gNi82LzE5IDExOjQ0IEFNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4g
PiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gPiAKPiA+IFNvIGxv
bmcgYSBhIHN0cnVjdCBobW0gcG9pbnRlciBleGlzdHMsIHNvIHNob3VsZCB0aGUgc3RydWN0IG1t
IGl0IGlzCj4gCj4gcy9hIGEvYXMgYS8KCkdvdCBpdCwgdGhhbmtzCgpKYXNvbgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

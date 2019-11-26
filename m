Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DD510AB70
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380CC6E21E;
	Wed, 27 Nov 2019 08:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70070.outbound.protection.outlook.com [40.107.7.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA846E47E;
 Tue, 26 Nov 2019 18:45:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMQ7Do0H7Isu3NQpEcrYc465bVX1JrtmK6p028mh0i0/ALKHVYRFMxrVV25vapenBQejbluBRjVbJtMV+5uTODljxbodoBPHuNBJhfUHlkhG2tENS+IyFta7tP8bi4R3tpcAq5aPd5EBYGDjqfW1Us4hNsrbOHH6bNDwymYup3fWwg8bMr0GVAXZp+63Crj7cWBefnkc5NrDsD3AFsWBFqEgvNevzzMjemop+ab3cnrVcIOhrvPKyHnHTGikUu/XWm3Vnc8A8iw0cMRrPPS0cOWyTFo8fcDEbb7EAPuCq8uQUiJ2kcZvyx7TtcR0Snh/5ZixNolfUuziTmGjlcNL7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jajf0MVACsz5dJz+0uPelxO58JxETbVnVJJ56qmTq94=;
 b=QC7slHo33DN4JHjGqVjpuseu6FkMGxpyhIoFLEDcDW1ktPJ9iDpfN9QM7zgG2k49kaqOFUTUe7kcYdJ35cVE1zDsdiRrbbFe6xG1ONXhxgTUpwKPc6EBtVE4kRbRiErYB4IecEoi/qmRoNoFFbKRjyDeVFx6zCvJUL4ebXlAZ2icBdBvi6OMCiCKFM+3lzWHLtjIdTKwiWe+SOS1paX2fXpehmEYLhMqgSg1IS4yW8ojKR6mIUMlHY7fFsnEH4J4/nXsjDbwgz+v3CRCPpFZXmfToxdLdicJcpccJKsXhmYa4ngvRlG/rSIWKNAAjMv84EVkRyeR7OjtpA2oD2qm7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB5022.eurprd05.prod.outlook.com (20.177.52.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Tue, 26 Nov 2019 18:45:14 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 18:45:14 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Niranjan Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [RFC 06/13] drm/i915/svm: Page table mirroring support
Thread-Topic: [RFC 06/13] drm/i915/svm: Page table mirroring support
Thread-Index: AQHVoXkU4+8qDaOXOUCsq1WAd1fqfqeX13IAgABW8ACAAUErAIABZViAgAEPawCAADS7AIABt0SA
Date: Tue, 26 Nov 2019 18:45:14 +0000
Message-ID: <20191126184509.GN7481@mellanox.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-7-niranjana.vishwanathapura@intel.com>
 <20191122233308.GA7481@mellanox.com>
 <20191123044417.GE14488@nvishwa1-DESK.sc.intel.com>
 <20191123235348.GD7481@mellanox.com>
 <20191124211247.GF14488@nvishwa1-DESK.sc.intel.com>
 <20191125132414.GQ7481@mellanox.com>
 <20191125163256.GG14488@nvishwa1-DESK.sc.intel.com>
In-Reply-To: <20191125163256.GG14488@nvishwa1-DESK.sc.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR19CA0117.namprd19.prod.outlook.com
 (2603:10b6:404:a0::31) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 257b09b5-f05c-44e8-409a-08d772a0c606
x-ms-traffictypediagnostic: VI1PR05MB5022:
x-microsoft-antispam-prvs: <VI1PR05MB5022577ED29260F8FD508D33CF450@VI1PR05MB5022.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(189003)(199004)(71200400001)(6506007)(386003)(52116002)(76176011)(1076003)(11346002)(2616005)(446003)(186003)(99286004)(26005)(102836004)(86362001)(4744005)(66446008)(66476007)(316002)(64756008)(66946007)(14454004)(66556008)(7736002)(5660300002)(14444005)(305945005)(54906003)(7416002)(36756003)(25786009)(256004)(3846002)(229853002)(6512007)(6486002)(6436002)(478600001)(6916009)(2906002)(8936002)(6116002)(66066001)(71190400001)(6246003)(81156014)(4326008)(81166006)(33656002)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5022;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UPwVhwkI7vBaD9TJWFyaynNyc7ZOD0YB7y/COKJiOMgAtK7ITOj0YeuwgFZ4KUZVi+O0JCSqlQY9xab9pDJzXpRcgtu5fj/F5w5/tTGEYMFdJRUYAFSw2rQsaHEotM3mjo5YrywvUKIgdyyI/qUmAllyNN/K+245uYKxGK9s0iPekZ0HRlqjlTCd6Ncb0Q0rrWMXo1L1f/sen8v5p6Fpvx6Oc7CpFDq2niP9XEAmSF4itLXpOIYvXOHotWKUhqbDs+BB5psf1sTs20cchtXjJGEAmtZFItEAzdpvUDovorLdfQ+n9Z9nd9kyY/6QKioO4u2GL57nHR3KFCKBSRYC5PLahpT06JRSXXB3vuxFRO34NyujD4rfep5l8w6JWjXL/dIp47oRnM4kfi3zJB0ljp6ZHON7FYz6ypGw/9EkZHLIpv6hzgLZuNSAjUK0AOdh
x-ms-exchange-transport-forked: True
Content-ID: <ACB72547AA287144B106A80BD01F0FA0@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 257b09b5-f05c-44e8-409a-08d772a0c606
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 18:45:14.0885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TeLiYlXJFdeFauN2X7XnO3Mv0sWE7ulJbp96QUkuKsDMgz9qF4ni0gULRuT8DCe5nFQUh7ZrzAB3wO1623riTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5022
X-Mailman-Approved-At: Wed, 27 Nov 2019 08:09:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jajf0MVACsz5dJz+0uPelxO58JxETbVnVJJ56qmTq94=;
 b=HCepdoEXjSXLCgAjEgREoIWx1y6eSB4x50Rt7HRTrB1i2ER6Qd/cLDRHIClAPTYx4zZlWx0RvbsUbH1xlszD5w5tU1mLzEBN2u/JkC4KqAnAgHVAap2+wgURknOsLVDonSp/Rg8AyaEnqDzTBExCdq3+cg118zMMxV+W5h6imU8=
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "sanjay.k.kumar@intel.com" <sanjay.k.kumar@intel.com>,
 "sudeep.dutt@intel.com" <sudeep.dutt@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "jglisse@redhat.com" <jglisse@redhat.com>,
 "jon.bloomfield@intel.com" <jon.bloomfield@intel.com>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "ira.weiny@intel.com" <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMjUsIDIwMTkgYXQgMDg6MzI6NThBTSAtMDgwMCwgTmlyYW5qYW4gVmlzaHdh
bmF0aGFwdXJhIHdyb3RlOgo+ID4gQW5kIHB1dHRpbmcgdGhlIGNwdSBQRk4gb2YgYSBaT05FX0RF
VklDRSBkZXZpY2UgcGFnZSBpbnRvCj4gPiBzZ19kbWFfYWRkcmVzcyBzdGlsbCBsb29rcyB2ZXJ5
IHdyb25nIHRvIG1lCj4gCj4gVGhlIGJlbG93IGNhbGwgaW4gcGF0Y2ggNyBkb2VzIGNvbnZlcnQg
YW55IGNwdSBQRk4gdG8gZGV2aWNlIGFkZHJlc3MuCj4gU28sIGl0IHdvbid0IGJlIENQVSBQRk4u
Cj4gaTkxNV9kbWVtX2NvbnZlcnRfcGZuKHZtLT5pOTE1LCAmcmFuZ2UpOwoKV2VsbCwgdGhlbiBp
dCBzaG91bGQgYmUgZG9uZSBoZXJlIGluIHBhdGNoIDYsIHN1cmVseT8KCj4gQWxzbywgb25seSBy
ZWFzb24gdG8gdXNlIHNnbCBsaXN0IGlzIGJlY2F1c2UgaTkxNSBkcml2ZXIgcGFnZSB0YWJsZSB1
cGRhdGUKPiBmdW5jdGlvbnMgdGFrZXMgYW4gc2dsLCBvdGhlcndpc2Ugd2UgY2FuIGRpcmVjdGx5
IGRlYWwgd2l0aCByYW5nZS5wZm5zIGFycmF5LgoKTWF5YmUgdGhhdCBzaG91bGQgYmUgZml4ZWQg
aW5zdGVhZCBvZiBhYnVzaW5nIHNnbAoKSmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs

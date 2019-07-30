Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A92A7BA55
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265CA6E691;
	Wed, 31 Jul 2019 07:14:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40081.outbound.protection.outlook.com [40.107.4.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA03D6E4F8;
 Tue, 30 Jul 2019 13:15:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YeyHKzxapEPVsPmYMjmnzxv52O6MhXo2GMBEa8dRb+fRGhk2kRwQm8SrkjZDxyB1diwMJoDLUmgRUz9JQu5IxqMfS2I7tHyzbiDPDd556kN/mkx0gpZAWRZ0nJdvQhJoWEvdeLspd4uhxAjxwlhkP/XqW/IZ4nOaESLXxRKXNU0rWtZ4CZeqFNeoTMoJuNqYbX6u3a/ShzAvs+ldJT3T4+ID+Gj6A/B68O+vDLMFgqnZ+qec07ob8CS/p/238G9ZneXC4g6Te4Hn98KFm3FzevWvBWgqQe44sPMdc2Y65nbOnVd04pLnTBTJu/z6NFK1uWmMNKZtiZE6SJ98JME+Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57mhJ9lMltaZjfOvKsO3150A4ENNC9zgifoRzzxIcoA=;
 b=JvmnHemilL+Oe7BEKHfkoUcxQyTk2V9ecEYkzC9xQs8D93FojseY9SnjLSi/S/6vbBnNO28GLlDlLm9tIxTLwslNkVCS1OaY4hy5HD5huy02FaEWR7ei730q3mQM6XFF0sH4+gVkA7WFxhjKUtxQ9vnVNFlnFUqk0k3xd+AGNjLX6GNR4PGqwvItpmR68VU+nTaXgQFAIgX9LYIM4kUsKMAvImraYPwyZaIIx/SmKWxW9kABYgwA3qOMOJjXhXK8vqVdVjTVB0rZyNhuts9ADIcT7yYbtJz1UkPhjPtRPot/cZXHaeGZourhulg9GrP7WyGzevIdqx+Lb1GPeN+iEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB4288.eurprd05.prod.outlook.com (52.133.12.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Tue, 30 Jul 2019 13:14:59 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2115.005; Tue, 30 Jul 2019
 13:14:58 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 03/13] nouveau: pass struct nouveau_svmm to
 nouveau_range_fault
Thread-Topic: [PATCH 03/13] nouveau: pass struct nouveau_svmm to
 nouveau_range_fault
Thread-Index: AQHVRpr4kL6aKlcudUqEUBBy4/lXjabjGXIAgAAJtACAAAExAA==
Date: Tue, 30 Jul 2019 13:14:58 +0000
Message-ID: <20190730131454.GG24038@mellanox.com>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-4-hch@lst.de> <20190730123554.GD24038@mellanox.com>
 <20190730131038.GB4566@lst.de>
In-Reply-To: <20190730131038.GB4566@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YQXPR0101CA0007.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:15::20) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 567c83d6-26ec-4ba9-1306-08d714efec1a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB4288; 
x-ms-traffictypediagnostic: VI1PR05MB4288:
x-microsoft-antispam-prvs: <VI1PR05MB4288B858C7DEF569EBA2921FCFDC0@VI1PR05MB4288.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(199004)(189003)(54534003)(86362001)(33656002)(68736007)(25786009)(7736002)(305945005)(14444005)(2906002)(6916009)(229853002)(256004)(446003)(478600001)(6486002)(6436002)(1076003)(71190400001)(71200400001)(7416002)(66066001)(36756003)(11346002)(8676002)(4326008)(4744005)(81166006)(81156014)(486006)(476003)(186003)(53936002)(316002)(8936002)(386003)(6506007)(76176011)(26005)(14454004)(102836004)(99286004)(6512007)(54906003)(52116002)(2616005)(6116002)(66476007)(66556008)(66446008)(64756008)(5660300002)(3846002)(66946007)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4288;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mG8LV/6niYle0ZfCKqOsSXVNrQ8TsIEpZPZqLtc80iGAge6QFyZsPbO30d+w3zdHDTEbD3U6wHgrvsPxKUMejwgk+w1i9GxHsu1wuIVJa0S5iRpKEjH90e5zi+s/3+gRx5AHYU+OeLLboPMXlrPOYCThmhXaZdDTxKJYeN1e02y099G/gaySkSr+sG88WiJQari78KQ/O1YAdV6b0mFHtNbEyv9g1PzFaEne7NAS/Tn0ypDFQQtG3k+P09mmNpwFr4Y1HXZAJm5fC7pJCML7w+0xdH1tjfhXcUNJIReXF7/mSduVlhTx5f4b4eUMed/wNqK33lbMvZ6Cpuu+wq5ZKRwAbWKtdisCmbKE4lDTZBGlqIt+GeEG5xbxh2gO/ASl9WiZt4YsXdBGriWoxOEUVDFJrWRKV2AxKVnJIw2ma0U=
Content-ID: <9EFBC7D2033F0A4F9278F6401B93A640@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 567c83d6-26ec-4ba9-1306-08d714efec1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 13:14:58.8754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4288
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57mhJ9lMltaZjfOvKsO3150A4ENNC9zgifoRzzxIcoA=;
 b=r85R4ymaS8JN55FyHNv8uJSJgkrQ44ttgTpkVWvZgwWV4EszNSZOMcgJ54hyc6RDJTFTJJJEYA+Kmwnp5bJGksFqeHQtjD0Qzr/D5ZoBgX8NcykCHq0teC9wyIFAKOVu3arBC6XKVJYgv9LTBWegrPWROPvz7E7UZAptTETHZmQ=
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDM6MTA6MzhQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMTI6MzU6NTlQTSArMDAwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gT24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDg6NTE6NTNB
TSArMDMwMCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiA+IFRoaXMgYXZvaWQgaGF2aW5n
IHRvIGFidXNlIHRoZSB2bWEgZmllbGQgaW4gc3RydWN0IGhtbV9yYW5nZSB0byB1bmxvY2sKPiA+
ID4gdGhlIG1tYXBfc2VtLgo+ID4gCj4gPiBJIHRoaW5rIHRoZSBjaGFuZ2UgaW5zaWRlIGhtbV9y
YW5nZV9mYXVsdCBnb3QgbG9zdCBvbiByZWJhc2UsIGl0IGlzCj4gPiBub3cgdXNpbmc6Cj4gPiAK
PiA+ICAgICAgICAgICAgICAgICB1cF9yZWFkKCZyYW5nZS0+aG1tLT5tbS0+bW1hcF9zZW0pOwo+
ID4gCj4gPiBCdXQsIHllcywgbGV0cyBjaGFuZ2UgaXQgdG8gdXNlIHN2bW0tPm1tIGFuZCB0cnkg
dG8ga2VlcCBzdHJ1Y3QgaG1tCj4gPiBvcGFxdWUgdG8gZHJpdmVycwo+IAo+IEl0IGdvdCBsb3N0
IHNvbWV3aGF0IGludGVudGlvbmFsbHkgYXMgSSBkaWRuJ3Qgd2FudCB0aGUgY2h1cm4sIGJ1dCBJ
Cj4gZm9yZ290IHRvIHVwZGF0ZSB0aGUgY2hhbmdlbG9nLiAgQnV0IGlmIHlvdSBhcmUgZmluZSB3
aXRoIGNoYW5naW5nIGl0Cj4gb3ZlciBJIGNhbiBicmluZyBpdCBiYWNrLgoKSSBoYXZlIGEgcGF0
Y2ggZGVsZXRpbmcgaG1tLT5tbSwgc28gdXNpbmcgc3ZtbSBzZWVtcyBjbGVhbmVyIGNodXJuCmhl
cmUsIHdlIGNvdWxkIGRlZmVyIGFuZCBJIGNhbiBmb2xkIHRoaXMgaW50byB0aGF0IHBhdGNoPwoK
SmFzb24KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

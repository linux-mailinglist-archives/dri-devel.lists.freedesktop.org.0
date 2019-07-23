Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A96B71F26
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:23:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38B7B6E359;
	Tue, 23 Jul 2019 18:23:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00043.outbound.protection.outlook.com [40.107.0.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEC06E2E5;
 Tue, 23 Jul 2019 15:27:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9JVfRA9eJHXCkYNRem5dyoBhHLOryjZThoRqNJPOm4/yihKZhp9AJamZnS1GzDsOjnXUNMc4TJHc13mYPjUo8TJb9LXRPIrl0zYhqlcLR2uRaaPqSVVmpg5obj1HlZA4o+nj5AD1win1Ds5SD28GMPpFWbRtHnkld80PS5PE1VKuKKW2N6/vvX6oo1NJZely3X9t5SJvc0vhX9OYjuDlmQUy7oQKXwnmKPBG7cuVJSctC2uzbEXOgBWJAuyhT1Di0WAR0BBGoC81lx+OK34HRbHse3AtK06sI1iiTRtAw8LZUheoeSjGut+dwQm8N68WDPMP7Oj7yV4bQVaO0z7ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpcazAqwrCQDcqNA29XrIefQcOTMThsWzZPeF9D1w0Q=;
 b=jm52erIVMC8iZWoT+kq1+d0w3ELz5RvDuIJKUti1F7kLjm3YdL9da0+fmV8TugvsUkPZDQu6fER15qc2ts6cEODPqMz8xpZovU8nHaoM+x7PQt8CeFequOzhJNwvl8I2udWfA3Jqw6x7rsOn5ak3B9QuBFvLN9Hj/1GfJwEJqsbA87WjUNCh1Jrj7Eldv2OQhAKneY+jX0KdaWxade4umlT39z0DtEZu0fQhZwJSmkNpPWKUlFqHhXOMQtQErZX0t2MI7UGMTrJPX1tBeISOXpyKLz5aaDPbR0v/T19Iw/YXDh62ozKiIpxlL81OjhF4w3+mzSvN6450jyDQBkFr8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=mellanox.com;dmarc=pass action=none
 header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5261.eurprd05.prod.outlook.com (20.178.8.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 15:27:42 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2094.013; Tue, 23 Jul 2019
 15:27:41 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: hmm_range_fault related fixes and legacy API removal v2
Thread-Topic: hmm_range_fault related fixes and legacy API removal v2
Thread-Index: AQHVQHIRntNvIPdbDk2nPEKsWJGfiKbYVWyA
Date: Tue, 23 Jul 2019 15:27:41 +0000
Message-ID: <20190723152737.GO15331@mellanox.com>
References: <20190722094426.18563-1-hch@lst.de>
In-Reply-To: <20190722094426.18563-1-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::34) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7910dff-f7dc-46ae-41ab-08d70f824d91
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5261; 
x-ms-traffictypediagnostic: VI1PR05MB5261:
x-microsoft-antispam-prvs: <VI1PR05MB5261829FD697C0314F91489FCFC70@VI1PR05MB5261.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(39860400002)(136003)(376002)(189003)(199004)(68736007)(86362001)(3846002)(6116002)(6486002)(99286004)(316002)(6916009)(54906003)(446003)(81166006)(186003)(6246003)(11346002)(386003)(4326008)(66476007)(76176011)(2906002)(33656002)(102836004)(25786009)(6506007)(2616005)(476003)(26005)(66946007)(66446008)(64756008)(66556008)(6436002)(53936002)(6512007)(52116002)(66574012)(1076003)(256004)(8936002)(7736002)(305945005)(486006)(14454004)(5660300002)(66066001)(71190400001)(71200400001)(478600001)(36756003)(4744005)(229853002)(81156014)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5261;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RxWwY38iPTu3gct/6iBhlpL/aVkkdN7hnnhRxGv2qFeUZas6kcGkuNyN/7QbBf1qgeWRPZ8ywvR6MRXK5bmHutzVZm91HR/iUdU+APW6okeQX/xiLWpVuvJiL71ul/Z6egvJv358/Q5cNJIFzv9fjVKuaE9sk3tXJe0xaxLiqVllAyB2ELo76i2oivCKyzN/bcZj7Amb9Jk6LYmrG5AIi4pcTMJvVASD+F7AHGsiY6bEPhFnH504tr1tIjEXuvfMRRLNhP76FkykhwjIaI3XleE/YNjptqxIgUdonutgj194LNu+JV0smdg2tvu6Rbuvg7940j0zQ5MMfSYd/0yggkv5S8UriywNVtrIz4OZ6WmdxOxGDpcszeFkktbdM1gSLr7byOz3xSIoSfuPB/oUfyYTooR0hYE7mIUk+xxxte4=
Content-ID: <26A6F7202CFF03408F66F9FA8B336B7C@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7910dff-f7dc-46ae-41ab-08d70f824d91
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 15:27:41.8784 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5261
X-Mailman-Approved-At: Tue, 23 Jul 2019 18:22:04 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpcazAqwrCQDcqNA29XrIefQcOTMThsWzZPeF9D1w0Q=;
 b=XJBnB7PIkzKOMDnsh5SUGs37M5rW+u53Sx8EGfBiwdYBkeOw1yFpYP3A6LARSKLSQJYIj1XUIY7NyVjEQ0imXacqKZgg6TSHbcucLW8EnVVTDpiP9Fv8XD+QRC4MdO3lKf4qjX3wZN9G4P1pji5WSnBt/Nk0G/88gWKpSYUKtiE=
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
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?utf-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMTE6NDQ6MjBBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6DQo+IEhpIErDqXLDtG1lLCBCZW4gYW5kIEphc29uLA0KPiANCj4gYmVsb3cgaXMg
YSBzZXJpZXMgYWdhaW5zdCB0aGUgaG1tIHRyZWUgd2hpY2ggZml4ZXMgdXAgdGhlIG1tYXBfc2Vt
DQo+IGxvY2tpbmcgaW4gbm91dmVhdSBhbmQgd2hpbGUgYXQgaXQgYWxzbyByZW1vdmVzIGxlZnRv
dmVyIGxlZ2FjeSBITU0gQVBJcw0KPiBvbmx5IHVzZWQgYnkgbm91dmVhdS4NCj4gDQo+IFRoZSBm
aXJzdCA0IHBhdGNoZXMgYXJlIGEgYnVnIGZpeCBmb3Igbm91dmVhdSwgd2hpY2ggSSBzdXNwZWN0
IHNob3VsZA0KPiBnbyBpbnRvIHRoaXMgbWVyZ2Ugd2luZG93IGV2ZW4gaWYgdGhlIGNvZGUgaXMg
bWFya2VkIGFzIHN0YWdpbmcsIGp1c3QNCj4gdG8gYXZvaWQgcGVvcGxlIGNvcHlpbmcgdGhlIGJy
ZWFrYWdlLg0KDQpJZ25vcmluZyB0aGUgU1RBR0lORyBpc3N1ZSBJJ3ZlIHRyaWVkIHRvIHVzZSB0
aGUgc2FtZSBndWlkZWxpbmUgYXMgZm9yDQotc3RhYmxlIGZvciAtcmMgLi4gDQoNClNvIHRoaXMg
aXMgYSByZWFsIHByb2JsZW0sIHdlIGRlZmluaXRlbHkgaGl0IHRoZSBsb2NraW5nIGJ1Z3MgaWYg
d2UNCnJldHJ5L2V0YyB1bmRlciBzdHJlc3MsIHNvIEkgd291bGQgYmUgT0sgdG8gc2VuZCBpdCB0
byBMaW51cyBmb3INCmVhcmx5LXJjLg0KDQpIb3dldmVyLCBpdCBkb2Vzbid0IGxvb2sgbGlrZSB0
aGUgMXN0IHBhdGNoIGlzIGZpeGluZyBhIGN1cnJlbnQgYnVnDQp0aG91Z2gsIHRoZSBvbmx5IGNh
bGxlcnMgdXNlcyBibG9ja2luZyA9IHRydWUsIHNvIGp1c3QgdGhlIG1pZGRsZQ0KdGhyZWUgYXJl
IC1yYz8NCg0KVGhhbmtzLA0KSmFzb24NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==

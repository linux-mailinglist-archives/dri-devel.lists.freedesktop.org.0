Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2711089C6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:08:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A289C89F69;
	Mon, 25 Nov 2019 08:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70084.outbound.protection.outlook.com [40.107.7.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEF76F547;
 Fri, 22 Nov 2019 23:33:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DwoVy+YWjvA4UbGal3lIYiYdKB93M8eoVlF4yv+MQFHZSrbHlGRF+3UdSK7F2JpNv5KjPh4qybNHK5WwZ4XcaRLc3LJYIp6AKFFD1PD+1pZvoVa7tm9htxrHkT1RiR8A5C2r5fkXaSYIYmMtQ4dWkLi4JxFfZVRYsRGisFTZWHyeQFJcS74KK/t9sWYjwsvYr7Fiy18pRVSz2EGb3eYrHrGMY4cvI+dLmtOqsD8RY9Zgfvxt44rLmZdH6tjer1RDCDs047pUZL/Eupo/qnkDQOAqDuHUQcBPixzYxgWUd2qkHDQBrC3Smt0VZU2bfAqzqMfaRVniIjLEz3nuHheIUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBl0ahA/lHt/l6dGeFj/g48nFtoV6gp8Sco+W2w+isY=;
 b=Ur6bDQOa56f506HdkeyysDQbKBb9KrJGb497imF/huMXfCYZn2oFU8yyl+b4JNf6qQGfcYb3h6bVcpEWFl5YcGp8CgWV3D46LevA2SkLV7I45F8U4gClrZ2WSB5Z2dOuPtDcM4a2N2cbxU7uvv9GUHejZR8bo6/DjggmI7ZEkfEPrrLIv3PTv5lTw5euVYfwL35Xe7NvcyK9jpHNMuTI9C4ulaGYZ81If9mHxNqjLfSRxn+Bz0cG6zRaKZEe2Ajy7X1UJYwmNgnBofkRNDGyPOlFx2aOrUYsiT120xqBoFdcC0JtM8OZ4ttz8zFUC+1aPp5znXJrhX0CcUeA5s/dmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4560.eurprd05.prod.outlook.com (20.176.5.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.17; Fri, 22 Nov 2019 23:33:13 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::b179:e8bf:22d4:bf8d%5]) with mapi id 15.20.2474.021; Fri, 22 Nov 2019
 23:33:12 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [RFC 06/13] drm/i915/svm: Page table mirroring support
Thread-Topic: [RFC 06/13] drm/i915/svm: Page table mirroring support
Thread-Index: AQHVoXkU4+8qDaOXOUCsq1WAd1fqfqeX13IA
Date: Fri, 22 Nov 2019 23:33:12 +0000
Message-ID: <20191122233308.GA7481@mellanox.com>
References: <20191122205734.15925-1-niranjana.vishwanathapura@intel.com>
 <20191122205734.15925-7-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20191122205734.15925-7-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MN2PR19CA0019.namprd19.prod.outlook.com
 (2603:10b6:208:178::32) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [142.162.113.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a6fbe8d3-29a0-4bcc-578d-08d76fa45755
x-ms-traffictypediagnostic: VI1PR05MB4560:
x-microsoft-antispam-prvs: <VI1PR05MB45608FF6E4A2CF7D543732E2CF490@VI1PR05MB4560.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02296943FF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(136003)(396003)(39860400002)(366004)(189003)(199004)(25786009)(4326008)(86362001)(8936002)(54906003)(36756003)(14454004)(81166006)(8676002)(229853002)(6436002)(6486002)(256004)(14444005)(71200400001)(66446008)(71190400001)(81156014)(99286004)(33656002)(64756008)(6246003)(6512007)(66556008)(66946007)(478600001)(66476007)(2616005)(11346002)(446003)(6916009)(7416002)(1076003)(6116002)(305945005)(5660300002)(102836004)(7736002)(66066001)(76176011)(26005)(3846002)(52116002)(386003)(6506007)(316002)(186003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4560;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?us-ascii?Q?jm11i8z7RYj6dfua11+U6iS5XO9YSYj3zUgTCZzCb8vSDBusASkO1w1jtrmq?=
 =?us-ascii?Q?vuDCmnHFQBrYvwxyTIt7gffDHLLYpka1O3PqSQKHJ0Od7TO7L6N1Roe3iYXa?=
 =?us-ascii?Q?FH3RG/OHG5k4WKVSdf0USXKU3ZuzcyCm9ThHkJCX8BFXoURGbWMktzRPUEmp?=
 =?us-ascii?Q?B+DhThbGaQ/u1x5cKjJOUhZTuP4rdy6gdxE3SIWrB9UyAKnXFqJwGrMQwj39?=
 =?us-ascii?Q?y4ZUhjtThwvb4EtTkJFydpw8wJnQTk3vJRwnunyPYflF2BTsertwPsPeaU5F?=
 =?us-ascii?Q?0N4K9Vb6mH7lHMNVeYuKeAU/m7VjLULX24WOYtIhpxza8hmmCiW6ErzVzfoF?=
 =?us-ascii?Q?ajDsuIn+MNrcxV3GBW8Cdpjt2giTNcJ81FC4U1M8ZiodHrPkMEbJgBQ3oBQD?=
 =?us-ascii?Q?Gufpn9yYF+pTcesMgTNfDRMmk6QjHXWIYo/uxdjHaceUB0NZ5je/ERq/aGAZ?=
 =?us-ascii?Q?+3Mi9uuSmXOPMEuAmc6b7P0jknKdFcKk33yhtRev3aLTJdU7Gr2SbFYb1x9+?=
 =?us-ascii?Q?zbxQMUjuf4hgPO05w/EGoyZT68laVXfm0Pz0aMXVIXOOiuQY2ik27HWJoA1f?=
 =?us-ascii?Q?cAK4EmI1EFydMTWZ7a66Sj18Adnw4NhtG7cCrJksQIssFoW+sK0DEHj0Mjh/?=
 =?us-ascii?Q?JgrIAHtxtwfPcgsyuHuBgWm+didWQpdGWVgvMeehY2W1iWMz7raMHcxs2VNU?=
 =?us-ascii?Q?l4bK3FU6AvXdHBqkvrUuIkfGW6zXftoIbvCezUjEnPozZZfMbygVWFUgH9Yk?=
 =?us-ascii?Q?/imn6EKqMcd8+viGTIGF8M3WI+L+991NejmeFM+bLhvzv3WQbLfmSdSYyVti?=
 =?us-ascii?Q?Mfqa43Nmm3aSYAmw6xJ4et0RrBCFn//3Np/kv8n2Cw1mvHn7hWIBKlBjDBqs?=
 =?us-ascii?Q?dxCMD33EAcX5UGeBhHvFHD3LRf01i7G2SEqdgpyaiBcMxdHbyOKWEgA0NYiP?=
 =?us-ascii?Q?Gfo2us9Pj0FDsNX6Bia6KDo0UOI7GM58cbI3mXqiYmQcU/L+2cm/GKpVsCn6?=
 =?us-ascii?Q?xl/saZmLIvehnSK3CB0Lw05SgpDFG2Mjo4NWdB+emxXmx/x8bxIJymtwq6g3?=
 =?us-ascii?Q?+thtEH/SPCo3qvjpzRx8CUtgT2GQthoYbkqPPZbYi/Y/g1omhXhN+sWuNXh4?=
 =?us-ascii?Q?rohAH1uHcGxJv8jQo5zd4mzXe5rfcDlm0IzpS22/l891yTuLT9Qj4cHZrR/H?=
 =?us-ascii?Q?rhIlVxxAiM/yhNFySR4Tf0XJfEgBRT1Ku2zNgZYwZeNBOxgYFWb6MrDyuT70?=
 =?us-ascii?Q?Een8S9zulJQHEZbD/H3hOMn8h5HL4qnkEP0RlD//OqELXhCgMY1bnF1Xc0Wv?=
 =?us-ascii?Q?rwXigF9g5+YmW0KXM1JLJ1X9nZiBE3dNPMK+cZzCnuUPvu4dJms7qdGhU3EJ?=
 =?us-ascii?Q?TqCFV2P0A6nLDEMUVeiA9u+iQH3Opn48rPVwhFOh/nuaKp6nAv3EerLyj9dc?=
 =?us-ascii?Q?nWIGOW4iVJNh/YGjgXc/ni8/eosAupPe9825VZ8fvzkd2g+YwaCezFZ4le2f?=
 =?us-ascii?Q?/OkthePWpFlY/rtgL9K0E6dM/gafCvhRarGyT8eY0p/o4d2ptUgCbvFsZB5K?=
 =?us-ascii?Q?ZhNBdPsuHLCDfmMdXMzinle7hRp4l/XC3ZoTDmA6BFEec0ER0/uk3Iaxs+X+?=
 =?us-ascii?Q?tEY9kuJpP5rOEoeRLY7uQC6jbvjKxz6/B8e6NKw6RxdmwYp4pbF2dkbf45lR?=
 =?us-ascii?Q?mKtdC9iMaqaUuwyzapzOngeKAzs03UYwFpZmXEmi1Yh1Fm1Ao6lILmZlRyjn?=
 =?us-ascii?Q?vFjD5d6mvLZ/8meAnzY9zhyCV9ILcIs=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <28CC8E51249AF34DBAD6969EB4092E01@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fbe8d3-29a0-4bcc-578d-08d76fa45755
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2019 23:33:12.8394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uAdsrl/KdY/T8DJvaIOEm0R1NTDIZH0bwLSIhk0rjgYgptn4Z86jjRWdOQmhKmTN7zj8ZsfqBya5C6FyV2Q1jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4560
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:07:41 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FBl0ahA/lHt/l6dGeFj/g48nFtoV6gp8Sco+W2w+isY=;
 b=Eoo5zbljdgpcZOnTlQR6HrIta/bj+Yf1WANOVR3f61zpla4nTUNx01fwoRHQ97yeU4Cu7+ZhM01MaNEzA/7IzTmJgE94G1m7YUdR2TsjIZwGZ/NNNquudtrI2tbQyK68JXbYVaW84olzhC8fsJOlS3/DcLsOxZLhRlvvKZFMjRU=
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

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTI6NTc6MjdQTSAtMDgwMCwgTmlyYW5qYW5hIFZpc2h3
YW5hdGhhcHVyYSB3cm90ZToKCj4gK3N0YXRpYyBpbmxpbmUgYm9vbAo+ICtpOTE1X3JhbmdlX2Rv
bmUoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCj4gK3sKPiArCWJvb2wgcmV0ID0gaG1tX3Jhbmdl
X3ZhbGlkKHJhbmdlKTsKPiArCj4gKwlobW1fcmFuZ2VfdW5yZWdpc3RlcihyYW5nZSk7Cj4gKwly
ZXR1cm4gcmV0Owo+ICt9CgpUaGlzIG5lZWRzIHRvIGJlIHVwZGF0ZWQgdG8gZm9sbG93IHRoZSBu
ZXcgQVBJLCBidXQgdGhpcyBwYXR0ZXJuIGlzCmdlbmVyYWxseSB3cm9uZywgZmFpbHVyZSBpZiBo
bW1fcmFuZ2VfdmFsaWQgc2hvdWxkIHJldHJ5IHRoZQpyYW5nZV9mYXVsdCBhbmQgc28gZm9ydGgu
IFNlZSB0aGUgaG1tLnJzdC4KCj4gK3N0YXRpYyBpbnQKPiAraTkxNV9yYW5nZV9mYXVsdChzdHJ1
Y3QgaTkxNV9zdm0gKnN2bSwgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCj4gK3sKPiArCWxvbmcg
cmV0Owo+ICsKPiArCXJhbmdlLT5kZWZhdWx0X2ZsYWdzID0gMDsKPiArCXJhbmdlLT5wZm5fZmxh
Z3NfbWFzayA9IC0xVUw7Cj4gKwo+ICsJcmV0ID0gaG1tX3JhbmdlX3JlZ2lzdGVyKHJhbmdlLCAm
c3ZtLT5taXJyb3IpOwo+ICsJaWYgKHJldCkgewo+ICsJCXVwX3JlYWQoJnN2bS0+bW0tPm1tYXBf
c2VtKTsKPiArCQlyZXR1cm4gKGludClyZXQ7Cj4gKwl9CgoKVXNpbmcgYSB0ZW1wb3JhcnkgcmFu
Z2UgaXMgdGhlIHBhdHRlcm4gZnJvbSBub3V2ZWF1LCBpcyBpdCByZWFsbHkKbmVjZXNzYXJ5IGlu
IHRoaXMgZHJpdmVyPwoKPiArc3RhdGljIHUzMiBpOTE1X3N2bV9idWlsZF9zZyhzdHJ1Y3QgaTkx
NV9hZGRyZXNzX3NwYWNlICp2bSwKPiArCQkJICAgICBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwK
PiArCQkJICAgICBzdHJ1Y3Qgc2dfdGFibGUgKnN0KQo+ICt7Cj4gKwlzdHJ1Y3Qgc2NhdHRlcmxp
c3QgKnNnOwo+ICsJdTMyIHNnX3BhZ2Vfc2l6ZXMgPSAwOwo+ICsJdTY0IGksIG5wYWdlczsKPiAr
Cj4gKwlzZyA9IE5VTEw7Cj4gKwlzdC0+bmVudHMgPSAwOwo+ICsJbnBhZ2VzID0gKHJhbmdlLT5l
bmQgLSByYW5nZS0+c3RhcnQpIC8gUEFHRV9TSVpFOwo+ICsKPiArCS8qCj4gKwkgKiBObyBuZWVk
ZCB0byBkbWEgbWFwIHRoZSBob3N0IHBhZ2VzIGFuZCBsYXRlciB1bm1hcCBpdCwgYXMKPiArCSAq
IEdQVSBpcyBub3QgYWxsb3dlZCB0byBhY2Nlc3MgaXQgd2l0aCBTVk0uIEhlbmNlLCBubyBuZWVk
Cj4gKwkgKiBvZiBhbnkgaW50ZXJtZWRpYXRlIGRhdGEgc3RydWN1dHJlIHRvIGhvbGQgdGhlIG1h
cHBpbmdzLgo+ICsJICovCj4gKwlmb3IgKGkgPSAwOyBpIDwgbnBhZ2VzOyBpKyspIHsKPiArCQl1
NjQgYWRkciA9IHJhbmdlLT5wZm5zW2ldICYgfigoMVVMIDw8IHJhbmdlLT5wZm5fc2hpZnQpIC0g
MSk7Cj4gKwo+ICsJCWlmIChzZyAmJiAoYWRkciA9PSAoc2dfZG1hX2FkZHJlc3Moc2cpICsgc2ct
Pmxlbmd0aCkpKSB7Cj4gKwkJCXNnLT5sZW5ndGggKz0gUEFHRV9TSVpFOwo+ICsJCQlzZ19kbWFf
bGVuKHNnKSArPSBQQUdFX1NJWkU7Cj4gKwkJCWNvbnRpbnVlOwo+ICsJCX0KPiArCj4gKwkJaWYg
KHNnKQo+ICsJCQlzZ19wYWdlX3NpemVzIHw9IHNnLT5sZW5ndGg7Cj4gKwo+ICsJCXNnID0gIHNn
ID8gX19zZ19uZXh0KHNnKSA6IHN0LT5zZ2w7Cj4gKwkJc2dfZG1hX2FkZHJlc3Moc2cpID0gYWRk
cjsKPiArCQlzZ19kbWFfbGVuKHNnKSA9IFBBR0VfU0laRTsKPiArCQlzZy0+bGVuZ3RoID0gUEFH
RV9TSVpFOwo+ICsJCXN0LT5uZW50cysrOwoKSXQgaXMgb2RkIHRvIGJ1aWxkIHRoZSByYW5nZSBp
bnRvIGEgc2dsLgoKSU1ITyBpdCBpcyBub3QgYSBnb29kIGlkZWEgdG8gdXNlIHRoZSBzZ19kbWFf
YWRkcmVzcyBsaWtlIHRoaXMsIHRoYXQKc2hvdWxkIG9ubHkgYmUgZmlsbGVkIGluIGJ5IGEgZG1h
IG1hcC4gV2hlcmUgZG9lcyBpdCBlbmQgdXAgYmVpbmcKdXNlZD8KCj4gKwlyYW5nZS5wZm5fc2hp
ZnQgPSBQQUdFX1NISUZUOwo+ICsJcmFuZ2Uuc3RhcnQgPSBhcmdzLT5zdGFydDsKPiArCXJhbmdl
LmZsYWdzID0gaTkxNV9yYW5nZV9mbGFnczsKPiArCXJhbmdlLnZhbHVlcyA9IGk5MTVfcmFuZ2Vf
dmFsdWVzOwo+ICsJcmFuZ2UuZW5kID0gcmFuZ2Uuc3RhcnQgKyBhcmdzLT5sZW5ndGg7Cj4gKwlm
b3IgKGkgPSAwOyBpIDwgbnBhZ2VzOyArK2kpIHsKPiArCQlyYW5nZS5wZm5zW2ldID0gcmFuZ2Uu
ZmxhZ3NbSE1NX1BGTl9WQUxJRF07Cj4gKwkJaWYgKCEoYXJncy0+ZmxhZ3MgJiBJOTE1X0JJTkRf
UkVBRE9OTFkpKQo+ICsJCQlyYW5nZS5wZm5zW2ldIHw9IHJhbmdlLmZsYWdzW0hNTV9QRk5fV1JJ
VEVdOwo+ICsJfQo+ICsKPiArCWRvd25fcmVhZCgmc3ZtLT5tbS0+bW1hcF9zZW0pOwo+ICsJdm1h
ID0gZmluZF92bWEoc3ZtLT5tbSwgcmFuZ2Uuc3RhcnQpOwoKV2h5IGlzIGZpbmRfdm1hIG5lZWRl
ZD8KCj4gKwlpZiAodW5saWtlbHkoIXZtYSB8fCB2bWEtPnZtX2VuZCA8IHJhbmdlLmVuZCkpIHsK
PiArCQlyZXQgPSAtRUZBVUxUOwo+ICsJCWdvdG8gdm1hX2RvbmU7Cj4gKwl9Cj4gK2FnYWluOgo+
ICsJcmV0ID0gaTkxNV9yYW5nZV9mYXVsdChzdm0sICZyYW5nZSk7Cj4gKwlpZiAodW5saWtlbHko
cmV0KSkKPiArCQlnb3RvIHZtYV9kb25lOwo+ICsKPiArCXNnX3BhZ2Vfc2l6ZXMgPSBpOTE1X3N2
bV9idWlsZF9zZyh2bSwgJnJhbmdlLCAmc3QpOwo+CgpLZWVwIGluIG1pbmQgd2hhdCBjYW4gYmUg
ZG9uZSB3aXRoIHRoZSByYW5nZSB2YWx1ZXMgaXMgbGltaXRlZCB1bnRpbAp0aGUgbG9jayBpcyBv
YnRhaW5lZC4gUmVhZGluZyB0aGUgcGZucyBhbmQgZmxhZ3MgaXMgT0sgdGhvdWdoLgoKPiAraW50
IGk5MTVfc3ZtX2JpbmRfbW0oc3RydWN0IGk5MTVfYWRkcmVzc19zcGFjZSAqdm0pCj4gK3sKPiAr
CXN0cnVjdCBpOTE1X3N2bSAqc3ZtOwo+ICsJc3RydWN0IG1tX3N0cnVjdCAqbW07Cj4gKwlpbnQg
cmV0ID0gMDsKPiArCj4gKwltbSA9IGdldF90YXNrX21tKGN1cnJlbnQpOwoKSSBkb24ndCB0aGlu
ayB0aGUgZ2V0X3Rhc2tfbW0oY3VycmVudCkgaXMgbmVlZGVkLCB0aGUgbW1nZXQgaXMgYWxyZWFk
eQpkb25lIGZvciBjdXJyZW50LT5tbSA/CgpKYXNvbgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=

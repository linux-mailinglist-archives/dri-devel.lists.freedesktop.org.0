Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC86A5F389
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41A96E2A0;
	Thu,  4 Jul 2019 07:25:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80052.outbound.protection.outlook.com [40.107.8.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C7706E149
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2019 14:10:08 +0000 (UTC)
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB6285.eurprd05.prod.outlook.com (20.179.24.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 14:10:05 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::f5d8:df9:731:682e%5]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 14:10:05 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Thread-Topic: [PATCH 1/1] drm/amdgpu: adopt to hmm_range_register API change
Thread-Index: AQHVMUJXWs8sf5cAOUS0d/4NvIH/Saa473yA
Date: Wed, 3 Jul 2019 14:10:04 +0000
Message-ID: <20190703141001.GH18688@mellanox.com>
References: <20190703015442.11974-1-Felix.Kuehling@amd.com>
In-Reply-To: <20190703015442.11974-1-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR02CA0112.namprd02.prod.outlook.com
 (2603:10b6:208:35::17) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6ffa8a7-727f-4983-2304-08d6ffc02576
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB6285; 
x-ms-traffictypediagnostic: VI1PR05MB6285:
x-microsoft-antispam-prvs: <VI1PR05MB6285C30CC9BD99FEDCA47DA6CFFB0@VI1PR05MB6285.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(199004)(189003)(3846002)(6116002)(99286004)(7736002)(25786009)(66556008)(52116002)(81156014)(81166006)(305945005)(64756008)(4326008)(66476007)(66446008)(8936002)(66946007)(478600001)(6916009)(71190400001)(1076003)(8676002)(73956011)(5660300002)(71200400001)(6506007)(6436002)(446003)(53936002)(2616005)(6486002)(36756003)(2906002)(256004)(6246003)(102836004)(14444005)(76176011)(386003)(86362001)(26005)(33656002)(186003)(14454004)(66066001)(54906003)(316002)(6512007)(229853002)(11346002)(476003)(486006)(68736007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB6285;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uB6dTC+NZ0Di8A5w1s0kCQKz7u2ggZEIgDQWpW0L4WsGLJ1uF/R9PlQFfFp4OoFpAFfWKbmgswgteQN0A4WaVqGQRxkkCd4oLx1abHjYVLovpP6xcbmPQ2tjbRh5vBJmsmrxof3OiAxeZb3WZrhSHAXbOsCoKvabSOM2Z3ZSS4smmkL/wQPZ07pJruuPUsE82PMUhxepsmIVv36gVCTfwwTl8lSfzT9KNRWn/Y9BRiFJj6YfyK14Ghw/ixgiRychZLaziOejH6OIKYAGfSYT433x/jiBaltK76lSzWVSDjnmXSPOPrlnUFtpyk5FjboUO0q0iPiwWF7FJHDysf5I+iORdrqZ8t/AW/t9Ua0/bVsJBTyvFnkp0uciSX2xmtXAeFqAMB6uTKrO/F7QAu7dxkqhLTtd3c2hCK6JXilwUDs=
Content-ID: <17622BB336903649B6558468F65A4E0E@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ffa8a7-727f-4983-2304-08d6ffc02576
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 14:10:04.9785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB6285
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xyphrNP6oUvQK08UnO2NmYiuMrL0TD3/l2pKs8GPgc=;
 b=KIinKYDBeRYg866u2b0gz16nlg6nMRMmFBQ+KAUUQ55aFT6GojM9e215r2Dp1C+/kBseDNlyrbmmt0ECxwbk1XQXI9bDy5WJa88lGiO+BMsqYfZ6CZwVgRC7ZEtegWS5Lw39d/IMM49DAZwtXoxNMjANkwQcSdUBcH3IPvXJypg=
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "Yang,
 Philip" <Philip.Yang@amd.com>, Dave Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDE6NTU6MDhBTSArMDAwMCwgS3VlaGxpbmcsIEZlbGl4
IHdyb3RlOgo+IEZyb206IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPgo+IAo+IElu
IG9yZGVyIHRvIHBhc3MgbWlycm9yIGluc3RlYWQgb2YgbW0gdG8gaG1tX3JhbmdlX3JlZ2lzdGVy
LCB3ZSBuZWVkCj4gcGFzcyBibyBpbnN0ZWFkIG9mIHR0bSB0byBhbWRncHVfdHRtX3R0X2dldF91
c2VyX3BhZ2VzIGJlY2F1c2UgbWlycm9yCj4gaXMgcGFydCBvZiBhbWRncHVfbW4gc3RydWN0dXJl
LCB3aGljaCBpcyBhY2Nlc3NpYmxlIGZyb20gYm8uCj4gCj4gU2lnbmVkLW9mZi1ieTogUGhpbGlw
IFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5n
IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5n
IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgo+IENDOiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2Fu
Yi5hdXVnLm9yZy5hdT4KPiBDQzogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+
IENDOiBEYXZlIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDQzogQWxleCBEZXVjaGVyIDxh
bGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYyB8ICA1ICsrLS0tCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyAgICAgICAgICB8ICAzICstLQo+ICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYyAgICAgICAgICAgfCAgOCArKysrKysrKwo+
ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uaCAgICAgICAgICAgfCAgNSAr
KysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgICAgICAgICAg
fCAxMiArKysrKysrKysrLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5oICAgICAgICAgIHwgIDUgKysrLS0KPiAgOCBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25z
KCspLCAxMSBkZWxldGlvbnMoLSkKClRoaXMgaXMgdG9vIGJpZyB0byB1c2UgYXMgYSBjb25mbGlj
dCByZXNvbHV0aW9uLCB3aGF0IHlvdSBjb3VsZCBkbyBpcwphcHBseSB0aGUgbWFqb3JpdHkgb2Yg
dGhlIHBhdGNoIG9uIHRvcCBvZiB5b3VyIHRyZWUgYXMtaXMgKGllIGtlZXAKdXNpbmcgdGhlIG9s
ZCBobW1fcmFuZ2VfcmVnaXN0ZXIpLCB0aGVuIHRoZSBjb25mbGljdCByZXNvbHV0aW9uIGZvcgp0
aGUgdXBkYXRlZCBBTUQgR1BVIHRyZWUgY2FuIGJlIGEgc2ltcGxlIG9uZSBsaW5lIGNoYW5nZToK
CiAtCWhtbV9yYW5nZV9yZWdpc3RlcihyYW5nZSwgbW0sIHN0YXJ0LAogKwlobW1fcmFuZ2VfcmVn
aXN0ZXIocmFuZ2UsIG1pcnJvciwgc3RhcnQsCiAgCQkJICAgc3RhcnQgKyB0dG0tPm51bV9wYWdl
cyAqIFBBR0VfU0laRSwgUEFHRV9TSElGVCk7CgpXaGljaCBpcyB0cml2aWFsIGZvciBldmVyb25l
IHRvIGRlYWwgd2l0aCwgYW5kIHNvbHZlcyB0aGUgcHJvYmxlbS4KClRoaXMgaXMgcHJvYmFibHkg
YSBtdWNoIGJldHRlciBvcHRpb24gdGhhbiByZWJhc2luZyB0aGUgQU1EIGdwdSB0cmVlLgoKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYwo+IGluZGV4IDYyM2Y1NmExNDg1Zi4u
ODBlNDA4OThhNTA3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9tbi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMK
PiBAQCAtMzk4LDYgKzM5OCwxNCBAQCBzdHJ1Y3QgYW1kZ3B1X21uICphbWRncHVfbW5fZ2V0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAJcmV0dXJuIEVSUl9QVFIocik7Cj4gIH0KPiAg
Cj4gK3N0cnVjdCBobW1fbWlycm9yICphbWRncHVfbW5fZ2V0X21pcnJvcihzdHJ1Y3QgYW1kZ3B1
X21uICphbW4pCj4gK3sKPiArCWlmICghYW1uKQo+ICsJCXJldHVybiBOVUxMOwo+ICsKPiArCXJl
dHVybiAmYW1uLT5taXJyb3I7Cj4gK30KCkkgdGhpbmsgaXQgaXMgYmV0dGVyIG1ha2UgdGhlIHN0
cnVjdCBhbWRncHVfbW4gcHVibGljIHJhdGhlciB0aGFuIGFkZAp0aGlzIHdyYXBwZXIuCgpKYXNv
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

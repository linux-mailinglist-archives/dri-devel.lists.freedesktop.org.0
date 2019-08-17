Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCFC91163
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:25:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED86E6EA83;
	Sat, 17 Aug 2019 15:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10051.outbound.protection.outlook.com [40.107.1.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E976E3DF;
 Sat, 17 Aug 2019 12:50:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dFNbMY32Ycu62r1bCxURHDABZxgMZvTWrapmSZEX2ulfx2zSvFHUSDI4NqZqt+rkYMHj8hi5zvyHVLcBGFZINrI6YE9ynBkW/69cJQuCHfmalz0jQb4rVDbKZgjBtJVUhfrCSt9uDTuytkRWzypw0tRMSRbF/DN4lXFA6hTaMMwyNf8bJQcXQGriBtVeMk3kDVH/0hwz4ggHNADEz/FEYB7o6dgdqaR3liNpc3RK2RPF2iqPqAjtUBYTbwwyXxxWXGY1Q+l3LJcFfOc7rDYZFAelbWJvvVltm/3Sip/noE5x+jiQ1MHJ48nwJgrR+Q0yEfULNN2am2QjcznGL3riOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBnKmRLyCwxqWMxqtYtaxBjRMqaAzEVPpluFObk7JBI=;
 b=cPRdZSFtreNvKSFuRlf8wY/TTv3k50Hc93iLoqOCeg5OeBK5ubcqrLjeASDjLXUQ2e1HVArQwfa6aNCAHpKaLM0BVECH5qdcPfnVSIO88Beou1Tt71249yNmIu2EMY7W/flPXzlpsHlXfLpEKfiTS3AQbs5b+oA87IAQ0uc37cWF/+iwNuDkCqepAqHTA8j/k2UB6uPKJIm7hlzPtWr06xF9ybht9nfFaF3/NkPMnOZdN8xp55FyRBhV5cCDvgcUeopQ9dlxdgLZkib1+8eWW7Rnvzb27lZnXybmrpuaa6uSR5N8FOhtAk0jMwDf83P45RpcMCUbtjUYQxC/AZI4Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
 VI1PR05MB5311.eurprd05.prod.outlook.com (20.178.8.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Sat, 17 Aug 2019 12:50:06 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1d6:9c67:ea2d:38a7%6]) with mapi id 15.20.2178.016; Sat, 17 Aug 2019
 12:50:06 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/10] mm: turn migrate_vma upside down
Thread-Topic: [PATCH 01/10] mm: turn migrate_vma upside down
Thread-Index: AQHVUnY4TvdvZdqG70SoVm3XhXkEbab+BjuAgAEzdgCAABX0AA==
Date: Sat, 17 Aug 2019 12:50:06 +0000
Message-ID: <20190817125002.GB10068@mellanox.com>
References: <20190814075928.23766-1-hch@lst.de>
 <20190814075928.23766-2-hch@lst.de> <20190816171101.GK5412@mellanox.com>
 <20190817113128.GA23295@lst.de>
In-Reply-To: <20190817113128.GA23295@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTXPR0101CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::46) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:4d::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6dd676e-d353-45d8-2e8e-08d723116df6
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR05MB5311; 
x-ms-traffictypediagnostic: VI1PR05MB5311:
x-microsoft-antispam-prvs: <VI1PR05MB5311621D322316A86401EC2ECFAE0@VI1PR05MB5311.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0132C558ED
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(189003)(199004)(6246003)(76176011)(386003)(478600001)(25786009)(446003)(186003)(86362001)(99286004)(102836004)(6506007)(316002)(6512007)(1076003)(66066001)(14454004)(26005)(52116002)(486006)(4744005)(5660300002)(11346002)(476003)(2616005)(7416002)(256004)(305945005)(71200400001)(71190400001)(33656002)(7736002)(6116002)(81166006)(8936002)(36756003)(81156014)(6486002)(8676002)(229853002)(53936002)(66476007)(66556008)(4326008)(64756008)(2906002)(3846002)(66446008)(6916009)(66946007)(6436002)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB5311;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Vlg8j145DMCic0yKX8M55cA/znV95y7LwbgWTEb5V0oTNzuOES/RUEw7fJF0WGnLUVEIqwDfvihM07pkp5D8C8wv+fDuMbOIAY5Tr/WC4oLLgCPTRMhM6FwBFpEQKcXiFmFNvvLW0lujg0LxH0NahHY7lCRucgP/xZbi5asYTku5DxdDcC7xhRDbIm5E70dLwMHslGv2uFCatqbtiOfixIelAfH2M8TjHbqZecb6oFFuvwxXUJKsrpsHOserO/k3uXQ+2g9n48qS4EVHfiPA1k96zIv2RFAMyNUTpAphFVSQCuLoSR5M0JZpmJINt84y2MORaMNhJwUHtk288UHDafyP7KXTazzqSMKsk+on6hfTIcH2398HOD23XV89QnKtKFbrHmWnhtge7ijlxSP26PUFTkOLssKRTbmG9BG3GWg=
x-ms-exchange-transport-forked: True
Content-ID: <1695A1151C0F3641B6BBDBD97CAD2365@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6dd676e-d353-45d8-2e8e-08d723116df6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2019 12:50:06.3920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EKbtjcdg48Acrsg7vuLj3RsaBb93XGMzGcoKoIlnd/brgbVOLdhA7UfwMUk7gN0gLJX7vy6ZDXTc7Kal2bGWHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB5311
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Mellanox.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBnKmRLyCwxqWMxqtYtaxBjRMqaAzEVPpluFObk7JBI=;
 b=E5h62KTphx3fmnZnqZZPNrG2W+s15qxVT8fHXjtukqhwrJif3z07tmSm1iwfrTDQUCS4fEogir7raCmv9s/R7YV1jBYkNYeh0dHxP2ttuN+Wdd+lP4eU3K2b2d3t1wv5hWtNV6d2AOEU7Fp8sPn+pgjUvvz0TswCpZ0AfPSWkPg=
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
 Bharata B Rao <bharata@linux.ibm.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 =?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBBdWcgMTcsIDIwMTkgYXQgMDE6MzE6MjhQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDU6MTE6MDdQTSArMDAwMCwgSmFz
b24gR3VudGhvcnBlIHdyb3RlOgo+ID4gLQlpZiAoYXJncy0+Y3BhZ2VzKQo+ID4gLQkJbWlncmF0
ZV92bWFfcHJlcGFyZShhcmdzKTsKPiA+IC0JaWYgKGFyZ3MtPmNwYWdlcykKPiA+IC0JCW1pZ3Jh
dGVfdm1hX3VubWFwKGFyZ3MpOwo+ID4gKwlpZiAoIWFyZ3MtPmNwYWdlcykKPiA+ICsJCXJldHVy
biAwOwo+ID4gKwo+ID4gKwltaWdyYXRlX3ZtYV9wcmVwYXJlKGFyZ3MpOwo+ID4gKwltaWdyYXRl
X3ZtYV91bm1hcChhcmdzKTsKPiAKPiBJIGRvbid0IHRoaW5rIHRoaXMgaXMgb2suICBCb3RoIG1p
Z3JhdGVfdm1hX3ByZXBhcmUgYW5kIG1pZ3JhdGVfdm1hX3VubWFwCj4gY2FuIHJlZHVjZSBhcmdz
LT5jcGFnZXMsIGluY2x1ZGluZyBwb3NzaWJseSB0byAwLgoKT2gsIHllcywgdGhhdCB3YXMgZmFy
IHRvbyBoYXN0eSBvbiBteSBwYXJ0LCBJIGhhZCBhc3N1bWVkIGNvbGxlY3Qgc2V0CnRoZSBjcGFn
ZXMuIFRoYW5rIHlvdSBmb3IgY2hlY2tpbmcKCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

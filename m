Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ACF178BDE
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 08:48:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BABC86EAE2;
	Wed,  4 Mar 2020 07:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1a::60b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188836E879;
 Tue,  3 Mar 2020 12:42:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fohMI+70btdxp0CjnxWj0kHmrp31SvuSSBTqs1oejVLK53tGGzIc3RmVStQBOEJyJ+GplpcA6hqmnJ/1XEMfcSMBgXW+Sihk/ExbjequXD9w/05tX1RHqMXUfJJA1hma9dcYr/pFNLaW6FivTRBAuKQ78dYeP9+gTv7kCvyZxrD5ic92rvO1n6J+Os3BsVXS+RRZVUcm6fSpejAzWvKH33P3I6lSwytqKfBubklV/G8MK07gkfZcRgYIoHKy8dIWKLQfsV87TRRpvw4ayGlj2acmhLj3OP4tTYhy/KM2h07HxIIgSqn0+zVFhvatlaPHupROBIjiEYljOD4LIwIlYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZQ/KXYyEtu5JOGr9NpXqqDzEzNAAM2mdXtXBXwTl1o=;
 b=XkQlAjMC42qTkTPBrUjYU0kTrZS9tXJEo1sP3gxNkACuEGZYHNnJLx6w2aZqeWlSqHpLlv3D9JcA+UewwRulV5749+MLe2OIzktGBM35oY9Hmzg7ZmubuKdyo/8bhLDr0z/i1ZtqBF+ij11jB+ku2onNjPTnTiMjcmMoBIam1wWE8NsklsxqNBUmzAAr4Eu8aVEDTP4WmST+gjT9WIIKno4PHoZSMZ7L8YSf8R082Lom69CHs7y/zAr5xCm000XdXSlXud/VaAEEdyl3YwpGVsV+ugByHbA9HvtVOge8IvfroeMfz6Ra8nzW5FbytFmKC1202FLlUZbTsMhs/bQO9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZQ/KXYyEtu5JOGr9NpXqqDzEzNAAM2mdXtXBXwTl1o=;
 b=AkZ255c1iI6qTJYCYDClWZHAai7U3Fa755Z1xUl+E6tnk/ruSESRC9Qr05YTlYXrAfsjnre0G/LTkUMMPcyluNTl9JUC2UEEHQ+sgQEEqmZEi0AzAT3bIj1xf/pOc79P9l3yFzisxTUoTkRUV0+B1pZiajmRzFtngmGgiuxXIs0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=jgg@mellanox.com; 
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (52.133.14.15) by
 VI1PR05MB4304.eurprd05.prod.outlook.com (52.134.31.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Tue, 3 Mar 2020 12:42:33 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d]) by VI1PR05MB4141.eurprd05.prod.outlook.com
 ([fe80::1c00:7925:d5c6:d60d%7]) with mapi id 15.20.2772.019; Tue, 3 Mar 2020
 12:42:33 +0000
Date: Tue, 3 Mar 2020 08:42:29 -0400
From: Jason Gunthorpe <jgg@mellanox.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH v2] nouveau/hmm: map pages after migration
Message-ID: <20200303124229.GH26318@mellanox.com>
References: <20200303010023.2983-1-rcampbell@nvidia.com>
Content-Disposition: inline
In-Reply-To: <20200303010023.2983-1-rcampbell@nvidia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: MN2PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:208:23b::15) To VI1PR05MB4141.eurprd05.prod.outlook.com
 (2603:10a6:803:44::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.68.57.212) by
 MN2PR11CA0010.namprd11.prod.outlook.com (2603:10b6:208:23b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15 via Frontend
 Transport; Tue, 3 Mar 2020 12:42:32 +0000
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)	(envelope-from
 <jgg@mellanox.com>)	id 1j96sX-00052m-Fn; Tue, 03 Mar 2020 08:42:29 -0400
X-Originating-IP: [142.68.57.212]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 932f4548-d333-4524-d9c2-08d7bf7057fc
X-MS-TrafficTypeDiagnostic: VI1PR05MB4304:
X-Microsoft-Antispam-PRVS: <VI1PR05MB4304D9D99272469C88E0B9D2CFE40@VI1PR05MB4304.eurprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 03319F6FEF
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(189003)(199004)(2906002)(26005)(7416002)(498600001)(9746002)(9786002)(6916009)(36756003)(8676002)(81166006)(2616005)(81156014)(8936002)(52116002)(54906003)(66476007)(66556008)(33656002)(66946007)(5660300002)(186003)(4326008)(1076003)(86362001)(66574012)(24400500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4304;
 H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sqUfKc9/lGC/B3dtqv2ERaiDJD/SIYB/tAv0oF3CVMnVEE+Kyq99++m/M5Gs2szBIvQr7vMVnDJFXhVPoM3ENwnHjdWn5I7vHvmmX5c126BpBS3aV4AmQWUcqKMCjj71Y4LeBoa4Sfw9MdBWw9UNznWdrVYeEk3DjqtvG+iVG/WfObc/lOgpn+Bd0k3yWoCHYXixQxhITTMSrQwX/l0s/FcFuiYN8Ufr35Jni08KgjYWwju1B6mzs8W25q7Wpe2oNmIlC0B41DG3Y0vSdxrhP06qVqVW0nuGRiVBkWANX07SshusIw4jBYqG1tPu0ng7H7cGGKVlZXiwFYMNw6Vcz78Kv+2eQ6TslgjoR3DiZNkZKWyzKlG0xfNbrJIqgRrTufd3ZS40FJFxmSXhBobJJ/6sNMkJJpAegLV7uQ9DNNZx0phgfBsaJAGotu+CJrIDoORhuv2tD2JH+xSgAF1Jo4eJueR75YccmycaM5/F5oJ1W0Ap+nDqVfVg1f1azdt8
X-MS-Exchange-AntiSpam-MessageData: BhMVWap8pTjYC7/WBNhXHjIZ7qtbW7ov+QPCU+iY0TbMWIf83UO8NQtWvndTX1w5rqKmrbVbHW14N6pTdLA+JaVWTcOFwSYPStd+1ogHkIXovkpTfT7oeynKtoieOrYB0RYN+lJMZnRS1XdRFhWZTg==
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 932f4548-d333-4524-d9c2-08d7bf7057fc
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2020 12:42:33.1434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cAL3WKQnCqcEhA6Hd332a2QVZzi5Aq6WkA9z4wJVHtuOJKxrduvyeCy/MPssTwko8UZaZMyRnwQRkRGCjfc6xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4304
X-Mailman-Approved-At: Wed, 04 Mar 2020 07:47:28 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXIgMDIsIDIwMjAgYXQgMDU6MDA6MjNQTSAtMDgwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gV2hlbiBtZW1vcnkgaXMgbWlncmF0ZWQgdG8gdGhlIEdQVSwgaXQgaXMgbGlrZWx5
IHRvIGJlIGFjY2Vzc2VkIGJ5IEdQVQo+IGNvZGUgc29vbiBhZnRlcndhcmRzLiBJbnN0ZWFkIG9m
IHdhaXRpbmcgZm9yIGEgR1BVIGZhdWx0LCBtYXAgdGhlCj4gbWlncmF0ZWQgbWVtb3J5IGludG8g
dGhlIEdQVSBwYWdlIHRhYmxlcyB3aXRoIHRoZSBzYW1lIGFjY2VzcyBwZXJtaXNzaW9ucwo+IGFz
IHRoZSBzb3VyY2UgQ1BVIHBhZ2UgdGFibGUgZW50cmllcy4gVGhpcyBwcmVzZXJ2ZXMgY29weSBv
biB3cml0ZQo+IHNlbWFudGljcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSYWxwaCBDYW1wYmVsbCA8
cmNhbXBiZWxsQG52aWRpYS5jb20+Cj4gQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRl
Pgo+IENjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gQ2M6ICJKw6lyw7Rt
ZSBHbGlzc2UiIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4gQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NA
cmVkaGF0LmNvbT4KPiAtLS0KPiAKPiBPcmlnaW5hbGx5IHRoaXMgcGF0Y2ggd2FzIHRhcmdldGVk
IGZvciBKYXNvbidzIHJkbWEgdHJlZSBzaW5jZSBvdGhlciBITU0KPiByZWxhdGVkIGNoYW5nZXMg
d2VyZSBxdWV1ZWQgdGhlcmUuIE5vdyB0aGF0IHRob3NlIGhhdmUgYmVlbiBtZXJnZWQsIHRoaXMK
PiBwYXRjaCBqdXN0IGNvbnRhaW5zIGNoYW5nZXMgdG8gbm91dmVhdSBzbyBpdCBjb3VsZCBnbyB0
aHJvdWdoIGFueSB0cmVlLgo+IEkgZ3Vlc3MgQmVuIFNrZWdncycgdHJlZSB3b3VsZCBiZSBhcHBy
b3ByaWF0ZS4KClllcAoKPiArc3RhdGljIGlubGluZSBzdHJ1Y3Qgbm91dmVhdV9wZm5tYXBfYXJn
cyAqCj4gK25vdXZlYXVfcGZuc190b19hcmdzKHZvaWQgKnBmbnMpCgpkb24ndCB1c2Ugc3RhdGlj
IGlubGluZSBpbnNpZGUgQyBmaWxlcwoKPiArewo+ICsJc3RydWN0IG52aWZfdm1tX3Bmbm1hcF92
MCAqcCA9Cj4gKwkJY29udGFpbmVyX29mKHBmbnMsIHN0cnVjdCBudmlmX3ZtbV9wZm5tYXBfdjAs
IHBoeXMpOwo+ICsKPiArCXJldHVybiBjb250YWluZXJfb2YocCwgc3RydWN0IG5vdXZlYXVfcGZu
bWFwX2FyZ3MsIHApOwoKQW5kIHRoaXMgc2hvdWxkIGp1c3QgYmUgCgogICByZXR1cm4gY29udGFp
bmVyX29mKHBmbnMsIHN0cnVjdCBub3V2ZWF1X3Bmbm1hcF9hcmdzLCBwLnBoeXMpOwoKPiArc3Rh
dGljIHN0cnVjdCBub3V2ZWF1X3N2bW0gKgo+ICtub3V2ZWF1X2ZpbmRfc3ZtbShzdHJ1Y3Qgbm91
dmVhdV9zdm0gKnN2bSwgc3RydWN0IG1tX3N0cnVjdCAqbW0pCj4gK3sKPiArCXN0cnVjdCBub3V2
ZWF1X2l2bW0gKml2bW07Cj4gKwo+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeShpdm1tLCAmc3ZtLT5p
bnN0LCBoZWFkKSB7Cj4gKwkJaWYgKGl2bW0tPnN2bW0tPm5vdGlmaWVyLm1tID09IG1tKQo+ICsJ
CQlyZXR1cm4gaXZtbS0+c3ZtbTsKPiArCX0KPiArCXJldHVybiBOVUxMOwo+ICt9CgpJcyB0aGlz
IHJlLWltcGxlbWVudGluZyBtbXVfbm90aWZpZXJfZ2V0KCkgPwoKSmFzb24KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E59EE9F3DE
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 22:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DEC89C46;
	Tue, 27 Aug 2019 20:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92A1089C2C;
 Tue, 27 Aug 2019 20:16:14 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d658f8f0000>; Tue, 27 Aug 2019 13:16:15 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 27 Aug 2019 13:16:13 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 27 Aug 2019 13:16:13 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 27 Aug
 2019 20:16:13 +0000
Subject: Re: [PATCH 2/2] mm/hmm: hmm_range_fault() infinite loop
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20190823221753.2514-1-rcampbell@nvidia.com>
 <20190823221753.2514-3-rcampbell@nvidia.com>
 <20190827184157.GA24929@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <f5c1f198-4bdd-3c23-428f-764f894b9997@nvidia.com>
Date: Tue, 27 Aug 2019 13:16:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190827184157.GA24929@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1566936975; bh=62vGPIEVS329R8EcQsp55qtpEj1Wy2MdKSgth1zICoc=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=mVWKFws1HRjcwMU4KK1X7p1o8yonqFQ3zcqupn0zPr5oGsS/Nhvvd7U/tPbwZwAKu
 d4ZvKn9dlm8GRZaZo3GoGEUAhJEY4j2rxqDh9fRMAyKnIdpSvp/4gSN18uzPgTC3D+
 LCNkfwT6+mHkxzSajlnGlbb9pZwCxUSUmGk8cyg/TQvNQ3Yc4oI5+EhyMvw18cN9qG
 8gRZsKwWbJWVYUfmGLzf9oSNdx/aOV7wufOur1JtTdi8Ef46rMoQ09VwFP84JVX/x7
 Sv8gB56HOLq0NoOPFdlcxpEMIttHaJTgCBnTpEGfDbQrxsw5uIH+qeHcstowwDqfQR
 ENGgtWLuJWA7A==
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 amd-gfx@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMjcvMTkgMTE6NDEgQU0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBGcmksIEF1
ZyAyMywgMjAxOSBhdCAwMzoxNzo1M1BNIC0wNzAwLCBSYWxwaCBDYW1wYmVsbCB3cm90ZToKPiAK
Pj4gU2lnbmVkLW9mZi1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgo+
PiAgIG1tL2htbS5jIHwgMyArKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
Cj4+Cj4+IGRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCj4+IGluZGV4IDI5MzcxNDg1
ZmU5NC4uNDg4MmI4M2FlY2NiIDEwMDY0NAo+PiArKysgYi9tbS9obW0uYwo+PiBAQCAtMjkyLDYg
KzI5Miw5IEBAIHN0YXRpYyBpbnQgaG1tX3ZtYV93YWxrX2hvbGVfKHVuc2lnbmVkIGxvbmcgYWRk
ciwgdW5zaWduZWQgbG9uZyBlbmQsCj4+ICAgCWhtbV92bWFfd2Fsay0+bGFzdCA9IGFkZHI7Cj4+
ICAgCWkgPSAoYWRkciAtIHJhbmdlLT5zdGFydCkgPj4gUEFHRV9TSElGVDsKPj4gICAKPj4gKwlp
ZiAod3JpdGVfZmF1bHQgJiYgd2Fsay0+dm1hICYmICEod2Fsay0+dm1hLT52bV9mbGFncyAmIFZN
X1dSSVRFKSkKPj4gKwkJcmV0dXJuIC1FUEVSTTsKPiAKPiBDYW4gd2Fsay0+dm1hIGJlIE5VTEwg
aGVyZT8gaG1tX3ZtYV9kb19mYXVsdCgpIHRvdWNoZXMgaXQKPiB1bmNvbmRpdGlvbmFsbHkuCj4g
Cj4gSmFzb24KPiAKd2Fsay0+dm1hIGNhbiBiZSBOVUxMLiBobW1fdm1hX2RvX2ZhdWx0KCkgbm8g
bG9uZ2VyIHRvdWNoZXMgaXQKdW5jb25kaXRpb25hbGx5LCB0aGF0IGlzIHdoYXQgdGhlIHByZWNl
ZGluZyBwYXRjaCBmaXhlcy4KSSBzdXBwb3NlIEkgY291bGQgY2hhbmdlIGhtbV92bWFfd2Fsa19o
b2xlXygpIHRvIGNoZWNrIGZvciBOVUxMCmFuZCBmaWxsIGluIHRoZSBwZm5zW10gYXJyYXksIEkg
anVzdCBjaG9zZSB0byBoYW5kbGUgaXQgaW4KaG1tX3ZtYV9kb19mYXVsdCgpLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

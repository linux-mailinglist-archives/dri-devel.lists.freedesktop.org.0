Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E59B23D9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 18:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0626F411;
	Fri, 13 Sep 2019 16:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE6B6F411
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 16:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 894CE3F4EE;
 Fri, 13 Sep 2019 18:09:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w66xOcqsUdTC; Fri, 13 Sep 2019 18:09:00 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id C1B533F4CE;
 Fri, 13 Sep 2019 18:08:58 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id F2D88360142;
 Fri, 13 Sep 2019 18:08:57 +0200 (CEST)
Subject: Re: [RFC PATCH 3/7] drm/ttm: TTM fault handler helpers
To: Matthew Wilcox <willy@infradead.org>
References: <20190913093213.27254-1-thomas_os@shipmail.org>
 <20190913093213.27254-4-thomas_os@shipmail.org>
 <20190913151803.GO29434@bombadil.infradead.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <6d33a9fd-47bb-a041-cd18-d67605edae54@shipmail.org>
Date: Fri, 13 Sep 2019 18:08:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190913151803.GO29434@bombadil.infradead.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1568390938; bh=41MPZF1NeqOE0U6C6W9oOWADl0xCjXwYhj5nNmjRnd8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XynQCoTbU1vNaNOD1qJfXS4/bvLSiIvoX7kfiON1kgTFMwvHHRqAkyaF2qkA+Bi81
 /UnRhY8//LOcCTpf1fBzpEW2/YiDJRAu5Hy1DlO6y36DGIy+BCamkUQNY2Suy7TwWz
 c8zsZT3WgsPGSCU6llPnwjTx8zGiMdiTvmLTKC3Y=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=XynQCoTb; 
 dkim-atps=neutral
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
Cc: =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 Rik van Riel <riel@surriel.com>, pv-drivers@vmware.com,
 Minchan Kim <minchan@kernel.org>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>, linux-graphics-maintainer@vmware.com,
 Souptick Joarder <jrdr.linux@gmail.com>, Huang Ying <ying.huang@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xMy8xOSA1OjE4IFBNLCBNYXR0aGV3IFdpbGNveCB3cm90ZToKPiBPbiBGcmksIFNlcCAx
MywgMjAxOSBhdCAxMTozMjowOUFNICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3
cm90ZToKPj4gK3ZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHN0cnVjdCB2bV9m
YXVsdCAqdm1mLAo+PiArCQkJCSAgICBwZ3Byb3RfdCBwcm90LAo+PiArCQkJCSAgICBwZ29mZl90
IG51bV9wcmVmYXVsdCkKPj4gK3sKPj4gKwlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSA9IHZt
Zi0+dm1hOwo+PiArCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCBjdm1hID0gKnZtYTsKPj4gKwlzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqKQo+
PiArCSAgICB2bWEtPnZtX3ByaXZhdGVfZGF0YTsKPiBJdCdzIGEgdm9pZCAqLiAgVGhlcmUncyBu
byBuZWVkIHRvIGNhc3QgaXQuCj4KPiAJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibyA9IHZt
YS0+dm1fcHJpdmF0ZV9kYXRhOwo+Cj4gY29udmV5cyBleGFjdGx5IHRoZSBzYW1lIGluZm9ybWF0
aW9uIHRvIGJvdGggdGhlIHJlYWRlciBhbmQgdGhlIGNvbXBpbGVyLAo+IGV4Y2VwdCBpdCdzIGFs
bCBvbiBvbmUgbGluZSBpbnN0ZWFkIG9mIHNwbGl0IG92ZXIgdHdvLgoKSW5kZWVkLgoKSG93ZXZl
ciBzaW5jZSB0aGlzIGlzIG1vc3RseSBhIHJlc3RydWN0dXJpbmcgY29tbWl0IGFuZCB0aGVyZSBh
cmUgYSAKY291cGxlIG9mIHRoZXNlIHByZXNlbnQgaW4gdGhlIGNvZGUgSSdkIGxpa2UgdG8ga2Vl
cCBjbGVhbnVwcyBzZXBhcmF0ZS4KClRoYW5rcywKVGhvbWFzCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

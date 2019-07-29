Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 714C179CBE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 01:23:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D756E2BC;
	Mon, 29 Jul 2019 23:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B906E0BA;
 Mon, 29 Jul 2019 23:23:22 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3f7feb0000>; Mon, 29 Jul 2019 16:23:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 29 Jul 2019 16:23:22 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 29 Jul 2019 16:23:22 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jul
 2019 23:23:18 +0000
Subject: Re: [PATCH 4/9] nouveau: factor out dmem fence completion
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs
 <bskeggs@redhat.com>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-5-hch@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <f2af6247-c935-12de-fb12-e418101efdfa@nvidia.com>
Date: Mon, 29 Jul 2019 16:23:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190729142843.22320-5-hch@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564442603; bh=IyoLCbDcsQakqt7A6+W1y7A2qFkbkRJjy2RWDtkVLUI=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=NnhEWDfT1JRU+yGkNl7isRXL14uONAN+nufQA88N/0WVIGrrXe2VPqIZreLa/iM58
 rrsdH0JGvyxCRjxz6XDeOPcGsuqp6VptCocClcF1kIwsJAO2D/NW+YCRhXkKRipLWH
 botVKAowNZ8G7vOFHGBaKmiBYWS1vuuThPema3w2Ff252O84tPPld7ORsNwKXIEt5A
 gy8P/4HuT/jTrKaPQhTu13ZkYDnUvoPnsagy2yRGHgm6DOUlXGql+9UP9Sm4gEKhVK
 NDxlPJ7YZ/ogVkIam9GCXsqywqwYliQ/7clBqKCCjHiZXNN49ipCt3w4wGcTwD6dAu
 svSbpqgfcVg3A==
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
 dri-devel@lists.freedesktop.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDcvMjkvMTkgNzoyOCBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gRmFjdG9yIG91
dCB0aGUgZW5kIG9mIGZlbmNpbmcgbG9naWMgZnJvbSB0aGUgdHdvIG1pZ3JhdGlvbiByb3V0aW5l
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KClJl
dmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+Cgo+IC0tLQo+
ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMgfCAzMyArKysrKysrKysr
KystLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE4
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2RtZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jCj4g
aW5kZXggZDQ2OWJjMzM0NDM4Li4yMTA1MmE0YWFmNjkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2RtZW0uYwo+IEBAIC0xMzMsNiArMTMzLDE5IEBAIHN0YXRpYyB2b2lkIG5v
dXZlYXVfZG1lbV9wYWdlX2ZyZWUoc3RydWN0IHBhZ2UgKnBhZ2UpCj4gICAJc3Bpbl91bmxvY2so
JmNodW5rLT5sb2NrKTsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgdm9pZCBub3V2ZWF1X2RtZW1fZmVu
Y2VfZG9uZShzdHJ1Y3Qgbm91dmVhdV9mZW5jZSAqKmZlbmNlKQo+ICt7Cj4gKwlpZiAoZmVuY2Up
IHsKPiArCQlub3V2ZWF1X2ZlbmNlX3dhaXQoKmZlbmNlLCB0cnVlLCBmYWxzZSk7Cj4gKwkJbm91
dmVhdV9mZW5jZV91bnJlZihmZW5jZSk7Cj4gKwl9IGVsc2Ugewo+ICsJCS8qCj4gKwkJICogRklY
TUUgd2FpdCBmb3IgY2hhbm5lbCB0byBiZSBJRExFIGJlZm9yZSBjYWxsaW5nIGZpbmFsaXppbmcK
PiArCQkgKiB0aGUgaG1lbSBvYmplY3QuCj4gKwkJICovCj4gKwl9Cj4gK30KPiArCj4gICBzdGF0
aWMgdm9pZAo+ICAgbm91dmVhdV9kbWVtX2ZhdWx0X2FsbG9jX2FuZF9jb3B5KHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLAo+ICAgCQkJCSAgY29uc3QgdW5zaWduZWQgbG9uZyAqc3JjX3BmbnMs
Cj4gQEAgLTIzNiwxNSArMjQ5LDcgQEAgbm91dmVhdV9kbWVtX2ZhdWx0X2ZpbmFsaXplX2FuZF9t
YXAoc3RydWN0IG5vdXZlYXVfZG1lbV9mYXVsdCAqZmF1bHQpCj4gICB7Cj4gICAJc3RydWN0IG5v
dXZlYXVfZHJtICpkcm0gPSBmYXVsdC0+ZHJtOwo+ICAgCj4gLQlpZiAoZmF1bHQtPmZlbmNlKSB7
Cj4gLQkJbm91dmVhdV9mZW5jZV93YWl0KGZhdWx0LT5mZW5jZSwgdHJ1ZSwgZmFsc2UpOwo+IC0J
CW5vdXZlYXVfZmVuY2VfdW5yZWYoJmZhdWx0LT5mZW5jZSk7Cj4gLQl9IGVsc2Ugewo+IC0JCS8q
Cj4gLQkJICogRklYTUUgd2FpdCBmb3IgY2hhbm5lbCB0byBiZSBJRExFIGJlZm9yZSBjYWxsaW5n
IGZpbmFsaXppbmcKPiAtCQkgKiB0aGUgaG1lbSBvYmplY3QgYmVsb3cgKG5vdXZlYXVfbWlncmF0
ZV9obWVtX2ZpbmkoKSkuCj4gLQkJICovCj4gLQl9Cj4gKwlub3V2ZWF1X2RtZW1fZmVuY2VfZG9u
ZSgmZmF1bHQtPmZlbmNlKTsKPiAgIAo+ICAgCXdoaWxlIChmYXVsdC0+bnBhZ2VzLS0pIHsKPiAg
IAkJZG1hX3VubWFwX3BhZ2UoZHJtLT5kZXYtPmRldiwgZmF1bHQtPmRtYVtmYXVsdC0+bnBhZ2Vz
XSwKPiBAQCAtNzQ4LDE1ICs3NTMsNyBAQCBub3V2ZWF1X2RtZW1fbWlncmF0ZV9maW5hbGl6ZV9h
bmRfbWFwKHN0cnVjdCBub3V2ZWF1X21pZ3JhdGUgKm1pZ3JhdGUpCj4gICB7Cj4gICAJc3RydWN0
IG5vdXZlYXVfZHJtICpkcm0gPSBtaWdyYXRlLT5kcm07Cj4gICAKPiAtCWlmIChtaWdyYXRlLT5m
ZW5jZSkgewo+IC0JCW5vdXZlYXVfZmVuY2Vfd2FpdChtaWdyYXRlLT5mZW5jZSwgdHJ1ZSwgZmFs
c2UpOwo+IC0JCW5vdXZlYXVfZmVuY2VfdW5yZWYoJm1pZ3JhdGUtPmZlbmNlKTsKPiAtCX0gZWxz
ZSB7Cj4gLQkJLyoKPiAtCQkgKiBGSVhNRSB3YWl0IGZvciBjaGFubmVsIHRvIGJlIElETEUgYmVm
b3JlIGZpbmFsaXppbmcKPiAtCQkgKiB0aGUgaG1lbSBvYmplY3QgYmVsb3cgKG5vdXZlYXVfbWln
cmF0ZV9obWVtX2ZpbmkoKSkgPwo+IC0JCSAqLwo+IC0JfQo+ICsJbm91dmVhdV9kbWVtX2ZlbmNl
X2RvbmUoJm1pZ3JhdGUtPmZlbmNlKTsKPiAgIAo+ICAgCXdoaWxlIChtaWdyYXRlLT5kbWFfbnIt
LSkgewo+ICAgCQlkbWFfdW5tYXBfcGFnZShkcm0tPmRldi0+ZGV2LCBtaWdyYXRlLT5kbWFbbWln
cmF0ZS0+ZG1hX25yXSwKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2393779CB9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 01:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211EE6E2C2;
	Mon, 29 Jul 2019 23:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14A86E2B8;
 Mon, 29 Jul 2019 23:21:42 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3f7f8e0000>; Mon, 29 Jul 2019 16:21:50 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 29 Jul 2019 16:21:42 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 29 Jul 2019 16:21:42 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 29 Jul
 2019 23:21:40 +0000
Subject: Re: [PATCH 3/9] nouveau: factor out device memory address calculation
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs
 <bskeggs@redhat.com>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-4-hch@lst.de>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <95ddc61c-edb9-b751-4e15-0d3f0aaca2e1@nvidia.com>
Date: Mon, 29 Jul 2019 16:21:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190729142843.22320-4-hch@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564442510; bh=Ck0Fwz/3L8okeuwUnKILoh2bth9zQ838mb2LNvYCu5c=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=POMfKb/YMF0u6+QGiDqjGdH9lbOIf7G6w6JvD3Msf4yBRa7229kVJVax+KSS+cY2C
 d5sL+sjwl/l/cPBDDZ6mr9yOs4LmD+lnKlb2a4UWkgi29cfcPUkE3Hjh6QRDNITc++
 6Hgfj18O7Qm9bo8QE4+aUxtixOr8Re8PDf2XSG89G3LI3hGIm3e4cA3bOEOO23SOw2
 VB6snRW8LBYrVdYdYH+rkI9VIp3FMPJcIbB+0K61vvzQed4J36ReyESE1XXv0qBsOi
 0SY7ti+YSimYNOBZrgriBZ3Nrutk/Qy/u6XFJ8Ss725m+jHO8fOeb8PPE0vKXsCdIv
 y3TxYfGGepEjg==
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
dCB0aGUgcmVwZWF0ZWQgZGV2aWNlIG1lbW9yeSBhZGRyZXNzIGNhbGN1bGF0aW9uIGludG8KPiBh
IGhlbHBlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KClJldmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+Cgo+
IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMgfCA0MiArKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMo
KyksIDI1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2RtZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1l
bS5jCj4gaW5kZXggZTY5NjE1N2Y3NzFlLi5kNDY5YmMzMzQ0MzggMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwo+IEBAIC0xMDIsNiArMTAyLDE0IEBAIHN0cnVjdCBu
b3V2ZWF1X21pZ3JhdGUgewo+ICAgCXVuc2lnbmVkIGxvbmcgZG1hX25yOwo+ICAgfTsKPiAgIAo+
ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBub3V2ZWF1X2RtZW1fcGFnZV9hZGRyKHN0cnVjdCBwYWdl
ICpwYWdlKQo+ICt7Cj4gKwlzdHJ1Y3Qgbm91dmVhdV9kbWVtX2NodW5rICpjaHVuayA9IHBhZ2Ut
PnpvbmVfZGV2aWNlX2RhdGE7Cj4gKwl1bnNpZ25lZCBsb25nIGlkeCA9IHBhZ2VfdG9fcGZuKHBh
Z2UpIC0gY2h1bmstPnBmbl9maXJzdDsKPiArCj4gKwlyZXR1cm4gKGlkeCA8PCBQQUdFX1NISUZU
KSArIGNodW5rLT5iby0+Ym8ub2Zmc2V0Owo+ICt9Cj4gKwo+ICAgc3RhdGljIHZvaWQgbm91dmVh
dV9kbWVtX3BhZ2VfZnJlZShzdHJ1Y3QgcGFnZSAqcGFnZSkKPiAgIHsKPiAgIAlzdHJ1Y3Qgbm91
dmVhdV9kbWVtX2NodW5rICpjaHVuayA9IHBhZ2UtPnpvbmVfZGV2aWNlX2RhdGE7Cj4gQEAgLTE2
OSw5ICsxNzcsNyBAQCBub3V2ZWF1X2RtZW1fZmF1bHRfYWxsb2NfYW5kX2NvcHkoc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEsCj4gICAJLyogQ29weSB0aGluZ3Mgb3ZlciAqLwo+ICAgCWNvcHkg
PSBkcm0tPmRtZW0tPm1pZ3JhdGUuY29weV9mdW5jOwo+ICAgCWZvciAoYWRkciA9IHN0YXJ0LCBp
ID0gMDsgYWRkciA8IGVuZDsgYWRkciArPSBQQUdFX1NJWkUsIGkrKykgewo+IC0JCXN0cnVjdCBu
b3V2ZWF1X2RtZW1fY2h1bmsgKmNodW5rOwo+ICAgCQlzdHJ1Y3QgcGFnZSAqc3BhZ2UsICpkcGFn
ZTsKPiAtCQl1NjQgc3JjX2FkZHIsIGRzdF9hZGRyOwo+ICAgCj4gICAJCWRwYWdlID0gbWlncmF0
ZV9wZm5fdG9fcGFnZShkc3RfcGZuc1tpXSk7Cj4gICAJCWlmICghZHBhZ2UgfHwgZHN0X3BmbnNb
aV0gPT0gTUlHUkFURV9QRk5fRVJST1IpCj4gQEAgLTE5NCwxNCArMjAwLDEwIEBAIG5vdXZlYXVf
ZG1lbV9mYXVsdF9hbGxvY19hbmRfY29weShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiAg
IAkJCWNvbnRpbnVlOwo+ICAgCQl9Cj4gICAKPiAtCQlkc3RfYWRkciA9IGZhdWx0LT5kbWFbZmF1
bHQtPm5wYWdlcysrXTsKPiAtCj4gLQkJY2h1bmsgPSBzcGFnZS0+em9uZV9kZXZpY2VfZGF0YTsK
PiAtCQlzcmNfYWRkciA9IHBhZ2VfdG9fcGZuKHNwYWdlKSAtIGNodW5rLT5wZm5fZmlyc3Q7Cj4g
LQkJc3JjX2FkZHIgPSAoc3JjX2FkZHIgPDwgUEFHRV9TSElGVCkgKyBjaHVuay0+Ym8tPmJvLm9m
ZnNldDsKPiAtCj4gLQkJcmV0ID0gY29weShkcm0sIDEsIE5PVVZFQVVfQVBFUl9IT1NULCBkc3Rf
YWRkciwKPiAtCQkJCSAgIE5PVVZFQVVfQVBFUl9WUkFNLCBzcmNfYWRkcik7Cj4gKwkJcmV0ID0g
Y29weShkcm0sIDEsIE5PVVZFQVVfQVBFUl9IT1NULAo+ICsJCQkJZmF1bHQtPmRtYVtmYXVsdC0+
bnBhZ2VzKytdLAo+ICsJCQkJTk9VVkVBVV9BUEVSX1ZSQU0sCj4gKwkJCQlub3V2ZWF1X2RtZW1f
cGFnZV9hZGRyKHNwYWdlKSk7Cj4gICAJCWlmIChyZXQpIHsKPiAgIAkJCWRzdF9wZm5zW2ldID0g
TUlHUkFURV9QRk5fRVJST1I7Cj4gICAJCQlfX2ZyZWVfcGFnZShkcGFnZSk7Cj4gQEAgLTY4Nywx
OCArNjg5LDEyIEBAIG5vdXZlYXVfZG1lbV9taWdyYXRlX2FsbG9jX2FuZF9jb3B5KHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hLAo+ICAgCS8qIENvcHkgdGhpbmdzIG92ZXIgKi8KPiAgIAljb3B5
ID0gZHJtLT5kbWVtLT5taWdyYXRlLmNvcHlfZnVuYzsKPiAgIAlmb3IgKGFkZHIgPSBzdGFydCwg
aSA9IDA7IGFkZHIgPCBlbmQ7IGFkZHIgKz0gUEFHRV9TSVpFLCBpKyspIHsKPiAtCQlzdHJ1Y3Qg
bm91dmVhdV9kbWVtX2NodW5rICpjaHVuazsKPiAgIAkJc3RydWN0IHBhZ2UgKnNwYWdlLCAqZHBh
Z2U7Cj4gLQkJdTY0IHNyY19hZGRyLCBkc3RfYWRkcjsKPiAgIAo+ICAgCQlkcGFnZSA9IG1pZ3Jh
dGVfcGZuX3RvX3BhZ2UoZHN0X3BmbnNbaV0pOwo+ICAgCQlpZiAoIWRwYWdlIHx8IGRzdF9wZm5z
W2ldID09IE1JR1JBVEVfUEZOX0VSUk9SKQo+ICAgCQkJY29udGludWU7Cj4gICAKPiAtCQljaHVu
ayA9IGRwYWdlLT56b25lX2RldmljZV9kYXRhOwo+IC0JCWRzdF9hZGRyID0gcGFnZV90b19wZm4o
ZHBhZ2UpIC0gY2h1bmstPnBmbl9maXJzdDsKPiAtCQlkc3RfYWRkciA9IChkc3RfYWRkciA8PCBQ
QUdFX1NISUZUKSArIGNodW5rLT5iby0+Ym8ub2Zmc2V0Owo+IC0KPiAgIAkJc3BhZ2UgPSBtaWdy
YXRlX3Bmbl90b19wYWdlKHNyY19wZm5zW2ldKTsKPiAgIAkJaWYgKCFzcGFnZSB8fCAhKHNyY19w
Zm5zW2ldICYgTUlHUkFURV9QRk5fTUlHUkFURSkpIHsKPiAgIAkJCW5vdXZlYXVfZG1lbV9wYWdl
X2ZyZWVfbG9ja2VkKGRybSwgZHBhZ2UpOwo+IEBAIC03MTYsMTAgKzcxMiwxMCBAQCBub3V2ZWF1
X2RtZW1fbWlncmF0ZV9hbGxvY19hbmRfY29weShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwK
PiAgIAkJCWNvbnRpbnVlOwo+ICAgCQl9Cj4gICAKPiAtCQlzcmNfYWRkciA9IG1pZ3JhdGUtPmRt
YVttaWdyYXRlLT5kbWFfbnIrK107Cj4gLQo+IC0JCXJldCA9IGNvcHkoZHJtLCAxLCBOT1VWRUFV
X0FQRVJfVlJBTSwgZHN0X2FkZHIsCj4gLQkJCQkgICBOT1VWRUFVX0FQRVJfSE9TVCwgc3JjX2Fk
ZHIpOwo+ICsJCXJldCA9IGNvcHkoZHJtLCAxLCBOT1VWRUFVX0FQRVJfVlJBTSwKPiArCQkJCW5v
dXZlYXVfZG1lbV9wYWdlX2FkZHIoZHBhZ2UpLAo+ICsJCQkJTk9VVkVBVV9BUEVSX0hPU1QsCj4g
KwkJCQltaWdyYXRlLT5kbWFbbWlncmF0ZS0+ZG1hX25yKytdKTsKPiAgIAkJaWYgKHJldCkgewo+
ICAgCQkJbm91dmVhdV9kbWVtX3BhZ2VfZnJlZV9sb2NrZWQoZHJtLCBkcGFnZSk7Cj4gICAJCQlk
c3RfcGZuc1tpXSA9IDA7Cj4gQEAgLTg0Niw3ICs4NDIsNiBAQCBub3V2ZWF1X2RtZW1fY29udmVy
dF9wZm4oc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCj4gICAKPiAgIAlucGFnZXMgPSAocmFuZ2Ut
PmVuZCAtIHJhbmdlLT5zdGFydCkgPj4gUEFHRV9TSElGVDsKPiAgIAlmb3IgKGkgPSAwOyBpIDwg
bnBhZ2VzOyArK2kpIHsKPiAtCQlzdHJ1Y3Qgbm91dmVhdV9kbWVtX2NodW5rICpjaHVuazsKPiAg
IAkJc3RydWN0IHBhZ2UgKnBhZ2U7Cj4gICAJCXVpbnQ2NF90IGFkZHI7Cj4gICAKPiBAQCAtODY0
LDEwICs4NTksNyBAQCBub3V2ZWF1X2RtZW1fY29udmVydF9wZm4oc3RydWN0IG5vdXZlYXVfZHJt
ICpkcm0sCj4gICAJCQljb250aW51ZTsKPiAgIAkJfQo+ICAgCj4gLQkJY2h1bmsgPSBwYWdlLT56
b25lX2RldmljZV9kYXRhOwo+IC0JCWFkZHIgPSBwYWdlX3RvX3BmbihwYWdlKSAtIGNodW5rLT5w
Zm5fZmlyc3Q7Cj4gLQkJYWRkciA9IChhZGRyICsgY2h1bmstPmJvLT5iby5tZW0uc3RhcnQpIDw8
IFBBR0VfU0hJRlQ7Cj4gLQo+ICsJCWFkZHIgPSBub3V2ZWF1X2RtZW1fcGFnZV9hZGRyKHBhZ2Up
Owo+ICAgCQlyYW5nZS0+cGZuc1tpXSAmPSAoKDFVTCA8PCByYW5nZS0+cGZuX3NoaWZ0KSAtIDEp
Owo+ICAgCQlyYW5nZS0+cGZuc1tpXSB8PSAoYWRkciA+PiBQQUdFX1NISUZUKSA8PCByYW5nZS0+
cGZuX3NoaWZ0Owo+ICAgCX0KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs

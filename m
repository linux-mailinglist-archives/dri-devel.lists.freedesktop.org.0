Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBB425A746
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 10:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478FE6E409;
	Wed,  2 Sep 2020 08:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B1D96E409
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 08:01:02 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08280pA7094762;
 Wed, 2 Sep 2020 03:00:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599033651;
 bh=1bOhg2Pozz6rcMj1+uMvlXBX35wWMkgjDScBHdgjrGA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=uCptm6F4IhHx1+0CT2rnCmC7OxX+/Xm05UrEQJBqEw8tEOO0a9Z3QZHXHM/N4/wdh
 GWSpcQdbbxmEnnfKvTmTB2/ylM3AvQKsmTc4oMmLfpmi0juS7j1s8G8y8OO3bwH+FJ
 nOoQOPwT33Ba4fTsS1SdhZFBfOpEFTOu/BScnvwo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08280p0X077629
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 2 Sep 2020 03:00:51 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 2 Sep
 2020 03:00:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 2 Sep 2020 03:00:51 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08280mFG008004;
 Wed, 2 Sep 2020 03:00:48 -0500
Subject: Re: [PATCH v9 14/32] drm: omapdrm: fix common struct sg_table related
 issues
To: Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>,
 <dri-devel@lists.freedesktop.org>, <iommu@lists.linux-foundation.org>,
 <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
References: <20200826063316.23486-1-m.szyprowski@samsung.com>
 <CGME20200826063536eucas1p2e29d2b061b8b74c06c9ea61ad6737ba2@eucas1p2.samsung.com>
 <20200826063316.23486-15-m.szyprowski@samsung.com>
 <7298cc55-c550-0b41-3f3c-8eebed845848@arm.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <e3f8d1d2-9c33-78be-56e6-ad214c7fb84c@ti.com>
Date: Wed, 2 Sep 2020 11:00:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7298cc55-c550-0b41-3f3c-8eebed845848@arm.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDEvMDkvMjAyMCAyMjozMywgUm9iaW4gTXVycGh5IHdyb3RlOgo+IE9uIDIwMjAtMDgtMjYg
MDc6MzIsIE1hcmVrIFN6eXByb3dza2kgd3JvdGU6Cj4+IFRoZSBEb2N1bWVudGF0aW9uL0RNQS1B
UEktSE9XVE8udHh0IHN0YXRlcyB0aGF0IHRoZSBkbWFfbWFwX3NnKCkgZnVuY3Rpb24KPj4gcmV0
dXJucyB0aGUgbnVtYmVyIG9mIHRoZSBjcmVhdGVkIGVudHJpZXMgaW4gdGhlIERNQSBhZGRyZXNz
IHNwYWNlLgo+PiBIb3dldmVyIHRoZSBzdWJzZXF1ZW50IGNhbGxzIHRvIHRoZSBkbWFfc3luY19z
Z19mb3Jfe2RldmljZSxjcHV9KCkgYW5kCj4+IGRtYV91bm1hcF9zZyBtdXN0IGJlIGNhbGxlZCB3
aXRoIHRoZSBvcmlnaW5hbCBudW1iZXIgb2YgdGhlIGVudHJpZXMKPj4gcGFzc2VkIHRvIHRoZSBk
bWFfbWFwX3NnKCkuCj4+Cj4+IHN0cnVjdCBzZ190YWJsZSBpcyBhIGNvbW1vbiBzdHJ1Y3R1cmUg
dXNlZCBmb3IgZGVzY3JpYmluZyBhIG5vbi1jb250aWd1b3VzCj4+IG1lbW9yeSBidWZmZXIsIHVz
ZWQgY29tbW9ubHkgaW4gdGhlIERSTSBhbmQgZ3JhcGhpY3Mgc3Vic3lzdGVtcy4gSXQKPj4gY29u
c2lzdHMgb2YgYSBzY2F0dGVybGlzdCB3aXRoIG1lbW9yeSBwYWdlcyBhbmQgRE1BIGFkZHJlc3Nl
cyAoc2dsIGVudHJ5KSwKPj4gYXMgd2VsbCBhcyB0aGUgbnVtYmVyIG9mIHNjYXR0ZXJsaXN0IGVu
dHJpZXM6IENQVSBwYWdlcyAob3JpZ19uZW50cyBlbnRyeSkKPj4gYW5kIERNQSBtYXBwZWQgcGFn
ZXMgKG5lbnRzIGVudHJ5KS4KPj4KPj4gSXQgdHVybmVkIG91dCB0aGF0IGl0IHdhcyBhIGNvbW1v
biBtaXN0YWtlIHRvIG1pc3VzZSBuZW50cyBhbmQgb3JpZ19uZW50cwo+PiBlbnRyaWVzLCBjYWxs
aW5nIERNQS1tYXBwaW5nIGZ1bmN0aW9ucyB3aXRoIGEgd3JvbmcgbnVtYmVyIG9mIGVudHJpZXMg
b3IKPj4gaWdub3JpbmcgdGhlIG51bWJlciBvZiBtYXBwZWQgZW50cmllcyByZXR1cm5lZCBieSB0
aGUgZG1hX21hcF9zZygpCj4+IGZ1bmN0aW9uLgo+Pgo+PiBGaXggdGhlIGNvZGUgdG8gcmVmZXIg
dG8gcHJvcGVyIG5lbnRzIG9yIG9yaWdfbmVudHMgZW50cmllcy4gVGhpcyBkcml2ZXIKPj4gY2hl
Y2tzIGZvciBhIGJ1ZmZlciBjb250aWd1aXR5IGluIERNQSBhZGRyZXNzIHNwYWNlLCBzbyBpdCBz
aG91bGQgdGVzdAo+PiBzZ190YWJsZS0+bmVudHMgZW50cnkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KPj4gLS0tCj4+IMKg
IGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMgfCA2ICsrKy0tLQo+PiDCoCAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL29tYXBfZ2VtLmMKPj4gaW5kZXggZmYwYzRiMGMzZmQwLi5hN2E5YTBhZmUyYjYg
MTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMKPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwo+PiBAQCAtNDgsNyArNDgsNyBA
QCBzdHJ1Y3Qgb21hcF9nZW1fb2JqZWN0IHsKPj4gwqDCoMKgwqDCoMKgICrCoMKgIE9NQVBfQk9f
TUVNX0RNQV9BUEkgZmxhZyBzZXQpCj4+IMKgwqDCoMKgwqDCoCAqCj4+IMKgwqDCoMKgwqDCoCAq
IC0gYnVmZmVycyBpbXBvcnRlZCBmcm9tIGRtYWJ1ZiAod2l0aCB0aGUgT01BUF9CT19NRU1fRE1B
QlVGIGZsYWcgc2V0KQo+PiAtwqDCoMKgwqAgKsKgwqAgaWYgdGhleSBhcmUgcGh5c2ljYWxseSBj
b250aWd1b3VzICh3aGVuIHNndC0+b3JpZ19uZW50cyA9PSAxKQo+PiArwqDCoMKgwqAgKsKgwqAg
aWYgdGhleSBhcmUgcGh5c2ljYWxseSBjb250aWd1b3VzICh3aGVuIHNndC0+bmVudHMgPT0gMSkK
PiAKPiBIbW0sIGlmIHRoaXMgcmVhbGx5IGRvZXMgbWVhbiAqcGh5c2ljYWxseSogY29udGlndW91
cyAtIGkuZS4gaWYgYnVmZmVycyBtaWdodCBiZSBzaGFyZWQgYmV0d2Vlbgo+IERNQS10cmFuc2xh
dGFibGUgYW5kIG5vbi1ETUEtdHJhbnNsYXRhYmxlIGRldmljZXMgLSB0aGVuIHRoZXNlIGNoYW5n
ZXMgbWlnaHQgbm90IGJlIGFwcHJvcHJpYXRlLiBJZgo+IG5vdCBhbmQgaXQgb25seSBhY3R1YWxs
eSBtZWFucyBETUEtY29udGlndW91cywgdGhlbiBpdCB3b3VsZCBiZSBnb29kIHRvIGNsYXJpZnkg
dGhlIGNvbW1lbnRzIHRvIHRoYXQKPiBlZmZlY3QuCj4gCj4gQ2FuIGFueW9uZSBmYW1pbGlhciB3
aXRoIG9tYXBkcm0gY2xhcmlmeSB3aGF0IGV4YWN0bHkgdGhlIGNhc2UgaXMgaGVyZT8gSSBrbm93
IHRoYXQgSU9NTVVzIG1pZ2h0IGJlCj4gaW52b2x2ZWQgdG8gc29tZSBkZWdyZWUsIGFuZCBJJ3Zl
IHNraW1tZWQgdGhlIGludGVyY29ubmVjdCBjaGFwdGVycyBvZiBlbm91Z2ggT01BUCBUUk1zIHRv
IGJlIHNjYXJlZAo+IGJ5IHRoZSByZWZlcmVuY2UgdG8gdGhlIHRpbGVyIGFwZXJ0dXJlIGluIHRo
ZSBjb250ZXh0IGJlbG93IDopCgpEU1MgKGxpa2UgbWFueSBvdGhlciBJUHMgaW4gT01BUCkgZG9l
cyBub3QgaGF2ZSBhbnkgTU1VL1BBVCwgYW5kIGNhbiBvbmx5IHVzZSBjb250aWd1b3VzIGJ1ZmZl
cnMKKGNvbnRpZ3VvdXMgaW4gdGhlIFJBTSkuCgpUaGVyZSdzIGEgc3BlY2lhbCBjYXNlIHdpdGgg
VElMRVIgKHdoaWNoIGlzIG5vdCBwYXJ0IG9mIERTUyBidXQgb2YgdGhlIG1lbW9yeSBzdWJzeXN0
ZW0sIGJ1dCBpdCdzCnN0aWxsIGhhbmRsZWQgaW50ZXJuYWxseSBieSB0aGUgb21hcGRybSBkcml2
ZXIpLCB3aGljaCBoYXMgYSBQQVQuIFBBVCBjYW4gY3JlYXRlIGEgY29udGlndW91cyB2aWV3Cm9m
IHNjYXR0ZXJlZCBwYWdlcywgYW5kIERTUyBjYW4gdGhlbiB1c2UgdGhpcyBjb250aWd1b3VzIHZp
ZXcgKCJ0aWxlciBhcGVydHVyZSIsIHdoaWNoIHRvIERTUyBsb29rcwpqdXN0IGxpa2Ugbm9ybWFs
IGNvbnRpZ3VvdXMgbWVtb3J5KS4KCk5vdGUgdGhhdCBvbWFwZHJtIGRvZXMgbm90IHVzZSBkbWFf
bWFwX3NnKCkgJiBjby4gbWVudGlvbmVkIGluIHRoZSBwYXRjaCBkZXNjcmlwdGlvbi4KCklmIHRo
ZXJlJ3Mgbm8gTU1VL1BBVCwgaXMgb3JpZ19uZW50cyBhbHdheXMgdGhlIHNhbWUgYXMgbmVudHM/
IE9yIGNhbiB3ZSBoYXZlIG11bHRpcGxlIHBoeXNpY2FsbHkKY29udGlndW91cyBwYWdlcyBsaXN0
ZWQgc2VwYXJhdGVseSBpbiB0aGUgc2d0IChzbyBvcmlnX25lbnRzID4gMSkgYnV0IGFzIHRoZSBw
YWdlcyBmb3JtIG9uZSBiaWcKY29udGlndW91cyBhcmVhLCBuZW50cyA9PSAxPwoKIFRvbWkKCi0t
IApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBI
ZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21p
Y2lsZTogSGVsc2lua2kKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==

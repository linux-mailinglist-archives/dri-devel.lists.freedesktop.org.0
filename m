Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A871B211B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 10:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182456E89E;
	Tue, 21 Apr 2020 08:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA506E89E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 08:09:33 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200421080929euoutp01275fb79fa1d7df9fbe8d4f4051967620~Hx1bTdIu90714407144euoutp01H
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 08:09:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200421080929euoutp01275fb79fa1d7df9fbe8d4f4051967620~Hx1bTdIu90714407144euoutp01H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587456569;
 bh=FCt71SEiI519fjradSUmj8Awr/xMxJ7GwNv2OpT0rYw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=WMp9wzintspdJ3t2O13LELgLTKfFXk3k0sJfAKdsSQNvRwVQ7gwKA1kRjRbbA0CBf
 RQnzopEA/2g6TToh6my1V5pfPwviHkix0sUtHJlom1aWapd673bTO2xTdQXHG+Eb3X
 wVqDd1WOG2pC9HTbhZ7zmv9rW5WQwm+4Sq6UPnZ8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200421080929eucas1p19646994bab12742d52528801e616d899~Hx1a-T7WL2150021500eucas1p1H;
 Tue, 21 Apr 2020 08:09:29 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 23.37.60679.83AAE9E5; Tue, 21
 Apr 2020 09:09:28 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200421080928eucas1p164c7148d7ff0e85ad9751fc89a1d45b3~Hx1amUDlj2149521495eucas1p1X;
 Tue, 21 Apr 2020 08:09:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200421080928eusmtrp26f53e863422d737e6f8b33aa5811a0bd~Hx1aluwzk2810628106eusmtrp2u;
 Tue, 21 Apr 2020 08:09:28 +0000 (GMT)
X-AuditID: cbfec7f4-0cbff7000001ed07-1b-5e9eaa385884
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 1A.A2.07950.83AAE9E5; Tue, 21
 Apr 2020 09:09:28 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200421080928eusmtip13945b7bfcf9bf1dad8bd27c320511410~Hx1aKXjAa2484924849eusmtip1b;
 Tue, 21 Apr 2020 08:09:28 +0000 (GMT)
Subject: Re: [PATCH 2/3] drm/exynos: gem: Rework scatter-list contiguity
 check on Prime import
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-samsung-soc@vger.kernel.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <40285486-be0a-1e7b-6fd9-2c821bd537f9@samsung.com>
Date: Tue, 21 Apr 2020 10:09:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <92cffe01-7a14-8fbd-90a3-dc171884c26d@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsWy7djPc7oWq+bFGbRMsrG4te4cq8XGGetZ
 La58fc9mMen+BBaLGef3MVnMmPySzYHN4373cSaPvi2rGD0+b5ILYI7isklJzcksSy3St0vg
 yvj9bipLwUGBiil/L7I2MG7l7WLk5JAQMJF4ufIIexcjF4eQwApGibeXd7JCOF8YJVYc+swI
 4XxmlDh7bhc7TMv5DxuZIRLLGSX2LN7LAuG8Z5RYuO4AUxcjB4ewQILEid06IA0iApkSB55M
 ZwSxmQXaGSXWHo8HsdkEDCW63naxgZTzCthJfJ0pCxJmEVCV+PpiPjNIWFQgVmL6tRCQMK+A
 oMTJmU9YQGxOAXuJJUt2sUJMlJdo3jqbGcIWl7j1ZD4TxJnz2CWWd3JD2C4S/67fgYoLS7w6
 vgXqFRmJ/ztB6rmA7GZGiYfn1rJDOD2MEpebZjBCVFlL3Dn3C+xOZgFNifW79EFMCQFHib79
 YhAmn8SNt4IQJ/BJTNo2nRkizCvR0SYEMUNNYtbxdXBbD164xDyBUWkWksdmIXlmFpJnZiGs
 XcDIsopRPLW0ODc9tdgoL7Vcrzgxt7g0L10vOT93EyMwvZz+d/zLDsZdf5IOMQpwMCrx8G4Q
 mxcnxJpYVlyZe4hRgoNZSYTXQgsoxJuSWFmVWpQfX1Sak1p8iFGag0VJnNd40ctYIYH0xJLU
 7NTUgtQimCwTB6dUA2P4NSa3E5d+HLWQLniTJnUnveXeAamvq4wOfbwZdTp1FZ/FDq2OjiOF
 M3/vvt3h/D+0Y5ZQ04WVmVmBX35P/PiLUeCHmXVn024+vsNmzcZ7sh/dO/xCWHt30rkw9yva
 y7k4MvdMbnr4Tnhahf6z5lefT33Iv/DeNHeFp3Dv+7qK6B07d9UtEputxFKckWioxVxUnAgA
 vqS6FSsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xu7oWq+bFGVyYrWhxa905VouNM9az
 Wlz5+p7NYtL9CSwWM87vY7KYMfklmwObx/3u40wefVtWMXp83iQXwBylZ1OUX1qSqpCRX1xi
 qxRtaGGkZ2hpoWdkYqlnaGwea2VkqqRvZ5OSmpNZllqkb5egl/H73VSWgoMCFVP+XmRtYNzK
 28XIySEhYCJx/sNG5i5GLg4hgaWMEusub2CESMhInJzWwAphC0v8udbFBlH0llHi8oz9zCAJ
 YYEEicmnboE1iAhkSrxsXg82iVmgnVHiyL4OdoiOH4wSB9pfglWxCRhKdL0FGcXBwStgJ/F1
 pixImEVAVeLri/nMIGFRgViJlouaIGFeAUGJkzOfsIDYnAL2EkuW7AI7iFnATGLe5ofMELa8
 RPPW2VC2uMStJ/OZJjAKzULSPgtJyywkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeul5yf
 u4kRGFfbjv3csoOx613wIUYBDkYlHt4NYvPihFgTy4orcw8xSnAwK4nwWmgBhXhTEiurUovy
 44tKc1KLDzGaAv02kVlKNDkfGPN5JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNTUwtS
 i2D6mDg4pYCR9MTrg88Hbo6PsttPiBz8tyhvw8FqgVe7gmNKTTKEf7BpyU4UtNn6zU1m7628
 2Lz+svvvY3RK2LeK7fz3wGH3+3V//Od4v4u6b3PlwxmXLz1by1X5U8UYDxz21NL6sb1i4o7X
 FpHJGXopBVO2/0594fr96+a+rFvbf79b1hmvt3eeWou3nfdxJZbijERDLeai4kQARebNN8EC
 AAA=
X-CMS-MailID: 20200421080928eucas1p164c7148d7ff0e85ad9751fc89a1d45b3
X-Msg-Generator: CA
X-RootMTR: 20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada
References: <20200407134256.9129-1-m.szyprowski@samsung.com>
 <CGME20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada@eucas1p1.samsung.com>
 <20200407134256.9129-3-m.szyprowski@samsung.com>
 <92cffe01-7a14-8fbd-90a3-dc171884c26d@samsung.com>
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
Cc: Andrzej Hajda <a.hajda@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSW5raSwKCk9uIDIxLjA0LjIwMjAgMDk6MzgsIElua2kgRGFlIHdyb3RlOgo+IDIwLiA0LiA3
LiDsmKTtm4QgMTA6NDLsl5AgTWFyZWsgU3p5cHJvd3NraSDsnbQo6rCAKSDsk7Qg6riAOgo+PiBF
eHBsaWNpdGx5IGNoZWNrIGlmIHRoZSBpbXBvcnRlZCBidWZmZXIgaGFzIGJlZW4gbWFwcGVkIGFz
IGNvbnRpZ3VvdXMgaW4KPj4gdGhlIERNQSBhZGRyZXNzIHNwYWNlLCB3aGF0IGlzIHJlcXVpcmVk
IGJ5IGFsbCBFeHlub3MgRFJNIENSVEMgZHJpdmVycy4KPj4gV2hpbGUgdG91Y2hpbmcgdGhpcywg
c2V0IGJ1ZmZlciBmbGFncyBkZXBlbmRpbmcgb24gdGhlIGF2YWlsYWJpbGl0eSBvZgo+PiB0aGUg
SU9NTVUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3Nr
aUBzYW1zdW5nLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3Nf
ZHJtX2dlbS5jIHwgMzYgKysrKysrKysrKysrKysrKystLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCAyNSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2RybV9nZW0uYwo+PiBpbmRleCA0MDUxNGQzZGNmNjAuLjlkNGU0ZDMy
MWJkYSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dl
bS5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0uYwo+PiBA
QCAtNDU4LDYgKzQ1OCwyMyBAQCBleHlub3NfZHJtX2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwKPj4gICAJaW50IG5wYWdlczsKPj4gICAJaW50IHJldDsK
Pj4gICAKPiAoT3B0aW9uYWwpIGNvdWxkIHlvdSBsZWF2ZSBvbmUgY29tbWVudCBoZXJlPwo+IGku
ZS4sIC8qIENoZWNrIGlmIERNQSBtZW1vcnkgcmVnaW9uIGZyb20gYSBleHBvcnRlciBhcmUgbWFw
cGVkIGNvbnRpZ3VvdXNseSBvciBub3QuICovCgpPa2F5LgoKPj4gKwlpZiAoc2d0LT5uZW50cyAh
PSAxKSB7Cj4gSG93IGFib3V0IHVzaW5nIGJlbG93IGNvbmRpdGlvbiBpbnN0ZWFkPwo+IGlmIChz
Z3QtPm5lbnRzID4gMCkgewoKVGhpcyBpcyBub3QgdGhlIHNhbWUuIE15IGNoZWNrIGZvciAhPSAx
IGlzIGludGVuZGVkLiBDaGVja2luZyBjb250aWd1aXR5IApvZiB0aGUgc2NhdHRlcmxpc3QgaWYg
aXQgaGFzIG9ubHkgMSBlbGVtZW50IGRvZXNuJ3QgaGF2ZSBtdWNoIHNlbnNlLgoKPj4gKwkJZG1h
X2FkZHJfdCBuZXh0X2FkZHIgPSBzZ19kbWFfYWRkcmVzcyhzZ3QtPnNnbCk7Cj4+ICsJCXN0cnVj
dCBzY2F0dGVybGlzdCAqczsKPj4gKwkJdW5zaWduZWQgaW50IGk7Cj4+ICsKPj4gKwkJZm9yX2Vh
Y2hfc2coc2d0LT5zZ2wsIHMsIHNndC0+bmVudHMsIGkpIHsKPj4gKwkJCWlmICghc2dfZG1hX2xl
bihzKSkKPj4gKwkJCQljb250aW51ZTsKPiBJc24ndCBpdCBhbiBlcnJvciBjYXNlIGlmIHNnX2Rt
YV9sZW4ocykgaXMgMD8gSSB0aGluayBsZW5ndGggb2YgcyBpcyAwIHRoZW4gaXQgd291bGQgYmUg
aW52YWxpZCBiZWNhdXNlIGFsbCBlbnRyaWVzIG9mIHNndCBzaG91bGQgYmUgbWFwcGVkIGJlZm9y
ZSBzZ19kbWFfbGVuKCkgaXMgY2FsbGVkLgoKV2VsbCwgaXQgaXMgYSBncmV5IGFyZWEuIFNvbWUg
Y29kZSBpbmNvcnJlY3RseSBzZXRzIG5lbnRzIGFzIG9yaWdfbmVudHMsIAp0aHVzIHRoaXMgdmVy
c2lvbiBpcyBzaW1wbHkgc2FmZSBmb3IgYm90aCBhcHByb2FjaGVzLiBzZyBlbnRyaWVzIHVudXNl
ZCAKZm9yIERNQSBjaHVua3MgaGF2ZSBzZ19kbWFfbGVuKCkgPT0gMC4KClRoZSBhYm92ZSBjaGVj
ayBpcyBtb3JlIG9yIGxlc3MgY29waWVkIGZyb20gCmRybV9nZW1fY21hX3ByaW1lX2ltcG9ydF9z
Z190YWJsZSgpIChkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMpLgoKQmVzdCBy
ZWdhcmRzCi0tIApNYXJlayBTenlwcm93c2tpLCBQaEQKU2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBv
bGFuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

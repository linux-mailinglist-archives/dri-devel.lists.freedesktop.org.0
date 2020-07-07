Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D45A216D6C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 15:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363E789A67;
	Tue,  7 Jul 2020 13:07:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5AB89A62
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 13:07:03 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200707130701euoutp01ce3cfea327ecb8eb8049568d44710069~fekMXel222854728547euoutp01N
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 13:07:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200707130701euoutp01ce3cfea327ecb8eb8049568d44710069~fekMXel222854728547euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594127221;
 bh=U2aVauy2+JpINyhil7vNueItQM70I3jBlub5F2RoPaI=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=qFswgmZFPK21NxIp6LjhjIWdiP4hnMa3W/Dfea/0ql20x5k+AP4j4Ar51Tq07mcW+
 8tdm5eAwtL8UhhUVSdd8dvvh5J9wY9QzKexvo81d2o9wZXB0qtguzJ41V0ouWd/AKg
 cPL3NP/bhevlP7zW1sSyyJfI+Srq6V9E1ewDsGM4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200707130700eucas1p17f35c74c6cf62fd3a0373037b209f6e3~fekLfBnmJ2868428684eucas1p1D;
 Tue,  7 Jul 2020 13:07:00 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id B4.42.06456.473740F5; Tue,  7
 Jul 2020 14:07:00 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200707130700eucas1p1b618f2a9e6f8f5be3c97c762220300a0~fekLBimdw1405714057eucas1p1A;
 Tue,  7 Jul 2020 13:07:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200707130700eusmtrp1b04bf2435e172dc545c8cedac0e8af43~fekLAyDGx0101401014eusmtrp18;
 Tue,  7 Jul 2020 13:07:00 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-7e-5f0473748f5b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D4.D7.06314.473740F5; Tue,  7
 Jul 2020 14:07:00 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200707130659eusmtip1477441c2867581295ee26f9e4279cfdb~fekKW-Wv62686526865eusmtip1N;
 Tue,  7 Jul 2020 13:06:59 +0000 (GMT)
Subject: Re: [PATCH v7 04/36] drm: amdgpu: fix common struct sg_table
 related issues
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <ef43cce1-40dc-77fd-1107-33c64d947ed1@samsung.com>
Date: Tue, 7 Jul 2020 15:06:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bfbdf1ee-c970-d862-cc81-4712c34b7685@amd.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa1BMYRjH5z23TnHytkXPxLgsg0QJM47J5DI+nC8GX/rQDFmc2aK2Zs8W
 +UAKq6wmlWiZalS6iLJtF+XWzlLZKabShFSohrJTcs2M0u4Rffv/n+f3PM/7n3lZUjFI+7AR
 Gp2o1agilYwbVf1k/NkanUSFra2o9+MvtDYTfFZ3Pc0Xlp9y4e9cKad5e++Unay+SPId30YY
 vuTmY4LPexjEf+14S/Cm95003153jeEbRvvprZxwpu03I5TllCHh/vc8Sqj53kcLvecbCaGy
 4KTweuI9KWR0FSGh/mUCI6SaS5HwxbRw96xQt82HxMiIOFEbELzfLdzebiJiCuYcM1rWJSDz
 7BTkygLeAD+6Cl1SkBurwMUILnV8ImXzFUGNrY6WzRcEd5OHXaZHJpprkdwoQnBVP0TIZgTB
 B8sLJ+WJQ+B0tplxNLywFUFRvtVJkbiagDc/PzgpBgdCij2FcWgOB4PhTRrh0BReBjlWPe3Q
 c/E+KP9YQ8iMBzRn91MO7YqDIFc/4GRIvAiSqq6SsvaGV/25zmOAk1kY7xmdGmCnzA4YzvGR
 M3jCUKP5b54FYMswUDKfhOBt6y0X2RgQtCdeQTIVBN2tvxjHIhL7QnldgFzeBs8GExl5vzt0
 2T3kN7hDevVlUi5zcO6sQqaXg7Hx9r+zDc/byDSkNM5IZpyRxjgjjfH/3TxElSJvMVaKUotS
 oEY86i+poqRYjdr/YHSUCU39PttE41gt+tZ2wIIwi5SzuXAVFaagVXFSfJQFAUsqvbjtLbZ9
 Cu6QKv64qI0O08ZGipIFzWcppTe3/vrHvQqsVunEI6IYI2qnuwTr6pOAsgYfWDMjB6ig+nmh
 99y7dKlbAh4l5S62Tub/7rxsWB2zsMyTe2z/HJ3+lA8cMNo0vVX3vZLHmzYWLt30DnPqsYT+
 yiUDfgY2N35kBdvHnKl6kb7Sf2u2L7fnxi68MxO6y0x63xMtTbqWkMNxRzqH1EW3JvQ9ZiVT
 UTJc3GCoU1JSuCpwFamVVH8AnoTEznkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJIsWRmVeSWpSXmKPExsVy+t/xu7olxSzxBv+X8Vj0njvJZDHtzm5W
 i6XrG9ktNs5Yz2rx9j6Q+3/bRGaLK1/fs1msXH2UyWLBfmuLL1ceMllsenyN1eLyrjlsFgc/
 PGF14PVovfSXzWPNvDWMHnu/LWDx2P7tAavH/e7jTB6bl9R73P73mNlj8o3ljB67bzawefRt
 WcXo8XmTXAB3lJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllq
 kb5dgl7G28ubmAqW8FfMOmTUwLiFp4uRk0NCwETi38kdjF2MXBxCAksZJbbc+c4OkZCRODmt
 gRXCFpb4c62LDaLoLaPEifd9YAlhgTCJ/xNnMoMkRASOMEocPLWECcRhFtjGJPF66S6oud8Y
 Jd50z2YCaWETMJToegsyi5ODV8BOoufuBLA4i4CKxLwj7WBjRQXiJJZvmc8OUSMocXLmExYQ
 m1PAWmJ++1OwGmYBM4l5mx8yQ9jyEs1bZ0PZ4hK3nsxnmsAoNAtJ+ywkLbOQtMxC0rKAkWUV
 o0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYLRvO/Zz8w7GSxuDDzEKcDAq8fBmJLLEC7EmlhVX
 5h5ilOBgVhLhdTp7Ok6INyWxsiq1KD++qDQntfgQoynQcxOZpUST84GJKK8k3tDU0NzC0tDc
 2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA6P1len5y36bVQR9Sa8/Nmta8L8XG9zY
 Cv9WKU2axvL5/9qss0vCztyIEox9f0uq77yy50zxKM8zc4N9p1ks9jWYyfyw7sHaNz2K69lc
 rCOjFc7efin6p1kgyvdY3m9rjVUTsjt/fN3V+nw97+SUtVnbdsxYubF9rkP1Wa2/R/69LbhV
 W5OzeUeJEktxRqKhFnNRcSIAjDRWAQwDAAA=
X-CMS-MailID: 20200707130700eucas1p1b618f2a9e6f8f5be3c97c762220300a0
X-Msg-Generator: CA
X-RootMTR: 20200619103655eucas1p28ea4bf59428550217c8962666d6f077b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103655eucas1p28ea4bf59428550217c8962666d6f077b
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103655eucas1p28ea4bf59428550217c8962666d6f077b@eucas1p2.samsung.com>
 <20200619103636.11974-5-m.szyprowski@samsung.com>
 <bfbdf1ee-c970-d862-cc81-4712c34b7685@amd.com>
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
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLAoKT24gMjIuMDYuMjAyMCAxNToyNywgQ2hyaXN0aWFuIEvDtm5pZyB3cm90
ZToKPiBBbSAxOS4wNi4yMCB1bSAxMjozNiBzY2hyaWViIE1hcmVrIFN6eXByb3dza2k6Cj4+IFRo
ZSBEb2N1bWVudGF0aW9uL0RNQS1BUEktSE9XVE8udHh0IHN0YXRlcyB0aGF0IHRoZSBkbWFfbWFw
X3NnKCkgCj4+IGZ1bmN0aW9uCj4+IHJldHVybnMgdGhlIG51bWJlciBvZiB0aGUgY3JlYXRlZCBl
bnRyaWVzIGluIHRoZSBETUEgYWRkcmVzcyBzcGFjZS4KPj4gSG93ZXZlciB0aGUgc3Vic2VxdWVu
dCBjYWxscyB0byB0aGUgZG1hX3N5bmNfc2dfZm9yX3tkZXZpY2UsY3B1fSgpIGFuZAo+PiBkbWFf
dW5tYXBfc2cgbXVzdCBiZSBjYWxsZWQgd2l0aCB0aGUgb3JpZ2luYWwgbnVtYmVyIG9mIHRoZSBl
bnRyaWVzCj4+IHBhc3NlZCB0byB0aGUgZG1hX21hcF9zZygpLgo+Pgo+PiBzdHJ1Y3Qgc2dfdGFi
bGUgaXMgYSBjb21tb24gc3RydWN0dXJlIHVzZWQgZm9yIGRlc2NyaWJpbmcgYSAKPj4gbm9uLWNv
bnRpZ3VvdXMKPj4gbWVtb3J5IGJ1ZmZlciwgdXNlZCBjb21tb25seSBpbiB0aGUgRFJNIGFuZCBn
cmFwaGljcyBzdWJzeXN0ZW1zLiBJdAo+PiBjb25zaXN0cyBvZiBhIHNjYXR0ZXJsaXN0IHdpdGgg
bWVtb3J5IHBhZ2VzIGFuZCBETUEgYWRkcmVzc2VzIChzZ2wgCj4+IGVudHJ5KSwKPj4gYXMgd2Vs
bCBhcyB0aGUgbnVtYmVyIG9mIHNjYXR0ZXJsaXN0IGVudHJpZXM6IENQVSBwYWdlcyAob3JpZ19u
ZW50cyAKPj4gZW50cnkpCj4+IGFuZCBETUEgbWFwcGVkIHBhZ2VzIChuZW50cyBlbnRyeSkuCj4+
Cj4+IEl0IHR1cm5lZCBvdXQgdGhhdCBpdCB3YXMgYSBjb21tb24gbWlzdGFrZSB0byBtaXN1c2Ug
bmVudHMgYW5kIAo+PiBvcmlnX25lbnRzCj4+IGVudHJpZXMsIGNhbGxpbmcgRE1BLW1hcHBpbmcg
ZnVuY3Rpb25zIHdpdGggYSB3cm9uZyBudW1iZXIgb2YgZW50cmllcyBvcgo+PiBpZ25vcmluZyB0
aGUgbnVtYmVyIG9mIG1hcHBlZCBlbnRyaWVzIHJldHVybmVkIGJ5IHRoZSBkbWFfbWFwX3NnKCkK
Pj4gZnVuY3Rpb24uCj4+Cj4+IFRvIGF2b2lkIHN1Y2ggaXNzdWVzLCBsZXRzIHVzZSBhIGNvbW1v
biBkbWEtbWFwcGluZyB3cmFwcGVycyBvcGVyYXRpbmcKPj4gZGlyZWN0bHkgb24gdGhlIHN0cnVj
dCBzZ190YWJsZSBvYmplY3RzIGFuZCB1c2Ugc2NhdHRlcmxpc3QgcGFnZQo+PiBpdGVyYXRvcnMg
d2hlcmUgcG9zc2libGUuIFRoaXMsIGFsbW9zdCBhbHdheXMsIGhpZGVzIHJlZmVyZW5jZXMgdG8g
dGhlCj4+IG5lbnRzIGFuZCBvcmlnX25lbnRzIGVudHJpZXMsIG1ha2luZyB0aGUgY29kZSByb2J1
c3QsIGVhc2llciB0byBmb2xsb3cKPj4gYW5kIGNvcHkvcGFzdGUgc2FmZS4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgo+PiBS
ZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+
Cj4gQW55IG9iamVjdGlvbiB0aGF0IHdlIHBpY2sgdGhpcyBvbmUgYW5kIHRoZSByYWRlb24gdXAg
aW50byBvdXIgCj4gYnJhbmNoZXMgZm9yIHVwc3RyZWFtaW5nPwo+Cj4gVGhhdCBzaG91bGQgYWJv
dXQgY2xhc2hlcyB3aXRoIG90aGVyIGRyaXZlciBjaGFuZ2VzLgoKSSdtIGZpbmUuIFRoaXMgb25l
IGFuZCByYWRlb24gZG9lc24ndCBkZXBlbmQgb24gdGhlIHByaW1lIGNoYW5nZXMsIHNvIGl0IApz
aG91bGQgbWVyZ2UgZmluZSB2aWEgeW91ciB0cmVlLiBJIHdpbGwgdHJ5IHRvIGFzayBmb3IgbW9y
ZSByZXZpZXcgb2YgCnRoZSByZW1haW5pbmcgcGF0Y2hlcyBhbmQgdGhlbiB0cnkgbWVyZ2luZyB2
aWEgZHJtLW1pc2MuCgpCZXN0IHJlZ2FyZHMKLS0gCk1hcmVrIFN6eXByb3dza2ksIFBoRApTYW1z
dW5nIFImRCBJbnN0aXR1dGUgUG9sYW5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK

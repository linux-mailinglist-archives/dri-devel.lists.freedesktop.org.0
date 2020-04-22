Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D26F71B358F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 05:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDD66E4A7;
	Wed, 22 Apr 2020 03:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEF76E4A7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 03:32:27 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200422033225epoutp02be6ed1d9c0d880fe967264586878e542~IBszYiSey3238032380epoutp02S
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 03:32:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200422033225epoutp02be6ed1d9c0d880fe967264586878e542~IBszYiSey3238032380epoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587526345;
 bh=llfDxHhNURjT7jNOQ/6kDn/ybSZNL+9Rf7CZN2fFxCo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Bg1x0G0ehYgI4NnI7kSVv6k1homOcE1UZEn2Q85l6JAzGa3mIjru79qLkwh/vfoMn
 tvD9ltvCjZ1WW0IVHXVZZb9GMrhSse4OZ2otI5OWzc2iUE/v4Hrkj8HFzsZLf2Ph3Q
 onTvX0INIx59klqbA13YVlq7p5ANKNhbN2yw4w94=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200422033225epcas1p2de0af2b1403492d015da7e42be303080~IBszHEw6B0927409274epcas1p2M;
 Wed, 22 Apr 2020 03:32:25 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.156]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 496Qwk3fMrzMqYlh; Wed, 22 Apr
 2020 03:32:22 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 2A.30.04402.6CABF9E5; Wed, 22 Apr 2020 12:32:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200422033222epcas1p2e30a83108eb21fa76b0facdc2ce83f8e~IBswLnjhq1158711587epcas1p2F;
 Wed, 22 Apr 2020 03:32:22 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200422033222epsmtrp29f27374b3e1f2a7d7777c7d780382013~IBswK6iF01056610566epsmtrp2T;
 Wed, 22 Apr 2020 03:32:22 +0000 (GMT)
X-AuditID: b6c32a35-76bff70000001132-7b-5e9fbac6d168
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 F5.2D.04158.5CABF9E5; Wed, 22 Apr 2020 12:32:22 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200422033221epsmtip2de27683c6aed50c4b6f5450d9f8a4617~IBswCGM_j2782827828epsmtip2H;
 Wed, 22 Apr 2020 03:32:21 +0000 (GMT)
Subject: Re: [PATCH 2/3] drm/exynos: gem: Rework scatter-list contiguity
 check on Prime import
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <a268d606-b387-beeb-362f-07ae89a23ce7@samsung.com>
Date: Wed, 22 Apr 2020 12:37:22 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <40285486-be0a-1e7b-6fd9-2c821bd537f9@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0gUURTHuTM74yptjavVSajcoT4oPnbc3dpCrUhEqMiwSCJcB51W2Wc7
 u9KLMIIyFdFMMK3sJVRo2mqmlkWbzwrNyrSHSbQVlmmkVvbQdhwjv/3Ouf9z/+fce6S4vJAM
 kKab7ZzNzBpp0kdSdy8oPLS1sSxJ+WpisfbF1U5Ce624itA+HR8htcVdtzFtZXO/l7a4cJBc
 S8YN5LRhcXm1V1DcqHNJPL7DEJnGsamcLZAzp1hS0836KHpDgm69TrNCyYQyq7Qr6UAza+Ki
 6JiN8aGx6UaPLx2YwRodnlQ8y/N0eHSkzeKwc4FpFt4eRXPWVKN1lTWMZ028w6wPS7GYVjNK
 ZYTGI0w2pE2e8bHm++2pKN+ZiZzzspG3FCg15HaUEgLLqXoEl8sjs5GPh78iKP/9iRCDbwiO
 5VRg/yrenC/yEg+aEPx53jQTjCD48aUHz0ZSqR+VDO03Q4QCf8oBp6davQTGqaMIKtt0ApPU
 cii4NEAKLKOiof95n0RgiSff7PyJCdfMpxLhwTgrSnyh46R7WuJNrYEe1yFCvHIhvHCXYSIv
 hcPXS3GhHaAekvBx8igSm46Bsrr2GfaDj221XiIHwOhwEykWHEZQUPwAE4MsBP1veyWiSgV3
 ygunO8KpIKhqDBfTCmj4dRqJznNheDyXECRAySDriFyU0NDa3TfjC/DoYgEpchzcLcqT5CNF
 yazZSmbNUzJrnpL/xmeR5ApawFl5k57jGSsz+6udaHohgzX16ETnRheipIieI+vrOpMkJ9gM
 fq/JhUCK0/6y6jeelCyV3buPs1l0NoeR411I43n5AjxgforFs95mu47RRKhUKq2aWaFhGHqh
 rKjXmCSn9KydM3CclbP9q8Ok3gGZaFvHdlVvBUZkJG+xvjzW7j90cEQ9ONXreHyhsGGoKObd
 WnWC7+bhSedxt3JZiH7r7nMH7i/Zfyq7Z3F1/JOpwdd5XEQs7VZPfHf5ev9R1E++Hmj+/MFQ
 +oycM4YFKd7vVowl5mzui6y5ZXDuGqlxL1p3I5bZRJiOt1S1NHZ1J5x4TEv4NJYJxm08+xcb
 7zHlpgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrELMWRmVeSWpSXmKPExsWy7bCSvO6xXfPjDJbeYrK4te4cq8XGGetZ
 La58fc9mMeP8PiaLtUfuslvMmPySzYHN4373cSaPvi2rGD0+b5ILYI7isklJzcksSy3St0vg
 yvg3j6tggnDFmqUxDYyb+LsYOTkkBEwkHi6ayt7FyMUhJLCbUeLzvMtsXYwcQAkJiS1bOSBM
 YYnDh4tByoUE3jJK9O/OB7GFBRIkJp+6xQhiiwiUSrzqv88IMoZZoJ1R4si+DqiZa5kkjj3Z
 xgJSxSagKjFxxX02EJtXwE7i7s0bYHEWoPiRTb+YQGxRgQiJ59tvMELUCEqcnPkErIZTwF7i
 6qFGVhCbWUBd4s+8S8wQtrjErSfzmSBseYnmrbOZJzAKzULSPgtJyywkLbOQtCxgZFnFKJla
 UJybnltsWGCUl1quV5yYW1yal66XnJ+7iREcE1paOxhPnIg/xCjAwajEw3vj/Lw4IdbEsuLK
 3EOMEhzMSiK8Gx4ChXhTEiurUovy44tKc1KLDzFKc7AoifPK5x+LFBJITyxJzU5NLUgtgsky
 cXBKNTB2qZcJnxJMbXnl56l+6b/ICuFfZlGMoUqz0uM370r/PE34TyTToZV3fq9tte218Yg+
 GTB712NFVSnla35M9oWhey8wFsXaScw9pf50f/6dp2tucM60+rWkujqRvT+LVX01iyhrbL3J
 SZ5HDsdcRdWZ7G+9XW10ryb7W9BeXyFxtxMPZNlzLyixFGckGmoxFxUnAgC2J+ckhQIAAA==
X-CMS-MailID: 20200422033222epcas1p2e30a83108eb21fa76b0facdc2ce83f8e
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada
References: <20200407134256.9129-1-m.szyprowski@samsung.com>
 <CGME20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada@eucas1p1.samsung.com>
 <20200407134256.9129-3-m.szyprowski@samsung.com>
 <92cffe01-7a14-8fbd-90a3-dc171884c26d@samsung.com>
 <40285486-be0a-1e7b-6fd9-2c821bd537f9@samsung.com>
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

SGkgTWFyZWssCgoyMC4gNC4gMjEuIOyYpO2bhCA1OjA57JeQIE1hcmVrIFN6eXByb3dza2kg7J20
KOqwgCkg7JO0IOq4gDoKPiBIaSBJbmtpLAo+IAo+IE9uIDIxLjA0LjIwMjAgMDk6MzgsIElua2kg
RGFlIHdyb3RlOgo+PiAyMC4gNC4gNy4g7Jik7ZuEIDEwOjQy7JeQIE1hcmVrIFN6eXByb3dza2kg
7J20KOqwgCkg7JO0IOq4gDoKPj4+IEV4cGxpY2l0bHkgY2hlY2sgaWYgdGhlIGltcG9ydGVkIGJ1
ZmZlciBoYXMgYmVlbiBtYXBwZWQgYXMgY29udGlndW91cyBpbgo+Pj4gdGhlIERNQSBhZGRyZXNz
IHNwYWNlLCB3aGF0IGlzIHJlcXVpcmVkIGJ5IGFsbCBFeHlub3MgRFJNIENSVEMgZHJpdmVycy4K
Pj4+IFdoaWxlIHRvdWNoaW5nIHRoaXMsIHNldCBidWZmZXIgZmxhZ3MgZGVwZW5kaW5nIG9uIHRo
ZSBhdmFpbGFiaWxpdHkgb2YKPj4+IHRoZSBJT01NVS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBN
YXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+Cj4+PiAtLS0KPj4+ICAg
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5jIHwgMzYgKysrKysrKysrKysr
KysrKystLS0tLS0tLQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3Mv
ZXh5bm9zX2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0u
Ywo+Pj4gaW5kZXggNDA1MTRkM2RjZjYwLi45ZDRlNGQzMjFiZGEgMTAwNjQ0Cj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmMKPj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0uYwo+Pj4gQEAgLTQ1OCw2ICs0NTgsMjMgQEAg
ZXh5bm9zX2RybV9nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsCj4+PiAgIAlpbnQgbnBhZ2VzOwo+Pj4gICAJaW50IHJldDsKPj4+ICAgCj4+IChPcHRpb25h
bCkgY291bGQgeW91IGxlYXZlIG9uZSBjb21tZW50IGhlcmU/Cj4+IGkuZS4sIC8qIENoZWNrIGlm
IERNQSBtZW1vcnkgcmVnaW9uIGZyb20gYSBleHBvcnRlciBhcmUgbWFwcGVkIGNvbnRpZ3VvdXNs
eSBvciBub3QuICovCj4gCj4gT2theS4KPiAKPj4+ICsJaWYgKHNndC0+bmVudHMgIT0gMSkgewo+
PiBIb3cgYWJvdXQgdXNpbmcgYmVsb3cgY29uZGl0aW9uIGluc3RlYWQ/Cj4+IGlmIChzZ3QtPm5l
bnRzID4gMCkgewo+IAo+IFRoaXMgaXMgbm90IHRoZSBzYW1lLiBNeSBjaGVjayBmb3IgIT0gMSBp
cyBpbnRlbmRlZC4gQ2hlY2tpbmcgY29udGlndWl0eSAKPiBvZiB0aGUgc2NhdHRlcmxpc3QgaWYg
aXQgaGFzIG9ubHkgMSBlbGVtZW50IGRvZXNuJ3QgaGF2ZSBtdWNoIHNlbnNlLgoKT29wcyBzb3Jy
eS4gTXkgaW50ZW50aW9uIHdhcyAnaWYgKHNndC0+bmVudHMgPiAxKScgYmVjYXVzZSBpZiAoc2d0
LT5uZW50cyAhPSAxKSBhbGxvd3MKLSBzZ3QtPm5lbnRzIDwgMQotIHNndC0+bmVudHMgPiAxCgpJ
IHRoaW5rIHRoZSBjaGVja2luZyB3b3VsZCBiZSB2YWxpZCBvbmx5IGluIGNhc2Ugb2YgaGF2aW5n
IG11bHRpcGxlIGVudHJpZXMgLSBzZ3QtPm5lbnRzID4gMS4KClRoYW5rcywKSW5raSBEYWUKCj4g
Cj4+PiArCQlkbWFfYWRkcl90IG5leHRfYWRkciA9IHNnX2RtYV9hZGRyZXNzKHNndC0+c2dsKTsK
Pj4+ICsJCXN0cnVjdCBzY2F0dGVybGlzdCAqczsKPj4+ICsJCXVuc2lnbmVkIGludCBpOwo+Pj4g
Kwo+Pj4gKwkJZm9yX2VhY2hfc2coc2d0LT5zZ2wsIHMsIHNndC0+bmVudHMsIGkpIHsKPj4+ICsJ
CQlpZiAoIXNnX2RtYV9sZW4ocykpCj4+PiArCQkJCWNvbnRpbnVlOwo+PiBJc24ndCBpdCBhbiBl
cnJvciBjYXNlIGlmIHNnX2RtYV9sZW4ocykgaXMgMD8gSSB0aGluayBsZW5ndGggb2YgcyBpcyAw
IHRoZW4gaXQgd291bGQgYmUgaW52YWxpZCBiZWNhdXNlIGFsbCBlbnRyaWVzIG9mIHNndCBzaG91
bGQgYmUgbWFwcGVkIGJlZm9yZSBzZ19kbWFfbGVuKCkgaXMgY2FsbGVkLgo+IAo+IFdlbGwsIGl0
IGlzIGEgZ3JleSBhcmVhLiBTb21lIGNvZGUgaW5jb3JyZWN0bHkgc2V0cyBuZW50cyBhcyBvcmln
X25lbnRzLCAKPiB0aHVzIHRoaXMgdmVyc2lvbiBpcyBzaW1wbHkgc2FmZSBmb3IgYm90aCBhcHBy
b2FjaGVzLiBzZyBlbnRyaWVzIHVudXNlZCAKPiBmb3IgRE1BIGNodW5rcyBoYXZlIHNnX2RtYV9s
ZW4oKSA9PSAwLgo+IAo+IFRoZSBhYm92ZSBjaGVjayBpcyBtb3JlIG9yIGxlc3MgY29waWVkIGZy
b20gCj4gZHJtX2dlbV9jbWFfcHJpbWVfaW1wb3J0X3NnX3RhYmxlKCkgKGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtX2NtYV9oZWxwZXIuYykuCj4gCj4gQmVzdCByZWdhcmRzCj4gCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2753B21E46C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 02:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB6D6E85B;
	Tue, 14 Jul 2020 00:22:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73E36E85B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 00:22:16 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200714002214epoutp010005cf7478fe052f47c5cf052ee69d16~hdpci1hWB1707017070epoutp01b
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 00:22:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200714002214epoutp010005cf7478fe052f47c5cf052ee69d16~hdpci1hWB1707017070epoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594686134;
 bh=AgsE0+XswZ7hYE3JDCUW8hh6WbLrJaftKzeFkqjIQNc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=S1Oj3K94TJrnETjy52/DjVbt7LfqpNgWVRxb0grCGRIDPHdMgA1Csu5RNNmUJoiRq
 U3Bxn5PMP5MlIJJe/ETRUf/60smNPGqV3F6CldFttPOM9SF8vR9bqpG72s6Ngzm7P8
 bnXP89jtuPtgYq9g0aYAGOQwBaEgDi3wfNHmLw1M=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200714002212epcas1p35e688c85a1bc2e40955499da2ad93762~hdpa_V2Q20085300853epcas1p3M;
 Tue, 14 Jul 2020 00:22:12 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.155]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4B5Lmt1FkXzMqYks; Tue, 14 Jul
 2020 00:22:06 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 53.20.29173.DAAFC0F5; Tue, 14 Jul 2020 09:22:06 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200714002205epcas1p44e1d003b5d60efb8148aa596e4cb8d38~hdpT_7pW_0618706187epcas1p48;
 Tue, 14 Jul 2020 00:22:05 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200714002205epsmtrp12dcbda1e4b1cf55e988bbf32359607c9~hdpT_Dzcp2665626656epsmtrp1d;
 Tue, 14 Jul 2020 00:22:05 +0000 (GMT)
X-AuditID: b6c32a37-9cdff700000071f5-30-5f0cfaad2f95
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 E6.EE.08382.DAAFC0F5; Tue, 14 Jul 2020 09:22:05 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200714002205epsmtip2cb49aa13a900bde1e88c05781c20e6dc~hdpTrN5q12212122121epsmtip28;
 Tue, 14 Jul 2020 00:22:05 +0000 (GMT)
Subject: Re: [PATCH v7 07/36] drm: exynos: use common helper for a
 scatterlist contiguity check
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <90332e7a-aa0e-3dd9-91cc-cdf87533f403@samsung.com>
Date: Tue, 14 Jul 2020 09:28:04 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200619103636.11974-8-m.szyprowski@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPJsWRmVeSWpSXmKPExsWy7bCmru66XzzxBtsOMVn0njvJZLFxxnpW
 i//bJjJbXPn6ns1i5eqjTBYL9ltbfLnykMli0+NrrBaXd81hs5hxfh+Txdojd9ktDn54wmox
 Y/JLNgdejzXz1jB67P22gMVj+7cHrB73u48zeWxeUu9x+99jZo/JN5Yzeuy+2cDm0bdlFaPH
 501yAVxR2TYZqYkpqUUKqXnJ+SmZeem2St7B8c7xpmYGhrqGlhbmSgp5ibmptkouPgG6bpk5
 QLcrKZQl5pQChQISi4uV9O1sivJLS1IVMvKLS2yVUgtScgosC/SKE3OLS/PS9ZLzc60MDQyM
 TIEKE7Izvm6/zVrQz1sxdcs1xgbGU1xdjBwcEgImEt/fKXYxcnEICexglFjQeZ8dwvnEKPFu
 +QdmCOcbo8SNd99Yuxg5wTombZzECpHYyyix4m07lPOeUeL8uwYmkCphgUSJ3pP32EBsEYEt
 jBLNU91AipgFdjBJXPq+mQUkwSagKjFxxX2wIl4BO4kTz3rBbBag+O+X28EGiQpESBzvnswO
 USMocXLmE7BeTqD6z3cOg8WZBcQlbj2ZzwRhy0s0b50NdreEwB0OiZVPD7JA3O0isfToPSYI
 W1ji1fEt7BC2lMTL/jZ2iIZmRomJM04zQTgdjBJ3H1+H6jaW2L90MhMozJgFNCXW79KHCCtK
 7Pw9lxFiM5/Eu689rJBg5ZXoaBOCKFGSOHbxBiOELSFxYclENgjbQ+LMvTksExgVZyH5bRaS
 f2Yh+WcWwuIFjCyrGMVSC4pz01OLDQuMkeN7EyM4ZWuZ72Cc9vaD3iFGJg7GQ4wSHMxKIrzR
 opzxQrwpiZVVqUX58UWlOanFhxhNgaE9kVlKNDkfmDXySuINTY2MjY0tTAzNTA0NlcR5/51l
 jxcSSE8sSc1OTS1ILYLpY+LglGpgMmsJ0Sl14Z1fkuCx/uupRzZOV22fp9/ldG6YfyPbaJHB
 LIlJ70ViIpffWqArahhyIrHxg2fO/c/vVz+02qqzkmvJ548P/rBJxOrzqjyS1/1xl0dDo+1d
 7CLt8hV31Brm7w2unu/J6/nq3jNHtcaePzPWT/qUVC+x2kJH1yz7+9+j09eKxDloylY/4W7b
 43Xh1GFzW7klwnqzvdIzKn7Nv/H79hbRycJaZoyO5Y/OrJJf9NXriRnTdyvfWaxOOjVN6r8F
 2DpX3l0tGCNcovxcuGx7RnWNYb3IMf931498WZbT47ik7Icnx/tNffsjbuqtu3bylvjear4E
 7ZNP91l96mZrfse38eHdhimKTnL/lViKMxINtZiLihMBA/4EPWIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsWy7bCSvO7aXzzxBvdn8Fr0njvJZLFxxnpW
 i//bJjJbXPn6ns1i5eqjTBYL9ltbfLnykMli0+NrrBaXd81hs5hxfh+Txdojd9ktDn54wmox
 Y/JLNgdejzXz1jB67P22gMVj+7cHrB73u48zeWxeUu9x+99jZo/JN5Yzeuy+2cDm0bdlFaPH
 501yAVxRXDYpqTmZZalF+nYJXBlft99mLejnrZi65RpjA+Mpri5GTg4JAROJSRsnsXYxcnEI
 CexmlFh0qhnI4QBKSEhs2coBYQpLHD5cDFHyllFix8FNzCC9wgKJErNvnmcCSYgIbGGUeLbi
 MCOIwyywg0li+75/TBAtRxkl7jyZAdbCJqAqMXHFfTYQm1fATuLEs14wmwUo/vvldiYQW1Qg
 QqLl/h92iBpBiZMzn7CA2JxA9Z/vHAaLMwuoS/yZd4kZwhaXuPVkPhOELS/RvHU28wRGoVlI
 2mchaZmFpGUWkpYFjCyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1kvNzNzGCY1RLcwfj9lUf
 9A4xMnEwHmKU4GBWEuGNFuWMF+JNSaysSi3Kjy8qzUktPsQozcGiJM57o3BhnJBAemJJanZq
 akFqEUyWiYNTqoFJR+LXCl32zauNDyjL++d/er9MatoFiXm+k+z0fbRqEutuz+ytnrJe1OuP
 2ZsIlihrjTdH2ab3B2dNbKjbcfaBsx5fAZ/rKe7bTvxsl35KXUxeXdV9e0N/1puAKMvT/Id+
 uzP/qL4ub/P+kbygxumV+/a2FMWcPKRge6qTQ1B9j1C1XJnPp5aVl++cjNHIfG5xPGSu6Ka3
 PjdOPOM/vzJq6XmhjZ/6G3+4hqRv5JIOXiemueP46vy4V7lzjz2PdJ1mdZbNacnelLsJ2c/f
 6foEtH7lkrKapFyhfOqxc+sUNb4fdXWfH1jw7b54ZnPAcyc5Q82fLVKlTBN/7efve6N0/DOj
 LCe3UW9+Gt/BV01KLMUZiYZazEXFiQAuYyq3QAMAAA==
X-CMS-MailID: 20200714002205epcas1p44e1d003b5d60efb8148aa596e4cb8d38
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200619103657eucas1p24bff92408adbd4715130fb47595a6187
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103657eucas1p24bff92408adbd4715130fb47595a6187@eucas1p2.samsung.com>
 <20200619103636.11974-8-m.szyprowski@samsung.com>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgoyMC4gNi4gMTkuIOyYpO2bhCA3OjM27JeQIE1hcmVrIFN6eXByb3dza2kg7J20KOqwgCkg7JO0
IOq4gDoKPiBVc2UgY29tbW9uIGhlbHBlciBmb3IgY2hlY2tpbmcgdGhlIGNvbnRpZ3VpdHkgb2Yg
dGhlIGltcG9ydGVkIGRtYS1idWYuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5cHJvd3Nr
aSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgoKQWNrZWQtYnkgOiBJbmtpIERhZSA8aW5raS5k
YWVAc2Ftc3VuZy5jb20+CgpUaGFua3MsCklua2kgRGFlCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmMgfCAyMyArKystLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5jIGIvZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5jCj4gaW5kZXggZWZhNDc2ODU4ZGI1
Li4xNzE2YTAyM2JjYTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlu
b3NfZHJtX2dlbS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dl
bS5jCj4gQEAgLTQzMSwyNyArNDMxLDEwIEBAIGV4eW5vc19kcm1fZ2VtX3ByaW1lX2ltcG9ydF9z
Z190YWJsZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAo+ICB7Cj4gIAlzdHJ1Y3QgZXh5bm9zX2Ry
bV9nZW0gKmV4eW5vc19nZW07Cj4gIAo+IC0JaWYgKHNndC0+bmVudHMgPCAxKQo+ICsJLyogY2hl
Y2sgaWYgdGhlIGVudHJpZXMgaW4gdGhlIHNnX3RhYmxlIGFyZSBjb250aWd1b3VzICovCj4gKwlp
ZiAoZHJtX3ByaW1lX2dldF9jb250aWd1b3VzX3NpemUoc2d0KSA8IGF0dGFjaC0+ZG1hYnVmLT5z
aXplKSB7Cj4gKwkJRFJNX0VSUk9SKCJidWZmZXIgY2h1bmtzIG11c3QgYmUgbWFwcGVkIGNvbnRp
Z3VvdXNseSIpOwo+ICAJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwo+IC0KPiAtCS8qCj4gLQkg
KiBDaGVjayBpZiB0aGUgcHJvdmlkZWQgYnVmZmVyIGhhcyBiZWVuIG1hcHBlZCBhcyBjb250aWd1
b3VzCj4gLQkgKiBpbnRvIERNQSBhZGRyZXNzIHNwYWNlLgo+IC0JICovCj4gLQlpZiAoc2d0LT5u
ZW50cyA+IDEpIHsKPiAtCQlkbWFfYWRkcl90IG5leHRfYWRkciA9IHNnX2RtYV9hZGRyZXNzKHNn
dC0+c2dsKTsKPiAtCQlzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnM7Cj4gLQkJdW5zaWduZWQgaW50IGk7
Cj4gLQo+IC0JCWZvcl9lYWNoX3NnKHNndC0+c2dsLCBzLCBzZ3QtPm5lbnRzLCBpKSB7Cj4gLQkJ
CWlmICghc2dfZG1hX2xlbihzKSkKPiAtCQkJCWJyZWFrOwo+IC0JCQlpZiAoc2dfZG1hX2FkZHJl
c3MocykgIT0gbmV4dF9hZGRyKSB7Cj4gLQkJCQlEUk1fRVJST1IoImJ1ZmZlciBjaHVua3MgbXVz
dCBiZSBtYXBwZWQgY29udGlndW91c2x5Iik7Cj4gLQkJCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFM
KTsKPiAtCQkJfQo+IC0JCQluZXh0X2FkZHIgPSBzZ19kbWFfYWRkcmVzcyhzKSArIHNnX2RtYV9s
ZW4ocyk7Cj4gLQkJfQo+ICAJfQo+ICAKPiAgCWV4eW5vc19nZW0gPSBleHlub3NfZHJtX2dlbV9p
bml0KGRldiwgYXR0YWNoLT5kbWFidWYtPnNpemUpOwo+IApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29481D701A
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 07:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABFB36E1A2;
	Mon, 18 May 2020 05:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D63D89D3E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 05:06:49 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200518050648epoutp037783ed4d732e3658fb11a0a470714065~QBwoBeKyI2545325453epoutp03i
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 05:06:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200518050648epoutp037783ed4d732e3658fb11a0a470714065~QBwoBeKyI2545325453epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589778408;
 bh=Bp5I1F2Ajf/Bh+H2f2+WeV8B2kaK+qhwKng13/0okfc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=iEJ9EqMf9IsAc0a7vEQAHdaSjRc1SFaHUAC85UJCdvD/4D1sK0BuUIB2NtJIDbe2l
 UWrKkYMi8UvpN7DiEbPnMej+2x34b6Ky1oBOsN2g/X+LcgkWg/TCv798StZ2CJDyOm
 G3BHgjLa8PiPrILJPt4X/Nm0taHBMB7fyuCjB864=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200518050647epcas1p19676e935ccaf38bb210f54e5c4fc8db8~QBwnuZqR72284222842epcas1p11;
 Mon, 18 May 2020 05:06:47 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.156]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 49QRnd3JvVzMqYkc; Mon, 18 May
 2020 05:06:45 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 5E.52.04648.0E712CE5; Mon, 18 May 2020 14:06:40 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200518050640epcas1p325ad883956af656e26788e218539fb10~QBwgt77H31440014400epcas1p3V;
 Mon, 18 May 2020 05:06:40 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200518050640epsmtrp1012dfafa0e7a3718f1bff1c5daab3d98~QBwgsoNhY2312723127epsmtrp1f;
 Mon, 18 May 2020 05:06:40 +0000 (GMT)
X-AuditID: b6c32a37-1f3ff70000001228-69-5ec217e04a1e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 91.54.25866.0E712CE5; Mon, 18 May 2020 14:06:40 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200518050639epsmtip2c1f13627263c081c8c4347b6fc012ea1~QBwghwXnE1300013000epsmtip2X;
 Mon, 18 May 2020 05:06:39 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: mixer: Fix enabling of the runtime power
 management
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <0d14cec1-9c24-4e31-ca86-9f90bc1efde0@samsung.com>
Date: Mon, 18 May 2020 14:12:00 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200514100812.17043-1-m.szyprowski@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmge4D8UNxBjtfKVvcWneO1WLjjPWs
 Fle+vmezmHF+H5PF2iN32S1mTH7J5sDmcb/7OJNH35ZVjB6fN8kFMEdl22SkJqakFimk5iXn
 p2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA7VVSKEvMKQUKBSQWFyvp29kU
 5ZeWpCpk5BeX2CqlFqTkFFgW6BUn5haX5qXrJefnWhkaGBiZAhUmZGfcmvqPveAFT8WDHYeY
 GxiPcnUxcnJICJhIHJ17lbmLkYtDSGAHo8SB3zehnE+MEkv77rJAOJ8ZJdau/cQC09IxdwUb
 iC0ksItR4vWVAIii94wSZ+dfZwVJCAuESZw8/RfMFhEolZj7/xg7iM0s0A406Xg8iM0moCox
 ccV9sEG8AnYSqyatAqtnAYq/etwBFOfgEBWIkDj9NRGiRFDi5MwnYDdwApV/6L7NCDFSXOLW
 k/lMELa8RPPW2cwQd35ll5hz3g/CdpG4daiPDcIWlnh1fAs7hC0l8bK/jR3kfgmBZkaJiTNO
 M0E4HYwSdx9fh/rYWGL/0slMIAcxC2hKrN+lDxFWlNj5ey7UEXwS7772sIKUSAjwSnS0CUGU
 KEkcu3iDEcKWkLiwZCLUDR4S11tus05gVJyF5LVZSN6ZheSdWQiLFzCyrGIUSy0ozk1PLTYs
 MEaO7E2M4CSpZb6DccM5n0OMAhyMSjy8F6IOxgmxJpYVV+YeYpTgYFYS4Y38vC9OiDclsbIq
 tSg/vqg0J7X4EKMpMOAnMkuJJucDE3heSbyhqZGxsbGFiaGZqaGhkjjv1Os5cUIC6Yklqdmp
 qQWpRTB9TBycUg2MJbyujOx/ppwszT3jcvyX66QfLZFvrxR8EVPZudSvZdmlps8qjTZz7mxI
 O3KqrSBCaN9jf2UDJ5PdOd7Tzk1MvMy6vuj5trtucvKWK1Jq6i9Ey99v83qmlftd6mZDrXaZ
 4ry6S881rYMnb3IoSTYUP7V7tUKs69P/qrUVBe57pUTTzax/i61WYinOSDTUYi4qTgQANJ/x
 cqgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBLMWRmVeSWpSXmKPExsWy7bCSvO4D8UNxBj0dbBa31p1jtdg4Yz2r
 xZWv79ksZpzfx2Sx9shddosZk1+yObB53O8+zuTRt2UVo8fnTXIBzFFcNimpOZllqUX6dglc
 Gbem/mMveMFT8WDHIeYGxqNcXYycHBICJhIdc1ewdTFycQgJ7GCU+Pz9B1MXIwdQQkJiy1YO
 CFNY4vDhYoiSt4wS0zZ9YgfpFRYIkzh5+i8riC0iUCrxqv8+I0gRs0A7o8SRfR3sEB0TGSVm
 ntnIBFLFJqAqMXHFfTYQm1fATmLVpFVg3SxA8VePO8DiogIREs+332CEqBGUODnzCQuIzQlU
 /6H7NlicWUBd4s+8S8wQtrjErSfzmSBseYnmrbOZJzAKzULSPgtJyywkLbOQtCxgZFnFKJla
 UJybnltsWGCUl1quV5yYW1yal66XnJ+7iREcGVpaOxj3rPqgd4iRiYPxEKMEB7OSCG/k531x
 QrwpiZVVqUX58UWlOanFhxilOViUxHm/zloYJySQnliSmp2aWpBaBJNl4uCUamBiPrhl+Zd7
 Cm/WK8zZ4N1tcjrsgcuxOdP3BTQ/V7+ybZ+Dg+5JlbX3NN56zJ6tqsbdy7TyY/gFq+RFUteq
 64KSD0gHJiTEMJ9m2FW3XM5efa3C+ePLVao9SsT35ke2T+yy1PkRFsB9umZnYkSokFt56aVu
 qeD7kxgT/i1V4NSqy+Sp6Ltj97rM2s4yKDc3VlLgSNu3Yq8ts+56XV7RPN+01/Zu3tX9rmvq
 vujqH9DJTDG3C13MuSA1WEu9mLvtcNHGRQdLFbOZKsUyPTsVRVa+52aX/S7MlB7y5k9O13PZ
 CYbR7JpTf5/9EnTigAzb3iKbiJUrFlTGMjiGdn2Vv6T8+Mwvr/kxKXcYpUt/KbEUZyQaajEX
 FScCAJqDwC77AgAA
X-CMS-MailID: 20200518050640epcas1p325ad883956af656e26788e218539fb10
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200514100812eucas1p1d42ad25e93858a4bc801049f93f58250
References: <CGME20200514100812eucas1p1d42ad25e93858a4bc801049f93f58250@eucas1p1.samsung.com>
 <20200514100812.17043-1-m.szyprowski@samsung.com>
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

SGkgTWFyZWssCgoyMC4gNS4gMTQuIOyYpO2bhCA3OjA47JeQIE1hcmVrIFN6eXByb3dza2kg7J20
KOqwgCkg7JO0IOq4gDoKPiBSdW50aW1lIHBvd2VyIG1hbmFnZW1lbnQgaXMgZXNzZW50aWFsIGZv
ciB0aGUgRXh5bm9zIE1peGVyIGRyaXZlcgo+IG9wZXJhdGlvbi4gSXQgc2hvdWxkIGJlIGVuYWJs
ZWQgYmVmb3JlIGFkZGluZyBpdHMgRFJNIGNvbXBvbmVudCwgYmVjYXVzZQo+IGluIHNvbWUgY2Fz
ZXMgKHdoZW4gZGVmZXJyZWQgcHJvYmUgdGFrZXMgcGxhY2UgZHVlIHRvIHRoZSBJT01NVQo+IGF2
YWlsYWJpbGl0eSkgdGhlIERSTSBkcml2ZXIgbWlnaHQgYmUgaW5pdGlhbGl6ZWQgZGlyZWN0bHkg
ZnJvbSB0aGUKPiBNaXhlcidzIGNvbXBvbmVudF9hZGQoKSBjYWxsLCB3aGF0IHJlc3VsdHMgaW4g
c3RhcnRpbmcgdGhlIGRyaXZlcgo+IG9wZXJhdGlvbiB3aXRob3V0IGVuYWJsaW5nIHRoZSBydW50
aW1lIHBvd2VyIG1hbmFnZW1lbnQuCgpTZWVtcyBiZXR0ZXIgdG8gY2hhbmdlIGNhbGwgb3JkZXIg
b2YgbWl4ZXJfcmVtb3ZlIGZ1bmN0aW9uIGxpa2UgYmVsb3cgYmVjYXVzZSB5b3UgY2hhbmdlZCB0
aGUgb25lIG9mIHByb2JlIGZ1bmN0aW9uLgpzdGF0aWMgaW50IG1peGVyX3JlbW92ZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQp7Cgljb21wb25lbnRfZGVsKCZwZGV2LT5kZXYsICZtaXhl
cl9jb21wb25lbnRfb3BzKTsKCglwbV9ydW50aW1lX2Rpc2FibGUoJnBkZXYtPmRldik7Cn0KCkl0
J3MgYSB0cml2aWFsIHRoaW5nIGFuZCBpdCB3b3VsZCBiZSBubyBwcm9ibGVtIGFzLWlzIC0gd2Ug
ZG9uJ3QgdG91Y2ggSFcgaW4gdW5iaW5kIC0gc28gcGlja2VkIGl0IHVwLgoKVGhhbmtzLApJbmtp
IERhZQoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lA
c2Ftc3VuZy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX21peGVy
LmMgfCA2ICsrKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19t
aXhlci5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfbWl4ZXIuYwo+IGluZGV4IGZm
YmY0YTk1MGY2OS4uODI5ZDJjZTc1NjBkIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX21peGVyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19taXhlci5jCj4gQEAgLTEyMDAsOSArMTIwMCwxMSBAQCBzdGF0aWMgaW50IG1peGVyX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAo+ICAJcGxhdGZvcm1fc2V0X2RydmRh
dGEocGRldiwgY3R4KTsKPiAgCj4gKwlwbV9ydW50aW1lX2VuYWJsZShkZXYpOwo+ICsKPiAgCXJl
dCA9IGNvbXBvbmVudF9hZGQoJnBkZXYtPmRldiwgJm1peGVyX2NvbXBvbmVudF9vcHMpOwo+IC0J
aWYgKCFyZXQpCj4gLQkJcG1fcnVudGltZV9lbmFibGUoZGV2KTsKPiArCWlmIChyZXQpCj4gKwkJ
cG1fcnVudGltZV9kaXNhYmxlKGRldik7Cj4gIAo+ICAJcmV0dXJuIHJldDsKPiAgfQo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

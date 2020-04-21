Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4801B1FE7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 09:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F15E889F2E;
	Tue, 21 Apr 2020 07:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B1D89F08
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 07:33:11 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20200421073309epoutp012062bd83dc9b9ccc257361f1fb1f9887~HxVtZmJ8a2960929609epoutp01E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 07:33:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20200421073309epoutp012062bd83dc9b9ccc257361f1fb1f9887~HxVtZmJ8a2960929609epoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587454389;
 bh=w3SuRjmp4aPVFd3nozM+GUtICtrjtgJnASmke3odM+0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=owgn6QwXSTq8eZYtYUdgqsLDv5RxaBKvlzc3sOsC//Vdd5IaRpCph0VuXF5Gjuixj
 hZ3mteLcdeY6vUxJNnt9OrXnK5sbJttlNUV/tNrZkI+37/KX9/zGfmW8tNjNnn7ZiO
 mID0Syj+if8GfuWgnI3TLNbJVs8wuFYX8CbZB8w4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200421073309epcas1p37b3d70a955937438bb6b88125a48d36d~HxVtH58GH2619926199epcas1p3R;
 Tue, 21 Apr 2020 07:33:09 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.156]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 495wJy2lDfzMqYkX; Tue, 21 Apr
 2020 07:33:06 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 1C.1D.04658.1B1AE9E5; Tue, 21 Apr 2020 16:33:05 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200421073304epcas1p10ac96bd66cc4c51c858e6801c7f3cfed~HxVonecv-2152721527epcas1p1c;
 Tue, 21 Apr 2020 07:33:04 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200421073304epsmtrp10de5cac3ce9a3395f963bcc1970e45c1~HxVompD2c0817708177epsmtrp1-;
 Tue, 21 Apr 2020 07:33:04 +0000 (GMT)
X-AuditID: b6c32a39-a81ff70000001232-64-5e9ea1b15b35
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 11.92.04158.0B1AE9E5; Tue, 21 Apr 2020 16:33:04 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200421073304epsmtip27c72ebfc4878b4da10262529a875c41f~HxVocplS22282922829epsmtip2f;
 Tue, 21 Apr 2020 07:33:04 +0000 (GMT)
Subject: Re: [PATCH 2/3] drm/exynos: gem: Rework scatter-list contiguity
 check on Prime import
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <92cffe01-7a14-8fbd-90a3-dc171884c26d@samsung.com>
Date: Tue, 21 Apr 2020 16:38:04 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200407134256.9129-3-m.szyprowski@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRmVeSWpSXmKPExsWy7bCmru7GhfPiDDY/5rO4te4cq8XGGetZ
 La58fc9mMeP8PiaLtUfuslvMmPySzYHN4373cSaPvi2rGD0+b5ILYI7KtslITUxJLVJIzUvO
 T8nMS7dV8g6Od443NTMw1DW0tDBXUshLzE21VXLxCdB1y8wB2qukUJaYUwoUCkgsLlbSt7Mp
 yi8tSVXIyC8usVVKLUjJKbAs0CtOzC0uzUvXS87PtTI0MDAyBSpMyM449fkLe8Fd0Yr7DQIN
 jH2CXYycHBICJhLXDjxg72Lk4hAS2MEocf9ZNzOE84lR4vbnTqjMN0aJnQePs8G0XNkHU7WX
 UaJ5yiyoqveMEuvav7N0MXJwCAskSJzYrQPSICJQKjH3/zF2EJtZoJ1RYu3xeBCbTUBVYuKK
 +2BDeQXsJF4sucsCYrMAxR82X2MFGSMqECFx+msiRImgxMmZT8BKOAVsJfqObWKBGCkucevJ
 fCYIW16ieetssNskBM6wSXS+uccIcbSLxJLrb5ghbGGJV8e3sEPYUhIv+9vYIRqaGSUmzjjN
 BOF0MErcfXydBaLKWGL/0slMIBcxC2hKrN+lDxFWlNj5ey4jxGY+iXdfe8COlhDglehoE4Io
 UZI4dvEG1A0SEheWTIQGoofEwal9LBMYFWch+W0Wkn9mIflnFsLiBYwsqxjFUguKc9NTiw0L
 TJEjexMjOElqWe5gPHbO5xCjAAejEg/vBrF5cUKsiWXFlbmHGCU4mJVEeC20gEK8KYmVValF
 +fFFpTmpxYcYTYEhP5FZSjQ5H5jA80riDU2NjI2NLUwMzUwNDZXEeadez4kTEkhPLEnNTk0t
 SC2C6WPi4JRqYKyccr7GPfHN5aeznRKPva0Ucs6SyBRPkjZav/5Va+QJsfNv3mb+PFmwYfvi
 BC2tV4cr7TYF7ZppnVPSon187ZFAo9q/M04F6eeZx67LzM1TnLntiPRyS0HjiNiFz84Zvymu
 V7NfYlbsv1M761vpC+VHYQ7Pjf/Wzjm9PPO67TybN9/sWiVdCpVYijMSDbWYi4oTAbvCEImo
 AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMLMWRmVeSWpSXmKPExsWy7bCSvO6GhfPiDHo3q1jcWneO1WLjjPWs
 Fle+vmezmHF+H5PF2iN32S1mTH7J5sDmcb/7OJNH35ZVjB6fN8kFMEdx2aSk5mSWpRbp2yVw
 ZZz6/IW94K5oxf0GgQbGPsEuRk4OCQETiSv7upm7GLk4hAR2M0o8v3KdpYuRAyghIbFlKweE
 KSxx+HAxSLmQwFtGiesn3EFsYYEEicmnbjGC2CICpRKv+u8zgoxhFmhnlDiyr4MdYuZhRolt
 fRPYQarYBFQlJq64zwZi8wrYSbxYcpcFxGYBij9svsYKYosKREg8336DEaJGUOLkzCdgNZwC
 thJ9xzaB2cwC6hJ/5l1ihrDFJW49mc8EYctLNG+dzTyBUWgWkvZZSFpmIWmZhaRlASPLKkbJ
 1ILi3PTcYsMCo7zUcr3ixNzi0rx0veT83E2M4KjQ0trBeOJE/CFGAQ5GJR7eDWLz4oRYE8uK
 K3MPMUpwMCuJ8FpoAYV4UxIrq1KL8uOLSnNSiw8xSnOwKInzyucfixQSSE8sSc1OTS1ILYLJ
 MnFwSjUwiricXhAUfL4mceJ8lpeLZA/4me/56KJw6YLSHfsks6sJi1rfqfr4Ba63ncG1kGNV
 meQqs6iW0O1/3aPnyz0X6r3K9O5slGf0n9bmurm5rl8eXjvVZak9Y9Vf1U9sZWevMG7b9Sbq
 zLUPmsylxZapS+qaFkbG+MmvL9rx6VEQh1XIxaPR+2JPKbEUZyQaajEXFScCAPE40mWGAgAA
X-CMS-MailID: 20200421073304epcas1p10ac96bd66cc4c51c858e6801c7f3cfed
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada
References: <20200407134256.9129-1-m.szyprowski@samsung.com>
 <CGME20200407134314eucas1p1bfe654163e093db30c4a31bd9e1ccada@eucas1p1.samsung.com>
 <20200407134256.9129-3-m.szyprowski@samsung.com>
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

CgoyMC4gNC4gNy4g7Jik7ZuEIDEwOjQy7JeQIE1hcmVrIFN6eXByb3dza2kg7J20KOqwgCkg7JO0
IOq4gDoKPiBFeHBsaWNpdGx5IGNoZWNrIGlmIHRoZSBpbXBvcnRlZCBidWZmZXIgaGFzIGJlZW4g
bWFwcGVkIGFzIGNvbnRpZ3VvdXMgaW4KPiB0aGUgRE1BIGFkZHJlc3Mgc3BhY2UsIHdoYXQgaXMg
cmVxdWlyZWQgYnkgYWxsIEV4eW5vcyBEUk0gQ1JUQyBkcml2ZXJzLgo+IFdoaWxlIHRvdWNoaW5n
IHRoaXMsIHNldCBidWZmZXIgZmxhZ3MgZGVwZW5kaW5nIG9uIHRoZSBhdmFpbGFiaWxpdHkgb2YK
PiB0aGUgSU9NTVUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5cHJvd3NraSA8bS5zenlw
cm93c2tpQHNhbXN1bmcuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5v
c19kcm1fZ2VtLmMgfCAzNiArKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyNSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJt
L2V4eW5vcy9leHlub3NfZHJtX2dlbS5jCj4gaW5kZXggNDA1MTRkM2RjZjYwLi45ZDRlNGQzMjFi
ZGEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2dlbS5jCj4gQEAgLTQ1
OCw2ICs0NTgsMjMgQEAgZXh5bm9zX2RybV9nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsCj4gIAlpbnQgbnBhZ2VzOwo+ICAJaW50IHJldDsKPiAgCgooT3B0
aW9uYWwpIGNvdWxkIHlvdSBsZWF2ZSBvbmUgY29tbWVudCBoZXJlPwppLmUuLCAvKiBDaGVjayBp
ZiBETUEgbWVtb3J5IHJlZ2lvbiBmcm9tIGEgZXhwb3J0ZXIgYXJlIG1hcHBlZCBjb250aWd1b3Vz
bHkgb3Igbm90LiAqLyAKCj4gKwlpZiAoc2d0LT5uZW50cyAhPSAxKSB7CgpIb3cgYWJvdXQgdXNp
bmcgYmVsb3cgY29uZGl0aW9uIGluc3RlYWQ/CmlmIChzZ3QtPm5lbnRzID4gMCkgewoKPiArCQlk
bWFfYWRkcl90IG5leHRfYWRkciA9IHNnX2RtYV9hZGRyZXNzKHNndC0+c2dsKTsKPiArCQlzdHJ1
Y3Qgc2NhdHRlcmxpc3QgKnM7Cj4gKwkJdW5zaWduZWQgaW50IGk7Cj4gKwo+ICsJCWZvcl9lYWNo
X3NnKHNndC0+c2dsLCBzLCBzZ3QtPm5lbnRzLCBpKSB7Cj4gKwkJCWlmICghc2dfZG1hX2xlbihz
KSkKPiArCQkJCWNvbnRpbnVlOwoKSXNuJ3QgaXQgYW4gZXJyb3IgY2FzZSBpZiBzZ19kbWFfbGVu
KHMpIGlzIDA/IEkgdGhpbmsgbGVuZ3RoIG9mIHMgaXMgMCB0aGVuIGl0IHdvdWxkIGJlIGludmFs
aWQgYmVjYXVzZSBhbGwgZW50cmllcyBvZiBzZ3Qgc2hvdWxkIGJlIG1hcHBlZCBiZWZvcmUgc2df
ZG1hX2xlbigpIGlzIGNhbGxlZC4KClRoYW5rcywKSW5raSBEYWUKCj4gKwkJCWlmIChzZ19kbWFf
YWRkcmVzcyhzKSAhPSBuZXh0X2FkZHIpIHsKPiArCQkJCURSTV9FUlJPUigiYnVmZmVyIGNodW5r
cyBtdXN0IGJlIG1hcHBlZCBjb250aWd1b3VzbHkiKTsKPiArCQkJCXJldHVybiBFUlJfUFRSKC1F
SU5WQUwpOwo+ICsJCQl9Cj4gKwkJCW5leHRfYWRkciA9IHNnX2RtYV9hZGRyZXNzKHMpICsgc2df
ZG1hX2xlbihzKTsKPiArCQl9Cj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7Cj4gKwl9Cj4g
Kwo+ICAJZXh5bm9zX2dlbSA9IGV4eW5vc19kcm1fZ2VtX2luaXQoZGV2LCBhdHRhY2gtPmRtYWJ1
Zi0+c2l6ZSk7Cj4gIAlpZiAoSVNfRVJSKGV4eW5vc19nZW0pKSB7Cj4gIAkJcmV0ID0gUFRSX0VS
UihleHlub3NfZ2VtKTsKPiBAQCAtNDgwLDE4ICs0OTcsMTUgQEAgZXh5bm9zX2RybV9nZW1fcHJp
bWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAo+ICAJZXh5bm9z
X2dlbS0+c2d0ID0gc2d0Owo+ICAKPiAtCWlmIChzZ3QtPm5lbnRzID09IDEpIHsKPiAtCQkvKiBh
bHdheXMgcGh5c2ljYWxseSBjb250aW51b3VzIG1lbW9yeSBpZiBzZ3QtPm5lbnRzIGlzIDEuICov
Cj4gLQkJZXh5bm9zX2dlbS0+ZmxhZ3MgfD0gRVhZTk9TX0JPX0NPTlRJRzsKPiAtCX0gZWxzZSB7
Cj4gLQkJLyoKPiAtCQkgKiB0aGlzIGNhc2UgY291bGQgYmUgQ09OVElHIG9yIE5PTkNPTlRJRyB0
eXBlIGJ1dCBmb3Igbm93Cj4gLQkJICogc2V0cyBOT05DT05USUcuCj4gLQkJICogVE9ETy4gd2Ug
aGF2ZSB0byBmaW5kIGEgd2F5IHRoYXQgZXhwb3J0ZXIgY2FuIG5vdGlmeQo+IC0JCSAqIHRoZSB0
eXBlIG9mIGl0cyBvd24gYnVmZmVyIHRvIGltcG9ydGVyLgo+IC0JCSAqLwo+ICsJLyoKPiArCSAq
IEJ1ZmZlciBoYXMgYmVlbiBtYXBwZWQgYXMgY29udGlndW91cyBpbnRvIERNQSBhZGRyZXNzIHNw
YWNlLAo+ICsJICogYnV0IGlmIHRoZXJlIGlzIElPTU1VLCBpdCBjYW4gYmUgZWl0aGVyIENPTlRJ
RyBvciBOT05DT05USUcuCj4gKwkgKiBXZSBhc3N1bWUgYSBzaW1wbGlmaWVkIGxvZ2ljIGJlbG93
Ogo+ICsJICovCj4gKwlpZiAoaXNfZHJtX2lvbW11X3N1cHBvcnRlZChkZXYpKQo+ICAJCWV4eW5v
c19nZW0tPmZsYWdzIHw9IEVYWU5PU19CT19OT05DT05USUc7Cj4gLQl9Cj4gKwllbHNlCj4gKwkJ
ZXh5bm9zX2dlbS0+ZmxhZ3MgfD0gRVhZTk9TX0JPX0NPTlRJRzsKPiAgCj4gIAlyZXR1cm4gJmV4
eW5vc19nZW0tPmJhc2U7Cj4gIAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK

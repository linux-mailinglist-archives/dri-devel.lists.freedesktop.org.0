Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDA81B6F91
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 10:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4E46EA86;
	Fri, 24 Apr 2020 08:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED796EA86
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 08:10:07 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20200424081005epoutp035713ab9cca393585a47b93002c61b3d9~Isxzpp8_N1659016590epoutp03O
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 08:10:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20200424081005epoutp035713ab9cca393585a47b93002c61b3d9~Isxzpp8_N1659016590epoutp03O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1587715805;
 bh=A6VUgBxzrbnh+uERvwiTRs8jEFtlcgl/xVYDofAJoD4=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=ICCdAY1uO98/o7iUA+ZqYeiGeHquQ+QdC8AFfapvj2j52oDte2GWlUl6ZyqmNRbJG
 DVmWv0IPq1tWpETTjH5k03GgC0o8/NNXLKbBirFAS7mqJI+HiUbYlxWoOt7MazQUxW
 Sia5/zYLHtCcOBH3s4L3WOONiXLS6IrkcYrgQMGE=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200424081004epcas1p17de230ee0c0474e2a393983559fcab36~IsxyekpgO3124431244epcas1p1E;
 Fri, 24 Apr 2020 08:10:04 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.155]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 497n0C0ZwWzMqYly; Fri, 24 Apr
 2020 08:10:03 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 82.4F.04544.6DE92AE5; Fri, 24 Apr 2020 17:09:58 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200424080957epcas1p1cd91d0b2bdf474ff4308669f6fd677eb~Isxsu3pTM2580025800epcas1p1h;
 Fri, 24 Apr 2020 08:09:57 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200424080957epsmtrp160904a5e33f2743d8a96e33b5b27ed98~IsxsuLVlO1787117871epsmtrp1n;
 Fri, 24 Apr 2020 08:09:57 +0000 (GMT)
X-AuditID: b6c32a36-7ffff700000011c0-ec-5ea29ed6d9f6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 97.6A.25866.5DE92AE5; Fri, 24 Apr 2020 17:09:57 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200424080957epsmtip15a981c8ed33cd406f1abe61db5210885~Isxsh9hxm2307823078epsmtip1U;
 Fri, 24 Apr 2020 08:09:57 +0000 (GMT)
Subject: Re: [PATCH v2 2/3] drm/exynos: gem: rework scatter-list contiguity
 check on prime import
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <5688f66c-e83c-4741-34ee-2f02113f022a@samsung.com>
Date: Fri, 24 Apr 2020 17:15:00 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200422114059.29477-1-m.szyprowski@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGJsWRmVeSWpSXmKPExsWy7bCmnu61eYviDJrOiVncWneO1WLjjPWs
 Fle+vmezmHF+H5PF2iN32S1mTH7J5sDmcb/7OJNH35ZVjB6fN8kFMEdl22SkJqakFimk5iXn
 p2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA7VVSKEvMKQUKBSQWFyvp29kU
 5ZeWpCpk5BeX2CqlFqTkFFgW6BUn5haX5qXrJefnWhkaGBiZAhUmZGfM29bFWPBZpGLT/FUs
 DYyLBLoYOTkkBEwk9l1ez9TFyMUhJLCDUeLP3rPMEM4nRolZq++xQjifGSUa5+1lhWl5OeEl
 VMsuRolT376zgSSEBN4zSrx7Zw5iCwskS3SsugHWICJQKjH3/zF2EJtZoJ1RYu3xeBCbTUBV
 YuKK+2C9vAJ2ElMu9jCD2CxA8ZZ9e1m6GDk4RAUiJE5/TYQoEZQ4OfMJC4jNCVS+7cB8JoiR
 4hK3nsDY8hLNW2eDfSAh8JVd4uOLm1BHu0jMPnEByhaWeHV8CzuELSXxsr+NHaKhmVFi4ozT
 TBBOB6PE3cfXWSCqjCX2L53MBHIRs4CmxPpd+hBhRYmdv+cyQmzmk3j3tYcVpERCgFeio00I
 okRJ4tjFG4wQtoTEhSUT2SBsD4mjF3pYJjAqzkLy2ywk/8xC8s8shMULGFlWMYqlFhTnpqcW
 GxYYIcf2JkZwmtQy28G46JzPIUYBDkYlHt4bRQvjhFgTy4orcw8xSnAwK4nwxpQsihPiTUms
 rEotyo8vKs1JLT7EaAoM+YnMUqLJ+cAUnlcSb2hqZGxsbGFiaGZqaKgkzjv1ek6ckEB6Yklq
 dmpqQWoRTB8TB6dUA+Oezfo/bqyN9dRrfHGBzW9rnFr6I7aqRW8vbHN9L6gbuZFnxVT91NDZ
 qzY+F7FdPYn5tvbOyTZfQ+rLFZOzGma7HFQoUBXvjtignibgqDO51+rchno935Jz5v1pZbz/
 Cy965u2tkZ2WeMVObU2YdNrFXXIm/GYu/7v5X71fudMjPkKUOTxzlxJLcUaioRZzUXEiAKTv
 urupAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSnO7VeYviDP4uMbW4te4cq8XGGetZ
 La58fc9mMeP8PiaLtUfuslvMmPySzYHN4373cSaPvi2rGD0+b5ILYI7isklJzcksSy3St0vg
 ypi3rYux4LNIxab5q1gaGBcJdDFyckgImEi8nPCSqYuRi0NIYAejxNLdk4AcDqCEhMSWrRwQ
 prDE4cPFIOVCAm8ZJc595QSxhQWSJTpW3WAFsUUESiVe9d9nBBnDLNDOKHFkXwc7xMxjjBLP
 D95iAqliE1CVmLjiPhuIzStgJzHlYg8ziM0CFG/Zt5cFxBYViJB4vv0GI0SNoMTJmU/A4pxA
 9dsOzAebwyygLvFn3iVmCFtc4tYTmLi8RPPW2cwTGIVmIWmfhaRlFpKWWUhaFjCyrGKUTC0o
 zk3PLTYsMMpLLdcrTswtLs1L10vOz93ECI4LLa0djHtWfdA7xMjEwXiIUYKDWUmEN6ZkUZwQ
 b0piZVVqUX58UWlOavEhRmkOFiVx3q+zFsYJCaQnlqRmp6YWpBbBZJk4OKUamDJ+qJ194xDA
 Psn+5NNFvxsfXd65t1Pqzc58vdcC1qcLepr73rwL8P+TcXZn8MKMWddvyb68vLQi6OU24XUP
 /i+ffzPXhknSdOeZUJ97Qtq9fLX/ZR6wmvNsPFXLypd6KUa9Qn2X/rQ7HyPZtC1EGXv6E4x2
 eMk9P7VdZX3yLm2PtZPW/HvW+81lq2uNNVd201X37KNKVzP52z4aZdiJVZ/s7z+V/m9Jf87a
 0L1fNHmXFXZ/9eed7iD+/k1ltcCOxEqV67MvB798m9FmKNlxSv7wYrvJi1QKA9kNuhgfceV+
 YtzxTn9+tNAnMab2iOCjFxXdr24ovuHYsPl/hYLGIfe3gZ5RrKZ3Ki7ZLsm8rMRSnJFoqMVc
 VJwIALHzLOL6AgAA
X-CMS-MailID: 20200424080957epcas1p1cd91d0b2bdf474ff4308669f6fd677eb
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200422114110eucas1p2ef6b94864d6ad44af66855a9cb003a96
References: <4cfed490-e45c-e559-bfa3-c616e3c00029@samsung.com>
 <CGME20200422114110eucas1p2ef6b94864d6ad44af66855a9cb003a96@eucas1p2.samsung.com>
 <20200422114059.29477-1-m.szyprowski@samsung.com>
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

CgoyMC4gNC4gMjIuIOyYpO2bhCA4OjQw7JeQIE1hcmVrIFN6eXByb3dza2kg7J20KOqwgCkg7JO0
IOq4gDoKPiBFeHBsaWNpdGx5IGNoZWNrIGlmIHRoZSBpbXBvcnRlZCBidWZmZXIgaGFzIGJlZW4g
bWFwcGVkIGFzIGNvbnRpZ3VvdXMgaW4KPiB0aGUgRE1BIGFkZHJlc3Mgc3BhY2UsIHdoYXQgaXMg
cmVxdWlyZWQgYnkgYWxsIEV4eW5vcyBEUk0gQ1JUQyBkcml2ZXJzLgo+IFdoaWxlIHRvdWNoaW5n
IHRoaXMsIHNldCBidWZmZXIgZmxhZ3MgZGVwZW5kaW5nIG9uIHRoZSBhdmFpbGFiaWxpdHkgb2YK
PiB0aGUgSU9NTVUuCgpQaWNrZWQgaXQgdXAuCgpUaGFua3MsCklua2kgRGFlCgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KPiAt
LS0KPiB2MjoKPiAtIHJld29ya2VkIGEgY2hlY2sgZm9yIHNndC0+bmVudHMKPiAtIGFkZGVkIGEg
Y29tbWVudCBhYm91dCBhIHNjYXR0ZXItbGlzdCBjb250aWd1aXR5IGNoZWNrCj4gLSByZW1vdmVk
IGFkZGl0aW9uYWwgJ3JldHVybiBFUlJfUFRSKC1FSU5WQUwpJyBhY2NpZGVudGFseSBsZWZ0IGFm
dGVyIGRlYnVnZ2luZwo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1f
Z2VtLmMgfCA0MiArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fZ2VtLmMKPiBpbmRleCA0MDUxNGQzLi5mMTM2ZWZiIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0uYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nZW0uYwo+IEBAIC00NTgsNiArNDU4
LDI5IEBAIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqCj4gIAlpbnQgbnBhZ2VzOwo+ICAJaW50IHJl
dDsKPiAgCj4gKwlpZiAoc2d0LT5uZW50cyA8IDEpCj4gKwkJcmV0dXJuIEVSUl9QVFIoLUVJTlZB
TCk7Cj4gKwo+ICsJLyoKPiArCSAqIENoZWNrIGlmIHRoZSBwcm92aWRlZCBidWZmZXIgaGFzIGJl
ZW4gbWFwcGVkIGFzIGNvbnRpZ3VvdXMKPiArCSAqIGludG8gRE1BIGFkZHJlc3Mgc3BhY2UuCj4g
KwkgKi8KPiArCWlmIChzZ3QtPm5lbnRzID4gMSkgewo+ICsJCWRtYV9hZGRyX3QgbmV4dF9hZGRy
ID0gc2dfZG1hX2FkZHJlc3Moc2d0LT5zZ2wpOwo+ICsJCXN0cnVjdCBzY2F0dGVybGlzdCAqczsK
PiArCQl1bnNpZ25lZCBpbnQgaTsKPiArCj4gKwkJZm9yX2VhY2hfc2coc2d0LT5zZ2wsIHMsIHNn
dC0+bmVudHMsIGkpIHsKPiArCQkJaWYgKCFzZ19kbWFfbGVuKHMpKQo+ICsJCQkJYnJlYWs7Cj4g
KwkJCWlmIChzZ19kbWFfYWRkcmVzcyhzKSAhPSBuZXh0X2FkZHIpIHsKPiArCQkJCURSTV9FUlJP
UigiYnVmZmVyIGNodW5rcyBtdXN0IGJlIG1hcHBlZCBjb250aWd1b3VzbHkiKTsKPiArCQkJCXJl
dHVybiBFUlJfUFRSKC1FSU5WQUwpOwo+ICsJCQl9Cj4gKwkJCW5leHRfYWRkciA9IHNnX2RtYV9h
ZGRyZXNzKHMpICsgc2dfZG1hX2xlbihzKTsKPiArCQl9Cj4gKwl9Cj4gKwo+ICAJZXh5bm9zX2dl
bSA9IGV4eW5vc19kcm1fZ2VtX2luaXQoZGV2LCBhdHRhY2gtPmRtYWJ1Zi0+c2l6ZSk7Cj4gIAlp
ZiAoSVNfRVJSKGV4eW5vc19nZW0pKSB7Cj4gIAkJcmV0ID0gUFRSX0VSUihleHlub3NfZ2VtKTsK
PiBAQCAtNDgwLDE4ICs1MDMsMTUgQEAgc3RydWN0IGRybV9nZW1fb2JqZWN0ICoKPiAgCj4gIAll
eHlub3NfZ2VtLT5zZ3QgPSBzZ3Q7Cj4gIAo+IC0JaWYgKHNndC0+bmVudHMgPT0gMSkgewo+IC0J
CS8qIGFsd2F5cyBwaHlzaWNhbGx5IGNvbnRpbnVvdXMgbWVtb3J5IGlmIHNndC0+bmVudHMgaXMg
MS4gKi8KPiAtCQlleHlub3NfZ2VtLT5mbGFncyB8PSBFWFlOT1NfQk9fQ09OVElHOwo+IC0JfSBl
bHNlIHsKPiAtCQkvKgo+IC0JCSAqIHRoaXMgY2FzZSBjb3VsZCBiZSBDT05USUcgb3IgTk9OQ09O
VElHIHR5cGUgYnV0IGZvciBub3cKPiAtCQkgKiBzZXRzIE5PTkNPTlRJRy4KPiAtCQkgKiBUT0RP
LiB3ZSBoYXZlIHRvIGZpbmQgYSB3YXkgdGhhdCBleHBvcnRlciBjYW4gbm90aWZ5Cj4gLQkJICog
dGhlIHR5cGUgb2YgaXRzIG93biBidWZmZXIgdG8gaW1wb3J0ZXIuCj4gLQkJICovCj4gKwkvKgo+
ICsJICogQnVmZmVyIGhhcyBiZWVuIG1hcHBlZCBhcyBjb250aWd1b3VzIGludG8gRE1BIGFkZHJl
c3Mgc3BhY2UsCj4gKwkgKiBidXQgaWYgdGhlcmUgaXMgSU9NTVUsIGl0IGNhbiBiZSBlaXRoZXIg
Q09OVElHIG9yIE5PTkNPTlRJRy4KPiArCSAqIFdlIGFzc3VtZSBhIHNpbXBsaWZpZWQgbG9naWMg
YmVsb3c6Cj4gKwkgKi8KPiArCWlmIChpc19kcm1faW9tbXVfc3VwcG9ydGVkKGRldikpCj4gIAkJ
ZXh5bm9zX2dlbS0+ZmxhZ3MgfD0gRVhZTk9TX0JPX05PTkNPTlRJRzsKPiAtCX0KPiArCWVsc2UK
PiArCQlleHlub3NfZ2VtLT5mbGFncyB8PSBFWFlOT1NfQk9fQ09OVElHOwo+ICAKPiAgCXJldHVy
biAmZXh5bm9zX2dlbS0+YmFzZTsKPiAgCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=

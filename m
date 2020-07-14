Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6128121E469
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 02:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637936E85A;
	Tue, 14 Jul 2020 00:21:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F056E85A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 00:21:52 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200714002150epoutp04fab27c456a7589bc2fbb64b5429679c5~hdpGLkzTx2684826848epoutp04i
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 00:21:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200714002150epoutp04fab27c456a7589bc2fbb64b5429679c5~hdpGLkzTx2684826848epoutp04i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1594686110;
 bh=+mqRRzsx68sT5HNUBgxNUOcPMOMHNR+M/R+C4nGZ6Ho=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Y7ylizgD6w+6oPihFFA/4D6IyUm3HeyfMcztSHk6IFr/yT/ryoUx7RI80yQ+lTV5v
 7CZqAF7DM9jF1NCw8Q9p6GhcP5aVgtXZKE5XXul83GYVO3Ks9vUrm+y+suuxNmxeaV
 ZEIx3y4nzQ22hLRiEX9GwomyTgcdljpBroCXeYSk=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200714002150epcas1p2dc932b7ae2e53320fed7fa32b14cb4a1~hdpFrGRFr2100721007epcas1p2n;
 Tue, 14 Jul 2020 00:21:50 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.155]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4B5LmS2nRJzMqYkV; Tue, 14 Jul
 2020 00:21:44 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 8F.DF.29173.49AFC0F5; Tue, 14 Jul 2020 09:21:40 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200714002138epcas1p4e8c368ef787360733d5b129330a8dde4~hdo7DRUrM1996919969epcas1p46;
 Tue, 14 Jul 2020 00:21:38 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200714002138epsmtrp14bdc94481119d14744d2b8ed49b61304~hdo7CT-tm2665626656epsmtrp1K;
 Tue, 14 Jul 2020 00:21:38 +0000 (GMT)
X-AuditID: b6c32a37-f5587a80000071f5-b9-5f0cfa949ccc
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 FE.DE.08382.29AFC0F5; Tue, 14 Jul 2020 09:21:38 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200714002138epsmtip2e41830c74e5ea8f42d8189e90b25c568~hdo6zjyON2223922239epsmtip2r;
 Tue, 14 Jul 2020 00:21:38 +0000 (GMT)
Subject: Re: [PATCH v7 08/36] drm: exynos: fix common struct sg_table
 related issues
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <c57efc3e-2229-44df-f7a1-d3dce31213a0@samsung.com>
Date: Tue, 14 Jul 2020 09:27:34 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200619103636.11974-9-m.szyprowski@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNJsWRmVeSWpSXmKPExsWy7bCmvu7UXzzxBo+yLHrPnWSy2DhjPavF
 /20TmS2ufH3PZrFy9VEmiwX7rS2+XHnIZLHp8TVWi8u75rBZzDi/j8li7ZG77BYHPzxhtZgx
 +SWbA6/HmnlrGD32flvA4rH92wNWj/vdx5k8Ni+p97j97zGzx+Qbyxk9dt9sYPPo27KK0ePz
 JrkArqhsm4zUxJTUIoXUvOT8lMy8dFsl7+B453hTMwNDXUNLC3MlhbzE3FRbJRefAF23zByg
 05UUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUltkqpBSk5BZYFesWJucWleel6yfm5VoYGBkam
 QIUJ2Rlrp2xmLvgqUjG1x6yBcaZgFyMnh4SAicSRhYdZuhi5OIQEdjBKzHzcC+V8YpQ4/OoR
 lPONUeLtmtWMXYwcYC2H290g4nsZJabuXcMM4bxnlDjwYhIzSJGwQJjE9f/yICtEBLYwSjRP
 BWtgFtjBJHHp+2YWkASbgKrExBX32UBsXgE7icfPzoPZLEDxHYcWMoPYogIREse7J7ND1AhK
 nJz5BKyXE6h+4/8tYPXMAuISt57MZ4Kw5SWat84GO0hC4AaHRPeTZawQV7tIHG12hvhZWOLV
 8S3sELaUxMv+NnaI+mZGiYkzTjNBOB2MEncfX2eBqDKW2L90MhPIIGYBTYn1u/QhwooSO3/P
 ZYRYzCfx7msP1C5eiY42IYgSJYljF28wQtgSEheWTGSDsD0k/h+cxj6BUXEWktdmIXlnFpJ3
 ZiEsXsDIsopRLLWgODc9tdiwwBg5sjcxglO1lvkOxmlvP+gdYmTiYDzEKMHBrCTCGy3KGS/E
 m5JYWZValB9fVJqTWnyI0RQY2BOZpUST84HZIq8k3tDUyNjY2MLE0MzU0FBJnPffWfZ4IYH0
 xJLU7NTUgtQimD4mDk6pBqajLIWPmufenrZQ+teXB4wS1zijT3QceeX106H5pZPumnq21JyL
 U6TUre+yf7l0dZLoYbs5W+f67mGpf+wcVSe3Ov/IFMs+4x2cB+v/Lm5mn2UgKbRr56l/D11m
 l6zw3C9U+DBrbQ3zmZrMWP9ptS8vnVu5fkNgX+hX79+n7eYmJUvzvKq8Vbbt2NkJZUXvVbtD
 jmr9zp298YKps5FUMEtO//7S/ylMMY4q+l9YM9usQncqKrT//uGe1qy0+3Ogp82HN9yGCWdE
 IxffcT/uMSPwfNQ63oyXvBcEPs4S/XXuV/HJP4HPmEQk34jO31Fo6M+y6DlXh2a1QoiZqKXg
 Qr+CT8yTzaxEVNpqf3G+7VBiKc5INNRiLipOBABh9b7/XgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsWy7bCSvO6kXzzxBmemy1n0njvJZLFxxnpW
 i//bJjJbXPn6ns1i5eqjTBYL9ltbfLnykMli0+NrrBaXd81hs5hxfh+Txdojd9ktDn54wmox
 Y/JLNgdejzXz1jB67P22gMVj+7cHrB73u48zeWxeUu9x+99jZo/JN5Yzeuy+2cDm0bdlFaPH
 501yAVxRXDYpqTmZZalF+nYJXBlrp2xmLvgqUjG1x6yBcaZgFyMHh4SAicThdrcuRi4OIYHd
 jBKbX59hhohLSGzZygFhCkscPlwMUfKWUWL/gx/sXYycHMICYRInOm6ygiREBLYwSjxbcZgR
 xGEW2MEksX3fPyaIlqOMEleWTWAGaWETUJWYuOI+G4jNK2An8fjZeTCbBSi+49BCsBpRgQiJ
 lvt/2CFqBCVOznzCAmJzAtVv/L8FrJ5ZQF3iz7xLzBC2uMStJ/OZIGx5ieats5knMArNQtI+
 C0nLLCQts5C0LGBkWcUomVpQnJueW2xYYJiXWq5XnJhbXJqXrpecn7uJERyfWpo7GLev+qB3
 iJGJg/EQowQHs5IIb7QoZ7wQb0piZVVqUX58UWlOavEhRmkOFiVx3huFC+OEBNITS1KzU1ML
 UotgskwcnFINTCUbVLOOnnvgvlDOXm3jDymeRh7t30oW08/zdRR/3vC9KqDzmJzJ745p4uIX
 uM/nnecI6DXsae+ZLqEg0ZzVlarLudPQ8axCYqzQncTHWfrb757+JZbFsfdHX87JxXGbNnYo
 fnNgZa2v9lDm0Wm6UsoVu+3l01L/c8f6XykVJ4ictebZ9vDoLmGXo6V/n/gyTqwoqZrtdfHP
 3LteCz0kVLyjmkwlRWb+mmRZ7zyjks+vZPbkiPvNa5/cmWbeLiN/c/uVqW4uq3e0dVucseDp
 5miIr3eSqUqNDuYTCl925OmD1R9aozetu6BT87lhneKU7cwNFvandkYc/Gsdtn7z0o/H1E9P
 OpEhWPx6efVPJZbijERDLeai4kQAxeoWsD4DAAA=
X-CMS-MailID: 20200714002138epcas1p4e8c368ef787360733d5b129330a8dde4
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200619103658eucas1p1c3236e2de2798c2d8c02279a9263e9a9
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103658eucas1p1c3236e2de2798c2d8c02279a9263e9a9@eucas1p1.samsung.com>
 <20200619103636.11974-9-m.szyprowski@samsung.com>
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
IOq4gDoKPiBUaGUgRG9jdW1lbnRhdGlvbi9ETUEtQVBJLUhPV1RPLnR4dCBzdGF0ZXMgdGhhdCB0
aGUgZG1hX21hcF9zZygpIGZ1bmN0aW9uCj4gcmV0dXJucyB0aGUgbnVtYmVyIG9mIHRoZSBjcmVh
dGVkIGVudHJpZXMgaW4gdGhlIERNQSBhZGRyZXNzIHNwYWNlLgo+IEhvd2V2ZXIgdGhlIHN1YnNl
cXVlbnQgY2FsbHMgdG8gdGhlIGRtYV9zeW5jX3NnX2Zvcl97ZGV2aWNlLGNwdX0oKSBhbmQKPiBk
bWFfdW5tYXBfc2cgbXVzdCBiZSBjYWxsZWQgd2l0aCB0aGUgb3JpZ2luYWwgbnVtYmVyIG9mIHRo
ZSBlbnRyaWVzCj4gcGFzc2VkIHRvIHRoZSBkbWFfbWFwX3NnKCkuCj4gCj4gc3RydWN0IHNnX3Rh
YmxlIGlzIGEgY29tbW9uIHN0cnVjdHVyZSB1c2VkIGZvciBkZXNjcmliaW5nIGEgbm9uLWNvbnRp
Z3VvdXMKPiBtZW1vcnkgYnVmZmVyLCB1c2VkIGNvbW1vbmx5IGluIHRoZSBEUk0gYW5kIGdyYXBo
aWNzIHN1YnN5c3RlbXMuIEl0Cj4gY29uc2lzdHMgb2YgYSBzY2F0dGVybGlzdCB3aXRoIG1lbW9y
eSBwYWdlcyBhbmQgRE1BIGFkZHJlc3NlcyAoc2dsIGVudHJ5KSwKPiBhcyB3ZWxsIGFzIHRoZSBu
dW1iZXIgb2Ygc2NhdHRlcmxpc3QgZW50cmllczogQ1BVIHBhZ2VzIChvcmlnX25lbnRzIGVudHJ5
KQo+IGFuZCBETUEgbWFwcGVkIHBhZ2VzIChuZW50cyBlbnRyeSkuCj4gCj4gSXQgdHVybmVkIG91
dCB0aGF0IGl0IHdhcyBhIGNvbW1vbiBtaXN0YWtlIHRvIG1pc3VzZSBuZW50cyBhbmQgb3JpZ19u
ZW50cwo+IGVudHJpZXMsIGNhbGxpbmcgRE1BLW1hcHBpbmcgZnVuY3Rpb25zIHdpdGggYSB3cm9u
ZyBudW1iZXIgb2YgZW50cmllcyBvcgo+IGlnbm9yaW5nIHRoZSBudW1iZXIgb2YgbWFwcGVkIGVu
dHJpZXMgcmV0dXJuZWQgYnkgdGhlIGRtYV9tYXBfc2coKQo+IGZ1bmN0aW9uLgo+IAo+IFRvIGF2
b2lkIHN1Y2ggaXNzdWVzLCBsZXRzIHVzZSBhIGNvbW1vbiBkbWEtbWFwcGluZyB3cmFwcGVycyBv
cGVyYXRpbmcKPiBkaXJlY3RseSBvbiB0aGUgc3RydWN0IHNnX3RhYmxlIG9iamVjdHMgYW5kIHVz
ZSBzY2F0dGVybGlzdCBwYWdlCj4gaXRlcmF0b3JzIHdoZXJlIHBvc3NpYmxlLiBUaGlzLCBhbG1v
c3QgYWx3YXlzLCBoaWRlcyByZWZlcmVuY2VzIHRvIHRoZQo+IG5lbnRzIGFuZCBvcmlnX25lbnRz
IGVudHJpZXMsIG1ha2luZyB0aGUgY29kZSByb2J1c3QsIGVhc2llciB0byBmb2xsb3cKPiBhbmQg
Y29weS9wYXN0ZSBzYWZlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0u
c3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KCkFja2VkLWJ5IDogSW5raSBEYWUgPGlua2kuZGFlQHNh
bXN1bmcuY29tPgoKVGhhbmtzLApJbmtpIERhZQoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX2cyZC5jIHwgMTAgKysrKystLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcm1fZzJkLmMKPiBpbmRleCBmY2VlMzNhNDNhY2EuLjcwMTRhOGNkOTcxYSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMKPiBAQCAtMzk1LDggKzM5
NSw4IEBAIHN0YXRpYyB2b2lkIGcyZF91c2VycHRyX3B1dF9kbWFfYWRkcihzdHJ1Y3QgZzJkX2Rh
dGEgKmcyZCwKPiAgCQlyZXR1cm47Cj4gIAo+ICBvdXQ6Cj4gLQlkbWFfdW5tYXBfc2codG9fZG1h
X2RldihnMmQtPmRybV9kZXYpLCBnMmRfdXNlcnB0ci0+c2d0LT5zZ2wsCj4gLQkJCWcyZF91c2Vy
cHRyLT5zZ3QtPm5lbnRzLCBETUFfQklESVJFQ1RJT05BTCk7Cj4gKwlkbWFfdW5tYXBfc2d0YWJs
ZSh0b19kbWFfZGV2KGcyZC0+ZHJtX2RldiksIGcyZF91c2VycHRyLT5zZ3QsCj4gKwkJCSAgRE1B
X0JJRElSRUNUSU9OQUwsIDApOwo+ICAKPiAgCXBhZ2VzID0gZnJhbWVfdmVjdG9yX3BhZ2VzKGcy
ZF91c2VycHRyLT52ZWMpOwo+ICAJaWYgKCFJU19FUlIocGFnZXMpKSB7Cj4gQEAgLTUxMSwxMCAr
NTExLDEwIEBAIHN0YXRpYyBkbWFfYWRkcl90ICpnMmRfdXNlcnB0cl9nZXRfZG1hX2FkZHIoc3Ry
dWN0IGcyZF9kYXRhICpnMmQsCj4gIAo+ICAJZzJkX3VzZXJwdHItPnNndCA9IHNndDsKPiAgCj4g
LQlpZiAoIWRtYV9tYXBfc2codG9fZG1hX2RldihnMmQtPmRybV9kZXYpLCBzZ3QtPnNnbCwgc2d0
LT5uZW50cywKPiAtCQkJCURNQV9CSURJUkVDVElPTkFMKSkgewo+ICsJcmV0ID0gZG1hX21hcF9z
Z3RhYmxlKHRvX2RtYV9kZXYoZzJkLT5kcm1fZGV2KSwgc2d0LAo+ICsJCQkgICAgICBETUFfQklE
SVJFQ1RJT05BTCwgMCk7Cj4gKwlpZiAocmV0KSB7Cj4gIAkJRFJNX0RFVl9FUlJPUihnMmQtPmRl
diwgImZhaWxlZCB0byBtYXAgc2d0IHdpdGggZG1hIHJlZ2lvbi5cbiIpOwo+IC0JCXJldCA9IC1F
Tk9NRU07Cj4gIAkJZ290byBlcnJfc2dfZnJlZV90YWJsZTsKPiAgCX0KPiAgCj4gCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BCC1E9FC6
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 10:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51C86E1CD;
	Mon,  1 Jun 2020 08:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B056E1CD
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 08:04:48 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200601080446epoutp04f2335414eab973913fa78e51598ed104~UXOA0CbUx0846408464epoutp04g
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 08:04:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200601080446epoutp04f2335414eab973913fa78e51598ed104~UXOA0CbUx0846408464epoutp04g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1590998686;
 bh=DkpgRqIf7pXJABFz/brWnnzOpjUBWmAGqnApiu+xjAs=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=oEjgJ6+ahL3S5MxgBPSWIkYOStDA+X/LS5aj4Q7OvriEf2In2M0LnEzhMZcphS3nq
 bhofuhJ6LW18dAssJxXxYjrNonBE1VonSiZIXhp4GyI1FIeJIvzLd+MLFFNQ9qO9PP
 YgAMbNee8Fc9rzoPox9eZaEzauAtNPk02797blDw=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200601080446epcas1p130af977c5b1d160aad84841bc6beaff4~UXOAgK11U0318003180epcas1p11;
 Mon,  1 Jun 2020 08:04:46 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.155]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 49b74T3B4zzMqYkb; Mon,  1 Jun
 2020 08:04:41 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 E2.F3.29173.996B4DE5; Mon,  1 Jun 2020 17:04:41 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200601080441epcas1p19a487695b46f51ebb3dc7ceb3f013de7~UXN73EiPS2864428644epcas1p1X;
 Mon,  1 Jun 2020 08:04:41 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200601080441epsmtrp1fd18a6653defa42a00594232c2adf77d~UXN72adpw1123211232epsmtrp1t;
 Mon,  1 Jun 2020 08:04:41 +0000 (GMT)
X-AuditID: b6c32a37-9cdff700000071f5-a5-5ed4b6997fc7
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 D0.B3.08303.896B4DE5; Mon,  1 Jun 2020 17:04:40 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200601080440epsmtip26d67ccbeb7a0a96d2963c711d1cc7e17~UXN7pszqf0158401584epsmtip2h;
 Mon,  1 Jun 2020 08:04:40 +0000 (GMT)
Subject: Re: [PATCH] drm/exynos: Properly propagate return value in
 drm_iommu_attach_device()
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
From: Inki Dae <inki.dae@samsung.com>
Message-ID: <87a6e490-e198-3ca4-a60a-6670b4b06e27@samsung.com>
Date: Mon, 1 Jun 2020 17:10:11 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200522060356.25153-1-m.szyprowski@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnk+LIzCtJLcpLzFFi42LZdljTQHfmtitxBn1PRS1urTvHarFxxnpW
 iytf37NZzDi/j8li7ZG77BYzJr9kc2DzuN99nMmjb8sqRo/Pm+QCmKOybTJSE1NSixRS85Lz
 UzLz0m2VvIPjneNNzQwMdQ0tLcyVFPISc1NtlVx8AnTdMnOA9ioplCXmlAKFAhKLi5X07WyK
 8ktLUhUy8otLbJVSC1JyCiwL9IoTc4tL89L1kvNzrQwNDIxMgQoTsjP6n7cwF3zkrNj/5gJz
 A2MPRxcjJ4eEgInEt5WnWEFsIYEdjBLLJgtA2J8YJV4d5Oli5AKyPzNKHFy2hhGm4c6X1YwQ
 iV2MEi9+vGCGcN4zSlx+fI8FpEpYIF7i+p5JYGNFBEol5v4/xg5iMwu0M0qsPR4PYrMJqEpM
 XHGfDcTmFbCT+N56mgnEZhFQkWj+/hionoNDVCBC4vTXRIgSQYmTM5+wgIQ5gcqvT+aHmCgu
 cevJfCYIW16ieetssHMkBH6yS/x/tpIZ4mgXif9XG5ggbGGJV8e3sEPYUhIv+9vYIRqaGSUm
 zgC5AcTpYJS4+/g6C0SVscT+pZOZQDYzC2hKrN+lDxFWlNj5ey4jxGY+iXdfe1hBSiQEeCU6
 2oQgSpQkjl28AQ04CYkLSyayQdgeEk+mNDNNYFScheS1WUj+mYXkn1kIixcwsqxiFEstKM5N
 Ty02LDBGjutNjOAUqWW+g3Ha2w96hxiZOBgPMUpwMCuJ8E5WvxQnxJuSWFmVWpQfX1Sak1p8
 iNEUGNYTmaVEk/OBSTqvJN7Q1MjY2NjCxNDM1NBQSZzX1+pCnJBAemJJanZqakFqEUwfEwen
 VAMTf3T7HKam6h0tZlKfPqx0XNWcGpv5zkl6T7TdhtO7/8/0cS3VieUxfZS1gPV/huGdnHmy
 RxLMvrJ9NWCdJndbq742tPHVjMsTBG6vnHmSKy9rV8tnrkTrplXnNDOlxdcw3zwxKWPToucN
 HPduKT/YyMDGmPjKhDlpatw3pVZn6RcNv69+fhuZetCzimvu/1fVQhfaGnbnOty2tb/vNOvR
 0vtPCnxeWea2VvVbyEk9fH0uIPzJuUqLldeTg0pvX5x5iSu4dXUtt87r9NQ7mX1bLTb37L4Y
 M6M07MCy+59eaQcKma65/cDiht6nQrE3qv9+WCqoH/06636GwP1FMgvW/93wp8BiR1oJR19B
 7b95SizFGYmGWsxFxYkAgTjrghoEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWy7bCSvO6MbVfiDGb+tbK4te4cq8XGGetZ
 La58fc9mMeP8PiaLtUfuslvMmPySzYHN4373cSaPvi2rGD0+b5ILYI7isklJzcksSy3St0vg
 yuh/3sJc8JGzYv+bC8wNjD0cXYycHBICJhJ3vqxm7GLk4hAS2MEocWLnOvYuRg6ghITElq0c
 EKawxOHDxRAlbxkl9s99ygLSKywQL3F9zyRWEFtEoFTiVf99sDnMAu2MEkf2dbBDdExklDg/
 7xo7SBWbgKrExBX32UBsXgE7ie+tp5lAbBYBFYnm74/BakQFIiSeb7/BCFEjKHFy5hMWkCs4
 geqvT+YHCTMLqEv8mXeJGcIWl7j1ZD4ThC0v0bx1NvMERqFZSLpnIWmZhaRlFpKWBYwsqxgl
 UwuKc9Nziw0LjPJSy/WKE3OLS/PS9ZLzczcxguNCS2sH455VH/QOMTJxMB5ilOBgVhLhnax+
 KU6INyWxsiq1KD++qDQntfgQozQHi5I479dZC+OEBNITS1KzU1MLUotgskwcnFINTPzuS3J+
 tSZe+XMzp33/34iKsPy2n7wpUjs7dNRPKz72Nn60pyzObNvsdEfNByZGoV/1ezrUnnwJMuVX
 V2+IeeRTNjGU57Xzwxj/2innLhTnfRff5L1HViOsvMKlU0HguoWmxYuzTFnn5ts1uUhPE2F9
 8GBN/tVZm1+JzfbbUNdmUN0eUTKfqb5Yiv9UGv+pt6s3FrFIut/XY7uvb72k+prLxHSR32st
 vy+MP37grcylZm3L55phm19NKm/w3G69N6iE/ebkjFn+p2cyGSxonFDaaC4Zfe/PYc4LvlPu
 sN/bdaDuZtP7iw4c4pNTwmTuziq272Trz7n8+Lf1PsGGBOk96zLOX1y3/HCc329HJZbijERD
 Leai4kQAqh29AfoCAAA=
X-CMS-MailID: 20200601080441epcas1p19a487695b46f51ebb3dc7ceb3f013de7
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200522060409eucas1p1cf023d2be5b8c30da32354262a829de0
References: <CGME20200522060409eucas1p1cf023d2be5b8c30da32354262a829de0@eucas1p1.samsung.com>
 <20200522060356.25153-1-m.szyprowski@samsung.com>
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

CgoyMC4gNS4gMjIuIOyYpO2bhCAzOjAz7JeQIE1hcmVrIFN6eXByb3dza2kg7J20KOqwgCkg7JO0
IOq4gDoKPiBQcm9wYWdhdGUgdGhlIHByb3BlciBlcnJvciBjb2RlcyBmcm9tIHRoZSBjYWxsZWQg
ZnVuY3Rpb25zIGluc3RlYWQgb2YKPiB1bmNvbmRpdGlvbmFsbHkgcmV0dXJuaW5nIDAuCj4gCgpQ
aWNrZWQgaXQgdXAuCgpUaGFua3MsCklua2kgRGFlCgo+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVz
dCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tp
IDxtLnN6eXByb3dza2lAc2Ftc3VuZy5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9kbWEuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19k
cm1fZG1hLmMKPiBpbmRleCBkM2ZlNmMxZTY2ODguLjU4ODdmN2Y1MmY5NiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZG1hLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZG1hLmMKPiBAQCAtNDQsNyArNDQsNyBAQCBzdGF0
aWMgaW50IGRybV9pb21tdV9hdHRhY2hfZGV2aWNlKHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2
LAo+ICAJCQkJc3RydWN0IGRldmljZSAqc3ViZHJ2X2Rldiwgdm9pZCAqKmRtYV9wcml2KQo+ICB7
Cj4gIAlzdHJ1Y3QgZXh5bm9zX2RybV9wcml2YXRlICpwcml2ID0gZHJtX2Rldi0+ZGV2X3ByaXZh
dGU7Cj4gLQlpbnQgcmV0Owo+ICsJaW50IHJldCA9IDA7Cj4gIAo+ICAJaWYgKGdldF9kbWFfb3Bz
KHByaXYtPmRtYV9kZXYpICE9IGdldF9kbWFfb3BzKHN1YmRydl9kZXYpKSB7Cj4gIAkJRFJNX0RF
Vl9FUlJPUihzdWJkcnZfZGV2LCAiRGV2aWNlICVzIGxhY2tzIHN1cHBvcnQgZm9yIElPTU1VXG4i
LAo+IEBAIC02OSw3ICs2OSw3IEBAIHN0YXRpYyBpbnQgZHJtX2lvbW11X2F0dGFjaF9kZXZpY2Uo
c3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYsCj4gIAkJcmV0ID0gaW9tbXVfYXR0YWNoX2Rldmlj
ZShwcml2LT5tYXBwaW5nLCBzdWJkcnZfZGV2KTsKPiAgCX0KPiAgCj4gLQlyZXR1cm4gMDsKPiAr
CXJldHVybiByZXQ7Cj4gIH0KPiAgCj4gIC8qCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=

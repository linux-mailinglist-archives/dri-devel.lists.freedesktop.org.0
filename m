Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFE72006BB
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 12:38:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C455C6EC87;
	Fri, 19 Jun 2020 10:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A50A6EC64
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:07 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200619103705euoutp026c3489b6c5347dd88748c73e2fbc25b5~Z66JdnqNC2242222422euoutp02a
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 10:37:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200619103705euoutp026c3489b6c5347dd88748c73e2fbc25b5~Z66JdnqNC2242222422euoutp02a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1592563025;
 bh=nbh13/xRlTnDhOSh+Kxv0NXU5d6Pqt7iXPYs90aE1m4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FZVCstj4s62tuKTQsy/F4jn1PQlStxt86N/EXB6wBGi0XpT6gEaaPfMVX49MDcDCs
 9TJU3RPRYxifz7A/nxw7hBsqP117n7z15jriqFE/lk3j4PJEFoCWsPQ8s+e03i3uzs
 p9ls25aKDLdtztwKm3YusDZXsZgCcZ0seeZjPY0Q=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200619103705eucas1p11f16c29370943b94896ef56ddaef32e6~Z66I3gaXf0294402944eucas1p1F;
 Fri, 19 Jun 2020 10:37:05 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 10.AC.06456.1559CEE5; Fri, 19
 Jun 2020 11:37:05 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200619103704eucas1p1bf233e8914507323499186d9ab742c09~Z66IWCvuF0704707047eucas1p10;
 Fri, 19 Jun 2020 10:37:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200619103704eusmtrp18d2ec53252bf455c53a5187e65512832~Z66IVYPAA0959609596eusmtrp1F;
 Fri, 19 Jun 2020 10:37:04 +0000 (GMT)
X-AuditID: cbfec7f2-809ff70000001938-55-5eec955158d8
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B3.EA.06314.0559CEE5; Fri, 19
 Jun 2020 11:37:04 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200619103703eusmtip2858f7ecc195d53c8e5b3865722f607f8~Z66HoQ7iD0247402474eusmtip2c;
 Fri, 19 Jun 2020 10:37:03 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 17/36] drm: radeon: fix common struct sg_table related
 issues
Date: Fri, 19 Jun 2020 12:36:17 +0200
Message-Id: <20200619103636.11974-18-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619103636.11974-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUxNcRje73zd09Vtxy31Wxq6m+9EYzpTkmZ2NkP8Yy7FpbOk7o17upFN
 XZVwlImhTyq3XX1TpFWkRrd2ddPHLGR1FzP60HeYSqcT+u95n/d5n+d9f/uRqPwj7kyGaCJY
 rUYVpiCkWHn9T8u6fbf6AjdMtJF0kqURoW93VuF0bskFCf0opQSn+7tmyunyZJRuH/tO0HkF
 rxA6q8aLHm23InRpz1ucbqvMIOiilx8ldO3gJ9zXjrnYOkkwhXcLAfNsPAtjno5340zXVRPC
 lBlimA9TPShzs8MImKp3eoK59jgfMCOlS/wXKKXeQWxYSCSrXe9zVHqipc9InDI6nn3Cr9WD
 DjkPbEhIbYLVzaU4D6SknHoAYLz5NSIWowA25fYSYjECoKF5HOMBOTvypUIt8kYAC+7F4/8n
 at4hgi9BeUC+nycE7EBdBLAhyVYQoZQBhYbO55jQsKf2Q3N6/ewARi2HgzlFEgHLKB+YZ84A
 4oJLYcHDF6iAbWb43vhaXNQshI2pn2Z90BlN3JN0VAiA1KQEZpuqCXHVHTBhLET0sYffTI8l
 InaB5puJmKiPA9BqEYKFIhHAttiUuWQv2Gn5NWuEUqthSeV6kd4OE57xiOhvBzv6F4o72MEb
 5XdQkZbBywlz77sCppmK/8XWvmlFRczA5Ku/wHXgmjbvmrR516T9z80CaD5wYnWcOpjlPDTs
 GXdOpeZ0mmD34+HqUjDz6cxTpuEKMNZ6rA5QJFDYynwP9AbKcVUkF6WuA5BEFQ4yvyZzoFwW
 pIo6x2rDj2h1YSxXBxaTmMJJtjHna4CcClZFsKEse4rV/u0ipI2zHsRYhrfd118i+IEm5UpN
 6wSMdQwPOZnpCVw3//BrYIqnR/z3Nka6SU/DoNQrW0m9daxy0RllHIdvj65HyqeXDfhH/3bS
 R/mV/QxoCY1dQTrckHuTboO7txw9vMrTO7N6z7GtOyv4Jmu2S0H3EKY7NPT+fFKP+UPL51vK
 wl0HnysVGHdC5bEG1XKqPxwLG3pwAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsVy+t/xe7oBU9/EGUzsVrHoPXeSyWLand2s
 FkvXN7JbbJyxntXi7X0g9/+2icwWV76+Z7NYufook8WC/dYWX648ZLLY9Pgaq8XlXXPYLNYe
 uctucfDDE1YHPo/WS3/ZPNbMW8PosffbAhaP7d8esHrc7z7O5LF5Sb3H7X+PmT0m31jO6LH7
 ZgObR9+WVYwenzfJBXBH6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZmVjqGRqbx1oZmSrp29mk
 pOZklqUW6dsl6GVcfLOcrWC5WMXWLu0GxhtCXYwcHBICJhLPd+R2MXJxCAksZZRYMPUYYxcj
 J1BcRuLktAZWCFtY4s+1LjaIok+MEo/ebAUrYhMwlOh6C5EQEehklJjW/ZEdxGEWWMMsce/7
 cnaQKmGBAIm9W5cwgdgsAqoSHxatBYvzCthJrDw9B2qdvMTqDQeYQWxOoPjrloNgq4UEbCWW
 L3jPDFEvKHFy5hMWkLOZBdQl1s8TAgkzA7U2b53NPIFRcBaSqlkIVbOQVC1gZF7FKJJaWpyb
 nltsqFecmFtcmpeul5yfu4kRGL/bjv3cvIPx0sbgQ4wCHIxKPLwvQl7HCbEmlhVX5h5ilOBg
 VhLhdTp7Ok6INyWxsiq1KD++qDQntfgQoynQaxOZpUST84GpJa8k3tDU0NzC0tDc2NzYzEJJ
 nLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA2PwB2/OqzZMVrZXc/drrVlrtlqzZ4uvpkie49Om
 qErR+NS3vkYft89cLjbhc8+ypKb9n+e2CDJ4Xw53jPeXXbZ3UrHWouivmxYUnjknxi4f6jL5
 r0oMk4h6bLV25W6LnClB5ku0zNesyRDl25Dm5sZ9SeB56b2YxkOFL1nvOv1fK+e071v4XSWW
 4oxEQy3mouJEANQLM4z1AgAA
X-CMS-MailID: 20200619103704eucas1p1bf233e8914507323499186d9ab742c09
X-Msg-Generator: CA
X-RootMTR: 20200619103704eucas1p1bf233e8914507323499186d9ab742c09
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103704eucas1p1bf233e8914507323499186d9ab742c09
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
 <CGME20200619103704eucas1p1bf233e8914507323499186d9ab742c09@eucas1p1.samsung.com>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERvY3VtZW50YXRpb24vRE1BLUFQSS1IT1dUTy50eHQgc3RhdGVzIHRoYXQgdGhlIGRtYV9t
YXBfc2coKSBmdW5jdGlvbgpyZXR1cm5zIHRoZSBudW1iZXIgb2YgdGhlIGNyZWF0ZWQgZW50cmll
cyBpbiB0aGUgRE1BIGFkZHJlc3Mgc3BhY2UuCkhvd2V2ZXIgdGhlIHN1YnNlcXVlbnQgY2FsbHMg
dG8gdGhlIGRtYV9zeW5jX3NnX2Zvcl97ZGV2aWNlLGNwdX0oKSBhbmQKZG1hX3VubWFwX3NnIG11
c3QgYmUgY2FsbGVkIHdpdGggdGhlIG9yaWdpbmFsIG51bWJlciBvZiB0aGUgZW50cmllcwpwYXNz
ZWQgdG8gdGhlIGRtYV9tYXBfc2coKS4KCnN0cnVjdCBzZ190YWJsZSBpcyBhIGNvbW1vbiBzdHJ1
Y3R1cmUgdXNlZCBmb3IgZGVzY3JpYmluZyBhIG5vbi1jb250aWd1b3VzCm1lbW9yeSBidWZmZXIs
IHVzZWQgY29tbW9ubHkgaW4gdGhlIERSTSBhbmQgZ3JhcGhpY3Mgc3Vic3lzdGVtcy4gSXQKY29u
c2lzdHMgb2YgYSBzY2F0dGVybGlzdCB3aXRoIG1lbW9yeSBwYWdlcyBhbmQgRE1BIGFkZHJlc3Nl
cyAoc2dsIGVudHJ5KSwKYXMgd2VsbCBhcyB0aGUgbnVtYmVyIG9mIHNjYXR0ZXJsaXN0IGVudHJp
ZXM6IENQVSBwYWdlcyAob3JpZ19uZW50cyBlbnRyeSkKYW5kIERNQSBtYXBwZWQgcGFnZXMgKG5l
bnRzIGVudHJ5KS4KCkl0IHR1cm5lZCBvdXQgdGhhdCBpdCB3YXMgYSBjb21tb24gbWlzdGFrZSB0
byBtaXN1c2UgbmVudHMgYW5kIG9yaWdfbmVudHMKZW50cmllcywgY2FsbGluZyBETUEtbWFwcGlu
ZyBmdW5jdGlvbnMgd2l0aCBhIHdyb25nIG51bWJlciBvZiBlbnRyaWVzIG9yCmlnbm9yaW5nIHRo
ZSBudW1iZXIgb2YgbWFwcGVkIGVudHJpZXMgcmV0dXJuZWQgYnkgdGhlIGRtYV9tYXBfc2coKQpm
dW5jdGlvbi4KClRvIGF2b2lkIHN1Y2ggaXNzdWVzLCBsZXRzIHVzZSBhIGNvbW1vbiBkbWEtbWFw
cGluZyB3cmFwcGVycyBvcGVyYXRpbmcKZGlyZWN0bHkgb24gdGhlIHN0cnVjdCBzZ190YWJsZSBv
YmplY3RzIGFuZCB1c2Ugc2NhdHRlcmxpc3QgcGFnZQppdGVyYXRvcnMgd2hlcmUgcG9zc2libGUu
IFRoaXMsIGFsbW9zdCBhbHdheXMsIGhpZGVzIHJlZmVyZW5jZXMgdG8gdGhlCm5lbnRzIGFuZCBv
cmlnX25lbnRzIGVudHJpZXMsIG1ha2luZyB0aGUgY29kZSByb2J1c3QsIGVhc2llciB0byBmb2xs
b3cKYW5kIGNvcHkvcGFzdGUgc2FmZS4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kg
PG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl90dG0uYyB8IDExICsrKysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKaW5kZXgg
NWQ1MGM5ZWRiZTgwLi4wZTNlYjBkMjI4MzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9y
YWRlb24vcmFkZW9uX3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0
bS5jCkBAIC00ODEsNyArNDgxLDcgQEAgc3RhdGljIGludCByYWRlb25fdHRtX3R0X3Bpbl91c2Vy
cHRyKHN0cnVjdCB0dG1fdHQgKnR0bSkKIHsKIAlzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiA9
IHJhZGVvbl9nZXRfcmRldih0dG0tPmJkZXYpOwogCXN0cnVjdCByYWRlb25fdHRtX3R0ICpndHQg
PSAodm9pZCAqKXR0bTsKLQl1bnNpZ25lZCBwaW5uZWQgPSAwLCBuZW50czsKKwl1bnNpZ25lZCBw
aW5uZWQgPSAwOwogCWludCByOwogCiAJaW50IHdyaXRlID0gIShndHQtPnVzZXJmbGFncyAmIFJB
REVPTl9HRU1fVVNFUlBUUl9SRUFET05MWSk7CkBAIC01MjEsOSArNTIxLDggQEAgc3RhdGljIGlu
dCByYWRlb25fdHRtX3R0X3Bpbl91c2VycHRyKHN0cnVjdCB0dG1fdHQgKnR0bSkKIAlpZiAocikK
IAkJZ290byByZWxlYXNlX3NnOwogCi0JciA9IC1FTk9NRU07Ci0JbmVudHMgPSBkbWFfbWFwX3Nn
KHJkZXYtPmRldiwgdHRtLT5zZy0+c2dsLCB0dG0tPnNnLT5uZW50cywgZGlyZWN0aW9uKTsKLQlp
ZiAobmVudHMgPT0gMCkKKwlyID0gZG1hX21hcF9zZ3RhYmxlKHJkZXYtPmRldiwgdHRtLT5zZywg
ZGlyZWN0aW9uLCAwKTsKKwlpZiAocikKIAkJZ290byByZWxlYXNlX3NnOwogCiAJZHJtX3ByaW1l
X3NnX3RvX3BhZ2VfYWRkcl9hcnJheXModHRtLT5zZywgdHRtLT5wYWdlcywKQEAgLTU1NCw5ICs1
NTMsOSBAQCBzdGF0aWMgdm9pZCByYWRlb25fdHRtX3R0X3VucGluX3VzZXJwdHIoc3RydWN0IHR0
bV90dCAqdHRtKQogCQlyZXR1cm47CiAKIAkvKiBmcmVlIHRoZSBzZyB0YWJsZSBhbmQgcGFnZXMg
YWdhaW4gKi8KLQlkbWFfdW5tYXBfc2cocmRldi0+ZGV2LCB0dG0tPnNnLT5zZ2wsIHR0bS0+c2ct
Pm5lbnRzLCBkaXJlY3Rpb24pOworCWRtYV91bm1hcF9zZ3RhYmxlKHJkZXYtPmRldiwgdHRtLT5z
ZywgZGlyZWN0aW9uLCAwKTsKIAotCWZvcl9lYWNoX3NnX3BhZ2UodHRtLT5zZy0+c2dsLCAmc2df
aXRlciwgdHRtLT5zZy0+bmVudHMsIDApIHsKKwlmb3JfZWFjaF9zZ3RhYmxlX3BhZ2UodHRtLT5z
ZywgJnNnX2l0ZXIsIDApIHsKIAkJc3RydWN0IHBhZ2UgKnBhZ2UgPSBzZ19wYWdlX2l0ZXJfcGFn
ZSgmc2dfaXRlcik7CiAJCWlmICghKGd0dC0+dXNlcmZsYWdzICYgUkFERU9OX0dFTV9VU0VSUFRS
X1JFQURPTkxZKSkKIAkJCXNldF9wYWdlX2RpcnR5KHBhZ2UpOwotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

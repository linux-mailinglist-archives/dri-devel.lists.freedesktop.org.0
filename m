Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D52E1292A0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A6B6E194;
	Mon, 23 Dec 2019 08:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 031F16EC1C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 12:01:43 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191220120142euoutp019434d20cefa0a474a877bf61feba38ac~iEqEWzstl1021810218euoutp015
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 12:01:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191220120142euoutp019434d20cefa0a474a877bf61feba38ac~iEqEWzstl1021810218euoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576843302;
 bh=gGDgaeou7mugSh38EJgLmUfO6gmmRUW2noLrg7o4IwE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OE5Wz3qNfrJQTwXDcmfWX/oSTO2WqZYC8Uknd68xzf06hhZqIfemg0qAnAyFs7EjS
 OdhcHhZ2T84XiUKlTj//6Wykef1NQmFmfzPmO/wcPYBJFThhsJQTgjg3RhBNPH+Q68
 jMaOkymQ5LvOW4dKrYtGuSZK6tixShjqnr0QdA9w=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191220120142eucas1p26044b2bc3c1fca412abad1ea33b73a92~iEqD7ln7C2935829358eucas1p22;
 Fri, 20 Dec 2019 12:01:42 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 8F.84.60679.628BCFD5; Fri, 20
 Dec 2019 12:01:42 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191220120141eucas1p11f5fa9d76d17e80e06199cb7a911c482~iEqDolbst2484524845eucas1p13;
 Fri, 20 Dec 2019 12:01:41 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191220120141eusmtrp21b472949b61d003dee5e5352ab3edc7b~iEqDnz0sz2149221492eusmtrp2r;
 Fri, 20 Dec 2019 12:01:41 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-1a-5dfcb82666c3
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9E.58.07950.528BCFD5; Fri, 20
 Dec 2019 12:01:41 +0000 (GMT)
Received: from AMDC3555.digital.local (unknown [106.120.51.67]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191220120140eusmtip29e07a574c6cc1c448fbf0f95b228c34d~iEqC1iVgJ2950829508eusmtip2P;
 Fri, 20 Dec 2019 12:01:40 +0000 (GMT)
From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 1/7] interconnect: Export of_icc_get_from_provider()
Date: Fri, 20 Dec 2019 12:56:47 +0100
Message-Id: <20191220115653.6487-2-a.swigon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191220115653.6487-1-a.swigon@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjm27lqTo5T8KWL0cqiTO0i8UkXEiQO+acgAq1lSw9qObUdteyP
 lzK8VIqRlxVqaWmuUmeaDhMbyxmZiy4rUFNKSYWUcgmaaG5nXf497/O8z/u878fHEgobtZJN
 SEoVtEnqRCXtTrb1zFkDN7YvqLZ1XGLxcGUuws3ljRT+YP9K4SpzP4Xf/ZymcdlTA41LhotJ
 bLU2Mbh+6DuFDV9sFH5rvEXjmatmhMutXTL80DzE4IHsehqXX5+g93O8oSGf5gdtnTQ/XGiR
 8S21mXzzVLuMv/a4AfEzBr9DTJT7nlghMSFd0AbvO+ke3z6qp1JaufNXvr5mslCOZwFyY4EL
 gRH9PFGA3FkFV49AVzNHSoUdQdWnalcxg6A7t4j8Y7GUvHAJdQiKHtwn/lp6O3NpRxfNhUHJ
 jRHGIfhwZgTXq6edFoK7JYO8/DrnLG8uAnRzo4QDk5w/6LpeMg4s5zB05NoJKW8t6Ju6ndiN
 C4WP798QUo8XvKgYdc4hlnsutt50rgHcdwaarIWMZA6HqW/dSMLeMGl57OJXw1JHlUzCIox1
 DFOSOQuB4Z7ZlbwbBvvnl+9hlxM2Q6MxWKLDoKDyOemggfOEj9+8pB08oaStjJBoOeRdVkhQ
 CcYK12MD5Ohtrtk8ZPWMUMVone6/Y3T/HaP7F1uNiAbkK6SJmjhB3JEknAsS1RoxLSkuKCZZ
 Y0DLv+3losXejowLp0yIY5HSQz4e80uloNTpYobGhIAllD7ygbw5lUIeq864IGiTo7VpiYJo
 QqtYUukr33lnQqXg4tSpwhlBSBG0f1QZ67YyC5EHSm+ELkW0FFypWjNdU1t3+jZ/dNKHqjke
 ebcvu3QgIKQ0W7WrxRbT45XgvylA5UFF3SaCTkSPawbOi+uPeBFlpp1H/fYefrYq88nU1iL1
 h0DdodnwyLQf5SsKmbNNwZUHczaMnbTNvppcnO+Nx5+PDeELer7H1GZ45FuXoeizK0kxXr19
 C6EV1b8BvDpsi2kDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsVy+t/xe7qqO/7EGjSt17O4P6+V0WLjjPWs
 Fte/PGe1mH/kHKvFla/v2Sym793EZjHp/gQWi/PnN7BbrLj7kdVi0+NrrBaXd81hs/jce4TR
 Ysb5fUwWa4/cZbe43biCzWLG5JdsDgIem1Z1snncubaHzeN+93Emj81L6j02vtvB5NG3ZRWj
 x+dNcgHsUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2
 CXoZO56sZi3YKlDR8/wCewNjE18XIyeHhICJxPFJJ1lAbCGBpYwSDx7VQMQlJD6uv8EKYQtL
 /LnWxdbFyAVU84lRoutCJxtIgk3AUWLS1AfsIAkRgVOMEluXnwNLMAusYJLonyMMYgsLeEvM
 +vmEGcRmEVCVmLXvNDuIzStgIbGz9QszxAZ5idUbDoDZnAKWEjeuXmKGuAio5nMfE0S9oMTJ
 mU+ALuUAmq8usX6eEMQqeYnmrbOZJzAKzkJSNQuhahaSqgWMzKsYRVJLi3PTc4uN9IoTc4tL
 89L1kvNzNzECo3XbsZ9bdjB2vQs+xCjAwajEw+uQ9jtWiDWxrLgy9xCjBAezkgjv7Y6fsUK8
 KYmVValF+fFFpTmpxYcYTYFem8gsJZqcD0wkeSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNIT
 S1KzU1MLUotg+pg4OKUaGFNMDrwzl2WamDZ/geBdq6Q36xpeX/dXtNdOehB7SnHC0ZPZi8y3
 TJ0kbPfU5GNWvUyTdL/mhu0yj5d8PrD5tG+vaco0zxfh6w3Pr+k71Lv7r/3h8/5OpRI9G9QD
 nrg7xvE2fI5PP74kZVXsjAZr7h6JB7GyQsXv88xiv6Y8Pn/4olrw6SoFYyWW4oxEQy3mouJE
 AIoeLovsAgAA
X-CMS-MailID: 20191220120141eucas1p11f5fa9d76d17e80e06199cb7a911c482
X-Msg-Generator: CA
X-RootMTR: 20191220120141eucas1p11f5fa9d76d17e80e06199cb7a911c482
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191220120141eucas1p11f5fa9d76d17e80e06199cb7a911c482
References: <20191220115653.6487-1-a.swigon@samsung.com>
 <CGME20191220120141eucas1p11f5fa9d76d17e80e06199cb7a911c482@eucas1p1.samsung.com>
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: b.zolnierkie@samsung.com, sw0312.kim@samsung.com,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>, krzk@kernel.org,
 cw00.choi@samsung.com, myungjoo.ham@samsung.com, leonard.crestez@nxp.com,
 georgi.djakov@linaro.org, m.szyprowski@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBtYWtlcyB0aGUgYWJvdmUgZnVuY3Rpb24gcHVibGljIChmb3IgdXNlIGluIGV4
eW5vcy1idXMgZGV2ZnJlcQpkcml2ZXIpLgoKU2lnbmVkLW9mZi1ieTogQXJ0dXIgxZp3aWdvxYQg
PGEuc3dpZ29uQHNhbXN1bmcuY29tPgpSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPgpSZXZpZXdlZC1ieTogQ2hhbndvbyBDaG9pIDxjdzAwLmNob2lAc2Ft
c3VuZy5jb20+Ci0tLQogZHJpdmVycy9pbnRlcmNvbm5lY3QvY29yZS5jICAgICAgICAgICB8IDMg
KystCiBpbmNsdWRlL2xpbnV4L2ludGVyY29ubmVjdC1wcm92aWRlci5oIHwgNiArKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9pbnRlcmNvbm5lY3QvY29yZS5jIGIvZHJpdmVycy9pbnRlcmNvbm5lY3QvY29y
ZS5jCmluZGV4IDYzYzE2NDI2NGI3My4uZTYwMzVjMTk5MzY5IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2ludGVyY29ubmVjdC9jb3JlLmMKKysrIGIvZHJpdmVycy9pbnRlcmNvbm5lY3QvY29yZS5jCkBA
IC0zMzAsNyArMzMwLDcgQEAgRVhQT1JUX1NZTUJPTF9HUEwob2ZfaWNjX3hsYXRlX29uZWNlbGwp
OwogICogUmV0dXJucyBhIHZhbGlkIHBvaW50ZXIgdG8gc3RydWN0IGljY19ub2RlIG9uIHN1Y2Nl
c3Mgb3IgRVJSX1BUUigpCiAgKiBvbiBmYWlsdXJlLgogICovCi1zdGF0aWMgc3RydWN0IGljY19u
b2RlICpvZl9pY2NfZ2V0X2Zyb21fcHJvdmlkZXIoc3RydWN0IG9mX3BoYW5kbGVfYXJncyAqc3Bl
YykKK3N0cnVjdCBpY2Nfbm9kZSAqb2ZfaWNjX2dldF9mcm9tX3Byb3ZpZGVyKHN0cnVjdCBvZl9w
aGFuZGxlX2FyZ3MgKnNwZWMpCiB7CiAJc3RydWN0IGljY19ub2RlICpub2RlID0gRVJSX1BUUigt
RVBST0JFX0RFRkVSKTsKIAlzdHJ1Y3QgaWNjX3Byb3ZpZGVyICpwcm92aWRlcjsKQEAgLTM0OSw2
ICszNDksNyBAQCBzdGF0aWMgc3RydWN0IGljY19ub2RlICpvZl9pY2NfZ2V0X2Zyb21fcHJvdmlk
ZXIoc3RydWN0IG9mX3BoYW5kbGVfYXJncyAqc3BlYykKIAogCXJldHVybiBub2RlOwogfQorRVhQ
T1JUX1NZTUJPTF9HUEwob2ZfaWNjX2dldF9mcm9tX3Byb3ZpZGVyKTsKIAogLyoqCiAgKiBvZl9p
Y2NfZ2V0KCkgLSBnZXQgYSBwYXRoIGhhbmRsZSBmcm9tIGEgRFQgbm9kZSBiYXNlZCBvbiBuYW1l
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2ludGVyY29ubmVjdC1wcm92aWRlci5oIGIvaW5j
bHVkZS9saW51eC9pbnRlcmNvbm5lY3QtcHJvdmlkZXIuaAppbmRleCAwYzQ5NDUzNGI0ZDMuLmNj
OTY1YjhmYWI1MyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9pbnRlcmNvbm5lY3QtcHJvdmlk
ZXIuaAorKysgYi9pbmNsdWRlL2xpbnV4L2ludGVyY29ubmVjdC1wcm92aWRlci5oCkBAIC0xMDMs
NiArMTAzLDcgQEAgdm9pZCBpY2Nfbm9kZV9kZWwoc3RydWN0IGljY19ub2RlICpub2RlKTsKIGlu
dCBpY2Nfbm9kZXNfcmVtb3ZlKHN0cnVjdCBpY2NfcHJvdmlkZXIgKnByb3ZpZGVyKTsKIGludCBp
Y2NfcHJvdmlkZXJfYWRkKHN0cnVjdCBpY2NfcHJvdmlkZXIgKnByb3ZpZGVyKTsKIGludCBpY2Nf
cHJvdmlkZXJfZGVsKHN0cnVjdCBpY2NfcHJvdmlkZXIgKnByb3ZpZGVyKTsKK3N0cnVjdCBpY2Nf
bm9kZSAqb2ZfaWNjX2dldF9mcm9tX3Byb3ZpZGVyKHN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgKnNw
ZWMpOwogCiAjZWxzZQogCkBAIC0xNTQsNiArMTU1LDExIEBAIHN0YXRpYyBpbmxpbmUgaW50IGlj
Y19wcm92aWRlcl9kZWwoc3RydWN0IGljY19wcm92aWRlciAqcHJvdmlkZXIpCiAJcmV0dXJuIC1F
Tk9UU1VQUDsKIH0KIAorc3RydWN0IGljY19ub2RlICpvZl9pY2NfZ2V0X2Zyb21fcHJvdmlkZXIo
c3RydWN0IG9mX3BoYW5kbGVfYXJncyAqc3BlYykKK3sKKwlyZXR1cm4gRVJSX1BUUigtRU5PVFNV
UFApOworfQorCiAjZW5kaWYgLyogQ09ORklHX0lOVEVSQ09OTkVDVCAqLwogCiAjZW5kaWYgLyog
X19MSU5VWF9JTlRFUkNPTk5FQ1RfUFJPVklERVJfSCAqLwotLSAKMi4xNy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9690D1292AC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACFC6E1E9;
	Mon, 23 Dec 2019 08:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906576EC1C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 12:01:45 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20191220120144euoutp01e7218ac58380f9ddce3c57fd955b53d8~iEqF9BsHK1021810218euoutp018
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 12:01:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20191220120144euoutp01e7218ac58380f9ddce3c57fd955b53d8~iEqF9BsHK1021810218euoutp018
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1576843304;
 bh=s4kRbuQ3Hb8eo8oQqLWyy6KxuzGwfImAAZepS0JGEVw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C7YGZZ9X3oOkC9IHHnryqxDrUlNIjbhS+5eSAI9R46gjfuKmFJJqkq/ADaBJkIEUK
 9IzI92N9KY3JCYvRKV3+rRx1C0DrEB7fjifa0pY91BSlw8eoRg/yFksNREB3N6jHMO
 mi0bVbW4BOTAWR7zbsiGxxTcfVqEvCdRP7hbZ65M=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20191220120144eucas1p255f58b670015246946f49606b925c015~iEqFsC3AQ2385123851eucas1p2J;
 Fri, 20 Dec 2019 12:01:44 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 72.3E.60698.728BCFD5; Fri, 20
 Dec 2019 12:01:43 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20191220120143eucas1p1c9b01ae8c2e4ecd70423ef9d8001536f~iEqFPIy1T1904419044eucas1p1N;
 Fri, 20 Dec 2019 12:01:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20191220120143eusmtrp2b884f64582ad1d849e0567c67ef48dca~iEqFOgpKV2149121491eusmtrp2v;
 Fri, 20 Dec 2019 12:01:43 +0000 (GMT)
X-AuditID: cbfec7f5-a0fff7000001ed1a-45-5dfcb8272004
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id B0.68.07950.728BCFD5; Fri, 20
 Dec 2019 12:01:43 +0000 (GMT)
Received: from AMDC3555.digital.local (unknown [106.120.51.67]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20191220120142eusmtip2ad17b9c1cc2c8795cf1c39a213e1ea8a~iEqEZKDP12783527835eusmtip2u;
 Fri, 20 Dec 2019 12:01:42 +0000 (GMT)
From: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH v3 3/7] interconnect: Allow inter-provider pairs to be
 configured
Date: Fri, 20 Dec 2019 12:56:49 +0100
Message-Id: <20191220115653.6487-4-a.swigon@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191220115653.6487-1-a.swigon@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTYRjG+XZ2zi40OU2pF7tIg6ikK4V8lYiWxKGgyz8FhdXSk4s5jR0v
 WUGaaVMxZFKzaRdNUqalzgu2Sm2NRlSTZq2B2kyzYbSiVEgd1raT1X+/732f53veF14xIe8n
 I8Wn0jNZbboyTUFJhZ3Pph3rVnX5kzY6LRh7bhYi3FrZTOJ3k14S37I5SPxm6huFDY/NFNZ7
 yoW4r69FhBuGvpPYPOoicb+lmsITZTaEK/u6BfiebUiEB/IbKFxZMU7F04zZVEwxg65HFOMp
 tQuYtroLTOvXLgFzpd2EmAnz8v2iw9LYFDbtVDar3RB3XKoq7C2iTt+JOPPTWk3moRa6BEnE
 QG+BmqYeKshyugFB4+XVPE8ieNe7twRJAzyBwOW6JJo3dLZ2iPhGPQJTswH9dRQ9lAaZohNA
 f3U4JIqgbQgqbn8TBh8EXS0AXXG9MKgKpw/BeM2XEAvplfD4SW1oDhmNoarVTfFxUdDY0ksE
 WUJvBfdbJ8FrFsLz6x9DXiKgKeioIoIBQE+JQFdrJ3lzIhhmRhDP4fDZ3v5nh6Xw68EtAc8c
 jD3wkLw5D4H5ro3gG9th0DETmEIcSFgDzZYNfDkBHK58UbAMdBi4fQv5GcJA32kg+LIMdEVy
 HhVguR7GGwEuNrr+/M1Apc2IytEK43/LGP9bxvgv9jYiTGgxm8VpUlluczqbs55Taris9NT1
 yRkaMwqc2os5+1QX6vafsCJajBQLZPEnZ5PkpDKby9VYEYgJRYRsQDedJJelKHPPstqMY9qs
 NJazoiVioWKxbHPteJKcTlVmsmqWPc1q57sCsSQyD2V4o/w73QVl9w/cHRmJO+hz1znvvbZ9
 6Xz5vHh3GErO8ZvWDvtKb/Rf23XuqPepZXSqeU/kud0bf8yu0nuzPlgPH6GSU+qqdLHl25ZJ
 nvWo7F/3VbXlNKli/D1qa7exfSCGXpDIjM3FIHX7q/evfQnRn87ueLLomM9xfjjaWaNmFEJO
 pdwUTWg55W8CpCNgZgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsVy+t/xe7rqO/7EGrTvkrK4P6+V0WLjjPWs
 Fte/PGe1mH/kHKvFla/v2Sym793EZjHp/gQWi/PnN7BbrLj7kdVi0+NrrBaXd81hs/jce4TR
 Ysb5fUwWa4/cZbe43biCzWLG5JdsDgIem1Z1snncubaHzeN+93Emj81L6j02vtvB5NG3ZRWj
 x+dNcgHsUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2
 CXoZrQfa2AoWi1T8ODSHtYFxg0AXIyeHhICJxLaNW9m7GLk4hASWMkocurOJESIhIfFx/Q1W
 CFtY4s+1LjaIok+MEn29S9hBEmwCjhKTpj4A6xYROMUosXX5OTaQBLPACiaJ/jnCXYwcHMIC
 oRIr25NAwiwCqhJ7Dy4CK+EVsJCYvfEGG8QCeYnVGw4wg9icApYSN65eArOFgGp2fu5jgqgX
 lDg58wkLyEhmAXWJ9fOEIDbJSzRvnc08gVFwFpKqWQhVs5BULWBkXsUoklpanJueW2ykV5yY
 W1yal66XnJ+7iREYrduO/dyyg7HrXfAhRgEORiUeXoe037FCrIllxZW5hxglOJiVRHhvd/yM
 FeJNSaysSi3Kjy8qzUktPsRoCvTaRGYp0eR8YCLJK4k3NDU0t7A0NDc2NzazUBLn7RA4GCMk
 kJ5YkpqdmlqQWgTTx8TBKdXA6KN24Oe94n9n305TaP6lvKi+e70Mm4/mpg/Z6guurRBk6eWb
 9kfy0Zfej9bqX3M+z55i/HnVinK5O9rdD73LMz5m3T34PyQrhVFwaq2Um0vrq2sXXbIt1X8+
 fXy+SfpFwp54mT+/tojcFejuejk5I6b1bbQFh/80e9Ed917fLXyWtORD301uQyWW4oxEQy3m
 ouJEAA8iFKbsAgAA
X-CMS-MailID: 20191220120143eucas1p1c9b01ae8c2e4ecd70423ef9d8001536f
X-Msg-Generator: CA
X-RootMTR: 20191220120143eucas1p1c9b01ae8c2e4ecd70423ef9d8001536f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191220120143eucas1p1c9b01ae8c2e4ecd70423ef9d8001536f
References: <20191220115653.6487-1-a.swigon@samsung.com>
 <CGME20191220120143eucas1p1c9b01ae8c2e4ecd70423ef9d8001536f@eucas1p1.samsung.com>
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

SW4gdGhlIGV4eW5vcy1idXMgZGV2ZnJlcSBkcml2ZXIgZXZlcnkgYnVzIGlzIHByb2JlZCBzZXBh
cmF0ZWx5IGFuZCBpcwphc3NpZ25lZCBhIHNlcGFyYXRlIGludGVyY29ubmVjdCBwcm92aWRlci4g
SG93ZXZlciwgdGhlIGludGVyY29ubmVjdApmcmFtZXdvcmsgZG9lcyBub3QgY2FsbCB0aGUgJy0+
c2V0JyBjYWxsYmFjayBmb3IgcGFpcnMgb2Ygbm9kZXMgd2hpY2gKYmVsb25nIHRvIGRpZmZlcmVu
dCBwcm92aWRlcnMuCgpUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgYSBuZXcgYm9vbGVhbiAn
aW50ZXJfc2V0JyBmaWVsZCBpbiBzdHJ1Y3QKaWNjX3Byb3ZpZGVyLiBTZXR0aW5nIGl0IHRvICd0
cnVlJyBlbmFibGVzIGNhbGxpbmcgJy0+c2V0JyBmb3IKaW50ZXItcHJvdmlkZXIgbm9kZSBwYWly
cy4gQWxsIGV4aXN0aW5nIHVzZXJzIG9mIHRoZSBpbnRlcmNvbm5lY3QKZnJhbWV3b3JrIGFsbG9j
YXRlIHRoaXMgc3RydWN0dXJlIHdpdGgga3phbGxvYywgYW5kIGFyZSB0aGVyZWZvcmUKdW5hZmZl
Y3RlZC4KClNpZ25lZC1vZmYtYnk6IEFydHVyIMWad2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNv
bT4KLS0tCiBkcml2ZXJzL2ludGVyY29ubmVjdC9jb3JlLmMgICAgICAgICAgIHwgMTEgKysrKyst
LS0tLS0KIGluY2x1ZGUvbGludXgvaW50ZXJjb25uZWN0LXByb3ZpZGVyLmggfCAgMiArKwogMiBm
aWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9pbnRlcmNvbm5lY3QvY29yZS5jIGIvZHJpdmVycy9pbnRlcmNvbm5lY3QvY29y
ZS5jCmluZGV4IDc0YzY4ODk4YTM1MC4uYTI4YmQwZjhhNDk3IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2ludGVyY29ubmVjdC9jb3JlLmMKKysrIGIvZHJpdmVycy9pbnRlcmNvbm5lY3QvY29yZS5jCkBA
IC0yNTksMjMgKzI1OSwyMiBAQCBzdGF0aWMgaW50IGFnZ3JlZ2F0ZV9yZXF1ZXN0cyhzdHJ1Y3Qg
aWNjX25vZGUgKm5vZGUpCiBzdGF0aWMgaW50IGFwcGx5X2NvbnN0cmFpbnRzKHN0cnVjdCBpY2Nf
cGF0aCAqcGF0aCkKIHsKIAlzdHJ1Y3QgaWNjX25vZGUgKm5leHQsICpwcmV2ID0gTlVMTDsKKwlz
dHJ1Y3QgaWNjX3Byb3ZpZGVyICpwOwogCWludCByZXQgPSAtRUlOVkFMOwogCWludCBpOwogCiAJ
Zm9yIChpID0gMDsgaSA8IHBhdGgtPm51bV9ub2RlczsgaSsrKSB7CiAJCW5leHQgPSBwYXRoLT5y
ZXFzW2ldLm5vZGU7CisJCXAgPSBuZXh0LT5wcm92aWRlcjsKIAotCQkvKgotCQkgKiBCb3RoIGVu
ZHBvaW50cyBzaG91bGQgYmUgdmFsaWQgbWFzdGVyLXNsYXZlIHBhaXJzIG9mIHRoZQotCQkgKiBz
YW1lIGludGVyY29ubmVjdCBwcm92aWRlciB0aGF0IHdpbGwgYmUgY29uZmlndXJlZC4KLQkJICov
Ci0JCWlmICghcHJldiB8fCBuZXh0LT5wcm92aWRlciAhPSBwcmV2LT5wcm92aWRlcikgeworCQkv
KiBib3RoIGVuZHBvaW50cyBzaG91bGQgYmUgdmFsaWQgbWFzdGVyLXNsYXZlIHBhaXJzICovCisJ
CWlmICghcHJldiB8fCAocCAhPSBwcmV2LT5wcm92aWRlciAmJiAhcC0+aW50ZXJfc2V0KSkgewog
CQkJcHJldiA9IG5leHQ7CiAJCQljb250aW51ZTsKIAkJfQogCiAJCS8qIHNldCB0aGUgY29uc3Ry
YWludHMgKi8KLQkJcmV0ID0gbmV4dC0+cHJvdmlkZXItPnNldChwcmV2LCBuZXh0KTsKKwkJcmV0
ID0gcC0+c2V0KHByZXYsIG5leHQpOwogCQlpZiAocmV0KQogCQkJZ290byBvdXQ7CiAKZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvaW50ZXJjb25uZWN0LXByb3ZpZGVyLmggYi9pbmNsdWRlL2xp
bnV4L2ludGVyY29ubmVjdC1wcm92aWRlci5oCmluZGV4IGNjOTY1YjhmYWI1My4uYjZhZTBlZTY4
NmM1IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2ludGVyY29ubmVjdC1wcm92aWRlci5oCisr
KyBiL2luY2x1ZGUvbGludXgvaW50ZXJjb25uZWN0LXByb3ZpZGVyLmgKQEAgLTQxLDYgKzQxLDcg
QEAgc3RydWN0IGljY19ub2RlICpvZl9pY2NfeGxhdGVfb25lY2VsbChzdHJ1Y3Qgb2ZfcGhhbmRs
ZV9hcmdzICpzcGVjLAogICogQHhsYXRlOiBwcm92aWRlci1zcGVjaWZpYyBjYWxsYmFjayBmb3Ig
bWFwcGluZyBub2RlcyBmcm9tIHBoYW5kbGUgYXJndW1lbnRzCiAgKiBAZGV2OiB0aGUgZGV2aWNl
IHRoaXMgaW50ZXJjb25uZWN0IHByb3ZpZGVyIGJlbG9uZ3MgdG8KICAqIEB1c2VyczogY291bnQg
b2YgYWN0aXZlIHVzZXJzCisgKiBAaW50ZXJfc2V0OiB3aGV0aGVyIGludGVyLXByb3ZpZGVyIHBh
aXJzIHdpbGwgYmUgY29uZmlndXJlZCB3aXRoIEBzZXQKICAqIEBkYXRhOiBwb2ludGVyIHRvIHBy
aXZhdGUgZGF0YQogICovCiBzdHJ1Y3QgaWNjX3Byb3ZpZGVyIHsKQEAgLTUzLDYgKzU0LDcgQEAg
c3RydWN0IGljY19wcm92aWRlciB7CiAJc3RydWN0IGljY19ub2RlKiAoKnhsYXRlKShzdHJ1Y3Qg
b2ZfcGhhbmRsZV9hcmdzICpzcGVjLCB2b2lkICpkYXRhKTsKIAlzdHJ1Y3QgZGV2aWNlCQkqZGV2
OwogCWludAkJCXVzZXJzOworCWJvb2wJCQlpbnRlcl9zZXQ7CiAJdm9pZAkJCSpkYXRhOwogfTsK
IAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK

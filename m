Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C841076D5
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 18:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36856F4D0;
	Fri, 22 Nov 2019 17:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0516E46E;
 Fri, 22 Nov 2019 17:56:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Nov 2019 09:56:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,230,1571727600"; d="scan'208";a="238687946"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 22 Nov 2019 09:56:35 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Nov 2019 19:56:35 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] drm/rect: Keep the clipped dst rectangle in place
Date: Fri, 22 Nov 2019 19:56:22 +0200
Message-Id: <20191122175623.13565-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191122175623.13565-1-ville.syrjala@linux.intel.com>
References: <20191122175623.13565-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: intel-gfx@lists.freedesktop.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk5v
dyB0aGF0IHdlJ3ZlIGNvbnN0cmFpbmVkIHRoZSBjbGlwcGVkIHNvdXJjZSByZWN0YW5nbGUgc3Vj
aAp0aGF0IGl0IGNhbid0IGhhdmUgbmVnYXRpdmUgZGltZW5zaW9ucyBkb2luZyB0aGUgc2FtZSBm
b3IgdGhlCmRzdCByZWN0YW5nbGUgc2VlbXMgYXBwcm9wcmlhdGUuIFNob3VsZCBhdCBsZWFzdCBy
ZXN1bHQgaW4KdGhlIGNsaXBwZWQgc3JjIGFuZCBkc3QgcmVjdGFuZ2xlcyBiZWluZyBhIGJpdCBt
b3JlIGNvbnNpc3RlbnQKd2l0aCBlYWNoIG90aGVyLgoKQ2M6IEJlbmphbWluIEdhaWduYXJkIDxi
ZW5qYW1pbi5nYWlnbmFyZEBzdC5jb20+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xs
LmNoPgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jIHwgMjIgKysrKysrKysr
KystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDExIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9yZWN0LmMKaW5kZXggYTljN2Y5MDgzNmYzLi4xZTFlMjEwMTAwN2EgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcmVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fcmVjdC5jCkBAIC01Miw3ICs1Miw3IEBAIGJvb2wgZHJtX3JlY3RfaW50ZXJzZWN0KHN0
cnVjdCBkcm1fcmVjdCAqcjEsIGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqcjIpCiB9CiBFWFBPUlRf
U1lNQk9MKGRybV9yZWN0X2ludGVyc2VjdCk7CiAKLXN0YXRpYyB1MzIgY2xpcF9zY2FsZWQodTMy
IHNyYywgdTMyIGRzdCwgdTMyIGNsaXApCitzdGF0aWMgdTMyIGNsaXBfc2NhbGVkKGludCBzcmMs
IGludCBkc3QsIGludCAqY2xpcCkKIHsKIAl1NjQgdG1wOwogCkBAIC02MCw5ICs2MCw5IEBAIHN0
YXRpYyB1MzIgY2xpcF9zY2FsZWQodTMyIHNyYywgdTMyIGRzdCwgdTMyIGNsaXApCiAJCXJldHVy
biAwOwogCiAJLyogT25seSBjbGlwIHdoYXQgd2UgaGF2ZS4gS2VlcHMgdGhlIHJlc3VsdCBib3Vu
ZGVkLiAqLwotCWNsaXAgPSBtaW4oY2xpcCwgZHN0KTsKKwkqY2xpcCA9IG1pbigqY2xpcCwgZHN0
KTsKIAotCXRtcCA9IG11bF91MzJfdTMyKHNyYywgZHN0IC0gY2xpcCk7CisJdG1wID0gbXVsX3Uz
Ml91MzIoc3JjLCBkc3QgLSAqY2xpcCk7CiAKIAkvKgogCSAqIFJvdW5kIHRvd2FyZCAxLjAgd2hl
biBjbGlwcGluZyBzbyB0aGF0IHdlIGRvbid0IGFjY2lkZW50YWxseQpAQCAtOTUsMzQgKzk1LDM0
IEBAIGJvb2wgZHJtX3JlY3RfY2xpcF9zY2FsZWQoc3RydWN0IGRybV9yZWN0ICpzcmMsIHN0cnVj
dCBkcm1fcmVjdCAqZHN0LAogCWRpZmYgPSBjbGlwLT54MSAtIGRzdC0+eDE7CiAJaWYgKGRpZmYg
PiAwKSB7CiAJCXUzMiBuZXdfc3JjX3cgPSBjbGlwX3NjYWxlZChkcm1fcmVjdF93aWR0aChzcmMp
LAotCQkJCQkgICAgZHJtX3JlY3Rfd2lkdGgoZHN0KSwgZGlmZik7CisJCQkJCSAgICBkcm1fcmVj
dF93aWR0aChkc3QpLCAmZGlmZik7CiAKIAkJc3JjLT54MSA9IHNyYy0+eDIgLSBuZXdfc3JjX3c7
Ci0JCWRzdC0+eDEgPSBjbGlwLT54MTsKKwkJZHN0LT54MSArPSBkaWZmOwogCX0KIAlkaWZmID0g
Y2xpcC0+eTEgLSBkc3QtPnkxOwogCWlmIChkaWZmID4gMCkgewogCQl1MzIgbmV3X3NyY19oID0g
Y2xpcF9zY2FsZWQoZHJtX3JlY3RfaGVpZ2h0KHNyYyksCi0JCQkJCSAgICBkcm1fcmVjdF9oZWln
aHQoZHN0KSwgZGlmZik7CisJCQkJCSAgICBkcm1fcmVjdF9oZWlnaHQoZHN0KSwgJmRpZmYpOwog
CiAJCXNyYy0+eTEgPSBzcmMtPnkyIC0gbmV3X3NyY19oOwotCQlkc3QtPnkxID0gY2xpcC0+eTE7
CisJCWRzdC0+eTEgKz0gZGlmZjsKIAl9CiAJZGlmZiA9IGRzdC0+eDIgLSBjbGlwLT54MjsKIAlp
ZiAoZGlmZiA+IDApIHsKIAkJdTMyIG5ld19zcmNfdyA9IGNsaXBfc2NhbGVkKGRybV9yZWN0X3dp
ZHRoKHNyYyksCi0JCQkJCSAgICBkcm1fcmVjdF93aWR0aChkc3QpLCBkaWZmKTsKKwkJCQkJICAg
IGRybV9yZWN0X3dpZHRoKGRzdCksICZkaWZmKTsKIAogCQlzcmMtPngyID0gc3JjLT54MSArIG5l
d19zcmNfdzsKLQkJZHN0LT54MiA9IGNsaXAtPngyOworCQlkc3QtPngyIC09IGRpZmY7CiAJfQog
CWRpZmYgPSBkc3QtPnkyIC0gY2xpcC0+eTI7CiAJaWYgKGRpZmYgPiAwKSB7CiAJCXUzMiBuZXdf
c3JjX2ggPSBjbGlwX3NjYWxlZChkcm1fcmVjdF9oZWlnaHQoc3JjKSwKLQkJCQkJICAgIGRybV9y
ZWN0X2hlaWdodChkc3QpLCBkaWZmKTsKKwkJCQkJICAgIGRybV9yZWN0X2hlaWdodChkc3QpLCAm
ZGlmZik7CiAKIAkJc3JjLT55MiA9IHNyYy0+eTEgKyBuZXdfc3JjX2g7Ci0JCWRzdC0+eTIgPSBj
bGlwLT55MjsKKwkJZHN0LT55MiAtPSBkaWZmOwogCX0KIAogCXJldHVybiBkcm1fcmVjdF92aXNp
YmxlKGRzdCk7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==

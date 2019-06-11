Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0413D42C
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 19:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF67C88E53;
	Tue, 11 Jun 2019 17:30:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 509 seconds by postgrey-1.36 at gabe;
 Tue, 11 Jun 2019 17:30:43 UTC
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.47.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2922488E53
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 17:30:43 +0000 (UTC)
Received: from mailhost.synopsys.com (unknown [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B9498C016F;
 Tue, 11 Jun 2019 17:22:12 +0000 (UTC)
Received: from paltsev-e7480.internal.synopsys.com
 (paltsev-e7480.internal.synopsys.com [10.121.8.58])
 by mailhost.synopsys.com (Postfix) with ESMTP id 97909A022E;
 Tue, 11 Jun 2019 17:22:08 +0000 (UTC)
From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: dri-devel@lists.freedesktop.org,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH] drm/arcpgu: rework encoder search
Date: Tue, 11 Jun 2019 20:21:59 +0300
Message-Id: <20190611172159.24048-1-Eugeniy.Paltsev@synopsys.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1560273733; bh=0vOMGLO1nb4/1qQXTnpKwZ5ss3VewMScaHY/JKElpRU=;
 h=From:To:Cc:Subject:Date:From;
 b=mEG+Kk+MU17YGXVVNiMP3HavxsIygpQwFuDgaPF+bHbluiugCJ2D5Lkt2ZBC/a1VI
 bvvSqdTRwWuVbzoXESWnEJFYLswnqFnbtAEWIlrYI6Lj3u9hygj2hSQEm4TbCI0owS
 8pXg1m1FIasnnAzp7MB4zTylHtWBBOYe/MMNLEa+EiN9/V5vN8i8se3hAQO6oKjmqV
 1MBohj45Ky1pn1VzpuYrVSAUFuLti88i1VK4epQIeMFit7S/2PWEPflOPWZsfxDCYT
 XzO+bvShRqhgABG5Rpgs4O9X4cyAhVF/Btm5YBc/9k48TL5eoI1xGOlQbjVh9mgGJB
 rbuSCx9xXR6PA==
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
Cc: David Airlie <airlied@linux.ie>, linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiB1c2luZyBub24tc3RhbmRhcmQgImVuY29kZXItc2xhdmUiIHByb3BlcnR5IHRv
IGZpbmQKZW5jb2RlciBsZXQncyBmaW5kIGl0IGJ5IGFzc29jaWF0ZWQgZW5kcG9pbnQuCgpXaGls
ZSBJJ20gb24gaXQgYWRkIGNvcnJlc3BvbmRpbmcgbG9nIG1lc3NhZ2UgaWYgd2UgZG9uJ3QgZmlu
ZAphbnkgZW5jb2RlciBhbmQgd2UgYXNzdW1lIHRoYXQgd2UgdXNlIHZpcnR1YWwgTENEIG9uIHRo
ZQpzaW11bGF0aW9uIHBsYXRmb3JtLgoKU2lnbmVkLW9mZi1ieTogRXVnZW5peSBQYWx0c2V2IDxF
dWdlbml5LlBhbHRzZXZAc3lub3BzeXMuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcmMvYXJj
cGd1X2Rydi5jIHwgMTYgKysrKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Fy
Yy9hcmNwZ3VfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJjL2FyY3BndV9kcnYuYwppbmRleCBj
OWY3ODM5N2QzNDUuLmQwOGI5OTc3ZjAyMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Fy
Yy9hcmNwZ3VfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FyYy9hcmNwZ3VfZHJ2LmMKQEAg
LTIzLDYgKzIzLDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5oPgogI2luY2x1ZGUg
PGRybS9kcm1fZ2VtX2NtYV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1
ZmZlcl9oZWxwZXIuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX29mLmg+CiAjaW5jbHVkZSA8ZHJtL2Ry
bV9wcm9iZV9oZWxwZXIuaD4KICNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgogI2luY2x1
ZGUgPGxpbnV4L21vZHVsZS5oPgpAQCAtNTQsNyArNTUsNyBAQCBzdGF0aWMgaW50IGFyY3BndV9s
b2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCiB7CiAJc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldiA9IHRvX3BsYXRmb3JtX2RldmljZShkcm0tPmRldik7CiAJc3RydWN0IGFyY3BndV9kcm1f
cHJpdmF0ZSAqYXJjcGd1OwotCXN0cnVjdCBkZXZpY2Vfbm9kZSAqZW5jb2Rlcl9ub2RlOworCXN0
cnVjdCBkZXZpY2Vfbm9kZSAqZW5jb2Rlcl9ub2RlID0gTlVMTCwgKmVuZHBvaW50X25vZGUgPSBO
VUxMOwogCXN0cnVjdCByZXNvdXJjZSAqcmVzOwogCWludCByZXQ7CiAKQEAgLTg5LDE0ICs5MCwy
MyBAQCBzdGF0aWMgaW50IGFyY3BndV9sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCiAJaWYg
KGFyY19wZ3Vfc2V0dXBfY3J0Yyhkcm0pIDwgMCkKIAkJcmV0dXJuIC1FTk9ERVY7CiAKLQkvKiBm
aW5kIHRoZSBlbmNvZGVyIG5vZGUgYW5kIGluaXRpYWxpemUgaXQgKi8KLQllbmNvZGVyX25vZGUg
PSBvZl9wYXJzZV9waGFuZGxlKGRybS0+ZGV2LT5vZl9ub2RlLCAiZW5jb2Rlci1zbGF2ZSIsIDAp
OworCS8qCisJICogVGhlcmUgaXMgb25seSBvbmUgb3V0cHV0IHBvcnQgaW5zaWRlIGVhY2ggZGV2
aWNlLiBJdCBpcyBsaW5rZWQgd2l0aAorCSAqIGVuY29kZXIgZW5kcG9pbnQuCisJICovCisJZW5k
cG9pbnRfbm9kZSA9IG9mX2dyYXBoX2dldF9uZXh0X2VuZHBvaW50KHBkZXYtPmRldi5vZl9ub2Rl
LCBOVUxMKTsKKwlpZiAoZW5kcG9pbnRfbm9kZSkgeworCQllbmNvZGVyX25vZGUgPSBvZl9ncmFw
aF9nZXRfcmVtb3RlX3BvcnRfcGFyZW50KGVuZHBvaW50X25vZGUpOworCQlvZl9ub2RlX3B1dChl
bmRwb2ludF9ub2RlKTsKKwl9CisKIAlpZiAoZW5jb2Rlcl9ub2RlKSB7CiAJCXJldCA9IGFyY3Bn
dV9kcm1faGRtaV9pbml0KGRybSwgZW5jb2Rlcl9ub2RlKTsKIAkJb2Zfbm9kZV9wdXQoZW5jb2Rl
cl9ub2RlKTsKIAkJaWYgKHJldCA8IDApCiAJCQlyZXR1cm4gcmV0OwogCX0gZWxzZSB7CisJCWRl
dl9pbmZvKGRybS0+ZGV2LCAibm8gZW5jb2RlciBmb3VuZC4gQXNzdW1lZCB2aXJ0dWFsIExDRCBv
biBzaW11bGF0aW9uIHBsYXRmb3JtXG4iKTsKIAkJcmV0ID0gYXJjcGd1X2RybV9zaW1faW5pdChk
cm0sIE5VTEwpOwogCQlpZiAocmV0IDwgMCkKIAkJCXJldHVybiByZXQ7Ci0tIAoyLjIxLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

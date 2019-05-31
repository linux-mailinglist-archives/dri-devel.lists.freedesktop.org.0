Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82B2315BC
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2019 21:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC1C898CA;
	Fri, 31 May 2019 19:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB4B98921B;
 Fri, 31 May 2019 09:46:31 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id 0A4BB45087;
 Fri, 31 May 2019 09:46:31 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com, sean@poorly.run, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 airlied@linux.ie, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org, jonathan@marek.ca, robh@kernel.org,
 jeffrey.l.hugo@gmail.com
Subject: [PATCH v3 2/6] drm/msm: add support for per-CRTC max_vblank_count on
 mdp5
Date: Fri, 31 May 2019 05:46:15 -0400
Message-Id: <20190531094619.31704-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531094619.31704-1-masneyb@onstation.org>
References: <20190531094619.31704-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 May 2019 19:58:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1559295991;
 bh=khceW3oTDnZuJ9pCQ9vj4791T1g33OkiuYlCSUfX8j0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cmkYbBTl/UKUQ9orp1TlisQmqA+INlPv1u7NEMek2qgo2vUe+eoSaZafx4it1+KuN
 rs9EHcIADyUERvSQI1OkEwNU0ILrrEtm1/OM152c/KM0QrrCzqCQ2xE1uY8eZo+Nlc
 n28P7b4v5O+dPfwhkszVxukIDoKfETYyIfev66yA=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG1kcDUgZHJtL2ttcyBkcml2ZXIgY3VycmVudGx5IGRvZXMgbm90IHdvcmsgb24gY29tbWFu
ZC1tb2RlIERTSQpwYW5lbHMgZHVlIHRvICd2Ymxhbmsgd2FpdCB0aW1lZCBvdXQnIGVycm9ycy4g
VGhpcyBjYXVzZXMgYSBsYXRlbmN5Cm9mIHNlY29uZHMsIG9yIHRlbnMgb2Ygc2Vjb25kcyBpbiBz
b21lIGNhc2VzLCBiZWZvcmUgY29udGVudCBpcyBzaG93bgpvbiB0aGUgcGFuZWwuIFRoaXMgaGFy
ZHdhcmUgZG9lcyBub3QgaGF2ZSB0aGUgc29tZXRoaW5nIHRoYXQgd2UgY2FuIHVzZQphcyBhIGZy
YW1lIGNvdW50ZXIgYXZhaWxhYmxlIHdoZW4gcnVubmluZyBpbiBjb21tYW5kIG1vZGUsIHNvIHdl
IG5lZWQgdG8KZmFsbCBiYWNrIHRvIHVzaW5nIHRpbWVzdGFtcHMgYnkgc2V0dGluZyB0aGUgbWF4
X3ZibGFua19jb3VudCB0byB6ZXJvLgpUaGlzIGNhbiBiZSBkb25lIG9uIGEgcGVyLUNSVEMgYmFz
aXMsIHNvIHRoZSBjb252ZXJ0IG1kcDUgdG8gdXNlCmRybV9jcnRjX3NldF9tYXhfdmJsYW5rX2Nv
dW50KCkuCgpUaGlzIGNoYW5nZSB3YXMgdGVzdGVkIG9uIGEgTEcgTmV4dXMgNSAoaGFtbWVyaGVh
ZCkgcGhvbmUuCgpTaWduZWQtb2ZmLWJ5OiBCcmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9u
Lm9yZz4KU3VnZ2VzdGVkLWJ5OiBKZWZmcmV5IEh1Z28gPGplZmZyZXkubC5odWdvQGdtYWlsLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NydGMuYyB8IDE2ICsr
KysrKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMg
IHwgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2NydGMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfY3J0Yy5jCmluZGV4IGMzNzUx
Yzk1YjQ1Mi4uNmZkZTEwOTc4NDRmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvbWRwNS9tZHA1X2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9t
ZHA1X2NydGMuYwpAQCAtNDUwLDYgKzQ1MCwxOCBAQCBzdGF0aWMgdm9pZCBtZHA1X2NydGNfYXRv
bWljX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCW1kcDVfY3J0Yy0+ZW5hYmxlZCA9
IGZhbHNlOwogfQogCitzdGF0aWMgdm9pZCBtZHA1X2NydGNfdmJsYW5rX29uKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YykKK3sKKwlzdHJ1Y3QgbWRwNV9jcnRjX3N0YXRlICptZHA1X2NzdGF0ZSA9IHRv
X21kcDVfY3J0Y19zdGF0ZShjcnRjLT5zdGF0ZSk7CisJc3RydWN0IG1kcDVfaW50ZXJmYWNlICpp
bnRmID0gbWRwNV9jc3RhdGUtPnBpcGVsaW5lLmludGY7CisJdTMyIGNvdW50OworCisJY291bnQg
PSBpbnRmLT5tb2RlID09IE1EUDVfSU5URl9EU0lfTU9ERV9DT01NQU5EID8gMCA6IDB4ZmZmZmZm
ZmY7CisJZHJtX2NydGNfc2V0X21heF92YmxhbmtfY291bnQoY3J0YywgY291bnQpOworCisJZHJt
X2NydGNfdmJsYW5rX29uKGNydGMpOworfQorCiBzdGF0aWMgdm9pZCBtZHA1X2NydGNfYXRvbWlj
X2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJCQkJICAgIHN0cnVjdCBkcm1fY3J0Y19z
dGF0ZSAqb2xkX3N0YXRlKQogewpAQCAtNDg2LDcgKzQ5OCw3IEBAIHN0YXRpYyB2b2lkIG1kcDVf
Y3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAl9CiAKIAkvKiBSZXN0
b3JlIHZibGFuayBpcnEgaGFuZGxpbmcgYWZ0ZXIgcG93ZXIgaXMgZW5hYmxlZCAqLwotCWRybV9j
cnRjX3ZibGFua19vbihjcnRjKTsKKwltZHA1X2NydGNfdmJsYW5rX29uKGNydGMpOwogCiAJbWRw
NV9jcnRjX21vZGVfc2V0X25vZmIoY3J0Yyk7CiAKQEAgLTEwMzksNiArMTA1MSw4IEBAIHN0YXRp
YyB2b2lkIG1kcDVfY3J0Y19yZXNldChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpCiAJCW1kcDVfY3J0
Y19kZXN0cm95X3N0YXRlKGNydGMsIGNydGMtPnN0YXRlKTsKIAogCV9fZHJtX2F0b21pY19oZWxw
ZXJfY3J0Y19yZXNldChjcnRjLCAmbWRwNV9jc3RhdGUtPmJhc2UpOworCisJZHJtX2NydGNfdmJs
YW5rX3Jlc2V0KGNydGMpOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9jcnRjX2Z1bmNz
IG1kcDVfY3J0Y19mdW5jcyA9IHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9tZHA1L21kcDVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2tt
cy5jCmluZGV4IDk3MTc5YmVjODkwMi4uZmNiMGIwNDU1YWJlIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9tZHA1L21kcDVfa21zLmMKQEAgLTc1MCw3ICs3NTAsNyBAQCBzdHJ1Y3QgbXNtX2tt
cyAqbWRwNV9rbXNfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCWRldi0+ZHJpdmVyLT5n
ZXRfdmJsYW5rX3RpbWVzdGFtcCA9IGRybV9jYWxjX3ZibHRpbWVzdGFtcF9mcm9tX3NjYW5vdXRw
b3M7CiAJZGV2LT5kcml2ZXItPmdldF9zY2Fub3V0X3Bvc2l0aW9uID0gbWRwNV9nZXRfc2Nhbm91
dHBvczsKIAlkZXYtPmRyaXZlci0+Z2V0X3ZibGFua19jb3VudGVyID0gbWRwNV9nZXRfdmJsYW5r
X2NvdW50ZXI7Ci0JZGV2LT5tYXhfdmJsYW5rX2NvdW50ID0gMHhmZmZmZmZmZjsKKwlkZXYtPm1h
eF92YmxhbmtfY291bnQgPSAwOyAvKiBtYXhfdmJsYW5rX2NvdW50IGlzIHNldCBvbiBlYWNoIENS
VEMgKi8KIAlkZXYtPnZibGFua19kaXNhYmxlX2ltbWVkaWF0ZSA9IHRydWU7CiAKIAlyZXR1cm4g
a21zOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=

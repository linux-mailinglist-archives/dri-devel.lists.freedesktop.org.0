Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C6186558
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 17:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068926E879;
	Thu,  8 Aug 2019 15:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C7726E86D
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 15:12:11 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4601128CAC2;
 Thu,  8 Aug 2019 16:12:09 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RFC 16/19] drm/bridge: lvds-encoder: Add a way to support
 custom ->atomic_check() implem
Date: Thu,  8 Aug 2019 17:11:47 +0200
Message-Id: <20190808151150.16336-17-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190808151150.16336-1-boris.brezillon@collabora.com>
References: <20190808151150.16336-1-boris.brezillon@collabora.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Chris Healy <Chris.Healy@zii.aero>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSBMVkRTIGRyaXZlcnMgbWlnaHQgd2FudCB0byBuZWdvdGlhdGUgdGhlIGJ1cyBmb3JtYXQg
d2l0aCB0aGUKcHJldmlvdXMgZWxlbWVudCBpbiB0aGUgZW5jb2RlciBjaGFpbi4gTGV0J3MgZGVm
aW5lIGEgY2hpcC1zcGVjaWZpYyBvcHMKc3RydWN0dXJlIHRoYXQgY29udGFpbnMgYW4gLT5hdG9t
aWNfY2hlY2soKSBob29rIGFuZCBwbHVnIHRoYXQgdG8gdGhlCmRybV9icmlkZ2UtPmF0b21pY19j
aGVjaygpIGluZnJhLgoKU2lnbmVkLW9mZi1ieTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6
aWxsb25AY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtZW5j
b2Rlci5jIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MjcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZk
cy1lbmNvZGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtZW5jb2Rlci5jCmluZGV4
IDJhYjJjMjM0ZjI2Yy4uZGE3MDEzYzVmYWYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2x2ZHMtZW5jb2Rlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbHZkcy1l
bmNvZGVyLmMKQEAgLTYsMTYgKzYsMjUgQEAKICNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1bWVy
Lmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvb2YuaD4KKyNp
bmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4KICNpbmNsdWRlIDxsaW51eC9vZl9ncmFwaC5oPgog
I2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgogCiAjaW5jbHVkZSA8ZHJtL2RybV9i
cmlkZ2UuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3BhbmVsLmg+CiAKK3N0cnVjdCBsdmRzX2VuY29k
ZXJfb3BzIHsKKwlpbnQgKCphdG9taWNfY2hlY2spKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2Us
CisJCQkgICAgc3RydWN0IGRybV9icmlkZ2Vfc3RhdGUgKmJyaWRlX3N0YXRlLAorCQkJICAgIHN0
cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwKKwkJCSAgICBzdHJ1Y3QgZHJtX2Nvbm5l
Y3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZSk7Cit9OworCiBzdHJ1Y3QgbHZkc19lbmNvZGVyIHsKIAlz
dHJ1Y3QgZHJtX2JyaWRnZSBicmlkZ2U7CiAJc3RydWN0IGRybV9icmlkZ2UgKnBhbmVsX2JyaWRn
ZTsKIAlzdHJ1Y3QgZ3Bpb19kZXNjICpwb3dlcmRvd25fZ3BpbzsKKwljb25zdCBzdHJ1Y3QgbHZk
c19lbmNvZGVyX29wcyAqb3BzOwogfTsKIAogc3RhdGljIGludCBsdmRzX2VuY29kZXJfYXR0YWNo
KHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCkBAIC00OCwxMCArNTcsMjcgQEAgc3RhdGljIHZv
aWQgbHZkc19lbmNvZGVyX2Rpc2FibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKIAkJZ3Bp
b2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKGx2ZHNfZW5jb2Rlci0+cG93ZXJkb3duX2dwaW8sIDEpOwog
fQogCitzdGF0aWMgaW50IGx2ZHNfZW5jb2Rlcl9hdG9taWNfY2hlY2soc3RydWN0IGRybV9icmlk
Z2UgKmJyaWRnZSwKKwkJCQkgICAgIHN0cnVjdCBkcm1fYnJpZGdlX3N0YXRlICpicmlkZ2Vfc3Rh
dGUsCisJCQkJICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsCisJCQkJICAg
ICBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZSkKK3sKKwlzdHJ1Y3QgbHZk
c19lbmNvZGVyICpsdmRzX2VuY29kZXIgPSBjb250YWluZXJfb2YoYnJpZGdlLAorCQkJCQkJCSBz
dHJ1Y3QgbHZkc19lbmNvZGVyLAorCQkJCQkJCSBicmlkZ2UpOworCisJaWYgKCFsdmRzX2VuY29k
ZXItPm9wcyAmJiAhbHZkc19lbmNvZGVyLT5vcHMtPmF0b21pY19jaGVjaykKKwkJcmV0dXJuIDA7
CisKKwlyZXR1cm4gbHZkc19lbmNvZGVyLT5vcHMtPmF0b21pY19jaGVjayhicmlkZ2UsIGJyaWRn
ZV9zdGF0ZSwKKwkJCQkJICAgICAgIGNydGNfc3RhdGUsIGNvbm5fc3RhdGUpOworfQorCiBzdGF0
aWMgc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgZnVuY3MgPSB7CiAJLmF0dGFjaCA9IGx2ZHNfZW5j
b2Rlcl9hdHRhY2gsCiAJLmVuYWJsZSA9IGx2ZHNfZW5jb2Rlcl9lbmFibGUsCiAJLmRpc2FibGUg
PSBsdmRzX2VuY29kZXJfZGlzYWJsZSwKKwkuYXRvbWljX2NoZWNrID0gbHZkc19lbmNvZGVyX2F0
b21pY19jaGVjaywKIH07CiAKIHN0YXRpYyBpbnQgbHZkc19lbmNvZGVyX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCkBAIC02Nyw2ICs5Myw3IEBAIHN0YXRpYyBpbnQgbHZkc19l
bmNvZGVyX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJaWYgKCFsdmRzX2Vu
Y29kZXIpCiAJCXJldHVybiAtRU5PTUVNOwogCisJbHZkc19lbmNvZGVyLT5vcHMgPSBvZl9kZXZp
Y2VfZ2V0X21hdGNoX2RhdGEoJnBkZXYtPmRldik7CiAJbHZkc19lbmNvZGVyLT5wb3dlcmRvd25f
Z3BpbyA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKGRldiwgInBvd2VyZG93biIsCiAJCQkJCQkJ
ICAgICAgIEdQSU9EX09VVF9ISUdIKTsKIAlpZiAoSVNfRVJSKGx2ZHNfZW5jb2Rlci0+cG93ZXJk
b3duX2dwaW8pKSB7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==

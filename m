Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6F9BE5B2
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 21:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12C76F534;
	Wed, 25 Sep 2019 19:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A616F51E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 19:31:54 +0000 (UTC)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net
 [71.197.186.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 531D321D7A;
 Wed, 25 Sep 2019 19:31:54 +0000 (UTC)
From: Kevin Hilman <khilman@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/meson: enable runtime PM
Date: Wed, 25 Sep 2019 12:31:54 -0700
Message-Id: <20190925193154.20732-1-khilman@kernel.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569439914;
 bh=tVJ3MnTdv85ltB6ucAQ46KlHKpnPNYJaGZPDutR3fp8=;
 h=From:To:Cc:Subject:Date:From;
 b=Jd9KEG6M9wIhSdq/pkhMiCLEGnUUrEvd/n5hgE/6vMLCwlxnCwwnVESoKRkVFnD9d
 eLdfreA03h5EA/fxmJlYh5I8+DuafRSO1ow8Jq8SRwnKGcHVjzmmHRvrG8Umz2v1Ob
 zXCEBpqOdLZxlSkcfIvKJDYbAGoGk+9t75R+9f8c=
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
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gSGlsbWFuIDxraGlsbWFuQGJheWxpYnJlLmNvbT4KCk9uIHNvbWUgU29Dcywg
dGhlIFZQVSBpcyBpbiBhIHBvd2VyLWRvbWFpbiBhbmQgbmVlZHMgcnVudGltZSBQTQplbmFibGVk
IGFuZCB1c2VkIGluIG9yZGVyIHRvIGtlZXAgdGhlIHBvd2VyIGRvbWFpbiBvbi4KClNpZ25lZC1v
ZmYtYnk6IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX2Rydi5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5j
IGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jCmluZGV4IDIzMTBjOTZmZmY0Ni4u
MjU2YjZhMGU5YzZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jCkBAIC0xNCw2ICsxNCw3
IEBACiAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgv
Y29tcG9uZW50Lmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfZ3JhcGguaD4KKyNpbmNsdWRlIDxsaW51
eC9wbV9ydW50aW1lLmg+CiAKICNpbmNsdWRlIDxkcm0vZHJtUC5oPgogI2luY2x1ZGUgPGRybS9k
cm1fYXRvbWljLmg+CkBAIC0yNzQsNiArMjc1LDcgQEAgc3RhdGljIGludCBtZXNvbl9kcnZfYmlu
ZF9tYXN0ZXIoc3RydWN0IGRldmljZSAqZGV2LCBib29sIGhhc19jb21wb25lbnRzKQogCiAJLyog
SGFyZHdhcmUgSW5pdGlhbGl6YXRpb24gKi8KIAorCXBtX3J1bnRpbWVfZ2V0X3N5bmMoZGV2KTsK
IAltZXNvbl92cHVfaW5pdChwcml2KTsKIAltZXNvbl92ZW5jX2luaXQocHJpdik7CiAJbWVzb25f
dnBwX2luaXQocHJpdik7CkBAIC00MTYsNiArNDE4LDcgQEAgc3RhdGljIGludCBtZXNvbl9kcnZf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlzdHJ1Y3QgZGV2aWNlX25vZGUg
KmVwLCAqcmVtb3RlOwogCWludCBjb3VudCA9IDA7CiAKKwlwbV9ydW50aW1lX2VuYWJsZSgmcGRl
di0+ZGV2KTsKIAlmb3JfZWFjaF9lbmRwb2ludF9vZl9ub2RlKG5wLCBlcCkgewogCQlyZW1vdGUg
PSBvZl9ncmFwaF9nZXRfcmVtb3RlX3BvcnRfcGFyZW50KGVwKTsKIAkJaWYgKCFyZW1vdGUgfHwg
IW9mX2RldmljZV9pc19hdmFpbGFibGUocmVtb3RlKSkgewpAQCAtNDQwLDYgKzQ0Myw3IEBAIHN0
YXRpYyBpbnQgbWVzb25fZHJ2X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJ
fQogCiAJLyogSWYgbm8gb3V0cHV0IGVuZHBvaW50cyB3ZXJlIGF2YWlsYWJsZSwgc2ltcGx5IGJh
aWwgb3V0ICovCisJcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2LT5kZXYpOwogCXJldHVybiAwOwog
fTsKIAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A59BD35ECC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 16:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AFD89B4D;
	Wed,  5 Jun 2019 14:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18CF89B18
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 14:12:58 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id t5so2468600wmh.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 07:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CiicJKseqdKOg5DHKMcjVCBzkcBVtZ2N776bahkz4d8=;
 b=PY97yGfZ+K5VVy038EDWJyg5CKhdLnZ2OWGaw58GNbMIr4po1cxQqTL6BqCJZVCRTQ
 GoPe2pTLvVtMGhYkvmcbEZHIkz+1B7YiLU8AP3Vl6YCRz3ltisJPOYVht7OdbJvb1KHj
 LlbmeCOKIVBPKfJLiwyWDqjgu9BzlNsBqBYIEv8/J6ZAmnjV2s6IdT70fWBwm47KkExl
 MPGQWMJUj00qgUypgeAbnJs8FRKQg2lvZ4D4YFCquO3REoNvplShUjSo18TfG0gKsP/w
 0iDjF7OVmxessKiRqCJvlfLdVGobtnMbu4eiP23bbpohN73mPrtkqs3LrAyKJHp3ZRxl
 6KXw==
X-Gm-Message-State: APjAAAVvwNrZqCSOOmJJFkQK6CIRj1PdU3SYC2+VCpKDie4lao04YRqr
 +n5fY4jQrk99kkDn9yELTMNj45iwGZIthQ==
X-Google-Smtp-Source: APXvYqzI3IVVjrCS/CpME4PJLgA844fWjiI4G6tQsgpnScJPfDZYOVtvDPHviInkIWlgQ7OFwSUOYQ==
X-Received: by 2002:a1c:48c5:: with SMTP id
 v188mr21902049wma.175.1559743976973; 
 Wed, 05 Jun 2019 07:12:56 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s8sm36292546wra.55.2019.06.05.07.12.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 07:12:56 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/meson: fix primary plane disabling
Date: Wed,  5 Jun 2019 16:12:52 +0200
Message-Id: <20190605141253.24165-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605141253.24165-1-narmstrong@baylibre.com>
References: <20190605141253.24165-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CiicJKseqdKOg5DHKMcjVCBzkcBVtZ2N776bahkz4d8=;
 b=Asrc1pFrwP/vms/HaF6ahudawkZj7r6MSdAFZiQNwE+2rIPqYk39LYibggrg3PpASb
 Lxs45FxLnqC1K6Z/+7Qt29IjRcH8V0USApXqVIJh4XCCSi2Z/V/mSNnpJyrDyuj0XZz4
 qEF5f/ioRukigieqF0HWRUSDmdzxjPElHcPTn9y/2MPWUrxqfLK2lPsPJf0QpQjgrQ/V
 ZDzG5+XmDVDVT/CVqrOlrt0/1cB3v8Hp6w19zCN0YcksRErl4ZCUJcJaoMFkrkvOlwji
 SfSmivfvh6n+9o7pF6OSRL9rtTFVHzKJ3hcycaKKwx/ELndMtA0+ufNTmh2jnAMtY6RL
 UbYA==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHByaW1hcnkgcGxhbmUgZGlzYWJsZSBsb2dpYyBpcyBmbGF3ZWQsIHdoZW4gdGhlIHByaW1h
cnkgcGxhbmUgaXMKZGlzYWJsZWQsIGl0IGlzIHJlLWVuYWJsZWQgaW4gdGhlIHZzeW5jIGlycSB3
aGVuIGFub3RoZXIgcGxhbmUgaXMgdXBkYXRlZC4KCkhhbmRsZSB0aGUgcGxhbmUgZGlzYWJsaW5n
IGNvcnJlY3RseSBieSBoYW5kbGluZyB0aGUgcHJpbWFyeSBwbGFuZQplbmFibGUgZmxhZyBpbiB0
aGUgcHJpbWFyeSBwbGFuZSB1cGRhdGUgJiBkaXNhYmxlIGNhbGxiYWNrcy4KCkZpeGVzOiA0OTBm
NTBjMTA5ZDEgKCJkcm0vbWVzb246IEFkZCBHMTJBIHN1cHBvcnQgZm9yIE9TRDEgUGxhbmUiKQpT
aWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2NydGMuYyAgfCA0IC0tLS0KIGRyaXZlcnMv
Z3B1L2RybS9tZXNvbi9tZXNvbl9wbGFuZS5jIHwgNCArKystCiAyIGZpbGVzIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVzb24vbWVzb25fY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2NydGMu
YwppbmRleCA2ODU3MTUxNDQxNTYuLjUwYTlhOTY3MjBiOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVz
b25fY3J0Yy5jCkBAIC0xMDcsOCArMTA3LDYgQEAgc3RhdGljIHZvaWQgbWVzb25fZzEyYV9jcnRj
X2F0b21pY19lbmFibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLAogCQkJcHJpdi0+aW9fYmFzZSAr
IF9SRUcoVlBQX09VVF9IX1ZfU0laRSkpOwogCiAJZHJtX2NydGNfdmJsYW5rX29uKGNydGMpOwot
Ci0JcHJpdi0+dml1Lm9zZDFfZW5hYmxlZCA9IHRydWU7CiB9CiAKIHN0YXRpYyB2b2lkIG1lc29u
X2NydGNfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCkBAIC0xMzcsOCArMTM1
LDYgQEAgc3RhdGljIHZvaWQgbWVzb25fY3J0Y19hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0
YyAqY3J0YywKIAkJCSAgICBwcml2LT5pb19iYXNlICsgX1JFRyhWUFBfTUlTQykpOwogCiAJZHJt
X2NydGNfdmJsYW5rX29uKGNydGMpOwotCi0JcHJpdi0+dml1Lm9zZDFfZW5hYmxlZCA9IHRydWU7
CiB9CiAKIHN0YXRpYyB2b2lkIG1lc29uX2cxMmFfY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3Qg
ZHJtX2NydGMgKmNydGMsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25f
cGxhbmUuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9wbGFuZS5jCmluZGV4IDIyNDkw
MDQ3OTMyZS4uYjc4ODI4MDg5NWM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24v
bWVzb25fcGxhbmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcGxhbmUuYwpA
QCAtMzA1LDYgKzMwNSw4IEBAIHN0YXRpYyB2b2lkIG1lc29uX3BsYW5lX2F0b21pY191cGRhdGUo
c3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJCW1lc29uX3BsYW5lLT5lbmFibGVkID0gdHJ1ZTsK
IAl9CiAKKwlwcml2LT52aXUub3NkMV9lbmFibGVkID0gdHJ1ZTsKKwogCXNwaW5fdW5sb2NrX2ly
cXJlc3RvcmUoJnByaXYtPmRybS0+ZXZlbnRfbG9jaywgZmxhZ3MpOwogfQogCkBAIC0zMjMsNyAr
MzI1LDcgQEAgc3RhdGljIHZvaWQgbWVzb25fcGxhbmVfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRy
bV9wbGFuZSAqcGxhbmUsCiAJCQkJICAgIHByaXYtPmlvX2Jhc2UgKyBfUkVHKFZQUF9NSVNDKSk7
CiAKIAltZXNvbl9wbGFuZS0+ZW5hYmxlZCA9IGZhbHNlOwotCisJcHJpdi0+dml1Lm9zZDFfZW5h
YmxlZCA9IGZhbHNlOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9oZWxwZXJf
ZnVuY3MgbWVzb25fcGxhbmVfaGVscGVyX2Z1bmNzID0gewotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

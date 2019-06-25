Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5E95641B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CC96E2D5;
	Wed, 26 Jun 2019 08:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582966E171
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:35:04 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 207so3521156wma.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:35:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q8CTKhWBWFU1fqIPJGLSNQd9vJ1aS8JWPNlYGCmcN8g=;
 b=Zf6ewEZSNhKgF2YIMcctBW5D8Eao2KbrFGMJQrQqZKc3Ar5k4J+a0Xew4Wk4zf/KuB
 H8FUAJgdf/dz2VnFT+kNJsNkelH9w8HiAVCSZVFXS+bMQfK9WsE3NZTpKlT3zGjHm8tG
 jyMNU+d0zAmASn9NLJcIjai2rFWclPe3Yet0y/IYctU8OPIPJ/fjgUkJ1M8xlUH8B8DM
 DyW2vhbdfr334ajp+40zJYGJho8Awp/X7OZcoMpNCDgx6tHqF/MecTMjKJuTT7X024sN
 //5ox1DiAGatFh75B8InucT3jinEl7jDT5hc6mD0lNOgjFHZ6cJprZjYJ5lSgrYGWkgL
 Sr7g==
X-Gm-Message-State: APjAAAUKrv5v/zd4ldz8TUQ6/sr7U861XBmnInzb6WTBtYNv+b1iiDue
 R2zROGwljg6vvr/Acd/1yHdskA==
X-Google-Smtp-Source: APXvYqy9vA8JJyTM1z74NApjY88ZDcDlQT7HuRw6dubZNjHezxo9Xp8wOa5eR0G69DpWTbPZXt+I1w==
X-Received: by 2002:a1c:40c6:: with SMTP id
 n189mr19922351wma.118.1561480502950; 
 Tue, 25 Jun 2019 09:35:02 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.35.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 09:35:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Lechner <david@lechnology.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 09/12] fbdev: da8xx: remove panel_power_ctrl() callback from
 platform data
Date: Tue, 25 Jun 2019 18:34:31 +0200
Message-Id: <20190625163434.13620-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625163434.13620-1-brgl@bgdev.pl>
References: <20190625163434.13620-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q8CTKhWBWFU1fqIPJGLSNQd9vJ1aS8JWPNlYGCmcN8g=;
 b=jrA5ZxxSlBscH60wVMRBFqwb9J9maa3kZ+JU/Fp6J34myN9KJoXuFwMIV3ZMmz7DNl
 JG1+U+oqjwTTtkfTBwVSTD9L0stYYQBCQZkkcL3caSVFgC7U6RXMgCV/zfQrx45vdTPR
 ayJ9TIWzXGPqIe9iL9vtxCexuyN/YsuaVdU4T1Q4mDvSPLx+u2zB3+l0GtmMMSE7vAuY
 HbLhX9dVYD7+9Iarnn6PZ2NDdK94xvM49thFHPfOOqjj+zAUG4SbHrwUzjnbuK/64XdC
 3fSgoI3x6TSweLX2gY1e5b8i24ts0cvG/7te0F0uN7yuIYRTLlPHbaTRofncPw/XoXFE
 Gz/w==
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
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClRo
ZXJlIGFyZSBubyBtb3JlIHVzZXJzIG9mIHBhbmVsX3Bvd2VyX2N0cmwoKS4gUmVtb3ZlIGl0IGZy
b20gdGhlCmRyaXZlci4KClNpZ25lZC1vZmYtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJnb2xh
c3pld3NraUBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9kYTh4eC1mYi5j
IHwgMjUgKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQogaW5jbHVkZS92aWRlby9kYTh4eC1mYi5o
ICAgICAgIHwgIDEgLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIxIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvZGE4eHgtZmIuYyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvZGE4eHgtZmIuYwppbmRleCA0ZmE5OWZmNzlmM2IuLjMyOGRlMjlj
NDkzMyAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9kYTh4eC1mYi5jCisrKyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvZGE4eHgtZmIuYwpAQCAtMTY1LDcgKzE2NSw2IEBAIHN0cnVjdCBk
YTh4eF9mYl9wYXIgewogCXN0cnVjdCBub3RpZmllcl9ibG9jawlmcmVxX3RyYW5zaXRpb247CiAj
ZW5kaWYKIAl1bnNpZ25lZCBpbnQJCWxjZGNfY2xrX3JhdGU7Ci0Jdm9pZCAoKnBhbmVsX3Bvd2Vy
X2N0cmwpKGludCk7CiAJc3RydWN0IHJlZ3VsYXRvcgkqbGNkX3N1cHBseTsKIAl1MzIgcHNldWRv
X3BhbGV0dGVbMTZdOwogCXN0cnVjdCBmYl92aWRlb21vZGUJbW9kZTsKQEAgLTEwNzYsOSArMTA3
NSw3IEBAIHN0YXRpYyBpbnQgZmJfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikK
ICNpZmRlZiBDT05GSUdfQ1BVX0ZSRVEKIAkJbGNkX2RhOHh4X2NwdWZyZXFfZGVyZWdpc3Rlcihw
YXIpOwogI2VuZGlmCi0JCWlmIChwYXItPnBhbmVsX3Bvd2VyX2N0cmwpIHsKLQkJCXBhci0+cGFu
ZWxfcG93ZXJfY3RybCgwKTsKLQkJfSBlbHNlIGlmIChwYXItPmxjZF9zdXBwbHkpIHsKKwkJaWYg
KHBhci0+bGNkX3N1cHBseSkgewogCQkJcmV0ID0gcmVndWxhdG9yX2Rpc2FibGUocGFyLT5sY2Rf
c3VwcGx5KTsKIAkJCWlmIChyZXQpCiAJCQkJcmV0dXJuIHJldDsKQEAgLTExODcsOSArMTE4NCw3
IEBAIHN0YXRpYyBpbnQgY2ZiX2JsYW5rKGludCBibGFuaywgc3RydWN0IGZiX2luZm8gKmluZm8p
CiAJY2FzZSBGQl9CTEFOS19VTkJMQU5LOgogCQlsY2RfZW5hYmxlX3Jhc3RlcigpOwogCi0JCWlm
IChwYXItPnBhbmVsX3Bvd2VyX2N0cmwpIHsKLQkJCXBhci0+cGFuZWxfcG93ZXJfY3RybCgxKTsK
LQkJfSBlbHNlIGlmIChwYXItPmxjZF9zdXBwbHkpIHsKKwkJaWYgKHBhci0+bGNkX3N1cHBseSkg
ewogCQkJcmV0ID0gcmVndWxhdG9yX2VuYWJsZShwYXItPmxjZF9zdXBwbHkpOwogCQkJaWYgKHJl
dCkKIAkJCQlyZXR1cm4gcmV0OwpAQCAtMTE5OSw5ICsxMTk0LDcgQEAgc3RhdGljIGludCBjZmJf
YmxhbmsoaW50IGJsYW5rLCBzdHJ1Y3QgZmJfaW5mbyAqaW5mbykKIAljYXNlIEZCX0JMQU5LX1ZT
WU5DX1NVU1BFTkQ6CiAJY2FzZSBGQl9CTEFOS19IU1lOQ19TVVNQRU5EOgogCWNhc2UgRkJfQkxB
TktfUE9XRVJET1dOOgotCQlpZiAocGFyLT5wYW5lbF9wb3dlcl9jdHJsKSB7Ci0JCQlwYXItPnBh
bmVsX3Bvd2VyX2N0cmwoMCk7Ci0JCX0gZWxzZSBpZiAocGFyLT5sY2Rfc3VwcGx5KSB7CisJCWlm
IChwYXItPmxjZF9zdXBwbHkpIHsKIAkJCXJldCA9IHJlZ3VsYXRvcl9kaXNhYmxlKHBhci0+bGNk
X3N1cHBseSk7CiAJCQlpZiAocmV0KQogCQkJCXJldHVybiByZXQ7CkBAIC0xNDE0LDEwICsxNDA3
LDYgQEAgc3RhdGljIGludCBmYl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXZpY2Up
CiAJcGFyLT5kZXYgPSAmZGV2aWNlLT5kZXY7CiAJcGFyLT5sY2RjX2NsayA9IHRtcF9sY2RjX2Ns
azsKIAlwYXItPmxjZGNfY2xrX3JhdGUgPSBjbGtfZ2V0X3JhdGUocGFyLT5sY2RjX2Nsayk7Ci0J
aWYgKGZiX3BkYXRhLT5wYW5lbF9wb3dlcl9jdHJsKSB7Ci0JCXBhci0+cGFuZWxfcG93ZXJfY3Ry
bCA9IGZiX3BkYXRhLT5wYW5lbF9wb3dlcl9jdHJsOwotCQlwYXItPnBhbmVsX3Bvd2VyX2N0cmwo
MSk7Ci0JfQogCiAJcGFyLT5sY2Rfc3VwcGx5ID0gZGV2bV9yZWd1bGF0b3JfZ2V0X29wdGlvbmFs
KCZkZXZpY2UtPmRldiwgImxjZCIpOwogCWlmIChJU19FUlIocGFyLT5sY2Rfc3VwcGx5KSkgewpA
QCAtMTYzOSw5ICsxNjI4LDcgQEAgc3RhdGljIGludCBmYl9zdXNwZW5kKHN0cnVjdCBkZXZpY2Ug
KmRldikKIAlpbnQgcmV0OwogCiAJY29uc29sZV9sb2NrKCk7Ci0JaWYgKHBhci0+cGFuZWxfcG93
ZXJfY3RybCkgewotCQlwYXItPnBhbmVsX3Bvd2VyX2N0cmwoMCk7Ci0JfSBlbHNlIGlmIChwYXIt
PmxjZF9zdXBwbHkpIHsKKwlpZiAocGFyLT5sY2Rfc3VwcGx5KSB7CiAJCXJldCA9IHJlZ3VsYXRv
cl9kaXNhYmxlKHBhci0+bGNkX3N1cHBseSk7CiAJCWlmIChyZXQpCiAJCQlyZXR1cm4gcmV0OwpA
QCAtMTY2Nyw5ICsxNjU0LDcgQEAgc3RhdGljIGludCBmYl9yZXN1bWUoc3RydWN0IGRldmljZSAq
ZGV2KQogCWlmIChwYXItPmJsYW5rID09IEZCX0JMQU5LX1VOQkxBTkspIHsKIAkJbGNkX2VuYWJs
ZV9yYXN0ZXIoKTsKIAotCQlpZiAocGFyLT5wYW5lbF9wb3dlcl9jdHJsKSB7Ci0JCQlwYXItPnBh
bmVsX3Bvd2VyX2N0cmwoMSk7Ci0JCX0gZWxzZSBpZiAocGFyLT5sY2Rfc3VwcGx5KSB7CisJCWlm
IChwYXItPmxjZF9zdXBwbHkpIHsKIAkJCXJldCA9IHJlZ3VsYXRvcl9lbmFibGUocGFyLT5sY2Rf
c3VwcGx5KTsKIAkJCWlmIChyZXQpCiAJCQkJcmV0dXJuIHJldDsKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdmlkZW8vZGE4eHgtZmIuaCBiL2luY2x1ZGUvdmlkZW8vZGE4eHgtZmIuaAppbmRleCBlZmVk
M2MzMzgzZDYuLjFkMTlhZTYyYjg0NCAxMDA2NDQKLS0tIGEvaW5jbHVkZS92aWRlby9kYTh4eC1m
Yi5oCisrKyBiL2luY2x1ZGUvdmlkZW8vZGE4eHgtZmIuaApAQCAtMzIsNyArMzIsNiBAQCBzdHJ1
Y3QgZGE4eHhfbGNkY19wbGF0Zm9ybV9kYXRhIHsKIAljb25zdCBjaGFyIG1hbnVfbmFtZVsxMF07
CiAJdm9pZCAqY29udHJvbGxlcl9kYXRhOwogCWNvbnN0IGNoYXIgdHlwZVsyNV07Ci0Jdm9pZCAo
KnBhbmVsX3Bvd2VyX2N0cmwpKGludCk7CiB9OwogCiBzdHJ1Y3QgbGNkX2N0cmxfY29uZmlnIHsK
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

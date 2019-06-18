Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6958049FC5
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 13:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629326E148;
	Tue, 18 Jun 2019 11:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F414F6E148
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 11:54:52 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y17so9069867lfe.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 04:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+dfjBSHgtV2+DqYW/2qohoqP6tQvX9lvmbwlN9p8xok=;
 b=mI0evpzX9C4dh/vyhNHv41IYzN19Gb/z57avoPrKDiPVhjIfKAJyAUur+LQbB88ExR
 pC2GHi57M++yBFNruz/zjrvt8CRXOm19ggGRU4kN2wFmqQkQ7DLL+RhQ85LyjmHC/B0z
 M5fQ5B3D52CU5p0v2F608JRWQ+DjC+TIPXJrOcuGzIa5qfoHHHNk9puBIYOqJdIdti0g
 lcuC2IBCCQwW2TB3UNNbpdVnVAAAalETRxVhxvNKpz1SZzOeZe9Lp+jXUxT5VMHgdFw/
 7CIfmQlzIGUaK1TE+gSfZGpf7/rPOCeQ2Q9u0s/YRFShJM/1IXD9Eq0HHYOmqJpT1q45
 cuaw==
X-Gm-Message-State: APjAAAVGgM35ux93b4CeIETA+DDhGZsScg4eQ+zJ472A/8gmmo/cYcU7
 Ec5ZG3IDYRXY5xx2NgC6I+i9MGJLYFQ=
X-Google-Smtp-Source: APXvYqzr1s+nxUHm9Hwy9tpIJNXrqEqZXVEFefJr4F40Fm+Bmru01KGHk9xmftIyFj4BySbR0IgdPw==
X-Received: by 2002:ac2:46f9:: with SMTP id q25mr6053748lfo.181.1560858891114; 
 Tue, 18 Jun 2019 04:54:51 -0700 (PDT)
Received: from localhost.localdomain
 (c-d2cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.210])
 by smtp.gmail.com with ESMTPSA id v4sm2566603lji.103.2019.06.18.04.54.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 04:54:50 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH v2] drm/mcde: Fix uninitialized variable
Date: Tue, 18 Jun 2019 13:52:45 +0200
Message-Id: <20190618115245.13915-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+dfjBSHgtV2+DqYW/2qohoqP6tQvX9lvmbwlN9p8xok=;
 b=GpN5sTjv86uCDuTPWuHMOqFwziSbLRPXZRL+U9QzUSFvWALTXnq0efOqF63gANGgQw
 MaWtqZdL9LF5xjuPgOVXuR5WyFN0egV1FFRPlqhUkqqK6ytJfShboMrLgRShdXPkrA+p
 BXb8EWjOt2hf3CC1fhPokHWTYso+rdRmUzRHIRgkRtoYVVPUIleUUr9e0c/HFAq5ARGk
 HVAINiGpgs8BwU7R8hfTfxkvetZYVG1PDPNNLUr9AY8EMH7ARz42/G5HwfNZ8jM9iToO
 OgdMxvZljmTmSvoZfDqY0et5s5v5uhvTckUgCOqyNANon722ww4w6GPf5udX1HYNfu9P
 3sCA==
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgbmVlZCB0byBoYW5kbGUgdGhlIGNhc2Ugd2hlbiBvZl9kcm1fZmluZF9icmlkZ2UoKSByZXR1
cm5zCk5VTEwuCgpSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFj
bGUuY29tPgpDYzogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQpD
aGFuZ2VMb2cgdjEtPnYyOgotIEFjY291bnQgZm9yIGJvdGggTlVMTCBhbmQgZXJyb3IgcG9pbnRl
cnMgYnkgdHdvIGNsYXVzZXMuCi0tLQogZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYyB8
IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tY2RlL21jZGVfZHJ2LmMKaW5kZXggYmFmNjNmYjY4NTBhLi5hODEwNTY4Yzc2ZGYg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHJ2LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYwpAQCAtMzE5LDcgKzMxOSw3IEBAIHN0YXRpYyBpbnQg
bWNkZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0cnVjdCBkZXZpY2Ug
KmRldiA9ICZwZGV2LT5kZXY7CiAJc3RydWN0IGRybV9kZXZpY2UgKmRybTsKIAlzdHJ1Y3QgbWNk
ZSAqbWNkZTsKLQlzdHJ1Y3QgY29tcG9uZW50X21hdGNoICptYXRjaDsKKwlzdHJ1Y3QgY29tcG9u
ZW50X21hdGNoICptYXRjaCA9IE5VTEw7CiAJc3RydWN0IHJlc291cmNlICpyZXM7CiAJdTMyIHBp
ZDsKIAl1MzIgdmFsOwpAQCAtNDg1LDYgKzQ4NSwxMCBAQCBzdGF0aWMgaW50IG1jZGVfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJfQogCQlwdXRfZGV2aWNlKHApOwogCX0K
KwlpZiAoIW1hdGNoKSB7CisJCWRldl9lcnIoZGV2LCAibm8gbWF0Y2hpbmcgY29tcG9uZW50c1xu
Iik7CisJCXJldHVybiAtRU5PREVWOworCX0KIAlpZiAoSVNfRVJSKG1hdGNoKSkgewogCQlkZXZf
ZXJyKGRldiwgImNvdWxkIG5vdCBjcmVhdGUgY29tcG9uZW50IG1hdGNoXG4iKTsKIAkJcmV0ID0g
UFRSX0VSUihtYXRjaCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==

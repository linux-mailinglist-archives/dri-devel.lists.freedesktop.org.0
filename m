Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3F2C22D
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 11:04:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3444989E2B;
	Tue, 28 May 2019 09:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 132CF89E14
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 09:03:31 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w37so30609235edw.4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 02:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uqvjuHP1JlltKsAAI+cqqXVrkqUOcJ7eWhpcU6m4g1c=;
 b=F2BbNMpb9tUwfNFPZtSJvs+fZIafyvTFniDYZOwIyJlGg4qXYlI0P/KmkFBy3vF6jz
 6FAVncrwBYwf+wTjVny3VN3k06nmYPqVYTsK6EWyM+fsFNLn5V2APzrQIXufP6mFZi1q
 UwmUDHQ4ygJoY1+r43tsQCMmW7Il2pjp1E7+hO3H4Hm+Hkmw+YlU79M0wxLQnXF87ipf
 h7w6zlGbEaBLPu7LHunHc09pdTiBTsmu1HUpqi8BcUBLd+wG9QQuX0JJbqnKDr9gW28v
 7mLesX8y4yHQHNF73pGaiEXuWmjg+w1f/7BI89DPDK+FDnZMjOBXxhoEGXV78eQ9NDYd
 Vtng==
X-Gm-Message-State: APjAAAU7qwpN8kfWt3+pOBFchj4MaFNlr6C+N7puymES1GqkXLtmBXp5
 8P1N2dNLICjb6s3LQs2ELZQt8w==
X-Google-Smtp-Source: APXvYqxkR8uRPfRQx/cEMiLS4f+zqTikJ6iJyG5emvQCsp3aU+7WOuJdm2C2xsdHOcVuFOgNa2Uw0Q==
X-Received: by 2002:a50:a4f7:: with SMTP id x52mr128120101edb.86.1559034209379; 
 Tue, 28 May 2019 02:03:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x49sm4072656edm.25.2019.05.28.02.03.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 02:03:28 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 12/33] fbdev/omap: sysfs files can't disappear before the
 device is gone
Date: Tue, 28 May 2019 11:02:43 +0200
Message-Id: <20190528090304.9388-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
References: <20190528090304.9388-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uqvjuHP1JlltKsAAI+cqqXVrkqUOcJ7eWhpcU6m4g1c=;
 b=frw58n0pRHAXNDbcXB+xAqYIkvLZxek+SzpkxuUVcIcCgtAz4ksuilklcx2AQ4saSF
 4whTeD2QhLuWUQBHUNchNxxkkb8QdQNnYaTwPxS9iD+InQMnlwn6A6Hx4kcb2+t8RIKl
 C4tVxDn3n3c+Eq+/pdndHPl8PbLYZ9uoeajEE=
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hpY2ggbWVhbnMgbG9ja19mYl9pbmZvIGNhbiBuZXZlciBmYWlsLiBSZW1vdmUgdGhlIGVycm9y
IGhhbmRsaW5nLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KUmV2
aWV3ZWQtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgotLS0KIC4u
Li92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvb21hcGZiLXN5c2ZzLmMgICB8IDIxICsrKysrKyst
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL29tYXBm
Yi1zeXNmcy5jIGIvZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvb21hcGZiLXN5c2Zz
LmMKaW5kZXggODA4N2EwMDljNTRmLi5iZDBkMjAyODMzNzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
dmlkZW8vZmJkZXYvb21hcDIvb21hcGZiL29tYXBmYi1zeXNmcy5jCisrKyBiL2RyaXZlcnMvdmlk
ZW8vZmJkZXYvb21hcDIvb21hcGZiL29tYXBmYi1zeXNmcy5jCkBAIC02MCw4ICs2MCw3IEBAIHN0
YXRpYyBzc2l6ZV90IHN0b3JlX3JvdGF0ZV90eXBlKHN0cnVjdCBkZXZpY2UgKmRldiwKIAlpZiAo
cm90X3R5cGUgIT0gT01BUF9EU1NfUk9UX0RNQSAmJiByb3RfdHlwZSAhPSBPTUFQX0RTU19ST1Rf
VlJGQikKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLQlpZiAoIWxvY2tfZmJfaW5mbyhmYmkpKQotCQly
ZXR1cm4gLUVOT0RFVjsKKwlsb2NrX2ZiX2luZm8oZmJpKTsKIAogCXIgPSAwOwogCWlmIChyb3Rf
dHlwZSA9PSBvZmJpLT5yb3RhdGlvbl90eXBlKQpAQCAtMTEyLDggKzExMSw3IEBAIHN0YXRpYyBz
c2l6ZV90IHN0b3JlX21pcnJvcihzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJaWYgKHIpCiAJCXJldHVy
biByOwogCi0JaWYgKCFsb2NrX2ZiX2luZm8oZmJpKSkKLQkJcmV0dXJuIC1FTk9ERVY7CisJbG9j
a19mYl9pbmZvKGZiaSk7CiAKIAlvZmJpLT5taXJyb3IgPSBtaXJyb3I7CiAKQEAgLTE0OSw4ICsx
NDcsNyBAQCBzdGF0aWMgc3NpemVfdCBzaG93X292ZXJsYXlzKHN0cnVjdCBkZXZpY2UgKmRldiwK
IAlzc2l6ZV90IGwgPSAwOwogCWludCB0OwogCi0JaWYgKCFsb2NrX2ZiX2luZm8oZmJpKSkKLQkJ
cmV0dXJuIC1FTk9ERVY7CisJbG9ja19mYl9pbmZvKGZiaSk7CiAJb21hcGZiX2xvY2soZmJkZXYp
OwogCiAJZm9yICh0ID0gMDsgdCA8IG9mYmktPm51bV9vdmVybGF5czsgdCsrKSB7CkBAIC0yMDgs
OCArMjA1LDcgQEAgc3RhdGljIHNzaXplX3Qgc3RvcmVfb3ZlcmxheXMoc3RydWN0IGRldmljZSAq
ZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwKIAlpZiAoYnVmW2xlbiAtIDFdID09
ICdcbicpCiAJCWxlbiA9IGxlbiAtIDE7CiAKLQlpZiAoIWxvY2tfZmJfaW5mbyhmYmkpKQotCQly
ZXR1cm4gLUVOT0RFVjsKKwlsb2NrX2ZiX2luZm8oZmJpKTsKIAlvbWFwZmJfbG9jayhmYmRldik7
CiAKIAlpZiAobGVuID4gMCkgewpAQCAtMzQwLDggKzMzNiw3IEBAIHN0YXRpYyBzc2l6ZV90IHNo
b3dfb3ZlcmxheXNfcm90YXRlKHN0cnVjdCBkZXZpY2UgKmRldiwKIAlzc2l6ZV90IGwgPSAwOwog
CWludCB0OwogCi0JaWYgKCFsb2NrX2ZiX2luZm8oZmJpKSkKLQkJcmV0dXJuIC1FTk9ERVY7CisJ
bG9ja19mYl9pbmZvKGZiaSk7CiAKIAlmb3IgKHQgPSAwOyB0IDwgb2ZiaS0+bnVtX292ZXJsYXlz
OyB0KyspIHsKIAkJbCArPSBzbnByaW50ZihidWYgKyBsLCBQQUdFX1NJWkUgLSBsLCAiJXMlZCIs
CkBAIC0zNjksOCArMzY0LDcgQEAgc3RhdGljIHNzaXplX3Qgc3RvcmVfb3ZlcmxheXNfcm90YXRl
KHN0cnVjdCBkZXZpY2UgKmRldiwKIAlpZiAoYnVmW2xlbiAtIDFdID09ICdcbicpCiAJCWxlbiA9
IGxlbiAtIDE7CiAKLQlpZiAoIWxvY2tfZmJfaW5mbyhmYmkpKQotCQlyZXR1cm4gLUVOT0RFVjsK
Kwlsb2NrX2ZiX2luZm8oZmJpKTsKIAogCWlmIChsZW4gPiAwKSB7CiAJCWNoYXIgKnAgPSAoY2hh
ciAqKWJ1ZjsKQEAgLTQ1Myw4ICs0NDcsNyBAQCBzdGF0aWMgc3NpemVfdCBzdG9yZV9zaXplKHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCiAKIAlzaXpl
ID0gUEFHRV9BTElHTihzaXplKTsKIAotCWlmICghbG9ja19mYl9pbmZvKGZiaSkpCi0JCXJldHVy
biAtRU5PREVWOworCWxvY2tfZmJfaW5mbyhmYmkpOwogCiAJaWYgKGRpc3BsYXkgJiYgZGlzcGxh
eS0+ZHJpdmVyLT5zeW5jKQogCQlkaXNwbGF5LT5kcml2ZXItPnN5bmMoZGlzcGxheSk7Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

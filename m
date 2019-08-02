Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992EB80166
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 21:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8486EE62;
	Fri,  2 Aug 2019 19:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F476EDD3
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 19:52:01 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z3so13548441iog.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 12:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bxVSBC926M3SRnMO8CwUdz8aDNatmwoyY19OmNEvvRc=;
 b=nxA/eKhqAtBLF6MZk2bfRNmHEQ/nDsUhgCKdejQYMOdKlOHPNxWiT2g/e4fxo0GLSE
 smZD2LFGEKkkzXYw2c+IE7xJtwE2Ff5TB3b4BOosCs1IVK2mDsmF9zbjd4IFgv5ofjpT
 DwsUwdFFjOeOW2pPYFSbxYlwSXaxssWcpC8HbpsqVnACDWd0mid+5wYiL8/flhvdP3ME
 6OplG76AHUM3kDPwgEnnXBkeCsB6ys2zNTAlXf//sWmlYluZT/NiLSLwJwwuoNt2rIWD
 dK5qYYuKLvTP3t5+arJav+xvpvWo4nXS5EWuqGjim9lkVvcbeNI8hP5Co5y5dU2stpoc
 OAHA==
X-Gm-Message-State: APjAAAXS21K+UKg8qr4xaSUaqJivhTFNMXa8++7Qn1QFITkmvqUFbXKN
 zXg/HjKbAUf+q8xWX2auBxraK6k=
X-Google-Smtp-Source: APXvYqyWAwEAb9qbvqfsST+13hJ9Kv5ZYkge3wVhGhlaw1l/h99PQIyrlStp8WjoNgnja8T4JYWq2g==
X-Received: by 2002:a6b:cd86:: with SMTP id
 d128mr126555145iog.234.1564775520066; 
 Fri, 02 Aug 2019 12:52:00 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id s4sm98419934iop.25.2019.08.02.12.51.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 12:51:59 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/8] drm/panfrost: Convert MMU IRQ handler to threaded
 handler
Date: Fri,  2 Aug 2019 13:51:48 -0600
Message-Id: <20190802195150.23207-7-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802195150.23207-1-robh@kernel.org>
References: <20190802195150.23207-1-robh@kernel.org>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gcHJlcGFyYXRpb24gdG8gaGFuZGxlIG1hcHBpbmcgb2YgcGFnZSBmYXVsdHMsIHdlIG5lZWQg
dGhlIE1NVSBoYW5kbGVyCnRvIGJlIHRocmVhZGVkIGFzIGNvZGUgcGF0aHMgdGFrZSBhIG11dGV4
LgoKQXMgdGhlIElSUSBtYXkgYmUgc2hhcmVkLCB3ZSBjYW4ndCB1c2UgdGhlIGRlZmF1bHQgaGFu
ZGxlciBhbmQgbXVzdApkaXNhYmxlIHRoZSBNTVUgaW50ZXJydXB0cyBsb2NhbGx5LgoKQ2M6IFRv
bWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+CkNjOiBCb3JpcyBCcmV6aWxs
b24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgpDYzogUm9iaW4gTXVycGh5IDxyb2Jp
bi5tdXJwaHlAYXJtLmNvbT4KQ2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+
CkNjOiBBbHlzc2EgUm9zZW56d2VpZyA8YWx5c3NhLnJvc2VuendlaWdAY29sbGFib3JhLmNvbT4K
U2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgfCAyMCArKysrKysrKysrKysrKystLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCmluZGV4IGViYTZjZTc4NWVmMC4uN2Q0
NDMyOGIyODBmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
bW11LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCkBAIC0z
MDAsMTIgKzMwMCwyMCBAQCBzdGF0aWMgY29uc3QgY2hhciAqYWNjZXNzX3R5cGVfbmFtZShzdHJ1
Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiwKIHN0YXRpYyBpcnFyZXR1cm5fdCBwYW5mcm9zdF9t
bXVfaXJxX2hhbmRsZXIoaW50IGlycSwgdm9pZCAqZGF0YSkKIHsKIAlzdHJ1Y3QgcGFuZnJvc3Rf
ZGV2aWNlICpwZmRldiA9IGRhdGE7Ci0JdTMyIHN0YXR1cyA9IG1tdV9yZWFkKHBmZGV2LCBNTVVf
SU5UX1NUQVQpOwotCWludCBpOwogCi0JaWYgKCFzdGF0dXMpCisJaWYgKCFtbXVfcmVhZChwZmRl
diwgTU1VX0lOVF9TVEFUKSkKIAkJcmV0dXJuIElSUV9OT05FOwogCisJbW11X3dyaXRlKHBmZGV2
LCBNTVVfSU5UX01BU0ssIDApOworCXJldHVybiBJUlFfV0FLRV9USFJFQUQ7Cit9CisKK3N0YXRp
YyBpcnFyZXR1cm5fdCBwYW5mcm9zdF9tbXVfaXJxX2hhbmRsZXJfdGhyZWFkKGludCBpcnEsIHZv
aWQgKmRhdGEpCit7CisJc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYgPSBkYXRhOworCXUz
MiBzdGF0dXMgPSBtbXVfcmVhZChwZmRldiwgTU1VX0lOVF9SQVdTVEFUKTsKKwlpbnQgaTsKKwog
CWRldl9lcnIocGZkZXYtPmRldiwgIm1tdSBpcnEgc3RhdHVzPSV4XG4iLCBzdGF0dXMpOwogCiAJ
Zm9yIChpID0gMDsgc3RhdHVzOyBpKyspIHsKQEAgLTM1MCw2ICszNTgsNyBAQCBzdGF0aWMgaXJx
cmV0dXJuX3QgcGFuZnJvc3RfbW11X2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKmRhdGEpCiAJ
CXN0YXR1cyAmPSB+bWFzazsKIAl9CiAKKwltbXVfd3JpdGUocGZkZXYsIE1NVV9JTlRfTUFTSywg
fjApOwogCXJldHVybiBJUlFfSEFORExFRDsKIH07CiAKQEAgLTM2OCw4ICszNzcsOSBAQCBpbnQg
cGFuZnJvc3RfbW11X2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAJaWYgKGly
cSA8PSAwKQogCQlyZXR1cm4gLUVOT0RFVjsKIAotCWVyciA9IGRldm1fcmVxdWVzdF9pcnEocGZk
ZXYtPmRldiwgaXJxLCBwYW5mcm9zdF9tbXVfaXJxX2hhbmRsZXIsCi0JCQkgICAgICAgSVJRRl9T
SEFSRUQsICJtbXUiLCBwZmRldik7CisJZXJyID0gZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycShw
ZmRldi0+ZGV2LCBpcnEsIHBhbmZyb3N0X21tdV9pcnFfaGFuZGxlciwKKwkJCQkJcGFuZnJvc3Rf
bW11X2lycV9oYW5kbGVyX3RocmVhZCwKKwkJCQkJSVJRRl9TSEFSRUQsICJtbXUiLCBwZmRldik7
CiAKIAlpZiAoZXJyKSB7CiAJCWRldl9lcnIocGZkZXYtPmRldiwgImZhaWxlZCB0byByZXF1ZXN0
IG1tdSBpcnEiKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs

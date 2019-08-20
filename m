Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0F4959EA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 10:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C4998912B;
	Tue, 20 Aug 2019 08:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35626E795
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 08:41:19 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id p74so1846195wme.4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ycv/jEAcG3fpQBCVUPoq40RlT152vTGJJ9rC2v/DC0k=;
 b=Hksn6IhECrMn850ahhYYrjOjxYYMY2EU1cfkWnwY2A6W39TgRK+l721A/QW1pgZXPG
 UjFNFSGwr17jX+cFq7NN+Gm4Bg3VE15hPJ2wn6/Lqm+I9Fyjg+FRyr1aa+CIImXeHhxS
 2lOW6mJG5cMonJY4Xy4mgNZCUGB3H+dXPVikKMvR61S5O12cIF2eG8QEUS/zQzyKOepK
 EqP/uKBb2mfLBl8VlGT72IMcFe8O/IYRvJIYja5cfpyG9EEhaid7bu5OAroropbuTmu8
 eO7547ICudq7KsAs2M1d3RecTCCrgP0ab/HI/SSfvPZKYi5duAP9iK2JQA9Lti4yUctq
 G4pQ==
X-Gm-Message-State: APjAAAVkDKxDdFOr0pXF4aZ2EPiW2b1Kn6yqFtsbhGd1bgr6dBTkkFUC
 jtHBhBiA8zMoiQllVUGN3ZqEOw==
X-Google-Smtp-Source: APXvYqyJ/Fb2DsUH/6cVhm+iFgTQdtXlAWWQu27sKwrNSMuyXTmwD1BnbW+wDn/iYur4lTijf0q8dg==
X-Received: by 2002:a7b:cb8e:: with SMTP id m14mr25350146wmi.10.1566290478169; 
 Tue, 20 Aug 2019 01:41:18 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm34275648wru.27.2019.08.20.01.41.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:41:17 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, boris.brezillon@collabora.com
Subject: [RFC 05/11] drm/bridge: synopsys: dw-hdmi: use negociated bus formats
Date: Tue, 20 Aug 2019 10:41:03 +0200
Message-Id: <20190820084109.24616-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820084109.24616-1-narmstrong@baylibre.com>
References: <20190820084109.24616-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ycv/jEAcG3fpQBCVUPoq40RlT152vTGJJ9rC2v/DC0k=;
 b=f0FCu+YadoOWZOTl9Q8ohbQYHrR/ljKMMnNVHieeC41h1iNxHf8GVQge9XGOmeNHAQ
 4ZIo/RnvS/rn2ixKimc4ElXf5cZWHA7gU97MTm/HcvNnzWnzAERVaZ082klnN9fxKdGA
 cwTBAydF9wPfXYgyltwV57QcP277fVJZNEGIdppn4mCe2S3zxG9aeExprdISzUZfwnJA
 tbmmELvVM9IzDrKG6PgPV7hdzgxjEXqhsyajUz6FJEvqirxI/AWB9L33SHVNebMyYVpH
 LMwgQDGDA1onUh9PJ3imhw++67Oah+1OVTk9iOyRsZqHGbdzvbWmyqcGjZu7GqQ6I1Zj
 Eipw==
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
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBuZWdvY2lhdGVkIGJ1cyBmb3JtYXRzIGZyb20gdGhlIGF0b21pYyBjaGVjayBmdW5j
dGlvbiBpZgp0aGUgaW5wdXQgYW5kIG91dHB1dCBmb3JtYXRzIGFyZSBub24gTlVMTCwgb3RoZXJ3
aXNlIGZhbGxiYWNrIHRvCnRoZSBwbGF0X2RhdGEtPmlucHV0X2J1c19mb3JtYXQgb3IgdGhlIGRl
ZmF1bHQgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVgyNApidXMgZm9ybWF0LgoKU2lnbmVkLW9mZi1i
eTogTmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgMTEgKysrKysrKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwppbmRleCAxMjFjMjE2N2VlMjAuLjMxNjgyM2Fi
ZGQwMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1p
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKQEAgLTE5
NjgsMTEgKzE5NjgsMTAgQEAgc3RhdGljIGludCBkd19oZG1pX3NldHVwKHN0cnVjdCBkd19oZG1p
ICpoZG1pLCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKIAloZG1pLT5oZG1pX2RhdGEu
dmlkZW9fbW9kZS5tcGl4ZWxyZXBldGl0aW9ub3V0cHV0ID0gMDsKIAloZG1pLT5oZG1pX2RhdGEu
dmlkZW9fbW9kZS5tcGl4ZWxyZXBldGl0aW9uaW5wdXQgPSAwOwogCi0JLyogVE9GSVg6IEdldCBp
bnB1dCBmb3JtYXQgZnJvbSBwbGF0IGRhdGEgb3IgZmFsbGJhY2sgdG8gUkdCODg4ICovCiAJaWYg
KGhkbWktPnBsYXRfZGF0YS0+aW5wdXRfYnVzX2Zvcm1hdCkKIAkJaGRtaS0+aGRtaV9kYXRhLmVu
Y19pbl9idXNfZm9ybWF0ID0KIAkJCWhkbWktPnBsYXRfZGF0YS0+aW5wdXRfYnVzX2Zvcm1hdDsK
LQllbHNlCisJZWxzZSBpZiAoIWhkbWktPmhkbWlfZGF0YS5lbmNfaW5fYnVzX2Zvcm1hdCkKIAkJ
aGRtaS0+aGRtaV9kYXRhLmVuY19pbl9idXNfZm9ybWF0ID0gTUVESUFfQlVTX0ZNVF9SR0I4ODhf
MVgyNDsKIAogCS8qIFRPRklYOiBHZXQgaW5wdXQgZW5jb2RpbmcgZnJvbSBwbGF0IGRhdGEgb3Ig
ZmFsbGJhY2sgdG8gbm9uZSAqLwpAQCAtMTk4Miw4ICsxOTgxLDggQEAgc3RhdGljIGludCBkd19o
ZG1pX3NldHVwKHN0cnVjdCBkd19oZG1pICpoZG1pLCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAq
bW9kZSkKIAllbHNlCiAJCWhkbWktPmhkbWlfZGF0YS5lbmNfaW5fZW5jb2RpbmcgPSBWNEwyX1lD
QkNSX0VOQ19ERUZBVUxUOwogCi0JLyogVE9GSVg6IERlZmF1bHQgdG8gUkdCODg4IG91dHB1dCBm
b3JtYXQgKi8KLQloZG1pLT5oZG1pX2RhdGEuZW5jX291dF9idXNfZm9ybWF0ID0gTUVESUFfQlVT
X0ZNVF9SR0I4ODhfMVgyNDsKKwlpZiAoIWhkbWktPmhkbWlfZGF0YS5lbmNfb3V0X2J1c19mb3Jt
YXQpCisJCWhkbWktPmhkbWlfZGF0YS5lbmNfb3V0X2J1c19mb3JtYXQgPSBNRURJQV9CVVNfRk1U
X1JHQjg4OF8xWDI0OwogCiAJaGRtaS0+aGRtaV9kYXRhLnBpeF9yZXBldF9mYWN0b3IgPSAwOwog
CWhkbWktPmhkbWlfZGF0YS5oZGNwX2VuYWJsZSA9IDA7CkBAIC0yMjI0LDYgKzIyMjMsOCBAQCBz
dGF0aWMgaW50IGR3X2hkbWlfYnJpZGdlX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2JyaWRnZSAq
YnJpZGdlLAogCWRldl9kYmcoaGRtaS0+ZGV2LCAic2VsZWN0ZWQgb3V0cHV0IGZvcm1hdCAleFxu
IiwKIAkJCWJyaWRnZV9zdGF0ZS0+b3V0cHV0X2J1c19jZmcuZm10KTsKIAorCWhkbWktPmhkbWlf
ZGF0YS5lbmNfb3V0X2J1c19mb3JtYXQgPSBicmlkZ2Vfc3RhdGUtPm91dHB1dF9idXNfY2ZnLmZt
dDsKKwogCXJldCA9IGRybV9hdG9taWNfYnJpZGdlX2Nob29zZV9pbnB1dF9idXNfY2ZnKGJyaWRn
ZV9zdGF0ZSwgY3J0Y19zdGF0ZSwKIAkJCQkJCSAgICAgIGNvbm5fc3RhdGUpOwogCWlmIChyZXQp
CkBAIC0yMjMyLDYgKzIyMzMsOCBAQCBzdGF0aWMgaW50IGR3X2hkbWlfYnJpZGdlX2F0b21pY19j
aGVjayhzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAogCWRldl9kYmcoaGRtaS0+ZGV2LCAic2Vs
ZWN0ZWQgaW5wdXQgZm9ybWF0ICV4XG4iLAogCQkJYnJpZGdlX3N0YXRlLT5pbnB1dF9idXNfY2Zn
LmZtdCk7CiAKKwloZG1pLT5oZG1pX2RhdGEuZW5jX2luX2J1c19mb3JtYXQgPSBicmlkZ2Vfc3Rh
dGUtPmlucHV0X2J1c19jZmcuZm10OworCiAJcmV0dXJuIDA7CiB9CiAKLS0gCjIuMjIuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

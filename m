Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB5E2939B
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 10:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7CF6E0CD;
	Fri, 24 May 2019 08:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A9C6E0B7
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 08:54:20 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id f37so13271518edb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 01:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MAPnhxqw8kme2eR+AuVFsaR4pvfjpQV+5x2Qx7ASEQ8=;
 b=TdMTcSys87dBc8PYyyTwqubLK51ARy6cytKQrT18Wg2GepJWxbuvWKfY6bAaPpf7ch
 3ezlt2fB07qHFk4SWj5d+53jgeMRz9SbsGE4rY49//nX7fbdyAhKyFUZ/c4rQR5rpAw2
 uz0nxBdTqMj6R4tC3wQCsducsOJWwbsr0G8M+7fczqmOa2TIkniUcT+lNzxx/8q29uYM
 2YUyeOw+2XBrQKaABzuUO6QeOGezos33jVTFpXLgDchODyl0gdJAlMj8W0RJgzusZjJA
 li0eZjqMqntRbtkuPa7DQM7P1hdeHNoVwp/yinsHXGu2XGSfPAU43yB8KHRM5tbo814B
 epfA==
X-Gm-Message-State: APjAAAXlWbOHYNm8MId2edcbwVWAiTMU2aygi2/gWYdEj+NTTRxy+zHc
 y1N+lFu9zDUWugAdz9FMNHvaIMxGHyg=
X-Google-Smtp-Source: APXvYqzYz34fK8/8X7Y/uPtf4olS4exJNIxPEIlqqQbxRTgl2/MAionDBwX0f6ASez9o9LStg7IXFQ==
X-Received: by 2002:a17:906:63c1:: with SMTP id
 u1mr19497792ejk.173.1558688058160; 
 Fri, 24 May 2019 01:54:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id 96sm567082edq.68.2019.05.24.01.54.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 01:54:17 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 12/33] fbdev/omap: sysfs files can't disappear before the
 device is gone
Date: Fri, 24 May 2019 10:53:33 +0200
Message-Id: <20190524085354.27411-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MAPnhxqw8kme2eR+AuVFsaR4pvfjpQV+5x2Qx7ASEQ8=;
 b=g5enIYA9/Sf7GfGnysfGpukptLtI9FO3uexJgB1nyWmwUQeQZpajlKLvC48gfEooCj
 UmYLR/n/r61sxtQ8j7c8JKeME1z94nt44Jw0zuML5JVBkPDW1qY+b4mIGIA2HnO2e4Yk
 g+hdRUhd1/FkxR+SROSkLv9GsKIT+fyVqJdQo=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hpY2ggbWVhbnMgbG9ja19mYl9pbmZvIGNhbiBuZXZlciBmYWlsLiBSZW1vdmUgdGhlIGVycm9y
IGhhbmRsaW5nLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tLQog
Li4uL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9vbWFwZmItc3lzZnMuYyAgIHwgMjEgKysrKysr
Ky0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvb21h
cGZiLXN5c2ZzLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAyL29tYXBmYi9vbWFwZmItc3lz
ZnMuYwppbmRleCA4MDg3YTAwOWM1NGYuLmJkMGQyMDI4MzM3MiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy92aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvb21hcGZiLXN5c2ZzLmMKKysrIGIvZHJpdmVycy92
aWRlby9mYmRldi9vbWFwMi9vbWFwZmIvb21hcGZiLXN5c2ZzLmMKQEAgLTYwLDggKzYwLDcgQEAg
c3RhdGljIHNzaXplX3Qgc3RvcmVfcm90YXRlX3R5cGUoc3RydWN0IGRldmljZSAqZGV2LAogCWlm
IChyb3RfdHlwZSAhPSBPTUFQX0RTU19ST1RfRE1BICYmIHJvdF90eXBlICE9IE9NQVBfRFNTX1JP
VF9WUkZCKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotCWlmICghbG9ja19mYl9pbmZvKGZiaSkpCi0J
CXJldHVybiAtRU5PREVWOworCWxvY2tfZmJfaW5mbyhmYmkpOwogCiAJciA9IDA7CiAJaWYgKHJv
dF90eXBlID09IG9mYmktPnJvdGF0aW9uX3R5cGUpCkBAIC0xMTIsOCArMTExLDcgQEAgc3RhdGlj
IHNzaXplX3Qgc3RvcmVfbWlycm9yKHN0cnVjdCBkZXZpY2UgKmRldiwKIAlpZiAocikKIAkJcmV0
dXJuIHI7CiAKLQlpZiAoIWxvY2tfZmJfaW5mbyhmYmkpKQotCQlyZXR1cm4gLUVOT0RFVjsKKwls
b2NrX2ZiX2luZm8oZmJpKTsKIAogCW9mYmktPm1pcnJvciA9IG1pcnJvcjsKIApAQCAtMTQ5LDgg
KzE0Nyw3IEBAIHN0YXRpYyBzc2l6ZV90IHNob3dfb3ZlcmxheXMoc3RydWN0IGRldmljZSAqZGV2
LAogCXNzaXplX3QgbCA9IDA7CiAJaW50IHQ7CiAKLQlpZiAoIWxvY2tfZmJfaW5mbyhmYmkpKQot
CQlyZXR1cm4gLUVOT0RFVjsKKwlsb2NrX2ZiX2luZm8oZmJpKTsKIAlvbWFwZmJfbG9jayhmYmRl
dik7CiAKIAlmb3IgKHQgPSAwOyB0IDwgb2ZiaS0+bnVtX292ZXJsYXlzOyB0KyspIHsKQEAgLTIw
OCw4ICsyMDUsNyBAQCBzdGF0aWMgc3NpemVfdCBzdG9yZV9vdmVybGF5cyhzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLAogCWlmIChidWZbbGVuIC0gMV0g
PT0gJ1xuJykKIAkJbGVuID0gbGVuIC0gMTsKIAotCWlmICghbG9ja19mYl9pbmZvKGZiaSkpCi0J
CXJldHVybiAtRU5PREVWOworCWxvY2tfZmJfaW5mbyhmYmkpOwogCW9tYXBmYl9sb2NrKGZiZGV2
KTsKIAogCWlmIChsZW4gPiAwKSB7CkBAIC0zNDAsOCArMzM2LDcgQEAgc3RhdGljIHNzaXplX3Qg
c2hvd19vdmVybGF5c19yb3RhdGUoc3RydWN0IGRldmljZSAqZGV2LAogCXNzaXplX3QgbCA9IDA7
CiAJaW50IHQ7CiAKLQlpZiAoIWxvY2tfZmJfaW5mbyhmYmkpKQotCQlyZXR1cm4gLUVOT0RFVjsK
Kwlsb2NrX2ZiX2luZm8oZmJpKTsKIAogCWZvciAodCA9IDA7IHQgPCBvZmJpLT5udW1fb3Zlcmxh
eXM7IHQrKykgewogCQlsICs9IHNucHJpbnRmKGJ1ZiArIGwsIFBBR0VfU0laRSAtIGwsICIlcyVk
IiwKQEAgLTM2OSw4ICszNjQsNyBAQCBzdGF0aWMgc3NpemVfdCBzdG9yZV9vdmVybGF5c19yb3Rh
dGUoc3RydWN0IGRldmljZSAqZGV2LAogCWlmIChidWZbbGVuIC0gMV0gPT0gJ1xuJykKIAkJbGVu
ID0gbGVuIC0gMTsKIAotCWlmICghbG9ja19mYl9pbmZvKGZiaSkpCi0JCXJldHVybiAtRU5PREVW
OworCWxvY2tfZmJfaW5mbyhmYmkpOwogCiAJaWYgKGxlbiA+IDApIHsKIAkJY2hhciAqcCA9IChj
aGFyICopYnVmOwpAQCAtNDUzLDggKzQ0Nyw3IEBAIHN0YXRpYyBzc2l6ZV90IHN0b3JlX3NpemUo
c3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwKIAogCXNp
emUgPSBQQUdFX0FMSUdOKHNpemUpOwogCi0JaWYgKCFsb2NrX2ZiX2luZm8oZmJpKSkKLQkJcmV0
dXJuIC1FTk9ERVY7CisJbG9ja19mYl9pbmZvKGZiaSk7CiAKIAlpZiAoZGlzcGxheSAmJiBkaXNw
bGF5LT5kcml2ZXItPnN5bmMpCiAJCWRpc3BsYXktPmRyaXZlci0+c3luYyhkaXNwbGF5KTsKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

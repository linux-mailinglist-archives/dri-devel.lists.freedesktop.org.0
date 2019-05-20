Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED66222E6C
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:23:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3806589296;
	Mon, 20 May 2019 08:22:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EAD8926F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:22:38 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w33so22504715edb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 01:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MAPnhxqw8kme2eR+AuVFsaR4pvfjpQV+5x2Qx7ASEQ8=;
 b=UKpthGg3yM5MGk9h8V9Rluy4EvD6c8upuRul3Nth+iKlZubZjKqEbm8B0D3fMizfq3
 bFqt3haTl2LKx/EA+12OT8MI0eUgNL0PsrcG+9H4fJKAcu3GRpoHFR4rjR3LAVoBzJj/
 8ZQjzRQEVvW4xRZdfQzWU3AAO4sixb54IH6cHPbDu3WYuFvJCt4d8VUMUqD6873Wg8ZT
 4hYfIqZF6ScFuI++5cOQHkwHkn0NjcrwkyyOuNO11ByzSfVTPbc0dvFVcf5Bp2ATfiLs
 5V0PSn2vVRMf8VBWyR+6HLElqoL3iST4TATv7hKzyHkKnKKzg5ocYykPpbKxUXb3orjS
 ouhA==
X-Gm-Message-State: APjAAAWf+cgS3RRMGjV1GxRaDP2gF1EGdVWBj8YObH0R+TUCU1oNr3GH
 xyXQl6wyQEvJEvHTirWoZaNCSK17u90=
X-Google-Smtp-Source: APXvYqy2pt8n+x8BPHCCQ5cJnXhvOlYkpsAiqSlVjIHsEB/DVOI4Hf/8671bBp3VO5BjCkiPfLabNQ==
X-Received: by 2002:a50:8bbb:: with SMTP id m56mr74709421edm.230.1558340556427; 
 Mon, 20 May 2019 01:22:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t25sm3021263ejx.8.2019.05.20.01.22.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 01:22:35 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/33] fbdev/omap: sysfs files can't disappear before the
 device is gone
Date: Mon, 20 May 2019 10:21:55 +0200
Message-Id: <20190520082216.26273-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MAPnhxqw8kme2eR+AuVFsaR4pvfjpQV+5x2Qx7ASEQ8=;
 b=Vh1HQx0v1toKnOC/o4+NxIRAS4qdnL7xFxVmzs7PzaHJK00/mA1zLjPnQywnF9FaNS
 g2x4y7tGHyJ74sK8N9rCyeIwdUNSDAKgMreZ1nU6PCXGu0t2LLf0qy9PThDq7PyJshfS
 IkgW0obXAHORtuKJpLYNO1qhGGk1+JvHYHD2Q=
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
 LKML <linux-kernel@vger.kernel.org>
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

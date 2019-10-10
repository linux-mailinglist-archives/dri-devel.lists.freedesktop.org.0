Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 686A3D2637
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 11:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D410A6EAD6;
	Thu, 10 Oct 2019 09:25:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03E06E33E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 09:25:32 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y135so6681110wmc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 02:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jRWM1ov/iskQxb+UDVHRjatwtmu3Y1ySBHQ/mr63srY=;
 b=d+RjDy0zODtRT7JY8KI3b6/TSLNOM95jSimR3jZO1q4MRyJ5JFrjLWmbHDsAY4SVAh
 udYCsRgDCXPeUaqCKwqkCGtwBBWK1ZjjlKFVMWhao/WeYL84LfYgCI3FAoghOTQZdnJw
 usD5XaLIl4tBCim81IIQvgO+m/nHj/by+QqO9W2roNtr+5v7lVo4ZwkrE9utvXtfCVN8
 2GlKLqrDflnu3K6ON00tsHE8JBZK+vWv58mDPO0Tim+E+O0Ie20w8mz9YoCV21dTopIc
 5/8lrwJRpEvKG35Mz3eiBPgWUmytdrQ+gNygmqulFJKg28FoPlQ9ID/y9ORE6ex7Gyp2
 tCuw==
X-Gm-Message-State: APjAAAVT38KgE50NzxMmSdjxG0prJk/y2uqyXInk/mj2uezbkcFunvM6
 ZewBj0sOqqvW25hX+HI4KflEEECBJKjL1A==
X-Google-Smtp-Source: APXvYqzHwe/HUmwgVyORc9vCtFW/hczdKZJuZTvYVgC+S0zxN+gLbAoQayuJvmbM2+BaG5XQM1L3XQ==
X-Received: by 2002:a7b:c444:: with SMTP id l4mr6687667wmi.21.1570699531078;
 Thu, 10 Oct 2019 02:25:31 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s10sm8373770wmf.48.2019.10.10.02.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2019 02:25:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm/meson: store the framebuffer width for plane commit
Date: Thu, 10 Oct 2019 11:25:21 +0200
Message-Id: <20191010092526.10419-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191010092526.10419-1-narmstrong@baylibre.com>
References: <20191010092526.10419-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jRWM1ov/iskQxb+UDVHRjatwtmu3Y1ySBHQ/mr63srY=;
 b=p60EtojjuWG9pFhtEny9YRYGziaVfs71P9xmJwyyizeaB85ula7MdAXA75MjHulWJs
 FtGeZRDJv3akyybAuI5AqiKoaXOjAxO4rW4NA7VP3sQesreb+8uUuLa4InHSlhxgMeEH
 BzJwLRbjWhgaFKd20sDUfRW2rEafKsP8qNmt234VxGCz8+raUQJhbvqDt+AYHY5rU6Hv
 qZSzojVQHRk86/KhGtwApkAzNV4SimNF5wu76ovOjcSuAzrI+1gkzCA1zEIhkGPxPCET
 VMXyod2dzWP3pH0vP7AYnfj9LNTK9vJaCdPH2heb+gG9bYfdRJZqQkGpcvejgSKExpWE
 e/Kg==
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 ayan.halder@arm.com, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxzbyBzdG9yZSB0aGUgZnJhbWVidWZmZXIgd2lkdGggaW4gdGhlIHByaXZhdGUgY29tbW9uIHN0
cnVjdAp0byBiZSB1c2VkIGJ5IHRoZSBBRkJDIGRlY29kZXIgbW9kdWxlIGRyaXZlciB3aGVuIGNv
bW1pdHRpbmcgdGhlIEFGQkMKcGxhbmUuCgpTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8
bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29u
X2Rydi5oICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9wbGFuZS5jIHwgMSAr
CiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9k
cnYuaAppbmRleCA4MjBkMDdiZGQ0MmEuLjMyODcyODI0NTBhOSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9t
ZXNvbl9kcnYuaApAQCAtNTIsNiArNTIsNyBAQCBzdHJ1Y3QgbWVzb25fZHJtIHsKIAkJdWludDMy
X3Qgb3NkMV9hZGRyOwogCQl1aW50MzJfdCBvc2QxX3N0cmlkZTsKIAkJdWludDMyX3Qgb3NkMV9o
ZWlnaHQ7CisJCXVpbnQzMl90IG9zZDFfd2lkdGg7CiAJCXVpbnQzMl90IG9zZF9zY19jdHJsMDsK
IAkJdWludDMyX3Qgb3NkX3NjX2lfd2hfbTE7CiAJCXVpbnQzMl90IG9zZF9zY19vX2hfc3RhcnRf
ZW5kOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3BsYW5lLmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcGxhbmUuYwppbmRleCBlZDU0MzIyN2IwMGQuLjVl
Nzk4YzI3NjAzNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3BsYW5l
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3BsYW5lLmMKQEAgLTMwNSw2ICsz
MDUsNyBAQCBzdGF0aWMgdm9pZCBtZXNvbl9wbGFuZV9hdG9taWNfdXBkYXRlKHN0cnVjdCBkcm1f
cGxhbmUgKnBsYW5lLAogCXByaXYtPnZpdS5vc2QxX2FkZHIgPSBnZW0tPnBhZGRyOwogCXByaXYt
PnZpdS5vc2QxX3N0cmlkZSA9IGZiLT5waXRjaGVzWzBdOwogCXByaXYtPnZpdS5vc2QxX2hlaWdo
dCA9IGZiLT5oZWlnaHQ7CisJcHJpdi0+dml1Lm9zZDFfd2lkdGggPSBmYi0+d2lkdGg7CiAKIAlp
ZiAoIW1lc29uX3BsYW5lLT5lbmFibGVkKSB7CiAJCS8qIFJlc2V0IE9TRDEgYmVmb3JlIGVuYWJs
aW5nIGl0IG9uIEdYTCsgU29DcyAqLwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

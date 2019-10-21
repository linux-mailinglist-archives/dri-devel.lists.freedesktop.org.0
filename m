Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95309DE7B1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 11:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7472C89CD8;
	Mon, 21 Oct 2019 09:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06EA589CA2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 09:15:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id r19so12404068wmh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 02:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9GArC94tXtiJFh0r8bnfgE0ceBz2txRHJ4czY6jCpvc=;
 b=l8SnHs5a4qh8C6yQFCsPOU/fgHp87SFEvtSYRIJB1IJZCC/P9KbjDCZNtcDSV/LUAL
 4VE1XcEQINRmkOgZTtdAlewtuR+/29nxh4I3keUmRB125QFcZ9wTdLnrYNiPc4rOm2af
 VilqCZ4EXegoXEeGzWr+1CyvOkFndPV8PVytTOEFLmvwIdutu04iWCSHuw8MR36/IEdZ
 IIpTzVC4Xo7oYKgjGiu9McUSyS+YMxDH/GUmHO6K6c0NtfEdaGjEjBAluOpWk/jUFxuv
 NDxoD02B8ZZM9ZmMckbsp3Ui9c1LhHCLqCpny6kCS3UIN+1+geSN3SPhXqnv5QUz+/0Y
 lm/A==
X-Gm-Message-State: APjAAAXsl5b4qO/7FChWkgn8tPawqkwij3V0z3uIc/mr9fk7Jl3RYsOd
 Y+3f+CppHqz1Ji4782DCIBgILjRHQ4UIFA==
X-Google-Smtp-Source: APXvYqzgonlD2CSV/QcUQqpRcy/V2+0lBkWclazaN9UZd0clclGNPGQqRgOwaLJwLVwhPi1zpxybyg==
X-Received: by 2002:a1c:38c3:: with SMTP id f186mr2658112wma.58.1571649318118; 
 Mon, 21 Oct 2019 02:15:18 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t13sm20281595wra.70.2019.10.21.02.15.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 02:15:17 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 8/9] drm/meson: hold 32 lines after vsync to give time for
 AFBC start
Date: Mon, 21 Oct 2019 11:15:08 +0200
Message-Id: <20191021091509.3864-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021091509.3864-1-narmstrong@baylibre.com>
References: <20191021091509.3864-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9GArC94tXtiJFh0r8bnfgE0ceBz2txRHJ4czY6jCpvc=;
 b=zLJ1sNW98uTrAiqwDlRmxdBuL/WNQhLcBQSh4C09UdFrgGjdahB/yXyD+SM4jTA8fl
 ty11JCqJSL4udvI3sCbpzuDfEUeofEQcAHcxtRSIN16R6dovtB6g2zna1NuDklI9YziX
 xL7mcG4SgF9yS4Z6nw1psLfv65hAC8wjtTdKnwPNnCGR9aLr9Vt4puigr2co/HzFNqe5
 8jcysH7m2FHMbk39IplnJYO3oREab9XI1IbB1j36fcoVIbIr6EyvKwz9TGrcLESPxe/4
 58g2HIrRMfCZQgIv1zBr9t9t2qWAS+v59aH2ns3x+q6YaDhf2XdX3RyGo9Y/LCIdm5Js
 djZw==
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

V2hlbiB1c2luZyBhbiBBRkJDIGVuY29kZWQgZnJhbWUsIHRoZSBBRkJDIERlY29kZXIgbXVzdCBi
ZSByZXNldHRlZCwKY29uZmlndXJlZCBhbmQgZW5hYmxlZCBhdCBlYWNoIHZzeW5jIElSUS4KClRv
IGxlYXZlIHRpbWUgZm9yIHRoYXQsIHVzZSB0aGUgbWF4aW11bSBsaW5lcyBob2xkIHRpbWUgdG8g
Z2l2ZSB0aW1lCmZvciBBRkJDIHNldHVwIGFuZCBhdm9pZCB2aXN1YWwgZ2xpdGNoZXMuCgpTaWdu
ZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZpdS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21lc29uL21lc29uX3ZpdS5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZpdS5j
CmluZGV4IGZjMjQ2MjQ4MjI2Yi4uMzA0ZjhmZjEzMzljIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbWVzb24vbWVzb25fdml1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29u
X3ZpdS5jCkBAIC00MzgsNyArNDM4LDcgQEAgdm9pZCBtZXNvbl92aXVfaW5pdChzdHJ1Y3QgbWVz
b25fZHJtICpwcml2KQogCiAJLyogSW5pdGlhbGl6ZSBPU0QxIGZpZm8gY29udHJvbCByZWdpc3Rl
ciAqLwogCXJlZyA9IFZJVV9PU0RfRERSX1BSSU9SSVRZX1VSR0VOVCB8Ci0JCVZJVV9PU0RfSE9M
RF9GSUZPX0xJTkVTKDQpIHwKKwkJVklVX09TRF9IT0xEX0ZJRk9fTElORVMoMzEpIHwKIAkJVklV
X09TRF9GSUZPX0RFUFRIX1ZBTCgzMikgfCAvKiBmaWZvX2RlcHRoX3ZhbDogMzIqOD0yNTYgKi8K
IAkJVklVX09TRF9XT1JEU19QRVJfQlVSU1QoNCkgfCAvKiA0IHdvcmRzIGluIDEgYnVyc3QgKi8K
IAkJVklVX09TRF9GSUZPX0xJTUlUUygyKTsgICAgICAvKiBmaWZvX2xpbTogMioxNj0zMiAqLwot
LSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

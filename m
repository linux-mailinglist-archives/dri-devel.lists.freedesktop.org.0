Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CA6D62B9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 14:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD126E29D;
	Mon, 14 Oct 2019 12:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CBF76E29D
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:38:37 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p14so19546098wro.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 05:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IAnG23BH8wEYd0HfQqSBBE73oP4oxu8SI3nR4a88olc=;
 b=iP+sjmv7XkMhBzcBawpvd/icHi2BLqKozfDKv+KiZdojayQNkvF0XDRYv5hYbFgfCq
 5Sy8etNSum8a6MSt/S/FMwm0eaDDhPRpAWfgaP5a9U5seSY6bRdBRB/+6ApGPL4K0fD8
 ZIyF6WCdCQ4tG0xU77P1FbHpIYwnH3EKjxR0MGVb2IB6Qa+qLI3wvkkNiWT9VA3NFfTp
 wLo1XYDCPOxVff//tXdB/sU6c0d78abT01qf03Yzhn6BLSNmrsOD2YOLqjWKbmOcDWCR
 /yt+mrSOKnzXbarQCoOhKvdoBFhwFw6un7y6OCZEocSXqN90m4l3mm/nDfLdxSrd8a2O
 LCkQ==
X-Gm-Message-State: APjAAAVUR8Fhwf1LYlyiKanqf1HMqvouSTzNdO87stNufwVBN8HvHGpQ
 S4H6tO8/mlQL4OKMmw4vSDGmKoBuhPFlbA==
X-Google-Smtp-Source: APXvYqzF9XZTNVOAr8QblCl0cKPXnEaofywqCkysNDWSl6nAGgBWpvNdpKzrOBdT7IUuUbl+BIXXFw==
X-Received: by 2002:adf:ebcb:: with SMTP id v11mr23975630wrn.24.1571056715631; 
 Mon, 14 Oct 2019 05:38:35 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 3sm19171203wmo.22.2019.10.14.05.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:38:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/7] drm/meson: hold 32 lines after vsync to give time for
 AFBC start
Date: Mon, 14 Oct 2019 14:38:25 +0200
Message-Id: <20191014123826.27629-7-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191014123826.27629-1-narmstrong@baylibre.com>
References: <20191014123826.27629-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IAnG23BH8wEYd0HfQqSBBE73oP4oxu8SI3nR4a88olc=;
 b=qlmGx9bxhJeSbrQJddAhEwZxnmonu1PxJ4zsKPBmg+4kWn7rxXwIpeemyL5Cjo+Yi9
 N1rVcNC3VYzbfasdGmj2x8dxdnZFDrVCNQ9HosWe26JRUk2gVsG8wPfDr5QeUaqw0mot
 10QWWOyl8uobs/eZZJ0Pqs5pBDimJ7SVMW9OjqOLvjvUgGqox8u3zJa6BhZWrdCEil1a
 MAZoQcmpErLwuKoBb1Ftpqgag1Rb/8hpsFg8771ut+YgumtfsrRuAzJuxG+MYXMdjOhr
 7qZ4tSnnKDM8BQ4YIW/TOx6AQolEB1mblRxkHknbQVqKevuevSx6PffElFxZSQCx9cb4
 xO0Q==
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, ayan.halder@arm.com,
 linux-arm-kernel@lists.infradead.org
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
CmluZGV4IDA3NzEzNTg4MDYzZS4uMGE3NjIwNDY2OTliIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
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

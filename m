Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D6656440
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 10:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B41AD6E317;
	Wed, 26 Jun 2019 08:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701296E171
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 16:35:05 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z23so3624507wma.4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 09:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xjvgqiqZzglCEryM8XBbJiMmioEThPc/Ew98mkOW+30=;
 b=sHT6haJZ5m3dd+EZ4+o2i9K24dwF6/PE3uBnP9wCY3SYnQi6ecQbPDlwqPecVNVsnd
 lGDkjBK2OCtkpdIXdBwTdWK55Cx7NlEHr5X/vQQT28kovQvXEOTgpw4V63J737cMx2ae
 P3cv3FmCQBTi0p24Ss3jRYjGhBlm2KILpjyYvx90E3dzHjNIE/Kc8mo/QQgRJfePfLjd
 0kXuMkZ7BtxZ4UR1zApWTQ0g1QQSa0Y4uInMeYex3f7IeLx4ugSmXso1rF5Eq3ZS1Xl3
 5JlraHNiHakgfwjppAcd18Re+VaAiWQ7jW7oC7DSx6XxlKWMakOL51IVCqyQFKlX4RpH
 9gQg==
X-Gm-Message-State: APjAAAXhpot8b0UbMXXjfEVRu9rS6MyB7dD15RBmsr1o/jeJj7BPn32L
 VsPUqvlZ095Le8FWUgwbnkleug==
X-Google-Smtp-Source: APXvYqz13wXYAnILJ9E9trPlEzD6Yeo7CCy/mNFNreUVqazy0miJn87+1vh+k2XQcsjx0bfSNxAnqA==
X-Received: by 2002:a1c:c74a:: with SMTP id x71mr20501151wmf.121.1561480504153; 
 Tue, 25 Jun 2019 09:35:04 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id g8sm2683795wme.20.2019.06.25.09.35.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 09:35:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Lechner <david@lechnology.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 10/12] fbdev: da8xx-fb: use devm_platform_ioremap_resource()
Date: Tue, 25 Jun 2019 18:34:32 +0200
Message-Id: <20190625163434.13620-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625163434.13620-1-brgl@bgdev.pl>
References: <20190625163434.13620-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Jun 2019 08:12:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xjvgqiqZzglCEryM8XBbJiMmioEThPc/Ew98mkOW+30=;
 b=dsz03gRN+B8sj18/khuc/IOGJ4ZAac3MpDKb3Zv/Bc9PoYBZsScWcIBR66+WT13q4A
 tN8EW3Vfjzl0srOYa1HtJEj4YWDxKeLJeFxcOpAU1yqzULbgKdw7lI1k9uJYS2TLwLfq
 nJu10QxZk+xzeoc8TdS7m0YAZ+oQffTcRYbFO9YXz55433gHQs5zlWTN1V3cyKJa1Q2A
 iPJuT54NssEe53FbS36r8nVdcdRnBqTyep+QMieQHsg6JfL23Iqv4l0ggpRn13oHMR0p
 AZG9QARW/pNBZ52Cg4cBykzft5A+BRios2hbeleUvawVzlsiZYnAcBm99WZBoCSgvzcU
 PqsA==
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

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClNo
cmluayB0aGUgY29kZSBhIGJpdCBieSB1c2luZyB0aGUgbmV3IGhlbHBlciB3cmFwcGluZyB0aGUg
Y2FsbHMgdG8KcGxhdGZvcm1fZ2V0X3Jlc291cmNlKCkgYW5kIGRldm1faW9yZW1hcF9yZXNvdXJj
ZSgpIHRvZ2V0aGVyLgoKU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFz
emV3c2tpQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2RhOHh4LWZiLmMg
fCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2RhOHh4LWZiLmMgYi9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2RhOHh4LWZiLmMKaW5kZXggMzI4ZGUyOWM0OTMzLi40ZGRhMTk0ZDZiOGYgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvZGE4eHgtZmIuYworKysgYi9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2RhOHh4LWZiLmMKQEAgLTEzMzksNyArMTMzOSw2IEBAIHN0YXRpYyBpbnQgZmJf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2aWNlKQogewogCXN0cnVjdCBkYTh4eF9s
Y2RjX3BsYXRmb3JtX2RhdGEgKmZiX3BkYXRhID0KIAkJCQkJCWRldl9nZXRfcGxhdGRhdGEoJmRl
dmljZS0+ZGV2KTsKLQlzdHJ1Y3QgcmVzb3VyY2UgKmxjZGNfcmVnczsKIAlzdHJ1Y3QgbGNkX2N0
cmxfY29uZmlnICpsY2RfY2ZnOwogCXN0cnVjdCBmYl92aWRlb21vZGUgKmxjZGNfaW5mbzsKIAlz
dHJ1Y3QgZmJfaW5mbyAqZGE4eHhfZmJfaW5mbzsKQEAgLTEzNTcsOCArMTM1Niw3IEBAIHN0YXRp
YyBpbnQgZmJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZGV2aWNlKQogCWlmIChsY2Rj
X2luZm8gPT0gTlVMTCkKIAkJcmV0dXJuIC1FTk9ERVY7CiAKLQlsY2RjX3JlZ3MgPSBwbGF0Zm9y
bV9nZXRfcmVzb3VyY2UoZGV2aWNlLCBJT1JFU09VUkNFX01FTSwgMCk7Ci0JZGE4eHhfZmJfcmVn
X2Jhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoJmRldmljZS0+ZGV2LCBsY2RjX3JlZ3MpOwor
CWRhOHh4X2ZiX3JlZ19iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKGRldmlj
ZSwgMCk7CiAJaWYgKElTX0VSUihkYTh4eF9mYl9yZWdfYmFzZSkpCiAJCXJldHVybiBQVFJfRVJS
KGRhOHh4X2ZiX3JlZ19iYXNlKTsKIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

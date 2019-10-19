Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FFBDDB91
	for <lists+dri-devel@lfdr.de>; Sun, 20 Oct 2019 02:06:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5879089C49;
	Sun, 20 Oct 2019 00:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B5889E98
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 08:36:16 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f22so8169586wmc.2
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Oct 2019 01:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l2IW6NowdeBUIPfd3VNaI3dgAIYTgpRJtcprF0UeLqs=;
 b=ES7tjfGWggwR1CIu+VVBicMHitpsaPzLvDz8S6LZwqQ29R96Fiv3SyVk9Nnl9udV34
 XzUMu0EUNw1PKHgdYytwd6vCrB8HoOEQKKeaeCjOmielAcNZNWxEJVm+Cp54xuBV6kMn
 tCs14NsqkHCkuUX2SGxtR4XUdw/2RVupg9VYY7GQn35S8wbbPYIdOV3qdOeimmgdu073
 092f+HD8XV9N/FrwFB5l1w/U/Ia4qf2nvVRObOe28cwc+RuxQNN07aprgAnShwSh4ttk
 rKnVo49+ykCX7hV2rz/+Lszxe/hWlXUFUz5CdqJDpY8AoGUF/IbNI7ESW45AFuSaXK3U
 FCkQ==
X-Gm-Message-State: APjAAAU/U3pAFal6SfSLnmeQS0GUvEIT1/DF7saaREgWGFIlEj76wM4Z
 jRuyMxoepqXl63wfEuF1NriuXA==
X-Google-Smtp-Source: APXvYqw3NydOO+Nuq280jVny5Giey8kePuzmSc0rGbxCZeyXpiGDAaroan7UA2mv4I22jq8kYvhYpQ==
X-Received: by 2002:a1c:9cc6:: with SMTP id
 f189mr10385114wme.144.1571474175115; 
 Sat, 19 Oct 2019 01:36:15 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
 by smtp.gmail.com with ESMTPSA id u1sm7242627wmc.38.2019.10.19.01.36.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Oct 2019 01:36:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v6 4/9] sh: ecovec24: add additional properties to the
 backlight device
Date: Sat, 19 Oct 2019 10:35:51 +0200
Message-Id: <20191019083556.19466-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191019083556.19466-1-brgl@bgdev.pl>
References: <20191019083556.19466-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 20 Oct 2019 00:06:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l2IW6NowdeBUIPfd3VNaI3dgAIYTgpRJtcprF0UeLqs=;
 b=HMLHp/EOn7D85bvZcEzeR75AlaOniQc19ENmHjj8gJXXdEEkq6jPm42L87jXMJEsrv
 sewZFUp34htOHovu0XlCfkXlcVXNND+ijmRLoBkT0CXyUBpBTtzL2MN1PzuN0Se+NIwi
 IC+V5Mt5H/7iKH7vTUOg0kCalZ3PwNEsWCuIw5VyQcln48tzMcrRVQkIJVVaSp0g4tWT
 tqGxZzPrS0Trm7oaF+Td7cyfMuWG8vuAWRMfbZSxpYVobQaZyJONblOO4q3VyTXZdFvg
 zMgaQMhUvogJWVDu0cKeilyNoJGYARpuA73fg4vIebg8CzLUFoi3V0FN6M/NZfjfYcBN
 6isg==
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
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KCkFk
ZCBhIEdQSU8gbG9va3VwIGVudHJ5IGFuZCBhIGRldmljZSBwcm9wZXJ0eSBmb3IgR1BJTyBiYWNr
bGlnaHQgdG8gdGhlCmJvYXJkIGZpbGUuIFRpZSB0aGVtIHRvIHRoZSBwbGF0Zm9ybSBkZXZpY2Ug
d2hpY2ggaXMgbm93IHJlZ2lzdGVyZWQgdXNpbmcKcGxhdGZvcm1fZGV2aWNlX3JlZ2lzdGVyX2Z1
bGwoKSBiZWNhdXNlIG9mIHRoZSBwcm9wZXJ0aWVzLiBUaGVzZSBjaGFuZ2VzCmFyZSBpbmFjdGl2
ZSBub3cgYnV0IHdpbGwgYmUgdXNlZCBvbmNlIHRoZSBncGlvIGJhY2tsaWdodCBkcml2ZXIgaXMK
bW9kaWZpZWQuCgpTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxiZ29sYXN6ZXdz
a2lAYmF5bGlicmUuY29tPgpSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hl
dmNoZW5rb0BsaW51eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51
cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQogYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMyNC9z
ZXR1cC5jIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDI1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9i
b2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5jIGIvYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMy
NC9zZXR1cC5jCmluZGV4IGFjYWE5NzQ1OTUzMS4uYWFhOGVhNjI2MzZmIDEwMDY0NAotLS0gYS9h
cmNoL3NoL2JvYXJkcy9tYWNoLWVjb3ZlYzI0L3NldHVwLmMKKysrIGIvYXJjaC9zaC9ib2FyZHMv
bWFjaC1lY292ZWMyNC9zZXR1cC5jCkBAIC0zNzEsNiArMzcxLDE5IEBAIHN0YXRpYyBzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlIGxjZGNfZGV2aWNlID0gewogCX0sCiB9OwogCitzdGF0aWMgc3RydWN0
IGdwaW9kX2xvb2t1cF90YWJsZSBncGlvX2JhY2tsaWdodF9sb29rdXAgPSB7CisJLmRldl9pZAkJ
PSAiZ3Bpby1iYWNrbGlnaHQuMCIsCisJLnRhYmxlID0geworCQlHUElPX0xPT0tVUCgic2g3NzI0
X3BmYyIsIEdQSU9fUFRSMSwgTlVMTCwgR1BJT19BQ1RJVkVfSElHSCksCisJCXsgfQorCX0sCit9
OworCitzdGF0aWMgc3RydWN0IHByb3BlcnR5X2VudHJ5IGdwaW9fYmFja2xpZ2h0X3Byb3BzW10g
PSB7CisJUFJPUEVSVFlfRU5UUllfQk9PTCgiZGVmYXVsdC1vbiIpLAorCXsgfQorfTsKKwogc3Rh
dGljIHN0cnVjdCBncGlvX2JhY2tsaWdodF9wbGF0Zm9ybV9kYXRhIGdwaW9fYmFja2xpZ2h0X2Rh
dGEgPSB7CiAJLmZiZGV2ID0gJmxjZGNfZGV2aWNlLmRldiwKIAkuZ3BpbyA9IEdQSU9fUFRSMSwK
QEAgLTM3OCwxMyArMzkxLDE1IEBAIHN0YXRpYyBzdHJ1Y3QgZ3Bpb19iYWNrbGlnaHRfcGxhdGZv
cm1fZGF0YSBncGlvX2JhY2tsaWdodF9kYXRhID0gewogCS5uYW1lID0gImJhY2tsaWdodCIsCiB9
OwogCi1zdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RldmljZSBncGlvX2JhY2tsaWdodF9kZXZpY2Ug
PSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IHBsYXRmb3JtX2RldmljZV9pbmZvIGdwaW9fYmFja2xp
Z2h0X2RldmljZV9pbmZvID0gewogCS5uYW1lID0gImdwaW8tYmFja2xpZ2h0IiwKLQkuZGV2ID0g
ewotCQkucGxhdGZvcm1fZGF0YSA9ICZncGlvX2JhY2tsaWdodF9kYXRhLAotCX0sCisJLmRhdGEg
PSAmZ3Bpb19iYWNrbGlnaHRfZGF0YSwKKwkuc2l6ZV9kYXRhID0gc2l6ZW9mKGdwaW9fYmFja2xp
Z2h0X2RhdGEpLAorCS5wcm9wZXJ0aWVzID0gZ3Bpb19iYWNrbGlnaHRfcHJvcHMsCiB9OwogCitz
dGF0aWMgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqZ3Bpb19iYWNrbGlnaHRfZGV2aWNlOworCiAv
KiBDRVUwICovCiBzdGF0aWMgc3RydWN0IGNldV9wbGF0Zm9ybV9kYXRhIGNldTBfcGRhdGEgPSB7
CiAJLm51bV9zdWJkZXZzCQkJPSAyLApAQCAtMTAwNiw3ICsxMDIxLDYgQEAgc3RhdGljIHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKmVjb3ZlY19kZXZpY2VzW10gX19pbml0ZGF0YSA9IHsKIAkmdXNi
MV9jb21tb25fZGV2aWNlLAogCSZ1c2Joc19kZXZpY2UsCiAJJmxjZGNfZGV2aWNlLAotCSZncGlv
X2JhY2tsaWdodF9kZXZpY2UsCiAJJmtleXNjX2RldmljZSwKIAkmY24xMl9wb3dlciwKICNpZiBk
ZWZpbmVkKENPTkZJR19NTUNfU0RISSkgfHwgZGVmaW5lZChDT05GSUdfTU1DX1NESElfTU9EVUxF
KQpAQCAtMTQ2Miw2ICsxNDc2LDEyIEBAIHN0YXRpYyBpbnQgX19pbml0IGFyY2hfc2V0dXAodm9p
ZCkKICNlbmRpZgogI2VuZGlmCiAKKwlncGlvZF9hZGRfbG9va3VwX3RhYmxlKCZncGlvX2JhY2ts
aWdodF9sb29rdXApOworCWdwaW9fYmFja2xpZ2h0X2RldmljZSA9IHBsYXRmb3JtX2RldmljZV9y
ZWdpc3Rlcl9mdWxsKAorCQkJCQkmZ3Bpb19iYWNrbGlnaHRfZGV2aWNlX2luZm8pOworCWlmIChJ
U19FUlIoZ3Bpb19iYWNrbGlnaHRfZGV2aWNlKSkKKwkJcmV0dXJuIFBUUl9FUlIoZ3Bpb19iYWNr
bGlnaHRfZGV2aWNlKTsKKwogCXJldHVybiBwbGF0Zm9ybV9hZGRfZGV2aWNlcyhlY292ZWNfZGV2
aWNlcywKIAkJCQkgICAgQVJSQVlfU0laRShlY292ZWNfZGV2aWNlcykpOwogfQotLSAKMi4yMy4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

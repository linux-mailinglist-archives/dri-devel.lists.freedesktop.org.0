Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A63C772EA2
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 14:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B076E4E6;
	Wed, 24 Jul 2019 12:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588036E4AD
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 08:25:17 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p74so40907771wme.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bZYb/2BvCTI7DdfJeewjmu59+q6QA8Ct5o62NPSlXLQ=;
 b=kcavIqabbXy5Is77Ywy8cFLCTCR+I/QZhPwdX5Az+bimTFoVAkyZFPav15PtQgvy5z
 HmcmCvp1mvuhBAbAAr9JMmqENjHn0RBWB6VViDXy8wQzosQSUvWFyvuGFQV+b/USOmIq
 CFDZlwFjh3aZD0tMbdRYioFNptZP2PsKbrMiAaCQBaX3/L62Q8PMQnfMtj9BtnSiK56K
 bs6BKI9q6a9+l8ZRtXKhUG2DbStc+E6nPdycK955fYopn/3peJazuHOJZ7iLOe47mcZw
 rrK+VuqreP513lqy7U/7UQXJRtZrc9s3BTRxN+NaYFw0x13aVzLYzi/UDtAjEDqq/5Jz
 RmZg==
X-Gm-Message-State: APjAAAXMQIjzxpXJl5x9euo3YiSusYLaQOGvZ9FLC3uLCgEGAp0af+Fz
 wQTlPjNyCBHqsPKcnbWTU4Q=
X-Google-Smtp-Source: APXvYqxOORrgcEepfDSEgrObXsBtxM+8pGNSKgl7s1yaroVXpQpRAWrFwTKiJdvbP27wuH9VC4s4Vg==
X-Received: by 2002:a1c:f116:: with SMTP id p22mr71783247wmh.70.1563956715936; 
 Wed, 24 Jul 2019 01:25:15 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id z7sm42393880wrh.67.2019.07.24.01.25.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 01:25:15 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 3/7] sh: ecovec24: don't set unused fields in platform data
Date: Wed, 24 Jul 2019 10:25:04 +0200
Message-Id: <20190724082508.27617-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724082508.27617-1-brgl@bgdev.pl>
References: <20190724082508.27617-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 24 Jul 2019 12:20:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bZYb/2BvCTI7DdfJeewjmu59+q6QA8Ct5o62NPSlXLQ=;
 b=eMMmroR7V1M+etXX4tYfPBtj+QEIIIUXtNJYKhwTIwvxfRUNRc3IZfzvWJXAvrNYWU
 advngdJeEYxOqTd3iZl5xGYkFNxm0CngMKJr18xOtSwvzlW1dOyGy1oMF0bxwqwpA37w
 977smMjcPWCsg44JwBkhdWtYAWEcH+IT+EP22quG88BckRt4EAY+nM9q2ekhzOHyZB5+
 wGgvDvDbX2/qq7WwZtSuhRJcSqByopwj1f7ukQWn41YQi/HWvI0u/IC1pTwK5CTvgKhC
 etBqD7P2AQBsWj+uSkD+VetwheS4bWknvZ6JCCK9BfFIxj4I6ij4mc8vc1cACyjhgPCn
 imvw==
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

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClBs
YXRmb3JtIGRhdGEgZmllbGRzIG90aGVyIHRoYW4gZmJkZXYgYXJlIG5vIGxvbmdlciB1c2VkIGJ5
IHRoZQpiYWNrbGlnaHQgZHJpdmVyLiBSZW1vdmUgdGhlbS4KClNpZ25lZC1vZmYtYnk6IEJhcnRv
c3ogR29sYXN6ZXdza2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+ClJldmlld2VkLWJ5OiBB
bmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KLS0tCiBh
cmNoL3NoL2JvYXJkcy9tYWNoLWVjb3ZlYzI0L3NldHVwLmMgfCAzIC0tLQogMSBmaWxlIGNoYW5n
ZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292
ZWMyNC9zZXR1cC5jIGIvYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMyNC9zZXR1cC5jCmluZGV4
IDY5MjZiYjM4NjViOS4uNjRhNWExNjYyYjZkIDEwMDY0NAotLS0gYS9hcmNoL3NoL2JvYXJkcy9t
YWNoLWVjb3ZlYzI0L3NldHVwLmMKKysrIGIvYXJjaC9zaC9ib2FyZHMvbWFjaC1lY292ZWMyNC9z
ZXR1cC5jCkBAIC0zODYsOSArMzg2LDYgQEAgc3RhdGljIHN0cnVjdCBwcm9wZXJ0eV9lbnRyeSBn
cGlvX2JhY2tsaWdodF9wcm9wc1tdID0gewogCiBzdGF0aWMgc3RydWN0IGdwaW9fYmFja2xpZ2h0
X3BsYXRmb3JtX2RhdGEgZ3Bpb19iYWNrbGlnaHRfZGF0YSA9IHsKIAkuZmJkZXYgPSAmbGNkY19k
ZXZpY2UuZGV2LAotCS5ncGlvID0gR1BJT19QVFIxLAotCS5kZWZfdmFsdWUgPSAxLAotCS5uYW1l
ID0gImJhY2tsaWdodCIsCiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZV9pbmZvIGdwaW9fYmFja2xpZ2h0X2RldmljZV9pbmZvID0gewotLSAKMi4yMS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

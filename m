Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE195DE7AB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 11:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F12FD89C94;
	Mon, 21 Oct 2019 09:15:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154B189C94
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 09:15:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id c6so783020wrm.6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 02:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jRWM1ov/iskQxb+UDVHRjatwtmu3Y1ySBHQ/mr63srY=;
 b=SqN79xfkV8WfdCdoeVLBjeq/XKp3Tf0+epgRLyLbX5liedpDOxwjeSLgPaaLY2echq
 eLid6wraoLRky2wmqZjtmCWywd3ob1FSC6WFerWZZJ2x6m6CalXz495hf2QjNxWQ79z9
 IjcDVlPp2YpZyl8dhFjiyN0qQI4q9SkYcch4twiy6QAN0QkbIlvpx22u1+fBvkJ+rCwT
 hsJbSCQuKpGQ6BQr7+wkvt7VQYdyYEu386EM6fSqTyxUigawxEwf0B1vqYMfvKlbC5Br
 x6O62Uimm68oRe4134PA75CQfGwblImhokrMtYjZcDy65FJdJJusUZeauWEuYYZwPf7H
 zouw==
X-Gm-Message-State: APjAAAVTLOwy9YuV8SKmrlB8CKt+NEJoawPKxvwX8GPkw0kTIFFnBsWZ
 I4lqTUsBLE/93GiDarMX54bxDnt5QzTzZA==
X-Google-Smtp-Source: APXvYqwv4vYzn5AU7M8iqjKunnXBBpWfvjgMY6voo0owV+4UMwcjdHKEx+EizXbR5EU9XWVYvymV4g==
X-Received: by 2002:adf:e302:: with SMTP id b2mr17729852wrj.298.1571649314188; 
 Mon, 21 Oct 2019 02:15:14 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t13sm20281595wra.70.2019.10.21.02.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 02:15:13 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/9] drm/meson: store the framebuffer width for plane commit
Date: Mon, 21 Oct 2019 11:15:03 +0200
Message-Id: <20191021091509.3864-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021091509.3864-1-narmstrong@baylibre.com>
References: <20191021091509.3864-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jRWM1ov/iskQxb+UDVHRjatwtmu3Y1ySBHQ/mr63srY=;
 b=iSovWQ76UjmCftKFJbXaN1S9tgVirSzR2wf54seLBeUq05Tdptc99TIkl8UHIJIsTx
 E8j5wU7SI7JpaIfHgkDc2q1gBaPi/kP7Fy8iYCtJ8nbcrS0829bNjGX8EF3sXYB6+vdy
 L9Owc5kpCkH+ErjcLT5IylGzsulI2ChbXupb/9l6l/PPfXrUBR5q/vjSIVnOkIrSy0AJ
 +8CBf0FibOMnKUSYOX+MMZS9s/xFw5+qvtakq10Ze3DD3EbXItoa/hjCauhc5xgBW9IM
 XETQMakM662m7yaIlGownhIh0YZHu3fUEU2+wdE6jzgiRNU+VZlZDJac2r3cXSduTD8V
 BXIA==
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

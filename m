Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFADB71298
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E67A6E13A;
	Tue, 23 Jul 2019 07:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D6889C60
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 15:03:22 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x4so39751053wrt.6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 08:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LLvAXEq2SM+mYzd8MvDi1noi/4oB+ae8rtxDIe/pNO4=;
 b=Hxohh3YPaW8i3/G+AlUY6b/ITamrPvShsGK2WAGAN7JnpkT6D+NCDBq/73GlqHh36M
 eY7KQDCKhSz2KuNNmzXWbbWZkdqeF6DTIfipm2bv+ib1GWGCCt/U6cAw8KrqbyBSRDop
 /gT8cVgNDZ1WhSUNPfruNBroL5zHHBzKfHo4DgecbU+i9xP0mMDr1HJOz1XVsGVpzNj9
 dnNmI34G2X6KcLoa9OzAckAaMXleaSPv/18b2uNKBb0j8k4C3/m6Q2y1q4YYRQqKQjNp
 Q9xip1kHNkglmQb0DfN+iZdzkRwRwg2pyHR+8QFKxErV9aI/iKFkshbVlG5lIpUgKist
 q2bA==
X-Gm-Message-State: APjAAAXcjF6e80N5uFl9BsFiWJfpjhD/bRRi4chfvrV6ikiR24csOUvb
 7qD0lodKoypg6WuTQGbKZD4=
X-Google-Smtp-Source: APXvYqxvVgKJopHmtr3HmxSqR0pet7pHj/B1wjfvhB2W3jmIJhEdw2gzxQuq1hz3S75KUVbiMQ7OLg==
X-Received: by 2002:adf:f84a:: with SMTP id d10mr69194280wrq.319.1563807801489; 
 Mon, 22 Jul 2019 08:03:21 -0700 (PDT)
Received: from localhost.localdomain
 (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
 by smtp.gmail.com with ESMTPSA id v23sm36310460wmj.32.2019.07.22.08.03.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 22 Jul 2019 08:03:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 5/7] backlight: gpio: remove dev from struct gpio_backlight
Date: Mon, 22 Jul 2019 17:03:00 +0200
Message-Id: <20190722150302.29526-6-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190722150302.29526-1-brgl@bgdev.pl>
References: <20190722150302.29526-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LLvAXEq2SM+mYzd8MvDi1noi/4oB+ae8rtxDIe/pNO4=;
 b=HaBuYw8aP/LTLQkjoBo3QxFQrr5CvKqNDDJOUoZjamO6fWlt7hKvBHcwVDhTxa2bVk
 PGmrPqgdMzHYC40+rjS1RCR1E5fh3s4d66tpKXUu2PJoyoXOFhpbeXpgJ6AEM9p2yZ4o
 93mf4+8xW9ChHouV4+22xxtu7EsKTKnml1ymwSywVL8CPeX0NZdPM7gPIb2OmzV20UUI
 Y13RNHjxzT16PLh80llP2bp1kam0WIwrFGsbeQrfnFr6IGkG5/NtHUsUTBQGlXBAJ9Ur
 dU1qJZ6RRrzhjtNst8i/aUfgatG9XA3jevR78rlR86grA+KQBLViQ+NLtwPAgQF0Lk+L
 BGIw==
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

RnJvbTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFzemV3c2tpQGJheWxpYnJlLmNvbT4KClRo
aXMgZmllbGQgaXMgdW51c2VkLiBSZW1vdmUgaXQuCgpTaWduZWQtb2ZmLWJ5OiBCYXJ0b3N6IEdv
bGFzemV3c2tpIDxiZ29sYXN6ZXdza2lAYmF5bGlicmUuY29tPgotLS0KIGRyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L2dwaW9fYmFja2xpZ2h0LmMgfCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dwaW9fYmFj
a2xpZ2h0LmMgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCmluZGV4
IDAxMjYyMTg2ZmExZS4uNzA4ODI1NTZmMDQ3IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2Jh
Y2tsaWdodC9ncGlvX2JhY2tsaWdodC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2dw
aW9fYmFja2xpZ2h0LmMKQEAgLTE5LDkgKzE5LDcgQEAKICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+
CiAKIHN0cnVjdCBncGlvX2JhY2tsaWdodCB7Ci0Jc3RydWN0IGRldmljZSAqZGV2OwogCXN0cnVj
dCBkZXZpY2UgKmZiZGV2OwotCiAJc3RydWN0IGdwaW9fZGVzYyAqZ3Bpb2Q7CiAJaW50IGRlZl92
YWx1ZTsKIH07CkBAIC02OSw4ICs2Nyw2IEBAIHN0YXRpYyBpbnQgZ3Bpb19iYWNrbGlnaHRfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoZ2JsID09IE5VTEwpCiAJCXJl
dHVybiAtRU5PTUVNOwogCi0JZ2JsLT5kZXYgPSAmcGRldi0+ZGV2OwotCiAJaWYgKHBkYXRhKQog
CQlnYmwtPmZiZGV2ID0gcGRhdGEtPmZiZGV2OwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

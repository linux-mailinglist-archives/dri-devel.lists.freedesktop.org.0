Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC1F265E6
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790B789ADC;
	Wed, 22 May 2019 14:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A100C8921C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 17:24:36 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q15so168769wmj.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 10:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=37CxHYKlFVVAIEnj21tdjvUOrJCuiyhrkjA75AgmUDE=;
 b=NzdBjszG2Cqdfh/o3vznzdaUT7qim2HSQxKXt23xelpG0X91uHU4xQCGi4kS8Tgz5W
 rXiT6Y8wSTIFm3YM7An69cqYkAPzXmAcxgPTq8Jrsu+kW4QBLOMoHcRuWIrw8EeZiMuE
 QvBjZ0nZugJUHj2GLIjXlewVgO9/1UOKT2Io5bT9OqnRFuIs9MDAEIdV0/ywye0+HO5T
 zNhitkzv7+w85BkMp40EopdMQH199CE+2EoY48MAz/fS4lOBwgBmXJ72MB5ZlKix1Uxl
 5QlKbexZuYFBkjcscUV6bPNA0X5hI+zOFDsAkwawLO+vkex9InX2jTERL03HJOUidlYB
 4f6g==
X-Gm-Message-State: APjAAAUZjlQ5AEhN+RrTpFXmQ2P8rXAv03xFYoc6r6jJjdBu6czHeHuF
 x3V9jCbdU2wSjvhnGCKPof8tkw==
X-Google-Smtp-Source: APXvYqxV/0ooJTzXznpbzssyf0Zwt44GQp/pzzVYbD8W+Rh1jTkMM3EzUOJLQxOAZDv/ikTEgktB8w==
X-Received: by 2002:a1c:9dc7:: with SMTP id g190mr146017wme.121.1558373075294; 
 Mon, 20 May 2019 10:24:35 -0700 (PDT)
Received: from localhost.localdomain ([91.253.179.221])
 by smtp.gmail.com with ESMTPSA id b12sm180021wmg.27.2019.05.20.10.24.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 10:24:34 -0700 (PDT)
From: Andrea Parri <andrea.parri@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] drm/msm: Fix improper uses of smp_mb__{before,
 after}_atomic()
Date: Mon, 20 May 2019 19:23:55 +0200
Message-Id: <1558373038-5611-2-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558373038-5611-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1558373038-5611-1-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=37CxHYKlFVVAIEnj21tdjvUOrJCuiyhrkjA75AgmUDE=;
 b=QXPL+94F09z4z+ao64JQeUt9XFjjtv8g/N09kNE3fTGLUbp/qYLl1g57/r3St9bLbM
 8ytkzOh0Wuy8BN9SlXxU9XZyfWLOan/bGagJczwA0VwsDnRdfZC+BvBUhMUoa7OVVnGu
 Xm4cRqIxYjsIiLDMFpj6u8/02xysp+dxL6e8g=
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
Cc: Andrea Parri <andrea.parri@amarulasolutions.com>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org,
 "Paul E. McKenney" <paulmck@linux.ibm.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgYmFycmllcnMgb25seSBhcHBseSB0byB0aGUgcmVhZC1tb2RpZnktd3JpdGUgb3BlcmF0
aW9uczsgaW4KcGFydGljdWxhciwgdGhleSBkbyBub3QgYXBwbHkgdG8gdGhlIGF0b21pY19zZXQo
KSBwcmltaXRpdmUuCgpSZXBsYWNlIHRoZSBiYXJyaWVycyB3aXRoIHNtcF9tYigpcy4KCkZpeGVz
OiBiMWZjMjgzOWQyZjkyICgiZHJtL21zbTogSW1wbGVtZW50IHByZWVtcHRpb24gZm9yIEE1WFgg
dGFyZ2V0cyIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnClJlcG9ydGVkLWJ5OiAiUGF1bCBF
LiBNY0tlbm5leSIgPHBhdWxtY2tAbGludXguaWJtLmNvbT4KUmVwb3J0ZWQtYnk6IFBldGVyIFpp
amxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KU2lnbmVkLW9mZi1ieTogQW5kcmVhIFBhcnJp
IDxhbmRyZWEucGFycmlAYW1hcnVsYXNvbHV0aW9ucy5jb20+CkNjOiBSb2IgQ2xhcmsgPHJvYmRj
bGFya0BnbWFpbC5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlk
IEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KQ2M6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9yYS5vcmc+CkNjOiBsaW51
eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZwpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogIlBhdWwgRS4gTWNL
ZW5uZXkiIDxwYXVsbWNrQGxpbnV4LmlibS5jb20+CkNjOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6
QGluZnJhZGVhZC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9wcmVl
bXB0LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9wcmVl
bXB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X3ByZWVtcHQuYwppbmRleCAz
ZDYyMzEwYTUzNWZiLi5lZTA4MjBlZTBjNjY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2FkcmVuby9hNXh4X3ByZWVtcHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVu
by9hNXh4X3ByZWVtcHQuYwpAQCAtMzksMTAgKzM5LDEwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBz
ZXRfcHJlZW1wdF9zdGF0ZShzdHJ1Y3QgYTV4eF9ncHUgKmdwdSwKIAkgKiBwcmVlbXB0aW9uIG9y
IGluIHRoZSBpbnRlcnJ1cHQgaGFuZGxlciBzbyBiYXJyaWVycyBhcmUgbmVlZGVkCiAJICogYmVm
b3JlLi4uCiAJICovCi0Jc21wX21iX19iZWZvcmVfYXRvbWljKCk7CisJc21wX21iKCk7CiAJYXRv
bWljX3NldCgmZ3B1LT5wcmVlbXB0X3N0YXRlLCBuZXcpOwogCS8qIC4uLiBhbmQgYWZ0ZXIqLwot
CXNtcF9tYl9fYWZ0ZXJfYXRvbWljKCk7CisJc21wX21iKCk7CiB9CiAKIC8qIFdyaXRlIHRoZSBt
b3N0IHJlY2VudCB3cHRyIGZvciB0aGUgZ2l2ZW4gcmluZyBpbnRvIHRoZSBoYXJkd2FyZSAqLwot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

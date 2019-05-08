Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B5118143
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 22:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF2F89930;
	Wed,  8 May 2019 20:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A58489907;
 Wed,  8 May 2019 20:43:58 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id w25so118274qkj.11;
 Wed, 08 May 2019 13:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D+5a7yIWfQM2RvqyQS12Uu7fVHTzOqx14y8Bsmfizjw=;
 b=cVTgZ6UtJrkHtwRIkieo1qmF7BLPdHjJzMttQV3MG7qVvhmPfihRM+PBHvx2GUBHbt
 xaUpqqNHQbi+xTvJaZr6oK7g8cUh2CLyfXZzYOi15z6ZiYpruJ1KKEbXH7g7m2ugD8JS
 hQepeTe+0eT2ArTylRYWBAARiTcbSD7npC8Cdp+/uAXqSe1oHalfZD5wHaAAj4S78iec
 Qp12Xi9JWlVAb7ZNCyCYfrFt7R8yR+eSRlXX7INYpE7pFearXO7VimcxT037jfdNr8Fp
 S8b7voENyEJK2tKrVElnbDYhLdcYoS+YGjoJYQqoseQ98Ms9/krI/fts8eLRSlTnMYJO
 YTQQ==
X-Gm-Message-State: APjAAAWdYUwo44Felx4eNAKNDo/IbW9kqum5aejYI4WZyudyN1Yu39DM
 BGwazLcV336ZTJqc20M4kete0iVTEq4=
X-Google-Smtp-Source: APXvYqxuSaA7O0Kfvow7bS6+66Q1kCm9xtHIqoJya9G35v6+67pZVluGYmgVIgRVikVrU1R2Ow08rw==
X-Received: by 2002:a37:b4c6:: with SMTP id d189mr7925772qkf.173.1557348237279; 
 Wed, 08 May 2019 13:43:57 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:6268:7a0b:50be:cebc])
 by smtp.gmail.com with ESMTPSA id u2sm14131qkb.37.2019.05.08.13.43.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 13:43:56 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/msm/mdp5: Use the interconnect API
Date: Wed,  8 May 2019 13:42:15 -0700
Message-Id: <20190508204219.31687-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190508204219.31687-1-robdclark@gmail.com>
References: <20190508204219.31687-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D+5a7yIWfQM2RvqyQS12Uu7fVHTzOqx14y8Bsmfizjw=;
 b=PXEIRHCYBAhc/MI+OVHSqQ/OUK0FRyA6cewJp/JxCuqKhxrD8xflX/xYjakuSRlV+j
 bzHoRlNx4GFNyr08V2kvI/4lM6I7pR2Prx/hnUbwntSECCYxbZtLDy5nqKGHoxA2jJnR
 OBqMmCSgzw1FD8ho4L/G/2RpClWH07txtknw+rLfb91XD5WBEYAv34JlkjZ4Ump9shRK
 xtukBuq3opyrXSjbhg3OQIhlFWAVxGl0wfEYTXiqJ6ZxAQT7zxm8xXNhpRuOVUTuwb6S
 7849sMDcPeGt911RbZvMqWtBmgDUHKEYvR9I2ajWYjeDjvjt8pT6uV77orYWlkIvPQM5
 WxmA==
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR2VvcmdpIERqYWtvdiA8Z2VvcmdpLmRqYWtvdkBsaW5hcm8ub3JnPgoKU2lnbmVkLW9m
Zi1ieTogR2VvcmdpIERqYWtvdiA8Z2VvcmdpLmRqYWtvdkBsaW5hcm8ub3JnPgpTaWduZWQtb2Zm
LWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYyB8IDE0ICsrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9tZHA1L21kcDVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9t
ZHA1X2ttcy5jCmluZGV4IDk3MTc5YmVjODkwMi4uNTRkMmI0YzJiMDlmIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMKQEAgLTE2LDYgKzE2LDcgQEAKICAqIHRoaXMg
cHJvZ3JhbS4gIElmIG5vdCwgc2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KICAq
LwogCisjaW5jbHVkZSA8bGludXgvaW50ZXJjb25uZWN0Lmg+CiAjaW5jbHVkZSA8bGludXgvb2Zf
aXJxLmg+CiAKICNpbmNsdWRlICJtc21fZHJ2LmgiCkBAIC0xMDUwLDYgKzEwNTEsMTkgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBjb21wb25lbnRfb3BzIG1kcDVfb3BzID0gewogCiBzdGF0aWMgaW50
IG1kcDVfZGV2X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CisJc3RydWN0
IGljY19wYXRoICpwYXRoMCA9IG9mX2ljY19nZXQoJnBkZXYtPmRldiwgInBvcnQwIik7CisJc3Ry
dWN0IGljY19wYXRoICpwYXRoMSA9IG9mX2ljY19nZXQoJnBkZXYtPmRldiwgInBvcnQxIik7CisJ
c3RydWN0IGljY19wYXRoICpwYXRoX3JvdCA9IG9mX2ljY19nZXQoJnBkZXYtPmRldiwgInJvdGF0
b3IiKTsKKworCWlmIChJU19FUlIocGF0aDApKQorCQlyZXR1cm4gUFRSX0VSUihwYXRoMCk7CisJ
aWNjX3NldF9idyhwYXRoMCwgMCwgTUJwc190b19pY2MoNjQwMCkpOworCisJaWYgKCFJU19FUlIo
cGF0aDEpKQorCQlpY2Nfc2V0X2J3KHBhdGgxLCAwLCBNQnBzX3RvX2ljYyg2NDAwKSk7CisJaWYg
KCFJU19FUlIocGF0aF9yb3QpKQorCQlpY2Nfc2V0X2J3KHBhdGhfcm90LCAwLCBNQnBzX3RvX2lj
Yyg2NDAwKSk7CisKIAlEQkcoIiIpOwogCXJldHVybiBjb21wb25lbnRfYWRkKCZwZGV2LT5kZXYs
ICZtZHA1X29wcyk7CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A27CF07D6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 22:11:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED0F6EA33;
	Tue,  5 Nov 2019 21:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc41.google.com (mail-yw1-xc41.google.com
 [IPv6:2607:f8b0:4864:20::c41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 185F36EA20
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 21:11:00 +0000 (UTC)
Received: by mail-yw1-xc41.google.com with SMTP id d5so8825234ywk.9
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Nov 2019 13:11:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wkKPVb6pP5aq3OLgQzfYcwJ5aNwtIA26btnxZ0mORbM=;
 b=XMFIMnbkRgsYVg2hPuubYZFb7kS7w7r8At7v+6MoDy2u3heatFb+J8hgjcdMAzKEgi
 S+yLx06RmDYtX0mBvtw3xxfXYS6VAEbkcDfjzA3vX+DLXFHVy+TPoL3NPxptVvZvEnOn
 YbIboUfoNCAtAALDw16HMWsrA5TjgQGsV8isSfNCtbSBzHebhI4a5W9xQ8PSevBF2amn
 xGcIRjiBdJ01aL2P8RCujhgVGpxMAxMc9eTXggn7oqxbf031z6X8EwaeudAif2VhjzjD
 syhGJbTwuRYhWljC1lT6QuF2VwWLv1jP+p0chjjA2fX0s1h+sdaIvEXMP0etIQ7tCajk
 MgWQ==
X-Gm-Message-State: APjAAAWCSJPhM5DYdKFGpnJUG63R8lI+MtvaOxQoaUMxtL98WN7tLv8a
 293f6jTjj3PvJo1Opdvx8uwpq9UudhI=
X-Google-Smtp-Source: APXvYqyUCARybzwRjLGPnWuXk2JznQo9jeaLOMjuFbMyCaJBgQqqFWRHOQEwoBTwK7kELxzPui6Q+w==
X-Received: by 2002:a0d:ca12:: with SMTP id m18mr25386699ywd.97.1572988259096; 
 Tue, 05 Nov 2019 13:10:59 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id j66sm1815216ywb.101.2019.11.05.13.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2019 13:10:58 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 6/7] drm/mediatek: Support reflect-x plane rotation
Date: Tue,  5 Nov 2019 16:10:23 -0500
Message-Id: <20191105211034.123937-7-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191105211034.123937-1-sean@poorly.run>
References: <20191105211034.123937-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wkKPVb6pP5aq3OLgQzfYcwJ5aNwtIA26btnxZ0mORbM=;
 b=Mq6TglzNM33XbXY7U0CDyP267OuSAHrU9t/Sm6DqR/tMUQ61hFziZ0yRWSJeugur5+
 rDiepGUZBx3TNu3ZVfa/ay14OgmV9ay+S0QbY+AeRHda6+7AaqpR3TlAtZloi5bE6HTT
 PAtXrU8G/YWwxUEcsW7XJ71obGHphVljhfNcT3Um/caOXlpaBQFOrfPvNYE9MbHWmGJS
 XhqSNf+g8ZLpnScwCo4xMTQN5Cfe3w5agoGjyvbkaPo0IPh7kGmc/q3TA8isg6KZyICV
 cECCGKePRvI6jpsOiDJKHdlsEHT40fovY2XPOeWib4+FkwXFr5Wqh3bpHtJ9E/VtUC8K
 vr+w==
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
Cc: dcastagna@chromium.org, matthias.bgg@gmail.com, mcasas@chromium.org,
 Sean Paul <seanpaul@chromium.org>, frkoenig@chromium.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpBZGQgc3VwcG9ydCBmb3Ig
UkVGTEVDVF9YIHJvdGF0aW9ucy4KCkNjOiBGcml0eiBLb2VuaWcgPGZya29lbmlnQGNocm9taXVt
Lm9yZz4KQ2M6IERhbmllbGUgQ2FzdGFnbmEgPGRjYXN0YWduYUBjaHJvbWl1bS5vcmc+CkNjOiBN
aWd1ZWwgQ2FzYXMgPG1jYXNhc0BjaHJvbWl1bS5vcmc+CkNjOiBNYXJrIFlhY291YiA8bWFya3lh
Y291YkBnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9t
aXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3Bfb3ZsLmMgfCAx
MCArKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5j
IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292bC5jCmluZGV4IGZhZTEwYWVh
ZDNkNS4uZjRjNGQzZmVkYzVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2Rpc3Bfb3ZsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX292
bC5jCkBAIC01Myw2ICs1Myw3IEBACiAjZGVmaW5lCU9WTF9DT05fQUVOCQlCSVQoOCkKICNkZWZp
bmUJT1ZMX0NPTl9BTFBIQQkJMHhmZgogI2RlZmluZQlPVkxfQ09OX1ZJUlRfRkxJUAlCSVQoOSkK
KyNkZWZpbmUJT1ZMX0NPTl9IT1JaX0ZMSVAJQklUKDEwKQogCiBzdHJ1Y3QgbXRrX2Rpc3Bfb3Zs
X2RhdGEgewogCXVuc2lnbmVkIGludCBhZGRyOwpAQCAtMTQyLDcgKzE0Myw4IEBAIHN0YXRpYyB1
bnNpZ25lZCBpbnQgbXRrX292bF9sYXllcl9ucihzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wKQog
CiBzdGF0aWMgdW5zaWduZWQgaW50IG10a19vdmxfc3VwcG9ydGVkX3JvdGF0aW9ucyhzdHJ1Y3Qg
bXRrX2RkcF9jb21wICpjb21wKQogewotCXJldHVybiBEUk1fTU9ERV9ST1RBVEVfMCB8IERSTV9N
T0RFX1JFRkxFQ1RfWTsKKwlyZXR1cm4gRFJNX01PREVfUk9UQVRFXzAgfCBEUk1fTU9ERV9SRUZM
RUNUX1kgfAorCSAgICAgICBEUk1fTU9ERV9SRUZMRUNUX1g7CiB9CiAKIHN0YXRpYyBpbnQgbXRr
X292bF9sYXllcl9jaGVjayhzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQg
aWR4LApAQCAtMTUzLDYgKzE1NSw3IEBAIHN0YXRpYyBpbnQgbXRrX292bF9sYXllcl9jaGVjayhz
dHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQgaWR4LAogCiAJcm90YXRpb24g
PSBkcm1fcm90YXRpb25fc2ltcGxpZnkoc3RhdGUtPnJvdGF0aW9uLAogCQkJCQkgRFJNX01PREVf
Uk9UQVRFXzAgfAorCQkJCQkgRFJNX01PREVfUkVGTEVDVF9YIHwKIAkJCQkJIERSTV9NT0RFX1JF
RkxFQ1RfWSk7CiAJcm90YXRpb24gJj0gfkRSTV9NT0RFX1JPVEFURV8wOwogCkBAIC0yNjksNiAr
MjcyLDExIEBAIHN0YXRpYyB2b2lkIG10a19vdmxfbGF5ZXJfY29uZmlnKHN0cnVjdCBtdGtfZGRw
X2NvbXAgKmNvbXAsIHVuc2lnbmVkIGludCBpZHgsCiAJCWFkZHIgKz0gKHBlbmRpbmctPmhlaWdo
dCAtIDEpICogcGVuZGluZy0+cGl0Y2g7CiAJfQogCisJaWYgKHBlbmRpbmctPnJvdGF0aW9uICYg
RFJNX01PREVfUkVGTEVDVF9YKSB7CisJCWNvbiB8PSBPVkxfQ09OX0hPUlpfRkxJUDsKKwkJYWRk
ciArPSBwZW5kaW5nLT5waXRjaCAtIDE7CisJfQorCiAJd3JpdGVsX3JlbGF4ZWQoY29uLCBjb21w
LT5yZWdzICsgRElTUF9SRUdfT1ZMX0NPTihpZHgpKTsKIAl3cml0ZWxfcmVsYXhlZChwaXRjaCwg
Y29tcC0+cmVncyArIERJU1BfUkVHX09WTF9QSVRDSChpZHgpKTsKIAl3cml0ZWxfcmVsYXhlZChz
cmNfc2l6ZSwgY29tcC0+cmVncyArIERJU1BfUkVHX09WTF9TUkNfU0laRShpZHgpKTsKLS0gClNl
YW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

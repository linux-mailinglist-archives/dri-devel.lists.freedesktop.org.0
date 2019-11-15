Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F308CFD8BF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 10:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 466656E271;
	Fri, 15 Nov 2019 09:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD156E203
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 09:21:34 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id s5so10162593wrw.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 01:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vX1DkINX0qzwZxajq4+jl5Y1sZJsGpdwsg9rStYWNQQ=;
 b=HIUXj1RYNol/Q9F/GleNjSi0A6lyDA+70stJA1IzOpbvMYcBgxRzxFuFAbMytGlbfP
 PzAgACRG8OppNEXWU9jBnWqqpYkdFhpMiMDeypig3LomVxHcL/KaEsEJ1Crp3/ewB/cG
 JlqVM3sI7KNLMK7H5UGnJj5uvs1DXS33p6/2thD11dfvIz2J9Ae8/wN3BGqikc3nNx39
 EUbH5EcLu7YhPfX75ptQYzFr231cZnxBzCJ/HEtB5KwJ2XLM8KtMxxHQUd9+q+qSv2Wz
 z4SskfuF53ebSk9+W+Go4Q7StVYZhLAXCyNHTNXFtz3mSFkA4gQzw1ZVRrGwDdgQ6Pqm
 sSXg==
X-Gm-Message-State: APjAAAUQ9aFn/OfK20+0zFMsW408FrPMVZI6reCZgJ62X391Kf1CrRec
 7H8YXs+2kBWh7WsPihRZeuxSAzRYBWM=
X-Google-Smtp-Source: APXvYqwl+q75uP5+/xoSYNSKpC4WkEgq9hN8gXmGTeHhHGWE/fuMiQXHfXof5Clrb4tp5cG9MRQ2TQ==
X-Received: by 2002:adf:ec42:: with SMTP id w2mr1852882wrn.32.1573809692466;
 Fri, 15 Nov 2019 01:21:32 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 11sm8987506wmi.8.2019.11.15.01.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 01:21:31 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/8] drm/tilcdc: Drop drm_gem_fb_create wrapper
Date: Fri, 15 Nov 2019 10:21:17 +0100
Message-Id: <20191115092120.4445-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vX1DkINX0qzwZxajq4+jl5Y1sZJsGpdwsg9rStYWNQQ=;
 b=X8syPp1+HZ+OkMoxH1Z7aBeW6cY1mcPVA+MXokDIZ2P2RGVZ6wVzjGG3ISY/dx2j3Q
 9/UvK8EaFQQHqEhZn/4ah/HszUK/02TEM2cvfnG90VCk/LO11hS1ZON9SyI0ngSHmU8A
 uyRwEeI62n3OyNGoz0WnA6PuvMtqDvQ9tuVhg=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9lc24ndCBkbyBhbnl0aGluZy4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KQ2M6IFRv
bWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3RpbGNkYy90aWxjZGNfZHJ2LmMgfCA4ICstLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rp
bGNkYy90aWxjZGNfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY19kcnYuYwpp
bmRleCAyYTllNjc1OTczNzUuLmExNjA4ODBiZWEwYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3RpbGNkYy90aWxjZGNfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RpbGNkYy90aWxj
ZGNfZHJ2LmMKQEAgLTY0LDEyICs2NCw2IEBAIHZvaWQgdGlsY2RjX21vZHVsZV9jbGVhbnVwKHN0
cnVjdCB0aWxjZGNfbW9kdWxlICptb2QpCiAKIHN0YXRpYyBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHRp
bGNkY19vZl9tYXRjaFtdOwogCi1zdGF0aWMgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqdGlsY2Rj
X2ZiX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAotCQlzdHJ1Y3QgZHJtX2ZpbGUgKmZp
bGVfcHJpdiwgY29uc3Qgc3RydWN0IGRybV9tb2RlX2ZiX2NtZDIgKm1vZGVfY21kKQotewotCXJl
dHVybiBkcm1fZ2VtX2ZiX2NyZWF0ZShkZXYsIGZpbGVfcHJpdiwgbW9kZV9jbWQpOwotfQotCiBz
dGF0aWMgaW50IHRpbGNkY19hdG9taWNfY2hlY2soc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJ
CSAgICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpCiB7CkBAIC0xNDAsNyArMTM0
LDcgQEAgc3RhdGljIGludCB0aWxjZGNfY29tbWl0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiB9
CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2Z1bmNzIG1vZGVfY29uZmln
X2Z1bmNzID0gewotCS5mYl9jcmVhdGUgPSB0aWxjZGNfZmJfY3JlYXRlLAorCS5mYl9jcmVhdGUg
PSBkcm1fZ2VtX2ZiX2NyZWF0ZSwKIAkuYXRvbWljX2NoZWNrID0gdGlsY2RjX2F0b21pY19jaGVj
aywKIAkuYXRvbWljX2NvbW1pdCA9IHRpbGNkY19jb21taXQsCiB9OwotLSAKMi4yNC4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

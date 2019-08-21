Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A799796A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 14:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A026E312;
	Wed, 21 Aug 2019 12:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624E26E312
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 12:31:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id o4so1940954wmh.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 05:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gEP1Eqz1ufX2Zh9MidlHV8n+9w6C1Ut7DiH3LFU9MtI=;
 b=L990amfL07SEF6PbNC+4Bvcybw5AdnJYIChQXsI54cSu5XktmZDXXF6OgVj51/ZdgM
 bo0KB2y1JmeOQY8CT3EbrQniqVtxO4qX6J1dBIDO++CZDPxCfa2ZI3I7yWXjlqe1r9Kp
 sxFdJg65V3Pf5xwdhb46JdsX7I5pz5lBaAd71fA8FdYxig6qClVKDuyfVmrg+yxXNd3h
 Xxflh9XtGGDGJfVY/kE7wrN7kh1EqHwd9wcNVZbYqi3xbVN9fL04lOZDVkfQgKrUVYrq
 C45HMYEYWu0hyhGW2WhokL1qS1zMGZpOfV9m0Lzuhk2Zrmq9ZKAm75PLeu/9b0coo7Px
 VlmA==
X-Gm-Message-State: APjAAAUSK7YIauPkZgkvOKQdo4KJwmTg0qAxBv2nW7CImJGBsCTvjHJN
 8RvdiW7rx6/JYYdjaWTM/iyPmoME
X-Google-Smtp-Source: APXvYqwx9pX44R+PFq43qthQnp/yMbCW+JvAOSh2ZSqYDCJ44j5cH765sJSCBDbSneJzpLWvbFGy1Q==
X-Received: by 2002:a05:600c:145:: with SMTP id
 w5mr5821281wmm.75.1566390711937; 
 Wed, 21 Aug 2019 05:31:51 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8189:dd33:a934:c4fa])
 by smtp.gmail.com with ESMTPSA id v3sm23084571wrq.34.2019.08.21.05.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 05:31:51 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 03/10] dma-buf: add dma_fence_array_recycle
Date: Wed, 21 Aug 2019 14:31:40 +0200
Message-Id: <20190821123147.110736-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821123147.110736-1-christian.koenig@amd.com>
References: <20190821123147.110736-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gEP1Eqz1ufX2Zh9MidlHV8n+9w6C1Ut7DiH3LFU9MtI=;
 b=DJUlo0KYyigUgu1cb+IKQJvlF6QOYqZRpUesSagcWxBp1taRWMilO/sBy9nxmsInwk
 ZwQbMqGGIMLB1GmdlMG27EiLtmBT2fbxIUQs/t5/8t9Zo3vnkvyzb/g+RgfCmBB04Uha
 bti2qtG25M1Hc35obkEIgSLV2dIf6rxXGLbz3+VT9L0Y9axTGNU3BdR4PtqA+mn0unuI
 JiZOPjeys2y6iccUpEjiWMTKYKC2OJq/MyofaQtH85tsI4tjBBsXAkzxnXDvdLQ1iuRG
 oaUfqx+qtE2F6jMZZoiLkLZERx0UeikX3sLO7z+uRlN1LctciD3PnTjkakGtUzI3yJC1
 X1Zw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VHJ5IHRvIHJlY3ljbGUgYW4gZG1hX2ZlbmNlX2FycmF5IG9iamVjdCBieSBkcm9wcGluZyB0aGUg
bGFzdApyZWZlcmVuY2UgdG8gaXQgd2l0aG91dCBmcmVlaW5nIGl0LgoKU2lnbmVkLW9mZi1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMv
ZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYyB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KwogaW5jbHVkZS9saW51eC9kbWEtZmVuY2UtYXJyYXkuaCAgIHwgIDEgKwogMiBmaWxlcyBjaGFu
Z2VkLCAyOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1m
ZW5jZS1hcnJheS5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS1hcnJheS5jCmluZGV4IGU4
MmYzMDU1MWFhMS4uMzE0Y2YwZTg4MWQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1h
LWZlbmNlLWFycmF5LmMKKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS1hcnJheS5jCkBA
IC0xODgsNiArMTg4LDMzIEBAIHZvaWQgZG1hX2ZlbmNlX2FycmF5X2luaXQoc3RydWN0IGRtYV9m
ZW5jZV9hcnJheSAqYXJyYXksIHU2NCBjb250ZXh0LAogfQogRVhQT1JUX1NZTUJPTChkbWFfZmVu
Y2VfYXJyYXlfaW5pdCk7CiAKKy8qKgorICogZG1hX2ZlbmNlX2FycmF5X3JldXNlIC0gZHVtbXkg
Zm9yIGRtYV9mZW5jZV9hcnJheV9yZWN5Y2xlCisgKi8KK3N0YXRpYyB2b2lkIGRtYV9mZW5jZV9h
cnJheV9yZXVzZShzdHJ1Y3Qga3JlZiAqa3JlZikKK3sKKwlzdHJ1Y3QgZG1hX2ZlbmNlX2FycmF5
ICphcnJheSA9IGNvbnRhaW5lcl9vZihrcmVmLCB0eXBlb2YoKmFycmF5KSwKKwkJCQkJCSAgICAg
YmFzZS5yZWZjb3VudCk7CisKKwlXQVJOX09OX09OQ0UoIWxpc3RfZW1wdHkoJmFycmF5LT5iYXNl
LmNiX2xpc3QpKTsKK30KKworLyoqCisgKiBkbWFfZmVuY2VfYXJyYXlfdHJ5X3JldXNlIC0gdHJ5
IHRvIHJldXNlIGEgZG1hX2ZlbmNlX2FycmF5IG9iamVjdAorICogQGFycmF5OiBhcnJheSB3aGlj
aCB3ZSBzaG91bGQgdHJ5IHRvIHJldXNlCisgKgorICogVHJ5IHRvIGRyb3AgdGhlIGxhc3QgcmVm
ZXJlbmNlIHRvIGFuIGRtYV9mZW5jZV9hcnJheSBhbmQgc28gYWxsb3cgaXQgdG8gYmUKKyAqIHJl
dXNlZC4KKyAqCisgKiBSZXR1cm5zIHRydWUgaWYgdGhpcyB3YXMgdGhlIGxhc3QgcmVmZXJlbmNl
IHRoZW4gY2FsbGVyIGNhbiByZXVzZSB0aGUgYXJyYXkuCisgKiBJbiB0aGlzIGNhc2UgdGhlIGFy
cmF5IGlzIHJlc2V0IGludG8gYSBzdGF0ZSB3aGVyZSBpdCBjYW4gYmUgdXNlZCB3aXRoCisgKiBk
bWFfZmVuY2VfYXJyYXlfaW5pdCBhZ2Fpbi4KKyAqLworYm9vbCBkbWFfZmVuY2VfYXJyYXlfcmVj
eWNsZShzdHJ1Y3QgZG1hX2ZlbmNlX2FycmF5ICphcnJheSkKK3sKKwlyZXR1cm4ga3JlZl9wdXQo
JmFycmF5LT5iYXNlLnJlZmNvdW50LCBkbWFfZmVuY2VfYXJyYXlfcmV1c2UpOworfQorCiAvKioK
ICAqIGRtYV9mZW5jZV9hcnJheV9mcmVlIC0gZnJlZSBhIGRtYV9mZW5jZV9hcnJheSBvYmplY3QK
ICAqIEBhcnJheTogdGhlIG9iamVjdCB0byBmcmVlCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2RtYS1mZW5jZS1hcnJheS5oIGIvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UtYXJyYXkuaAppbmRl
eCBiZTg1YzA2YjUyNGQuLjM1ZDFkMWU3YzkzYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9k
bWEtZmVuY2UtYXJyYXkuaAorKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS1hcnJheS5oCkBA
IC05Myw2ICs5Myw3IEBAIHN0cnVjdCBkbWFfZmVuY2VfYXJyYXkgKmRtYV9mZW5jZV9hcnJheV9h
bGxvYyhpbnQgbnVtX2ZlbmNlcywKIAkJCQkJICAgICAgc3RydWN0IGRtYV9mZW5jZSAqKmZlbmNl
cyk7CiB2b2lkIGRtYV9mZW5jZV9hcnJheV9pbml0KHN0cnVjdCBkbWFfZmVuY2VfYXJyYXkgKmFy
cmF5LCB1NjQgY29udGV4dCwKIAkJCSAgdW5zaWduZWQgaW50IHNlcW5vLCBib29sIHNpZ25hbF9v
bl9hbnkpOworYm9vbCBkbWFfZmVuY2VfYXJyYXlfcmVjeWNsZShzdHJ1Y3QgZG1hX2ZlbmNlX2Fy
cmF5ICphcnJheSk7CiB2b2lkIGRtYV9mZW5jZV9hcnJheV9mcmVlKHN0cnVjdCBkbWFfZmVuY2Vf
YXJyYXkgKmFycmF5KTsKIAogLyoqCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

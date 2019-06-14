Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 882A346AB1
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 394298961D;
	Fri, 14 Jun 2019 20:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188938961D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:07 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a14so5200799edv.12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y9RKgY0+3FkjSX0Oldmu3gGGi6J9Dx0mTVEOdTGhQwU=;
 b=D4pzgV9Jm/v81nnyfjfRuYhMGt3pctJ4P3tobpgGwjsfzPelt3nAgUOIC0rpkh0vHG
 UsjXfoVxlfJnBM1T5Ba4CfJzpPaMDYjjgKAlBkKXy4cqtrM5ydsm2ss4KUmqsOrpj+sI
 CpJClwQCHkOnQ0vwl2VGzTNQWHK+docy6kVxvqahHyP2nkq0aSIKx6Pxf3G1pzH66u31
 /IuKt9rV/9IB/Xte61o7wqFDJB3cVY2nAkBVzzQhz9T06rS79uEtYFLb4uC6tIQGO2Lo
 lNJrAuY4itEJbDkbFR+y4QxzwNepjoYiBkBKgHy6YLWeIWGNlOok0mhIc7TJubKGiA10
 u88g==
X-Gm-Message-State: APjAAAXN37yGObmqNGiGkTKbyEH5BCs9RFQdYPPsriP2Ff6fVHk6Xcr3
 2IgYxDDgZ5k7Z4mm68sVh+OaxokTko8=
X-Google-Smtp-Source: APXvYqzkCm47/FYrY7Q0W3jwPMfoOrKGsg0RU324Ysjn2Lsd6f06AYcd7EAKzECV9fCuHygeacDimA==
X-Received: by 2002:a50:8825:: with SMTP id b34mr25676201edb.22.1560544624634; 
 Fri, 14 Jun 2019 13:37:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:04 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 37/59] drm/virtio: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:53 +0200
Message-Id: <20190614203615.12639-38-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y9RKgY0+3FkjSX0Oldmu3gGGi6J9Dx0mTVEOdTGhQwU=;
 b=BPfkevHAKLwcTEw0iqHFXr8QiwGBGtYDzLrlPA04hLqsksgpZSe8k1jkI+UeyWJCq0
 bzYSraRuURwxAl6JOFAj1AjqcABPYDgSWlvxFGBSdSQAMcRaz1OOnyQjz3xnOfl1CwyA
 mnEW049jvD964PgHDYJaWX322cLd5Um9CNf7Q=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4KQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCi0tLQogZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQs
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0
Z3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jCmluZGV4IDBh
ZmRmNTFmZGNmZC4uOTliY2QyOTBmMWZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmly
dGlvL3ZpcnRncHVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Ry
di5jCkBAIC0yMDcsOCArMjA3LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGRyaXZlciA9
IHsKICNlbmRpZgogCS5wcmltZV9oYW5kbGVfdG9fZmQgPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90
b19mZCwKIAkucHJpbWVfZmRfdG9faGFuZGxlID0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUs
Ci0JLmdlbV9wcmltZV9leHBvcnQgPSBkcm1fZ2VtX3ByaW1lX2V4cG9ydCwKLQkuZ2VtX3ByaW1l
X2ltcG9ydCA9IGRybV9nZW1fcHJpbWVfaW1wb3J0LAogCS5nZW1fcHJpbWVfZ2V0X3NnX3RhYmxl
ID0gdmlydGdwdV9nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfaW1wb3J0X3Nn
X3RhYmxlID0gdmlydGdwdV9nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVf
dm1hcCA9IHZpcnRncHVfZ2VtX3ByaW1lX3ZtYXAsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

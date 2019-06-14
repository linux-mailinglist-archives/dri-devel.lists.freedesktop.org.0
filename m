Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A4646AD3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314768989E;
	Fri, 14 Jun 2019 20:37:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F11B8961E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:20 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k21so5264905edq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lpz0tUAh7pnYBdsh9aEV2S99hSaP9NjAymiRCAEkaGc=;
 b=ABwEElxrFYNz4mwlN2AP8EhXxFgIOtJ20XbuQINWtt/hRAPd/GEIJ7TtcPw165l9WC
 HQNA7yUoVrG3fr2wWrA1efWySAbteqcrqfYHsQ+e40HM8yjwFbSXke+c1Ujdfz23W7Mc
 tpJkjJDZ7bMAbpiZEmjpD4yl2UxsRMoAmJk9bhey0rAblZBCik5YmwYSKA6GiLM/JQ3Z
 FSm8IMirOklgQLwgYB6On4cIQajgfu2fQOrY+4MXas1wNH++0aOXKm5urtq95eWFKQPc
 lkQPBJ6rfgzk7wOidimdf/3NUUvPbjQhZfAlUows6iwjVdays490V5r61a/QRAGvs8mm
 pkOA==
X-Gm-Message-State: APjAAAXfzWVUMlBFha+Scl9PaSLbOlxBEZxSd+rYv9Yy6lNLRYBorlQ2
 YU4KJdPwoOHHrk0VRuobtL9JNmE0sGI=
X-Google-Smtp-Source: APXvYqygPD3Nvt9X5jisyFzOWgBoKhMtRNr33s6SgLBe5Rg9V3i/pDM1vORfIcOz9PWR9IBKpcKzLg==
X-Received: by 2002:a17:906:1344:: with SMTP id
 x4mr24547521ejb.249.1560544637076; 
 Fri, 14 Jun 2019 13:37:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:16 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 48/59] drm/vgem: Ditch attach trickery in the fence ioctl
Date: Fri, 14 Jun 2019 22:36:04 +0200
Message-Id: <20190614203615.12639-49-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lpz0tUAh7pnYBdsh9aEV2S99hSaP9NjAymiRCAEkaGc=;
 b=aTLnDRHBT859hezbaa8mcsE2bM+cTje8iZvu75eQZrGOJMUeSwvek/Rpp88M+VSyry
 W/3P3kGULr02OSG9YIHBJWWhdmt4Y0MZQ0TqVcnHt42ltX51ItSN6oQzag5zOcha/+VL
 enCv7FYZnIuPXST3GVCllUaS2sCnfm6ovd3So=
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgbG9va3MgbGlrZSB0aGlzIHdhcyBkb25lIHB1cmVseSB0byBnZXQgYSBjb25zaXN0ZW50IHBs
YWNlIHRvIGxvb2sKdXAgdGhlIHJlc2VydmF0aW9uIG9iamVjdCBwb2ludGVyLiBXaXRoIHRoZSBk
cm1fcHJpbWUuYyBoZWxwZXIgY29kZQpub3cgYWxzbyBzZXR0aW5nIGdlbV9vYmplY3QtPnJlc3Yg
Zm9yIGltcG9ydGVkIG9iamVjdHMgd2UgY2FuIGp1c3QgdXNlCnRoYXQgcG9pbnRlciBkaXJlY3Rs
eSwgaW5zdGVhZCBvZiBmaXJzdCBlbnN1cmluZyBhIGRtYS1idWYgZXhpc3RzLgoKU2lnbmVkLW9m
Zi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3ZnZW0vdmdlbV9mZW5jZS5jIHwgMjIgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2ZlbmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dmdlbS92Z2VtX2ZlbmNlLmMKaW5kZXggNzJkNDNkNWVjNWFiLi4wODk5N2ZkZDNjY2IgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZmVuY2UuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdmdlbS92Z2VtX2ZlbmNlLmMKQEAgLTEwMCwyMiArMTAwLDYgQEAgc3RhdGljIHN0cnVj
dCBkbWFfZmVuY2UgKnZnZW1fZmVuY2VfY3JlYXRlKHN0cnVjdCB2Z2VtX2ZpbGUgKnZmaWxlLAog
CXJldHVybiAmZmVuY2UtPmJhc2U7CiB9CiAKLXN0YXRpYyBpbnQgYXR0YWNoX2RtYWJ1ZihzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LAotCQkJIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQotewot
CXN0cnVjdCBkbWFfYnVmICpkbWFidWY7Ci0KLQlpZiAob2JqLT5kbWFfYnVmKQotCQlyZXR1cm4g
MDsKLQotCWRtYWJ1ZiA9IGRldi0+ZHJpdmVyLT5nZW1fcHJpbWVfZXhwb3J0KG9iaiwgMCk7Ci0J
aWYgKElTX0VSUihkbWFidWYpKQotCQlyZXR1cm4gUFRSX0VSUihkbWFidWYpOwotCi0Jb2JqLT5k
bWFfYnVmID0gZG1hYnVmOwotCXJldHVybiAwOwotfQotCiAvKgogICogdmdlbV9mZW5jZV9hdHRh
Y2hfaW9jdGwgKERSTV9JT0NUTF9WR0VNX0ZFTkNFX0FUVEFDSCk6CiAgKgpAQCAtMTU3LDEwICsx
NDEsNiBAQCBpbnQgdmdlbV9mZW5jZV9hdHRhY2hfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwKIAlpZiAoIW9iaikKIAkJcmV0dXJuIC1FTk9FTlQ7CiAKLQlyZXQgPSBhdHRhY2hfZG1hYnVm
KGRldiwgb2JqKTsKLQlpZiAocmV0KQotCQlnb3RvIGVycjsKLQogCWZlbmNlID0gdmdlbV9mZW5j
ZV9jcmVhdGUodmZpbGUsIGFyZy0+ZmxhZ3MpOwogCWlmICghZmVuY2UpIHsKIAkJcmV0ID0gLUVO
T01FTTsKQEAgLTE2OCw3ICsxNDgsNyBAQCBpbnQgdmdlbV9mZW5jZV9hdHRhY2hfaW9jdGwoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwKIAl9CiAKIAkvKiBDaGVjayBmb3IgYSBjb25mbGljdGluZyBm
ZW5jZSAqLwotCXJlc3YgPSBvYmotPmRtYV9idWYtPnJlc3Y7CisJcmVzdiA9IG9iai0+cmVzdjsK
IAlpZiAoIXJlc2VydmF0aW9uX29iamVjdF90ZXN0X3NpZ25hbGVkX3JjdShyZXN2LAogCQkJCQkJ
ICBhcmctPmZsYWdzICYgVkdFTV9GRU5DRV9XUklURSkpIHsKIAkJcmV0ID0gLUVCVVNZOwotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

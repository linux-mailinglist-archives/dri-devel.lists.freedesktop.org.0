Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 393EA45D13
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2604D8985A;
	Fri, 14 Jun 2019 12:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771A789854;
 Fri, 14 Jun 2019 12:41:35 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k11so2408021wrl.1;
 Fri, 14 Jun 2019 05:41:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tm2PN34VJevI9ZW9IJurutGMCzu2ZjY7ozaA/XjkBM0=;
 b=MmZlQH0jjCLLQUk4AOVBrxR2ItLPRjD0ygHXv6pUkV9oXnkDje0XbooPNbJ7pkCZtN
 rmLd4QwUk/ohJ5VR8aSf1CtPPyaJFJ2RFOhwiEM64mCTJi8slrCGrZ6D/qglb4YG+F6k
 DxiwLeNGLJ1K0WmWM1vphCefijr/ddbE1uLFzeCTu5YjwgqIwZnrf+xBdGYGIhbuvXtu
 51QNb0Hzao3+NhF4O2ypiL1JdvBSZL2AEj9YjA4Qr10c+iERTKd9kMUa3VvyHOdaDaf0
 fJsRrZet8NA3WCzJbiB9887ca4ZDkCXBAahRDc+o8yPjGiwXRP9uXy2Hmk3PM0Pu9vVn
 hqgA==
X-Gm-Message-State: APjAAAXUaugC74pPIShdrY6D7qDj/LgVBSoStzU1Mn32vOXxRZcUZ6ln
 bjwhuOO3g+nzJUsht3ZoxUo=
X-Google-Smtp-Source: APXvYqzODwjMLrDLW/wAvxdO5UwbM+997kIqDgc3LoJww4panaWD52GNOzzJGcOdSinPiLSrE1KQEw==
X-Received: by 2002:adf:dc09:: with SMTP id t9mr65268942wri.69.1560516093689; 
 Fri, 14 Jun 2019 05:41:33 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e0eb:ed4e:b781:3e9f])
 by smtp.gmail.com with ESMTPSA id n1sm2648209wrx.39.2019.06.14.05.41.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 05:41:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, yuq825@gmail.com, eric@anholt.net,
 peterz@infradead.org, thellstrom@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org
Subject: [PATCH 6/6] drm/vc4: use new ww_mutex_(un)lock_for_each macros
Date: Fri, 14 Jun 2019 14:41:25 +0200
Message-Id: <20190614124125.124181-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190614124125.124181-1-christian.koenig@amd.com>
References: <20190614124125.124181-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tm2PN34VJevI9ZW9IJurutGMCzu2ZjY7ozaA/XjkBM0=;
 b=qK8JhE7mT9tUOlNnJxB6GUKXut/FqmO9LP3BIxIeFQe5NAz8q/LKgql3AyaXL8zVuy
 wPpR5OFybGGjpF5QukjAFSb6YcyNCtopkfBdwUIZskiqViZ2GlhOgDILEfRF1pJq3pvS
 zJVbcrEr1eXxzDMOegJNm6x62WsbBwmtq8RjQJntxwe/W6e1DLR4F+2KiufGjNdIkKiQ
 5Q3FFmU9uEwPYZ1dJ+Vqkm+THiq8HhEsFoW5RZDRDmt7SHX3AtYawPhdibpsCcQhXmRP
 9KE6euVBNa0tSKezoiM1rlvvJCTgd60eYNvT4diSQFQ1baDroKGhWiiuCrTnHFaR2FX7
 4IWw==
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

VXNlIHRoZSBwcm92aWRlZCBtYWNyb3MgaW5zdGVhZCBvZiBpbXBsZW1lbnRpbmcgZGVhZGxvY2sg
aGFuZGxpbmcgb24gb3VyIG93bi4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9nZW0u
YyB8IDU2ICsrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3ZjNC92YzRfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9nZW0uYwpp
bmRleCBkOTMxMWJlMzJhNGYuLjYyOGIzYThiY2Y2YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3ZjNC92YzRfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZ2VtLmMKQEAg
LTU4NCw1MyArNTg0LDE3IEBAIHZjNF9sb2NrX2JvX3Jlc2VydmF0aW9ucyhzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAogCQkJIHN0cnVjdCB2YzRfZXhlY19pbmZvICpleGVjLAogCQkJIHN0cnVjdCB3
d19hY3F1aXJlX2N0eCAqYWNxdWlyZV9jdHgpCiB7Ci0JaW50IGNvbnRlbmRlZF9sb2NrID0gLTE7
Ci0JaW50IGksIHJldDsKKwlzdHJ1Y3Qgd3dfbXV0ZXggKmNvbnRlbmRlZDsKIAlzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKmJvOworCWludCBpLCByZXQ7CiAKIAl3d19hY3F1aXJlX2luaXQoYWNxdWly
ZV9jdHgsICZyZXNlcnZhdGlvbl93d19jbGFzcyk7CiAKLXJldHJ5OgotCWlmIChjb250ZW5kZWRf
bG9jayAhPSAtMSkgewotCQlibyA9ICZleGVjLT5ib1tjb250ZW5kZWRfbG9ja10tPmJhc2U7Ci0J
CXJldCA9IHd3X211dGV4X2xvY2tfc2xvd19pbnRlcnJ1cHRpYmxlKCZiby0+cmVzdi0+bG9jaywK
LQkJCQkJCSAgICAgICBhY3F1aXJlX2N0eCk7Ci0JCWlmIChyZXQpIHsKLQkJCXd3X2FjcXVpcmVf
ZG9uZShhY3F1aXJlX2N0eCk7Ci0JCQlyZXR1cm4gcmV0OwotCQl9Ci0JfQotCi0JZm9yIChpID0g
MDsgaSA8IGV4ZWMtPmJvX2NvdW50OyBpKyspIHsKLQkJaWYgKGkgPT0gY29udGVuZGVkX2xvY2sp
Ci0JCQljb250aW51ZTsKLQotCQlibyA9ICZleGVjLT5ib1tpXS0+YmFzZTsKLQotCQlyZXQgPSB3
d19tdXRleF9sb2NrX2ludGVycnVwdGlibGUoJmJvLT5yZXN2LT5sb2NrLCBhY3F1aXJlX2N0eCk7
Ci0JCWlmIChyZXQpIHsKLQkJCWludCBqOwotCi0JCQlmb3IgKGogPSAwOyBqIDwgaTsgaisrKSB7
Ci0JCQkJYm8gPSAmZXhlYy0+Ym9bal0tPmJhc2U7Ci0JCQkJd3dfbXV0ZXhfdW5sb2NrKCZiby0+
cmVzdi0+bG9jayk7Ci0JCQl9Ci0KLQkJCWlmIChjb250ZW5kZWRfbG9jayAhPSAtMSAmJiBjb250
ZW5kZWRfbG9jayA+PSBpKSB7Ci0JCQkJYm8gPSAmZXhlYy0+Ym9bY29udGVuZGVkX2xvY2tdLT5i
YXNlOwotCi0JCQkJd3dfbXV0ZXhfdW5sb2NrKCZiby0+cmVzdi0+bG9jayk7Ci0JCQl9Ci0KLQkJ
CWlmIChyZXQgPT0gLUVERUFETEspIHsKLQkJCQljb250ZW5kZWRfbG9jayA9IGk7Ci0JCQkJZ290
byByZXRyeTsKLQkJCX0KLQotCQkJd3dfYWNxdWlyZV9kb25lKGFjcXVpcmVfY3R4KTsKLQkJCXJl
dHVybiByZXQ7Ci0JCX0KLQl9CisJd3dfbXV0ZXhfbG9ja19mb3JfZWFjaChmb3IgKGkgPSAwOyBp
IDwgZXhlYy0+Ym9fY291bnQ7IGkrKyksCisJCQkgICAgICAgJmV4ZWMtPmJvW2ldLT5iYXNlLnJl
c3YtPmxvY2ssIGNvbnRlbmRlZCwgcmV0LAorCQkJICAgICAgIHRydWUsIGFjcXVpcmVfY3R4KQor
CQlpZiAocmV0KQorCQkJZ290byBlcnJvcjsKIAogCXd3X2FjcXVpcmVfZG9uZShhY3F1aXJlX2N0
eCk7CiAKQEAgLTY0OCw2ICs2MTIsMTIgQEAgdmM0X2xvY2tfYm9fcmVzZXJ2YXRpb25zKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsCiAJfQogCiAJcmV0dXJuIDA7CisKK2Vycm9yOgorCXd3X211dGV4
X3VubG9ja19mb3JfZWFjaChmb3IgKGkgPSAwOyBpIDwgZXhlYy0+Ym9fY291bnQ7IGkrKyksCisJ
CQkJICZleGVjLT5ib1tpXS0+YmFzZS5yZXN2LT5sb2NrLCBjb250ZW5kZWQpOworCXd3X2FjcXVp
cmVfZG9uZShhY3F1aXJlX2N0eCk7CisJcmV0dXJuIHJldDsKIH0KIAogLyogUXVldWVzIGEgc3Ry
dWN0IHZjNF9leGVjX2luZm8gZm9yIGV4ZWN1dGlvbi4gIElmIG5vIGpvYiBpcwotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

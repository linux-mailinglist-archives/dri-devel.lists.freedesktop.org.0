Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689F71A7447
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D606E471;
	Tue, 14 Apr 2020 07:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A73889CF8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 17:33:47 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id z6so10799962wml.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 10:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/+Q3sQHWHz/4UUWb+fTY+Lp+S0KWob6RkIjERN3PrL0=;
 b=N4jNigDmVKSbuGJIYErgx2wKkgof51DDTFYeJrbPeiBoXHbVSgm1rvyddooJwQ9/F7
 dBKI4oGUrbpftuKwatusTGfwjFk9ZMDVM8mmcyvVGZZ+oknZ6o5isIBIXgMH/FwLyzIw
 UiMu0w0GxAf3NaFN6o4WKc+XH6Hwn3pYIc8SHDrinUGFbMtAOeX1FcynrjpjzZcLZxbV
 fSEl+EmvEwWkGHwBv13UwsrlXU53gllxB1D4d1cQpHLbppZOsu5MIVVdvUaQNXeRmthF
 4kl7jdSgOss7MRRe5PJMbqi6UBW2A04Dm5wjyUambqsaaar2P3usG2vYH4Z/C6ktLgxo
 nWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/+Q3sQHWHz/4UUWb+fTY+Lp+S0KWob6RkIjERN3PrL0=;
 b=HT0kKwjf7WzI5OqcslFMwU4+b/lxOU1U/lREByKGmsPw8l1xkDgWHDE832QNJZKfkC
 p0ysBQ5h0+D8Sw7cf8NH2Lusig0+K+gV0D0hvjQlzYApb/6LRa7V+UCTjlOiwMh9hBey
 DbHU+XjFfw6L85dTuGu+aubKKPX9RyPvij+q/GBizUqmLwvaDncHCVuPxedW4VocCaWy
 NggYD86DaQYKnVzsKdIlZjUSmfxguoz8bEsgz70lpZ/X48FRv2wJeGZXrsDp5o2tZeQC
 Co91x8GXaJFLtBeIvdUYP6PqK1xS30Go1Plu/xRiCCpHgim7ktvJTTySeVwuMkZaOWi3
 z0wQ==
X-Gm-Message-State: AGi0PublF9SH8CxovzkQcU/96Ze06DC6BrUp71nXXNKEqBqG6qu498NB
 fowyK8uwcEW1k4t4Etbws2c=
X-Google-Smtp-Source: APiQypIzdPLyjmPzkX2e19Qkf1kNYWx+TJed6CleG8uZX09mZoberRJIHXFRzVApcauMNo3V2XOI0g==
X-Received: by 2002:a1c:6:: with SMTP id 6mr11592040wma.12.1586799225707;
 Mon, 13 Apr 2020 10:33:45 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::42f0:c285])
 by smtp.gmail.com with ESMTPSA id v7sm17025219wmg.3.2020.04.13.10.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 10:33:44 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 1/2] drm/panfrost: missing remove opp table in case of
 failure
Date: Mon, 13 Apr 2020 19:33:37 +0200
Message-Id: <20200413173338.8294-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:06:18 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gY2FzZSBvZiBmYWlsdXJlIHdlIG5lZWQgdG8gcmVtb3ZlIE9QUCB0YWJsZS4KClVzZSBMaW51
eCBjbGFzc2ljIGVycm9yIGhhbmRsaW5nIHdpdGggZ290byB1c2FnZS4KClJldmlld2VkLWJ5OiBT
dGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgfCAxNiArKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIGIvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwppbmRleCA0MTM5ODcwMzhmYmYuLjYyNTQxZjRl
ZGQ4MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZy
ZXEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCkBA
IC05MCw4ICs5MCwxMSBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9pbml0KHN0cnVjdCBwYW5mcm9z
dF9kZXZpY2UgKnBmZGV2KQogCWN1cl9mcmVxID0gY2xrX2dldF9yYXRlKHBmZGV2LT5jbG9jayk7
CiAKIAlvcHAgPSBkZXZmcmVxX3JlY29tbWVuZGVkX29wcChkZXYsICZjdXJfZnJlcSwgMCk7Ci0J
aWYgKElTX0VSUihvcHApKQotCQlyZXR1cm4gUFRSX0VSUihvcHApOworCWlmIChJU19FUlIob3Bw
KSkgeworCQlEUk1fREVWX0VSUk9SKGRldiwgIkZhaWxlZCB0byBzZXQgcmVjb21tZW5kZWQgT1BQ
XG4iKTsKKwkJcmV0ID0gUFRSX0VSUihvcHApOworCQlnb3RvIGVycl9vcHA7CisJfQogCiAJcGFu
ZnJvc3RfZGV2ZnJlcV9wcm9maWxlLmluaXRpYWxfZnJlcSA9IGN1cl9mcmVxOwogCWRldl9wbV9v
cHBfcHV0KG9wcCk7CkBAIC0xMDAsOCArMTAzLDggQEAgaW50IHBhbmZyb3N0X2RldmZyZXFfaW5p
dChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIAkJCQkJICBERVZGUkVRX0dPVl9TSU1Q
TEVfT05ERU1BTkQsIE5VTEwpOwogCWlmIChJU19FUlIoZGV2ZnJlcSkpIHsKIAkJRFJNX0RFVl9F
UlJPUihkZXYsICJDb3VsZG4ndCBpbml0aWFsaXplIEdQVSBkZXZmcmVxXG4iKTsKLQkJZGV2X3Bt
X29wcF9vZl9yZW1vdmVfdGFibGUoZGV2KTsKLQkJcmV0dXJuIFBUUl9FUlIoZGV2ZnJlcSk7CisJ
CXJldCA9IFBUUl9FUlIoZGV2ZnJlcSk7CisJCWdvdG8gZXJyX29wcDsKIAl9CiAJcGZkZXYtPmRl
dmZyZXEuZGV2ZnJlcSA9IGRldmZyZXE7CiAKQEAgLTExMiw2ICsxMTUsMTEgQEAgaW50IHBhbmZy
b3N0X2RldmZyZXFfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIAkJcGZkZXYt
PmRldmZyZXEuY29vbGluZyA9IGNvb2xpbmc7CiAKIAlyZXR1cm4gMDsKKworZXJyX29wcDoKKwlk
ZXZfcG1fb3BwX29mX3JlbW92ZV90YWJsZShkZXYpOworCisJcmV0dXJuIHJldDsKIH0KIAogdm9p
ZCBwYW5mcm9zdF9kZXZmcmVxX2Zpbmkoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCi0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E5F1CD261
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E02A6E23B;
	Mon, 11 May 2020 07:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421D289FDB
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 16:55:55 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j5so7964486wrq.2
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 09:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UGtRSx0M1H2sciVoOm/cuTNsMxGSi9E0CIv7gSphJdg=;
 b=moB/WcApqXpplDXdnr9T7REGok5c63lnlOe5MLGjckrRBKnIWwEiMeEqNq/Ku2Ixgl
 a5aUidJAP1BSgquxga6sidNtyZ00U5NR7JLvdS7UoPuhDqQliDguzuxc3BZGJmuVExqE
 JgSYBt7oDjmW88qF4l+dKQOaswcczrNLYT37B9AU+xFEftA4Rhr1FmCmBPOgfj9fN9wZ
 WEvROQktO7JyOqpEtW83RPd54M3mn1roeo8boJgOrG0Bik7OTKB0QsWU0Nn9s57rdlqw
 KeH2TaiHbx1LmzzDyWoyeEy7Bkj66NcNiwwjRg9XUXY3lufrrYj0LV7V3QqXB5ZSOBCL
 XQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UGtRSx0M1H2sciVoOm/cuTNsMxGSi9E0CIv7gSphJdg=;
 b=EyzARJ+2bgMIia+QMK+HMWexd1uKiqCb3v9/n56gO0wVbtXyguEjxdtS2F8VZoBFGa
 jpb3032EyhTYkFT9Z0qQFDvje1SiBPkFSQVziUYNTJiw0rnqYuHPtkJAd5rTCRVO6553
 bW6zlNtw7ogpSWjvp/Mkes01YZfylYoY5sPyOetH6Aroky4CMEn4DfKNtABwBpElFaB4
 fpYXzSLlBIXlLaTaWcDbK+7gnc4bI6JUf0P2SdRF1Rbpmg81PKYxVZjTQeH2X2+6xdiF
 j8htezqRxsgSWaEKAEn4nl5Pv0EcqeN8gWM0VDUSoklQiObQIrMmpwfhhV7hPdygNNu2
 a5Eg==
X-Gm-Message-State: AGi0PuZdO+N0wmYLKua6d3r/Rd7ma/eNlZNe+nKjrNbPOID8AkUrd/DY
 3GsCP4sCVolRsIH1o9330jY=
X-Google-Smtp-Source: APiQypJb2TSWzqq6njqmcEA/TOqYHZSFpZoZ7VDbi6n/FR3lppFw2NBiQ/cKffersHlcaOfO6TPUTg==
X-Received: by 2002:adf:a118:: with SMTP id o24mr13650480wro.330.1589129753836; 
 Sun, 10 May 2020 09:55:53 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:1cc8:b1f1:a2b8:a1ee])
 by smtp.gmail.com with ESMTPSA id
 g15sm13637670wrp.96.2020.05.10.09.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 09:55:53 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 11/15] drm/panfrost: set devfreq clock name
Date: Sun, 10 May 2020 18:55:34 +0200
Message-Id: <20200510165538.19720-12-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510165538.19720-1-peron.clem@gmail.com>
References: <20200510165538.19720-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:27 +0000
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

U29tZSBTb0NzIGhhdmUgIHNldmVyYWwgY2xvY2tzIGRlZmluZWQgYW5kIHRoZSBPUFAgY29yZQpu
ZWVkcyB0byBrbm93IHRoZSBleGFjdCBuYW1lIG9mIHRoZSBjbGsgdG8gdXNlLgoKU2V0IHRoZSBj
bG9jayBuYW1lIHRvICJjb3JlIi4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVy
b24uY2xlbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2RldmZyZXEuYyB8IDEzICsrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9kZXZmcmVxLmggfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJl
cS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwppbmRleCA5
ZmZlYTBkNGEwODcuLjZiZjM1NDFiNGQ1MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZGV2ZnJlcS5jCkBAIC0xMDMsNiArMTAzLDE0IEBAIGludCBwYW5mcm9zdF9kZXZm
cmVxX2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAKIAlzcGluX2xvY2tfaW5p
dCgmcGZkZXZmcmVxLT5sb2NrKTsKIAorCW9wcF90YWJsZSA9IGRldl9wbV9vcHBfc2V0X2Nsa25h
bWUoZGV2LCAiY29yZSIpOworCWlmIChJU19FUlIob3BwX3RhYmxlKSkgeworCQlyZXQgPSBQVFJf
RVJSKG9wcF90YWJsZSk7CisJCWdvdG8gZXJyX2Zpbmk7CisJfQorCisJcGZkZXZmcmVxLT5jbGtu
YW1lX29wcF90YWJsZSA9IG9wcF90YWJsZTsKKwogCW9wcF90YWJsZSA9IGRldl9wbV9vcHBfc2V0
X3JlZ3VsYXRvcnMoZGV2LCBwZmRldi0+Y29tcC0+c3VwcGx5X25hbWVzLAogCQkJCQkgICAgICBw
ZmRldi0+Y29tcC0+bnVtX3N1cHBsaWVzKTsKIAlpZiAoSVNfRVJSKG9wcF90YWJsZSkpIHsKQEAg
LTE3Niw2ICsxODQsMTEgQEAgdm9pZCBwYW5mcm9zdF9kZXZmcmVxX2Zpbmkoc3RydWN0IHBhbmZy
b3N0X2RldmljZSAqcGZkZXYpCiAJCWRldl9wbV9vcHBfcHV0X3JlZ3VsYXRvcnMocGZkZXZmcmVx
LT5yZWd1bGF0b3JzX29wcF90YWJsZSk7CiAJCXBmZGV2ZnJlcS0+cmVndWxhdG9yc19vcHBfdGFi
bGUgPSBOVUxMOwogCX0KKworCWlmIChwZmRldmZyZXEtPmNsa25hbWVfb3BwX3RhYmxlKSB7CisJ
CWRldl9wbV9vcHBfcHV0X2Nsa25hbWUocGZkZXZmcmVxLT5jbGtuYW1lX29wcF90YWJsZSk7CisJ
CXBmZGV2ZnJlcS0+Y2xrbmFtZV9vcHBfdGFibGUgPSBOVUxMOworCX0KIH0KIAogdm9pZCBwYW5m
cm9zdF9kZXZmcmVxX3Jlc3VtZShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmggYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5oCmluZGV4IDM0N2NkZTQ3ODZj
Zi4uMWYyNDc1ZTFkMDM0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZGV2ZnJlcS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
ZXZmcmVxLmgKQEAgLTE2LDYgKzE2LDcgQEAgc3RydWN0IHBhbmZyb3N0X2RldmljZTsKIHN0cnVj
dCBwYW5mcm9zdF9kZXZmcmVxIHsKIAlzdHJ1Y3QgZGV2ZnJlcSAqZGV2ZnJlcTsKIAlzdHJ1Y3Qg
b3BwX3RhYmxlICpyZWd1bGF0b3JzX29wcF90YWJsZTsKKwlzdHJ1Y3Qgb3BwX3RhYmxlICpjbGtu
YW1lX29wcF90YWJsZTsKIAlzdHJ1Y3QgdGhlcm1hbF9jb29saW5nX2RldmljZSAqY29vbGluZzsK
IAlib29sIG9wcF9vZl90YWJsZV9hZGRlZDsKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816AC21B0A6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3BE6EBA4;
	Fri, 10 Jul 2020 07:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEA66EA70
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 14:03:40 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id j18so1941844wmi.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 07:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CM7F/yVSMdD0MwnLwyut2LHrVbWT5ZWz854NoFHIMAw=;
 b=BxHDPHyDMwCkfTRC0Q1ZkF+4Ma/zBrkuVIa4nfvYIsH2XocNv4/T2cCjIDPMZxVeSp
 WzwSmOUfaPaEhKZ+AF5jAS/HRwcF9+4cBfNgiTh99EimNQ/KHh6vAllxXE7iYnbaTVKb
 nHpJuSezWIWU3u56NX2xFCKdU1Q1LQvGq3Wpr+wqvGIsooyBLiJVXGOqG6iUXAyIFZDy
 g/BKZCBw26gjWPqFdq0WFM82Qz4L3xuFDFlxNaC9RkpDQXTTb7iiYnS0LGrB2fA6R+4d
 HfheXePR0dF1+NT7L++XoVTvdzEPlIpEP3AEvzdQ1os6voSfK5HB+FtQlGf4LNfmKAhr
 OVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CM7F/yVSMdD0MwnLwyut2LHrVbWT5ZWz854NoFHIMAw=;
 b=KZgbUiUVFmGoSU56rDfgqF9y7h9rMMDRhnXlgVazVoxp8iwUnAeshIjaaW7OeQtjpR
 CNmq6tqfllfu+1vbcmyv4FSb6gkj8/4nEb7MvTlS0VfK+TlEwjcC115JSYtesd7rGelI
 GK+d0f7IYLTYRppi/9iPhETHSKlwirrqmZdt8lAYr6wuPoq9efToutNnMtfiBxJB7HYK
 7r9VSeKuFraKtqbgZVC3NPmmlgzCsAa7h9v0IlIs9qY6KRZPMmvkUr3K0y1mA+Al0lmF
 Hf8UBgRLJwO0OkeB/aAkxuq/T0Bw5aUGUXIAPVCXy80xqlNKvyKDK+NfplMjSEgqmSTz
 CTNg==
X-Gm-Message-State: AOAM530Y8wwhANc7eIkx+KyFkqTQqdmELSQNnO73VF7Y6HwnFhr1XfQ4
 jvIlCcWpFRrhcbaQZGRW/Zk=
X-Google-Smtp-Source: ABdhPJzisUnpfGKLyaQeAsd/vql6nryFcY7P93DXPG4QqxdWDcIEuaAMiLxSeRT61HwRyMIIkgBebg==
X-Received: by 2002:a1c:ba08:: with SMTP id k8mr199642wmf.28.1594303418680;
 Thu, 09 Jul 2020 07:03:38 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s8sm5545256wru.38.2020.07.09.07.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 07:03:38 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 10/14] drm/panfrost: add regulators to devfreq
Date: Thu,  9 Jul 2020 16:03:18 +0200
Message-Id: <20200709140322.131320-11-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709140322.131320-1-peron.clem@gmail.com>
References: <20200709140322.131320-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 10 Jul 2020 07:52:58 +0000
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

U29tZSBPUFAgdGFibGVzIHNwZWNpZnkgdm9sdGFnZSBmb3IgZWFjaCBmcmVxdWVuY3kuIERldmZy
ZXEgY2FuCmhhbmRsZSB0aGVzZSByZWd1bGF0b3JzIGJ1dCB0aGV5IHNob3VsZCBiZSBnZXQgb25s
eSAxIHRpbWUgdG8gYXZvaWQKaXNzdWUgYW5kIGtub3cgd2hvIGlzIGluIGNoYXJnZS4KCklmIE9Q
UCB0YWJsZSBpcyBwcm9iZSBkb24ndCBpbml0IHJlZ3VsYXRvci4KClJldmlld2VkLWJ5OiBTdGV2
ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgpSZXZpZXdlZC1ieTogQWx5c3NhIFJvc2Vu
endlaWcgPGFseXNzYS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+ClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyB8IDI5ICsrKysrKysrKysrKysrKysrKy0tLQog
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuaCB8ICAyICsrCiBkcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgIHwgMTEgKysrKystLS0KIDMg
ZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwppbmRleCBkOTAwN2Y0NGI3NzIu
LjhhYjAyNWQwMDM1ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2RldmZyZXEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2
ZnJlcS5jCkBAIC05MywxNCArOTMsMzAgQEAgaW50IHBhbmZyb3N0X2RldmZyZXFfaW5pdChzdHJ1
Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIAl1bnNpZ25lZCBsb25nIGN1cl9mcmVxOwogCXN0
cnVjdCBkZXZpY2UgKmRldiA9ICZwZmRldi0+cGRldi0+ZGV2OwogCXN0cnVjdCBkZXZmcmVxICpk
ZXZmcmVxOworCXN0cnVjdCBvcHBfdGFibGUgKm9wcF90YWJsZTsKIAlzdHJ1Y3QgdGhlcm1hbF9j
b29saW5nX2RldmljZSAqY29vbGluZzsKIAlzdHJ1Y3QgcGFuZnJvc3RfZGV2ZnJlcSAqcGZkZXZm
cmVxID0gJnBmZGV2LT5wZmRldmZyZXE7CiAKKwlvcHBfdGFibGUgPSBkZXZfcG1fb3BwX3NldF9y
ZWd1bGF0b3JzKGRldiwgcGZkZXYtPmNvbXAtPnN1cHBseV9uYW1lcywKKwkJCQkJICAgICAgcGZk
ZXYtPmNvbXAtPm51bV9zdXBwbGllcyk7CisJaWYgKElTX0VSUihvcHBfdGFibGUpKSB7CisJCXJl
dCA9IFBUUl9FUlIob3BwX3RhYmxlKTsKKwkJLyogQ29udGludWUgaWYgdGhlIG9wdGlvbmFsIHJl
Z3VsYXRvciBpcyBtaXNzaW5nICovCisJCWlmIChyZXQgIT0gLUVOT0RFVikgeworCQkJRFJNX0RF
Vl9FUlJPUihkZXYsICJDb3VsZG4ndCBzZXQgT1BQIHJlZ3VsYXRvcnNcbiIpOworCQkJZ290byBl
cnJfZmluaTsKKwkJfQorCX0gZWxzZSB7CisJCXBmZGV2ZnJlcS0+cmVndWxhdG9yc19vcHBfdGFi
bGUgPSBvcHBfdGFibGU7CisJfQorCiAJcmV0ID0gZGV2X3BtX29wcF9vZl9hZGRfdGFibGUoZGV2
KTsKLQlpZiAocmV0ID09IC1FTk9ERVYpIC8qIE9wdGlvbmFsLCBjb250aW51ZSB3aXRob3V0IGRl
dmZyZXEgKi8KLQkJcmV0dXJuIDA7Ci0JZWxzZSBpZiAocmV0KQotCQlyZXR1cm4gcmV0OworCWlm
IChyZXQpIHsKKwkJLyogT3B0aW9uYWwsIGNvbnRpbnVlIHdpdGhvdXQgZGV2ZnJlcSAqLworCQlp
ZiAocmV0ID09IC1FTk9ERVYpCisJCQlyZXQgPSAwOworCQlnb3RvIGVycl9maW5pOworCX0KIAlw
ZmRldmZyZXEtPm9wcF9vZl90YWJsZV9hZGRlZCA9IHRydWU7CiAKIAlzcGluX2xvY2tfaW5pdCgm
cGZkZXZmcmVxLT5sb2NrKTsKQEAgLTE1Myw2ICsxNjksMTEgQEAgdm9pZCBwYW5mcm9zdF9kZXZm
cmVxX2Zpbmkoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAJCWRldl9wbV9vcHBfb2Zf
cmVtb3ZlX3RhYmxlKCZwZmRldi0+cGRldi0+ZGV2KTsKIAkJcGZkZXZmcmVxLT5vcHBfb2ZfdGFi
bGVfYWRkZWQgPSBmYWxzZTsKIAl9CisKKwlpZiAocGZkZXZmcmVxLT5yZWd1bGF0b3JzX29wcF90
YWJsZSkgeworCQlkZXZfcG1fb3BwX3B1dF9yZWd1bGF0b3JzKHBmZGV2ZnJlcS0+cmVndWxhdG9y
c19vcHBfdGFibGUpOworCQlwZmRldmZyZXEtPnJlZ3VsYXRvcnNfb3BwX3RhYmxlID0gTlVMTDsK
Kwl9CiB9CiAKIHZvaWQgcGFuZnJvc3RfZGV2ZnJlcV9yZXN1bWUoc3RydWN0IHBhbmZyb3N0X2Rl
dmljZSAqcGZkZXYpCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZGV2ZnJlcS5oIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEu
aAppbmRleCAyMTAyNjk5NDQ2ODcuLmRiNmVhNDhlMjFmOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5oCkBAIC04LDEyICs4LDE0IEBACiAjaW5jbHVkZSA8
bGludXgva3RpbWUuaD4KIAogc3RydWN0IGRldmZyZXE7CitzdHJ1Y3Qgb3BwX3RhYmxlOwogc3Ry
dWN0IHRoZXJtYWxfY29vbGluZ19kZXZpY2U7CiAKIHN0cnVjdCBwYW5mcm9zdF9kZXZpY2U7CiAK
IHN0cnVjdCBwYW5mcm9zdF9kZXZmcmVxIHsKIAlzdHJ1Y3QgZGV2ZnJlcSAqZGV2ZnJlcTsKKwlz
dHJ1Y3Qgb3BwX3RhYmxlICpyZWd1bGF0b3JzX29wcF90YWJsZTsKIAlzdHJ1Y3QgdGhlcm1hbF9j
b29saW5nX2RldmljZSAqY29vbGluZzsKIAlib29sIG9wcF9vZl90YWJsZV9hZGRlZDsKIApkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCmluZGV4IDBiMGZiNDVhZWU4
Mi4uMWI1ZmM5MjIxODI4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rl
dmljZS5jCkBAIC0yMjMsMTAgKzIyMywxMyBAQCBpbnQgcGFuZnJvc3RfZGV2aWNlX2luaXQoc3Ry
dWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAJCWdvdG8gb3V0X2NsazsKIAl9CiAKLQllcnIg
PSBwYW5mcm9zdF9yZWd1bGF0b3JfaW5pdChwZmRldik7Ci0JaWYgKGVycikgewotCQlkZXZfZXJy
KHBmZGV2LT5kZXYsICJyZWd1bGF0b3IgaW5pdCBmYWlsZWQgJWRcbiIsIGVycik7Ci0JCWdvdG8g
b3V0X2RldmZyZXE7CisJLyogT1BQIHdpbGwgaGFuZGxlIHJlZ3VsYXRvcnMgKi8KKwlpZiAoIXBm
ZGV2LT5wZmRldmZyZXEub3BwX29mX3RhYmxlX2FkZGVkKSB7CisJCWVyciA9IHBhbmZyb3N0X3Jl
Z3VsYXRvcl9pbml0KHBmZGV2KTsKKwkJaWYgKGVycikgeworCQkJZGV2X2VycihwZmRldi0+ZGV2
LCAicmVndWxhdG9yIGluaXQgZmFpbGVkICVkXG4iLCBlcnIpOworCQkJZ290byBvdXRfZGV2ZnJl
cTsKKwkJfQogCX0KIAogCWVyciA9IHBhbmZyb3N0X3Jlc2V0X2luaXQocGZkZXYpOwotLSAKMi4y
NS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

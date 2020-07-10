Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A85A21E8EB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9136E8FB;
	Tue, 14 Jul 2020 07:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E974F6EBC4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 09:26:05 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id f18so5232119wrs.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 02:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VsZBAmiYMMWM033wa5CbybhLIp9AyDubE3t8XcgJYF0=;
 b=PoidVBDBasXLQFWmsFE2egWQs2iToQTBrSpdsh+xyaux//B6fFUZS+ZCWomZygNU5H
 MEFEOOcpeXNPDjh4RXIieiu4M+aFrJfuoYDFx+issHJu0WBF2vOCLV4LxHeu903v1yrJ
 uu8w1ltXMFo1NTAihLEP+BWDgUG7zpS67Sxm8cbgUTI5pLGIDD2eeHFwUNr/ytc2bH7t
 Xgwlw6VLe9+Ya2tRlcP0YcJzyAqeTK7msj6c6yoaw4CoHJ3nNUCb++FwPUGufRRZIviJ
 bOP7hEcAn2jItswZVDa/5/EVof+vBP9VDKpgb7PChu5yA9yLoCpKL/e7yBgxFy6uZskZ
 4XrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VsZBAmiYMMWM033wa5CbybhLIp9AyDubE3t8XcgJYF0=;
 b=fOjI2uqtRNSjVMD1OsyK0BjDROSNvAUGot9MBq80oQoKALLy0uavJbHuRtw7uv7OZU
 mJ6nqL8g90XlYaAiL4pkbRex0+BXolKG/PcgpH5yGD36nAwbpDD27IsIVEV3mhXB+1q6
 qL99Tldcgo2FAxeIaRAA1YYOVl31O8CGXRWdnOuAQ6H0XD+OsjLAS4PqdWkaq89pg4xX
 tTwIJp1PTezbDi3cbs6Jah7wCtACaZxAy9OTk4jhOc7FsLxsi2EfkXn7L9qiIPz63/mT
 4kE2C23Tc+qxw11V0es4FYzDNm3jy8WVlWxF64hcMJIV5JfP7vMtzkD/CugniIAmHlCw
 SYEQ==
X-Gm-Message-State: AOAM530yaavMC8YvTQmIcfz+zfRaH3jIZl8YWjymGT1t+m6eYmBYEgPM
 BH+05QkLLbBmc+ufWarFA98=
X-Google-Smtp-Source: ABdhPJwYR8ciGq8i3bG6prAZuywKeb17+z94MbiMvQpAryACtdTYkS/ZvIaeuU7+xPuXmoOMs0dQ2g==
X-Received: by 2002:a5d:5084:: with SMTP id a4mr69350973wrt.191.1594373164479; 
 Fri, 10 Jul 2020 02:26:04 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id h23sm8179559wmb.3.2020.07.10.02.26.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 02:26:03 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v4 10/14] drm/panfrost: add regulators to devfreq
Date: Fri, 10 Jul 2020 11:25:44 +0200
Message-Id: <20200710092548.316054-11-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200710092548.316054-1-peron.clem@gmail.com>
References: <20200710092548.316054-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:08 +0000
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
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgIHwgIDkgKysrKy0tLQogMyBm
aWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5jCmluZGV4IGQ5MDA3ZjQ0Yjc3Mi4u
OGFiMDI1ZDAwMzVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZGV2ZnJlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZm
cmVxLmMKQEAgLTkzLDE0ICs5MywzMCBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9pbml0KHN0cnVj
dCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogCXVuc2lnbmVkIGxvbmcgY3VyX2ZyZXE7CiAJc3Ry
dWN0IGRldmljZSAqZGV2ID0gJnBmZGV2LT5wZGV2LT5kZXY7CiAJc3RydWN0IGRldmZyZXEgKmRl
dmZyZXE7CisJc3RydWN0IG9wcF90YWJsZSAqb3BwX3RhYmxlOwogCXN0cnVjdCB0aGVybWFsX2Nv
b2xpbmdfZGV2aWNlICpjb29saW5nOwogCXN0cnVjdCBwYW5mcm9zdF9kZXZmcmVxICpwZmRldmZy
ZXEgPSAmcGZkZXYtPnBmZGV2ZnJlcTsKIAorCW9wcF90YWJsZSA9IGRldl9wbV9vcHBfc2V0X3Jl
Z3VsYXRvcnMoZGV2LCBwZmRldi0+Y29tcC0+c3VwcGx5X25hbWVzLAorCQkJCQkgICAgICBwZmRl
di0+Y29tcC0+bnVtX3N1cHBsaWVzKTsKKwlpZiAoSVNfRVJSKG9wcF90YWJsZSkpIHsKKwkJcmV0
ID0gUFRSX0VSUihvcHBfdGFibGUpOworCQkvKiBDb250aW51ZSBpZiB0aGUgb3B0aW9uYWwgcmVn
dWxhdG9yIGlzIG1pc3NpbmcgKi8KKwkJaWYgKHJldCAhPSAtRU5PREVWKSB7CisJCQlEUk1fREVW
X0VSUk9SKGRldiwgIkNvdWxkbid0IHNldCBPUFAgcmVndWxhdG9yc1xuIik7CisJCQlnb3RvIGVy
cl9maW5pOworCQl9CisJfSBlbHNlIHsKKwkJcGZkZXZmcmVxLT5yZWd1bGF0b3JzX29wcF90YWJs
ZSA9IG9wcF90YWJsZTsKKwl9CisKIAlyZXQgPSBkZXZfcG1fb3BwX29mX2FkZF90YWJsZShkZXYp
OwotCWlmIChyZXQgPT0gLUVOT0RFVikgLyogT3B0aW9uYWwsIGNvbnRpbnVlIHdpdGhvdXQgZGV2
ZnJlcSAqLwotCQlyZXR1cm4gMDsKLQllbHNlIGlmIChyZXQpCi0JCXJldHVybiByZXQ7CisJaWYg
KHJldCkgeworCQkvKiBPcHRpb25hbCwgY29udGludWUgd2l0aG91dCBkZXZmcmVxICovCisJCWlm
IChyZXQgPT0gLUVOT0RFVikKKwkJCXJldCA9IDA7CisJCWdvdG8gZXJyX2Zpbmk7CisJfQogCXBm
ZGV2ZnJlcS0+b3BwX29mX3RhYmxlX2FkZGVkID0gdHJ1ZTsKIAogCXNwaW5fbG9ja19pbml0KCZw
ZmRldmZyZXEtPmxvY2spOwpAQCAtMTUzLDYgKzE2OSwxMSBAQCB2b2lkIHBhbmZyb3N0X2RldmZy
ZXFfZmluaShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIAkJZGV2X3BtX29wcF9vZl9y
ZW1vdmVfdGFibGUoJnBmZGV2LT5wZGV2LT5kZXYpOwogCQlwZmRldmZyZXEtPm9wcF9vZl90YWJs
ZV9hZGRlZCA9IGZhbHNlOwogCX0KKworCWlmIChwZmRldmZyZXEtPnJlZ3VsYXRvcnNfb3BwX3Rh
YmxlKSB7CisJCWRldl9wbV9vcHBfcHV0X3JlZ3VsYXRvcnMocGZkZXZmcmVxLT5yZWd1bGF0b3Jz
X29wcF90YWJsZSk7CisJCXBmZGV2ZnJlcS0+cmVndWxhdG9yc19vcHBfdGFibGUgPSBOVUxMOwor
CX0KIH0KIAogdm9pZCBwYW5mcm9zdF9kZXZmcmVxX3Jlc3VtZShzdHJ1Y3QgcGFuZnJvc3RfZGV2
aWNlICpwZmRldikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9kZXZmcmVxLmggYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5o
CmluZGV4IDIxMDI2OTk0NDY4Ny4uZGI2ZWE0OGUyMWY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2ZnJlcS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9w
YW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmgKQEAgLTgsMTIgKzgsMTQgQEAKICNpbmNsdWRlIDxs
aW51eC9rdGltZS5oPgogCiBzdHJ1Y3QgZGV2ZnJlcTsKK3N0cnVjdCBvcHBfdGFibGU7CiBzdHJ1
Y3QgdGhlcm1hbF9jb29saW5nX2RldmljZTsKIAogc3RydWN0IHBhbmZyb3N0X2RldmljZTsKIAog
c3RydWN0IHBhbmZyb3N0X2RldmZyZXEgewogCXN0cnVjdCBkZXZmcmVxICpkZXZmcmVxOworCXN0
cnVjdCBvcHBfdGFibGUgKnJlZ3VsYXRvcnNfb3BwX3RhYmxlOwogCXN0cnVjdCB0aGVybWFsX2Nv
b2xpbmdfZGV2aWNlICpjb29saW5nOwogCWJvb2wgb3BwX29mX3RhYmxlX2FkZGVkOwogCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMKaW5kZXggZjE0NzRiOTYxZGVm
Li5lNjg5NjczMzgzOGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2
aWNlLmMKQEAgLTIyNSw5ICsyMjUsMTIgQEAgaW50IHBhbmZyb3N0X2RldmljZV9pbml0KHN0cnVj
dCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogCQlnb3RvIG91dF9jbGs7CiAJfQogCi0JZXJyID0g
cGFuZnJvc3RfcmVndWxhdG9yX2luaXQocGZkZXYpOwotCWlmIChlcnIpCi0JCWdvdG8gb3V0X2Rl
dmZyZXE7CisJLyogT1BQIHdpbGwgaGFuZGxlIHJlZ3VsYXRvcnMgKi8KKwlpZiAoIXBmZGV2LT5w
ZmRldmZyZXEub3BwX29mX3RhYmxlX2FkZGVkKSB7CisJCWVyciA9IHBhbmZyb3N0X3JlZ3VsYXRv
cl9pbml0KHBmZGV2KTsKKwkJaWYgKGVycikKKwkJCWdvdG8gb3V0X2RldmZyZXE7CisJfQogCiAJ
ZXJyID0gcGFuZnJvc3RfcmVzZXRfaW5pdChwZmRldik7CiAJaWYgKGVycikgewotLSAKMi4yNS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

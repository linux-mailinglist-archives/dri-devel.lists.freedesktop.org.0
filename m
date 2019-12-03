Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BBB10FE69
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871A76E513;
	Tue,  3 Dec 2019 13:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7506E50E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:09:21 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m6so3767518ljc.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 05:09:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4UEsXQl3I/T+z770nwn4lhgtMw/PAlF7NFfwFxnxhdI=;
 b=M8fawm4z+/11VIRVXM10A++sHnWbKfIkZnmqu57w/tkTDrIDyvJwdggyaYKXkI62SJ
 vnESKINgF8i0qQrMrhfy9K8QONs56Ome33b0wi6GEI6nV37Jb41dJqpKyci+H/SrZ9+c
 dZWtJgvQsTc21M2F1tKckDLID0EBqmol+d4S/Ncu0GdzDZ3eVoW6HZ6STJqyQIK0J60Y
 S5ZLe4jYWgLXjpFV0BmucHLg7oXS/g+WL/U+XF1c2zm65wSKwNsCWncoTXBCJQ5YHsD2
 KzrT5VtMeQGIj3KMYI7/UB6HtoUYsX6+gjxHC2lQLK3YZtmO8qMrJO51Dl7DMD1Mp3rm
 XnxQ==
X-Gm-Message-State: APjAAAXXwDYwcAuFug4ozj8gVIfE3s7kpzrRUKZAS7Lgh3FzXrBna+xw
 1r++EBypqs0RQuDOCkn6zF6YNJ8x2EM=
X-Google-Smtp-Source: APXvYqyE8bvn/4nxbTp2IzkuXev0B626VRgW8HBr3BcVrnwalF9TVnvlTRTVtQ+yRAn39dTihi+AQQ==
X-Received: by 2002:a2e:85d5:: with SMTP id h21mr2515391ljj.243.1575378559953; 
 Tue, 03 Dec 2019 05:09:19 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id s22sm1344688ljm.41.2019.12.03.05.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 05:09:18 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/tilcdc: Switch to using GPIO descriptors
Date: Tue,  3 Dec 2019 14:09:16 +0100
Message-Id: <20191203130916.155779-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4UEsXQl3I/T+z770nwn4lhgtMw/PAlF7NFfwFxnxhdI=;
 b=J6+nzx7Liq6IkE2ZbYv9iUn6DDeNpvUfozrfr15HUHXmbq90IDh1BO0EgBG0+CCwLu
 sD0B+Rdq6AcqNxWVMibtCf1cFinsGwEofsyVGx+DgG4qAqXhy4Q/78XoJalr6884ADHb
 HGFn/8qrVrXA7FHavmw0heG9YpcSDT32SBqrUhYQhx19OO72p+DVt17Ar7wq/RowfQzz
 BFAhttnz2BLXMPa8qdlp3pgOufM+IQB6TsMhO7fWxhRCAXMc6woWk2C6oFQYH5WsIuKj
 lqC82sbD7neLMb8H64IWa/tCoueus+MQxZl49kqQi12uL1FVn/bcMILg+kCAM/OJZLd7
 ancA==
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 linux-arm-kernel@lists.infradead.org, David Lechner <david@lechnology.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFRJIExDREMgcGlja3MgYSBHUElPIGxpbmUgZnJvbSB0aGUgZGV2aWNlIHRyZWUgdG8gdXNl
CmZvciBEUE1TIHBvd2VyIG9uL29mZi4gV2UgY2FuIHN3aXRjaCB0aGlzIHRvIHVzZSBhIEdQSU8K
ZGVzY3JpcHRvciBwcmV0dHkgZWFzaWx5LiBNYWtlIHN1cmUgdG8gcmVxdWVzdCB0aGUgR1BJTwoi
YXMgaXMiIHNvIHRoYXQgdGhlIERQTVMgc3RhdGUgdGhhdCB3ZSBzdGFydCAoYm9vdCkgaW4gaXMK
cHJlc2VydmVkLgoKQ2M6IEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+CkNjOiBUb21pIFZhbGtl
aW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpDYzogRGF2aWQgTGVjaG5lciA8ZGF2aWRAbGVj
aG5vbG9neS5jb20+ClNpZ25lZC1vZmYtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpA
bGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY190ZnA0MTAuYyB8
IDMwICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rp
bGNkYy90aWxjZGNfdGZwNDEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlsY2RjL3RpbGNkY190ZnA0
MTAuYwppbmRleCA1MzBlZGIzYjUxY2MuLjQxY2Q5YTdjNDMxNiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3RpbGNkYy90aWxjZGNfdGZwNDEwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rp
bGNkYy90aWxjZGNfdGZwNDEwLmMKQEAgLTQsOSArNCw4IEBACiAgKiBBdXRob3I6IFJvYiBDbGFy
ayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KICAqLwogCi0jaW5jbHVkZSA8bGludXgvZ3Bpby5oPgor
I2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4KICNpbmNsdWRlIDxsaW51eC9tb2RfZGV2
aWNldGFibGUuaD4KLSNpbmNsdWRlIDxsaW51eC9vZl9ncGlvLmg+CiAjaW5jbHVkZSA8bGludXgv
cGluY3RybC9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPgog
CkBAIC0yMSw3ICsyMCw3IEBACiBzdHJ1Y3QgdGZwNDEwX21vZHVsZSB7CiAJc3RydWN0IHRpbGNk
Y19tb2R1bGUgYmFzZTsKIAlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmkyYzsKLQlpbnQgZ3BpbzsKKwlz
dHJ1Y3QgZ3Bpb19kZXNjICpwb3dlcl9ncGlvZDsKIH07CiAjZGVmaW5lIHRvX3RmcDQxMF9tb2R1
bGUoeCkgY29udGFpbmVyX29mKHgsIHN0cnVjdCB0ZnA0MTBfbW9kdWxlLCBiYXNlKQogCkBAIC01
OCwxMCArNTcsMTAgQEAgc3RhdGljIHZvaWQgdGZwNDEwX2VuY29kZXJfZHBtcyhzdHJ1Y3QgZHJt
X2VuY29kZXIgKmVuY29kZXIsIGludCBtb2RlKQogCiAJaWYgKG1vZGUgPT0gRFJNX01PREVfRFBN
U19PTikgewogCQlEQkcoIlBvd2VyIG9uIik7Ci0JCWdwaW9fZGlyZWN0aW9uX291dHB1dCh0ZnA0
MTBfZW5jb2Rlci0+bW9kLT5ncGlvLCAxKTsKKwkJZ3Bpb2RfZGlyZWN0aW9uX291dHB1dCh0ZnA0
MTBfZW5jb2Rlci0+bW9kLT5wb3dlcl9ncGlvZCwgMSk7CiAJfSBlbHNlIHsKIAkJREJHKCJQb3dl
ciBvZmYiKTsKLQkJZ3Bpb19kaXJlY3Rpb25fb3V0cHV0KHRmcDQxMF9lbmNvZGVyLT5tb2QtPmdw
aW8sIDApOworCQlncGlvZF9kaXJlY3Rpb25fb3V0cHV0KHRmcDQxMF9lbmNvZGVyLT5tb2QtPnBv
d2VyX2dwaW9kLCAwKTsKIAl9CiAKIAl0ZnA0MTBfZW5jb2Rlci0+ZHBtcyA9IG1vZGU7CkBAIC0z
MTgsMTcgKzMxNywxNyBAQCBzdGF0aWMgaW50IHRmcDQxMF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQogCiAJb2Zfbm9kZV9wdXQoaTJjX25vZGUpOwogCi0JdGZwNDEwX21vZC0+
Z3BpbyA9IG9mX2dldF9uYW1lZF9ncGlvX2ZsYWdzKG5vZGUsICJwb3dlcmRuLWdwaW8iLAotCQkJ
MCwgTlVMTCk7Ci0JaWYgKHRmcDQxMF9tb2QtPmdwaW8gPCAwKSB7Ci0JCWRldl93YXJuKCZwZGV2
LT5kZXYsICJObyBwb3dlciBkb3duIEdQSU9cbiIpOwotCX0gZWxzZSB7Ci0JCXJldCA9IGdwaW9f
cmVxdWVzdCh0ZnA0MTBfbW9kLT5ncGlvLCAiRFZJX1BEbiIpOwotCQlpZiAocmV0KSB7Ci0JCQlk
ZXZfZXJyKCZwZGV2LT5kZXYsICJjb3VsZCBub3QgZ2V0IERWSV9QRG4gZ3Bpb1xuIik7Ci0JCQln
b3RvIGZhaWxfYWRhcHRlcjsKLQkJfQorCXRmcDQxMF9tb2QtPnBvd2VyX2dwaW9kID0gZGV2bV9n
cGlvZF9nZXRfb3B0aW9uYWwoJnBkZXYtPmRldiwKKwkJCQkJCQkgICJwb3dlcmRuIiwKKwkJCQkJ
CQkgIEdQSU9EX0FTSVMpOworCWlmIChJU19FUlIodGZwNDEwX21vZC0+cG93ZXJfZ3Bpb2QpKSB7
CisJCWRldl9lcnIoJnBkZXYtPmRldiwgImNvdWxkIG5vdCBnZXQgRFZJX1BEbiBncGlvXG4iKTsK
KwkJZ290byBmYWlsX2FkYXB0ZXI7CiAJfQorCWlmICghdGZwNDEwX21vZC0+cG93ZXJfZ3Bpb2Qp
CisJCWRldl93YXJuKCZwZGV2LT5kZXYsICJObyBwb3dlciBkb3duIEdQSU9cbiIpOworCWVsc2UK
KwkJZ3Bpb2Rfc2V0X2NvbnN1bWVyX25hbWUodGZwNDEwX21vZC0+cG93ZXJfZ3Bpb2QsICJEVklf
UERuIik7CiAKIAlyZXR1cm4gMDsKIApAQCAtMzQ2LDcgKzM0NSw2IEBAIHN0YXRpYyBpbnQgdGZw
NDEwX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0cnVjdCB0ZnA0MTBf
bW9kdWxlICp0ZnA0MTBfbW9kID0gdG9fdGZwNDEwX21vZHVsZShtb2QpOwogCiAJaTJjX3B1dF9h
ZGFwdGVyKHRmcDQxMF9tb2QtPmkyYyk7Ci0JZ3Bpb19mcmVlKHRmcDQxMF9tb2QtPmdwaW8pOwog
CiAJdGlsY2RjX21vZHVsZV9jbGVhbnVwKG1vZCk7CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

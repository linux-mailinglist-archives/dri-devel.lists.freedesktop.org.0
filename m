Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B81721B09A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 09:53:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804B56EB98;
	Fri, 10 Jul 2020 07:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1FA6EA7B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 14:03:37 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g10so6341052wmc.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 07:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l36lxSRuzC4M5+GyPXFxDj/EhvfNIEQcQmOpcVgl7wo=;
 b=RWd6xeQaKkXBDcqaUA/vXcv9CsRqjpa1gLy87640mOge+kKSxYZka0L+8EC2/siJ+q
 7hI528ObcBzT3vpDQ3t1YTwExWlLqYzelTdhfRY6kbwcQwhiZB48cGHmrsoHfrL/b3+z
 GJSV9+MXXxU+8BI4nXWt2H2cw2j+UgDAwSwU/gOIH/wjjGdw0JipkSzveBKhfsnqYPpq
 md3JGAjHvuE99SU7q0iU+5w/PLqUQTWfwu5Ife5JtJJtN0uq2p1FBCVy9ko32W5nmn32
 npoM+x1zAiXRV1hWLL0QQ7lAkTFqhaUU5xsVN/ognjsXHL9JW0wOTrdk5eme+xICLWql
 EcXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l36lxSRuzC4M5+GyPXFxDj/EhvfNIEQcQmOpcVgl7wo=;
 b=ewaZXc/jTf+mAtk7a3jUN8exVpy6zNk1tu6KqPT0Mfw4M1nqxnGJrbtezzvNvFTPlP
 vu2LBOm0Y/N+JVHVquVbDUiZ5Sgh42ZCYEYIAc9HGRcaWx12WuXoU1y2tKeYi8mp04gu
 ETc0ryvo47PGg8lDLXSfAArbvxSPrOdyqtS1l23mu+v4OY8fxkKmkK73wbMlUPZCZ0ue
 /XgTDWvKKV/q992A6Zivis+NWoFJ/Bko0NMFXYq0THcqwOBRmtusAjI2sH5SBxoaMzzv
 aNGudH0R+K4ggYgUUulKnBHG6EfFWZ5JGfnt4qKzQKysMzbt6eiDlfv8wCHI+BldapYE
 DVaA==
X-Gm-Message-State: AOAM532V94vKsWT9yK8oJDs+9BmbqjiQtUb27OTWz+scNeXpAIweO4Gm
 DmZJqaUMRLIQZqRV1Nuoqfg=
X-Google-Smtp-Source: ABdhPJzQSsS3ZPutPIRqkj3+0gwoeFRJt699I4f8i1gp/1FAi0eILeOJ9Za1ciNteC/ZwKxiovGPGA==
X-Received: by 2002:a1c:e088:: with SMTP id x130mr196656wmg.14.1594303416312; 
 Thu, 09 Jul 2020 07:03:36 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id s8sm5545256wru.38.2020.07.09.07.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 07:03:35 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 08/14] drm/panfrost: move devfreq_init()/fini() in device
Date: Thu,  9 Jul 2020 16:03:16 +0200
Message-Id: <20200709140322.131320-9-peron.clem@gmail.com>
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

TGF0ZXIgd2Ugd2lsbCBpbnRyb2R1Y2UgZGV2ZnJlcSBwcm9iaW5nIHJlZ3VsYXRvciBpZiB0aGV5
CmFyZSBwcmVzZW50LiBBcyByZWd1bGF0b3Igc2hvdWxkIGJlIHByb2JlIG9ubHkgb25lIHRpbWUg
d2UKbmVlZCB0byBnZXQgdGhpcyBsb2dpYyBpbiB0aGUgZGV2aWNlX2luaXQoKS4KCnBhbmZyb3N0
X2RldmljZSBpcyBhbHJlYWR5IHRha2luZyBjYXJlIG9mIGRldmZyZXFfcmVzdW1lKCkKYW5kIGRl
dmZyZXFfc3VzcGVuZCgpLCBzbyBpdCdzIG5vdCB0b3RhbGx5IGlsbG9naWMgdG8gbW92ZQp0aGUg
ZGV2ZnJlcV9pbml0KCkgYW5kIGRldmZyZXFfZmluaSgpIGhlcmUuCgpSZXZpZXdlZC1ieTogQWx5
c3NhIFJvc2VuendlaWcgPGFseXNzYS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+ClNpZ25lZC1v
ZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jIHwgMTIgKysrKysrKysrKystCiBk
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgICAgfCAxNSArKy0tLS0tLS0t
LS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5j
IGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCmluZGV4IGNjMTZk
MTAyYjI3NS4uNDY0ZGExNjQ2Mzk4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X2RldmljZS5jCkBAIC0yMTIsMTAgKzIxMiwxNyBAQCBpbnQgcGFuZnJvc3RfZGV2aWNlX2lu
aXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAJCXJldHVybiBlcnI7CiAJfQogCisJ
ZXJyID0gcGFuZnJvc3RfZGV2ZnJlcV9pbml0KHBmZGV2KTsKKwlpZiAoZXJyKSB7CisJCWlmIChl
cnIgIT0gLUVQUk9CRV9ERUZFUikKKwkJCWRldl9lcnIocGZkZXYtPmRldiwgImRldmZyZXEgaW5p
dCBmYWlsZWQgJWRcbiIsIGVycik7CisJCWdvdG8gb3V0X2NsazsKKwl9CisKIAllcnIgPSBwYW5m
cm9zdF9yZWd1bGF0b3JfaW5pdChwZmRldik7CiAJaWYgKGVycikgewogCQlkZXZfZXJyKHBmZGV2
LT5kZXYsICJyZWd1bGF0b3IgaW5pdCBmYWlsZWQgJWRcbiIsIGVycik7Ci0JCWdvdG8gb3V0X2Ns
azsKKwkJZ290byBvdXRfZGV2ZnJlcTsKIAl9CiAKIAllcnIgPSBwYW5mcm9zdF9yZXNldF9pbml0
KHBmZGV2KTsKQEAgLTI2NSw2ICsyNzIsOCBAQCBpbnQgcGFuZnJvc3RfZGV2aWNlX2luaXQoc3Ry
dWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAJcGFuZnJvc3RfcmVzZXRfZmluaShwZmRldik7
CiBvdXRfcmVndWxhdG9yOgogCXBhbmZyb3N0X3JlZ3VsYXRvcl9maW5pKHBmZGV2KTsKK291dF9k
ZXZmcmVxOgorCXBhbmZyb3N0X2RldmZyZXFfZmluaShwZmRldik7CiBvdXRfY2xrOgogCXBhbmZy
b3N0X2Nsa19maW5pKHBmZGV2KTsKIAlyZXR1cm4gZXJyOwpAQCAtMjc4LDYgKzI4Nyw3IEBAIHZv
aWQgcGFuZnJvc3RfZGV2aWNlX2Zpbmkoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAJ
cGFuZnJvc3RfZ3B1X2ZpbmkocGZkZXYpOwogCXBhbmZyb3N0X3BtX2RvbWFpbl9maW5pKHBmZGV2
KTsKIAlwYW5mcm9zdF9yZXNldF9maW5pKHBmZGV2KTsKKwlwYW5mcm9zdF9kZXZmcmVxX2Zpbmko
cGZkZXYpOwogCXBhbmZyb3N0X3JlZ3VsYXRvcl9maW5pKHBmZGV2KTsKIAlwYW5mcm9zdF9jbGtf
ZmluaShwZmRldik7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMKaW5k
ZXggODgyZmVjYzMzZmRiLi40ZGRhNjg2ODkwMTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfZHJ2LmMKQEAgLTE0LDcgKzE0LDYgQEAKICNpbmNsdWRlIDxkcm0vZHJtX3V0aWxz
Lmg+CiAKICNpbmNsdWRlICJwYW5mcm9zdF9kZXZpY2UuaCIKLSNpbmNsdWRlICJwYW5mcm9zdF9k
ZXZmcmVxLmgiCiAjaW5jbHVkZSAicGFuZnJvc3RfZ2VtLmgiCiAjaW5jbHVkZSAicGFuZnJvc3Rf
bW11LmgiCiAjaW5jbHVkZSAicGFuZnJvc3Rfam9iLmgiCkBAIC02MDYsMTMgKzYwNSw2IEBAIHN0
YXRpYyBpbnQgcGFuZnJvc3RfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJ
Z290byBlcnJfb3V0MDsKIAl9CiAKLQllcnIgPSBwYW5mcm9zdF9kZXZmcmVxX2luaXQocGZkZXYp
OwotCWlmIChlcnIpIHsKLQkJaWYgKGVyciAhPSAtRVBST0JFX0RFRkVSKQotCQkJZGV2X2Vycigm
cGRldi0+ZGV2LCAiRmF0YWwgZXJyb3IgZHVyaW5nIGRldmZyZXEgaW5pdFxuIik7Ci0JCWdvdG8g
ZXJyX291dDE7Ci0JfQotCiAJcG1fcnVudGltZV9zZXRfYWN0aXZlKHBmZGV2LT5kZXYpOwogCXBt
X3J1bnRpbWVfbWFya19sYXN0X2J1c3kocGZkZXYtPmRldik7CiAJcG1fcnVudGltZV9lbmFibGUo
cGZkZXYtPmRldik7CkBAIC02MjUsMTYgKzYxNywxNCBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJICovCiAJZXJyID0gZHJtX2Rldl9y
ZWdpc3RlcihkZGV2LCAwKTsKIAlpZiAoZXJyIDwgMCkKLQkJZ290byBlcnJfb3V0MjsKKwkJZ290
byBlcnJfb3V0MTsKIAogCXBhbmZyb3N0X2dlbV9zaHJpbmtlcl9pbml0KGRkZXYpOwogCiAJcmV0
dXJuIDA7CiAKLWVycl9vdXQyOgotCXBtX3J1bnRpbWVfZGlzYWJsZShwZmRldi0+ZGV2KTsKLQlw
YW5mcm9zdF9kZXZmcmVxX2ZpbmkocGZkZXYpOwogZXJyX291dDE6CisJcG1fcnVudGltZV9kaXNh
YmxlKHBmZGV2LT5kZXYpOwogCXBhbmZyb3N0X2RldmljZV9maW5pKHBmZGV2KTsKIGVycl9vdXQw
OgogCWRybV9kZXZfcHV0KGRkZXYpOwpAQCAtNjUwLDcgKzY0MCw2IEBAIHN0YXRpYyBpbnQgcGFu
ZnJvc3RfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJcGFuZnJvc3RfZ2Vt
X3Nocmlua2VyX2NsZWFudXAoZGRldik7CiAKIAlwbV9ydW50aW1lX2dldF9zeW5jKHBmZGV2LT5k
ZXYpOwotCXBhbmZyb3N0X2RldmZyZXFfZmluaShwZmRldik7CiAJcGFuZnJvc3RfZGV2aWNlX2Zp
bmkocGZkZXYpOwogCXBtX3J1bnRpbWVfcHV0X3N5bmNfc3VzcGVuZChwZmRldi0+ZGV2KTsKIAlw
bV9ydW50aW1lX2Rpc2FibGUocGZkZXYtPmRldik7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

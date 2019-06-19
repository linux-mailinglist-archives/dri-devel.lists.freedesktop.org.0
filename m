Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BF84B2B2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CAA6E2CC;
	Wed, 19 Jun 2019 07:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5EC6E294
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 05:27:46 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id r1so9017088pfq.12
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 22:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rLmxJijneHssI0qWBrY0jrua4flRxNh6uldtHldGK3s=;
 b=n9uYpo3P0n36acyMkSUWQiHQD9XMMy6mlLdBCuHCaW3soySs9i7KdIckd3gksnvDfb
 VQ7GQAgeK1UoZTmYmH4HeE+GY1mvj9AknJ+Y1N73hXt1FcA0aviPC2Cc8MvE1qb4E+0u
 yg+6kt85+oHNPp5lSlyRFFJMuNI7euGThDlSkPmdYTxiSkuarIJ+qyOCLc8VNgEOwyN2
 2htKVenOIjdPIUHjdOKojA6tQTdd/8fKTMTEZ4J3QXPzl3qg4mb3uyxZrm+hP5KY1Bz6
 dSYh8Ae4MeoBs/OGqB8bltXZYs2YacOSEGzjh1Q5od+snTXRr/1sFDsxkfbmce56+K1q
 Rw/w==
X-Gm-Message-State: APjAAAVXhs2UcbXhJd4z7mqhXZ5GYdt14DsGZcl3IOwNiVmt1+iLUKtQ
 rPgMo32URst3OkXwP03ZLWWJqqL+PvY=
X-Google-Smtp-Source: APXvYqxMUU+MFp9vgjwUaK0oXkXDogLmqSeBTOkHuP0ge5zsQ988YGc/h/hx762RKUbWgVhRc/h7kA==
X-Received: by 2002:a63:595e:: with SMTP id j30mr5709750pgm.2.1560922065571;
 Tue, 18 Jun 2019 22:27:45 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id l44sm534742pje.29.2019.06.18.22.27.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 22:27:44 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 09/15] drm/bridge: tc358767: Use reported AUX transfer size
Date: Tue, 18 Jun 2019 22:27:10 -0700
Message-Id: <20190619052716.16831-10-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619052716.16831-1-andrew.smirnov@gmail.com>
References: <20190619052716.16831-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rLmxJijneHssI0qWBrY0jrua4flRxNh6uldtHldGK3s=;
 b=lYHMZkKmMbxDgX1dgOxKFf6fF9d9VLylQRc9oC5159OPDIxsqZNkUZUVkJk4mcAPYx
 YMIQaos8YshHtrx1YqKahyvD89/3pja1RLKbt9K+NAuFpZZvadu3Jue1hF8Lj+HauXmU
 jC/ajDGW/1uWyUQEnFkyKXj/mJtKLr8eJ3muP6LtBHBLow8D/LixXAEL2i7vPCcNGetp
 VnetyRvHWNSXxZs+3Jmg/7zILXhozzaOzD0OvuWfAD2NHc57sLuph75H62/yt9qd9VkI
 CBsJRGMSLSwnDGKziM5CXT0GQlIGXcM9GWRJe92J09N/vVcdbZqFiLVvRN+ywOvotHi8
 exWA==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9uJ3QgYXNzdW1lIHRoYXQgcmVxdWVzdGVkIGRhdGEgdHJhbnNmZXIgc2l6ZSBpcyB0aGUgc2Ft
ZSBhcyBhbW91bnQKb2YgZGF0YSB0aGF0IHdhcyB0cmFuc2ZlcnJlZC4gQ2hhbmdlIHRoZSBjb2Rl
IHRvIGdldCB0aGF0IGluZm9ybWF0aW9uCmZyb20gRFAwX0FVWFNUQVRVUyBpbnN0ZWFkLgoKU2lu
Y2UgdGhlIGNoZWNrIGZvciBBVVhfQlVTWSBpbiB0Y19hdXhfZ2V0X3N0YXR1cygpIGlzIHBvaW50
bGVzcyAoaXQKd2lsbCBhbHdheXMgY2FsbGVkIGFmdGVyIHRjX2F1eF93YWl0X2J1c3koKSkgYW5k
IHRoZXJlJ3Mgb25seSBvbmUgdXNlcgpvZiBpdCwgaW5saW5lIGl0cyBjb2RlIGludG8gdGNfYXV4
X3RyYW5zZmVyKCkgaW5zdGVhZCBvZiB0cnlpbmcgdG8KYWNjb21tb2RhdGUgdGhlIGNoYW5nZSBh
Ym92ZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBTbWlybm92IDxhbmRyZXcuc21pcm5vdkBnbWFp
bC5jb20+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpD
YzogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KQ2M6IExhdXJlbnQgUGluY2hh
cnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6IFRvbWkgVmFsa2VpbmVu
IDx0b21pLnZhbGtlaW5lbkB0aS5jb20+CkNjOiBBbmRyZXkgR3VzYWtvdiA8YW5kcmV5Lmd1c2Fr
b3ZAY29nZW50ZW1iZWRkZWQuY29tPgpDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRy
b25peC5kZT4KQ2M6IENvcnkgVHVzYXIgPGNvcnkudHVzYXJAemlpLmFlcm8+CkNjOiBDaHJpcyBI
ZWFseSA8Y3BoZWFseUBnbWFpbC5jb20+CkNjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRy
b25peC5kZT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3
LmMgfCA0MCArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MTIgaW5zZXJ0aW9ucygrKSwgMjggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2
Ny5jCmluZGV4IGJkYmY4ODA1Nzk0Ni4uYjAxYzFjODM0MWUxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
YzM1ODc2Ny5jCkBAIC0xNTIsMTAgKzE1MiwxMCBAQAogI2RlZmluZSBEUDBfQVVYV0RBVEEoaSkJ
CSgweDA2NmMgKyAoaSkgKiA0KQogI2RlZmluZSBEUDBfQVVYUkRBVEEoaSkJCSgweDA2N2MgKyAo
aSkgKiA0KQogI2RlZmluZSBEUDBfQVVYU1RBVFVTCQkweDA2OGMKLSNkZWZpbmUgQVVYX1NUQVRV
U19NQVNLCQkJMHhmMAotI2RlZmluZSBBVVhfU1RBVFVTX1NISUZUCQk0Ci0jZGVmaW5lIEFVWF9U
SU1FT1VUCQkJQklUKDEpCi0jZGVmaW5lIEFVWF9CVVNZCQkJQklUKDApCisjZGVmaW5lIEFVWF9C
WVRFUwkJR0VOTUFTSygxNSwgOCkKKyNkZWZpbmUgQVVYX1NUQVRVUwkJR0VOTUFTSyg3LCA0KQor
I2RlZmluZSBBVVhfVElNRU9VVAkJQklUKDEpCisjZGVmaW5lIEFVWF9CVVNZCQlCSVQoMCkKICNk
ZWZpbmUgRFAwX0FVWEkyQ0FEUgkJMHgwNjk4CiAKIC8qIExpbmsgVHJhaW5pbmcgKi8KQEAgLTI5
OCwyOSArMjk4LDYgQEAgc3RhdGljIGludCB0Y19hdXhfd2FpdF9idXN5KHN0cnVjdCB0Y19kYXRh
ICp0YywgdW5zaWduZWQgaW50IHRpbWVvdXRfbXMpCiAJCQkgICAgICAgMTAwMCwgMTAwMCAqIHRp
bWVvdXRfbXMpOwogfQogCi1zdGF0aWMgaW50IHRjX2F1eF9nZXRfc3RhdHVzKHN0cnVjdCB0Y19k
YXRhICp0YywgdTggKnJlcGx5KQotewotCWludCByZXQ7Ci0JdTMyIHZhbHVlOwotCi0JcmV0ID0g
cmVnbWFwX3JlYWQodGMtPnJlZ21hcCwgRFAwX0FVWFNUQVRVUywgJnZhbHVlKTsKLQlpZiAocmV0
IDwgMCkKLQkJcmV0dXJuIHJldDsKLQotCWlmICh2YWx1ZSAmIEFVWF9CVVNZKSB7Ci0JCWRldl9l
cnIodGMtPmRldiwgImF1eCBidXN5IVxuIik7Ci0JCXJldHVybiAtRUJVU1k7Ci0JfQotCi0JaWYg
KHZhbHVlICYgQVVYX1RJTUVPVVQpIHsKLQkJZGV2X2Vycih0Yy0+ZGV2LCAiYXV4IGFjY2VzcyB0
aW1lb3V0IVxuIik7Ci0JCXJldHVybiAtRVRJTUVET1VUOwotCX0KLQotCSpyZXBseSA9ICh2YWx1
ZSAmIEFVWF9TVEFUVVNfTUFTSykgPj4gQVVYX1NUQVRVU19TSElGVDsKLQlyZXR1cm4gMDsKLX0K
LQogc3RhdGljIGludCB0Y19hdXhfd3JpdGVfZGF0YShzdHJ1Y3QgdGNfZGF0YSAqdGMsIGNvbnN0
IHZvaWQgKmRhdGEsCiAJCQkgICAgIHNpemVfdCBzaXplKQogewpAQCAtMzU2LDYgKzMzMyw3IEBA
IHN0YXRpYyBzc2l6ZV90IHRjX2F1eF90cmFuc2ZlcihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAog
CXN0cnVjdCB0Y19kYXRhICp0YyA9IGF1eF90b190YyhhdXgpOwogCXNpemVfdCBzaXplID0gbWlu
X3Qoc2l6ZV90LCBEUF9BVVhfTUFYX1BBWUxPQURfQllURVMgLSAxLCBtc2ctPnNpemUpOwogCXU4
IHJlcXVlc3QgPSBtc2ctPnJlcXVlc3QgJiB+RFBfQVVYX0kyQ19NT1Q7CisJdTMyIGF1eHN0YXR1
czsKIAlpbnQgcmV0OwogCiAJaWYgKHNpemUgPT0gMCkKQEAgLTM5MywxMCArMzcxLDE2IEBAIHN0
YXRpYyBzc2l6ZV90IHRjX2F1eF90cmFuc2ZlcihzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAogCWlm
IChyZXQpCiAJCXJldHVybiByZXQ7CiAKLQlyZXQgPSB0Y19hdXhfZ2V0X3N0YXR1cyh0YywgJm1z
Zy0+cmVwbHkpOworCXJldCA9IHJlZ21hcF9yZWFkKHRjLT5yZWdtYXAsIERQMF9BVVhTVEFUVVMs
ICZhdXhzdGF0dXMpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CiAKKwlpZiAoYXV4c3RhdHVz
ICYgQVVYX1RJTUVPVVQpCisJCXJldHVybiAtRVRJTUVET1VUOworCisJc2l6ZSA9IEZJRUxEX0dF
VChBVVhfQllURVMsIGF1eHN0YXR1cyk7CisJbXNnLT5yZXBseSA9IEZJRUxEX0dFVChBVVhfU1RB
VFVTLCBhdXhzdGF0dXMpOworCiAJc3dpdGNoIChyZXF1ZXN0KSB7CiAJY2FzZSBEUF9BVVhfTkFU
SVZFX1JFQUQ6CiAJY2FzZSBEUF9BVVhfSTJDX1JFQUQ6Ci0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 827921A7442
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:06:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DBED6E47A;
	Tue, 14 Apr 2020 07:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A6289CF8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 17:33:48 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id d77so10017048wmd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 10:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8aUMUy/wOX/7K0dS1U3BUrwSzoWMPHBW5fhBQA8MxGM=;
 b=joPKK1pt9Q1roRgAEHNzrtbiAO9UqKMcrjasUBKJbXFLK0l7M9MR8SUoEGycMZVJKI
 SUfGpJSvMsvbuer6EW9fqrR+A7GY/I27Yr11B+kbcPgNXAW9E7u/C+d6MTT65VycrIz+
 oO4Iwdj5DoyWNBIWMEfnRE7u5asYx4o9fvK7rPy1wGSrAbctgmG14b14+LHjBBrS1/JM
 Wc1LN3roDxpiS9yIHx0e6eD86QcKwav7/wQS7FNUw3SdDcF1RpSl1EJ/4gE70PgoOdBN
 ah9yH7s35tO+J0JHouUz0/ahj9yZTAP6U39eVALf3/DyDBgyzHgKYyD+MrontQ+fjRCx
 TUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8aUMUy/wOX/7K0dS1U3BUrwSzoWMPHBW5fhBQA8MxGM=;
 b=S0Q8puX/8A0QfW8bCVXOGOwzvq4viSxHPIR/6lxoy+RpkPUdQCsyhYpgmPdl4D9xJj
 8YMsqxZCTEGeET0fFbBBNZ/Z6rKRSB9W6HCSBMS/5JbNchdV3nkqSJSfPJ+mqiVEmPTb
 mcqRS8RKTcaTzQKW7laHeOmIAx1Q8VUqpbob1cpOqGoF0FVCTF6M2sGx1OHh5GMJd9dK
 WO0kFy/Zaj+q11Lwn7Nbg+C1Y7rrEQKQ9c/oMqCPqL/Ptc+HdVch+wwUN4cIx8jHDxaR
 J0oOIk/omMfuyL5eivJCe4LmnG7ufLzPA3fMA9vV4JkEjvNAvpxfzCc8V+KiV/mVtm8b
 zCAw==
X-Gm-Message-State: AGi0Pubb+nFG5ZJ+v0YE2v/OGg8ajPql8khh05skUXPgW66fQMRSG7Ms
 CdL1CsWQQcJTLmXWjctcaZgBj4BqX6Q=
X-Google-Smtp-Source: APiQypLfNEB9bAOtFdIH8RmANnwshXM6x6H3qFZOwYXkmx+YDtINIiwe6Qu3boNCWaiCCL285aMJYA==
X-Received: by 2002:a05:600c:214b:: with SMTP id
 v11mr20754687wml.151.1586799226743; 
 Mon, 13 Apr 2020 10:33:46 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::42f0:c285])
 by smtp.gmail.com with ESMTPSA id v7sm17025219wmg.3.2020.04.13.10.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 10:33:46 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v2 2/2] drm/panfrost: add devfreq regulator support
Date: Mon, 13 Apr 2020 19:33:38 +0200
Message-Id: <20200413173338.8294-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200413173338.8294-1-peron.clem@gmail.com>
References: <20200413173338.8294-1-peron.clem@gmail.com>
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

T1BQIHRhYmxlIGNhbiBkZWZpbmVkIGJvdGggZnJlcXVlbmN5IGFuZCB2b2x0YWdlLgoKUmVnaXN0
ZXIgbWFsaSByZWd1bGF0b3JzIHRvIE9QUCBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVu
dCBQw6lyb24gPHBlcm9uLmNsZW1AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMgfCAzNCArKysrKysrKysrKysrKysrKystLS0KIGRyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCAgfCAgMSArCiAyIGZpbGVzIGNo
YW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZmcmVxLmMKaW5kZXggNjI1NDFmNGVkZDgxLi41NGExMDli
YmRjMTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZm
cmVxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmZyZXEuYwpA
QCAtNzgsMTIgKzc4LDI2IEBAIGludCBwYW5mcm9zdF9kZXZmcmVxX2luaXQoc3RydWN0IHBhbmZy
b3N0X2RldmljZSAqcGZkZXYpCiAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBmZGV2LT5wZGV2LT5k
ZXY7CiAJc3RydWN0IGRldmZyZXEgKmRldmZyZXE7CiAJc3RydWN0IHRoZXJtYWxfY29vbGluZ19k
ZXZpY2UgKmNvb2xpbmc7CisJc3RydWN0IG9wcF90YWJsZSAqb3BwX3RhYmxlOworCisJLyogUmVn
dWxhdG9yIGlzIG9wdGlvbmFsICovCisJb3BwX3RhYmxlID0gZGV2X3BtX29wcF9zZXRfcmVndWxh
dG9ycyhkZXYsIHBmZGV2LT5jb21wLT5zdXBwbHlfbmFtZXMsCisJCQkJCSAgICAgIHBmZGV2LT5j
b21wLT5udW1fc3VwcGxpZXMpOworCWlmIChJU19FUlIob3BwX3RhYmxlKSkgeworCQlyZXQgPSBQ
VFJfRVJSKG9wcF90YWJsZSk7CisJCWlmIChyZXQgIT0gLUVOT0RFVikgeworCQkJRFJNX0RFVl9F
UlJPUihkZXYsICJGYWlsZWQgdG8gc2V0IHJlZ3VsYXRvcjogJWRcbiIsIHJldCk7CisJCQlyZXR1
cm4gcmV0OworCQl9CisJfQorCXBmZGV2LT5kZXZmcmVxLm9wcF90YWJsZSA9IG9wcF90YWJsZTsK
IAogCXJldCA9IGRldl9wbV9vcHBfb2ZfYWRkX3RhYmxlKGRldik7Ci0JaWYgKHJldCA9PSAtRU5P
REVWKSAvKiBPcHRpb25hbCwgY29udGludWUgd2l0aG91dCBkZXZmcmVxICovCi0JCXJldHVybiAw
OwotCWVsc2UgaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKKwlpZiAocmV0KSB7CisJCWlmIChyZXQg
PT0gLUVOT0RFVikgLyogT3B0aW9uYWwsIGNvbnRpbnVlIHdpdGhvdXQgZGV2ZnJlcSAqLworCQkJ
cmV0ID0gMDsKKwkJZ290byBlcnJfb3BwX3JlZzsKKwl9CiAKIAlwYW5mcm9zdF9kZXZmcmVxX3Jl
c2V0KHBmZGV2KTsKIApAQCAtMTE5LDYgKzEzMywxMiBAQCBpbnQgcGFuZnJvc3RfZGV2ZnJlcV9p
bml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogZXJyX29wcDoKIAlkZXZfcG1fb3Bw
X29mX3JlbW92ZV90YWJsZShkZXYpOwogCitlcnJfb3BwX3JlZzoKKwlpZiAocGZkZXYtPmRldmZy
ZXEub3BwX3RhYmxlKSB7CisJCWRldl9wbV9vcHBfcHV0X3JlZ3VsYXRvcnMocGZkZXYtPmRldmZy
ZXEub3BwX3RhYmxlKTsKKwkJcGZkZXYtPmRldmZyZXEub3BwX3RhYmxlID0gTlVMTDsKKwl9CisK
IAlyZXR1cm4gcmV0OwogfQogCkBAIC0xMjYsNyArMTQ2LDEzIEBAIHZvaWQgcGFuZnJvc3RfZGV2
ZnJlcV9maW5pKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogewogCWlmIChwZmRldi0+
ZGV2ZnJlcS5jb29saW5nKQogCQlkZXZmcmVxX2Nvb2xpbmdfdW5yZWdpc3RlcihwZmRldi0+ZGV2
ZnJlcS5jb29saW5nKTsKKwogCWRldl9wbV9vcHBfb2ZfcmVtb3ZlX3RhYmxlKCZwZmRldi0+cGRl
di0+ZGV2KTsKKworCWlmIChwZmRldi0+ZGV2ZnJlcS5vcHBfdGFibGUpIHsKKwkJZGV2X3BtX29w
cF9wdXRfcmVndWxhdG9ycyhwZmRldi0+ZGV2ZnJlcS5vcHBfdGFibGUpOworCQlwZmRldi0+ZGV2
ZnJlcS5vcHBfdGFibGUgPSBOVUxMOworCX0KIH0KIAogdm9pZCBwYW5mcm9zdF9kZXZmcmVxX3Jl
c3VtZShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCBiL2RyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9kZXZpY2UuaAppbmRleCBjMzBjNzE5YTgwNTkuLmMxMWQxOTQzMGMwZiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaApAQCAtMTEwLDYg
KzExMCw3IEBAIHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgewogCXN0cnVjdCB7CiAJCXN0cnVjdCBk
ZXZmcmVxICpkZXZmcmVxOwogCQlzdHJ1Y3QgdGhlcm1hbF9jb29saW5nX2RldmljZSAqY29vbGlu
ZzsKKwkJc3RydWN0IG9wcF90YWJsZSAqb3BwX3RhYmxlOwogCQlrdGltZV90IGJ1c3lfdGltZTsK
IAkJa3RpbWVfdCBpZGxlX3RpbWU7CiAJCWt0aW1lX3QgdGltZV9sYXN0X3VwZGF0ZTsKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

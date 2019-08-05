Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2918192C
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0176E430;
	Mon,  5 Aug 2019 12:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C119C6E42D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 12:24:12 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id e3so78475911edr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 05:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A2UsKm//6X2vYXLSc0QHmL2K5YIIPthX7tRhFllIi0U=;
 b=MSCIiiX8K31g9Rrtsl4WxwuDGWWYbCo0cRYbaqFcJtmEOz9OcoD0kN4Xc5P4m+7vCx
 NjSPQsrzpqlACbbMkrYXZAlOeH9Kpc76vyRWYLhxzFWBk+7ouzDs/eIxFEXnbBSXxO8f
 65ydaOHIxfNeXu+TiAAcSBojX4FkA0tQAlOZv7gIuQe1GZAFM+Yp9DIwfRF1MUx8dcCt
 eomyndam/RRO3zvJC83h9UhNpelRcGMNWrVZ0QSgZN2PdEVMML/Pyzji76dPhhuoefbe
 ss5aC8KwPSi5AGBB8iqb/C4T9D+sdjmvVX6Lm/iaG+cJIIAuflFhmc9y6ZNzBEcPCv58
 oIhg==
X-Gm-Message-State: APjAAAWG4BLRrWNVQkVr6cvIlZH+DN+R6DsdaLBvKp/EQmAPw3DhxwCQ
 Jt7c+qXsRYR+hR0u9hprsQoU/IIK
X-Google-Smtp-Source: APXvYqwn6FPY5c7riM4OxiAYDCQ6vWgG767YDKXPsTOB+r4Zusy5T0TmIjod051XrTcsGm+0MBxBfA==
X-Received: by 2002:a17:906:3919:: with SMTP id
 f25mr12591998eje.243.1565007850847; 
 Mon, 05 Aug 2019 05:24:10 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id rn18sm1952781ejb.25.2019.08.05.05.24.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:24:10 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 14/21] drm/dp: Use drm_dp_aux_rd_interval()
Date: Mon,  5 Aug 2019 14:23:43 +0200
Message-Id: <20190805122350.8838-14-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805122350.8838-1-thierry.reding@gmail.com>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=A2UsKm//6X2vYXLSc0QHmL2K5YIIPthX7tRhFllIi0U=;
 b=USPcxkv903Krw9bPbPSiVesvBc5I8JC/JWphoRPZa2JRgFALmZMa/TI1/LL0EGwjkF
 I1q7cwLCUurZ4pwfYHdiFGBRfnti4JbirDkyOfOpTKfZMdJmM1jPR0rQIVacRAzKcWP3
 Qa8hd1o2KHW0Yexj+MfO3xsDad3o66TZMiHNUpIF1/bKBkNStXc+WQU/SVynN/kIwtOx
 XXySYAzvti8/HcxI5KLJemN+br963rn63WFM6tK8E+e1Rn6FY8PLgA7E+iqvhvsCH0S/
 AqyBzv/zupbwoslujptYRyiGb+EAN6kzaIsQZ+7vuWDq5zTsnQ1PJuJSJU4uAxiz2YQu
 YhGQ==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCk1ha2UgdXNlIG9mIHRo
ZSBuZXdseSBhZGRlZCBkcm1fZHBfYXV4X3JkX2ludGVydmFsKCkgaGVscGVyIGluIGV4aXN0aW5n
CkRQIGxpbmsgdHJhaW5pbmcgaGVscGVycyBhbmQgYWRkIGNvbW1lbnRzIGFib3V0IG1pbmltdW0g
cmVxdWlyZWQgZGVsYXlzCm1hbmRhdGVkIGJ5IHRoZSBEUCBzcGVjaWZpY2F0aW9uLgoKU2lnbmVk
LW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgMjYgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2hlbHBlci5jCmluZGV4IDM0NGY4ODdmZWYyYy4uMWZiM2MyN2NkMDEyIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfaGVscGVyLmMKQEAgLTEyMiwxNyArMTIyLDcgQEAgRVhQT1JUX1NZTUJPTChkcm1f
ZHBfZ2V0X2FkanVzdF9yZXF1ZXN0X3ByZV9lbXBoYXNpcyk7CiAKIHZvaWQgZHJtX2RwX2xpbmtf
dHJhaW5fY2xvY2tfcmVjb3ZlcnlfZGVsYXkoY29uc3QgdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBf
U0laRV0pCiB7Ci0JdW5zaWduZWQgaW50IHJkX2ludGVydmFsID0gZHBjZFtEUF9UUkFJTklOR19B
VVhfUkRfSU5URVJWQUxdICYKLQkJCQkJRFBfVFJBSU5JTkdfQVVYX1JEX01BU0s7Ci0KLQlpZiAo
cmRfaW50ZXJ2YWwgPiA0KQotCQlEUk1fREVCVUdfS01TKCJBVVggaW50ZXJ2YWwgJXUsIG91dCBv
ZiByYW5nZSAobWF4IDQpXG4iLAotCQkJICAgICAgcmRfaW50ZXJ2YWwpOwotCi0JaWYgKHJkX2lu
dGVydmFsID09IDAgfHwgZHBjZFtEUF9EUENEX1JFVl0gPj0gRFBfRFBDRF9SRVZfMTQpCi0JCXJk
X2ludGVydmFsID0gMTAwOwotCWVsc2UKLQkJcmRfaW50ZXJ2YWwgKj0gNDsKKwl1bnNpZ25lZCBp
bnQgcmRfaW50ZXJ2YWwgPSBkcm1fZHBfYXV4X3JkX2ludGVydmFsKGRwY2QpOwogCiAJdXNsZWVw
X3JhbmdlKHJkX2ludGVydmFsLCByZF9pbnRlcnZhbCAqIDIpOwogfQpAQCAtMTQwLDE5ICsxMzAs
OSBAQCBFWFBPUlRfU1lNQk9MKGRybV9kcF9saW5rX3RyYWluX2Nsb2NrX3JlY292ZXJ5X2RlbGF5
KTsKIAogdm9pZCBkcm1fZHBfbGlua190cmFpbl9jaGFubmVsX2VxX2RlbGF5KGNvbnN0IHU4IGRw
Y2RbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdKQogewotCXVuc2lnbmVkIGludCByZF9pbnRlcnZhbCA9
IGRwY2RbRFBfVFJBSU5JTkdfQVVYX1JEX0lOVEVSVkFMXSAmCi0JCQkJCURQX1RSQUlOSU5HX0FV
WF9SRF9NQVNLOwotCi0JaWYgKHJkX2ludGVydmFsID4gNCkKLQkJRFJNX0RFQlVHX0tNUygiQVVY
IGludGVydmFsICV1LCBvdXQgb2YgcmFuZ2UgKG1heCA0KVxuIiwKLQkJCSAgICAgIHJkX2ludGVy
dmFsKTsKKwl1bnNpZ25lZCBpbnQgbWluID0gZHJtX2RwX2F1eF9yZF9pbnRlcnZhbChkcGNkKTsK
IAotCWlmIChyZF9pbnRlcnZhbCA9PSAwKQotCQlyZF9pbnRlcnZhbCA9IDQwMDsKLQllbHNlCi0J
CXJkX2ludGVydmFsICo9IDQ7Ci0KLQl1c2xlZXBfcmFuZ2UocmRfaW50ZXJ2YWwsIHJkX2ludGVy
dmFsICogMik7CisJdXNsZWVwX3JhbmdlKG1pbiwgbWluICogMik7CiB9CiBFWFBPUlRfU1lNQk9M
KGRybV9kcF9saW5rX3RyYWluX2NoYW5uZWxfZXFfZGVsYXkpOwogCi0tIAoyLjIyLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

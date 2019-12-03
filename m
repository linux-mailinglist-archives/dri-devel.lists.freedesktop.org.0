Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCD41101FE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0796E843;
	Tue,  3 Dec 2019 16:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA026E844
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 16:19:25 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f129so4185949wmf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 08:19:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ukbAySjSNMI0S+s3PZZPFOl6pszLEQLlgBTJCxk93hE=;
 b=O1DIvOI+SfzeO0QTZ7svFdKGU3mJAUXxOiMIJ3Eg6iJABepsVj60Az0JSIqonwGcH2
 czJVATijjt7aeb7JW6RbnCsG3N+gJ8aWDT4XMydDldvFeZgx/Y8jGZlFATy2Y6PJnAoZ
 5C1/CwHcxiAWeWluE6wVZdmepHYY5JYdUN6v40RWC5q70TfvmC/+m57F1LRdJKWQlpnZ
 fee4BZ3vleSCSAIgYXqFjdWFL8JfdZMjuJVU3V8ZPjlfIS9wymLPF+uAfIHnEE+5+lKm
 beN9mC8hFS+QoPG4vdfC+/rX9WzoLhd2foF6shtQC5CCDrXWeb42XfWQJZEPx9+s6g+a
 zdyg==
X-Gm-Message-State: APjAAAU57jzOjvO6PSJDam/kwFsAbmfmf6ZYIPyps9FpWG/m+bwe3bo5
 EZsXMCHcoUO/3OoDZqBMJS2vC9vfwtU=
X-Google-Smtp-Source: APXvYqzjma23PNGKsrRHGJ52wpi75A2EWA8HJoQhYk9dTPg/yLs/spOEQa0hVHdrIR9GSKVKKEQGJg==
X-Received: by 2002:a1c:4b0d:: with SMTP id y13mr28421590wma.134.1575389964363; 
 Tue, 03 Dec 2019 08:19:24 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id d186sm3725722wmf.7.2019.12.03.08.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:19:23 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 4/9] drm/tegra: Use proper IOVA address for cursor image
Date: Tue,  3 Dec 2019 17:19:09 +0100
Message-Id: <20191203161914.1312555-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203161914.1312555-1-thierry.reding@gmail.com>
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ukbAySjSNMI0S+s3PZZPFOl6pszLEQLlgBTJCxk93hE=;
 b=p8AImqUvKPe7RcRTdaqBUPvOw2AwuTZBJifHfoT71eipePQVF3elFSVEDEDXXAxN8/
 lDYaDj555Vo2HTypIdFGy+G6zgIKRTJ4SNPgqNIhbEhWqgIZ9cgh/i8AEWy2C1W0mQJ9
 HRjmripn4yKt2iy9qUQ/67kL7m4Ia4TD6SndkgnxupanzaXqDQKppe6c82C8Sl7OffJk
 7jMKDcchpMUqcCY+etP2sS+R6ZFB+T7mMkgjXwTm9DmEA8J+UShOa3wMr3WmKvCaQIi4
 gKP5dd4ORA6mdc3TuZAp0kgiQ+G73ZQpiXCAJg8I6i18wD+6lKtdcfviGLW0p3JJisW2
 YGnA==
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
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBJT1ZBIGFkZHJl
c3MgZm9yIHRoZSBjdXJzb3IgaXMgdGhlIHJlc3VsdCBvZiBtYXBwaW5nIHRoZSBidWZmZXIKb2Jq
ZWN0IGZvciB0aGUgZ2l2ZW4gZGlzcGxheSBjb250cm9sbGVyLiBNYWtlIHN1cmUgdG8gdXNlIHRo
ZSBwcm9wZXIKSU9WQSBhZGRyZXNzIGFzIHN0b3JlZCBpbiB0aGUgY3Vyc29yJ3MgcGxhbmUgc3Rh
dGUuCgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
U2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYyB8IDE2ICsrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwppbmRl
eCBkMDNiMzNjM2IxMTQuLjBhNWY4NmI2MWZkYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMKQEAgLTg0NywxNiAr
ODQ3LDE1IEBAIHN0YXRpYyBpbnQgdGVncmFfY3Vyc29yX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJt
X3BsYW5lICpwbGFuZSwKIHN0YXRpYyB2b2lkIHRlZ3JhX2N1cnNvcl9hdG9taWNfdXBkYXRlKHN0
cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCQkJCSAgICAgICBzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRl
ICpvbGRfc3RhdGUpCiB7Ci0Jc3RydWN0IHRlZ3JhX2JvICpibyA9IHRlZ3JhX2ZiX2dldF9wbGFu
ZShwbGFuZS0+c3RhdGUtPmZiLCAwKTsKKwlzdHJ1Y3QgdGVncmFfcGxhbmVfc3RhdGUgKnN0YXRl
ID0gdG9fdGVncmFfcGxhbmVfc3RhdGUocGxhbmUtPnN0YXRlKTsKIAlzdHJ1Y3QgdGVncmFfZGMg
KmRjID0gdG9fdGVncmFfZGMocGxhbmUtPnN0YXRlLT5jcnRjKTsKLQlzdHJ1Y3QgZHJtX3BsYW5l
X3N0YXRlICpzdGF0ZSA9IHBsYW5lLT5zdGF0ZTsKIAl1MzIgdmFsdWUgPSBDVVJTT1JfQ0xJUF9E
SVNQTEFZOwogCiAJLyogcmllbiBuZSB2YSBwbHVzICovCiAJaWYgKCFwbGFuZS0+c3RhdGUtPmNy
dGMgfHwgIXBsYW5lLT5zdGF0ZS0+ZmIpCiAJCXJldHVybjsKIAotCXN3aXRjaCAoc3RhdGUtPmNy
dGNfdykgeworCXN3aXRjaCAocGxhbmUtPnN0YXRlLT5jcnRjX3cpIHsKIAljYXNlIDMyOgogCQl2
YWx1ZSB8PSBDVVJTT1JfU0laRV8zMngzMjsKIAkJYnJlYWs7CkBAIC04NzQsMTYgKzg3MywxNiBA
QCBzdGF0aWMgdm9pZCB0ZWdyYV9jdXJzb3JfYXRvbWljX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5l
ICpwbGFuZSwKIAkJYnJlYWs7CiAKIAlkZWZhdWx0OgotCQlXQVJOKDEsICJjdXJzb3Igc2l6ZSAl
dXgldSBub3Qgc3VwcG9ydGVkXG4iLCBzdGF0ZS0+Y3J0Y193LAotCQkgICAgIHN0YXRlLT5jcnRj
X2gpOworCQlXQVJOKDEsICJjdXJzb3Igc2l6ZSAldXgldSBub3Qgc3VwcG9ydGVkXG4iLAorCQkg
ICAgIHBsYW5lLT5zdGF0ZS0+Y3J0Y193LCBwbGFuZS0+c3RhdGUtPmNydGNfaCk7CiAJCXJldHVy
bjsKIAl9CiAKLQl2YWx1ZSB8PSAoYm8tPmlvdmEgPj4gMTApICYgMHgzZmZmZmY7CisJdmFsdWUg
fD0gKHN0YXRlLT5pb3ZhWzBdID4+IDEwKSAmIDB4M2ZmZmZmOwogCXRlZ3JhX2RjX3dyaXRlbChk
YywgdmFsdWUsIERDX0RJU1BfQ1VSU09SX1NUQVJUX0FERFIpOwogCiAjaWZkZWYgQ09ORklHX0FS
Q0hfRE1BX0FERFJfVF82NEJJVAotCXZhbHVlID0gKGJvLT5pb3ZhID4+IDMyKSAmIDB4MzsKKwl2
YWx1ZSA9IChzdGF0ZS0+aW92YVswXSA+PiAzMikgJiAweDM7CiAJdGVncmFfZGNfd3JpdGVsKGRj
LCB2YWx1ZSwgRENfRElTUF9DVVJTT1JfU1RBUlRfQUREUl9ISSk7CiAjZW5kaWYKIApAQCAtOTAy
LDcgKzkwMSw4IEBAIHN0YXRpYyB2b2lkIHRlZ3JhX2N1cnNvcl9hdG9taWNfdXBkYXRlKHN0cnVj
dCBkcm1fcGxhbmUgKnBsYW5lLAogCXRlZ3JhX2RjX3dyaXRlbChkYywgdmFsdWUsIERDX0RJU1Bf
QkxFTkRfQ1VSU09SX0NPTlRST0wpOwogCiAJLyogcG9zaXRpb24gdGhlIGN1cnNvciAqLwotCXZh
bHVlID0gKHN0YXRlLT5jcnRjX3kgJiAweDNmZmYpIDw8IDE2IHwgKHN0YXRlLT5jcnRjX3ggJiAw
eDNmZmYpOworCXZhbHVlID0gKHBsYW5lLT5zdGF0ZS0+Y3J0Y195ICYgMHgzZmZmKSA8PCAxNiB8
CisJCShwbGFuZS0+c3RhdGUtPmNydGNfeCAmIDB4M2ZmZik7CiAJdGVncmFfZGNfd3JpdGVsKGRj
LCB2YWx1ZSwgRENfRElTUF9DVVJTT1JfUE9TSVRJT04pOwogfQogCi0tIAoyLjIzLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B181E38B3
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C7E6E504;
	Thu, 24 Oct 2019 16:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D87E6E4D4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:46:25 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q130so3103407wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B2W0FUjPFjz/awt2KiXk3+qz+ONZRc0nBTwMiyV54YE=;
 b=rqH4GmvsLwBM+LGgTZtwPjtZT9wYTL1/VD8zs+/qjXLlYdcAQZCCJv1IbHtc2v1jjP
 bBcQaN8SrdyFoGipP50OSW6MDtKexHXafLMyJSQKCrI6L8NWYo24LPDF6vaYdsPA+U7X
 9gxSufSc+RJN/CuT8G7OklQIykFklOYyDmvD7NwHx2za6TCCHRvTJUltkiGXlnkPKQrQ
 Ite/hyGpq/cWCtmNFruoRYVp6f3Exq939rYyEOM1iYJYM/9rZyg5OnpJ6NLM/JYyerjX
 6+HAu2MgRJyCpaNh+Z7+74pqq7rrWk/qhmnwqQWBAH6749gbnuG+XpjlV2g5sEkPucRQ
 0jyQ==
X-Gm-Message-State: APjAAAWH2f/c+l5La8mM4BejkbPFCU0m6pojjib8NHJji0FwCbriUTcR
 PoQxxJDq/MH+WVwKVspkiBk=
X-Google-Smtp-Source: APXvYqxRLZqfWu7td7gUGEzqcirQWei2SphFbGYqxcMNzUSvJoh7xEu7DmzUZV66IsIrwU9mrFFljQ==
X-Received: by 2002:a05:600c:22ce:: with SMTP id
 14mr5564498wmg.71.1571935582454; 
 Thu, 24 Oct 2019 09:46:22 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id 1sm8264544wrr.16.2019.10.24.09.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:46:21 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 20/32] drm/tegra: sor: Filter eDP rates
Date: Thu, 24 Oct 2019 18:45:22 +0200
Message-Id: <20191024164534.132764-21-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B2W0FUjPFjz/awt2KiXk3+qz+ONZRc0nBTwMiyV54YE=;
 b=Q7lVozVpvsSTvFjEghbOMjRYPRm8HJdTP4vBJd8u6LuWruyy4l/JjXD0mDO4V75JPb
 KD4qjgDfkz4FRnzJEsFdApLQ88eHvMgjPcggfqoeb2GbHLH92tEzAvc8eQCzZru295bD
 svNytTmSU+TjO3HzO7H+MPF02EepoF1gMro+cttUch/03GmbLCH3OkeIYlSwYdZVKzdC
 42pTM4N0Ws0Y7AFWX5xNx6cFCyVw8e/iroQCQQeP5qg5nk9z+9Y7hW+zhjwfDVV3CPYG
 N4siyklA0c2LjZsT3j4EL4A1r4wsoEinLmljbD7PQVVLYWnEmIadE84Qz0Q5IkeJ9Qf+
 uUNw==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBTT1IgZm91bmQg
b24gVGVncmEgU29DcyBkb2VzIG5vdCBzdXBwb3J0IGFsbCB0aGUgcmF0ZXMgcG90ZW50aWFsbHkK
YWR2ZXJ0aXNlZCBieSBlRFAgMS40LiBNYWtlIHN1cmUgdGhhdCB0aGUgcmF0ZXMgdGhhdCBhcmUg
bm90IHN1cHBvcnRlZAphcmUgZmlsdGVyZWQgb3V0LgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBS
ZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvc29y
LmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDI2IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMgYi9k
cml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMKaW5kZXggMjAyMzI0NGFkMzI4Li45ZTZhMWFiN2Vm
NjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vdGVncmEvc29yLmMKQEAgLTYwNSw2ICs2MDUsMzAgQEAgc3RhdGljIHN0cnVjdCBj
bGsgKnRlZ3JhX2Nsa19zb3JfcGFkX3JlZ2lzdGVyKHN0cnVjdCB0ZWdyYV9zb3IgKnNvciwKIAly
ZXR1cm4gY2xrOwogfQogCitzdGF0aWMgdm9pZCB0ZWdyYV9zb3JfZmlsdGVyX3JhdGVzKHN0cnVj
dCB0ZWdyYV9zb3IgKnNvcikKK3sKKwlzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxpbmsgPSAmc29yLT5s
aW5rOworCXVuc2lnbmVkIGludCBpOworCisJLyogVGVncmEgb25seSBzdXBwb3J0cyBSQlIsIEhC
UiBhbmQgSEJSMiAqLworCWZvciAoaSA9IDA7IGkgPCBsaW5rLT5udW1fcmF0ZXM7IGkrKykgewor
CQlzd2l0Y2ggKGxpbmstPnJhdGVzW2ldKSB7CisJCWNhc2UgMTYyMDAwMDoKKwkJY2FzZSAyNzAw
MDAwOgorCQljYXNlIDU0MDAwMDA6CisJCQlicmVhazsKKworCQlkZWZhdWx0OgorCQkJRFJNX0RF
QlVHX0tNUygibGluayByYXRlICVsdSBrSHogbm90IHN1cHBvcnRlZFxuIiwKKwkJCQkgICAgICBs
aW5rLT5yYXRlc1tpXSk7CisJCQlsaW5rLT5yYXRlc1tpXSA9IDA7CisJCQlicmVhazsKKwkJfQor
CX0KKworCWRybV9kcF9saW5rX3VwZGF0ZV9yYXRlcyhsaW5rKTsKK30KKwogc3RhdGljIGludCB0
ZWdyYV9zb3JfcG93ZXJfdXBfbGFuZXMoc3RydWN0IHRlZ3JhX3NvciAqc29yLCB1bnNpZ25lZCBp
bnQgbGFuZXMpCiB7CiAJdW5zaWduZWQgbG9uZyB0aW1lb3V0OwpAQCAtMTg5Nyw2ICsxOTIxLDgg
QEAgc3RhdGljIHZvaWQgdGVncmFfc29yX2VkcF9lbmFibGUoc3RydWN0IGRybV9lbmNvZGVyICpl
bmNvZGVyKQogCWlmIChlcnIgPCAwKQogCQlkZXZfZXJyKHNvci0+ZGV2LCAiZmFpbGVkIHRvIHBy
b2JlIGVEUCBsaW5rOiAlZFxuIiwgZXJyKTsKIAorCXRlZ3JhX3Nvcl9maWx0ZXJfcmF0ZXMoc29y
KTsKKwogCWVyciA9IGRybV9kcF9saW5rX2Nob29zZSgmc29yLT5saW5rLCBtb2RlLCBpbmZvKTsK
IAlpZiAoZXJyIDwgMCkKIAkJZGV2X2Vycihzb3ItPmRldiwgImZhaWxlZCB0byBjaG9vc2UgbGlu
azogJWRcbiIsIGVycik7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==

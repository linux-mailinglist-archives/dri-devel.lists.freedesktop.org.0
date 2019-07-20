Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161626EE7E
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2019 10:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106D06E893;
	Sat, 20 Jul 2019 08:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4476E88A;
 Sat, 20 Jul 2019 08:45:55 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c9so23282276lfh.4;
 Sat, 20 Jul 2019 01:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DLIxb5xG1R1/AMn7Cxx7Gmv1fB7QRIbhWjnyMccdsgs=;
 b=mdUKUu3T05EuAYPEJ+7t8iU8F0qbw4OywDUQIHTQ6LOD/qWUBmByehQojOfWT4YqIz
 9K22d9rCkzh6ApJ0S32/76X9yZVI8LXpNZHtmwftdaDMiaH6hmwqhISa/6ZO0YqtZIAS
 owazu+fJFJliOw2DhtPGZrKBUCS21j1hCUaFtJ/R5ccnV6XFhDgK/A78oTyH3JYxCDwA
 hamuK2A1eLxdWhnZPmZL6WVuD7NsdER1zqckh6svV5s3F81fD54i8AqqW2dbZlzOtuf5
 Jl7SVc6A1HyO8XnBer5OxVMSDcekGQK1nSbzFi5GlM+6rGbLIGfAbnkIMu8yzz47vnD4
 RgfA==
X-Gm-Message-State: APjAAAUSjhmMUBWykSUzzIU/Dm0S6y9Tt+MjtB+33FEUbg6pboqUvtHk
 y7xN+vIOGeWl3Mj1Z7+4WaZ0wyrzYuU=
X-Google-Smtp-Source: APXvYqwNuyA0w/+CrxrmuWb8MbtKhoIw9BqxmpQl8svk9III6lWiHYVVNHxjUkd+TR3+0/0Qai58FQ==
X-Received: by 2002:ac2:5382:: with SMTP id g2mr25289409lfh.92.1563612353319; 
 Sat, 20 Jul 2019 01:45:53 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 o3sm5047022lfb.40.2019.07.20.01.45.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 20 Jul 2019 01:45:52 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	openchrome-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/via: add VIA_WAIT_ON()
Date: Sat, 20 Jul 2019 10:45:25 +0200
Message-Id: <20190720084527.12593-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190720084527.12593-1-sam@ravnborg.org>
References: <20190720084527.12593-1-sam@ravnborg.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DLIxb5xG1R1/AMn7Cxx7Gmv1fB7QRIbhWjnyMccdsgs=;
 b=M6YQwOtHxwTR0QGMSC1PCZvEqoZ6F40bLYP47IPQKadPckjY9/XTd0SlaU/+dV32Cl
 UQm2RecdFhp4jPTSbLhbTBd9MPiL++xEk/CkZ+XE8DPUH4Kc5Ggz9BHPgqxN8XPTYTGZ
 C6wJmS+fYaPdqXG9vMKqrRunJcdw8ewxKsrxX1xR3GK452zcug3Ty3AAJ75e6c0J0nZ/
 v4F4j3sLDbJk3Vgd2NYdc6HSN9rKmWTXYTuJQOjwGa6KI7Eyk/gqh2KmB9/ewFyJhQcB
 CHKaSKxdE1vR97gCafnpQYJiV94ecw0C5jv+yrN6SEzPTutaCwL/Ds2uyhPI84+sa+l+
 J+Ag==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Kevin Brace <kevinbrace@gmx.com>, Mike Marshall <hubcap@omnibond.com>,
 Ira Weiny <ira.weiny@intel.com>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VklBX1dBSVRfT04oKSBpcyBhIGRpcmVjdCBjb3B5IG9mIERSTV9XQUlUX09OKCkgZnJvbQpkcm1f
b3NfbGludXguaC4KVGhlIGNvcHkgaXMgbWFkZSBzbyB3ZSBjYW4gYXZvaWQgdGhlIGRlcGVuZGVu
Y3kgb24gdGhlIGxlZ2FjeSBoZWFkZXIuCkEgbW9yZSBpbnZvbHZlZCBhcHByb2FjaCBoYWQgYmVl
biB0byBpbnRyb2R1Y2Ugd2FpdF9ldmVudF8qIGJ1dCBmb3IgdGhpcwpsZWdhY3kgZHJpdmVyIHRo
ZSBzaW1wbGVyIGFuZCBtb3JlIHNhZmUgYXBwcm9hY2ggd2l0aCBhIGNvcHkgb2YgdGhlCm1hY3Jv
IHdhcyBzZWxlY3RlZC4KQWRkZWQgdGhlIHJlbGV2YW50IGhlYWRlciBmaWxlcyBmb3IgdGhlIGZ1
bmN0aW9ucyB1c2VkIGluIFZJQV9XQUlUX09OLgoKVXNlcnMgb2YgdGhlIG1hY3JvIHdpbGwgY29t
ZSBpbiBhIGZvbGxvdy11cCBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KQ2M6IEtldmluIEJyYWNlIDxrZXZpbmJyYWNlQGdteC5jb20+CkNjOiBU
aG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+CkNjOiAiR3VzdGF2byBBLiBS
LiBTaWx2YSIgPGd1c3Rhdm9AZW1iZWRkZWRvci5jb20+CkNjOiBNaWtlIE1hcnNoYWxsIDxodWJj
YXBAb21uaWJvbmQuY29tPgpDYzogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgpDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IEVtaWwgVmVsaWtvdiA8
ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CkNjOiBNaWNoZWwgRMOkbnplciA8bWljaGVsQGRh
ZW56ZXIubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2Rydi5oIHwgNDIgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpYS92
aWFfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kcnYuaAppbmRleCBkNWEyYjFmZmQ4
YzEuLjY2NGI3ZjhhMjBjNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZHJ2
LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZHJ2LmgKQEAgLTI0LDggKzI0LDEzIEBA
CiAjaWZuZGVmIF9WSUFfRFJWX0hfCiAjZGVmaW5lIF9WSUFfRFJWX0hfCiAKLSNpbmNsdWRlIDxk
cm0vZHJtX21tLmg+CisjaW5jbHVkZSA8bGludXgvamlmZmllcy5oPgorI2luY2x1ZGUgPGxpbnV4
L3NjaGVkLmg+CisjaW5jbHVkZSA8bGludXgvc2NoZWQvc2lnbmFsLmg+CisjaW5jbHVkZSA8bGlu
dXgvd2FpdC5oPgorCiAjaW5jbHVkZSA8ZHJtL2RybV9sZWdhY3kuaD4KKyNpbmNsdWRlIDxkcm0v
ZHJtX21tLmg+CiAKICNkZWZpbmUgRFJJVkVSX0FVVEhPUgkiVmFyaW91cyIKIApAQCAtMTI3LDYg
KzEzMiw0MSBAQCBlbnVtIHZpYV9mYW1pbHkgewogI2RlZmluZSBWSUFfV1JJVEU4KHJlZywgdmFs
KSBcCiAJd3JpdGViKHZhbCwgKCh2b2lkIF9faW9tZW0gKilWSUFfQkFTRS0+aGFuZGxlKSArIChy
ZWcpKQogCisvKgorICogUG9sbCBpbiBhIGxvb3Agd2FpdGluZyBmb3IgJ2NvbnRpZGl0aW9uJyB0
byBiZSB0cnVlLgorICogTm90ZTogQSBkaXJlY3QgcmVwbGFjZW1lbnQgd2l0aCB3YWl0X2V2ZW50
X2ludGVycnVwdGlibGVfdGltZW91dCgpCisgKiAgICAgICB3aWxsIG5vdCB3b3JrIHVubGVzcyBk
cml2ZXIgaXMgdXBkYXRlZCB0byBlbWl0IHdha2VfdXAoKQorICogICAgICAgaW4gcmVsZXZhbnQg
cGxhY2VzIHRoYXQgY2FuIGltcGFjdCB0aGUgJ2NvbmRpdGlvbicKKyAqCisgKiBSZXR1cm5zOgor
ICogICByZXQga2VlcHMgY3VycmVudCB2YWx1ZSBpZiAnY29uZGl0aW9uJyBiZWNvbWVzIHRydWUK
KyAqICAgcmV0ID0gLUJVU1kgaWYgdGltZW91dCBoYXBwZW5zCisgKiAgIHJldCA9IC1FSU5UUiBp
ZiBhIHNpZ25hbCBpbnRlcnJ1cHRlZCB0aGUgd2FpdGluZyBwZXJpb2QKKyAqLworI2RlZmluZSBW
SUFfV0FJVF9PTiggcmV0LCBxdWV1ZSwgdGltZW91dCwgY29uZGl0aW9uICkJCVwKK2RvIHsJCQkJ
CQkJCVwKKwlERUNMQVJFX1dBSVRRVUVVRShlbnRyeSwgY3VycmVudCk7CQkJXAorCXVuc2lnbmVk
IGxvbmcgZW5kID0gamlmZmllcyArICh0aW1lb3V0KTsJCVwKKwlhZGRfd2FpdF9xdWV1ZSgmKHF1
ZXVlKSwgJmVudHJ5KTsJCQlcCisJCQkJCQkJCVwKKwlmb3IgKDs7KSB7CQkJCQkJXAorCQlfX3Nl
dF9jdXJyZW50X3N0YXRlKFRBU0tfSU5URVJSVVBUSUJMRSk7CVwKKwkJaWYgKGNvbmRpdGlvbikJ
CQkJCVwKKwkJCWJyZWFrOwkJCQkJXAorCQlpZiAodGltZV9hZnRlcl9lcShqaWZmaWVzLCBlbmQp
KSB7CQlcCisJCQlyZXQgPSAtRUJVU1k7CQkJCVwKKwkJCWJyZWFrOwkJCQkJXAorCQl9CQkJCQkJ
XAorCQlzY2hlZHVsZV90aW1lb3V0KChIWi8xMDAgPiAxKSA/IEhaLzEwMCA6IDEpOwlcCisJCWlm
IChzaWduYWxfcGVuZGluZyhjdXJyZW50KSkgewkJCVwKKwkJCXJldCA9IC1FSU5UUjsJCQkJXAor
CQkJYnJlYWs7CQkJCQlcCisJCX0JCQkJCQlcCisJfQkJCQkJCQlcCisJX19zZXRfY3VycmVudF9z
dGF0ZShUQVNLX1JVTk5JTkcpOwkJCVwKKwlyZW1vdmVfd2FpdF9xdWV1ZSgmKHF1ZXVlKSwgJmVu
dHJ5KTsJCQlcCit9IHdoaWxlICgwKQorCiBleHRlcm4gY29uc3Qgc3RydWN0IGRybV9pb2N0bF9k
ZXNjIHZpYV9pb2N0bHNbXTsKIGV4dGVybiBpbnQgdmlhX21heF9pb2N0bDsKIAotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0AC8E08E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 00:16:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174ED6E868;
	Wed, 14 Aug 2019 22:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4248F6E867;
 Wed, 14 Aug 2019 22:16:05 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id m9so227244pls.8;
 Wed, 14 Aug 2019 15:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aWZa5dI2NRu6gHtKDFpC6w867E//TeA8xW/o66+S8bg=;
 b=AwGRftSJsPehWZ/yygEof7Oo4LRx44TW0h5FtjXfjuJ8/znwzRfBIFtYR4amZqBbfb
 gVAQZJdK1wF/zfTFk4jsUETZLHj+klsrfdbdSpvGbdtVLjLzoRJ6Tk3OZyvw+TMOy+cY
 YDopitB1IAtyvFwdShHGvxTIpHh46Cekdz7wcx9I2MmFqf1zCUXcchLd+Y6QbcMcIaAg
 ZtRng5c2wEF8zuMwJCRvR2Trzw4FhNnq35vWBIGdc7xXGVTcEEt8X2UT2XKUUn09H+Zs
 sKgk8Iw4p0K7AuHN90Uq12RUz6PhZeK28nnf3xctz0Qk7Dl3D13xmpDwENe4dA7hRWJC
 /rcA==
X-Gm-Message-State: APjAAAXVuNCKw6SSZfVYTshy8ZR9tAnzFG6o5feyP3naoCkAGzUUEayr
 McTU1D4QIySle2TTWLwkW9wIgm5BIpUOUA==
X-Google-Smtp-Source: APXvYqx4wiJg+kMGqoXbIWyLQISiWCqIYOJbh2AH50z72sXIlWDah+Rb8L65s8HhZIIA59tPKBJUVQ==
X-Received: by 2002:a17:902:7b98:: with SMTP id
 w24mr1427925pll.163.1565820964515; 
 Wed, 14 Aug 2019 15:16:04 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id h195sm898264pfe.20.2019.08.14.15.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 15:16:03 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/6] drm/msm: stop abusing DMA API
Date: Wed, 14 Aug 2019 15:00:00 -0700
Message-Id: <20190814220011.26934-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814220011.26934-1-robdclark@gmail.com>
References: <20190814220011.26934-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aWZa5dI2NRu6gHtKDFpC6w867E//TeA8xW/o66+S8bg=;
 b=qBzDnv5WoEcN49Ehx8P57UUIl8oz7j6r5pJKgnDJkq/9i9JcNFNlrzIJlKHWe0bVRt
 4VBrMBdIbbnWB3gueEj7YeclzU2RJJXWdDrjarGuiAi3yGBXO6hOIc/73O+CR0EEZ18j
 9qYE5DRvKuLxLJS5XTXrqrVimdgbiJ5oL4pT1EgYOIBf4Uk/wyznzvDd2xw7B37Kc0oC
 s3TwkOyd7vs6FnLVXfUQjsu4evDIWT81CEpi2WiJ5eRKyJxqRsZkpbQ1qBC6iD8EQNBn
 lmB30rOH8gpS3p5romApm2kcDjm6u1DOklnmxABYn6kLbJj0nD5JyU9qyX3Yfs7sDosV
 x9xA==
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVXNlIGFyY2hfc3luY19k
bWFfZm9yX3tkZXZpY2UsY3B1fSgpIHJhdGhlciB0aGFuIGFidXNpbmcgdGhlIERNQSBBUEkgdG8K
aW5kaXJlY3RseSBnZXQgYXQgdGhlIGFyY2hfc3luY19kbWEgY29kZS4KClNpZ25lZC1vZmYtYnk6
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9nZW0uYyB8IDM3ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L21zbV9nZW0uYwppbmRleCA4Y2Y2MzYyZTY0YmYuLmEyNjExZTYyZGYxOSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fZ2VtLmMKQEAgLTcsNiArNyw3IEBACiAjaW5jbHVkZSA8bGludXgvc3BpbmxvY2suaD4KICNp
bmNsdWRlIDxsaW51eC9zaG1lbV9mcy5oPgogI2luY2x1ZGUgPGxpbnV4L2RtYS1idWYuaD4KKyNp
bmNsdWRlIDxsaW51eC9kbWEtbm9uY29oZXJlbnQuaD4KICNpbmNsdWRlIDxsaW51eC9wZm5fdC5o
PgogCiAjaW5jbHVkZSAibXNtX2Rydi5oIgpAQCAtMzIsNDMgKzMzLDI3IEBAIHN0YXRpYyBib29s
IHVzZV9wYWdlcyhzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKIAlyZXR1cm4gIW1zbV9vYmot
PnZyYW1fbm9kZTsKIH0KIAotLyoKLSAqIENhY2hlIHN5bmMuLiB0aGlzIGlzIGEgYml0IG92ZXIt
Y29tcGxpY2F0ZWQsIHRvIGZpdCBkbWEtbWFwcGluZwotICogQVBJLiAgUmVhbGx5IEdQVSBjYWNo
ZSBpcyBvdXQgb2Ygc2NvcGUgaGVyZSAoaGFuZGxlZCBvbiBjbWRzdHJlYW0pCi0gKiBhbmQgYWxs
IHdlIG5lZWQgdG8gZG8gaXMgaW52YWxpZGF0ZSBuZXdseSBhbGxvY2F0ZWQgcGFnZXMgYmVmb3Jl
Ci0gKiBtYXBwaW5nIHRvIENQVSBhcyB1bmNhY2hlZC93cml0ZWNvbWJpbmUuCi0gKgotICogT24g
dG9wIG9mIHRoaXMsIHdlIGhhdmUgdGhlIGFkZGVkIGhlYWRhY2hlLCB0aGF0IGRlcGVuZGluZyBv
bgotICogZGlzcGxheSBnZW5lcmF0aW9uLCB0aGUgZGlzcGxheSdzIGlvbW11IG1heSBiZSB3aXJl
ZCB1cCB0byBlaXRoZXIKLSAqIHRoZSB0b3BsZXZlbCBkcm0gZGV2aWNlIChtZHNzKSwgb3IgdG8g
dGhlIG1kcCBzdWItbm9kZSwgbWVhbmluZwotICogdGhhdCBoZXJlIHdlIGVpdGhlciBoYXZlIGRt
YS1kaXJlY3Qgb3IgaW9tbXUgb3BzLgotICoKLSAqIExldCB0aGlzIGJlIGEgY2F1dGlvbmFyeSB0
YWlsIG9mIGFic3RyYWN0aW9uIGdvbmUgd3JvbmcuCi0gKi8KLQogc3RhdGljIHZvaWQgc3luY19m
b3JfZGV2aWNlKHN0cnVjdCBtc21fZ2VtX29iamVjdCAqbXNtX29iaikKIHsKIAlzdHJ1Y3QgZGV2
aWNlICpkZXYgPSBtc21fb2JqLT5iYXNlLmRldi0+ZGV2OworCXN0cnVjdCBzY2F0dGVybGlzdCAq
c2c7CisJaW50IGk7CiAKLQlpZiAoZ2V0X2RtYV9vcHMoZGV2KSkgewotCQlkbWFfc3luY19zZ19m
b3JfZGV2aWNlKGRldiwgbXNtX29iai0+c2d0LT5zZ2wsCi0JCQltc21fb2JqLT5zZ3QtPm5lbnRz
LCBETUFfQklESVJFQ1RJT05BTCk7Ci0JfSBlbHNlIHsKLQkJZG1hX21hcF9zZyhkZXYsIG1zbV9v
YmotPnNndC0+c2dsLAotCQkJbXNtX29iai0+c2d0LT5uZW50cywgRE1BX0JJRElSRUNUSU9OQUwp
OworCWZvcl9lYWNoX3NnKG1zbV9vYmotPnNndC0+c2dsLCBzZywgbXNtX29iai0+c2d0LT5uZW50
cywgaSkgeworCQlhcmNoX3N5bmNfZG1hX2Zvcl9kZXZpY2UoZGV2LCBzZ19waHlzKHNnKSwgc2ct
Pmxlbmd0aCwKKwkJCQlETUFfQklESVJFQ1RJT05BTCk7CiAJfQogfQogCiBzdGF0aWMgdm9pZCBz
eW5jX2Zvcl9jcHUoc3RydWN0IG1zbV9nZW1fb2JqZWN0ICptc21fb2JqKQogewogCXN0cnVjdCBk
ZXZpY2UgKmRldiA9IG1zbV9vYmotPmJhc2UuZGV2LT5kZXY7CisJc3RydWN0IHNjYXR0ZXJsaXN0
ICpzZzsKKwlpbnQgaTsKIAotCWlmIChnZXRfZG1hX29wcyhkZXYpKSB7Ci0JCWRtYV9zeW5jX3Nn
X2Zvcl9jcHUoZGV2LCBtc21fb2JqLT5zZ3QtPnNnbCwKLQkJCW1zbV9vYmotPnNndC0+bmVudHMs
IERNQV9CSURJUkVDVElPTkFMKTsKLQl9IGVsc2UgewotCQlkbWFfdW5tYXBfc2coZGV2LCBtc21f
b2JqLT5zZ3QtPnNnbCwKLQkJCW1zbV9vYmotPnNndC0+bmVudHMsIERNQV9CSURJUkVDVElPTkFM
KTsKKwlmb3JfZWFjaF9zZyhtc21fb2JqLT5zZ3QtPnNnbCwgc2csIG1zbV9vYmotPnNndC0+bmVu
dHMsIGkpIHsKKwkJYXJjaF9zeW5jX2RtYV9mb3JfY3B1KGRldiwgc2dfcGh5cyhzZyksIHNnLT5s
ZW5ndGgsCisJCQkJRE1BX0JJRElSRUNUSU9OQUwpOwogCX0KIH0KIAotLSAKMi4yMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4D33809D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 00:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 664DD899F2;
	Thu,  6 Jun 2019 22:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05043899E8
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 22:28:07 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p26so5574353edr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 15:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JcC10ZyoZDavWbmDXKEQr+W/p2OzkIC6q2jW3fuhNlA=;
 b=CT8l3HLG4IPAThrjR9W1FlaY+yog/lMVqZY7QKyLmjkYQBL/e+iPbFHemgk9d5XorH
 zIWY079njwOreiIIjxnxBn6TC3A81es85MIT8k3+DJPjWgtRAfPkFZz8vkHuTvJb8UMy
 XUt9ogPXm6vubWrJHQxu2vMoe6n9pgnIHBOCgXE0oJ8IEopkq5Qe6aeT+J9Ali7YZBRq
 4uHMgJ33K+i9GfkMcYvTLxzxez3oGmF2B+nQcKGdMPz3qv6FK70I+0hPDpsmjhGO7/X5
 U5RkeR1rR+iIlKJ9w4iAH1zQT6MEz0bpSG6BJrNPyyaPVwgs1NNhV3A+mcGp7hdCXlyn
 yH0g==
X-Gm-Message-State: APjAAAXRMryOhR7p1vBJpUBHpC6GhIdGdXIL6Z52eXiUnjUbcIeeemZt
 wFjXNeLhMO6Oydig8lTs1yMDgJkyVNE=
X-Google-Smtp-Source: APXvYqymlEsL/nDKLYS4y8FANG1/CQzU63z6G7ewhxBdVhtYhDrm0O+3b6R/2PGZM77SnRn7S+Nqlw==
X-Received: by 2002:a17:906:63c1:: with SMTP id
 u1mr43566484ejk.173.1559860085411; 
 Thu, 06 Jun 2019 15:28:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z10sm54228edl.35.2019.06.06.15.28.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 15:28:04 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/10] drm/vkms: Move format arrays to vkms_plane.c
Date: Fri,  7 Jun 2019 00:27:45 +0200
Message-Id: <20190606222751.32567-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JcC10ZyoZDavWbmDXKEQr+W/p2OzkIC6q2jW3fuhNlA=;
 b=hsAlW3OsRIjOtrES24cBdupyQ7buKf+X4op5wHPbYg/xTZntZsTtqarOblvbEZblN1
 lyjwJL/+G0zETnrwbEyv4UpB4aFnUnxr/VdN7JUisgqqFRw9cfOFbW34kd1w5npoQ9zU
 xW1jYHZav6Wa4EZiNJo5H6F+gucumNJWw/f6E=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm8gbmVlZCB0byBoYXZlIHRoZW0gbXVsdGlwbGUgdGltZXMuCgpTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IFJvZHJpZ28gU2lxdWVpcmEg
PHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21haWwuY29tPgpDYzogSGFuZWVuIE1vaGFtbWVkIDxoYW1v
aGFtbWVkLnNhQGdtYWlsLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5oICAgfCA4IC0tLS0tLS0tCiBkcml2
ZXJzL2dwdS9kcm0vdmttcy92a21zX3BsYW5lLmMgfCA4ICsrKysrKysrCiAyIGZpbGVzIGNoYW5n
ZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdmttcy92a21zX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19kcnYu
aAppbmRleCA0M2QzZjk4Mjg5ZmUuLjJhMzUyOTliZmI4OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3ZrbXMvdmttc19kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2Ry
di5oCkBAIC0yMCwxNCArMjAsNiBAQAogCiBleHRlcm4gYm9vbCBlbmFibGVfY3Vyc29yOwogCi1z
dGF0aWMgY29uc3QgdTMyIHZrbXNfZm9ybWF0c1tdID0gewotCURSTV9GT1JNQVRfWFJHQjg4ODgs
Ci19OwotCi1zdGF0aWMgY29uc3QgdTMyIHZrbXNfY3Vyc29yX2Zvcm1hdHNbXSA9IHsKLQlEUk1f
Rk9STUFUX0FSR0I4ODg4LAotfTsKLQogc3RydWN0IHZrbXNfY3JjX2RhdGEgewogCXN0cnVjdCBk
cm1fZnJhbWVidWZmZXIgZmI7CiAJc3RydWN0IGRybV9yZWN0IHNyYywgZHN0OwpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJtL3Zr
bXMvdmttc19wbGFuZS5jCmluZGV4IDBlNjdkMmQ0MmYwYy4uMGZjZWI2MjU4NDIyIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3ZrbXMvdmttc19wbGFuZS5jCkBAIC02LDYgKzYsMTQgQEAKICNpbmNsdWRlIDxkcm0vZHJt
X2F0b21pY19oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9mcmFtZWJ1ZmZlcl9oZWxw
ZXIuaD4KIAorc3RhdGljIGNvbnN0IHUzMiB2a21zX2Zvcm1hdHNbXSA9IHsKKwlEUk1fRk9STUFU
X1hSR0I4ODg4LAorfTsKKworc3RhdGljIGNvbnN0IHUzMiB2a21zX2N1cnNvcl9mb3JtYXRzW10g
PSB7CisJRFJNX0ZPUk1BVF9BUkdCODg4OCwKK307CisKIHN0YXRpYyBzdHJ1Y3QgZHJtX3BsYW5l
X3N0YXRlICoKIHZrbXNfcGxhbmVfZHVwbGljYXRlX3N0YXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBs
YW5lKQogewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=

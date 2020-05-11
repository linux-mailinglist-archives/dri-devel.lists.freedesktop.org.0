Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E331CD55B
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 11:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 137B76E422;
	Mon, 11 May 2020 09:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69BC66E421
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 09:36:10 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id k12so17253631wmj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 02:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jiEqWmvJIvSHgBKn6ifo7dJfIKkXuCXmPLyNt/uHVFw=;
 b=gWwhijgLuPTS+8nLzRuo0lamqr8cs5BEdGK+qadCGO1c6oXTh8zhJNQLm9Ax84uaAV
 5vZAfLwnv9AH2FpjefgCnq0CWKfP41C85oiyP+3qzN6P63cBJTes5h4qgbUNhTzwKQYj
 xm7Ha+UI4mb2GNtbmCdDfmxF5nTQ5+PjQVh0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jiEqWmvJIvSHgBKn6ifo7dJfIKkXuCXmPLyNt/uHVFw=;
 b=Kg2bHhhBQ3OROha2Fqg+FN/gsLvRtkuXg3O1AeE+VjeTKMksVhnscQRPgSiHkrBlNf
 aE8L8oel+DDQplw4cTsaGWnujAlvRjAZqghi+17Ks+3k3c1q6l/t8R9Q2sAHS3N5KN4n
 ErUbcYULtJYs5vfye+LANhX5t8AksYEoOjM9ETbuoKpkGQQNWSxTb2sk+zaz97ABIQPk
 lxTLUmxgynkatz9eJY8ke1KadZGG8+9vMaVnzULpzo162WJky3oRyf/5Xe9nLaZQAAUd
 gUGpzlmk8EPyRVYBUew3Eqk5W3PL33OyLFZ75xeAfO0FNfrrIXW7rdic/Do7Z2DPASSj
 0AOQ==
X-Gm-Message-State: AGi0PuZil/93E8urr6wiU/P+5Yy9mQ5kCwyfFT1tqyJakaGlBFOHOrmI
 vFj2A9X5tWoYRrycb5T/gEjWifr5L+M=
X-Google-Smtp-Source: APiQypLZA00N1dW8ljSoZlkr+fGgqdXLM+TiFQYvagUpwQkJupGh4RaE4rHmlpkYfRAkx45/ojvw1g==
X-Received: by 2002:a1c:5502:: with SMTP id j2mr32498550wmb.56.1589189768830; 
 Mon, 11 May 2020 02:36:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q17sm9013945wmk.36.2020.05.11.02.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 02:36:08 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 8/9] drm/shmem-helpers: Ensure get_pages is not called on
 imported dma-buf
Date: Mon, 11 May 2020 11:35:53 +0200
Message-Id: <20200511093554.211493-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBhIGJpdCBvZiBsaWdodCBwYXJhbm9pYS4gQWxzbyBzcHJpbmtsZSB0aGlzIGNoZWNrIG92
ZXIKZHJtX2dlbV9zaG1lbV9nZXRfc2dfdGFibGUsIHdoaWNoIHNob3VsZCBvbmx5IGJlIGNhbGxl
ZCB3aGVuCmV4cG9ydGluZywgc2FtZSBmb3IgdGhlIHBpbi91bnBpbiBmdW5jdGlvbnMsIG9uIHdo
aWNoIGl0IHJlbGllcyB0bwp3b3JrIGNvcnJlY3RseS4KCkNjOiBHZXJkIEhvZmZtYW5uIDxrcmF4
ZWxAcmVkaGF0LmNvbT4KQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CkNjOiBOb3Jh
bGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW1fc2htZW1faGVscGVyLmMgfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKaW5kZXggMTE3
YTc4NDFlMjg0Li5mNzAxMTMzODgxM2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX3NobWVtX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVtX2hl
bHBlci5jCkBAIC0xNzAsNiArMTcwLDggQEAgaW50IGRybV9nZW1fc2htZW1fZ2V0X3BhZ2VzKHN0
cnVjdCBkcm1fZ2VtX3NobWVtX29iamVjdCAqc2htZW0pCiB7CiAJaW50IHJldDsKIAorCVdBUk5f
T04oc2htZW0tPmJhc2UuaW1wb3J0X2F0dGFjaCk7CisKIAlyZXQgPSBtdXRleF9sb2NrX2ludGVy
cnVwdGlibGUoJnNobWVtLT5wYWdlc19sb2NrKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwpA
QCAtMjI1LDYgKzIyNyw4IEBAIGludCBkcm1fZ2VtX3NobWVtX3BpbihzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iaikKIHsKIAlzdHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QgKnNobWVtID0gdG9f
ZHJtX2dlbV9zaG1lbV9vYmoob2JqKTsKIAorCVdBUk5fT04oc2htZW0tPmJhc2UuaW1wb3J0X2F0
dGFjaCk7CisKIAlyZXR1cm4gZHJtX2dlbV9zaG1lbV9nZXRfcGFnZXMoc2htZW0pOwogfQogRVhQ
T1JUX1NZTUJPTChkcm1fZ2VtX3NobWVtX3Bpbik7CkBAIC0yNDAsNiArMjQ0LDggQEAgdm9pZCBk
cm1fZ2VtX3NobWVtX3VucGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKQogewogCXN0cnVj
dCBkcm1fZ2VtX3NobWVtX29iamVjdCAqc2htZW0gPSB0b19kcm1fZ2VtX3NobWVtX29iaihvYmop
OwogCisJV0FSTl9PTihzaG1lbS0+YmFzZS5pbXBvcnRfYXR0YWNoKTsKKwogCWRybV9nZW1fc2ht
ZW1fcHV0X3BhZ2VzKHNobWVtKTsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2dlbV9zaG1lbV91bnBp
bik7CkBAIC01MTAsNiArNTE2LDggQEAgc3RhdGljIHZvaWQgZHJtX2dlbV9zaG1lbV92bV9vcGVu
KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCXN0cnVjdCBkcm1fZ2VtX3NobWVtX29iamVj
dCAqc2htZW0gPSB0b19kcm1fZ2VtX3NobWVtX29iaihvYmopOwogCWludCByZXQ7CiAKKwlXQVJO
X09OKHNobWVtLT5iYXNlLmltcG9ydF9hdHRhY2gpOworCiAJcmV0ID0gZHJtX2dlbV9zaG1lbV9n
ZXRfcGFnZXMoc2htZW0pOwogCVdBUk5fT05fT05DRShyZXQgIT0gMCk7CiAKQEAgLTYxMSw2ICs2
MTksOCBAQCBzdHJ1Y3Qgc2dfdGFibGUgKmRybV9nZW1fc2htZW1fZ2V0X3NnX3RhYmxlKHN0cnVj
dCBkcm1fZ2VtX29iamVjdCAqb2JqKQogewogCXN0cnVjdCBkcm1fZ2VtX3NobWVtX29iamVjdCAq
c2htZW0gPSB0b19kcm1fZ2VtX3NobWVtX29iaihvYmopOwogCisJV0FSTl9PTihzaG1lbS0+YmFz
ZS5pbXBvcnRfYXR0YWNoKTsKKwogCXJldHVybiBkcm1fcHJpbWVfcGFnZXNfdG9fc2coc2htZW0t
PnBhZ2VzLCBvYmotPnNpemUgPj4gUEFHRV9TSElGVCk7CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChk
cm1fZ2VtX3NobWVtX2dldF9zZ190YWJsZSk7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

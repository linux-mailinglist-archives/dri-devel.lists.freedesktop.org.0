Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1467C063F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 15:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECC76E09E;
	Fri, 27 Sep 2019 13:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16A476E07B;
 Fri, 27 Sep 2019 13:25:01 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id y21so6184204wmi.0;
 Fri, 27 Sep 2019 06:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PwNDIPDY2oKs3xrzZ+xUYN+WsNBz/04hGM9/C6T63AE=;
 b=Jjv/el3okAG94J3DfhIxWFvIq8oYFrKlcRxeCxI/wg0qGFBFnCV1yX4Vsnq/GNHKVO
 S0ZSINWPfUiDBtjAGJqJc/CP1LvO5KAQ4jdafntBYVaEljroE8PywqIxN7TTm37F1Yyb
 2IXvCvzmfvaxHKHWA8Oln4opZmKC0w6h9B4twSG4oFJrb27BQFVkkjRpDmA9OTw6XqNv
 x2UYl9wXhXj7ybITU0kRcJK3HgnX+g27mPXlQm2xaxgeF3jdKR1pKz1ZS0z5X9bgYMRP
 Y9T06W0w7s6T0GJGUWVPfD+I5ESHVuH7M/rpd8QwVzrKW5sgryExxKf3ZH8eBB2jLiKx
 0uxg==
X-Gm-Message-State: APjAAAVCOZPgaS3PPUtEyN11Q4lD7BnrssYFml38MHh8ink6eq01/H1D
 3ef0jBDNoA+edKszlZDniHw=
X-Google-Smtp-Source: APXvYqwyCNlKENrB2ladvwGe436qNQLkMeG4OCH4lPvGCuv7KPls7uPKYhO0ceX900iBjDMyRvnq7Q==
X-Received: by 2002:a1c:e916:: with SMTP id q22mr7256946wmc.15.1569590699737; 
 Fri, 27 Sep 2019 06:24:59 -0700 (PDT)
Received: from baker.fritz.box ([2a02:908:1252:fb60:2d04:d861:e9c6:56ab])
 by smtp.gmail.com with ESMTPSA id z3sm4917181wmi.30.2019.09.27.06.24.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 06:24:59 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: airlied@redhat.com, kraxel@redhat.com, daniel@ffwll.ch,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/qxl: stop abusing TTM to call driver internal
 functions
Date: Fri, 27 Sep 2019 15:24:57 +0200
Message-Id: <20190927132458.4359-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PwNDIPDY2oKs3xrzZ+xUYN+WsNBz/04hGM9/C6T63AE=;
 b=bMiuKYnnvWNOCw9rAU3HuUAmLPzuOyUw1PQf7twiEb/ocLlGT7mXuIBChDdV6RERnG
 qlDJwq2BjjZWZJ/0d4r0rhF5E43it8h6kmIcRPs8DVmblfrVTFDZPbpmDffYibGTKEnp
 zKnu8XR5W486LaQavGo7aMSzC6S6jsp98gbfApKZ9SRGuzB64h+trMvkPBSYgQGTlLIC
 cg8zJblfzIDITJU/jhLFfKzk3GixXGRYtRD3306wa3hLigBqNRSNplLQDGxhGYHxXuju
 h9VMvpbaw2uAAo80PZtn+ZN3AE+koBpdufFq5o5x8ZdBJsjHQBivoaIDEyvJpVqQnqIr
 II2g==
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

VGhlIHR0bV9tZW1faW9fKiBmdW5jdGlvbnMgYXJlIGFjdHVhbGx5IGludGVybmFsIHRvIFRUTSBh
bmQgc2hvdWxkbid0IGJlCnVzZWQgaW4gYSBkcml2ZXIuCgpJbnN0ZWFkIGNhbGwgdGhlIHF4bF90
dG1faW9fbWVtX3Jlc2VydmUoKSBmdW5jdGlvbiBkaXJlY3RseS4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vcXhsL3F4bF9kcnYuaCAgICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9v
YmplY3QuYyB8IDExICstLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYyAg
ICB8ICA0ICsrLS0KIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaCBiL2RyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5oCmluZGV4IDllMDM0YzVmYTg3ZC4uOGEyNGY4ZTEwMWRh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vcXhsL3F4bF9kcnYuaApAQCAtMzU0LDYgKzM1NCw4IEBAIGludCBxeGxfbW9kZV9k
dW1iX21tYXAoc3RydWN0IGRybV9maWxlICpmaWxwLAogLyogcXhsIHR0bSAqLwogaW50IHF4bF90
dG1faW5pdChzdHJ1Y3QgcXhsX2RldmljZSAqcWRldik7CiB2b2lkIHF4bF90dG1fZmluaShzdHJ1
Y3QgcXhsX2RldmljZSAqcWRldik7CitpbnQgcXhsX3R0bV9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3Qg
dHRtX2JvX2RldmljZSAqYmRldiwKKwkJCSAgIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKTsKIGlu
dCBxeGxfbW1hcChzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEp
OwogCiAvKiBxeGwgaW1hZ2UgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMKaW5kZXggNTQ4ZGZl
NmYzYjI2Li4yOTllNjNhOTUxYzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jCkBAIC0xNDgs
NyArMTQ4LDYgQEAgaW50IHF4bF9ib19rbWFwKHN0cnVjdCBxeGxfYm8gKmJvLCB2b2lkICoqcHRy
KQogdm9pZCAqcXhsX2JvX2ttYXBfYXRvbWljX3BhZ2Uoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYs
CiAJCQkgICAgICBzdHJ1Y3QgcXhsX2JvICpibywgaW50IHBhZ2Vfb2Zmc2V0KQogewotCXN0cnVj
dCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuID0gJmJvLT50Ym8uYmRldi0+bWFuW2JvLT50Ym8u
bWVtLm1lbV90eXBlXTsKIAl2b2lkICpycHRyOwogCWludCByZXQ7CiAJc3RydWN0IGlvX21hcHBp
bmcgKm1hcDsKQEAgLTE2MCw5ICsxNTksNyBAQCB2b2lkICpxeGxfYm9fa21hcF9hdG9taWNfcGFn
ZShzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiwKIAllbHNlCiAJCWdvdG8gZmFsbGJhY2s7CiAKLQko
dm9pZCkgdHRtX21lbV9pb19sb2NrKG1hbiwgZmFsc2UpOwotCXJldCA9IHR0bV9tZW1faW9fcmVz
ZXJ2ZShiby0+dGJvLmJkZXYsICZiby0+dGJvLm1lbSk7Ci0JdHRtX21lbV9pb191bmxvY2sobWFu
KTsKKwlyZXQgPSBxeGxfdHRtX2lvX21lbV9yZXNlcnZlKGJvLT50Ym8uYmRldiwgJmJvLT50Ym8u
bWVtKTsKIAogCXJldHVybiBpb19tYXBwaW5nX21hcF9hdG9taWNfd2MobWFwLCBiby0+dGJvLm1l
bS5idXMub2Zmc2V0ICsgcGFnZV9vZmZzZXQpOwogZmFsbGJhY2s6CkBAIC0xOTMsMTcgKzE5MCwx
MSBAQCB2b2lkIHF4bF9ib19rdW5tYXAoc3RydWN0IHF4bF9ibyAqYm8pCiB2b2lkIHF4bF9ib19r
dW5tYXBfYXRvbWljX3BhZ2Uoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYsCiAJCQkgICAgICAgc3Ry
dWN0IHF4bF9ibyAqYm8sIHZvaWQgKnBtYXApCiB7Ci0Jc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5h
Z2VyICptYW4gPSAmYm8tPnRiby5iZGV2LT5tYW5bYm8tPnRiby5tZW0ubWVtX3R5cGVdOwotCiAJ
aWYgKChiby0+dGJvLm1lbS5tZW1fdHlwZSAhPSBUVE1fUExfVlJBTSkgJiYKIAkgICAgKGJvLT50
Ym8ubWVtLm1lbV90eXBlICE9IFRUTV9QTF9QUklWKSkKIAkJZ290byBmYWxsYmFjazsKIAogCWlv
X21hcHBpbmdfdW5tYXBfYXRvbWljKHBtYXApOwotCi0JKHZvaWQpIHR0bV9tZW1faW9fbG9jayht
YW4sIGZhbHNlKTsKLQl0dG1fbWVtX2lvX2ZyZWUoYm8tPnRiby5iZGV2LCAmYm8tPnRiby5tZW0p
OwotCXR0bV9tZW1faW9fdW5sb2NrKG1hbik7CiAJcmV0dXJuOwogIGZhbGxiYWNrOgogCXF4bF9i
b19rdW5tYXAoYm8pOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYwppbmRleCA5YjI0NTE0Yzc1YWEuLmNiODBl
NTEyZGQ0NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMKQEAgLTE1OSw4ICsxNTksOCBAQCBzdGF0aWMg
aW50IHF4bF92ZXJpZnlfYWNjZXNzKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIHN0cnVj
dCBmaWxlICpmaWxwKQogCQkJCQkgIGZpbHAtPnByaXZhdGVfZGF0YSk7CiB9CiAKLXN0YXRpYyBp
bnQgcXhsX3R0bV9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKLQkJ
CQkgIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKQoraW50IHF4bF90dG1faW9fbWVtX3Jlc2VydmUo
c3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCisJCQkgICBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1l
bSkKIHsKIAlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiA9ICZiZGV2LT5tYW5bbWVt
LT5tZW1fdHlwZV07CiAJc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYgPSBxeGxfZ2V0X3FkZXYoYmRl
dik7Ci0tIAoyLjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==

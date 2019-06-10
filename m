Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AADC3BA35
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 18:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8779E8903B;
	Mon, 10 Jun 2019 16:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
 [209.85.222.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A2B8903B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 16:58:25 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id o19so3310730uap.13
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 09:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fP7YpHWgglKrcyzFnh2irV1N3UnxTxR7hTUY8S1RfRI=;
 b=WiaDec0JqKjFSyFwqlseBvcuhiJyfUxRsOkaOAeSAIiL9UgW39bklvhF+lRzGgv+Ru
 A0MH9+EhObOhJzCi9wDGngMgQhjR+CrCbZJf/gBgjUoMp5VQP2UQ+Al8dQyC5M2k4I4N
 V8wU86287xhIvQ9rpas2OwsOIvnWILci5WYG/Vl6osetwzjPEjMOSzmIld9ajeqUG6Od
 AtKFkfX552/e6ZzTIqo+5/HmfLtM+78wGtOtzeooUfDYOPUqIVkHl0Oylf9Wzq9DKfs0
 hLlS6guARl8d/F+dUGfJEvLNEU7uIKvFhFGlyWl0QedGOSDAckg7Fh/LDJuGkK75rfrC
 02Mg==
X-Gm-Message-State: APjAAAUu1W0HkXpn6P5m8Ktxq68N8QoZ+W60zTJsvCzAWFzC9cghk+lB
 Kb6JcKTNF57ldlU8/liZFqNk3qI=
X-Google-Smtp-Source: APXvYqzr7EYiXkxb3cR+hs3tLYAVe1LTyyEaBwjiIw+TLeMotk6/t0i6hXbuIBqHf+4WqbyJhJGZww==
X-Received: by 2002:a9f:3770:: with SMTP id a45mr6415917uae.64.1560185904499; 
 Mon, 10 Jun 2019 09:58:24 -0700 (PDT)
Received: from localhost.localdomain ([64.188.179.199])
 by smtp.googlemail.com with ESMTPSA id p67sm3366457vkd.40.2019.06.10.09.58.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 10 Jun 2019 09:58:24 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panfrost: Align GEM objects GPU VA to 2MB
Date: Mon, 10 Jun 2019 10:58:06 -0600
Message-Id: <20190610165806.24854-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: Robin Murphy <robin.murphy@arm.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gb3JkZXIgdG8gaW5jcmVhc2UgdGhlIGNoYW5jZXMgb2YgdXNpbmcgMk1CIHBhZ2VzLCB3ZSBu
ZWVkIHRvIGFsaWduIHRoZQpHUFUgVkEgbWFwcGluZyB0byAyTUIuIE9ubHkgZG8gdGhpcyBpZiB0
aGUgb2JqZWN0IHNpemUgaXMgMk1CIG9yIG1vcmUuCgpDYzogUm9iaW4gTXVycGh5IDxyb2Jpbi5t
dXJwaHlAYXJtLmNvbT4KQ2M6IFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNlQGFybS5jb20+CkNj
OiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgpTaWduZWQtb2ZmLWJ5
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5m
cm9zdC9wYW5mcm9zdF9nZW0uYyB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0
X2dlbS5jCmluZGV4IGE1NTI4YTM2MGVmNC4uODg2ODc1YWUzMWQzIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5jCkBAIC01Miw2ICs1Miw3IEBAIHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqcGFuZnJvc3RfZ2VtX2NyZWF0ZV9vYmplY3Qoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgc2l6ZV90CiAJaW50IHJldDsKIAlzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiA9IGRl
di0+ZGV2X3ByaXZhdGU7CiAJc3RydWN0IHBhbmZyb3N0X2dlbV9vYmplY3QgKm9iajsKKwl1NjQg
YWxpZ247CiAKIAlvYmogPSBremFsbG9jKHNpemVvZigqb2JqKSwgR0ZQX0tFUk5FTCk7CiAJaWYg
KCFvYmopCkBAIC01OSw5ICs2MCwxMiBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKnBhbmZyb3N0
X2dlbV9jcmVhdGVfb2JqZWN0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHNpemVfdAogCiAJb2Jq
LT5iYXNlLmJhc2UuZnVuY3MgPSAmcGFuZnJvc3RfZ2VtX2Z1bmNzOwogCisJc2l6ZSA9IHJvdW5k
dXAoc2l6ZSwgUEFHRV9TSVpFKTsKKwlhbGlnbiA9IHNpemUgPj0gU1pfMk0gPyBTWl8yTSA+PiBQ
QUdFX1NISUZUIDogMDsKKwogCXNwaW5fbG9jaygmcGZkZXYtPm1tX2xvY2spOwotCXJldCA9IGRy
bV9tbV9pbnNlcnRfbm9kZSgmcGZkZXYtPm1tLCAmb2JqLT5ub2RlLAotCQkJCSByb3VuZHVwKHNp
emUsIFBBR0VfU0laRSkgPj4gUEFHRV9TSElGVCk7CisJcmV0ID0gZHJtX21tX2luc2VydF9ub2Rl
X2dlbmVyaWMoJnBmZGV2LT5tbSwgJm9iai0+bm9kZSwKKwkJCQkJIHNpemUgPj4gUEFHRV9TSElG
VCwgYWxpZ24sIDAsIDApOwogCXNwaW5fdW5sb2NrKCZwZmRldi0+bW1fbG9jayk7CiAJaWYgKHJl
dCkKIAkJZ290byBmcmVlX29iajsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs

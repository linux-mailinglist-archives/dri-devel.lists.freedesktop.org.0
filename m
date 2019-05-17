Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F1D265D3
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48C9F89AB5;
	Wed, 22 May 2019 14:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA38789971
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 18:47:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b18so8115403wrq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 11:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4QRWDFkVz3xUnUzR3+DHbkRCIRl8pbjmxCa/vhR9hvo=;
 b=galJTyLEXylr4HVKW8OqYWDIoF5WNolPiim3x/EilFTnSFiG55wze6B7dxviCXZdga
 MYpBokWvubzZajPtc0bFeGPWUA3nhSpIXSnMFqdSd+A/vtmujPK6w2LbP1gj4MJCXZsa
 aBVpeUyyWSsfLOcM4TlGgrYD8xxsDN4mJz/9oY6eQnukKmjXb2zlfHOsV0yG2yzC8Ab4
 VZJ6S/8yRbYbSnpLEt0CrG7C0Lhk12A1eEUCIkxhSRfFx8gQMUOo+r48TsyIzamCLt+r
 8CZH/OKR80vlR38jasr/+AyjFavR6iUy42GMlsi+pJK7GcAtfS3CN/omTNDYva9j/khF
 tpmQ==
X-Gm-Message-State: APjAAAX+znff4oumH3UviERgfZnwfMmNzaJeXK8hN//2pehQGLFST76Q
 ficihBVxuKL6UI+8BjwdSs0=
X-Google-Smtp-Source: APXvYqzQ3Rol+3txTzhDDbnTRdYC6TTbSHhpgNCNWdrgxxOScCII+60hVNsOpiwPvn2YYuVJGvfLtA==
X-Received: by 2002:a5d:658d:: with SMTP id q13mr19937938wru.61.1558118827335; 
 Fri, 17 May 2019 11:47:07 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
 by smtp.gmail.com with ESMTPSA id v20sm5801112wmj.10.2019.05.17.11.47.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 May 2019 11:47:06 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH v5 1/6] drm: panfrost: add optional bus_clock
Date: Fri, 17 May 2019 20:46:54 +0200
Message-Id: <20190517184659.18828-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517184659.18828-1-peron.clem@gmail.com>
References: <20190517184659.18828-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4QRWDFkVz3xUnUzR3+DHbkRCIRl8pbjmxCa/vhR9hvo=;
 b=IzX0fpNh7WWzngetTRMHcGGlBKa4/Y10ND0MNxVowv35ASa6AyO+qLIiBx3oorQdoE
 gIMiRRTn12Vsg2PSpAtRil1uUy8xkxChgYigzhBilxkZX68upC2GKDNyLfBUb7Z2bHUQ
 l3UW0QKhlFhotuDCigGjT0urbWePYMe8D/Pqzy4lHHDPtWu2SCcAKN5A52dsJNj3f/9u
 wkbw9NIvOfWOihlEVc51Vd3gqhyPPlvGT64PX4ziAJrrUtqwzN1IUvq1Nm5N1J3wTFtQ
 EAhiuVgi6wE0rGJSFc9r5guK7YM9/7d0ISQhpYx5+RHA1MbYhrZU48H4aCLkI/T/pxBx
 RsxA==
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsd2lubmVyIEg2IGhhcyBhbiBBUk0gTWFsaS1UNzIwIE1QMiB3aGljaCByZXF1aXJlZCBhIGJ1
c19jbG9jay4KCkFkZCBhbiBvcHRpb25hbCBidXNfY2xvY2sgYXQgdGhlIGluaXQgb2YgdGhlIHBh
bmZyb3N0IGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xl
bUBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rldmlj
ZS5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysrLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2RldmljZS5oIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rl
dmljZS5jCmluZGV4IDNiMmJjZWQxYjAxNS4uOGRhNmU2MTJkMzg0IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCkBAIC00NCw3ICs0NCw4IEBAIHN0YXRpYyBp
bnQgcGFuZnJvc3RfY2xrX2luaXQoc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYpCiAKIAlw
ZmRldi0+Y2xvY2sgPSBkZXZtX2Nsa19nZXQocGZkZXYtPmRldiwgTlVMTCk7CiAJaWYgKElTX0VS
UihwZmRldi0+Y2xvY2spKSB7Ci0JCWRldl9lcnIocGZkZXYtPmRldiwgImdldCBjbG9jayBmYWls
ZWQgJWxkXG4iLCBQVFJfRVJSKHBmZGV2LT5jbG9jaykpOworCQlkZXZfZXJyKHBmZGV2LT5kZXYs
ICJnZXQgY2xvY2sgZmFpbGVkICVsZFxuIiwKKwkJCVBUUl9FUlIocGZkZXYtPmNsb2NrKSk7CiAJ
CXJldHVybiBQVFJfRVJSKHBmZGV2LT5jbG9jayk7CiAJfQogCkBAIC01NSwxMSArNTYsMzMgQEAg
c3RhdGljIGludCBwYW5mcm9zdF9jbGtfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRl
dikKIAlpZiAoZXJyKQogCQlyZXR1cm4gZXJyOwogCisJcGZkZXYtPmJ1c19jbG9jayA9IGRldm1f
Y2xrX2dldF9vcHRpb25hbChwZmRldi0+ZGV2LCAiYnVzIik7CisJaWYgKElTX0VSUihwZmRldi0+
YnVzX2Nsb2NrKSkgeworCQlkZXZfZXJyKHBmZGV2LT5kZXYsICJnZXQgYnVzX2Nsb2NrIGZhaWxl
ZCAlbGRcbiIsCisJCQlQVFJfRVJSKHBmZGV2LT5idXNfY2xvY2spKTsKKwkJcmV0dXJuIFBUUl9F
UlIocGZkZXYtPmJ1c19jbG9jayk7CisJfQorCisJaWYgKHBmZGV2LT5idXNfY2xvY2spIHsKKwkJ
cmF0ZSA9IGNsa19nZXRfcmF0ZShwZmRldi0+YnVzX2Nsb2NrKTsKKwkJZGV2X2luZm8ocGZkZXYt
PmRldiwgImJ1c19jbG9jayByYXRlID0gJWx1XG4iLCByYXRlKTsKKworCQllcnIgPSBjbGtfcHJl
cGFyZV9lbmFibGUocGZkZXYtPmJ1c19jbG9jayk7CisJCWlmIChlcnIpCisJCQlnb3RvIGRpc2Fi
bGVfY2xvY2s7CisJfQorCiAJcmV0dXJuIDA7CisKK2Rpc2FibGVfY2xvY2s6CisJY2xrX2Rpc2Fi
bGVfdW5wcmVwYXJlKHBmZGV2LT5jbG9jayk7CisKKwlyZXR1cm4gZXJyOwogfQogCiBzdGF0aWMg
dm9pZCBwYW5mcm9zdF9jbGtfZmluaShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIHsK
KwljbGtfZGlzYWJsZV91bnByZXBhcmUocGZkZXYtPmJ1c19jbG9jayk7CiAJY2xrX2Rpc2FibGVf
dW5wcmVwYXJlKHBmZGV2LT5jbG9jayk7CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9w
YW5mcm9zdF9kZXZpY2UuaAppbmRleCA1NmY0NTJkZmI0OTAuLjgwNzRmMjIxMDM0YiAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaApAQCAtNjYsNiArNjYsNyBA
QCBzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlIHsKIAogCXZvaWQgX19pb21lbSAqaW9tZW07CiAJc3Ry
dWN0IGNsayAqY2xvY2s7CisJc3RydWN0IGNsayAqYnVzX2Nsb2NrOwogCXN0cnVjdCByZWd1bGF0
b3IgKnJlZ3VsYXRvcjsKIAlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcnN0YzsKIAotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

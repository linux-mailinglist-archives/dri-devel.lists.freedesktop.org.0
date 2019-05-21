Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8277B265EA
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:37:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F0C89B0B;
	Wed, 22 May 2019 14:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B81B7893CB
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 16:11:10 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id i3so3573711wml.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2019 09:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pcynCO3Bhnyyyh0AzkuL7DAz7yiCtTiW/mLXsFC4qdg=;
 b=jjLgPnDHhyhU5DgyzXyIfiwghdgB/YpMYaa+MndFlLjL8jbEDBcSUiqJSkJjlePgqB
 BecEnYMQNR8TuAyfny2wZ4LpR1wyCdMVU+8qbWTbaEsmZ+ztWOWYvfN6W3n9ZgVo6mjA
 VvDlY7XP8gp3/1nzTXWZGw6KHanfNjaCcolZSHCOt5MCL2MKM0hiWSJfex2kNG4Zhfch
 X6uiV8TAjU0/uqUZSLskQ7bWH2SooYCcZT6+vKMjOnXa/dTX582z/c2gcnYWi0aOhqTB
 qsaQdyQ1+rvX7X1OtLstms1nd70OCEGnq8nxugGCNSqHOb9Hmx5UT/p3Aav5UZoPNnhh
 X5Gg==
X-Gm-Message-State: APjAAAXxedBC/hM+lXgmYaYfGwuSMHzVgQrQyFeH+CpqoJaQJmc9HDny
 iBj5dwhj7NZmUsnGkarbEM0=
X-Google-Smtp-Source: APXvYqynBK31B9gGuYlYbOmFDLrVXZyQ7MV/LPrhgtP4OE0MWCnSyrxl5VmWGWjgIOMTzPaP4WdGOw==
X-Received: by 2002:a7b:c76b:: with SMTP id x11mr4416026wmk.22.1558455069253; 
 Tue, 21 May 2019 09:11:09 -0700 (PDT)
Received: from localhost.localdomain (18.189-60-37.rdns.acropolistelecom.net.
 [37.60.189.18])
 by smtp.gmail.com with ESMTPSA id n63sm3891094wmn.38.2019.05.21.09.11.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 May 2019 09:11:08 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Will Deacon <will.deacon@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Steven Price <steven.price@arm.com>
Subject: [PATCH v6 1/6] drm: panfrost: add optional bus_clock
Date: Tue, 21 May 2019 18:10:57 +0200
Message-Id: <20190521161102.29620-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190521161102.29620-1-peron.clem@gmail.com>
References: <20190521161102.29620-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:24 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pcynCO3Bhnyyyh0AzkuL7DAz7yiCtTiW/mLXsFC4qdg=;
 b=YrCzRXON/0Vpkv9VFfnH6p1V3nggv/XRBoBPsx+/vqNSV/s+pu9R6XK+Hki1MeKXVW
 iOGxBpY077JEobnVKhTOfi+3VNke0nn8+CBJ+6RMQgVF13yL9mF58lbebM+srWUv5Ueg
 wtq1dzjsCXbsJC34G8ddp6z6u4O0ALYJbv0DY8YbsesAgEjukZJX+OV7OOF8M8/wXK9g
 +18b+uxQzEKtktq6PDkGvCDZQAyNx3bhgElXQN/NYDo821mt7JsqhHJ2tH1JJGKwc6V4
 ZnBBhOp7m8/U1xHIe+bNL1LXtKSr2t+xK+KGDrUju6zr127Tm3Ui+E56cxeDNrKttAPL
 2Xew==
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
ZS5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0
L3BhbmZyb3N0X2RldmljZS5oIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rldmlj
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCmluZGV4IDNi
MmJjZWQxYjAxNS4uY2NiOGViMmE1MThjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3Bh
bmZyb3N0X2RldmljZS5jCkBAIC01NSwxMSArNTUsMzMgQEAgc3RhdGljIGludCBwYW5mcm9zdF9j
bGtfaW5pdChzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIAlpZiAoZXJyKQogCQlyZXR1
cm4gZXJyOwogCisJcGZkZXYtPmJ1c19jbG9jayA9IGRldm1fY2xrX2dldF9vcHRpb25hbChwZmRl
di0+ZGV2LCAiYnVzIik7CisJaWYgKElTX0VSUihwZmRldi0+YnVzX2Nsb2NrKSkgeworCQlkZXZf
ZXJyKHBmZGV2LT5kZXYsICJnZXQgYnVzX2Nsb2NrIGZhaWxlZCAlbGRcbiIsCisJCQlQVFJfRVJS
KHBmZGV2LT5idXNfY2xvY2spKTsKKwkJcmV0dXJuIFBUUl9FUlIocGZkZXYtPmJ1c19jbG9jayk7
CisJfQorCisJaWYgKHBmZGV2LT5idXNfY2xvY2spIHsKKwkJcmF0ZSA9IGNsa19nZXRfcmF0ZShw
ZmRldi0+YnVzX2Nsb2NrKTsKKwkJZGV2X2luZm8ocGZkZXYtPmRldiwgImJ1c19jbG9jayByYXRl
ID0gJWx1XG4iLCByYXRlKTsKKworCQllcnIgPSBjbGtfcHJlcGFyZV9lbmFibGUocGZkZXYtPmJ1
c19jbG9jayk7CisJCWlmIChlcnIpCisJCQlnb3RvIGRpc2FibGVfY2xvY2s7CisJfQorCiAJcmV0
dXJuIDA7CisKK2Rpc2FibGVfY2xvY2s6CisJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHBmZGV2LT5j
bG9jayk7CisKKwlyZXR1cm4gZXJyOwogfQogCiBzdGF0aWMgdm9pZCBwYW5mcm9zdF9jbGtfZmlu
aShzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldikKIHsKKwljbGtfZGlzYWJsZV91bnByZXBh
cmUocGZkZXYtPmJ1c19jbG9jayk7CiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKHBmZGV2LT5jbG9j
ayk7CiB9CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9k
ZXZpY2UuaCBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaAppbmRl
eCA1NmY0NTJkZmI0OTAuLjgwNzRmMjIxMDM0YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9z
dC9wYW5mcm9zdF9kZXZpY2UuaApAQCAtNjYsNiArNjYsNyBAQCBzdHJ1Y3QgcGFuZnJvc3RfZGV2
aWNlIHsKIAogCXZvaWQgX19pb21lbSAqaW9tZW07CiAJc3RydWN0IGNsayAqY2xvY2s7CisJc3Ry
dWN0IGNsayAqYnVzX2Nsb2NrOwogCXN0cnVjdCByZWd1bGF0b3IgKnJlZ3VsYXRvcjsKIAlzdHJ1
Y3QgcmVzZXRfY29udHJvbCAqcnN0YzsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F869A553
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 04:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE5D6EBAB;
	Fri, 23 Aug 2019 02:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74D96EBA5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 02:12:27 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id h21so5915851oie.7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 19:12:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FUX/60RPleBNc8rEUfe9ndSh2CQRzsgZWa6X5GDs078=;
 b=rI8V7W0c5Y2IQKZFN2p7LW3p6zogvDApJ8F5ysThcxz3IAdxYdVkBVjegAdfCNS+2Q
 vSmg9cfwv0rkaeMjvopwecZBwhttFMl8vHEewyiTlg1FHgYl5QG6wJr8IvgjC5XD7xtv
 Nd9NybCrBdFlVSaMO61BQ97gg0MEqfpLZOyQfq1FyTg7+jy0VgfkjZuluKtKpTkDBf/s
 dZiH+rjJ+VUHaZCQme+MIyAkt7OSF+akMK3GGxZBpiEWJ6Q2uKdWxGcmLLiUbJdyrqfR
 VO9pXh3nyFqlcmmETQgTgVVqaGV0ss/EpYwMuDUqruG7r0IIq6ijY28659Xa2rqnJEbK
 YBDA==
X-Gm-Message-State: APjAAAUWdqzzYs1dcoB8c6WImZGNmM6A24yXLSvxLRySfBWZLkQnUR4t
 EJ2ZexKLZjMAhjxI26ftnFZy6c8=
X-Google-Smtp-Source: APXvYqw5L9Th0Bj5pFedF6ty2rPjW7eEUJWCyJAfqblXzZF/blVJ3EdU4Oyajxh4yzjuifDJtdL2Dg==
X-Received: by 2002:aca:ead7:: with SMTP id i206mr1487367oih.8.1566526346137; 
 Thu, 22 Aug 2019 19:12:26 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id c1sm457747oic.31.2019.08.22.19.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 19:12:25 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/8] drm/panfrost: Use mutex_trylock in panfrost_gem_purge
Date: Thu, 22 Aug 2019 21:12:14 -0500
Message-Id: <20190823021216.5862-7-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190823021216.5862-1-robh@kernel.org>
References: <20190823021216.5862-1-robh@kernel.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TG9ja2RlcCByZXBvcnRzIGEgY2lyY3VsYXIgbG9ja2luZyBkZXBlbmRlbmN5IHdpdGggcGFnZXNf
bG9jayB0YWtlbiBpbgp0aGUgc2hyaW5rZXIgY2FsbGJhY2suIFRoZSBkZWFkbG9jayBjYW4ndCBh
Y3R1YWxseSBoYXBwZW4gd2l0aCBjdXJyZW50CnVzZXJzIGF0IGxlYXN0IGFzIGEgQk8gd2lsbCBu
ZXZlciBiZSBwdXJnZWFibGUgd2hlbiBwYWdlc19sb2NrIGlzIGhlbGQuClRvIGJlIHNhZmUsIGxl
dCdzIHVzZSBtdXRleF90cnlsb2NrKCkgaW5zdGVhZCBhbmQgYmFpbCBpZiBhIEJPIGlzIGxvY2tl
ZAphbHJlYWR5LgoKQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+
CkNjOiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgpDYzogQWx5c3NhIFJvc2Vu
endlaWcgPGFseXNzYS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+CkNjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+ClNp
Z25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQp2MjogbmV3IHBh
dGNoCgogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbV9zaHJpbmtlci5jIHwg
MTEgKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dl
bV9zaHJpbmtlci5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbV9zaHJp
bmtlci5jCmluZGV4IGQxOTE2MzJiNjE5Ny4uNDU4ZjBmYTY4MTExIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtX3Nocmlua2VyLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbV9zaHJpbmtlci5jCkBAIC0zNiwxNSArMzYs
MTggQEAgcGFuZnJvc3RfZ2VtX3Nocmlua2VyX2NvdW50KHN0cnVjdCBzaHJpbmtlciAqc2hyaW5r
ZXIsIHN0cnVjdCBzaHJpbmtfY29udHJvbCAqc2MKIAlyZXR1cm4gY291bnQ7CiB9CiAKLXN0YXRp
YyB2b2lkIHBhbmZyb3N0X2dlbV9wdXJnZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKK3N0
YXRpYyBib29sIHBhbmZyb3N0X2dlbV9wdXJnZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikK
IHsKIAlzdHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QgKnNobWVtID0gdG9fZHJtX2dlbV9zaG1l
bV9vYmoob2JqKTsKLQltdXRleF9sb2NrKCZzaG1lbS0+cGFnZXNfbG9jayk7CisKKwlpZiAoIW11
dGV4X3RyeWxvY2soJnNobWVtLT5wYWdlc19sb2NrKSkKKwkJcmV0dXJuIGZhbHNlOwogCiAJcGFu
ZnJvc3RfbW11X3VubWFwKHRvX3BhbmZyb3N0X2JvKG9iaikpOwogCWRybV9nZW1fc2htZW1fcHVy
Z2VfbG9ja2VkKG9iaik7CiAKIAltdXRleF91bmxvY2soJnNobWVtLT5wYWdlc19sb2NrKTsKKwly
ZXR1cm4gdHJ1ZTsKIH0KIAogc3RhdGljIHVuc2lnbmVkIGxvbmcKQEAgLTYxLDggKzY0LDggQEAg
cGFuZnJvc3RfZ2VtX3Nocmlua2VyX3NjYW4oc3RydWN0IHNocmlua2VyICpzaHJpbmtlciwgc3Ry
dWN0IHNocmlua19jb250cm9sICpzYykKIAlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUoc2htZW0s
IHRtcCwgJnBmZGV2LT5zaHJpbmtlcl9saXN0LCBtYWR2X2xpc3QpIHsKIAkJaWYgKGZyZWVkID49
IHNjLT5ucl90b19zY2FuKQogCQkJYnJlYWs7Ci0JCWlmIChkcm1fZ2VtX3NobWVtX2lzX3B1cmdl
YWJsZShzaG1lbSkpIHsKLQkJCXBhbmZyb3N0X2dlbV9wdXJnZSgmc2htZW0tPmJhc2UpOworCQlp
ZiAoZHJtX2dlbV9zaG1lbV9pc19wdXJnZWFibGUoc2htZW0pICYmCisJCSAgICBwYW5mcm9zdF9n
ZW1fcHVyZ2UoJnNobWVtLT5iYXNlKSkgewogCQkJZnJlZWQgKz0gc2htZW0tPmJhc2Uuc2l6ZSA+
PiBQQUdFX1NISUZUOwogCQkJbGlzdF9kZWxfaW5pdCgmc2htZW0tPm1hZHZfbGlzdCk7CiAJCX0K
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

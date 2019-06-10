Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C19D53BE39
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 23:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A938914B;
	Mon, 10 Jun 2019 21:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFEC18914B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 21:18:28 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id i2so4147371plt.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 14:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8nq9Im362lbv4azULZvOC9Ag2G2ZekGR7CCYDprgGF8=;
 b=Ea0HL8bD31Uh7dSANQ97ZxMTAM5Ep3emu07syQXg34rR7X6FATz2U5bQjSsSM1HQro
 P0YQFycGthK4jGu4FPg0RldUCKTSVFEVzo7MIJHa9Z1Ox0rOAOcvEGmtfOo7wNeo30Hj
 7WV/uEgX5sgksSLObxFKorssChQ+ZwrOlYABis+8uhHdhN/YsmypDkN9gKLy4mYvTJTr
 RjsD1r59Zpo6vdAOZu+4jFLPUucUM26m6H3bRkSPhQi7qp/K/ljNTsVJBpQYAimpPJFO
 0eEHss6FWxx+Gl4A8z4WdTZYmichqHNZ4zNV9jF7bXZxh1T2zs+QjahbdkZjOOBpGf48
 EREQ==
X-Gm-Message-State: APjAAAW5geSKFBZ73JIvHmDS+4/ZftFt8GjYz8FCkP5TLvIJPtRueeyN
 tjs6UriGw5mAjEECkhfVpnLW7w==
X-Google-Smtp-Source: APXvYqyMASM4YCvHQ5Ip2z9vUnGHsH6b1vlzz/iXUjTKHtkcitMyf7/FMV1pmortsoFPZ6YfD+n6Cw==
X-Received: by 2002:a17:902:5c5:: with SMTP id
 f63mr72275000plf.176.1560201508490; 
 Mon, 10 Jun 2019 14:18:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
 by smtp.gmail.com with ESMTPSA id q20sm16377982pgq.66.2019.06.10.14.18.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 14:18:27 -0700 (PDT)
From: davidriley@chromium.org
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH v2 4/4] drm/virtio: Add memory barriers for capset cache.
Date: Mon, 10 Jun 2019 14:18:10 -0700
Message-Id: <20190610211810.253227-5-davidriley@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190605234423.11348-1-davidriley@chromium.org>
References: <20190605234423.11348-1-davidriley@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8nq9Im362lbv4azULZvOC9Ag2G2ZekGR7CCYDprgGF8=;
 b=FCNlBwOefmxV9kPIPrpaBd9HyXv2yEenUtOaw++Q3b8DYUHSXihBeppW/SIaMfVj5X
 jP4AxfQTg5gmZCoy5a/s/T7DlqJANXVakIx9E4W7j2FILbiSvu0yUKGMDBpgoqSfIRkG
 8f4i+L37sKl82vKcRN0id86xV7zHPQ7j7xd8s=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgUmlsZXkgPGRhdmlkcmlsZXlAY2hyb21pdW0ub3JnPgoKQWZ0ZXIgZGF0YSBp
cyBjb3BpZWQgdG8gdGhlIGNhY2hlIGVudHJ5LCBhdG9taWNfc2V0IGlzIHVzZWQgaW5kaWNhdGUK
dGhhdCB0aGUgZGF0YSBpcyB0aGUgZW50cnkgaXMgdmFsaWQgd2l0aG91dCBhcHByb3ByaWF0ZSBt
ZW1vcnkgYmFycmllcnMuClNpbWlsYXJseSB0aGUgcmVhZCBzaWRlIHdhcyBtaXNzaW5nIHRoZSBj
b3JyZXNwb25kaW5nIG1lbW9yeSBiYXJyaWVycy4KClNpZ25lZC1vZmYtYnk6IERhdmlkIFJpbGV5
IDxkYXZpZHJpbGV5QGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfaW9jdGwuYyB8IDMgKysrCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEu
YyAgICB8IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYwppbmRleCA4OGMxZWQ1N2EzYzUuLmE1MDQ5NTA4M2Q2
ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2lvY3RsLmMKQEAgLTU0Miw2ICs1NDIs
OSBAQCBzdGF0aWMgaW50IHZpcnRpb19ncHVfZ2V0X2NhcHNfaW9jdGwoc3RydWN0IGRybV9kZXZp
Y2UgKmRldiwKIAlpZiAoIXJldCkKIAkJcmV0dXJuIC1FQlVTWTsKIAorCS8qIGlzX3ZhbGlkIGNo
ZWNrIG11c3QgcHJvY2VlZCBiZWZvcmUgY29weSBvZiB0aGUgY2FjaGUgZW50cnkuICovCisJc21w
X3JtYigpOworCiAJcHRyID0gY2FjaGVfZW50LT5jYXBzX2NhY2hlOwogCiAJaWYgKGNvcHlfdG9f
dXNlcigodm9pZCBfX3VzZXIgKikodW5zaWduZWQgbG9uZylhcmdzLT5hZGRyLCBwdHIsIHNpemUp
KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYwppbmRleCBkZDVlYWQyNTQxYzIuLmM3YTVj
YTAyNzI0NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMKQEAgLTU4Myw2ICs1ODMs
OCBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X2NtZF9jYXBzZXRfY2Ioc3RydWN0IHZpcnRpb19n
cHVfZGV2aWNlICp2Z2RldiwKIAkJICAgIGNhY2hlX2VudC0+aWQgPT0gbGUzMl90b19jcHUoY21k
LT5jYXBzZXRfaWQpKSB7CiAJCQltZW1jcHkoY2FjaGVfZW50LT5jYXBzX2NhY2hlLCByZXNwLT5j
YXBzZXRfZGF0YSwKIAkJCSAgICAgICBjYWNoZV9lbnQtPnNpemUpOworCQkJLyogQ29weSBtdXN0
IG9jY3VyIGJlZm9yZSBpc192YWxpZCBpcyBzaWduYWxsZWQuICovCisJCQlzbXBfd21iKCk7CiAJ
CQlhdG9taWNfc2V0KCZjYWNoZV9lbnQtPmlzX3ZhbGlkLCAxKTsKIAkJCWJyZWFrOwogCQl9Ci0t
IAoyLjIyLjAucmMyLjM4My5nZjRmYmJmMzBjMi1nb29nCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

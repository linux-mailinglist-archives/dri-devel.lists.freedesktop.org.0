Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB0836845
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 01:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ADD28961E;
	Wed,  5 Jun 2019 23:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C81289624
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 23:44:35 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y11so258892pfm.13
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 16:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O/rnPOIToTFx5TLEufnCNbUgXKKUEmLsHgR6/mZpdjU=;
 b=TE78tGl68HLnom1YH0EncZ6LmnrA+fp+KrSVO/BkwaGXIuCPpXect3B6B2RoLoR3Ob
 dlOeoGdTBdEXN22Ix8nC0oF7/c4qbOQsvHt7pVajp6b8GzhM6XwUJb7zI/CgNjfztSya
 M8SPv0D1JkaFIbwQ+HCR2MSx/FhO18yboO3zCjzHMwNAzRhB0dbm2M56GayY/BL8QC8v
 OnXATo5/OLRU8iK03JUH9t7UXvyx4QojsHP4s2j7HsB7VZ5bKrhPgScr0C1VvF4pD0DB
 OAaZfO/pBijx9gh8yx2yYi3owG0oax4kgmK6bIqvYPPseDeRX21mv1pzpxpJGk+h1kUE
 kf/w==
X-Gm-Message-State: APjAAAXrwkzskzLltiVFt9ZRyfAQ8MWjpFwlotj75eQYZYeLemkj8uN/
 T2h0GsrTxqEHChmuB+vFpNF2cwAaiHk=
X-Google-Smtp-Source: APXvYqx3zG9rCLgbcYNCrxQmCKphQkBdlVy6ZRX+tG+qVBLLyEt6Kt8hYiRlUljA7AErFG1Rw0gooQ==
X-Received: by 2002:aa7:824b:: with SMTP id e11mr48252024pfn.33.1559778274578; 
 Wed, 05 Jun 2019 16:44:34 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
 by smtp.gmail.com with ESMTPSA id n13sm73547pff.59.2019.06.05.16.44.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 16:44:33 -0700 (PDT)
From: davidriley@chromium.org
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH 4/4] drm/virtio: Add memory barriers for capset cache.
Date: Wed,  5 Jun 2019 16:44:23 -0700
Message-Id: <20190605234423.11348-4-davidriley@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190605234423.11348-1-davidriley@chromium.org>
References: <20190605234423.11348-1-davidriley@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O/rnPOIToTFx5TLEufnCNbUgXKKUEmLsHgR6/mZpdjU=;
 b=MHtX30vwaCImP+Gi+3ZHA5YFvCgatPC5P2V/vbOYhAkd3uKWFpSwfQdIMqKJ1UN9mn
 ubpHA9QgM0UPJc143fTWqiXbi4prMSZRarIR96MLM1tgPc563MWE5mRtsemIxnOR/+2i
 tvCWi/hmoOEQ3lAIw8K9OJ6Tm6wuPY1LbOh44=
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
Cc: David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgUmlsZXkgPGRhdmlkcmlsZXlAY2hyb21pdW0ub3JnPgoKQWZ0ZXIgZGF0YSBp
cyBjb3BpZWQgdG8gdGhlIGNhY2hlIGVudHJ5LCBhdG9taWNfc2V0IGlzIHVzZWQgaW5kaWNhdGUK
dGhhdCB0aGUgZGF0YSBpcyB0aGUgZW50cnkgaXMgdmFsaWQgd2l0aG91dCBhcHByb3ByaWF0ZSBt
ZW1vcnkgYmFycmllcnMuClNpbWlsYXJseSB0aGUgcmVhZCBzaWRlIHdhcyBtaXNzaW5nIHRoZSBz
YW1lIG1lbW9yeSBiYXJyaWVzLgoKU2lnbmVkLW9mZi1ieTogRGF2aWQgUmlsZXkgPGRhdmlkcmls
ZXlAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0
bC5jIHwgMyArKysKIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jICAgIHwgMiAr
KwogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9pb2N0bC5jCmluZGV4IDg4YzFlZDU3YTNjNS4uNTAyZjVmN2MyMjk4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYwpAQCAtNTQyLDYgKzU0Miw5IEBAIHN0YXRp
YyBpbnQgdmlydGlvX2dwdV9nZXRfY2Fwc19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAog
CWlmICghcmV0KQogCQlyZXR1cm4gLUVCVVNZOwogCisJLyogaXNfdmFsaWQgY2hlY2sgbXVzdCBw
cm9jZWVkIGJlZm9yZSBjb3B5IG9mIHRoZSBjYWNoZSBlbnRyeS4gKi8KKwl2aXJ0X3JtYigpOwor
CiAJcHRyID0gY2FjaGVfZW50LT5jYXBzX2NhY2hlOwogCiAJaWYgKGNvcHlfdG9fdXNlcigodm9p
ZCBfX3VzZXIgKikodW5zaWduZWQgbG9uZylhcmdzLT5hZGRyLCBwdHIsIHNpemUpKQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfdnEuYwppbmRleCBkZDVlYWQyNTQxYzIuLmI5NzRlYmE0ZmU3ZCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMKQEAgLTU4Myw2ICs1ODMsOCBAQCBzdGF0
aWMgdm9pZCB2aXJ0aW9fZ3B1X2NtZF9jYXBzZXRfY2Ioc3RydWN0IHZpcnRpb19ncHVfZGV2aWNl
ICp2Z2RldiwKIAkJICAgIGNhY2hlX2VudC0+aWQgPT0gbGUzMl90b19jcHUoY21kLT5jYXBzZXRf
aWQpKSB7CiAJCQltZW1jcHkoY2FjaGVfZW50LT5jYXBzX2NhY2hlLCByZXNwLT5jYXBzZXRfZGF0
YSwKIAkJCSAgICAgICBjYWNoZV9lbnQtPnNpemUpOworCQkJLyogQ29weSBtdXN0IG9jY3VyIGJl
Zm9yZSBpc192YWxpZCBpcyBzaWduYWxsZWQuICovCisJCQl2aXJ0X3dtYigpOwogCQkJYXRvbWlj
X3NldCgmY2FjaGVfZW50LT5pc192YWxpZCwgMSk7CiAJCQlicmVhazsKIAkJfQotLSAKMi4yMi4w
LnJjMS4zMTEuZzVkNzU3M2ExNTEtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs

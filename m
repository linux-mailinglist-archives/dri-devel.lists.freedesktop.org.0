Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629043BE38
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 23:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D499289154;
	Mon, 10 Jun 2019 21:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9A589154
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 21:18:26 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id v11so5678103pgl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 14:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NP01C7FGf5lxdvTmoSCPFBCPy5Bu0zVjIzvG3I+uzsk=;
 b=OQctpB6AlBWhisK20roqcg7TpdL68RzgVumljQCtJSITtIzp54Q5k4F9feDBqlwWu8
 qX6erdQ2kp1S3qgEgEtGMStb01v5x/MdZCMKN3BnexWYiVSIuBYzL/akdK7J5LhHWAx+
 zDWAkONN4Fk58PJ+Or5dCn87uDZ4dslAe7vjAeADi0SYJ8UTPAcU4wmYs7Ygh5Yojzd0
 vBx8l3GtnURlIdF0QGbW/UXkjIfa8+qqsjYKNBBY7qWjmm3ARhT1QP7bzMnsW/dc9p3j
 dqs+Hj9pQ2Gi2zLz/pwKrvZxPIjjZx8ht97kTUE6sUMf8tz/LFM31IUOX+2yPfaI3c6R
 LxRg==
X-Gm-Message-State: APjAAAWTPRK17rAwW0SGtm/DnyECd+9RYL0A2wPI1LPNV+ejhLb8txXK
 gK8/90r6Th3zbUKEdhfN0GczQzNy3kY=
X-Google-Smtp-Source: APXvYqyWCx2wwO3RZDWC6w+KkvtMx9THHvgIOX7vkYR2WNfySgWalTTwUj9doH3hsQm+oago2gRGvg==
X-Received: by 2002:a17:90a:af8e:: with SMTP id
 w14mr23816885pjq.89.1560201505577; 
 Mon, 10 Jun 2019 14:18:25 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
 by smtp.gmail.com with ESMTPSA id a7sm10762032pgj.42.2019.06.10.14.18.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 14:18:24 -0700 (PDT)
From: davidriley@chromium.org
To: Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH v2 3/4] drm/virtio: Fix cache entry creation race.
Date: Mon, 10 Jun 2019 14:18:09 -0700
Message-Id: <20190610211810.253227-4-davidriley@chromium.org>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190605234423.11348-1-davidriley@chromium.org>
References: <20190605234423.11348-1-davidriley@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NP01C7FGf5lxdvTmoSCPFBCPy5Bu0zVjIzvG3I+uzsk=;
 b=he+m3/R6d4WOz248hKEgrFo7XRgWBhY10YKEcExRTGj4loUd1d2D8qSf/4aeg5scMY
 AyAJux2zPZ583C6cHkDjwiDONDughIB3f4nxO2RH6Pjjv9X6OcnkjLb5/yCxTDwDns1v
 eH6ZyRxvCZ5YyXcJrIgIgdUBsJmOzPBY32ZzQ=
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

RnJvbTogRGF2aWQgUmlsZXkgPGRhdmlkcmlsZXlAY2hyb21pdW0ub3JnPgoKdmlydGlvX2dwdV9j
bWRfZ2V0X2NhcHNldCB3b3VsZCBjaGVjayBmb3IgdGhlIGV4aXN0ZW5jZSBvZiBhbiBlbnRyeQp1
bmRlciBsb2NrLiAgSWYgaXQgd2FzIG5vdCBmb3VuZCwgaXQgd291bGQgdW5sb2NrIGFuZCBjYWxs
CnZpcnRpb19ncHVfY21kX2dldF9jYXBzZXQgdG8gY3JlYXRlIGEgbmV3IGVudHJ5LiAgVGhlIG5l
dyBlbnRyeSB3b3VsZApiZSBhZGRlZCBpdCB0byB0aGUgbGlzdCB3aXRob3V0IGNoZWNraW5nIGlm
IGl0IHdhcyBhZGRlZCBieSBhbm90aGVyCnRhc2sgZHVyaW5nIHRoZSBwZXJpb2Qgd2hlcmUgdGhl
IGxvY2sgd2FzIG5vdCBoZWxkIHJlc3VsdGluZyBpbgpkdXBsaWNhdGUgZW50cmllcy4KCkNvbXBv
dW5kaW5nIHRoaXMgaXNzdWUsIHZpcnRpb19ncHVfY21kX2NhcHNldF9jYiB3b3VsZCBzdG9wIGl0
ZXJhdGluZwphZnRlciBmaW5kIHRoZSBmaXJzdCBtYXRjaGluZyBlbnRyeS4gIE11bHRpcGxlIGNh
bGxiYWNrcyB3b3VsZCBtb2RpZnkKdGhlIGZpcnN0IGVudHJ5LCBidXQgYW55IHN1YnNlcXVlbnQg
ZW50cmllcyBhbmQgdGhlaXIgYXNzb2NpYXRlZCB3YWl0ZXJzCndvdWxkIGV2ZW50dWFsbHkgdGlt
ZW91dCBzaW5jZSB0aGV5IGRvbid0IGJlY29tZSB2YWxpZCwgYWxzbyB3YXN0aW5nCm1lbW9yeSBh
bG9uZyB0aGUgd2F5LgoKU2lnbmVkLW9mZi1ieTogRGF2aWQgUmlsZXkgPGRhdmlkcmlsZXlAY2hy
b21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jIHwgMjIg
KysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRn
cHVfdnEuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jCmluZGV4IGRhNzE1
NjhhZGI5YS4uZGQ1ZWFkMjU0MWMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfdnEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYwpA
QCAtNjg0LDggKzY4NCwxMSBAQCBpbnQgdmlydGlvX2dwdV9jbWRfZ2V0X2NhcHNldChzdHJ1Y3Qg
dmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LAogCXN0cnVjdCB2aXJ0aW9fZ3B1X3ZidWZmZXIgKnZi
dWY7CiAJaW50IG1heF9zaXplOwogCXN0cnVjdCB2aXJ0aW9fZ3B1X2Rydl9jYXBfY2FjaGUgKmNh
Y2hlX2VudDsKKwlzdHJ1Y3QgdmlydGlvX2dwdV9kcnZfY2FwX2NhY2hlICpzZWFyY2hfZW50Owog
CXZvaWQgKnJlc3BfYnVmOwogCisJKmNhY2hlX3AgPSBOVUxMOworCiAJaWYgKGlkeCA+PSB2Z2Rl
di0+bnVtX2NhcHNldHMpCiAJCXJldHVybiAtRUlOVkFMOwogCkBAIC03MTYsOSArNzE5LDI2IEBA
IGludCB2aXJ0aW9fZ3B1X2NtZF9nZXRfY2Fwc2V0KHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAq
dmdkZXYsCiAJYXRvbWljX3NldCgmY2FjaGVfZW50LT5pc192YWxpZCwgMCk7CiAJY2FjaGVfZW50
LT5zaXplID0gbWF4X3NpemU7CiAJc3Bpbl9sb2NrKCZ2Z2Rldi0+ZGlzcGxheV9pbmZvX2xvY2sp
OwotCWxpc3RfYWRkX3RhaWwoJmNhY2hlX2VudC0+aGVhZCwgJnZnZGV2LT5jYXBfY2FjaGUpOwor
CS8qIFNlYXJjaCB3aGlsZSB1bmRlciBsb2NrIGluIGNhc2UgaXQgd2FzIGFkZGVkIGJ5IGFub3Ro
ZXIgdGFzay4gKi8KKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KHNlYXJjaF9lbnQsICZ2Z2Rldi0+Y2Fw
X2NhY2hlLCBoZWFkKSB7CisJCWlmIChzZWFyY2hfZW50LT5pZCA9PSB2Z2Rldi0+Y2Fwc2V0c1tp
ZHhdLmlkICYmCisJCSAgICBzZWFyY2hfZW50LT52ZXJzaW9uID09IHZlcnNpb24pIHsKKwkJCSpj
YWNoZV9wID0gc2VhcmNoX2VudDsKKwkJCWJyZWFrOworCQl9CisJfQorCWlmICghKmNhY2hlX3Ap
CisJCWxpc3RfYWRkX3RhaWwoJmNhY2hlX2VudC0+aGVhZCwgJnZnZGV2LT5jYXBfY2FjaGUpOwog
CXNwaW5fdW5sb2NrKCZ2Z2Rldi0+ZGlzcGxheV9pbmZvX2xvY2spOwogCisJaWYgKCpjYWNoZV9w
KSB7CisJCS8qIEVudHJ5IHdhcyBmb3VuZCwgc28gZnJlZSBldmVyeXRoaW5nIHRoYXQgd2FzIGp1
c3QgY3JlYXRlZC4gKi8KKwkJa2ZyZWUocmVzcF9idWYpOworCQlrZnJlZShjYWNoZV9lbnQtPmNh
cHNfY2FjaGUpOworCQlrZnJlZShjYWNoZV9lbnQpOworCQlyZXR1cm4gMDsKKwl9CisKIAljbWRf
cCA9IHZpcnRpb19ncHVfYWxsb2NfY21kX3Jlc3AKIAkJKHZnZGV2LCAmdmlydGlvX2dwdV9jbWRf
Y2Fwc2V0X2NiLCAmdmJ1Ziwgc2l6ZW9mKCpjbWRfcCksCiAJCSBzaXplb2Yoc3RydWN0IHZpcnRp
b19ncHVfcmVzcF9jYXBzZXQpICsgbWF4X3NpemUsCi0tIAoyLjIyLjAucmMyLjM4My5nZjRmYmJm
MzBjMi1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

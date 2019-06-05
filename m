Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B24336844
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 01:44:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CC6895E7;
	Wed,  5 Jun 2019 23:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B13E895E7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 23:44:33 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id 196so216207pgc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 16:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zwf2lq4OY89MkNjiWF+0LhnW12Q+XYPUm3xzzSFfsGc=;
 b=BN8azfcnITNaHEQMaXQ/FspGK+pCWa0e8gfsm/2XG4c2dWK0KiyCWHzyaCYIfw0tx2
 UZS2iEzcE22Qly4fRVjIQD3BtFFscGNLbPY9IEpdQ3NovRRdQUnJVkRFUsgmIiwVEyqy
 QNOgyl/c0LYziaa1GRtlIx4to9lzjjkhl2NYK8nQ8zQQJzxD9jc0s1Jl4rTnECitCfv5
 w+R4uiwUvLdGh+Dkd/Rj74kToO4r5oTvfSpDtGjZ65s3in7Zk4hEwiqEl0HQj8EbEFvn
 XhnudYZsMtlAiL4dUn35nktGmVxOMEvonTxFc7Rsmy8AGuLMaNUlspLvyDl504FDpo6Z
 y9Lw==
X-Gm-Message-State: APjAAAWCbcN+cy/YuLSSGdNtEPDVXcO85FrUoVNVPcCK/2ErkaORaXZl
 5kz3c9Ygx0jqGrHozJvNQ+686MobguM=
X-Google-Smtp-Source: APXvYqyig+GAqhvYzvzXsYbjNJMPdN+fWyPuejoQFAI3jRjtP8BxQTIRqKemQzhkIDjV7vAPg4DEuw==
X-Received: by 2002:a63:d615:: with SMTP id q21mr381674pgg.401.1559778272417; 
 Wed, 05 Jun 2019 16:44:32 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
 by smtp.gmail.com with ESMTPSA id m128sm71835pfb.95.2019.06.05.16.44.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 16:44:31 -0700 (PDT)
From: davidriley@chromium.org
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH 3/4] drm/virtio: Fix cache entry creation race.
Date: Wed,  5 Jun 2019 16:44:22 -0700
Message-Id: <20190605234423.11348-3-davidriley@chromium.org>
X-Mailer: git-send-email 2.22.0.rc1.311.g5d7573a151-goog
In-Reply-To: <20190605234423.11348-1-davidriley@chromium.org>
References: <20190605234423.11348-1-davidriley@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zwf2lq4OY89MkNjiWF+0LhnW12Q+XYPUm3xzzSFfsGc=;
 b=P+zAOQxSjFPWNwxpnYLwFn3h9QlWl4dngQ6RiDF4yle3Hlwdh54wo08HSg3xew7BFa
 M5d+/oLzfDBb6cJsN1NzfSgm16m1c60gEsO4GrXYfwcJTzqJK5JthNdC1idq42gkOlVh
 lM6RaSB4T8dlswjWCTRJT1AcEuqhjKrXlHECg=
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
b19ncHVfcmVzcF9jYXBzZXQpICsgbWF4X3NpemUsCi0tIAoyLjIyLjAucmMxLjMxMS5nNWQ3NTcz
YTE1MS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

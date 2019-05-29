Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC222E6B9
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 22:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F23326E0E2;
	Wed, 29 May 2019 20:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114F06E127;
 Wed, 29 May 2019 20:55:53 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id A993E619ED; Wed, 29 May 2019 20:55:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E89656192E;
 Wed, 29 May 2019 20:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E89656192E
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v3 13/16] drm/msm: Add support to create target specific
 address spaces
Date: Wed, 29 May 2019 14:54:49 -0600
Message-Id: <1559163292-4792-14-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
References: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559163352;
 bh=TB4M/rt699+7GpLoS9OHP7ZRv5MHTXpe7MAOFn1ir+A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K1SxYfaxPcRVBktqRSCBCcGZDnHRjeKIShBucIbMPoRkPBIobEWcBf6r+T14IHJgY
 9+OgbcTkhh2AqydhVmzttXCULUMo4GI7uNu06UtbHkCSmiVSXKGZ2tGpeKXf9NsTNl
 LPQsC2JZFgzv1Y3xp7yDQkK5vKocaxYbr13BvEaU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559163347;
 bh=TB4M/rt699+7GpLoS9OHP7ZRv5MHTXpe7MAOFn1ir+A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OnhxSkrDBTnHxUssHyGW0vZs7PCS1z3HfaZYwlHPLcXL5/I/LzpKoBAQv3J/V27vP
 l8xO+iEqqfNVo4zst0gpmMyFqPhwglA9jAgEihn5VLAaY2KjtySe6VyhhUTILrjP4D
 7mrSKsxib8vrOMrnO3Zmn2ONaTY6D0dRBvTR2dkc=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 hoegsberg@google.com, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgdG8gY3JlYXRlIGEgR1BVIHRhcmdldCBzcGVjaWZpYyBhZGRyZXNzIHNwYWNl
IGZvcgphIGNvbnRleHQuIEZvciB0aG9zZSB0YXJnZXRzIHRoYXQgc3VwcG9ydCBwZXItaW5zdGFu
Y2UKcGFnZXRhYmxlcyB0aGV5IHdpbGwgcmV0dXJuIGEgbmV3IGFkZHJlc3Mgc3BhY2Ugc2V0IHVw
IGZvcgp0aGUgaW5zdGFuY2UgaWYgcG9zc2libGUgb3RoZXJ3aXNlIGp1c3QgdXNlIHRoZSBnbG9i
YWwKZGV2aWNlIHBhZ2V0YWJsZS4KClNpZ25lZC1vZmYtYnk6IEpvcmRhbiBDcm91c2UgPGpjcm91
c2VAY29kZWF1cm9yYS5vcmc+Ci0tLQoKIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jIHwg
MjUgKysrKysrKysrKysrKysrKysrKysrKy0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1
LmggfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vbXNtL21zbV9kcnYuYwppbmRleCA0YzUxMDYzLi5kZDNlYjMwIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNt
L21zbV9kcnYuYwpAQCAtNjA5LDYgKzYwOSwxNCBAQCBzdGF0aWMgdm9pZCBsb2FkX2dwdShzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQogCW11dGV4X3VubG9jaygmaW5pdF9sb2NrKTsKIH0KIAorc3Rh
dGljIHN0cnVjdCBtc21fZ2VtX2FkZHJlc3Nfc3BhY2UgKmNvbnRleHRfYWRkcmVzc19zcGFjZShz
dHJ1Y3QgbXNtX2dwdSAqZ3B1KQoreworCWlmICghZ3B1LT5mdW5jcy0+bmV3X2FkZHJlc3Nfc3Bh
Y2UpCisJCXJldHVybiBncHUtPmFzcGFjZTsKKworCXJldHVybiBncHUtPmZ1bmNzLT5uZXdfYWRk
cmVzc19zcGFjZShncHUpOworfQorCiBzdGF0aWMgaW50IGNvbnRleHRfaW5pdChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpCiB7CiAJc3RydWN0IG1zbV9kcm1f
cHJpdmF0ZSAqcHJpdiA9IGRldi0+ZGV2X3ByaXZhdGU7CkBAIC02MTgsOSArNjI2LDE2IEBAIHN0
YXRpYyBpbnQgY29udGV4dF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1f
ZmlsZSAqZmlsZSkKIAlpZiAoIWN0eCkKIAkJcmV0dXJuIC1FTk9NRU07CiAKKwljdHgtPmFzcGFj
ZSA9IGNvbnRleHRfYWRkcmVzc19zcGFjZShwcml2LT5ncHUpOworCWlmIChJU19FUlIoY3R4LT5h
c3BhY2UpKSB7CisJCWludCByZXQgPSBQVFJfRVJSKGN0eC0+YXNwYWNlKTsKKworCQlrZnJlZShj
dHgpOworCQlyZXR1cm4gcmV0OworCX0KKwogCW1zbV9zdWJtaXRxdWV1ZV9pbml0KGRldiwgY3R4
KTsKIAotCWN0eC0+YXNwYWNlID0gcHJpdi0+Z3B1LT5hc3BhY2U7CiAJZmlsZS0+ZHJpdmVyX3By
aXYgPSBjdHg7CiAKIAlyZXR1cm4gMDsKQEAgLTYzNiw4ICs2NTEsMTIgQEAgc3RhdGljIGludCBt
c21fb3BlbihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUpCiAJ
cmV0dXJuIGNvbnRleHRfaW5pdChkZXYsIGZpbGUpOwogfQogCi1zdGF0aWMgdm9pZCBjb250ZXh0
X2Nsb3NlKHN0cnVjdCBtc21fZmlsZV9wcml2YXRlICpjdHgpCitzdGF0aWMgdm9pZCBjb250ZXh0
X2Nsb3NlKHN0cnVjdCBtc21fZHJtX3ByaXZhdGUgKnByaXYsCisJCXN0cnVjdCBtc21fZmlsZV9w
cml2YXRlICpjdHgpCiB7CisJaWYgKGN0eC0+YXNwYWNlICE9IHByaXYtPmdwdS0+YXNwYWNlKQor
CQltc21fZ2VtX2FkZHJlc3Nfc3BhY2VfcHV0KGN0eC0+YXNwYWNlKTsKKwogCW1zbV9zdWJtaXRx
dWV1ZV9jbG9zZShjdHgpOwogCWtmcmVlKGN0eCk7CiB9CkBAIC02NTIsNyArNjcxLDcgQEAgc3Rh
dGljIHZvaWQgbXNtX3Bvc3RjbG9zZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZHJt
X2ZpbGUgKmZpbGUpCiAJCXByaXYtPmxhc3RjdHggPSBOVUxMOwogCW11dGV4X3VubG9jaygmZGV2
LT5zdHJ1Y3RfbXV0ZXgpOwogCi0JY29udGV4dF9jbG9zZShjdHgpOworCWNvbnRleHRfY2xvc2Uo
cHJpdiwgY3R4KTsKIH0KIAogc3RhdGljIGlycXJldHVybl90IG1zbV9pcnEoaW50IGlycSwgdm9p
ZCAqYXJnKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmggYi9kcml2
ZXJzL2dwdS9kcm0vbXNtL21zbV9ncHUuaAppbmRleCBkNGJmMDUxLi41ODhkN2JhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9ncHUuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9ncHUuaApAQCAtNzcsNiArNzcsNyBAQCBzdHJ1Y3QgbXNtX2dwdV9mdW5jcyB7CiAJ
dm9pZCAoKmdwdV9zZXRfZnJlcSkoc3RydWN0IG1zbV9ncHUgKmdwdSwgdW5zaWduZWQgbG9uZyBm
cmVxKTsKIAlzdHJ1Y3QgbXNtX2dlbV9hZGRyZXNzX3NwYWNlICooKmNyZWF0ZV9hZGRyZXNzX3Nw
YWNlKQogCQkoc3RydWN0IG1zbV9ncHUgKmdwdSk7CisJc3RydWN0IG1zbV9nZW1fYWRkcmVzc19z
cGFjZSAqKCpuZXdfYWRkcmVzc19zcGFjZSkoc3RydWN0IG1zbV9ncHUgKmdwdSk7CiB9OwogCiBz
dHJ1Y3QgbXNtX2dwdSB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs

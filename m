Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 808E94594A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 11:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA4A896DD;
	Fri, 14 Jun 2019 09:51:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA629896DD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 09:51:28 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 564DE21773;
 Fri, 14 Jun 2019 09:51:28 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/2] drm: debugfs: make drm_debugfs_create_files() never fail
Date: Fri, 14 Jun 2019 11:51:10 +0200
Message-Id: <20190614095110.3716-2-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614095110.3716-1-gregkh@linuxfoundation.org>
References: <20190614095110.3716-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560505888;
 bh=xYF0jYvwFqoTUXDgFBnhu44KysgxToBxAJJsBkqliCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oHzJAALIO7AcBSzeUSsFe0LW48S7BxkM6v0w3/dPrv0ijblQ/Febvn4kLH9Y6sMn2
 XYHaS4As6ys/6u5sWtfEWHwveu4ELKTKnBrzqnFHKNs6g5Hr5r1HZjP6nrGQ4Um1Sx
 QeDf062aUGJon7pRSq9+tA4LcI6Z7b93TCK56dE0=
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXMgc3RhdGVkIGJlZm9yZSwgdGhlcmUgaXMgbm8gbmVlZCB0byBjYXJlIGlmIGEgZGVidWdmcyBm
dW5jdGlvbgpzdWNjZWVkcyBvciBub3QsIGFuZCBubyBjb2RlIGxvZ2ljIGluIHRoZSBrZXJuZWwg
c2hvdWxkIGV2ZXIgY2hhbmdlCmJhc2VkIG9uIGEgZGVidWdmcyBmdW5jdGlvbiByZXR1cm4gdmFs
dWUsIHNvIG1ha2UKZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKCkgbmV2ZXIgZmFpbC4gIElmIGl0
IGVuY291bnRlcnMgYW4Kb2RkL3JhcmUvaW1wb3NzaWJsZSBlcnJvciAoaS5lLiBvdXQgb2YgbWVt
b3J5LCBvciBhIGR1cGxpY2F0ZSBkZWJ1Z2ZzCmZpbGVuYW1lIHRvIGJlIGNyZWF0ZWQpLCBqdXN0
IGtlZXAgb24gbW92aW5nIGFzIGlmIG5vdGhpbmcgaW1wcm9wZXIgaGFkCmhhcHBlbmVkLgoKQ2M6
IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNj
OiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgpDYzogU2VhbiBQYXVs
IDxzZWFuQHBvb3JseS5ydW4+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNj
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzLmMgfCAy
NiArKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9k
ZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYwppbmRleCA1MTU1NjkwMDJj
ODYuLjAwOWUxYzBhYzdiNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2Zz
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzLmMKQEAgLTE3Myw5ICsxNzMsOCBA
QCBpbnQgZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKGNvbnN0IHN0cnVjdCBkcm1faW5mb19saXN0
ICpmaWxlcywgaW50IGNvdW50LAogCQkJICAgICBzdHJ1Y3QgZGVudHJ5ICpyb290LCBzdHJ1Y3Qg
ZHJtX21pbm9yICptaW5vcikKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gbWlub3ItPmRl
djsKLQlzdHJ1Y3QgZGVudHJ5ICplbnQ7CiAJc3RydWN0IGRybV9pbmZvX25vZGUgKnRtcDsKLQlp
bnQgaSwgcmV0OworCWludCBpOwogCiAJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKIAkJ
dTMyIGZlYXR1cmVzID0gZmlsZXNbaV0uZHJpdmVyX2ZlYXR1cmVzOwpAQCAtMTg1LDIyICsxODQs
MTMgQEAgaW50IGRybV9kZWJ1Z2ZzX2NyZWF0ZV9maWxlcyhjb25zdCBzdHJ1Y3QgZHJtX2luZm9f
bGlzdCAqZmlsZXMsIGludCBjb3VudCwKIAkJCWNvbnRpbnVlOwogCiAJCXRtcCA9IGttYWxsb2Mo
c2l6ZW9mKHN0cnVjdCBkcm1faW5mb19ub2RlKSwgR0ZQX0tFUk5FTCk7Ci0JCWlmICh0bXAgPT0g
TlVMTCkgewotCQkJcmV0ID0gLTE7Ci0JCQlnb3RvIGZhaWw7Ci0JCX0KLQkJZW50ID0gZGVidWdm
c19jcmVhdGVfZmlsZShmaWxlc1tpXS5uYW1lLCBTX0lGUkVHIHwgU19JUlVHTywKLQkJCQkJICBy
b290LCB0bXAsICZkcm1fZGVidWdmc19mb3BzKTsKLQkJaWYgKCFlbnQpIHsKLQkJCURSTV9FUlJP
UigiQ2Fubm90IGNyZWF0ZSAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkvJXBkLyVzXG4iLAotCQkJCSAg
cm9vdCwgZmlsZXNbaV0ubmFtZSk7Ci0JCQlrZnJlZSh0bXApOwotCQkJcmV0ID0gLTE7Ci0JCQln
b3RvIGZhaWw7Ci0JCX0KKwkJaWYgKHRtcCA9PSBOVUxMKQorCQkJY29udGludWU7CiAKIAkJdG1w
LT5taW5vciA9IG1pbm9yOwotCQl0bXAtPmRlbnQgPSBlbnQ7CisJCXRtcC0+ZGVudCA9IGRlYnVn
ZnNfY3JlYXRlX2ZpbGUoZmlsZXNbaV0ubmFtZSwKKwkJCQkJCVNfSUZSRUcgfCBTX0lSVUdPLCBy
b290LCB0bXAsCisJCQkJCQkmZHJtX2RlYnVnZnNfZm9wcyk7CiAJCXRtcC0+aW5mb19lbnQgPSAm
ZmlsZXNbaV07CiAKIAkJbXV0ZXhfbG9jaygmbWlub3ItPmRlYnVnZnNfbG9jayk7CkBAIC0yMDgs
MTAgKzE5OCw2IEBAIGludCBkcm1fZGVidWdmc19jcmVhdGVfZmlsZXMoY29uc3Qgc3RydWN0IGRy
bV9pbmZvX2xpc3QgKmZpbGVzLCBpbnQgY291bnQsCiAJCW11dGV4X3VubG9jaygmbWlub3ItPmRl
YnVnZnNfbG9jayk7CiAJfQogCXJldHVybiAwOwotCi1mYWlsOgotCWRybV9kZWJ1Z2ZzX3JlbW92
ZV9maWxlcyhmaWxlcywgY291bnQsIG1pbm9yKTsKLQlyZXR1cm4gcmV0OwogfQogRVhQT1JUX1NZ
TUJPTChkcm1fZGVidWdmc19jcmVhdGVfZmlsZXMpOwogCi0tIAoyLjIyLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

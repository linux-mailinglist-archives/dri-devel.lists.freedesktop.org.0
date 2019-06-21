Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1588D4ED11
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 18:21:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A77D66E8F8;
	Fri, 21 Jun 2019 16:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 391B76E8FA;
 Fri, 21 Jun 2019 16:21:35 +0000 (UTC)
Received: from localhost.localdomain (unknown [194.230.155.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85693208C3;
 Fri, 21 Jun 2019 16:21:33 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qiang Yu <yuq825@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] drm/lima: Reduce the amount of logs on deferred probe
 of clocks and reset controller
Date: Fri, 21 Jun 2019 18:21:17 +0200
Message-Id: <20190621162117.22533-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190621162117.22533-1-krzk@kernel.org>
References: <20190621162117.22533-1-krzk@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561134095;
 bh=VQ1gK6vkj14oTbza27TvV5pVzRXxHavJndzesvK8YsM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L8ShRieLALbliX4bD80CpehWcw480E8W9D7C+4nhiShZAIKKUYk9bPeiQnxjXoMdt
 +RBcA9bZ408CDP4RRZoOnzU+OhZNbYECMpnLOIzC7FFzynBmo4S8zMQcsbAVG4bq0n
 dKe6RCru5rgJ4vNRQJoK+/YEh1U4TnPhpDtn7dWk=
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgaXMgbm8gcG9pbnQgdG8gcHJpbnQgZGVmZXJyZWQgcHJvYmUgbWVzc2FnZXMgYXMgZXJy
b3JzLiAgQWRqdXN0CnRoZSBwcmludGtzIGZvciBlcnJvciBwYXRocyBvZiBvYnRhaW5pbmcgY2xv
Y2tzIGFuZCByZXNldCBjb250cm9sbGVyLgpUaGlzIHJlbW92ZXMgdGhlIGVycm9yIG1lc3NhZ2Ug
b2YgbGltYV9jbGtfaW5pdCgpIGNhbGwgaW4gZmF2b3Igb3IKc3BlY2lmaWMgZmFpbHVyZSBtZXNz
YWdlcyBpbnNpZGUuCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtl
cm5lbC5vcmc+CgotLS0KCkNoYW5nZXMgc2luY2UgdjE6CjEuIE5ldyBwYXRjaAotLS0KIGRyaXZl
cnMvZ3B1L2RybS9saW1hL2xpbWFfZGV2aWNlLmMgfCAxOCArKysrKysrKysrKystLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bGltYS9saW1hX2RldmljZS5jCmluZGV4IDlhNmNkODc5YmNiMS4uZDg2YjhkODFhNDgzIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2RldmljZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9saW1hL2xpbWFfZGV2aWNlLmMKQEAgLTg0LDE0ICs4NCwxNiBAQCBzdGF0aWMgaW50
IGxpbWFfY2xrX2luaXQoc3RydWN0IGxpbWFfZGV2aWNlICpkZXYpCiAJZGV2LT5jbGtfYnVzID0g
ZGV2bV9jbGtfZ2V0KGRldi0+ZGV2LCAiYnVzIik7CiAJaWYgKElTX0VSUihkZXYtPmNsa19idXMp
KSB7CiAJCWVyciA9IFBUUl9FUlIoZGV2LT5jbGtfYnVzKTsKLQkJZGV2X2VycihkZXYtPmRldiwg
ImdldCBidXMgY2xrIGZhaWxlZCAlZFxuIiwgZXJyKTsKKwkJaWYgKGVyciAhPSAtRVBST0JFX0RF
RkVSKQorCQkJZGV2X2VycihkZXYtPmRldiwgImdldCBidXMgY2xrIGZhaWxlZCAlZFxuIiwgZXJy
KTsKIAkJcmV0dXJuIGVycjsKIAl9CiAKIAlkZXYtPmNsa19ncHUgPSBkZXZtX2Nsa19nZXQoZGV2
LT5kZXYsICJjb3JlIik7CiAJaWYgKElTX0VSUihkZXYtPmNsa19ncHUpKSB7CiAJCWVyciA9IFBU
Ul9FUlIoZGV2LT5jbGtfZ3B1KTsKLQkJZGV2X2VycihkZXYtPmRldiwgImdldCBjb3JlIGNsayBm
YWlsZWQgJWRcbiIsIGVycik7CisJCWlmIChlcnIgIT0gLUVQUk9CRV9ERUZFUikKKwkJCWRldl9l
cnIoZGV2LT5kZXYsICJnZXQgY29yZSBjbGsgZmFpbGVkICVkXG4iLCBlcnIpOwogCQlyZXR1cm4g
ZXJyOwogCX0KIApAQCAtMTA2LDExICsxMDgsMTcgQEAgc3RhdGljIGludCBsaW1hX2Nsa19pbml0
KHN0cnVjdCBsaW1hX2RldmljZSAqZGV2KQogCWRldi0+cmVzZXQgPSBkZXZtX3Jlc2V0X2NvbnRy
b2xfZ2V0X29wdGlvbmFsKGRldi0+ZGV2LCBOVUxMKTsKIAlpZiAoSVNfRVJSKGRldi0+cmVzZXQp
KSB7CiAJCWVyciA9IFBUUl9FUlIoZGV2LT5yZXNldCk7CisJCWlmIChlcnIgIT0gLUVQUk9CRV9E
RUZFUikKKwkJCWRldl9lcnIoZGV2LT5kZXYsICJnZXQgcmVzZXQgY29udHJvbGxlciBmYWlsZWQg
JWRcbiIsCisJCQkJZXJyKTsKIAkJZ290byBlcnJvcl9vdXQxOwogCX0gZWxzZSBpZiAoZGV2LT5y
ZXNldCAhPSBOVUxMKSB7CiAJCWVyciA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQoZGV2LT5yZXNl
dCk7Ci0JCWlmIChlcnIpCisJCWlmIChlcnIpIHsKKwkJCWRldl9lcnIoZGV2LT5kZXYsCisJCQkJ
InJlc2V0IGNvbnRyb2xsZXIgZGVhc3NlcnQgZmFpbGVkICVkXG4iLCBlcnIpOwogCQkJZ290byBl
cnJvcl9vdXQxOworCQl9CiAJfQogCiAJcmV0dXJuIDA7CkBAIC0yODcsMTAgKzI5NSw4IEBAIGlu
dCBsaW1hX2RldmljZV9pbml0KHN0cnVjdCBsaW1hX2RldmljZSAqbGRldikKIAlkbWFfc2V0X2Nv
aGVyZW50X21hc2sobGRldi0+ZGV2LCBETUFfQklUX01BU0soMzIpKTsKIAogCWVyciA9IGxpbWFf
Y2xrX2luaXQobGRldik7Ci0JaWYgKGVycikgewotCQlkZXZfZXJyKGxkZXYtPmRldiwgImNsayBp
bml0IGZhaWwgJWRcbiIsIGVycik7CisJaWYgKGVycikKIAkJcmV0dXJuIGVycjsKLQl9CiAKIAll
cnIgPSBsaW1hX3JlZ3VsYXRvcl9pbml0KGxkZXYpOwogCWlmIChlcnIpCi0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

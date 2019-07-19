Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BA16DAC8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45306E51C;
	Fri, 19 Jul 2019 04:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9AE6E517
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 04:04:07 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F312218A3;
 Fri, 19 Jul 2019 04:04:06 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 039/141] drm/virtio: Add memory barriers for
 capset cache.
Date: Fri, 19 Jul 2019 00:01:04 -0400
Message-Id: <20190719040246.15945-39-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040246.15945-1-sashal@kernel.org>
References: <20190719040246.15945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509047;
 bh=z2H/Lqyilmw4F0aSDa5FqdI2P5ZjTo7SJxr+w9vCZw8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L0XzCc7MjN9qmQ5JeVUnL2wHOKNCqW3y5oWQuZhZNQkySUJEic9YSY40WJHdweoJa
 VHOdYWEGMNP7dxUCpv5XNzyQT+C4E8L0jQYooQr2IAQM4i4cMBud8AKbw2M55saSyb
 V84I7Uj5vN+qP8X1vzvW2AYzWtUDwQozn8BaBiTs=
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
Cc: Sasha Levin <sashal@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGF2aWQgUmlsZXkgPGRhdmlkcmlsZXlAY2hyb21pdW0ub3JnPgoKWyBVcHN0cmVhbSBj
b21taXQgOWZmM2E1Yzg4ZTFmMWFiMTdhMzE0MDJiOTZkNDVhYmUxNGFhYjlkNyBdCgpBZnRlciBk
YXRhIGlzIGNvcGllZCB0byB0aGUgY2FjaGUgZW50cnksIGF0b21pY19zZXQgaXMgdXNlZCBpbmRp
Y2F0ZQp0aGF0IHRoZSBkYXRhIGlzIHRoZSBlbnRyeSBpcyB2YWxpZCB3aXRob3V0IGFwcHJvcHJp
YXRlIG1lbW9yeSBiYXJyaWVycy4KU2ltaWxhcmx5IHRoZSByZWFkIHNpZGUgd2FzIG1pc3Npbmcg
dGhlIGNvcnJlc3BvbmRpbmcgbWVtb3J5IGJhcnJpZXJzLgoKU2lnbmVkLW9mZi1ieTogRGF2aWQg
UmlsZXkgPGRhdmlkcmlsZXlAY2hyb21pdW0ub3JnPgpMaW5rOiBodHRwOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDYxMDIxMTgxMC4yNTMyMjctNS1kYXZpZHJp
bGV5QGNocm9taXVtLm9yZwpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVk
aGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jIHwgMyArKysKIGRyaXZl
cnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jICAgIHwgMiArKwogMiBmaWxlcyBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfaW9jdGwuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9pb2N0bC5jCmlu
ZGV4IDE0Y2U4MTg4YzA1Mi4uZmU4MjJkODZmYjhiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdmlydGlvL3ZpcnRncHVfaW9jdGwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfaW9jdGwuYwpAQCAtNTk3LDYgKzU5Nyw5IEBAIHN0YXRpYyBpbnQgdmlydGlvX2dwdV9n
ZXRfY2Fwc19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCWlmICghcmV0KQogCQlyZXR1
cm4gLUVCVVNZOwogCisJLyogaXNfdmFsaWQgY2hlY2sgbXVzdCBwcm9jZWVkIGJlZm9yZSBjb3B5
IG9mIHRoZSBjYWNoZSBlbnRyeS4gKi8KKwlzbXBfcm1iKCk7CisKIAlwdHIgPSBjYWNoZV9lbnQt
PmNhcHNfY2FjaGU7CiAKIGNvcHlfZXhpdDoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV92cS5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMK
aW5kZXggM2VmMjRmODllZjkzLi4zNTc1MWQwYjJkZjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS92aXJ0aW8vdmlydGdwdV92cS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmly
dGdwdV92cS5jCkBAIC01ODQsNiArNTg0LDggQEAgc3RhdGljIHZvaWQgdmlydGlvX2dwdV9jbWRf
Y2Fwc2V0X2NiKHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYsCiAJCSAgICBjYWNoZV9l
bnQtPmlkID09IGxlMzJfdG9fY3B1KGNtZC0+Y2Fwc2V0X2lkKSkgewogCQkJbWVtY3B5KGNhY2hl
X2VudC0+Y2Fwc19jYWNoZSwgcmVzcC0+Y2Fwc2V0X2RhdGEsCiAJCQkgICAgICAgY2FjaGVfZW50
LT5zaXplKTsKKwkJCS8qIENvcHkgbXVzdCBvY2N1ciBiZWZvcmUgaXNfdmFsaWQgaXMgc2lnbmFs
bGVkLiAqLworCQkJc21wX3dtYigpOwogCQkJYXRvbWljX3NldCgmY2FjaGVfZW50LT5pc192YWxp
ZCwgMSk7CiAJCQlicmVhazsKIAkJfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

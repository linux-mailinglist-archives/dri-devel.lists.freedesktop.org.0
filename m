Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79E483B47
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 23:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC616E560;
	Tue,  6 Aug 2019 21:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AED6E562;
 Tue,  6 Aug 2019 21:34:18 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A06EA216F4;
 Tue,  6 Aug 2019 21:34:17 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 30/59] drm/amd/powerplay: fix null pointer
 dereference around dpm state relates
Date: Tue,  6 Aug 2019 17:32:50 -0400
Message-Id: <20190806213319.19203-30-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806213319.19203-1-sashal@kernel.org>
References: <20190806213319.19203-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565127258;
 bh=SW2v2vdzS/8zPs2QA6T6uw7sxmgEWHGl2EshkHf2GcQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rZfkgAgNEh+TYfloj0ieIirFT+CmVa2Xh13EQRBkpA1abfTGOiWsKk7/fixWJvZt6
 r6108+q/IGhtOPNNceI/6ngKWgV7YQibXnqJyjoX0taRsCm01OonIRvTMzK/QposIo
 nMIP/xV/vcLM1rT+N/rvKpJyujVZCDpWbF7WYs4U=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 Evan Quan <evan.quan@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRXZhbiBRdWFuIDxldmFuLnF1YW5AYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDQ3
OTE1NmYyZTU1NDAwNzczNzdhODIzZWFmNWE0MjYzYmQzMjkwNjMgXQoKRFBNIHN0YXRlIHJlbGF0
ZXMgYXJlIG5vdCBzdXBwb3J0ZWQgb24gdGhlIG5ldyBTVyBTTVUgQVNJQ3MuIEJ1dCBzdGlsbApp
dCdzIG5vdCBPSyB0byB0cmlnZ2VyIG51bGwgcG9pbnRlciBkZXJlZmVyZW5jZSBvbiBhY2Nlc3Np
bmcgdGhlbS4KClNpZ25lZC1vZmYtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+ClJl
dmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9wbS5jICAgICB8IDE4ICsrKysrKysrKysrKystLS0tLQog
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIHwgIDMgKystCiAyIGZp
bGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwppbmRleCBhYmVhYWI0YmYxYmMyLi5kNTU1MTliYzM0
ZTUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfcG0uYwpAQCAtMTQ0LDEyICsx
NDQsMTYgQEAgc3RhdGljIHNzaXplX3QgYW1kZ3B1X2dldF9kcG1fc3RhdGUoc3RydWN0IGRldmlj
ZSAqZGV2LAogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZGRldi0+ZGV2X3ByaXZhdGU7
CiAJZW51bSBhbWRfcG1fc3RhdGVfdHlwZSBwbTsKIAotCWlmIChpc19zdXBwb3J0X3N3X3NtdShh
ZGV2KSAmJiBhZGV2LT5zbXUucHB0X2Z1bmNzLT5nZXRfY3VycmVudF9wb3dlcl9zdGF0ZSkKLQkJ
cG0gPSBhbWRncHVfc211X2dldF9jdXJyZW50X3Bvd2VyX3N0YXRlKGFkZXYpOwotCWVsc2UgaWYg
KGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+Z2V0X2N1cnJlbnRfcG93ZXJfc3RhdGUpCisJaWYg
KGlzX3N1cHBvcnRfc3dfc211KGFkZXYpKSB7CisJCWlmIChhZGV2LT5zbXUucHB0X2Z1bmNzLT5n
ZXRfY3VycmVudF9wb3dlcl9zdGF0ZSkKKwkJCXBtID0gYW1kZ3B1X3NtdV9nZXRfY3VycmVudF9w
b3dlcl9zdGF0ZShhZGV2KTsKKwkJZWxzZQorCQkJcG0gPSBhZGV2LT5wbS5kcG0udXNlcl9zdGF0
ZTsKKwl9IGVsc2UgaWYgKGFkZXYtPnBvd2VycGxheS5wcF9mdW5jcy0+Z2V0X2N1cnJlbnRfcG93
ZXJfc3RhdGUpIHsKIAkJcG0gPSBhbWRncHVfZHBtX2dldF9jdXJyZW50X3Bvd2VyX3N0YXRlKGFk
ZXYpOwotCWVsc2UKKwl9IGVsc2UgewogCQlwbSA9IGFkZXYtPnBtLmRwbS51c2VyX3N0YXRlOwor
CX0KIAogCXJldHVybiBzbnByaW50ZihidWYsIFBBR0VfU0laRSwgIiVzXG4iLAogCQkJKHBtID09
IFBPV0VSX1NUQVRFX1RZUEVfQkFUVEVSWSkgPyAiYmF0dGVyeSIgOgpAQCAtMTc2LDcgKzE4MCwx
MSBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVfc2V0X2RwbV9zdGF0ZShzdHJ1Y3QgZGV2aWNlICpk
ZXYsCiAJCWdvdG8gZmFpbDsKIAl9CiAKLQlpZiAoYWRldi0+cG93ZXJwbGF5LnBwX2Z1bmNzLT5k
aXNwYXRjaF90YXNrcykgeworCWlmIChpc19zdXBwb3J0X3N3X3NtdShhZGV2KSkgeworCQltdXRl
eF9sb2NrKCZhZGV2LT5wbS5tdXRleCk7CisJCWFkZXYtPnBtLmRwbS51c2VyX3N0YXRlID0gc3Rh
dGU7CisJCW11dGV4X3VubG9jaygmYWRldi0+cG0ubXV0ZXgpOworCX0gZWxzZSBpZiAoYWRldi0+
cG93ZXJwbGF5LnBwX2Z1bmNzLT5kaXNwYXRjaF90YXNrcykgewogCQlhbWRncHVfZHBtX2Rpc3Bh
dGNoX3Rhc2soYWRldiwgQU1EX1BQX1RBU0tfRU5BQkxFX1VTRVJfU1RBVEUsICZzdGF0ZSk7CiAJ
fSBlbHNlIHsKIAkJbXV0ZXhfbG9jaygmYWRldi0+cG0ubXV0ZXgpOwpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9wb3dlcnBsYXkvYW1kZ3B1X3NtdS5jCmluZGV4IGVlYzMyOWFiNjAzNzAuLjYxYTZkMTgz
YzE1M2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2FtZGdwdV9z
bXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKQEAg
LTYzLDcgKzYzLDggQEAgaW50IHNtdV9nZXRfcG93ZXJfbnVtX3N0YXRlcyhzdHJ1Y3Qgc211X2Nv
bnRleHQgKnNtdSwKIAogCS8qIG5vdCBzdXBwb3J0IHBvd2VyIHN0YXRlICovCiAJbWVtc2V0KHN0
YXRlX2luZm8sIDAsIHNpemVvZihzdHJ1Y3QgcHBfc3RhdGVzX2luZm8pKTsKLQlzdGF0ZV9pbmZv
LT5udW1zID0gMDsKKwlzdGF0ZV9pbmZvLT5udW1zID0gMTsKKwlzdGF0ZV9pbmZvLT5zdGF0ZXNb
MF0gPSBQT1dFUl9TVEFURV9UWVBFX0RFRkFVTFQ7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

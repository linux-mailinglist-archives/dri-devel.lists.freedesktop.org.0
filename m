Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CFF83B4C
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 23:34:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA3C16E564;
	Tue,  6 Aug 2019 21:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA256E564;
 Tue,  6 Aug 2019 21:34:21 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5BA2E216F4;
 Tue,  6 Aug 2019 21:34:20 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 31/59] drm/amdgpu: fix error handling in
 amdgpu_cs_process_fence_dep
Date: Tue,  6 Aug 2019 17:32:51 -0400
Message-Id: <20190806213319.19203-31-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806213319.19203-1-sashal@kernel.org>
References: <20190806213319.19203-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565127261;
 bh=Qy8p0t2orEtpqAiJVyCKiKQTIy0DM+ggYlbtmfpPT8E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aFfuMDYLUPE59dEQ8uL2O2xuaH5IMyfZfW9KNljx78r5tH92bD4XjfGyWv+ETCMSb
 4UMGthAs41iegKbukmzR5Byxf3ZFg8lG1JwhPW1Jdbf8bWh0TkE3ylRcoiE+psN4KH
 nQUjZEv94jEhv9hzCo9iEP1CViS8dyNLmcpQfl9s=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgNjdkMDg1OWUyNzU4ZWY5OTJmZDMyNDk5NzQ3Y2U0YjEwMzhhNjNjMCBdCgpX
ZSBhbHdheXMgbmVlZCB0byBkcm9wIHRoZSBjdHggcmVmZXJlbmNlIGFuZCBzaG91bGQgY2hlY2sK
Zm9yIGVycm9ycyBmaXJzdCBhbmQgdGhlbiBkZXJlZmVyZW5jZSB0aGUgZmVuY2UgcG9pbnRlci4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KUmV2aWV3ZWQtYnk6IENodW5taW5nIFpob3UgPGRhdmlkMS56aG91QGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jIHwgMjYgKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCmluZGV4IDJmNjIzOWI2YmU2ZmUuLmZl
MDI4NTYxZGMwZTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9jcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCkBAIC0x
MDkzLDI5ICsxMDkzLDI3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2NzX3Byb2Nlc3NfZmVuY2VfZGVw
KHN0cnVjdCBhbWRncHVfY3NfcGFyc2VyICpwLAogCQkJcmV0dXJuIHI7CiAJCX0KIAotCQlmZW5j
ZSA9IGFtZGdwdV9jdHhfZ2V0X2ZlbmNlKGN0eCwgZW50aXR5LAotCQkJCQkgICAgIGRlcHNbaV0u
aGFuZGxlKTsKKwkJZmVuY2UgPSBhbWRncHVfY3R4X2dldF9mZW5jZShjdHgsIGVudGl0eSwgZGVw
c1tpXS5oYW5kbGUpOworCQlhbWRncHVfY3R4X3B1dChjdHgpOworCisJCWlmIChJU19FUlIoZmVu
Y2UpKQorCQkJcmV0dXJuIFBUUl9FUlIoZmVuY2UpOworCQllbHNlIGlmICghZmVuY2UpCisJCQlj
b250aW51ZTsKIAogCQlpZiAoY2h1bmstPmNodW5rX2lkID09IEFNREdQVV9DSFVOS19JRF9TQ0hF
RFVMRURfREVQRU5ERU5DSUVTKSB7Ci0JCQlzdHJ1Y3QgZHJtX3NjaGVkX2ZlbmNlICpzX2ZlbmNl
ID0gdG9fZHJtX3NjaGVkX2ZlbmNlKGZlbmNlKTsKKwkJCXN0cnVjdCBkcm1fc2NoZWRfZmVuY2Ug
KnNfZmVuY2U7CiAJCQlzdHJ1Y3QgZG1hX2ZlbmNlICpvbGQgPSBmZW5jZTsKIAorCQkJc19mZW5j
ZSA9IHRvX2RybV9zY2hlZF9mZW5jZShmZW5jZSk7CiAJCQlmZW5jZSA9IGRtYV9mZW5jZV9nZXQo
JnNfZmVuY2UtPnNjaGVkdWxlZCk7CiAJCQlkbWFfZmVuY2VfcHV0KG9sZCk7CiAJCX0KIAotCQlp
ZiAoSVNfRVJSKGZlbmNlKSkgewotCQkJciA9IFBUUl9FUlIoZmVuY2UpOwotCQkJYW1kZ3B1X2N0
eF9wdXQoY3R4KTsKKwkJciA9IGFtZGdwdV9zeW5jX2ZlbmNlKHAtPmFkZXYsICZwLT5qb2ItPnN5
bmMsIGZlbmNlLCB0cnVlKTsKKwkJZG1hX2ZlbmNlX3B1dChmZW5jZSk7CisJCWlmIChyKQogCQkJ
cmV0dXJuIHI7Ci0JCX0gZWxzZSBpZiAoZmVuY2UpIHsKLQkJCXIgPSBhbWRncHVfc3luY19mZW5j
ZShwLT5hZGV2LCAmcC0+am9iLT5zeW5jLCBmZW5jZSwKLQkJCQkJdHJ1ZSk7Ci0JCQlkbWFfZmVu
Y2VfcHV0KGZlbmNlKTsKLQkJCWFtZGdwdV9jdHhfcHV0KGN0eCk7Ci0JCQlpZiAocikKLQkJCQly
ZXR1cm4gcjsKLQkJfQogCX0KIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

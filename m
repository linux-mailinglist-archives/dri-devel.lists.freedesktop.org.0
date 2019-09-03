Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B17A6E78
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2660A8981B;
	Tue,  3 Sep 2019 16:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA8628970E;
 Tue,  3 Sep 2019 16:26:34 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E647F23789;
 Tue,  3 Sep 2019 16:26:33 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 044/167] drm/amdgpu: validate user pitch alignment
Date: Tue,  3 Sep 2019 12:23:16 -0400
Message-Id: <20190903162519.7136-44-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527994;
 bh=99vI5vKcRGeRvP/ZZt4/CfY7lB6MsEgoUTllPFqFQXc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dp6fYkyIwKb9eqAotN4S9ZjF3u/UOnXnkQYx8CEwIRlQ4NBV5hESYAsve3r7sA7mW
 /BSJ0hpsHS+ZtWsk2HVaqngz7BLT/GrcUgCjIYTNx7T7PgxiRXMfdWxBovtAIR8fEc
 mlq81XCbAF2u7p8g+M9aaxnQhSGGGJ4oVDx4GVkw=
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
Cc: Sasha Levin <sashal@kernel.org>, Yu Zhao <yuzhao@google.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWXUgWmhhbyA8eXV6aGFvQGdvb2dsZS5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCA4OWYy
M2I2ZWZlZjU1NDc2NjE3N2JmNTFhYTc1NGJjZTE0YzNlN2RhIF0KClVzZXJzcGFjZSBtYXkgcmVx
dWVzdCBwaXRjaCBhbGlnbm1lbnQgdGhhdCBpcyBub3Qgc3VwcG9ydGVkIGJ5IEdQVS4KU29tZSBy
ZXF1ZXN0cyAzMiwgYnV0IEdQVSBpZ25vcmVzIGl0IGFuZCB1c2VzIGRlZmF1bHQgNjQgd2hlbiBj
cHAgaXMKNC4gSWYgR0VNIG9iamVjdCBpcyBhbGxvY2F0ZWQgYmFzZWQgb24gdGhlIHNtYWxsZXIg
YWxpZ25tZW50LCBHUFUKRE1BIHdpbGwgZ28gb3V0IG9mIGJvdW5kLgoKQ2M6IHN0YWJsZUB2Z2Vy
Lmtlcm5lbC5vcmcgIyB2NC4yKwpSZXZpZXdlZC1ieTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5k
YWVuemVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFl1IFpoYW8gPHl1emhhb0Bnb29nbGUuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+
ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jIHwgMTAgKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rpc3BsYXkuYwppbmRleCA2ODZhMjZkZTUwZjkxLi42ZTY3ODE0ZDMzZTI5
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMKQEAgLTUy
Nyw2ICs1MjcsMTYgQEAgYW1kZ3B1X2Rpc3BsYXlfdXNlcl9mcmFtZWJ1ZmZlcl9jcmVhdGUoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwKIAlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iajsKIAlzdHJ1
Y3QgYW1kZ3B1X2ZyYW1lYnVmZmVyICphbWRncHVfZmI7CiAJaW50IHJldDsKKwlzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiA9IGRldi0+ZGV2X3ByaXZhdGU7CisJaW50IGNwcCA9IGRybV9mb3Jt
YXRfcGxhbmVfY3BwKG1vZGVfY21kLT5waXhlbF9mb3JtYXQsIDApOworCWludCBwaXRjaCA9IG1v
ZGVfY21kLT5waXRjaGVzWzBdIC8gY3BwOworCisJcGl0Y2ggPSBhbWRncHVfYWxpZ25fcGl0Y2go
YWRldiwgcGl0Y2gsIGNwcCwgZmFsc2UpOworCWlmIChtb2RlX2NtZC0+cGl0Y2hlc1swXSAhPSBw
aXRjaCkgeworCQlEUk1fREVCVUdfS01TKCJJbnZhbGlkIHBpdGNoOiBleHBlY3RpbmcgJWQgYnV0
IGdvdCAlZFxuIiwKKwkJCSAgICAgIHBpdGNoLCBtb2RlX2NtZC0+cGl0Y2hlc1swXSk7CisJCXJl
dHVybiBFUlJfUFRSKC1FSU5WQUwpOworCX0KIAogCW9iaiA9IGRybV9nZW1fb2JqZWN0X2xvb2t1
cChmaWxlX3ByaXYsIG1vZGVfY21kLT5oYW5kbGVzWzBdKTsKIAlpZiAob2JqID09ICBOVUxMKSB7
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==

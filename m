Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AEDA6E7A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 18:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0AEB89804;
	Tue,  3 Sep 2019 16:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B49689804;
 Tue,  3 Sep 2019 16:26:37 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 933CF238C7;
 Tue,  3 Sep 2019 16:26:36 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 045/167] drm/amdgpu: validate user GEM object size
Date: Tue,  3 Sep 2019 12:23:17 -0400
Message-Id: <20190903162519.7136-45-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567527997;
 bh=iMc28nEHo4LwcU2m4S1Z3UyNfivaugakbuC8bbOlxuQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t4IVzicSxrtGse5+0+iqgN3MbGIqlNjux/jQ6/1O6W4IeMBDn0J3XM9kkgKYghIkr
 8vn3nOW85xRAevJoNC+U8taw9O/QTkHRsjbkzTl7jJiHNr4ghDrUV23cbTM1Wh+e9U
 84UlSh6CHDxU1dPuxQzAJb4e3nfKbxrtGU2008zM=
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

RnJvbTogWXUgWmhhbyA8eXV6aGFvQGdvb2dsZS5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCBjNGEz
MmIyNjZkYTdiYjcwMmU2MDM4MWNhMGMzNWVhZGRiYzg5YTZjIF0KCldoZW4gY3JlYXRpbmcgZnJh
bWUgYnVmZmVyLCB1c2Vyc3BhY2UgbWF5IHJlcXVlc3QgdG8gYXR0YWNoIHRvIGEKcHJldmlvdXNs
eSBhbGxvY2F0ZWQgR0VNIG9iamVjdCB0aGF0IGlzIHNtYWxsZXIgdGhhbiB3aGF0IEdQVQpyZXF1
aXJlcy4gVmFsaWRhdGlvbiBtdXN0IGJlIGRvbmUgdG8gcHJldmVudCBvdXQtb2YtYm91bmQgRE1B
LApvdGhlcndpc2UgaXQgY291bGQgYmUgZXhwbG9pdGVkIHRvIHJldmVhbCBzZW5zaXRpdmUgZGF0
YS4KClRoaXMgZml4IGlzIG5vdCBkb25lIGluIGEgY29tbW9uIGNvZGUgcGF0aCBiZWNhdXNlIGlu
ZGl2aWR1YWwKZHJpdmVyIG1pZ2h0IGhhdmUgZGlmZmVyZW50IHJlcXVpcmVtZW50LgoKQ2M6IHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyB2NC4yKwpSZXZpZXdlZC1ieTogTWljaGVsIETDpG56ZXIg
PG1pY2hlbC5kYWVuemVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFl1IFpoYW8gPHl1emhhb0Bn
b29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVy
QGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jIHwgOCArKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGlzcGxheS5jCmluZGV4IDZlNjc4MTRkMzNlMjkuLjEwMzVhNDdm
ODFjOWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kaXNw
bGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rpc3BsYXkuYwpA
QCAtNTI3LDYgKzUyNyw3IEBAIGFtZGdwdV9kaXNwbGF5X3VzZXJfZnJhbWVidWZmZXJfY3JlYXRl
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmo7CiAJ
c3RydWN0IGFtZGdwdV9mcmFtZWJ1ZmZlciAqYW1kZ3B1X2ZiOwogCWludCByZXQ7CisJaW50IGhl
aWdodDsKIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGRldi0+ZGV2X3ByaXZhdGU7CiAJ
aW50IGNwcCA9IGRybV9mb3JtYXRfcGxhbmVfY3BwKG1vZGVfY21kLT5waXhlbF9mb3JtYXQsIDAp
OwogCWludCBwaXRjaCA9IG1vZGVfY21kLT5waXRjaGVzWzBdIC8gY3BwOwpAQCAtNTUxLDYgKzU1
MiwxMyBAQCBhbWRncHVfZGlzcGxheV91c2VyX2ZyYW1lYnVmZmVyX2NyZWF0ZShzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LAogCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKIAl9CiAKKwloZWlnaHQg
PSBBTElHTihtb2RlX2NtZC0+aGVpZ2h0LCA4KTsKKwlpZiAob2JqLT5zaXplIDwgcGl0Y2ggKiBo
ZWlnaHQpIHsKKwkJRFJNX0RFQlVHX0tNUygiSW52YWxpZCBHRU0gc2l6ZTogZXhwZWN0aW5nID49
ICVkIGJ1dCBnb3QgJXp1XG4iLAorCQkJICAgICAgcGl0Y2ggKiBoZWlnaHQsIG9iai0+c2l6ZSk7
CisJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOworCX0KKwogCWFtZGdwdV9mYiA9IGt6YWxsb2Mo
c2l6ZW9mKCphbWRncHVfZmIpLCBHRlBfS0VSTkVMKTsKIAlpZiAoYW1kZ3B1X2ZiID09IE5VTEwp
IHsKIAkJZHJtX2dlbV9vYmplY3RfcHV0X3VubG9ja2VkKG9iaik7Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

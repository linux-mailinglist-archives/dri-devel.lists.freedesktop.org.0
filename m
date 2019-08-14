Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 657298C642
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 04:14:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35136E15F;
	Wed, 14 Aug 2019 02:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F2A6E15F;
 Wed, 14 Aug 2019 02:14:16 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 59CF020842;
 Wed, 14 Aug 2019 02:14:15 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 105/123] drm/amdgpu: pin the csb buffer on hw init
 for gfx v8
Date: Tue, 13 Aug 2019 22:10:29 -0400
Message-Id: <20190814021047.14828-105-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814021047.14828-1-sashal@kernel.org>
References: <20190814021047.14828-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565748856;
 bh=wozasWgbjk3RDT7vvWL0bibciU5WOlPVahhGuZNQ2Y8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=niVcyaQBBh3zH76faNFvxu9fbPTgDrMSq6hxZDWw/PWqELhaQwvsEdP8r5JHNf25T
 osi5ruRzHr+oDDeWNMBNnELslg1gKAsts9UGknCR+q2QToR+rBCn0H9hwU6/wM/ku0
 +JE1mUIZM0O39WcybV6imloe2WI4Nx0Z1QFhq/Bk=
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
Cc: Sasha Levin <sashal@kernel.org>, Paul Gover <pmw.gover@yahoo.co.uk>,
 Feifei Xu <Feifei.Xu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, Xiaojie Yuan <xiaojie.yuan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTGlrdW4gR2FvIDxMaWt1bi5HYW9AYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDcy
Y2RhOWJiNWUyMTlhZWEwZjJmNjJmNTZhZTA1MTk4YzU5MDIyYTcgXQoKV2l0aG91dCB0aGlzIHBp
biwgdGhlIGNzYiBidWZmZXIgd2lsbCBiZSBmaWxsZWQgd2l0aCBpbmNvbnNpc3RlbnQKZGF0YSBh
ZnRlciBTMyByZXN1bWUuIEFuZCB0aGF0IHdpbGwgY2F1c2VzIGdmeCBoYW5nIG9uIGdmeG9mZgpl
eGl0IHNpbmNlIHRoaXMgY3NiIHdpbGwgYmUgZXhlY3V0ZWQgdGhlbi4KClNpZ25lZC1vZmYtYnk6
IExpa3VuIEdhbyA8TGlrdW4uR2FvQGFtZC5jb20+ClRlc3RlZC1ieTogUGF1bCBHb3ZlciA8cG13
LmdvdmVyQHlhaG9vLmNvLnVrPgpSZXZpZXdlZC1ieTogRmVpZmVpIFh1IDxGZWlmZWkuWHVAYW1k
LmNvbT4KUmV2aWV3ZWQtYnk6IFhpYW9qaWUgWXVhbiA8eGlhb2ppZS55dWFuQGFtZC5jb20+ClNp
Z25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92OF8wLmMgfCA0MCArKysrKysrKysrKysrKysrKysrKysr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2dmeF92OF8wLmMKaW5kZXggMDI5NTVlNmU5ZGQ5ZS4uYzIxZWY5OWNjNTkwZiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y4XzAuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjhfMC5jCkBAIC0xMzE3LDYgKzEzMTcsMzkgQEAg
c3RhdGljIGludCBnZnhfdjhfMF9ybGNfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
IAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBnZnhfdjhfMF9jc2JfdnJhbV9waW4oc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCit7CisJaW50IHI7CisKKwlyID0gYW1kZ3B1X2JvX3Jlc2Vy
dmUoYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmosIGZhbHNlKTsKKwlpZiAodW5saWtlbHko
ciAhPSAwKSkKKwkJcmV0dXJuIHI7CisKKwlyID0gYW1kZ3B1X2JvX3BpbihhZGV2LT5nZngucmxj
LmNsZWFyX3N0YXRlX29iaiwKKwkJCUFNREdQVV9HRU1fRE9NQUlOX1ZSQU0pOworCWlmICghcikK
KwkJYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9ncHVfYWRkciA9CisJCQlhbWRncHVfYm9fZ3B1
X29mZnNldChhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaik7CisKKwlhbWRncHVfYm9fdW5y
ZXNlcnZlKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqKTsKKworCXJldHVybiByOworfQor
CitzdGF0aWMgdm9pZCBnZnhfdjhfMF9jc2JfdnJhbV91bnBpbihzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldikKK3sKKwlpbnQgcjsKKworCWlmICghYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9v
YmopCisJCXJldHVybjsKKworCXIgPSBhbWRncHVfYm9fcmVzZXJ2ZShhZGV2LT5nZngucmxjLmNs
ZWFyX3N0YXRlX29iaiwgdHJ1ZSk7CisJaWYgKGxpa2VseShyID09IDApKSB7CisJCWFtZGdwdV9i
b191bnBpbihhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX29iaik7CisJCWFtZGdwdV9ib191bnJl
c2VydmUoYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOworCX0KK30KKwogc3RhdGljIHZv
aWQgZ2Z4X3Y4XzBfbWVjX2Zpbmkoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiB7CiAJYW1k
Z3B1X2JvX2ZyZWVfa2VybmVsKCZhZGV2LT5nZngubWVjLmhwZF9lb3Bfb2JqLCBOVUxMLCBOVUxM
KTsKQEAgLTQ3NzcsNiArNDgxMCwxMCBAQCBzdGF0aWMgaW50IGdmeF92OF8wX2h3X2luaXQodm9p
ZCAqaGFuZGxlKQogCWdmeF92OF8wX2luaXRfZ29sZGVuX3JlZ2lzdGVycyhhZGV2KTsKIAlnZnhf
djhfMF9jb25zdGFudHNfaW5pdChhZGV2KTsKIAorCXIgPSBnZnhfdjhfMF9jc2JfdnJhbV9waW4o
YWRldik7CisJaWYgKHIpCisJCXJldHVybiByOworCiAJciA9IGFkZXYtPmdmeC5ybGMuZnVuY3Mt
PnJlc3VtZShhZGV2KTsKIAlpZiAocikKIAkJcmV0dXJuIHI7CkBAIC00ODkzLDYgKzQ5MzAsOSBA
QCBzdGF0aWMgaW50IGdmeF92OF8wX2h3X2Zpbmkodm9pZCAqaGFuZGxlKQogCWVsc2UKIAkJcHJf
ZXJyKCJybGMgaXMgYnVzeSwgc2tpcCBoYWx0IHJsY1xuIik7CiAJYW1kZ3B1X2dmeF9ybGNfZXhp
dF9zYWZlX21vZGUoYWRldik7CisKKwlnZnhfdjhfMF9jc2JfdnJhbV91bnBpbihhZGV2KTsKKwog
CXJldHVybiAwOwogfQogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==

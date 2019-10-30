Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04797E9FCA
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 16:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993466EA7B;
	Wed, 30 Oct 2019 15:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192FE6EA75;
 Wed, 30 Oct 2019 15:53:33 +0000 (UTC)
Received: from sasha-vm.mshome.net (100.50.158.77.rev.sfr.net [77.158.50.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5525720856;
 Wed, 30 Oct 2019 15:53:31 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 56/81] drm/amdgpu: fix error handling in
 amdgpu_bo_list_create
Date: Wed, 30 Oct 2019 11:49:02 -0400
Message-Id: <20191030154928.9432-56-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191030154928.9432-1-sashal@kernel.org>
References: <20191030154928.9432-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572450813;
 bh=IkLYQnzfqnzRQFMu1Zr8xUgXTKtuTIZGZVf8nzghm+s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WLrBLXGb66JqaW0wDYGVPPuUQQiboUXNoGUfMnkgL0kDSs4tPhV6UeBUdv1GArGbz
 mZ9Mx078Vva6axP9FYXooNjKxW8AqBty11+PnEmXTNUD0Gj79x1MYBq/FGlMTU9rjO
 NPX+TGJin1Wqj+FPMihjw3VepWP15BuYwg3pLZ68=
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
 Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgZGU1MWE1MDE5ZmYzMjk2MDIxOGRhOGZkODk5ZmEzZjM2MWIwMzFlOSBdCgpX
ZSBuZWVkIHRvIGRyb3Agbm9ybWFsIGFuZCB1c2VycHRyIEJPcyBzZXBhcmF0ZWx5LgoKU2lnbmVk
LW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpBY2tl
ZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBM
ZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2JvX2xpc3QuYyB8IDcgKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9ib19saXN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
Ym9fbGlzdC5jCmluZGV4IDdiY2Y4NmM2MTk5OTUuLmQ0YzQ3ODVhYjUyNTYgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9ib19saXN0LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2JvX2xpc3QuYwpAQCAtMTQwLDcgKzE0MCwxMiBA
QCBpbnQgYW1kZ3B1X2JvX2xpc3RfY3JlYXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBz
dHJ1Y3QgZHJtX2ZpbGUgKmZpbHAsCiAJcmV0dXJuIDA7CiAKIGVycm9yX2ZyZWU6Ci0Jd2hpbGUg
KGktLSkgeworCWZvciAoaSA9IDA7IGkgPCBsYXN0X2VudHJ5OyArK2kpIHsKKwkJc3RydWN0IGFt
ZGdwdV9ibyAqYm8gPSB0dG1fdG9fYW1kZ3B1X2JvKGFycmF5W2ldLnR2LmJvKTsKKworCQlhbWRn
cHVfYm9fdW5yZWYoJmJvKTsKKwl9CisJZm9yIChpID0gZmlyc3RfdXNlcnB0cjsgaSA8IG51bV9l
bnRyaWVzOyArK2kpIHsKIAkJc3RydWN0IGFtZGdwdV9ibyAqYm8gPSB0dG1fdG9fYW1kZ3B1X2Jv
KGFycmF5W2ldLnR2LmJvKTsKIAogCQlhbWRncHVfYm9fdW5yZWYoJmJvKTsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

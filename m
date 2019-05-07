Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFA7159AA
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 07:39:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0124689D53;
	Tue,  7 May 2019 05:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD5B89D39
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 05:39:28 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB9B12173B;
 Tue,  7 May 2019 05:39:27 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 31/95] drm/imx: don't skip DP channel disable for
 background plane
Date: Tue,  7 May 2019 01:37:20 -0400
Message-Id: <20190507053826.31622-31-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053826.31622-1-sashal@kernel.org>
References: <20190507053826.31622-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557207568;
 bh=nFYURFvuVpxQr6PZfuvJhJPBqwO7DVZfkSLmcBK9RhA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yt+zQlppAv87d2kOnr6B10znPN/5jgNBeh00Y6NNy064O+WPuEI1q9/XE+BJInv1z
 RVydpuOEUqvX2UZQl7sZ3fjUeqlfZr4/2VvqTET6T00Q7bOj47Pwq5qKwVq5B/u8qx
 MEJj0QMLhqdQnQ4a26b8xbhfwvnsxRMnskckihEo=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+CgpbIFVwc3RyZWFtIGNv
bW1pdCA3YmNkZTI3NWViMWQwYWM4NzkzYzc3YzdlNjY2YTg4NmViMTY2MzNkIF0KCkluIG9yZGVy
IHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSBwbGFuZSBjb2xvciBzcGFjZSBnZXRzIHJlc2V0IGNvcnJl
Y3RseS4KClNpZ25lZC1vZmYtYnk6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRl
PgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpT
aWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14
L2lwdXYzLWNydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMtY3J0Yy5jCmluZGV4IGQ5
NzYzOTFkZmEzMS4uOTU3ZmJmOGM1NWViIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW14
L2lwdXYzLWNydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNydGMuYwpAQCAt
NzksNyArNzksNyBAQCBzdGF0aWMgdm9pZCBpcHVfY3J0Y19kaXNhYmxlX3BsYW5lcyhzdHJ1Y3Qg
aXB1X2NydGMgKmlwdV9jcnRjLAogCWlmIChkaXNhYmxlX3BhcnRpYWwpCiAJCWlwdV9wbGFuZV9k
aXNhYmxlKGlwdV9jcnRjLT5wbGFuZVsxXSwgdHJ1ZSk7CiAJaWYgKGRpc2FibGVfZnVsbCkKLQkJ
aXB1X3BsYW5lX2Rpc2FibGUoaXB1X2NydGMtPnBsYW5lWzBdLCBmYWxzZSk7CisJCWlwdV9wbGFu
ZV9kaXNhYmxlKGlwdV9jcnRjLT5wbGFuZVswXSwgdHJ1ZSk7CiB9CiAKIHN0YXRpYyB2b2lkIGlw
dV9jcnRjX2F0b21pY19kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

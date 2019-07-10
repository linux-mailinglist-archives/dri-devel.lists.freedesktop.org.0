Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7256E648FA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 17:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485B86E0FA;
	Wed, 10 Jul 2019 15:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F5B6E0FA
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:03:48 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D70C216E3;
 Wed, 10 Jul 2019 15:03:47 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 6/7] drm/imx: only send event on crtc disable if
 kept disabled
Date: Wed, 10 Jul 2019 11:03:34 -0400
Message-Id: <20190710150337.7390-6-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710150337.7390-1-sashal@kernel.org>
References: <20190710150337.7390-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562771028;
 bh=TDDEW88Oz2YnyT070OxUKykGb9pOkdk28nz5KPJhTjk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IfetJtL4EQKUyhStghSpahbCNIPJZeMBzERwMrrwjf5OuZNaOfh7Ya7qAR8TsENyG
 mYe646zXRqhBmsPlY9N+xZhNmPruePF01R9p/tLwTRSXGP6IoU1KoGWkbmuWhouJtS
 MpuMk+iIfXfNZrxKS+uBjwDBMMWQ65l/pjuIZlAU=
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iZXJ0IEJlY2tldHQgPGJvYi5iZWNrZXR0QGNvbGxhYm9yYS5jb20+CgpbIFVwc3Ry
ZWFtIGNvbW1pdCA1YWVhYjJiZmM5ZmZhNzJkM2NhNzM0MTY2MzVjYjM3ODVkZmMwNzZmIF0KClRo
ZSBldmVudCB3aWxsIGJlIHNlbnQgYXMgcGFydCBvZiB0aGUgdmJsYW5rIGVuYWJsZSBkdXJpbmcg
dGhlIG1vZGVzZXQKaWYgdGhlIGNydGMgaXMgbm90IGJlaW5nIGtlcHQgZGlzYWJsZWQuCgpGaXhl
czogNWYyZjkxMTU3OGZiICgiZHJtL2lteDogYXRvbWljIHBoYXNlIDMgc3RlcCAxOiBVc2UgYXRv
bWljIGNvbmZpZ3VyYXRpb24iKQoKU2lnbmVkLW9mZi1ieTogUm9iZXJ0IEJlY2tldHQgPGJvYi5i
ZWNrZXR0QGNvbGxhYm9yYS5jb20+ClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBl
bmd1dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5v
cmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2lteC9pcHV2My1jcnRjLmMgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvaXB1djMt
Y3J0Yy5jCmluZGV4IGEyMDIyMzdjMzE1Zi4uODIxMTRmZTJhNDJhIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lw
dXYzLWNydGMuYwpAQCAtNzksNyArNzksNyBAQCBzdGF0aWMgdm9pZCBpcHVfY3J0Y19hdG9taWNf
ZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJZHJtX2NydGNfdmJsYW5rX29mZihjcnRj
KTsKIAogCXNwaW5fbG9ja19pcnEoJmNydGMtPmRldi0+ZXZlbnRfbG9jayk7Ci0JaWYgKGNydGMt
PnN0YXRlLT5ldmVudCkgeworCWlmIChjcnRjLT5zdGF0ZS0+ZXZlbnQgJiYgIWNydGMtPnN0YXRl
LT5hY3RpdmUpIHsKIAkJZHJtX2NydGNfc2VuZF92YmxhbmtfZXZlbnQoY3J0YywgY3J0Yy0+c3Rh
dGUtPmV2ZW50KTsKIAkJY3J0Yy0+c3RhdGUtPmV2ZW50ID0gTlVMTDsKIAl9Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

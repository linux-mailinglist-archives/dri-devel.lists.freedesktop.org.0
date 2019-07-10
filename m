Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4356648F6
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 17:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA336E0F8;
	Wed, 10 Jul 2019 15:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 583C16E0F8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:03:34 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 059A62064A;
 Wed, 10 Jul 2019 15:03:32 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 7/8] drm/imx: only send event on crtc disable if
 kept disabled
Date: Wed, 10 Jul 2019 11:03:17 -0400
Message-Id: <20190710150319.7258-7-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710150319.7258-1-sashal@kernel.org>
References: <20190710150319.7258-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562771014;
 bh=2XnBekel31iUDZXG+ZqF52COM3vc2mVRd223+zpMN2s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e7OqnpyEuRPJVzpgWLGiav15RiRtpmd1gm2aWJFRKWcLAALtJD1htVLCAmEHEAq+q
 SmMhzm4G8Mv9EIubGRdcUarfIzW+PObHiQyi1wfmspNsmsSnc5zxQ5N4ABZA2e3msE
 TD5eKc2+WmxJQ4ZBjOklpu+CoqTql3Dey9Fjd7l4=
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
Y3J0Yy5jCmluZGV4IDc4NDUyMDJkMDQ4Ni4uMTJkZDI2MWZjMzA4IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vaW14L2lwdXYzLWNydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lw
dXYzLWNydGMuYwpAQCAtMTAyLDcgKzEwMiw3IEBAIHN0YXRpYyB2b2lkIGlwdV9jcnRjX2F0b21p
Y19kaXNhYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAlkcm1fY3J0Y192Ymxhbmtfb2ZmKGNy
dGMpOwogCiAJc3Bpbl9sb2NrX2lycSgmY3J0Yy0+ZGV2LT5ldmVudF9sb2NrKTsKLQlpZiAoY3J0
Yy0+c3RhdGUtPmV2ZW50KSB7CisJaWYgKGNydGMtPnN0YXRlLT5ldmVudCAmJiAhY3J0Yy0+c3Rh
dGUtPmFjdGl2ZSkgewogCQlkcm1fY3J0Y19zZW5kX3ZibGFua19ldmVudChjcnRjLCBjcnRjLT5z
dGF0ZS0+ZXZlbnQpOwogCQljcnRjLT5zdGF0ZS0+ZXZlbnQgPSBOVUxMOwogCX0KLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

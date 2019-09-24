Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E766BCCC1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBFC66EA68;
	Tue, 24 Sep 2019 16:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C37D56EA64
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 16:42:37 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4DEC21848;
 Tue, 24 Sep 2019 16:42:36 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 18/87] drm/rockchip: Check for fast link training
 before enabling psr
Date: Tue, 24 Sep 2019 12:40:34 -0400
Message-Id: <20190924164144.25591-18-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343357;
 bh=LwusMpGPNsCVEui+CxCkO+wYv9bCaUMlqnWW/yVJQbo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EMXfdF3GuiLcJVJZl3b1vg9Jzez5QhWKVT0g2OUtULheuApGlChvHMg5pIWwP/Y01
 XbElByQWWKoUmnb7lqt5Rc+1dY+D3bpWifk7VOWX6x2SazBBtmabDuhYzK13aHQCbc
 aESi4qLgMP1X5dKTlfLP5+ADRuO0p4xfeeAQDs7A=
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
Cc: Sasha Levin <sashal@kernel.org>, Zain Wang <wzz@rock-chips.com>,
 dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>,
 Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpbIFVwc3RyZWFtIGNvbW1p
dCBhZDMwOTI4NGE1MmJlNDdjOGIzMTI2YzkzNzYzNThiZjM4MTg2MWJjIF0KCk9uY2Ugd2Ugc3Rh
cnQgc2h1dHRpbmcgb2ZmIHRoZSBsaW5rIGR1cmluZyBQU1IsIHdlJ3JlIGdvaW5nIHRvIHdhbnQg
ZmFzdAp0cmFpbmluZyB0byB3b3JrLiBJZiB0aGUgZGlzcGxheSBkb2Vzbid0IHN1cHBvcnQgZmFz
dCB0cmFpbmluZywgZG9uJ3QKZW5hYmxlIHBzci4KCkNoYW5nZXMgaW4gdjI6Ci0gTm9uZQpDaGFu
Z2VzIGluIHYzOgotIE5vbmUKQ2hhbmdlcyBpbiB2NDoKLSBOb25lCkNoYW5nZXMgaW4gdjU6Ci0g
Tm9uZQoKTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNo
L21zZ2lkLzIwMTkwMjI4MjEwOTM5LjgzMzg2LTMtc2VhbkBwb29ybHkucnVuCkxpbmsgdG8gdjI6
IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDMyNjIw
NDUwOS45NjUxNS0yLXNlYW5AcG9vcmx5LnJ1bgpMaW5rIHRvIHYzOiBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA1MDIxOTQ5NTYuMjE4NDQxLTktc2Vh
bkBwb29ybHkucnVuCkxpbmsgdG8gdjQ6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9y
Zy9wYXRjaC9tc2dpZC8yMDE5MDUwODE2MDkyMC4xNDQ3MzktOC1zZWFuQHBvb3JseS5ydW4KCkNj
OiBaYWluIFdhbmcgPHd6ekByb2NrLWNoaXBzLmNvbT4KQ2M6IFRvbWFzeiBGaWdhIDx0ZmlnYUBj
aHJvbWl1bS5vcmc+ClRlc3RlZC1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4K
UmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+ClNpZ25lZC1vZmYt
Ynk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgpMaW5rOiBodHRwczovL3BhdGNo
d29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA2MTExNjA4NDQuMjU3NDk4LTgt
c2VhbkBwb29ybHkucnVuClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVs
Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4X2RwX2Nv
cmUuYyB8IDkgKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYW5hbG9naXgv
YW5hbG9naXhfZHBfY29yZS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFs
b2dpeF9kcF9jb3JlLmMKaW5kZXggM2Y3ZjQ4ODBiZTA5MS4uMzdiZDU0MTE2NmE1ZSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFsb2dpeC9hbmFsb2dpeF9kcF9jb3JlLmMK
QEAgLTEwMzUsMTYgKzEwMzUsMTcgQEAgc3RhdGljIGludCBhbmFsb2dpeF9kcF9jb21taXQoc3Ry
dWN0IGFuYWxvZ2l4X2RwX2RldmljZSAqZHApCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAor
CS8qIENoZWNrIHdoZXRoZXIgcGFuZWwgc3VwcG9ydHMgZmFzdCB0cmFpbmluZyAqLworCXJldCA9
IGFuYWxvZ2l4X2RwX2Zhc3RfbGlua190cmFpbl9kZXRlY3Rpb24oZHApOworCWlmIChyZXQpCisJ
CWRwLT5wc3JfZW5hYmxlID0gZmFsc2U7CisKIAlpZiAoZHAtPnBzcl9lbmFibGUpIHsKIAkJcmV0
ID0gYW5hbG9naXhfZHBfZW5hYmxlX3NpbmtfcHNyKGRwKTsKIAkJaWYgKHJldCkKIAkJCXJldHVy
biByZXQ7CiAJfQogCi0JLyogQ2hlY2sgd2hldGhlciBwYW5lbCBzdXBwb3J0cyBmYXN0IHRyYWlu
aW5nICovCi0JcmV0ID0gIGFuYWxvZ2l4X2RwX2Zhc3RfbGlua190cmFpbl9kZXRlY3Rpb24oZHAp
OwotCWlmIChyZXQpCi0JCWRwLT5wc3JfZW5hYmxlID0gZmFsc2U7CiAKIAlyZXR1cm4gcmV0Owog
fQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A506DBCF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E6B6E55E;
	Fri, 19 Jul 2019 04:11:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DE56E55E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 04:11:40 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC020218B6;
 Fri, 19 Jul 2019 04:11:39 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 18/60] drm/rockchip: Properly adjust to a true
 clock in adjusted_mode
Date: Fri, 19 Jul 2019 00:10:27 -0400
Message-Id: <20190719041109.18262-18-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719041109.18262-1-sashal@kernel.org>
References: <20190719041109.18262-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509500;
 bh=9lYn+UokrNdnmQEzMGp77Ij+ypQ0JNxsaPAbSUJz2mY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rhao9cW8q5t4TAISiKsOWPVs+WRseYG1k8nRR2YHh4e9tp226caTpen2S80kbt2eT
 jmyHFVYM/VKe2KBK79XGIZrM2s6xQG8KZn6ecmwd8GgCAttAcx18bNgfnUEFD83TsL
 mgMKSQKMBrYpI6FNZGVk+/G3aAZD6S8hg0pXDVdE=
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
Cc: Sasha Levin <sashal@kernel.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Sean Paul <seanpaul@chromium.org>, Yakir Yang <ykk@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKWyBVcHN0cmVh
bSBjb21taXQgOTliOTY4M2YyMTQyYjIwYmFkNzhlNjFmN2Y4MjllODcxNGU0NTY4NSBdCgpXaGVu
IGZpeGluZyB1cCB0aGUgY2xvY2sgaW4gdm9wX2NydGNfbW9kZV9maXh1cCgpIHdlJ3JlIG5vdCBk
b2luZyBpdApxdWl0ZSBjb3JyZWN0bHkuICBTcGVjaWZpY2FsbHkgaWYgd2UndmUgZ290IHRoZSB0
cnVlIGNsb2NrIDI2NjY2NjY2NyBIeiwKd2UnbGwgcGVyZm9ybSB0aGlzIGNhbGN1bGF0aW9uOgog
ICAyNjY2NjY2NjcgLyAxMDAwID0+IDI2NjY2NgoKTGF0ZXIgd2hlbiB3ZSB0cnkgdG8gc2V0IHRo
ZSBjbG9jayB3ZSdsbCBkbyBjbGtfc2V0X3JhdGUoMjY2NjY2ICoKMTAwMCkuICBUaGUgY29tbW9u
IGNsb2NrIGZyYW1ld29yayB3b24ndCBhY3R1YWxseSBwaWNrIHRoZSBwcm9wZXIgY2xvY2sKaW4g
dGhpcyBjYXNlIHNpbmNlIGl0IGFsd2F5cyB3YW50cyBjbG9ja3MgPD0gdGhlIHNwZWNpZmllZCBv
bmUuCgpMZXQncyBzb2x2ZSB0aGlzIGJ5IHVzaW5nIERJVl9ST1VORF9VUC4KCkZpeGVzOiBiNTli
OGRlMzE0OTcgKCJkcm0vcm9ja2NoaXA6IHJldHVybiBhIHRydWUgY2xvY2sgcmF0ZSB0byBhZGp1
c3RlZF9tb2RlIikKU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hy
b21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9y
Zz4KUmV2aWV3ZWQtYnk6IFlha2lyIFlhbmcgPHlra0Byb2NrLWNoaXBzLmNvbT4KU2lnbmVkLW9m
Zi1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KTGluazogaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwNjE0MjI0NzMwLjk4NjIyLTEt
ZGlhbmRlcnNAY2hyb21pdW0ub3JnClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxA
a2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3Zv
cC5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3Zv
cC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYwppbmRleCBm
MWZhOGQ1YzliNTIuLjcwMTA0MjRiMmY4OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jv
Y2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
cm9ja2NoaXBfZHJtX3ZvcC5jCkBAIC04NjEsNyArODYxLDggQEAgc3RhdGljIGJvb2wgdm9wX2Ny
dGNfbW9kZV9maXh1cChzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCiAJc3RydWN0IHZvcCAqdm9wID0g
dG9fdm9wKGNydGMpOwogCiAJYWRqdXN0ZWRfbW9kZS0+Y2xvY2sgPQotCQljbGtfcm91bmRfcmF0
ZSh2b3AtPmRjbGssIG1vZGUtPmNsb2NrICogMTAwMCkgLyAxMDAwOworCQlESVZfUk9VTkRfVVAo
Y2xrX3JvdW5kX3JhdGUodm9wLT5kY2xrLCBtb2RlLT5jbG9jayAqIDEwMDApLAorCQkJICAgICAx
MDAwKTsKIAogCXJldHVybiB0cnVlOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

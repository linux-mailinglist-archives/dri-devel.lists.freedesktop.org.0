Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568FA6DACD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003936E505;
	Fri, 19 Jul 2019 04:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35CB891C0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 04:04:20 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DAC7C218A3;
 Fri, 19 Jul 2019 04:04:19 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 045/141] drm/rockchip: Properly adjust to a true
 clock in adjusted_mode
Date: Fri, 19 Jul 2019 00:01:10 -0400
Message-Id: <20190719040246.15945-45-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040246.15945-1-sashal@kernel.org>
References: <20190719040246.15945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509060;
 bh=NLst7gMiz/Y0OZf4M0sqwFj0qLJ8jcXHlnQdLlKzIX4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rs32Aa8oCJoKWoJKjcx1G9AHat15KUA8EDC/sxucd212mbFrFjFa/SJJGUmb0E1t+
 QIU0hV0ZU6iBkrIFF4QZ1kEVLO32AY9adKcaLdkIjzivgZNXp0+nKcv1QbGmk/j2uU
 qtq/yeaLEZgSdsCtVAJ1oIoAb6IvbGHRIeAC2OiY=
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
cC5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYwppbmRleCBj
ZDU4ZGM4MWNjZjMuLmQxYmY4YzA2YWEzNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jv
Y2tjaGlwL3JvY2tjaGlwX2RybV92b3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
cm9ja2NoaXBfZHJtX3ZvcC5jCkBAIC0xMDE5LDcgKzEwMTksOCBAQCBzdGF0aWMgYm9vbCB2b3Bf
Y3J0Y19tb2RlX2ZpeHVwKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAlzdHJ1Y3Qgdm9wICp2b3Ag
PSB0b192b3AoY3J0Yyk7CiAKIAlhZGp1c3RlZF9tb2RlLT5jbG9jayA9Ci0JCWNsa19yb3VuZF9y
YXRlKHZvcC0+ZGNsaywgbW9kZS0+Y2xvY2sgKiAxMDAwKSAvIDEwMDA7CisJCURJVl9ST1VORF9V
UChjbGtfcm91bmRfcmF0ZSh2b3AtPmRjbGssIG1vZGUtPmNsb2NrICogMTAwMCksCisJCQkgICAg
IDEwMDApOwogCiAJcmV0dXJuIHRydWU7CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

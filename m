Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6556DAB9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A072B6E514;
	Fri, 19 Jul 2019 04:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4659A6E50C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 04:03:52 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 14461218B8;
 Fri, 19 Jul 2019 04:03:50 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 031/141] drm/crc-debugfs: User irqsafe spinlock in
 drm_crtc_add_crc_entry
Date: Fri, 19 Jul 2019 00:00:56 -0400
Message-Id: <20190719040246.15945-31-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040246.15945-1-sashal@kernel.org>
References: <20190719040246.15945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509032;
 bh=guzUZgOKDvGjX7Bi80hdbzQK5EMcnZJJ7C5EuFWknyo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pw3enuzbrI/WbuNBOh3wOt0fN+o9NTjWqWsTjk0WCvpnDmzL8GYfDVISC5LFcsQqp
 GtOp/0oVQdn+SX62SrYBnWbPX0ObDorLkIXo60FIxBJeF+yS1PVWApKJoGBL93HOBs
 5/T/O2F/aUO7bmdrU4K/luHIB59JsJ7BVdf6qGXg=
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
Cc: Sasha Levin <sashal@kernel.org>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KClsgVXBzdHJlYW0g
Y29tbWl0IDE4ODIwMThhNzBlMDYzNzYyMzQxMzNlNjllZGU5ZGQ3NDNiNGRiZDkgXQoKV2UgY2Fu
IGJlIGNhbGxlZCBmcm9tIGFueSBjb250ZXh0LCB3ZSBuZWVkIHRvIGJlIHByZXBhcmVkLgoKTm90
aWNlZCB0aGlzIHdoaWxlIGhhY2tpbmcgb24gdmttcywgd2hpY2ggY2FsbHMgdGhpcyBmdW5jdGlv
biBmcm9tIGEKbm9ybWFsIHdvcmtlci4gV2hpY2ggcmVhbGx5IHVwc2V0cyBsb2NrZGVwLgoKQ2M6
IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21haWwuY29tPgpDYzogVG9t
ZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4KQ2M6IEVtaWwgVmVsaWtvdiA8
ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CkNjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFt
aW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IEJlbmphbWluIEdhaWduYXJkIDxi
ZW5qYW1pbi5nYWlnbmFyZEBsaW5hcm8ub3JnPgpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZy
ZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDYwNTE5NDU1Ni4xNjc0NC0xLWRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2gKU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwu
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyB8IDUgKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9kZWJ1Z2ZzX2NyYy5jCmluZGV4IDAwZTc0MzE1M2U5NC4uMWE2YTViNzhlMzBmIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jCkBAIC0zODksOCArMzg5LDkgQEAgaW50IGRybV9jcnRjX2Fk
ZF9jcmNfZW50cnkoc3RydWN0IGRybV9jcnRjICpjcnRjLCBib29sIGhhc19mcmFtZSwKIAlzdHJ1
Y3QgZHJtX2NydGNfY3JjICpjcmMgPSAmY3J0Yy0+Y3JjOwogCXN0cnVjdCBkcm1fY3J0Y19jcmNf
ZW50cnkgKmVudHJ5OwogCWludCBoZWFkLCB0YWlsOworCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAK
LQlzcGluX2xvY2soJmNyYy0+bG9jayk7CisJc3Bpbl9sb2NrX2lycXNhdmUoJmNyYy0+bG9jaywg
ZmxhZ3MpOwogCiAJLyogQ2FsbGVyIG1heSBub3QgaGF2ZSBub3RpY2VkIHlldCB0aGF0IHVzZXJz
cGFjZSBoYXMgc3RvcHBlZCByZWFkaW5nICovCiAJaWYgKCFjcmMtPmVudHJpZXMpIHsKQEAgLTQy
MSw3ICs0MjIsNyBAQCBpbnQgZHJtX2NydGNfYWRkX2NyY19lbnRyeShzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsIGJvb2wgaGFzX2ZyYW1lLAogCWhlYWQgPSAoaGVhZCArIDEpICYgKERSTV9DUkNfRU5U
UklFU19OUiAtIDEpOwogCWNyYy0+aGVhZCA9IGhlYWQ7CiAKLQlzcGluX3VubG9jaygmY3JjLT5s
b2NrKTsKKwlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZjcmMtPmxvY2ssIGZsYWdzKTsKIAogCXdh
a2VfdXBfaW50ZXJydXB0aWJsZSgmY3JjLT53cSk7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF948C68B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 04:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B106E188;
	Wed, 14 Aug 2019 02:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813CD6E188
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 02:17:07 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A608720843;
 Wed, 14 Aug 2019 02:17:06 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 45/68] drm/rockchip: Suspend DP late
Date: Tue, 13 Aug 2019 22:15:23 -0400
Message-Id: <20190814021548.16001-45-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814021548.16001-1-sashal@kernel.org>
References: <20190814021548.16001-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565749027;
 bh=R9b0WmDUwLwfCrk+r4uWJfaX5hpfWv/qraTPHwJeGe0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=O66RaF7PsGYE0us4sQv0XR+7vGCXuVY0w74XGDdpbDrz2JVMbiAflA7Mq7zS5qUUB
 MQJgPvsfZoey6w7RGsSGucsX74U/bUxh/+xqwU1FS9w1Ljvc+OTOsrj+JKGX+hoFaB
 NLnSdr9MMOCRPN3LmfTv6RQ+0nRU3+xbagc9ElMY=
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
Cc: Sasha Levin <sashal@kernel.org>, linux-rockchip@lists.infradead.org,
 Sean Paul <seanpaul@chromium.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKWyBVcHN0cmVh
bSBjb21taXQgZjdjY2JlZDY1NmY3ODIxMjU5M2NhOTY1ZDlhOGYzNGJmMjRlMGFhYiBdCgpJbiBj
b21taXQgZmU2NGJhNWM2MzIzICgiZHJtL3JvY2tjaGlwOiBSZXN1bWUgRFAgZWFybHkiKSB3ZSBt
b3ZlZApyZXN1bWUgdG8gYmUgZWFybHkgYnV0IGxlZnQgc3VzcGVuZCBhdCBpdHMgbm9ybWFsIHRp
bWUuICBUaGlzIHNlZW1zCmxpa2UgaXQgY291bGQgYmUgT0ssIGJ1dCBjYXN1ZXMgcHJvYmxlbXMg
aWYgYSBzdXNwZW5kIGdldHMgaW50ZXJydXB0ZWQKcGFydHdheSB0aHJvdWdoLiAgVGhlIE9TIG9u
bHkgYmFsYW5jZXMgbWF0Y2hpbmcgc3VzcGVuZC9yZXN1bWUgbGV2ZWxzLgouLi5zbyBpZiBzdXNw
ZW5kIHdhcyBjYWxsZWQgdGhlbiByZXN1bWUgd2lsbCBiZSBjYWxsZWQuICBJZiBzdXNwZW5kCmxh
dGUgd2FzIGNhbGxlZCB0aGVuIHJlc3VtZSBlYXJseSB3aWxsIGJlIGNhbGxlZC4gIC4uLmJ1dCBp
ZiBzdXNwZW5kCndhcyBjYWxsZWQgcmVzdW1lIGVhcmx5IG1pZ2h0IG5vdCBnZXQgY2FsbGVkLiAg
VGhpcyBsZWFkcyB0byBhbgp1bmJhbGFuY2UgaW4gdGhlIGNsb2NrIGVuYWJsZXMgLyBkaXNhYmxl
cy4KCkxldHMgdGFrZSB0aGUgc2ltcGxlIGZpeCBhbmQganVzdCBtb3ZlIHN1c3BlbmQgdG8gYmUg
bGF0ZSB0byBtYXRjaC4KVGhpcyBtYWtlcyB0aGUgUE0gY29yZSB0YWtlIHByb3BlciBjYXJlIGlu
IGtlZXBpbmcgdGhpbmdzIGJhbGFuY2VkLgoKRml4ZXM6IGZlNjRiYTVjNjMyMyAoImRybS9yb2Nr
Y2hpcDogUmVzdW1lIERQIGVhcmx5IikKU2lnbmVkLW9mZi1ieTogRG91Z2xhcyBBbmRlcnNvbiA8
ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVs
QGNocm9taXVtLm9yZz4KTGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Bh
dGNoL21zZ2lkLzIwMTkwODAyMTg0NjE2LjQ0ODIyLTEtZGlhbmRlcnNAY2hyb21pdW0ub3JnClNp
Z25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vcm9ja2NoaXAvYW5hbG9naXhfZHAtcm9ja2NoaXAuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9hbmFsb2dpeF9kcC1yb2NrY2hpcC5jIGIvZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL2FuYWxvZ2l4X2RwLXJvY2tjaGlwLmMKaW5kZXggMDgwZjA1MzUyMTk1MC4u
NmE0ZGEzYTBmZjFjMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2FuYWxv
Z2l4X2RwLXJvY2tjaGlwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2FuYWxvZ2l4
X2RwLXJvY2tjaGlwLmMKQEAgLTQzNiw3ICs0MzYsNyBAQCBzdGF0aWMgaW50IHJvY2tjaGlwX2Rw
X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3Bt
X29wcyByb2NrY2hpcF9kcF9wbV9vcHMgPSB7CiAjaWZkZWYgQ09ORklHX1BNX1NMRUVQCi0JLnN1
c3BlbmQgPSByb2NrY2hpcF9kcF9zdXNwZW5kLAorCS5zdXNwZW5kX2xhdGUgPSByb2NrY2hpcF9k
cF9zdXNwZW5kLAogCS5yZXN1bWVfZWFybHkgPSByb2NrY2hpcF9kcF9yZXN1bWUsCiAjZW5kaWYK
IH07Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 191916DB40
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F52F6E53E;
	Fri, 19 Jul 2019 04:08:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9586E532
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 04:08:16 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 475AE21872;
 Fri, 19 Jul 2019 04:08:15 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 021/101] drm/crc-debugfs: Also sprinkle
 irqrestore over early exits
Date: Fri, 19 Jul 2019 00:06:12 -0400
Message-Id: <20190719040732.17285-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040732.17285-1-sashal@kernel.org>
References: <20190719040732.17285-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509296;
 bh=OwPkD1ZxcC/tQtUPnQiKK8evUVR/5Xj1GmEdTgy3UsU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nJF/XsxxVVgn2Chfj0EFri2eBfKy7fkWi7cIYI+e6axfhVkqIgLoV6VYcXLPAsXhn
 q9Y7/3y4/vjSAMxj88Jmpvu4UxrAjfWZoAIwAZkwIlIYXm4LRg8N2P8vBiZO6NxQsy
 /3KD9ABI3humJq6mBgiyIeZhjni0pvzq+n5Nh3Kk=
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
Y29tbWl0IGQ5OTAwNGQ3MjAxYWE2NTM2NThmZjIzOTBkNmU1MTY1NjdjOTZlYmMgXQoKSS4gd2Fz
LiBibGluZC4KCkNhdWdodCB3aXRoIHZrbXMsIHdoaWNoIGhhcyBzb21lIHJlYWxseSBzbG93IGNy
YyBjb21wdXRhdGlvbiBmdW5jdGlvbi4KCkZpeGVzOiAxODgyMDE4YTcwZTAgKCJkcm0vY3JjLWRl
YnVnZnM6IFVzZXIgaXJxc2FmZSBzcGlubG9jayBpbiBkcm1fY3J0Y19hZGRfY3JjX2VudHJ5IikK
Q2M6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21haWwuY29tPgpDYzog
VG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4KQ2M6IEVtaWwgVmVsaWtv
diA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CkNjOiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVu
amFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4KQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVs
aWtvdkBjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogQmVuamFtaW4gR2FpZ25hcmQgPGJlbmph
bWluLmdhaWduYXJkQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAaW50ZWwuY29tPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA2MDYyMTE1NDQuNTM4OS0xLWRhbmllbC52ZXR0ZXJAZmZ3
bGwuY2gKU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNf
Y3JjLmMKaW5kZXggYTMzNGE4MmZjYjM2Li5jODhlNWZmNDFhZGQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rl
YnVnZnNfY3JjLmMKQEAgLTM4NSw3ICszODUsNyBAQCBpbnQgZHJtX2NydGNfYWRkX2NyY19lbnRy
eShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGJvb2wgaGFzX2ZyYW1lLAogCiAJLyogQ2FsbGVyIG1h
eSBub3QgaGF2ZSBub3RpY2VkIHlldCB0aGF0IHVzZXJzcGFjZSBoYXMgc3RvcHBlZCByZWFkaW5n
ICovCiAJaWYgKCFjcmMtPmVudHJpZXMpIHsKLQkJc3Bpbl91bmxvY2soJmNyYy0+bG9jayk7CisJ
CXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmNyYy0+bG9jaywgZmxhZ3MpOwogCQlyZXR1cm4gLUVJ
TlZBTDsKIAl9CiAKQEAgLTM5Niw3ICszOTYsNyBAQCBpbnQgZHJtX2NydGNfYWRkX2NyY19lbnRy
eShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGJvb2wgaGFzX2ZyYW1lLAogCQlib29sIHdhc19vdmVy
ZmxvdyA9IGNyYy0+b3ZlcmZsb3c7CiAKIAkJY3JjLT5vdmVyZmxvdyA9IHRydWU7Ci0JCXNwaW5f
dW5sb2NrKCZjcmMtPmxvY2spOworCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZjcmMtPmxvY2ss
IGZsYWdzKTsKIAogCQlpZiAoIXdhc19vdmVyZmxvdykKIAkJCURSTV9FUlJPUigiT3ZlcmZsb3cg
b2YgQ1JDIGJ1ZmZlciwgdXNlcnNwYWNlIHJlYWRzIHRvbyBzbG93LlxuIik7Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

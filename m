Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2696DAB0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:03:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB326E50C;
	Fri, 19 Jul 2019 04:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B511B6E50C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 04:03:53 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8492A218BC;
 Fri, 19 Jul 2019 04:03:52 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 032/141] drm/crc-debugfs: Also sprinkle irqrestore
 over early exits
Date: Fri, 19 Jul 2019 00:00:57 -0400
Message-Id: <20190719040246.15945-32-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040246.15945-1-sashal@kernel.org>
References: <20190719040246.15945-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509033;
 bh=WHIAtgyJYC88kgwu3EEgozkb3ZlqsrWEkHRoC+MFPxg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ft3XK9VIucf/PQSay00uZ9sXXrfhde8PUcEih3dD1oCNNz2siJ2euPjPwzyv1QzEU
 D9YO5t33OWl4YQzEgljBSoetrxfPRIOmv4D7NcjekuLaflV2K+6G3mwkuGqUXcyFx1
 UF+GIpi6itcdQm7ve37qjb/2+ELB6EPCaFPt9XEI=
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
Y3JjLmMKaW5kZXggMWE2YTViNzhlMzBmLi5mZGUyOThkOWY1MTAgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rl
YnVnZnNfY3JjLmMKQEAgLTM5NSw3ICszOTUsNyBAQCBpbnQgZHJtX2NydGNfYWRkX2NyY19lbnRy
eShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGJvb2wgaGFzX2ZyYW1lLAogCiAJLyogQ2FsbGVyIG1h
eSBub3QgaGF2ZSBub3RpY2VkIHlldCB0aGF0IHVzZXJzcGFjZSBoYXMgc3RvcHBlZCByZWFkaW5n
ICovCiAJaWYgKCFjcmMtPmVudHJpZXMpIHsKLQkJc3Bpbl91bmxvY2soJmNyYy0+bG9jayk7CisJ
CXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmNyYy0+bG9jaywgZmxhZ3MpOwogCQlyZXR1cm4gLUVJ
TlZBTDsKIAl9CiAKQEAgLTQwNiw3ICs0MDYsNyBAQCBpbnQgZHJtX2NydGNfYWRkX2NyY19lbnRy
eShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGJvb2wgaGFzX2ZyYW1lLAogCQlib29sIHdhc19vdmVy
ZmxvdyA9IGNyYy0+b3ZlcmZsb3c7CiAKIAkJY3JjLT5vdmVyZmxvdyA9IHRydWU7Ci0JCXNwaW5f
dW5sb2NrKCZjcmMtPmxvY2spOworCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZjcmMtPmxvY2ss
IGZsYWdzKTsKIAogCQlpZiAoIXdhc19vdmVyZmxvdykKIAkJCURSTV9FUlJPUigiT3ZlcmZsb3cg
b2YgQ1JDIGJ1ZmZlciwgdXNlcnNwYWNlIHJlYWRzIHRvbyBzbG93LlxuIik7Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

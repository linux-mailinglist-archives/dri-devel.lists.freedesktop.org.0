Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A97D576D5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 02:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1496E577;
	Thu, 27 Jun 2019 00:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422C46E573
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 00:43:04 +0000 (UTC)
Received: from sasha-vm.mshome.net (unknown [107.242.116.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6DD5F217D8;
 Thu, 27 Jun 2019 00:33:56 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.1 63/95] gpu: ipu-v3: image-convert: Fix image
 downsize coefficients
Date: Wed, 26 Jun 2019 20:29:48 -0400
Message-Id: <20190627003021.19867-63-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190627003021.19867-1-sashal@kernel.org>
References: <20190627003021.19867-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1561595638;
 bh=Z2FQXOTKv+1PDnULnMt3wLBqjLRrQA1FAvv1gewbimQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ghrRlHI7YTakET364VtMGgPpNmNcvphOLevt5FchW3tyEnlm3KlZthQ0ZiUR1w3KB
 n83KXBU948tWCelgC1pF7gJCy3OD7mca6JyTvgmTKhQoNZtK4OmUUC7x7hrG/M5rx5
 TniBpqnUmKf4kkwf/V1npkmu5TX1DLUpSD/dsYNE=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Steve Longerbeam <slongerbeam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU3RldmUgTG9uZ2VyYmVhbSA8c2xvbmdlcmJlYW1AZ21haWwuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgOTEyYmJmN2U5Y2E0MjIwOTk5MzVkZDY5ZDNmZjBmZDYyZGIyNDg4MiBdCgpUaGUg
b3V0cHV0IG9mIHRoZSBJQyBkb3duc2l6ZXIgdW5pdCBpbiBib3RoIGRpbWVuc2lvbnMgbXVzdCBi
ZSA8PSAxMDI0CmJlZm9yZSBiZWluZyBwYXNzZWQgdG8gdGhlIElDIHJlc2l6ZXIgdW5pdC4gVGhp
cyB3YXMgY2F1c2luZyBjb3JydXB0ZWQKaW1hZ2VzIHdoZW46CgppbnB1dF9kaW0gPiAxMDI0LCBh
bmQKaW5wdXRfZGltIC8gMiA8IG91dHB1dF9kaW0gPCBpbnB1dF9kaW0KClNvbWUgYnJva2VuIGV4
YW1wbGVzIHdlcmUgMTkyMHgxMDgwIC0+IDEwMjR4NzY4IGFuZCAxOTIweDEwODAgLT4KMTI4MHgx
MDgwLgoKRml4ZXM6IDcwYjliNmIzYmNiMjEgKCJncHU6IGlwdS12MzogaW1hZ2UtY29udmVydDog
Y2FsY3VsYXRlIHBlci10aWxlCnJlc2l6ZSBjb2VmZmljaWVudHMiKQoKU2lnbmVkLW9mZi1ieTog
U3RldmUgTG9uZ2VyYmVhbSA8c2xvbmdlcmJlYW1AZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBQ
aGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpTaWduZWQtb2ZmLWJ5OiBTYXNo
YSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1p
bWFnZS1jb252ZXJ0LmMgfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWlt
YWdlLWNvbnZlcnQuYyBiL2RyaXZlcnMvZ3B1L2lwdS12My9pcHUtaW1hZ2UtY29udmVydC5jCmlu
ZGV4IDE5ZDNiODVlMGU5OC4uZTk4MDNlMjE1MWY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9p
cHUtdjMvaXB1LWltYWdlLWNvbnZlcnQuYworKysgYi9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWlt
YWdlLWNvbnZlcnQuYwpAQCAtNDA5LDEyICs0MDksMTQgQEAgc3RhdGljIGludCBjYWxjX2ltYWdl
X3Jlc2l6ZV9jb2VmZmljaWVudHMoc3RydWN0IGlwdV9pbWFnZV9jb252ZXJ0X2N0eCAqY3R4LAog
CWlmIChXQVJOX09OKHJlc2l6ZWRfd2lkdGggPT0gMCB8fCByZXNpemVkX2hlaWdodCA9PSAwKSkK
IAkJcmV0dXJuIC1FSU5WQUw7CiAKLQl3aGlsZSAoZG93bnNpemVkX3dpZHRoID49IHJlc2l6ZWRf
d2lkdGggKiAyKSB7CisJd2hpbGUgKGRvd25zaXplZF93aWR0aCA+IDEwMjQgfHwKKwkgICAgICAg
ZG93bnNpemVkX3dpZHRoID49IHJlc2l6ZWRfd2lkdGggKiAyKSB7CiAJCWRvd25zaXplZF93aWR0
aCA+Pj0gMTsKIAkJZG93bnNpemVfY29lZmZfaCsrOwogCX0KIAotCXdoaWxlIChkb3duc2l6ZWRf
aGVpZ2h0ID49IHJlc2l6ZWRfaGVpZ2h0ICogMikgeworCXdoaWxlIChkb3duc2l6ZWRfaGVpZ2h0
ID4gMTAyNCB8fAorCSAgICAgICBkb3duc2l6ZWRfaGVpZ2h0ID49IHJlc2l6ZWRfaGVpZ2h0ICog
MikgewogCQlkb3duc2l6ZWRfaGVpZ2h0ID4+PSAxOwogCQlkb3duc2l6ZV9jb2VmZl92Kys7CiAJ
fQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=

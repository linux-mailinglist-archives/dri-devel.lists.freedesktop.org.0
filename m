Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDC731D1A
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 15:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DF789C2A;
	Sat,  1 Jun 2019 13:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAD989BAF
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 13:27:18 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F328273D5;
 Sat,  1 Jun 2019 13:27:16 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 44/56] video: imsttfb: fix potential NULL pointer
 dereferences
Date: Sat,  1 Jun 2019 09:25:48 -0400
Message-Id: <20190601132600.27427-44-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132600.27427-1-sashal@kernel.org>
References: <20190601132600.27427-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395637;
 bh=uMYJg1J7W9gwIf64iWYDIHriKB8nkrDVCNLE422qyQc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sA1BINLWC5nCjw09TbLN16v6fde2008w3xfj7tv3hdYsYKu1Q5lIusd2kSEEG2StC
 1Pjw5/boq9cQJJw0x6j3fV9jbMttPn4SVpguYexb7ElcPJSCeMo6zhXH23u1NBAwEt
 SGaXysSvCXoaEvy6n2F7Jf4ZQI7an0TmqtUw7Iig=
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kangjie Lu <kjlu@umn.edu>,
 Finn Thain <fthain@telegraphics.com.au>, dri-devel@lists.freedesktop.org,
 Aditya Pakki <pakki001@umn.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogS2FuZ2ppZSBMdSA8a2psdUB1bW4uZWR1PgoKWyBVcHN0cmVhbSBjb21taXQgMWQ4NDM1
M2QyMDVhOTUzZTIzODEwNDQ5NTNiN2ZhMzFjOGM5NzAyZCBdCgpJbiBjYXNlIGlvcmVtYXAgZmFp
bHMsIHRoZSBmaXggcmVsZWFzZXMgcmVzb3VyY2VzIGFuZCByZXR1cm5zCi1FTk9NRU0gdG8gYXZv
aWQgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlcy4KClNpZ25lZC1vZmYtYnk6IEthbmdqaWUgTHUg
PGtqbHVAdW1uLmVkdT4KQ2M6IEFkaXR5YSBQYWtraSA8cGFra2kwMDFAdW1uLmVkdT4KQ2M6IEZp
bm4gVGhhaW4gPGZ0aGFpbkB0ZWxlZ3JhcGhpY3MuY29tLmF1PgpDYzogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4KQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc+CltiLnpvbG5pZXJraWU6IG1pbm9yIHBhdGNoIHN1bW1hcnkgZml4dXBdClNpZ25l
ZC1vZmYtYnk6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5n
LmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0K
IGRyaXZlcnMvdmlkZW8vZmJkZXYvaW1zdHRmYi5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvaW1zdHRm
Yi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9pbXN0dGZiLmMKaW5kZXggOWIxNjdmN2VmNmM2OS4u
NDk5NGE1NDBmNjgwOSAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9pbXN0dGZiLmMK
KysrIGIvZHJpdmVycy92aWRlby9mYmRldi9pbXN0dGZiLmMKQEAgLTE1MTcsNiArMTUxNywxMSBA
QCBzdGF0aWMgaW50IGltc3R0ZmJfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0
cnVjdCBwY2lfZGV2aWNlX2lkICplbnQpCiAJaW5mby0+Zml4LnNtZW1fc3RhcnQgPSBhZGRyOwog
CWluZm8tPnNjcmVlbl9iYXNlID0gKF9fdTggKilpb3JlbWFwKGFkZHIsIHBhci0+cmFtZGFjID09
IElCTSA/CiAJCQkJCSAgICAweDQwMDAwMCA6IDB4ODAwMDAwKTsKKwlpZiAoIWluZm8tPnNjcmVl
bl9iYXNlKSB7CisJCXJlbGVhc2VfbWVtX3JlZ2lvbihhZGRyLCBzaXplKTsKKwkJZnJhbWVidWZm
ZXJfcmVsZWFzZShpbmZvKTsKKwkJcmV0dXJuIC1FTk9NRU07CisJfQogCWluZm8tPmZpeC5tbWlv
X3N0YXJ0ID0gYWRkciArIDB4ODAwMDAwOwogCXBhci0+ZGNfcmVncyA9IGlvcmVtYXAoYWRkciAr
IDB4ODAwMDAwLCAweDEwMDApOwogCXBhci0+Y21hcF9yZWdzX3BoeXMgPSBhZGRyICsgMHg4NDAw
MDA7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==

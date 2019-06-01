Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8E131D18
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 15:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84FFD89B9F;
	Sat,  1 Jun 2019 13:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC25E89B62
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 13:27:12 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B3F27273CD;
 Sat,  1 Jun 2019 13:27:11 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 42/56] fbdev: sm712fb: fix boot screen glitch when
 sm712fb replaces VGA
Date: Sat,  1 Jun 2019 09:25:46 -0400
Message-Id: <20190601132600.27427-42-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132600.27427-1-sashal@kernel.org>
References: <20190601132600.27427-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395632;
 bh=h1UnrCnk/5MnPPaNdmSoBK/0X7X3BZNxYU/PcbGSPbc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vAHRjfKiAYcVruuLNis7zO748d8ur1qKB1koqGIzrDBdGyxSYjFHXS+bWDfHhvmzo
 BleaS4m7H/raQBWrHUoyXMj3hY+yV2Tbfkn5CvJxY1wnet2fOH5KACM4GAr99g9DXO
 ZIxLkr5wFbzS8+57kLdJ94wRc3VDBblCmOLtvu98=
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
 Teddy Wang <teddy.wang@siliconmotion.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, Yifeng Li <tomli@tomli.me>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWWlmZW5nIExpIDx0b21saUB0b21saS5tZT4KClsgVXBzdHJlYW0gY29tbWl0IGVjMTU4
N2Q1MDczZjI5ODIwZTM1OGYzYTM4Mzg1MGQ2MTYwMWQ5ODEgXQoKV2hlbiB0aGUgbWFjaGluZSBp
cyBib290ZWQgaW4gVkdBIG1vZGUsIGxvYWRpbmcgc203MTJmYiB3b3VsZCBjYXVzZQphIGdsaXRj
aCBvZiByYW5kb20gcGl4ZWxzIHNob3duIG9uIHRoZSBzY3JlZW4uIFRvIHByZXZlbnQgaXQgZnJv
bQpoYXBwZW5pbmcsIHdlIGZpcnN0IGNsZWFyIHRoZSBlbnRpcmUgZnJhbWVidWZmZXIsIGFuZCB3
ZSBhbHNvIG5lZWQKdG8gc3RvcCBjYWxsaW5nIHNtdGNmYl9zZXRtb2RlKCkgZHVyaW5nIGluaXRp
YWxpemF0aW9uLCB0aGUgZmJkZXYKbGF5ZXIgd2lsbCBjYWxsIGl0IGZvciB1cyBsYXRlciB3aGVu
IGl0J3MgcmVhZHkuCgpTaWduZWQtb2ZmLWJ5OiBZaWZlbmcgTGkgPHRvbWxpQHRvbWxpLm1lPgpU
ZXN0ZWQtYnk6IFN1ZGlwIE11a2hlcmplZSA8c3VkaXBtLm11a2hlcmplZUBnbWFpbC5jb20+CkNj
OiBUZWRkeSBXYW5nIDx0ZWRkeS53YW5nQHNpbGljb25tb3Rpb24uY29tPgpDYzogPHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmc+ICAjIHY0LjQrClNpZ25lZC1vZmYtYnk6IEJhcnRsb21pZWogWm9sbmll
cmtpZXdpY3ogPGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEg
TGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvc203MTJm
Yi5jIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NtNzEyZmIuYyBiL2RyaXZl
cnMvdmlkZW8vZmJkZXYvc203MTJmYi5jCmluZGV4IDI1MzljMWU2ZmFjYjQuLjZhMzA3MTRhMTg2
MzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc203MTJmYi5jCisrKyBiL2RyaXZl
cnMvdmlkZW8vZmJkZXYvc203MTJmYi5jCkBAIC0xNDk4LDcgKzE0OTgsMTEgQEAgc3RhdGljIGlu
dCBzbXRjZmJfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAogCWlmIChlcnIpCiAJCWdv
dG8gZmFpbGVkOwogCi0Jc210Y2ZiX3NldG1vZGUoc2ZiKTsKKwkvKgorCSAqIFRoZSBzY3JlZW4g
d291bGQgYmUgdGVtcG9yYXJpbHkgZ2FyYmxlZCB3aGVuIHNtNzEyZmIgdGFrZXMgb3ZlcgorCSAq
IHZlc2FmYiBvciBWR0EgdGV4dCBtb2RlLiBaZXJvIHRoZSBmcmFtZWJ1ZmZlci4KKwkgKi8KKwlt
ZW1zZXRfaW8oc2ZiLT5sZmIsIDAsIHNmYi0+ZmItPmZpeC5zbWVtX2xlbik7CiAKIAllcnIgPSBy
ZWdpc3Rlcl9mcmFtZWJ1ZmZlcihpbmZvKTsKIAlpZiAoZXJyIDwgMCkKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

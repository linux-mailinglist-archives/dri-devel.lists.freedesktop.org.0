Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CBF31D1B
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 15:27:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DA189C2C;
	Sat,  1 Jun 2019 13:27:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD6189BAF
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jun 2019 13:27:18 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BEAD4273CD;
 Sat,  1 Jun 2019 13:27:17 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 45/56] fbdev: sm712fb: fix brightness control on
 reboot, don't set SR30
Date: Sat,  1 Jun 2019 09:25:49 -0400
Message-Id: <20190601132600.27427-45-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132600.27427-1-sashal@kernel.org>
References: <20190601132600.27427-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559395638;
 bh=6KEatwgCvVAkHGuPNRxzrXAG3gR/1g0GB9QnkBKzGMU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UA/wMMN0Fh5lcRVCCP12o+hfiNtKtj6saNa+Nqg6mxWwEHLfjgpd8fdmt5SZJ1JuN
 mIy40TN1QbmQxaAsWQ+u0iw9ayGP3H9hzUQmYH1uC7B50TT71NSnStrXQqTUxd07Pa
 2c1MGOXrwjG7SShcVnLKdGwwxEljpiE2PtPB4WqY=
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

RnJvbTogWWlmZW5nIExpIDx0b21saUB0b21saS5tZT4KClsgVXBzdHJlYW0gY29tbWl0IDU0ODEx
MTVlMjVlNDJiOTIxNWYyNjE5NDUyYWE5OWM5NWYwODQ5MmYgXQoKT24gYSBUaGlua3BhZCBzMzAg
KFBlbnRpdW0gSUlJIC8gaTQ0ME1YLCBMeW54M0RNKSwgcmVib290aW5nIHdpdGgKc203MTJmYiBm
cmFtZWJ1ZmZlciBkcml2ZXIgd291bGQgY2F1c2UgdGhlIHJvbGUgb2YgYnJpZ2h0bmVzcyB1cC9k
b3duCmJ1dHRvbiB0byBzd2FwLgoKRXhwZXJpbWVudHMgc2hvd2VkIHRoZSBGUFIzMCByZWdpc3Rl
ciBjYXVzZWQgdGhpcyBiZWhhdmlvci4gTW9yZW92ZXIsCmV2ZW4gaWYgdGhpcyByZWdpc3RlciBk
b24ndCBoYXZlIHNpZGUtZWZmZWN0IG9uIG90aGVyIHN5c3RlbXMsIG92ZXItCndyaXRpbmcgaXQg
aXMgYWxzbyBoaWdobHkgcXVlc3Rpb25hYmxlLCBzaW5jZSBpdCB3YXMgb3JpZ2luYWxseQpjb25m
aWd1cmF0ZWQgYnkgdGhlIG1vdGhlcmJvYXJkIG1hbnVmYWN0dXJlciBieSBoYXJkd2lyaW5nIHB1
bGwtZG93bgpyZXNpc3RvcnMgdG8gaW5kaWNhdGUgdGhlIHR5cGUgb2YgTENEIHBhbmVsLiBXZSBz
aG91bGQgbm90IG1lc3Mgd2l0aAppdC4KClN0b3Agd3JpdGluZyB0byB0aGUgU1IzMCAoYS5rLmEg
RlBSMzApIHJlZ2lzdGVyLgoKU2lnbmVkLW9mZi1ieTogWWlmZW5nIExpIDx0b21saUB0b21saS5t
ZT4KVGVzdGVkLWJ5OiBTdWRpcCBNdWtoZXJqZWUgPHN1ZGlwbS5tdWtoZXJqZWVAZ21haWwuY29t
PgpDYzogVGVkZHkgV2FuZyA8dGVkZHkud2FuZ0BzaWxpY29ubW90aW9uLmNvbT4KQ2M6IDxzdGFi
bGVAdmdlci5rZXJuZWwub3JnPiAgIyB2NC40KwpTaWduZWQtb2ZmLWJ5OiBCYXJ0bG9taWVqIFpv
bG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6IFNh
c2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3Nt
NzEyZmIuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NtNzEyZmIuYyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvc203MTJmYi5jCmluZGV4IDZhMzA3MTRhMTg2MzIuLjNmNTg0MGFh
YTFkZDAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvc203MTJmYi5jCisrKyBiL2Ry
aXZlcnMvdmlkZW8vZmJkZXYvc203MTJmYi5jCkBAIC0xMTU2LDggKzExNTYsOCBAQCBzdGF0aWMg
dm9pZCBzbTd4eF9zZXRfdGltaW5nKHN0cnVjdCBzbXRjZmJfaW5mbyAqc2ZiKQogCiAJCS8qIGlu
aXQgU0VRIHJlZ2lzdGVyIFNSMzAgLSBTUjc1ICovCiAJCWZvciAoaSA9IDA7IGkgPCBTSVpFX1NS
MzBfU1I3NTsgaSsrKQotCQkJaWYgKChpICsgMHgzMCkgIT0gMHg2MiAmJiAoaSArIDB4MzApICE9
IDB4NmEgJiYKLQkJCSAgICAoaSArIDB4MzApICE9IDB4NmIpCisJCQlpZiAoKGkgKyAweDMwKSAh
PSAweDMwICYmIChpICsgMHgzMCkgIT0gMHg2MiAmJgorCQkJICAgIChpICsgMHgzMCkgIT0gMHg2
YSAmJiAoaSArIDB4MzApICE9IDB4NmIpCiAJCQkJc210Y19zZXF3KGkgKyAweDMwLAogCQkJCQkg
IHZnYW1vZGVbal0uaW5pdF9zcjMwX3NyNzVbaV0pOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

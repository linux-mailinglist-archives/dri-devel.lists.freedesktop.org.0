Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EACBCCFF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:44:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E203C6EA7E;
	Tue, 24 Sep 2019 16:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31B56EA7D;
 Tue, 24 Sep 2019 16:44:27 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 003A121783;
 Tue, 24 Sep 2019 16:44:26 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 60/87] drm/amd/powerpaly: fix navi series custom
 peak level value error
Date: Tue, 24 Sep 2019 12:41:16 -0400
Message-Id: <20190924164144.25591-60-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343467;
 bh=0QVKQtbYTzc53uwo95bKg2rV7mwigxbBZrR2N+aprkk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k6kANdGBLF7IZyE2XaSxhP8zjjK+1sjLAqmbd1HcDHlXCEn41AhMqjMdl6iEaMw1B
 JU7g4XLUSSHck+K2hoktykfKVJfmDo+llHhr+lKcYbpaByoGv5Pj3xP5i6wGg1YTan
 zw+YYH8TQwy/X3j8auhgJp4Q2GgNfhjB8ejGaUBw=
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
Cc: Sasha Levin <sashal@kernel.org>, Kevin Wang <kevin1.wang@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogS2V2aW4gV2FuZyA8a2V2aW4xLndhbmdAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0
IDcwNmZlYjI2Zjg5MGUxYjgyOTdiNWQxNDk3NTE2MGRlMzYxZWRmNGYgXQoKZml4IG90aGVyIG5h
dmkgYXNpYyBzZXQgcGVhayBwZXJmb3JtYW5jZSBsZXZlbCBlcnJvci4KYmVjYXVzZSB0aGUgbmF2
aTEwX3BwdC5jIHdpbGwgaGFuZGxlIG5hdmkxMiAxNCBhc2ljLAppdCB3aWxsIHVzZSBuYXZpMTAg
cGVhayB2YWx1ZSB0byBzZXQgb3RoZXIgYXNpYywgaXQgaXMgbm90IGNvcnJlY3QuCgphZnRlciBw
YXRjaDoKb25seSBuYXZpMTAgdXNlIGN1c3RvbSBwZWFrIHZhbHVlLCBvdGhlciBhc2ljIHdpbGwg
dXNlZCBkZWZhdWx0IHZhbHVlLgoKU2lnbmVkLW9mZi1ieTogS2V2aW4gV2FuZyA8a2V2aW4xLndh
bmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+ClNp
Z25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2ln
bmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkxMF9wcHQuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93
ZXJwbGF5L25hdmkxMF9wcHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L25hdmkx
MF9wcHQuYwppbmRleCBiODFjN2U3MTVkYzk0Li45YWFmMmRlZmY2ZTk0IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9wb3dlcnBsYXkvbmF2aTEwX3BwdC5jCkBAIC0xNjI3LDYgKzE2MjcsMTAgQEAg
c3RhdGljIGludCBuYXZpMTBfc2V0X3BlYWtfY2xvY2tfYnlfZGV2aWNlKHN0cnVjdCBzbXVfY29u
dGV4dCAqc211KQogc3RhdGljIGludCBuYXZpMTBfc2V0X3BlcmZvcm1hbmNlX2xldmVsKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LCBlbnVtIGFtZF9kcG1fZm9yY2VkX2xldmVsIGxldmVsKQogewog
CWludCByZXQgPSAwOworCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gc211LT5hZGV2Owor
CisJaWYgKGFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX05BVkkxMCkKKwkJcmV0dXJuIC1FSU5WQUw7
CiAKIAlzd2l0Y2ggKGxldmVsKSB7CiAJY2FzZSBBTURfRFBNX0ZPUkNFRF9MRVZFTF9QUk9GSUxF
X1BFQUs6Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==

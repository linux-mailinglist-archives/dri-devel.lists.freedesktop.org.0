Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 310318C6D2
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 04:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742E58925A;
	Wed, 14 Aug 2019 02:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD545891E7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 02:19:36 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D29862084D;
 Wed, 14 Aug 2019 02:19:35 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 40/44] drm/vmwgfx: fix memory leak when too many
 retries have occurred
Date: Tue, 13 Aug 2019 22:18:29 -0400
Message-Id: <20190814021834.16662-40-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814021834.16662-1-sashal@kernel.org>
References: <20190814021834.16662-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565749176;
 bh=fG5gKSURpvl8cm1v+OZybGwKNiFssUS3aCFzr7Uketo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VDPiDtMhlWrIrG1TVscC5A7ZQNO5aFEFHj6FnSFoqUxlesYtXEKsiJ7ioy98F3ZRI
 KDrZV1Trsok7RS7bVeol2Sjcuviv37ai38ngY66lPTNhKB3RMaojtRJmm7lJphFAKD
 6lZkdl72LO18Ytg66cy6uJUrWJj0SwbSjNWYZS8Y=
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
Cc: Sasha Levin <sashal@kernel.org>, Colin Ian King <colin.king@canonical.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Deepak Rawat <drawat@vmware.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClsgVXBzdHJl
YW0gY29tbWl0IDZiN2MzYjg2ZjBiNjMxMzRiMmFiNTY1MDg5MjFhMDg1M2ZmYTY4N2EgXQoKQ3Vy
cmVudGx5IHdoZW4gdG9vIG1hbnkgcmV0cmllcyBoYXZlIG9jY3VycmVkIHRoZXJlIGlzIGEgbWVt
b3J5CmxlYWsgb24gdGhlIGFsbG9jYXRpb24gZm9yIHJlcGx5IG9uIHRoZSBlcnJvciByZXR1cm4g
cGF0aC4gRml4CnRoaXMgYnkga2ZyZWUnaW5nIHJlcGx5IGJlZm9yZSByZXR1cm5pbmcuCgpBZGRy
ZXNzZXMtQ292ZXJpdHk6ICgiUmVzb3VyY2UgbGVhayIpCkZpeGVzOiBhOWNkOWMwNDRhYTkgKCJk
cm0vdm13Z2Z4OiBBZGQgYSBjaGVjayB0byBoYW5kbGUgaG9zdCBtZXNzYWdlIGZhaWx1cmUiKQpT
aWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPgpS
ZXZpZXdlZC1ieTogRGVlcGFrIFJhd2F0IDxkcmF3YXRAdm13YXJlLmNvbT4KU2lnbmVkLW9mZi1i
eTogRGVlcGFrIFJhd2F0IDxkcmF3YXRAdm13YXJlLmNvbT4KU2lnbmVkLW9mZi1ieTogVGhvbWFz
IEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBM
ZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
ZnhfbXNnLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9tc2cu
YyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X21zZy5jCmluZGV4IDk3MDAwOTk2Yjhk
YzUuLjUwY2MwNjBjYzU1MmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X21zZy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X21zZy5jCkBAIC0z
MDAsOCArMzAwLDEwIEBAIHN0YXRpYyBpbnQgdm13X3JlY3ZfbXNnKHN0cnVjdCBycGNfY2hhbm5l
bCAqY2hhbm5lbCwgdm9pZCAqKm1zZywKIAkJYnJlYWs7CiAJfQogCi0JaWYgKHJldHJpZXMgPT0g
UkVUUklFUykKKwlpZiAocmV0cmllcyA9PSBSRVRSSUVTKSB7CisJCWtmcmVlKHJlcGx5KTsKIAkJ
cmV0dXJuIC1FSU5WQUw7CisJfQogCiAJKm1zZ19sZW4gPSByZXBseV9sZW47CiAJKm1zZyAgICAg
PSByZXBseTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs

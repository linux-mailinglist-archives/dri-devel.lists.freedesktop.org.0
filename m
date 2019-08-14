Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 459608C647
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 04:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD798928D;
	Wed, 14 Aug 2019 02:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561E78928D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 02:14:28 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6595D20874;
 Wed, 14 Aug 2019 02:14:27 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 114/123] drm/vmwgfx: fix memory leak when too many
 retries have occurred
Date: Tue, 13 Aug 2019 22:10:38 -0400
Message-Id: <20190814021047.14828-114-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814021047.14828-1-sashal@kernel.org>
References: <20190814021047.14828-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565748868;
 bh=yZiJ8rf/cHJGFNppWirptWcXt6eDQ6i695avXVJEEl0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZUWDc0tn2IFZ5wqscoG42pVxrGFWGpxx68NE1HEwddKkbbiB9F9jrNOhcJFJ+cDxd
 jXJpSRqFg6nb12Xip3DRI6nV68W4dPWbL2NEt2hqzVM/vhzyB3e9QJSPRoE/05WGQT
 HABDdPjWIjSssIfM6R42LZEP6ETjVSLm4IQtbgiA=
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
YyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X21zZy5jCmluZGV4IGU0ZTA5ZDQ3YzVj
MGUuLjU5ZTlkMDVhYjkyOGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X21zZy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X21zZy5jCkBAIC0z
ODksOCArMzg5LDEwIEBAIHN0YXRpYyBpbnQgdm13X3JlY3ZfbXNnKHN0cnVjdCBycGNfY2hhbm5l
bCAqY2hhbm5lbCwgdm9pZCAqKm1zZywKIAkJYnJlYWs7CiAJfQogCi0JaWYgKHJldHJpZXMgPT0g
UkVUUklFUykKKwlpZiAocmV0cmllcyA9PSBSRVRSSUVTKSB7CisJCWtmcmVlKHJlcGx5KTsKIAkJ
cmV0dXJuIC1FSU5WQUw7CisJfQogCiAJKm1zZ19sZW4gPSByZXBseV9sZW47CiAJKm1zZyAgICAg
PSByZXBseTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs

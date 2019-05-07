Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 009D7159B3
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 07:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041838922B;
	Tue,  7 May 2019 05:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0C589147
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 05:40:29 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F8DC2087F;
 Tue,  7 May 2019 05:40:28 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 67/95] drm/rockchip: psr: do not dereference
 encoder before it is null checked.
Date: Tue,  7 May 2019 01:37:56 -0400
Message-Id: <20190507053826.31622-67-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053826.31622-1-sashal@kernel.org>
References: <20190507053826.31622-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557207629;
 bh=C/SEdJvcztVmaWYIHppHb6GDJ7iOjWkEKhogPF8LK1I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GzLugjq8V/bTzbg43eUiU523ZrMeJwpsfGuXMzckElO7DXJomqN+NW2UIm8pAkKLX
 P8PJcWgoVtZwneNDn/RzqxYprPZOMjqwTh2QRLvazvthMHftSn+VDRaPacvKN9DB/S
 ZnuI51kryP7CnSTdJMEXm+769qAfAvPj1/1zVw+s=
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Sasha Levin <alexander.levin@microsoft.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNv
bT4KClsgVXBzdHJlYW0gY29tbWl0IDRlZGE3NzZjM2NlZmNiMWYwMWIyZDg1YmQ4NzUzZjY3NjA2
MjgyYjUgXQoKJ2VuY29kZXInIGlzIGRlcmVmZXJlbmNlZCBiZWZvcmUgaXQgaXMgbnVsbCBzYW5p
dHkgY2hlY2tlZCwgaGVuY2Ugd2UKcG90ZW50aWFsbHkgaGF2ZSBhIG51bGwgcG9pbnRlciBkZXJl
ZmVyZW5jZSBidWcuIEluc3RlYWQsIGluaXRpYWxpc2UKZHJtX2RydiBmcm9tIGVuY29kZXItPmRl
di0+ZGV2X3ByaXZhdGUgYWZ0ZXIgd2UgYXJlIHN1cmUgJ2VuY29kZXInIGlzCm5vdCBudWxsLgoK
Rml4ZXM6IDUxODJjMWE1NTZkN2YgKCJkcm0vcm9ja2NoaXA6IGFkZCBhbiBjb21tb24gYWJzdHJh
Y3RlZCBQU1IgZHJpdmVyIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1i
eTogRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbT4K
U2lnbmVkLW9mZi1ieTogSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KTGluazogaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTgxMDEzMTA1NjU0
LjExODI3LTEtZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNvbQpTaWduZWQtb2ZmLWJ5OiBTYXNo
YSBMZXZpbiA8YWxleGFuZGVyLmxldmluQG1pY3Jvc29mdC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9wc3IuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fcHNyLmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2No
aXAvcm9ja2NoaXBfZHJtX3Bzci5jCmluZGV4IGE1NTNlMTgyZmY1My4uMzJlN2RiYTJiZjVlIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX3Bzci5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fcHNyLmMKQEAgLTIyMSwx
MyArMjIxLDE1IEBAIEVYUE9SVF9TWU1CT0wocm9ja2NoaXBfZHJtX3Bzcl9mbHVzaF9hbGwpOwog
aW50IHJvY2tjaGlwX2RybV9wc3JfcmVnaXN0ZXIoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVy
LAogCQkJdm9pZCAoKnBzcl9zZXQpKHN0cnVjdCBkcm1fZW5jb2RlciAqLCBib29sIGVuYWJsZSkp
CiB7Ci0Jc3RydWN0IHJvY2tjaGlwX2RybV9wcml2YXRlICpkcm1fZHJ2ID0gZW5jb2Rlci0+ZGV2
LT5kZXZfcHJpdmF0ZTsKKwlzdHJ1Y3Qgcm9ja2NoaXBfZHJtX3ByaXZhdGUgKmRybV9kcnY7CiAJ
c3RydWN0IHBzcl9kcnYgKnBzcjsKIAl1bnNpZ25lZCBsb25nIGZsYWdzOwogCiAJaWYgKCFlbmNv
ZGVyIHx8ICFwc3Jfc2V0KQogCQlyZXR1cm4gLUVJTlZBTDsKIAorCWRybV9kcnYgPSBlbmNvZGVy
LT5kZXYtPmRldl9wcml2YXRlOworCiAJcHNyID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IHBzcl9k
cnYpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIXBzcikKIAkJcmV0dXJuIC1FTk9NRU07Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BD083B84
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 23:36:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C39E6E578;
	Tue,  6 Aug 2019 21:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867666E578
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 21:36:15 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB00A21871;
 Tue,  6 Aug 2019 21:36:14 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 28/32] drm/exynos: fix missing decrement of retry
 counter
Date: Tue,  6 Aug 2019 17:35:16 -0400
Message-Id: <20190806213522.19859-28-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806213522.19859-1-sashal@kernel.org>
References: <20190806213522.19859-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565127375;
 bh=l9lNgHY2O3o2XR+hkENaOk5pAlN16gJqUbwHG1j/Euk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xomnEifnu/s7IvJWZcqozrz45vbTOMICJnPNfVq1CnMyvRAS3h6A0p8P41druEvbZ
 qaOzTje5J1VjXAaNY4LYjzJeYkUIcC8tyHtg0cW0MmS/bO3TQ5p3KFTj2atg/r0X7m
 7tu4cSUeTfZ3V/n1gFj1AHckz/y6HDPLzwNwAnlA=
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
Cc: Colin Ian King <colin.king@canonical.com>, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KClsgVXBzdHJl
YW0gY29tbWl0IDFiYmJhYjA5N2EwNTI3NmUzMTJkZDI0NjI3OTFkMzJiMjFjZWIxZWUgXQoKQ3Vy
cmVudGx5IHRoZSByZXRyeSBjb3VudGVyIGlzIG5vdCBiZWluZyBkZWNyZW1lbnRlZCwgbGVhZGlu
ZyB0byBhCnBvdGVudGlhbCBpbmZpbml0ZSBzcGluIGlmIHRoZSBzY2FsYXJfcmVhZHMgZG9uJ3Qg
Y2hhbmdlIHN0YXRlLgoKQWRkcmVzc2VzLUNvdmVyaXR5OiAoIkluZmluaXRlIGxvb3AiKQpGaXhl
czogMjgwZTU0YzlmNjE0ICgiZHJtL2V4eW5vczogc2NhbGVyOiBSZXNldCBoYXJkd2FyZSBiZWZv
cmUgc3RhcnRpbmcgdGhlIG9wZXJhdGlvbiIpClNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5n
IDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+ClNpZ25lZC1vZmYtYnk6IElua2kgRGFlIDxpbmtp
LmRhZUBzYW1zdW5nLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJu
ZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9zY2FsZXIuYyB8
IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fc2NhbGVyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fc2NhbGVyLmMKaW5kZXggMGRkYjZl
ZWM3YjExMy4uZGYyMjg0MzZhMDNkOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfZHJtX3NjYWxlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9zY2FsZXIuYwpAQCAtMTA4LDEyICsxMDgsMTIgQEAgc3RhdGljIGlubGluZSBpbnQgc2Nh
bGVyX3Jlc2V0KHN0cnVjdCBzY2FsZXJfY29udGV4dCAqc2NhbGVyKQogCXNjYWxlcl93cml0ZShT
Q0FMRVJfQ0ZHX1NPRlRfUkVTRVQsIFNDQUxFUl9DRkcpOwogCWRvIHsKIAkJY3B1X3JlbGF4KCk7
Ci0JfSB3aGlsZSAocmV0cnkgPiAxICYmCisJfSB3aGlsZSAoLS1yZXRyeSA+IDEgJiYKIAkJIHNj
YWxlcl9yZWFkKFNDQUxFUl9DRkcpICYgU0NBTEVSX0NGR19TT0ZUX1JFU0VUKTsKIAlkbyB7CiAJ
CWNwdV9yZWxheCgpOwogCQlzY2FsZXJfd3JpdGUoMSwgU0NBTEVSX0lOVF9FTik7Ci0JfSB3aGls
ZSAocmV0cnkgPiAwICYmIHNjYWxlcl9yZWFkKFNDQUxFUl9JTlRfRU4pICE9IDEpOworCX0gd2hp
bGUgKC0tcmV0cnkgPiAwICYmIHNjYWxlcl9yZWFkKFNDQUxFUl9JTlRfRU4pICE9IDEpOwogCiAJ
cmV0dXJuIHJldHJ5ID8gMCA6IC1FSU87CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==

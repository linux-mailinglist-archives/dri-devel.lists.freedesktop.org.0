Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1021183B66
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 23:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F526E56E;
	Tue,  6 Aug 2019 21:35:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6DE6E56E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 21:35:00 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 70A4C21874;
 Tue,  6 Aug 2019 21:34:59 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 51/59] drm/exynos: fix missing decrement of retry
 counter
Date: Tue,  6 Aug 2019 17:33:11 -0400
Message-Id: <20190806213319.19203-51-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806213319.19203-1-sashal@kernel.org>
References: <20190806213319.19203-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565127300;
 bh=0/I9yaWwLfbVKWZtR4EeIsv5AWU4gyl+tYZMLtkaT/A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=y3eA7Ptb2ZX3rT3jh+daN44b6WbHR2C8pT0EDF1OjPDpy0fOw/Z/lLwfUjqd/0foG
 0v6OerFKBZm0LSG6w8RYNaAewa/SxJnYcUnUC3GRqWHos9K7hxaFpoBZogDQeLPLpx
 IHm4RQ2btxo2qMxqToQvYFIbMP3xrfS9DhPQNDds=
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
Yi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fc2NhbGVyLmMKaW5kZXggZWM5YzFi
N2QzMTAzMy4uODk4OWY4YWY3MTZiNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4eW5v
cy9leHlub3NfZHJtX3NjYWxlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9zY2FsZXIuYwpAQCAtOTQsMTIgKzk0LDEyIEBAIHN0YXRpYyBpbmxpbmUgaW50IHNjYWxl
cl9yZXNldChzdHJ1Y3Qgc2NhbGVyX2NvbnRleHQgKnNjYWxlcikKIAlzY2FsZXJfd3JpdGUoU0NB
TEVSX0NGR19TT0ZUX1JFU0VULCBTQ0FMRVJfQ0ZHKTsKIAlkbyB7CiAJCWNwdV9yZWxheCgpOwot
CX0gd2hpbGUgKHJldHJ5ID4gMSAmJgorCX0gd2hpbGUgKC0tcmV0cnkgPiAxICYmCiAJCSBzY2Fs
ZXJfcmVhZChTQ0FMRVJfQ0ZHKSAmIFNDQUxFUl9DRkdfU09GVF9SRVNFVCk7CiAJZG8gewogCQlj
cHVfcmVsYXgoKTsKIAkJc2NhbGVyX3dyaXRlKDEsIFNDQUxFUl9JTlRfRU4pOwotCX0gd2hpbGUg
KHJldHJ5ID4gMCAmJiBzY2FsZXJfcmVhZChTQ0FMRVJfSU5UX0VOKSAhPSAxKTsKKwl9IHdoaWxl
ICgtLXJldHJ5ID4gMCAmJiBzY2FsZXJfcmVhZChTQ0FMRVJfSU5UX0VOKSAhPSAxKTsKIAogCXJl
dHVybiByZXRyeSA/IDAgOiAtRUlPOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

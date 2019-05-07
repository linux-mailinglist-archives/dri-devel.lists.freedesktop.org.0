Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8545C15983
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 07:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3504789CF8;
	Tue,  7 May 2019 05:37:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064B089CF8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 05:37:32 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F5B9205ED;
 Tue,  7 May 2019 05:37:32 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 49/81] drm/sun4i: Set device driver data at bind
 time for use in unbind
Date: Tue,  7 May 2019 01:35:20 -0400
Message-Id: <20190507053554.30848-49-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053554.30848-1-sashal@kernel.org>
References: <20190507053554.30848-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557207452;
 bh=5Q8YJgAUpknyzg1JZWzMxtKR7UGdxPt8wGysfVQeWLo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sqapUEcDTJbY5ZteNh/7NxMKSmCoxnJwaZlZJUqdIjocSPf3ZpUAS1b+1lllbfC9b
 YrEkYiqIP/i6NFsfjjf6uPspKSXklFVIb9VgyPndHcca0PTqOcQPRGOq3Dw7ZEJBa1
 hr0/K3v2/hUsPT8qPwRjXoZzZQPjVV24itTpmLdU=
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGF1bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4uY29tPgoK
WyBVcHN0cmVhbSBjb21taXQgMDJiOTJhZGJlMzNlNmRiZDE1ZGM2ZTMyNTQwYjIyZjQ3YzRmZjBh
MiBdCgpPdXIgc3VuNGlfZHJ2X3VuYmluZCBnZXRzIHRoZSBkcm0gZGV2aWNlIHVzaW5nIGRldl9n
ZXRfZHJ2ZGF0YS4KSG93ZXZlciwgdGhhdCBkcml2ZXIgZGF0YSBpcyBuZXZlciBzZXQgaW4gc3Vu
NGlfZHJ2X2JpbmQuCgpTZXQgaXQgdGhlcmUgdG8gYXZvaWQgZ2V0dGluZyBhIE5VTEwgcG9pbnRl
ciBhdCB1bmJpbmQgdGltZS4KCkZpeGVzOiA5MDI2ZTBkMTIyYWMgKCJkcm06IEFkZCBBbGx3aW5u
ZXIgQTEwIERpc3BsYXkgRW5naW5lIHN1cHBvcnQiKQpTaWduZWQtb2ZmLWJ5OiBQYXVsIEtvY2lh
bGtvd3NraSA8cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20+ClNpZ25lZC1vZmYtYnk6IE1h
eGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Ckxpbms6IGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5MDQxODEzMjcyNy41MTI4LTMt
cGF1bC5rb2NpYWxrb3dza2lAYm9vdGxpbi5jb20KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4g
PHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9kcnYu
YyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkv
c3VuNGlfZHJ2LmMKaW5kZXggOGIwY2QwODAzNGUwLi43Y2FjMDFjNzJjMDIgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW40aV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
c3VuNGkvc3VuNGlfZHJ2LmMKQEAgLTkyLDYgKzkyLDggQEAgc3RhdGljIGludCBzdW40aV9kcnZf
YmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCXJldCA9IC1FTk9NRU07CiAJCWdvdG8gZnJlZV9k
cm07CiAJfQorCisJZGV2X3NldF9kcnZkYXRhKGRldiwgZHJtKTsKIAlkcm0tPmRldl9wcml2YXRl
ID0gZHJ2OwogCUlOSVRfTElTVF9IRUFEKCZkcnYtPmZyb250ZW5kX2xpc3QpOwogCUlOSVRfTElT
VF9IRUFEKCZkcnYtPmVuZ2luZV9saXN0KTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

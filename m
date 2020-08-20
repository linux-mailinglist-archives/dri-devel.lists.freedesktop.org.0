Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC9B24AA85
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 02:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B531C6E887;
	Thu, 20 Aug 2020 00:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 234E56E884
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 00:02:45 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3AFA1214F1;
 Thu, 20 Aug 2020 00:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597881765;
 bh=2piNqjgMF8RHhqlBhK0HIYSunlesgNni0vdGlmvyMoU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pCMfCHDDcWT6RkO93BxA8ayHdRLQ1SET16sEgqxkPNelW0yaVV5HaP1a46ooyKLWI
 812QD+YGp22Ny1vSk1shErHZT1/+s+wErtgtSQjmeS5e/KKN8VI4dTJV4cu2ZgcDNV
 fDLLXqMykZnqGM0xpbLQzPtHZFxa7WSn0UMc6D9M=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 11/22] drm/ttm: fix offset in VMAs with a pg_offs
 in ttm_bo_vm_access
Date: Wed, 19 Aug 2020 20:02:18 -0400
Message-Id: <20200820000229.215333-11-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200820000229.215333-1-sashal@kernel.org>
References: <20200820000229.215333-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Sasha Levin <sashal@kernel.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Laurent Morichetti <laurent.morichetti@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+CgpbIFVwc3RyZWFt
IGNvbW1pdCBjMDAwMTIxM2QxOTVkMWJhYzgzZTA3NDRjMDZmZjA2ZGQ1YThiYTUzIF0KClZNQXMg
d2l0aCBhIHBnX29mZnMgdGhhdCdzIG9mZnNldCBmcm9tIHRoZSBzdGFydCBvZiB0aGUgdm1hX25v
ZGUgbmVlZAp0byBhZGp1c3QgdGhlIG9mZnNldCB3aXRoaW4gdGhlIEJPIGFjY29yZGluZ2x5LiBU
aGlzIG1hdGNoZXMgdGhlCm9mZnNldCBjYWxjdWxhdGlvbiBpbiB0dG1fYm9fdm1fZmF1bHRfcmVz
ZXJ2ZWQuCgpTaWduZWQtb2ZmLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1k
LmNvbT4KVGVzdGVkLWJ5OiBMYXVyZW50IE1vcmljaGV0dGkgPGxhdXJlbnQubW9yaWNoZXR0aUBh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Ckxpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8z
ODExNjkvClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMK
aW5kZXggNDZkYzNkZTdlODFiZi4uZjJiYWQxNGFjMDRhYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm9fdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192
bS5jCkBAIC0zNTgsOCArMzU4LDEwIEBAIHN0YXRpYyBpbnQgdHRtX2JvX3ZtX2FjY2Vzc19rbWFw
KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiBzdGF0aWMgaW50IHR0bV9ib192bV9hY2Nl
c3Moc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkciwKIAkJCSAg
ICB2b2lkICpidWYsIGludCBsZW4sIGludCB3cml0ZSkKIHsKLQl1bnNpZ25lZCBsb25nIG9mZnNl
dCA9IChhZGRyKSAtIHZtYS0+dm1fc3RhcnQ7CiAJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
byA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRhOworCXVuc2lnbmVkIGxvbmcgb2Zmc2V0ID0gKGFkZHIp
IC0gdm1hLT52bV9zdGFydCArCisJCSgodm1hLT52bV9wZ29mZiAtIGRybV92bWFfbm9kZV9zdGFy
dCgmYm8tPmJhc2Uudm1hX25vZGUpKQorCQkgPDwgUEFHRV9TSElGVCk7CiAJaW50IHJldDsKIAog
CWlmIChsZW4gPCAxIHx8IChvZmZzZXQgKyBsZW4pID4+IFBBR0VfU0hJRlQgPiBiby0+bnVtX3Bh
Z2VzKQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK

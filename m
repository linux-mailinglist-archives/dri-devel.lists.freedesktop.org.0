Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E192624AA72
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 02:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D15A6E2A5;
	Thu, 20 Aug 2020 00:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21B86E2A5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 00:01:35 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BB75F21744;
 Thu, 20 Aug 2020 00:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597881695;
 bh=ASNGJWgtwtS9VpHWrz2J5lsF5hX9JWswGiuJzWsIJqw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rGY0YRBj04axn5wjoeYwEMyUEk+2XRLW2NOITe1zXUL9suJC9OMUGnyrHarivVbGl
 lCWdH3MyILrc8AwktdLt/2bNp2AQc48Z2SStfFrN0fbehOwTgbNtpO9WsPomaLcdxZ
 SjW2tMs5wKrhglGQIryo1WTVZts/zXVIGhqbCDLA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 14/27] drm/ttm: fix offset in VMAs with a pg_offs
 in ttm_bo_vm_access
Date: Wed, 19 Aug 2020 20:01:03 -0400
Message-Id: <20200820000116.214821-14-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200820000116.214821-1-sashal@kernel.org>
References: <20200820000116.214821-1-sashal@kernel.org>
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
aW5kZXggZmEwM2ZhYjAyMDc2ZC4uMzM1MjZjNWRmMGU4YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm9fdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192
bS5jCkBAIC01MDUsOCArNTA1LDEwIEBAIHN0YXRpYyBpbnQgdHRtX2JvX3ZtX2FjY2Vzc19rbWFw
KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiBpbnQgdHRtX2JvX3ZtX2FjY2VzcyhzdHJ1
Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyLAogCQkgICAgIHZvaWQg
KmJ1ZiwgaW50IGxlbiwgaW50IHdyaXRlKQogewotCXVuc2lnbmVkIGxvbmcgb2Zmc2V0ID0gKGFk
ZHIpIC0gdm1hLT52bV9zdGFydDsKIAlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gdm1h
LT52bV9wcml2YXRlX2RhdGE7CisJdW5zaWduZWQgbG9uZyBvZmZzZXQgPSAoYWRkcikgLSB2bWEt
PnZtX3N0YXJ0ICsKKwkJKCh2bWEtPnZtX3Bnb2ZmIC0gZHJtX3ZtYV9ub2RlX3N0YXJ0KCZiby0+
YmFzZS52bWFfbm9kZSkpCisJCSA8PCBQQUdFX1NISUZUKTsKIAlpbnQgcmV0OwogCiAJaWYgKGxl
biA8IDEgfHwgKG9mZnNldCArIGxlbikgPj4gUEFHRV9TSElGVCA+IGJvLT5udW1fcGFnZXMpCi0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

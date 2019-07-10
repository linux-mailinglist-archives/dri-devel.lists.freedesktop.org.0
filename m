Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BE5648EA
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 17:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC24B6E0F4;
	Wed, 10 Jul 2019 15:03:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F276E0F4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 15:03:10 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74448214AF;
 Wed, 10 Jul 2019 15:03:09 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 4/9] drm/etnaviv: add missing failure path to
 destroy suballoc
Date: Wed, 10 Jul 2019 11:02:54 -0400
Message-Id: <20190710150301.7129-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710150301.7129-1-sashal@kernel.org>
References: <20190710150301.7129-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562770990;
 bh=xLiWQv76Xy1ufLhd/aP1fBIA+yYEgXJzvV65wgiJ1TE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cQAW5c2qryIQMTYVivFF86HQmbl8aSBupoa1Vky4bv9rLiGhWauLbibVnpagD2fst
 +RRoaaqEepDjatOmToOoivCMS/cXkSXXqXWXgkC7eNkeoT+Igyd6DjIigPdNuAUTQ3
 emJ1q7vZUF1XxYWFXI1ZxCYIV3GiKUfzW0Gqcf4c=
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
Cc: Sasha Levin <sashal@kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+CgpbIFVwc3RyZWFtIGNv
bW1pdCBiZTEzMmUxMzc1YzFmZmZlNDg4MDEyOTYyNzkwNzlmOGE1OWE5ZWQzIF0KCldoZW4gc29t
ZXRoaW5nIGdvZXMgd3JvbmcgaW4gdGhlIEdQVSBpbml0IGFmdGVyIHRoZSBjbWRidWYgc3ViYWxs
b2NhdG9yCmhhcyBiZWVuIGNvbnN0cnVjdGVkLCB3ZSBmYWlsIHRvIGRlc3Ryb3kgaXQgcHJvcGVy
bHkuIFRoaXMgY2F1c2VzIGhhdm9rCmxhdGVyIHdoZW4gdGhlIEdQVSBpcyB1bmJvdW5kIGR1ZSB0
byBhIG1vZHVsZSB1bmxvYWQgb3Igc2ltaWxhci4KCkZpeGVzOiBlNjY3NzRkZDZmNmEgKGRybS9l
dG5hdml2OiBhZGQgY21kYnVmIHN1YmFsbG9jYXRvcikKU2lnbmVkLW9mZi1ieTogTHVjYXMgU3Rh
Y2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+ClRlc3RlZC1ieTogUnVzc2VsbCBLaW5nIDxybWsr
a2VybmVsQGFybWxpbnV4Lm9yZy51az4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hh
bEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMg
fCA3ICsrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKaW5kZXggZjIyNWZiYzZlZGQy
Li42YTg1OWUwNzdlYTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2
aXZfZ3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYwpAQCAt
NzYwLDcgKzc2MCw3IEBAIGludCBldG5hdml2X2dwdV9pbml0KHN0cnVjdCBldG5hdml2X2dwdSAq
Z3B1KQogCWlmIChJU19FUlIoZ3B1LT5jbWRidWZfc3ViYWxsb2MpKSB7CiAJCWRldl9lcnIoZ3B1
LT5kZXYsICJGYWlsZWQgdG8gY3JlYXRlIGNtZGJ1ZiBzdWJhbGxvY2F0b3JcbiIpOwogCQlyZXQg
PSBQVFJfRVJSKGdwdS0+Y21kYnVmX3N1YmFsbG9jKTsKLQkJZ290byBmYWlsOworCQlnb3RvIGRl
c3Ryb3lfaW9tbXU7CiAJfQogCiAJLyogQ3JlYXRlIGJ1ZmZlcjogKi8KQEAgLTc2OCw3ICs3Njgs
NyBAQCBpbnQgZXRuYXZpdl9ncHVfaW5pdChzdHJ1Y3QgZXRuYXZpdl9ncHUgKmdwdSkKIAkJCQkg
IFBBR0VfU0laRSk7CiAJaWYgKHJldCkgewogCQlkZXZfZXJyKGdwdS0+ZGV2LCAiY291bGQgbm90
IGNyZWF0ZSBjb21tYW5kIGJ1ZmZlclxuIik7Ci0JCWdvdG8gZGVzdHJveV9pb21tdTsKKwkJZ290
byBkZXN0cm95X3N1YmFsbG9jOwogCX0KIAogCWlmIChncHUtPm1tdS0+dmVyc2lvbiA9PSBFVE5B
VklWX0lPTU1VX1YxICYmCkBAIC04MDAsNiArODAwLDkgQEAgaW50IGV0bmF2aXZfZ3B1X2luaXQo
c3RydWN0IGV0bmF2aXZfZ3B1ICpncHUpCiBmcmVlX2J1ZmZlcjoKIAlldG5hdml2X2NtZGJ1Zl9m
cmVlKCZncHUtPmJ1ZmZlcik7CiAJZ3B1LT5idWZmZXIuc3ViYWxsb2MgPSBOVUxMOworZGVzdHJv
eV9zdWJhbGxvYzoKKwlldG5hdml2X2NtZGJ1Zl9zdWJhbGxvY19kZXN0cm95KGdwdS0+Y21kYnVm
X3N1YmFsbG9jKTsKKwlncHUtPmNtZGJ1Zl9zdWJhbGxvYyA9IE5VTEw7CiBkZXN0cm95X2lvbW11
OgogCWV0bmF2aXZfaW9tbXVfZGVzdHJveShncHUtPm1tdSk7CiAJZ3B1LT5tbXUgPSBOVUxMOwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

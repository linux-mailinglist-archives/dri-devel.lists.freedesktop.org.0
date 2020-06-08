Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BDC1F2310
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 01:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFB16E0DC;
	Mon,  8 Jun 2020 23:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE08289D58;
 Mon,  8 Jun 2020 23:12:55 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4F06214D8;
 Mon,  8 Jun 2020 23:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657975;
 bh=5zNyKomWQO4uiYiSJCDxXIRcWas232csxiLAZe0gTvg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h1BZ5AvU+NQt3S0IhtiJV9jA4xRmAa413jfZZrxhke9QcZ1jz+mh9+vmC1h+7FgQ4
 a2jHiPjz3iDHCOhGz23tG/DiPw7n9ViIO3Sfuwxoaq8hRs+C2dZ/2TXZ+ZyIHxOZVT
 3/q2CoDstSoY9dg/GtsuStRPpTsKWNL8I/GJN+OY=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 037/606] drm/i915/tgl+: Fix interrupt handling for
 DP AUX transactions
Date: Mon,  8 Jun 2020 19:02:42 -0400
Message-Id: <20200608231211.3363633-37-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgoKY29tbWl0IDQ0NTdhOWRiMmJk
ZWMyMzYwZGRiMTUyNDIzNDE2OTYxMDgxNjc4ODYgdXBzdHJlYW0uCgpVbm1hc2svZW5hYmxlIEFV
WCBpbnRlcnJ1cHRzIG9uIGFsbCBwb3J0cyBvbiBUR0wrLiBTbyBmYXIgdGhlIGludGVycnVwdHMK
d29ya2VkIG9ubHkgb24gcG9ydCBBLCB3aGljaCBtZWFudCBlYWNoIHRyYW5zYWN0aW9uIG9uIG90
aGVyIHBvcnRzIHRvb2sKMTBtcy4KCkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NS40
KwpTaWduZWQtb2ZmLWJ5OiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+ClJldmlld2Vk
LWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpMaW5r
OiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAyMDA1MDQw
NzU4MjguMjAzNDgtMS1pbXJlLmRlYWtAaW50ZWwuY29tCihjaGVycnkgcGlja2VkIGZyb20gY29t
bWl0IDA1NDMxOGM3ZTM1ZjFkN2QwNmIyMTYxNDNmZmY1ZjMyNDA1MDQ3ZWUpClNpZ25lZC1vZmYt
Ynk6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTog
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2lycS5jIHwgMTYgKysrLS0tLS0tLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9pcnEuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5
MTVfaXJxLmMKaW5kZXggYzZmMDJiMGI2YzdhLi41MjgyNWFlODMwMWIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
aTkxNV9pcnEuYwpAQCAtMzMyNCw3ICszMzI0LDcgQEAgc3RhdGljIHZvaWQgZ2VuOF9kZV9pcnFf
cG9zdGluc3RhbGwoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2KQogCXUzMiBkZV9w
aXBlX21hc2tlZCA9IGdlbjhfZGVfcGlwZV9mYXVsdF9tYXNrKGRldl9wcml2KSB8CiAJCUdFTjhf
UElQRV9DRENMS19DUkNfRE9ORTsKIAl1MzIgZGVfcGlwZV9lbmFibGVzOwotCXUzMiBkZV9wb3J0
X21hc2tlZCA9IEdFTjhfQVVYX0NIQU5ORUxfQTsKKwl1MzIgZGVfcG9ydF9tYXNrZWQgPSBnZW44
X2RlX3BvcnRfYXV4X21hc2soZGV2X3ByaXYpOwogCXUzMiBkZV9wb3J0X2VuYWJsZXM7CiAJdTMy
IGRlX21pc2NfbWFza2VkID0gR0VOOF9ERV9FRFBfUFNSOwogCWVudW0gcGlwZSBwaXBlOwpAQCAt
MzMzMiwxOCArMzMzMiw4IEBAIHN0YXRpYyB2b2lkIGdlbjhfZGVfaXJxX3Bvc3RpbnN0YWxsKHN0
cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKIAlpZiAoSU5URUxfR0VOKGRldl9wcml2
KSA8PSAxMCkKIAkJZGVfbWlzY19tYXNrZWQgfD0gR0VOOF9ERV9NSVNDX0dTRTsKIAotCWlmIChJ
TlRFTF9HRU4oZGV2X3ByaXYpID49IDkpIHsKLQkJZGVfcG9ydF9tYXNrZWQgfD0gR0VOOV9BVVhf
Q0hBTk5FTF9CIHwgR0VOOV9BVVhfQ0hBTk5FTF9DIHwKLQkJCQkgIEdFTjlfQVVYX0NIQU5ORUxf
RDsKLQkJaWYgKElTX0dFTjlfTFAoZGV2X3ByaXYpKQotCQkJZGVfcG9ydF9tYXNrZWQgfD0gQlhU
X0RFX1BPUlRfR01CVVM7Ci0JfQotCi0JaWYgKElOVEVMX0dFTihkZXZfcHJpdikgPj0gMTEpCi0J
CWRlX3BvcnRfbWFza2VkIHw9IElDTF9BVVhfQ0hBTk5FTF9FOwotCi0JaWYgKElTX0NOTF9XSVRI
X1BPUlRfRihkZXZfcHJpdikgfHwgSU5URUxfR0VOKGRldl9wcml2KSA+PSAxMSkKLQkJZGVfcG9y
dF9tYXNrZWQgfD0gQ05MX0FVWF9DSEFOTkVMX0Y7CisJaWYgKElTX0dFTjlfTFAoZGV2X3ByaXYp
KQorCQlkZV9wb3J0X21hc2tlZCB8PSBCWFRfREVfUE9SVF9HTUJVUzsKIAogCWRlX3BpcGVfZW5h
YmxlcyA9IGRlX3BpcGVfbWFza2VkIHwgR0VOOF9QSVBFX1ZCTEFOSyB8CiAJCQkJCSAgIEdFTjhf
UElQRV9GSUZPX1VOREVSUlVOOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK

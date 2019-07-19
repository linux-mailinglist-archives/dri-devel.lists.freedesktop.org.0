Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB1D6DB3E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:08:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5520F6E530;
	Fri, 19 Jul 2019 04:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11B476E52A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 04:08:09 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3BA692082E;
 Fri, 19 Jul 2019 04:08:08 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 015/101] drm/edid: Fix a missing-check bug in
 drm_load_edid_firmware()
Date: Fri, 19 Jul 2019 00:06:06 -0400
Message-Id: <20190719040732.17285-15-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040732.17285-1-sashal@kernel.org>
References: <20190719040732.17285-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509288;
 bh=09mf2kJdR2PiDv+6yW7BPKH28yF7qDFI6ijYWPiWF0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZIEWxXf1Ldfq106hbTpNJ3bIDG/5bnBLoHdQDnZezbkgWYLFba5+ryrBqTnuC24Q2
 5Bywb91WF+0NMFELftZg/HTbDL7j68l5AEf514zJw6cOhvLJjvwDR3DqSp0e/Ok194
 sV6slnhikDwBkskdxIL/1or9z8p3Tm7I1sxITQDU=
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
Cc: Jani Nikula <jani.nikula@intel.com>, Sasha Levin <sashal@kernel.org>,
 Gen Zhang <blackgod016574@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR2VuIFpoYW5nIDxibGFja2dvZDAxNjU3NEBnbWFpbC5jb20+CgpbIFVwc3RyZWFtIGNv
bW1pdCA5ZjFmMWEyZGFiMzhkNGNlODdhMTM1NjVjZjRkYzFiNzNiZWYzYTVmIF0KCkluIGRybV9s
b2FkX2VkaWRfZmlybXdhcmUoKSwgZndzdHIgaXMgYWxsb2NhdGVkIGJ5IGtzdHJkdXAoKS4gQW5k
IGZ3c3RyCmlzIGRlcmVmZXJlbmNlZCBpbiB0aGUgZm9sbG93aW5nIGNvZGVzLiBIb3dldmVyLCBt
ZW1vcnkgYWxsb2NhdGlvbgpmdW5jdGlvbnMgc3VjaCBhcyBrc3RyZHVwKCkgbWF5IGZhaWwgYW5k
IHJldHVybnMgTlVMTC4gRGVyZWZlcmVuY2luZwp0aGlzIG51bGwgcG9pbnRlciBtYXkgY2F1c2Ug
dGhlIGtlcm5lbCBnbyB3cm9uZy4gVGh1cyB3ZSBzaG91bGQgY2hlY2sKdGhpcyBrc3RyZHVwKCkg
b3BlcmF0aW9uLgpGdXJ0aGVyLCBpZiBrc3RyZHVwKCkgcmV0dXJucyBOVUxMLCB3ZSBzaG91bGQg
cmV0dXJuIEVSUl9QVFIoLUVOT01FTSkgdG8KdGhlIGNhbGxlciBzaXRlLgoKU2lnbmVkLW9mZi1i
eTogR2VuIFpoYW5nIDxibGFja2dvZDAxNjU3NEBnbWFpbC5jb20+ClJldmlld2VkLWJ5OiBKYW5p
IE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3Vs
YSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTA1MjQwMjMyMjIuR0E1MzAyQHpoYW5nZ2VuLVVYNDMw
VVEKU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZWRpZF9sb2FkLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkX2xvYWQu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZF9sb2FkLmMKaW5kZXggYTQ5MTUwOTlhYWE5Li5h
MGUxMDdhYmM0MGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZF9sb2FkLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkX2xvYWQuYwpAQCAtMjkwLDYgKzI5MCw4IEBA
IHN0cnVjdCBlZGlkICpkcm1fbG9hZF9lZGlkX2Zpcm13YXJlKHN0cnVjdCBkcm1fY29ubmVjdG9y
ICpjb25uZWN0b3IpCiAJICogdGhlIGxhc3Qgb25lIGZvdW5kIG9uZSBhcyBhIGZhbGxiYWNrLgog
CSAqLwogCWZ3c3RyID0ga3N0cmR1cChlZGlkX2Zpcm13YXJlLCBHRlBfS0VSTkVMKTsKKwlpZiAo
IWZ3c3RyKQorCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKIAllZGlkc3RyID0gZndzdHI7CiAK
IAl3aGlsZSAoKGVkaWRuYW1lID0gc3Ryc2VwKCZlZGlkc3RyLCAiLCIpKSkgewotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=

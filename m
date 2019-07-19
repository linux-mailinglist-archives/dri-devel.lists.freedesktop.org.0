Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5C36DC24
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 574876E56A;
	Fri, 19 Jul 2019 04:14:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 504326E56A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2019 04:14:34 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 847EC2189E;
 Fri, 19 Jul 2019 04:14:33 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 06/35] drm/edid: Fix a missing-check bug in
 drm_load_edid_firmware()
Date: Fri, 19 Jul 2019 00:13:54 -0400
Message-Id: <20190719041423.19322-6-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719041423.19322-1-sashal@kernel.org>
References: <20190719041423.19322-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509674;
 bh=naRzSXOMxwow96QrKs/l+61O5zHaltgJdKK2olHoEuc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0CoshZFwlIlvZ2KRb04R37jroXLYJJuedQNrga5InNu8b5eBkP+b+s9xQStSiTMiQ
 L5q//X4uhL8DzqQpSujuXUf84l6WXGUzHMU/OWDtQ3jpO0St4NREKPOXmXMgK1wvwe
 ThFEGCS1GatZ5WGdrULDKsr+IYT+RoYgXgGbTdsU=
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
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZF9sb2FkLmMKaW5kZXggNjk4YjhjM2IwOWQ5Li5i
NWY1ODI0NjY2MDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZF9sb2FkLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkX2xvYWQuYwpAQCAtMjgwLDYgKzI4MCw4IEBA
IGludCBkcm1fbG9hZF9lZGlkX2Zpcm13YXJlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IpCiAJICogdGhlIGxhc3Qgb25lIGZvdW5kIG9uZSBhcyBhIGZhbGxiYWNrLgogCSAqLwogCWZ3
c3RyID0ga3N0cmR1cChlZGlkX2Zpcm13YXJlLCBHRlBfS0VSTkVMKTsKKwlpZiAoIWZ3c3RyKQor
CQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKIAllZGlkc3RyID0gZndzdHI7CiAKIAl3aGlsZSAo
KGVkaWRuYW1lID0gc3Ryc2VwKCZlZGlkc3RyLCAiLCIpKSkgewotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
